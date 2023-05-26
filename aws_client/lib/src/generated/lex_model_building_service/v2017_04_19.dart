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

/// Amazon Lex is an AWS service for building conversational voice and text
/// interfaces. Use these actions to create, update, and delete conversational
/// bots for new and existing client applications.
class LexModelBuilding {
  final _s.RestJsonProtocol _protocol;
  LexModelBuilding({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'models.lex',
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
    required String name,
    String? checksum,
  }) async {
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
    required String name,
    String? checksum,
  }) async {
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
    required String name,
    String? checksum,
  }) async {
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
    required String name,
  }) async {
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
    required String botName,
    required String name,
  }) async {
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
    required String botAlias,
    required String botName,
    required String name,
  }) async {
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
    required String name,
    required String version,
  }) async {
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
    required String name,
  }) async {
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
    required String name,
    required String version,
  }) async {
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
    required String name,
  }) async {
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
    required String name,
    required String version,
  }) async {
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
    required String botName,
    required String userId,
  }) async {
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
    required String name,
    required String versionOrAlias,
  }) async {
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
    required String botName,
    required String name,
  }) async {
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
    required String botName,
    int? maxResults,
    String? nameContains,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    required String botAlias,
    required String botName,
    required String name,
  }) async {
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
    required String botAlias,
    required String botName,
    int? maxResults,
    String? nameContains,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    required String name,
    int? maxResults,
    String? nextToken,
  }) async {
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
    int? maxResults,
    String? nameContains,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    required String signature,
  }) async {
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
    Locale? locale,
    int? maxResults,
    String? nextToken,
    String? signatureContains,
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
    Locale? locale,
    int? maxResults,
    String? nextToken,
    String? signatureContains,
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
    required ExportType exportType,
    required String name,
    required ResourceType resourceType,
    required String version,
  }) async {
    final $query = <String, List<String>>{
      'exportType': [exportType.toValue()],
      'name': [name],
      'resourceType': [resourceType.toValue()],
      'version': [version],
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
    required String importId,
  }) async {
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
    required String name,
    required String version,
  }) async {
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
    required String name,
    int? maxResults,
    String? nextToken,
  }) async {
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
    int? maxResults,
    String? nameContains,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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

  /// Provides details about an ongoing or complete migration from an Amazon Lex
  /// V1 bot to an Amazon Lex V2 bot. Use this operation to view the migration
  /// alerts and warnings related to the migration.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [migrationId] :
  /// The unique identifier of the migration to view. The
  /// <code>migrationID</code> is returned by the operation.
  Future<GetMigrationResponse> getMigration({
    required String migrationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/migrations/${Uri.encodeComponent(migrationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMigrationResponse.fromJson(response);
  }

  /// Gets a list of migrations between Amazon Lex V1 and Amazon Lex V2.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of migrations to return in the response. The default is
  /// 10.
  ///
  /// Parameter [migrationStatusEquals] :
  /// Filters the list to contain only migrations in the specified state.
  ///
  /// Parameter [nextToken] :
  /// A pagination token that fetches the next page of migrations. If the
  /// response to this operation is truncated, Amazon Lex returns a pagination
  /// token in the response. To fetch the next page of migrations, specify the
  /// pagination token in the request.
  ///
  /// Parameter [sortByAttribute] :
  /// The field to sort the list of migrations by. You can sort by the Amazon
  /// Lex V1 bot name or the date and time that the migration was started.
  ///
  /// Parameter [sortByOrder] :
  /// The order so sort the list.
  ///
  /// Parameter [v1BotNameContains] :
  /// Filters the list to contain only bots whose name contains the specified
  /// string. The string is matched anywhere in bot name.
  Future<GetMigrationsResponse> getMigrations({
    int? maxResults,
    MigrationStatus? migrationStatusEquals,
    String? nextToken,
    MigrationSortAttribute? sortByAttribute,
    SortOrder? sortByOrder,
    String? v1BotNameContains,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (migrationStatusEquals != null)
        'migrationStatusEquals': [migrationStatusEquals.toValue()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortByAttribute != null)
        'sortByAttribute': [sortByAttribute.toValue()],
      if (sortByOrder != null) 'sortByOrder': [sortByOrder.toValue()],
      if (v1BotNameContains != null) 'v1BotNameContains': [v1BotNameContains],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/migrations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetMigrationsResponse.fromJson(response);
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
    required String name,
    required String version,
  }) async {
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
    required String name,
    int? maxResults,
    String? nextToken,
  }) async {
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
    int? maxResults,
    String? nameContains,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
  /// bot, if you are using slot obfuscation with one or more slots, or if you
  /// opted out of participating in improving Amazon Lex, utterances are not
  /// available.
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
    required String botName,
    required List<String> botVersions,
    required StatusType statusType,
  }) async {
    final $query = <String, List<String>>{
      'bot_versions': botVersions,
      'status_type': [statusType.toValue()],
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
    required String resourceArn,
  }) async {
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
    required bool childDirected,
    required Locale locale,
    required String name,
    Statement? abortStatement,
    String? checksum,
    Prompt? clarificationPrompt,
    bool? createVersion,
    String? description,
    bool? detectSentiment,
    bool? enableModelImprovements,
    int? idleSessionTTLInSeconds,
    List<Intent>? intents,
    double? nluIntentConfidenceThreshold,
    ProcessBehavior? processBehavior,
    List<Tag>? tags,
    String? voiceId,
  }) async {
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
      'locale': locale.toValue(),
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
      requestUri: '/bots/${Uri.encodeComponent(name)}/versions/%24LATEST',
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
    required String botName,
    required String botVersion,
    required String name,
    String? checksum,
    ConversationLogsRequest? conversationLogs,
    String? description,
    List<Tag>? tags,
  }) async {
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
    required String name,
    String? checksum,
    Statement? conclusionStatement,
    Prompt? confirmationPrompt,
    bool? createVersion,
    String? description,
    CodeHook? dialogCodeHook,
    FollowUpPrompt? followUpPrompt,
    FulfillmentActivity? fulfillmentActivity,
    List<InputContext>? inputContexts,
    KendraConfiguration? kendraConfiguration,
    List<OutputContext>? outputContexts,
    String? parentIntentSignature,
    Statement? rejectionStatement,
    List<String>? sampleUtterances,
    List<Slot>? slots,
  }) async {
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
      requestUri: '/intents/${Uri.encodeComponent(name)}/versions/%24LATEST',
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
    required String name,
    String? checksum,
    bool? createVersion,
    String? description,
    List<EnumerationValue>? enumerationValues,
    String? parentSlotTypeSignature,
    List<SlotTypeConfiguration>? slotTypeConfigurations,
    SlotValueSelectionStrategy? valueSelectionStrategy,
  }) async {
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
      requestUri: '/slottypes/${Uri.encodeComponent(name)}/versions/%24LATEST',
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
    required MergeStrategy mergeStrategy,
    required Uint8List payload,
    required ResourceType resourceType,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'mergeStrategy': mergeStrategy.toValue(),
      'payload': base64Encode(payload),
      'resourceType': resourceType.toValue(),
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

  /// Starts migrating a bot from Amazon Lex V1 to Amazon Lex V2. Migrate your
  /// bot when you want to take advantage of the new features of Amazon Lex V2.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/migrate.html">Migrating a
  /// bot</a> in the <i>Amazon Lex developer guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [migrationStrategy] :
  /// The strategy used to conduct the migration.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_NEW</code> - Creates a new Amazon Lex V2 bot and migrates the
  /// Amazon Lex V1 bot to the new bot.
  /// </li>
  /// <li>
  /// <code>UPDATE_EXISTING</code> - Overwrites the existing Amazon Lex V2 bot
  /// metadata and the locale being migrated. It doesn't change any other
  /// locales in the Amazon Lex V2 bot. If the locale doesn't exist, a new
  /// locale is created in the Amazon Lex V2 bot.
  /// </li>
  /// </ul>
  ///
  /// Parameter [v1BotName] :
  /// The name of the Amazon Lex V1 bot that you are migrating to Amazon Lex V2.
  ///
  /// Parameter [v1BotVersion] :
  /// The version of the bot to migrate to Amazon Lex V2. You can migrate the
  /// <code>$LATEST</code> version as well as any numbered version.
  ///
  /// Parameter [v2BotName] :
  /// The name of the Amazon Lex V2 bot that you are migrating the Amazon Lex V1
  /// bot to.
  ///
  /// <ul>
  /// <li>
  /// If the Amazon Lex V2 bot doesn't exist, you must use the
  /// <code>CREATE_NEW</code> migration strategy.
  /// </li>
  /// <li>
  /// If the Amazon Lex V2 bot exists, you must use the
  /// <code>UPDATE_EXISTING</code> migration strategy to change the contents of
  /// the Amazon Lex V2 bot.
  /// </li>
  /// </ul>
  ///
  /// Parameter [v2BotRole] :
  /// The IAM role that Amazon Lex uses to run the Amazon Lex V2 bot.
  Future<StartMigrationResponse> startMigration({
    required MigrationStrategy migrationStrategy,
    required String v1BotName,
    required String v1BotVersion,
    required String v2BotName,
    required String v2BotRole,
  }) async {
    final $payload = <String, dynamic>{
      'migrationStrategy': migrationStrategy.toValue(),
      'v1BotName': v1BotName,
      'v1BotVersion': v1BotVersion,
      'v2BotName': v2BotName,
      'v2BotRole': v2BotRole,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/migrations',
      exceptionFnMap: _exceptionFns,
    );
    return StartMigrationResponse.fromJson(response);
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
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Provides information about a bot alias.
class BotAliasMetadata {
  /// The name of the bot to which the alias points.
  final String? botName;

  /// The version of the Amazon Lex bot to which the alias points.
  final String? botVersion;

  /// Checksum of the bot alias.
  final String? checksum;

  /// Settings that determine how Amazon Lex uses conversation logs for the alias.
  final ConversationLogsResponse? conversationLogs;

  /// The date that the bot alias was created.
  final DateTime? createdDate;

  /// A description of the bot alias.
  final String? description;

  /// The date that the bot alias was updated. When you create a resource, the
  /// creation date and last updated date are the same.
  final DateTime? lastUpdatedDate;

  /// The name of the bot alias.
  final String? name;

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

  factory BotAliasMetadata.fromJson(Map<String, dynamic> json) {
    return BotAliasMetadata(
      botName: json['botName'] as String?,
      botVersion: json['botVersion'] as String?,
      checksum: json['checksum'] as String?,
      conversationLogs: json['conversationLogs'] != null
          ? ConversationLogsResponse.fromJson(
              json['conversationLogs'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botName = this.botName;
    final botVersion = this.botVersion;
    final checksum = this.checksum;
    final conversationLogs = this.conversationLogs;
    final createdDate = this.createdDate;
    final description = this.description;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    return {
      if (botName != null) 'botName': botName,
      if (botVersion != null) 'botVersion': botVersion,
      if (checksum != null) 'checksum': checksum,
      if (conversationLogs != null) 'conversationLogs': conversationLogs,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
    };
  }
}

/// Represents an association between an Amazon Lex bot and an external
/// messaging platform.
class BotChannelAssociation {
  /// An alias pointing to the specific version of the Amazon Lex bot to which
  /// this association is being made.
  final String? botAlias;

  /// Provides information necessary to communicate with the messaging platform.
  final Map<String, String>? botConfiguration;

  /// The name of the Amazon Lex bot to which this association is being made.
  /// <note>
  /// Currently, Amazon Lex supports associations with Facebook and Slack, and
  /// Twilio.
  /// </note>
  final String? botName;

  /// The date that the association between the Amazon Lex bot and the channel was
  /// created.
  final DateTime? createdDate;

  /// A text description of the association you are creating.
  final String? description;

  /// If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the
  /// reason that it failed to create the association.
  final String? failureReason;

  /// The name of the association between the bot and the channel.
  final String? name;

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
  final ChannelStatus? status;

  /// Specifies the type of association by indicating the type of channel being
  /// established between the Amazon Lex bot and the external messaging platform.
  final ChannelType? type;

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

  factory BotChannelAssociation.fromJson(Map<String, dynamic> json) {
    return BotChannelAssociation(
      botAlias: json['botAlias'] as String?,
      botConfiguration: (json['botConfiguration'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      botName: json['botName'] as String?,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      failureReason: json['failureReason'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toChannelStatus(),
      type: (json['type'] as String?)?.toChannelType(),
    );
  }

  Map<String, dynamic> toJson() {
    final botAlias = this.botAlias;
    final botConfiguration = this.botConfiguration;
    final botName = this.botName;
    final createdDate = this.createdDate;
    final description = this.description;
    final failureReason = this.failureReason;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    return {
      if (botAlias != null) 'botAlias': botAlias,
      if (botConfiguration != null) 'botConfiguration': botConfiguration,
      if (botName != null) 'botName': botName,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (failureReason != null) 'failureReason': failureReason,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Provides information about a bot. .
class BotMetadata {
  /// The date that the bot was created.
  final DateTime? createdDate;

  /// A description of the bot.
  final String? description;

  /// The date that the bot was updated. When you create a bot, the creation date
  /// and last updated date are the same.
  final DateTime? lastUpdatedDate;

  /// The name of the bot.
  final String? name;

  /// The status of the bot.
  final Status? status;

  /// The version of the bot. For a new bot, the version is always
  /// <code>$LATEST</code>.
  final String? version;

  BotMetadata({
    this.createdDate,
    this.description,
    this.lastUpdatedDate,
    this.name,
    this.status,
    this.version,
  });

  factory BotMetadata.fromJson(Map<String, dynamic> json) {
    return BotMetadata(
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toStatus(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final description = this.description;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    final status = this.status;
    final version = this.version;
    return {
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (version != null) 'version': version,
    };
  }
}

/// Provides metadata for a built-in intent.
class BuiltinIntentMetadata {
  /// A unique identifier for the built-in intent. To find the signature for an
  /// intent, see <a
  /// href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents">Standard
  /// Built-in Intents</a> in the <i>Alexa Skills Kit</i>.
  final String? signature;

  /// A list of identifiers for the locales that the intent supports.
  final List<Locale>? supportedLocales;

  BuiltinIntentMetadata({
    this.signature,
    this.supportedLocales,
  });

  factory BuiltinIntentMetadata.fromJson(Map<String, dynamic> json) {
    return BuiltinIntentMetadata(
      signature: json['signature'] as String?,
      supportedLocales: (json['supportedLocales'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toLocale())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final signature = this.signature;
    final supportedLocales = this.supportedLocales;
    return {
      if (signature != null) 'signature': signature,
      if (supportedLocales != null)
        'supportedLocales': supportedLocales.map((e) => e.toValue()).toList(),
    };
  }
}

/// Provides information about a slot used in a built-in intent.
class BuiltinIntentSlot {
  /// A list of the slots defined for the intent.
  final String? name;

  BuiltinIntentSlot({
    this.name,
  });

  factory BuiltinIntentSlot.fromJson(Map<String, dynamic> json) {
    return BuiltinIntentSlot(
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }
}

/// Provides information about a built in slot type.
class BuiltinSlotTypeMetadata {
  /// A unique identifier for the built-in slot type. To find the signature for a
  /// slot type, see <a
  /// href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference">Slot
  /// Type Reference</a> in the <i>Alexa Skills Kit</i>.
  final String? signature;

  /// A list of target locales for the slot.
  final List<Locale>? supportedLocales;

  BuiltinSlotTypeMetadata({
    this.signature,
    this.supportedLocales,
  });

  factory BuiltinSlotTypeMetadata.fromJson(Map<String, dynamic> json) {
    return BuiltinSlotTypeMetadata(
      signature: json['signature'] as String?,
      supportedLocales: (json['supportedLocales'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toLocale())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final signature = this.signature;
    final supportedLocales = this.supportedLocales;
    return {
      if (signature != null) 'signature': signature,
      if (supportedLocales != null)
        'supportedLocales': supportedLocales.map((e) => e.toValue()).toList(),
    };
  }
}

enum ChannelStatus {
  inProgress,
  created,
  failed,
}

extension ChannelStatusValueExtension on ChannelStatus {
  String toValue() {
    switch (this) {
      case ChannelStatus.inProgress:
        return 'IN_PROGRESS';
      case ChannelStatus.created:
        return 'CREATED';
      case ChannelStatus.failed:
        return 'FAILED';
    }
  }
}

extension ChannelStatusFromString on String {
  ChannelStatus toChannelStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ChannelStatus.inProgress;
      case 'CREATED':
        return ChannelStatus.created;
      case 'FAILED':
        return ChannelStatus.failed;
    }
    throw Exception('$this is not known in enum ChannelStatus');
  }
}

enum ChannelType {
  facebook,
  slack,
  twilioSms,
  kik,
}

extension ChannelTypeValueExtension on ChannelType {
  String toValue() {
    switch (this) {
      case ChannelType.facebook:
        return 'Facebook';
      case ChannelType.slack:
        return 'Slack';
      case ChannelType.twilioSms:
        return 'Twilio-Sms';
      case ChannelType.kik:
        return 'Kik';
    }
  }
}

extension ChannelTypeFromString on String {
  ChannelType toChannelType() {
    switch (this) {
      case 'Facebook':
        return ChannelType.facebook;
      case 'Slack':
        return ChannelType.slack;
      case 'Twilio-Sms':
        return ChannelType.twilioSms;
      case 'Kik':
        return ChannelType.kik;
    }
    throw Exception('$this is not known in enum ChannelType');
  }
}

/// Specifies a Lambda function that verifies requests to a bot or fulfills the
/// user's request to a bot..
class CodeHook {
  /// The version of the request-response that you want Amazon Lex to use to
  /// invoke your Lambda function. For more information, see <a>using-lambda</a>.
  final String messageVersion;

  /// The Amazon Resource Name (ARN) of the Lambda function.
  final String uri;

  CodeHook({
    required this.messageVersion,
    required this.uri,
  });

  factory CodeHook.fromJson(Map<String, dynamic> json) {
    return CodeHook(
      messageVersion: json['messageVersion'] as String,
      uri: json['uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final messageVersion = this.messageVersion;
    final uri = this.uri;
    return {
      'messageVersion': messageVersion,
      'uri': uri,
    };
  }
}

enum ContentType {
  plainText,
  ssml,
  customPayload,
}

extension ContentTypeValueExtension on ContentType {
  String toValue() {
    switch (this) {
      case ContentType.plainText:
        return 'PlainText';
      case ContentType.ssml:
        return 'SSML';
      case ContentType.customPayload:
        return 'CustomPayload';
    }
  }
}

extension ContentTypeFromString on String {
  ContentType toContentType() {
    switch (this) {
      case 'PlainText':
        return ContentType.plainText;
      case 'SSML':
        return ContentType.ssml;
      case 'CustomPayload':
        return ContentType.customPayload;
    }
    throw Exception('$this is not known in enum ContentType');
  }
}

/// Provides the settings needed for conversation logs.
class ConversationLogsRequest {
  /// The Amazon Resource Name (ARN) of an IAM role with permission to write to
  /// your CloudWatch Logs for text logs and your S3 bucket for audio logs. If
  /// audio encryption is enabled, this role also provides access permission for
  /// the AWS KMS key used for encrypting audio logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/conversation-logs-role-and-policy.html">Creating
  /// an IAM Role and Policy for Conversation Logs</a>.
  final String iamRoleArn;

  /// The settings for your conversation logs. You can log the conversation text,
  /// conversation audio, or both.
  final List<LogSettingsRequest> logSettings;

  ConversationLogsRequest({
    required this.iamRoleArn,
    required this.logSettings,
  });

  Map<String, dynamic> toJson() {
    final iamRoleArn = this.iamRoleArn;
    final logSettings = this.logSettings;
    return {
      'iamRoleArn': iamRoleArn,
      'logSettings': logSettings,
    };
  }
}

/// Contains information about conversation log settings.
class ConversationLogsResponse {
  /// The Amazon Resource Name (ARN) of the IAM role used to write your logs to
  /// CloudWatch Logs or an S3 bucket.
  final String? iamRoleArn;

  /// The settings for your conversation logs. You can log text, audio, or both.
  final List<LogSettingsResponse>? logSettings;

  ConversationLogsResponse({
    this.iamRoleArn,
    this.logSettings,
  });

  factory ConversationLogsResponse.fromJson(Map<String, dynamic> json) {
    return ConversationLogsResponse(
      iamRoleArn: json['iamRoleArn'] as String?,
      logSettings: (json['logSettings'] as List?)
          ?.whereNotNull()
          .map((e) => LogSettingsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final iamRoleArn = this.iamRoleArn;
    final logSettings = this.logSettings;
    return {
      if (iamRoleArn != null) 'iamRoleArn': iamRoleArn,
      if (logSettings != null) 'logSettings': logSettings,
    };
  }
}

class CreateBotVersionResponse {
  /// The message that Amazon Lex uses to cancel a conversation. For more
  /// information, see <a>PutBot</a>.
  final Statement? abortStatement;

  /// Checksum identifying the version of the bot that was created.
  final String? checksum;

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
  final bool? childDirected;

  /// The message that Amazon Lex uses when it doesn't understand the user's
  /// request. For more information, see <a>PutBot</a>.
  final Prompt? clarificationPrompt;

  /// The date when the bot version was created.
  final DateTime? createdDate;

  /// A description of the bot.
  final String? description;

  /// Indicates whether utterances entered by the user should be sent to Amazon
  /// Comprehend for sentiment analysis.
  final bool? detectSentiment;

  /// Indicates whether the bot uses accuracy improvements. <code>true</code>
  /// indicates that the bot is using the improvements, otherwise,
  /// <code>false</code>.
  final bool? enableModelImprovements;

  /// If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the
  /// reason that it failed to build the bot.
  final String? failureReason;

  /// The maximum time in seconds that Amazon Lex retains the data gathered in a
  /// conversation. For more information, see <a>PutBot</a>.
  final int? idleSessionTTLInSeconds;

  /// An array of <code>Intent</code> objects. For more information, see
  /// <a>PutBot</a>.
  final List<Intent>? intents;

  /// The date when the <code>$LATEST</code> version of this bot was updated.
  final DateTime? lastUpdatedDate;

  /// Specifies the target locale for the bot.
  final Locale? locale;

  /// The name of the bot.
  final String? name;

  /// When you send a request to create or update a bot, Amazon Lex sets the
  /// <code>status</code> response element to <code>BUILDING</code>. After Amazon
  /// Lex builds the bot, it sets <code>status</code> to <code>READY</code>. If
  /// Amazon Lex can't build the bot, it sets <code>status</code> to
  /// <code>FAILED</code>. Amazon Lex returns the reason for the failure in the
  /// <code>failureReason</code> response element.
  final Status? status;

  /// The version of the bot.
  final String? version;

  /// The Amazon Polly voice ID that Amazon Lex uses for voice interactions with
  /// the user.
  final String? voiceId;

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

  factory CreateBotVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateBotVersionResponse(
      abortStatement: json['abortStatement'] != null
          ? Statement.fromJson(json['abortStatement'] as Map<String, dynamic>)
          : null,
      checksum: json['checksum'] as String?,
      childDirected: json['childDirected'] as bool?,
      clarificationPrompt: json['clarificationPrompt'] != null
          ? Prompt.fromJson(json['clarificationPrompt'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      detectSentiment: json['detectSentiment'] as bool?,
      enableModelImprovements: json['enableModelImprovements'] as bool?,
      failureReason: json['failureReason'] as String?,
      idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int?,
      intents: (json['intents'] as List?)
          ?.whereNotNull()
          .map((e) => Intent.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      locale: (json['locale'] as String?)?.toLocale(),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toStatus(),
      version: json['version'] as String?,
      voiceId: json['voiceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final abortStatement = this.abortStatement;
    final checksum = this.checksum;
    final childDirected = this.childDirected;
    final clarificationPrompt = this.clarificationPrompt;
    final createdDate = this.createdDate;
    final description = this.description;
    final detectSentiment = this.detectSentiment;
    final enableModelImprovements = this.enableModelImprovements;
    final failureReason = this.failureReason;
    final idleSessionTTLInSeconds = this.idleSessionTTLInSeconds;
    final intents = this.intents;
    final lastUpdatedDate = this.lastUpdatedDate;
    final locale = this.locale;
    final name = this.name;
    final status = this.status;
    final version = this.version;
    final voiceId = this.voiceId;
    return {
      if (abortStatement != null) 'abortStatement': abortStatement,
      if (checksum != null) 'checksum': checksum,
      if (childDirected != null) 'childDirected': childDirected,
      if (clarificationPrompt != null)
        'clarificationPrompt': clarificationPrompt,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (detectSentiment != null) 'detectSentiment': detectSentiment,
      if (enableModelImprovements != null)
        'enableModelImprovements': enableModelImprovements,
      if (failureReason != null) 'failureReason': failureReason,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (intents != null) 'intents': intents,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (locale != null) 'locale': locale.toValue(),
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (version != null) 'version': version,
      if (voiceId != null) 'voiceId': voiceId,
    };
  }
}

class CreateIntentVersionResponse {
  /// Checksum of the intent version created.
  final String? checksum;

  /// After the Lambda function specified in the <code>fulfillmentActivity</code>
  /// field fulfills the intent, Amazon Lex conveys this statement to the user.
  final Statement? conclusionStatement;

  /// If defined, the prompt that Amazon Lex uses to confirm the user's intent
  /// before fulfilling it.
  final Prompt? confirmationPrompt;

  /// The date that the intent was created.
  final DateTime? createdDate;

  /// A description of the intent.
  final String? description;

  /// If defined, Amazon Lex invokes this Lambda function for each user input.
  final CodeHook? dialogCodeHook;

  /// If defined, Amazon Lex uses this prompt to solicit additional user activity
  /// after the intent is fulfilled.
  final FollowUpPrompt? followUpPrompt;

  /// Describes how the intent is fulfilled.
  final FulfillmentActivity? fulfillmentActivity;

  /// An array of <code>InputContext</code> objects that lists the contexts that
  /// must be active for Amazon Lex to choose the intent in a conversation with
  /// the user.
  final List<InputContext>? inputContexts;

  /// Configuration information, if any, for connecting an Amazon Kendra index
  /// with the <code>AMAZON.KendraSearchIntent</code> intent.
  final KendraConfiguration? kendraConfiguration;

  /// The date that the intent was updated.
  final DateTime? lastUpdatedDate;

  /// The name of the intent.
  final String? name;

  /// An array of <code>OutputContext</code> objects that lists the contexts that
  /// the intent activates when the intent is fulfilled.
  final List<OutputContext>? outputContexts;

  /// A unique identifier for a built-in intent.
  final String? parentIntentSignature;

  /// If the user answers "no" to the question defined in
  /// <code>confirmationPrompt</code>, Amazon Lex responds with this statement to
  /// acknowledge that the intent was canceled.
  final Statement? rejectionStatement;

  /// An array of sample utterances configured for the intent.
  final List<String>? sampleUtterances;

  /// An array of slot types that defines the information required to fulfill the
  /// intent.
  final List<Slot>? slots;

  /// The version number assigned to the new version of the intent.
  final String? version;

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

  factory CreateIntentVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateIntentVersionResponse(
      checksum: json['checksum'] as String?,
      conclusionStatement: json['conclusionStatement'] != null
          ? Statement.fromJson(
              json['conclusionStatement'] as Map<String, dynamic>)
          : null,
      confirmationPrompt: json['confirmationPrompt'] != null
          ? Prompt.fromJson(json['confirmationPrompt'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      dialogCodeHook: json['dialogCodeHook'] != null
          ? CodeHook.fromJson(json['dialogCodeHook'] as Map<String, dynamic>)
          : null,
      followUpPrompt: json['followUpPrompt'] != null
          ? FollowUpPrompt.fromJson(
              json['followUpPrompt'] as Map<String, dynamic>)
          : null,
      fulfillmentActivity: json['fulfillmentActivity'] != null
          ? FulfillmentActivity.fromJson(
              json['fulfillmentActivity'] as Map<String, dynamic>)
          : null,
      inputContexts: (json['inputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => InputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      kendraConfiguration: json['kendraConfiguration'] != null
          ? KendraConfiguration.fromJson(
              json['kendraConfiguration'] as Map<String, dynamic>)
          : null,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
      outputContexts: (json['outputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => OutputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentIntentSignature: json['parentIntentSignature'] as String?,
      rejectionStatement: json['rejectionStatement'] != null
          ? Statement.fromJson(
              json['rejectionStatement'] as Map<String, dynamic>)
          : null,
      sampleUtterances: (json['sampleUtterances'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      slots: (json['slots'] as List?)
          ?.whereNotNull()
          .map((e) => Slot.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final conclusionStatement = this.conclusionStatement;
    final confirmationPrompt = this.confirmationPrompt;
    final createdDate = this.createdDate;
    final description = this.description;
    final dialogCodeHook = this.dialogCodeHook;
    final followUpPrompt = this.followUpPrompt;
    final fulfillmentActivity = this.fulfillmentActivity;
    final inputContexts = this.inputContexts;
    final kendraConfiguration = this.kendraConfiguration;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    final outputContexts = this.outputContexts;
    final parentIntentSignature = this.parentIntentSignature;
    final rejectionStatement = this.rejectionStatement;
    final sampleUtterances = this.sampleUtterances;
    final slots = this.slots;
    final version = this.version;
    return {
      if (checksum != null) 'checksum': checksum,
      if (conclusionStatement != null)
        'conclusionStatement': conclusionStatement,
      if (confirmationPrompt != null) 'confirmationPrompt': confirmationPrompt,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (dialogCodeHook != null) 'dialogCodeHook': dialogCodeHook,
      if (followUpPrompt != null) 'followUpPrompt': followUpPrompt,
      if (fulfillmentActivity != null)
        'fulfillmentActivity': fulfillmentActivity,
      if (inputContexts != null) 'inputContexts': inputContexts,
      if (kendraConfiguration != null)
        'kendraConfiguration': kendraConfiguration,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
      if (outputContexts != null) 'outputContexts': outputContexts,
      if (parentIntentSignature != null)
        'parentIntentSignature': parentIntentSignature,
      if (rejectionStatement != null) 'rejectionStatement': rejectionStatement,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
      if (slots != null) 'slots': slots,
      if (version != null) 'version': version,
    };
  }
}

class CreateSlotTypeVersionResponse {
  /// Checksum of the <code>$LATEST</code> version of the slot type.
  final String? checksum;

  /// The date that the slot type was created.
  final DateTime? createdDate;

  /// A description of the slot type.
  final String? description;

  /// A list of <code>EnumerationValue</code> objects that defines the values that
  /// the slot type can take.
  final List<EnumerationValue>? enumerationValues;

  /// The date that the slot type was updated. When you create a resource, the
  /// creation date and last update date are the same.
  final DateTime? lastUpdatedDate;

  /// The name of the slot type.
  final String? name;

  /// The built-in slot type used a the parent of the slot type.
  final String? parentSlotTypeSignature;

  /// Configuration information that extends the parent built-in slot type.
  final List<SlotTypeConfiguration>? slotTypeConfigurations;

  /// The strategy that Amazon Lex uses to determine the value of the slot. For
  /// more information, see <a>PutSlotType</a>.
  final SlotValueSelectionStrategy? valueSelectionStrategy;

  /// The version assigned to the new slot type version.
  final String? version;

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

  factory CreateSlotTypeVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateSlotTypeVersionResponse(
      checksum: json['checksum'] as String?,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      enumerationValues: (json['enumerationValues'] as List?)
          ?.whereNotNull()
          .map((e) => EnumerationValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
      parentSlotTypeSignature: json['parentSlotTypeSignature'] as String?,
      slotTypeConfigurations: (json['slotTypeConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => SlotTypeConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      valueSelectionStrategy: (json['valueSelectionStrategy'] as String?)
          ?.toSlotValueSelectionStrategy(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final createdDate = this.createdDate;
    final description = this.description;
    final enumerationValues = this.enumerationValues;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    final parentSlotTypeSignature = this.parentSlotTypeSignature;
    final slotTypeConfigurations = this.slotTypeConfigurations;
    final valueSelectionStrategy = this.valueSelectionStrategy;
    final version = this.version;
    return {
      if (checksum != null) 'checksum': checksum,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (enumerationValues != null) 'enumerationValues': enumerationValues,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
      if (parentSlotTypeSignature != null)
        'parentSlotTypeSignature': parentSlotTypeSignature,
      if (slotTypeConfigurations != null)
        'slotTypeConfigurations': slotTypeConfigurations,
      if (valueSelectionStrategy != null)
        'valueSelectionStrategy': valueSelectionStrategy.toValue(),
      if (version != null) 'version': version,
    };
  }
}

enum Destination {
  cloudwatchLogs,
  s3,
}

extension DestinationValueExtension on Destination {
  String toValue() {
    switch (this) {
      case Destination.cloudwatchLogs:
        return 'CLOUDWATCH_LOGS';
      case Destination.s3:
        return 'S3';
    }
  }
}

extension DestinationFromString on String {
  Destination toDestination() {
    switch (this) {
      case 'CLOUDWATCH_LOGS':
        return Destination.cloudwatchLogs;
      case 'S3':
        return Destination.s3;
    }
    throw Exception('$this is not known in enum Destination');
  }
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
class EnumerationValue {
  /// The value of the slot type.
  final String value;

  /// Additional values related to the slot type value.
  final List<String>? synonyms;

  EnumerationValue({
    required this.value,
    this.synonyms,
  });

  factory EnumerationValue.fromJson(Map<String, dynamic> json) {
    return EnumerationValue(
      value: json['value'] as String,
      synonyms: (json['synonyms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final synonyms = this.synonyms;
    return {
      'value': value,
      if (synonyms != null) 'synonyms': synonyms,
    };
  }
}

enum ExportStatus {
  inProgress,
  ready,
  failed,
}

extension ExportStatusValueExtension on ExportStatus {
  String toValue() {
    switch (this) {
      case ExportStatus.inProgress:
        return 'IN_PROGRESS';
      case ExportStatus.ready:
        return 'READY';
      case ExportStatus.failed:
        return 'FAILED';
    }
  }
}

extension ExportStatusFromString on String {
  ExportStatus toExportStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ExportStatus.inProgress;
      case 'READY':
        return ExportStatus.ready;
      case 'FAILED':
        return ExportStatus.failed;
    }
    throw Exception('$this is not known in enum ExportStatus');
  }
}

enum ExportType {
  alexaSkillsKit,
  lex,
}

extension ExportTypeValueExtension on ExportType {
  String toValue() {
    switch (this) {
      case ExportType.alexaSkillsKit:
        return 'ALEXA_SKILLS_KIT';
      case ExportType.lex:
        return 'LEX';
    }
  }
}

extension ExportTypeFromString on String {
  ExportType toExportType() {
    switch (this) {
      case 'ALEXA_SKILLS_KIT':
        return ExportType.alexaSkillsKit;
      case 'LEX':
        return ExportType.lex;
    }
    throw Exception('$this is not known in enum ExportType');
  }
}

/// A prompt for additional activity after an intent is fulfilled. For example,
/// after the <code>OrderPizza</code> intent is fulfilled, you might prompt the
/// user to find out whether the user wants to order drinks.
class FollowUpPrompt {
  /// Prompts for information from the user.
  final Prompt prompt;

  /// If the user answers "no" to the question defined in the <code>prompt</code>
  /// field, Amazon Lex responds with this statement to acknowledge that the
  /// intent was canceled.
  final Statement rejectionStatement;

  FollowUpPrompt({
    required this.prompt,
    required this.rejectionStatement,
  });

  factory FollowUpPrompt.fromJson(Map<String, dynamic> json) {
    return FollowUpPrompt(
      prompt: Prompt.fromJson(json['prompt'] as Map<String, dynamic>),
      rejectionStatement: Statement.fromJson(
          json['rejectionStatement'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final prompt = this.prompt;
    final rejectionStatement = this.rejectionStatement;
    return {
      'prompt': prompt,
      'rejectionStatement': rejectionStatement,
    };
  }
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
class FulfillmentActivity {
  /// How the intent should be fulfilled, either by running a Lambda function or
  /// by returning the slot data to the client application.
  final FulfillmentActivityType type;

  /// A description of the Lambda function that is run to fulfill the intent.
  final CodeHook? codeHook;

  FulfillmentActivity({
    required this.type,
    this.codeHook,
  });

  factory FulfillmentActivity.fromJson(Map<String, dynamic> json) {
    return FulfillmentActivity(
      type: (json['type'] as String).toFulfillmentActivityType(),
      codeHook: json['codeHook'] != null
          ? CodeHook.fromJson(json['codeHook'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final codeHook = this.codeHook;
    return {
      'type': type.toValue(),
      if (codeHook != null) 'codeHook': codeHook,
    };
  }
}

enum FulfillmentActivityType {
  returnIntent,
  codeHook,
}

extension FulfillmentActivityTypeValueExtension on FulfillmentActivityType {
  String toValue() {
    switch (this) {
      case FulfillmentActivityType.returnIntent:
        return 'ReturnIntent';
      case FulfillmentActivityType.codeHook:
        return 'CodeHook';
    }
  }
}

extension FulfillmentActivityTypeFromString on String {
  FulfillmentActivityType toFulfillmentActivityType() {
    switch (this) {
      case 'ReturnIntent':
        return FulfillmentActivityType.returnIntent;
      case 'CodeHook':
        return FulfillmentActivityType.codeHook;
    }
    throw Exception('$this is not known in enum FulfillmentActivityType');
  }
}

class GetBotAliasResponse {
  /// The name of the bot that the alias points to.
  final String? botName;

  /// The version of the bot that the alias points to.
  final String? botVersion;

  /// Checksum of the bot alias.
  final String? checksum;

  /// The settings that determine how Amazon Lex uses conversation logs for the
  /// alias.
  final ConversationLogsResponse? conversationLogs;

  /// The date that the bot alias was created.
  final DateTime? createdDate;

  /// A description of the bot alias.
  final String? description;

  /// The date that the bot alias was updated. When you create a resource, the
  /// creation date and the last updated date are the same.
  final DateTime? lastUpdatedDate;

  /// The name of the bot alias.
  final String? name;

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

  factory GetBotAliasResponse.fromJson(Map<String, dynamic> json) {
    return GetBotAliasResponse(
      botName: json['botName'] as String?,
      botVersion: json['botVersion'] as String?,
      checksum: json['checksum'] as String?,
      conversationLogs: json['conversationLogs'] != null
          ? ConversationLogsResponse.fromJson(
              json['conversationLogs'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botName = this.botName;
    final botVersion = this.botVersion;
    final checksum = this.checksum;
    final conversationLogs = this.conversationLogs;
    final createdDate = this.createdDate;
    final description = this.description;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    return {
      if (botName != null) 'botName': botName,
      if (botVersion != null) 'botVersion': botVersion,
      if (checksum != null) 'checksum': checksum,
      if (conversationLogs != null) 'conversationLogs': conversationLogs,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
    };
  }
}

class GetBotAliasesResponse {
  /// An array of <code>BotAliasMetadata</code> objects, each describing a bot
  /// alias.
  final List<BotAliasMetadata>? botAliases;

  /// A pagination token for fetching next page of aliases. If the response to
  /// this call is truncated, Amazon Lex returns a pagination token in the
  /// response. To fetch the next page of aliases, specify the pagination token in
  /// the next request.
  final String? nextToken;

  GetBotAliasesResponse({
    this.botAliases,
    this.nextToken,
  });

  factory GetBotAliasesResponse.fromJson(Map<String, dynamic> json) {
    return GetBotAliasesResponse(
      botAliases: (json['BotAliases'] as List?)
          ?.whereNotNull()
          .map((e) => BotAliasMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliases = this.botAliases;
    final nextToken = this.nextToken;
    return {
      if (botAliases != null) 'BotAliases': botAliases,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetBotChannelAssociationResponse {
  /// An alias pointing to the specific version of the Amazon Lex bot to which
  /// this association is being made.
  final String? botAlias;

  /// Provides information that the messaging platform needs to communicate with
  /// the Amazon Lex bot.
  final Map<String, String>? botConfiguration;

  /// The name of the Amazon Lex bot.
  final String? botName;

  /// The date that the association between the bot and the channel was created.
  final DateTime? createdDate;

  /// A description of the association between the bot and the channel.
  final String? description;

  /// If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the
  /// reason that it failed to create the association.
  final String? failureReason;

  /// The name of the association between the bot and the channel.
  final String? name;

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
  final ChannelStatus? status;

  /// The type of the messaging platform.
  final ChannelType? type;

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

  factory GetBotChannelAssociationResponse.fromJson(Map<String, dynamic> json) {
    return GetBotChannelAssociationResponse(
      botAlias: json['botAlias'] as String?,
      botConfiguration: (json['botConfiguration'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      botName: json['botName'] as String?,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      failureReason: json['failureReason'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toChannelStatus(),
      type: (json['type'] as String?)?.toChannelType(),
    );
  }

  Map<String, dynamic> toJson() {
    final botAlias = this.botAlias;
    final botConfiguration = this.botConfiguration;
    final botName = this.botName;
    final createdDate = this.createdDate;
    final description = this.description;
    final failureReason = this.failureReason;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    return {
      if (botAlias != null) 'botAlias': botAlias,
      if (botConfiguration != null) 'botConfiguration': botConfiguration,
      if (botName != null) 'botName': botName,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (failureReason != null) 'failureReason': failureReason,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

class GetBotChannelAssociationsResponse {
  /// An array of objects, one for each association, that provides information
  /// about the Amazon Lex bot and its association with the channel.
  final List<BotChannelAssociation>? botChannelAssociations;

  /// A pagination token that fetches the next page of associations. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token in
  /// the response. To fetch the next page of associations, specify the pagination
  /// token in the next request.
  final String? nextToken;

  GetBotChannelAssociationsResponse({
    this.botChannelAssociations,
    this.nextToken,
  });

  factory GetBotChannelAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetBotChannelAssociationsResponse(
      botChannelAssociations: (json['botChannelAssociations'] as List?)
          ?.whereNotNull()
          .map((e) => BotChannelAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botChannelAssociations = this.botChannelAssociations;
    final nextToken = this.nextToken;
    return {
      if (botChannelAssociations != null)
        'botChannelAssociations': botChannelAssociations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetBotResponse {
  /// The message that Amazon Lex returns when the user elects to end the
  /// conversation without completing it. For more information, see <a>PutBot</a>.
  final Statement? abortStatement;

  /// Checksum of the bot used to identify a specific revision of the bot's
  /// <code>$LATEST</code> version.
  final String? checksum;

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
  final bool? childDirected;

  /// The message Amazon Lex uses when it doesn't understand the user's request.
  /// For more information, see <a>PutBot</a>.
  final Prompt? clarificationPrompt;

  /// The date that the bot was created.
  final DateTime? createdDate;

  /// A description of the bot.
  final String? description;

  /// Indicates whether user utterances should be sent to Amazon Comprehend for
  /// sentiment analysis.
  final bool? detectSentiment;

  /// Indicates whether the bot uses accuracy improvements. <code>true</code>
  /// indicates that the bot is using the improvements, otherwise,
  /// <code>false</code>.
  final bool? enableModelImprovements;

  /// If <code>status</code> is <code>FAILED</code>, Amazon Lex explains why it
  /// failed to build the bot.
  final String? failureReason;

  /// The maximum time in seconds that Amazon Lex retains the data gathered in a
  /// conversation. For more information, see <a>PutBot</a>.
  final int? idleSessionTTLInSeconds;

  /// An array of <code>intent</code> objects. For more information, see
  /// <a>PutBot</a>.
  final List<Intent>? intents;

  /// The date that the bot was updated. When you create a resource, the creation
  /// date and last updated date are the same.
  final DateTime? lastUpdatedDate;

  /// The target locale for the bot.
  final Locale? locale;

  /// The name of the bot.
  final String? name;

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
  final double? nluIntentConfidenceThreshold;

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
  final Status? status;

  /// The version of the bot. For a new bot, the version is always
  /// <code>$LATEST</code>.
  final String? version;

  /// The Amazon Polly voice ID that Amazon Lex uses for voice interaction with
  /// the user. For more information, see <a>PutBot</a>.
  final String? voiceId;

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

  factory GetBotResponse.fromJson(Map<String, dynamic> json) {
    return GetBotResponse(
      abortStatement: json['abortStatement'] != null
          ? Statement.fromJson(json['abortStatement'] as Map<String, dynamic>)
          : null,
      checksum: json['checksum'] as String?,
      childDirected: json['childDirected'] as bool?,
      clarificationPrompt: json['clarificationPrompt'] != null
          ? Prompt.fromJson(json['clarificationPrompt'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      detectSentiment: json['detectSentiment'] as bool?,
      enableModelImprovements: json['enableModelImprovements'] as bool?,
      failureReason: json['failureReason'] as String?,
      idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int?,
      intents: (json['intents'] as List?)
          ?.whereNotNull()
          .map((e) => Intent.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      locale: (json['locale'] as String?)?.toLocale(),
      name: json['name'] as String?,
      nluIntentConfidenceThreshold:
          json['nluIntentConfidenceThreshold'] as double?,
      status: (json['status'] as String?)?.toStatus(),
      version: json['version'] as String?,
      voiceId: json['voiceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final abortStatement = this.abortStatement;
    final checksum = this.checksum;
    final childDirected = this.childDirected;
    final clarificationPrompt = this.clarificationPrompt;
    final createdDate = this.createdDate;
    final description = this.description;
    final detectSentiment = this.detectSentiment;
    final enableModelImprovements = this.enableModelImprovements;
    final failureReason = this.failureReason;
    final idleSessionTTLInSeconds = this.idleSessionTTLInSeconds;
    final intents = this.intents;
    final lastUpdatedDate = this.lastUpdatedDate;
    final locale = this.locale;
    final name = this.name;
    final nluIntentConfidenceThreshold = this.nluIntentConfidenceThreshold;
    final status = this.status;
    final version = this.version;
    final voiceId = this.voiceId;
    return {
      if (abortStatement != null) 'abortStatement': abortStatement,
      if (checksum != null) 'checksum': checksum,
      if (childDirected != null) 'childDirected': childDirected,
      if (clarificationPrompt != null)
        'clarificationPrompt': clarificationPrompt,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (detectSentiment != null) 'detectSentiment': detectSentiment,
      if (enableModelImprovements != null)
        'enableModelImprovements': enableModelImprovements,
      if (failureReason != null) 'failureReason': failureReason,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (intents != null) 'intents': intents,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (locale != null) 'locale': locale.toValue(),
      if (name != null) 'name': name,
      if (nluIntentConfidenceThreshold != null)
        'nluIntentConfidenceThreshold': nluIntentConfidenceThreshold,
      if (status != null) 'status': status.toValue(),
      if (version != null) 'version': version,
      if (voiceId != null) 'voiceId': voiceId,
    };
  }
}

class GetBotVersionsResponse {
  /// An array of <code>BotMetadata</code> objects, one for each numbered version
  /// of the bot plus one for the <code>$LATEST</code> version.
  final List<BotMetadata>? bots;

  /// A pagination token for fetching the next page of bot versions. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token in
  /// the response. To fetch the next page of versions, specify the pagination
  /// token in the next request.
  final String? nextToken;

  GetBotVersionsResponse({
    this.bots,
    this.nextToken,
  });

  factory GetBotVersionsResponse.fromJson(Map<String, dynamic> json) {
    return GetBotVersionsResponse(
      bots: (json['bots'] as List?)
          ?.whereNotNull()
          .map((e) => BotMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bots = this.bots;
    final nextToken = this.nextToken;
    return {
      if (bots != null) 'bots': bots,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetBotsResponse {
  /// An array of <code>botMetadata</code> objects, with one entry for each bot.
  final List<BotMetadata>? bots;

  /// If the response is truncated, it includes a pagination token that you can
  /// specify in your next request to fetch the next page of bots.
  final String? nextToken;

  GetBotsResponse({
    this.bots,
    this.nextToken,
  });

  factory GetBotsResponse.fromJson(Map<String, dynamic> json) {
    return GetBotsResponse(
      bots: (json['bots'] as List?)
          ?.whereNotNull()
          .map((e) => BotMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bots = this.bots;
    final nextToken = this.nextToken;
    return {
      if (bots != null) 'bots': bots,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetBuiltinIntentResponse {
  /// The unique identifier for a built-in intent.
  final String? signature;

  /// An array of <code>BuiltinIntentSlot</code> objects, one entry for each slot
  /// type in the intent.
  final List<BuiltinIntentSlot>? slots;

  /// A list of locales that the intent supports.
  final List<Locale>? supportedLocales;

  GetBuiltinIntentResponse({
    this.signature,
    this.slots,
    this.supportedLocales,
  });

  factory GetBuiltinIntentResponse.fromJson(Map<String, dynamic> json) {
    return GetBuiltinIntentResponse(
      signature: json['signature'] as String?,
      slots: (json['slots'] as List?)
          ?.whereNotNull()
          .map((e) => BuiltinIntentSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportedLocales: (json['supportedLocales'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toLocale())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final signature = this.signature;
    final slots = this.slots;
    final supportedLocales = this.supportedLocales;
    return {
      if (signature != null) 'signature': signature,
      if (slots != null) 'slots': slots,
      if (supportedLocales != null)
        'supportedLocales': supportedLocales.map((e) => e.toValue()).toList(),
    };
  }
}

class GetBuiltinIntentsResponse {
  /// An array of <code>builtinIntentMetadata</code> objects, one for each intent
  /// in the response.
  final List<BuiltinIntentMetadata>? intents;

  /// A pagination token that fetches the next page of intents. If the response to
  /// this API call is truncated, Amazon Lex returns a pagination token in the
  /// response. To fetch the next page of intents, specify the pagination token in
  /// the next request.
  final String? nextToken;

  GetBuiltinIntentsResponse({
    this.intents,
    this.nextToken,
  });

  factory GetBuiltinIntentsResponse.fromJson(Map<String, dynamic> json) {
    return GetBuiltinIntentsResponse(
      intents: (json['intents'] as List?)
          ?.whereNotNull()
          .map((e) => BuiltinIntentMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final intents = this.intents;
    final nextToken = this.nextToken;
    return {
      if (intents != null) 'intents': intents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetBuiltinSlotTypesResponse {
  /// If the response is truncated, the response includes a pagination token that
  /// you can use in your next request to fetch the next page of slot types.
  final String? nextToken;

  /// An array of <code>BuiltInSlotTypeMetadata</code> objects, one entry for each
  /// slot type returned.
  final List<BuiltinSlotTypeMetadata>? slotTypes;

  GetBuiltinSlotTypesResponse({
    this.nextToken,
    this.slotTypes,
  });

  factory GetBuiltinSlotTypesResponse.fromJson(Map<String, dynamic> json) {
    return GetBuiltinSlotTypesResponse(
      nextToken: json['nextToken'] as String?,
      slotTypes: (json['slotTypes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BuiltinSlotTypeMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final slotTypes = this.slotTypes;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (slotTypes != null) 'slotTypes': slotTypes,
    };
  }
}

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
  final ExportStatus? exportStatus;

  /// The format of the exported data.
  final ExportType? exportType;

  /// If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the
  /// reason that it failed to export the resource.
  final String? failureReason;

  /// The name of the bot being exported.
  final String? name;

  /// The type of the exported resource.
  final ResourceType? resourceType;

  /// An S3 pre-signed URL that provides the location of the exported resource.
  /// The exported resource is a ZIP archive that contains the exported resource
  /// in JSON format. The structure of the archive may change. Your code should
  /// not rely on the archive structure.
  final String? url;

  /// The version of the bot being exported.
  final String? version;

  GetExportResponse({
    this.exportStatus,
    this.exportType,
    this.failureReason,
    this.name,
    this.resourceType,
    this.url,
    this.version,
  });

  factory GetExportResponse.fromJson(Map<String, dynamic> json) {
    return GetExportResponse(
      exportStatus: (json['exportStatus'] as String?)?.toExportStatus(),
      exportType: (json['exportType'] as String?)?.toExportType(),
      failureReason: json['failureReason'] as String?,
      name: json['name'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      url: json['url'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportStatus = this.exportStatus;
    final exportType = this.exportType;
    final failureReason = this.failureReason;
    final name = this.name;
    final resourceType = this.resourceType;
    final url = this.url;
    final version = this.version;
    return {
      if (exportStatus != null) 'exportStatus': exportStatus.toValue(),
      if (exportType != null) 'exportType': exportType.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (url != null) 'url': url,
      if (version != null) 'version': version,
    };
  }
}

class GetImportResponse {
  /// A timestamp for the date and time that the import job was created.
  final DateTime? createdDate;

  /// A string that describes why an import job failed to complete.
  final List<String>? failureReason;

  /// The identifier for the specific import job.
  final String? importId;

  /// The status of the import job. If the status is <code>FAILED</code>, you can
  /// get the reason for the failure from the <code>failureReason</code> field.
  final ImportStatus? importStatus;

  /// The action taken when there was a conflict between an existing resource and
  /// a resource in the import file.
  final MergeStrategy? mergeStrategy;

  /// The name given to the import job.
  final String? name;

  /// The type of resource imported.
  final ResourceType? resourceType;

  GetImportResponse({
    this.createdDate,
    this.failureReason,
    this.importId,
    this.importStatus,
    this.mergeStrategy,
    this.name,
    this.resourceType,
  });

  factory GetImportResponse.fromJson(Map<String, dynamic> json) {
    return GetImportResponse(
      createdDate: timeStampFromJson(json['createdDate']),
      failureReason: (json['failureReason'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      importId: json['importId'] as String?,
      importStatus: (json['importStatus'] as String?)?.toImportStatus(),
      mergeStrategy: (json['mergeStrategy'] as String?)?.toMergeStrategy(),
      name: json['name'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final failureReason = this.failureReason;
    final importId = this.importId;
    final importStatus = this.importStatus;
    final mergeStrategy = this.mergeStrategy;
    final name = this.name;
    final resourceType = this.resourceType;
    return {
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (failureReason != null) 'failureReason': failureReason,
      if (importId != null) 'importId': importId,
      if (importStatus != null) 'importStatus': importStatus.toValue(),
      if (mergeStrategy != null) 'mergeStrategy': mergeStrategy.toValue(),
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
    };
  }
}

class GetIntentResponse {
  /// Checksum of the intent.
  final String? checksum;

  /// After the Lambda function specified in the <code>fulfillmentActivity</code>
  /// element fulfills the intent, Amazon Lex conveys this statement to the user.
  final Statement? conclusionStatement;

  /// If defined in the bot, Amazon Lex uses prompt to confirm the intent before
  /// fulfilling the user's request. For more information, see <a>PutIntent</a>.
  final Prompt? confirmationPrompt;

  /// The date that the intent was created.
  final DateTime? createdDate;

  /// A description of the intent.
  final String? description;

  /// If defined in the bot, Amazon Amazon Lex invokes this Lambda function for
  /// each user input. For more information, see <a>PutIntent</a>.
  final CodeHook? dialogCodeHook;

  /// If defined in the bot, Amazon Lex uses this prompt to solicit additional
  /// user activity after the intent is fulfilled. For more information, see
  /// <a>PutIntent</a>.
  final FollowUpPrompt? followUpPrompt;

  /// Describes how the intent is fulfilled. For more information, see
  /// <a>PutIntent</a>.
  final FulfillmentActivity? fulfillmentActivity;

  /// An array of <code>InputContext</code> objects that lists the contexts that
  /// must be active for Amazon Lex to choose the intent in a conversation with
  /// the user.
  final List<InputContext>? inputContexts;

  /// Configuration information, if any, to connect to an Amazon Kendra index with
  /// the <code>AMAZON.KendraSearchIntent</code> intent.
  final KendraConfiguration? kendraConfiguration;

  /// The date that the intent was updated. When you create a resource, the
  /// creation date and the last updated date are the same.
  final DateTime? lastUpdatedDate;

  /// The name of the intent.
  final String? name;

  /// An array of <code>OutputContext</code> objects that lists the contexts that
  /// the intent activates when the intent is fulfilled.
  final List<OutputContext>? outputContexts;

  /// A unique identifier for a built-in intent.
  final String? parentIntentSignature;

  /// If the user answers "no" to the question defined in
  /// <code>confirmationPrompt</code>, Amazon Lex responds with this statement to
  /// acknowledge that the intent was canceled.
  final Statement? rejectionStatement;

  /// An array of sample utterances configured for the intent.
  final List<String>? sampleUtterances;

  /// An array of intent slots configured for the intent.
  final List<Slot>? slots;

  /// The version of the intent.
  final String? version;

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

  factory GetIntentResponse.fromJson(Map<String, dynamic> json) {
    return GetIntentResponse(
      checksum: json['checksum'] as String?,
      conclusionStatement: json['conclusionStatement'] != null
          ? Statement.fromJson(
              json['conclusionStatement'] as Map<String, dynamic>)
          : null,
      confirmationPrompt: json['confirmationPrompt'] != null
          ? Prompt.fromJson(json['confirmationPrompt'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      dialogCodeHook: json['dialogCodeHook'] != null
          ? CodeHook.fromJson(json['dialogCodeHook'] as Map<String, dynamic>)
          : null,
      followUpPrompt: json['followUpPrompt'] != null
          ? FollowUpPrompt.fromJson(
              json['followUpPrompt'] as Map<String, dynamic>)
          : null,
      fulfillmentActivity: json['fulfillmentActivity'] != null
          ? FulfillmentActivity.fromJson(
              json['fulfillmentActivity'] as Map<String, dynamic>)
          : null,
      inputContexts: (json['inputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => InputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      kendraConfiguration: json['kendraConfiguration'] != null
          ? KendraConfiguration.fromJson(
              json['kendraConfiguration'] as Map<String, dynamic>)
          : null,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
      outputContexts: (json['outputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => OutputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentIntentSignature: json['parentIntentSignature'] as String?,
      rejectionStatement: json['rejectionStatement'] != null
          ? Statement.fromJson(
              json['rejectionStatement'] as Map<String, dynamic>)
          : null,
      sampleUtterances: (json['sampleUtterances'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      slots: (json['slots'] as List?)
          ?.whereNotNull()
          .map((e) => Slot.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final conclusionStatement = this.conclusionStatement;
    final confirmationPrompt = this.confirmationPrompt;
    final createdDate = this.createdDate;
    final description = this.description;
    final dialogCodeHook = this.dialogCodeHook;
    final followUpPrompt = this.followUpPrompt;
    final fulfillmentActivity = this.fulfillmentActivity;
    final inputContexts = this.inputContexts;
    final kendraConfiguration = this.kendraConfiguration;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    final outputContexts = this.outputContexts;
    final parentIntentSignature = this.parentIntentSignature;
    final rejectionStatement = this.rejectionStatement;
    final sampleUtterances = this.sampleUtterances;
    final slots = this.slots;
    final version = this.version;
    return {
      if (checksum != null) 'checksum': checksum,
      if (conclusionStatement != null)
        'conclusionStatement': conclusionStatement,
      if (confirmationPrompt != null) 'confirmationPrompt': confirmationPrompt,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (dialogCodeHook != null) 'dialogCodeHook': dialogCodeHook,
      if (followUpPrompt != null) 'followUpPrompt': followUpPrompt,
      if (fulfillmentActivity != null)
        'fulfillmentActivity': fulfillmentActivity,
      if (inputContexts != null) 'inputContexts': inputContexts,
      if (kendraConfiguration != null)
        'kendraConfiguration': kendraConfiguration,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
      if (outputContexts != null) 'outputContexts': outputContexts,
      if (parentIntentSignature != null)
        'parentIntentSignature': parentIntentSignature,
      if (rejectionStatement != null) 'rejectionStatement': rejectionStatement,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
      if (slots != null) 'slots': slots,
      if (version != null) 'version': version,
    };
  }
}

class GetIntentVersionsResponse {
  /// An array of <code>IntentMetadata</code> objects, one for each numbered
  /// version of the intent plus one for the <code>$LATEST</code> version.
  final List<IntentMetadata>? intents;

  /// A pagination token for fetching the next page of intent versions. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token in
  /// the response. To fetch the next page of versions, specify the pagination
  /// token in the next request.
  final String? nextToken;

  GetIntentVersionsResponse({
    this.intents,
    this.nextToken,
  });

  factory GetIntentVersionsResponse.fromJson(Map<String, dynamic> json) {
    return GetIntentVersionsResponse(
      intents: (json['intents'] as List?)
          ?.whereNotNull()
          .map((e) => IntentMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final intents = this.intents;
    final nextToken = this.nextToken;
    return {
      if (intents != null) 'intents': intents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetIntentsResponse {
  /// An array of <code>Intent</code> objects. For more information, see
  /// <a>PutBot</a>.
  final List<IntentMetadata>? intents;

  /// If the response is truncated, the response includes a pagination token that
  /// you can specify in your next request to fetch the next page of intents.
  final String? nextToken;

  GetIntentsResponse({
    this.intents,
    this.nextToken,
  });

  factory GetIntentsResponse.fromJson(Map<String, dynamic> json) {
    return GetIntentsResponse(
      intents: (json['intents'] as List?)
          ?.whereNotNull()
          .map((e) => IntentMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final intents = this.intents;
    final nextToken = this.nextToken;
    return {
      if (intents != null) 'intents': intents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetMigrationResponse {
  /// A list of alerts and warnings that indicate issues with the migration for
  /// the Amazon Lex V1 bot to Amazon Lex V2. You receive a warning when an Amazon
  /// Lex V1 feature has a different implementation if Amazon Lex V2.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/migrate.html">Migrating a
  /// bot</a> in the <i>Amazon Lex V2 developer guide</i>.
  final List<MigrationAlert>? alerts;

  /// The unique identifier of the migration. This is the same as the identifier
  /// used when calling the <code>GetMigration</code> operation.
  final String? migrationId;

  /// Indicates the status of the migration. When the status is
  /// <code>COMPLETE</code> the migration is finished and the bot is available in
  /// Amazon Lex V2. There may be alerts and warnings that need to be resolved to
  /// complete the migration.
  final MigrationStatus? migrationStatus;

  /// The strategy used to conduct the migration.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_NEW</code> - Creates a new Amazon Lex V2 bot and migrates the
  /// Amazon Lex V1 bot to the new bot.
  /// </li>
  /// <li>
  /// <code>UPDATE_EXISTING</code> - Overwrites the existing Amazon Lex V2 bot
  /// metadata and the locale being migrated. It doesn't change any other locales
  /// in the Amazon Lex V2 bot. If the locale doesn't exist, a new locale is
  /// created in the Amazon Lex V2 bot.
  /// </li>
  /// </ul>
  final MigrationStrategy? migrationStrategy;

  /// The date and time that the migration started.
  final DateTime? migrationTimestamp;

  /// The locale of the Amazon Lex V1 bot migrated to Amazon Lex V2.
  final Locale? v1BotLocale;

  /// The name of the Amazon Lex V1 bot migrated to Amazon Lex V2.
  final String? v1BotName;

  /// The version of the Amazon Lex V1 bot migrated to Amazon Lex V2.
  final String? v1BotVersion;

  /// The unique identifier of the Amazon Lex V2 bot that the Amazon Lex V1 is
  /// being migrated to.
  final String? v2BotId;

  /// The IAM role that Amazon Lex uses to run the Amazon Lex V2 bot.
  final String? v2BotRole;

  GetMigrationResponse({
    this.alerts,
    this.migrationId,
    this.migrationStatus,
    this.migrationStrategy,
    this.migrationTimestamp,
    this.v1BotLocale,
    this.v1BotName,
    this.v1BotVersion,
    this.v2BotId,
    this.v2BotRole,
  });

  factory GetMigrationResponse.fromJson(Map<String, dynamic> json) {
    return GetMigrationResponse(
      alerts: (json['alerts'] as List?)
          ?.whereNotNull()
          .map((e) => MigrationAlert.fromJson(e as Map<String, dynamic>))
          .toList(),
      migrationId: json['migrationId'] as String?,
      migrationStatus:
          (json['migrationStatus'] as String?)?.toMigrationStatus(),
      migrationStrategy:
          (json['migrationStrategy'] as String?)?.toMigrationStrategy(),
      migrationTimestamp: timeStampFromJson(json['migrationTimestamp']),
      v1BotLocale: (json['v1BotLocale'] as String?)?.toLocale(),
      v1BotName: json['v1BotName'] as String?,
      v1BotVersion: json['v1BotVersion'] as String?,
      v2BotId: json['v2BotId'] as String?,
      v2BotRole: json['v2BotRole'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alerts = this.alerts;
    final migrationId = this.migrationId;
    final migrationStatus = this.migrationStatus;
    final migrationStrategy = this.migrationStrategy;
    final migrationTimestamp = this.migrationTimestamp;
    final v1BotLocale = this.v1BotLocale;
    final v1BotName = this.v1BotName;
    final v1BotVersion = this.v1BotVersion;
    final v2BotId = this.v2BotId;
    final v2BotRole = this.v2BotRole;
    return {
      if (alerts != null) 'alerts': alerts,
      if (migrationId != null) 'migrationId': migrationId,
      if (migrationStatus != null) 'migrationStatus': migrationStatus.toValue(),
      if (migrationStrategy != null)
        'migrationStrategy': migrationStrategy.toValue(),
      if (migrationTimestamp != null)
        'migrationTimestamp': unixTimestampToJson(migrationTimestamp),
      if (v1BotLocale != null) 'v1BotLocale': v1BotLocale.toValue(),
      if (v1BotName != null) 'v1BotName': v1BotName,
      if (v1BotVersion != null) 'v1BotVersion': v1BotVersion,
      if (v2BotId != null) 'v2BotId': v2BotId,
      if (v2BotRole != null) 'v2BotRole': v2BotRole,
    };
  }
}

class GetMigrationsResponse {
  /// An array of summaries for migrations from Amazon Lex V1 to Amazon Lex V2. To
  /// see details of the migration, use the <code>migrationId</code> from the
  /// summary in a call to the operation.
  final List<MigrationSummary>? migrationSummaries;

  /// If the response is truncated, it includes a pagination token that you can
  /// specify in your next request to fetch the next page of migrations.
  final String? nextToken;

  GetMigrationsResponse({
    this.migrationSummaries,
    this.nextToken,
  });

  factory GetMigrationsResponse.fromJson(Map<String, dynamic> json) {
    return GetMigrationsResponse(
      migrationSummaries: (json['migrationSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => MigrationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final migrationSummaries = this.migrationSummaries;
    final nextToken = this.nextToken;
    return {
      if (migrationSummaries != null) 'migrationSummaries': migrationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetSlotTypeResponse {
  /// Checksum of the <code>$LATEST</code> version of the slot type.
  final String? checksum;

  /// The date that the slot type was created.
  final DateTime? createdDate;

  /// A description of the slot type.
  final String? description;

  /// A list of <code>EnumerationValue</code> objects that defines the values that
  /// the slot type can take.
  final List<EnumerationValue>? enumerationValues;

  /// The date that the slot type was updated. When you create a resource, the
  /// creation date and last update date are the same.
  final DateTime? lastUpdatedDate;

  /// The name of the slot type.
  final String? name;

  /// The built-in slot type used as a parent for the slot type.
  final String? parentSlotTypeSignature;

  /// Configuration information that extends the parent built-in slot type.
  final List<SlotTypeConfiguration>? slotTypeConfigurations;

  /// The strategy that Amazon Lex uses to determine the value of the slot. For
  /// more information, see <a>PutSlotType</a>.
  final SlotValueSelectionStrategy? valueSelectionStrategy;

  /// The version of the slot type.
  final String? version;

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

  factory GetSlotTypeResponse.fromJson(Map<String, dynamic> json) {
    return GetSlotTypeResponse(
      checksum: json['checksum'] as String?,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      enumerationValues: (json['enumerationValues'] as List?)
          ?.whereNotNull()
          .map((e) => EnumerationValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
      parentSlotTypeSignature: json['parentSlotTypeSignature'] as String?,
      slotTypeConfigurations: (json['slotTypeConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => SlotTypeConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      valueSelectionStrategy: (json['valueSelectionStrategy'] as String?)
          ?.toSlotValueSelectionStrategy(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final createdDate = this.createdDate;
    final description = this.description;
    final enumerationValues = this.enumerationValues;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    final parentSlotTypeSignature = this.parentSlotTypeSignature;
    final slotTypeConfigurations = this.slotTypeConfigurations;
    final valueSelectionStrategy = this.valueSelectionStrategy;
    final version = this.version;
    return {
      if (checksum != null) 'checksum': checksum,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (enumerationValues != null) 'enumerationValues': enumerationValues,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
      if (parentSlotTypeSignature != null)
        'parentSlotTypeSignature': parentSlotTypeSignature,
      if (slotTypeConfigurations != null)
        'slotTypeConfigurations': slotTypeConfigurations,
      if (valueSelectionStrategy != null)
        'valueSelectionStrategy': valueSelectionStrategy.toValue(),
      if (version != null) 'version': version,
    };
  }
}

class GetSlotTypeVersionsResponse {
  /// A pagination token for fetching the next page of slot type versions. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token in
  /// the response. To fetch the next page of versions, specify the pagination
  /// token in the next request.
  final String? nextToken;

  /// An array of <code>SlotTypeMetadata</code> objects, one for each numbered
  /// version of the slot type plus one for the <code>$LATEST</code> version.
  final List<SlotTypeMetadata>? slotTypes;

  GetSlotTypeVersionsResponse({
    this.nextToken,
    this.slotTypes,
  });

  factory GetSlotTypeVersionsResponse.fromJson(Map<String, dynamic> json) {
    return GetSlotTypeVersionsResponse(
      nextToken: json['nextToken'] as String?,
      slotTypes: (json['slotTypes'] as List?)
          ?.whereNotNull()
          .map((e) => SlotTypeMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final slotTypes = this.slotTypes;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (slotTypes != null) 'slotTypes': slotTypes,
    };
  }
}

class GetSlotTypesResponse {
  /// If the response is truncated, it includes a pagination token that you can
  /// specify in your next request to fetch the next page of slot types.
  final String? nextToken;

  /// An array of objects, one for each slot type, that provides information such
  /// as the name of the slot type, the version, and a description.
  final List<SlotTypeMetadata>? slotTypes;

  GetSlotTypesResponse({
    this.nextToken,
    this.slotTypes,
  });

  factory GetSlotTypesResponse.fromJson(Map<String, dynamic> json) {
    return GetSlotTypesResponse(
      nextToken: json['nextToken'] as String?,
      slotTypes: (json['slotTypes'] as List?)
          ?.whereNotNull()
          .map((e) => SlotTypeMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final slotTypes = this.slotTypes;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (slotTypes != null) 'slotTypes': slotTypes,
    };
  }
}

class GetUtterancesViewResponse {
  /// The name of the bot for which utterance information was returned.
  final String? botName;

  /// An array of <a>UtteranceList</a> objects, each containing a list of
  /// <a>UtteranceData</a> objects describing the utterances that were processed
  /// by your bot. The response contains a maximum of 100
  /// <code>UtteranceData</code> objects for each version. Amazon Lex returns the
  /// most frequent utterances received by the bot in the last 15 days.
  final List<UtteranceList>? utterances;

  GetUtterancesViewResponse({
    this.botName,
    this.utterances,
  });

  factory GetUtterancesViewResponse.fromJson(Map<String, dynamic> json) {
    return GetUtterancesViewResponse(
      botName: json['botName'] as String?,
      utterances: (json['utterances'] as List?)
          ?.whereNotNull()
          .map((e) => UtteranceList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botName = this.botName;
    final utterances = this.utterances;
    return {
      if (botName != null) 'botName': botName,
      if (utterances != null) 'utterances': utterances,
    };
  }
}

enum ImportStatus {
  inProgress,
  complete,
  failed,
}

extension ImportStatusValueExtension on ImportStatus {
  String toValue() {
    switch (this) {
      case ImportStatus.inProgress:
        return 'IN_PROGRESS';
      case ImportStatus.complete:
        return 'COMPLETE';
      case ImportStatus.failed:
        return 'FAILED';
    }
  }
}

extension ImportStatusFromString on String {
  ImportStatus toImportStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ImportStatus.inProgress;
      case 'COMPLETE':
        return ImportStatus.complete;
      case 'FAILED':
        return ImportStatus.failed;
    }
    throw Exception('$this is not known in enum ImportStatus');
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

/// Identifies the specific version of an intent.
class Intent {
  /// The name of the intent.
  final String intentName;

  /// The version of the intent.
  final String intentVersion;

  Intent({
    required this.intentName,
    required this.intentVersion,
  });

  factory Intent.fromJson(Map<String, dynamic> json) {
    return Intent(
      intentName: json['intentName'] as String,
      intentVersion: json['intentVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final intentName = this.intentName;
    final intentVersion = this.intentVersion;
    return {
      'intentName': intentName,
      'intentVersion': intentVersion,
    };
  }
}

/// Provides information about an intent.
class IntentMetadata {
  /// The date that the intent was created.
  final DateTime? createdDate;

  /// A description of the intent.
  final String? description;

  /// The date that the intent was updated. When you create an intent, the
  /// creation date and last updated date are the same.
  final DateTime? lastUpdatedDate;

  /// The name of the intent.
  final String? name;

  /// The version of the intent.
  final String? version;

  IntentMetadata({
    this.createdDate,
    this.description,
    this.lastUpdatedDate,
    this.name,
    this.version,
  });

  factory IntentMetadata.fromJson(Map<String, dynamic> json) {
    return IntentMetadata(
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final description = this.description;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    final version = this.version;
    return {
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
      if (version != null) 'version': version,
    };
  }
}

/// Provides configuration information for the AMAZON.KendraSearchIntent intent.
/// When you use this intent, Amazon Lex searches the specified Amazon Kendra
/// index and returns documents from the index that match the user's utterance.
/// For more information, see <a
/// href="http://docs.aws.amazon.com/lex/latest/dg/built-in-intent-kendra-search.html">
/// AMAZON.KendraSearchIntent</a>.
class KendraConfiguration {
  /// The Amazon Resource Name (ARN) of the Amazon Kendra index that you want the
  /// AMAZON.KendraSearchIntent intent to search. The index must be in the same
  /// account and Region as the Amazon Lex bot. If the Amazon Kendra index does
  /// not exist, you get an exception when you call the <code>PutIntent</code>
  /// operation.
  final String kendraIndex;

  /// The Amazon Resource Name (ARN) of an IAM role that has permission to search
  /// the Amazon Kendra index. The role must be in the same account and Region as
  /// the Amazon Lex bot. If the role does not exist, you get an exception when
  /// you call the <code>PutIntent</code> operation.
  final String role;

  /// A query filter that Amazon Lex sends to Amazon Kendra to filter the response
  /// from the query. The filter is in the format defined by Amazon Kendra. For
  /// more information, see <a
  /// href="http://docs.aws.amazon.com/kendra/latest/dg/filtering.html">Filtering
  /// queries</a>.
  ///
  /// You can override this filter string with a new filter string at runtime.
  final String? queryFilterString;

  KendraConfiguration({
    required this.kendraIndex,
    required this.role,
    this.queryFilterString,
  });

  factory KendraConfiguration.fromJson(Map<String, dynamic> json) {
    return KendraConfiguration(
      kendraIndex: json['kendraIndex'] as String,
      role: json['role'] as String,
      queryFilterString: json['queryFilterString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kendraIndex = this.kendraIndex;
    final role = this.role;
    final queryFilterString = this.queryFilterString;
    return {
      'kendraIndex': kendraIndex,
      'role': role,
      if (queryFilterString != null) 'queryFilterString': queryFilterString,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags associated with a resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

enum Locale {
  deDe,
  enAu,
  enGb,
  enIn,
  enUs,
  es_419,
  esEs,
  esUs,
  frFr,
  frCa,
  itIt,
  jaJp,
  koKr,
}

extension LocaleValueExtension on Locale {
  String toValue() {
    switch (this) {
      case Locale.deDe:
        return 'de-DE';
      case Locale.enAu:
        return 'en-AU';
      case Locale.enGb:
        return 'en-GB';
      case Locale.enIn:
        return 'en-IN';
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
      case Locale.jaJp:
        return 'ja-JP';
      case Locale.koKr:
        return 'ko-KR';
    }
  }
}

extension LocaleFromString on String {
  Locale toLocale() {
    switch (this) {
      case 'de-DE':
        return Locale.deDe;
      case 'en-AU':
        return Locale.enAu;
      case 'en-GB':
        return Locale.enGb;
      case 'en-IN':
        return Locale.enIn;
      case 'en-US':
        return Locale.enUs;
      case 'es-419':
        return Locale.es_419;
      case 'es-ES':
        return Locale.esEs;
      case 'es-US':
        return Locale.esUs;
      case 'fr-FR':
        return Locale.frFr;
      case 'fr-CA':
        return Locale.frCa;
      case 'it-IT':
        return Locale.itIt;
      case 'ja-JP':
        return Locale.jaJp;
      case 'ko-KR':
        return Locale.koKr;
    }
    throw Exception('$this is not known in enum Locale');
  }
}

/// Settings used to configure delivery mode and destination for conversation
/// logs.
class LogSettingsRequest {
  /// Where the logs will be delivered. Text logs are delivered to a CloudWatch
  /// Logs log group. Audio logs are delivered to an S3 bucket.
  final Destination destination;

  /// The type of logging to enable. Text logs are delivered to a CloudWatch Logs
  /// log group. Audio logs are delivered to an S3 bucket.
  final LogType logType;

  /// The Amazon Resource Name (ARN) of the CloudWatch Logs log group or S3 bucket
  /// where the logs should be delivered.
  final String resourceArn;

  /// The Amazon Resource Name (ARN) of the AWS KMS customer managed key for
  /// encrypting audio logs delivered to an S3 bucket. The key does not apply to
  /// CloudWatch Logs and is optional for S3 buckets.
  final String? kmsKeyArn;

  LogSettingsRequest({
    required this.destination,
    required this.logType,
    required this.resourceArn,
    this.kmsKeyArn,
  });

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final logType = this.logType;
    final resourceArn = this.resourceArn;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'destination': destination.toValue(),
      'logType': logType.toValue(),
      'resourceArn': resourceArn,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// The settings for conversation logs.
class LogSettingsResponse {
  /// The destination where logs are delivered.
  final Destination? destination;

  /// The Amazon Resource Name (ARN) of the key used to encrypt audio logs in an
  /// S3 bucket.
  final String? kmsKeyArn;

  /// The type of logging that is enabled.
  final LogType? logType;

  /// The Amazon Resource Name (ARN) of the CloudWatch Logs log group or S3 bucket
  /// where the logs are delivered.
  final String? resourceArn;

  /// The resource prefix is the first part of the S3 object key within the S3
  /// bucket that you specified to contain audio logs. For CloudWatch Logs it is
  /// the prefix of the log stream name within the log group that you specified.
  final String? resourcePrefix;

  LogSettingsResponse({
    this.destination,
    this.kmsKeyArn,
    this.logType,
    this.resourceArn,
    this.resourcePrefix,
  });

  factory LogSettingsResponse.fromJson(Map<String, dynamic> json) {
    return LogSettingsResponse(
      destination: (json['destination'] as String?)?.toDestination(),
      kmsKeyArn: json['kmsKeyArn'] as String?,
      logType: (json['logType'] as String?)?.toLogType(),
      resourceArn: json['resourceArn'] as String?,
      resourcePrefix: json['resourcePrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final kmsKeyArn = this.kmsKeyArn;
    final logType = this.logType;
    final resourceArn = this.resourceArn;
    final resourcePrefix = this.resourcePrefix;
    return {
      if (destination != null) 'destination': destination.toValue(),
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (logType != null) 'logType': logType.toValue(),
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourcePrefix != null) 'resourcePrefix': resourcePrefix,
    };
  }
}

enum LogType {
  audio,
  text,
}

extension LogTypeValueExtension on LogType {
  String toValue() {
    switch (this) {
      case LogType.audio:
        return 'AUDIO';
      case LogType.text:
        return 'TEXT';
    }
  }
}

extension LogTypeFromString on String {
  LogType toLogType() {
    switch (this) {
      case 'AUDIO':
        return LogType.audio;
      case 'TEXT':
        return LogType.text;
    }
    throw Exception('$this is not known in enum LogType');
  }
}

enum MergeStrategy {
  overwriteLatest,
  failOnConflict,
}

extension MergeStrategyValueExtension on MergeStrategy {
  String toValue() {
    switch (this) {
      case MergeStrategy.overwriteLatest:
        return 'OVERWRITE_LATEST';
      case MergeStrategy.failOnConflict:
        return 'FAIL_ON_CONFLICT';
    }
  }
}

extension MergeStrategyFromString on String {
  MergeStrategy toMergeStrategy() {
    switch (this) {
      case 'OVERWRITE_LATEST':
        return MergeStrategy.overwriteLatest;
      case 'FAIL_ON_CONFLICT':
        return MergeStrategy.failOnConflict;
    }
    throw Exception('$this is not known in enum MergeStrategy');
  }
}

/// The message object that provides the message text and its type.
class Message {
  /// The text of the message.
  final String content;

  /// The content type of the message string.
  final ContentType contentType;

  /// Identifies the message group that the message belongs to. When a group is
  /// assigned to a message, Amazon Lex returns one message from each group in the
  /// response.
  final int? groupNumber;

  Message({
    required this.content,
    required this.contentType,
    this.groupNumber,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      content: json['content'] as String,
      contentType: (json['contentType'] as String).toContentType(),
      groupNumber: json['groupNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final contentType = this.contentType;
    final groupNumber = this.groupNumber;
    return {
      'content': content,
      'contentType': contentType.toValue(),
      if (groupNumber != null) 'groupNumber': groupNumber,
    };
  }
}

/// Provides information about alerts and warnings that Amazon Lex sends during
/// a migration. The alerts include information about how to resolve the issue.
class MigrationAlert {
  /// Additional details about the alert.
  final List<String>? details;

  /// A message that describes why the alert was issued.
  final String? message;

  /// A link to the Amazon Lex documentation that describes how to resolve the
  /// alert.
  final List<String>? referenceURLs;

  /// The type of alert. There are two kinds of alerts:
  ///
  /// <ul>
  /// <li>
  /// <code>ERROR</code> - There was an issue with the migration that can't be
  /// resolved. The migration stops.
  /// </li>
  /// <li>
  /// <code>WARN</code> - There was an issue with the migration that requires
  /// manual changes to the new Amazon Lex V2 bot. The migration continues.
  /// </li>
  /// </ul>
  final MigrationAlertType? type;

  MigrationAlert({
    this.details,
    this.message,
    this.referenceURLs,
    this.type,
  });

  factory MigrationAlert.fromJson(Map<String, dynamic> json) {
    return MigrationAlert(
      details: (json['details'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      message: json['message'] as String?,
      referenceURLs: (json['referenceURLs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String?)?.toMigrationAlertType(),
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final message = this.message;
    final referenceURLs = this.referenceURLs;
    final type = this.type;
    return {
      if (details != null) 'details': details,
      if (message != null) 'message': message,
      if (referenceURLs != null) 'referenceURLs': referenceURLs,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum MigrationAlertType {
  error,
  warn,
}

extension MigrationAlertTypeValueExtension on MigrationAlertType {
  String toValue() {
    switch (this) {
      case MigrationAlertType.error:
        return 'ERROR';
      case MigrationAlertType.warn:
        return 'WARN';
    }
  }
}

extension MigrationAlertTypeFromString on String {
  MigrationAlertType toMigrationAlertType() {
    switch (this) {
      case 'ERROR':
        return MigrationAlertType.error;
      case 'WARN':
        return MigrationAlertType.warn;
    }
    throw Exception('$this is not known in enum MigrationAlertType');
  }
}

enum MigrationSortAttribute {
  v1BotName,
  migrationDateTime,
}

extension MigrationSortAttributeValueExtension on MigrationSortAttribute {
  String toValue() {
    switch (this) {
      case MigrationSortAttribute.v1BotName:
        return 'V1_BOT_NAME';
      case MigrationSortAttribute.migrationDateTime:
        return 'MIGRATION_DATE_TIME';
    }
  }
}

extension MigrationSortAttributeFromString on String {
  MigrationSortAttribute toMigrationSortAttribute() {
    switch (this) {
      case 'V1_BOT_NAME':
        return MigrationSortAttribute.v1BotName;
      case 'MIGRATION_DATE_TIME':
        return MigrationSortAttribute.migrationDateTime;
    }
    throw Exception('$this is not known in enum MigrationSortAttribute');
  }
}

enum MigrationStatus {
  inProgress,
  completed,
  failed,
}

extension MigrationStatusValueExtension on MigrationStatus {
  String toValue() {
    switch (this) {
      case MigrationStatus.inProgress:
        return 'IN_PROGRESS';
      case MigrationStatus.completed:
        return 'COMPLETED';
      case MigrationStatus.failed:
        return 'FAILED';
    }
  }
}

extension MigrationStatusFromString on String {
  MigrationStatus toMigrationStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return MigrationStatus.inProgress;
      case 'COMPLETED':
        return MigrationStatus.completed;
      case 'FAILED':
        return MigrationStatus.failed;
    }
    throw Exception('$this is not known in enum MigrationStatus');
  }
}

enum MigrationStrategy {
  createNew,
  updateExisting,
}

extension MigrationStrategyValueExtension on MigrationStrategy {
  String toValue() {
    switch (this) {
      case MigrationStrategy.createNew:
        return 'CREATE_NEW';
      case MigrationStrategy.updateExisting:
        return 'UPDATE_EXISTING';
    }
  }
}

extension MigrationStrategyFromString on String {
  MigrationStrategy toMigrationStrategy() {
    switch (this) {
      case 'CREATE_NEW':
        return MigrationStrategy.createNew;
      case 'UPDATE_EXISTING':
        return MigrationStrategy.updateExisting;
    }
    throw Exception('$this is not known in enum MigrationStrategy');
  }
}

/// Provides information about migrating a bot from Amazon Lex V1 to Amazon Lex
/// V2.
class MigrationSummary {
  /// The unique identifier that Amazon Lex assigned to the migration.
  final String? migrationId;

  /// The status of the operation. When the status is <code>COMPLETE</code> the
  /// bot is available in Amazon Lex V2. There may be alerts and warnings that
  /// need to be resolved to complete the migration.
  final MigrationStatus? migrationStatus;

  /// The strategy used to conduct the migration.
  final MigrationStrategy? migrationStrategy;

  /// The date and time that the migration started.
  final DateTime? migrationTimestamp;

  /// The locale of the Amazon Lex V1 bot that is the source of the migration.
  final Locale? v1BotLocale;

  /// The name of the Amazon Lex V1 bot that is the source of the migration.
  final String? v1BotName;

  /// The version of the Amazon Lex V1 bot that is the source of the migration.
  final String? v1BotVersion;

  /// The unique identifier of the Amazon Lex V2 that is the destination of the
  /// migration.
  final String? v2BotId;

  /// The IAM role that Amazon Lex uses to run the Amazon Lex V2 bot.
  final String? v2BotRole;

  MigrationSummary({
    this.migrationId,
    this.migrationStatus,
    this.migrationStrategy,
    this.migrationTimestamp,
    this.v1BotLocale,
    this.v1BotName,
    this.v1BotVersion,
    this.v2BotId,
    this.v2BotRole,
  });

  factory MigrationSummary.fromJson(Map<String, dynamic> json) {
    return MigrationSummary(
      migrationId: json['migrationId'] as String?,
      migrationStatus:
          (json['migrationStatus'] as String?)?.toMigrationStatus(),
      migrationStrategy:
          (json['migrationStrategy'] as String?)?.toMigrationStrategy(),
      migrationTimestamp: timeStampFromJson(json['migrationTimestamp']),
      v1BotLocale: (json['v1BotLocale'] as String?)?.toLocale(),
      v1BotName: json['v1BotName'] as String?,
      v1BotVersion: json['v1BotVersion'] as String?,
      v2BotId: json['v2BotId'] as String?,
      v2BotRole: json['v2BotRole'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final migrationId = this.migrationId;
    final migrationStatus = this.migrationStatus;
    final migrationStrategy = this.migrationStrategy;
    final migrationTimestamp = this.migrationTimestamp;
    final v1BotLocale = this.v1BotLocale;
    final v1BotName = this.v1BotName;
    final v1BotVersion = this.v1BotVersion;
    final v2BotId = this.v2BotId;
    final v2BotRole = this.v2BotRole;
    return {
      if (migrationId != null) 'migrationId': migrationId,
      if (migrationStatus != null) 'migrationStatus': migrationStatus.toValue(),
      if (migrationStrategy != null)
        'migrationStrategy': migrationStrategy.toValue(),
      if (migrationTimestamp != null)
        'migrationTimestamp': unixTimestampToJson(migrationTimestamp),
      if (v1BotLocale != null) 'v1BotLocale': v1BotLocale.toValue(),
      if (v1BotName != null) 'v1BotName': v1BotName,
      if (v1BotVersion != null) 'v1BotVersion': v1BotVersion,
      if (v2BotId != null) 'v2BotId': v2BotId,
      if (v2BotRole != null) 'v2BotRole': v2BotRole,
    };
  }
}

enum ObfuscationSetting {
  none,
  defaultObfuscation,
}

extension ObfuscationSettingValueExtension on ObfuscationSetting {
  String toValue() {
    switch (this) {
      case ObfuscationSetting.none:
        return 'NONE';
      case ObfuscationSetting.defaultObfuscation:
        return 'DEFAULT_OBFUSCATION';
    }
  }
}

extension ObfuscationSettingFromString on String {
  ObfuscationSetting toObfuscationSetting() {
    switch (this) {
      case 'NONE':
        return ObfuscationSetting.none;
      case 'DEFAULT_OBFUSCATION':
        return ObfuscationSetting.defaultObfuscation;
    }
    throw Exception('$this is not known in enum ObfuscationSetting');
  }
}

/// The specification of an output context that is set when an intent is
/// fulfilled.
class OutputContext {
  /// The name of the context.
  final String name;

  /// The number of seconds that the context should be active after it is first
  /// sent in a <code>PostContent</code> or <code>PostText</code> response. You
  /// can set the value between 5 and 86,400 seconds (24 hours).
  final int timeToLiveInSeconds;

  /// The number of conversation turns that the context should be active. A
  /// conversation turn is one <code>PostContent</code> or <code>PostText</code>
  /// request and the corresponding response from Amazon Lex.
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

enum ProcessBehavior {
  save,
  build,
}

extension ProcessBehaviorValueExtension on ProcessBehavior {
  String toValue() {
    switch (this) {
      case ProcessBehavior.save:
        return 'SAVE';
      case ProcessBehavior.build:
        return 'BUILD';
    }
  }
}

extension ProcessBehaviorFromString on String {
  ProcessBehavior toProcessBehavior() {
    switch (this) {
      case 'SAVE':
        return ProcessBehavior.save;
      case 'BUILD':
        return ProcessBehavior.build;
    }
    throw Exception('$this is not known in enum ProcessBehavior');
  }
}

/// Obtains information from the user. To define a prompt, provide one or more
/// messages and specify the number of attempts to get information from the
/// user. If you provide more than one message, Amazon Lex chooses one of the
/// messages to use to prompt the user. For more information, see
/// <a>how-it-works</a>.
class Prompt {
  /// The number of times to prompt the user for information.
  final int maxAttempts;

  /// An array of objects, each of which provides a message string and its type.
  /// You can specify the message string in plain text or in Speech Synthesis
  /// Markup Language (SSML).
  final List<Message> messages;

  /// A response card. Amazon Lex uses this prompt at runtime, in the
  /// <code>PostText</code> API response. It substitutes session attributes and
  /// slot values for placeholders in the response card. For more information, see
  /// <a>ex-resp-card</a>.
  final String? responseCard;

  Prompt({
    required this.maxAttempts,
    required this.messages,
    this.responseCard,
  });

  factory Prompt.fromJson(Map<String, dynamic> json) {
    return Prompt(
      maxAttempts: json['maxAttempts'] as int,
      messages: (json['messages'] as List)
          .whereNotNull()
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      responseCard: json['responseCard'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxAttempts = this.maxAttempts;
    final messages = this.messages;
    final responseCard = this.responseCard;
    return {
      'maxAttempts': maxAttempts,
      'messages': messages,
      if (responseCard != null) 'responseCard': responseCard,
    };
  }
}

class PutBotAliasResponse {
  /// The name of the bot that the alias points to.
  final String? botName;

  /// The version of the bot that the alias points to.
  final String? botVersion;

  /// The checksum for the current version of the alias.
  final String? checksum;

  /// The settings that determine how Amazon Lex uses conversation logs for the
  /// alias.
  final ConversationLogsResponse? conversationLogs;

  /// The date that the bot alias was created.
  final DateTime? createdDate;

  /// A description of the alias.
  final String? description;

  /// The date that the bot alias was updated. When you create a resource, the
  /// creation date and the last updated date are the same.
  final DateTime? lastUpdatedDate;

  /// The name of the alias.
  final String? name;

  /// A list of tags associated with a bot.
  final List<Tag>? tags;

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

  factory PutBotAliasResponse.fromJson(Map<String, dynamic> json) {
    return PutBotAliasResponse(
      botName: json['botName'] as String?,
      botVersion: json['botVersion'] as String?,
      checksum: json['checksum'] as String?,
      conversationLogs: json['conversationLogs'] != null
          ? ConversationLogsResponse.fromJson(
              json['conversationLogs'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botName = this.botName;
    final botVersion = this.botVersion;
    final checksum = this.checksum;
    final conversationLogs = this.conversationLogs;
    final createdDate = this.createdDate;
    final description = this.description;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    final tags = this.tags;
    return {
      if (botName != null) 'botName': botName,
      if (botVersion != null) 'botVersion': botVersion,
      if (checksum != null) 'checksum': checksum,
      if (conversationLogs != null) 'conversationLogs': conversationLogs,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class PutBotResponse {
  /// The message that Amazon Lex uses to cancel a conversation. For more
  /// information, see <a>PutBot</a>.
  final Statement? abortStatement;

  /// Checksum of the bot that you created.
  final String? checksum;

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
  final bool? childDirected;

  /// The prompts that Amazon Lex uses when it doesn't understand the user's
  /// intent. For more information, see <a>PutBot</a>.
  final Prompt? clarificationPrompt;

  /// <code>True</code> if a new version of the bot was created. If the
  /// <code>createVersion</code> field was not specified in the request, the
  /// <code>createVersion</code> field is set to false in the response.
  final bool? createVersion;

  /// The date that the bot was created.
  final DateTime? createdDate;

  /// A description of the bot.
  final String? description;

  /// <code>true</code> if the bot is configured to send user utterances to Amazon
  /// Comprehend for sentiment analysis. If the <code>detectSentiment</code> field
  /// was not specified in the request, the <code>detectSentiment</code> field is
  /// <code>false</code> in the response.
  final bool? detectSentiment;

  /// Indicates whether the bot uses accuracy improvements. <code>true</code>
  /// indicates that the bot is using the improvements, otherwise,
  /// <code>false</code>.
  final bool? enableModelImprovements;

  /// If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the
  /// reason that it failed to build the bot.
  final String? failureReason;

  /// The maximum length of time that Amazon Lex retains the data gathered in a
  /// conversation. For more information, see <a>PutBot</a>.
  final int? idleSessionTTLInSeconds;

  /// An array of <code>Intent</code> objects. For more information, see
  /// <a>PutBot</a>.
  final List<Intent>? intents;

  /// The date that the bot was updated. When you create a resource, the creation
  /// date and last updated date are the same.
  final DateTime? lastUpdatedDate;

  /// The target locale for the bot.
  final Locale? locale;

  /// The name of the bot.
  final String? name;

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
  final double? nluIntentConfidenceThreshold;

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
  final Status? status;

  /// A list of tags associated with the bot.
  final List<Tag>? tags;

  /// The version of the bot. For a new bot, the version is always
  /// <code>$LATEST</code>.
  final String? version;

  /// The Amazon Polly voice ID that Amazon Lex uses for voice interaction with
  /// the user. For more information, see <a>PutBot</a>.
  final String? voiceId;

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

  factory PutBotResponse.fromJson(Map<String, dynamic> json) {
    return PutBotResponse(
      abortStatement: json['abortStatement'] != null
          ? Statement.fromJson(json['abortStatement'] as Map<String, dynamic>)
          : null,
      checksum: json['checksum'] as String?,
      childDirected: json['childDirected'] as bool?,
      clarificationPrompt: json['clarificationPrompt'] != null
          ? Prompt.fromJson(json['clarificationPrompt'] as Map<String, dynamic>)
          : null,
      createVersion: json['createVersion'] as bool?,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      detectSentiment: json['detectSentiment'] as bool?,
      enableModelImprovements: json['enableModelImprovements'] as bool?,
      failureReason: json['failureReason'] as String?,
      idleSessionTTLInSeconds: json['idleSessionTTLInSeconds'] as int?,
      intents: (json['intents'] as List?)
          ?.whereNotNull()
          .map((e) => Intent.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      locale: (json['locale'] as String?)?.toLocale(),
      name: json['name'] as String?,
      nluIntentConfidenceThreshold:
          json['nluIntentConfidenceThreshold'] as double?,
      status: (json['status'] as String?)?.toStatus(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
      voiceId: json['voiceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final abortStatement = this.abortStatement;
    final checksum = this.checksum;
    final childDirected = this.childDirected;
    final clarificationPrompt = this.clarificationPrompt;
    final createVersion = this.createVersion;
    final createdDate = this.createdDate;
    final description = this.description;
    final detectSentiment = this.detectSentiment;
    final enableModelImprovements = this.enableModelImprovements;
    final failureReason = this.failureReason;
    final idleSessionTTLInSeconds = this.idleSessionTTLInSeconds;
    final intents = this.intents;
    final lastUpdatedDate = this.lastUpdatedDate;
    final locale = this.locale;
    final name = this.name;
    final nluIntentConfidenceThreshold = this.nluIntentConfidenceThreshold;
    final status = this.status;
    final tags = this.tags;
    final version = this.version;
    final voiceId = this.voiceId;
    return {
      if (abortStatement != null) 'abortStatement': abortStatement,
      if (checksum != null) 'checksum': checksum,
      if (childDirected != null) 'childDirected': childDirected,
      if (clarificationPrompt != null)
        'clarificationPrompt': clarificationPrompt,
      if (createVersion != null) 'createVersion': createVersion,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (detectSentiment != null) 'detectSentiment': detectSentiment,
      if (enableModelImprovements != null)
        'enableModelImprovements': enableModelImprovements,
      if (failureReason != null) 'failureReason': failureReason,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (intents != null) 'intents': intents,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (locale != null) 'locale': locale.toValue(),
      if (name != null) 'name': name,
      if (nluIntentConfidenceThreshold != null)
        'nluIntentConfidenceThreshold': nluIntentConfidenceThreshold,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (voiceId != null) 'voiceId': voiceId,
    };
  }
}

class PutIntentResponse {
  /// Checksum of the <code>$LATEST</code>version of the intent created or
  /// updated.
  final String? checksum;

  /// After the Lambda function specified in
  /// the<code>fulfillmentActivity</code>intent fulfills the intent, Amazon Lex
  /// conveys this statement to the user.
  final Statement? conclusionStatement;

  /// If defined in the intent, Amazon Lex prompts the user to confirm the intent
  /// before fulfilling it.
  final Prompt? confirmationPrompt;

  /// <code>True</code> if a new version of the intent was created. If the
  /// <code>createVersion</code> field was not specified in the request, the
  /// <code>createVersion</code> field is set to false in the response.
  final bool? createVersion;

  /// The date that the intent was created.
  final DateTime? createdDate;

  /// A description of the intent.
  final String? description;

  /// If defined in the intent, Amazon Lex invokes this Lambda function for each
  /// user input.
  final CodeHook? dialogCodeHook;

  /// If defined in the intent, Amazon Lex uses this prompt to solicit additional
  /// user activity after the intent is fulfilled.
  final FollowUpPrompt? followUpPrompt;

  /// If defined in the intent, Amazon Lex invokes this Lambda function to fulfill
  /// the intent after the user provides all of the information required by the
  /// intent.
  final FulfillmentActivity? fulfillmentActivity;

  /// An array of <code>InputContext</code> objects that lists the contexts that
  /// must be active for Amazon Lex to choose the intent in a conversation with
  /// the user.
  final List<InputContext>? inputContexts;

  /// Configuration information, if any, required to connect to an Amazon Kendra
  /// index and use the <code>AMAZON.KendraSearchIntent</code> intent.
  final KendraConfiguration? kendraConfiguration;

  /// The date that the intent was updated. When you create a resource, the
  /// creation date and last update dates are the same.
  final DateTime? lastUpdatedDate;

  /// The name of the intent.
  final String? name;

  /// An array of <code>OutputContext</code> objects that lists the contexts that
  /// the intent activates when the intent is fulfilled.
  final List<OutputContext>? outputContexts;

  /// A unique identifier for the built-in intent that this intent is based on.
  final String? parentIntentSignature;

  /// If the user answers "no" to the question defined in
  /// <code>confirmationPrompt</code> Amazon Lex responds with this statement to
  /// acknowledge that the intent was canceled.
  final Statement? rejectionStatement;

  /// An array of sample utterances that are configured for the intent.
  final List<String>? sampleUtterances;

  /// An array of intent slots that are configured for the intent.
  final List<Slot>? slots;

  /// The version of the intent. For a new intent, the version is always
  /// <code>$LATEST</code>.
  final String? version;

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

  factory PutIntentResponse.fromJson(Map<String, dynamic> json) {
    return PutIntentResponse(
      checksum: json['checksum'] as String?,
      conclusionStatement: json['conclusionStatement'] != null
          ? Statement.fromJson(
              json['conclusionStatement'] as Map<String, dynamic>)
          : null,
      confirmationPrompt: json['confirmationPrompt'] != null
          ? Prompt.fromJson(json['confirmationPrompt'] as Map<String, dynamic>)
          : null,
      createVersion: json['createVersion'] as bool?,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      dialogCodeHook: json['dialogCodeHook'] != null
          ? CodeHook.fromJson(json['dialogCodeHook'] as Map<String, dynamic>)
          : null,
      followUpPrompt: json['followUpPrompt'] != null
          ? FollowUpPrompt.fromJson(
              json['followUpPrompt'] as Map<String, dynamic>)
          : null,
      fulfillmentActivity: json['fulfillmentActivity'] != null
          ? FulfillmentActivity.fromJson(
              json['fulfillmentActivity'] as Map<String, dynamic>)
          : null,
      inputContexts: (json['inputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => InputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      kendraConfiguration: json['kendraConfiguration'] != null
          ? KendraConfiguration.fromJson(
              json['kendraConfiguration'] as Map<String, dynamic>)
          : null,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
      outputContexts: (json['outputContexts'] as List?)
          ?.whereNotNull()
          .map((e) => OutputContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentIntentSignature: json['parentIntentSignature'] as String?,
      rejectionStatement: json['rejectionStatement'] != null
          ? Statement.fromJson(
              json['rejectionStatement'] as Map<String, dynamic>)
          : null,
      sampleUtterances: (json['sampleUtterances'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      slots: (json['slots'] as List?)
          ?.whereNotNull()
          .map((e) => Slot.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final conclusionStatement = this.conclusionStatement;
    final confirmationPrompt = this.confirmationPrompt;
    final createVersion = this.createVersion;
    final createdDate = this.createdDate;
    final description = this.description;
    final dialogCodeHook = this.dialogCodeHook;
    final followUpPrompt = this.followUpPrompt;
    final fulfillmentActivity = this.fulfillmentActivity;
    final inputContexts = this.inputContexts;
    final kendraConfiguration = this.kendraConfiguration;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    final outputContexts = this.outputContexts;
    final parentIntentSignature = this.parentIntentSignature;
    final rejectionStatement = this.rejectionStatement;
    final sampleUtterances = this.sampleUtterances;
    final slots = this.slots;
    final version = this.version;
    return {
      if (checksum != null) 'checksum': checksum,
      if (conclusionStatement != null)
        'conclusionStatement': conclusionStatement,
      if (confirmationPrompt != null) 'confirmationPrompt': confirmationPrompt,
      if (createVersion != null) 'createVersion': createVersion,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (dialogCodeHook != null) 'dialogCodeHook': dialogCodeHook,
      if (followUpPrompt != null) 'followUpPrompt': followUpPrompt,
      if (fulfillmentActivity != null)
        'fulfillmentActivity': fulfillmentActivity,
      if (inputContexts != null) 'inputContexts': inputContexts,
      if (kendraConfiguration != null)
        'kendraConfiguration': kendraConfiguration,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
      if (outputContexts != null) 'outputContexts': outputContexts,
      if (parentIntentSignature != null)
        'parentIntentSignature': parentIntentSignature,
      if (rejectionStatement != null) 'rejectionStatement': rejectionStatement,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
      if (slots != null) 'slots': slots,
      if (version != null) 'version': version,
    };
  }
}

class PutSlotTypeResponse {
  /// Checksum of the <code>$LATEST</code> version of the slot type.
  final String? checksum;

  /// <code>True</code> if a new version of the slot type was created. If the
  /// <code>createVersion</code> field was not specified in the request, the
  /// <code>createVersion</code> field is set to false in the response.
  final bool? createVersion;

  /// The date that the slot type was created.
  final DateTime? createdDate;

  /// A description of the slot type.
  final String? description;

  /// A list of <code>EnumerationValue</code> objects that defines the values that
  /// the slot type can take.
  final List<EnumerationValue>? enumerationValues;

  /// The date that the slot type was updated. When you create a slot type, the
  /// creation date and last update date are the same.
  final DateTime? lastUpdatedDate;

  /// The name of the slot type.
  final String? name;

  /// The built-in slot type used as the parent of the slot type.
  final String? parentSlotTypeSignature;

  /// Configuration information that extends the parent built-in slot type.
  final List<SlotTypeConfiguration>? slotTypeConfigurations;

  /// The slot resolution strategy that Amazon Lex uses to determine the value of
  /// the slot. For more information, see <a>PutSlotType</a>.
  final SlotValueSelectionStrategy? valueSelectionStrategy;

  /// The version of the slot type. For a new slot type, the version is always
  /// <code>$LATEST</code>.
  final String? version;

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

  factory PutSlotTypeResponse.fromJson(Map<String, dynamic> json) {
    return PutSlotTypeResponse(
      checksum: json['checksum'] as String?,
      createVersion: json['createVersion'] as bool?,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      enumerationValues: (json['enumerationValues'] as List?)
          ?.whereNotNull()
          .map((e) => EnumerationValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
      parentSlotTypeSignature: json['parentSlotTypeSignature'] as String?,
      slotTypeConfigurations: (json['slotTypeConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => SlotTypeConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      valueSelectionStrategy: (json['valueSelectionStrategy'] as String?)
          ?.toSlotValueSelectionStrategy(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final createVersion = this.createVersion;
    final createdDate = this.createdDate;
    final description = this.description;
    final enumerationValues = this.enumerationValues;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    final parentSlotTypeSignature = this.parentSlotTypeSignature;
    final slotTypeConfigurations = this.slotTypeConfigurations;
    final valueSelectionStrategy = this.valueSelectionStrategy;
    final version = this.version;
    return {
      if (checksum != null) 'checksum': checksum,
      if (createVersion != null) 'createVersion': createVersion,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (enumerationValues != null) 'enumerationValues': enumerationValues,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
      if (parentSlotTypeSignature != null)
        'parentSlotTypeSignature': parentSlotTypeSignature,
      if (slotTypeConfigurations != null)
        'slotTypeConfigurations': slotTypeConfigurations,
      if (valueSelectionStrategy != null)
        'valueSelectionStrategy': valueSelectionStrategy.toValue(),
      if (version != null) 'version': version,
    };
  }
}

enum ResourceType {
  bot,
  intent,
  slotType,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.bot:
        return 'BOT';
      case ResourceType.intent:
        return 'INTENT';
      case ResourceType.slotType:
        return 'SLOT_TYPE';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'BOT':
        return ResourceType.bot;
      case 'INTENT':
        return ResourceType.intent;
      case 'SLOT_TYPE':
        return ResourceType.slotType;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

/// Identifies the version of a specific slot.
class Slot {
  /// The name of the slot.
  final String name;

  /// Specifies whether the slot is required or optional.
  final SlotConstraint slotConstraint;

  /// A list of default values for the slot. Default values are used when Amazon
  /// Lex hasn't determined a value for a slot. You can specify default values
  /// from context variables, session attributes, and defined values.
  final SlotDefaultValueSpec? defaultValueSpec;

  /// A description of the slot.
  final String? description;

  /// Determines whether a slot is obfuscated in conversation logs and stored
  /// utterances. When you obfuscate a slot, the value is replaced by the slot
  /// name in curly braces ({}). For example, if the slot name is "full_name",
  /// obfuscated values are replaced with "{full_name}". For more information, see
  /// <a href="https://docs.aws.amazon.com/lex/latest/dg/how-obfuscate.html"> Slot
  /// Obfuscation </a>.
  final ObfuscationSetting? obfuscationSetting;

  /// Directs Amazon Lex the order in which to elicit this slot value from the
  /// user. For example, if the intent has two slots with priorities 1 and 2, AWS
  /// Amazon Lex first elicits a value for the slot with priority 1.
  ///
  /// If multiple slots share the same priority, the order in which Amazon Lex
  /// elicits values is arbitrary.
  final int? priority;

  /// A set of possible responses for the slot type used by text-based clients. A
  /// user chooses an option from the response card, instead of using text to
  /// reply.
  final String? responseCard;

  /// If you know a specific pattern with which users might respond to an Amazon
  /// Lex request for a slot value, you can provide those utterances to improve
  /// accuracy. This is optional. In most cases, Amazon Lex is capable of
  /// understanding user utterances.
  final List<String>? sampleUtterances;

  /// The type of the slot, either a custom slot type that you defined or one of
  /// the built-in slot types.
  final String? slotType;

  /// The version of the slot type.
  final String? slotTypeVersion;

  /// The prompt that Amazon Lex uses to elicit the slot value from the user.
  final Prompt? valueElicitationPrompt;

  Slot({
    required this.name,
    required this.slotConstraint,
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

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      name: json['name'] as String,
      slotConstraint: (json['slotConstraint'] as String).toSlotConstraint(),
      defaultValueSpec: json['defaultValueSpec'] != null
          ? SlotDefaultValueSpec.fromJson(
              json['defaultValueSpec'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      obfuscationSetting:
          (json['obfuscationSetting'] as String?)?.toObfuscationSetting(),
      priority: json['priority'] as int?,
      responseCard: json['responseCard'] as String?,
      sampleUtterances: (json['sampleUtterances'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      slotType: json['slotType'] as String?,
      slotTypeVersion: json['slotTypeVersion'] as String?,
      valueElicitationPrompt: json['valueElicitationPrompt'] != null
          ? Prompt.fromJson(
              json['valueElicitationPrompt'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final slotConstraint = this.slotConstraint;
    final defaultValueSpec = this.defaultValueSpec;
    final description = this.description;
    final obfuscationSetting = this.obfuscationSetting;
    final priority = this.priority;
    final responseCard = this.responseCard;
    final sampleUtterances = this.sampleUtterances;
    final slotType = this.slotType;
    final slotTypeVersion = this.slotTypeVersion;
    final valueElicitationPrompt = this.valueElicitationPrompt;
    return {
      'name': name,
      'slotConstraint': slotConstraint.toValue(),
      if (defaultValueSpec != null) 'defaultValueSpec': defaultValueSpec,
      if (description != null) 'description': description,
      if (obfuscationSetting != null)
        'obfuscationSetting': obfuscationSetting.toValue(),
      if (priority != null) 'priority': priority,
      if (responseCard != null) 'responseCard': responseCard,
      if (sampleUtterances != null) 'sampleUtterances': sampleUtterances,
      if (slotType != null) 'slotType': slotType,
      if (slotTypeVersion != null) 'slotTypeVersion': slotTypeVersion,
      if (valueElicitationPrompt != null)
        'valueElicitationPrompt': valueElicitationPrompt,
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

/// A default value for a slot.
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

/// Contains the default values for a slot. Default values are used when Amazon
/// Lex hasn't determined a value for a slot.
class SlotDefaultValueSpec {
  /// The default values for a slot. You can specify more than one default. For
  /// example, you can specify a default value to use from a matching context
  /// variable, a session attribute, or a fixed value.
  ///
  /// The default value chosen is selected based on the order that you specify
  /// them in the list. For example, if you specify a context variable and a fixed
  /// value in that order, Amazon Lex uses the context variable if it is
  /// available, else it uses the fixed value.
  final List<SlotDefaultValue> defaultValueList;

  SlotDefaultValueSpec({
    required this.defaultValueList,
  });

  factory SlotDefaultValueSpec.fromJson(Map<String, dynamic> json) {
    return SlotDefaultValueSpec(
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

/// Provides configuration information for a slot type.
class SlotTypeConfiguration {
  /// A regular expression used to validate the value of a slot.
  final SlotTypeRegexConfiguration? regexConfiguration;

  SlotTypeConfiguration({
    this.regexConfiguration,
  });

  factory SlotTypeConfiguration.fromJson(Map<String, dynamic> json) {
    return SlotTypeConfiguration(
      regexConfiguration: json['regexConfiguration'] != null
          ? SlotTypeRegexConfiguration.fromJson(
              json['regexConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final regexConfiguration = this.regexConfiguration;
    return {
      if (regexConfiguration != null) 'regexConfiguration': regexConfiguration,
    };
  }
}

/// Provides information about a slot type..
class SlotTypeMetadata {
  /// The date that the slot type was created.
  final DateTime? createdDate;

  /// A description of the slot type.
  final String? description;

  /// The date that the slot type was updated. When you create a resource, the
  /// creation date and last updated date are the same.
  final DateTime? lastUpdatedDate;

  /// The name of the slot type.
  final String? name;

  /// The version of the slot type.
  final String? version;

  SlotTypeMetadata({
    this.createdDate,
    this.description,
    this.lastUpdatedDate,
    this.name,
    this.version,
  });

  factory SlotTypeMetadata.fromJson(Map<String, dynamic> json) {
    return SlotTypeMetadata(
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final description = this.description;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    final version = this.version;
    return {
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (description != null) 'description': description,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
      if (version != null) 'version': version,
    };
  }
}

/// Provides a regular expression used to validate the value of a slot.
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
  final String pattern;

  SlotTypeRegexConfiguration({
    required this.pattern,
  });

  factory SlotTypeRegexConfiguration.fromJson(Map<String, dynamic> json) {
    return SlotTypeRegexConfiguration(
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

enum SlotValueSelectionStrategy {
  originalValue,
  topResolution,
}

extension SlotValueSelectionStrategyValueExtension
    on SlotValueSelectionStrategy {
  String toValue() {
    switch (this) {
      case SlotValueSelectionStrategy.originalValue:
        return 'ORIGINAL_VALUE';
      case SlotValueSelectionStrategy.topResolution:
        return 'TOP_RESOLUTION';
    }
  }
}

extension SlotValueSelectionStrategyFromString on String {
  SlotValueSelectionStrategy toSlotValueSelectionStrategy() {
    switch (this) {
      case 'ORIGINAL_VALUE':
        return SlotValueSelectionStrategy.originalValue;
      case 'TOP_RESOLUTION':
        return SlotValueSelectionStrategy.topResolution;
    }
    throw Exception('$this is not known in enum SlotValueSelectionStrategy');
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
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

class StartImportResponse {
  /// A timestamp for the date and time that the import job was requested.
  final DateTime? createdDate;

  /// The identifier for the specific import job.
  final String? importId;

  /// The status of the import job. If the status is <code>FAILED</code>, you can
  /// get the reason for the failure using the <code>GetImport</code> operation.
  final ImportStatus? importStatus;

  /// The action to take when there is a merge conflict.
  final MergeStrategy? mergeStrategy;

  /// The name given to the import job.
  final String? name;

  /// The type of resource to import.
  final ResourceType? resourceType;

  /// A list of tags added to the imported bot.
  final List<Tag>? tags;

  StartImportResponse({
    this.createdDate,
    this.importId,
    this.importStatus,
    this.mergeStrategy,
    this.name,
    this.resourceType,
    this.tags,
  });

  factory StartImportResponse.fromJson(Map<String, dynamic> json) {
    return StartImportResponse(
      createdDate: timeStampFromJson(json['createdDate']),
      importId: json['importId'] as String?,
      importStatus: (json['importStatus'] as String?)?.toImportStatus(),
      mergeStrategy: (json['mergeStrategy'] as String?)?.toMergeStrategy(),
      name: json['name'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final importId = this.importId;
    final importStatus = this.importStatus;
    final mergeStrategy = this.mergeStrategy;
    final name = this.name;
    final resourceType = this.resourceType;
    final tags = this.tags;
    return {
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (importId != null) 'importId': importId,
      if (importStatus != null) 'importStatus': importStatus.toValue(),
      if (mergeStrategy != null) 'mergeStrategy': mergeStrategy.toValue(),
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

class StartMigrationResponse {
  /// The unique identifier that Amazon Lex assigned to the migration.
  final String? migrationId;

  /// The strategy used to conduct the migration.
  final MigrationStrategy? migrationStrategy;

  /// The date and time that the migration started.
  final DateTime? migrationTimestamp;

  /// The locale used for the Amazon Lex V1 bot.
  final Locale? v1BotLocale;

  /// The name of the Amazon Lex V1 bot that you are migrating to Amazon Lex V2.
  final String? v1BotName;

  /// The version of the bot to migrate to Amazon Lex V2.
  final String? v1BotVersion;

  /// The unique identifier for the Amazon Lex V2 bot.
  final String? v2BotId;

  /// The IAM role that Amazon Lex uses to run the Amazon Lex V2 bot.
  final String? v2BotRole;

  StartMigrationResponse({
    this.migrationId,
    this.migrationStrategy,
    this.migrationTimestamp,
    this.v1BotLocale,
    this.v1BotName,
    this.v1BotVersion,
    this.v2BotId,
    this.v2BotRole,
  });

  factory StartMigrationResponse.fromJson(Map<String, dynamic> json) {
    return StartMigrationResponse(
      migrationId: json['migrationId'] as String?,
      migrationStrategy:
          (json['migrationStrategy'] as String?)?.toMigrationStrategy(),
      migrationTimestamp: timeStampFromJson(json['migrationTimestamp']),
      v1BotLocale: (json['v1BotLocale'] as String?)?.toLocale(),
      v1BotName: json['v1BotName'] as String?,
      v1BotVersion: json['v1BotVersion'] as String?,
      v2BotId: json['v2BotId'] as String?,
      v2BotRole: json['v2BotRole'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final migrationId = this.migrationId;
    final migrationStrategy = this.migrationStrategy;
    final migrationTimestamp = this.migrationTimestamp;
    final v1BotLocale = this.v1BotLocale;
    final v1BotName = this.v1BotName;
    final v1BotVersion = this.v1BotVersion;
    final v2BotId = this.v2BotId;
    final v2BotRole = this.v2BotRole;
    return {
      if (migrationId != null) 'migrationId': migrationId,
      if (migrationStrategy != null)
        'migrationStrategy': migrationStrategy.toValue(),
      if (migrationTimestamp != null)
        'migrationTimestamp': unixTimestampToJson(migrationTimestamp),
      if (v1BotLocale != null) 'v1BotLocale': v1BotLocale.toValue(),
      if (v1BotName != null) 'v1BotName': v1BotName,
      if (v1BotVersion != null) 'v1BotVersion': v1BotVersion,
      if (v2BotId != null) 'v2BotId': v2BotId,
      if (v2BotRole != null) 'v2BotRole': v2BotRole,
    };
  }
}

/// A collection of messages that convey information to the user. At runtime,
/// Amazon Lex selects the message to convey.
class Statement {
  /// A collection of message objects.
  final List<Message> messages;

  /// At runtime, if the client is using the <a
  /// href="http://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostText.html">PostText</a>
  /// API, Amazon Lex includes the response card in the response. It substitutes
  /// all of the session attributes and slot values for placeholders in the
  /// response card.
  final String? responseCard;

  Statement({
    required this.messages,
    this.responseCard,
  });

  factory Statement.fromJson(Map<String, dynamic> json) {
    return Statement(
      messages: (json['messages'] as List)
          .whereNotNull()
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      responseCard: json['responseCard'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messages = this.messages;
    final responseCard = this.responseCard;
    return {
      'messages': messages,
      if (responseCard != null) 'responseCard': responseCard,
    };
  }
}

enum Status {
  building,
  ready,
  readyBasicTesting,
  failed,
  notBuilt,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.building:
        return 'BUILDING';
      case Status.ready:
        return 'READY';
      case Status.readyBasicTesting:
        return 'READY_BASIC_TESTING';
      case Status.failed:
        return 'FAILED';
      case Status.notBuilt:
        return 'NOT_BUILT';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'BUILDING':
        return Status.building;
      case 'READY':
        return Status.ready;
      case 'READY_BASIC_TESTING':
        return Status.readyBasicTesting;
      case 'FAILED':
        return Status.failed;
      case 'NOT_BUILT':
        return Status.notBuilt;
    }
    throw Exception('$this is not known in enum Status');
  }
}

enum StatusType {
  detected,
  missed,
}

extension StatusTypeValueExtension on StatusType {
  String toValue() {
    switch (this) {
      case StatusType.detected:
        return 'Detected';
      case StatusType.missed:
        return 'Missed';
    }
  }
}

extension StatusTypeFromString on String {
  StatusType toStatusType() {
    switch (this) {
      case 'Detected':
        return StatusType.detected;
      case 'Missed':
        return StatusType.missed;
    }
    throw Exception('$this is not known in enum StatusType');
  }
}

/// A list of key/value pairs that identify a bot, bot alias, or bot channel.
/// Tag keys and values can consist of Unicode letters, digits, white space, and
/// any of the following symbols: _ . : / = + - @.
class Tag {
  /// The key for the tag. Keys are not case-sensitive and must be unique.
  final String key;

  /// The value associated with a key. The value may be an empty string but it
  /// can't be null.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides information about a single utterance that was made to your bot.
class UtteranceData {
  /// The number of times that the utterance was processed.
  final int? count;

  /// The total number of individuals that used the utterance.
  final int? distinctUsers;

  /// The date that the utterance was first recorded.
  final DateTime? firstUtteredDate;

  /// The date that the utterance was last recorded.
  final DateTime? lastUtteredDate;

  /// The text that was entered by the user or the text representation of an audio
  /// clip.
  final String? utteranceString;

  UtteranceData({
    this.count,
    this.distinctUsers,
    this.firstUtteredDate,
    this.lastUtteredDate,
    this.utteranceString,
  });

  factory UtteranceData.fromJson(Map<String, dynamic> json) {
    return UtteranceData(
      count: json['count'] as int?,
      distinctUsers: json['distinctUsers'] as int?,
      firstUtteredDate: timeStampFromJson(json['firstUtteredDate']),
      lastUtteredDate: timeStampFromJson(json['lastUtteredDate']),
      utteranceString: json['utteranceString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final distinctUsers = this.distinctUsers;
    final firstUtteredDate = this.firstUtteredDate;
    final lastUtteredDate = this.lastUtteredDate;
    final utteranceString = this.utteranceString;
    return {
      if (count != null) 'count': count,
      if (distinctUsers != null) 'distinctUsers': distinctUsers,
      if (firstUtteredDate != null)
        'firstUtteredDate': unixTimestampToJson(firstUtteredDate),
      if (lastUtteredDate != null)
        'lastUtteredDate': unixTimestampToJson(lastUtteredDate),
      if (utteranceString != null) 'utteranceString': utteranceString,
    };
  }
}

/// Provides a list of utterances that have been made to a specific version of
/// your bot. The list contains a maximum of 100 utterances.
class UtteranceList {
  /// The version of the bot that processed the list.
  final String? botVersion;

  /// One or more <a>UtteranceData</a> objects that contain information about the
  /// utterances that have been made to a bot. The maximum number of object is
  /// 100.
  final List<UtteranceData>? utterances;

  UtteranceList({
    this.botVersion,
    this.utterances,
  });

  factory UtteranceList.fromJson(Map<String, dynamic> json) {
    return UtteranceList(
      botVersion: json['botVersion'] as String?,
      utterances: (json['utterances'] as List?)
          ?.whereNotNull()
          .map((e) => UtteranceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final botVersion = this.botVersion;
    final utterances = this.utterances;
    return {
      if (botVersion != null) 'botVersion': botVersion,
      if (utterances != null) 'utterances': utterances,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class PreconditionFailedException extends _s.GenericAwsException {
  PreconditionFailedException({String? type, String? message})
      : super(
            type: type, code: 'PreconditionFailedException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
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
