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
    GenerativeAISettings? generativeAISettings,
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
      if (generativeAISettings != null)
        'generativeAISettings': generativeAISettings,
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

  /// Action to create a replication of the source bot in the secondary region.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The request for the unique bot ID of the source bot to be replicated in
  /// the secondary region.
  ///
  /// Parameter [replicaRegion] :
  /// The request for the secondary region that will be used in the replication
  /// of the source bot.
  Future<CreateBotReplicaResponse> createBotReplica({
    required String botId,
    required String replicaRegion,
  }) async {
    final $payload = <String, dynamic>{
      'replicaRegion': replicaRegion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/replicas/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBotReplicaResponse.fromJson(response);
  }

  /// Creates an immutable version of the bot. When you create the first version
  /// of a bot, Amazon Lex sets the version number to 1. Subsequent bot versions
  /// increase in an increment of 1. The version number will always represent
  /// the total number of versions created of the bot, not the current number of
  /// versions. If a bot version is deleted, that bot version number will not be
  /// reused.
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
  /// The version of the bot associated with this intent.
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
  /// Parameter [qnAIntentConfiguration] :
  /// Specifies the configuration of the built-in <code>Amazon.QnAIntent</code>.
  /// The <code>AMAZON.QnAIntent</code> intent is called when Amazon Lex can't
  /// determine another intent to invoke. If you specify this field, you can't
  /// specify the <code>kendraConfiguration</code> field.
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
    QnAIntentConfiguration? qnAIntentConfiguration,
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
      if (qnAIntentConfiguration != null)
        'qnAIntentConfiguration': qnAIntentConfiguration,
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
  /// An IAM principal, such as an IAM user, IAM role, or Amazon Web Services
  /// services that is allowed or denied access to a resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html">Amazon
  /// Web Services JSON policy elements: Principal</a>.
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
  /// Multi-value slots are only available in the <code>en-US</code> locale. If
  /// you set this value to <code>true</code> in any other locale, Amazon Lex
  /// throws a <code>ValidationException</code>.
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
  /// The name for the slot. A slot type name must be unique within the intent.
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
  /// <code>ORIGINAL_VALUE</code> - Returns the value entered by the user, if
  /// the user value is similar to the slot value.
  /// </li>
  /// <li>
  /// <code>TOP_RESOLUTION</code> - If there is a resolution list for the slot,
  /// return the first value in the resolution list. If there is no resolution
  /// list, return null.
  /// </li>
  /// </ul>
  /// If you don't specify the <code>valueSelectionSetting</code> parameter, the
  /// default is <code>ORIGINAL_VALUE</code>.
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

  /// Create a report that describes the differences between the bot and the
  /// test set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [target] :
  /// The target bot for the test set discrepancy report.
  ///
  /// Parameter [testSetId] :
  /// The test set Id for the test set discrepancy report.
  Future<CreateTestSetDiscrepancyReportResponse>
      createTestSetDiscrepancyReport({
    required TestSetDiscrepancyReportResourceTarget target,
    required String testSetId,
  }) async {
    final $payload = <String, dynamic>{
      'target': target,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/testsets/${Uri.encodeComponent(testSetId)}/testsetdiscrepancy',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTestSetDiscrepancyReportResponse.fromJson(response);
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

  /// The action to delete the replicated bot in the secondary region.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique ID of the replicated bot to be deleted from the secondary
  /// region
  ///
  /// Parameter [replicaRegion] :
  /// The secondary region of the replicated bot that will be deleted.
  Future<DeleteBotReplicaResponse> deleteBotReplica({
    required String botId,
    required String replicaRegion,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/replicas/${Uri.encodeComponent(replicaRegion)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBotReplicaResponse.fromJson(response);
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

  /// The action to delete the selected test set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testSetId] :
  /// The test set Id of the test set to be deleted.
  Future<void> deleteTestSet({
    required String testSetId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/testsets/${Uri.encodeComponent(testSetId)}',
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
  /// The version of the bot associated with the locale.
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

  /// Monitors the bot replication status through the UI console.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The request for the unique bot ID of the replicated bot being monitored.
  ///
  /// Parameter [replicaRegion] :
  /// The request for the region of the replicated bot being monitored.
  Future<DescribeBotReplicaResponse> describeBotReplica({
    required String botId,
    required String replicaRegion,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/replicas/${Uri.encodeComponent(replicaRegion)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBotReplicaResponse.fromJson(response);
  }

  /// Returns information about a request to generate a bot through natural
  /// language description, made through the <code>StartBotResource</code> API.
  /// Use the <code>generatedBotLocaleUrl</code> to retrieve the Amazon S3
  /// object containing the bot locale configuration. You can then modify and
  /// import this configuration.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot for which to return the generation
  /// details.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot for which to return the generation details.
  ///
  /// Parameter [generationId] :
  /// The unique identifier of the generation request for which to return the
  /// generation details.
  ///
  /// Parameter [localeId] :
  /// The locale of the bot for which to return the generation details.
  Future<DescribeBotResourceGenerationResponse> describeBotResourceGeneration({
    required String botId,
    required String botVersion,
    required String generationId,
    required String localeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/generations/${Uri.encodeComponent(generationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBotResourceGenerationResponse.fromJson(response);
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

  /// Gets metadata information about the test execution.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testExecutionId] :
  /// The execution Id of the test set execution.
  Future<DescribeTestExecutionResponse> describeTestExecution({
    required String testExecutionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/testexecutions/${Uri.encodeComponent(testExecutionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTestExecutionResponse.fromJson(response);
  }

  /// Gets metadata information about the test set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testSetId] :
  /// The test set Id for the test set request.
  Future<DescribeTestSetResponse> describeTestSet({
    required String testSetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/testsets/${Uri.encodeComponent(testSetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTestSetResponse.fromJson(response);
  }

  /// Gets metadata information about the test set discrepancy report.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testSetDiscrepancyReportId] :
  /// The unique identifier of the test set discrepancy report.
  Future<DescribeTestSetDiscrepancyReportResponse>
      describeTestSetDiscrepancyReport({
    required String testSetDiscrepancyReportId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/testsetdiscrepancy/${Uri.encodeComponent(testSetDiscrepancyReportId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTestSetDiscrepancyReportResponse.fromJson(response);
  }

  /// Gets metadata information about the test set generation.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testSetGenerationId] :
  /// The unique identifier of the test set generation.
  Future<DescribeTestSetGenerationResponse> describeTestSetGeneration({
    required String testSetGenerationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/testsetgenerations/${Uri.encodeComponent(testSetGenerationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTestSetGenerationResponse.fromJson(response);
  }

  /// Generates sample utterances for an intent.
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
  /// The bot unique Id for the bot request to generate utterances.
  ///
  /// Parameter [botVersion] :
  /// The bot version for the bot request to generate utterances.
  ///
  /// Parameter [intentId] :
  /// The intent unique Id for the bot request to generate utterances.
  ///
  /// Parameter [localeId] :
  /// The unique locale Id for the bot request to generate utterances.
  Future<GenerateBotElementResponse> generateBotElement({
    required String botId,
    required String botVersion,
    required String intentId,
    required String localeId,
  }) async {
    final $payload = <String, dynamic>{
      'intentId': intentId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/generate',
      exceptionFnMap: _exceptionFns,
    );
    return GenerateBotElementResponse.fromJson(response);
  }

  /// The pre-signed Amazon S3 URL to download the test execution result
  /// artifacts.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testExecutionId] :
  /// The unique identifier of the completed test execution.
  Future<GetTestExecutionArtifactsUrlResponse> getTestExecutionArtifactsUrl({
    required String testExecutionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/testexecutions/${Uri.encodeComponent(testExecutionId)}/artifacturl',
      exceptionFnMap: _exceptionFns,
    );
    return GetTestExecutionArtifactsUrlResponse.fromJson(response);
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

  /// The action to list the replicated bots created from the source bot alias.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The request for the unique bot ID of the replicated bot created from the
  /// source bot alias.
  ///
  /// Parameter [replicaRegion] :
  /// The request for the secondary region of the replicated bot created from
  /// the source bot alias.
  ///
  /// Parameter [maxResults] :
  /// The request for maximum results to list the replicated bots created from
  /// the source bot alias.
  ///
  /// Parameter [nextToken] :
  /// The request for the next token for the replicated bot created from the
  /// source bot alias.
  Future<ListBotAliasReplicasResponse> listBotAliasReplicas({
    required String botId,
    required String replicaRegion,
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
          '/bots/${Uri.encodeComponent(botId)}/replicas/${Uri.encodeComponent(replicaRegion)}/botaliases/',
      exceptionFnMap: _exceptionFns,
    );
    return ListBotAliasReplicasResponse.fromJson(response);
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

  /// The action to list the replicated bots.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The request for the unique bot IDs in the list of replicated bots.
  Future<ListBotReplicasResponse> listBotReplicas({
    required String botId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/replicas/',
      exceptionFnMap: _exceptionFns,
    );
    return ListBotReplicasResponse.fromJson(response);
  }

  /// Lists the generation requests made for a bot locale.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot whose generation requests you want to
  /// view.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot whose generation requests you want to view.
  ///
  /// Parameter [localeId] :
  /// The locale of the bot whose generation requests you want to view.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the number specified in the
  /// <code>maxResults</code>, the response returns a token in the
  /// <code>nextToken</code> field. Use this token when making a request to
  /// return the next batch of results.
  ///
  /// Parameter [sortBy] :
  /// An object containing information about the attribute and the method by
  /// which to sort the results
  Future<ListBotResourceGenerationsResponse> listBotResourceGenerations({
    required String botId,
    required String botVersion,
    required String localeId,
    int? maxResults,
    String? nextToken,
    GenerationSortBy? sortBy,
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
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/generations',
      exceptionFnMap: _exceptionFns,
    );
    return ListBotResourceGenerationsResponse.fromJson(response);
  }

  /// Contains information about all the versions replication statuses
  /// applicable for Global Resiliency.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The request for the unique ID in the list of replicated bots.
  ///
  /// Parameter [replicaRegion] :
  /// The request for the region used in the list of replicated bots.
  ///
  /// Parameter [maxResults] :
  /// The maximum results given in the list of replicated bots.
  ///
  /// Parameter [nextToken] :
  /// The next token given in the list of replicated bots.
  ///
  /// Parameter [sortBy] :
  /// The requested sort category for the list of replicated bots.
  Future<ListBotVersionReplicasResponse> listBotVersionReplicas({
    required String botId,
    required String replicaRegion,
    int? maxResults,
    String? nextToken,
    BotVersionReplicaSortBy? sortBy,
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
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/replicas/${Uri.encodeComponent(replicaRegion)}/botversions/',
      exceptionFnMap: _exceptionFns,
    );
    return ListBotVersionReplicasResponse.fromJson(response);
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

  /// Retrieves summary metrics for the intents in your bot. The following
  /// fields are required:
  ///
  /// <ul>
  /// <li>
  /// <code>metrics</code> – A list of <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_AnalyticsIntentMetric.html">AnalyticsIntentMetric</a>
  /// objects. In each object, use the <code>name</code> field to specify the
  /// metric to calculate, the <code>statistic</code> field to specify whether
  /// to calculate the <code>Sum</code>, <code>Average</code>, or
  /// <code>Max</code> number, and the <code>order</code> field to specify
  /// whether to sort the results in <code>Ascending</code> or
  /// <code>Descending</code> order.
  /// </li>
  /// <li>
  /// <code>startDateTime</code> and <code>endDateTime</code> – Define a time
  /// range for which you want to retrieve results.
  /// </li>
  /// </ul>
  /// Of the optional fields, you can organize the results in the following
  /// ways:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>filters</code> field to filter the results, the
  /// <code>groupBy</code> field to specify categories by which to group the
  /// results, and the <code>binBy</code> field to specify time intervals by
  /// which to group the results.
  /// </li>
  /// <li>
  /// Use the <code>maxResults</code> field to limit the number of results to
  /// return in a single response and the <code>nextToken</code> field to return
  /// the next batch of results if the response does not return the full set of
  /// results.
  /// </li>
  /// </ul>
  /// Note that an <code>order</code> field exists in both <code>binBy</code>
  /// and <code>metrics</code>. You can specify only one <code>order</code> in a
  /// given request.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier for the bot for which you want to retrieve intent metrics.
  ///
  /// Parameter [endDateTime] :
  /// The date and time that marks the end of the range of time for which you
  /// want to see intent metrics.
  ///
  /// Parameter [metrics] :
  /// A list of objects, each of which contains a metric you want to list, the
  /// statistic for the metric you want to return, and the order by which to
  /// organize the results.
  ///
  /// Parameter [startDateTime] :
  /// The timestamp that marks the beginning of the range of time for which you
  /// want to see intent metrics.
  ///
  /// Parameter [binBy] :
  /// A list of objects, each of which contains specifications for organizing
  /// the results by time.
  ///
  /// Parameter [filters] :
  /// A list of objects, each of which describes a condition by which you want
  /// to filter the results.
  ///
  /// Parameter [groupBy] :
  /// A list of objects, each of which specifies how to group the results. You
  /// can group by the following criteria:
  ///
  /// <ul>
  /// <li>
  /// <code>IntentName</code> – The name of the intent.
  /// </li>
  /// <li>
  /// <code>IntentEndState</code> – The final state of the intent. The possible
  /// end states are detailed in <a
  /// href="https://docs.aws.amazon.com/analytics-key-definitions-intents">Key
  /// definitions</a> in the user guide.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page of results. If there
  /// are fewer results than the maximum page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the ListIntentMetrics operation contains more results
  /// than specified in the maxResults parameter, a token is returned in the
  /// response.
  ///
  /// Use the returned token in the nextToken parameter of a ListIntentMetrics
  /// request to return the next page of results. For a complete set of results,
  /// call the ListIntentMetrics operation until the nextToken returned in the
  /// response is null.
  Future<ListIntentMetricsResponse> listIntentMetrics({
    required String botId,
    required DateTime endDateTime,
    required List<AnalyticsIntentMetric> metrics,
    required DateTime startDateTime,
    List<AnalyticsBinBySpecification>? binBy,
    List<AnalyticsIntentFilter>? filters,
    List<AnalyticsIntentGroupBySpecification>? groupBy,
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
      'endDateTime': unixTimestampToJson(endDateTime),
      'metrics': metrics,
      'startDateTime': unixTimestampToJson(startDateTime),
      if (binBy != null) 'binBy': binBy,
      if (filters != null) 'filters': filters,
      if (groupBy != null) 'groupBy': groupBy,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/analytics/intentmetrics',
      exceptionFnMap: _exceptionFns,
    );
    return ListIntentMetricsResponse.fromJson(response);
  }

  /// Retrieves summary statistics for a path of intents that users take over
  /// sessions with your bot. The following fields are required:
  ///
  /// <ul>
  /// <li>
  /// <code>startDateTime</code> and <code>endDateTime</code> – Define a time
  /// range for which you want to retrieve results.
  /// </li>
  /// <li>
  /// <code>intentPath</code> – Define an order of intents for which you want to
  /// retrieve metrics. Separate intents in the path with a forward slash. For
  /// example, populate the <code>intentPath</code> field with
  /// <code>/BookCar/BookHotel</code> to see details about how many times users
  /// invoked the <code>BookCar</code> and <code>BookHotel</code> intents in
  /// that order.
  /// </li>
  /// </ul>
  /// Use the optional <code>filters</code> field to filter the results.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier for the bot for which you want to retrieve intent path
  /// metrics.
  ///
  /// Parameter [endDateTime] :
  /// The date and time that marks the end of the range of time for which you
  /// want to see intent path metrics.
  ///
  /// Parameter [intentPath] :
  /// The intent path for which you want to retrieve metrics. Use a forward
  /// slash to separate intents in the path. For example:
  ///
  /// <ul>
  /// <li>
  /// /BookCar
  /// </li>
  /// <li>
  /// /BookCar/BookHotel
  /// </li>
  /// <li>
  /// /BookHotel/BookCar
  /// </li>
  /// </ul>
  ///
  /// Parameter [startDateTime] :
  /// The date and time that marks the beginning of the range of time for which
  /// you want to see intent path metrics.
  ///
  /// Parameter [filters] :
  /// A list of objects, each describes a condition by which you want to filter
  /// the results.
  Future<ListIntentPathsResponse> listIntentPaths({
    required String botId,
    required DateTime endDateTime,
    required String intentPath,
    required DateTime startDateTime,
    List<AnalyticsPathFilter>? filters,
  }) async {
    final $payload = <String, dynamic>{
      'endDateTime': unixTimestampToJson(endDateTime),
      'intentPath': intentPath,
      'startDateTime': unixTimestampToJson(startDateTime),
      if (filters != null) 'filters': filters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/analytics/intentpaths',
      exceptionFnMap: _exceptionFns,
    );
    return ListIntentPathsResponse.fromJson(response);
  }

  /// Retrieves summary metrics for the stages within intents in your bot. The
  /// following fields are required:
  ///
  /// <ul>
  /// <li>
  /// <code>metrics</code> – A list of <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_AnalyticsIntentStageMetric.html">AnalyticsIntentStageMetric</a>
  /// objects. In each object, use the <code>name</code> field to specify the
  /// metric to calculate, the <code>statistic</code> field to specify whether
  /// to calculate the <code>Sum</code>, <code>Average</code>, or
  /// <code>Max</code> number, and the <code>order</code> field to specify
  /// whether to sort the results in <code>Ascending</code> or
  /// <code>Descending</code> order.
  /// </li>
  /// <li>
  /// <code>startDateTime</code> and <code>endDateTime</code> – Define a time
  /// range for which you want to retrieve results.
  /// </li>
  /// </ul>
  /// Of the optional fields, you can organize the results in the following
  /// ways:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>filters</code> field to filter the results, the
  /// <code>groupBy</code> field to specify categories by which to group the
  /// results, and the <code>binBy</code> field to specify time intervals by
  /// which to group the results.
  /// </li>
  /// <li>
  /// Use the <code>maxResults</code> field to limit the number of results to
  /// return in a single response and the <code>nextToken</code> field to return
  /// the next batch of results if the response does not return the full set of
  /// results.
  /// </li>
  /// </ul>
  /// Note that an <code>order</code> field exists in both <code>binBy</code>
  /// and <code>metrics</code>. You can only specify one <code>order</code> in a
  /// given request.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier for the bot for which you want to retrieve intent stage
  /// metrics.
  ///
  /// Parameter [endDateTime] :
  /// The date and time that marks the end of the range of time for which you
  /// want to see intent stage metrics.
  ///
  /// Parameter [metrics] :
  /// A list of objects, each of which contains a metric you want to list, the
  /// statistic for the metric you want to return, and the method by which to
  /// organize the results.
  ///
  /// Parameter [startDateTime] :
  /// The date and time that marks the beginning of the range of time for which
  /// you want to see intent stage metrics.
  ///
  /// Parameter [binBy] :
  /// A list of objects, each of which contains specifications for organizing
  /// the results by time.
  ///
  /// Parameter [filters] :
  /// A list of objects, each of which describes a condition by which you want
  /// to filter the results.
  ///
  /// Parameter [groupBy] :
  /// A list of objects, each of which specifies how to group the results. You
  /// can group by the following criteria:
  ///
  /// <ul>
  /// <li>
  /// <code>IntentStageName</code> – The name of the intent stage.
  /// </li>
  /// <li>
  /// <code>SwitchedToIntent</code> – The intent to which the conversation was
  /// switched (if any).
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page of results. If there
  /// are fewer results than the maximum page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the ListIntentStageMetrics operation contains more
  /// results than specified in the maxResults parameter, a token is returned in
  /// the response.
  ///
  /// Use the returned token in the nextToken parameter of a
  /// ListIntentStageMetrics request to return the next page of results. For a
  /// complete set of results, call the ListIntentStageMetrics operation until
  /// the nextToken returned in the response is null.
  Future<ListIntentStageMetricsResponse> listIntentStageMetrics({
    required String botId,
    required DateTime endDateTime,
    required List<AnalyticsIntentStageMetric> metrics,
    required DateTime startDateTime,
    List<AnalyticsBinBySpecification>? binBy,
    List<AnalyticsIntentStageFilter>? filters,
    List<AnalyticsIntentStageGroupBySpecification>? groupBy,
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
      'endDateTime': unixTimestampToJson(endDateTime),
      'metrics': metrics,
      'startDateTime': unixTimestampToJson(startDateTime),
      if (binBy != null) 'binBy': binBy,
      if (filters != null) 'filters': filters,
      if (groupBy != null) 'groupBy': groupBy,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/analytics/intentstagemetrics',
      exceptionFnMap: _exceptionFns,
    );
    return ListIntentStageMetricsResponse.fromJson(response);
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

  /// Retrieves a list of metadata for individual user sessions with your bot.
  /// The <code>startDateTime</code> and <code>endDateTime</code> fields are
  /// required. These fields define a time range for which you want to retrieve
  /// results. Of the optional fields, you can organize the results in the
  /// following ways:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>filters</code> field to filter the results and the
  /// <code>sortBy</code> field to specify the values by which to sort the
  /// results.
  /// </li>
  /// <li>
  /// Use the <code>maxResults</code> field to limit the number of results to
  /// return in a single response and the <code>nextToken</code> field to return
  /// the next batch of results if the response does not return the full set of
  /// results.
  /// </li>
  /// </ul>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier for the bot for which you want to retrieve session
  /// analytics.
  ///
  /// Parameter [endDateTime] :
  /// The date and time that marks the end of the range of time for which you
  /// want to see session analytics.
  ///
  /// Parameter [startDateTime] :
  /// The date and time that marks the beginning of the range of time for which
  /// you want to see session analytics.
  ///
  /// Parameter [filters] :
  /// A list of objects, each of which describes a condition by which you want
  /// to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page of results. If there
  /// are fewer results than the maximum page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the ListSessionAnalyticsData operation contains more
  /// results than specified in the maxResults parameter, a token is returned in
  /// the response.
  ///
  /// Use the returned token in the nextToken parameter of a
  /// ListSessionAnalyticsData request to return the next page of results. For a
  /// complete set of results, call the ListSessionAnalyticsData operation until
  /// the nextToken returned in the response is null.
  ///
  /// Parameter [sortBy] :
  /// An object specifying the measure and method by which to sort the session
  /// analytics data.
  Future<ListSessionAnalyticsDataResponse> listSessionAnalyticsData({
    required String botId,
    required DateTime endDateTime,
    required DateTime startDateTime,
    List<AnalyticsSessionFilter>? filters,
    int? maxResults,
    String? nextToken,
    SessionDataSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'endDateTime': unixTimestampToJson(endDateTime),
      'startDateTime': unixTimestampToJson(startDateTime),
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/analytics/sessions',
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionAnalyticsDataResponse.fromJson(response);
  }

  /// Retrieves summary metrics for the user sessions with your bot. The
  /// following fields are required:
  ///
  /// <ul>
  /// <li>
  /// <code>metrics</code> – A list of <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_AnalyticsSessionMetric.html">AnalyticsSessionMetric</a>
  /// objects. In each object, use the <code>name</code> field to specify the
  /// metric to calculate, the <code>statistic</code> field to specify whether
  /// to calculate the <code>Sum</code>, <code>Average</code>, or
  /// <code>Max</code> number, and the <code>order</code> field to specify
  /// whether to sort the results in <code>Ascending</code> or
  /// <code>Descending</code> order.
  /// </li>
  /// <li>
  /// <code>startDateTime</code> and <code>endDateTime</code> – Define a time
  /// range for which you want to retrieve results.
  /// </li>
  /// </ul>
  /// Of the optional fields, you can organize the results in the following
  /// ways:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>filters</code> field to filter the results, the
  /// <code>groupBy</code> field to specify categories by which to group the
  /// results, and the <code>binBy</code> field to specify time intervals by
  /// which to group the results.
  /// </li>
  /// <li>
  /// Use the <code>maxResults</code> field to limit the number of results to
  /// return in a single response and the <code>nextToken</code> field to return
  /// the next batch of results if the response does not return the full set of
  /// results.
  /// </li>
  /// </ul>
  /// Note that an <code>order</code> field exists in both <code>binBy</code>
  /// and <code>metrics</code>. Currently, you can specify it in either field,
  /// but not in both.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier for the bot for which you want to retrieve session metrics.
  ///
  /// Parameter [endDateTime] :
  /// The date and time that marks the end of the range of time for which you
  /// want to see session metrics.
  ///
  /// Parameter [metrics] :
  /// A list of objects, each of which contains a metric you want to list, the
  /// statistic for the metric you want to return, and the method by which to
  /// organize the results.
  ///
  /// Parameter [startDateTime] :
  /// The date and time that marks the beginning of the range of time for which
  /// you want to see session metrics.
  ///
  /// Parameter [binBy] :
  /// A list of objects, each of which contains specifications for organizing
  /// the results by time.
  ///
  /// Parameter [filters] :
  /// A list of objects, each of which describes a condition by which you want
  /// to filter the results.
  ///
  /// Parameter [groupBy] :
  /// A list of objects, each of which specifies how to group the results. You
  /// can group by the following criteria:
  ///
  /// <ul>
  /// <li>
  /// <code>ConversationEndState</code> – The final state of the conversation.
  /// The possible end states are detailed in <a
  /// href="https://docs.aws.amazon.com/analytics-key-definitions-conversations">Key
  /// definitions</a> in the user guide.
  /// </li>
  /// <li>
  /// <code>LocaleId</code> – The unique identifier of the bot locale.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page of results. If there
  /// are fewer results than the maximum page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the ListSessionMetrics operation contains more
  /// results than specified in the maxResults parameter, a token is returned in
  /// the response.
  ///
  /// Use the returned token in the nextToken parameter of a ListSessionMetrics
  /// request to return the next page of results. For a complete set of results,
  /// call the ListSessionMetrics operation until the nextToken returned in the
  /// response is null.
  Future<ListSessionMetricsResponse> listSessionMetrics({
    required String botId,
    required DateTime endDateTime,
    required List<AnalyticsSessionMetric> metrics,
    required DateTime startDateTime,
    List<AnalyticsBinBySpecification>? binBy,
    List<AnalyticsSessionFilter>? filters,
    List<AnalyticsSessionGroupBySpecification>? groupBy,
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
      'endDateTime': unixTimestampToJson(endDateTime),
      'metrics': metrics,
      'startDateTime': unixTimestampToJson(startDateTime),
      if (binBy != null) 'binBy': binBy,
      if (filters != null) 'filters': filters,
      if (groupBy != null) 'groupBy': groupBy,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/analytics/sessionmetrics',
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionMetricsResponse.fromJson(response);
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

  /// Gets a list of test execution result items.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resultFilterBy] :
  /// The filter for the list of results from the test set execution.
  ///
  /// Parameter [testExecutionId] :
  /// The unique identifier of the test execution to list the result items.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of test execution result items to return in each page.
  /// If there are fewer results than the max page size, only the actual number
  /// of results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the <code>ListTestExecutionResultItems</code>
  /// operation contains more results than specified in the
  /// <code>maxResults</code> parameter, a token is returned in the response.
  /// Use that token in the <code>nextToken</code> parameter to return the next
  /// page of results.
  Future<ListTestExecutionResultItemsResponse> listTestExecutionResultItems({
    required TestExecutionResultFilterBy resultFilterBy,
    required String testExecutionId,
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
      'resultFilterBy': resultFilterBy,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/testexecutions/${Uri.encodeComponent(testExecutionId)}/results',
      exceptionFnMap: _exceptionFns,
    );
    return ListTestExecutionResultItemsResponse.fromJson(response);
  }

  /// The list of test set executions.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of test executions to return in each page. If there are
  /// fewer results than the max page size, only the actual number of results
  /// are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the ListTestExecutions operation contains more
  /// results than specified in the maxResults parameter, a token is returned in
  /// the response. Use that token in the nextToken parameter to return the next
  /// page of results.
  ///
  /// Parameter [sortBy] :
  /// The sort order of the test set executions.
  Future<ListTestExecutionsResponse> listTestExecutions({
    int? maxResults,
    String? nextToken,
    TestExecutionSortBy? sortBy,
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
      requestUri: '/testexecutions',
      exceptionFnMap: _exceptionFns,
    );
    return ListTestExecutionsResponse.fromJson(response);
  }

  /// The list of test set records.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testSetId] :
  /// The identifier of the test set to list its test set records.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of test set records to return in each page. If there
  /// are fewer records than the max page size, only the actual number of
  /// records are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the ListTestSetRecords operation contains more
  /// results than specified in the maxResults parameter, a token is returned in
  /// the response. Use that token in the nextToken parameter to return the next
  /// page of results.
  Future<ListTestSetRecordsResponse> listTestSetRecords({
    required String testSetId,
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
      requestUri: '/testsets/${Uri.encodeComponent(testSetId)}/records',
      exceptionFnMap: _exceptionFns,
    );
    return ListTestSetRecordsResponse.fromJson(response);
  }

  /// The list of the test sets
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of test sets to return in each page. If there are fewer
  /// results than the max page size, only the actual number of results are
  /// returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the ListTestSets operation contains more results than
  /// specified in the maxResults parameter, a token is returned in the
  /// response. Use that token in the nextToken parameter to return the next
  /// page of results.
  ///
  /// Parameter [sortBy] :
  /// The sort order for the list of test sets.
  Future<ListTestSetsResponse> listTestSets({
    int? maxResults,
    String? nextToken,
    TestSetSortBy? sortBy,
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
      requestUri: '/testsets',
      exceptionFnMap: _exceptionFns,
    );
    return ListTestSetsResponse.fromJson(response);
  }

  /// <note>
  /// To use this API operation, your IAM role must have permissions to perform
  /// the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListAggregatedUtterances.html">ListAggregatedUtterances</a>
  /// operation, which provides access to utterance-related analytics. See <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/monitoring-utterances.html">Viewing
  /// utterance statistics</a> for the IAM policy to apply to the IAM role.
  /// </note>
  /// Retrieves a list of metadata for individual user utterances to your bot.
  /// The following fields are required:
  ///
  /// <ul>
  /// <li>
  /// <code>startDateTime</code> and <code>endDateTime</code> – Define a time
  /// range for which you want to retrieve results.
  /// </li>
  /// </ul>
  /// Of the optional fields, you can organize the results in the following
  /// ways:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>filters</code> field to filter the results and the
  /// <code>sortBy</code> field to specify the values by which to sort the
  /// results.
  /// </li>
  /// <li>
  /// Use the <code>maxResults</code> field to limit the number of results to
  /// return in a single response and the <code>nextToken</code> field to return
  /// the next batch of results if the response does not return the full set of
  /// results.
  /// </li>
  /// </ul>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier for the bot for which you want to retrieve utterance
  /// analytics.
  ///
  /// Parameter [endDateTime] :
  /// The date and time that marks the end of the range of time for which you
  /// want to see utterance analytics.
  ///
  /// Parameter [startDateTime] :
  /// The date and time that marks the beginning of the range of time for which
  /// you want to see utterance analytics.
  ///
  /// Parameter [filters] :
  /// A list of objects, each of which describes a condition by which you want
  /// to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page of results. If there
  /// are fewer results than the maximum page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the ListUtteranceAnalyticsData operation contains
  /// more results than specified in the maxResults parameter, a token is
  /// returned in the response.
  ///
  /// Use the returned token in the nextToken parameter of a
  /// ListUtteranceAnalyticsData request to return the next page of results. For
  /// a complete set of results, call the ListUtteranceAnalyticsData operation
  /// until the nextToken returned in the response is null.
  ///
  /// Parameter [sortBy] :
  /// An object specifying the measure and method by which to sort the utterance
  /// analytics data.
  Future<ListUtteranceAnalyticsDataResponse> listUtteranceAnalyticsData({
    required String botId,
    required DateTime endDateTime,
    required DateTime startDateTime,
    List<AnalyticsUtteranceFilter>? filters,
    int? maxResults,
    String? nextToken,
    UtteranceDataSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'endDateTime': unixTimestampToJson(endDateTime),
      'startDateTime': unixTimestampToJson(startDateTime),
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/bots/${Uri.encodeComponent(botId)}/analytics/utterances',
      exceptionFnMap: _exceptionFns,
    );
    return ListUtteranceAnalyticsDataResponse.fromJson(response);
  }

  /// <note>
  /// To use this API operation, your IAM role must have permissions to perform
  /// the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_ListAggregatedUtterances.html">ListAggregatedUtterances</a>
  /// operation, which provides access to utterance-related analytics. See <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/monitoring-utterances.html">Viewing
  /// utterance statistics</a> for the IAM policy to apply to the IAM role.
  /// </note>
  /// Retrieves summary metrics for the utterances in your bot. The following
  /// fields are required:
  ///
  /// <ul>
  /// <li>
  /// <code>metrics</code> – A list of <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_AnalyticsUtteranceMetric.html">AnalyticsUtteranceMetric</a>
  /// objects. In each object, use the <code>name</code> field to specify the
  /// metric to calculate, the <code>statistic</code> field to specify whether
  /// to calculate the <code>Sum</code>, <code>Average</code>, or
  /// <code>Max</code> number, and the <code>order</code> field to specify
  /// whether to sort the results in <code>Ascending</code> or
  /// <code>Descending</code> order.
  /// </li>
  /// <li>
  /// <code>startDateTime</code> and <code>endDateTime</code> – Define a time
  /// range for which you want to retrieve results.
  /// </li>
  /// </ul>
  /// Of the optional fields, you can organize the results in the following
  /// ways:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>filters</code> field to filter the results, the
  /// <code>groupBy</code> field to specify categories by which to group the
  /// results, and the <code>binBy</code> field to specify time intervals by
  /// which to group the results.
  /// </li>
  /// <li>
  /// Use the <code>maxResults</code> field to limit the number of results to
  /// return in a single response and the <code>nextToken</code> field to return
  /// the next batch of results if the response does not return the full set of
  /// results.
  /// </li>
  /// </ul>
  /// Note that an <code>order</code> field exists in both <code>binBy</code>
  /// and <code>metrics</code>. Currently, you can specify it in either field,
  /// but not in both.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The identifier for the bot for which you want to retrieve utterance
  /// metrics.
  ///
  /// Parameter [endDateTime] :
  /// The date and time that marks the end of the range of time for which you
  /// want to see utterance metrics.
  ///
  /// Parameter [metrics] :
  /// A list of objects, each of which contains a metric you want to list, the
  /// statistic for the metric you want to return, and the method by which to
  /// organize the results.
  ///
  /// Parameter [startDateTime] :
  /// The date and time that marks the beginning of the range of time for which
  /// you want to see utterance metrics.
  ///
  /// Parameter [attributes] :
  /// A list containing attributes related to the utterance that you want the
  /// response to return. The following attributes are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>LastUsedIntent</code> – The last used intent at the time of the
  /// utterance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [binBy] :
  /// A list of objects, each of which contains specifications for organizing
  /// the results by time.
  ///
  /// Parameter [filters] :
  /// A list of objects, each of which describes a condition by which you want
  /// to filter the results.
  ///
  /// Parameter [groupBy] :
  /// A list of objects, each of which specifies how to group the results. You
  /// can group by the following criteria:
  ///
  /// <ul>
  /// <li>
  /// <code>UtteranceText</code> – The transcription of the utterance.
  /// </li>
  /// <li>
  /// <code>UtteranceState</code> – The state of the utterance. The possible
  /// states are detailed in <a
  /// href="https://docs.aws.amazon.com/analytics-key-definitions-utterances">Key
  /// definitions</a> in the user guide.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page of results. If there
  /// are fewer results than the maximum page size, only the actual number of
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// If the response from the ListUtteranceMetrics operation contains more
  /// results than specified in the maxResults parameter, a token is returned in
  /// the response.
  ///
  /// Use the returned token in the nextToken parameter of a
  /// ListUtteranceMetrics request to return the next page of results. For a
  /// complete set of results, call the ListUtteranceMetrics operation until the
  /// nextToken returned in the response is null.
  Future<ListUtteranceMetricsResponse> listUtteranceMetrics({
    required String botId,
    required DateTime endDateTime,
    required List<AnalyticsUtteranceMetric> metrics,
    required DateTime startDateTime,
    List<AnalyticsUtteranceAttribute>? attributes,
    List<AnalyticsBinBySpecification>? binBy,
    List<AnalyticsUtteranceFilter>? filters,
    List<AnalyticsUtteranceGroupBySpecification>? groupBy,
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
      'endDateTime': unixTimestampToJson(endDateTime),
      'metrics': metrics,
      'startDateTime': unixTimestampToJson(startDateTime),
      if (attributes != null) 'attributes': attributes,
      if (binBy != null) 'binBy': binBy,
      if (filters != null) 'filters': filters,
      if (groupBy != null) 'groupBy': groupBy,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/analytics/utterancemetrics',
      exceptionFnMap: _exceptionFns,
    );
    return ListUtteranceMetricsResponse.fromJson(response);
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

  /// Starts a request for the descriptive bot builder to generate a bot locale
  /// configuration based on the prompt you provide it. After you make this
  /// call, use the <code>DescribeBotResourceGeneration</code> operation to
  /// check on the status of the generation and for the
  /// <code>generatedBotLocaleUrl</code> when the generation is complete. Use
  /// that value to retrieve the Amazon S3 object containing the bot locale
  /// configuration. You can then modify and import this configuration.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot for which to generate intents and slot
  /// types.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot for which to generate intents and slot types.
  ///
  /// Parameter [generationInputPrompt] :
  /// The prompt to generate intents and slot types for the bot locale. Your
  /// description should be both <i>detailed</i> and <i>precise</i> to help
  /// generate appropriate and sufficient intents for your bot. Include a list
  /// of actions to improve the intent creation process.
  ///
  /// Parameter [localeId] :
  /// The locale of the bot for which to generate intents and slot types.
  Future<StartBotResourceGenerationResponse> startBotResourceGeneration({
    required String botId,
    required String botVersion,
    required String generationInputPrompt,
    required String localeId,
  }) async {
    final $payload = <String, dynamic>{
      'generationInputPrompt': generationInputPrompt,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botversions/${Uri.encodeComponent(botVersion)}/botlocales/${Uri.encodeComponent(localeId)}/startgeneration',
      exceptionFnMap: _exceptionFns,
    );
    return StartBotResourceGenerationResponse.fromJson(response);
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

  /// The action to start test set execution.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [apiMode] :
  /// Indicates whether we use streaming or non-streaming APIs for the test set
  /// execution. For streaming, StartConversation Runtime API is used. Whereas,
  /// for non-streaming, RecognizeUtterance and RecognizeText Amazon Lex Runtime
  /// API are used.
  ///
  /// Parameter [target] :
  /// The target bot for the test set execution.
  ///
  /// Parameter [testSetId] :
  /// The test set Id for the test set execution.
  ///
  /// Parameter [testExecutionModality] :
  /// Indicates whether audio or text is used.
  Future<StartTestExecutionResponse> startTestExecution({
    required TestExecutionApiMode apiMode,
    required TestExecutionTarget target,
    required String testSetId,
    TestExecutionModality? testExecutionModality,
  }) async {
    final $payload = <String, dynamic>{
      'apiMode': apiMode.toValue(),
      'target': target,
      if (testExecutionModality != null)
        'testExecutionModality': testExecutionModality.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/testsets/${Uri.encodeComponent(testSetId)}/testexecutions',
      exceptionFnMap: _exceptionFns,
    );
    return StartTestExecutionResponse.fromJson(response);
  }

  /// The action to start the generation of test set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [generationDataSource] :
  /// The data source for the test set generation.
  ///
  /// Parameter [roleArn] :
  /// The roleARN used for any operation in the test set to access resources in
  /// the Amazon Web Services account.
  ///
  /// Parameter [storageLocation] :
  /// The Amazon S3 storage location for the test set generation.
  ///
  /// Parameter [testSetName] :
  /// The test set name for the test set generation request.
  ///
  /// Parameter [description] :
  /// The test set description for the test set generation request.
  ///
  /// Parameter [testSetTags] :
  /// A list of tags to add to the test set. You can only add tags when you
  /// import/generate a new test set. You can't use the
  /// <code>UpdateTestSet</code> operation to update tags. To update tags, use
  /// the <code>TagResource</code> operation.
  Future<StartTestSetGenerationResponse> startTestSetGeneration({
    required TestSetGenerationDataSource generationDataSource,
    required String roleArn,
    required TestSetStorageLocation storageLocation,
    required String testSetName,
    String? description,
    Map<String, String>? testSetTags,
  }) async {
    final $payload = <String, dynamic>{
      'generationDataSource': generationDataSource,
      'roleArn': roleArn,
      'storageLocation': storageLocation,
      'testSetName': testSetName,
      if (description != null) 'description': description,
      if (testSetTags != null) 'testSetTags': testSetTags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/testsetgenerations',
      exceptionFnMap: _exceptionFns,
    );
    return StartTestSetGenerationResponse.fromJson(response);
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
  /// Parameter [generativeAISettings] :
  /// Contains settings for generative AI features powered by Amazon Bedrock for
  /// your bot locale. Use this object to turn generative AI features on and
  /// off. Pricing may differ if you turn a feature on. For more information,
  /// see LINK.
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
    GenerativeAISettings? generativeAISettings,
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
      if (generativeAISettings != null)
        'generativeAISettings': generativeAISettings,
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
  /// Configuration settings for a response sent to the user before Amazon Lex
  /// starts eliciting slots.
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
  /// Parameter [qnAIntentConfiguration] :
  /// Specifies the configuration of the built-in <code>Amazon.QnAIntent</code>.
  /// The <code>AMAZON.QnAIntent</code> intent is called when Amazon Lex can't
  /// determine another intent to invoke. If you specify this field, you can't
  /// specify the <code>kendraConfiguration</code> field.
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
    QnAIntentConfiguration? qnAIntentConfiguration,
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
      if (qnAIntentConfiguration != null)
        'qnAIntentConfiguration': qnAIntentConfiguration,
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

  /// The action to update the test set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [PreconditionFailedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testSetId] :
  /// The test set Id for which update test operation to be performed.
  ///
  /// Parameter [testSetName] :
  /// The new test set name.
  ///
  /// Parameter [description] :
  /// The new test set description.
  Future<UpdateTestSetResponse> updateTestSet({
    required String testSetId,
    required String testSetName,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'testSetName': testSetName,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/testsets/${Uri.encodeComponent(testSetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTestSetResponse.fromJson(response);
  }
}

/// The active context used in the test execution.
class ActiveContext {
  /// The name of active context.
  final String name;

  ActiveContext({
    required this.name,
  });

  factory ActiveContext.fromJson(Map<String, dynamic> json) {
    return ActiveContext(
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

/// The information about the agent turn in a test set execution.
class AgentTurnResult {
  /// The expected agent prompt for the agent turn in a test set execution.
  final String expectedAgentPrompt;

  /// The actual agent prompt for the agent turn in a test set execution.
  final String? actualAgentPrompt;

  /// The actual elicited slot for the agent turn in a test set execution.
  final String? actualElicitedSlot;

  /// The actual intent for the agent turn in a test set execution.
  final String? actualIntent;
  final ExecutionErrorDetails? errorDetails;

  AgentTurnResult({
    required this.expectedAgentPrompt,
    this.actualAgentPrompt,
    this.actualElicitedSlot,
    this.actualIntent,
    this.errorDetails,
  });

  factory AgentTurnResult.fromJson(Map<String, dynamic> json) {
    return AgentTurnResult(
      expectedAgentPrompt: json['expectedAgentPrompt'] as String,
      actualAgentPrompt: json['actualAgentPrompt'] as String?,
      actualElicitedSlot: json['actualElicitedSlot'] as String?,
      actualIntent: json['actualIntent'] as String?,
      errorDetails: json['errorDetails'] != null
          ? ExecutionErrorDetails.fromJson(
              json['errorDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final expectedAgentPrompt = this.expectedAgentPrompt;
    final actualAgentPrompt = this.actualAgentPrompt;
    final actualElicitedSlot = this.actualElicitedSlot;
    final actualIntent = this.actualIntent;
    final errorDetails = this.errorDetails;
    return {
      'expectedAgentPrompt': expectedAgentPrompt,
      if (actualAgentPrompt != null) 'actualAgentPrompt': actualAgentPrompt,
      if (actualElicitedSlot != null) 'actualElicitedSlot': actualElicitedSlot,
      if (actualIntent != null) 'actualIntent': actualIntent,
      if (errorDetails != null) 'errorDetails': errorDetails,
    };
  }
}

/// The specification of an agent turn.
class AgentTurnSpecification {
  /// The agent prompt for the agent turn in a test set.
  final String agentPrompt;

  AgentTurnSpecification({
    required this.agentPrompt,
  });

  factory AgentTurnSpecification.fromJson(Map<String, dynamic> json) {
    return AgentTurnSpecification(
      agentPrompt: json['agentPrompt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final agentPrompt = this.agentPrompt;
    return {
      'agentPrompt': agentPrompt,
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

enum AnalyticsBinByName {
  conversationStartTime,
  utteranceTimestamp,
}

extension AnalyticsBinByNameValueExtension on AnalyticsBinByName {
  String toValue() {
    switch (this) {
      case AnalyticsBinByName.conversationStartTime:
        return 'ConversationStartTime';
      case AnalyticsBinByName.utteranceTimestamp:
        return 'UtteranceTimestamp';
    }
  }
}

extension AnalyticsBinByNameFromString on String {
  AnalyticsBinByName toAnalyticsBinByName() {
    switch (this) {
      case 'ConversationStartTime':
        return AnalyticsBinByName.conversationStartTime;
      case 'UtteranceTimestamp':
        return AnalyticsBinByName.utteranceTimestamp;
    }
    throw Exception('$this is not known in enum AnalyticsBinByName');
  }
}

/// Contains the time metric, interval, and method by which to bin the analytics
/// data.
class AnalyticsBinBySpecification {
  /// Specifies the interval of time by which to bin the analytics data.
  final AnalyticsInterval interval;

  /// Specifies the time metric by which to bin the analytics data.
  final AnalyticsBinByName name;

  /// Specifies whether to bin the analytics data in ascending or descending
  /// order. If this field is left blank, the default order is by the key of the
  /// bin in descending order.
  final AnalyticsSortOrder? order;

  AnalyticsBinBySpecification({
    required this.interval,
    required this.name,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final interval = this.interval;
    final name = this.name;
    final order = this.order;
    return {
      'interval': interval.toValue(),
      'name': name.toValue(),
      if (order != null) 'order': order.toValue(),
    };
  }
}

/// An object containing the criterion by which to bin the results and the value
/// that defines that bin.
class AnalyticsBinKey {
  /// The criterion by which to bin the results.
  final AnalyticsBinByName? name;

  /// The value of the criterion that defines the bin.
  final int? value;

  AnalyticsBinKey({
    this.name,
    this.value,
  });

  factory AnalyticsBinKey.fromJson(Map<String, dynamic> json) {
    return AnalyticsBinKey(
      name: (json['name'] as String?)?.toAnalyticsBinByName(),
      value: json['value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum AnalyticsCommonFilterName {
  botAliasId,
  botVersion,
  localeId,
  modality,
  channel,
}

extension AnalyticsCommonFilterNameValueExtension on AnalyticsCommonFilterName {
  String toValue() {
    switch (this) {
      case AnalyticsCommonFilterName.botAliasId:
        return 'BotAliasId';
      case AnalyticsCommonFilterName.botVersion:
        return 'BotVersion';
      case AnalyticsCommonFilterName.localeId:
        return 'LocaleId';
      case AnalyticsCommonFilterName.modality:
        return 'Modality';
      case AnalyticsCommonFilterName.channel:
        return 'Channel';
    }
  }
}

extension AnalyticsCommonFilterNameFromString on String {
  AnalyticsCommonFilterName toAnalyticsCommonFilterName() {
    switch (this) {
      case 'BotAliasId':
        return AnalyticsCommonFilterName.botAliasId;
      case 'BotVersion':
        return AnalyticsCommonFilterName.botVersion;
      case 'LocaleId':
        return AnalyticsCommonFilterName.localeId;
      case 'Modality':
        return AnalyticsCommonFilterName.modality;
      case 'Channel':
        return AnalyticsCommonFilterName.channel;
    }
    throw Exception('$this is not known in enum AnalyticsCommonFilterName');
  }
}

enum AnalyticsFilterOperator {
  eq,
  gt,
  lt,
}

extension AnalyticsFilterOperatorValueExtension on AnalyticsFilterOperator {
  String toValue() {
    switch (this) {
      case AnalyticsFilterOperator.eq:
        return 'EQ';
      case AnalyticsFilterOperator.gt:
        return 'GT';
      case AnalyticsFilterOperator.lt:
        return 'LT';
    }
  }
}

extension AnalyticsFilterOperatorFromString on String {
  AnalyticsFilterOperator toAnalyticsFilterOperator() {
    switch (this) {
      case 'EQ':
        return AnalyticsFilterOperator.eq;
      case 'GT':
        return AnalyticsFilterOperator.gt;
      case 'LT':
        return AnalyticsFilterOperator.lt;
    }
    throw Exception('$this is not known in enum AnalyticsFilterOperator');
  }
}

enum AnalyticsIntentField {
  intentName,
  intentEndState,
  intentLevel,
}

extension AnalyticsIntentFieldValueExtension on AnalyticsIntentField {
  String toValue() {
    switch (this) {
      case AnalyticsIntentField.intentName:
        return 'IntentName';
      case AnalyticsIntentField.intentEndState:
        return 'IntentEndState';
      case AnalyticsIntentField.intentLevel:
        return 'IntentLevel';
    }
  }
}

extension AnalyticsIntentFieldFromString on String {
  AnalyticsIntentField toAnalyticsIntentField() {
    switch (this) {
      case 'IntentName':
        return AnalyticsIntentField.intentName;
      case 'IntentEndState':
        return AnalyticsIntentField.intentEndState;
      case 'IntentLevel':
        return AnalyticsIntentField.intentLevel;
    }
    throw Exception('$this is not known in enum AnalyticsIntentField');
  }
}

/// Contains fields describing a condition by which to filter the intents. The
/// expression may be understood as <code>name</code> <code>operator</code>
/// <code>values</code>. For example:
///
/// <ul>
/// <li>
/// <code>IntentName CO Book</code> – The intent name contains the string
/// "Book."
/// </li>
/// <li>
/// <code>BotVersion EQ 2</code> – The bot version is equal to two.
/// </li>
/// </ul>
/// The operators that each filter supports are listed below:
///
/// <ul>
/// <li>
/// <code>BotAlias</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>BotVersion</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>LocaleId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>Modality</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>Channel</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>SessionId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>OriginatingRequestId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>IntentName</code> – <code>EQ</code>, <code>CO</code>.
/// </li>
/// <li>
/// <code>IntentEndState</code> – <code>EQ</code>, <code>CO</code>.
/// </li>
/// </ul>
class AnalyticsIntentFilter {
  /// The category by which to filter the intents. The descriptions for each
  /// option are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>BotAlias</code> – The name of the bot alias.
  /// </li>
  /// <li>
  /// <code>BotVersion</code> – The version of the bot.
  /// </li>
  /// <li>
  /// <code>LocaleId</code> – The locale of the bot.
  /// </li>
  /// <li>
  /// <code>Modality</code> – The modality of the session with the bot (audio,
  /// DTMF, or text).
  /// </li>
  /// <li>
  /// <code>Channel</code> – The channel that the bot is integrated with.
  /// </li>
  /// <li>
  /// <code>SessionId</code> – The identifier of the session with the bot.
  /// </li>
  /// <li>
  /// <code>OriginatingRequestId</code> – The identifier of the first request in a
  /// session.
  /// </li>
  /// <li>
  /// <code>IntentName</code> – The name of the intent.
  /// </li>
  /// <li>
  /// <code>IntentEndState</code> – The final state of the intent.
  /// </li>
  /// </ul>
  final AnalyticsIntentFilterName name;

  /// The operation by which to filter the category. The following operations are
  /// possible:
  ///
  /// <ul>
  /// <li>
  /// <code>CO</code> – Contains
  /// </li>
  /// <li>
  /// <code>EQ</code> – Equals
  /// </li>
  /// <li>
  /// <code>GT</code> – Greater than
  /// </li>
  /// <li>
  /// <code>LT</code> – Less than
  /// </li>
  /// </ul>
  /// The operators that each filter supports are listed below:
  ///
  /// <ul>
  /// <li>
  /// <code>BotAlias</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>BotVersion</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>LocaleId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>Modality</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>Channel</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>SessionId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>OriginatingRequestId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>IntentName</code> – <code>EQ</code>, <code>CO</code>.
  /// </li>
  /// <li>
  /// <code>IntentEndState</code> – <code>EQ</code>, <code>CO</code>.
  /// </li>
  /// </ul>
  final AnalyticsFilterOperator operator;

  /// An array containing the values of the category by which to apply the
  /// operator to filter the results. You can provide multiple values if the
  /// operator is <code>EQ</code> or <code>CO</code>. If you provide multiple
  /// values, you filter for results that equal/contain any of the values. For
  /// example, if the <code>name</code>, <code>operator</code>, and
  /// <code>values</code> fields are <code>Modality</code>, <code>EQ</code>, and
  /// <code>[Speech, Text]</code>, the operation filters for results where the
  /// modality was either <code>Speech</code> or <code>Text</code>.
  final List<String> values;

  AnalyticsIntentFilter({
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

enum AnalyticsIntentFilterName {
  botAliasId,
  botVersion,
  localeId,
  modality,
  channel,
  sessionId,
  originatingRequestId,
  intentName,
  intentEndState,
}

extension AnalyticsIntentFilterNameValueExtension on AnalyticsIntentFilterName {
  String toValue() {
    switch (this) {
      case AnalyticsIntentFilterName.botAliasId:
        return 'BotAliasId';
      case AnalyticsIntentFilterName.botVersion:
        return 'BotVersion';
      case AnalyticsIntentFilterName.localeId:
        return 'LocaleId';
      case AnalyticsIntentFilterName.modality:
        return 'Modality';
      case AnalyticsIntentFilterName.channel:
        return 'Channel';
      case AnalyticsIntentFilterName.sessionId:
        return 'SessionId';
      case AnalyticsIntentFilterName.originatingRequestId:
        return 'OriginatingRequestId';
      case AnalyticsIntentFilterName.intentName:
        return 'IntentName';
      case AnalyticsIntentFilterName.intentEndState:
        return 'IntentEndState';
    }
  }
}

extension AnalyticsIntentFilterNameFromString on String {
  AnalyticsIntentFilterName toAnalyticsIntentFilterName() {
    switch (this) {
      case 'BotAliasId':
        return AnalyticsIntentFilterName.botAliasId;
      case 'BotVersion':
        return AnalyticsIntentFilterName.botVersion;
      case 'LocaleId':
        return AnalyticsIntentFilterName.localeId;
      case 'Modality':
        return AnalyticsIntentFilterName.modality;
      case 'Channel':
        return AnalyticsIntentFilterName.channel;
      case 'SessionId':
        return AnalyticsIntentFilterName.sessionId;
      case 'OriginatingRequestId':
        return AnalyticsIntentFilterName.originatingRequestId;
      case 'IntentName':
        return AnalyticsIntentFilterName.intentName;
      case 'IntentEndState':
        return AnalyticsIntentFilterName.intentEndState;
    }
    throw Exception('$this is not known in enum AnalyticsIntentFilterName');
  }
}

/// Contains the category by which the intent analytics were grouped and a
/// member of that category.
class AnalyticsIntentGroupByKey {
  /// A category by which the intent analytics were grouped.
  final AnalyticsIntentField? name;

  /// A member of the category by which the intent analytics were grouped.
  final String? value;

  AnalyticsIntentGroupByKey({
    this.name,
    this.value,
  });

  factory AnalyticsIntentGroupByKey.fromJson(Map<String, dynamic> json) {
    return AnalyticsIntentGroupByKey(
      name: (json['name'] as String?)?.toAnalyticsIntentField(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// Contains the category by which to group the intents.
class AnalyticsIntentGroupBySpecification {
  /// Specifies whether to group the intent stages by their name or their end
  /// state.
  final AnalyticsIntentField name;

  AnalyticsIntentGroupBySpecification({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name.toValue(),
    };
  }
}

/// Contains the metric and the summary statistic you want to calculate, and the
/// order in which to sort the results, for the intents in the bot.
class AnalyticsIntentMetric {
  /// The metric for which you want to get intent summary statistics.
  ///
  /// <ul>
  /// <li>
  /// <code>Count</code> – The number of times the intent was invoked.
  /// </li>
  /// <li>
  /// <code>Success</code> – The number of times the intent succeeded.
  /// </li>
  /// <li>
  /// <code>Failure</code> – The number of times the intent failed.
  /// </li>
  /// <li>
  /// <code>Switched</code> – The number of times there was a switch to a
  /// different intent.
  /// </li>
  /// <li>
  /// <code>Dropped</code> – The number of times the user dropped the intent.
  /// </li>
  /// </ul>
  final AnalyticsIntentMetricName name;

  /// The summary statistic to calculate.
  ///
  /// <ul>
  /// <li>
  /// <code>Sum</code> – The total count for the category you provide in
  /// <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Average</code> – The total count divided by the number of intents in
  /// the category you provide in <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Max</code> – The highest count in the category you provide in
  /// <code>name</code>.
  /// </li>
  /// </ul>
  final AnalyticsMetricStatistic statistic;

  /// Specifies whether to sort the results in ascending or descending order.
  final AnalyticsSortOrder? order;

  AnalyticsIntentMetric({
    required this.name,
    required this.statistic,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final statistic = this.statistic;
    final order = this.order;
    return {
      'name': name.toValue(),
      'statistic': statistic.toValue(),
      if (order != null) 'order': order.toValue(),
    };
  }
}

enum AnalyticsIntentMetricName {
  count,
  success,
  failure,
  switched,
  dropped,
}

extension AnalyticsIntentMetricNameValueExtension on AnalyticsIntentMetricName {
  String toValue() {
    switch (this) {
      case AnalyticsIntentMetricName.count:
        return 'Count';
      case AnalyticsIntentMetricName.success:
        return 'Success';
      case AnalyticsIntentMetricName.failure:
        return 'Failure';
      case AnalyticsIntentMetricName.switched:
        return 'Switched';
      case AnalyticsIntentMetricName.dropped:
        return 'Dropped';
    }
  }
}

extension AnalyticsIntentMetricNameFromString on String {
  AnalyticsIntentMetricName toAnalyticsIntentMetricName() {
    switch (this) {
      case 'Count':
        return AnalyticsIntentMetricName.count;
      case 'Success':
        return AnalyticsIntentMetricName.success;
      case 'Failure':
        return AnalyticsIntentMetricName.failure;
      case 'Switched':
        return AnalyticsIntentMetricName.switched;
      case 'Dropped':
        return AnalyticsIntentMetricName.dropped;
    }
    throw Exception('$this is not known in enum AnalyticsIntentMetricName');
  }
}

/// An object containing the results for the intent metric you requested.
class AnalyticsIntentMetricResult {
  /// The metric that you requested. See <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/analytics-key-definitions.html">Key
  /// definitions</a> for more details about these metrics.
  ///
  /// <ul>
  /// <li>
  /// <code>Count</code> – The number of times the intent was invoked.
  /// </li>
  /// <li>
  /// <code>Success</code> – The number of times the intent succeeded.
  /// </li>
  /// <li>
  /// <code>Failure</code> – The number of times the intent failed.
  /// </li>
  /// <li>
  /// <code>Switched</code> – The number of times there was a switch to a
  /// different intent.
  /// </li>
  /// <li>
  /// <code>Dropped</code> – The number of times the user dropped the intent.
  /// </li>
  /// </ul>
  final AnalyticsIntentMetricName? name;

  /// The statistic that you requested to calculate.
  ///
  /// <ul>
  /// <li>
  /// <code>Sum</code> – The total count for the category you provide in
  /// <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Average</code> – The total count divided by the number of intents in
  /// the category you provide in <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Max</code> – The highest count in the category you provide in
  /// <code>name</code>.
  /// </li>
  /// </ul>
  final AnalyticsMetricStatistic? statistic;

  /// The value of the summary statistic for the metric that you requested.
  final double? value;

  AnalyticsIntentMetricResult({
    this.name,
    this.statistic,
    this.value,
  });

  factory AnalyticsIntentMetricResult.fromJson(Map<String, dynamic> json) {
    return AnalyticsIntentMetricResult(
      name: (json['name'] as String?)?.toAnalyticsIntentMetricName(),
      statistic: (json['statistic'] as String?)?.toAnalyticsMetricStatistic(),
      value: json['value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final statistic = this.statistic;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (statistic != null) 'statistic': statistic.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// An object containing information about the requested path.
class AnalyticsIntentNodeSummary {
  /// The total number of sessions that follow the given path to the given intent.
  final int? intentCount;

  /// The number of intents up to and including the requested path.
  final int? intentLevel;

  /// The name of the intent at the end of the requested path.
  final String? intentName;

  /// The path.
  final String? intentPath;

  /// Specifies whether the node is the end of a path (<code>Exit</code>) or not
  /// (<code>Inner</code>).
  final AnalyticsNodeType? nodeType;

  AnalyticsIntentNodeSummary({
    this.intentCount,
    this.intentLevel,
    this.intentName,
    this.intentPath,
    this.nodeType,
  });

  factory AnalyticsIntentNodeSummary.fromJson(Map<String, dynamic> json) {
    return AnalyticsIntentNodeSummary(
      intentCount: json['intentCount'] as int?,
      intentLevel: json['intentLevel'] as int?,
      intentName: json['intentName'] as String?,
      intentPath: json['intentPath'] as String?,
      nodeType: (json['nodeType'] as String?)?.toAnalyticsNodeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final intentCount = this.intentCount;
    final intentLevel = this.intentLevel;
    final intentName = this.intentName;
    final intentPath = this.intentPath;
    final nodeType = this.nodeType;
    return {
      if (intentCount != null) 'intentCount': intentCount,
      if (intentLevel != null) 'intentLevel': intentLevel,
      if (intentName != null) 'intentName': intentName,
      if (intentPath != null) 'intentPath': intentPath,
      if (nodeType != null) 'nodeType': nodeType.toValue(),
    };
  }
}

/// An object containing the results for the intent metrics you requested and
/// the bin and/or group(s) they refer to, if applicable.
class AnalyticsIntentResult {
  /// A list of objects containing the criteria you requested for binning results
  /// and the values of the bins.
  final List<AnalyticsBinKey>? binKeys;

  /// A list of objects containing the criteria you requested for grouping results
  /// and the values of the groups.
  final List<AnalyticsIntentGroupByKey>? groupByKeys;

  /// A list of objects, each of which contains a metric you want to list, the
  /// statistic for the metric you want to return, and the method by which to
  /// organize the results.
  final List<AnalyticsIntentMetricResult>? metricsResults;

  AnalyticsIntentResult({
    this.binKeys,
    this.groupByKeys,
    this.metricsResults,
  });

  factory AnalyticsIntentResult.fromJson(Map<String, dynamic> json) {
    return AnalyticsIntentResult(
      binKeys: (json['binKeys'] as List?)
          ?.whereNotNull()
          .map((e) => AnalyticsBinKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupByKeys: (json['groupByKeys'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AnalyticsIntentGroupByKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricsResults: (json['metricsResults'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AnalyticsIntentMetricResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final binKeys = this.binKeys;
    final groupByKeys = this.groupByKeys;
    final metricsResults = this.metricsResults;
    return {
      if (binKeys != null) 'binKeys': binKeys,
      if (groupByKeys != null) 'groupByKeys': groupByKeys,
      if (metricsResults != null) 'metricsResults': metricsResults,
    };
  }
}

enum AnalyticsIntentStageField {
  intentStageName,
  switchedToIntent,
}

extension AnalyticsIntentStageFieldValueExtension on AnalyticsIntentStageField {
  String toValue() {
    switch (this) {
      case AnalyticsIntentStageField.intentStageName:
        return 'IntentStageName';
      case AnalyticsIntentStageField.switchedToIntent:
        return 'SwitchedToIntent';
    }
  }
}

extension AnalyticsIntentStageFieldFromString on String {
  AnalyticsIntentStageField toAnalyticsIntentStageField() {
    switch (this) {
      case 'IntentStageName':
        return AnalyticsIntentStageField.intentStageName;
      case 'SwitchedToIntent':
        return AnalyticsIntentStageField.switchedToIntent;
    }
    throw Exception('$this is not known in enum AnalyticsIntentStageField');
  }
}

/// Contains fields describing a condition by which to filter the intent stages.
/// The expression may be understood as <code>name</code> <code>operator</code>
/// <code>values</code>. For example:
///
/// <ul>
/// <li>
/// <code>IntentName CO Book</code> – The intent name contains the string
/// "Book."
/// </li>
/// <li>
/// <code>BotVersion EQ 2</code> – The bot version is equal to two.
/// </li>
/// </ul>
/// The operators that each filter supports are listed below:
///
/// <ul>
/// <li>
/// <code>BotAlias</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>BotVersion</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>LocaleId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>Modality</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>Channel</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>SessionId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>OriginatingRequestId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>IntentName</code> – <code>EQ</code>, <code>CO</code>.
/// </li>
/// <li>
/// <code>IntentStageName</code> – <code>EQ</code>, <code>CO</code>.
/// </li>
/// </ul>
class AnalyticsIntentStageFilter {
  /// The category by which to filter the intent stages. The descriptions for each
  /// option are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>BotAlias</code> – The name of the bot alias.
  /// </li>
  /// <li>
  /// <code>BotVersion</code> – The version of the bot.
  /// </li>
  /// <li>
  /// <code>LocaleId</code> – The locale of the bot.
  /// </li>
  /// <li>
  /// <code>Modality</code> – The modality of the session with the bot (audio,
  /// DTMF, or text).
  /// </li>
  /// <li>
  /// <code>Channel</code> – The channel that the bot is integrated with.
  /// </li>
  /// <li>
  /// <code>SessionId</code> – The identifier of the session with the bot.
  /// </li>
  /// <li>
  /// <code>OriginatingRequestId</code> – The identifier of the first request in a
  /// session.
  /// </li>
  /// <li>
  /// <code>IntentName</code> – The name of the intent.
  /// </li>
  /// <li>
  /// <code>IntentStageName</code> – The stage in the intent.
  /// </li>
  /// </ul>
  final AnalyticsIntentStageFilterName name;

  /// The operation by which to filter the category. The following operations are
  /// possible:
  ///
  /// <ul>
  /// <li>
  /// <code>CO</code> – Contains
  /// </li>
  /// <li>
  /// <code>EQ</code> – Equals
  /// </li>
  /// <li>
  /// <code>GT</code> – Greater than
  /// </li>
  /// <li>
  /// <code>LT</code> – Less than
  /// </li>
  /// </ul>
  /// The operators that each filter supports are listed below:
  ///
  /// <ul>
  /// <li>
  /// <code>BotAlias</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>BotVersion</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>LocaleId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>Modality</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>Channel</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>SessionId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>OriginatingRequestId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>IntentName</code> – <code>EQ</code>, <code>CO</code>.
  /// </li>
  /// <li>
  /// <code>IntentStageName</code> – <code>EQ</code>, <code>CO</code>.
  /// </li>
  /// </ul>
  final AnalyticsFilterOperator operator;

  /// An array containing the values of the category by which to apply the
  /// operator to filter the results. You can provide multiple values if the
  /// operator is <code>EQ</code> or <code>CO</code>. If you provide multiple
  /// values, you filter for results that equal/contain any of the values. For
  /// example, if the <code>name</code>, <code>operator</code>, and
  /// <code>values</code> fields are <code>Modality</code>, <code>EQ</code>, and
  /// <code>[Speech, Text]</code>, the operation filters for results where the
  /// modality was either <code>Speech</code> or <code>Text</code>.
  final List<String> values;

  AnalyticsIntentStageFilter({
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

enum AnalyticsIntentStageFilterName {
  botAliasId,
  botVersion,
  localeId,
  modality,
  channel,
  sessionId,
  originatingRequestId,
  intentName,
  intentStageName,
}

extension AnalyticsIntentStageFilterNameValueExtension
    on AnalyticsIntentStageFilterName {
  String toValue() {
    switch (this) {
      case AnalyticsIntentStageFilterName.botAliasId:
        return 'BotAliasId';
      case AnalyticsIntentStageFilterName.botVersion:
        return 'BotVersion';
      case AnalyticsIntentStageFilterName.localeId:
        return 'LocaleId';
      case AnalyticsIntentStageFilterName.modality:
        return 'Modality';
      case AnalyticsIntentStageFilterName.channel:
        return 'Channel';
      case AnalyticsIntentStageFilterName.sessionId:
        return 'SessionId';
      case AnalyticsIntentStageFilterName.originatingRequestId:
        return 'OriginatingRequestId';
      case AnalyticsIntentStageFilterName.intentName:
        return 'IntentName';
      case AnalyticsIntentStageFilterName.intentStageName:
        return 'IntentStageName';
    }
  }
}

extension AnalyticsIntentStageFilterNameFromString on String {
  AnalyticsIntentStageFilterName toAnalyticsIntentStageFilterName() {
    switch (this) {
      case 'BotAliasId':
        return AnalyticsIntentStageFilterName.botAliasId;
      case 'BotVersion':
        return AnalyticsIntentStageFilterName.botVersion;
      case 'LocaleId':
        return AnalyticsIntentStageFilterName.localeId;
      case 'Modality':
        return AnalyticsIntentStageFilterName.modality;
      case 'Channel':
        return AnalyticsIntentStageFilterName.channel;
      case 'SessionId':
        return AnalyticsIntentStageFilterName.sessionId;
      case 'OriginatingRequestId':
        return AnalyticsIntentStageFilterName.originatingRequestId;
      case 'IntentName':
        return AnalyticsIntentStageFilterName.intentName;
      case 'IntentStageName':
        return AnalyticsIntentStageFilterName.intentStageName;
    }
    throw Exception(
        '$this is not known in enum AnalyticsIntentStageFilterName');
  }
}

/// Contains the category by which the intent stage analytics and the values for
/// that category were grouped.
class AnalyticsIntentStageGroupByKey {
  /// A category by which the intent stage analytics were grouped.
  final AnalyticsIntentStageField? name;

  /// A member of the category by which the intent stage analytics were grouped.
  final String? value;

  AnalyticsIntentStageGroupByKey({
    this.name,
    this.value,
  });

  factory AnalyticsIntentStageGroupByKey.fromJson(Map<String, dynamic> json) {
    return AnalyticsIntentStageGroupByKey(
      name: (json['name'] as String?)?.toAnalyticsIntentStageField(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// Contains the category by which to group the intent stages.
class AnalyticsIntentStageGroupBySpecification {
  /// Specifies whether to group the intent stages by their name or the intent to
  /// which the session was switched.
  final AnalyticsIntentStageField name;

  AnalyticsIntentStageGroupBySpecification({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name.toValue(),
    };
  }
}

/// Contains the metric and the summary statistic you want to calculate, and the
/// order in which to sort the results, for the intent stages across the user
/// sessions with the bot.
class AnalyticsIntentStageMetric {
  /// The metric for which you want to get intent stage summary statistics. See <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/analytics-key-definitions.html">Key
  /// definitions</a> for more details about these metrics.
  ///
  /// <ul>
  /// <li>
  /// <code>Count</code> – The number of times the intent stage occurred.
  /// </li>
  /// <li>
  /// <code>Success</code> – The number of times the intent stage succeeded.
  /// </li>
  /// <li>
  /// <code>Failure</code> – The number of times the intent stage failed.
  /// </li>
  /// <li>
  /// <code>Dropped</code> – The number of times the user dropped the intent
  /// stage.
  /// </li>
  /// <li>
  /// <code>Retry</code> – The number of times the bot tried to elicit a response
  /// from the user at this stage.
  /// </li>
  /// </ul>
  final AnalyticsIntentStageMetricName name;

  /// The summary statistic to calculate.
  ///
  /// <ul>
  /// <li>
  /// <code>Sum</code> – The total count for the category you provide in
  /// <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Average</code> – The total count divided by the number of intent
  /// stages in the category you provide in <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Max</code> – The highest count in the category you provide in
  /// <code>name</code>.
  /// </li>
  /// </ul>
  final AnalyticsMetricStatistic statistic;

  /// Specifies whether to sort the results in ascending or descending order of
  /// the summary statistic (<code>value</code> in the response).
  final AnalyticsSortOrder? order;

  AnalyticsIntentStageMetric({
    required this.name,
    required this.statistic,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final statistic = this.statistic;
    final order = this.order;
    return {
      'name': name.toValue(),
      'statistic': statistic.toValue(),
      if (order != null) 'order': order.toValue(),
    };
  }
}

enum AnalyticsIntentStageMetricName {
  count,
  success,
  failed,
  dropped,
  retry,
}

extension AnalyticsIntentStageMetricNameValueExtension
    on AnalyticsIntentStageMetricName {
  String toValue() {
    switch (this) {
      case AnalyticsIntentStageMetricName.count:
        return 'Count';
      case AnalyticsIntentStageMetricName.success:
        return 'Success';
      case AnalyticsIntentStageMetricName.failed:
        return 'Failed';
      case AnalyticsIntentStageMetricName.dropped:
        return 'Dropped';
      case AnalyticsIntentStageMetricName.retry:
        return 'Retry';
    }
  }
}

extension AnalyticsIntentStageMetricNameFromString on String {
  AnalyticsIntentStageMetricName toAnalyticsIntentStageMetricName() {
    switch (this) {
      case 'Count':
        return AnalyticsIntentStageMetricName.count;
      case 'Success':
        return AnalyticsIntentStageMetricName.success;
      case 'Failed':
        return AnalyticsIntentStageMetricName.failed;
      case 'Dropped':
        return AnalyticsIntentStageMetricName.dropped;
      case 'Retry':
        return AnalyticsIntentStageMetricName.retry;
    }
    throw Exception(
        '$this is not known in enum AnalyticsIntentStageMetricName');
  }
}

/// An object containing the results for an intent stage metric you requested.
class AnalyticsIntentStageMetricResult {
  /// The metric that you requested.
  ///
  /// <ul>
  /// <li>
  /// <code>Count</code> – The number of times the intent stage occurred.
  /// </li>
  /// <li>
  /// <code>Success</code> – The number of times the intent stage succeeded.
  /// </li>
  /// <li>
  /// <code>Failure</code> – The number of times the intent stage failed.
  /// </li>
  /// <li>
  /// <code>Dropped</code> – The number of times the user dropped the intent
  /// stage.
  /// </li>
  /// <li>
  /// <code>Retry</code> – The number of times the bot tried to elicit a response
  /// from the user at this stage.
  /// </li>
  /// </ul>
  final AnalyticsIntentStageMetricName? name;

  /// The summary statistic that you requested to calculate.
  ///
  /// <ul>
  /// <li>
  /// <code>Sum</code> – The total count for the category you provide in
  /// <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Average</code> – The total count divided by the number of intent
  /// stages in the category you provide in <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Max</code> – The highest count in the category you provide in
  /// <code>name</code>.
  /// </li>
  /// </ul>
  final AnalyticsMetricStatistic? statistic;

  /// The value of the summary statistic for the metric that you requested.
  final double? value;

  AnalyticsIntentStageMetricResult({
    this.name,
    this.statistic,
    this.value,
  });

  factory AnalyticsIntentStageMetricResult.fromJson(Map<String, dynamic> json) {
    return AnalyticsIntentStageMetricResult(
      name: (json['name'] as String?)?.toAnalyticsIntentStageMetricName(),
      statistic: (json['statistic'] as String?)?.toAnalyticsMetricStatistic(),
      value: json['value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final statistic = this.statistic;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (statistic != null) 'statistic': statistic.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// An object containing the results for the intent stage metrics you requested
/// and the bin and/or group they refer to, if applicable.
class AnalyticsIntentStageResult {
  /// A list of objects containing the criteria you requested for binning results
  /// and the values of the bins.
  final List<AnalyticsBinKey>? binKeys;

  /// A list of objects containing the criteria you requested for grouping results
  /// and the values of the bins.
  final List<AnalyticsIntentStageGroupByKey>? groupByKeys;

  /// A list of objects, each of which contains a metric you want to list, the
  /// statistic for the metric you want to return, and the method by which to
  /// organize the results.
  final List<AnalyticsIntentStageMetricResult>? metricsResults;

  AnalyticsIntentStageResult({
    this.binKeys,
    this.groupByKeys,
    this.metricsResults,
  });

  factory AnalyticsIntentStageResult.fromJson(Map<String, dynamic> json) {
    return AnalyticsIntentStageResult(
      binKeys: (json['binKeys'] as List?)
          ?.whereNotNull()
          .map((e) => AnalyticsBinKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupByKeys: (json['groupByKeys'] as List?)
          ?.whereNotNull()
          .map((e) => AnalyticsIntentStageGroupByKey.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      metricsResults: (json['metricsResults'] as List?)
          ?.whereNotNull()
          .map((e) => AnalyticsIntentStageMetricResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final binKeys = this.binKeys;
    final groupByKeys = this.groupByKeys;
    final metricsResults = this.metricsResults;
    return {
      if (binKeys != null) 'binKeys': binKeys,
      if (groupByKeys != null) 'groupByKeys': groupByKeys,
      if (metricsResults != null) 'metricsResults': metricsResults,
    };
  }
}

enum AnalyticsInterval {
  oneHour,
  oneDay,
}

extension AnalyticsIntervalValueExtension on AnalyticsInterval {
  String toValue() {
    switch (this) {
      case AnalyticsInterval.oneHour:
        return 'OneHour';
      case AnalyticsInterval.oneDay:
        return 'OneDay';
    }
  }
}

extension AnalyticsIntervalFromString on String {
  AnalyticsInterval toAnalyticsInterval() {
    switch (this) {
      case 'OneHour':
        return AnalyticsInterval.oneHour;
      case 'OneDay':
        return AnalyticsInterval.oneDay;
    }
    throw Exception('$this is not known in enum AnalyticsInterval');
  }
}

enum AnalyticsMetricStatistic {
  sum,
  avg,
  max,
}

extension AnalyticsMetricStatisticValueExtension on AnalyticsMetricStatistic {
  String toValue() {
    switch (this) {
      case AnalyticsMetricStatistic.sum:
        return 'Sum';
      case AnalyticsMetricStatistic.avg:
        return 'Avg';
      case AnalyticsMetricStatistic.max:
        return 'Max';
    }
  }
}

extension AnalyticsMetricStatisticFromString on String {
  AnalyticsMetricStatistic toAnalyticsMetricStatistic() {
    switch (this) {
      case 'Sum':
        return AnalyticsMetricStatistic.sum;
      case 'Avg':
        return AnalyticsMetricStatistic.avg;
      case 'Max':
        return AnalyticsMetricStatistic.max;
    }
    throw Exception('$this is not known in enum AnalyticsMetricStatistic');
  }
}

enum AnalyticsModality {
  speech,
  text,
  dtmf,
  multiMode,
}

extension AnalyticsModalityValueExtension on AnalyticsModality {
  String toValue() {
    switch (this) {
      case AnalyticsModality.speech:
        return 'Speech';
      case AnalyticsModality.text:
        return 'Text';
      case AnalyticsModality.dtmf:
        return 'DTMF';
      case AnalyticsModality.multiMode:
        return 'MultiMode';
    }
  }
}

extension AnalyticsModalityFromString on String {
  AnalyticsModality toAnalyticsModality() {
    switch (this) {
      case 'Speech':
        return AnalyticsModality.speech;
      case 'Text':
        return AnalyticsModality.text;
      case 'DTMF':
        return AnalyticsModality.dtmf;
      case 'MultiMode':
        return AnalyticsModality.multiMode;
    }
    throw Exception('$this is not known in enum AnalyticsModality');
  }
}

enum AnalyticsNodeType {
  inner,
  exit,
}

extension AnalyticsNodeTypeValueExtension on AnalyticsNodeType {
  String toValue() {
    switch (this) {
      case AnalyticsNodeType.inner:
        return 'Inner';
      case AnalyticsNodeType.exit:
        return 'Exit';
    }
  }
}

extension AnalyticsNodeTypeFromString on String {
  AnalyticsNodeType toAnalyticsNodeType() {
    switch (this) {
      case 'Inner':
        return AnalyticsNodeType.inner;
      case 'Exit':
        return AnalyticsNodeType.exit;
    }
    throw Exception('$this is not known in enum AnalyticsNodeType');
  }
}

/// Contains fields describing a condition by which to filter the paths. The
/// expression may be understood as <code>name</code> <code>operator</code>
/// <code>values</code>. For example:
///
/// <ul>
/// <li>
/// <code>LocaleId EQ en</code> – The locale is "en".
/// </li>
/// <li>
/// <code>BotVersion EQ 2</code> – The bot version is equal to two.
/// </li>
/// </ul>
/// The operators that each filter supports are listed below:
///
/// <ul>
/// <li>
/// <code>BotAlias</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>BotVersion</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>LocaleId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>Modality</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>Channel</code> – <code>EQ</code>.
/// </li>
/// </ul>
class AnalyticsPathFilter {
  /// The category by which to filter the intent paths. The descriptions for each
  /// option are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>BotAlias</code> – The name of the bot alias.
  /// </li>
  /// <li>
  /// <code>BotVersion</code> – The version of the bot.
  /// </li>
  /// <li>
  /// <code>LocaleId</code> – The locale of the bot.
  /// </li>
  /// <li>
  /// <code>Modality</code> – The modality of the session with the bot (audio,
  /// DTMF, or text).
  /// </li>
  /// <li>
  /// <code>Channel</code> – The channel that the bot is integrated with.
  /// </li>
  /// </ul>
  final AnalyticsCommonFilterName name;

  /// The operation by which to filter the category. The following operations are
  /// possible:
  ///
  /// <ul>
  /// <li>
  /// <code>CO</code> – Contains
  /// </li>
  /// <li>
  /// <code>EQ</code> – Equals
  /// </li>
  /// <li>
  /// <code>GT</code> – Greater than
  /// </li>
  /// <li>
  /// <code>LT</code> – Less than
  /// </li>
  /// </ul>
  /// The operators that each filter supports are listed below:
  ///
  /// <ul>
  /// <li>
  /// <code>BotAlias</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>BotVersion</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>LocaleId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>Modality</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>Channel</code> – <code>EQ</code>.
  /// </li>
  /// </ul>
  final AnalyticsFilterOperator operator;

  /// An array containing the values of the category by which to apply the
  /// operator to filter the results. You can provide multiple values if the
  /// operator is <code>EQ</code> or <code>CO</code>. If you provide multiple
  /// values, you filter for results that equal/contain any of the values. For
  /// example, if the <code>name</code>, <code>operator</code>, and
  /// <code>values</code> fields are <code>Modality</code>, <code>EQ</code>, and
  /// <code>[Speech, Text]</code>, the operation filters for results where the
  /// modality was either <code>Speech</code> or <code>Text</code>.
  final List<String> values;

  AnalyticsPathFilter({
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

enum AnalyticsSessionField {
  conversationEndState,
  localeId,
}

extension AnalyticsSessionFieldValueExtension on AnalyticsSessionField {
  String toValue() {
    switch (this) {
      case AnalyticsSessionField.conversationEndState:
        return 'ConversationEndState';
      case AnalyticsSessionField.localeId:
        return 'LocaleId';
    }
  }
}

extension AnalyticsSessionFieldFromString on String {
  AnalyticsSessionField toAnalyticsSessionField() {
    switch (this) {
      case 'ConversationEndState':
        return AnalyticsSessionField.conversationEndState;
      case 'LocaleId':
        return AnalyticsSessionField.localeId;
    }
    throw Exception('$this is not known in enum AnalyticsSessionField');
  }
}

/// Contains fields describing a condition by which to filter the sessions. The
/// expression may be understood as <code>name</code> <code>operator</code>
/// <code>values</code>. For example:
///
/// <ul>
/// <li>
/// <code>LocaleId EQ en</code> – The locale is "en".
/// </li>
/// <li>
/// <code>Duration GT 200</code> – The duration is greater than 200 seconds.
/// </li>
/// </ul>
/// The operators that each filter supports are listed below:
///
/// <ul>
/// <li>
/// <code>BotAlias</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>BotVersion</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>LocaleId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>Modality</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>Channel</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>Duration</code> – <code>EQ</code>, <code>GT</code>, <code>LT</code>.
/// </li>
/// <li>
/// <code>conversationEndState</code> – <code>EQ</code>, <code>CO</code>.
/// </li>
/// <li>
/// <code>SessionId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>OriginatingRequestId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>IntentPath</code> – <code>EQ</code>.
/// </li>
/// </ul>
class AnalyticsSessionFilter {
  /// The category by which to filter the sessions. The descriptions for each
  /// option are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>BotAlias</code> – The name of the bot alias.
  /// </li>
  /// <li>
  /// <code>BotVersion</code> – The version of the bot.
  /// </li>
  /// <li>
  /// <code>LocaleId</code> – The locale of the bot.
  /// </li>
  /// <li>
  /// <code>Modality</code> – The modality of the session with the bot (audio,
  /// DTMF, or text).
  /// </li>
  /// <li>
  /// <code>Channel</code> – The channel that the bot is integrated with.
  /// </li>
  /// <li>
  /// <code>Duration</code> – The duration of the session.
  /// </li>
  /// <li>
  /// <code>conversationEndState</code> – The final state of the session.
  /// </li>
  /// <li>
  /// <code>SessionId</code> – The identifier of the session with the bot.
  /// </li>
  /// <li>
  /// <code>OriginatingRequestId</code> – The identifier of the first request in a
  /// session.
  /// </li>
  /// <li>
  /// <code>IntentPath</code> – The order of intents taken in a session.
  /// </li>
  /// </ul>
  final AnalyticsSessionFilterName name;

  /// The operation by which to filter the category. The following operations are
  /// possible:
  ///
  /// <ul>
  /// <li>
  /// <code>CO</code> – Contains
  /// </li>
  /// <li>
  /// <code>EQ</code> – Equals
  /// </li>
  /// <li>
  /// <code>GT</code> – Greater than
  /// </li>
  /// <li>
  /// <code>LT</code> – Less than
  /// </li>
  /// </ul>
  /// The operators that each filter supports are listed below:
  ///
  /// <ul>
  /// <li>
  /// <code>BotAlias</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>BotVersion</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>LocaleId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>Modality</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>Channel</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>Duration</code> – <code>EQ</code>, <code>GT</code>, <code>LT</code>.
  /// </li>
  /// <li>
  /// <code>conversationEndState</code> – <code>EQ</code>, <code>CO</code>.
  /// </li>
  /// <li>
  /// <code>SessionId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>OriginatingRequestId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>IntentPath</code> – <code>EQ</code>.
  /// </li>
  /// </ul>
  final AnalyticsFilterOperator operator;

  /// An array containing the values of the category by which to apply the
  /// operator to filter the results. You can provide multiple values if the
  /// operator is <code>EQ</code> or <code>CO</code>. If you provide multiple
  /// values, you filter for results that equal/contain any of the values. For
  /// example, if the <code>name</code>, <code>operator</code>, and
  /// <code>values</code> fields are <code>Modality</code>, <code>EQ</code>, and
  /// <code>[Speech, Text]</code>, the operation filters for results where the
  /// modality was either <code>Speech</code> or <code>Text</code>.
  final List<String> values;

  AnalyticsSessionFilter({
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

enum AnalyticsSessionFilterName {
  botAliasId,
  botVersion,
  localeId,
  modality,
  channel,
  duration,
  conversationEndState,
  sessionId,
  originatingRequestId,
  intentPath,
}

extension AnalyticsSessionFilterNameValueExtension
    on AnalyticsSessionFilterName {
  String toValue() {
    switch (this) {
      case AnalyticsSessionFilterName.botAliasId:
        return 'BotAliasId';
      case AnalyticsSessionFilterName.botVersion:
        return 'BotVersion';
      case AnalyticsSessionFilterName.localeId:
        return 'LocaleId';
      case AnalyticsSessionFilterName.modality:
        return 'Modality';
      case AnalyticsSessionFilterName.channel:
        return 'Channel';
      case AnalyticsSessionFilterName.duration:
        return 'Duration';
      case AnalyticsSessionFilterName.conversationEndState:
        return 'ConversationEndState';
      case AnalyticsSessionFilterName.sessionId:
        return 'SessionId';
      case AnalyticsSessionFilterName.originatingRequestId:
        return 'OriginatingRequestId';
      case AnalyticsSessionFilterName.intentPath:
        return 'IntentPath';
    }
  }
}

extension AnalyticsSessionFilterNameFromString on String {
  AnalyticsSessionFilterName toAnalyticsSessionFilterName() {
    switch (this) {
      case 'BotAliasId':
        return AnalyticsSessionFilterName.botAliasId;
      case 'BotVersion':
        return AnalyticsSessionFilterName.botVersion;
      case 'LocaleId':
        return AnalyticsSessionFilterName.localeId;
      case 'Modality':
        return AnalyticsSessionFilterName.modality;
      case 'Channel':
        return AnalyticsSessionFilterName.channel;
      case 'Duration':
        return AnalyticsSessionFilterName.duration;
      case 'ConversationEndState':
        return AnalyticsSessionFilterName.conversationEndState;
      case 'SessionId':
        return AnalyticsSessionFilterName.sessionId;
      case 'OriginatingRequestId':
        return AnalyticsSessionFilterName.originatingRequestId;
      case 'IntentPath':
        return AnalyticsSessionFilterName.intentPath;
    }
    throw Exception('$this is not known in enum AnalyticsSessionFilterName');
  }
}

/// Contains the category by which the session analytics were grouped and a
/// member of that category.
class AnalyticsSessionGroupByKey {
  /// The category by which the session analytics were grouped.
  final AnalyticsSessionField? name;

  /// A member of the category by which the session analytics were grouped.
  final String? value;

  AnalyticsSessionGroupByKey({
    this.name,
    this.value,
  });

  factory AnalyticsSessionGroupByKey.fromJson(Map<String, dynamic> json) {
    return AnalyticsSessionGroupByKey(
      name: (json['name'] as String?)?.toAnalyticsSessionField(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// Contains the category by which to group the sessions.
class AnalyticsSessionGroupBySpecification {
  /// Specifies whether to group the session by their end state or their locale.
  final AnalyticsSessionField name;

  AnalyticsSessionGroupBySpecification({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name.toValue(),
    };
  }
}

/// Contains the metric and the summary statistic you want to calculate, and the
/// order in which to sort the results, for the user sessions with the bot.
class AnalyticsSessionMetric {
  /// The metric for which you want to get session summary statistics.
  ///
  /// <ul>
  /// <li>
  /// <code>Count</code> – The number of sessions.
  /// </li>
  /// <li>
  /// <code>Success</code> – The number of sessions that succeeded.
  /// </li>
  /// <li>
  /// <code>Failure</code> – The number of sessions that failed.
  /// </li>
  /// <li>
  /// <code>Dropped</code> – The number of sessions that the user dropped.
  /// </li>
  /// <li>
  /// <code>Duration</code> – The duration of sessions.
  /// </li>
  /// <li>
  /// <code>TurnsPerSession</code> – The number of turns in the sessions.
  /// </li>
  /// <li>
  /// <code>Concurrency</code> – The number of sessions occurring in the same
  /// period of time.
  /// </li>
  /// </ul>
  final AnalyticsSessionMetricName name;

  /// The summary statistic to calculate.
  ///
  /// <ul>
  /// <li>
  /// <code>Sum</code> – The total count for the category you provide in
  /// <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Average</code> – The total count divided by the number of sessions in
  /// the category you provide in <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Max</code> – The highest count in the category you provide in
  /// <code>name</code>.
  /// </li>
  /// </ul>
  final AnalyticsMetricStatistic statistic;

  /// Specifies whether to sort the results in ascending or descending order.
  final AnalyticsSortOrder? order;

  AnalyticsSessionMetric({
    required this.name,
    required this.statistic,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final statistic = this.statistic;
    final order = this.order;
    return {
      'name': name.toValue(),
      'statistic': statistic.toValue(),
      if (order != null) 'order': order.toValue(),
    };
  }
}

enum AnalyticsSessionMetricName {
  count,
  success,
  failure,
  dropped,
  duration,
  turnsPerConversation,
  concurrency,
}

extension AnalyticsSessionMetricNameValueExtension
    on AnalyticsSessionMetricName {
  String toValue() {
    switch (this) {
      case AnalyticsSessionMetricName.count:
        return 'Count';
      case AnalyticsSessionMetricName.success:
        return 'Success';
      case AnalyticsSessionMetricName.failure:
        return 'Failure';
      case AnalyticsSessionMetricName.dropped:
        return 'Dropped';
      case AnalyticsSessionMetricName.duration:
        return 'Duration';
      case AnalyticsSessionMetricName.turnsPerConversation:
        return 'TurnsPerConversation';
      case AnalyticsSessionMetricName.concurrency:
        return 'Concurrency';
    }
  }
}

extension AnalyticsSessionMetricNameFromString on String {
  AnalyticsSessionMetricName toAnalyticsSessionMetricName() {
    switch (this) {
      case 'Count':
        return AnalyticsSessionMetricName.count;
      case 'Success':
        return AnalyticsSessionMetricName.success;
      case 'Failure':
        return AnalyticsSessionMetricName.failure;
      case 'Dropped':
        return AnalyticsSessionMetricName.dropped;
      case 'Duration':
        return AnalyticsSessionMetricName.duration;
      case 'TurnsPerConversation':
        return AnalyticsSessionMetricName.turnsPerConversation;
      case 'Concurrency':
        return AnalyticsSessionMetricName.concurrency;
    }
    throw Exception('$this is not known in enum AnalyticsSessionMetricName');
  }
}

/// An object containing the results for a session metric you requested.
class AnalyticsSessionMetricResult {
  /// The metric that you requested.
  ///
  /// <ul>
  /// <li>
  /// <code>Count</code> – The number of sessions.
  /// </li>
  /// <li>
  /// <code>Success</code> – The number of sessions that succeeded.
  /// </li>
  /// <li>
  /// <code>Failure</code> – The number of sessions that failed.
  /// </li>
  /// <li>
  /// <code>Dropped</code> – The number of sessions that the user dropped.
  /// </li>
  /// <li>
  /// <code>Duration</code> – The duration of sessions.
  /// </li>
  /// <li>
  /// <code>TurnPersession</code> – The number of turns in the sessions.
  /// </li>
  /// <li>
  /// <code>Concurrency</code> – The number of sessions occurring in the same
  /// period of time.
  /// </li>
  /// </ul>
  final AnalyticsSessionMetricName? name;

  /// The summary statistic that you requested to calculate.
  ///
  /// <ul>
  /// <li>
  /// <code>Sum</code> – The total count for the category you provide in
  /// <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Average</code> – The total count divided by the number of sessions in
  /// the category you provide in <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Max</code> – The highest count in the category you provide in
  /// <code>name</code>.
  /// </li>
  /// </ul>
  final AnalyticsMetricStatistic? statistic;

  /// The value of the summary statistic for the metric that you requested.
  final double? value;

  AnalyticsSessionMetricResult({
    this.name,
    this.statistic,
    this.value,
  });

  factory AnalyticsSessionMetricResult.fromJson(Map<String, dynamic> json) {
    return AnalyticsSessionMetricResult(
      name: (json['name'] as String?)?.toAnalyticsSessionMetricName(),
      statistic: (json['statistic'] as String?)?.toAnalyticsMetricStatistic(),
      value: json['value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final statistic = this.statistic;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (statistic != null) 'statistic': statistic.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// An object containing the results for the session metrics you requested and
/// the bin and/or group(s) they refer to, if applicable.
class AnalyticsSessionResult {
  /// A list of objects containing the criteria you requested for binning results
  /// and the values of the bins.
  final List<AnalyticsBinKey>? binKeys;

  /// A list of objects containing the criteria you requested for grouping results
  /// and the values of the bins.
  final List<AnalyticsSessionGroupByKey>? groupByKeys;

  /// A list of objects, each of which contains a metric you want to list, the
  /// statistic for the metric you want to return, and the method by which to
  /// organize the results.
  final List<AnalyticsSessionMetricResult>? metricsResults;

  AnalyticsSessionResult({
    this.binKeys,
    this.groupByKeys,
    this.metricsResults,
  });

  factory AnalyticsSessionResult.fromJson(Map<String, dynamic> json) {
    return AnalyticsSessionResult(
      binKeys: (json['binKeys'] as List?)
          ?.whereNotNull()
          .map((e) => AnalyticsBinKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupByKeys: (json['groupByKeys'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AnalyticsSessionGroupByKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricsResults: (json['metricsResults'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AnalyticsSessionMetricResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final binKeys = this.binKeys;
    final groupByKeys = this.groupByKeys;
    final metricsResults = this.metricsResults;
    return {
      if (binKeys != null) 'binKeys': binKeys,
      if (groupByKeys != null) 'groupByKeys': groupByKeys,
      if (metricsResults != null) 'metricsResults': metricsResults,
    };
  }
}

enum AnalyticsSessionSortByName {
  conversationStartTime,
  numberOfTurns,
  duration,
}

extension AnalyticsSessionSortByNameValueExtension
    on AnalyticsSessionSortByName {
  String toValue() {
    switch (this) {
      case AnalyticsSessionSortByName.conversationStartTime:
        return 'ConversationStartTime';
      case AnalyticsSessionSortByName.numberOfTurns:
        return 'NumberOfTurns';
      case AnalyticsSessionSortByName.duration:
        return 'Duration';
    }
  }
}

extension AnalyticsSessionSortByNameFromString on String {
  AnalyticsSessionSortByName toAnalyticsSessionSortByName() {
    switch (this) {
      case 'ConversationStartTime':
        return AnalyticsSessionSortByName.conversationStartTime;
      case 'NumberOfTurns':
        return AnalyticsSessionSortByName.numberOfTurns;
      case 'Duration':
        return AnalyticsSessionSortByName.duration;
    }
    throw Exception('$this is not known in enum AnalyticsSessionSortByName');
  }
}

enum AnalyticsSortOrder {
  ascending,
  descending,
}

extension AnalyticsSortOrderValueExtension on AnalyticsSortOrder {
  String toValue() {
    switch (this) {
      case AnalyticsSortOrder.ascending:
        return 'Ascending';
      case AnalyticsSortOrder.descending:
        return 'Descending';
    }
  }
}

extension AnalyticsSortOrderFromString on String {
  AnalyticsSortOrder toAnalyticsSortOrder() {
    switch (this) {
      case 'Ascending':
        return AnalyticsSortOrder.ascending;
      case 'Descending':
        return AnalyticsSortOrder.descending;
    }
    throw Exception('$this is not known in enum AnalyticsSortOrder');
  }
}

/// An object that specifies the last used intent at the time of the utterance
/// as an attribute to return.
class AnalyticsUtteranceAttribute {
  /// An attribute to return. The only available attribute is the intent that the
  /// bot mapped the utterance to.
  final AnalyticsUtteranceAttributeName name;

  AnalyticsUtteranceAttribute({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name.toValue(),
    };
  }
}

enum AnalyticsUtteranceAttributeName {
  lastUsedIntent,
}

extension AnalyticsUtteranceAttributeNameValueExtension
    on AnalyticsUtteranceAttributeName {
  String toValue() {
    switch (this) {
      case AnalyticsUtteranceAttributeName.lastUsedIntent:
        return 'LastUsedIntent';
    }
  }
}

extension AnalyticsUtteranceAttributeNameFromString on String {
  AnalyticsUtteranceAttributeName toAnalyticsUtteranceAttributeName() {
    switch (this) {
      case 'LastUsedIntent':
        return AnalyticsUtteranceAttributeName.lastUsedIntent;
    }
    throw Exception(
        '$this is not known in enum AnalyticsUtteranceAttributeName');
  }
}

/// An object containing the intent that the bot mapped the utterance to.
class AnalyticsUtteranceAttributeResult {
  /// The intent that the bot mapped the utterance to.
  final String? lastUsedIntent;

  AnalyticsUtteranceAttributeResult({
    this.lastUsedIntent,
  });

  factory AnalyticsUtteranceAttributeResult.fromJson(
      Map<String, dynamic> json) {
    return AnalyticsUtteranceAttributeResult(
      lastUsedIntent: json['lastUsedIntent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUsedIntent = this.lastUsedIntent;
    return {
      if (lastUsedIntent != null) 'lastUsedIntent': lastUsedIntent,
    };
  }
}

enum AnalyticsUtteranceField {
  utteranceText,
  utteranceState,
}

extension AnalyticsUtteranceFieldValueExtension on AnalyticsUtteranceField {
  String toValue() {
    switch (this) {
      case AnalyticsUtteranceField.utteranceText:
        return 'UtteranceText';
      case AnalyticsUtteranceField.utteranceState:
        return 'UtteranceState';
    }
  }
}

extension AnalyticsUtteranceFieldFromString on String {
  AnalyticsUtteranceField toAnalyticsUtteranceField() {
    switch (this) {
      case 'UtteranceText':
        return AnalyticsUtteranceField.utteranceText;
      case 'UtteranceState':
        return AnalyticsUtteranceField.utteranceState;
    }
    throw Exception('$this is not known in enum AnalyticsUtteranceField');
  }
}

/// Contains fields describing a condition by which to filter the utterances.
/// The expression may be understood as <code>name</code> <code>operator</code>
/// <code>values</code>. For example:
///
/// <ul>
/// <li>
/// <code>LocaleId EQ Book</code> – The locale is the string "en".
/// </li>
/// <li>
/// <code>UtteranceText CO help</code> – The text of the utterance contains the
/// string "help".
/// </li>
/// </ul>
/// The operators that each filter supports are listed below:
///
/// <ul>
/// <li>
/// <code>BotAlias</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>BotVersion</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>LocaleId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>Modality</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>Channel</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>SessionId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>OriginatingRequestId</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>UtteranceState</code> – <code>EQ</code>.
/// </li>
/// <li>
/// <code>UtteranceText</code> – <code>EQ</code>, <code>CO</code>.
/// </li>
/// </ul>
class AnalyticsUtteranceFilter {
  /// The category by which to filter the utterances. The descriptions for each
  /// option are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>BotAlias</code> – The name of the bot alias.
  /// </li>
  /// <li>
  /// <code>BotVersion</code> – The version of the bot.
  /// </li>
  /// <li>
  /// <code>LocaleId</code> – The locale of the bot.
  /// </li>
  /// <li>
  /// <code>Modality</code> – The modality of the session with the bot (audio,
  /// DTMF, or text).
  /// </li>
  /// <li>
  /// <code>Channel</code> – The channel that the bot is integrated with.
  /// </li>
  /// <li>
  /// <code>SessionId</code> – The identifier of the session with the bot.
  /// </li>
  /// <li>
  /// <code>OriginatingRequestId</code> – The identifier of the first request in a
  /// session.
  /// </li>
  /// <li>
  /// <code>UtteranceState</code> – The state of the utterance.
  /// </li>
  /// <li>
  /// <code>UtteranceText</code> – The text in the utterance.
  /// </li>
  /// </ul>
  final AnalyticsUtteranceFilterName name;

  /// The operation by which to filter the category. The following operations are
  /// possible:
  ///
  /// <ul>
  /// <li>
  /// <code>CO</code> – Contains
  /// </li>
  /// <li>
  /// <code>EQ</code> – Equals
  /// </li>
  /// <li>
  /// <code>GT</code> – Greater than
  /// </li>
  /// <li>
  /// <code>LT</code> – Less than
  /// </li>
  /// </ul>
  /// The operators that each filter supports are listed below:
  ///
  /// <ul>
  /// <li>
  /// <code>BotAlias</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>BotVersion</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>LocaleId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>Modality</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>Channel</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>SessionId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>OriginatingRequestId</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>UtteranceState</code> – <code>EQ</code>.
  /// </li>
  /// <li>
  /// <code>UtteranceText</code> – <code>EQ</code>, <code>CO</code>.
  /// </li>
  /// </ul>
  final AnalyticsFilterOperator operator;

  /// An array containing the values of the category by which to apply the
  /// operator to filter the results. You can provide multiple values if the
  /// operator is <code>EQ</code> or <code>CO</code>. If you provide multiple
  /// values, you filter for results that equal/contain any of the values. For
  /// example, if the <code>name</code>, <code>operator</code>, and
  /// <code>values</code> fields are <code>Modality</code>, <code>EQ</code>, and
  /// <code>[Speech, Text]</code>, the operation filters for results where the
  /// modality was either <code>Speech</code> or <code>Text</code>.
  final List<String> values;

  AnalyticsUtteranceFilter({
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

enum AnalyticsUtteranceFilterName {
  botAliasId,
  botVersion,
  localeId,
  modality,
  channel,
  sessionId,
  originatingRequestId,
  utteranceState,
  utteranceText,
}

extension AnalyticsUtteranceFilterNameValueExtension
    on AnalyticsUtteranceFilterName {
  String toValue() {
    switch (this) {
      case AnalyticsUtteranceFilterName.botAliasId:
        return 'BotAliasId';
      case AnalyticsUtteranceFilterName.botVersion:
        return 'BotVersion';
      case AnalyticsUtteranceFilterName.localeId:
        return 'LocaleId';
      case AnalyticsUtteranceFilterName.modality:
        return 'Modality';
      case AnalyticsUtteranceFilterName.channel:
        return 'Channel';
      case AnalyticsUtteranceFilterName.sessionId:
        return 'SessionId';
      case AnalyticsUtteranceFilterName.originatingRequestId:
        return 'OriginatingRequestId';
      case AnalyticsUtteranceFilterName.utteranceState:
        return 'UtteranceState';
      case AnalyticsUtteranceFilterName.utteranceText:
        return 'UtteranceText';
    }
  }
}

extension AnalyticsUtteranceFilterNameFromString on String {
  AnalyticsUtteranceFilterName toAnalyticsUtteranceFilterName() {
    switch (this) {
      case 'BotAliasId':
        return AnalyticsUtteranceFilterName.botAliasId;
      case 'BotVersion':
        return AnalyticsUtteranceFilterName.botVersion;
      case 'LocaleId':
        return AnalyticsUtteranceFilterName.localeId;
      case 'Modality':
        return AnalyticsUtteranceFilterName.modality;
      case 'Channel':
        return AnalyticsUtteranceFilterName.channel;
      case 'SessionId':
        return AnalyticsUtteranceFilterName.sessionId;
      case 'OriginatingRequestId':
        return AnalyticsUtteranceFilterName.originatingRequestId;
      case 'UtteranceState':
        return AnalyticsUtteranceFilterName.utteranceState;
      case 'UtteranceText':
        return AnalyticsUtteranceFilterName.utteranceText;
    }
    throw Exception('$this is not known in enum AnalyticsUtteranceFilterName');
  }
}

/// Contains the category by which the utterance analytics were grouped and the
/// values for that category.
class AnalyticsUtteranceGroupByKey {
  /// The category by which the utterance analytics were grouped.
  final AnalyticsUtteranceField? name;

  /// A member of the category by which the utterance analytics were grouped.
  final String? value;

  AnalyticsUtteranceGroupByKey({
    this.name,
    this.value,
  });

  factory AnalyticsUtteranceGroupByKey.fromJson(Map<String, dynamic> json) {
    return AnalyticsUtteranceGroupByKey(
      name: (json['name'] as String?)?.toAnalyticsUtteranceField(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// Contains the category by which to group the utterances.
class AnalyticsUtteranceGroupBySpecification {
  /// Specifies whether to group the utterances by their text or their state.
  final AnalyticsUtteranceField name;

  AnalyticsUtteranceGroupBySpecification({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name.toValue(),
    };
  }
}

/// Contains the metric and the summary statistic you want to calculate, and the
/// order in which to sort the results, for the utterances across the user
/// sessions with the bot.
class AnalyticsUtteranceMetric {
  /// The metric for which you want to get utterance summary statistics.
  ///
  /// <ul>
  /// <li>
  /// <code>Count</code> – The number of utterances.
  /// </li>
  /// <li>
  /// <code>Missed</code> – The number of utterances that Amazon Lex failed to
  /// recognize.
  /// </li>
  /// <li>
  /// <code>Detected</code> – The number of utterances that Amazon Lex managed to
  /// detect.
  /// </li>
  /// <li>
  /// <code>UtteranceTimestamp</code> – The date and time of the utterance.
  /// </li>
  /// </ul>
  final AnalyticsUtteranceMetricName name;

  /// The summary statistic to calculate.
  ///
  /// <ul>
  /// <li>
  /// <code>Sum</code> – The total count for the category you provide in
  /// <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Average</code> – The total count divided by the number of utterances
  /// in the category you provide in <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Max</code> – The highest count in the category you provide in
  /// <code>name</code>.
  /// </li>
  /// </ul>
  final AnalyticsMetricStatistic statistic;

  /// Specifies whether to sort the results in ascending or descending order.
  final AnalyticsSortOrder? order;

  AnalyticsUtteranceMetric({
    required this.name,
    required this.statistic,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final statistic = this.statistic;
    final order = this.order;
    return {
      'name': name.toValue(),
      'statistic': statistic.toValue(),
      if (order != null) 'order': order.toValue(),
    };
  }
}

enum AnalyticsUtteranceMetricName {
  count,
  missed,
  detected,
  utteranceTimestamp,
}

extension AnalyticsUtteranceMetricNameValueExtension
    on AnalyticsUtteranceMetricName {
  String toValue() {
    switch (this) {
      case AnalyticsUtteranceMetricName.count:
        return 'Count';
      case AnalyticsUtteranceMetricName.missed:
        return 'Missed';
      case AnalyticsUtteranceMetricName.detected:
        return 'Detected';
      case AnalyticsUtteranceMetricName.utteranceTimestamp:
        return 'UtteranceTimestamp';
    }
  }
}

extension AnalyticsUtteranceMetricNameFromString on String {
  AnalyticsUtteranceMetricName toAnalyticsUtteranceMetricName() {
    switch (this) {
      case 'Count':
        return AnalyticsUtteranceMetricName.count;
      case 'Missed':
        return AnalyticsUtteranceMetricName.missed;
      case 'Detected':
        return AnalyticsUtteranceMetricName.detected;
      case 'UtteranceTimestamp':
        return AnalyticsUtteranceMetricName.utteranceTimestamp;
    }
    throw Exception('$this is not known in enum AnalyticsUtteranceMetricName');
  }
}

/// An object containing the results for the utterance metric you requested.
class AnalyticsUtteranceMetricResult {
  /// The metric that you requested.
  ///
  /// <ul>
  /// <li>
  /// <code>Count</code> – The number of utterances.
  /// </li>
  /// <li>
  /// <code>Missed</code> – The number of utterances that Amazon Lex failed to
  /// recognize.
  /// </li>
  /// <li>
  /// <code>Detected</code> – The number of utterances that Amazon Lex managed to
  /// detect.
  /// </li>
  /// <li>
  /// <code>UtteranceTimestamp</code> – The date and time of the utterance.
  /// </li>
  /// </ul>
  final AnalyticsUtteranceMetricName? name;

  /// The summary statistic that you requested to calculate.
  ///
  /// <ul>
  /// <li>
  /// <code>Sum</code> – The total count for the category you provide in
  /// <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Average</code> – The total count divided by the number of utterances
  /// in the category you provide in <code>name</code>.
  /// </li>
  /// <li>
  /// <code>Max</code> – The highest count in the category you provide in
  /// <code>name</code>.
  /// </li>
  /// </ul>
  final AnalyticsMetricStatistic? statistic;

  /// The value of the summary statistic for the metric that you requested.
  final double? value;

  AnalyticsUtteranceMetricResult({
    this.name,
    this.statistic,
    this.value,
  });

  factory AnalyticsUtteranceMetricResult.fromJson(Map<String, dynamic> json) {
    return AnalyticsUtteranceMetricResult(
      name: (json['name'] as String?)?.toAnalyticsUtteranceMetricName(),
      statistic: (json['statistic'] as String?)?.toAnalyticsMetricStatistic(),
      value: json['value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final statistic = this.statistic;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (statistic != null) 'statistic': statistic.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// An object containing the results for the utterance metrics you requested and
/// the bin and/or group(s) they refer to, if applicable.
class AnalyticsUtteranceResult {
  /// A list of objects containing information about the last used intent at the
  /// time of an utterance.
  final List<AnalyticsUtteranceAttributeResult>? attributeResults;

  /// A list of objects containing the criteria you requested for binning results
  /// and the values of the bins.
  final List<AnalyticsBinKey>? binKeys;

  /// A list of objects containing the criteria you requested for grouping results
  /// and the values of the bins.
  final List<AnalyticsUtteranceGroupByKey>? groupByKeys;

  /// A list of objects, each of which contains a metric you want to list, the
  /// statistic for the metric you want to return, and the method by which to
  /// organize the results.
  final List<AnalyticsUtteranceMetricResult>? metricsResults;

  AnalyticsUtteranceResult({
    this.attributeResults,
    this.binKeys,
    this.groupByKeys,
    this.metricsResults,
  });

  factory AnalyticsUtteranceResult.fromJson(Map<String, dynamic> json) {
    return AnalyticsUtteranceResult(
      attributeResults: (json['attributeResults'] as List?)
          ?.whereNotNull()
          .map((e) => AnalyticsUtteranceAttributeResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      binKeys: (json['binKeys'] as List?)
          ?.whereNotNull()
          .map((e) => AnalyticsBinKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupByKeys: (json['groupByKeys'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AnalyticsUtteranceGroupByKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricsResults: (json['metricsResults'] as List?)
          ?.whereNotNull()
          .map((e) => AnalyticsUtteranceMetricResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeResults = this.attributeResults;
    final binKeys = this.binKeys;
    final groupByKeys = this.groupByKeys;
    final metricsResults = this.metricsResults;
    return {
      if (attributeResults != null) 'attributeResults': attributeResults,
      if (binKeys != null) 'binKeys': binKeys,
      if (groupByKeys != null) 'groupByKeys': groupByKeys,
      if (metricsResults != null) 'metricsResults': metricsResults,
    };
  }
}

enum AnalyticsUtteranceSortByName {
  utteranceTimestamp,
}

extension AnalyticsUtteranceSortByNameValueExtension
    on AnalyticsUtteranceSortByName {
  String toValue() {
    switch (this) {
      case AnalyticsUtteranceSortByName.utteranceTimestamp:
        return 'UtteranceTimestamp';
    }
  }
}

extension AnalyticsUtteranceSortByNameFromString on String {
  AnalyticsUtteranceSortByName toAnalyticsUtteranceSortByName() {
    switch (this) {
      case 'UtteranceTimestamp':
        return AnalyticsUtteranceSortByName.utteranceTimestamp;
    }
    throw Exception('$this is not known in enum AnalyticsUtteranceSortByName');
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

  /// The option to enable selective conversation log capture for audio.
  final bool? selectiveLoggingEnabled;

  AudioLogSetting({
    required this.destination,
    required this.enabled,
    this.selectiveLoggingEnabled,
  });

  factory AudioLogSetting.fromJson(Map<String, dynamic> json) {
    return AudioLogSetting(
      destination: AudioLogDestination.fromJson(
          json['destination'] as Map<String, dynamic>),
      enabled: json['enabled'] as bool,
      selectiveLoggingEnabled: json['selectiveLoggingEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final enabled = this.enabled;
    final selectiveLoggingEnabled = this.selectiveLoggingEnabled;
    return {
      'destination': destination,
      'enabled': enabled,
      if (selectiveLoggingEnabled != null)
        'selectiveLoggingEnabled': selectiveLoggingEnabled,
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

/// Contains details about the configuration of a Amazon Bedrock knowledge base.
class BedrockKnowledgeStoreConfiguration {
  /// The ARN of the knowledge base used.
  final String bedrockKnowledgeBaseArn;

  BedrockKnowledgeStoreConfiguration({
    required this.bedrockKnowledgeBaseArn,
  });

  factory BedrockKnowledgeStoreConfiguration.fromJson(
      Map<String, dynamic> json) {
    return BedrockKnowledgeStoreConfiguration(
      bedrockKnowledgeBaseArn: json['bedrockKnowledgeBaseArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bedrockKnowledgeBaseArn = this.bedrockKnowledgeBaseArn;
    return {
      'bedrockKnowledgeBaseArn': bedrockKnowledgeBaseArn,
    };
  }
}

/// Contains information about the Amazon Bedrock model used to interpret the
/// prompt used in descriptive bot building.
class BedrockModelSpecification {
  /// The ARN of the foundation model used in descriptive bot building.
  final String modelArn;

  BedrockModelSpecification({
    required this.modelArn,
  });

  factory BedrockModelSpecification.fromJson(Map<String, dynamic> json) {
    return BedrockModelSpecification(
      modelArn: json['modelArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    return {
      'modelArn': modelArn,
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

/// Contains information about all the aliases replication statuses applicable
/// for global resiliency.
class BotAliasReplicaSummary {
  /// The bot alias ID for all the alias bot replications.
  final String? botAliasId;

  /// The replication statuses for all the alias bot replications.
  final BotAliasReplicationStatus? botAliasReplicationStatus;

  /// The bot version for all the alias bot replications.
  final String? botVersion;

  /// The creation time and date for all the alias bot replications.
  final DateTime? creationDateTime;

  /// The reasons for failure for the aliases bot replications.
  final List<String>? failureReasons;

  /// The last time and date updated for all the alias bot replications.
  final DateTime? lastUpdatedDateTime;

  BotAliasReplicaSummary({
    this.botAliasId,
    this.botAliasReplicationStatus,
    this.botVersion,
    this.creationDateTime,
    this.failureReasons,
    this.lastUpdatedDateTime,
  });

  factory BotAliasReplicaSummary.fromJson(Map<String, dynamic> json) {
    return BotAliasReplicaSummary(
      botAliasId: json['botAliasId'] as String?,
      botAliasReplicationStatus: (json['botAliasReplicationStatus'] as String?)
          ?.toBotAliasReplicationStatus(),
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasId = this.botAliasId;
    final botAliasReplicationStatus = this.botAliasReplicationStatus;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final failureReasons = this.failureReasons;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    return {
      if (botAliasId != null) 'botAliasId': botAliasId,
      if (botAliasReplicationStatus != null)
        'botAliasReplicationStatus': botAliasReplicationStatus.toValue(),
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
    };
  }
}

/// The status of the operation to replicate the bot alias. Values: Creating,
/// Updating, Available, Deleting, Failed.
enum BotAliasReplicationStatus {
  creating,
  updating,
  available,
  deleting,
  failed,
}

extension BotAliasReplicationStatusValueExtension on BotAliasReplicationStatus {
  String toValue() {
    switch (this) {
      case BotAliasReplicationStatus.creating:
        return 'Creating';
      case BotAliasReplicationStatus.updating:
        return 'Updating';
      case BotAliasReplicationStatus.available:
        return 'Available';
      case BotAliasReplicationStatus.deleting:
        return 'Deleting';
      case BotAliasReplicationStatus.failed:
        return 'Failed';
    }
  }
}

extension BotAliasReplicationStatusFromString on String {
  BotAliasReplicationStatus toBotAliasReplicationStatus() {
    switch (this) {
      case 'Creating':
        return BotAliasReplicationStatus.creating;
      case 'Updating':
        return BotAliasReplicationStatus.updating;
      case 'Available':
        return BotAliasReplicationStatus.available;
      case 'Deleting':
        return BotAliasReplicationStatus.deleting;
      case 'Failed':
        return BotAliasReplicationStatus.failed;
    }
    throw Exception('$this is not known in enum BotAliasReplicationStatus');
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

/// The target Amazon S3 location for the test set execution using a bot alias.
class BotAliasTestExecutionTarget {
  /// The bot alias Id of the bot alias used in the test set execution.
  final String botAliasId;

  /// The bot Id of the bot alias used in the test set execution.
  final String botId;

  /// The locale Id of the bot alias used in the test set execution.
  final String localeId;

  BotAliasTestExecutionTarget({
    required this.botAliasId,
    required this.botId,
    required this.localeId,
  });

  factory BotAliasTestExecutionTarget.fromJson(Map<String, dynamic> json) {
    return BotAliasTestExecutionTarget(
      botAliasId: json['botAliasId'] as String,
      botId: json['botId'] as String,
      localeId: json['localeId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasId = this.botAliasId;
    final botId = this.botId;
    final localeId = this.localeId;
    return {
      'botAliasId': botAliasId,
      'botId': botId,
      'localeId': localeId,
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

/// The status of the operation to replicate the bot. Values: Enabling, Enabled,
/// Deleting, Failed.
enum BotReplicaStatus {
  enabling,
  enabled,
  deleting,
  failed,
}

extension BotReplicaStatusValueExtension on BotReplicaStatus {
  String toValue() {
    switch (this) {
      case BotReplicaStatus.enabling:
        return 'Enabling';
      case BotReplicaStatus.enabled:
        return 'Enabled';
      case BotReplicaStatus.deleting:
        return 'Deleting';
      case BotReplicaStatus.failed:
        return 'Failed';
    }
  }
}

extension BotReplicaStatusFromString on String {
  BotReplicaStatus toBotReplicaStatus() {
    switch (this) {
      case 'Enabling':
        return BotReplicaStatus.enabling;
      case 'Enabled':
        return BotReplicaStatus.enabled;
      case 'Deleting':
        return BotReplicaStatus.deleting;
      case 'Failed':
        return BotReplicaStatus.failed;
    }
    throw Exception('$this is not known in enum BotReplicaStatus');
  }
}

/// Contains summary information about all the replication statuses applicable
/// for global resiliency.
class BotReplicaSummary {
  /// The operation status for the replicated bot applicable.
  final BotReplicaStatus? botReplicaStatus;

  /// The creation time and date for the replicated bots.
  final DateTime? creationDateTime;

  /// The reasons for the failure for the replicated bot.
  final List<String>? failureReasons;

  /// The replica region used in the replication statuses summary.
  final String? replicaRegion;

  BotReplicaSummary({
    this.botReplicaStatus,
    this.creationDateTime,
    this.failureReasons,
    this.replicaRegion,
  });

  factory BotReplicaSummary.fromJson(Map<String, dynamic> json) {
    return BotReplicaSummary(
      botReplicaStatus:
          (json['botReplicaStatus'] as String?)?.toBotReplicaStatus(),
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      replicaRegion: json['replicaRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botReplicaStatus = this.botReplicaStatus;
    final creationDateTime = this.creationDateTime;
    final failureReasons = this.failureReasons;
    final replicaRegion = this.replicaRegion;
    return {
      if (botReplicaStatus != null)
        'botReplicaStatus': botReplicaStatus.toValue(),
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (replicaRegion != null) 'replicaRegion': replicaRegion,
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

enum BotVersionReplicaSortAttribute {
  botVersion,
}

extension BotVersionReplicaSortAttributeValueExtension
    on BotVersionReplicaSortAttribute {
  String toValue() {
    switch (this) {
      case BotVersionReplicaSortAttribute.botVersion:
        return 'BotVersion';
    }
  }
}

extension BotVersionReplicaSortAttributeFromString on String {
  BotVersionReplicaSortAttribute toBotVersionReplicaSortAttribute() {
    switch (this) {
      case 'BotVersion':
        return BotVersionReplicaSortAttribute.botVersion;
    }
    throw Exception(
        '$this is not known in enum BotVersionReplicaSortAttribute');
  }
}

/// The sort category for the version replicated bots.
class BotVersionReplicaSortBy {
  /// The attribute of the sort category for the version replicated bots.
  final BotVersionReplicaSortAttribute attribute;

  /// The order of the sort category for the version replicated bots.
  final SortOrder order;

  BotVersionReplicaSortBy({
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

/// Contains summary information for all the version replication statuses
/// applicable for Global resiliency.
class BotVersionReplicaSummary {
  /// The bot version for the summary information for all the version replication
  /// statuses.
  final String? botVersion;

  /// The version replication status for all the replicated bots.
  final BotVersionReplicationStatus? botVersionReplicationStatus;

  /// The creation date and time of the replication status for all the replicated
  /// bots.
  final DateTime? creationDateTime;

  /// The reasons for replication failure for all the replicated bots.
  final List<String>? failureReasons;

  BotVersionReplicaSummary({
    this.botVersion,
    this.botVersionReplicationStatus,
    this.creationDateTime,
    this.failureReasons,
  });

  factory BotVersionReplicaSummary.fromJson(Map<String, dynamic> json) {
    return BotVersionReplicaSummary(
      botVersion: json['botVersion'] as String?,
      botVersionReplicationStatus:
          (json['botVersionReplicationStatus'] as String?)
              ?.toBotVersionReplicationStatus(),
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botVersion = this.botVersion;
    final botVersionReplicationStatus = this.botVersionReplicationStatus;
    final creationDateTime = this.creationDateTime;
    final failureReasons = this.failureReasons;
    return {
      if (botVersion != null) 'botVersion': botVersion,
      if (botVersionReplicationStatus != null)
        'botVersionReplicationStatus': botVersionReplicationStatus.toValue(),
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReasons != null) 'failureReasons': failureReasons,
    };
  }
}

/// The status of the operation to replicate the bot version. Values: Creating,
/// Available, Deleting, Failed.
enum BotVersionReplicationStatus {
  creating,
  available,
  deleting,
  failed,
}

extension BotVersionReplicationStatusValueExtension
    on BotVersionReplicationStatus {
  String toValue() {
    switch (this) {
      case BotVersionReplicationStatus.creating:
        return 'Creating';
      case BotVersionReplicationStatus.available:
        return 'Available';
      case BotVersionReplicationStatus.deleting:
        return 'Deleting';
      case BotVersionReplicationStatus.failed:
        return 'Failed';
    }
  }
}

extension BotVersionReplicationStatusFromString on String {
  BotVersionReplicationStatus toBotVersionReplicationStatus() {
    switch (this) {
      case 'Creating':
        return BotVersionReplicationStatus.creating;
      case 'Available':
        return BotVersionReplicationStatus.available;
      case 'Deleting':
        return BotVersionReplicationStatus.deleting;
      case 'Failed':
        return BotVersionReplicationStatus.failed;
    }
    throw Exception('$this is not known in enum BotVersionReplicationStatus');
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

/// Contains specifications about the Amazon Lex build time generative AI
/// capabilities from Amazon Bedrock that you can turn on for your bot.
class BuildtimeSettings {
  /// An object containing specifications for the descriptive bot building
  /// feature.
  final DescriptiveBotBuilderSpecification? descriptiveBotBuilder;

  /// Contains specifications for the sample utterance generation feature.
  final SampleUtteranceGenerationSpecification? sampleUtteranceGeneration;

  BuildtimeSettings({
    this.descriptiveBotBuilder,
    this.sampleUtteranceGeneration,
  });

  factory BuildtimeSettings.fromJson(Map<String, dynamic> json) {
    return BuildtimeSettings(
      descriptiveBotBuilder: json['descriptiveBotBuilder'] != null
          ? DescriptiveBotBuilderSpecification.fromJson(
              json['descriptiveBotBuilder'] as Map<String, dynamic>)
          : null,
      sampleUtteranceGeneration: json['sampleUtteranceGeneration'] != null
          ? SampleUtteranceGenerationSpecification.fromJson(
              json['sampleUtteranceGeneration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final descriptiveBotBuilder = this.descriptiveBotBuilder;
    final sampleUtteranceGeneration = this.sampleUtteranceGeneration;
    return {
      if (descriptiveBotBuilder != null)
        'descriptiveBotBuilder': descriptiveBotBuilder,
      if (sampleUtteranceGeneration != null)
        'sampleUtteranceGeneration': sampleUtteranceGeneration,
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

enum ConversationEndState {
  success,
  failure,
  dropped,
}

extension ConversationEndStateValueExtension on ConversationEndState {
  String toValue() {
    switch (this) {
      case ConversationEndState.success:
        return 'Success';
      case ConversationEndState.failure:
        return 'Failure';
      case ConversationEndState.dropped:
        return 'Dropped';
    }
  }
}

extension ConversationEndStateFromString on String {
  ConversationEndState toConversationEndState() {
    switch (this) {
      case 'Success':
        return ConversationEndState.success;
      case 'Failure':
        return ConversationEndState.failure;
      case 'Dropped':
        return ConversationEndState.dropped;
    }
    throw Exception('$this is not known in enum ConversationEndState');
  }
}

/// The item listing the evaluation of intent level success or failure.
class ConversationLevelIntentClassificationResultItem {
  /// The intent name used in the evaluation of intent level success or failure.
  final String intentName;

  /// The number of times the specific intent is used in the evaluation of intent
  /// level success or failure.
  final TestResultMatchStatus matchResult;

  ConversationLevelIntentClassificationResultItem({
    required this.intentName,
    required this.matchResult,
  });

  factory ConversationLevelIntentClassificationResultItem.fromJson(
      Map<String, dynamic> json) {
    return ConversationLevelIntentClassificationResultItem(
      intentName: json['intentName'] as String,
      matchResult: (json['matchResult'] as String).toTestResultMatchStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final intentName = this.intentName;
    final matchResult = this.matchResult;
    return {
      'intentName': intentName,
      'matchResult': matchResult.toValue(),
    };
  }
}

/// The conversation level details of the conversation used in the test set.
class ConversationLevelResultDetail {
  /// The success or failure of the streaming of the conversation.
  final TestResultMatchStatus endToEndResult;

  /// The speech transcription success or failure details of the conversation.
  final TestResultMatchStatus? speechTranscriptionResult;

  ConversationLevelResultDetail({
    required this.endToEndResult,
    this.speechTranscriptionResult,
  });

  factory ConversationLevelResultDetail.fromJson(Map<String, dynamic> json) {
    return ConversationLevelResultDetail(
      endToEndResult:
          (json['endToEndResult'] as String).toTestResultMatchStatus(),
      speechTranscriptionResult: (json['speechTranscriptionResult'] as String?)
          ?.toTestResultMatchStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final endToEndResult = this.endToEndResult;
    final speechTranscriptionResult = this.speechTranscriptionResult;
    return {
      'endToEndResult': endToEndResult.toValue(),
      if (speechTranscriptionResult != null)
        'speechTranscriptionResult': speechTranscriptionResult.toValue(),
    };
  }
}

/// The slots used for the slot resolution in the conversation.
class ConversationLevelSlotResolutionResultItem {
  /// The intents used in the slots list for the slot resolution details.
  final String intentName;

  /// The number of matching slots used in the slots listings for the slot
  /// resolution evaluation.
  final TestResultMatchStatus matchResult;

  /// The slot name in the slots list for the slot resolution details.
  final String slotName;

  ConversationLevelSlotResolutionResultItem({
    required this.intentName,
    required this.matchResult,
    required this.slotName,
  });

  factory ConversationLevelSlotResolutionResultItem.fromJson(
      Map<String, dynamic> json) {
    return ConversationLevelSlotResolutionResultItem(
      intentName: json['intentName'] as String,
      matchResult: (json['matchResult'] as String).toTestResultMatchStatus(),
      slotName: json['slotName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final intentName = this.intentName;
    final matchResult = this.matchResult;
    final slotName = this.slotName;
    return {
      'intentName': intentName,
      'matchResult': matchResult.toValue(),
      'slotName': slotName,
    };
  }
}

/// The test result evaluation item at the conversation level.
class ConversationLevelTestResultItem {
  /// The conversation Id of the test result evaluation item.
  final String conversationId;

  /// The end-to-end success or failure of the test result evaluation item.
  final TestResultMatchStatus endToEndResult;

  /// The intent classification of the test result evaluation item.
  final List<ConversationLevelIntentClassificationResultItem>
      intentClassificationResults;

  /// The slot success or failure of the test result evaluation item.
  final List<ConversationLevelSlotResolutionResultItem> slotResolutionResults;

  /// The speech transcription success or failure of the test result evaluation
  /// item.
  final TestResultMatchStatus? speechTranscriptionResult;

  ConversationLevelTestResultItem({
    required this.conversationId,
    required this.endToEndResult,
    required this.intentClassificationResults,
    required this.slotResolutionResults,
    this.speechTranscriptionResult,
  });

  factory ConversationLevelTestResultItem.fromJson(Map<String, dynamic> json) {
    return ConversationLevelTestResultItem(
      conversationId: json['conversationId'] as String,
      endToEndResult:
          (json['endToEndResult'] as String).toTestResultMatchStatus(),
      intentClassificationResults: (json['intentClassificationResults'] as List)
          .whereNotNull()
          .map((e) => ConversationLevelIntentClassificationResultItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      slotResolutionResults: (json['slotResolutionResults'] as List)
          .whereNotNull()
          .map((e) => ConversationLevelSlotResolutionResultItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      speechTranscriptionResult: (json['speechTranscriptionResult'] as String?)
          ?.toTestResultMatchStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final conversationId = this.conversationId;
    final endToEndResult = this.endToEndResult;
    final intentClassificationResults = this.intentClassificationResults;
    final slotResolutionResults = this.slotResolutionResults;
    final speechTranscriptionResult = this.speechTranscriptionResult;
    return {
      'conversationId': conversationId,
      'endToEndResult': endToEndResult.toValue(),
      'intentClassificationResults': intentClassificationResults,
      'slotResolutionResults': slotResolutionResults,
      if (speechTranscriptionResult != null)
        'speechTranscriptionResult': speechTranscriptionResult.toValue(),
    };
  }
}

/// The test set results data at the conversation level.
class ConversationLevelTestResults {
  /// The item list in the test set results data at the conversation level.
  final List<ConversationLevelTestResultItem> items;

  ConversationLevelTestResults({
    required this.items,
  });

  factory ConversationLevelTestResults.fromJson(Map<String, dynamic> json) {
    return ConversationLevelTestResults(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => ConversationLevelTestResultItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    return {
      'items': items,
    };
  }
}

/// The selection to filter the test set results data at the conversation level.
class ConversationLevelTestResultsFilterBy {
  /// The selection of matched or mismatched end-to-end status to filter test set
  /// results data at the conversation level.
  final TestResultMatchStatus? endToEndResult;

  ConversationLevelTestResultsFilterBy({
    this.endToEndResult,
  });

  Map<String, dynamic> toJson() {
    final endToEndResult = this.endToEndResult;
    return {
      if (endToEndResult != null) 'endToEndResult': endToEndResult.toValue(),
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

/// The data source that uses conversation logs.
class ConversationLogsDataSource {
  /// The bot alias Id from the conversation logs.
  final String botAliasId;

  /// The bot Id from the conversation logs.
  final String botId;

  /// The filter for the data source of the conversation log.
  final ConversationLogsDataSourceFilterBy filter;

  /// The locale Id of the conversation log.
  final String localeId;

  ConversationLogsDataSource({
    required this.botAliasId,
    required this.botId,
    required this.filter,
    required this.localeId,
  });

  factory ConversationLogsDataSource.fromJson(Map<String, dynamic> json) {
    return ConversationLogsDataSource(
      botAliasId: json['botAliasId'] as String,
      botId: json['botId'] as String,
      filter: ConversationLogsDataSourceFilterBy.fromJson(
          json['filter'] as Map<String, dynamic>),
      localeId: json['localeId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasId = this.botAliasId;
    final botId = this.botId;
    final filter = this.filter;
    final localeId = this.localeId;
    return {
      'botAliasId': botAliasId,
      'botId': botId,
      'filter': filter,
      'localeId': localeId,
    };
  }
}

/// The selected data source to filter the conversation log.
class ConversationLogsDataSourceFilterBy {
  /// The end time for the conversation log.
  final DateTime endTime;

  /// The selection to filter by input mode for the conversation logs.
  final ConversationLogsInputModeFilter inputMode;

  /// The start time for the conversation log.
  final DateTime startTime;

  ConversationLogsDataSourceFilterBy({
    required this.endTime,
    required this.inputMode,
    required this.startTime,
  });

  factory ConversationLogsDataSourceFilterBy.fromJson(
      Map<String, dynamic> json) {
    return ConversationLogsDataSourceFilterBy(
      endTime: nonNullableTimeStampFromJson(json['endTime'] as Object),
      inputMode:
          (json['inputMode'] as String).toConversationLogsInputModeFilter(),
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final inputMode = this.inputMode;
    final startTime = this.startTime;
    return {
      'endTime': unixTimestampToJson(endTime),
      'inputMode': inputMode.toValue(),
      'startTime': unixTimestampToJson(startTime),
    };
  }
}

enum ConversationLogsInputModeFilter {
  speech,
  text,
}

extension ConversationLogsInputModeFilterValueExtension
    on ConversationLogsInputModeFilter {
  String toValue() {
    switch (this) {
      case ConversationLogsInputModeFilter.speech:
        return 'Speech';
      case ConversationLogsInputModeFilter.text:
        return 'Text';
    }
  }
}

extension ConversationLogsInputModeFilterFromString on String {
  ConversationLogsInputModeFilter toConversationLogsInputModeFilter() {
    switch (this) {
      case 'Speech':
        return ConversationLogsInputModeFilter.speech;
      case 'Text':
        return ConversationLogsInputModeFilter.text;
    }
    throw Exception(
        '$this is not known in enum ConversationLogsInputModeFilter');
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
  final GenerativeAISettings? generativeAISettings;

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
    this.generativeAISettings,
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
      generativeAISettings: json['generativeAISettings'] != null
          ? GenerativeAISettings.fromJson(
              json['generativeAISettings'] as Map<String, dynamic>)
          : null,
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
    final generativeAISettings = this.generativeAISettings;
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
      if (generativeAISettings != null)
        'generativeAISettings': generativeAISettings,
      if (localeId != null) 'localeId': localeId,
      if (localeName != null) 'localeName': localeName,
      if (nluIntentConfidenceThreshold != null)
        'nluIntentConfidenceThreshold': nluIntentConfidenceThreshold,
      if (voiceSettings != null) 'voiceSettings': voiceSettings,
    };
  }
}

class CreateBotReplicaResponse {
  /// The unique bot ID of the replicated bot generated.
  final String? botId;

  /// The operational status of the replicated bot generated.
  final BotReplicaStatus? botReplicaStatus;

  /// The creation date and time of the replicated bot generated.
  final DateTime? creationDateTime;

  /// The region of the replicated bot generated.
  final String? replicaRegion;

  /// The source region for the source bot used for the replicated bot generated.
  final String? sourceRegion;

  CreateBotReplicaResponse({
    this.botId,
    this.botReplicaStatus,
    this.creationDateTime,
    this.replicaRegion,
    this.sourceRegion,
  });

  factory CreateBotReplicaResponse.fromJson(Map<String, dynamic> json) {
    return CreateBotReplicaResponse(
      botId: json['botId'] as String?,
      botReplicaStatus:
          (json['botReplicaStatus'] as String?)?.toBotReplicaStatus(),
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      replicaRegion: json['replicaRegion'] as String?,
      sourceRegion: json['sourceRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botReplicaStatus = this.botReplicaStatus;
    final creationDateTime = this.creationDateTime;
    final replicaRegion = this.replicaRegion;
    final sourceRegion = this.sourceRegion;
    return {
      if (botId != null) 'botId': botId,
      if (botReplicaStatus != null)
        'botReplicaStatus': botReplicaStatus.toValue(),
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (replicaRegion != null) 'replicaRegion': replicaRegion,
      if (sourceRegion != null) 'sourceRegion': sourceRegion,
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

  /// The version of the bot associated with the intent.
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

  /// Details about the the configuration of the built-in
  /// <code>Amazon.QnAIntent</code>.
  final QnAIntentConfiguration? qnAIntentConfiguration;

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
    this.qnAIntentConfiguration,
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
      qnAIntentConfiguration: json['qnAIntentConfiguration'] != null
          ? QnAIntentConfiguration.fromJson(
              json['qnAIntentConfiguration'] as Map<String, dynamic>)
          : null,
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
    final qnAIntentConfiguration = this.qnAIntentConfiguration;
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
      if (qnAIntentConfiguration != null)
        'qnAIntentConfiguration': qnAIntentConfiguration,
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

class CreateTestSetDiscrepancyReportResponse {
  /// The creation date and time for the test set discrepancy report.
  final DateTime? creationDateTime;

  /// The target bot for the test set discrepancy report.
  final TestSetDiscrepancyReportResourceTarget? target;

  /// The unique identifier of the test set discrepancy report to describe.
  final String? testSetDiscrepancyReportId;

  /// The test set Id for the test set discrepancy report.
  final String? testSetId;

  CreateTestSetDiscrepancyReportResponse({
    this.creationDateTime,
    this.target,
    this.testSetDiscrepancyReportId,
    this.testSetId,
  });

  factory CreateTestSetDiscrepancyReportResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateTestSetDiscrepancyReportResponse(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      target: json['target'] != null
          ? TestSetDiscrepancyReportResourceTarget.fromJson(
              json['target'] as Map<String, dynamic>)
          : null,
      testSetDiscrepancyReportId: json['testSetDiscrepancyReportId'] as String?,
      testSetId: json['testSetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final target = this.target;
    final testSetDiscrepancyReportId = this.testSetDiscrepancyReportId;
    final testSetId = this.testSetId;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (target != null) 'target': target,
      if (testSetDiscrepancyReportId != null)
        'testSetDiscrepancyReportId': testSetDiscrepancyReportId,
      if (testSetId != null) 'testSetId': testSetId,
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
  /// href="http://aws.amazon.com/lex/faqs#data-security">Amazon Lex FAQ</a>.
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

/// Contains details about the configuration of the knowledge store used for the
/// <code>AMAZON.QnAIntent</code>. You must have already created the knowledge
/// store and indexed the documents within it.
class DataSourceConfiguration {
  /// Contains details about the configuration of the Amazon Bedrock knowledge
  /// base used for the <code>AMAZON.QnAIntent</code>. To set up a knowledge base,
  /// follow the steps at <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base.html">Building
  /// a knowledge base</a>.
  final BedrockKnowledgeStoreConfiguration? bedrockKnowledgeStoreConfiguration;

  /// Contains details about the configuration of the Amazon Kendra index used for
  /// the <code>AMAZON.QnAIntent</code>. To create a Amazon Kendra index, follow
  /// the steps at <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/create-index.html">Creating
  /// an index</a>.
  final QnAKendraConfiguration? kendraConfiguration;

  /// Contains details about the configuration of the Amazon OpenSearch Service
  /// database used for the <code>AMAZON.QnAIntent</code>. To create a domain,
  /// follow the steps at <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html">Creating
  /// and managing Amazon OpenSearch Service domains</a>.
  final OpensearchConfiguration? opensearchConfiguration;

  DataSourceConfiguration({
    this.bedrockKnowledgeStoreConfiguration,
    this.kendraConfiguration,
    this.opensearchConfiguration,
  });

  factory DataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return DataSourceConfiguration(
      bedrockKnowledgeStoreConfiguration:
          json['bedrockKnowledgeStoreConfiguration'] != null
              ? BedrockKnowledgeStoreConfiguration.fromJson(
                  json['bedrockKnowledgeStoreConfiguration']
                      as Map<String, dynamic>)
              : null,
      kendraConfiguration: json['kendraConfiguration'] != null
          ? QnAKendraConfiguration.fromJson(
              json['kendraConfiguration'] as Map<String, dynamic>)
          : null,
      opensearchConfiguration: json['opensearchConfiguration'] != null
          ? OpensearchConfiguration.fromJson(
              json['opensearchConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bedrockKnowledgeStoreConfiguration =
        this.bedrockKnowledgeStoreConfiguration;
    final kendraConfiguration = this.kendraConfiguration;
    final opensearchConfiguration = this.opensearchConfiguration;
    return {
      if (bedrockKnowledgeStoreConfiguration != null)
        'bedrockKnowledgeStoreConfiguration':
            bedrockKnowledgeStoreConfiguration,
      if (kendraConfiguration != null)
        'kendraConfiguration': kendraConfiguration,
      if (opensearchConfiguration != null)
        'opensearchConfiguration': opensearchConfiguration,
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

class DeleteBotReplicaResponse {
  /// The unique bot ID of the replicated bot generated.
  final String? botId;

  /// The operational status of the replicated bot generated.
  final BotReplicaStatus? botReplicaStatus;

  /// The region of the replicated bot generated.
  final String? replicaRegion;

  DeleteBotReplicaResponse({
    this.botId,
    this.botReplicaStatus,
    this.replicaRegion,
  });

  factory DeleteBotReplicaResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBotReplicaResponse(
      botId: json['botId'] as String?,
      botReplicaStatus:
          (json['botReplicaStatus'] as String?)?.toBotReplicaStatus(),
      replicaRegion: json['replicaRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botReplicaStatus = this.botReplicaStatus;
    final replicaRegion = this.replicaRegion;
    return {
      if (botId != null) 'botId': botId,
      if (botReplicaStatus != null)
        'botReplicaStatus': botReplicaStatus.toValue(),
      if (replicaRegion != null) 'replicaRegion': replicaRegion,
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

  /// The version of the bot associated with the locale.
  final String? botVersion;

  /// The date and time that the locale was created.
  final DateTime? creationDateTime;

  /// The description of the locale.
  final String? description;

  /// if <code>botLocaleStatus</code> is <code>Failed</code>, Amazon Lex explains
  /// why it failed to build the bot.
  final List<String>? failureReasons;

  /// Contains settings for Amazon Bedrock's generative AI features for your bot
  /// locale.
  final GenerativeAISettings? generativeAISettings;

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
    this.generativeAISettings,
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
      generativeAISettings: json['generativeAISettings'] != null
          ? GenerativeAISettings.fromJson(
              json['generativeAISettings'] as Map<String, dynamic>)
          : null,
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
    final generativeAISettings = this.generativeAISettings;
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
      if (generativeAISettings != null)
        'generativeAISettings': generativeAISettings,
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

class DescribeBotReplicaResponse {
  /// The unique bot ID of the replicated bot being monitored.
  final String? botId;

  /// The operational status of the replicated bot being monitored.
  final BotReplicaStatus? botReplicaStatus;

  /// The creation date and time of the replicated bot being monitored.
  final DateTime? creationDateTime;

  /// The failure reasons the bot being monitored failed to replicate.
  final List<String>? failureReasons;

  /// The region of the replicated bot being monitored.
  final String? replicaRegion;

  /// The source region of the replicated bot being monitored.
  final String? sourceRegion;

  DescribeBotReplicaResponse({
    this.botId,
    this.botReplicaStatus,
    this.creationDateTime,
    this.failureReasons,
    this.replicaRegion,
    this.sourceRegion,
  });

  factory DescribeBotReplicaResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBotReplicaResponse(
      botId: json['botId'] as String?,
      botReplicaStatus:
          (json['botReplicaStatus'] as String?)?.toBotReplicaStatus(),
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      replicaRegion: json['replicaRegion'] as String?,
      sourceRegion: json['sourceRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botReplicaStatus = this.botReplicaStatus;
    final creationDateTime = this.creationDateTime;
    final failureReasons = this.failureReasons;
    final replicaRegion = this.replicaRegion;
    final sourceRegion = this.sourceRegion;
    return {
      if (botId != null) 'botId': botId,
      if (botReplicaStatus != null)
        'botReplicaStatus': botReplicaStatus.toValue(),
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (replicaRegion != null) 'replicaRegion': replicaRegion,
      if (sourceRegion != null) 'sourceRegion': sourceRegion,
    };
  }
}

class DescribeBotResourceGenerationResponse {
  /// The unique identifier of the bot for which the generation request was made.
  final String? botId;

  /// The version of the bot for which the generation request was made.
  final String? botVersion;

  /// The date and time at which the item was generated.
  final DateTime? creationDateTime;

  /// A list of reasons why the generation of bot resources through natural
  /// language description failed.
  final List<String>? failureReasons;

  /// The Amazon S3 location of the generated bot locale configuration.
  final String? generatedBotLocaleUrl;

  /// The generation ID for which to return the generation details.
  final String? generationId;

  /// The prompt used in the generation request.
  final String? generationInputPrompt;

  /// The status of the generation request.
  final GenerationStatus? generationStatus;

  /// The date and time at which the generated item was updated.
  final DateTime? lastUpdatedDateTime;

  /// The locale of the bot for which the generation request was made.
  final String? localeId;

  /// The ARN of the model used to generate the bot resources.
  final String? modelArn;

  DescribeBotResourceGenerationResponse({
    this.botId,
    this.botVersion,
    this.creationDateTime,
    this.failureReasons,
    this.generatedBotLocaleUrl,
    this.generationId,
    this.generationInputPrompt,
    this.generationStatus,
    this.lastUpdatedDateTime,
    this.localeId,
    this.modelArn,
  });

  factory DescribeBotResourceGenerationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeBotResourceGenerationResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      generatedBotLocaleUrl: json['generatedBotLocaleUrl'] as String?,
      generationId: json['generationId'] as String?,
      generationInputPrompt: json['generationInputPrompt'] as String?,
      generationStatus:
          (json['generationStatus'] as String?)?.toGenerationStatus(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      localeId: json['localeId'] as String?,
      modelArn: json['modelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final failureReasons = this.failureReasons;
    final generatedBotLocaleUrl = this.generatedBotLocaleUrl;
    final generationId = this.generationId;
    final generationInputPrompt = this.generationInputPrompt;
    final generationStatus = this.generationStatus;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final localeId = this.localeId;
    final modelArn = this.modelArn;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (generatedBotLocaleUrl != null)
        'generatedBotLocaleUrl': generatedBotLocaleUrl,
      if (generationId != null) 'generationId': generationId,
      if (generationInputPrompt != null)
        'generationInputPrompt': generationInputPrompt,
      if (generationStatus != null)
        'generationStatus': generationStatus.toValue(),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (localeId != null) 'localeId': localeId,
      if (modelArn != null) 'modelArn': modelArn,
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

  /// Configuration setting for a response sent to the user before Amazon Lex
  /// starts eliciting slots.
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

  /// Details about the configuration of the built-in
  /// <code>Amazon.QnAIntent</code>.
  final QnAIntentConfiguration? qnAIntentConfiguration;

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
    this.qnAIntentConfiguration,
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
      qnAIntentConfiguration: json['qnAIntentConfiguration'] != null
          ? QnAIntentConfiguration.fromJson(
              json['qnAIntentConfiguration'] as Map<String, dynamic>)
          : null,
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
    final qnAIntentConfiguration = this.qnAIntentConfiguration;
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
      if (qnAIntentConfiguration != null)
        'qnAIntentConfiguration': qnAIntentConfiguration,
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

class DescribeTestExecutionResponse {
  /// Indicates whether we use streaming or non-streaming APIs are used for the
  /// test set execution. For streaming, <code>StartConversation</code> Amazon Lex
  /// Runtime API is used. Whereas for non-streaming,
  /// <code>RecognizeUtterance</code> and <code>RecognizeText</code> Amazon Lex
  /// Runtime API is used.
  final TestExecutionApiMode? apiMode;

  /// The execution creation date and time for the test set execution.
  final DateTime? creationDateTime;

  /// Reasons for the failure of the test set execution.
  final List<String>? failureReasons;

  /// The date and time of the last update for the execution.
  final DateTime? lastUpdatedDateTime;

  /// The target bot for the test set execution details.
  final TestExecutionTarget? target;

  /// The execution Id for the test set execution.
  final String? testExecutionId;

  /// Indicates whether test set is audio or text.
  final TestExecutionModality? testExecutionModality;

  /// The test execution status for the test execution.
  final TestExecutionStatus? testExecutionStatus;

  /// The test set Id for the test set execution.
  final String? testSetId;

  /// The test set name of the test set execution.
  final String? testSetName;

  DescribeTestExecutionResponse({
    this.apiMode,
    this.creationDateTime,
    this.failureReasons,
    this.lastUpdatedDateTime,
    this.target,
    this.testExecutionId,
    this.testExecutionModality,
    this.testExecutionStatus,
    this.testSetId,
    this.testSetName,
  });

  factory DescribeTestExecutionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTestExecutionResponse(
      apiMode: (json['apiMode'] as String?)?.toTestExecutionApiMode(),
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      target: json['target'] != null
          ? TestExecutionTarget.fromJson(json['target'] as Map<String, dynamic>)
          : null,
      testExecutionId: json['testExecutionId'] as String?,
      testExecutionModality:
          (json['testExecutionModality'] as String?)?.toTestExecutionModality(),
      testExecutionStatus:
          (json['testExecutionStatus'] as String?)?.toTestExecutionStatus(),
      testSetId: json['testSetId'] as String?,
      testSetName: json['testSetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiMode = this.apiMode;
    final creationDateTime = this.creationDateTime;
    final failureReasons = this.failureReasons;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final target = this.target;
    final testExecutionId = this.testExecutionId;
    final testExecutionModality = this.testExecutionModality;
    final testExecutionStatus = this.testExecutionStatus;
    final testSetId = this.testSetId;
    final testSetName = this.testSetName;
    return {
      if (apiMode != null) 'apiMode': apiMode.toValue(),
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (target != null) 'target': target,
      if (testExecutionId != null) 'testExecutionId': testExecutionId,
      if (testExecutionModality != null)
        'testExecutionModality': testExecutionModality.toValue(),
      if (testExecutionStatus != null)
        'testExecutionStatus': testExecutionStatus.toValue(),
      if (testSetId != null) 'testSetId': testSetId,
      if (testSetName != null) 'testSetName': testSetName,
    };
  }
}

class DescribeTestSetDiscrepancyReportResponse {
  /// The time and date of creation for the test set discrepancy report.
  final DateTime? creationDateTime;

  /// The failure report for the test set discrepancy report generation action.
  final List<String>? failureReasons;

  /// The date and time of the last update for the test set discrepancy report.
  final DateTime? lastUpdatedDataTime;

  /// The target bot location for the test set discrepancy report.
  final TestSetDiscrepancyReportResourceTarget? target;

  /// Pre-signed Amazon S3 URL to download the test set discrepancy report.
  final String? testSetDiscrepancyRawOutputUrl;

  /// The unique identifier of the test set discrepancy report to describe.
  final String? testSetDiscrepancyReportId;

  /// The status for the test set discrepancy report.
  final TestSetDiscrepancyReportStatus? testSetDiscrepancyReportStatus;

  /// The top 200 error results from the test set discrepancy report.
  final TestSetDiscrepancyErrors? testSetDiscrepancyTopErrors;

  /// The test set Id for the test set discrepancy report.
  final String? testSetId;

  DescribeTestSetDiscrepancyReportResponse({
    this.creationDateTime,
    this.failureReasons,
    this.lastUpdatedDataTime,
    this.target,
    this.testSetDiscrepancyRawOutputUrl,
    this.testSetDiscrepancyReportId,
    this.testSetDiscrepancyReportStatus,
    this.testSetDiscrepancyTopErrors,
    this.testSetId,
  });

  factory DescribeTestSetDiscrepancyReportResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeTestSetDiscrepancyReportResponse(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedDataTime: timeStampFromJson(json['lastUpdatedDataTime']),
      target: json['target'] != null
          ? TestSetDiscrepancyReportResourceTarget.fromJson(
              json['target'] as Map<String, dynamic>)
          : null,
      testSetDiscrepancyRawOutputUrl:
          json['testSetDiscrepancyRawOutputUrl'] as String?,
      testSetDiscrepancyReportId: json['testSetDiscrepancyReportId'] as String?,
      testSetDiscrepancyReportStatus:
          (json['testSetDiscrepancyReportStatus'] as String?)
              ?.toTestSetDiscrepancyReportStatus(),
      testSetDiscrepancyTopErrors: json['testSetDiscrepancyTopErrors'] != null
          ? TestSetDiscrepancyErrors.fromJson(
              json['testSetDiscrepancyTopErrors'] as Map<String, dynamic>)
          : null,
      testSetId: json['testSetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final failureReasons = this.failureReasons;
    final lastUpdatedDataTime = this.lastUpdatedDataTime;
    final target = this.target;
    final testSetDiscrepancyRawOutputUrl = this.testSetDiscrepancyRawOutputUrl;
    final testSetDiscrepancyReportId = this.testSetDiscrepancyReportId;
    final testSetDiscrepancyReportStatus = this.testSetDiscrepancyReportStatus;
    final testSetDiscrepancyTopErrors = this.testSetDiscrepancyTopErrors;
    final testSetId = this.testSetId;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (lastUpdatedDataTime != null)
        'lastUpdatedDataTime': unixTimestampToJson(lastUpdatedDataTime),
      if (target != null) 'target': target,
      if (testSetDiscrepancyRawOutputUrl != null)
        'testSetDiscrepancyRawOutputUrl': testSetDiscrepancyRawOutputUrl,
      if (testSetDiscrepancyReportId != null)
        'testSetDiscrepancyReportId': testSetDiscrepancyReportId,
      if (testSetDiscrepancyReportStatus != null)
        'testSetDiscrepancyReportStatus':
            testSetDiscrepancyReportStatus.toValue(),
      if (testSetDiscrepancyTopErrors != null)
        'testSetDiscrepancyTopErrors': testSetDiscrepancyTopErrors,
      if (testSetId != null) 'testSetId': testSetId,
    };
  }
}

class DescribeTestSetGenerationResponse {
  /// The creation date and time for the test set generation.
  final DateTime? creationDateTime;

  /// The test set description for the test set generation.
  final String? description;

  /// The reasons the test set generation failed.
  final List<String>? failureReasons;

  /// The data source of the test set used for the test set generation.
  final TestSetGenerationDataSource? generationDataSource;

  /// The date and time of the last update for the test set generation.
  final DateTime? lastUpdatedDateTime;

  /// The roleARN of the test set used for the test set generation.
  final String? roleArn;

  /// The Amazon S3 storage location for the test set generation.
  final TestSetStorageLocation? storageLocation;

  /// The unique identifier of the test set generation.
  final String? testSetGenerationId;

  /// The status for the test set generation.
  final TestSetGenerationStatus? testSetGenerationStatus;

  /// The unique identifier for the test set created for the generated test set.
  final String? testSetId;

  /// The test set name for the generated test set.
  final String? testSetName;

  DescribeTestSetGenerationResponse({
    this.creationDateTime,
    this.description,
    this.failureReasons,
    this.generationDataSource,
    this.lastUpdatedDateTime,
    this.roleArn,
    this.storageLocation,
    this.testSetGenerationId,
    this.testSetGenerationStatus,
    this.testSetId,
    this.testSetName,
  });

  factory DescribeTestSetGenerationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeTestSetGenerationResponse(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      generationDataSource: json['generationDataSource'] != null
          ? TestSetGenerationDataSource.fromJson(
              json['generationDataSource'] as Map<String, dynamic>)
          : null,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      roleArn: json['roleArn'] as String?,
      storageLocation: json['storageLocation'] != null
          ? TestSetStorageLocation.fromJson(
              json['storageLocation'] as Map<String, dynamic>)
          : null,
      testSetGenerationId: json['testSetGenerationId'] as String?,
      testSetGenerationStatus: (json['testSetGenerationStatus'] as String?)
          ?.toTestSetGenerationStatus(),
      testSetId: json['testSetId'] as String?,
      testSetName: json['testSetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final generationDataSource = this.generationDataSource;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final roleArn = this.roleArn;
    final storageLocation = this.storageLocation;
    final testSetGenerationId = this.testSetGenerationId;
    final testSetGenerationStatus = this.testSetGenerationStatus;
    final testSetId = this.testSetId;
    final testSetName = this.testSetName;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (generationDataSource != null)
        'generationDataSource': generationDataSource,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (roleArn != null) 'roleArn': roleArn,
      if (storageLocation != null) 'storageLocation': storageLocation,
      if (testSetGenerationId != null)
        'testSetGenerationId': testSetGenerationId,
      if (testSetGenerationStatus != null)
        'testSetGenerationStatus': testSetGenerationStatus.toValue(),
      if (testSetId != null) 'testSetId': testSetId,
      if (testSetName != null) 'testSetName': testSetName,
    };
  }
}

class DescribeTestSetResponse {
  /// The creation date and time for the test set data.
  final DateTime? creationDateTime;

  /// The description of the test set.
  final String? description;

  /// The date and time for the last update of the test set data.
  final DateTime? lastUpdatedDateTime;

  /// Indicates whether the test set is audio or text data.
  final TestSetModality? modality;

  /// The total number of agent and user turn in the test set.
  final int? numTurns;

  /// The roleARN used for any operation in the test set to access resources in
  /// the Amazon Web Services account.
  final String? roleArn;

  /// The status of the test set.
  final TestSetStatus? status;

  /// The Amazon S3 storage location for the test set data.
  final TestSetStorageLocation? storageLocation;

  /// The test set Id for the test set response.
  final String? testSetId;

  /// The test set name of the test set.
  final String? testSetName;

  DescribeTestSetResponse({
    this.creationDateTime,
    this.description,
    this.lastUpdatedDateTime,
    this.modality,
    this.numTurns,
    this.roleArn,
    this.status,
    this.storageLocation,
    this.testSetId,
    this.testSetName,
  });

  factory DescribeTestSetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTestSetResponse(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      modality: (json['modality'] as String?)?.toTestSetModality(),
      numTurns: json['numTurns'] as int?,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.toTestSetStatus(),
      storageLocation: json['storageLocation'] != null
          ? TestSetStorageLocation.fromJson(
              json['storageLocation'] as Map<String, dynamic>)
          : null,
      testSetId: json['testSetId'] as String?,
      testSetName: json['testSetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final modality = this.modality;
    final numTurns = this.numTurns;
    final roleArn = this.roleArn;
    final status = this.status;
    final storageLocation = this.storageLocation;
    final testSetId = this.testSetId;
    final testSetName = this.testSetName;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (modality != null) 'modality': modality.toValue(),
      if (numTurns != null) 'numTurns': numTurns,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.toValue(),
      if (storageLocation != null) 'storageLocation': storageLocation,
      if (testSetId != null) 'testSetId': testSetId,
      if (testSetName != null) 'testSetName': testSetName,
    };
  }
}

/// Contains specifications for the descriptive bot building feature.
class DescriptiveBotBuilderSpecification {
  /// Specifies whether the descriptive bot building feature is activated or not.
  final bool enabled;

  /// An object containing information about the Amazon Bedrock model used to
  /// interpret the prompt used in descriptive bot building.
  final BedrockModelSpecification? bedrockModelSpecification;

  DescriptiveBotBuilderSpecification({
    required this.enabled,
    this.bedrockModelSpecification,
  });

  factory DescriptiveBotBuilderSpecification.fromJson(
      Map<String, dynamic> json) {
    return DescriptiveBotBuilderSpecification(
      enabled: json['enabled'] as bool,
      bedrockModelSpecification: json['bedrockModelSpecification'] != null
          ? BedrockModelSpecification.fromJson(
              json['bedrockModelSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final bedrockModelSpecification = this.bedrockModelSpecification;
    return {
      'enabled': enabled,
      if (bedrockModelSpecification != null)
        'bedrockModelSpecification': bedrockModelSpecification,
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

/// Contains the names of the fields used for an exact response to the user.
class ExactResponseFields {
  /// The name of the field that contains the answer to the query made to the
  /// OpenSearch Service database.
  final String answerField;

  /// The name of the field that contains the query made to the OpenSearch Service
  /// database.
  final String questionField;

  ExactResponseFields({
    required this.answerField,
    required this.questionField,
  });

  factory ExactResponseFields.fromJson(Map<String, dynamic> json) {
    return ExactResponseFields(
      answerField: json['answerField'] as String,
      questionField: json['questionField'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final answerField = this.answerField;
    final questionField = this.questionField;
    return {
      'answerField': answerField,
      'questionField': questionField,
    };
  }
}

/// Details about an error in an execution of a test set.
class ExecutionErrorDetails {
  /// The error code for the error.
  final String errorCode;

  /// The message describing the error.
  final String errorMessage;

  ExecutionErrorDetails({
    required this.errorCode,
    required this.errorMessage,
  });

  factory ExecutionErrorDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionErrorDetails(
      errorCode: json['errorCode'] as String,
      errorMessage: json['errorMessage'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      'errorCode': errorCode,
      'errorMessage': errorMessage,
    };
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

  /// Specifications for the test set that is exported as a resource.
  final TestSetExportSpecification? testSetExportSpecification;

  ExportResourceSpecification({
    this.botExportSpecification,
    this.botLocaleExportSpecification,
    this.customVocabularyExportSpecification,
    this.testSetExportSpecification,
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
      testSetExportSpecification: json['testSetExportSpecification'] != null
          ? TestSetExportSpecification.fromJson(
              json['testSetExportSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botExportSpecification = this.botExportSpecification;
    final botLocaleExportSpecification = this.botLocaleExportSpecification;
    final customVocabularyExportSpecification =
        this.customVocabularyExportSpecification;
    final testSetExportSpecification = this.testSetExportSpecification;
    return {
      if (botExportSpecification != null)
        'botExportSpecification': botExportSpecification,
      if (botLocaleExportSpecification != null)
        'botLocaleExportSpecification': botLocaleExportSpecification,
      if (customVocabularyExportSpecification != null)
        'customVocabularyExportSpecification':
            customVocabularyExportSpecification,
      if (testSetExportSpecification != null)
        'testSetExportSpecification': testSetExportSpecification,
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

  /// 1 - 5 message groups that contain start messages. Amazon Lex chooses one of
  /// the messages to play to the user.
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

  /// 1 - 5 message groups that contain update messages. Amazon Lex chooses one of
  /// the messages to play to the user.
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

class GenerateBotElementResponse {
  /// The unique bot Id for the bot which received the response.
  final String? botId;

  /// The unique bot version for the bot which received the response.
  final String? botVersion;

  /// The unique intent Id for the bot which received the response.
  final String? intentId;

  /// The unique locale Id for the bot which received the response.
  final String? localeId;

  /// The sample utterances for the bot which received the response.
  final List<SampleUtterance>? sampleUtterances;

  GenerateBotElementResponse({
    this.botId,
    this.botVersion,
    this.intentId,
    this.localeId,
    this.sampleUtterances,
  });

  factory GenerateBotElementResponse.fromJson(Map<String, dynamic> json) {
    return GenerateBotElementResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      intentId: json['intentId'] as String?,
      localeId: json['localeId'] as String?,
      sampleUtterances: (json['sampleUtterances'] as List?)
          ?.whereNotNull()
          .map((e) => SampleUtterance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final intentId = this.intentId;
    final localeId = this.localeId;
    final sampleUtterances = this.sampleUtterances;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (intentId != null) 'intentId': intentId,
      if (localeId != null) 'localeId': localeId,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
    };
  }
}

/// Specifies the attribute and method by which to sort the generation request
/// information.
class GenerationSortBy {
  /// The attribute by which to sort the generation request information. You can
  /// sort by the following attributes.
  ///
  /// <ul>
  /// <li>
  /// <code>creationStartTime</code> – The time at which the generation request
  /// was created.
  /// </li>
  /// <li>
  /// <code>lastUpdatedTime</code> – The time at which the generation request was
  /// last updated.
  /// </li>
  /// </ul>
  final GenerationSortByAttribute attribute;

  /// The order by which to sort the generation request information.
  final SortOrder order;

  GenerationSortBy({
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

enum GenerationSortByAttribute {
  creationStartTime,
  lastUpdatedTime,
}

extension GenerationSortByAttributeValueExtension on GenerationSortByAttribute {
  String toValue() {
    switch (this) {
      case GenerationSortByAttribute.creationStartTime:
        return 'creationStartTime';
      case GenerationSortByAttribute.lastUpdatedTime:
        return 'lastUpdatedTime';
    }
  }
}

extension GenerationSortByAttributeFromString on String {
  GenerationSortByAttribute toGenerationSortByAttribute() {
    switch (this) {
      case 'creationStartTime':
        return GenerationSortByAttribute.creationStartTime;
      case 'lastUpdatedTime':
        return GenerationSortByAttribute.lastUpdatedTime;
    }
    throw Exception('$this is not known in enum GenerationSortByAttribute');
  }
}

enum GenerationStatus {
  failed,
  complete,
  inProgress,
}

extension GenerationStatusValueExtension on GenerationStatus {
  String toValue() {
    switch (this) {
      case GenerationStatus.failed:
        return 'Failed';
      case GenerationStatus.complete:
        return 'Complete';
      case GenerationStatus.inProgress:
        return 'InProgress';
    }
  }
}

extension GenerationStatusFromString on String {
  GenerationStatus toGenerationStatus() {
    switch (this) {
      case 'Failed':
        return GenerationStatus.failed;
      case 'Complete':
        return GenerationStatus.complete;
      case 'InProgress':
        return GenerationStatus.inProgress;
    }
    throw Exception('$this is not known in enum GenerationStatus');
  }
}

/// Contains information about a generation request made for the bot locale.
class GenerationSummary {
  /// The date and time at which the generation request was made.
  final DateTime? creationDateTime;

  /// The unique identifier of the generation request.
  final String? generationId;

  /// The status of the generation request.
  final GenerationStatus? generationStatus;

  /// The date and time at which the generation request was last updated.
  final DateTime? lastUpdatedDateTime;

  GenerationSummary({
    this.creationDateTime,
    this.generationId,
    this.generationStatus,
    this.lastUpdatedDateTime,
  });

  factory GenerationSummary.fromJson(Map<String, dynamic> json) {
    return GenerationSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      generationId: json['generationId'] as String?,
      generationStatus:
          (json['generationStatus'] as String?)?.toGenerationStatus(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final generationId = this.generationId;
    final generationStatus = this.generationStatus;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (generationId != null) 'generationId': generationId,
      if (generationStatus != null)
        'generationStatus': generationStatus.toValue(),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
    };
  }
}

/// Contains specifications about the generative AI capabilities from Amazon
/// Bedrock that you can turn on for your bot.
class GenerativeAISettings {
  final BuildtimeSettings? buildtimeSettings;
  final RuntimeSettings? runtimeSettings;

  GenerativeAISettings({
    this.buildtimeSettings,
    this.runtimeSettings,
  });

  factory GenerativeAISettings.fromJson(Map<String, dynamic> json) {
    return GenerativeAISettings(
      buildtimeSettings: json['buildtimeSettings'] != null
          ? BuildtimeSettings.fromJson(
              json['buildtimeSettings'] as Map<String, dynamic>)
          : null,
      runtimeSettings: json['runtimeSettings'] != null
          ? RuntimeSettings.fromJson(
              json['runtimeSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final buildtimeSettings = this.buildtimeSettings;
    final runtimeSettings = this.runtimeSettings;
    return {
      if (buildtimeSettings != null) 'buildtimeSettings': buildtimeSettings,
      if (runtimeSettings != null) 'runtimeSettings': runtimeSettings,
    };
  }
}

class GetTestExecutionArtifactsUrlResponse {
  /// The pre-signed Amazon S3 URL to download completed test execution.
  final String? downloadArtifactsUrl;

  /// The unique identifier of the completed test execution.
  final String? testExecutionId;

  GetTestExecutionArtifactsUrlResponse({
    this.downloadArtifactsUrl,
    this.testExecutionId,
  });

  factory GetTestExecutionArtifactsUrlResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTestExecutionArtifactsUrlResponse(
      downloadArtifactsUrl: json['downloadArtifactsUrl'] as String?,
      testExecutionId: json['testExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final downloadArtifactsUrl = this.downloadArtifactsUrl;
    final testExecutionId = this.testExecutionId;
    return {
      if (downloadArtifactsUrl != null)
        'downloadArtifactsUrl': downloadArtifactsUrl,
      if (testExecutionId != null) 'testExecutionId': testExecutionId,
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
  /// The name of the Amazon S3 bucket that contains the grammar source.
  final String s3BucketName;

  /// The path to the grammar in the Amazon S3 bucket.
  final String s3ObjectKey;

  /// The KMS key required to decrypt the contents of the grammar, if any.
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
  csv,
}

extension ImportExportFileFormatValueExtension on ImportExportFileFormat {
  String toValue() {
    switch (this) {
      case ImportExportFileFormat.lexJson:
        return 'LexJson';
      case ImportExportFileFormat.tsv:
        return 'TSV';
      case ImportExportFileFormat.csv:
        return 'CSV';
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
      case 'CSV':
        return ImportExportFileFormat.csv;
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

  /// Specifications for the test set that is imported.
  final TestSetImportResourceSpecification? testSetImportResourceSpecification;

  ImportResourceSpecification({
    this.botImportSpecification,
    this.botLocaleImportSpecification,
    this.customVocabularyImportSpecification,
    this.testSetImportResourceSpecification,
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
      testSetImportResourceSpecification:
          json['testSetImportResourceSpecification'] != null
              ? TestSetImportResourceSpecification.fromJson(
                  json['testSetImportResourceSpecification']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botImportSpecification = this.botImportSpecification;
    final botLocaleImportSpecification = this.botLocaleImportSpecification;
    final customVocabularyImportSpecification =
        this.customVocabularyImportSpecification;
    final testSetImportResourceSpecification =
        this.testSetImportResourceSpecification;
    return {
      if (botImportSpecification != null)
        'botImportSpecification': botImportSpecification,
      if (botLocaleImportSpecification != null)
        'botLocaleImportSpecification': botLocaleImportSpecification,
      if (customVocabularyImportSpecification != null)
        'customVocabularyImportSpecification':
            customVocabularyImportSpecification,
      if (testSetImportResourceSpecification != null)
        'testSetImportResourceSpecification':
            testSetImportResourceSpecification,
    };
  }
}

enum ImportResourceType {
  bot,
  botLocale,
  customVocabulary,
  testSet,
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
      case ImportResourceType.testSet:
        return 'TestSet';
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
      case 'TestSet':
        return ImportResourceType.testSet;
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

/// A context that must be active for an intent to be selected by Amazon Lex.
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

/// Specifications for the current state of the dialog between the user and the
/// bot in the test set.
class InputSessionStateSpecification {
  /// Active contexts for the session state.
  final List<ActiveContext>? activeContexts;

  /// Runtime hints for the session state.
  final RuntimeHints? runtimeHints;

  /// Session attributes for the session state.
  final Map<String, String>? sessionAttributes;

  InputSessionStateSpecification({
    this.activeContexts,
    this.runtimeHints,
    this.sessionAttributes,
  });

  factory InputSessionStateSpecification.fromJson(Map<String, dynamic> json) {
    return InputSessionStateSpecification(
      activeContexts: (json['activeContexts'] as List?)
          ?.whereNotNull()
          .map((e) => ActiveContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtimeHints: json['runtimeHints'] != null
          ? RuntimeHints.fromJson(json['runtimeHints'] as Map<String, dynamic>)
          : null,
      sessionAttributes: (json['sessionAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final activeContexts = this.activeContexts;
    final runtimeHints = this.runtimeHints;
    final sessionAttributes = this.sessionAttributes;
    return {
      if (activeContexts != null) 'activeContexts': activeContexts,
      if (runtimeHints != null) 'runtimeHints': runtimeHints,
      if (sessionAttributes != null) 'sessionAttributes': sessionAttributes,
    };
  }
}

/// Information for an intent that is classified by the test workbench.
class IntentClassificationTestResultItem {
  /// The name of the intent.
  final String intentName;

  /// Indicates whether the conversation involves multiple turns or not.
  final bool multiTurnConversation;

  /// The result of the intent classification test.
  final IntentClassificationTestResultItemCounts resultCounts;

  IntentClassificationTestResultItem({
    required this.intentName,
    required this.multiTurnConversation,
    required this.resultCounts,
  });

  factory IntentClassificationTestResultItem.fromJson(
      Map<String, dynamic> json) {
    return IntentClassificationTestResultItem(
      intentName: json['intentName'] as String,
      multiTurnConversation: json['multiTurnConversation'] as bool,
      resultCounts: IntentClassificationTestResultItemCounts.fromJson(
          json['resultCounts'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final intentName = this.intentName;
    final multiTurnConversation = this.multiTurnConversation;
    final resultCounts = this.resultCounts;
    return {
      'intentName': intentName,
      'multiTurnConversation': multiTurnConversation,
      'resultCounts': resultCounts,
    };
  }
}

/// The number of items in the intent classification test.
class IntentClassificationTestResultItemCounts {
  /// The number of matched and mismatched results for intent recognition for the
  /// intent.
  final Map<TestResultMatchStatus, int> intentMatchResultCounts;

  /// The total number of results in the intent classification test.
  final int totalResultCount;

  /// The number of matched, mismatched, and execution error results for speech
  /// transcription for the intent.
  final Map<TestResultMatchStatus, int>? speechTranscriptionResultCounts;

  IntentClassificationTestResultItemCounts({
    required this.intentMatchResultCounts,
    required this.totalResultCount,
    this.speechTranscriptionResultCounts,
  });

  factory IntentClassificationTestResultItemCounts.fromJson(
      Map<String, dynamic> json) {
    return IntentClassificationTestResultItemCounts(
      intentMatchResultCounts:
          (json['intentMatchResultCounts'] as Map<String, dynamic>)
              .map((k, e) => MapEntry(k.toTestResultMatchStatus(), e as int)),
      totalResultCount: json['totalResultCount'] as int,
      speechTranscriptionResultCounts:
          (json['speechTranscriptionResultCounts'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toTestResultMatchStatus(), e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final intentMatchResultCounts = this.intentMatchResultCounts;
    final totalResultCount = this.totalResultCount;
    final speechTranscriptionResultCounts =
        this.speechTranscriptionResultCounts;
    return {
      'intentMatchResultCounts':
          intentMatchResultCounts.map((k, e) => MapEntry(k.toValue(), e)),
      'totalResultCount': totalResultCount,
      if (speechTranscriptionResultCounts != null)
        'speechTranscriptionResultCounts': speechTranscriptionResultCounts
            .map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// Information for the results of the intent classification test.
class IntentClassificationTestResults {
  /// A list of the results for the intent classification test.
  final List<IntentClassificationTestResultItem> items;

  IntentClassificationTestResults({
    required this.items,
  });

  factory IntentClassificationTestResults.fromJson(Map<String, dynamic> json) {
    return IntentClassificationTestResults(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => IntentClassificationTestResultItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    return {
      'items': items,
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

/// Information about intent-level slot resolution in a test result.
class IntentLevelSlotResolutionTestResultItem {
  /// The name of the intent that was recognized.
  final String intentName;

  /// Indicates whether the conversation involves multiple turns or not.
  final bool multiTurnConversation;

  /// The results for the slot resolution in the test execution result.
  final List<SlotResolutionTestResultItem> slotResolutionResults;

  IntentLevelSlotResolutionTestResultItem({
    required this.intentName,
    required this.multiTurnConversation,
    required this.slotResolutionResults,
  });

  factory IntentLevelSlotResolutionTestResultItem.fromJson(
      Map<String, dynamic> json) {
    return IntentLevelSlotResolutionTestResultItem(
      intentName: json['intentName'] as String,
      multiTurnConversation: json['multiTurnConversation'] as bool,
      slotResolutionResults: (json['slotResolutionResults'] as List)
          .whereNotNull()
          .map((e) =>
              SlotResolutionTestResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final intentName = this.intentName;
    final multiTurnConversation = this.multiTurnConversation;
    final slotResolutionResults = this.slotResolutionResults;
    return {
      'intentName': intentName,
      'multiTurnConversation': multiTurnConversation,
      'slotResolutionResults': slotResolutionResults,
    };
  }
}

/// Indicates the success or failure of slots at the intent level.
class IntentLevelSlotResolutionTestResults {
  /// Indicates the items for the slot level resolution for the intents.
  final List<IntentLevelSlotResolutionTestResultItem> items;

  IntentLevelSlotResolutionTestResults({
    required this.items,
  });

  factory IntentLevelSlotResolutionTestResults.fromJson(
      Map<String, dynamic> json) {
    return IntentLevelSlotResolutionTestResults(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => IntentLevelSlotResolutionTestResultItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    return {
      'items': items,
    };
  }
}

/// Override settings to configure the intent state.
class IntentOverride {
  /// The name of the intent. Only required when you're switching intents.
  final String? name;

  /// A map of all of the slot value overrides for the intent. The name of the
  /// slot maps to the value of the slot. Slots that are not included in the map
  /// aren't overridden.
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

enum IntentState {
  failed,
  fulfilled,
  inProgress,
  readyForFulfillment,
  waiting,
  fulfillmentInProgress,
}

extension IntentStateValueExtension on IntentState {
  String toValue() {
    switch (this) {
      case IntentState.failed:
        return 'Failed';
      case IntentState.fulfilled:
        return 'Fulfilled';
      case IntentState.inProgress:
        return 'InProgress';
      case IntentState.readyForFulfillment:
        return 'ReadyForFulfillment';
      case IntentState.waiting:
        return 'Waiting';
      case IntentState.fulfillmentInProgress:
        return 'FulfillmentInProgress';
    }
  }
}

extension IntentStateFromString on String {
  IntentState toIntentState() {
    switch (this) {
      case 'Failed':
        return IntentState.failed;
      case 'Fulfilled':
        return IntentState.fulfilled;
      case 'InProgress':
        return IntentState.inProgress;
      case 'ReadyForFulfillment':
        return IntentState.readyForFulfillment;
      case 'Waiting':
        return IntentState.waiting;
      case 'FulfillmentInProgress':
        return IntentState.fulfillmentInProgress;
    }
    throw Exception('$this is not known in enum IntentState');
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

/// An object containing the name of an intent that was invoked.
class InvokedIntentSample {
  /// The name of an intent that was invoked.
  final String? intentName;

  InvokedIntentSample({
    this.intentName,
  });

  factory InvokedIntentSample.fromJson(Map<String, dynamic> json) {
    return InvokedIntentSample(
      intentName: json['intentName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final intentName = this.intentName;
    return {
      if (intentName != null) 'intentName': intentName,
    };
  }
}

/// Provides configuration information for the
/// <code>AMAZON.KendraSearchIntent</code> intent. When you use this intent,
/// Amazon Lex searches the specified Amazon Kendra index and returns documents
/// from the index that match the user's utterance.
class KendraConfiguration {
  /// The Amazon Resource Name (ARN) of the Amazon Kendra index that you want the
  /// <code>AMAZON.KendraSearchIntent</code> intent to search. The index must be
  /// in the same account and Region as the Amazon Lex bot.
  final String kendraIndex;

  /// A query filter that Amazon Lex sends to Amazon Kendra to filter the response
  /// from a query. The filter is in the format defined by Amazon Kendra. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/filtering.html">Filtering
  /// queries</a>.
  final String? queryFilterString;

  /// Determines whether the <code>AMAZON.KendraSearchIntent</code> intent uses a
  /// custom query string to query the Amazon Kendra index.
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

class ListBotAliasReplicasResponse {
  /// The summary information of the replicated bot created from the source bot
  /// alias.
  final List<BotAliasReplicaSummary>? botAliasReplicaSummaries;

  /// The unique bot ID of the replicated bot created from the source bot alias.
  final String? botId;

  /// The next token for the replicated bots created from the source bot alias.
  final String? nextToken;

  /// The secondary region of the replicated bot created from the source bot
  /// alias.
  final String? replicaRegion;

  /// The source region of the replicated bot created from the source bot alias.
  final String? sourceRegion;

  ListBotAliasReplicasResponse({
    this.botAliasReplicaSummaries,
    this.botId,
    this.nextToken,
    this.replicaRegion,
    this.sourceRegion,
  });

  factory ListBotAliasReplicasResponse.fromJson(Map<String, dynamic> json) {
    return ListBotAliasReplicasResponse(
      botAliasReplicaSummaries: (json['botAliasReplicaSummaries'] as List?)
          ?.whereNotNull()
          .map(
              (e) => BotAliasReplicaSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      botId: json['botId'] as String?,
      nextToken: json['nextToken'] as String?,
      replicaRegion: json['replicaRegion'] as String?,
      sourceRegion: json['sourceRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasReplicaSummaries = this.botAliasReplicaSummaries;
    final botId = this.botId;
    final nextToken = this.nextToken;
    final replicaRegion = this.replicaRegion;
    final sourceRegion = this.sourceRegion;
    return {
      if (botAliasReplicaSummaries != null)
        'botAliasReplicaSummaries': botAliasReplicaSummaries,
      if (botId != null) 'botId': botId,
      if (nextToken != null) 'nextToken': nextToken,
      if (replicaRegion != null) 'replicaRegion': replicaRegion,
      if (sourceRegion != null) 'sourceRegion': sourceRegion,
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

class ListBotReplicasResponse {
  /// the unique bot IDs in the list of replicated bots.
  final String? botId;

  /// The summary details for the replicated bots.
  final List<BotReplicaSummary>? botReplicaSummaries;

  /// The source region of the source bots in the list of replicated bots.
  final String? sourceRegion;

  ListBotReplicasResponse({
    this.botId,
    this.botReplicaSummaries,
    this.sourceRegion,
  });

  factory ListBotReplicasResponse.fromJson(Map<String, dynamic> json) {
    return ListBotReplicasResponse(
      botId: json['botId'] as String?,
      botReplicaSummaries: (json['botReplicaSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => BotReplicaSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceRegion: json['sourceRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botReplicaSummaries = this.botReplicaSummaries;
    final sourceRegion = this.sourceRegion;
    return {
      if (botId != null) 'botId': botId,
      if (botReplicaSummaries != null)
        'botReplicaSummaries': botReplicaSummaries,
      if (sourceRegion != null) 'sourceRegion': sourceRegion,
    };
  }
}

class ListBotResourceGenerationsResponse {
  /// The unique identifier of the bot for which the generation requests were
  /// made.
  final String? botId;

  /// The version of the bot for which the generation requests were made.
  final String? botVersion;

  /// A list of objects, each containing information about a generation request
  /// for the bot locale.
  final List<GenerationSummary>? generationSummaries;

  /// The locale of the bot for which the generation requests were made.
  final String? localeId;

  /// If the total number of results is greater than the number specified in the
  /// <code>maxResults</code>, the response returns a token in the
  /// <code>nextToken</code> field. Use this token when making a request to return
  /// the next batch of results.
  final String? nextToken;

  ListBotResourceGenerationsResponse({
    this.botId,
    this.botVersion,
    this.generationSummaries,
    this.localeId,
    this.nextToken,
  });

  factory ListBotResourceGenerationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListBotResourceGenerationsResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      generationSummaries: (json['generationSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => GenerationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      localeId: json['localeId'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final generationSummaries = this.generationSummaries;
    final localeId = this.localeId;
    final nextToken = this.nextToken;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (generationSummaries != null)
        'generationSummaries': generationSummaries,
      if (localeId != null) 'localeId': localeId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBotVersionReplicasResponse {
  /// The unique ID of the bots in the list of replicated bots.
  final String? botId;

  /// The information summary used for the replicated bots in the list of
  /// replicated bots.
  final List<BotVersionReplicaSummary>? botVersionReplicaSummaries;

  /// The next token used for the replicated bots in the list of replicated bots.
  final String? nextToken;

  /// The region used for the replicated bots in the list of replicated bots.
  final String? replicaRegion;

  /// The source region used for the bots in the list of replicated bots.
  final String? sourceRegion;

  ListBotVersionReplicasResponse({
    this.botId,
    this.botVersionReplicaSummaries,
    this.nextToken,
    this.replicaRegion,
    this.sourceRegion,
  });

  factory ListBotVersionReplicasResponse.fromJson(Map<String, dynamic> json) {
    return ListBotVersionReplicasResponse(
      botId: json['botId'] as String?,
      botVersionReplicaSummaries: (json['botVersionReplicaSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BotVersionReplicaSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      replicaRegion: json['replicaRegion'] as String?,
      sourceRegion: json['sourceRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersionReplicaSummaries = this.botVersionReplicaSummaries;
    final nextToken = this.nextToken;
    final replicaRegion = this.replicaRegion;
    final sourceRegion = this.sourceRegion;
    return {
      if (botId != null) 'botId': botId,
      if (botVersionReplicaSummaries != null)
        'botVersionReplicaSummaries': botVersionReplicaSummaries,
      if (nextToken != null) 'nextToken': nextToken,
      if (replicaRegion != null) 'replicaRegion': replicaRegion,
      if (sourceRegion != null) 'sourceRegion': sourceRegion,
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

class ListIntentMetricsResponse {
  /// The identifier for the bot for which you retrieved intent metrics.
  final String? botId;

  /// If the response from the ListIntentMetrics operation contains more results
  /// than specified in the maxResults parameter, a token is returned in the
  /// response.
  ///
  /// Use the returned token in the nextToken parameter of a ListIntentMetrics
  /// request to return the next page of results. For a complete set of results,
  /// call the ListIntentMetrics operation until the nextToken returned in the
  /// response is null.
  final String? nextToken;

  /// The results for the intent metrics.
  final List<AnalyticsIntentResult>? results;

  ListIntentMetricsResponse({
    this.botId,
    this.nextToken,
    this.results,
  });

  factory ListIntentMetricsResponse.fromJson(Map<String, dynamic> json) {
    return ListIntentMetricsResponse(
      botId: json['botId'] as String?,
      nextToken: json['nextToken'] as String?,
      results: (json['results'] as List?)
          ?.whereNotNull()
          .map((e) => AnalyticsIntentResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final nextToken = this.nextToken;
    final results = this.results;
    return {
      if (botId != null) 'botId': botId,
      if (nextToken != null) 'nextToken': nextToken,
      if (results != null) 'results': results,
    };
  }
}

class ListIntentPathsResponse {
  /// A list of objects, each of which contains information about a node in the
  /// intent path for which you requested metrics.
  final List<AnalyticsIntentNodeSummary>? nodeSummaries;

  ListIntentPathsResponse({
    this.nodeSummaries,
  });

  factory ListIntentPathsResponse.fromJson(Map<String, dynamic> json) {
    return ListIntentPathsResponse(
      nodeSummaries: (json['nodeSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AnalyticsIntentNodeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nodeSummaries = this.nodeSummaries;
    return {
      if (nodeSummaries != null) 'nodeSummaries': nodeSummaries,
    };
  }
}

class ListIntentStageMetricsResponse {
  /// The identifier for the bot for which you retrieved intent stage metrics.
  final String? botId;

  /// If the response from the ListIntentStageMetrics operation contains more
  /// results than specified in the maxResults parameter, a token is returned in
  /// the response.
  ///
  /// Use the returned token in the nextToken parameter of a
  /// ListIntentStageMetrics request to return the next page of results. For a
  /// complete set of results, call the ListIntentStageMetrics operation until the
  /// nextToken returned in the response is null.
  final String? nextToken;

  /// The results for the intent stage metrics.
  final List<AnalyticsIntentStageResult>? results;

  ListIntentStageMetricsResponse({
    this.botId,
    this.nextToken,
    this.results,
  });

  factory ListIntentStageMetricsResponse.fromJson(Map<String, dynamic> json) {
    return ListIntentStageMetricsResponse(
      botId: json['botId'] as String?,
      nextToken: json['nextToken'] as String?,
      results: (json['results'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AnalyticsIntentStageResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final nextToken = this.nextToken;
    final results = this.results;
    return {
      if (botId != null) 'botId': botId,
      if (nextToken != null) 'nextToken': nextToken,
      if (results != null) 'results': results,
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

class ListSessionAnalyticsDataResponse {
  /// The unique identifier of the bot that the sessions belong to.
  final String? botId;

  /// If the response from the ListSessionAnalyticsData operation contains more
  /// results than specified in the maxResults parameter, a token is returned in
  /// the response.
  ///
  /// Use the returned token in the nextToken parameter of a
  /// ListSessionAnalyticsData request to return the next page of results. For a
  /// complete set of results, call the ListSessionAnalyticsData operation until
  /// the nextToken returned in the response is null.
  final String? nextToken;

  /// A list of objects, each of which contains information about a session with
  /// the bot.
  final List<SessionSpecification>? sessions;

  ListSessionAnalyticsDataResponse({
    this.botId,
    this.nextToken,
    this.sessions,
  });

  factory ListSessionAnalyticsDataResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionAnalyticsDataResponse(
      botId: json['botId'] as String?,
      nextToken: json['nextToken'] as String?,
      sessions: (json['sessions'] as List?)
          ?.whereNotNull()
          .map((e) => SessionSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final nextToken = this.nextToken;
    final sessions = this.sessions;
    return {
      if (botId != null) 'botId': botId,
      if (nextToken != null) 'nextToken': nextToken,
      if (sessions != null) 'sessions': sessions,
    };
  }
}

class ListSessionMetricsResponse {
  /// The identifier for the bot for which you retrieved session metrics.
  final String? botId;

  /// If the response from the ListSessionMetrics operation contains more results
  /// than specified in the maxResults parameter, a token is returned in the
  /// response.
  ///
  /// Use the returned token in the nextToken parameter of a ListSessionMetrics
  /// request to return the next page of results. For a complete set of results,
  /// call the ListSessionMetrics operation until the nextToken returned in the
  /// response is null.
  final String? nextToken;

  /// The results for the session metrics.
  final List<AnalyticsSessionResult>? results;

  ListSessionMetricsResponse({
    this.botId,
    this.nextToken,
    this.results,
  });

  factory ListSessionMetricsResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionMetricsResponse(
      botId: json['botId'] as String?,
      nextToken: json['nextToken'] as String?,
      results: (json['results'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AnalyticsSessionResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final nextToken = this.nextToken;
    final results = this.results;
    return {
      if (botId != null) 'botId': botId,
      if (nextToken != null) 'nextToken': nextToken,
      if (results != null) 'results': results,
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

class ListTestExecutionResultItemsResponse {
  /// A token that indicates whether there are more results to return in a
  /// response to the <code>ListTestExecutionResultItems</code> operation. If the
  /// <code>nextToken</code> field is present, you send the contents as the
  /// <code>nextToken</code> parameter of a
  /// <code>ListTestExecutionResultItems</code> operation request to get the next
  /// page of results.
  final String? nextToken;

  /// The list of results from the test execution.
  final TestExecutionResultItems? testExecutionResults;

  ListTestExecutionResultItemsResponse({
    this.nextToken,
    this.testExecutionResults,
  });

  factory ListTestExecutionResultItemsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTestExecutionResultItemsResponse(
      nextToken: json['nextToken'] as String?,
      testExecutionResults: json['testExecutionResults'] != null
          ? TestExecutionResultItems.fromJson(
              json['testExecutionResults'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final testExecutionResults = this.testExecutionResults;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (testExecutionResults != null)
        'testExecutionResults': testExecutionResults,
    };
  }
}

class ListTestExecutionsResponse {
  /// A token that indicates whether there are more results to return in a
  /// response to the ListTestExecutions operation. If the nextToken field is
  /// present, you send the contents as the nextToken parameter of a
  /// ListTestExecutions operation request to get the next page of results.
  final String? nextToken;

  /// The list of test executions.
  final List<TestExecutionSummary>? testExecutions;

  ListTestExecutionsResponse({
    this.nextToken,
    this.testExecutions,
  });

  factory ListTestExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListTestExecutionsResponse(
      nextToken: json['nextToken'] as String?,
      testExecutions: (json['testExecutions'] as List?)
          ?.whereNotNull()
          .map((e) => TestExecutionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final testExecutions = this.testExecutions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (testExecutions != null) 'testExecutions': testExecutions,
    };
  }
}

class ListTestSetRecordsResponse {
  /// A token that indicates whether there are more records to return in a
  /// response to the ListTestSetRecords operation. If the nextToken field is
  /// present, you send the contents as the nextToken parameter of a
  /// ListTestSetRecords operation request to get the next page of records.
  final String? nextToken;

  /// The list of records from the test set.
  final List<TestSetTurnRecord>? testSetRecords;

  ListTestSetRecordsResponse({
    this.nextToken,
    this.testSetRecords,
  });

  factory ListTestSetRecordsResponse.fromJson(Map<String, dynamic> json) {
    return ListTestSetRecordsResponse(
      nextToken: json['nextToken'] as String?,
      testSetRecords: (json['testSetRecords'] as List?)
          ?.whereNotNull()
          .map((e) => TestSetTurnRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final testSetRecords = this.testSetRecords;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (testSetRecords != null) 'testSetRecords': testSetRecords,
    };
  }
}

class ListTestSetsResponse {
  /// A token that indicates whether there are more results to return in a
  /// response to the ListTestSets operation. If the nextToken field is present,
  /// you send the contents as the nextToken parameter of a ListTestSets operation
  /// request to get the next page of results.
  final String? nextToken;

  /// The selected test sets in a list of test sets.
  final List<TestSetSummary>? testSets;

  ListTestSetsResponse({
    this.nextToken,
    this.testSets,
  });

  factory ListTestSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListTestSetsResponse(
      nextToken: json['nextToken'] as String?,
      testSets: (json['testSets'] as List?)
          ?.whereNotNull()
          .map((e) => TestSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final testSets = this.testSets;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (testSets != null) 'testSets': testSets,
    };
  }
}

class ListUtteranceAnalyticsDataResponse {
  /// The unique identifier of the bot that the utterances belong to.
  final String? botId;

  /// If the response from the ListUtteranceAnalyticsData operation contains more
  /// results than specified in the maxResults parameter, a token is returned in
  /// the response.
  ///
  /// Use the returned token in the nextToken parameter of a
  /// ListUtteranceAnalyticsData request to return the next page of results. For a
  /// complete set of results, call the ListUtteranceAnalyticsData operation until
  /// the nextToken returned in the response is null.
  final String? nextToken;

  /// A list of objects, each of which contains information about an utterance in
  /// a user session with your bot.
  final List<UtteranceSpecification>? utterances;

  ListUtteranceAnalyticsDataResponse({
    this.botId,
    this.nextToken,
    this.utterances,
  });

  factory ListUtteranceAnalyticsDataResponse.fromJson(
      Map<String, dynamic> json) {
    return ListUtteranceAnalyticsDataResponse(
      botId: json['botId'] as String?,
      nextToken: json['nextToken'] as String?,
      utterances: (json['utterances'] as List?)
          ?.whereNotNull()
          .map(
              (e) => UtteranceSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final nextToken = this.nextToken;
    final utterances = this.utterances;
    return {
      if (botId != null) 'botId': botId,
      if (nextToken != null) 'nextToken': nextToken,
      if (utterances != null) 'utterances': utterances,
    };
  }
}

class ListUtteranceMetricsResponse {
  /// The identifier for the bot for which you retrieved utterance metrics.
  final String? botId;

  /// If the response from the ListUtteranceMetrics operation contains more
  /// results than specified in the maxResults parameter, a token is returned in
  /// the response.
  ///
  /// Use the returned token in the nextToken parameter of a ListUtteranceMetrics
  /// request to return the next page of results. For a complete set of results,
  /// call the ListUtteranceMetrics operation until the nextToken returned in the
  /// response is null.
  final String? nextToken;

  /// The results for the utterance metrics.
  final List<AnalyticsUtteranceResult>? results;

  ListUtteranceMetricsResponse({
    this.botId,
    this.nextToken,
    this.results,
  });

  factory ListUtteranceMetricsResponse.fromJson(Map<String, dynamic> json) {
    return ListUtteranceMetricsResponse(
      botId: json['botId'] as String?,
      nextToken: json['nextToken'] as String?,
      results: (json['results'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AnalyticsUtteranceResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final nextToken = this.nextToken;
    final results = this.results;
    return {
      if (botId != null) 'botId': botId,
      if (nextToken != null) 'nextToken': nextToken,
      if (results != null) 'results': results,
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

/// The object that provides message text and its type.
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

/// Contains details about the configuration of the Amazon OpenSearch Service
/// database used for the <code>AMAZON.QnAIntent</code>.
class OpensearchConfiguration {
  /// The endpoint of the Amazon OpenSearch Service domain.
  final String domainEndpoint;

  /// The name of the Amazon OpenSearch Service index.
  final String indexName;

  /// Specifies whether to return an exact response or to return an answer
  /// generated by the model using the fields you specify from the database.
  final bool? exactResponse;

  /// Contains the names of the fields used for an exact response to the user.
  final ExactResponseFields? exactResponseFields;

  /// Contains a list of fields from the Amazon OpenSearch Service that the model
  /// can use to generate the answer to the query.
  final List<String>? includeFields;

  OpensearchConfiguration({
    required this.domainEndpoint,
    required this.indexName,
    this.exactResponse,
    this.exactResponseFields,
    this.includeFields,
  });

  factory OpensearchConfiguration.fromJson(Map<String, dynamic> json) {
    return OpensearchConfiguration(
      domainEndpoint: json['domainEndpoint'] as String,
      indexName: json['indexName'] as String,
      exactResponse: json['exactResponse'] as bool?,
      exactResponseFields: json['exactResponseFields'] != null
          ? ExactResponseFields.fromJson(
              json['exactResponseFields'] as Map<String, dynamic>)
          : null,
      includeFields: (json['includeFields'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainEndpoint = this.domainEndpoint;
    final indexName = this.indexName;
    final exactResponse = this.exactResponse;
    final exactResponseFields = this.exactResponseFields;
    final includeFields = this.includeFields;
    return {
      'domainEndpoint': domainEndpoint,
      'indexName': indexName,
      if (exactResponse != null) 'exactResponse': exactResponse,
      if (exactResponseFields != null)
        'exactResponseFields': exactResponseFields,
      if (includeFields != null) 'includeFields': includeFields,
    };
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

/// Information about the overall results for a test execution result.
class OverallTestResultItem {
  /// The number of results that succeeded.
  final Map<TestResultMatchStatus, int> endToEndResultCounts;

  /// Indicates whether the conversation contains multiple turns or not.
  final bool multiTurnConversation;

  /// The total number of overall results in the result of the test execution.
  final int totalResultCount;

  /// The number of speech transcription results in the overall test.
  final Map<TestResultMatchStatus, int>? speechTranscriptionResultCounts;

  OverallTestResultItem({
    required this.endToEndResultCounts,
    required this.multiTurnConversation,
    required this.totalResultCount,
    this.speechTranscriptionResultCounts,
  });

  factory OverallTestResultItem.fromJson(Map<String, dynamic> json) {
    return OverallTestResultItem(
      endToEndResultCounts:
          (json['endToEndResultCounts'] as Map<String, dynamic>)
              .map((k, e) => MapEntry(k.toTestResultMatchStatus(), e as int)),
      multiTurnConversation: json['multiTurnConversation'] as bool,
      totalResultCount: json['totalResultCount'] as int,
      speechTranscriptionResultCounts:
          (json['speechTranscriptionResultCounts'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toTestResultMatchStatus(), e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final endToEndResultCounts = this.endToEndResultCounts;
    final multiTurnConversation = this.multiTurnConversation;
    final totalResultCount = this.totalResultCount;
    final speechTranscriptionResultCounts =
        this.speechTranscriptionResultCounts;
    return {
      'endToEndResultCounts':
          endToEndResultCounts.map((k, e) => MapEntry(k.toValue(), e)),
      'multiTurnConversation': multiTurnConversation,
      'totalResultCount': totalResultCount,
      if (speechTranscriptionResultCounts != null)
        'speechTranscriptionResultCounts': speechTranscriptionResultCounts
            .map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// Information about the overall test results.
class OverallTestResults {
  /// A list of the overall test results.
  final List<OverallTestResultItem> items;

  OverallTestResults({
    required this.items,
  });

  factory OverallTestResults.fromJson(Map<String, dynamic> json) {
    return OverallTestResults(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => OverallTestResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    return {
      'items': items,
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

  /// The name of the Amazon Web Services service that should allowed or denied
  /// access to an Amazon Lex action.
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

/// Details about the the configuration of the built-in
/// <code>Amazon.QnAIntent</code>.
class QnAIntentConfiguration {
  final BedrockModelSpecification? bedrockModelConfiguration;

  /// Contains details about the configuration of the data source used for the
  /// <code>AMAZON.QnAIntent</code>.
  final DataSourceConfiguration? dataSourceConfiguration;

  QnAIntentConfiguration({
    this.bedrockModelConfiguration,
    this.dataSourceConfiguration,
  });

  factory QnAIntentConfiguration.fromJson(Map<String, dynamic> json) {
    return QnAIntentConfiguration(
      bedrockModelConfiguration: json['bedrockModelConfiguration'] != null
          ? BedrockModelSpecification.fromJson(
              json['bedrockModelConfiguration'] as Map<String, dynamic>)
          : null,
      dataSourceConfiguration: json['dataSourceConfiguration'] != null
          ? DataSourceConfiguration.fromJson(
              json['dataSourceConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bedrockModelConfiguration = this.bedrockModelConfiguration;
    final dataSourceConfiguration = this.dataSourceConfiguration;
    return {
      if (bedrockModelConfiguration != null)
        'bedrockModelConfiguration': bedrockModelConfiguration,
      if (dataSourceConfiguration != null)
        'dataSourceConfiguration': dataSourceConfiguration,
    };
  }
}

/// Contains details about the configuration of the Amazon Kendra index used for
/// the <code>AMAZON.QnAIntent</code>.
class QnAKendraConfiguration {
  /// The ARN of the Amazon Kendra index to use.
  final String kendraIndex;

  /// Specifies whether to return an exact response from the Amazon Kendra index
  /// or to let the Amazon Bedrock model you select generate a response based on
  /// the results. To use this feature, you must first add FAQ questions to your
  /// index by following the steps at <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/in-creating-faq.html">Adding
  /// frequently asked questions (FAQs) to an index</a>.
  final bool? exactResponse;

  /// Contains the Amazon Kendra filter string to use if enabled. For more
  /// information on the Amazon Kendra search filter JSON format, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/filtering.html#search-filtering">Using
  /// document attributes to filter search results</a>.
  final String? queryFilterString;

  /// Specifies whether to enable an Amazon Kendra filter string or not.
  final bool? queryFilterStringEnabled;

  QnAKendraConfiguration({
    required this.kendraIndex,
    this.exactResponse,
    this.queryFilterString,
    this.queryFilterStringEnabled,
  });

  factory QnAKendraConfiguration.fromJson(Map<String, dynamic> json) {
    return QnAKendraConfiguration(
      kendraIndex: json['kendraIndex'] as String,
      exactResponse: json['exactResponse'] as bool?,
      queryFilterString: json['queryFilterString'] as String?,
      queryFilterStringEnabled: json['queryFilterStringEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final kendraIndex = this.kendraIndex;
    final exactResponse = this.exactResponse;
    final queryFilterString = this.queryFilterString;
    final queryFilterStringEnabled = this.queryFilterStringEnabled;
    return {
      'kendraIndex': kendraIndex,
      if (exactResponse != null) 'exactResponse': exactResponse,
      if (queryFilterString != null) 'queryFilterString': queryFilterString,
      if (queryFilterStringEnabled != null)
        'queryFilterStringEnabled': queryFilterStringEnabled,
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

/// Provides an array of phrases that should be given preference when resolving
/// values for a slot.
class RuntimeHintDetails {
  /// One or more strings that Amazon Lex should look for in the input to the bot.
  /// Each phrase is given preference when deciding on slot values.
  final List<RuntimeHintValue>? runtimeHintValues;

  /// A map of constituent sub slot names inside a composite slot in the intent
  /// and the phrases that should be added for each sub slot. Inside each
  /// composite slot hints, this structure provides a mechanism to add granular
  /// sub slot phrases. Only sub slot hints are supported for composite slots. The
  /// intent name, composite slot name and the constituent sub slot names must
  /// exist.
  final Map<String, RuntimeHintDetails>? subSlotHints;

  RuntimeHintDetails({
    this.runtimeHintValues,
    this.subSlotHints,
  });

  factory RuntimeHintDetails.fromJson(Map<String, dynamic> json) {
    return RuntimeHintDetails(
      runtimeHintValues: (json['runtimeHintValues'] as List?)
          ?.whereNotNull()
          .map((e) => RuntimeHintValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      subSlotHints: (json['subSlotHints'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, RuntimeHintDetails.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final runtimeHintValues = this.runtimeHintValues;
    final subSlotHints = this.subSlotHints;
    return {
      if (runtimeHintValues != null) 'runtimeHintValues': runtimeHintValues,
      if (subSlotHints != null) 'subSlotHints': subSlotHints,
    };
  }
}

/// Provides the phrase that Amazon Lex should look for in the user's input to
/// the bot.
class RuntimeHintValue {
  /// The phrase that Amazon Lex should look for in the user's input to the bot.
  final String phrase;

  RuntimeHintValue({
    required this.phrase,
  });

  factory RuntimeHintValue.fromJson(Map<String, dynamic> json) {
    return RuntimeHintValue(
      phrase: json['phrase'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final phrase = this.phrase;
    return {
      'phrase': phrase,
    };
  }
}

/// You can provide Amazon Lex with hints to the phrases that a customer is
/// likely to use for a slot. When a slot with hints is resolved, the phrases in
/// the runtime hints are preferred in the resolution. You can provide hints for
/// a maximum of 100 intents. You can provide a maximum of 100 slots.
///
/// Before you can use runtime hints with an existing bot, you must first
/// rebuild the bot.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/lexv2/latest/dg/using-hints.html">Using
/// runtime hints to improve recognition of slot values</a>.
class RuntimeHints {
  /// A list of the slots in the intent that should have runtime hints added, and
  /// the phrases that should be added for each slot.
  ///
  /// The first level of the <code>slotHints</code> map is the name of the intent.
  /// The second level is the name of the slot within the intent. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/using-hints.html">Using
  /// hints to improve accuracy</a>.
  ///
  /// The intent name and slot name must exist.
  final Map<String, Map<String, RuntimeHintDetails>>? slotHints;

  RuntimeHints({
    this.slotHints,
  });

  factory RuntimeHints.fromJson(Map<String, dynamic> json) {
    return RuntimeHints(
      slotHints: (json['slotHints'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as Map<String, dynamic>).map((k, e) => MapEntry(
                  k, RuntimeHintDetails.fromJson(e as Map<String, dynamic>))))),
    );
  }

  Map<String, dynamic> toJson() {
    final slotHints = this.slotHints;
    return {
      if (slotHints != null) 'slotHints': slotHints,
    };
  }
}

/// Contains specifications about the Amazon Lex runtime generative AI
/// capabilities from Amazon Bedrock that you can turn on for your bot.
class RuntimeSettings {
  /// An object containing specifications for the assisted slot resolution
  /// feature.
  final SlotResolutionImprovementSpecification? slotResolutionImprovement;

  RuntimeSettings({
    this.slotResolutionImprovement,
  });

  factory RuntimeSettings.fromJson(Map<String, dynamic> json) {
    return RuntimeSettings(
      slotResolutionImprovement: json['slotResolutionImprovement'] != null
          ? SlotResolutionImprovementSpecification.fromJson(
              json['slotResolutionImprovement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final slotResolutionImprovement = this.slotResolutionImprovement;
    return {
      if (slotResolutionImprovement != null)
        'slotResolutionImprovement': slotResolutionImprovement,
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

  /// The Amazon Resource Name (ARN) of an Amazon Web Services Key Management
  /// Service (KMS) key for encrypting audio log files stored in an S3 bucket.
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

/// Contains specifications for the sample utterance generation feature.
class SampleUtteranceGenerationSpecification {
  /// Specifies whether to enable sample utterance generation or not.
  final bool enabled;
  final BedrockModelSpecification? bedrockModelSpecification;

  SampleUtteranceGenerationSpecification({
    required this.enabled,
    this.bedrockModelSpecification,
  });

  factory SampleUtteranceGenerationSpecification.fromJson(
      Map<String, dynamic> json) {
    return SampleUtteranceGenerationSpecification(
      enabled: json['enabled'] as bool,
      bedrockModelSpecification: json['bedrockModelSpecification'] != null
          ? BedrockModelSpecification.fromJson(
              json['bedrockModelSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final bedrockModelSpecification = this.bedrockModelSpecification;
    return {
      'enabled': enabled,
      if (bedrockModelSpecification != null)
        'bedrockModelSpecification': bedrockModelSpecification,
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

/// An object specifying the measure and method by which to sort the session
/// analytics data.
class SessionDataSortBy {
  /// The measure by which to sort the session analytics data.
  ///
  /// <ul>
  /// <li>
  /// <code>conversationStartTime</code> – The date and time when the conversation
  /// began. A conversation is defined as a unique combination of a
  /// <code>sessionId</code> and an <code>originatingRequestId</code>.
  /// </li>
  /// <li>
  /// <code>numberOfTurns</code> – The number of turns that the session took.
  /// </li>
  /// <li>
  /// <code>conversationDurationSeconds</code> – The duration of the conversation
  /// in seconds.
  /// </li>
  /// </ul>
  final AnalyticsSessionSortByName name;

  /// Specifies whether to sort the results in ascending or descending order.
  final AnalyticsSortOrder order;

  SessionDataSortBy({
    required this.name,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final order = this.order;
    return {
      'name': name.toValue(),
      'order': order.toValue(),
    };
  }
}

/// An object containing information about a specific session.
class SessionSpecification {
  /// The identifier of the alias of the bot that the session was held with.
  final String? botAliasId;

  /// The version of the bot that the session was held with.
  final String? botVersion;

  /// The channel that is integrated with the bot that the session was held with.
  final String? channel;

  /// The duration of the conversation in seconds. A conversation is defined as a
  /// unique combination of a <code>sessionId</code> and an
  /// <code>originatingRequestId</code>.
  final int? conversationDurationSeconds;

  /// The final state of the conversation. A conversation is defined as a unique
  /// combination of a <code>sessionId</code> and an
  /// <code>originatingRequestId</code>.
  final ConversationEndState? conversationEndState;

  /// The date and time when the conversation ended. A conversation is defined as
  /// a unique combination of a <code>sessionId</code> and an
  /// <code>originatingRequestId</code>.
  final DateTime? conversationEndTime;

  /// The date and time when the conversation began. A conversation is defined as
  /// a unique combination of a <code>sessionId</code> and an
  /// <code>originatingRequestId</code>.
  final DateTime? conversationStartTime;

  /// A list of objects containing the name of an intent that was invoked.
  final List<InvokedIntentSample>? invokedIntentSamples;

  /// The locale of the bot that the session was held with.
  final String? localeId;

  /// The mode of the session. The possible values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>Speech</code> – The session was spoken.
  /// </li>
  /// <li>
  /// <code>Text</code> – The session was written.
  /// </li>
  /// <li>
  /// <code>DTMF</code> – The session used a touch-tone keypad (Dual Tone
  /// Multi-Frequency).
  /// </li>
  /// <li>
  /// <code>MultiMode</code> – The session used multiple modes.
  /// </li>
  /// </ul>
  final AnalyticsModality? mode;

  /// The number of turns that the session took.
  final int? numberOfTurns;

  /// The identifier of the first request in a session.
  final String? originatingRequestId;

  /// The identifier of the session.
  final String? sessionId;

  SessionSpecification({
    this.botAliasId,
    this.botVersion,
    this.channel,
    this.conversationDurationSeconds,
    this.conversationEndState,
    this.conversationEndTime,
    this.conversationStartTime,
    this.invokedIntentSamples,
    this.localeId,
    this.mode,
    this.numberOfTurns,
    this.originatingRequestId,
    this.sessionId,
  });

  factory SessionSpecification.fromJson(Map<String, dynamic> json) {
    return SessionSpecification(
      botAliasId: json['botAliasId'] as String?,
      botVersion: json['botVersion'] as String?,
      channel: json['channel'] as String?,
      conversationDurationSeconds: json['conversationDurationSeconds'] as int?,
      conversationEndState:
          (json['conversationEndState'] as String?)?.toConversationEndState(),
      conversationEndTime: timeStampFromJson(json['conversationEndTime']),
      conversationStartTime: timeStampFromJson(json['conversationStartTime']),
      invokedIntentSamples: (json['invokedIntentSamples'] as List?)
          ?.whereNotNull()
          .map((e) => InvokedIntentSample.fromJson(e as Map<String, dynamic>))
          .toList(),
      localeId: json['localeId'] as String?,
      mode: (json['mode'] as String?)?.toAnalyticsModality(),
      numberOfTurns: json['numberOfTurns'] as int?,
      originatingRequestId: json['originatingRequestId'] as String?,
      sessionId: json['sessionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasId = this.botAliasId;
    final botVersion = this.botVersion;
    final channel = this.channel;
    final conversationDurationSeconds = this.conversationDurationSeconds;
    final conversationEndState = this.conversationEndState;
    final conversationEndTime = this.conversationEndTime;
    final conversationStartTime = this.conversationStartTime;
    final invokedIntentSamples = this.invokedIntentSamples;
    final localeId = this.localeId;
    final mode = this.mode;
    final numberOfTurns = this.numberOfTurns;
    final originatingRequestId = this.originatingRequestId;
    final sessionId = this.sessionId;
    return {
      if (botAliasId != null) 'botAliasId': botAliasId,
      if (botVersion != null) 'botVersion': botVersion,
      if (channel != null) 'channel': channel,
      if (conversationDurationSeconds != null)
        'conversationDurationSeconds': conversationDurationSeconds,
      if (conversationEndState != null)
        'conversationEndState': conversationEndState.toValue(),
      if (conversationEndTime != null)
        'conversationEndTime': unixTimestampToJson(conversationEndTime),
      if (conversationStartTime != null)
        'conversationStartTime': unixTimestampToJson(conversationStartTime),
      if (invokedIntentSamples != null)
        'invokedIntentSamples': invokedIntentSamples,
      if (localeId != null) 'localeId': localeId,
      if (mode != null) 'mode': mode.toValue(),
      if (numberOfTurns != null) 'numberOfTurns': numberOfTurns,
      if (originatingRequestId != null)
        'originatingRequestId': originatingRequestId,
      if (sessionId != null) 'sessionId': sessionId,
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
  /// The priority that Amazon Lex should apply to the slot.
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

/// Contains specifications for the assisted slot resolution feature.
class SlotResolutionImprovementSpecification {
  /// Specifies whether assisted slot resolution is turned on or off.
  final bool enabled;

  /// An object containing information about the Amazon Bedrock model used to
  /// assist slot resolution.
  final BedrockModelSpecification? bedrockModelSpecification;

  SlotResolutionImprovementSpecification({
    required this.enabled,
    this.bedrockModelSpecification,
  });

  factory SlotResolutionImprovementSpecification.fromJson(
      Map<String, dynamic> json) {
    return SlotResolutionImprovementSpecification(
      enabled: json['enabled'] as bool,
      bedrockModelSpecification: json['bedrockModelSpecification'] != null
          ? BedrockModelSpecification.fromJson(
              json['bedrockModelSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final bedrockModelSpecification = this.bedrockModelSpecification;
    return {
      'enabled': enabled,
      if (bedrockModelSpecification != null)
        'bedrockModelSpecification': bedrockModelSpecification,
    };
  }
}

/// Contains information about whether assisted slot resolution is turned on for
/// the slot or not.
class SlotResolutionSetting {
  /// Specifies whether assisted slot resolution is turned on for the slot or not.
  /// If the value is <code>EnhancedFallback</code>, assisted slot resolution is
  /// activated when Amazon Lex defaults to the
  /// <code>AMAZON.FallbackIntent</code>. If the value is <code>Default</code>,
  /// assisted slot resolution is turned off.
  final SlotResolutionStrategy slotResolutionStrategy;

  SlotResolutionSetting({
    required this.slotResolutionStrategy,
  });

  factory SlotResolutionSetting.fromJson(Map<String, dynamic> json) {
    return SlotResolutionSetting(
      slotResolutionStrategy:
          (json['slotResolutionStrategy'] as String).toSlotResolutionStrategy(),
    );
  }

  Map<String, dynamic> toJson() {
    final slotResolutionStrategy = this.slotResolutionStrategy;
    return {
      'slotResolutionStrategy': slotResolutionStrategy.toValue(),
    };
  }
}

enum SlotResolutionStrategy {
  enhancedFallback,
  $default,
}

extension SlotResolutionStrategyValueExtension on SlotResolutionStrategy {
  String toValue() {
    switch (this) {
      case SlotResolutionStrategy.enhancedFallback:
        return 'EnhancedFallback';
      case SlotResolutionStrategy.$default:
        return 'Default';
    }
  }
}

extension SlotResolutionStrategyFromString on String {
  SlotResolutionStrategy toSlotResolutionStrategy() {
    switch (this) {
      case 'EnhancedFallback':
        return SlotResolutionStrategy.enhancedFallback;
      case 'Default':
        return SlotResolutionStrategy.$default;
    }
    throw Exception('$this is not known in enum SlotResolutionStrategy');
  }
}

/// Information about the success and failure rate of slot resolution in the
/// results of a test execution.
class SlotResolutionTestResultItem {
  /// A result for slot resolution in the results of a test execution.
  final SlotResolutionTestResultItemCounts resultCounts;

  /// The name of the slot.
  final String slotName;

  SlotResolutionTestResultItem({
    required this.resultCounts,
    required this.slotName,
  });

  factory SlotResolutionTestResultItem.fromJson(Map<String, dynamic> json) {
    return SlotResolutionTestResultItem(
      resultCounts: SlotResolutionTestResultItemCounts.fromJson(
          json['resultCounts'] as Map<String, dynamic>),
      slotName: json['slotName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final resultCounts = this.resultCounts;
    final slotName = this.slotName;
    return {
      'resultCounts': resultCounts,
      'slotName': slotName,
    };
  }
}

/// Information about the counts for a slot resolution in the results of a test
/// execution.
class SlotResolutionTestResultItemCounts {
  /// The number of matched and mismatched results for slot resolution for the
  /// slot.
  final Map<TestResultMatchStatus, int> slotMatchResultCounts;

  /// The total number of results.
  final int totalResultCount;

  /// The number of matched, mismatched and execution error results for speech
  /// transcription for the slot.
  final Map<TestResultMatchStatus, int>? speechTranscriptionResultCounts;

  SlotResolutionTestResultItemCounts({
    required this.slotMatchResultCounts,
    required this.totalResultCount,
    this.speechTranscriptionResultCounts,
  });

  factory SlotResolutionTestResultItemCounts.fromJson(
      Map<String, dynamic> json) {
    return SlotResolutionTestResultItemCounts(
      slotMatchResultCounts:
          (json['slotMatchResultCounts'] as Map<String, dynamic>)
              .map((k, e) => MapEntry(k.toTestResultMatchStatus(), e as int)),
      totalResultCount: json['totalResultCount'] as int,
      speechTranscriptionResultCounts:
          (json['speechTranscriptionResultCounts'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toTestResultMatchStatus(), e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final slotMatchResultCounts = this.slotMatchResultCounts;
    final totalResultCount = this.totalResultCount;
    final speechTranscriptionResultCounts =
        this.speechTranscriptionResultCounts;
    return {
      'slotMatchResultCounts':
          slotMatchResultCounts.map((k, e) => MapEntry(k.toValue(), e)),
      'totalResultCount': totalResultCount,
      if (speechTranscriptionResultCounts != null)
        'speechTranscriptionResultCounts': speechTranscriptionResultCounts
            .map((k, e) => MapEntry(k.toValue(), e)),
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
  /// <code>AMAZON.AlphaNumeric</code> built-in slot type. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/built-in-slot-alphanumerice.html">
  /// <code>AMAZON.AlphaNumeric</code> </a>.
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

/// Specifies the elicitation setting details eliciting a slot.
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

  /// An object containing information about whether assisted slot resolution is
  /// turned on for the slot or not.
  final SlotResolutionSetting? slotResolutionSetting;
  final WaitAndContinueSpecification? waitAndContinueSpecification;

  SlotValueElicitationSetting({
    required this.slotConstraint,
    this.defaultValueSpecification,
    this.promptSpecification,
    this.sampleUtterances,
    this.slotCaptureSetting,
    this.slotResolutionSetting,
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
      slotResolutionSetting: json['slotResolutionSetting'] != null
          ? SlotResolutionSetting.fromJson(
              json['slotResolutionSetting'] as Map<String, dynamic>)
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
    final slotResolutionSetting = this.slotResolutionSetting;
    final waitAndContinueSpecification = this.waitAndContinueSpecification;
    return {
      'slotConstraint': slotConstraint.toValue(),
      if (defaultValueSpecification != null)
        'defaultValueSpecification': defaultValueSpecification,
      if (promptSpecification != null)
        'promptSpecification': promptSpecification,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
      if (slotCaptureSetting != null) 'slotCaptureSetting': slotCaptureSetting,
      if (slotResolutionSetting != null)
        'slotResolutionSetting': slotResolutionSetting,
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
  /// Unicode characters ("\⁠u&lt;Unicode&gt;")
  /// </li>
  /// </ul>
  /// Represent Unicode characters with four digits, for example "\⁠u0041" or
  /// "\⁠u005A".
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
  /// <code>ORIGINAL_VALUE</code> - Returns the value entered by the user, if the
  /// user value is similar to the slot value.
  /// </li>
  /// <li>
  /// <code>TOP_RESOLUTION</code> - If there is a resolution list for the slot,
  /// return the first value in the resolution list as the slot type value. If
  /// there is no resolution list, null is returned.
  /// </li>
  /// </ul>
  /// If you don't specify the <code>valueSelectionStrategy</code>, the default is
  /// <code>ORIGINAL_VALUE</code>.
  final SlotValueResolutionStrategy resolutionStrategy;

  /// Provides settings that enable advanced recognition settings for slot values.
  /// You can use this to enable using slot values as a custom vocabulary for
  /// recognizing user utterances.
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

class StartBotResourceGenerationResponse {
  /// The unique identifier of the bot for which the generation request was made.
  final String? botId;

  /// The version of the bot for which the generation request was made.
  final String? botVersion;

  /// The date and time at which the generation request was made.
  final DateTime? creationDateTime;

  /// The unique identifier of the generation request.
  final String? generationId;

  /// The prompt that was used generate intents and slot types for the bot locale.
  final String? generationInputPrompt;

  /// The status of the generation request.
  final GenerationStatus? generationStatus;

  /// The locale of the bot for which the generation request was made.
  final String? localeId;

  StartBotResourceGenerationResponse({
    this.botId,
    this.botVersion,
    this.creationDateTime,
    this.generationId,
    this.generationInputPrompt,
    this.generationStatus,
    this.localeId,
  });

  factory StartBotResourceGenerationResponse.fromJson(
      Map<String, dynamic> json) {
    return StartBotResourceGenerationResponse(
      botId: json['botId'] as String?,
      botVersion: json['botVersion'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      generationId: json['generationId'] as String?,
      generationInputPrompt: json['generationInputPrompt'] as String?,
      generationStatus:
          (json['generationStatus'] as String?)?.toGenerationStatus(),
      localeId: json['localeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botVersion = this.botVersion;
    final creationDateTime = this.creationDateTime;
    final generationId = this.generationId;
    final generationInputPrompt = this.generationInputPrompt;
    final generationStatus = this.generationStatus;
    final localeId = this.localeId;
    return {
      if (botId != null) 'botId': botId,
      if (botVersion != null) 'botVersion': botVersion,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (generationId != null) 'generationId': generationId,
      if (generationInputPrompt != null)
        'generationInputPrompt': generationInputPrompt,
      if (generationStatus != null)
        'generationStatus': generationStatus.toValue(),
      if (localeId != null) 'localeId': localeId,
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

class StartTestExecutionResponse {
  /// Indicates whether we use streaming or non-streaming APIs for the test set
  /// execution. For streaming, StartConversation Amazon Lex Runtime API is used.
  /// Whereas for non-streaming, RecognizeUtterance and RecognizeText Amazon Lex
  /// Runtime API are used.
  final TestExecutionApiMode? apiMode;

  /// The creation date and time for the test set execution.
  final DateTime? creationDateTime;

  /// The target bot for the test set execution.
  final TestExecutionTarget? target;

  /// The unique identifier of the test set execution.
  final String? testExecutionId;

  /// Indicates whether audio or text is used.
  final TestExecutionModality? testExecutionModality;

  /// The test set Id for the test set execution.
  final String? testSetId;

  StartTestExecutionResponse({
    this.apiMode,
    this.creationDateTime,
    this.target,
    this.testExecutionId,
    this.testExecutionModality,
    this.testSetId,
  });

  factory StartTestExecutionResponse.fromJson(Map<String, dynamic> json) {
    return StartTestExecutionResponse(
      apiMode: (json['apiMode'] as String?)?.toTestExecutionApiMode(),
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      target: json['target'] != null
          ? TestExecutionTarget.fromJson(json['target'] as Map<String, dynamic>)
          : null,
      testExecutionId: json['testExecutionId'] as String?,
      testExecutionModality:
          (json['testExecutionModality'] as String?)?.toTestExecutionModality(),
      testSetId: json['testSetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiMode = this.apiMode;
    final creationDateTime = this.creationDateTime;
    final target = this.target;
    final testExecutionId = this.testExecutionId;
    final testExecutionModality = this.testExecutionModality;
    final testSetId = this.testSetId;
    return {
      if (apiMode != null) 'apiMode': apiMode.toValue(),
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (target != null) 'target': target,
      if (testExecutionId != null) 'testExecutionId': testExecutionId,
      if (testExecutionModality != null)
        'testExecutionModality': testExecutionModality.toValue(),
      if (testSetId != null) 'testSetId': testSetId,
    };
  }
}

class StartTestSetGenerationResponse {
  /// The creation date and time for the test set generation.
  final DateTime? creationDateTime;

  /// The description used for the test set generation.
  final String? description;

  /// The data source for the test set generation.
  final TestSetGenerationDataSource? generationDataSource;

  /// The roleARN used for any operation in the test set to access resources in
  /// the Amazon Web Services account.
  final String? roleArn;

  /// The Amazon S3 storage location for the test set generation.
  final TestSetStorageLocation? storageLocation;

  /// The unique identifier of the test set generation to describe.
  final String? testSetGenerationId;

  /// The status for the test set generation.
  final TestSetGenerationStatus? testSetGenerationStatus;

  /// The test set name used for the test set generation.
  final String? testSetName;

  /// A list of tags that was used for the test set that is being generated.
  final Map<String, String>? testSetTags;

  StartTestSetGenerationResponse({
    this.creationDateTime,
    this.description,
    this.generationDataSource,
    this.roleArn,
    this.storageLocation,
    this.testSetGenerationId,
    this.testSetGenerationStatus,
    this.testSetName,
    this.testSetTags,
  });

  factory StartTestSetGenerationResponse.fromJson(Map<String, dynamic> json) {
    return StartTestSetGenerationResponse(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      generationDataSource: json['generationDataSource'] != null
          ? TestSetGenerationDataSource.fromJson(
              json['generationDataSource'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
      storageLocation: json['storageLocation'] != null
          ? TestSetStorageLocation.fromJson(
              json['storageLocation'] as Map<String, dynamic>)
          : null,
      testSetGenerationId: json['testSetGenerationId'] as String?,
      testSetGenerationStatus: (json['testSetGenerationStatus'] as String?)
          ?.toTestSetGenerationStatus(),
      testSetName: json['testSetName'] as String?,
      testSetTags: (json['testSetTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final generationDataSource = this.generationDataSource;
    final roleArn = this.roleArn;
    final storageLocation = this.storageLocation;
    final testSetGenerationId = this.testSetGenerationId;
    final testSetGenerationStatus = this.testSetGenerationStatus;
    final testSetName = this.testSetName;
    final testSetTags = this.testSetTags;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (generationDataSource != null)
        'generationDataSource': generationDataSource,
      if (roleArn != null) 'roleArn': roleArn,
      if (storageLocation != null) 'storageLocation': storageLocation,
      if (testSetGenerationId != null)
        'testSetGenerationId': testSetGenerationId,
      if (testSetGenerationStatus != null)
        'testSetGenerationStatus': testSetGenerationStatus.toValue(),
      if (testSetName != null) 'testSetName': testSetName,
      if (testSetTags != null) 'testSetTags': testSetTags,
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

enum TestExecutionApiMode {
  streaming,
  nonStreaming,
}

extension TestExecutionApiModeValueExtension on TestExecutionApiMode {
  String toValue() {
    switch (this) {
      case TestExecutionApiMode.streaming:
        return 'Streaming';
      case TestExecutionApiMode.nonStreaming:
        return 'NonStreaming';
    }
  }
}

extension TestExecutionApiModeFromString on String {
  TestExecutionApiMode toTestExecutionApiMode() {
    switch (this) {
      case 'Streaming':
        return TestExecutionApiMode.streaming;
      case 'NonStreaming':
        return TestExecutionApiMode.nonStreaming;
    }
    throw Exception('$this is not known in enum TestExecutionApiMode');
  }
}

enum TestExecutionModality {
  text,
  audio,
}

extension TestExecutionModalityValueExtension on TestExecutionModality {
  String toValue() {
    switch (this) {
      case TestExecutionModality.text:
        return 'Text';
      case TestExecutionModality.audio:
        return 'Audio';
    }
  }
}

extension TestExecutionModalityFromString on String {
  TestExecutionModality toTestExecutionModality() {
    switch (this) {
      case 'Text':
        return TestExecutionModality.text;
      case 'Audio':
        return TestExecutionModality.audio;
    }
    throw Exception('$this is not known in enum TestExecutionModality');
  }
}

/// Contains information about the method by which to filter the results of the
/// test execution.
class TestExecutionResultFilterBy {
  /// Specifies which results to filter. See <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/test-results-details-test-set.html">Test
  /// result details"&gt;Test results details</a> for details about different
  /// types of results.
  final TestResultTypeFilter resultTypeFilter;

  /// Contains information about the method for filtering Conversation level test
  /// results.
  final ConversationLevelTestResultsFilterBy?
      conversationLevelTestResultsFilterBy;

  TestExecutionResultFilterBy({
    required this.resultTypeFilter,
    this.conversationLevelTestResultsFilterBy,
  });

  Map<String, dynamic> toJson() {
    final resultTypeFilter = this.resultTypeFilter;
    final conversationLevelTestResultsFilterBy =
        this.conversationLevelTestResultsFilterBy;
    return {
      'resultTypeFilter': resultTypeFilter.toValue(),
      if (conversationLevelTestResultsFilterBy != null)
        'conversationLevelTestResultsFilterBy':
            conversationLevelTestResultsFilterBy,
    };
  }
}

/// Contains the results of the test execution, grouped by type of results. See
/// <a
/// href="https://docs.aws.amazon.com/lexv2/latest/dg/test-results-details-test-set.html">Test
/// result details"&gt;Test results details</a> for details about different
/// types of results.
class TestExecutionResultItems {
  /// Results related to conversations in the test set, including metrics about
  /// success and failure of conversations and intent and slot failures.
  final ConversationLevelTestResults? conversationLevelTestResults;

  /// Intent recognition results aggregated by intent name. The aggregated results
  /// contain success and failure rates of intent recognition, speech
  /// transcriptions, and end-to-end conversations.
  final IntentClassificationTestResults? intentClassificationTestResults;

  /// Slot resolution results aggregated by intent and slot name. The aggregated
  /// results contain success and failure rates of slot resolution, speech
  /// transcriptions, and end-to-end conversations
  final IntentLevelSlotResolutionTestResults?
      intentLevelSlotResolutionTestResults;

  /// Overall results for the test execution, including the breakdown of
  /// conversations and single-input utterances.
  final OverallTestResults? overallTestResults;

  /// Results related to utterances in the test set.
  final UtteranceLevelTestResults? utteranceLevelTestResults;

  TestExecutionResultItems({
    this.conversationLevelTestResults,
    this.intentClassificationTestResults,
    this.intentLevelSlotResolutionTestResults,
    this.overallTestResults,
    this.utteranceLevelTestResults,
  });

  factory TestExecutionResultItems.fromJson(Map<String, dynamic> json) {
    return TestExecutionResultItems(
      conversationLevelTestResults: json['conversationLevelTestResults'] != null
          ? ConversationLevelTestResults.fromJson(
              json['conversationLevelTestResults'] as Map<String, dynamic>)
          : null,
      intentClassificationTestResults:
          json['intentClassificationTestResults'] != null
              ? IntentClassificationTestResults.fromJson(
                  json['intentClassificationTestResults']
                      as Map<String, dynamic>)
              : null,
      intentLevelSlotResolutionTestResults:
          json['intentLevelSlotResolutionTestResults'] != null
              ? IntentLevelSlotResolutionTestResults.fromJson(
                  json['intentLevelSlotResolutionTestResults']
                      as Map<String, dynamic>)
              : null,
      overallTestResults: json['overallTestResults'] != null
          ? OverallTestResults.fromJson(
              json['overallTestResults'] as Map<String, dynamic>)
          : null,
      utteranceLevelTestResults: json['utteranceLevelTestResults'] != null
          ? UtteranceLevelTestResults.fromJson(
              json['utteranceLevelTestResults'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final conversationLevelTestResults = this.conversationLevelTestResults;
    final intentClassificationTestResults =
        this.intentClassificationTestResults;
    final intentLevelSlotResolutionTestResults =
        this.intentLevelSlotResolutionTestResults;
    final overallTestResults = this.overallTestResults;
    final utteranceLevelTestResults = this.utteranceLevelTestResults;
    return {
      if (conversationLevelTestResults != null)
        'conversationLevelTestResults': conversationLevelTestResults,
      if (intentClassificationTestResults != null)
        'intentClassificationTestResults': intentClassificationTestResults,
      if (intentLevelSlotResolutionTestResults != null)
        'intentLevelSlotResolutionTestResults':
            intentLevelSlotResolutionTestResults,
      if (overallTestResults != null) 'overallTestResults': overallTestResults,
      if (utteranceLevelTestResults != null)
        'utteranceLevelTestResults': utteranceLevelTestResults,
    };
  }
}

enum TestExecutionSortAttribute {
  testSetName,
  creationDateTime,
}

extension TestExecutionSortAttributeValueExtension
    on TestExecutionSortAttribute {
  String toValue() {
    switch (this) {
      case TestExecutionSortAttribute.testSetName:
        return 'TestSetName';
      case TestExecutionSortAttribute.creationDateTime:
        return 'CreationDateTime';
    }
  }
}

extension TestExecutionSortAttributeFromString on String {
  TestExecutionSortAttribute toTestExecutionSortAttribute() {
    switch (this) {
      case 'TestSetName':
        return TestExecutionSortAttribute.testSetName;
      case 'CreationDateTime':
        return TestExecutionSortAttribute.creationDateTime;
    }
    throw Exception('$this is not known in enum TestExecutionSortAttribute');
  }
}

/// Contains information about the method by which to sort the instances of test
/// executions you have carried out.
class TestExecutionSortBy {
  /// Specifies whether to sort the test set executions by the date and time at
  /// which the test sets were created.
  final TestExecutionSortAttribute attribute;

  /// Specifies whether to sort in ascending or descending order.
  final SortOrder order;

  TestExecutionSortBy({
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

enum TestExecutionStatus {
  pending,
  waiting,
  inProgress,
  completed,
  failed,
  stopping,
  stopped,
}

extension TestExecutionStatusValueExtension on TestExecutionStatus {
  String toValue() {
    switch (this) {
      case TestExecutionStatus.pending:
        return 'Pending';
      case TestExecutionStatus.waiting:
        return 'Waiting';
      case TestExecutionStatus.inProgress:
        return 'InProgress';
      case TestExecutionStatus.completed:
        return 'Completed';
      case TestExecutionStatus.failed:
        return 'Failed';
      case TestExecutionStatus.stopping:
        return 'Stopping';
      case TestExecutionStatus.stopped:
        return 'Stopped';
    }
  }
}

extension TestExecutionStatusFromString on String {
  TestExecutionStatus toTestExecutionStatus() {
    switch (this) {
      case 'Pending':
        return TestExecutionStatus.pending;
      case 'Waiting':
        return TestExecutionStatus.waiting;
      case 'InProgress':
        return TestExecutionStatus.inProgress;
      case 'Completed':
        return TestExecutionStatus.completed;
      case 'Failed':
        return TestExecutionStatus.failed;
      case 'Stopping':
        return TestExecutionStatus.stopping;
      case 'Stopped':
        return TestExecutionStatus.stopped;
    }
    throw Exception('$this is not known in enum TestExecutionStatus');
  }
}

/// Summarizes metadata about the test execution.
class TestExecutionSummary {
  /// Specifies whether the API mode for the test execution is streaming or
  /// non-streaming.
  final TestExecutionApiMode? apiMode;

  /// The date and time at which the test execution was created.
  final DateTime? creationDateTime;

  /// The date and time at which the test execution was last updated.
  final DateTime? lastUpdatedDateTime;

  /// Contains information about the bot used for the test execution..
  final TestExecutionTarget? target;

  /// The unique identifier of the test execution.
  final String? testExecutionId;

  /// Specifies whether the data used for the test execution is written or spoken.
  final TestExecutionModality? testExecutionModality;

  /// The current status of the test execution.
  final TestExecutionStatus? testExecutionStatus;

  /// The unique identifier of the test set used in the test execution.
  final String? testSetId;

  /// The name of the test set used in the test execution.
  final String? testSetName;

  TestExecutionSummary({
    this.apiMode,
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.target,
    this.testExecutionId,
    this.testExecutionModality,
    this.testExecutionStatus,
    this.testSetId,
    this.testSetName,
  });

  factory TestExecutionSummary.fromJson(Map<String, dynamic> json) {
    return TestExecutionSummary(
      apiMode: (json['apiMode'] as String?)?.toTestExecutionApiMode(),
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      target: json['target'] != null
          ? TestExecutionTarget.fromJson(json['target'] as Map<String, dynamic>)
          : null,
      testExecutionId: json['testExecutionId'] as String?,
      testExecutionModality:
          (json['testExecutionModality'] as String?)?.toTestExecutionModality(),
      testExecutionStatus:
          (json['testExecutionStatus'] as String?)?.toTestExecutionStatus(),
      testSetId: json['testSetId'] as String?,
      testSetName: json['testSetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiMode = this.apiMode;
    final creationDateTime = this.creationDateTime;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final target = this.target;
    final testExecutionId = this.testExecutionId;
    final testExecutionModality = this.testExecutionModality;
    final testExecutionStatus = this.testExecutionStatus;
    final testSetId = this.testSetId;
    final testSetName = this.testSetName;
    return {
      if (apiMode != null) 'apiMode': apiMode.toValue(),
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (target != null) 'target': target,
      if (testExecutionId != null) 'testExecutionId': testExecutionId,
      if (testExecutionModality != null)
        'testExecutionModality': testExecutionModality.toValue(),
      if (testExecutionStatus != null)
        'testExecutionStatus': testExecutionStatus.toValue(),
      if (testSetId != null) 'testSetId': testSetId,
      if (testSetName != null) 'testSetName': testSetName,
    };
  }
}

/// Contains information about the bot used for the test execution.
class TestExecutionTarget {
  /// Contains information about the bot alias used for the test execution.
  final BotAliasTestExecutionTarget? botAliasTarget;

  TestExecutionTarget({
    this.botAliasTarget,
  });

  factory TestExecutionTarget.fromJson(Map<String, dynamic> json) {
    return TestExecutionTarget(
      botAliasTarget: json['botAliasTarget'] != null
          ? BotAliasTestExecutionTarget.fromJson(
              json['botAliasTarget'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasTarget = this.botAliasTarget;
    return {
      if (botAliasTarget != null) 'botAliasTarget': botAliasTarget,
    };
  }
}

enum TestResultMatchStatus {
  matched,
  mismatched,
  executionError,
}

extension TestResultMatchStatusValueExtension on TestResultMatchStatus {
  String toValue() {
    switch (this) {
      case TestResultMatchStatus.matched:
        return 'Matched';
      case TestResultMatchStatus.mismatched:
        return 'Mismatched';
      case TestResultMatchStatus.executionError:
        return 'ExecutionError';
    }
  }
}

extension TestResultMatchStatusFromString on String {
  TestResultMatchStatus toTestResultMatchStatus() {
    switch (this) {
      case 'Matched':
        return TestResultMatchStatus.matched;
      case 'Mismatched':
        return TestResultMatchStatus.mismatched;
      case 'ExecutionError':
        return TestResultMatchStatus.executionError;
    }
    throw Exception('$this is not known in enum TestResultMatchStatus');
  }
}

enum TestResultTypeFilter {
  overallTestResults,
  conversationLevelTestResults,
  intentClassificationTestResults,
  slotResolutionTestResults,
  utteranceLevelResults,
}

extension TestResultTypeFilterValueExtension on TestResultTypeFilter {
  String toValue() {
    switch (this) {
      case TestResultTypeFilter.overallTestResults:
        return 'OverallTestResults';
      case TestResultTypeFilter.conversationLevelTestResults:
        return 'ConversationLevelTestResults';
      case TestResultTypeFilter.intentClassificationTestResults:
        return 'IntentClassificationTestResults';
      case TestResultTypeFilter.slotResolutionTestResults:
        return 'SlotResolutionTestResults';
      case TestResultTypeFilter.utteranceLevelResults:
        return 'UtteranceLevelResults';
    }
  }
}

extension TestResultTypeFilterFromString on String {
  TestResultTypeFilter toTestResultTypeFilter() {
    switch (this) {
      case 'OverallTestResults':
        return TestResultTypeFilter.overallTestResults;
      case 'ConversationLevelTestResults':
        return TestResultTypeFilter.conversationLevelTestResults;
      case 'IntentClassificationTestResults':
        return TestResultTypeFilter.intentClassificationTestResults;
      case 'SlotResolutionTestResults':
        return TestResultTypeFilter.slotResolutionTestResults;
      case 'UtteranceLevelResults':
        return TestResultTypeFilter.utteranceLevelResults;
    }
    throw Exception('$this is not known in enum TestResultTypeFilter');
  }
}

/// Contains details about the errors in the test set discrepancy report
class TestSetDiscrepancyErrors {
  /// Contains information about discrepancies found for intents between the test
  /// set and the bot.
  final List<TestSetIntentDiscrepancyItem> intentDiscrepancies;

  /// Contains information about discrepancies found for slots between the test
  /// set and the bot.
  final List<TestSetSlotDiscrepancyItem> slotDiscrepancies;

  TestSetDiscrepancyErrors({
    required this.intentDiscrepancies,
    required this.slotDiscrepancies,
  });

  factory TestSetDiscrepancyErrors.fromJson(Map<String, dynamic> json) {
    return TestSetDiscrepancyErrors(
      intentDiscrepancies: (json['intentDiscrepancies'] as List)
          .whereNotNull()
          .map((e) =>
              TestSetIntentDiscrepancyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      slotDiscrepancies: (json['slotDiscrepancies'] as List)
          .whereNotNull()
          .map((e) =>
              TestSetSlotDiscrepancyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final intentDiscrepancies = this.intentDiscrepancies;
    final slotDiscrepancies = this.slotDiscrepancies;
    return {
      'intentDiscrepancies': intentDiscrepancies,
      'slotDiscrepancies': slotDiscrepancies,
    };
  }
}

/// Contains information about the bot alias used for the test set discrepancy
/// report.
class TestSetDiscrepancyReportBotAliasTarget {
  /// The unique identifier for the bot associated with the bot alias.
  final String botAliasId;

  /// The unique identifier for the bot alias.
  final String botId;

  /// The unique identifier of the locale associated with the bot alias.
  final String localeId;

  TestSetDiscrepancyReportBotAliasTarget({
    required this.botAliasId,
    required this.botId,
    required this.localeId,
  });

  factory TestSetDiscrepancyReportBotAliasTarget.fromJson(
      Map<String, dynamic> json) {
    return TestSetDiscrepancyReportBotAliasTarget(
      botAliasId: json['botAliasId'] as String,
      botId: json['botId'] as String,
      localeId: json['localeId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasId = this.botAliasId;
    final botId = this.botId;
    final localeId = this.localeId;
    return {
      'botAliasId': botAliasId,
      'botId': botId,
      'localeId': localeId,
    };
  }
}

/// Contains information about the resource used for the test set discrepancy
/// report.
class TestSetDiscrepancyReportResourceTarget {
  /// Contains information about the bot alias used as the resource for the test
  /// set discrepancy report.
  final TestSetDiscrepancyReportBotAliasTarget? botAliasTarget;

  TestSetDiscrepancyReportResourceTarget({
    this.botAliasTarget,
  });

  factory TestSetDiscrepancyReportResourceTarget.fromJson(
      Map<String, dynamic> json) {
    return TestSetDiscrepancyReportResourceTarget(
      botAliasTarget: json['botAliasTarget'] != null
          ? TestSetDiscrepancyReportBotAliasTarget.fromJson(
              json['botAliasTarget'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasTarget = this.botAliasTarget;
    return {
      if (botAliasTarget != null) 'botAliasTarget': botAliasTarget,
    };
  }
}

enum TestSetDiscrepancyReportStatus {
  inProgress,
  completed,
  failed,
}

extension TestSetDiscrepancyReportStatusValueExtension
    on TestSetDiscrepancyReportStatus {
  String toValue() {
    switch (this) {
      case TestSetDiscrepancyReportStatus.inProgress:
        return 'InProgress';
      case TestSetDiscrepancyReportStatus.completed:
        return 'Completed';
      case TestSetDiscrepancyReportStatus.failed:
        return 'Failed';
    }
  }
}

extension TestSetDiscrepancyReportStatusFromString on String {
  TestSetDiscrepancyReportStatus toTestSetDiscrepancyReportStatus() {
    switch (this) {
      case 'InProgress':
        return TestSetDiscrepancyReportStatus.inProgress;
      case 'Completed':
        return TestSetDiscrepancyReportStatus.completed;
      case 'Failed':
        return TestSetDiscrepancyReportStatus.failed;
    }
    throw Exception(
        '$this is not known in enum TestSetDiscrepancyReportStatus');
  }
}

/// Contains information about the test set that is exported.
class TestSetExportSpecification {
  /// The unique identifier of the test set.
  final String testSetId;

  TestSetExportSpecification({
    required this.testSetId,
  });

  factory TestSetExportSpecification.fromJson(Map<String, dynamic> json) {
    return TestSetExportSpecification(
      testSetId: json['testSetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final testSetId = this.testSetId;
    return {
      'testSetId': testSetId,
    };
  }
}

/// Contains information about the data source from which the test set is
/// generated.
class TestSetGenerationDataSource {
  /// Contains information about the bot from which the conversation logs are
  /// sourced.
  final ConversationLogsDataSource? conversationLogsDataSource;

  TestSetGenerationDataSource({
    this.conversationLogsDataSource,
  });

  factory TestSetGenerationDataSource.fromJson(Map<String, dynamic> json) {
    return TestSetGenerationDataSource(
      conversationLogsDataSource: json['conversationLogsDataSource'] != null
          ? ConversationLogsDataSource.fromJson(
              json['conversationLogsDataSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final conversationLogsDataSource = this.conversationLogsDataSource;
    return {
      if (conversationLogsDataSource != null)
        'conversationLogsDataSource': conversationLogsDataSource,
    };
  }
}

enum TestSetGenerationStatus {
  generating,
  ready,
  failed,
  pending,
}

extension TestSetGenerationStatusValueExtension on TestSetGenerationStatus {
  String toValue() {
    switch (this) {
      case TestSetGenerationStatus.generating:
        return 'Generating';
      case TestSetGenerationStatus.ready:
        return 'Ready';
      case TestSetGenerationStatus.failed:
        return 'Failed';
      case TestSetGenerationStatus.pending:
        return 'Pending';
    }
  }
}

extension TestSetGenerationStatusFromString on String {
  TestSetGenerationStatus toTestSetGenerationStatus() {
    switch (this) {
      case 'Generating':
        return TestSetGenerationStatus.generating;
      case 'Ready':
        return TestSetGenerationStatus.ready;
      case 'Failed':
        return TestSetGenerationStatus.failed;
      case 'Pending':
        return TestSetGenerationStatus.pending;
    }
    throw Exception('$this is not known in enum TestSetGenerationStatus');
  }
}

/// Contains information about the Amazon S3 location from which the test set is
/// imported.
class TestSetImportInputLocation {
  /// The name of the Amazon S3 bucket.
  final String s3BucketName;

  /// The path inside the Amazon S3 bucket pointing to the test-set CSV file.
  final String s3Path;

  TestSetImportInputLocation({
    required this.s3BucketName,
    required this.s3Path,
  });

  factory TestSetImportInputLocation.fromJson(Map<String, dynamic> json) {
    return TestSetImportInputLocation(
      s3BucketName: json['s3BucketName'] as String,
      s3Path: json['s3Path'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final s3Path = this.s3Path;
    return {
      's3BucketName': s3BucketName,
      's3Path': s3Path,
    };
  }
}

/// Contains information about the test set that is imported.
class TestSetImportResourceSpecification {
  /// Contains information about the input location from where test-set should be
  /// imported.
  final TestSetImportInputLocation importInputLocation;

  /// Specifies whether the test-set being imported contains written or spoken
  /// data.
  final TestSetModality modality;

  /// The Amazon Resource Name (ARN) of an IAM role that has permission to access
  /// the test set.
  final String roleArn;

  /// Contains information about the location that Amazon Lex uses to store the
  /// test-set.
  final TestSetStorageLocation storageLocation;

  /// The name of the test set.
  final String testSetName;

  /// The description of the test set.
  final String? description;

  /// A list of tags to add to the test set. You can only add tags when you
  /// import/generate a new test set. You can't use the <code>UpdateTestSet</code>
  /// operation to update tags. To update tags, use the <code>TagResource</code>
  /// operation.
  final Map<String, String>? testSetTags;

  TestSetImportResourceSpecification({
    required this.importInputLocation,
    required this.modality,
    required this.roleArn,
    required this.storageLocation,
    required this.testSetName,
    this.description,
    this.testSetTags,
  });

  factory TestSetImportResourceSpecification.fromJson(
      Map<String, dynamic> json) {
    return TestSetImportResourceSpecification(
      importInputLocation: TestSetImportInputLocation.fromJson(
          json['importInputLocation'] as Map<String, dynamic>),
      modality: (json['modality'] as String).toTestSetModality(),
      roleArn: json['roleArn'] as String,
      storageLocation: TestSetStorageLocation.fromJson(
          json['storageLocation'] as Map<String, dynamic>),
      testSetName: json['testSetName'] as String,
      description: json['description'] as String?,
      testSetTags: (json['testSetTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final importInputLocation = this.importInputLocation;
    final modality = this.modality;
    final roleArn = this.roleArn;
    final storageLocation = this.storageLocation;
    final testSetName = this.testSetName;
    final description = this.description;
    final testSetTags = this.testSetTags;
    return {
      'importInputLocation': importInputLocation,
      'modality': modality.toValue(),
      'roleArn': roleArn,
      'storageLocation': storageLocation,
      'testSetName': testSetName,
      if (description != null) 'description': description,
      if (testSetTags != null) 'testSetTags': testSetTags,
    };
  }
}

/// Contains information about discrepancy in an intent information between the
/// test set and the bot.
class TestSetIntentDiscrepancyItem {
  /// The error message for a discrepancy for an intent between the test set and
  /// the bot.
  final String errorMessage;

  /// The name of the intent in the discrepancy report.
  final String intentName;

  TestSetIntentDiscrepancyItem({
    required this.errorMessage,
    required this.intentName,
  });

  factory TestSetIntentDiscrepancyItem.fromJson(Map<String, dynamic> json) {
    return TestSetIntentDiscrepancyItem(
      errorMessage: json['errorMessage'] as String,
      intentName: json['intentName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final intentName = this.intentName;
    return {
      'errorMessage': errorMessage,
      'intentName': intentName,
    };
  }
}

enum TestSetModality {
  text,
  audio,
}

extension TestSetModalityValueExtension on TestSetModality {
  String toValue() {
    switch (this) {
      case TestSetModality.text:
        return 'Text';
      case TestSetModality.audio:
        return 'Audio';
    }
  }
}

extension TestSetModalityFromString on String {
  TestSetModality toTestSetModality() {
    switch (this) {
      case 'Text':
        return TestSetModality.text;
      case 'Audio':
        return TestSetModality.audio;
    }
    throw Exception('$this is not known in enum TestSetModality');
  }
}

/// Contains information about discrepancy in a slot information between the
/// test set and the bot.
class TestSetSlotDiscrepancyItem {
  /// The error message for a discrepancy for an intent between the test set and
  /// the bot.
  final String errorMessage;

  /// The name of the intent associated with the slot in the discrepancy report.
  final String intentName;

  /// The name of the slot in the discrepancy report.
  final String slotName;

  TestSetSlotDiscrepancyItem({
    required this.errorMessage,
    required this.intentName,
    required this.slotName,
  });

  factory TestSetSlotDiscrepancyItem.fromJson(Map<String, dynamic> json) {
    return TestSetSlotDiscrepancyItem(
      errorMessage: json['errorMessage'] as String,
      intentName: json['intentName'] as String,
      slotName: json['slotName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final intentName = this.intentName;
    final slotName = this.slotName;
    return {
      'errorMessage': errorMessage,
      'intentName': intentName,
      'slotName': slotName,
    };
  }
}

enum TestSetSortAttribute {
  testSetName,
  lastUpdatedDateTime,
}

extension TestSetSortAttributeValueExtension on TestSetSortAttribute {
  String toValue() {
    switch (this) {
      case TestSetSortAttribute.testSetName:
        return 'TestSetName';
      case TestSetSortAttribute.lastUpdatedDateTime:
        return 'LastUpdatedDateTime';
    }
  }
}

extension TestSetSortAttributeFromString on String {
  TestSetSortAttribute toTestSetSortAttribute() {
    switch (this) {
      case 'TestSetName':
        return TestSetSortAttribute.testSetName;
      case 'LastUpdatedDateTime':
        return TestSetSortAttribute.lastUpdatedDateTime;
    }
    throw Exception('$this is not known in enum TestSetSortAttribute');
  }
}

/// Contains information about the methods by which to sort the test set.
class TestSetSortBy {
  /// Specifies whether to sort the test sets by name or by the time they were
  /// last updated.
  final TestSetSortAttribute attribute;

  /// Specifies whether to sort in ascending or descending order.
  final SortOrder order;

  TestSetSortBy({
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

enum TestSetStatus {
  importing,
  pendingAnnotation,
  deleting,
  validationError,
  ready,
}

extension TestSetStatusValueExtension on TestSetStatus {
  String toValue() {
    switch (this) {
      case TestSetStatus.importing:
        return 'Importing';
      case TestSetStatus.pendingAnnotation:
        return 'PendingAnnotation';
      case TestSetStatus.deleting:
        return 'Deleting';
      case TestSetStatus.validationError:
        return 'ValidationError';
      case TestSetStatus.ready:
        return 'Ready';
    }
  }
}

extension TestSetStatusFromString on String {
  TestSetStatus toTestSetStatus() {
    switch (this) {
      case 'Importing':
        return TestSetStatus.importing;
      case 'PendingAnnotation':
        return TestSetStatus.pendingAnnotation;
      case 'Deleting':
        return TestSetStatus.deleting;
      case 'ValidationError':
        return TestSetStatus.validationError;
      case 'Ready':
        return TestSetStatus.ready;
    }
    throw Exception('$this is not known in enum TestSetStatus');
  }
}

/// Contains information about the location in which the test set is stored.
class TestSetStorageLocation {
  /// The name of the Amazon S3 bucket in which the test set is stored.
  final String s3BucketName;

  /// The path inside the Amazon S3 bucket where the test set is stored.
  final String s3Path;

  /// The Amazon Resource Name (ARN) of an Amazon Web Services Key Management
  /// Service (KMS) key for encrypting the test set.
  final String? kmsKeyArn;

  TestSetStorageLocation({
    required this.s3BucketName,
    required this.s3Path,
    this.kmsKeyArn,
  });

  factory TestSetStorageLocation.fromJson(Map<String, dynamic> json) {
    return TestSetStorageLocation(
      s3BucketName: json['s3BucketName'] as String,
      s3Path: json['s3Path'] as String,
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final s3Path = this.s3Path;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      's3BucketName': s3BucketName,
      's3Path': s3Path,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// Contains summary information about the test set.
class TestSetSummary {
  /// The date and time at which the test set was created.
  final DateTime? creationDateTime;

  /// The description of the test set.
  final String? description;

  /// The date and time at which the test set was last updated.
  final DateTime? lastUpdatedDateTime;

  /// Specifies whether the test set contains written or spoken data.
  final TestSetModality? modality;

  /// The number of turns in the test set.
  final int? numTurns;

  /// The Amazon Resource Name (ARN) of an IAM role that has permission to access
  /// the test set.
  final String? roleArn;

  /// The status of the test set.
  final TestSetStatus? status;

  /// Contains information about the location at which the test set is stored.
  final TestSetStorageLocation? storageLocation;

  /// The unique identifier of the test set.
  final String? testSetId;

  /// The name of the test set.
  final String? testSetName;

  TestSetSummary({
    this.creationDateTime,
    this.description,
    this.lastUpdatedDateTime,
    this.modality,
    this.numTurns,
    this.roleArn,
    this.status,
    this.storageLocation,
    this.testSetId,
    this.testSetName,
  });

  factory TestSetSummary.fromJson(Map<String, dynamic> json) {
    return TestSetSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      modality: (json['modality'] as String?)?.toTestSetModality(),
      numTurns: json['numTurns'] as int?,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.toTestSetStatus(),
      storageLocation: json['storageLocation'] != null
          ? TestSetStorageLocation.fromJson(
              json['storageLocation'] as Map<String, dynamic>)
          : null,
      testSetId: json['testSetId'] as String?,
      testSetName: json['testSetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final modality = this.modality;
    final numTurns = this.numTurns;
    final roleArn = this.roleArn;
    final status = this.status;
    final storageLocation = this.storageLocation;
    final testSetId = this.testSetId;
    final testSetName = this.testSetName;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (modality != null) 'modality': modality.toValue(),
      if (numTurns != null) 'numTurns': numTurns,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.toValue(),
      if (storageLocation != null) 'storageLocation': storageLocation,
      if (testSetId != null) 'testSetId': testSetId,
      if (testSetName != null) 'testSetName': testSetName,
    };
  }
}

/// Contains information about a turn in a test set.
class TestSetTurnRecord {
  /// The record number associated with the turn.
  final int recordNumber;

  /// Contains information about the agent or user turn depending upon type of
  /// turn.
  final TurnSpecification turnSpecification;

  /// The unique identifier for the conversation associated with the turn.
  final String? conversationId;

  /// The number of turns that has elapsed up to that turn.
  final int? turnNumber;

  TestSetTurnRecord({
    required this.recordNumber,
    required this.turnSpecification,
    this.conversationId,
    this.turnNumber,
  });

  factory TestSetTurnRecord.fromJson(Map<String, dynamic> json) {
    return TestSetTurnRecord(
      recordNumber: json['recordNumber'] as int,
      turnSpecification: TurnSpecification.fromJson(
          json['turnSpecification'] as Map<String, dynamic>),
      conversationId: json['conversationId'] as String?,
      turnNumber: json['turnNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final recordNumber = this.recordNumber;
    final turnSpecification = this.turnSpecification;
    final conversationId = this.conversationId;
    final turnNumber = this.turnNumber;
    return {
      'recordNumber': recordNumber,
      'turnSpecification': turnSpecification,
      if (conversationId != null) 'conversationId': conversationId,
      if (turnNumber != null) 'turnNumber': turnNumber,
    };
  }
}

/// Contains information about the results of the analysis of a turn in the test
/// set.
class TestSetTurnResult {
  /// Contains information about the agent messages in the turn.
  final AgentTurnResult? agent;

  /// Contains information about the user messages in the turn.
  final UserTurnResult? user;

  TestSetTurnResult({
    this.agent,
    this.user,
  });

  factory TestSetTurnResult.fromJson(Map<String, dynamic> json) {
    return TestSetTurnResult(
      agent: json['agent'] != null
          ? AgentTurnResult.fromJson(json['agent'] as Map<String, dynamic>)
          : null,
      user: json['user'] != null
          ? UserTurnResult.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agent = this.agent;
    final user = this.user;
    return {
      if (agent != null) 'agent': agent,
      if (user != null) 'user': user,
    };
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

  /// The option to enable selective conversation log capture for text.
  final bool? selectiveLoggingEnabled;

  TextLogSetting({
    required this.destination,
    required this.enabled,
    this.selectiveLoggingEnabled,
  });

  factory TextLogSetting.fromJson(Map<String, dynamic> json) {
    return TextLogSetting(
      destination: TextLogDestination.fromJson(
          json['destination'] as Map<String, dynamic>),
      enabled: json['enabled'] as bool,
      selectiveLoggingEnabled: json['selectiveLoggingEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final enabled = this.enabled;
    final selectiveLoggingEnabled = this.selectiveLoggingEnabled;
    return {
      'destination': destination,
      'enabled': enabled,
      if (selectiveLoggingEnabled != null)
        'selectiveLoggingEnabled': selectiveLoggingEnabled,
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

/// Contains information about the messages in the turn.
class TurnSpecification {
  /// Contains information about the agent messages in the turn.
  final AgentTurnSpecification? agentTurn;

  /// Contains information about the user messages in the turn.
  final UserTurnSpecification? userTurn;

  TurnSpecification({
    this.agentTurn,
    this.userTurn,
  });

  factory TurnSpecification.fromJson(Map<String, dynamic> json) {
    return TurnSpecification(
      agentTurn: json['agentTurn'] != null
          ? AgentTurnSpecification.fromJson(
              json['agentTurn'] as Map<String, dynamic>)
          : null,
      userTurn: json['userTurn'] != null
          ? UserTurnSpecification.fromJson(
              json['userTurn'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentTurn = this.agentTurn;
    final userTurn = this.userTurn;
    return {
      if (agentTurn != null) 'agentTurn': agentTurn,
      if (userTurn != null) 'userTurn': userTurn,
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

  /// Contains settings for generative AI features powered by Amazon Bedrock for
  /// your bot locale.
  final GenerativeAISettings? generativeAISettings;

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
    this.generativeAISettings,
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
      generativeAISettings: json['generativeAISettings'] != null
          ? GenerativeAISettings.fromJson(
              json['generativeAISettings'] as Map<String, dynamic>)
          : null,
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
    final generativeAISettings = this.generativeAISettings;
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
      if (generativeAISettings != null)
        'generativeAISettings': generativeAISettings,
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

  /// Configuration settings for a response sent to the user before Amazon Lex
  /// starts eliciting slots.
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

  /// Details about the configuration of the built-in
  /// <code>Amazon.QnAIntent</code>.
  final QnAIntentConfiguration? qnAIntentConfiguration;

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
    this.qnAIntentConfiguration,
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
      qnAIntentConfiguration: json['qnAIntentConfiguration'] != null
          ? QnAIntentConfiguration.fromJson(
              json['qnAIntentConfiguration'] as Map<String, dynamic>)
          : null,
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
    final qnAIntentConfiguration = this.qnAIntentConfiguration;
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
      if (qnAIntentConfiguration != null)
        'qnAIntentConfiguration': qnAIntentConfiguration,
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

  /// The version of the bot that contains the slot. Will always be
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

class UpdateTestSetResponse {
  /// The creation date and time for the updated test set.
  final DateTime? creationDateTime;

  /// The test set description for the updated test set.
  final String? description;

  /// The date and time of the last update for the updated test set.
  final DateTime? lastUpdatedDateTime;

  /// Indicates whether audio or text is used for the updated test set.
  final TestSetModality? modality;

  /// The number of conversation turns from the updated test set.
  final int? numTurns;

  /// The roleARN used for any operation in the test set to access resources in
  /// the Amazon Web Services account.
  final String? roleArn;

  /// The status for the updated test set.
  final TestSetStatus? status;

  /// The Amazon S3 storage location for the updated test set.
  final TestSetStorageLocation? storageLocation;

  /// The test set Id for which update test operation to be performed.
  final String? testSetId;

  /// The test set name for the updated test set.
  final String? testSetName;

  UpdateTestSetResponse({
    this.creationDateTime,
    this.description,
    this.lastUpdatedDateTime,
    this.modality,
    this.numTurns,
    this.roleArn,
    this.status,
    this.storageLocation,
    this.testSetId,
    this.testSetName,
  });

  factory UpdateTestSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTestSetResponse(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      modality: (json['modality'] as String?)?.toTestSetModality(),
      numTurns: json['numTurns'] as int?,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.toTestSetStatus(),
      storageLocation: json['storageLocation'] != null
          ? TestSetStorageLocation.fromJson(
              json['storageLocation'] as Map<String, dynamic>)
          : null,
      testSetId: json['testSetId'] as String?,
      testSetName: json['testSetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final modality = this.modality;
    final numTurns = this.numTurns;
    final roleArn = this.roleArn;
    final status = this.status;
    final storageLocation = this.storageLocation;
    final testSetId = this.testSetId;
    final testSetName = this.testSetName;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (modality != null) 'modality': modality.toValue(),
      if (numTurns != null) 'numTurns': numTurns,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.toValue(),
      if (storageLocation != null) 'storageLocation': storageLocation,
      if (testSetId != null) 'testSetId': testSetId,
      if (testSetName != null) 'testSetName': testSetName,
    };
  }
}

/// Contains information about the user messages in the turn in the input.
class UserTurnInputSpecification {
  /// The utterance input in the user turn.
  final UtteranceInputSpecification utteranceInput;

  /// Request attributes of the user turn.
  final Map<String, String>? requestAttributes;

  /// Contains information about the session state in the input.
  final InputSessionStateSpecification? sessionState;

  UserTurnInputSpecification({
    required this.utteranceInput,
    this.requestAttributes,
    this.sessionState,
  });

  factory UserTurnInputSpecification.fromJson(Map<String, dynamic> json) {
    return UserTurnInputSpecification(
      utteranceInput: UtteranceInputSpecification.fromJson(
          json['utteranceInput'] as Map<String, dynamic>),
      requestAttributes: (json['requestAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sessionState: json['sessionState'] != null
          ? InputSessionStateSpecification.fromJson(
              json['sessionState'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final utteranceInput = this.utteranceInput;
    final requestAttributes = this.requestAttributes;
    final sessionState = this.sessionState;
    return {
      'utteranceInput': utteranceInput,
      if (requestAttributes != null) 'requestAttributes': requestAttributes,
      if (sessionState != null) 'sessionState': sessionState,
    };
  }
}

/// Contains information about the intent that is output for the turn by the
/// test execution.
class UserTurnIntentOutput {
  /// The name of the intent.
  final String name;

  /// The slots associated with the intent.
  final Map<String, UserTurnSlotOutput>? slots;

  UserTurnIntentOutput({
    required this.name,
    this.slots,
  });

  factory UserTurnIntentOutput.fromJson(Map<String, dynamic> json) {
    return UserTurnIntentOutput(
      name: json['name'] as String,
      slots: (json['slots'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, UserTurnSlotOutput.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final slots = this.slots;
    return {
      'name': name,
      if (slots != null) 'slots': slots,
    };
  }
}

/// Contains results that are output for the user turn by the test execution.
class UserTurnOutputSpecification {
  /// Contains information about the intent.
  final UserTurnIntentOutput intent;

  /// The contexts that are active in the turn.
  final List<ActiveContext>? activeContexts;

  /// The transcript that is output for the user turn by the test execution.
  final String? transcript;

  UserTurnOutputSpecification({
    required this.intent,
    this.activeContexts,
    this.transcript,
  });

  factory UserTurnOutputSpecification.fromJson(Map<String, dynamic> json) {
    return UserTurnOutputSpecification(
      intent:
          UserTurnIntentOutput.fromJson(json['intent'] as Map<String, dynamic>),
      activeContexts: (json['activeContexts'] as List?)
          ?.whereNotNull()
          .map((e) => ActiveContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      transcript: json['transcript'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final intent = this.intent;
    final activeContexts = this.activeContexts;
    final transcript = this.transcript;
    return {
      'intent': intent,
      if (activeContexts != null) 'activeContexts': activeContexts,
      if (transcript != null) 'transcript': transcript,
    };
  }
}

/// Contains the results for the user turn by the test execution.
class UserTurnResult {
  /// Contains information about the expected output for the user turn.
  final UserTurnOutputSpecification expectedOutput;

  /// Contains information about the user messages in the turn in the input.
  final UserTurnInputSpecification input;

  /// Contains information about the actual output for the user turn.
  final UserTurnOutputSpecification? actualOutput;

  /// Contains information about the results related to the conversation
  /// associated with the user turn.
  final ConversationLevelResultDetail? conversationLevelResult;

  /// Specifies whether the expected and actual outputs match or not, or if there
  /// is an error in execution.
  final TestResultMatchStatus? endToEndResult;
  final ExecutionErrorDetails? errorDetails;

  /// Specifies whether the expected and actual intents match or not.
  final TestResultMatchStatus? intentMatchResult;

  /// Specifies whether the expected and actual slots match or not.
  final TestResultMatchStatus? slotMatchResult;

  /// Specifies whether the expected and actual speech transcriptions match or
  /// not, or if there is an error in execution.
  final TestResultMatchStatus? speechTranscriptionResult;

  UserTurnResult({
    required this.expectedOutput,
    required this.input,
    this.actualOutput,
    this.conversationLevelResult,
    this.endToEndResult,
    this.errorDetails,
    this.intentMatchResult,
    this.slotMatchResult,
    this.speechTranscriptionResult,
  });

  factory UserTurnResult.fromJson(Map<String, dynamic> json) {
    return UserTurnResult(
      expectedOutput: UserTurnOutputSpecification.fromJson(
          json['expectedOutput'] as Map<String, dynamic>),
      input: UserTurnInputSpecification.fromJson(
          json['input'] as Map<String, dynamic>),
      actualOutput: json['actualOutput'] != null
          ? UserTurnOutputSpecification.fromJson(
              json['actualOutput'] as Map<String, dynamic>)
          : null,
      conversationLevelResult: json['conversationLevelResult'] != null
          ? ConversationLevelResultDetail.fromJson(
              json['conversationLevelResult'] as Map<String, dynamic>)
          : null,
      endToEndResult:
          (json['endToEndResult'] as String?)?.toTestResultMatchStatus(),
      errorDetails: json['errorDetails'] != null
          ? ExecutionErrorDetails.fromJson(
              json['errorDetails'] as Map<String, dynamic>)
          : null,
      intentMatchResult:
          (json['intentMatchResult'] as String?)?.toTestResultMatchStatus(),
      slotMatchResult:
          (json['slotMatchResult'] as String?)?.toTestResultMatchStatus(),
      speechTranscriptionResult: (json['speechTranscriptionResult'] as String?)
          ?.toTestResultMatchStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final expectedOutput = this.expectedOutput;
    final input = this.input;
    final actualOutput = this.actualOutput;
    final conversationLevelResult = this.conversationLevelResult;
    final endToEndResult = this.endToEndResult;
    final errorDetails = this.errorDetails;
    final intentMatchResult = this.intentMatchResult;
    final slotMatchResult = this.slotMatchResult;
    final speechTranscriptionResult = this.speechTranscriptionResult;
    return {
      'expectedOutput': expectedOutput,
      'input': input,
      if (actualOutput != null) 'actualOutput': actualOutput,
      if (conversationLevelResult != null)
        'conversationLevelResult': conversationLevelResult,
      if (endToEndResult != null) 'endToEndResult': endToEndResult.toValue(),
      if (errorDetails != null) 'errorDetails': errorDetails,
      if (intentMatchResult != null)
        'intentMatchResult': intentMatchResult.toValue(),
      if (slotMatchResult != null) 'slotMatchResult': slotMatchResult.toValue(),
      if (speechTranscriptionResult != null)
        'speechTranscriptionResult': speechTranscriptionResult.toValue(),
    };
  }
}

/// Contains information about a slot output by the test set execution.
class UserTurnSlotOutput {
  /// A list of items mapping the name of the subslots to information about those
  /// subslots.
  final Map<String, UserTurnSlotOutput>? subSlots;

  /// The value output by the slot recognition.
  final String? value;

  /// Values that are output by the slot recognition.
  final List<UserTurnSlotOutput>? values;

  UserTurnSlotOutput({
    this.subSlots,
    this.value,
    this.values,
  });

  factory UserTurnSlotOutput.fromJson(Map<String, dynamic> json) {
    return UserTurnSlotOutput(
      subSlots: (json['subSlots'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, UserTurnSlotOutput.fromJson(e as Map<String, dynamic>))),
      value: json['value'] as String?,
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => UserTurnSlotOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subSlots = this.subSlots;
    final value = this.value;
    final values = this.values;
    return {
      if (subSlots != null) 'subSlots': subSlots,
      if (value != null) 'value': value,
      if (values != null) 'values': values,
    };
  }
}

/// Contains information about the expected and input values for the user turn.
class UserTurnSpecification {
  /// Contains results about the expected output for the user turn.
  final UserTurnOutputSpecification expected;

  /// Contains information about the user messages in the turn in the input.
  final UserTurnInputSpecification input;

  UserTurnSpecification({
    required this.expected,
    required this.input,
  });

  factory UserTurnSpecification.fromJson(Map<String, dynamic> json) {
    return UserTurnSpecification(
      expected: UserTurnOutputSpecification.fromJson(
          json['expected'] as Map<String, dynamic>),
      input: UserTurnInputSpecification.fromJson(
          json['input'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final expected = this.expected;
    final input = this.input;
    return {
      'expected': expected,
      'input': input,
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

/// Contains information about the audio for an utterance.
class UtteranceAudioInputSpecification {
  /// Amazon S3 file pointing to the audio.
  final String audioFileS3Location;

  UtteranceAudioInputSpecification({
    required this.audioFileS3Location,
  });

  factory UtteranceAudioInputSpecification.fromJson(Map<String, dynamic> json) {
    return UtteranceAudioInputSpecification(
      audioFileS3Location: json['audioFileS3Location'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final audioFileS3Location = this.audioFileS3Location;
    return {
      'audioFileS3Location': audioFileS3Location,
    };
  }
}

/// An object that contains a response to the utterance from the bot.
class UtteranceBotResponse {
  /// The text of the response to the utterance from the bot.
  final String? content;

  /// The type of the response. The following values are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>PlainText</code> – A plain text string.
  /// </li>
  /// <li>
  /// <code>CustomPayload</code> – A response string that you can customize to
  /// include data or metadata for your application.
  /// </li>
  /// <li>
  /// <code>SSML</code> – A string that includes Speech Synthesis Markup Language
  /// to customize the audio response.
  /// </li>
  /// <li>
  /// <code>ImageResponseCard</code> – An image with buttons that the customer can
  /// select. See <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_runtime_ImageResponseCard.html">ImageResponseCard</a>
  /// for more information.
  /// </li>
  /// </ul>
  final UtteranceContentType? contentType;
  final ImageResponseCard? imageResponseCard;

  UtteranceBotResponse({
    this.content,
    this.contentType,
    this.imageResponseCard,
  });

  factory UtteranceBotResponse.fromJson(Map<String, dynamic> json) {
    return UtteranceBotResponse(
      content: json['content'] as String?,
      contentType: (json['contentType'] as String?)?.toUtteranceContentType(),
      imageResponseCard: json['imageResponseCard'] != null
          ? ImageResponseCard.fromJson(
              json['imageResponseCard'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final contentType = this.contentType;
    final imageResponseCard = this.imageResponseCard;
    return {
      if (content != null) 'content': content,
      if (contentType != null) 'contentType': contentType.toValue(),
      if (imageResponseCard != null) 'imageResponseCard': imageResponseCard,
    };
  }
}

enum UtteranceContentType {
  plainText,
  customPayload,
  ssml,
  imageResponseCard,
}

extension UtteranceContentTypeValueExtension on UtteranceContentType {
  String toValue() {
    switch (this) {
      case UtteranceContentType.plainText:
        return 'PlainText';
      case UtteranceContentType.customPayload:
        return 'CustomPayload';
      case UtteranceContentType.ssml:
        return 'SSML';
      case UtteranceContentType.imageResponseCard:
        return 'ImageResponseCard';
    }
  }
}

extension UtteranceContentTypeFromString on String {
  UtteranceContentType toUtteranceContentType() {
    switch (this) {
      case 'PlainText':
        return UtteranceContentType.plainText;
      case 'CustomPayload':
        return UtteranceContentType.customPayload;
      case 'SSML':
        return UtteranceContentType.ssml;
      case 'ImageResponseCard':
        return UtteranceContentType.imageResponseCard;
    }
    throw Exception('$this is not known in enum UtteranceContentType');
  }
}

/// An object specifying the measure and method by which to sort the utterance
/// data.
class UtteranceDataSortBy {
  /// The measure by which to sort the utterance analytics data.
  ///
  /// <ul>
  /// <li>
  /// <code>Count</code> – The number of utterances.
  /// </li>
  /// <li>
  /// <code>UtteranceTimestamp</code> – The date and time of the utterance.
  /// </li>
  /// </ul>
  final AnalyticsUtteranceSortByName name;

  /// Specifies whether to sort the results in ascending or descending order.
  final AnalyticsSortOrder order;

  UtteranceDataSortBy({
    required this.name,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final order = this.order;
    return {
      'name': name.toValue(),
      'order': order.toValue(),
    };
  }
}

/// Contains information about input of an utterance.
class UtteranceInputSpecification {
  /// Contains information about the audio input for an utterance.
  final UtteranceAudioInputSpecification? audioInput;

  /// A text input transcription of the utterance. It is only applicable for
  /// test-sets containing text data.
  final String? textInput;

  UtteranceInputSpecification({
    this.audioInput,
    this.textInput,
  });

  factory UtteranceInputSpecification.fromJson(Map<String, dynamic> json) {
    return UtteranceInputSpecification(
      audioInput: json['audioInput'] != null
          ? UtteranceAudioInputSpecification.fromJson(
              json['audioInput'] as Map<String, dynamic>)
          : null,
      textInput: json['textInput'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioInput = this.audioInput;
    final textInput = this.textInput;
    return {
      if (audioInput != null) 'audioInput': audioInput,
      if (textInput != null) 'textInput': textInput,
    };
  }
}

/// Contains information about multiple utterances in the results of a test set
/// execution.
class UtteranceLevelTestResultItem {
  /// The record number of the result.
  final int recordNumber;

  /// Contains information about the turn associated with the result.
  final TestSetTurnResult turnResult;

  /// The unique identifier for the conversation associated with the result.
  final String? conversationId;

  UtteranceLevelTestResultItem({
    required this.recordNumber,
    required this.turnResult,
    this.conversationId,
  });

  factory UtteranceLevelTestResultItem.fromJson(Map<String, dynamic> json) {
    return UtteranceLevelTestResultItem(
      recordNumber: json['recordNumber'] as int,
      turnResult: TestSetTurnResult.fromJson(
          json['turnResult'] as Map<String, dynamic>),
      conversationId: json['conversationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recordNumber = this.recordNumber;
    final turnResult = this.turnResult;
    final conversationId = this.conversationId;
    return {
      'recordNumber': recordNumber,
      'turnResult': turnResult,
      if (conversationId != null) 'conversationId': conversationId,
    };
  }
}

/// Contains information about the utterances in the results of the test set
/// execution.
class UtteranceLevelTestResults {
  /// Contains information about an utterance in the results of the test set
  /// execution.
  final List<UtteranceLevelTestResultItem> items;

  UtteranceLevelTestResults({
    required this.items,
  });

  factory UtteranceLevelTestResults.fromJson(Map<String, dynamic> json) {
    return UtteranceLevelTestResults(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) =>
              UtteranceLevelTestResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    return {
      'items': items,
    };
  }
}

/// An object containing information about a specific utterance.
class UtteranceSpecification {
  /// The name of the intent that the utterance is associated to.
  final String? associatedIntentName;

  /// The name of the slot that the utterance is associated to.
  final String? associatedSlotName;

  /// The duration in milliseconds of the audio associated with the utterance.
  final int? audioVoiceDurationMillis;

  /// The identifier of the alias of the bot that the utterance was made to.
  final String? botAliasId;

  /// The identifier for the audio of the bot response.
  final String? botResponseAudioVoiceId;

  /// A list of objects containing information about the bot response to the
  /// utterance.
  final List<UtteranceBotResponse>? botResponses;

  /// The version of the bot that the utterance was made to.
  final String? botVersion;

  /// The channel that is integrated with the bot that the utterance was made to.
  final String? channel;

  /// The date and time when the conversation in which the utterance took place
  /// ended. A conversation is defined as a unique combination of a
  /// <code>sessionId</code> and an <code>originatingRequestId</code>.
  final DateTime? conversationEndTime;

  /// The date and time when the conversation in which the utterance took place
  /// began. A conversation is defined as a unique combination of a
  /// <code>sessionId</code> and an <code>originatingRequestId</code>.
  final DateTime? conversationStartTime;

  /// The type of dialog action that the utterance is associated to. See the
  /// <code>type</code> field in <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/APIReference/API_runtime_DialogAction.html">DialogAction</a>
  /// for more information.
  final String? dialogActionType;

  /// The input type of the utterance. The possible values are as follows:
  ///
  /// <ul>
  /// <li>
  /// PCM format: audio data must be in little-endian byte order.
  ///
  /// <ul>
  /// <li>
  /// <code>audio/l16; rate=16000; channels=1</code>
  /// </li>
  /// <li>
  /// <code>audio/x-l16; sample-rate=16000; channel-count=1</code>
  /// </li>
  /// <li>
  /// <code>audio/lpcm; sample-rate=8000; sample-size-bits=16; channel-count=1;
  /// is-big-endian=false</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Opus format
  ///
  /// <ul>
  /// <li>
  /// <code>audio/x-cbr-opus-with-preamble;preamble-size=0;bit-rate=256000;frame-size-milliseconds=4</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Text format
  ///
  /// <ul>
  /// <li>
  /// <code>text/plain; charset=utf-8</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  final String? inputType;

  /// The state of the intent that the utterance is associated to.
  final IntentState? intentState;

  /// The locale of the bot that the utterance was made to.
  final String? localeId;

  /// The mode of the session. The possible values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>Speech</code> – The session consisted of spoken dialogue.
  /// </li>
  /// <li>
  /// <code>Text</code> – The session consisted of written dialogue.
  /// </li>
  /// <li>
  /// <code>DTMF</code> – The session consisted of touch-tone keypad (Dual Tone
  /// Multi-Frequency) key presses.
  /// </li>
  /// <li>
  /// <code>MultiMode</code> – The session consisted of multiple modes.
  /// </li>
  /// </ul>
  final AnalyticsModality? mode;

  /// The output type of the utterance. The possible values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>audio/mpeg</code>
  /// </li>
  /// <li>
  /// <code>audio/ogg</code>
  /// </li>
  /// <li>
  /// <code>audio/pcm (16 KHz)</code>
  /// </li>
  /// <li>
  /// <code>audio/</code> (defaults to <code>mpeg</code>)
  /// </li>
  /// <li>
  /// <code>text/plain; charset=utf-8</code>
  /// </li>
  /// </ul>
  final String? outputType;

  /// The identifier of the session that the utterance was made in.
  final String? sessionId;

  /// The slots that have been filled in the session by the time of the utterance.
  final String? slotsFilledInSession;

  /// The text of the utterance.
  final String? utterance;

  /// The identifier of the request associated with the utterance.
  final String? utteranceRequestId;

  /// The date and time when the utterance took place.
  final DateTime? utteranceTimestamp;

  /// Specifies whether the bot understood the utterance or not.
  final bool? utteranceUnderstood;

  UtteranceSpecification({
    this.associatedIntentName,
    this.associatedSlotName,
    this.audioVoiceDurationMillis,
    this.botAliasId,
    this.botResponseAudioVoiceId,
    this.botResponses,
    this.botVersion,
    this.channel,
    this.conversationEndTime,
    this.conversationStartTime,
    this.dialogActionType,
    this.inputType,
    this.intentState,
    this.localeId,
    this.mode,
    this.outputType,
    this.sessionId,
    this.slotsFilledInSession,
    this.utterance,
    this.utteranceRequestId,
    this.utteranceTimestamp,
    this.utteranceUnderstood,
  });

  factory UtteranceSpecification.fromJson(Map<String, dynamic> json) {
    return UtteranceSpecification(
      associatedIntentName: json['associatedIntentName'] as String?,
      associatedSlotName: json['associatedSlotName'] as String?,
      audioVoiceDurationMillis: json['audioVoiceDurationMillis'] as int?,
      botAliasId: json['botAliasId'] as String?,
      botResponseAudioVoiceId: json['botResponseAudioVoiceId'] as String?,
      botResponses: (json['botResponses'] as List?)
          ?.whereNotNull()
          .map((e) => UtteranceBotResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      botVersion: json['botVersion'] as String?,
      channel: json['channel'] as String?,
      conversationEndTime: timeStampFromJson(json['conversationEndTime']),
      conversationStartTime: timeStampFromJson(json['conversationStartTime']),
      dialogActionType: json['dialogActionType'] as String?,
      inputType: json['inputType'] as String?,
      intentState: (json['intentState'] as String?)?.toIntentState(),
      localeId: json['localeId'] as String?,
      mode: (json['mode'] as String?)?.toAnalyticsModality(),
      outputType: json['outputType'] as String?,
      sessionId: json['sessionId'] as String?,
      slotsFilledInSession: json['slotsFilledInSession'] as String?,
      utterance: json['utterance'] as String?,
      utteranceRequestId: json['utteranceRequestId'] as String?,
      utteranceTimestamp: timeStampFromJson(json['utteranceTimestamp']),
      utteranceUnderstood: json['utteranceUnderstood'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedIntentName = this.associatedIntentName;
    final associatedSlotName = this.associatedSlotName;
    final audioVoiceDurationMillis = this.audioVoiceDurationMillis;
    final botAliasId = this.botAliasId;
    final botResponseAudioVoiceId = this.botResponseAudioVoiceId;
    final botResponses = this.botResponses;
    final botVersion = this.botVersion;
    final channel = this.channel;
    final conversationEndTime = this.conversationEndTime;
    final conversationStartTime = this.conversationStartTime;
    final dialogActionType = this.dialogActionType;
    final inputType = this.inputType;
    final intentState = this.intentState;
    final localeId = this.localeId;
    final mode = this.mode;
    final outputType = this.outputType;
    final sessionId = this.sessionId;
    final slotsFilledInSession = this.slotsFilledInSession;
    final utterance = this.utterance;
    final utteranceRequestId = this.utteranceRequestId;
    final utteranceTimestamp = this.utteranceTimestamp;
    final utteranceUnderstood = this.utteranceUnderstood;
    return {
      if (associatedIntentName != null)
        'associatedIntentName': associatedIntentName,
      if (associatedSlotName != null) 'associatedSlotName': associatedSlotName,
      if (audioVoiceDurationMillis != null)
        'audioVoiceDurationMillis': audioVoiceDurationMillis,
      if (botAliasId != null) 'botAliasId': botAliasId,
      if (botResponseAudioVoiceId != null)
        'botResponseAudioVoiceId': botResponseAudioVoiceId,
      if (botResponses != null) 'botResponses': botResponses,
      if (botVersion != null) 'botVersion': botVersion,
      if (channel != null) 'channel': channel,
      if (conversationEndTime != null)
        'conversationEndTime': unixTimestampToJson(conversationEndTime),
      if (conversationStartTime != null)
        'conversationStartTime': unixTimestampToJson(conversationStartTime),
      if (dialogActionType != null) 'dialogActionType': dialogActionType,
      if (inputType != null) 'inputType': inputType,
      if (intentState != null) 'intentState': intentState.toValue(),
      if (localeId != null) 'localeId': localeId,
      if (mode != null) 'mode': mode.toValue(),
      if (outputType != null) 'outputType': outputType,
      if (sessionId != null) 'sessionId': sessionId,
      if (slotsFilledInSession != null)
        'slotsFilledInSession': slotsFilledInSession,
      if (utterance != null) 'utterance': utterance,
      if (utteranceRequestId != null) 'utteranceRequestId': utteranceRequestId,
      if (utteranceTimestamp != null)
        'utteranceTimestamp': unixTimestampToJson(utteranceTimestamp),
      if (utteranceUnderstood != null)
        'utteranceUnderstood': utteranceUnderstood,
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
