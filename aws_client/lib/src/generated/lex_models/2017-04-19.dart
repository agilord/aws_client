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

part '2017-04-19.g.dart';

/// Amazon Lex is an AWS service for building conversational voice and text
/// interfaces. Use these actions to create, update, and delete conversational
/// bots for new and existing client applications.
class LexModelBuilding {
  final _s.RestJsonProtocol _protocol;
  LexModelBuilding({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'models.lex',
            signingName: 'lex',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a new version of the bot based on the <code>$LATEST</code>
  /// version. If the <code>$LATEST</code> version of this resource hasn't
  /// changed since you created the last version, Amazon Lex doesn't create a
  /// new version. It returns the last created version.
  /// <note>
  /// You can update only the <code>$LATEST</code> version of the bot. You can't
  /// update the numbered versions that you create with the
  /// <code>CreateBotVersion</code> operation.
  /// </note>
  /// When you create the first version of a bot, Amazon Lex sets the version to
  /// 1. Subsequent versions increment by 1. For more information, see
  /// <a>versioning-intro</a>.
  ///
  /// This operation requires permission for the
  /// <code>lex:CreateBotVersion</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [PreconditionFailedException].
  ///
  /// Parameter [name] :
  /// The name of the bot that you want to create a new version of. The name is
  /// case sensitive.
  ///
  /// Parameter [checksum] :
  /// Identifies a specific revision of the <code>$LATEST</code> version of the
  /// bot. If you specify a checksum and the <code>$LATEST</code> version of the
  /// bot has a different checksum, a <code>PreconditionFailedException</code>
  /// exception is returned and Amazon Lex doesn't publish a new version. If you
  /// don't specify a checksum, Amazon Lex publishes the <code>$LATEST</code>
  /// version.
  Future<CreateBotVersionResponse> createBotVersion({
    @_s.required String name,
    String checksum,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (checksum != null) 'checksum': checksum,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/bots/${Uri.encodeComponent(name)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBotVersionResponse.fromJson(response);
  }

  /// Creates a new version of an intent based on the <code>$LATEST</code>
  /// version of the intent. If the <code>$LATEST</code> version of this intent
  /// hasn't changed since you last updated it, Amazon Lex doesn't create a new
  /// version. It returns the last version you created.
  /// <note>
  /// You can update only the <code>$LATEST</code> version of the intent. You
  /// can't update the numbered versions that you create with the
  /// <code>CreateIntentVersion</code> operation.
  /// </note>
  /// When you create a version of an intent, Amazon Lex sets the version to 1.
  /// Subsequent versions increment by 1. For more information, see
  /// <a>versioning-intro</a>.
  ///
  /// This operation requires permissions to perform the
  /// <code>lex:CreateIntentVersion</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [PreconditionFailedException].
  ///
  /// Parameter [name] :
  /// The name of the intent that you want to create a new version of. The name
  /// is case sensitive.
  ///
  /// Parameter [checksum] :
  /// Checksum of the <code>$LATEST</code> version of the intent that should be
  /// used to create the new version. If you specify a checksum and the
  /// <code>$LATEST</code> version of the intent has a different checksum,
  /// Amazon Lex returns a <code>PreconditionFailedException</code> exception
  /// and doesn't publish a new version. If you don't specify a checksum, Amazon
  /// Lex publishes the <code>$LATEST</code> version.
  Future<CreateIntentVersionResponse> createIntentVersion({
    @_s.required String name,
    String checksum,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (checksum != null) 'checksum': checksum,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/intents/${Uri.encodeComponent(name)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIntentVersionResponse.fromJson(response);
  }

  /// Creates a new version of a slot type based on the <code>$LATEST</code>
  /// version of the specified slot type. If the <code>$LATEST</code> version of
  /// this resource has not changed since the last version that you created,
  /// Amazon Lex doesn't create a new version. It returns the last version that
  /// you created.
  /// <note>
  /// You can update only the <code>$LATEST</code> version of a slot type. You
  /// can't update the numbered versions that you create with the
  /// <code>CreateSlotTypeVersion</code> operation.
  /// </note>
  /// When you create a version of a slot type, Amazon Lex sets the version to
  /// 1. Subsequent versions increment by 1. For more information, see
  /// <a>versioning-intro</a>.
  ///
  /// This operation requires permissions for the
  /// <code>lex:CreateSlotTypeVersion</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [PreconditionFailedException].
  ///
  /// Parameter [name] :
  /// The name of the slot type that you want to create a new version for. The
  /// name is case sensitive.
  ///
  /// Parameter [checksum] :
  /// Checksum for the <code>$LATEST</code> version of the slot type that you
  /// want to publish. If you specify a checksum and the <code>$LATEST</code>
  /// version of the slot type has a different checksum, Amazon Lex returns a
  /// <code>PreconditionFailedException</code> exception and doesn't publish the
  /// new version. If you don't specify a checksum, Amazon Lex publishes the
  /// <code>$LATEST</code> version.
  Future<CreateSlotTypeVersionResponse> createSlotTypeVersion({
    @_s.required String name,
    String checksum,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (checksum != null) 'checksum': checksum,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/slottypes/${Uri.encodeComponent(name)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSlotTypeVersionResponse.fromJson(response);
  }

  /// Deletes all versions of the bot, including the <code>$LATEST</code>
  /// version. To delete a specific version of the bot, use the
  /// <a>DeleteBotVersion</a> operation. The <code>DeleteBot</code> operation
  /// doesn't immediately remove the bot schema. Instead, it is marked for
  /// deletion and removed later.
  ///
  /// Amazon Lex stores utterances indefinitely for improving the ability of
  /// your bot to respond to user inputs. These utterances are not removed when
  /// the bot is deleted. To remove the utterances, use the
  /// <a>DeleteUtterances</a> operation.
  ///
  /// If a bot has an alias, you can't delete it. Instead, the
  /// <code>DeleteBot</code> operation returns a
  /// <code>ResourceInUseException</code> exception that includes a reference to
  /// the alias that refers to the bot. To remove the reference to the bot,
  /// delete the alias. If you get the same exception again, delete the
  /// referring alias until the <code>DeleteBot</code> operation is successful.
  ///
  /// This operation requires permissions for the <code>lex:DeleteBot</code>
  /// action.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [name] :
  /// The name of the bot. The name is case sensitive.
  Future<void> deleteBot({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/bots/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an alias for the specified bot.
  ///
  /// You can't delete an alias that is used in the association between a bot
  /// and a messaging channel. If an alias is used in a channel association, the
  /// <code>DeleteBot</code> operation returns a
  /// <code>ResourceInUseException</code> exception that includes a reference to
  /// the channel association that refers to the bot. You can remove the
  /// reference to the alias by deleting the channel association. If you get the
  /// same exception again, delete the referring association until the
  /// <code>DeleteBotAlias</code> operation is successful.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [botName] :
  /// The name of the bot that the alias points to.
  ///
  /// Parameter [name] :
  /// The name of the alias to delete. The name is case sensitive.
  Future<void> deleteBotAlias({
    @_s.required String botName,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(botName, 'botName');
    _s.validateStringLength(
      'botName',
      botName,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botName',
      botName,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(botName)}/aliases/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the association between an Amazon Lex bot and a messaging
  /// platform.
  ///
  /// This operation requires permission for the
  /// <code>lex:DeleteBotChannelAssociation</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [botAlias] :
  /// An alias that points to the specific version of the Amazon Lex bot to
  /// which this association is being made.
  ///
  /// Parameter [botName] :
  /// The name of the Amazon Lex bot.
  ///
  /// Parameter [name] :
  /// The name of the association. The name is case sensitive.
  Future<void> deleteBotChannelAssociation({
    @_s.required String botAlias,
    @_s.required String botName,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(botAlias, 'botAlias');
    _s.validateStringLength(
      'botAlias',
      botAlias,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botAlias',
      botAlias,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(botName, 'botName');
    _s.validateStringLength(
      'botName',
      botName,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botName',
      botName,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(botName)}/aliases/${Uri.encodeComponent(botAlias)}/channels/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a specific version of a bot. To delete all versions of a bot, use
  /// the <a>DeleteBot</a> operation.
  ///
  /// This operation requires permissions for the
  /// <code>lex:DeleteBotVersion</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [name] :
  /// The name of the bot.
  ///
  /// Parameter [version] :
  /// The version of the bot to delete. You cannot delete the
  /// <code>$LATEST</code> version of the bot. To delete the
  /// <code>$LATEST</code> version, use the <a>DeleteBot</a> operation.
  Future<void> deleteBotVersion({
    @_s.required String name,
    @_s.required String version,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(version, 'version');
    _s.validateStringLength(
      'version',
      version,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'version',
      version,
      r'''[0-9]+''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(name)}/versions/${Uri.encodeComponent(version)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes all versions of the intent, including the <code>$LATEST</code>
  /// version. To delete a specific version of the intent, use the
  /// <a>DeleteIntentVersion</a> operation.
  ///
  /// You can delete a version of an intent only if it is not referenced. To
  /// delete an intent that is referred to in one or more bots (see
  /// <a>how-it-works</a>), you must remove those references first.
  /// <note>
  /// If you get the <code>ResourceInUseException</code> exception, it provides
  /// an example reference that shows where the intent is referenced. To remove
  /// the reference to the intent, either update the bot or delete it. If you
  /// get the same exception when you attempt to delete the intent again, repeat
  /// until the intent has no references and the call to
  /// <code>DeleteIntent</code> is successful.
  /// </note>
  /// This operation requires permission for the <code>lex:DeleteIntent</code>
  /// action.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [name] :
  /// The name of the intent. The name is case sensitive.
  Future<void> deleteIntent({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/intents/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a specific version of an intent. To delete all versions of a
  /// intent, use the <a>DeleteIntent</a> operation.
  ///
  /// This operation requires permissions for the
  /// <code>lex:DeleteIntentVersion</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [name] :
  /// The name of the intent.
  ///
  /// Parameter [version] :
  /// The version of the intent to delete. You cannot delete the
  /// <code>$LATEST</code> version of the intent. To delete the
  /// <code>$LATEST</code> version, use the <a>DeleteIntent</a> operation.
  Future<void> deleteIntentVersion({
    @_s.required String name,
    @_s.required String version,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(version, 'version');
    _s.validateStringLength(
      'version',
      version,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'version',
      version,
      r'''[0-9]+''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/intents/${Uri.encodeComponent(name)}/versions/${Uri.encodeComponent(version)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes all versions of the slot type, including the <code>$LATEST</code>
  /// version. To delete a specific version of the slot type, use the
  /// <a>DeleteSlotTypeVersion</a> operation.
  ///
  /// You can delete a version of a slot type only if it is not referenced. To
  /// delete a slot type that is referred to in one or more intents, you must
  /// remove those references first.
  /// <note>
  /// If you get the <code>ResourceInUseException</code> exception, the
  /// exception provides an example reference that shows the intent where the
  /// slot type is referenced. To remove the reference to the slot type, either
  /// update the intent or delete it. If you get the same exception when you
  /// attempt to delete the slot type again, repeat until the slot type has no
  /// references and the <code>DeleteSlotType</code> call is successful.
  /// </note>
  /// This operation requires permission for the <code>lex:DeleteSlotType</code>
  /// action.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [name] :
  /// The name of the slot type. The name is case sensitive.
  Future<void> deleteSlotType({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/slottypes/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a specific version of a slot type. To delete all versions of a
  /// slot type, use the <a>DeleteSlotType</a> operation.
  ///
  /// This operation requires permissions for the
  /// <code>lex:DeleteSlotTypeVersion</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [name] :
  /// The name of the slot type.
  ///
  /// Parameter [version] :
  /// The version of the slot type to delete. You cannot delete the
  /// <code>$LATEST</code> version of the slot type. To delete the
  /// <code>$LATEST</code> version, use the <a>DeleteSlotType</a> operation.
  Future<void> deleteSlotTypeVersion({
    @_s.required String name,
    @_s.required String version,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(version, 'version');
    _s.validateStringLength(
      'version',
      version,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'version',
      version,
      r'''[0-9]+''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/slottypes/${Uri.encodeComponent(name)}/version/${Uri.encodeComponent(version)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes stored utterances.
  ///
  /// Amazon Lex stores the utterances that users send to your bot. Utterances
  /// are stored for 15 days for use with the <a>GetUtterancesView</a>
  /// operation, and then stored indefinitely for use in improving the ability
  /// of your bot to respond to user input.
  ///
  /// Use the <code>DeleteUtterances</code> operation to manually delete stored
  /// utterances for a specific user. When you use the
  /// <code>DeleteUtterances</code> operation, utterances stored for improving
  /// your bot's ability to respond to user input are deleted immediately.
  /// Utterances stored for use with the <code>GetUtterancesView</code>
  /// operation are deleted after 15 days.
  ///
  /// This operation requires permissions for the
  /// <code>lex:DeleteUtterances</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [botName] :
  /// The name of the bot that stored the utterances.
  ///
  /// Parameter [userId] :
  /// The unique identifier for the user that made the utterances. This is the
  /// user ID that was sent in the <a
  /// href="http://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostContent.html">PostContent</a>
  /// or <a
  /// href="http://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostText.html">PostText</a>
  /// operation request that contained the utterance.
  Future<void> deleteUtterances({
    @_s.required String botName,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(botName, 'botName');
    _s.validateStringLength(
      'botName',
      botName,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botName',
      botName,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      2,
      100,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(botName)}/utterances/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns metadata information for a specific bot. You must provide the bot
  /// name and the bot version or alias.
  ///
  /// This operation requires permissions for the <code>lex:GetBot</code>
  /// action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [name] :
  /// The name of the bot. The name is case sensitive.
  ///
  /// Parameter [versionOrAlias] :
  /// The version or alias of the bot.
  Future<GetBotResponse> getBot({
    @_s.required String name,
    @_s.required String versionOrAlias,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionOrAlias, 'versionOrAlias');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(name)}/versions/${Uri.encodeComponent(versionOrAlias)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBotResponse.fromJson(response);
  }

  /// Returns information about an Amazon Lex bot alias. For more information
  /// about aliases, see <a>versioning-aliases</a>.
  ///
  /// This operation requires permissions for the <code>lex:GetBotAlias</code>
  /// action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [botName] :
  /// The name of the bot.
  ///
  /// Parameter [name] :
  /// The name of the bot alias. The name is case sensitive.
  Future<GetBotAliasResponse> getBotAlias({
    @_s.required String botName,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(botName, 'botName');
    _s.validateStringLength(
      'botName',
      botName,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botName',
      botName,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botName)}/aliases/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBotAliasResponse.fromJson(response);
  }

  /// Returns a list of aliases for a specified Amazon Lex bot.
  ///
  /// This operation requires permissions for the <code>lex:GetBotAliases</code>
  /// action.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [botName] :
  /// The name of the bot.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of aliases to return in the response. The default is
  /// 50. .
  ///
  /// Parameter [nameContains] :
  /// Substring to match in bot alias names. An alias will be returned if any
  /// part of its name matches the substring. For example, "xyz" matches both
  /// "xyzabc" and "abcxyz."
  ///
  /// Parameter [nextToken] :
  /// A pagination token for fetching the next page of aliases. If the response
  /// to this call is truncated, Amazon Lex returns a pagination token in the
  /// response. To fetch the next page of aliases, specify the pagination token
  /// in the next request.
  Future<GetBotAliasesResponse> getBotAliases({
    @_s.required String botName,
    int maxResults,
    String nameContains,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(botName, 'botName');
    _s.validateStringLength(
      'botName',
      botName,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botName',
      botName,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nameContains',
      nameContains,
      1,
      100,
    );
    _s.validateStringPattern(
      'nameContains',
      nameContains,
      r'''^([A-Za-z]_?)+$''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/bots/${Uri.encodeComponent(botName)}/aliases/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetBotAliasesResponse.fromJson(response);
  }

  /// Returns information about the association between an Amazon Lex bot and a
  /// messaging platform.
  ///
  /// This operation requires permissions for the
  /// <code>lex:GetBotChannelAssociation</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [botAlias] :
  /// An alias pointing to the specific version of the Amazon Lex bot to which
  /// this association is being made.
  ///
  /// Parameter [botName] :
  /// The name of the Amazon Lex bot.
  ///
  /// Parameter [name] :
  /// The name of the association between the bot and the channel. The name is
  /// case sensitive.
  Future<GetBotChannelAssociationResponse> getBotChannelAssociation({
    @_s.required String botAlias,
    @_s.required String botName,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(botAlias, 'botAlias');
    _s.validateStringLength(
      'botAlias',
      botAlias,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botAlias',
      botAlias,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(botName, 'botName');
    _s.validateStringLength(
      'botName',
      botName,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botName',
      botName,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botName)}/aliases/${Uri.encodeComponent(botAlias)}/channels/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBotChannelAssociationResponse.fromJson(response);
  }

  /// Returns a list of all of the channels associated with the specified bot.
  ///
  /// The <code>GetBotChannelAssociations</code> operation requires permissions
  /// for the <code>lex:GetBotChannelAssociations</code> action.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [botAlias] :
  /// An alias pointing to the specific version of the Amazon Lex bot to which
  /// this association is being made.
  ///
  /// Parameter [botName] :
  /// The name of the Amazon Lex bot in the association.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of associations to return in the response. The default
  /// is 50.
  ///
  /// Parameter [nameContains] :
  /// Substring to match in channel association names. An association will be
  /// returned if any part of its name matches the substring. For example, "xyz"
  /// matches both "xyzabc" and "abcxyz." To return all bot channel
  /// associations, use a hyphen ("-") as the <code>nameContains</code>
  /// parameter.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for fetching the next page of associations. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token
  /// in the response. To fetch the next page of associations, specify the
  /// pagination token in the next request.
  Future<GetBotChannelAssociationsResponse> getBotChannelAssociations({
    @_s.required String botAlias,
    @_s.required String botName,
    int maxResults,
    String nameContains,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(botAlias, 'botAlias');
    _s.validateStringLength(
      'botAlias',
      botAlias,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botAlias',
      botAlias,
      r'''^(-|^([A-Za-z]_?)+$)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(botName, 'botName');
    _s.validateStringLength(
      'botName',
      botName,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botName',
      botName,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nameContains',
      nameContains,
      1,
      100,
    );
    _s.validateStringPattern(
      'nameContains',
      nameContains,
      r'''^([A-Za-z]_?)+$''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botName)}/aliases/${Uri.encodeComponent(botAlias)}/channels/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetBotChannelAssociationsResponse.fromJson(response);
  }

  /// Gets information about all of the versions of a bot.
  ///
  /// The <code>GetBotVersions</code> operation returns a
  /// <code>BotMetadata</code> object for each version of a bot. For example, if
  /// a bot has three numbered versions, the <code>GetBotVersions</code>
  /// operation returns four <code>BotMetadata</code> objects in the response,
  /// one for each numbered version and one for the <code>$LATEST</code>
  /// version.
  ///
  /// The <code>GetBotVersions</code> operation always returns at least one
  /// version, the <code>$LATEST</code> version.
  ///
  /// This operation requires permissions for the
  /// <code>lex:GetBotVersions</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [name] :
  /// The name of the bot for which versions should be returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of bot versions to return in the response. The default
  /// is 10.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for fetching the next page of bot versions. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token
  /// in the response. To fetch the next page of versions, specify the
  /// pagination token in the next request.
  Future<GetBotVersionsResponse> getBotVersions({
    @_s.required String name,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/bots/${Uri.encodeComponent(name)}/versions/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetBotVersionsResponse.fromJson(response);
  }

  /// Returns bot information as follows:
  ///
  /// <ul>
  /// <li>
  /// If you provide the <code>nameContains</code> field, the response includes
  /// information for the <code>$LATEST</code> version of all bots whose name
  /// contains the specified string.
  /// </li>
  /// <li>
  /// If you don't specify the <code>nameContains</code> field, the operation
  /// returns information about the <code>$LATEST</code> version of all of your
  /// bots.
  /// </li>
  /// </ul>
  /// This operation requires permission for the <code>lex:GetBots</code>
  /// action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of bots to return in the response that the request will
  /// return. The default is 10.
  ///
  /// Parameter [nameContains] :
  /// Substring to match in bot names. A bot will be returned if any part of its
  /// name matches the substring. For example, "xyz" matches both "xyzabc" and
  /// "abcxyz."
  ///
  /// Parameter [nextToken] :
  /// A pagination token that fetches the next page of bots. If the response to
  /// this call is truncated, Amazon Lex returns a pagination token in the
  /// response. To fetch the next page of bots, specify the pagination token in
  /// the next request.
  Future<GetBotsResponse> getBots({
    int maxResults,
    String nameContains,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nameContains',
      nameContains,
      2,
      50,
    );
    _s.validateStringPattern(
      'nameContains',
      nameContains,
      r'''^([A-Za-z]_?)+$''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/bots/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetBotsResponse.fromJson(response);
  }

  /// Returns information about a built-in intent.
  ///
  /// This operation requires permission for the
  /// <code>lex:GetBuiltinIntent</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [signature] :
  /// The unique identifier for a built-in intent. To find the signature for an
  /// intent, see <a
  /// href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents">Standard
  /// Built-in Intents</a> in the <i>Alexa Skills Kit</i>.
  Future<GetBuiltinIntentResponse> getBuiltinIntent({
    @_s.required String signature,
  }) async {
    ArgumentError.checkNotNull(signature, 'signature');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/builtins/intents/${Uri.encodeComponent(signature)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBuiltinIntentResponse.fromJson(response);
  }

  /// Gets a list of built-in intents that meet the specified criteria.
  ///
  /// This operation requires permission for the
  /// <code>lex:GetBuiltinIntents</code> action.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [locale] :
  /// A list of locales that the intent supports.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of intents to return in the response. The default is
  /// 10.
  ///
  /// Parameter [nextToken] :
  /// A pagination token that fetches the next page of intents. If this API call
  /// is truncated, Amazon Lex returns a pagination token in the response. To
  /// fetch the next page of intents, use the pagination token in the next
  /// request.
  ///
  /// Parameter [signatureContains] :
  /// Substring to match in built-in intent signatures. An intent will be
  /// returned if any part of its signature matches the substring. For example,
  /// "xyz" matches both "xyzabc" and "abcxyz." To find the signature for an
  /// intent, see <a
  /// href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents">Standard
  /// Built-in Intents</a> in the <i>Alexa Skills Kit</i>.
  Future<GetBuiltinIntentsResponse> getBuiltinIntents({
    Locale locale,
    int maxResults,
    String nextToken,
    String signatureContains,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (locale != null) 'locale': [locale.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (signatureContains != null) 'signatureContains': [signatureContains],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/builtins/intents/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetBuiltinIntentsResponse.fromJson(response);
  }

  /// Gets a list of built-in slot types that meet the specified criteria.
  ///
  /// For a list of built-in slot types, see <a
  /// href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference">Slot
  /// Type Reference</a> in the <i>Alexa Skills Kit</i>.
  ///
  /// This operation requires permission for the
  /// <code>lex:GetBuiltInSlotTypes</code> action.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [locale] :
  /// A list of locales that the slot type supports.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of slot types to return in the response. The default is
  /// 10.
  ///
  /// Parameter [nextToken] :
  /// A pagination token that fetches the next page of slot types. If the
  /// response to this API call is truncated, Amazon Lex returns a pagination
  /// token in the response. To fetch the next page of slot types, specify the
  /// pagination token in the next request.
  ///
  /// Parameter [signatureContains] :
  /// Substring to match in built-in slot type signatures. A slot type will be
  /// returned if any part of its signature matches the substring. For example,
  /// "xyz" matches both "xyzabc" and "abcxyz."
  Future<GetBuiltinSlotTypesResponse> getBuiltinSlotTypes({
    Locale locale,
    int maxResults,
    String nextToken,
    String signatureContains,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (locale != null) 'locale': [locale.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (signatureContains != null) 'signatureContains': [signatureContains],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/builtins/slottypes/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetBuiltinSlotTypesResponse.fromJson(response);
  }

  /// Exports the contents of a Amazon Lex resource in a specified format.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [exportType] :
  /// The format of the exported data.
  ///
  /// Parameter [name] :
  /// The name of the bot to export.
  ///
  /// Parameter [resourceType] :
  /// The type of resource to export.
  ///
  /// Parameter [version] :
  /// The version of the bot to export.
  Future<GetExportResponse> getExport({
    @_s.required ExportType exportType,
    @_s.required String name,
    @_s.required ResourceType resourceType,
    @_s.required String version,
  }) async {
    ArgumentError.checkNotNull(exportType, 'exportType');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z_]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    ArgumentError.checkNotNull(version, 'version');
    _s.validateStringLength(
      'version',
      version,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'version',
      version,
      r'''[0-9]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (exportType != null) 'exportType': [exportType.toValue()],
      if (name != null) 'name': [name],
      if (resourceType != null) 'resourceType': [resourceType.toValue()],
      if (version != null) 'version': [version],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/exports/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetExportResponse.fromJson(response);
  }

  /// Gets information about an import job started with the
  /// <code>StartImport</code> operation.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [importId] :
  /// The identifier of the import job information to return.
  Future<GetImportResponse> getImport({
    @_s.required String importId,
  }) async {
    ArgumentError.checkNotNull(importId, 'importId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/imports/${Uri.encodeComponent(importId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetImportResponse.fromJson(response);
  }

  /// Returns information about an intent. In addition to the intent name, you
  /// must specify the intent version.
  ///
  /// This operation requires permissions to perform the
  /// <code>lex:GetIntent</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [name] :
  /// The name of the intent. The name is case sensitive.
  ///
  /// Parameter [version] :
  /// The version of the intent.
  Future<GetIntentResponse> getIntent({
    @_s.required String name,
    @_s.required String version,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(version, 'version');
    _s.validateStringLength(
      'version',
      version,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'version',
      version,
      r'''\$LATEST|[0-9]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/intents/${Uri.encodeComponent(name)}/versions/${Uri.encodeComponent(version)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIntentResponse.fromJson(response);
  }

  /// Gets information about all of the versions of an intent.
  ///
  /// The <code>GetIntentVersions</code> operation returns an
  /// <code>IntentMetadata</code> object for each version of an intent. For
  /// example, if an intent has three numbered versions, the
  /// <code>GetIntentVersions</code> operation returns four
  /// <code>IntentMetadata</code> objects in the response, one for each numbered
  /// version and one for the <code>$LATEST</code> version.
  ///
  /// The <code>GetIntentVersions</code> operation always returns at least one
  /// version, the <code>$LATEST</code> version.
  ///
  /// This operation requires permissions for the
  /// <code>lex:GetIntentVersions</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [name] :
  /// The name of the intent for which versions should be returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of intent versions to return in the response. The
  /// default is 10.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for fetching the next page of intent versions. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token
  /// in the response. To fetch the next page of versions, specify the
  /// pagination token in the next request.
  Future<GetIntentVersionsResponse> getIntentVersions({
    @_s.required String name,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/intents/${Uri.encodeComponent(name)}/versions/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetIntentVersionsResponse.fromJson(response);
  }

  /// Returns intent information as follows:
  ///
  /// <ul>
  /// <li>
  /// If you specify the <code>nameContains</code> field, returns the
  /// <code>$LATEST</code> version of all intents that contain the specified
  /// string.
  /// </li>
  /// <li>
  /// If you don't specify the <code>nameContains</code> field, returns
  /// information about the <code>$LATEST</code> version of all intents.
  /// </li>
  /// </ul>
  /// The operation requires permission for the <code>lex:GetIntents</code>
  /// action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of intents to return in the response. The default is
  /// 10.
  ///
  /// Parameter [nameContains] :
  /// Substring to match in intent names. An intent will be returned if any part
  /// of its name matches the substring. For example, "xyz" matches both
  /// "xyzabc" and "abcxyz."
  ///
  /// Parameter [nextToken] :
  /// A pagination token that fetches the next page of intents. If the response
  /// to this API call is truncated, Amazon Lex returns a pagination token in
  /// the response. To fetch the next page of intents, specify the pagination
  /// token in the next request.
  Future<GetIntentsResponse> getIntents({
    int maxResults,
    String nameContains,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nameContains',
      nameContains,
      1,
      100,
    );
    _s.validateStringPattern(
      'nameContains',
      nameContains,
      r'''^([A-Za-z]_?)+$''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/intents/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetIntentsResponse.fromJson(response);
  }

  /// Returns information about a specific version of a slot type. In addition
  /// to specifying the slot type name, you must specify the slot type version.
  ///
  /// This operation requires permissions for the <code>lex:GetSlotType</code>
  /// action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [name] :
  /// The name of the slot type. The name is case sensitive.
  ///
  /// Parameter [version] :
  /// The version of the slot type.
  Future<GetSlotTypeResponse> getSlotType({
    @_s.required String name,
    @_s.required String version,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(version, 'version');
    _s.validateStringLength(
      'version',
      version,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'version',
      version,
      r'''\$LATEST|[0-9]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/slottypes/${Uri.encodeComponent(name)}/versions/${Uri.encodeComponent(version)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSlotTypeResponse.fromJson(response);
  }

  /// Gets information about all versions of a slot type.
  ///
  /// The <code>GetSlotTypeVersions</code> operation returns a
  /// <code>SlotTypeMetadata</code> object for each version of a slot type. For
  /// example, if a slot type has three numbered versions, the
  /// <code>GetSlotTypeVersions</code> operation returns four
  /// <code>SlotTypeMetadata</code> objects in the response, one for each
  /// numbered version and one for the <code>$LATEST</code> version.
  ///
  /// The <code>GetSlotTypeVersions</code> operation always returns at least one
  /// version, the <code>$LATEST</code> version.
  ///
  /// This operation requires permissions for the
  /// <code>lex:GetSlotTypeVersions</code> action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [name] :
  /// The name of the slot type for which versions should be returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of slot type versions to return in the response. The
  /// default is 10.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for fetching the next page of slot type versions. If
  /// the response to this call is truncated, Amazon Lex returns a pagination
  /// token in the response. To fetch the next page of versions, specify the
  /// pagination token in the next request.
  Future<GetSlotTypeVersionsResponse> getSlotTypeVersions({
    @_s.required String name,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/slottypes/${Uri.encodeComponent(name)}/versions/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSlotTypeVersionsResponse.fromJson(response);
  }

  /// Returns slot type information as follows:
  ///
  /// <ul>
  /// <li>
  /// If you specify the <code>nameContains</code> field, returns the
  /// <code>$LATEST</code> version of all slot types that contain the specified
  /// string.
  /// </li>
  /// <li>
  /// If you don't specify the <code>nameContains</code> field, returns
  /// information about the <code>$LATEST</code> version of all slot types.
  /// </li>
  /// </ul>
  /// The operation requires permission for the <code>lex:GetSlotTypes</code>
  /// action.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of slot types to return in the response. The default is
  /// 10.
  ///
  /// Parameter [nameContains] :
  /// Substring to match in slot type names. A slot type will be returned if any
  /// part of its name matches the substring. For example, "xyz" matches both
  /// "xyzabc" and "abcxyz."
  ///
  /// Parameter [nextToken] :
  /// A pagination token that fetches the next page of slot types. If the
  /// response to this API call is truncated, Amazon Lex returns a pagination
  /// token in the response. To fetch next page of slot types, specify the
  /// pagination token in the next request.
  Future<GetSlotTypesResponse> getSlotTypes({
    int maxResults,
    String nameContains,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nameContains',
      nameContains,
      1,
      100,
    );
    _s.validateStringPattern(
      'nameContains',
      nameContains,
      r'''^([A-Za-z]_?)+$''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/slottypes/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSlotTypesResponse.fromJson(response);
  }

  /// Use the <code>GetUtterancesView</code> operation to get information about
  /// the utterances that your users have made to your bot. You can use this
  /// list to tune the utterances that your bot responds to.
  ///
  /// For example, say that you have created a bot to order flowers. After your
  /// users have used your bot for a while, use the
  /// <code>GetUtterancesView</code> operation to see the requests that they
  /// have made and whether they have been successful. You might find that the
  /// utterance "I want flowers" is not being recognized. You could add this
  /// utterance to the <code>OrderFlowers</code> intent so that your bot
  /// recognizes that utterance.
  ///
  /// After you publish a new version of a bot, you can get information about
  /// the old version and the new so that you can compare the performance across
  /// the two versions.
  ///
  /// Utterance statistics are generated once a day. Data is available for the
  /// last 15 days. You can request information for up to 5 versions of your bot
  /// in each request. Amazon Lex returns the most frequent utterances received
  /// by the bot in the last 15 days. The response contains information about a
  /// maximum of 100 utterances for each version.
  ///
  /// If you set <code>childDirected</code> field to true when you created your
  /// bot, or if you opted out of participating in improving Amazon Lex,
  /// utterances are not available.
  ///
  /// This operation requires permissions for the
  /// <code>lex:GetUtterancesView</code> action.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [botName] :
  /// The name of the bot for which utterance information should be returned.
  ///
  /// Parameter [botVersions] :
  /// An array of bot versions for which utterance information should be
  /// returned. The limit is 5 versions per request.
  ///
  /// Parameter [statusType] :
  /// To return utterances that were recognized and handled, use
  /// <code>Detected</code>. To return utterances that were not recognized, use
  /// <code>Missed</code>.
  Future<GetUtterancesViewResponse> getUtterancesView({
    @_s.required String botName,
    @_s.required List<String> botVersions,
    @_s.required StatusType statusType,
  }) async {
    ArgumentError.checkNotNull(botName, 'botName');
    _s.validateStringLength(
      'botName',
      botName,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botName',
      botName,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(botVersions, 'botVersions');
    ArgumentError.checkNotNull(statusType, 'statusType');
    final $query = <String, List<String>>{
      if (botVersions != null) 'bot_versions': botVersions,
      if (statusType != null) 'status_type': [statusType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botName)}/utterances?view=aggregation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetUtterancesViewResponse.fromJson(response);
  }

  /// Gets a list of tags associated with the specified resource. Only bots, bot
  /// aliases, and bot channels can have tags associated with them.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to get a list of tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Creates an Amazon Lex conversational bot or replaces an existing bot. When
  /// you create or update a bot you are only required to specify a name, a
  /// locale, and whether the bot is directed toward children under age 13. You
  /// can use this to add intents later, or to remove intents from an existing
  /// bot. When you create a bot with the minimum information, the bot is
  /// created or updated but Amazon Lex returns the <code/> response
  /// <code>FAILED</code>. You can build the bot after you add one or more
  /// intents. For more information about Amazon Lex bots, see
  /// <a>how-it-works</a>.
  ///
  /// If you specify the name of an existing bot, the fields in the request
  /// replace the existing values in the <code>$LATEST</code> version of the
  /// bot. Amazon Lex removes any fields that you don't provide values for in
  /// the request, except for the <code>idleTTLInSeconds</code> and
  /// <code>privacySettings</code> fields, which are set to their default
  /// values. If you don't specify values for required fields, Amazon Lex throws
  /// an exception.
  ///
  /// This operation requires permissions for the <code>lex:PutBot</code>
  /// action. For more information, see <a>security-iam</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [PreconditionFailedException].
  ///
  /// Parameter [childDirected] :
  /// For each Amazon Lex bot created with the Amazon Lex Model Building
  /// Service, you must specify whether your use of Amazon Lex is related to a
  /// website, program, or other application that is directed or targeted, in
  /// whole or in part, to children under age 13 and subject to the Children's
  /// Online Privacy Protection Act (COPPA) by specifying <code>true</code> or
  /// <code>false</code> in the <code>childDirected</code> field. By specifying
  /// <code>true</code> in the <code>childDirected</code> field, you confirm
  /// that your use of Amazon Lex <b>is</b> related to a website, program, or
  /// other application that is directed or targeted, in whole or in part, to
  /// children under age 13 and subject to COPPA. By specifying
  /// <code>false</code> in the <code>childDirected</code> field, you confirm
  /// that your use of Amazon Lex <b>is not</b> related to a website, program,
  /// or other application that is directed or targeted, in whole or in part, to
  /// children under age 13 and subject to COPPA. You may not specify a default
  /// value for the <code>childDirected</code> field that does not accurately
  /// reflect whether your use of Amazon Lex is related to a website, program,
  /// or other application that is directed or targeted, in whole or in part, to
  /// children under age 13 and subject to COPPA.
  ///
  /// If your use of Amazon Lex relates to a website, program, or other
  /// application that is directed in whole or in part, to children under age
  /// 13, you must obtain any required verifiable parental consent under COPPA.
  /// For information regarding the use of Amazon Lex in connection with
  /// websites, programs, or other applications that are directed or targeted,
  /// in whole or in part, to children under age 13, see the <a
  /// href="https://aws.amazon.com/lex/faqs#data-security">Amazon Lex FAQ.</a>
  ///
  /// Parameter [locale] :
  /// Specifies the target locale for the bot. Any intent used in the bot must
  /// be compatible with the locale of the bot.
  ///
  /// The default is <code>en-US</code>.
  ///
  /// Parameter [name] :
  /// The name of the bot. The name is <i>not</i> case sensitive.
  ///
  /// Parameter [abortStatement] :
  /// When Amazon Lex can't understand the user's input in context, it tries to
  /// elicit the information a few times. After that, Amazon Lex sends the
  /// message defined in <code>abortStatement</code> to the user, and then
  /// cancels the conversation. To set the number of retries, use the
  /// <code>valueElicitationPrompt</code> field for the slot type.
  ///
  /// For example, in a pizza ordering bot, Amazon Lex might ask a user "What
  /// type of crust would you like?" If the user's response is not one of the
  /// expected responses (for example, "thin crust, "deep dish," etc.), Amazon
  /// Lex tries to elicit a correct response a few more times.
  ///
  /// For example, in a pizza ordering application, <code>OrderPizza</code>
  /// might be one of the intents. This intent might require the
  /// <code>CrustType</code> slot. You specify the
  /// <code>valueElicitationPrompt</code> field when you create the
  /// <code>CrustType</code> slot.
  ///
  /// If you have defined a fallback intent the cancel statement will not be
  /// sent to the user, the fallback intent is used instead. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/built-in-intent-fallback.html">
  /// AMAZON.FallbackIntent</a>.
  ///
  /// Parameter [checksum] :
  /// Identifies a specific revision of the <code>$LATEST</code> version.
  ///
  /// When you create a new bot, leave the <code>checksum</code> field blank. If
  /// you specify a checksum you get a <code>BadRequestException</code>
  /// exception.
  ///
  /// When you want to update a bot, set the <code>checksum</code> field to the
  /// checksum of the most recent revision of the <code>$LATEST</code> version.
  /// If you don't specify the <code> checksum</code> field, or if the checksum
  /// does not match the <code>$LATEST</code> version, you get a
  /// <code>PreconditionFailedException</code> exception.
  ///
  /// Parameter [clarificationPrompt] :
  /// When Amazon Lex doesn't understand the user's intent, it uses this message
  /// to get clarification. To specify how many times Amazon Lex should repeat
  /// the clarification prompt, use the <code>maxAttempts</code> field. If
  /// Amazon Lex still doesn't understand, it sends the message in the
  /// <code>abortStatement</code> field.
  ///
  /// When you create a clarification prompt, make sure that it suggests the
  /// correct response from the user. for example, for a bot that orders pizza
  /// and drinks, you might create this clarification prompt: "What would you
  /// like to do? You can say 'Order a pizza' or 'Order a drink.'"
  ///
  /// If you have defined a fallback intent, it will be invoked if the
  /// clarification prompt is repeated the number of times defined in the
  /// <code>maxAttempts</code> field. For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/built-in-intent-fallback.html">
  /// AMAZON.FallbackIntent</a>.
  ///
  /// If you don't define a clarification prompt, at runtime Amazon Lex will
  /// return a 400 Bad Request exception in three cases:
  ///
  /// <ul>
  /// <li>
  /// Follow-up prompt - When the user responds to a follow-up prompt but does
  /// not provide an intent. For example, in response to a follow-up prompt that
  /// says "Would you like anything else today?" the user says "Yes." Amazon Lex
  /// will return a 400 Bad Request exception because it does not have a
  /// clarification prompt to send to the user to get an intent.
  /// </li>
  /// <li>
  /// Lambda function - When using a Lambda function, you return an
  /// <code>ElicitIntent</code> dialog type. Since Amazon Lex does not have a
  /// clarification prompt to get an intent from the user, it returns a 400 Bad
  /// Request exception.
  /// </li>
  /// <li>
  /// PutSession operation - When using the <code>PutSession</code> operation,
  /// you send an <code>ElicitIntent</code> dialog type. Since Amazon Lex does
  /// not have a clarification prompt to get an intent from the user, it returns
  /// a 400 Bad Request exception.
  /// </li>
  /// </ul>
  ///
  /// Parameter [createVersion] :
  /// When set to <code>true</code> a new numbered version of the bot is
  /// created. This is the same as calling the <code>CreateBotVersion</code>
  /// operation. If you don't specify <code>createVersion</code>, the default is
  /// <code>false</code>.
  ///
  /// Parameter [description] :
  /// A description of the bot.
  ///
  /// Parameter [detectSentiment] :
  /// When set to <code>true</code> user utterances are sent to Amazon
  /// Comprehend for sentiment analysis. If you don't specify
  /// <code>detectSentiment</code>, the default is <code>false</code>.
  ///
  /// Parameter [enableModelImprovements] :
  /// Set to <code>true</code> to enable access to natural language
  /// understanding improvements.
  ///
  /// When you set the <code>enableModelImprovements</code> parameter to
  /// <code>true</code> you can use the
  /// <code>nluIntentConfidenceThreshold</code> parameter to configure
  /// confidence scores. For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/confidence-scores.html">Confidence
  /// Scores</a>.
  ///
  /// You can only set the <code>enableModelImprovements</code> parameter in
  /// certain Regions. If you set the parameter to <code>true</code>, your bot
  /// has access to accuracy improvements.
  ///
  /// The Regions where you can set the <code>enableModelImprovements</code>
  /// parameter to <code>true</code> are:
  ///
  /// <ul>
  /// <li>
  /// US East (N. Virginia) (us-east-1)
  /// </li>
  /// <li>
  /// US West (Oregon) (us-west-2)
  /// </li>
  /// <li>
  /// Asia Pacific (Sydney) (ap-southeast-2)
  /// </li>
  /// <li>
  /// EU (Ireland) (eu-west-1)
  /// </li>
  /// </ul>
  /// In other Regions, the <code>enableModelImprovements</code> parameter is
  /// set to <code>true</code> by default. In these Regions setting the
  /// parameter to <code>false</code> throws a <code>ValidationException</code>
  /// exception.
  ///
  /// Parameter [idleSessionTTLInSeconds] :
  /// The maximum time in seconds that Amazon Lex retains the data gathered in a
  /// conversation.
  ///
  /// A user interaction session remains active for the amount of time
  /// specified. If no conversation occurs during this time, the session expires
  /// and Amazon Lex deletes any data provided before the timeout.
  ///
  /// For example, suppose that a user chooses the OrderPizza intent, but gets
  /// sidetracked halfway through placing an order. If the user doesn't complete
  /// the order within the specified time, Amazon Lex discards the slot
  /// information that it gathered, and the user must start over.
  ///
  /// If you don't include the <code>idleSessionTTLInSeconds</code> element in a
  /// <code>PutBot</code> operation request, Amazon Lex uses the default value.
  /// This is also true if the request replaces an existing bot.
  ///
  /// The default is 300 seconds (5 minutes).
  ///
  /// Parameter [intents] :
  /// An array of <code>Intent</code> objects. Each intent represents a command
  /// that a user can express. For example, a pizza ordering bot might support
  /// an OrderPizza intent. For more information, see <a>how-it-works</a>.
  ///
  /// Parameter [nluIntentConfidenceThreshold] :
  /// Determines the threshold where Amazon Lex will insert the
  /// <code>AMAZON.FallbackIntent</code>,
  /// <code>AMAZON.KendraSearchIntent</code>, or both when returning alternative
  /// intents in a <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostContent.html">PostContent</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostText.html">PostText</a>
  /// response. <code>AMAZON.FallbackIntent</code> and
  /// <code>AMAZON.KendraSearchIntent</code> are only inserted if they are
  /// configured for the bot.
  ///
  /// You must set the <code>enableModelImprovements</code> parameter to
  /// <code>true</code> to use confidence scores in the following regions.
  ///
  /// <ul>
  /// <li>
  /// US East (N. Virginia) (us-east-1)
  /// </li>
  /// <li>
  /// US West (Oregon) (us-west-2)
  /// </li>
  /// <li>
  /// Asia Pacific (Sydney) (ap-southeast-2)
  /// </li>
  /// <li>
  /// EU (Ireland) (eu-west-1)
  /// </li>
  /// </ul>
  /// In other Regions, the <code>enableModelImprovements</code> parameter is
  /// set to <code>true</code> by default.
  ///
  /// For example, suppose a bot is configured with the confidence threshold of
  /// 0.80 and the <code>AMAZON.FallbackIntent</code>. Amazon Lex returns three
  /// alternative intents with the following confidence scores: IntentA (0.70),
  /// IntentB (0.60), IntentC (0.50). The response from the
  /// <code>PostText</code> operation would be:
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
  /// Parameter [processBehavior] :
  /// If you set the <code>processBehavior</code> element to <code>BUILD</code>,
  /// Amazon Lex builds the bot so that it can be run. If you set the element to
  /// <code>SAVE</code> Amazon Lex saves the bot, but doesn't build it.
  ///
  /// If you don't specify this value, the default value is <code>BUILD</code>.
  ///
  /// Parameter [tags] :
  /// A list of tags to add to the bot. You can only add tags when you create a
  /// bot, you can't use the <code>PutBot</code> operation to update the tags on
  /// a bot. To update tags, use the <code>TagResource</code> operation.
  ///
  /// Parameter [voiceId] :
  /// The Amazon Polly voice ID that you want Amazon Lex to use for voice
  /// interactions with the user. The locale configured for the voice must match
  /// the locale of the bot. For more information, see <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/voicelist.html">Voices
  /// in Amazon Polly</a> in the <i>Amazon Polly Developer Guide</i>.
  Future<PutBotResponse> putBot({
    @_s.required bool childDirected,
    @_s.required Locale locale,
    @_s.required String name,
    Statement abortStatement,
    String checksum,
    Prompt clarificationPrompt,
    bool createVersion,
    String description,
    bool detectSentiment,
    bool enableModelImprovements,
    int idleSessionTTLInSeconds,
    List<Intent> intents,
    double nluIntentConfidenceThreshold,
    ProcessBehavior processBehavior,
    List<Tag> tags,
    String voiceId,
  }) async {
    ArgumentError.checkNotNull(childDirected, 'childDirected');
    ArgumentError.checkNotNull(locale, 'locale');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    _s.validateNumRange(
      'idleSessionTTLInSeconds',
      idleSessionTTLInSeconds,
      60,
      86400,
    );
    _s.validateNumRange(
      'nluIntentConfidenceThreshold',
      nluIntentConfidenceThreshold,
      0,
      1,
    );
    final $payload = <String, dynamic>{
      'childDirected': childDirected,
      'locale': locale?.toValue() ?? '',
      if (abortStatement != null) 'abortStatement': abortStatement,
      if (checksum != null) 'checksum': checksum,
      if (clarificationPrompt != null)
        'clarificationPrompt': clarificationPrompt,
      if (createVersion != null) 'createVersion': createVersion,
      if (description != null) 'description': description,
      if (detectSentiment != null) 'detectSentiment': detectSentiment,
      if (enableModelImprovements != null)
        'enableModelImprovements': enableModelImprovements,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (intents != null) 'intents': intents,
      if (nluIntentConfidenceThreshold != null)
        'nluIntentConfidenceThreshold': nluIntentConfidenceThreshold,
      if (processBehavior != null) 'processBehavior': processBehavior.toValue(),
      if (tags != null) 'tags': tags,
      if (voiceId != null) 'voiceId': voiceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/bots/${Uri.encodeComponent(name)}/versions/\$LATEST',
      exceptionFnMap: _exceptionFns,
    );
    return PutBotResponse.fromJson(response);
  }

  /// Creates an alias for the specified version of the bot or replaces an alias
  /// for the specified bot. To change the version of the bot that the alias
  /// points to, replace the alias. For more information about aliases, see
  /// <a>versioning-aliases</a>.
  ///
  /// This operation requires permissions for the <code>lex:PutBotAlias</code>
  /// action.
  ///
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [PreconditionFailedException].
  ///
  /// Parameter [botName] :
  /// The name of the bot.
  ///
  /// Parameter [botVersion] :
  /// The version of the bot.
  ///
  /// Parameter [name] :
  /// The name of the alias. The name is <i>not</i> case sensitive.
  ///
  /// Parameter [checksum] :
  /// Identifies a specific revision of the <code>$LATEST</code> version.
  ///
  /// When you create a new bot alias, leave the <code>checksum</code> field
  /// blank. If you specify a checksum you get a
  /// <code>BadRequestException</code> exception.
  ///
  /// When you want to update a bot alias, set the <code>checksum</code> field
  /// to the checksum of the most recent revision of the <code>$LATEST</code>
  /// version. If you don't specify the <code> checksum</code> field, or if the
  /// checksum does not match the <code>$LATEST</code> version, you get a
  /// <code>PreconditionFailedException</code> exception.
  ///
  /// Parameter [conversationLogs] :
  /// Settings for conversation logs for the alias.
  ///
  /// Parameter [description] :
  /// A description of the alias.
  ///
  /// Parameter [tags] :
  /// A list of tags to add to the bot alias. You can only add tags when you
  /// create an alias, you can't use the <code>PutBotAlias</code> operation to
  /// update the tags on a bot alias. To update tags, use the
  /// <code>TagResource</code> operation.
  Future<PutBotAliasResponse> putBotAlias({
    @_s.required String botName,
    @_s.required String botVersion,
    @_s.required String name,
    String checksum,
    ConversationLogsRequest conversationLogs,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(botName, 'botName');
    _s.validateStringLength(
      'botName',
      botName,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botName',
      botName,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(botVersion, 'botVersion');
    _s.validateStringLength(
      'botVersion',
      botVersion,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'botVersion',
      botVersion,
      r'''\$LATEST|[0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    final $payload = <String, dynamic>{
      'botVersion': botVersion,
      if (checksum != null) 'checksum': checksum,
      if (conversationLogs != null) 'conversationLogs': conversationLogs,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/bots/${Uri.encodeComponent(botName)}/aliases/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutBotAliasResponse.fromJson(response);
  }

  /// Creates an intent or replaces an existing intent.
  ///
  /// To define the interaction between the user and your bot, you use one or
  /// more intents. For a pizza ordering bot, for example, you would create an
  /// <code>OrderPizza</code> intent.
  ///
  /// To create an intent or replace an existing intent, you must provide the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Intent name. For example, <code>OrderPizza</code>.
  /// </li>
  /// <li>
  /// Sample utterances. For example, "Can I order a pizza, please." and "I want
  /// to order a pizza."
  /// </li>
  /// <li>
  /// Information to be gathered. You specify slot types for the information
  /// that your bot will request from the user. You can specify standard slot
  /// types, such as a date or a time, or custom slot types such as the size and
  /// crust of a pizza.
  /// </li>
  /// <li>
  /// How the intent will be fulfilled. You can provide a Lambda function or
  /// configure the intent to return the intent information to the client
  /// application. If you use a Lambda function, when all of the intent
  /// information is available, Amazon Lex invokes your Lambda function. If you
  /// configure your intent to return the intent information to the client
  /// application.
  /// </li>
  /// </ul>
  /// You can specify other optional information in the request, such as:
  ///
  /// <ul>
  /// <li>
  /// A confirmation prompt to ask the user to confirm an intent. For example,
  /// "Shall I order your pizza?"
  /// </li>
  /// <li>
  /// A conclusion statement to send to the user after the intent has been
  /// fulfilled. For example, "I placed your pizza order."
  /// </li>
  /// <li>
  /// A follow-up prompt that asks the user for additional activity. For
  /// example, asking "Do you want to order a drink with your pizza?"
  /// </li>
  /// </ul>
  /// If you specify an existing intent name to update the intent, Amazon Lex
  /// replaces the values in the <code>$LATEST</code> version of the intent with
  /// the values in the request. Amazon Lex removes fields that you don't
  /// provide in the request. If you don't specify the required fields, Amazon
  /// Lex throws an exception. When you update the <code>$LATEST</code> version
  /// of an intent, the <code>status</code> field of any bot that uses the
  /// <code>$LATEST</code> version of the intent is set to
  /// <code>NOT_BUILT</code>.
  ///
  /// For more information, see <a>how-it-works</a>.
  ///
  /// This operation requires permissions for the <code>lex:PutIntent</code>
  /// action.
  ///
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [PreconditionFailedException].
  ///
  /// Parameter [name] :
  /// The name of the intent. The name is <i>not</i> case sensitive.
  ///
  /// The name can't match a built-in intent name, or a built-in intent name
  /// with "AMAZON." removed. For example, because there is a built-in intent
  /// called <code>AMAZON.HelpIntent</code>, you can't create a custom intent
  /// called <code>HelpIntent</code>.
  ///
  /// For a list of built-in intents, see <a
  /// href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents">Standard
  /// Built-in Intents</a> in the <i>Alexa Skills Kit</i>.
  ///
  /// Parameter [checksum] :
  /// Identifies a specific revision of the <code>$LATEST</code> version.
  ///
  /// When you create a new intent, leave the <code>checksum</code> field blank.
  /// If you specify a checksum you get a <code>BadRequestException</code>
  /// exception.
  ///
  /// When you want to update a intent, set the <code>checksum</code> field to
  /// the checksum of the most recent revision of the <code>$LATEST</code>
  /// version. If you don't specify the <code> checksum</code> field, or if the
  /// checksum does not match the <code>$LATEST</code> version, you get a
  /// <code>PreconditionFailedException</code> exception.
  ///
  /// Parameter [conclusionStatement] :
  /// The statement that you want Amazon Lex to convey to the user after the
  /// intent is successfully fulfilled by the Lambda function.
  ///
  /// This element is relevant only if you provide a Lambda function in the
  /// <code>fulfillmentActivity</code>. If you return the intent to the client
  /// application, you can't specify this element.
  /// <note>
  /// The <code>followUpPrompt</code> and <code>conclusionStatement</code> are
  /// mutually exclusive. You can specify only one.
  /// </note>
  ///
  /// Parameter [confirmationPrompt] :
  /// Prompts the user to confirm the intent. This question should have a yes or
  /// no answer.
  ///
  /// Amazon Lex uses this prompt to ensure that the user acknowledges that the
  /// intent is ready for fulfillment. For example, with the
  /// <code>OrderPizza</code> intent, you might want to confirm that the order
  /// is correct before placing it. For other intents, such as intents that
  /// simply respond to user questions, you might not need to ask the user for
  /// confirmation before providing the information.
  /// <note>
  /// You you must provide both the <code>rejectionStatement</code> and the
  /// <code>confirmationPrompt</code>, or neither.
  /// </note>
  ///
  /// Parameter [createVersion] :
  /// When set to <code>true</code> a new numbered version of the intent is
  /// created. This is the same as calling the <code>CreateIntentVersion</code>
  /// operation. If you do not specify <code>createVersion</code>, the default
  /// is <code>false</code>.
  ///
  /// Parameter [description] :
  /// A description of the intent.
  ///
  /// Parameter [dialogCodeHook] :
  /// Specifies a Lambda function to invoke for each user input. You can invoke
  /// this Lambda function to personalize user interaction.
  ///
  /// For example, suppose your bot determines that the user is John. Your
  /// Lambda function might retrieve John's information from a backend database
  /// and prepopulate some of the values. For example, if you find that John is
  /// gluten intolerant, you might set the corresponding intent slot,
  /// <code>GlutenIntolerant</code>, to true. You might find John's phone number
  /// and set the corresponding session attribute.
  ///
  /// Parameter [followUpPrompt] :
  /// Amazon Lex uses this prompt to solicit additional activity after
  /// fulfilling an intent. For example, after the <code>OrderPizza</code>
  /// intent is fulfilled, you might prompt the user to order a drink.
  ///
  /// The action that Amazon Lex takes depends on the user's response, as
  /// follows:
  ///
  /// <ul>
  /// <li>
  /// If the user says "Yes" it responds with the clarification prompt that is
  /// configured for the bot.
  /// </li>
  /// <li>
  /// if the user says "Yes" and continues with an utterance that triggers an
  /// intent it starts a conversation for the intent.
  /// </li>
  /// <li>
  /// If the user says "No" it responds with the rejection statement configured
  /// for the the follow-up prompt.
  /// </li>
  /// <li>
  /// If it doesn't recognize the utterance it repeats the follow-up prompt
  /// again.
  /// </li>
  /// </ul>
  /// The <code>followUpPrompt</code> field and the
  /// <code>conclusionStatement</code> field are mutually exclusive. You can
  /// specify only one.
  ///
  /// Parameter [fulfillmentActivity] :
  /// Required. Describes how the intent is fulfilled. For example, after a user
  /// provides all of the information for a pizza order,
  /// <code>fulfillmentActivity</code> defines how the bot places an order with
  /// a local pizza store.
  ///
  /// You might configure Amazon Lex to return all of the intent information to
  /// the client application, or direct it to invoke a Lambda function that can
  /// process the intent (for example, place an order with a pizzeria).
  ///
  /// Parameter [inputContexts] :
  /// An array of <code>InputContext</code> objects that lists the contexts that
  /// must be active for Amazon Lex to choose the intent in a conversation with
  /// the user.
  ///
  /// Parameter [kendraConfiguration] :
  /// Configuration information required to use the
  /// <code>AMAZON.KendraSearchIntent</code> intent to connect to an Amazon
  /// Kendra index. For more information, see <a
  /// href="http://docs.aws.amazon.com/lex/latest/dg/built-in-intent-kendra-search.html">
  /// AMAZON.KendraSearchIntent</a>.
  ///
  /// Parameter [outputContexts] :
  /// An array of <code>OutputContext</code> objects that lists the contexts
  /// that the intent activates when the intent is fulfilled.
  ///
  /// Parameter [parentIntentSignature] :
  /// A unique identifier for the built-in intent to base this intent on. To
  /// find the signature for an intent, see <a
  /// href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents">Standard
  /// Built-in Intents</a> in the <i>Alexa Skills Kit</i>.
  ///
  /// Parameter [rejectionStatement] :
  /// When the user answers "no" to the question defined in
  /// <code>confirmationPrompt</code>, Amazon Lex responds with this statement
  /// to acknowledge that the intent was canceled.
  /// <note>
  /// You must provide both the <code>rejectionStatement</code> and the
  /// <code>confirmationPrompt</code>, or neither.
  /// </note>
  ///
  /// Parameter [sampleUtterances] :
  /// An array of utterances (strings) that a user might say to signal the
  /// intent. For example, "I want {PizzaSize} pizza", "Order {Quantity}
  /// {PizzaSize} pizzas".
  ///
  /// In each utterance, a slot name is enclosed in curly braces.
  ///
  /// Parameter [slots] :
  /// An array of intent slots. At runtime, Amazon Lex elicits required slot
  /// values from the user using prompts defined in the slots. For more
  /// information, see <a>how-it-works</a>.
  Future<PutIntentResponse> putIntent({
    @_s.required String name,
    String checksum,
    Statement conclusionStatement,
    Prompt confirmationPrompt,
    bool createVersion,
    String description,
    CodeHook dialogCodeHook,
    FollowUpPrompt followUpPrompt,
    FulfillmentActivity fulfillmentActivity,
    List<InputContext> inputContexts,
    KendraConfiguration kendraConfiguration,
    List<OutputContext> outputContexts,
    String parentIntentSignature,
    Statement rejectionStatement,
    List<String> sampleUtterances,
    List<Slot> slots,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    final $payload = <String, dynamic>{
      if (checksum != null) 'checksum': checksum,
      if (conclusionStatement != null)
        'conclusionStatement': conclusionStatement,
      if (confirmationPrompt != null) 'confirmationPrompt': confirmationPrompt,
      if (createVersion != null) 'createVersion': createVersion,
      if (description != null) 'description': description,
      if (dialogCodeHook != null) 'dialogCodeHook': dialogCodeHook,
      if (followUpPrompt != null) 'followUpPrompt': followUpPrompt,
      if (fulfillmentActivity != null)
        'fulfillmentActivity': fulfillmentActivity,
      if (inputContexts != null) 'inputContexts': inputContexts,
      if (kendraConfiguration != null)
        'kendraConfiguration': kendraConfiguration,
      if (outputContexts != null) 'outputContexts': outputContexts,
      if (parentIntentSignature != null)
        'parentIntentSignature': parentIntentSignature,
      if (rejectionStatement != null) 'rejectionStatement': rejectionStatement,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
      if (slots != null) 'slots': slots,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/intents/${Uri.encodeComponent(name)}/versions/\$LATEST',
      exceptionFnMap: _exceptionFns,
    );
    return PutIntentResponse.fromJson(response);
  }

  /// Creates a custom slot type or replaces an existing custom slot type.
  ///
  /// To create a custom slot type, specify a name for the slot type and a set
  /// of enumeration values, which are the values that a slot of this type can
  /// assume. For more information, see <a>how-it-works</a>.
  ///
  /// If you specify the name of an existing slot type, the fields in the
  /// request replace the existing values in the <code>$LATEST</code> version of
  /// the slot type. Amazon Lex removes the fields that you don't provide in the
  /// request. If you don't specify required fields, Amazon Lex throws an
  /// exception. When you update the <code>$LATEST</code> version of a slot
  /// type, if a bot uses the <code>$LATEST</code> version of an intent that
  /// contains the slot type, the bot's <code>status</code> field is set to
  /// <code>NOT_BUILT</code>.
  ///
  /// This operation requires permissions for the <code>lex:PutSlotType</code>
  /// action.
  ///
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [PreconditionFailedException].
  ///
  /// Parameter [name] :
  /// The name of the slot type. The name is <i>not</i> case sensitive.
  ///
  /// The name can't match a built-in slot type name, or a built-in slot type
  /// name with "AMAZON." removed. For example, because there is a built-in slot
  /// type called <code>AMAZON.DATE</code>, you can't create a custom slot type
  /// called <code>DATE</code>.
  ///
  /// For a list of built-in slot types, see <a
  /// href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference">Slot
  /// Type Reference</a> in the <i>Alexa Skills Kit</i>.
  ///
  /// Parameter [checksum] :
  /// Identifies a specific revision of the <code>$LATEST</code> version.
  ///
  /// When you create a new slot type, leave the <code>checksum</code> field
  /// blank. If you specify a checksum you get a
  /// <code>BadRequestException</code> exception.
  ///
  /// When you want to update a slot type, set the <code>checksum</code> field
  /// to the checksum of the most recent revision of the <code>$LATEST</code>
  /// version. If you don't specify the <code> checksum</code> field, or if the
  /// checksum does not match the <code>$LATEST</code> version, you get a
  /// <code>PreconditionFailedException</code> exception.
  ///
  /// Parameter [createVersion] :
  /// When set to <code>true</code> a new numbered version of the slot type is
  /// created. This is the same as calling the
  /// <code>CreateSlotTypeVersion</code> operation. If you do not specify
  /// <code>createVersion</code>, the default is <code>false</code>.
  ///
  /// Parameter [description] :
  /// A description of the slot type.
  ///
  /// Parameter [enumerationValues] :
  /// A list of <code>EnumerationValue</code> objects that defines the values
  /// that the slot type can take. Each value can have a list of
  /// <code>synonyms</code>, which are additional values that help train the
  /// machine learning model about the values that it resolves for a slot.
  ///
  /// A regular expression slot type doesn't require enumeration values. All
  /// other slot types require a list of enumeration values.
  ///
  /// When Amazon Lex resolves a slot value, it generates a resolution list that
  /// contains up to five possible values for the slot. If you are using a
  /// Lambda function, this resolution list is passed to the function. If you
  /// are not using a Lambda function you can choose to return the value that
  /// the user entered or the first value in the resolution list as the slot
  /// value. The <code>valueSelectionStrategy</code> field indicates the option
  /// to use.
  ///
  /// Parameter [parentSlotTypeSignature] :
  /// The built-in slot type used as the parent of the slot type. When you
  /// define a parent slot type, the new slot type has all of the same
  /// configuration as the parent.
  ///
  /// Only <code>AMAZON.AlphaNumeric</code> is supported.
  ///
  /// Parameter [slotTypeConfigurations] :
  /// Configuration information that extends the parent built-in slot type. The
  /// configuration is added to the settings for the parent slot type.
  ///
  /// Parameter [valueSelectionStrategy] :
  /// Determines the slot resolution strategy that Amazon Lex uses to return
  /// slot type values. The field can be set to one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ORIGINAL_VALUE</code> - Returns the value entered by the user, if
  /// the user value is similar to the slot value.
  /// </li>
  /// <li>
  /// <code>TOP_RESOLUTION</code> - If there is a resolution list for the slot,
  /// return the first value in the resolution list as the slot type value. If
  /// there is no resolution list, null is returned.
  /// </li>
  /// </ul>
  /// If you don't specify the <code>valueSelectionStrategy</code>, the default
  /// is <code>ORIGINAL_VALUE</code>.
  Future<PutSlotTypeResponse> putSlotType({
    @_s.required String name,
    String checksum,
    bool createVersion,
    String description,
    List<EnumerationValue> enumerationValues,
    String parentSlotTypeSignature,
    List<SlotTypeConfiguration> slotTypeConfigurations,
    SlotValueSelectionStrategy valueSelectionStrategy,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z]_?)+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    _s.validateStringLength(
      'parentSlotTypeSignature',
      parentSlotTypeSignature,
      1,
      100,
    );
    _s.validateStringPattern(
      'parentSlotTypeSignature',
      parentSlotTypeSignature,
      r'''^((AMAZON\.)_?|[A-Za-z]_?)+''',
    );
    final $payload = <String, dynamic>{
      if (checksum != null) 'checksum': checksum,
      if (createVersion != null) 'createVersion': createVersion,
      if (description != null) 'description': description,
      if (enumerationValues != null) 'enumerationValues': enumerationValues,
      if (parentSlotTypeSignature != null)
        'parentSlotTypeSignature': parentSlotTypeSignature,
      if (slotTypeConfigurations != null)
        'slotTypeConfigurations': slotTypeConfigurations,
      if (valueSelectionStrategy != null)
        'valueSelectionStrategy': valueSelectionStrategy.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/slottypes/${Uri.encodeComponent(name)}/versions/\$LATEST',
      exceptionFnMap: _exceptionFns,
    );
    return PutSlotTypeResponse.fromJson(response);
  }

  /// Starts a job to import a resource to Amazon Lex.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [mergeStrategy] :
  /// Specifies the action that the <code>StartImport</code> operation should
  /// take when there is an existing resource with the same name.
  ///
  /// <ul>
  /// <li>
  /// FAIL_ON_CONFLICT - The import operation is stopped on the first conflict
  /// between a resource in the import file and an existing resource. The name
  /// of the resource causing the conflict is in the <code>failureReason</code>
  /// field of the response to the <code>GetImport</code> operation.
  ///
  /// OVERWRITE_LATEST - The import operation proceeds even if there is a
  /// conflict with an existing resource. The $LASTEST version of the existing
  /// resource is overwritten with the data from the import file.
  /// </li>
  /// </ul>
  ///
  /// Parameter [payload] :
  /// A zip archive in binary format. The archive should contain one file, a
  /// JSON file containing the resource to import. The resource should match the
  /// type specified in the <code>resourceType</code> field.
  ///
  /// Parameter [resourceType] :
  /// Specifies the type of resource to export. Each resource also exports any
  /// resources that it depends on.
  ///
  /// <ul>
  /// <li>
  /// A bot exports dependent intents.
  /// </li>
  /// <li>
  /// An intent exports dependent slot types.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// A list of tags to add to the imported bot. You can only add tags when you
  /// import a bot, you can't add tags to an intent or slot type.
  Future<StartImportResponse> startImport({
    @_s.required MergeStrategy mergeStrategy,
    @_s.required Uint8List payload,
    @_s.required ResourceType resourceType,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(mergeStrategy, 'mergeStrategy');
    ArgumentError.checkNotNull(payload, 'payload');
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    final $payload = <String, dynamic>{
      'mergeStrategy': mergeStrategy?.toValue() ?? '',
      'payload': payload?.let(base64Encode),
      'resourceType': resourceType?.toValue() ?? '',
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/imports/',
      exceptionFnMap: _exceptionFns,
    );
    return StartImportResponse.fromJson(response);
  }

  /// Adds the specified tags to the specified resource. If a tag key already
  /// exists, the existing value is replaced with the new value.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the bot, bot alias, or bot channel to
  /// tag.
  ///
  /// Parameter [tags] :
  /// A list of tag keys to add to the resource. If a tag key already exists,
  /// the existing value is replaced with the new value.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Removes tags from a bot, bot alias or bot channel.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to remove the tags from.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the resource. If a tag key does not
  /// exist on the resource, it is ignored.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }
}

/// Provides information about a bot alias.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BotAliasMetadata {
  /// The name of the bot to which the alias points.
  @_s.JsonKey(name: 'botName')
  final String botName;

  /// The version of the Amazon Lex bot to which the alias points.
  @_s.JsonKey(name: 'botVersion')
  final String botVersion;

  /// Checksum of the bot alias.
  @_s.JsonKey(name: 'checksum')
  final String checksum;

  /// Settings that determine how Amazon Lex uses conversation logs for the alias.
  @_s.JsonKey(name: 'conversationLogs')
  final ConversationLogsResponse conversationLogs;

  /// The date that the bot alias was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the bot alias.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The date that the bot alias was updated. When you create a resource, the
  /// creation date and last updated date are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the bot alias.
  @_s.JsonKey(name: 'name')
  final String name;

  BotAliasMetadata({
    this.botName,
    this.botVersion,
    this.checksum,
    this.conversationLogs,
    this.createdDate,
    this.description,
    this.lastUpdatedDate,
    this.name,
  });
  factory BotAliasMetadata.fromJson(Map<String, dynamic> json) =>
      _$BotAliasMetadataFromJson(json);
}

/// Represents an association between an Amazon Lex bot and an external
/// messaging platform.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BotChannelAssociation {
  /// An alias pointing to the specific version of the Amazon Lex bot to which
  /// this association is being made.
  @_s.JsonKey(name: 'botAlias')
  final String botAlias;

  /// Provides information necessary to communicate with the messaging platform.
  @_s.JsonKey(name: 'botConfiguration')
  final Map<String, String> botConfiguration;

  /// The name of the Amazon Lex bot to which this association is being made.
  /// <note>
  /// Currently, Amazon Lex supports associations with Facebook and Slack, and
  /// Twilio.
  /// </note>
  @_s.JsonKey(name: 'botName')
  final String botName;

  /// The date that the association between the Amazon Lex bot and the channel was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A text description of the association you are creating.
  @_s.JsonKey(name: 'description')
  final String description;

  /// If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the
  /// reason that it failed to create the association.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The name of the association between the bot and the channel.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of the bot channel.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATED</code> - The channel has been created and is ready for use.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code> - Channel creation is in progress.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - There was an error creating the channel. For
  /// information about the reason for the failure, see the
  /// <code>failureReason</code> field.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final ChannelStatus status;

  /// Specifies the type of association by indicating the type of channel being
  /// established between the Amazon Lex bot and the external messaging platform.
  @_s.JsonKey(name: 'type')
  final ChannelType type;

  BotChannelAssociation({
    this.botAlias,
    this.botConfiguration,
    this.botName,
    this.createdDate,
    this.description,
    this.failureReason,
    this.name,
    this.status,
    this.type,
  });
  factory BotChannelAssociation.fromJson(Map<String, dynamic> json) =>
      _$BotChannelAssociationFromJson(json);
}

/// Provides information about a bot. .
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BotMetadata {
  /// The date that the bot was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the bot.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The date that the bot was updated. When you create a bot, the creation date
  /// and last updated date are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the bot.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of the bot.
  @_s.JsonKey(name: 'status')
  final Status status;

  /// The version of the bot. For a new bot, the version is always
  /// <code>$LATEST</code>.
  @_s.JsonKey(name: 'version')
  final String version;

  BotMetadata({
    this.createdDate,
    this.description,
    this.lastUpdatedDate,
    this.name,
    this.status,
    this.version,
  });
  factory BotMetadata.fromJson(Map<String, dynamic> json) =>
      _$BotMetadataFromJson(json);
}

/// Provides metadata for a built-in intent.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BuiltinIntentMetadata {
  /// A unique identifier for the built-in intent. To find the signature for an
  /// intent, see <a
  /// href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents">Standard
  /// Built-in Intents</a> in the <i>Alexa Skills Kit</i>.
  @_s.JsonKey(name: 'signature')
  final String signature;

  /// A list of identifiers for the locales that the intent supports.
  @_s.JsonKey(name: 'supportedLocales')
  final List<Locale> supportedLocales;

  BuiltinIntentMetadata({
    this.signature,
    this.supportedLocales,
  });
  factory BuiltinIntentMetadata.fromJson(Map<String, dynamic> json) =>
      _$BuiltinIntentMetadataFromJson(json);
}

/// Provides information about a slot used in a built-in intent.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BuiltinIntentSlot {
  /// A list of the slots defined for the intent.
  @_s.JsonKey(name: 'name')
  final String name;

  BuiltinIntentSlot({
    this.name,
  });
  factory BuiltinIntentSlot.fromJson(Map<String, dynamic> json) =>
      _$BuiltinIntentSlotFromJson(json);
}

/// Provides information about a built in slot type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BuiltinSlotTypeMetadata {
  /// A unique identifier for the built-in slot type. To find the signature for a
  /// slot type, see <a
  /// href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference">Slot
  /// Type Reference</a> in the <i>Alexa Skills Kit</i>.
  @_s.JsonKey(name: 'signature')
  final String signature;

  /// A list of target locales for the slot.
  @_s.JsonKey(name: 'supportedLocales')
  final List<Locale> supportedLocales;

  BuiltinSlotTypeMetadata({
    this.signature,
    this.supportedLocales,
  });
  factory BuiltinSlotTypeMetadata.fromJson(Map<String, dynamic> json) =>
      _$BuiltinSlotTypeMetadataFromJson(json);
}

enum ChannelStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('FAILED')
  failed,
}

enum ChannelType {
  @_s.JsonValue('Facebook')
  facebook,
  @_s.JsonValue('Slack')
  slack,
  @_s.JsonValue('Twilio-Sms')
  twilioSms,
  @_s.JsonValue('Kik')
  kik,
}

/// Specifies a Lambda function that verifies requests to a bot or fulfills the
/// user's request to a bot..
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CodeHook {
  /// The version of the request-response that you want Amazon Lex to use to
  /// invoke your Lambda function. For more information, see <a>using-lambda</a>.
  @_s.JsonKey(name: 'messageVersion')
  final String messageVersion;

  /// The Amazon Resource Name (ARN) of the Lambda function.
  @_s.JsonKey(name: 'uri')
  final String uri;

  CodeHook({
    @_s.required this.messageVersion,
    @_s.required this.uri,
  });
  factory CodeHook.fromJson(Map<String, dynamic> json) =>
      _$CodeHookFromJson(json);

  Map<String, dynamic> toJson() => _$CodeHookToJson(this);
}

enum ContentType {
  @_s.JsonValue('PlainText')
  plainText,
  @_s.JsonValue('SSML')
  ssml,
  @_s.JsonValue('CustomPayload')
  customPayload,
}

/// Provides the settings needed for conversation logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ConversationLogsRequest {
  /// The Amazon Resource Name (ARN) of an IAM role with permission to write to
  /// your CloudWatch Logs for text logs and your S3 bucket for audio logs. If
  /// audio encryption is enabled, this role also provides access permission for
  /// the AWS KMS key used for encrypting audio logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/conversation-logs-role-and-policy.html">Creating
  /// an IAM Role and Policy for Conversation Logs</a>.
  @_s.JsonKey(name: 'iamRoleArn')
  final String iamRoleArn;

  /// The settings for your conversation logs. You can log the conversation text,
  /// conversation audio, or both.
  @_s.JsonKey(name: 'logSettings')
  final List<LogSettingsRequest> logSettings;

  ConversationLogsRequest({
    @_s.required this.iamRoleArn,
    @_s.required this.logSettings,
  });
  Map<String, dynamic> toJson() => _$ConversationLogsRequestToJson(this);
}

/// Contains information about conversation log settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConversationLogsResponse {
  /// The Amazon Resource Name (ARN) of the IAM role used to write your logs to
  /// CloudWatch Logs or an S3 bucket.
  @_s.JsonKey(name: 'iamRoleArn')
  final String iamRoleArn;

  /// The settings for your conversation logs. You can log text, audio, or both.
  @_s.JsonKey(name: 'logSettings')
  final List<LogSettingsResponse> logSettings;

  ConversationLogsResponse({
    this.iamRoleArn,
    this.logSettings,
  });
  factory ConversationLogsResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationLogsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBotVersionResponse {
  /// The message that Amazon Lex uses to cancel a conversation. For more
  /// information, see <a>PutBot</a>.
  @_s.JsonKey(name: 'abortStatement')
  final Statement abortStatement;

  /// Checksum identifying the version of the bot that was created.
  @_s.JsonKey(name: 'checksum')
  final String checksum;

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
  /// under age 13 and subject to COPPA.
  ///
  /// If your use of Amazon Lex relates to a website, program, or other
  /// application that is directed in whole or in part, to children under age 13,
  /// you must obtain any required verifiable parental consent under COPPA. For
  /// information regarding the use of Amazon Lex in connection with websites,
  /// programs, or other applications that are directed or targeted, in whole or
  /// in part, to children under age 13, see the <a
  /// href="https://aws.amazon.com/lex/faqs#data-security">Amazon Lex FAQ.</a>
  @_s.JsonKey(name: 'childDirected')
  final bool childDirected;

  /// The message that Amazon Lex uses when it doesn't understand the user's
  /// request. For more information, see <a>PutBot</a>.
  @_s.JsonKey(name: 'clarificationPrompt')
  final Prompt clarificationPrompt;

  /// The date when the bot version was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the bot.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Indicates whether utterances entered by the user should be sent to Amazon
  /// Comprehend for sentiment analysis.
  @_s.JsonKey(name: 'detectSentiment')
  final bool detectSentiment;

  /// Indicates whether the bot uses accuracy improvements. <code>true</code>
  /// indicates that the bot is using the improvements, otherwise,
  /// <code>false</code>.
  @_s.JsonKey(name: 'enableModelImprovements')
  final bool enableModelImprovements;

  /// If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the
  /// reason that it failed to build the bot.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The maximum time in seconds that Amazon Lex retains the data gathered in a
  /// conversation. For more information, see <a>PutBot</a>.
  @_s.JsonKey(name: 'idleSessionTTLInSeconds')
  final int idleSessionTTLInSeconds;

  /// An array of <code>Intent</code> objects. For more information, see
  /// <a>PutBot</a>.
  @_s.JsonKey(name: 'intents')
  final List<Intent> intents;

  /// The date when the <code>$LATEST</code> version of this bot was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// Specifies the target locale for the bot.
  @_s.JsonKey(name: 'locale')
  final Locale locale;

  /// The name of the bot.
  @_s.JsonKey(name: 'name')
  final String name;

  /// When you send a request to create or update a bot, Amazon Lex sets the
  /// <code>status</code> response element to <code>BUILDING</code>. After Amazon
  /// Lex builds the bot, it sets <code>status</code> to <code>READY</code>. If
  /// Amazon Lex can't build the bot, it sets <code>status</code> to
  /// <code>FAILED</code>. Amazon Lex returns the reason for the failure in the
  /// <code>failureReason</code> response element.
  @_s.JsonKey(name: 'status')
  final Status status;

  /// The version of the bot.
  @_s.JsonKey(name: 'version')
  final String version;

  /// The Amazon Polly voice ID that Amazon Lex uses for voice interactions with
  /// the user.
  @_s.JsonKey(name: 'voiceId')
  final String voiceId;

  CreateBotVersionResponse({
    this.abortStatement,
    this.checksum,
    this.childDirected,
    this.clarificationPrompt,
    this.createdDate,
    this.description,
    this.detectSentiment,
    this.enableModelImprovements,
    this.failureReason,
    this.idleSessionTTLInSeconds,
    this.intents,
    this.lastUpdatedDate,
    this.locale,
    this.name,
    this.status,
    this.version,
    this.voiceId,
  });
  factory CreateBotVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBotVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateIntentVersionResponse {
  /// Checksum of the intent version created.
  @_s.JsonKey(name: 'checksum')
  final String checksum;

  /// After the Lambda function specified in the <code>fulfillmentActivity</code>
  /// field fulfills the intent, Amazon Lex conveys this statement to the user.
  @_s.JsonKey(name: 'conclusionStatement')
  final Statement conclusionStatement;

  /// If defined, the prompt that Amazon Lex uses to confirm the user's intent
  /// before fulfilling it.
  @_s.JsonKey(name: 'confirmationPrompt')
  final Prompt confirmationPrompt;

  /// The date that the intent was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the intent.
  @_s.JsonKey(name: 'description')
  final String description;

  /// If defined, Amazon Lex invokes this Lambda function for each user input.
  @_s.JsonKey(name: 'dialogCodeHook')
  final CodeHook dialogCodeHook;

  /// If defined, Amazon Lex uses this prompt to solicit additional user activity
  /// after the intent is fulfilled.
  @_s.JsonKey(name: 'followUpPrompt')
  final FollowUpPrompt followUpPrompt;

  /// Describes how the intent is fulfilled.
  @_s.JsonKey(name: 'fulfillmentActivity')
  final FulfillmentActivity fulfillmentActivity;

  /// An array of <code>InputContext</code> objects that lists the contexts that
  /// must be active for Amazon Lex to choose the intent in a conversation with
  /// the user.
  @_s.JsonKey(name: 'inputContexts')
  final List<InputContext> inputContexts;

  /// Configuration information, if any, for connecting an Amazon Kendra index
  /// with the <code>AMAZON.KendraSearchIntent</code> intent.
  @_s.JsonKey(name: 'kendraConfiguration')
  final KendraConfiguration kendraConfiguration;

  /// The date that the intent was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the intent.
  @_s.JsonKey(name: 'name')
  final String name;

  /// An array of <code>OutputContext</code> objects that lists the contexts that
  /// the intent activates when the intent is fulfilled.
  @_s.JsonKey(name: 'outputContexts')
  final List<OutputContext> outputContexts;

  /// A unique identifier for a built-in intent.
  @_s.JsonKey(name: 'parentIntentSignature')
  final String parentIntentSignature;

  /// If the user answers "no" to the question defined in
  /// <code>confirmationPrompt</code>, Amazon Lex responds with this statement to
  /// acknowledge that the intent was canceled.
  @_s.JsonKey(name: 'rejectionStatement')
  final Statement rejectionStatement;

  /// An array of sample utterances configured for the intent.
  @_s.JsonKey(name: 'sampleUtterances')
  final List<String> sampleUtterances;

  /// An array of slot types that defines the information required to fulfill the
  /// intent.
  @_s.JsonKey(name: 'slots')
  final List<Slot> slots;

  /// The version number assigned to the new version of the intent.
  @_s.JsonKey(name: 'version')
  final String version;

  CreateIntentVersionResponse({
    this.checksum,
    this.conclusionStatement,
    this.confirmationPrompt,
    this.createdDate,
    this.description,
    this.dialogCodeHook,
    this.followUpPrompt,
    this.fulfillmentActivity,
    this.inputContexts,
    this.kendraConfiguration,
    this.lastUpdatedDate,
    this.name,
    this.outputContexts,
    this.parentIntentSignature,
    this.rejectionStatement,
    this.sampleUtterances,
    this.slots,
    this.version,
  });
  factory CreateIntentVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateIntentVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSlotTypeVersionResponse {
  /// Checksum of the <code>$LATEST</code> version of the slot type.
  @_s.JsonKey(name: 'checksum')
  final String checksum;

  /// The date that the slot type was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the slot type.
  @_s.JsonKey(name: 'description')
  final String description;

  /// A list of <code>EnumerationValue</code> objects that defines the values that
  /// the slot type can take.
  @_s.JsonKey(name: 'enumerationValues')
  final List<EnumerationValue> enumerationValues;

  /// The date that the slot type was updated. When you create a resource, the
  /// creation date and last update date are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the slot type.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The built-in slot type used a the parent of the slot type.
  @_s.JsonKey(name: 'parentSlotTypeSignature')
  final String parentSlotTypeSignature;

  /// Configuration information that extends the parent built-in slot type.
  @_s.JsonKey(name: 'slotTypeConfigurations')
  final List<SlotTypeConfiguration> slotTypeConfigurations;

  /// The strategy that Amazon Lex uses to determine the value of the slot. For
  /// more information, see <a>PutSlotType</a>.
  @_s.JsonKey(name: 'valueSelectionStrategy')
  final SlotValueSelectionStrategy valueSelectionStrategy;

  /// The version assigned to the new slot type version.
  @_s.JsonKey(name: 'version')
  final String version;

  CreateSlotTypeVersionResponse({
    this.checksum,
    this.createdDate,
    this.description,
    this.enumerationValues,
    this.lastUpdatedDate,
    this.name,
    this.parentSlotTypeSignature,
    this.slotTypeConfigurations,
    this.valueSelectionStrategy,
    this.version,
  });
  factory CreateSlotTypeVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSlotTypeVersionResponseFromJson(json);
}

enum Destination {
  @_s.JsonValue('CLOUDWATCH_LOGS')
  cloudwatchLogs,
  @_s.JsonValue('S3')
  s3,
}

/// Each slot type can have a set of values. Each enumeration value represents a
/// value the slot type can take.
///
/// For example, a pizza ordering bot could have a slot type that specifies the
/// type of crust that the pizza should have. The slot type could include the
/// values
///
/// <ul>
/// <li>
/// thick
/// </li>
/// <li>
/// thin
/// </li>
/// <li>
/// stuffed
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EnumerationValue {
  /// The value of the slot type.
  @_s.JsonKey(name: 'value')
  final String value;

  /// Additional values related to the slot type value.
  @_s.JsonKey(name: 'synonyms')
  final List<String> synonyms;

  EnumerationValue({
    @_s.required this.value,
    this.synonyms,
  });
  factory EnumerationValue.fromJson(Map<String, dynamic> json) =>
      _$EnumerationValueFromJson(json);

  Map<String, dynamic> toJson() => _$EnumerationValueToJson(this);
}

enum ExportStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('FAILED')
  failed,
}

enum ExportType {
  @_s.JsonValue('ALEXA_SKILLS_KIT')
  alexaSkillsKit,
  @_s.JsonValue('LEX')
  lex,
}

extension on ExportType {
  String toValue() {
    switch (this) {
      case ExportType.alexaSkillsKit:
        return 'ALEXA_SKILLS_KIT';
      case ExportType.lex:
        return 'LEX';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A prompt for additional activity after an intent is fulfilled. For example,
/// after the <code>OrderPizza</code> intent is fulfilled, you might prompt the
/// user to find out whether the user wants to order drinks.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FollowUpPrompt {
  /// Prompts for information from the user.
  @_s.JsonKey(name: 'prompt')
  final Prompt prompt;

  /// If the user answers "no" to the question defined in the <code>prompt</code>
  /// field, Amazon Lex responds with this statement to acknowledge that the
  /// intent was canceled.
  @_s.JsonKey(name: 'rejectionStatement')
  final Statement rejectionStatement;

  FollowUpPrompt({
    @_s.required this.prompt,
    @_s.required this.rejectionStatement,
  });
  factory FollowUpPrompt.fromJson(Map<String, dynamic> json) =>
      _$FollowUpPromptFromJson(json);

  Map<String, dynamic> toJson() => _$FollowUpPromptToJson(this);
}

/// Describes how the intent is fulfilled after the user provides all of the
/// information required for the intent. You can provide a Lambda function to
/// process the intent, or you can return the intent information to the client
/// application. We recommend that you use a Lambda function so that the
/// relevant logic lives in the Cloud and limit the client-side code primarily
/// to presentation. If you need to update the logic, you only update the Lambda
/// function; you don't need to upgrade your client application.
///
/// Consider the following examples:
///
/// <ul>
/// <li>
/// In a pizza ordering application, after the user provides all of the
/// information for placing an order, you use a Lambda function to place an
/// order with a pizzeria.
/// </li>
/// <li>
/// In a gaming application, when a user says "pick up a rock," this information
/// must go back to the client application so that it can perform the operation
/// and update the graphics. In this case, you want Amazon Lex to return the
/// intent data to the client.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FulfillmentActivity {
  /// How the intent should be fulfilled, either by running a Lambda function or
  /// by returning the slot data to the client application.
  @_s.JsonKey(name: 'type')
  final FulfillmentActivityType type;

  /// A description of the Lambda function that is run to fulfill the intent.
  @_s.JsonKey(name: 'codeHook')
  final CodeHook codeHook;

  FulfillmentActivity({
    @_s.required this.type,
    this.codeHook,
  });
  factory FulfillmentActivity.fromJson(Map<String, dynamic> json) =>
      _$FulfillmentActivityFromJson(json);

  Map<String, dynamic> toJson() => _$FulfillmentActivityToJson(this);
}

enum FulfillmentActivityType {
  @_s.JsonValue('ReturnIntent')
  returnIntent,
  @_s.JsonValue('CodeHook')
  codeHook,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBotAliasResponse {
  /// The name of the bot that the alias points to.
  @_s.JsonKey(name: 'botName')
  final String botName;

  /// The version of the bot that the alias points to.
  @_s.JsonKey(name: 'botVersion')
  final String botVersion;

  /// Checksum of the bot alias.
  @_s.JsonKey(name: 'checksum')
  final String checksum;

  /// The settings that determine how Amazon Lex uses conversation logs for the
  /// alias.
  @_s.JsonKey(name: 'conversationLogs')
  final ConversationLogsResponse conversationLogs;

  /// The date that the bot alias was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the bot alias.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The date that the bot alias was updated. When you create a resource, the
  /// creation date and the last updated date are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the bot alias.
  @_s.JsonKey(name: 'name')
  final String name;

  GetBotAliasResponse({
    this.botName,
    this.botVersion,
    this.checksum,
    this.conversationLogs,
    this.createdDate,
    this.description,
    this.lastUpdatedDate,
    this.name,
  });
  factory GetBotAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBotAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBotAliasesResponse {
  /// An array of <code>BotAliasMetadata</code> objects, each describing a bot
  /// alias.
  @_s.JsonKey(name: 'BotAliases')
  final List<BotAliasMetadata> botAliases;

  /// A pagination token for fetching next page of aliases. If the response to
  /// this call is truncated, Amazon Lex returns a pagination token in the
  /// response. To fetch the next page of aliases, specify the pagination token in
  /// the next request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetBotAliasesResponse({
    this.botAliases,
    this.nextToken,
  });
  factory GetBotAliasesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBotAliasesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBotChannelAssociationResponse {
  /// An alias pointing to the specific version of the Amazon Lex bot to which
  /// this association is being made.
  @_s.JsonKey(name: 'botAlias')
  final String botAlias;

  /// Provides information that the messaging platform needs to communicate with
  /// the Amazon Lex bot.
  @_s.JsonKey(name: 'botConfiguration')
  final Map<String, String> botConfiguration;

  /// The name of the Amazon Lex bot.
  @_s.JsonKey(name: 'botName')
  final String botName;

  /// The date that the association between the bot and the channel was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the association between the bot and the channel.
  @_s.JsonKey(name: 'description')
  final String description;

  /// If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the
  /// reason that it failed to create the association.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The name of the association between the bot and the channel.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of the bot channel.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATED</code> - The channel has been created and is ready for use.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code> - Channel creation is in progress.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - There was an error creating the channel. For
  /// information about the reason for the failure, see the
  /// <code>failureReason</code> field.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final ChannelStatus status;

  /// The type of the messaging platform.
  @_s.JsonKey(name: 'type')
  final ChannelType type;

  GetBotChannelAssociationResponse({
    this.botAlias,
    this.botConfiguration,
    this.botName,
    this.createdDate,
    this.description,
    this.failureReason,
    this.name,
    this.status,
    this.type,
  });
  factory GetBotChannelAssociationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetBotChannelAssociationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBotChannelAssociationsResponse {
  /// An array of objects, one for each association, that provides information
  /// about the Amazon Lex bot and its association with the channel.
  @_s.JsonKey(name: 'botChannelAssociations')
  final List<BotChannelAssociation> botChannelAssociations;

  /// A pagination token that fetches the next page of associations. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token in
  /// the response. To fetch the next page of associations, specify the pagination
  /// token in the next request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetBotChannelAssociationsResponse({
    this.botChannelAssociations,
    this.nextToken,
  });
  factory GetBotChannelAssociationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetBotChannelAssociationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBotResponse {
  /// The message that Amazon Lex returns when the user elects to end the
  /// conversation without completing it. For more information, see <a>PutBot</a>.
  @_s.JsonKey(name: 'abortStatement')
  final Statement abortStatement;

  /// Checksum of the bot used to identify a specific revision of the bot's
  /// <code>$LATEST</code> version.
  @_s.JsonKey(name: 'checksum')
  final String checksum;

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
  /// under age 13 and subject to COPPA.
  ///
  /// If your use of Amazon Lex relates to a website, program, or other
  /// application that is directed in whole or in part, to children under age 13,
  /// you must obtain any required verifiable parental consent under COPPA. For
  /// information regarding the use of Amazon Lex in connection with websites,
  /// programs, or other applications that are directed or targeted, in whole or
  /// in part, to children under age 13, see the <a
  /// href="https://aws.amazon.com/lex/faqs#data-security">Amazon Lex FAQ.</a>
  @_s.JsonKey(name: 'childDirected')
  final bool childDirected;

  /// The message Amazon Lex uses when it doesn't understand the user's request.
  /// For more information, see <a>PutBot</a>.
  @_s.JsonKey(name: 'clarificationPrompt')
  final Prompt clarificationPrompt;

  /// The date that the bot was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the bot.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Indicates whether user utterances should be sent to Amazon Comprehend for
  /// sentiment analysis.
  @_s.JsonKey(name: 'detectSentiment')
  final bool detectSentiment;

  /// Indicates whether the bot uses accuracy improvements. <code>true</code>
  /// indicates that the bot is using the improvements, otherwise,
  /// <code>false</code>.
  @_s.JsonKey(name: 'enableModelImprovements')
  final bool enableModelImprovements;

  /// If <code>status</code> is <code>FAILED</code>, Amazon Lex explains why it
  /// failed to build the bot.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The maximum time in seconds that Amazon Lex retains the data gathered in a
  /// conversation. For more information, see <a>PutBot</a>.
  @_s.JsonKey(name: 'idleSessionTTLInSeconds')
  final int idleSessionTTLInSeconds;

  /// An array of <code>intent</code> objects. For more information, see
  /// <a>PutBot</a>.
  @_s.JsonKey(name: 'intents')
  final List<Intent> intents;

  /// The date that the bot was updated. When you create a resource, the creation
  /// date and last updated date are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The target locale for the bot.
  @_s.JsonKey(name: 'locale')
  final Locale locale;

  /// The name of the bot.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The score that determines where Amazon Lex inserts the
  /// <code>AMAZON.FallbackIntent</code>, <code>AMAZON.KendraSearchIntent</code>,
  /// or both when returning alternative intents in a <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostContent.html">PostContent</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostText.html">PostText</a>
  /// response. <code>AMAZON.FallbackIntent</code> is inserted if the confidence
  /// score for all intents is below this value.
  /// <code>AMAZON.KendraSearchIntent</code> is only inserted if it is configured
  /// for the bot.
  @_s.JsonKey(name: 'nluIntentConfidenceThreshold')
  final double nluIntentConfidenceThreshold;

  /// The status of the bot.
  ///
  /// When the status is <code>BUILDING</code> Amazon Lex is building the bot for
  /// testing and use.
  ///
  /// If the status of the bot is <code>READY_BASIC_TESTING</code>, you can test
  /// the bot using the exact utterances specified in the bot's intents. When the
  /// bot is ready for full testing or to run, the status is <code>READY</code>.
  ///
  /// If there was a problem with building the bot, the status is
  /// <code>FAILED</code> and the <code>failureReason</code> field explains why
  /// the bot did not build.
  ///
  /// If the bot was saved but not built, the status is <code>NOT_BUILT</code>.
  @_s.JsonKey(name: 'status')
  final Status status;

  /// The version of the bot. For a new bot, the version is always
  /// <code>$LATEST</code>.
  @_s.JsonKey(name: 'version')
  final String version;

  /// The Amazon Polly voice ID that Amazon Lex uses for voice interaction with
  /// the user. For more information, see <a>PutBot</a>.
  @_s.JsonKey(name: 'voiceId')
  final String voiceId;

  GetBotResponse({
    this.abortStatement,
    this.checksum,
    this.childDirected,
    this.clarificationPrompt,
    this.createdDate,
    this.description,
    this.detectSentiment,
    this.enableModelImprovements,
    this.failureReason,
    this.idleSessionTTLInSeconds,
    this.intents,
    this.lastUpdatedDate,
    this.locale,
    this.name,
    this.nluIntentConfidenceThreshold,
    this.status,
    this.version,
    this.voiceId,
  });
  factory GetBotResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBotResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBotVersionsResponse {
  /// An array of <code>BotMetadata</code> objects, one for each numbered version
  /// of the bot plus one for the <code>$LATEST</code> version.
  @_s.JsonKey(name: 'bots')
  final List<BotMetadata> bots;

  /// A pagination token for fetching the next page of bot versions. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token in
  /// the response. To fetch the next page of versions, specify the pagination
  /// token in the next request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetBotVersionsResponse({
    this.bots,
    this.nextToken,
  });
  factory GetBotVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBotVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBotsResponse {
  /// An array of <code>botMetadata</code> objects, with one entry for each bot.
  @_s.JsonKey(name: 'bots')
  final List<BotMetadata> bots;

  /// If the response is truncated, it includes a pagination token that you can
  /// specify in your next request to fetch the next page of bots.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetBotsResponse({
    this.bots,
    this.nextToken,
  });
  factory GetBotsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBotsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBuiltinIntentResponse {
  /// The unique identifier for a built-in intent.
  @_s.JsonKey(name: 'signature')
  final String signature;

  /// An array of <code>BuiltinIntentSlot</code> objects, one entry for each slot
  /// type in the intent.
  @_s.JsonKey(name: 'slots')
  final List<BuiltinIntentSlot> slots;

  /// A list of locales that the intent supports.
  @_s.JsonKey(name: 'supportedLocales')
  final List<Locale> supportedLocales;

  GetBuiltinIntentResponse({
    this.signature,
    this.slots,
    this.supportedLocales,
  });
  factory GetBuiltinIntentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBuiltinIntentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBuiltinIntentsResponse {
  /// An array of <code>builtinIntentMetadata</code> objects, one for each intent
  /// in the response.
  @_s.JsonKey(name: 'intents')
  final List<BuiltinIntentMetadata> intents;

  /// A pagination token that fetches the next page of intents. If the response to
  /// this API call is truncated, Amazon Lex returns a pagination token in the
  /// response. To fetch the next page of intents, specify the pagination token in
  /// the next request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetBuiltinIntentsResponse({
    this.intents,
    this.nextToken,
  });
  factory GetBuiltinIntentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBuiltinIntentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBuiltinSlotTypesResponse {
  /// If the response is truncated, the response includes a pagination token that
  /// you can use in your next request to fetch the next page of slot types.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of <code>BuiltInSlotTypeMetadata</code> objects, one entry for each
  /// slot type returned.
  @_s.JsonKey(name: 'slotTypes')
  final List<BuiltinSlotTypeMetadata> slotTypes;

  GetBuiltinSlotTypesResponse({
    this.nextToken,
    this.slotTypes,
  });
  factory GetBuiltinSlotTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBuiltinSlotTypesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetExportResponse {
  /// The status of the export.
  ///
  /// <ul>
  /// <li>
  /// <code>IN_PROGRESS</code> - The export is in progress.
  /// </li>
  /// <li>
  /// <code>READY</code> - The export is complete.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The export could not be completed.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'exportStatus')
  final ExportStatus exportStatus;

  /// The format of the exported data.
  @_s.JsonKey(name: 'exportType')
  final ExportType exportType;

  /// If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the
  /// reason that it failed to export the resource.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The name of the bot being exported.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of the exported resource.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// An S3 pre-signed URL that provides the location of the exported resource.
  /// The exported resource is a ZIP archive that contains the exported resource
  /// in JSON format. The structure of the archive may change. Your code should
  /// not rely on the archive structure.
  @_s.JsonKey(name: 'url')
  final String url;

  /// The version of the bot being exported.
  @_s.JsonKey(name: 'version')
  final String version;

  GetExportResponse({
    this.exportStatus,
    this.exportType,
    this.failureReason,
    this.name,
    this.resourceType,
    this.url,
    this.version,
  });
  factory GetExportResponse.fromJson(Map<String, dynamic> json) =>
      _$GetExportResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetImportResponse {
  /// A timestamp for the date and time that the import job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A string that describes why an import job failed to complete.
  @_s.JsonKey(name: 'failureReason')
  final List<String> failureReason;

  /// The identifier for the specific import job.
  @_s.JsonKey(name: 'importId')
  final String importId;

  /// The status of the import job. If the status is <code>FAILED</code>, you can
  /// get the reason for the failure from the <code>failureReason</code> field.
  @_s.JsonKey(name: 'importStatus')
  final ImportStatus importStatus;

  /// The action taken when there was a conflict between an existing resource and
  /// a resource in the import file.
  @_s.JsonKey(name: 'mergeStrategy')
  final MergeStrategy mergeStrategy;

  /// The name given to the import job.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of resource imported.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  GetImportResponse({
    this.createdDate,
    this.failureReason,
    this.importId,
    this.importStatus,
    this.mergeStrategy,
    this.name,
    this.resourceType,
  });
  factory GetImportResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImportResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIntentResponse {
  /// Checksum of the intent.
  @_s.JsonKey(name: 'checksum')
  final String checksum;

  /// After the Lambda function specified in the <code>fulfillmentActivity</code>
  /// element fulfills the intent, Amazon Lex conveys this statement to the user.
  @_s.JsonKey(name: 'conclusionStatement')
  final Statement conclusionStatement;

  /// If defined in the bot, Amazon Lex uses prompt to confirm the intent before
  /// fulfilling the user's request. For more information, see <a>PutIntent</a>.
  @_s.JsonKey(name: 'confirmationPrompt')
  final Prompt confirmationPrompt;

  /// The date that the intent was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the intent.
  @_s.JsonKey(name: 'description')
  final String description;

  /// If defined in the bot, Amazon Amazon Lex invokes this Lambda function for
  /// each user input. For more information, see <a>PutIntent</a>.
  @_s.JsonKey(name: 'dialogCodeHook')
  final CodeHook dialogCodeHook;

  /// If defined in the bot, Amazon Lex uses this prompt to solicit additional
  /// user activity after the intent is fulfilled. For more information, see
  /// <a>PutIntent</a>.
  @_s.JsonKey(name: 'followUpPrompt')
  final FollowUpPrompt followUpPrompt;

  /// Describes how the intent is fulfilled. For more information, see
  /// <a>PutIntent</a>.
  @_s.JsonKey(name: 'fulfillmentActivity')
  final FulfillmentActivity fulfillmentActivity;

  /// An array of <code>InputContext</code> objects that lists the contexts that
  /// must be active for Amazon Lex to choose the intent in a conversation with
  /// the user.
  @_s.JsonKey(name: 'inputContexts')
  final List<InputContext> inputContexts;

  /// Configuration information, if any, to connect to an Amazon Kendra index with
  /// the <code>AMAZON.KendraSearchIntent</code> intent.
  @_s.JsonKey(name: 'kendraConfiguration')
  final KendraConfiguration kendraConfiguration;

  /// The date that the intent was updated. When you create a resource, the
  /// creation date and the last updated date are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the intent.
  @_s.JsonKey(name: 'name')
  final String name;

  /// An array of <code>OutputContext</code> objects that lists the contexts that
  /// the intent activates when the intent is fulfilled.
  @_s.JsonKey(name: 'outputContexts')
  final List<OutputContext> outputContexts;

  /// A unique identifier for a built-in intent.
  @_s.JsonKey(name: 'parentIntentSignature')
  final String parentIntentSignature;

  /// If the user answers "no" to the question defined in
  /// <code>confirmationPrompt</code>, Amazon Lex responds with this statement to
  /// acknowledge that the intent was canceled.
  @_s.JsonKey(name: 'rejectionStatement')
  final Statement rejectionStatement;

  /// An array of sample utterances configured for the intent.
  @_s.JsonKey(name: 'sampleUtterances')
  final List<String> sampleUtterances;

  /// An array of intent slots configured for the intent.
  @_s.JsonKey(name: 'slots')
  final List<Slot> slots;

  /// The version of the intent.
  @_s.JsonKey(name: 'version')
  final String version;

  GetIntentResponse({
    this.checksum,
    this.conclusionStatement,
    this.confirmationPrompt,
    this.createdDate,
    this.description,
    this.dialogCodeHook,
    this.followUpPrompt,
    this.fulfillmentActivity,
    this.inputContexts,
    this.kendraConfiguration,
    this.lastUpdatedDate,
    this.name,
    this.outputContexts,
    this.parentIntentSignature,
    this.rejectionStatement,
    this.sampleUtterances,
    this.slots,
    this.version,
  });
  factory GetIntentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIntentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIntentVersionsResponse {
  /// An array of <code>IntentMetadata</code> objects, one for each numbered
  /// version of the intent plus one for the <code>$LATEST</code> version.
  @_s.JsonKey(name: 'intents')
  final List<IntentMetadata> intents;

  /// A pagination token for fetching the next page of intent versions. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token in
  /// the response. To fetch the next page of versions, specify the pagination
  /// token in the next request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetIntentVersionsResponse({
    this.intents,
    this.nextToken,
  });
  factory GetIntentVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIntentVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIntentsResponse {
  /// An array of <code>Intent</code> objects. For more information, see
  /// <a>PutBot</a>.
  @_s.JsonKey(name: 'intents')
  final List<IntentMetadata> intents;

  /// If the response is truncated, the response includes a pagination token that
  /// you can specify in your next request to fetch the next page of intents.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetIntentsResponse({
    this.intents,
    this.nextToken,
  });
  factory GetIntentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIntentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSlotTypeResponse {
  /// Checksum of the <code>$LATEST</code> version of the slot type.
  @_s.JsonKey(name: 'checksum')
  final String checksum;

  /// The date that the slot type was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the slot type.
  @_s.JsonKey(name: 'description')
  final String description;

  /// A list of <code>EnumerationValue</code> objects that defines the values that
  /// the slot type can take.
  @_s.JsonKey(name: 'enumerationValues')
  final List<EnumerationValue> enumerationValues;

  /// The date that the slot type was updated. When you create a resource, the
  /// creation date and last update date are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the slot type.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The built-in slot type used as a parent for the slot type.
  @_s.JsonKey(name: 'parentSlotTypeSignature')
  final String parentSlotTypeSignature;

  /// Configuration information that extends the parent built-in slot type.
  @_s.JsonKey(name: 'slotTypeConfigurations')
  final List<SlotTypeConfiguration> slotTypeConfigurations;

  /// The strategy that Amazon Lex uses to determine the value of the slot. For
  /// more information, see <a>PutSlotType</a>.
  @_s.JsonKey(name: 'valueSelectionStrategy')
  final SlotValueSelectionStrategy valueSelectionStrategy;

  /// The version of the slot type.
  @_s.JsonKey(name: 'version')
  final String version;

  GetSlotTypeResponse({
    this.checksum,
    this.createdDate,
    this.description,
    this.enumerationValues,
    this.lastUpdatedDate,
    this.name,
    this.parentSlotTypeSignature,
    this.slotTypeConfigurations,
    this.valueSelectionStrategy,
    this.version,
  });
  factory GetSlotTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSlotTypeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSlotTypeVersionsResponse {
  /// A pagination token for fetching the next page of slot type versions. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token in
  /// the response. To fetch the next page of versions, specify the pagination
  /// token in the next request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of <code>SlotTypeMetadata</code> objects, one for each numbered
  /// version of the slot type plus one for the <code>$LATEST</code> version.
  @_s.JsonKey(name: 'slotTypes')
  final List<SlotTypeMetadata> slotTypes;

  GetSlotTypeVersionsResponse({
    this.nextToken,
    this.slotTypes,
  });
  factory GetSlotTypeVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSlotTypeVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSlotTypesResponse {
  /// If the response is truncated, it includes a pagination token that you can
  /// specify in your next request to fetch the next page of slot types.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of objects, one for each slot type, that provides information such
  /// as the name of the slot type, the version, and a description.
  @_s.JsonKey(name: 'slotTypes')
  final List<SlotTypeMetadata> slotTypes;

  GetSlotTypesResponse({
    this.nextToken,
    this.slotTypes,
  });
  factory GetSlotTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSlotTypesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUtterancesViewResponse {
  /// The name of the bot for which utterance information was returned.
  @_s.JsonKey(name: 'botName')
  final String botName;

  /// An array of <a>UtteranceList</a> objects, each containing a list of
  /// <a>UtteranceData</a> objects describing the utterances that were processed
  /// by your bot. The response contains a maximum of 100
  /// <code>UtteranceData</code> objects for each version. Amazon Lex returns the
  /// most frequent utterances received by the bot in the last 15 days.
  @_s.JsonKey(name: 'utterances')
  final List<UtteranceList> utterances;

  GetUtterancesViewResponse({
    this.botName,
    this.utterances,
  });
  factory GetUtterancesViewResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUtterancesViewResponseFromJson(json);
}

enum ImportStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETE')
  complete,
  @_s.JsonValue('FAILED')
  failed,
}

/// The name of a context that must be active for an intent to be selected by
/// Amazon Lex.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputContext {
  /// The name of the context.
  @_s.JsonKey(name: 'name')
  final String name;

  InputContext({
    @_s.required this.name,
  });
  factory InputContext.fromJson(Map<String, dynamic> json) =>
      _$InputContextFromJson(json);

  Map<String, dynamic> toJson() => _$InputContextToJson(this);
}

/// Identifies the specific version of an intent.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Intent {
  /// The name of the intent.
  @_s.JsonKey(name: 'intentName')
  final String intentName;

  /// The version of the intent.
  @_s.JsonKey(name: 'intentVersion')
  final String intentVersion;

  Intent({
    @_s.required this.intentName,
    @_s.required this.intentVersion,
  });
  factory Intent.fromJson(Map<String, dynamic> json) => _$IntentFromJson(json);

  Map<String, dynamic> toJson() => _$IntentToJson(this);
}

/// Provides information about an intent.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IntentMetadata {
  /// The date that the intent was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the intent.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The date that the intent was updated. When you create an intent, the
  /// creation date and last updated date are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the intent.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The version of the intent.
  @_s.JsonKey(name: 'version')
  final String version;

  IntentMetadata({
    this.createdDate,
    this.description,
    this.lastUpdatedDate,
    this.name,
    this.version,
  });
  factory IntentMetadata.fromJson(Map<String, dynamic> json) =>
      _$IntentMetadataFromJson(json);
}

/// Provides configuration information for the AMAZON.KendraSearchIntent intent.
/// When you use this intent, Amazon Lex searches the specified Amazon Kendra
/// index and returns documents from the index that match the user's utterance.
/// For more information, see <a
/// href="http://docs.aws.amazon.com/lex/latest/dg/built-in-intent-kendra-search.html">
/// AMAZON.KendraSearchIntent</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KendraConfiguration {
  /// The Amazon Resource Name (ARN) of the Amazon Kendra index that you want the
  /// AMAZON.KendraSearchIntent intent to search. The index must be in the same
  /// account and Region as the Amazon Lex bot. If the Amazon Kendra index does
  /// not exist, you get an exception when you call the <code>PutIntent</code>
  /// operation.
  @_s.JsonKey(name: 'kendraIndex')
  final String kendraIndex;

  /// The Amazon Resource Name (ARN) of an IAM role that has permission to search
  /// the Amazon Kendra index. The role must be in the same account and Region as
  /// the Amazon Lex bot. If the role does not exist, you get an exception when
  /// you call the <code>PutIntent</code> operation.
  @_s.JsonKey(name: 'role')
  final String role;

  /// A query filter that Amazon Lex sends to Amazon Kendra to filter the response
  /// from the query. The filter is in the format defined by Amazon Kendra. For
  /// more information, see <a
  /// href="http://docs.aws.amazon.com/kendra/latest/dg/filtering.html">Filtering
  /// queries</a>.
  ///
  /// You can override this filter string with a new filter string at runtime.
  @_s.JsonKey(name: 'queryFilterString')
  final String queryFilterString;

  KendraConfiguration({
    @_s.required this.kendraIndex,
    @_s.required this.role,
    this.queryFilterString,
  });
  factory KendraConfiguration.fromJson(Map<String, dynamic> json) =>
      _$KendraConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$KendraConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags associated with a resource.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum Locale {
  @_s.JsonValue('de-DE')
  deDe,
  @_s.JsonValue('en-AU')
  enAu,
  @_s.JsonValue('en-GB')
  enGb,
  @_s.JsonValue('en-US')
  enUs,
  @_s.JsonValue('es-419')
  es_419,
  @_s.JsonValue('es-ES')
  esEs,
  @_s.JsonValue('es-US')
  esUs,
  @_s.JsonValue('fr-FR')
  frFr,
  @_s.JsonValue('fr-CA')
  frCa,
  @_s.JsonValue('it-IT')
  itIt,
}

extension on Locale {
  String toValue() {
    switch (this) {
      case Locale.deDe:
        return 'de-DE';
      case Locale.enAu:
        return 'en-AU';
      case Locale.enGb:
        return 'en-GB';
      case Locale.enUs:
        return 'en-US';
      case Locale.es_419:
        return 'es-419';
      case Locale.esEs:
        return 'es-ES';
      case Locale.esUs:
        return 'es-US';
      case Locale.frFr:
        return 'fr-FR';
      case Locale.frCa:
        return 'fr-CA';
      case Locale.itIt:
        return 'it-IT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Settings used to configure delivery mode and destination for conversation
/// logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LogSettingsRequest {
  /// Where the logs will be delivered. Text logs are delivered to a CloudWatch
  /// Logs log group. Audio logs are delivered to an S3 bucket.
  @_s.JsonKey(name: 'destination')
  final Destination destination;

  /// The type of logging to enable. Text logs are delivered to a CloudWatch Logs
  /// log group. Audio logs are delivered to an S3 bucket.
  @_s.JsonKey(name: 'logType')
  final LogType logType;

  /// The Amazon Resource Name (ARN) of the CloudWatch Logs log group or S3 bucket
  /// where the logs should be delivered.
  @_s.JsonKey(name: 'resourceArn')
  final String resourceArn;

  /// The Amazon Resource Name (ARN) of the AWS KMS customer managed key for
  /// encrypting audio logs delivered to an S3 bucket. The key does not apply to
  /// CloudWatch Logs and is optional for S3 buckets.
  @_s.JsonKey(name: 'kmsKeyArn')
  final String kmsKeyArn;

  LogSettingsRequest({
    @_s.required this.destination,
    @_s.required this.logType,
    @_s.required this.resourceArn,
    this.kmsKeyArn,
  });
  Map<String, dynamic> toJson() => _$LogSettingsRequestToJson(this);
}

/// The settings for conversation logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LogSettingsResponse {
  /// The destination where logs are delivered.
  @_s.JsonKey(name: 'destination')
  final Destination destination;

  /// The Amazon Resource Name (ARN) of the key used to encrypt audio logs in an
  /// S3 bucket.
  @_s.JsonKey(name: 'kmsKeyArn')
  final String kmsKeyArn;

  /// The type of logging that is enabled.
  @_s.JsonKey(name: 'logType')
  final LogType logType;

  /// The Amazon Resource Name (ARN) of the CloudWatch Logs log group or S3 bucket
  /// where the logs are delivered.
  @_s.JsonKey(name: 'resourceArn')
  final String resourceArn;

  /// The resource prefix is the first part of the S3 object key within the S3
  /// bucket that you specified to contain audio logs. For CloudWatch Logs it is
  /// the prefix of the log stream name within the log group that you specified.
  @_s.JsonKey(name: 'resourcePrefix')
  final String resourcePrefix;

  LogSettingsResponse({
    this.destination,
    this.kmsKeyArn,
    this.logType,
    this.resourceArn,
    this.resourcePrefix,
  });
  factory LogSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$LogSettingsResponseFromJson(json);
}

enum LogType {
  @_s.JsonValue('AUDIO')
  audio,
  @_s.JsonValue('TEXT')
  text,
}

enum MergeStrategy {
  @_s.JsonValue('OVERWRITE_LATEST')
  overwriteLatest,
  @_s.JsonValue('FAIL_ON_CONFLICT')
  failOnConflict,
}

extension on MergeStrategy {
  String toValue() {
    switch (this) {
      case MergeStrategy.overwriteLatest:
        return 'OVERWRITE_LATEST';
      case MergeStrategy.failOnConflict:
        return 'FAIL_ON_CONFLICT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The message object that provides the message text and its type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Message {
  /// The text of the message.
  @_s.JsonKey(name: 'content')
  final String content;

  /// The content type of the message string.
  @_s.JsonKey(name: 'contentType')
  final ContentType contentType;

  /// Identifies the message group that the message belongs to. When a group is
  /// assigned to a message, Amazon Lex returns one message from each group in the
  /// response.
  @_s.JsonKey(name: 'groupNumber')
  final int groupNumber;

  Message({
    @_s.required this.content,
    @_s.required this.contentType,
    this.groupNumber,
  });
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

enum ObfuscationSetting {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('DEFAULT_OBFUSCATION')
  defaultObfuscation,
}

/// The specification of an output context that is set when an intent is
/// fulfilled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputContext {
  /// The name of the context.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The number of seconds that the context should be active after it is first
  /// sent in a <code>PostContent</code> or <code>PostText</code> response. You
  /// can set the value between 5 and 86,400 seconds (24 hours).
  @_s.JsonKey(name: 'timeToLiveInSeconds')
  final int timeToLiveInSeconds;

  /// The number of conversation turns that the context should be active. A
  /// conversation turn is one <code>PostContent</code> or <code>PostText</code>
  /// request and the corresponding response from Amazon Lex.
  @_s.JsonKey(name: 'turnsToLive')
  final int turnsToLive;

  OutputContext({
    @_s.required this.name,
    @_s.required this.timeToLiveInSeconds,
    @_s.required this.turnsToLive,
  });
  factory OutputContext.fromJson(Map<String, dynamic> json) =>
      _$OutputContextFromJson(json);

  Map<String, dynamic> toJson() => _$OutputContextToJson(this);
}

enum ProcessBehavior {
  @_s.JsonValue('SAVE')
  save,
  @_s.JsonValue('BUILD')
  build,
}

extension on ProcessBehavior {
  String toValue() {
    switch (this) {
      case ProcessBehavior.save:
        return 'SAVE';
      case ProcessBehavior.build:
        return 'BUILD';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Obtains information from the user. To define a prompt, provide one or more
/// messages and specify the number of attempts to get information from the
/// user. If you provide more than one message, Amazon Lex chooses one of the
/// messages to use to prompt the user. For more information, see
/// <a>how-it-works</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Prompt {
  /// The number of times to prompt the user for information.
  @_s.JsonKey(name: 'maxAttempts')
  final int maxAttempts;

  /// An array of objects, each of which provides a message string and its type.
  /// You can specify the message string in plain text or in Speech Synthesis
  /// Markup Language (SSML).
  @_s.JsonKey(name: 'messages')
  final List<Message> messages;

  /// A response card. Amazon Lex uses this prompt at runtime, in the
  /// <code>PostText</code> API response. It substitutes session attributes and
  /// slot values for placeholders in the response card. For more information, see
  /// <a>ex-resp-card</a>.
  @_s.JsonKey(name: 'responseCard')
  final String responseCard;

  Prompt({
    @_s.required this.maxAttempts,
    @_s.required this.messages,
    this.responseCard,
  });
  factory Prompt.fromJson(Map<String, dynamic> json) => _$PromptFromJson(json);

  Map<String, dynamic> toJson() => _$PromptToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutBotAliasResponse {
  /// The name of the bot that the alias points to.
  @_s.JsonKey(name: 'botName')
  final String botName;

  /// The version of the bot that the alias points to.
  @_s.JsonKey(name: 'botVersion')
  final String botVersion;

  /// The checksum for the current version of the alias.
  @_s.JsonKey(name: 'checksum')
  final String checksum;

  /// The settings that determine how Amazon Lex uses conversation logs for the
  /// alias.
  @_s.JsonKey(name: 'conversationLogs')
  final ConversationLogsResponse conversationLogs;

  /// The date that the bot alias was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the alias.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The date that the bot alias was updated. When you create a resource, the
  /// creation date and the last updated date are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the alias.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of tags associated with a bot.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  PutBotAliasResponse({
    this.botName,
    this.botVersion,
    this.checksum,
    this.conversationLogs,
    this.createdDate,
    this.description,
    this.lastUpdatedDate,
    this.name,
    this.tags,
  });
  factory PutBotAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$PutBotAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutBotResponse {
  /// The message that Amazon Lex uses to cancel a conversation. For more
  /// information, see <a>PutBot</a>.
  @_s.JsonKey(name: 'abortStatement')
  final Statement abortStatement;

  /// Checksum of the bot that you created.
  @_s.JsonKey(name: 'checksum')
  final String checksum;

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
  /// under age 13 and subject to COPPA.
  ///
  /// If your use of Amazon Lex relates to a website, program, or other
  /// application that is directed in whole or in part, to children under age 13,
  /// you must obtain any required verifiable parental consent under COPPA. For
  /// information regarding the use of Amazon Lex in connection with websites,
  /// programs, or other applications that are directed or targeted, in whole or
  /// in part, to children under age 13, see the <a
  /// href="https://aws.amazon.com/lex/faqs#data-security">Amazon Lex FAQ.</a>
  @_s.JsonKey(name: 'childDirected')
  final bool childDirected;

  /// The prompts that Amazon Lex uses when it doesn't understand the user's
  /// intent. For more information, see <a>PutBot</a>.
  @_s.JsonKey(name: 'clarificationPrompt')
  final Prompt clarificationPrompt;

  /// <code>True</code> if a new version of the bot was created. If the
  /// <code>createVersion</code> field was not specified in the request, the
  /// <code>createVersion</code> field is set to false in the response.
  @_s.JsonKey(name: 'createVersion')
  final bool createVersion;

  /// The date that the bot was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the bot.
  @_s.JsonKey(name: 'description')
  final String description;

  /// <code>true</code> if the bot is configured to send user utterances to Amazon
  /// Comprehend for sentiment analysis. If the <code>detectSentiment</code> field
  /// was not specified in the request, the <code>detectSentiment</code> field is
  /// <code>false</code> in the response.
  @_s.JsonKey(name: 'detectSentiment')
  final bool detectSentiment;

  /// Indicates whether the bot uses accuracy improvements. <code>true</code>
  /// indicates that the bot is using the improvements, otherwise,
  /// <code>false</code>.
  @_s.JsonKey(name: 'enableModelImprovements')
  final bool enableModelImprovements;

  /// If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the
  /// reason that it failed to build the bot.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The maximum length of time that Amazon Lex retains the data gathered in a
  /// conversation. For more information, see <a>PutBot</a>.
  @_s.JsonKey(name: 'idleSessionTTLInSeconds')
  final int idleSessionTTLInSeconds;

  /// An array of <code>Intent</code> objects. For more information, see
  /// <a>PutBot</a>.
  @_s.JsonKey(name: 'intents')
  final List<Intent> intents;

  /// The date that the bot was updated. When you create a resource, the creation
  /// date and last updated date are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The target locale for the bot.
  @_s.JsonKey(name: 'locale')
  final Locale locale;

  /// The name of the bot.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The score that determines where Amazon Lex inserts the
  /// <code>AMAZON.FallbackIntent</code>, <code>AMAZON.KendraSearchIntent</code>,
  /// or both when returning alternative intents in a <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostContent.html">PostContent</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostText.html">PostText</a>
  /// response. <code>AMAZON.FallbackIntent</code> is inserted if the confidence
  /// score for all intents is below this value.
  /// <code>AMAZON.KendraSearchIntent</code> is only inserted if it is configured
  /// for the bot.
  @_s.JsonKey(name: 'nluIntentConfidenceThreshold')
  final double nluIntentConfidenceThreshold;

  /// When you send a request to create a bot with <code>processBehavior</code>
  /// set to <code>BUILD</code>, Amazon Lex sets the <code>status</code> response
  /// element to <code>BUILDING</code>.
  ///
  /// In the <code>READY_BASIC_TESTING</code> state you can test the bot with user
  /// inputs that exactly match the utterances configured for the bot's intents
  /// and values in the slot types.
  ///
  /// If Amazon Lex can't build the bot, Amazon Lex sets <code>status</code> to
  /// <code>FAILED</code>. Amazon Lex returns the reason for the failure in the
  /// <code>failureReason</code> response element.
  ///
  /// When you set <code>processBehavior</code> to <code>SAVE</code>, Amazon Lex
  /// sets the status code to <code>NOT BUILT</code>.
  ///
  /// When the bot is in the <code>READY</code> state you can test and publish the
  /// bot.
  @_s.JsonKey(name: 'status')
  final Status status;

  /// A list of tags associated with the bot.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// The version of the bot. For a new bot, the version is always
  /// <code>$LATEST</code>.
  @_s.JsonKey(name: 'version')
  final String version;

  /// The Amazon Polly voice ID that Amazon Lex uses for voice interaction with
  /// the user. For more information, see <a>PutBot</a>.
  @_s.JsonKey(name: 'voiceId')
  final String voiceId;

  PutBotResponse({
    this.abortStatement,
    this.checksum,
    this.childDirected,
    this.clarificationPrompt,
    this.createVersion,
    this.createdDate,
    this.description,
    this.detectSentiment,
    this.enableModelImprovements,
    this.failureReason,
    this.idleSessionTTLInSeconds,
    this.intents,
    this.lastUpdatedDate,
    this.locale,
    this.name,
    this.nluIntentConfidenceThreshold,
    this.status,
    this.tags,
    this.version,
    this.voiceId,
  });
  factory PutBotResponse.fromJson(Map<String, dynamic> json) =>
      _$PutBotResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutIntentResponse {
  /// Checksum of the <code>$LATEST</code>version of the intent created or
  /// updated.
  @_s.JsonKey(name: 'checksum')
  final String checksum;

  /// After the Lambda function specified in
  /// the<code>fulfillmentActivity</code>intent fulfills the intent, Amazon Lex
  /// conveys this statement to the user.
  @_s.JsonKey(name: 'conclusionStatement')
  final Statement conclusionStatement;

  /// If defined in the intent, Amazon Lex prompts the user to confirm the intent
  /// before fulfilling it.
  @_s.JsonKey(name: 'confirmationPrompt')
  final Prompt confirmationPrompt;

  /// <code>True</code> if a new version of the intent was created. If the
  /// <code>createVersion</code> field was not specified in the request, the
  /// <code>createVersion</code> field is set to false in the response.
  @_s.JsonKey(name: 'createVersion')
  final bool createVersion;

  /// The date that the intent was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the intent.
  @_s.JsonKey(name: 'description')
  final String description;

  /// If defined in the intent, Amazon Lex invokes this Lambda function for each
  /// user input.
  @_s.JsonKey(name: 'dialogCodeHook')
  final CodeHook dialogCodeHook;

  /// If defined in the intent, Amazon Lex uses this prompt to solicit additional
  /// user activity after the intent is fulfilled.
  @_s.JsonKey(name: 'followUpPrompt')
  final FollowUpPrompt followUpPrompt;

  /// If defined in the intent, Amazon Lex invokes this Lambda function to fulfill
  /// the intent after the user provides all of the information required by the
  /// intent.
  @_s.JsonKey(name: 'fulfillmentActivity')
  final FulfillmentActivity fulfillmentActivity;

  /// An array of <code>InputContext</code> objects that lists the contexts that
  /// must be active for Amazon Lex to choose the intent in a conversation with
  /// the user.
  @_s.JsonKey(name: 'inputContexts')
  final List<InputContext> inputContexts;

  /// Configuration information, if any, required to connect to an Amazon Kendra
  /// index and use the <code>AMAZON.KendraSearchIntent</code> intent.
  @_s.JsonKey(name: 'kendraConfiguration')
  final KendraConfiguration kendraConfiguration;

  /// The date that the intent was updated. When you create a resource, the
  /// creation date and last update dates are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the intent.
  @_s.JsonKey(name: 'name')
  final String name;

  /// An array of <code>OutputContext</code> objects that lists the contexts that
  /// the intent activates when the intent is fulfilled.
  @_s.JsonKey(name: 'outputContexts')
  final List<OutputContext> outputContexts;

  /// A unique identifier for the built-in intent that this intent is based on.
  @_s.JsonKey(name: 'parentIntentSignature')
  final String parentIntentSignature;

  /// If the user answers "no" to the question defined in
  /// <code>confirmationPrompt</code> Amazon Lex responds with this statement to
  /// acknowledge that the intent was canceled.
  @_s.JsonKey(name: 'rejectionStatement')
  final Statement rejectionStatement;

  /// An array of sample utterances that are configured for the intent.
  @_s.JsonKey(name: 'sampleUtterances')
  final List<String> sampleUtterances;

  /// An array of intent slots that are configured for the intent.
  @_s.JsonKey(name: 'slots')
  final List<Slot> slots;

  /// The version of the intent. For a new intent, the version is always
  /// <code>$LATEST</code>.
  @_s.JsonKey(name: 'version')
  final String version;

  PutIntentResponse({
    this.checksum,
    this.conclusionStatement,
    this.confirmationPrompt,
    this.createVersion,
    this.createdDate,
    this.description,
    this.dialogCodeHook,
    this.followUpPrompt,
    this.fulfillmentActivity,
    this.inputContexts,
    this.kendraConfiguration,
    this.lastUpdatedDate,
    this.name,
    this.outputContexts,
    this.parentIntentSignature,
    this.rejectionStatement,
    this.sampleUtterances,
    this.slots,
    this.version,
  });
  factory PutIntentResponse.fromJson(Map<String, dynamic> json) =>
      _$PutIntentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutSlotTypeResponse {
  /// Checksum of the <code>$LATEST</code> version of the slot type.
  @_s.JsonKey(name: 'checksum')
  final String checksum;

  /// <code>True</code> if a new version of the slot type was created. If the
  /// <code>createVersion</code> field was not specified in the request, the
  /// <code>createVersion</code> field is set to false in the response.
  @_s.JsonKey(name: 'createVersion')
  final bool createVersion;

  /// The date that the slot type was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the slot type.
  @_s.JsonKey(name: 'description')
  final String description;

  /// A list of <code>EnumerationValue</code> objects that defines the values that
  /// the slot type can take.
  @_s.JsonKey(name: 'enumerationValues')
  final List<EnumerationValue> enumerationValues;

  /// The date that the slot type was updated. When you create a slot type, the
  /// creation date and last update date are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the slot type.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The built-in slot type used as the parent of the slot type.
  @_s.JsonKey(name: 'parentSlotTypeSignature')
  final String parentSlotTypeSignature;

  /// Configuration information that extends the parent built-in slot type.
  @_s.JsonKey(name: 'slotTypeConfigurations')
  final List<SlotTypeConfiguration> slotTypeConfigurations;

  /// The slot resolution strategy that Amazon Lex uses to determine the value of
  /// the slot. For more information, see <a>PutSlotType</a>.
  @_s.JsonKey(name: 'valueSelectionStrategy')
  final SlotValueSelectionStrategy valueSelectionStrategy;

  /// The version of the slot type. For a new slot type, the version is always
  /// <code>$LATEST</code>.
  @_s.JsonKey(name: 'version')
  final String version;

  PutSlotTypeResponse({
    this.checksum,
    this.createVersion,
    this.createdDate,
    this.description,
    this.enumerationValues,
    this.lastUpdatedDate,
    this.name,
    this.parentSlotTypeSignature,
    this.slotTypeConfigurations,
    this.valueSelectionStrategy,
    this.version,
  });
  factory PutSlotTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$PutSlotTypeResponseFromJson(json);
}

enum ResourceType {
  @_s.JsonValue('BOT')
  bot,
  @_s.JsonValue('INTENT')
  intent,
  @_s.JsonValue('SLOT_TYPE')
  slotType,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.bot:
        return 'BOT';
      case ResourceType.intent:
        return 'INTENT';
      case ResourceType.slotType:
        return 'SLOT_TYPE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Identifies the version of a specific slot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Slot {
  /// The name of the slot.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Specifies whether the slot is required or optional.
  @_s.JsonKey(name: 'slotConstraint')
  final SlotConstraint slotConstraint;

  /// A list of default values for the slot. Default values are used when Amazon
  /// Lex hasn't determined a value for a slot. You can specify default values
  /// from context variables, session attributes, and defined values.
  @_s.JsonKey(name: 'defaultValueSpec')
  final SlotDefaultValueSpec defaultValueSpec;

  /// A description of the slot.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Determines whether a slot is obfuscated in conversation logs and stored
  /// utterances. When you obfuscate a slot, the value is replaced by the slot
  /// name in curly braces ({}). For example, if the slot name is "full_name",
  /// obfuscated values are replaced with "{full_name}". For more information, see
  /// <a href="https://docs.aws.amazon.com/lex/latest/dg/how-obfuscate.html"> Slot
  /// Obfuscation </a>.
  @_s.JsonKey(name: 'obfuscationSetting')
  final ObfuscationSetting obfuscationSetting;

  /// Directs Amazon Lex the order in which to elicit this slot value from the
  /// user. For example, if the intent has two slots with priorities 1 and 2, AWS
  /// Amazon Lex first elicits a value for the slot with priority 1.
  ///
  /// If multiple slots share the same priority, the order in which Amazon Lex
  /// elicits values is arbitrary.
  @_s.JsonKey(name: 'priority')
  final int priority;

  /// A set of possible responses for the slot type used by text-based clients. A
  /// user chooses an option from the response card, instead of using text to
  /// reply.
  @_s.JsonKey(name: 'responseCard')
  final String responseCard;

  /// If you know a specific pattern with which users might respond to an Amazon
  /// Lex request for a slot value, you can provide those utterances to improve
  /// accuracy. This is optional. In most cases, Amazon Lex is capable of
  /// understanding user utterances.
  @_s.JsonKey(name: 'sampleUtterances')
  final List<String> sampleUtterances;

  /// The type of the slot, either a custom slot type that you defined or one of
  /// the built-in slot types.
  @_s.JsonKey(name: 'slotType')
  final String slotType;

  /// The version of the slot type.
  @_s.JsonKey(name: 'slotTypeVersion')
  final String slotTypeVersion;

  /// The prompt that Amazon Lex uses to elicit the slot value from the user.
  @_s.JsonKey(name: 'valueElicitationPrompt')
  final Prompt valueElicitationPrompt;

  Slot({
    @_s.required this.name,
    @_s.required this.slotConstraint,
    this.defaultValueSpec,
    this.description,
    this.obfuscationSetting,
    this.priority,
    this.responseCard,
    this.sampleUtterances,
    this.slotType,
    this.slotTypeVersion,
    this.valueElicitationPrompt,
  });
  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);

  Map<String, dynamic> toJson() => _$SlotToJson(this);
}

enum SlotConstraint {
  @_s.JsonValue('Required')
  required,
  @_s.JsonValue('Optional')
  optional,
}

/// A default value for a slot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SlotDefaultValue {
  /// The default value for the slot. You can specify one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>#context-name.slot-name</code> - The slot value "slot-name" in the
  /// context "context-name."
  /// </li>
  /// <li>
  /// <code>{attribute}</code> - The slot value of the session attribute
  /// "attribute."
  /// </li>
  /// <li>
  /// <code>'value'</code> - The discrete value "value."
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'defaultValue')
  final String defaultValue;

  SlotDefaultValue({
    @_s.required this.defaultValue,
  });
  factory SlotDefaultValue.fromJson(Map<String, dynamic> json) =>
      _$SlotDefaultValueFromJson(json);

  Map<String, dynamic> toJson() => _$SlotDefaultValueToJson(this);
}

/// Contains the default values for a slot. Default values are used when Amazon
/// Lex hasn't determined a value for a slot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SlotDefaultValueSpec {
  /// The default values for a slot. You can specify more than one default. For
  /// example, you can specify a default value to use from a matching context
  /// variable, a session attribute, or a fixed value.
  ///
  /// The default value chosen is selected based on the order that you specify
  /// them in the list. For example, if you specify a context variable and a fixed
  /// value in that order, Amazon Lex uses the context variable if it is
  /// available, else it uses the fixed value.
  @_s.JsonKey(name: 'defaultValueList')
  final List<SlotDefaultValue> defaultValueList;

  SlotDefaultValueSpec({
    @_s.required this.defaultValueList,
  });
  factory SlotDefaultValueSpec.fromJson(Map<String, dynamic> json) =>
      _$SlotDefaultValueSpecFromJson(json);

  Map<String, dynamic> toJson() => _$SlotDefaultValueSpecToJson(this);
}

/// Provides configuration information for a slot type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SlotTypeConfiguration {
  /// A regular expression used to validate the value of a slot.
  @_s.JsonKey(name: 'regexConfiguration')
  final SlotTypeRegexConfiguration regexConfiguration;

  SlotTypeConfiguration({
    this.regexConfiguration,
  });
  factory SlotTypeConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SlotTypeConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SlotTypeConfigurationToJson(this);
}

/// Provides information about a slot type..
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SlotTypeMetadata {
  /// The date that the slot type was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// A description of the slot type.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The date that the slot type was updated. When you create a resource, the
  /// creation date and last updated date are the same.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the slot type.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The version of the slot type.
  @_s.JsonKey(name: 'version')
  final String version;

  SlotTypeMetadata({
    this.createdDate,
    this.description,
    this.lastUpdatedDate,
    this.name,
    this.version,
  });
  factory SlotTypeMetadata.fromJson(Map<String, dynamic> json) =>
      _$SlotTypeMetadataFromJson(json);
}

/// Provides a regular expression used to validate the value of a slot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SlotTypeRegexConfiguration {
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
  @_s.JsonKey(name: 'pattern')
  final String pattern;

  SlotTypeRegexConfiguration({
    @_s.required this.pattern,
  });
  factory SlotTypeRegexConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SlotTypeRegexConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SlotTypeRegexConfigurationToJson(this);
}

enum SlotValueSelectionStrategy {
  @_s.JsonValue('ORIGINAL_VALUE')
  originalValue,
  @_s.JsonValue('TOP_RESOLUTION')
  topResolution,
}

extension on SlotValueSelectionStrategy {
  String toValue() {
    switch (this) {
      case SlotValueSelectionStrategy.originalValue:
        return 'ORIGINAL_VALUE';
      case SlotValueSelectionStrategy.topResolution:
        return 'TOP_RESOLUTION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartImportResponse {
  /// A timestamp for the date and time that the import job was requested.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The identifier for the specific import job.
  @_s.JsonKey(name: 'importId')
  final String importId;

  /// The status of the import job. If the status is <code>FAILED</code>, you can
  /// get the reason for the failure using the <code>GetImport</code> operation.
  @_s.JsonKey(name: 'importStatus')
  final ImportStatus importStatus;

  /// The action to take when there is a merge conflict.
  @_s.JsonKey(name: 'mergeStrategy')
  final MergeStrategy mergeStrategy;

  /// The name given to the import job.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of resource to import.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// A list of tags added to the imported bot.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  StartImportResponse({
    this.createdDate,
    this.importId,
    this.importStatus,
    this.mergeStrategy,
    this.name,
    this.resourceType,
    this.tags,
  });
  factory StartImportResponse.fromJson(Map<String, dynamic> json) =>
      _$StartImportResponseFromJson(json);
}

/// A collection of messages that convey information to the user. At runtime,
/// Amazon Lex selects the message to convey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Statement {
  /// A collection of message objects.
  @_s.JsonKey(name: 'messages')
  final List<Message> messages;

  /// At runtime, if the client is using the <a
  /// href="http://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostText.html">PostText</a>
  /// API, Amazon Lex includes the response card in the response. It substitutes
  /// all of the session attributes and slot values for placeholders in the
  /// response card.
  @_s.JsonKey(name: 'responseCard')
  final String responseCard;

  Statement({
    @_s.required this.messages,
    this.responseCard,
  });
  factory Statement.fromJson(Map<String, dynamic> json) =>
      _$StatementFromJson(json);

  Map<String, dynamic> toJson() => _$StatementToJson(this);
}

enum Status {
  @_s.JsonValue('BUILDING')
  building,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('READY_BASIC_TESTING')
  readyBasicTesting,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('NOT_BUILT')
  notBuilt,
}

enum StatusType {
  @_s.JsonValue('Detected')
  detected,
  @_s.JsonValue('Missed')
  missed,
}

extension on StatusType {
  String toValue() {
    switch (this) {
      case StatusType.detected:
        return 'Detected';
      case StatusType.missed:
        return 'Missed';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A list of key/value pairs that identify a bot, bot alias, or bot channel.
/// Tag keys and values can consist of Unicode letters, digits, white space, and
/// any of the following symbols: _ . : / = + - @.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key for the tag. Keys are not case-sensitive and must be unique.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The value associated with a key. The value may be an empty string but it
  /// can't be null.
  @_s.JsonKey(name: 'value')
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

/// Provides information about a single utterance that was made to your bot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UtteranceData {
  /// The number of times that the utterance was processed.
  @_s.JsonKey(name: 'count')
  final int count;

  /// The total number of individuals that used the utterance.
  @_s.JsonKey(name: 'distinctUsers')
  final int distinctUsers;

  /// The date that the utterance was first recorded.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'firstUtteredDate')
  final DateTime firstUtteredDate;

  /// The date that the utterance was last recorded.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUtteredDate')
  final DateTime lastUtteredDate;

  /// The text that was entered by the user or the text representation of an audio
  /// clip.
  @_s.JsonKey(name: 'utteranceString')
  final String utteranceString;

  UtteranceData({
    this.count,
    this.distinctUsers,
    this.firstUtteredDate,
    this.lastUtteredDate,
    this.utteranceString,
  });
  factory UtteranceData.fromJson(Map<String, dynamic> json) =>
      _$UtteranceDataFromJson(json);
}

/// Provides a list of utterances that have been made to a specific version of
/// your bot. The list contains a maximum of 100 utterances.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UtteranceList {
  /// The version of the bot that processed the list.
  @_s.JsonKey(name: 'botVersion')
  final String botVersion;

  /// One or more <a>UtteranceData</a> objects that contain information about the
  /// utterances that have been made to a bot. The maximum number of object is
  /// 100.
  @_s.JsonKey(name: 'utterances')
  final List<UtteranceData> utterances;

  UtteranceList({
    this.botVersion,
    this.utterances,
  });
  factory UtteranceList.fromJson(Map<String, dynamic> json) =>
      _$UtteranceListFromJson(json);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String type, String message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class PreconditionFailedException extends _s.GenericAwsException {
  PreconditionFailedException({String type, String message})
      : super(
            type: type, code: 'PreconditionFailedException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'PreconditionFailedException': (type, message) =>
      PreconditionFailedException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
};
