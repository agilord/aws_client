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

/// The Amplify UI Builder API provides a programmatic interface for creating
/// and configuring user interface (UI) component libraries and themes for use
/// in your Amplify applications. You can then connect these UI components to an
/// application's backend Amazon Web Services resources.
///
/// You can also use the Amplify Studio visual designer to create UI components
/// and model data for an app. For more information, see <a
/// href="https://docs.amplify.aws/console/adminui/intro">Introduction</a> in
/// the <i>Amplify Docs</i>.
///
/// The Amplify Framework is a comprehensive set of SDKs, libraries, tools, and
/// documentation for client app development. For more information, see the <a
/// href="https://docs.amplify.aws/">Amplify Framework</a>. For more information
/// about deploying an Amplify application to Amazon Web Services, see the <a
/// href="https://docs.aws.amazon.com/amplify/latest/userguide/welcome.html">Amplify
/// User Guide</a>.
class AmplifyUIBuilder {
  final _s.RestJsonProtocol _protocol;
  AmplifyUIBuilder({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'amplifyuibuilder',
            signingName: 'amplifyuibuilder',
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

  /// Creates a new component for an Amplify app.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app to associate with the component.
  ///
  /// Parameter [componentToCreate] :
  /// Represents the configuration of the component to create.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  Future<CreateComponentResponse> createComponent({
    required String appId,
    required CreateComponentData componentToCreate,
    required String environmentName,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.sendRaw(
      payload: componentToCreate,
      method: 'POST',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/components',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateComponentResponse(
      entity: Component.fromJson($json),
    );
  }

  /// Creates a new form for an Amplify app.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app to associate with the form.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [formToCreate] :
  /// Represents the configuration of the form to create.
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  Future<CreateFormResponse> createForm({
    required String appId,
    required String environmentName,
    required CreateFormData formToCreate,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.sendRaw(
      payload: formToCreate,
      method: 'POST',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/forms',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateFormResponse(
      entity: Form.fromJson($json),
    );
  }

  /// Creates a theme to apply to the components in an Amplify app.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app associated with the theme.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [themeToCreate] :
  /// Represents the configuration of the theme to create.
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  Future<CreateThemeResponse> createTheme({
    required String appId,
    required String environmentName,
    required CreateThemeData themeToCreate,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.sendRaw(
      payload: themeToCreate,
      method: 'POST',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/themes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateThemeResponse(
      entity: Theme.fromJson($json),
    );
  }

  /// Deletes a component from an Amplify app.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app associated with the component to delete.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [id] :
  /// The unique ID of the component to delete.
  Future<void> deleteComponent({
    required String appId,
    required String environmentName,
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/components/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a form from an Amplify app.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app associated with the form to delete.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [id] :
  /// The unique ID of the form to delete.
  Future<void> deleteForm({
    required String appId,
    required String environmentName,
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/forms/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a theme from an Amplify app.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app associated with the theme to delete.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [id] :
  /// The unique ID of the theme to delete.
  Future<void> deleteTheme({
    required String appId,
    required String environmentName,
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/themes/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This is for internal use.
  /// </note>
  /// Amplify uses this action to exchange an access code for a token.
  ///
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [provider] :
  /// The third-party provider for the token. The only valid value is
  /// <code>figma</code>.
  ///
  /// Parameter [request] :
  /// Describes the configuration of the request.
  Future<ExchangeCodeForTokenResponse> exchangeCodeForToken({
    required TokenProviders provider,
    required ExchangeCodeForTokenRequestBody request,
  }) async {
    final response = await _protocol.send(
      payload: request,
      method: 'POST',
      requestUri: '/tokens/${Uri.encodeComponent(provider.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return ExchangeCodeForTokenResponse.fromJson(response);
  }

  /// Exports component configurations to code that is ready to integrate into
  /// an Amplify app.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app to export components to.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ExportComponentsResponse> exportComponents({
    required String appId,
    required String environmentName,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/export/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/components',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ExportComponentsResponse.fromJson(response);
  }

  /// Exports form configurations to code that is ready to integrate into an
  /// Amplify app.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app to export forms to.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ExportFormsResponse> exportForms({
    required String appId,
    required String environmentName,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/export/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/forms',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ExportFormsResponse.fromJson(response);
  }

  /// Exports theme configurations to code that is ready to integrate into an
  /// Amplify app.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app to export the themes to.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is part of the Amplify app.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ExportThemesResponse> exportThemes({
    required String appId,
    required String environmentName,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/export/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/themes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ExportThemesResponse.fromJson(response);
  }

  /// Returns an existing code generation job.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app associated with the code generation job.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app
  /// associated with the code generation job.
  ///
  /// Parameter [id] :
  /// The unique ID of the code generation job.
  Future<GetCodegenJobResponse> getCodegenJob({
    required String appId,
    required String environmentName,
    required String id,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/codegen-jobs/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetCodegenJobResponse(
      job: CodegenJob.fromJson($json),
    );
  }

  /// Returns an existing component for an Amplify app.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is part of the Amplify app.
  ///
  /// Parameter [id] :
  /// The unique ID of the component.
  Future<GetComponentResponse> getComponent({
    required String appId,
    required String environmentName,
    required String id,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/components/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetComponentResponse(
      component: Component.fromJson($json),
    );
  }

  /// Returns an existing form for an Amplify app.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is part of the Amplify app.
  ///
  /// Parameter [id] :
  /// The unique ID of the form.
  Future<GetFormResponse> getForm({
    required String appId,
    required String environmentName,
    required String id,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/forms/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetFormResponse(
      form: Form.fromJson($json),
    );
  }

  /// Returns existing metadata for an Amplify app.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is part of the Amplify app.
  Future<GetMetadataResponse> getMetadata({
    required String appId,
    required String environmentName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/metadata',
      exceptionFnMap: _exceptionFns,
    );
    return GetMetadataResponse.fromJson(response);
  }

  /// Returns an existing theme for an Amplify app.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appId] :
  /// The unique ID of the Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is part of the Amplify app.
  ///
  /// Parameter [id] :
  /// The unique ID for the theme.
  Future<GetThemeResponse> getTheme({
    required String appId,
    required String environmentName,
    required String id,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/themes/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetThemeResponse(
      theme: Theme.fromJson($json),
    );
  }

  /// Retrieves a list of code generation jobs for a specified Amplify app and
  /// backend environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [appId] :
  /// The unique ID for the Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of jobs to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListCodegenJobsResponse> listCodegenJobs({
    required String appId,
    required String environmentName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/codegen-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCodegenJobsResponse.fromJson(response);
  }

  /// Retrieves a list of components for a specified Amplify app and backend
  /// environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID for the Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of components to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListComponentsResponse> listComponents({
    required String appId,
    required String environmentName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/components',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListComponentsResponse.fromJson(response);
  }

  /// Retrieves a list of forms for a specified Amplify app and backend
  /// environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID for the Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of forms to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListFormsResponse> listForms({
    required String appId,
    required String environmentName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/forms',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFormsResponse.fromJson(response);
  }

  /// Returns a list of tags for a specified Amazon Resource Name (ARN).
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) to use to list tags.
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

  /// Retrieves a list of themes for a specified Amplify app and backend
  /// environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID for the Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of theme results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListThemesResponse> listThemes({
    required String appId,
    required String environmentName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/themes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThemesResponse.fromJson(response);
  }

  /// Stores the metadata information about a feature on a form.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID for the Amplify app.
  ///
  /// Parameter [body] :
  /// The metadata information to store.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is part of the Amplify app.
  ///
  /// Parameter [featureName] :
  /// The name of the feature associated with the metadata.
  Future<void> putMetadataFlag({
    required String appId,
    required PutMetadataFlagBody body,
    required String environmentName,
    required String featureName,
  }) async {
    await _protocol.send(
      payload: body,
      method: 'PUT',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/metadata/features/${Uri.encodeComponent(featureName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This is for internal use.
  /// </note>
  /// Amplify uses this action to refresh a previously issued access token that
  /// might have expired.
  ///
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [provider] :
  /// The third-party provider for the token. The only valid value is
  /// <code>figma</code>.
  ///
  /// Parameter [refreshTokenBody] :
  /// Information about the refresh token request.
  Future<RefreshTokenResponse> refreshToken({
    required TokenProviders provider,
    required RefreshTokenRequestBody refreshTokenBody,
  }) async {
    final response = await _protocol.send(
      payload: refreshTokenBody,
      method: 'POST',
      requestUri: '/tokens/${Uri.encodeComponent(provider.toValue())}/refresh',
      exceptionFnMap: _exceptionFns,
    );
    return RefreshTokenResponse.fromJson(response);
  }

  /// Starts a code generation job for a specified Amplify app and backend
  /// environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [appId] :
  /// The unique ID for the Amplify app.
  ///
  /// Parameter [codegenJobToCreate] :
  /// The code generation job resource configuration.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is a part of the Amplify app.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token used to ensure that the code generation job request
  /// completes only once.
  Future<StartCodegenJobResponse> startCodegenJob({
    required String appId,
    required StartCodegenJobData codegenJobToCreate,
    required String environmentName,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.sendRaw(
      payload: codegenJobToCreate,
      method: 'POST',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/codegen-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return StartCodegenJobResponse(
      entity: CodegenJob.fromJson($json),
    );
  }

  /// Tags the resource with a tag key and value.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) to use to tag a resource.
  ///
  /// Parameter [tags] :
  /// A list of tag key value pairs for a specified Amazon Resource Name (ARN).
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
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

  /// Untags a resource with a specified Amazon Resource Name (ARN).
  ///
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) to use to untag a resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to use to untag a resource.
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

  /// Updates an existing component.
  ///
  /// May throw [ResourceConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID for the Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is part of the Amplify app.
  ///
  /// Parameter [id] :
  /// The unique ID for the component.
  ///
  /// Parameter [updatedComponent] :
  /// The configuration of the updated component.
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  Future<UpdateComponentResponse> updateComponent({
    required String appId,
    required String environmentName,
    required String id,
    required UpdateComponentData updatedComponent,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.sendRaw(
      payload: updatedComponent,
      method: 'PATCH',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/components/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateComponentResponse(
      entity: Component.fromJson($json),
    );
  }

  /// Updates an existing form.
  ///
  /// May throw [ResourceConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID for the Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is part of the Amplify app.
  ///
  /// Parameter [id] :
  /// The unique ID for the form.
  ///
  /// Parameter [updatedForm] :
  /// The request accepts the following data in JSON format.
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  Future<UpdateFormResponse> updateForm({
    required String appId,
    required String environmentName,
    required String id,
    required UpdateFormData updatedForm,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.sendRaw(
      payload: updatedForm,
      method: 'PATCH',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/forms/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateFormResponse(
      entity: Form.fromJson($json),
    );
  }

  /// Updates an existing theme.
  ///
  /// May throw [ResourceConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [appId] :
  /// The unique ID for the Amplify app.
  ///
  /// Parameter [environmentName] :
  /// The name of the backend environment that is part of the Amplify app.
  ///
  /// Parameter [id] :
  /// The unique ID for the theme.
  ///
  /// Parameter [updatedTheme] :
  /// The configuration of the updated theme.
  ///
  /// Parameter [clientToken] :
  /// The unique client token.
  Future<UpdateThemeResponse> updateTheme({
    required String appId,
    required String environmentName,
    required String id,
    required UpdateThemeData updatedTheme,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.sendRaw(
      payload: updatedTheme,
      method: 'PATCH',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/themes/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateThemeResponse(
      entity: Theme.fromJson($json),
    );
  }
}

/// Represents the event action configuration for an element of a
/// <code>Component</code> or <code>ComponentChild</code>. Use for the workflow
/// feature in Amplify Studio that allows you to bind events and actions to
/// components. <code>ActionParameters</code> defines the action that is
/// performed when an event occurs on the component.
class ActionParameters {
  /// The HTML anchor link to the location to open. Specify this value for a
  /// navigation action.
  final ComponentProperty? anchor;

  /// A dictionary of key-value pairs mapping Amplify Studio properties to fields
  /// in a data model. Use when the action performs an operation on an Amplify
  /// DataStore model.
  final Map<String, ComponentProperty>? fields;

  /// Specifies whether the user should be signed out globally. Specify this value
  /// for an auth sign out action.
  final ComponentProperty? global;

  /// The unique ID of the component that the <code>ActionParameters</code> apply
  /// to.
  final ComponentProperty? id;

  /// The name of the data model. Use when the action performs an operation on an
  /// Amplify DataStore model.
  final String? model;

  /// A key-value pair that specifies the state property name and its initial
  /// value.
  final MutationActionSetStateParameter? state;

  /// The element within the same component to modify when the action occurs.
  final ComponentProperty? target;

  /// The type of navigation action. Valid values are <code>url</code> and
  /// <code>anchor</code>. This value is required for a navigation action.
  final ComponentProperty? type;

  /// The URL to the location to open. Specify this value for a navigation action.
  final ComponentProperty? url;

  ActionParameters({
    this.anchor,
    this.fields,
    this.global,
    this.id,
    this.model,
    this.state,
    this.target,
    this.type,
    this.url,
  });

  factory ActionParameters.fromJson(Map<String, dynamic> json) {
    return ActionParameters(
      anchor: json['anchor'] != null
          ? ComponentProperty.fromJson(json['anchor'] as Map<String, dynamic>)
          : null,
      fields: (json['fields'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ComponentProperty.fromJson(e as Map<String, dynamic>))),
      global: json['global'] != null
          ? ComponentProperty.fromJson(json['global'] as Map<String, dynamic>)
          : null,
      id: json['id'] != null
          ? ComponentProperty.fromJson(json['id'] as Map<String, dynamic>)
          : null,
      model: json['model'] as String?,
      state: json['state'] != null
          ? MutationActionSetStateParameter.fromJson(
              json['state'] as Map<String, dynamic>)
          : null,
      target: json['target'] != null
          ? ComponentProperty.fromJson(json['target'] as Map<String, dynamic>)
          : null,
      type: json['type'] != null
          ? ComponentProperty.fromJson(json['type'] as Map<String, dynamic>)
          : null,
      url: json['url'] != null
          ? ComponentProperty.fromJson(json['url'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final anchor = this.anchor;
    final fields = this.fields;
    final global = this.global;
    final id = this.id;
    final model = this.model;
    final state = this.state;
    final target = this.target;
    final type = this.type;
    final url = this.url;
    return {
      if (anchor != null) 'anchor': anchor,
      if (fields != null) 'fields': fields,
      if (global != null) 'global': global,
      if (id != null) 'id': id,
      if (model != null) 'model': model,
      if (state != null) 'state': state,
      if (target != null) 'target': target,
      if (type != null) 'type': type,
      if (url != null) 'url': url,
    };
  }
}

/// Describes the API configuration for a code generation job.
class ApiConfiguration {
  /// The configuration for an application using DataStore APIs.
  final DataStoreRenderConfig? dataStoreConfig;

  /// The configuration for an application using GraphQL APIs.
  final GraphQLRenderConfig? graphQLConfig;

  /// The configuration for an application with no API being used.
  final NoApiRenderConfig? noApiConfig;

  ApiConfiguration({
    this.dataStoreConfig,
    this.graphQLConfig,
    this.noApiConfig,
  });

  factory ApiConfiguration.fromJson(Map<String, dynamic> json) {
    return ApiConfiguration(
      dataStoreConfig: json['dataStoreConfig'] != null
          ? DataStoreRenderConfig.fromJson(
              json['dataStoreConfig'] as Map<String, dynamic>)
          : null,
      graphQLConfig: json['graphQLConfig'] != null
          ? GraphQLRenderConfig.fromJson(
              json['graphQLConfig'] as Map<String, dynamic>)
          : null,
      noApiConfig: json['noApiConfig'] != null
          ? NoApiRenderConfig.fromJson(
              json['noApiConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataStoreConfig = this.dataStoreConfig;
    final graphQLConfig = this.graphQLConfig;
    final noApiConfig = this.noApiConfig;
    return {
      if (dataStoreConfig != null) 'dataStoreConfig': dataStoreConfig,
      if (graphQLConfig != null) 'graphQLConfig': graphQLConfig,
      if (noApiConfig != null) 'noApiConfig': noApiConfig,
    };
  }
}

/// Dependency package that may be required for the project code to run.
class CodegenDependency {
  /// Determines if the dependency package is using Semantic versioning. If set to
  /// true, it indicates that the dependency package uses Semantic versioning.
  final bool? isSemVer;

  /// Name of the dependency package.
  final String? name;

  /// Indicates the reason to include the dependency package in your project code.
  final String? reason;

  /// Indicates the version of the supported dependency package.
  final String? supportedVersion;

  CodegenDependency({
    this.isSemVer,
    this.name,
    this.reason,
    this.supportedVersion,
  });

  factory CodegenDependency.fromJson(Map<String, dynamic> json) {
    return CodegenDependency(
      isSemVer: json['isSemVer'] as bool?,
      name: json['name'] as String?,
      reason: json['reason'] as String?,
      supportedVersion: json['supportedVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isSemVer = this.isSemVer;
    final name = this.name;
    final reason = this.reason;
    final supportedVersion = this.supportedVersion;
    return {
      if (isSemVer != null) 'isSemVer': isSemVer,
      if (name != null) 'name': name,
      if (reason != null) 'reason': reason,
      if (supportedVersion != null) 'supportedVersion': supportedVersion,
    };
  }
}

/// Describes the feature flags that you can specify for a code generation job.
class CodegenFeatureFlags {
  /// Specifies whether a code generation job supports non models.
  final bool? isNonModelSupported;

  /// Specifes whether a code generation job supports data relationships.
  final bool? isRelationshipSupported;

  CodegenFeatureFlags({
    this.isNonModelSupported,
    this.isRelationshipSupported,
  });

  factory CodegenFeatureFlags.fromJson(Map<String, dynamic> json) {
    return CodegenFeatureFlags(
      isNonModelSupported: json['isNonModelSupported'] as bool?,
      isRelationshipSupported: json['isRelationshipSupported'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final isNonModelSupported = this.isNonModelSupported;
    final isRelationshipSupported = this.isRelationshipSupported;
    return {
      if (isNonModelSupported != null)
        'isNonModelSupported': isNonModelSupported,
      if (isRelationshipSupported != null)
        'isRelationshipSupported': isRelationshipSupported,
    };
  }
}

/// Describes the enums in a generic data schema.
class CodegenGenericDataEnum {
  /// The list of enum values in the generic data schema.
  final List<String> values;

  CodegenGenericDataEnum({
    required this.values,
  });

  factory CodegenGenericDataEnum.fromJson(Map<String, dynamic> json) {
    return CodegenGenericDataEnum(
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final values = this.values;
    return {
      'values': values,
    };
  }
}

/// Describes a field in a generic data schema.
class CodegenGenericDataField {
  /// The data type for the generic data field.
  final CodegenGenericDataFieldDataType dataType;

  /// The value of the data type for the generic data field.
  final String dataTypeValue;

  /// Specifies whether the generic data field is an array.
  final bool isArray;

  /// Specifies whether the generic data field is read-only.
  final bool readOnly;

  /// Specifies whether the generic data field is required.
  final bool required;

  /// The relationship of the generic data schema.
  final CodegenGenericDataRelationshipType? relationship;

  CodegenGenericDataField({
    required this.dataType,
    required this.dataTypeValue,
    required this.isArray,
    required this.readOnly,
    required this.required,
    this.relationship,
  });

  factory CodegenGenericDataField.fromJson(Map<String, dynamic> json) {
    return CodegenGenericDataField(
      dataType:
          (json['dataType'] as String).toCodegenGenericDataFieldDataType(),
      dataTypeValue: json['dataTypeValue'] as String,
      isArray: json['isArray'] as bool,
      readOnly: json['readOnly'] as bool,
      required: json['required'] as bool,
      relationship: json['relationship'] != null
          ? CodegenGenericDataRelationshipType.fromJson(
              json['relationship'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final dataTypeValue = this.dataTypeValue;
    final isArray = this.isArray;
    final readOnly = this.readOnly;
    final required = this.required;
    final relationship = this.relationship;
    return {
      'dataType': dataType.toValue(),
      'dataTypeValue': dataTypeValue,
      'isArray': isArray,
      'readOnly': readOnly,
      'required': required,
      if (relationship != null) 'relationship': relationship,
    };
  }
}

enum CodegenGenericDataFieldDataType {
  id,
  string,
  int,
  float,
  awsDate,
  awsTime,
  awsDateTime,
  awsTimestamp,
  awsEmail,
  awsurl,
  awsIPAddress,
  boolean,
  awsjson,
  awsPhone,
  $enum,
  model,
  nonModel,
}

extension CodegenGenericDataFieldDataTypeValueExtension
    on CodegenGenericDataFieldDataType {
  String toValue() {
    switch (this) {
      case CodegenGenericDataFieldDataType.id:
        return 'ID';
      case CodegenGenericDataFieldDataType.string:
        return 'String';
      case CodegenGenericDataFieldDataType.int:
        return 'Int';
      case CodegenGenericDataFieldDataType.float:
        return 'Float';
      case CodegenGenericDataFieldDataType.awsDate:
        return 'AWSDate';
      case CodegenGenericDataFieldDataType.awsTime:
        return 'AWSTime';
      case CodegenGenericDataFieldDataType.awsDateTime:
        return 'AWSDateTime';
      case CodegenGenericDataFieldDataType.awsTimestamp:
        return 'AWSTimestamp';
      case CodegenGenericDataFieldDataType.awsEmail:
        return 'AWSEmail';
      case CodegenGenericDataFieldDataType.awsurl:
        return 'AWSURL';
      case CodegenGenericDataFieldDataType.awsIPAddress:
        return 'AWSIPAddress';
      case CodegenGenericDataFieldDataType.boolean:
        return 'Boolean';
      case CodegenGenericDataFieldDataType.awsjson:
        return 'AWSJSON';
      case CodegenGenericDataFieldDataType.awsPhone:
        return 'AWSPhone';
      case CodegenGenericDataFieldDataType.$enum:
        return 'Enum';
      case CodegenGenericDataFieldDataType.model:
        return 'Model';
      case CodegenGenericDataFieldDataType.nonModel:
        return 'NonModel';
    }
  }
}

extension CodegenGenericDataFieldDataTypeFromString on String {
  CodegenGenericDataFieldDataType toCodegenGenericDataFieldDataType() {
    switch (this) {
      case 'ID':
        return CodegenGenericDataFieldDataType.id;
      case 'String':
        return CodegenGenericDataFieldDataType.string;
      case 'Int':
        return CodegenGenericDataFieldDataType.int;
      case 'Float':
        return CodegenGenericDataFieldDataType.float;
      case 'AWSDate':
        return CodegenGenericDataFieldDataType.awsDate;
      case 'AWSTime':
        return CodegenGenericDataFieldDataType.awsTime;
      case 'AWSDateTime':
        return CodegenGenericDataFieldDataType.awsDateTime;
      case 'AWSTimestamp':
        return CodegenGenericDataFieldDataType.awsTimestamp;
      case 'AWSEmail':
        return CodegenGenericDataFieldDataType.awsEmail;
      case 'AWSURL':
        return CodegenGenericDataFieldDataType.awsurl;
      case 'AWSIPAddress':
        return CodegenGenericDataFieldDataType.awsIPAddress;
      case 'Boolean':
        return CodegenGenericDataFieldDataType.boolean;
      case 'AWSJSON':
        return CodegenGenericDataFieldDataType.awsjson;
      case 'AWSPhone':
        return CodegenGenericDataFieldDataType.awsPhone;
      case 'Enum':
        return CodegenGenericDataFieldDataType.$enum;
      case 'Model':
        return CodegenGenericDataFieldDataType.model;
      case 'NonModel':
        return CodegenGenericDataFieldDataType.nonModel;
    }
    throw Exception(
        '$this is not known in enum CodegenGenericDataFieldDataType');
  }
}

/// Describes a model in a generic data schema.
class CodegenGenericDataModel {
  /// The fields in the generic data model.
  final Map<String, CodegenGenericDataField> fields;

  /// The primary keys of the generic data model.
  final List<String> primaryKeys;

  /// Specifies whether the generic data model is a join table.
  final bool? isJoinTable;

  CodegenGenericDataModel({
    required this.fields,
    required this.primaryKeys,
    this.isJoinTable,
  });

  factory CodegenGenericDataModel.fromJson(Map<String, dynamic> json) {
    return CodegenGenericDataModel(
      fields: (json['fields'] as Map<String, dynamic>).map((k, e) => MapEntry(
          k, CodegenGenericDataField.fromJson(e as Map<String, dynamic>))),
      primaryKeys: (json['primaryKeys'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      isJoinTable: json['isJoinTable'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final primaryKeys = this.primaryKeys;
    final isJoinTable = this.isJoinTable;
    return {
      'fields': fields,
      'primaryKeys': primaryKeys,
      if (isJoinTable != null) 'isJoinTable': isJoinTable,
    };
  }
}

/// Describes a non-model in a generic data schema.
class CodegenGenericDataNonModel {
  /// The fields in a generic data schema non model.
  final Map<String, CodegenGenericDataField> fields;

  CodegenGenericDataNonModel({
    required this.fields,
  });

  factory CodegenGenericDataNonModel.fromJson(Map<String, dynamic> json) {
    return CodegenGenericDataNonModel(
      fields: (json['fields'] as Map<String, dynamic>).map((k, e) => MapEntry(
          k, CodegenGenericDataField.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    return {
      'fields': fields,
    };
  }
}

/// Describes the relationship between generic data models.
class CodegenGenericDataRelationshipType {
  /// The name of the related model in the data relationship.
  final String relatedModelName;

  /// The data relationship type.
  final GenericDataRelationshipType type;

  /// The associated fields of the data relationship.
  final List<String>? associatedFields;

  /// The value of the <code>belongsTo</code> field on the related data model.
  final String? belongsToFieldOnRelatedModel;

  /// Specifies whether the relationship can unlink the associated model.
  final bool? canUnlinkAssociatedModel;

  /// Specifies whether the <code>@index</code> directive is supported for a
  /// <code>hasMany</code> data relationship.
  final bool? isHasManyIndex;

  /// The name of the related join field in the data relationship.
  final String? relatedJoinFieldName;

  /// The name of the related join table in the data relationship.
  final String? relatedJoinTableName;

  /// The related model fields in the data relationship.
  final List<String>? relatedModelFields;

  CodegenGenericDataRelationshipType({
    required this.relatedModelName,
    required this.type,
    this.associatedFields,
    this.belongsToFieldOnRelatedModel,
    this.canUnlinkAssociatedModel,
    this.isHasManyIndex,
    this.relatedJoinFieldName,
    this.relatedJoinTableName,
    this.relatedModelFields,
  });

  factory CodegenGenericDataRelationshipType.fromJson(
      Map<String, dynamic> json) {
    return CodegenGenericDataRelationshipType(
      relatedModelName: json['relatedModelName'] as String,
      type: (json['type'] as String).toGenericDataRelationshipType(),
      associatedFields: (json['associatedFields'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      belongsToFieldOnRelatedModel:
          json['belongsToFieldOnRelatedModel'] as String?,
      canUnlinkAssociatedModel: json['canUnlinkAssociatedModel'] as bool?,
      isHasManyIndex: json['isHasManyIndex'] as bool?,
      relatedJoinFieldName: json['relatedJoinFieldName'] as String?,
      relatedJoinTableName: json['relatedJoinTableName'] as String?,
      relatedModelFields: (json['relatedModelFields'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final relatedModelName = this.relatedModelName;
    final type = this.type;
    final associatedFields = this.associatedFields;
    final belongsToFieldOnRelatedModel = this.belongsToFieldOnRelatedModel;
    final canUnlinkAssociatedModel = this.canUnlinkAssociatedModel;
    final isHasManyIndex = this.isHasManyIndex;
    final relatedJoinFieldName = this.relatedJoinFieldName;
    final relatedJoinTableName = this.relatedJoinTableName;
    final relatedModelFields = this.relatedModelFields;
    return {
      'relatedModelName': relatedModelName,
      'type': type.toValue(),
      if (associatedFields != null) 'associatedFields': associatedFields,
      if (belongsToFieldOnRelatedModel != null)
        'belongsToFieldOnRelatedModel': belongsToFieldOnRelatedModel,
      if (canUnlinkAssociatedModel != null)
        'canUnlinkAssociatedModel': canUnlinkAssociatedModel,
      if (isHasManyIndex != null) 'isHasManyIndex': isHasManyIndex,
      if (relatedJoinFieldName != null)
        'relatedJoinFieldName': relatedJoinFieldName,
      if (relatedJoinTableName != null)
        'relatedJoinTableName': relatedJoinTableName,
      if (relatedModelFields != null) 'relatedModelFields': relatedModelFields,
    };
  }
}

/// Describes the configuration for a code generation job that is associated
/// with an Amplify app.
class CodegenJob {
  /// The ID of the Amplify app associated with the code generation job.
  final String appId;

  /// The name of the backend environment associated with the code generation job.
  final String environmentName;

  /// The unique ID for the code generation job.
  final String id;

  /// The <code>CodegenJobAsset</code> to use for the code generation job.
  final CodegenJobAsset? asset;

  /// Specifies whether to autogenerate forms in the code generation job.
  final bool? autoGenerateForms;

  /// The time that the code generation job was created.
  final DateTime? createdAt;

  /// Lists the dependency packages that may be required for the project code to
  /// run.
  final List<CodegenDependency>? dependencies;
  final CodegenFeatureFlags? features;
  final CodegenJobGenericDataSchema? genericDataSchema;

  /// The time that the code generation job was modified.
  final DateTime? modifiedAt;
  final CodegenJobRenderConfig? renderConfig;

  /// The status of the code generation job.
  final CodegenJobStatus? status;

  /// The customized status message for the code generation job.
  final String? statusMessage;

  /// One or more key-value pairs to use when tagging the code generation job.
  final Map<String, String>? tags;

  CodegenJob({
    required this.appId,
    required this.environmentName,
    required this.id,
    this.asset,
    this.autoGenerateForms,
    this.createdAt,
    this.dependencies,
    this.features,
    this.genericDataSchema,
    this.modifiedAt,
    this.renderConfig,
    this.status,
    this.statusMessage,
    this.tags,
  });

  factory CodegenJob.fromJson(Map<String, dynamic> json) {
    return CodegenJob(
      appId: json['appId'] as String,
      environmentName: json['environmentName'] as String,
      id: json['id'] as String,
      asset: json['asset'] != null
          ? CodegenJobAsset.fromJson(json['asset'] as Map<String, dynamic>)
          : null,
      autoGenerateForms: json['autoGenerateForms'] as bool?,
      createdAt: timeStampFromJson(json['createdAt']),
      dependencies: (json['dependencies'] as List?)
          ?.whereNotNull()
          .map((e) => CodegenDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      features: json['features'] != null
          ? CodegenFeatureFlags.fromJson(
              json['features'] as Map<String, dynamic>)
          : null,
      genericDataSchema: json['genericDataSchema'] != null
          ? CodegenJobGenericDataSchema.fromJson(
              json['genericDataSchema'] as Map<String, dynamic>)
          : null,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      renderConfig: json['renderConfig'] != null
          ? CodegenJobRenderConfig.fromJson(
              json['renderConfig'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toCodegenJobStatus(),
      statusMessage: json['statusMessage'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final environmentName = this.environmentName;
    final id = this.id;
    final asset = this.asset;
    final autoGenerateForms = this.autoGenerateForms;
    final createdAt = this.createdAt;
    final dependencies = this.dependencies;
    final features = this.features;
    final genericDataSchema = this.genericDataSchema;
    final modifiedAt = this.modifiedAt;
    final renderConfig = this.renderConfig;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    return {
      'appId': appId,
      'environmentName': environmentName,
      'id': id,
      if (asset != null) 'asset': asset,
      if (autoGenerateForms != null) 'autoGenerateForms': autoGenerateForms,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (dependencies != null) 'dependencies': dependencies,
      if (features != null) 'features': features,
      if (genericDataSchema != null) 'genericDataSchema': genericDataSchema,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (renderConfig != null) 'renderConfig': renderConfig,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes an asset for a code generation job.
class CodegenJobAsset {
  /// The URL to use to access the asset.
  final String? downloadUrl;

  CodegenJobAsset({
    this.downloadUrl,
  });

  factory CodegenJobAsset.fromJson(Map<String, dynamic> json) {
    return CodegenJobAsset(
      downloadUrl: json['downloadUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final downloadUrl = this.downloadUrl;
    return {
      if (downloadUrl != null) 'downloadUrl': downloadUrl,
    };
  }
}

/// Describes the data schema for a code generation job.
class CodegenJobGenericDataSchema {
  /// The type of the data source for the schema. Currently, the only valid value
  /// is an Amplify <code>DataStore</code>.
  final CodegenJobGenericDataSourceType dataSourceType;

  /// The name of a <code>CodegenGenericDataEnum</code>.
  final Map<String, CodegenGenericDataEnum> enums;

  /// The name of a <code>CodegenGenericDataModel</code>.
  final Map<String, CodegenGenericDataModel> models;

  /// The name of a <code>CodegenGenericDataNonModel</code>.
  final Map<String, CodegenGenericDataNonModel> nonModels;

  CodegenJobGenericDataSchema({
    required this.dataSourceType,
    required this.enums,
    required this.models,
    required this.nonModels,
  });

  factory CodegenJobGenericDataSchema.fromJson(Map<String, dynamic> json) {
    return CodegenJobGenericDataSchema(
      dataSourceType: (json['dataSourceType'] as String)
          .toCodegenJobGenericDataSourceType(),
      enums: (json['enums'] as Map<String, dynamic>).map((k, e) => MapEntry(
          k, CodegenGenericDataEnum.fromJson(e as Map<String, dynamic>))),
      models: (json['models'] as Map<String, dynamic>).map((k, e) => MapEntry(
          k, CodegenGenericDataModel.fromJson(e as Map<String, dynamic>))),
      nonModels: (json['nonModels'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k,
              CodegenGenericDataNonModel.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceType = this.dataSourceType;
    final enums = this.enums;
    final models = this.models;
    final nonModels = this.nonModels;
    return {
      'dataSourceType': dataSourceType.toValue(),
      'enums': enums,
      'models': models,
      'nonModels': nonModels,
    };
  }
}

enum CodegenJobGenericDataSourceType {
  dataStore,
}

extension CodegenJobGenericDataSourceTypeValueExtension
    on CodegenJobGenericDataSourceType {
  String toValue() {
    switch (this) {
      case CodegenJobGenericDataSourceType.dataStore:
        return 'DataStore';
    }
  }
}

extension CodegenJobGenericDataSourceTypeFromString on String {
  CodegenJobGenericDataSourceType toCodegenJobGenericDataSourceType() {
    switch (this) {
      case 'DataStore':
        return CodegenJobGenericDataSourceType.dataStore;
    }
    throw Exception(
        '$this is not known in enum CodegenJobGenericDataSourceType');
  }
}

/// Describes the configuration information for rendering the UI component
/// associated with the code generation job.
class CodegenJobRenderConfig {
  /// The name of the <code>ReactStartCodegenJobData</code> object.
  final ReactStartCodegenJobData? react;

  CodegenJobRenderConfig({
    this.react,
  });

  factory CodegenJobRenderConfig.fromJson(Map<String, dynamic> json) {
    return CodegenJobRenderConfig(
      react: json['react'] != null
          ? ReactStartCodegenJobData.fromJson(
              json['react'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final react = this.react;
    return {
      if (react != null) 'react': react,
    };
  }
}

enum CodegenJobStatus {
  inProgress,
  failed,
  succeeded,
}

extension CodegenJobStatusValueExtension on CodegenJobStatus {
  String toValue() {
    switch (this) {
      case CodegenJobStatus.inProgress:
        return 'in_progress';
      case CodegenJobStatus.failed:
        return 'failed';
      case CodegenJobStatus.succeeded:
        return 'succeeded';
    }
  }
}

extension CodegenJobStatusFromString on String {
  CodegenJobStatus toCodegenJobStatus() {
    switch (this) {
      case 'in_progress':
        return CodegenJobStatus.inProgress;
      case 'failed':
        return CodegenJobStatus.failed;
      case 'succeeded':
        return CodegenJobStatus.succeeded;
    }
    throw Exception('$this is not known in enum CodegenJobStatus');
  }
}

/// A summary of the basic information about the code generation job.
class CodegenJobSummary {
  /// The unique ID of the Amplify app associated with the code generation job.
  final String appId;

  /// The name of the backend environment associated with the code generation job.
  final String environmentName;

  /// The unique ID for the code generation job summary.
  final String id;

  /// The time that the code generation job summary was created.
  final DateTime? createdAt;

  /// The time that the code generation job summary was modified.
  final DateTime? modifiedAt;

  CodegenJobSummary({
    required this.appId,
    required this.environmentName,
    required this.id,
    this.createdAt,
    this.modifiedAt,
  });

  factory CodegenJobSummary.fromJson(Map<String, dynamic> json) {
    return CodegenJobSummary(
      appId: json['appId'] as String,
      environmentName: json['environmentName'] as String,
      id: json['id'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final environmentName = this.environmentName;
    final id = this.id;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    return {
      'appId': appId,
      'environmentName': environmentName,
      'id': id,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
    };
  }
}

/// Contains the configuration settings for a user interface (UI) element for an
/// Amplify app. A component is configured as a primary, stand-alone UI element.
/// Use <code>ComponentChild</code> to configure an instance of a
/// <code>Component</code>. A <code>ComponentChild</code> instance inherits the
/// configuration of the main <code>Component</code>.
class Component {
  /// The unique ID of the Amplify app associated with the component.
  final String appId;

  /// The information to connect a component's properties to data at runtime. You
  /// can't specify <code>tags</code> as a valid property for
  /// <code>bindingProperties</code>.
  /// <p/>
  final Map<String, ComponentBindingPropertiesValue> bindingProperties;

  /// The type of the component. This can be an Amplify custom UI component or
  /// another custom component.
  final String componentType;

  /// The time that the component was created.
  final DateTime createdAt;

  /// The name of the backend environment that is a part of the Amplify app.
  final String environmentName;

  /// The unique ID of the component.
  final String id;

  /// The name of the component.
  final String name;

  /// Describes the component's properties that can be overriden in a customized
  /// instance of the component. You can't specify <code>tags</code> as a valid
  /// property for <code>overrides</code>.
  final Map<String, Map<String, String>> overrides;

  /// Describes the component's properties. You can't specify <code>tags</code> as
  /// a valid property for <code>properties</code>.
  final Map<String, ComponentProperty> properties;

  /// A list of the component's variants. A variant is a unique style
  /// configuration of a main component.
  final List<ComponentVariant> variants;

  /// A list of the component's <code>ComponentChild</code> instances.
  final List<ComponentChild>? children;

  /// The data binding configuration for the component's properties. Use this for
  /// a collection component. You can't specify <code>tags</code> as a valid
  /// property for <code>collectionProperties</code>.
  final Map<String, ComponentDataConfiguration>? collectionProperties;

  /// Describes the events that can be raised on the component. Use for the
  /// workflow feature in Amplify Studio that allows you to bind events and
  /// actions to components.
  final Map<String, ComponentEvent>? events;

  /// The time that the component was modified.
  final DateTime? modifiedAt;

  /// The schema version of the component when it was imported.
  final String? schemaVersion;

  /// The unique ID of the component in its original source system, such as Figma.
  final String? sourceId;

  /// One or more key-value pairs to use when tagging the component.
  final Map<String, String>? tags;

  Component({
    required this.appId,
    required this.bindingProperties,
    required this.componentType,
    required this.createdAt,
    required this.environmentName,
    required this.id,
    required this.name,
    required this.overrides,
    required this.properties,
    required this.variants,
    this.children,
    this.collectionProperties,
    this.events,
    this.modifiedAt,
    this.schemaVersion,
    this.sourceId,
    this.tags,
  });

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      appId: json['appId'] as String,
      bindingProperties: (json['bindingProperties'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(
              k,
              ComponentBindingPropertiesValue.fromJson(
                  e as Map<String, dynamic>))),
      componentType: json['componentType'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      environmentName: json['environmentName'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      overrides: (json['overrides'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(
              k,
              (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))),
      properties: (json['properties'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, ComponentProperty.fromJson(e as Map<String, dynamic>))),
      variants: (json['variants'] as List)
          .whereNotNull()
          .map((e) => ComponentVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
      children: (json['children'] as List?)
          ?.whereNotNull()
          .map((e) => ComponentChild.fromJson(e as Map<String, dynamic>))
          .toList(),
      collectionProperties: (json['collectionProperties']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k,
              ComponentDataConfiguration.fromJson(e as Map<String, dynamic>))),
      events: (json['events'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ComponentEvent.fromJson(e as Map<String, dynamic>))),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      schemaVersion: json['schemaVersion'] as String?,
      sourceId: json['sourceId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final bindingProperties = this.bindingProperties;
    final componentType = this.componentType;
    final createdAt = this.createdAt;
    final environmentName = this.environmentName;
    final id = this.id;
    final name = this.name;
    final overrides = this.overrides;
    final properties = this.properties;
    final variants = this.variants;
    final children = this.children;
    final collectionProperties = this.collectionProperties;
    final events = this.events;
    final modifiedAt = this.modifiedAt;
    final schemaVersion = this.schemaVersion;
    final sourceId = this.sourceId;
    final tags = this.tags;
    return {
      'appId': appId,
      'bindingProperties': bindingProperties,
      'componentType': componentType,
      'createdAt': iso8601ToJson(createdAt),
      'environmentName': environmentName,
      'id': id,
      'name': name,
      'overrides': overrides,
      'properties': properties,
      'variants': variants,
      if (children != null) 'children': children,
      if (collectionProperties != null)
        'collectionProperties': collectionProperties,
      if (events != null) 'events': events,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (schemaVersion != null) 'schemaVersion': schemaVersion,
      if (sourceId != null) 'sourceId': sourceId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents the data binding configuration for a component at runtime. You
/// can use <code>ComponentBindingPropertiesValue</code> to add exposed
/// properties to a component to allow different values to be entered when a
/// component is reused in different places in an app.
class ComponentBindingPropertiesValue {
  /// Describes the properties to customize with data at runtime.
  final ComponentBindingPropertiesValueProperties? bindingProperties;

  /// The default value of the property.
  final String? defaultValue;

  /// The property type.
  final String? type;

  ComponentBindingPropertiesValue({
    this.bindingProperties,
    this.defaultValue,
    this.type,
  });

  factory ComponentBindingPropertiesValue.fromJson(Map<String, dynamic> json) {
    return ComponentBindingPropertiesValue(
      bindingProperties: json['bindingProperties'] != null
          ? ComponentBindingPropertiesValueProperties.fromJson(
              json['bindingProperties'] as Map<String, dynamic>)
          : null,
      defaultValue: json['defaultValue'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bindingProperties = this.bindingProperties;
    final defaultValue = this.defaultValue;
    final type = this.type;
    return {
      if (bindingProperties != null) 'bindingProperties': bindingProperties,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (type != null) 'type': type,
    };
  }
}

/// Represents the data binding configuration for a specific property using data
/// stored in Amazon Web Services. For Amazon Web Services connected properties,
/// you can bind a property to data stored in an Amazon S3 bucket, an Amplify
/// DataStore model or an authenticated user attribute.
class ComponentBindingPropertiesValueProperties {
  /// An Amazon S3 bucket.
  final String? bucket;

  /// The default value to assign to the property.
  final String? defaultValue;

  /// The field to bind the data to.
  final String? field;

  /// The storage key for an Amazon S3 bucket.
  final String? key;

  /// An Amplify DataStore model.
  final String? model;

  /// A list of predicates for binding a component's properties to data.
  final List<Predicate>? predicates;

  /// The name of a component slot.
  final String? slotName;

  /// An authenticated user attribute.
  final String? userAttribute;

  ComponentBindingPropertiesValueProperties({
    this.bucket,
    this.defaultValue,
    this.field,
    this.key,
    this.model,
    this.predicates,
    this.slotName,
    this.userAttribute,
  });

  factory ComponentBindingPropertiesValueProperties.fromJson(
      Map<String, dynamic> json) {
    return ComponentBindingPropertiesValueProperties(
      bucket: json['bucket'] as String?,
      defaultValue: json['defaultValue'] as String?,
      field: json['field'] as String?,
      key: json['key'] as String?,
      model: json['model'] as String?,
      predicates: (json['predicates'] as List?)
          ?.whereNotNull()
          .map((e) => Predicate.fromJson(e as Map<String, dynamic>))
          .toList(),
      slotName: json['slotName'] as String?,
      userAttribute: json['userAttribute'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final defaultValue = this.defaultValue;
    final field = this.field;
    final key = this.key;
    final model = this.model;
    final predicates = this.predicates;
    final slotName = this.slotName;
    final userAttribute = this.userAttribute;
    return {
      if (bucket != null) 'bucket': bucket,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (field != null) 'field': field,
      if (key != null) 'key': key,
      if (model != null) 'model': model,
      if (predicates != null) 'predicates': predicates,
      if (slotName != null) 'slotName': slotName,
      if (userAttribute != null) 'userAttribute': userAttribute,
    };
  }
}

/// A nested UI configuration within a parent <code>Component</code>.
class ComponentChild {
  /// The type of the child component.
  final String componentType;

  /// The name of the child component.
  final String name;

  /// Describes the properties of the child component. You can't specify
  /// <code>tags</code> as a valid property for <code>properties</code>.
  final Map<String, ComponentProperty> properties;

  /// The list of <code>ComponentChild</code> instances for this component.
  final List<ComponentChild>? children;

  /// Describes the events that can be raised on the child component. Use for the
  /// workflow feature in Amplify Studio that allows you to bind events and
  /// actions to components.
  final Map<String, ComponentEvent>? events;

  /// The unique ID of the child component in its original source system, such as
  /// Figma.
  final String? sourceId;

  ComponentChild({
    required this.componentType,
    required this.name,
    required this.properties,
    this.children,
    this.events,
    this.sourceId,
  });

  factory ComponentChild.fromJson(Map<String, dynamic> json) {
    return ComponentChild(
      componentType: json['componentType'] as String,
      name: json['name'] as String,
      properties: (json['properties'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, ComponentProperty.fromJson(e as Map<String, dynamic>))),
      children: (json['children'] as List?)
          ?.whereNotNull()
          .map((e) => ComponentChild.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ComponentEvent.fromJson(e as Map<String, dynamic>))),
      sourceId: json['sourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentType = this.componentType;
    final name = this.name;
    final properties = this.properties;
    final children = this.children;
    final events = this.events;
    final sourceId = this.sourceId;
    return {
      'componentType': componentType,
      'name': name,
      'properties': properties,
      if (children != null) 'children': children,
      if (events != null) 'events': events,
      if (sourceId != null) 'sourceId': sourceId,
    };
  }
}

/// Represents a conditional expression to set a component property. Use
/// <code>ComponentConditionProperty</code> to set a property to different
/// values conditionally, based on the value of another property.
class ComponentConditionProperty {
  /// The value to assign to the property if the condition is not met.
  final ComponentProperty? elseValue;

  /// The name of a field. Specify this when the property is a data model.
  final String? field;

  /// The value of the property to evaluate.
  final String? operand;

  /// The type of the property to evaluate.
  final String? operandType;

  /// The operator to use to perform the evaluation, such as <code>eq</code> to
  /// represent equals.
  final String? operator;

  /// The name of the conditional property.
  final String? property;

  /// The value to assign to the property if the condition is met.
  final ComponentProperty? then;

  ComponentConditionProperty({
    this.elseValue,
    this.field,
    this.operand,
    this.operandType,
    this.operator,
    this.property,
    this.then,
  });

  factory ComponentConditionProperty.fromJson(Map<String, dynamic> json) {
    return ComponentConditionProperty(
      elseValue: json['else'] != null
          ? ComponentProperty.fromJson(json['else'] as Map<String, dynamic>)
          : null,
      field: json['field'] as String?,
      operand: json['operand'] as String?,
      operandType: json['operandType'] as String?,
      operator: json['operator'] as String?,
      property: json['property'] as String?,
      then: json['then'] != null
          ? ComponentProperty.fromJson(json['then'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final elseValue = this.elseValue;
    final field = this.field;
    final operand = this.operand;
    final operandType = this.operandType;
    final operator = this.operator;
    final property = this.property;
    final then = this.then;
    return {
      if (elseValue != null) 'else': elseValue,
      if (field != null) 'field': field,
      if (operand != null) 'operand': operand,
      if (operandType != null) 'operandType': operandType,
      if (operator != null) 'operator': operator,
      if (property != null) 'property': property,
      if (then != null) 'then': then,
    };
  }
}

/// Describes the configuration for binding a component's properties to data.
class ComponentDataConfiguration {
  /// The name of the data model to use to bind data to a component.
  final String model;

  /// A list of IDs to use to bind data to a component. Use this property to bind
  /// specifically chosen data, rather than data retrieved from a query.
  final List<String>? identifiers;

  /// Represents the conditional logic to use when binding data to a component.
  /// Use this property to retrieve only a subset of the data in a collection.
  final Predicate? predicate;

  /// Describes how to sort the component's properties.
  final List<SortProperty>? sort;

  ComponentDataConfiguration({
    required this.model,
    this.identifiers,
    this.predicate,
    this.sort,
  });

  factory ComponentDataConfiguration.fromJson(Map<String, dynamic> json) {
    return ComponentDataConfiguration(
      model: json['model'] as String,
      identifiers: (json['identifiers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      predicate: json['predicate'] != null
          ? Predicate.fromJson(json['predicate'] as Map<String, dynamic>)
          : null,
      sort: (json['sort'] as List?)
          ?.whereNotNull()
          .map((e) => SortProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final model = this.model;
    final identifiers = this.identifiers;
    final predicate = this.predicate;
    final sort = this.sort;
    return {
      'model': model,
      if (identifiers != null) 'identifiers': identifiers,
      if (predicate != null) 'predicate': predicate,
      if (sort != null) 'sort': sort,
    };
  }
}

/// Describes the configuration of an event. You can bind an event and a
/// corresponding action to a <code>Component</code> or a
/// <code>ComponentChild</code>. A button click is an example of an event.
class ComponentEvent {
  /// The action to perform when a specific event is raised.
  final String? action;

  /// Binds an event to an action on a component. When you specify a
  /// <code>bindingEvent</code>, the event is called when the action is performed.
  final String? bindingEvent;

  /// Describes information about the action.
  final ActionParameters? parameters;

  ComponentEvent({
    this.action,
    this.bindingEvent,
    this.parameters,
  });

  factory ComponentEvent.fromJson(Map<String, dynamic> json) {
    return ComponentEvent(
      action: json['action'] as String?,
      bindingEvent: json['bindingEvent'] as String?,
      parameters: json['parameters'] != null
          ? ActionParameters.fromJson(
              json['parameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final bindingEvent = this.bindingEvent;
    final parameters = this.parameters;
    return {
      if (action != null) 'action': action,
      if (bindingEvent != null) 'bindingEvent': bindingEvent,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

/// Describes the configuration for all of a component's properties. Use
/// <code>ComponentProperty</code> to specify the values to render or bind by
/// default.
class ComponentProperty {
  /// The information to bind the component property to data at runtime.
  final ComponentPropertyBindingProperties? bindingProperties;

  /// The information to bind the component property to form data.
  final Map<String, FormBindingElement>? bindings;

  /// The information to bind the component property to data at runtime. Use this
  /// for collection components.
  final ComponentPropertyBindingProperties? collectionBindingProperties;

  /// The name of the component that is affected by an event.
  final String? componentName;

  /// A list of component properties to concatenate to create the value to assign
  /// to this component property.
  final List<ComponentProperty>? concat;

  /// The conditional expression to use to assign a value to the component
  /// property.
  final ComponentConditionProperty? condition;

  /// Specifies whether the user configured the property in Amplify Studio after
  /// importing it.
  final bool? configured;

  /// The default value to assign to the component property.
  final String? defaultValue;

  /// An event that occurs in your app. Use this for workflow data binding.
  final String? event;

  /// The default value assigned to the property when the component is imported
  /// into an app.
  final String? importedValue;

  /// The data model to use to assign a value to the component property.
  final String? model;

  /// The name of the component's property that is affected by an event.
  final String? property;

  /// The component type.
  final String? type;

  /// An authenticated user attribute to use to assign a value to the component
  /// property.
  final String? userAttribute;

  /// The value to assign to the component property.
  final String? value;

  ComponentProperty({
    this.bindingProperties,
    this.bindings,
    this.collectionBindingProperties,
    this.componentName,
    this.concat,
    this.condition,
    this.configured,
    this.defaultValue,
    this.event,
    this.importedValue,
    this.model,
    this.property,
    this.type,
    this.userAttribute,
    this.value,
  });

  factory ComponentProperty.fromJson(Map<String, dynamic> json) {
    return ComponentProperty(
      bindingProperties: json['bindingProperties'] != null
          ? ComponentPropertyBindingProperties.fromJson(
              json['bindingProperties'] as Map<String, dynamic>)
          : null,
      bindings: (json['bindings'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, FormBindingElement.fromJson(e as Map<String, dynamic>))),
      collectionBindingProperties: json['collectionBindingProperties'] != null
          ? ComponentPropertyBindingProperties.fromJson(
              json['collectionBindingProperties'] as Map<String, dynamic>)
          : null,
      componentName: json['componentName'] as String?,
      concat: (json['concat'] as List?)
          ?.whereNotNull()
          .map((e) => ComponentProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      condition: json['condition'] != null
          ? ComponentConditionProperty.fromJson(
              json['condition'] as Map<String, dynamic>)
          : null,
      configured: json['configured'] as bool?,
      defaultValue: json['defaultValue'] as String?,
      event: json['event'] as String?,
      importedValue: json['importedValue'] as String?,
      model: json['model'] as String?,
      property: json['property'] as String?,
      type: json['type'] as String?,
      userAttribute: json['userAttribute'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bindingProperties = this.bindingProperties;
    final bindings = this.bindings;
    final collectionBindingProperties = this.collectionBindingProperties;
    final componentName = this.componentName;
    final concat = this.concat;
    final condition = this.condition;
    final configured = this.configured;
    final defaultValue = this.defaultValue;
    final event = this.event;
    final importedValue = this.importedValue;
    final model = this.model;
    final property = this.property;
    final type = this.type;
    final userAttribute = this.userAttribute;
    final value = this.value;
    return {
      if (bindingProperties != null) 'bindingProperties': bindingProperties,
      if (bindings != null) 'bindings': bindings,
      if (collectionBindingProperties != null)
        'collectionBindingProperties': collectionBindingProperties,
      if (componentName != null) 'componentName': componentName,
      if (concat != null) 'concat': concat,
      if (condition != null) 'condition': condition,
      if (configured != null) 'configured': configured,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (event != null) 'event': event,
      if (importedValue != null) 'importedValue': importedValue,
      if (model != null) 'model': model,
      if (property != null) 'property': property,
      if (type != null) 'type': type,
      if (userAttribute != null) 'userAttribute': userAttribute,
      if (value != null) 'value': value,
    };
  }
}

/// Associates a component property to a binding property. This enables exposed
/// properties on the top level component to propagate data to the component's
/// property values.
class ComponentPropertyBindingProperties {
  /// The component property to bind to the data field.
  final String property;

  /// The data field to bind the property to.
  final String? field;

  ComponentPropertyBindingProperties({
    required this.property,
    this.field,
  });

  factory ComponentPropertyBindingProperties.fromJson(
      Map<String, dynamic> json) {
    return ComponentPropertyBindingProperties(
      property: json['property'] as String,
      field: json['field'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final property = this.property;
    final field = this.field;
    return {
      'property': property,
      if (field != null) 'field': field,
    };
  }
}

/// Contains a summary of a component. This is a read-only data type that is
/// returned by <code>ListComponents</code>.
class ComponentSummary {
  /// The unique ID of the Amplify app associated with the component.
  final String appId;

  /// The component type.
  final String componentType;

  /// The name of the backend environment that is a part of the Amplify app.
  final String environmentName;

  /// The unique ID of the component.
  final String id;

  /// The name of the component.
  final String name;

  ComponentSummary({
    required this.appId,
    required this.componentType,
    required this.environmentName,
    required this.id,
    required this.name,
  });

  factory ComponentSummary.fromJson(Map<String, dynamic> json) {
    return ComponentSummary(
      appId: json['appId'] as String,
      componentType: json['componentType'] as String,
      environmentName: json['environmentName'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final componentType = this.componentType;
    final environmentName = this.environmentName;
    final id = this.id;
    final name = this.name;
    return {
      'appId': appId,
      'componentType': componentType,
      'environmentName': environmentName,
      'id': id,
      'name': name,
    };
  }
}

/// Describes the style configuration of a unique variation of a main component.
class ComponentVariant {
  /// The properties of the component variant that can be overriden when
  /// customizing an instance of the component. You can't specify
  /// <code>tags</code> as a valid property for <code>overrides</code>.
  final Map<String, Map<String, String>>? overrides;

  /// The combination of variants that comprise this variant. You can't specify
  /// <code>tags</code> as a valid property for <code>variantValues</code>.
  final Map<String, String>? variantValues;

  ComponentVariant({
    this.overrides,
    this.variantValues,
  });

  factory ComponentVariant.fromJson(Map<String, dynamic> json) {
    return ComponentVariant(
      overrides: (json['overrides'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))),
      variantValues: (json['variantValues'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final overrides = this.overrides;
    final variantValues = this.variantValues;
    return {
      if (overrides != null) 'overrides': overrides,
      if (variantValues != null) 'variantValues': variantValues,
    };
  }
}

/// Represents all of the information that is required to create a component.
class CreateComponentData {
  /// The data binding information for the component's properties.
  final Map<String, ComponentBindingPropertiesValue> bindingProperties;

  /// The component type. This can be an Amplify custom UI component or another
  /// custom component.
  final String componentType;

  /// The name of the component
  final String name;

  /// Describes the component properties that can be overriden to customize an
  /// instance of the component.
  final Map<String, Map<String, String>> overrides;

  /// Describes the component's properties.
  final Map<String, ComponentProperty> properties;

  /// A list of the unique variants of this component.
  final List<ComponentVariant> variants;

  /// A list of child components that are instances of the main component.
  final List<ComponentChild>? children;

  /// The data binding configuration for customizing a component's properties. Use
  /// this for a collection component.
  final Map<String, ComponentDataConfiguration>? collectionProperties;

  /// The event configuration for the component. Use for the workflow feature in
  /// Amplify Studio that allows you to bind events and actions to components.
  final Map<String, ComponentEvent>? events;

  /// The schema version of the component when it was imported.
  final String? schemaVersion;

  /// The unique ID of the component in its original source system, such as Figma.
  final String? sourceId;

  /// One or more key-value pairs to use when tagging the component data.
  final Map<String, String>? tags;

  CreateComponentData({
    required this.bindingProperties,
    required this.componentType,
    required this.name,
    required this.overrides,
    required this.properties,
    required this.variants,
    this.children,
    this.collectionProperties,
    this.events,
    this.schemaVersion,
    this.sourceId,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final bindingProperties = this.bindingProperties;
    final componentType = this.componentType;
    final name = this.name;
    final overrides = this.overrides;
    final properties = this.properties;
    final variants = this.variants;
    final children = this.children;
    final collectionProperties = this.collectionProperties;
    final events = this.events;
    final schemaVersion = this.schemaVersion;
    final sourceId = this.sourceId;
    final tags = this.tags;
    return {
      'bindingProperties': bindingProperties,
      'componentType': componentType,
      'name': name,
      'overrides': overrides,
      'properties': properties,
      'variants': variants,
      if (children != null) 'children': children,
      if (collectionProperties != null)
        'collectionProperties': collectionProperties,
      if (events != null) 'events': events,
      if (schemaVersion != null) 'schemaVersion': schemaVersion,
      if (sourceId != null) 'sourceId': sourceId,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateComponentResponse {
  /// Describes the configuration of the new component.
  final Component? entity;

  CreateComponentResponse({
    this.entity,
  });

  Map<String, dynamic> toJson() {
    final entity = this.entity;
    return {
      if (entity != null) 'entity': entity,
    };
  }
}

/// Represents all of the information that is required to create a form.
class CreateFormData {
  /// The type of data source to use to create the form.
  final FormDataTypeConfig dataType;

  /// The configuration information for the form's fields.
  final Map<String, FieldConfig> fields;

  /// Specifies whether to perform a create or update action on the form.
  final FormActionType formActionType;

  /// The name of the form.
  final String name;

  /// The schema version of the form.
  final String schemaVersion;

  /// The configuration information for the visual helper elements for the form.
  /// These elements are not associated with any data.
  final Map<String, SectionalElement> sectionalElements;

  /// The configuration for the form's style.
  final FormStyle style;

  /// The <code>FormCTA</code> object that stores the call to action configuration
  /// for the form.
  final FormCTA? cta;

  /// Specifies an icon or decoration to display on the form.
  final LabelDecorator? labelDecorator;

  /// One or more key-value pairs to use when tagging the form data.
  final Map<String, String>? tags;

  CreateFormData({
    required this.dataType,
    required this.fields,
    required this.formActionType,
    required this.name,
    required this.schemaVersion,
    required this.sectionalElements,
    required this.style,
    this.cta,
    this.labelDecorator,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final fields = this.fields;
    final formActionType = this.formActionType;
    final name = this.name;
    final schemaVersion = this.schemaVersion;
    final sectionalElements = this.sectionalElements;
    final style = this.style;
    final cta = this.cta;
    final labelDecorator = this.labelDecorator;
    final tags = this.tags;
    return {
      'dataType': dataType,
      'fields': fields,
      'formActionType': formActionType.toValue(),
      'name': name,
      'schemaVersion': schemaVersion,
      'sectionalElements': sectionalElements,
      'style': style,
      if (cta != null) 'cta': cta,
      if (labelDecorator != null) 'labelDecorator': labelDecorator.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateFormResponse {
  /// Describes the configuration of the new form.
  final Form? entity;

  CreateFormResponse({
    this.entity,
  });

  Map<String, dynamic> toJson() {
    final entity = this.entity;
    return {
      if (entity != null) 'entity': entity,
    };
  }
}

/// Represents all of the information that is required to create a theme.
class CreateThemeData {
  /// The name of the theme.
  final String name;

  /// A list of key-value pairs that deﬁnes the properties of the theme.
  final List<ThemeValues> values;

  /// Describes the properties that can be overriden to customize an instance of
  /// the theme.
  final List<ThemeValues>? overrides;

  /// One or more key-value pairs to use when tagging the theme data.
  final Map<String, String>? tags;

  CreateThemeData({
    required this.name,
    required this.values,
    this.overrides,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    final overrides = this.overrides;
    final tags = this.tags;
    return {
      'name': name,
      'values': values,
      if (overrides != null) 'overrides': overrides,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateThemeResponse {
  /// Describes the configuration of the new theme.
  final Theme? entity;

  CreateThemeResponse({
    this.entity,
  });

  Map<String, dynamic> toJson() {
    final entity = this.entity;
    return {
      if (entity != null) 'entity': entity,
    };
  }
}

/// Describes the DataStore configuration for an API for a code generation job.
class DataStoreRenderConfig {
  DataStoreRenderConfig();

  factory DataStoreRenderConfig.fromJson(Map<String, dynamic> _) {
    return DataStoreRenderConfig();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes the configuration of a request to exchange an access code for a
/// token.
class ExchangeCodeForTokenRequestBody {
  /// The access code to send in the request.
  final String code;

  /// The location of the application that will receive the access code.
  final String redirectUri;

  /// The ID of the client to request the token from.
  final String? clientId;

  ExchangeCodeForTokenRequestBody({
    required this.code,
    required this.redirectUri,
    this.clientId,
  });

  Map<String, dynamic> toJson() {
    final code = this.code;
    final redirectUri = this.redirectUri;
    final clientId = this.clientId;
    return {
      'code': code,
      'redirectUri': redirectUri,
      if (clientId != null) 'clientId': clientId,
    };
  }
}

class ExchangeCodeForTokenResponse {
  /// The access token.
  final String accessToken;

  /// The date and time when the new access token expires.
  final int expiresIn;

  /// The token to use to refresh a previously issued access token that might have
  /// expired.
  final String refreshToken;

  ExchangeCodeForTokenResponse({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
  });

  factory ExchangeCodeForTokenResponse.fromJson(Map<String, dynamic> json) {
    return ExchangeCodeForTokenResponse(
      accessToken: json['accessToken'] as String,
      expiresIn: json['expiresIn'] as int,
      refreshToken: json['refreshToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final expiresIn = this.expiresIn;
    final refreshToken = this.refreshToken;
    return {
      'accessToken': accessToken,
      'expiresIn': expiresIn,
      'refreshToken': refreshToken,
    };
  }
}

class ExportComponentsResponse {
  /// Represents the configuration of the exported components.
  final List<Component> entities;

  /// The pagination token that's included if more results are available.
  final String? nextToken;

  ExportComponentsResponse({
    required this.entities,
    this.nextToken,
  });

  factory ExportComponentsResponse.fromJson(Map<String, dynamic> json) {
    return ExportComponentsResponse(
      entities: (json['entities'] as List)
          .whereNotNull()
          .map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final nextToken = this.nextToken;
    return {
      'entities': entities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ExportFormsResponse {
  /// Represents the configuration of the exported forms.
  final List<Form> entities;

  /// The pagination token that's included if more results are available.
  final String? nextToken;

  ExportFormsResponse({
    required this.entities,
    this.nextToken,
  });

  factory ExportFormsResponse.fromJson(Map<String, dynamic> json) {
    return ExportFormsResponse(
      entities: (json['entities'] as List)
          .whereNotNull()
          .map((e) => Form.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final nextToken = this.nextToken;
    return {
      'entities': entities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ExportThemesResponse {
  /// Represents the configuration of the exported themes.
  final List<Theme> entities;

  /// The pagination token that's included if more results are available.
  final String? nextToken;

  ExportThemesResponse({
    required this.entities,
    this.nextToken,
  });

  factory ExportThemesResponse.fromJson(Map<String, dynamic> json) {
    return ExportThemesResponse(
      entities: (json['entities'] as List)
          .whereNotNull()
          .map((e) => Theme.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final nextToken = this.nextToken;
    return {
      'entities': entities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Describes the configuration information for a field in a table.
class FieldConfig {
  /// Specifies whether to hide a field.
  final bool? excluded;

  /// Describes the configuration for the default input value to display for a
  /// field.
  final FieldInputConfig? inputType;

  /// The label for the field.
  final String? label;

  /// Specifies the field position.
  final FieldPosition? position;

  /// The validations to perform on the value in the field.
  final List<FieldValidationConfiguration>? validations;

  FieldConfig({
    this.excluded,
    this.inputType,
    this.label,
    this.position,
    this.validations,
  });

  factory FieldConfig.fromJson(Map<String, dynamic> json) {
    return FieldConfig(
      excluded: json['excluded'] as bool?,
      inputType: json['inputType'] != null
          ? FieldInputConfig.fromJson(json['inputType'] as Map<String, dynamic>)
          : null,
      label: json['label'] as String?,
      position: json['position'] != null
          ? FieldPosition.fromJson(json['position'] as Map<String, dynamic>)
          : null,
      validations: (json['validations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FieldValidationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final excluded = this.excluded;
    final inputType = this.inputType;
    final label = this.label;
    final position = this.position;
    final validations = this.validations;
    return {
      if (excluded != null) 'excluded': excluded,
      if (inputType != null) 'inputType': inputType,
      if (label != null) 'label': label,
      if (position != null) 'position': position,
      if (validations != null) 'validations': validations,
    };
  }
}

/// Describes the configuration for the default input values to display for a
/// field.
class FieldInputConfig {
  /// The input type for the field.
  final String type;

  /// Specifies whether a field has a default value.
  final bool? defaultChecked;

  /// The default country code for a phone number.
  final String? defaultCountryCode;

  /// The default value for the field.
  final String? defaultValue;

  /// The text to display to describe the field.
  final String? descriptiveText;

  /// The configuration for the file uploader field.
  final FileUploaderFieldConfig? fileUploaderConfig;

  /// Specifies whether to render the field as an array. This property is ignored
  /// if the <code>dataSourceType</code> for the form is a Data Store.
  final bool? isArray;

  /// The maximum value to display for the field.
  final double? maxValue;

  /// The minimum value to display for the field.
  final double? minValue;

  /// The name of the field.
  final String? name;

  /// The text to display as a placeholder for the field.
  final String? placeholder;

  /// Specifies a read only field.
  final bool? readOnly;

  /// Specifies a field that requires input.
  final bool? required;

  /// The stepping increment for a numeric value in a field.
  final double? step;

  /// The value for the field.
  final String? value;

  /// The information to use to customize the input fields with data at runtime.
  final ValueMappings? valueMappings;

  FieldInputConfig({
    required this.type,
    this.defaultChecked,
    this.defaultCountryCode,
    this.defaultValue,
    this.descriptiveText,
    this.fileUploaderConfig,
    this.isArray,
    this.maxValue,
    this.minValue,
    this.name,
    this.placeholder,
    this.readOnly,
    this.required,
    this.step,
    this.value,
    this.valueMappings,
  });

  factory FieldInputConfig.fromJson(Map<String, dynamic> json) {
    return FieldInputConfig(
      type: json['type'] as String,
      defaultChecked: json['defaultChecked'] as bool?,
      defaultCountryCode: json['defaultCountryCode'] as String?,
      defaultValue: json['defaultValue'] as String?,
      descriptiveText: json['descriptiveText'] as String?,
      fileUploaderConfig: json['fileUploaderConfig'] != null
          ? FileUploaderFieldConfig.fromJson(
              json['fileUploaderConfig'] as Map<String, dynamic>)
          : null,
      isArray: json['isArray'] as bool?,
      maxValue: json['maxValue'] as double?,
      minValue: json['minValue'] as double?,
      name: json['name'] as String?,
      placeholder: json['placeholder'] as String?,
      readOnly: json['readOnly'] as bool?,
      required: json['required'] as bool?,
      step: json['step'] as double?,
      value: json['value'] as String?,
      valueMappings: json['valueMappings'] != null
          ? ValueMappings.fromJson(
              json['valueMappings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final defaultChecked = this.defaultChecked;
    final defaultCountryCode = this.defaultCountryCode;
    final defaultValue = this.defaultValue;
    final descriptiveText = this.descriptiveText;
    final fileUploaderConfig = this.fileUploaderConfig;
    final isArray = this.isArray;
    final maxValue = this.maxValue;
    final minValue = this.minValue;
    final name = this.name;
    final placeholder = this.placeholder;
    final readOnly = this.readOnly;
    final required = this.required;
    final step = this.step;
    final value = this.value;
    final valueMappings = this.valueMappings;
    return {
      'type': type,
      if (defaultChecked != null) 'defaultChecked': defaultChecked,
      if (defaultCountryCode != null) 'defaultCountryCode': defaultCountryCode,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (descriptiveText != null) 'descriptiveText': descriptiveText,
      if (fileUploaderConfig != null) 'fileUploaderConfig': fileUploaderConfig,
      if (isArray != null) 'isArray': isArray,
      if (maxValue != null) 'maxValue': maxValue,
      if (minValue != null) 'minValue': minValue,
      if (name != null) 'name': name,
      if (placeholder != null) 'placeholder': placeholder,
      if (readOnly != null) 'readOnly': readOnly,
      if (required != null) 'required': required,
      if (step != null) 'step': step,
      if (value != null) 'value': value,
      if (valueMappings != null) 'valueMappings': valueMappings,
    };
  }
}

/// Describes the field position.
class FieldPosition {
  /// The field position is below the field specified by the string.
  final String? below;

  /// The field position is fixed and doesn't change in relation to other fields.
  final FixedPosition? fixed;

  /// The field position is to the right of the field specified by the string.
  final String? rightOf;

  FieldPosition({
    this.below,
    this.fixed,
    this.rightOf,
  });

  factory FieldPosition.fromJson(Map<String, dynamic> json) {
    return FieldPosition(
      below: json['below'] as String?,
      fixed: (json['fixed'] as String?)?.toFixedPosition(),
      rightOf: json['rightOf'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final below = this.below;
    final fixed = this.fixed;
    final rightOf = this.rightOf;
    return {
      if (below != null) 'below': below,
      if (fixed != null) 'fixed': fixed.toValue(),
      if (rightOf != null) 'rightOf': rightOf,
    };
  }
}

/// Describes the validation configuration for a field.
class FieldValidationConfiguration {
  /// The validation to perform on an object type.<code/>
  final String type;

  /// The validation to perform on a number value.
  final List<int>? numValues;

  /// The validation to perform on a string value.
  final List<String>? strValues;

  /// The validation message to display.
  final String? validationMessage;

  FieldValidationConfiguration({
    required this.type,
    this.numValues,
    this.strValues,
    this.validationMessage,
  });

  factory FieldValidationConfiguration.fromJson(Map<String, dynamic> json) {
    return FieldValidationConfiguration(
      type: json['type'] as String,
      numValues: (json['numValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      strValues: (json['strValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      validationMessage: json['validationMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final numValues = this.numValues;
    final strValues = this.strValues;
    final validationMessage = this.validationMessage;
    return {
      'type': type,
      if (numValues != null) 'numValues': numValues,
      if (strValues != null) 'strValues': strValues,
      if (validationMessage != null) 'validationMessage': validationMessage,
    };
  }
}

/// Describes the configuration for the file uploader field.
class FileUploaderFieldConfig {
  /// The file types that are allowed to be uploaded by the file uploader. Provide
  /// this information in an array of strings specifying the valid file
  /// extensions.
  final List<String> acceptedFileTypes;

  /// The access level to assign to the uploaded files in the Amazon S3 bucket
  /// where they are stored. The valid values for this property are
  /// <code>private</code>, <code>protected</code>, or <code>public</code>. For
  /// detailed information about the permissions associated with each access
  /// level, see <a
  /// href="https://docs.amplify.aws/lib/storage/configureaccess/q/platform/js/">File
  /// access levels</a> in the <i>Amplify documentation</i>.
  final StorageAccessLevel accessLevel;

  /// Allows the file upload operation to be paused and resumed. The default value
  /// is <code>false</code>.
  ///
  /// When <code>isResumable</code> is set to <code>true</code>, the file uploader
  /// uses a multipart upload to break the files into chunks before upload. The
  /// progress of the upload isn't continuous, because the file uploader uploads a
  /// chunk at a time.
  final bool? isResumable;

  /// Specifies the maximum number of files that can be selected to upload. The
  /// default value is an unlimited number of files.
  final int? maxFileCount;

  /// The maximum file size in bytes that the file uploader will accept. The
  /// default value is an unlimited file size.
  final int? maxSize;

  /// Specifies whether to display or hide the image preview after selecting a
  /// file for upload. The default value is <code>true</code> to display the image
  /// preview.
  final bool? showThumbnails;

  FileUploaderFieldConfig({
    required this.acceptedFileTypes,
    required this.accessLevel,
    this.isResumable,
    this.maxFileCount,
    this.maxSize,
    this.showThumbnails,
  });

  factory FileUploaderFieldConfig.fromJson(Map<String, dynamic> json) {
    return FileUploaderFieldConfig(
      acceptedFileTypes: (json['acceptedFileTypes'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      accessLevel: (json['accessLevel'] as String).toStorageAccessLevel(),
      isResumable: json['isResumable'] as bool?,
      maxFileCount: json['maxFileCount'] as int?,
      maxSize: json['maxSize'] as int?,
      showThumbnails: json['showThumbnails'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptedFileTypes = this.acceptedFileTypes;
    final accessLevel = this.accessLevel;
    final isResumable = this.isResumable;
    final maxFileCount = this.maxFileCount;
    final maxSize = this.maxSize;
    final showThumbnails = this.showThumbnails;
    return {
      'acceptedFileTypes': acceptedFileTypes,
      'accessLevel': accessLevel.toValue(),
      if (isResumable != null) 'isResumable': isResumable,
      if (maxFileCount != null) 'maxFileCount': maxFileCount,
      if (maxSize != null) 'maxSize': maxSize,
      if (showThumbnails != null) 'showThumbnails': showThumbnails,
    };
  }
}

enum FixedPosition {
  first,
}

extension FixedPositionValueExtension on FixedPosition {
  String toValue() {
    switch (this) {
      case FixedPosition.first:
        return 'first';
    }
  }
}

extension FixedPositionFromString on String {
  FixedPosition toFixedPosition() {
    switch (this) {
      case 'first':
        return FixedPosition.first;
    }
    throw Exception('$this is not known in enum FixedPosition');
  }
}

/// Contains the configuration settings for a <code>Form</code> user interface
/// (UI) element for an Amplify app. A form is a component you can add to your
/// project by specifying a data source as the default configuration for the
/// form.
class Form {
  /// The unique ID of the Amplify app associated with the form.
  final String appId;

  /// The type of data source to use to create the form.
  final FormDataTypeConfig dataType;

  /// The name of the backend environment that is a part of the Amplify app.
  final String environmentName;

  /// Stores the information about the form's fields.
  final Map<String, FieldConfig> fields;

  /// The operation to perform on the specified form.
  final FormActionType formActionType;

  /// The unique ID of the form.
  final String id;

  /// The name of the form.
  final String name;

  /// The schema version of the form when it was imported.
  final String schemaVersion;

  /// Stores the visual helper elements for the form that are not associated with
  /// any data.
  final Map<String, SectionalElement> sectionalElements;

  /// Stores the configuration for the form's style.
  final FormStyle style;

  /// Stores the call to action configuration for the form.
  final FormCTA? cta;

  /// Specifies an icon or decoration to display on the form.
  final LabelDecorator? labelDecorator;

  /// One or more key-value pairs to use when tagging the form.
  final Map<String, String>? tags;

  Form({
    required this.appId,
    required this.dataType,
    required this.environmentName,
    required this.fields,
    required this.formActionType,
    required this.id,
    required this.name,
    required this.schemaVersion,
    required this.sectionalElements,
    required this.style,
    this.cta,
    this.labelDecorator,
    this.tags,
  });

  factory Form.fromJson(Map<String, dynamic> json) {
    return Form(
      appId: json['appId'] as String,
      dataType:
          FormDataTypeConfig.fromJson(json['dataType'] as Map<String, dynamic>),
      environmentName: json['environmentName'] as String,
      fields: (json['fields'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, FieldConfig.fromJson(e as Map<String, dynamic>))),
      formActionType: (json['formActionType'] as String).toFormActionType(),
      id: json['id'] as String,
      name: json['name'] as String,
      schemaVersion: json['schemaVersion'] as String,
      sectionalElements: (json['sectionalElements'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(
              k, SectionalElement.fromJson(e as Map<String, dynamic>))),
      style: FormStyle.fromJson(json['style'] as Map<String, dynamic>),
      cta: json['cta'] != null
          ? FormCTA.fromJson(json['cta'] as Map<String, dynamic>)
          : null,
      labelDecorator: (json['labelDecorator'] as String?)?.toLabelDecorator(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final dataType = this.dataType;
    final environmentName = this.environmentName;
    final fields = this.fields;
    final formActionType = this.formActionType;
    final id = this.id;
    final name = this.name;
    final schemaVersion = this.schemaVersion;
    final sectionalElements = this.sectionalElements;
    final style = this.style;
    final cta = this.cta;
    final labelDecorator = this.labelDecorator;
    final tags = this.tags;
    return {
      'appId': appId,
      'dataType': dataType,
      'environmentName': environmentName,
      'fields': fields,
      'formActionType': formActionType.toValue(),
      'id': id,
      'name': name,
      'schemaVersion': schemaVersion,
      'sectionalElements': sectionalElements,
      'style': style,
      if (cta != null) 'cta': cta,
      if (labelDecorator != null) 'labelDecorator': labelDecorator.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

enum FormActionType {
  create,
  update,
}

extension FormActionTypeValueExtension on FormActionType {
  String toValue() {
    switch (this) {
      case FormActionType.create:
        return 'create';
      case FormActionType.update:
        return 'update';
    }
  }
}

extension FormActionTypeFromString on String {
  FormActionType toFormActionType() {
    switch (this) {
      case 'create':
        return FormActionType.create;
      case 'update':
        return FormActionType.update;
    }
    throw Exception('$this is not known in enum FormActionType');
  }
}

/// Describes how to bind a component property to form data.
class FormBindingElement {
  /// The name of the component to retrieve a value from.
  final String element;

  /// The property to retrieve a value from.
  final String property;

  FormBindingElement({
    required this.element,
    required this.property,
  });

  factory FormBindingElement.fromJson(Map<String, dynamic> json) {
    return FormBindingElement(
      element: json['element'] as String,
      property: json['property'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final element = this.element;
    final property = this.property;
    return {
      'element': element,
      'property': property,
    };
  }
}

/// Describes the configuration for a button UI element that is a part of a
/// form.
class FormButton {
  /// Describes the button's properties.
  final String? children;

  /// Specifies whether the button is visible on the form.
  final bool? excluded;

  /// The position of the button.
  final FieldPosition? position;

  FormButton({
    this.children,
    this.excluded,
    this.position,
  });

  factory FormButton.fromJson(Map<String, dynamic> json) {
    return FormButton(
      children: json['children'] as String?,
      excluded: json['excluded'] as bool?,
      position: json['position'] != null
          ? FieldPosition.fromJson(json['position'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final children = this.children;
    final excluded = this.excluded;
    final position = this.position;
    return {
      if (children != null) 'children': children,
      if (excluded != null) 'excluded': excluded,
      if (position != null) 'position': position,
    };
  }
}

enum FormButtonsPosition {
  top,
  bottom,
  topAndBottom,
}

extension FormButtonsPositionValueExtension on FormButtonsPosition {
  String toValue() {
    switch (this) {
      case FormButtonsPosition.top:
        return 'top';
      case FormButtonsPosition.bottom:
        return 'bottom';
      case FormButtonsPosition.topAndBottom:
        return 'top_and_bottom';
    }
  }
}

extension FormButtonsPositionFromString on String {
  FormButtonsPosition toFormButtonsPosition() {
    switch (this) {
      case 'top':
        return FormButtonsPosition.top;
      case 'bottom':
        return FormButtonsPosition.bottom;
      case 'top_and_bottom':
        return FormButtonsPosition.topAndBottom;
    }
    throw Exception('$this is not known in enum FormButtonsPosition');
  }
}

/// Describes the call to action button configuration for the form.
class FormCTA {
  /// Displays a cancel button.
  final FormButton? cancel;

  /// Displays a clear button.
  final FormButton? clear;

  /// The position of the button.
  final FormButtonsPosition? position;

  /// Displays a submit button.
  final FormButton? submit;

  FormCTA({
    this.cancel,
    this.clear,
    this.position,
    this.submit,
  });

  factory FormCTA.fromJson(Map<String, dynamic> json) {
    return FormCTA(
      cancel: json['cancel'] != null
          ? FormButton.fromJson(json['cancel'] as Map<String, dynamic>)
          : null,
      clear: json['clear'] != null
          ? FormButton.fromJson(json['clear'] as Map<String, dynamic>)
          : null,
      position: (json['position'] as String?)?.toFormButtonsPosition(),
      submit: json['submit'] != null
          ? FormButton.fromJson(json['submit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cancel = this.cancel;
    final clear = this.clear;
    final position = this.position;
    final submit = this.submit;
    return {
      if (cancel != null) 'cancel': cancel,
      if (clear != null) 'clear': clear,
      if (position != null) 'position': position.toValue(),
      if (submit != null) 'submit': submit,
    };
  }
}

enum FormDataSourceType {
  dataStore,
  custom,
}

extension FormDataSourceTypeValueExtension on FormDataSourceType {
  String toValue() {
    switch (this) {
      case FormDataSourceType.dataStore:
        return 'DataStore';
      case FormDataSourceType.custom:
        return 'Custom';
    }
  }
}

extension FormDataSourceTypeFromString on String {
  FormDataSourceType toFormDataSourceType() {
    switch (this) {
      case 'DataStore':
        return FormDataSourceType.dataStore;
      case 'Custom':
        return FormDataSourceType.custom;
    }
    throw Exception('$this is not known in enum FormDataSourceType');
  }
}

/// Describes the data type configuration for the data source associated with a
/// form.
class FormDataTypeConfig {
  /// The data source type, either an Amplify DataStore model or a custom data
  /// type.
  final FormDataSourceType dataSourceType;

  /// The unique name of the data type you are using as the data source for the
  /// form.
  final String dataTypeName;

  FormDataTypeConfig({
    required this.dataSourceType,
    required this.dataTypeName,
  });

  factory FormDataTypeConfig.fromJson(Map<String, dynamic> json) {
    return FormDataTypeConfig(
      dataSourceType: (json['dataSourceType'] as String).toFormDataSourceType(),
      dataTypeName: json['dataTypeName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceType = this.dataSourceType;
    final dataTypeName = this.dataTypeName;
    return {
      'dataSourceType': dataSourceType.toValue(),
      'dataTypeName': dataTypeName,
    };
  }
}

/// Represents the data binding configuration for a form's input fields at
/// runtime.You can use <code>FormInputBindingPropertiesValue</code> to add
/// exposed properties to a form to allow different values to be entered when a
/// form is reused in different places in an app.
class FormInputBindingPropertiesValue {
  /// Describes the properties to customize with data at runtime.
  final FormInputBindingPropertiesValueProperties? bindingProperties;

  /// The property type.
  final String? type;

  FormInputBindingPropertiesValue({
    this.bindingProperties,
    this.type,
  });

  factory FormInputBindingPropertiesValue.fromJson(Map<String, dynamic> json) {
    return FormInputBindingPropertiesValue(
      bindingProperties: json['bindingProperties'] != null
          ? FormInputBindingPropertiesValueProperties.fromJson(
              json['bindingProperties'] as Map<String, dynamic>)
          : null,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bindingProperties = this.bindingProperties;
    final type = this.type;
    return {
      if (bindingProperties != null) 'bindingProperties': bindingProperties,
      if (type != null) 'type': type,
    };
  }
}

/// Represents the data binding configuration for a specific property using data
/// stored in Amazon Web Services. For Amazon Web Services connected properties,
/// you can bind a property to data stored in an Amplify DataStore model.
class FormInputBindingPropertiesValueProperties {
  /// An Amplify DataStore model.
  final String? model;

  FormInputBindingPropertiesValueProperties({
    this.model,
  });

  factory FormInputBindingPropertiesValueProperties.fromJson(
      Map<String, dynamic> json) {
    return FormInputBindingPropertiesValueProperties(
      model: json['model'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final model = this.model;
    return {
      if (model != null) 'model': model,
    };
  }
}

/// Describes the configuration for an input field on a form. Use
/// <code>FormInputValueProperty</code> to specify the values to render or bind
/// by default.
class FormInputValueProperty {
  /// The information to bind fields to data at runtime.
  final FormInputValuePropertyBindingProperties? bindingProperties;

  /// A list of form properties to concatenate to create the value to assign to
  /// this field property.
  final List<FormInputValueProperty>? concat;

  /// The value to assign to the input field.
  final String? value;

  FormInputValueProperty({
    this.bindingProperties,
    this.concat,
    this.value,
  });

  factory FormInputValueProperty.fromJson(Map<String, dynamic> json) {
    return FormInputValueProperty(
      bindingProperties: json['bindingProperties'] != null
          ? FormInputValuePropertyBindingProperties.fromJson(
              json['bindingProperties'] as Map<String, dynamic>)
          : null,
      concat: (json['concat'] as List?)
          ?.whereNotNull()
          .map(
              (e) => FormInputValueProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bindingProperties = this.bindingProperties;
    final concat = this.concat;
    final value = this.value;
    return {
      if (bindingProperties != null) 'bindingProperties': bindingProperties,
      if (concat != null) 'concat': concat,
      if (value != null) 'value': value,
    };
  }
}

/// Associates a form property to a binding property. This enables exposed
/// properties on the top level form to propagate data to the form's property
/// values.
class FormInputValuePropertyBindingProperties {
  /// The form property to bind to the data field.
  final String property;

  /// The data field to bind the property to.
  final String? field;

  FormInputValuePropertyBindingProperties({
    required this.property,
    this.field,
  });

  factory FormInputValuePropertyBindingProperties.fromJson(
      Map<String, dynamic> json) {
    return FormInputValuePropertyBindingProperties(
      property: json['property'] as String,
      field: json['field'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final property = this.property;
    final field = this.field;
    return {
      'property': property,
      if (field != null) 'field': field,
    };
  }
}

/// Describes the configuration for the form's style.
class FormStyle {
  /// The spacing for the horizontal gap.
  final FormStyleConfig? horizontalGap;

  /// The size of the outer padding for the form.
  final FormStyleConfig? outerPadding;

  /// The spacing for the vertical gap.
  final FormStyleConfig? verticalGap;

  FormStyle({
    this.horizontalGap,
    this.outerPadding,
    this.verticalGap,
  });

  factory FormStyle.fromJson(Map<String, dynamic> json) {
    return FormStyle(
      horizontalGap: json['horizontalGap'] != null
          ? FormStyleConfig.fromJson(
              json['horizontalGap'] as Map<String, dynamic>)
          : null,
      outerPadding: json['outerPadding'] != null
          ? FormStyleConfig.fromJson(
              json['outerPadding'] as Map<String, dynamic>)
          : null,
      verticalGap: json['verticalGap'] != null
          ? FormStyleConfig.fromJson(
              json['verticalGap'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final horizontalGap = this.horizontalGap;
    final outerPadding = this.outerPadding;
    final verticalGap = this.verticalGap;
    return {
      if (horizontalGap != null) 'horizontalGap': horizontalGap,
      if (outerPadding != null) 'outerPadding': outerPadding,
      if (verticalGap != null) 'verticalGap': verticalGap,
    };
  }
}

/// Describes the configuration settings for the form's style properties.
class FormStyleConfig {
  /// A reference to a design token to use to bind the form's style properties to
  /// an existing theme.
  final String? tokenReference;

  /// The value of the style setting.
  final String? value;

  FormStyleConfig({
    this.tokenReference,
    this.value,
  });

  factory FormStyleConfig.fromJson(Map<String, dynamic> json) {
    return FormStyleConfig(
      tokenReference: json['tokenReference'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tokenReference = this.tokenReference;
    final value = this.value;
    return {
      if (tokenReference != null) 'tokenReference': tokenReference,
      if (value != null) 'value': value,
    };
  }
}

/// Describes the basic information about a form.
class FormSummary {
  /// The unique ID for the app associated with the form summary.
  final String appId;

  /// The form's data source type.
  final FormDataTypeConfig dataType;

  /// The name of the backend environment that is part of the Amplify app.
  final String environmentName;

  /// The type of operation to perform on the form.
  final FormActionType formActionType;

  /// The ID of the form.
  final String id;

  /// The name of the form.
  final String name;

  FormSummary({
    required this.appId,
    required this.dataType,
    required this.environmentName,
    required this.formActionType,
    required this.id,
    required this.name,
  });

  factory FormSummary.fromJson(Map<String, dynamic> json) {
    return FormSummary(
      appId: json['appId'] as String,
      dataType:
          FormDataTypeConfig.fromJson(json['dataType'] as Map<String, dynamic>),
      environmentName: json['environmentName'] as String,
      formActionType: (json['formActionType'] as String).toFormActionType(),
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final dataType = this.dataType;
    final environmentName = this.environmentName;
    final formActionType = this.formActionType;
    final id = this.id;
    final name = this.name;
    return {
      'appId': appId,
      'dataType': dataType,
      'environmentName': environmentName,
      'formActionType': formActionType.toValue(),
      'id': id,
      'name': name,
    };
  }
}

enum GenericDataRelationshipType {
  hasMany,
  hasOne,
  belongsTo,
}

extension GenericDataRelationshipTypeValueExtension
    on GenericDataRelationshipType {
  String toValue() {
    switch (this) {
      case GenericDataRelationshipType.hasMany:
        return 'HAS_MANY';
      case GenericDataRelationshipType.hasOne:
        return 'HAS_ONE';
      case GenericDataRelationshipType.belongsTo:
        return 'BELONGS_TO';
    }
  }
}

extension GenericDataRelationshipTypeFromString on String {
  GenericDataRelationshipType toGenericDataRelationshipType() {
    switch (this) {
      case 'HAS_MANY':
        return GenericDataRelationshipType.hasMany;
      case 'HAS_ONE':
        return GenericDataRelationshipType.hasOne;
      case 'BELONGS_TO':
        return GenericDataRelationshipType.belongsTo;
    }
    throw Exception('$this is not known in enum GenericDataRelationshipType');
  }
}

class GetCodegenJobResponse {
  /// The configuration settings for the code generation job.
  final CodegenJob? job;

  GetCodegenJobResponse({
    this.job,
  });

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'job': job,
    };
  }
}

class GetComponentResponse {
  /// Represents the configuration settings for the component.
  final Component? component;

  GetComponentResponse({
    this.component,
  });

  Map<String, dynamic> toJson() {
    final component = this.component;
    return {
      if (component != null) 'component': component,
    };
  }
}

class GetFormResponse {
  /// Represents the configuration settings for the form.
  final Form? form;

  GetFormResponse({
    this.form,
  });

  Map<String, dynamic> toJson() {
    final form = this.form;
    return {
      if (form != null) 'form': form,
    };
  }
}

class GetMetadataResponse {
  /// Represents the configuration settings for the features metadata.
  final Map<String, String> features;

  GetMetadataResponse({
    required this.features,
  });

  factory GetMetadataResponse.fromJson(Map<String, dynamic> json) {
    return GetMetadataResponse(
      features: (json['features'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final features = this.features;
    return {
      'features': features,
    };
  }
}

class GetThemeResponse {
  /// Represents the configuration settings for the theme.
  final Theme? theme;

  GetThemeResponse({
    this.theme,
  });

  Map<String, dynamic> toJson() {
    final theme = this.theme;
    return {
      if (theme != null) 'theme': theme,
    };
  }
}

/// Describes the GraphQL configuration for an API for a code generation job.
class GraphQLRenderConfig {
  /// The path to the GraphQL fragments file, relative to the component output
  /// directory.
  final String fragmentsFilePath;

  /// The path to the GraphQL mutations file, relative to the component output
  /// directory.
  final String mutationsFilePath;

  /// The path to the GraphQL queries file, relative to the component output
  /// directory.
  final String queriesFilePath;

  /// The path to the GraphQL subscriptions file, relative to the component output
  /// directory.
  final String subscriptionsFilePath;

  /// The path to the GraphQL types file, relative to the component output
  /// directory.
  final String typesFilePath;

  GraphQLRenderConfig({
    required this.fragmentsFilePath,
    required this.mutationsFilePath,
    required this.queriesFilePath,
    required this.subscriptionsFilePath,
    required this.typesFilePath,
  });

  factory GraphQLRenderConfig.fromJson(Map<String, dynamic> json) {
    return GraphQLRenderConfig(
      fragmentsFilePath: json['fragmentsFilePath'] as String,
      mutationsFilePath: json['mutationsFilePath'] as String,
      queriesFilePath: json['queriesFilePath'] as String,
      subscriptionsFilePath: json['subscriptionsFilePath'] as String,
      typesFilePath: json['typesFilePath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final fragmentsFilePath = this.fragmentsFilePath;
    final mutationsFilePath = this.mutationsFilePath;
    final queriesFilePath = this.queriesFilePath;
    final subscriptionsFilePath = this.subscriptionsFilePath;
    final typesFilePath = this.typesFilePath;
    return {
      'fragmentsFilePath': fragmentsFilePath,
      'mutationsFilePath': mutationsFilePath,
      'queriesFilePath': queriesFilePath,
      'subscriptionsFilePath': subscriptionsFilePath,
      'typesFilePath': typesFilePath,
    };
  }
}

enum JSModule {
  es2020,
  esnext,
}

extension JSModuleValueExtension on JSModule {
  String toValue() {
    switch (this) {
      case JSModule.es2020:
        return 'es2020';
      case JSModule.esnext:
        return 'esnext';
    }
  }
}

extension JSModuleFromString on String {
  JSModule toJSModule() {
    switch (this) {
      case 'es2020':
        return JSModule.es2020;
      case 'esnext':
        return JSModule.esnext;
    }
    throw Exception('$this is not known in enum JSModule');
  }
}

enum JSScript {
  jsx,
  tsx,
  js,
}

extension JSScriptValueExtension on JSScript {
  String toValue() {
    switch (this) {
      case JSScript.jsx:
        return 'jsx';
      case JSScript.tsx:
        return 'tsx';
      case JSScript.js:
        return 'js';
    }
  }
}

extension JSScriptFromString on String {
  JSScript toJSScript() {
    switch (this) {
      case 'jsx':
        return JSScript.jsx;
      case 'tsx':
        return JSScript.tsx;
      case 'js':
        return JSScript.js;
    }
    throw Exception('$this is not known in enum JSScript');
  }
}

enum JSTarget {
  es2015,
  es2020,
}

extension JSTargetValueExtension on JSTarget {
  String toValue() {
    switch (this) {
      case JSTarget.es2015:
        return 'es2015';
      case JSTarget.es2020:
        return 'es2020';
    }
  }
}

extension JSTargetFromString on String {
  JSTarget toJSTarget() {
    switch (this) {
      case 'es2015':
        return JSTarget.es2015;
      case 'es2020':
        return JSTarget.es2020;
    }
    throw Exception('$this is not known in enum JSTarget');
  }
}

enum LabelDecorator {
  required,
  optional,
  none,
}

extension LabelDecoratorValueExtension on LabelDecorator {
  String toValue() {
    switch (this) {
      case LabelDecorator.required:
        return 'required';
      case LabelDecorator.optional:
        return 'optional';
      case LabelDecorator.none:
        return 'none';
    }
  }
}

extension LabelDecoratorFromString on String {
  LabelDecorator toLabelDecorator() {
    switch (this) {
      case 'required':
        return LabelDecorator.required;
      case 'optional':
        return LabelDecorator.optional;
      case 'none':
        return LabelDecorator.none;
    }
    throw Exception('$this is not known in enum LabelDecorator');
  }
}

class ListCodegenJobsResponse {
  /// The list of code generation jobs for the Amplify app.
  final List<CodegenJobSummary> entities;

  /// The pagination token that's included if more results are available.
  final String? nextToken;

  ListCodegenJobsResponse({
    required this.entities,
    this.nextToken,
  });

  factory ListCodegenJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListCodegenJobsResponse(
      entities: (json['entities'] as List)
          .whereNotNull()
          .map((e) => CodegenJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final nextToken = this.nextToken;
    return {
      'entities': entities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListComponentsResponse {
  /// The list of components for the Amplify app.
  final List<ComponentSummary> entities;

  /// The pagination token that's included if more results are available.
  final String? nextToken;

  ListComponentsResponse({
    required this.entities,
    this.nextToken,
  });

  factory ListComponentsResponse.fromJson(Map<String, dynamic> json) {
    return ListComponentsResponse(
      entities: (json['entities'] as List)
          .whereNotNull()
          .map((e) => ComponentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final nextToken = this.nextToken;
    return {
      'entities': entities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFormsResponse {
  /// The list of forms for the Amplify app.
  final List<FormSummary> entities;

  /// The pagination token that's included if more results are available.
  final String? nextToken;

  ListFormsResponse({
    required this.entities,
    this.nextToken,
  });

  factory ListFormsResponse.fromJson(Map<String, dynamic> json) {
    return ListFormsResponse(
      entities: (json['entities'] as List)
          .whereNotNull()
          .map((e) => FormSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final nextToken = this.nextToken;
    return {
      'entities': entities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tag key value pairs for a specified Amazon Resource Name (ARN).
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

class ListThemesResponse {
  /// The list of themes for the Amplify app.
  final List<ThemeSummary> entities;

  /// The pagination token that's returned if more results are available.
  final String? nextToken;

  ListThemesResponse({
    required this.entities,
    this.nextToken,
  });

  factory ListThemesResponse.fromJson(Map<String, dynamic> json) {
    return ListThemesResponse(
      entities: (json['entities'] as List)
          .whereNotNull()
          .map((e) => ThemeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final nextToken = this.nextToken;
    return {
      'entities': entities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the state configuration when an action modifies a property of
/// another element within the same component.
class MutationActionSetStateParameter {
  /// The name of the component that is being modified.
  final String componentName;

  /// The name of the component property to apply the state configuration to.
  final String property;

  /// The state configuration to assign to the property.
  final ComponentProperty set;

  MutationActionSetStateParameter({
    required this.componentName,
    required this.property,
    required this.set,
  });

  factory MutationActionSetStateParameter.fromJson(Map<String, dynamic> json) {
    return MutationActionSetStateParameter(
      componentName: json['componentName'] as String,
      property: json['property'] as String,
      set: ComponentProperty.fromJson(json['set'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final componentName = this.componentName;
    final property = this.property;
    final set = this.set;
    return {
      'componentName': componentName,
      'property': property,
      'set': set,
    };
  }
}

/// Describes the configuration for an application with no API being used.
class NoApiRenderConfig {
  NoApiRenderConfig();

  factory NoApiRenderConfig.fromJson(Map<String, dynamic> _) {
    return NoApiRenderConfig();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Stores information for generating Amplify DataStore queries. Use a
/// <code>Predicate</code> to retrieve a subset of the data in a collection.
class Predicate {
  /// A list of predicates to combine logically.
  final List<Predicate>? and;

  /// The field to query.
  final String? field;

  /// The value to use when performing the evaluation.
  final String? operand;

  /// The type of value to use when performing the evaluation.
  final String? operandType;

  /// The operator to use to perform the evaluation.
  final String? operator;

  /// A list of predicates to combine logically.
  final List<Predicate>? or;

  Predicate({
    this.and,
    this.field,
    this.operand,
    this.operandType,
    this.operator,
    this.or,
  });

  factory Predicate.fromJson(Map<String, dynamic> json) {
    return Predicate(
      and: (json['and'] as List?)
          ?.whereNotNull()
          .map((e) => Predicate.fromJson(e as Map<String, dynamic>))
          .toList(),
      field: json['field'] as String?,
      operand: json['operand'] as String?,
      operandType: json['operandType'] as String?,
      operator: json['operator'] as String?,
      or: (json['or'] as List?)
          ?.whereNotNull()
          .map((e) => Predicate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final and = this.and;
    final field = this.field;
    final operand = this.operand;
    final operandType = this.operandType;
    final operator = this.operator;
    final or = this.or;
    return {
      if (and != null) 'and': and,
      if (field != null) 'field': field,
      if (operand != null) 'operand': operand,
      if (operandType != null) 'operandType': operandType,
      if (operator != null) 'operator': operator,
      if (or != null) 'or': or,
    };
  }
}

/// Stores the metadata information about a feature on a form.
class PutMetadataFlagBody {
  /// The new information to store.
  final String newValue;

  PutMetadataFlagBody({
    required this.newValue,
  });

  Map<String, dynamic> toJson() {
    final newValue = this.newValue;
    return {
      'newValue': newValue,
    };
  }
}

/// Describes the code generation job configuration for a React project.
class ReactStartCodegenJobData {
  /// The API configuration for the code generation job.
  final ApiConfiguration? apiConfiguration;

  /// Lists the dependency packages that may be required for the project code to
  /// run.
  final Map<String, String>? dependencies;

  /// Specifies whether the code generation job should render inline source maps.
  final bool? inlineSourceMap;

  /// The JavaScript module type.
  final JSModule? module;

  /// Specifies whether the code generation job should render type declaration
  /// files.
  final bool? renderTypeDeclarations;

  /// The file type to use for a JavaScript project.
  final JSScript? script;

  /// The ECMAScript specification to use.
  final JSTarget? target;

  ReactStartCodegenJobData({
    this.apiConfiguration,
    this.dependencies,
    this.inlineSourceMap,
    this.module,
    this.renderTypeDeclarations,
    this.script,
    this.target,
  });

  factory ReactStartCodegenJobData.fromJson(Map<String, dynamic> json) {
    return ReactStartCodegenJobData(
      apiConfiguration: json['apiConfiguration'] != null
          ? ApiConfiguration.fromJson(
              json['apiConfiguration'] as Map<String, dynamic>)
          : null,
      dependencies: (json['dependencies'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      inlineSourceMap: json['inlineSourceMap'] as bool?,
      module: (json['module'] as String?)?.toJSModule(),
      renderTypeDeclarations: json['renderTypeDeclarations'] as bool?,
      script: (json['script'] as String?)?.toJSScript(),
      target: (json['target'] as String?)?.toJSTarget(),
    );
  }

  Map<String, dynamic> toJson() {
    final apiConfiguration = this.apiConfiguration;
    final dependencies = this.dependencies;
    final inlineSourceMap = this.inlineSourceMap;
    final module = this.module;
    final renderTypeDeclarations = this.renderTypeDeclarations;
    final script = this.script;
    final target = this.target;
    return {
      if (apiConfiguration != null) 'apiConfiguration': apiConfiguration,
      if (dependencies != null) 'dependencies': dependencies,
      if (inlineSourceMap != null) 'inlineSourceMap': inlineSourceMap,
      if (module != null) 'module': module.toValue(),
      if (renderTypeDeclarations != null)
        'renderTypeDeclarations': renderTypeDeclarations,
      if (script != null) 'script': script.toValue(),
      if (target != null) 'target': target.toValue(),
    };
  }
}

/// Describes a refresh token.
class RefreshTokenRequestBody {
  /// The token to use to refresh a previously issued access token that might have
  /// expired.
  final String token;

  /// The ID of the client to request the token from.
  final String? clientId;

  RefreshTokenRequestBody({
    required this.token,
    this.clientId,
  });

  Map<String, dynamic> toJson() {
    final token = this.token;
    final clientId = this.clientId;
    return {
      'token': token,
      if (clientId != null) 'clientId': clientId,
    };
  }
}

class RefreshTokenResponse {
  /// The access token.
  final String accessToken;

  /// The date and time when the new access token expires.
  final int expiresIn;

  RefreshTokenResponse({
    required this.accessToken,
    required this.expiresIn,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponse(
      accessToken: json['accessToken'] as String,
      expiresIn: json['expiresIn'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final expiresIn = this.expiresIn;
    return {
      'accessToken': accessToken,
      'expiresIn': expiresIn,
    };
  }
}

/// Stores the configuration information for a visual helper element for a form.
/// A sectional element can be a header, a text block, or a divider. These
/// elements are static and not associated with any data.
class SectionalElement {
  /// The type of sectional element. Valid values are <code>Heading</code>,
  /// <code>Text</code>, and <code>Divider</code>.
  final String type;

  /// Excludes a sectional element that was generated by default for a specified
  /// data model.
  final bool? excluded;

  /// Specifies the size of the font for a <code>Heading</code> sectional element.
  /// Valid values are <code>1 | 2 | 3 | 4 | 5 | 6</code>.
  final int? level;

  /// Specifies the orientation for a <code>Divider</code> sectional element.
  /// Valid values are <code>horizontal</code> or <code>vertical</code>.
  final String? orientation;

  /// Specifies the position of the text in a field for a <code>Text</code>
  /// sectional element.
  final FieldPosition? position;

  /// The text for a <code>Text</code> sectional element.
  final String? text;

  SectionalElement({
    required this.type,
    this.excluded,
    this.level,
    this.orientation,
    this.position,
    this.text,
  });

  factory SectionalElement.fromJson(Map<String, dynamic> json) {
    return SectionalElement(
      type: json['type'] as String,
      excluded: json['excluded'] as bool?,
      level: json['level'] as int?,
      orientation: json['orientation'] as String?,
      position: json['position'] != null
          ? FieldPosition.fromJson(json['position'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final excluded = this.excluded;
    final level = this.level;
    final orientation = this.orientation;
    final position = this.position;
    final text = this.text;
    return {
      'type': type,
      if (excluded != null) 'excluded': excluded,
      if (level != null) 'level': level,
      if (orientation != null) 'orientation': orientation,
      if (position != null) 'position': position,
      if (text != null) 'text': text,
    };
  }
}

enum SortDirection {
  asc,
  desc,
}

extension SortDirectionValueExtension on SortDirection {
  String toValue() {
    switch (this) {
      case SortDirection.asc:
        return 'ASC';
      case SortDirection.desc:
        return 'DESC';
    }
  }
}

extension SortDirectionFromString on String {
  SortDirection toSortDirection() {
    switch (this) {
      case 'ASC':
        return SortDirection.asc;
      case 'DESC':
        return SortDirection.desc;
    }
    throw Exception('$this is not known in enum SortDirection');
  }
}

/// Describes how to sort the data that you bind to a component.
class SortProperty {
  /// The direction of the sort, either ascending or descending.
  final SortDirection direction;

  /// The field to perform the sort on.
  final String field;

  SortProperty({
    required this.direction,
    required this.field,
  });

  factory SortProperty.fromJson(Map<String, dynamic> json) {
    return SortProperty(
      direction: (json['direction'] as String).toSortDirection(),
      field: json['field'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final direction = this.direction;
    final field = this.field;
    return {
      'direction': direction.toValue(),
      'field': field,
    };
  }
}

/// The code generation job resource configuration.
class StartCodegenJobData {
  /// The code generation configuration for the codegen job.
  final CodegenJobRenderConfig renderConfig;

  /// Specifies whether to autogenerate forms in the code generation job.
  final bool? autoGenerateForms;

  /// The feature flags for a code generation job.
  final CodegenFeatureFlags? features;

  /// The data schema to use for a code generation job.
  final CodegenJobGenericDataSchema? genericDataSchema;

  /// One or more key-value pairs to use when tagging the code generation job
  /// data.
  final Map<String, String>? tags;

  StartCodegenJobData({
    required this.renderConfig,
    this.autoGenerateForms,
    this.features,
    this.genericDataSchema,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final renderConfig = this.renderConfig;
    final autoGenerateForms = this.autoGenerateForms;
    final features = this.features;
    final genericDataSchema = this.genericDataSchema;
    final tags = this.tags;
    return {
      'renderConfig': renderConfig,
      if (autoGenerateForms != null) 'autoGenerateForms': autoGenerateForms,
      if (features != null) 'features': features,
      if (genericDataSchema != null) 'genericDataSchema': genericDataSchema,
      if (tags != null) 'tags': tags,
    };
  }
}

class StartCodegenJobResponse {
  /// The code generation job for a UI component that is associated with an
  /// Amplify app.
  final CodegenJob? entity;

  StartCodegenJobResponse({
    this.entity,
  });

  Map<String, dynamic> toJson() {
    final entity = this.entity;
    return {
      if (entity != null) 'entity': entity,
    };
  }
}

enum StorageAccessLevel {
  public,
  protected,
  private,
}

extension StorageAccessLevelValueExtension on StorageAccessLevel {
  String toValue() {
    switch (this) {
      case StorageAccessLevel.public:
        return 'public';
      case StorageAccessLevel.protected:
        return 'protected';
      case StorageAccessLevel.private:
        return 'private';
    }
  }
}

extension StorageAccessLevelFromString on String {
  StorageAccessLevel toStorageAccessLevel() {
    switch (this) {
      case 'public':
        return StorageAccessLevel.public;
      case 'protected':
        return StorageAccessLevel.protected;
      case 'private':
        return StorageAccessLevel.private;
    }
    throw Exception('$this is not known in enum StorageAccessLevel');
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

/// A theme is a collection of style settings that apply globally to the
/// components associated with an Amplify application.
class Theme {
  /// The unique ID for the Amplify app associated with the theme.
  final String appId;

  /// The time that the theme was created.
  final DateTime createdAt;

  /// The name of the backend environment that is a part of the Amplify app.
  final String environmentName;

  /// The ID for the theme.
  final String id;

  /// The name of the theme.
  final String name;

  /// A list of key-value pairs that defines the properties of the theme.
  final List<ThemeValues> values;

  /// The time that the theme was modified.
  final DateTime? modifiedAt;

  /// Describes the properties that can be overriden to customize a theme.
  final List<ThemeValues>? overrides;

  /// One or more key-value pairs to use when tagging the theme.
  final Map<String, String>? tags;

  Theme({
    required this.appId,
    required this.createdAt,
    required this.environmentName,
    required this.id,
    required this.name,
    required this.values,
    this.modifiedAt,
    this.overrides,
    this.tags,
  });

  factory Theme.fromJson(Map<String, dynamic> json) {
    return Theme(
      appId: json['appId'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      environmentName: json['environmentName'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => ThemeValues.fromJson(e as Map<String, dynamic>))
          .toList(),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      overrides: (json['overrides'] as List?)
          ?.whereNotNull()
          .map((e) => ThemeValues.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final createdAt = this.createdAt;
    final environmentName = this.environmentName;
    final id = this.id;
    final name = this.name;
    final values = this.values;
    final modifiedAt = this.modifiedAt;
    final overrides = this.overrides;
    final tags = this.tags;
    return {
      'appId': appId,
      'createdAt': iso8601ToJson(createdAt),
      'environmentName': environmentName,
      'id': id,
      'name': name,
      'values': values,
      if (modifiedAt != null) 'modifiedAt': iso8601ToJson(modifiedAt),
      if (overrides != null) 'overrides': overrides,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes the basic information about a theme.
class ThemeSummary {
  /// The unique ID for the app associated with the theme summary.
  final String appId;

  /// The name of the backend environment that is part of the Amplify app.
  final String environmentName;

  /// The ID of the theme.
  final String id;

  /// The name of the theme.
  final String name;

  ThemeSummary({
    required this.appId,
    required this.environmentName,
    required this.id,
    required this.name,
  });

  factory ThemeSummary.fromJson(Map<String, dynamic> json) {
    return ThemeSummary(
      appId: json['appId'] as String,
      environmentName: json['environmentName'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final environmentName = this.environmentName;
    final id = this.id;
    final name = this.name;
    return {
      'appId': appId,
      'environmentName': environmentName,
      'id': id,
      'name': name,
    };
  }
}

/// Describes the configuration of a theme's properties.
class ThemeValue {
  /// A list of key-value pairs that define the theme's properties.
  final List<ThemeValues>? children;

  /// The value of a theme property.
  final String? value;

  ThemeValue({
    this.children,
    this.value,
  });

  factory ThemeValue.fromJson(Map<String, dynamic> json) {
    return ThemeValue(
      children: (json['children'] as List?)
          ?.whereNotNull()
          .map((e) => ThemeValues.fromJson(e as Map<String, dynamic>))
          .toList(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final children = this.children;
    final value = this.value;
    return {
      if (children != null) 'children': children,
      if (value != null) 'value': value,
    };
  }
}

/// A key-value pair that defines a property of a theme.
class ThemeValues {
  /// The name of the property.
  final String? key;

  /// The value of the property.
  final ThemeValue? value;

  ThemeValues({
    this.key,
    this.value,
  });

  factory ThemeValues.fromJson(Map<String, dynamic> json) {
    return ThemeValues(
      key: json['key'] as String?,
      value: json['value'] != null
          ? ThemeValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

enum TokenProviders {
  figma,
}

extension TokenProvidersValueExtension on TokenProviders {
  String toValue() {
    switch (this) {
      case TokenProviders.figma:
        return 'figma';
    }
  }
}

extension TokenProvidersFromString on String {
  TokenProviders toTokenProviders() {
    switch (this) {
      case 'figma':
        return TokenProviders.figma;
    }
    throw Exception('$this is not known in enum TokenProviders');
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

/// Updates and saves all of the information about a component, based on
/// component ID.
class UpdateComponentData {
  /// The data binding information for the component's properties.
  final Map<String, ComponentBindingPropertiesValue>? bindingProperties;

  /// The components that are instances of the main component.
  final List<ComponentChild>? children;

  /// The configuration for binding a component's properties to a data model. Use
  /// this for a collection component.
  final Map<String, ComponentDataConfiguration>? collectionProperties;

  /// The type of the component. This can be an Amplify custom UI component or
  /// another custom component.
  final String? componentType;

  /// The event configuration for the component. Use for the workflow feature in
  /// Amplify Studio that allows you to bind events and actions to components.
  final Map<String, ComponentEvent>? events;

  /// The unique ID of the component to update.
  final String? id;

  /// The name of the component to update.
  final String? name;

  /// Describes the properties that can be overriden to customize the component.
  final Map<String, Map<String, String>>? overrides;

  /// Describes the component's properties.
  final Map<String, ComponentProperty>? properties;

  /// The schema version of the component when it was imported.
  final String? schemaVersion;

  /// The unique ID of the component in its original source system, such as Figma.
  final String? sourceId;

  /// A list of the unique variants of the main component being updated.
  final List<ComponentVariant>? variants;

  UpdateComponentData({
    this.bindingProperties,
    this.children,
    this.collectionProperties,
    this.componentType,
    this.events,
    this.id,
    this.name,
    this.overrides,
    this.properties,
    this.schemaVersion,
    this.sourceId,
    this.variants,
  });

  Map<String, dynamic> toJson() {
    final bindingProperties = this.bindingProperties;
    final children = this.children;
    final collectionProperties = this.collectionProperties;
    final componentType = this.componentType;
    final events = this.events;
    final id = this.id;
    final name = this.name;
    final overrides = this.overrides;
    final properties = this.properties;
    final schemaVersion = this.schemaVersion;
    final sourceId = this.sourceId;
    final variants = this.variants;
    return {
      if (bindingProperties != null) 'bindingProperties': bindingProperties,
      if (children != null) 'children': children,
      if (collectionProperties != null)
        'collectionProperties': collectionProperties,
      if (componentType != null) 'componentType': componentType,
      if (events != null) 'events': events,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (overrides != null) 'overrides': overrides,
      if (properties != null) 'properties': properties,
      if (schemaVersion != null) 'schemaVersion': schemaVersion,
      if (sourceId != null) 'sourceId': sourceId,
      if (variants != null) 'variants': variants,
    };
  }
}

class UpdateComponentResponse {
  /// Describes the configuration of the updated component.
  final Component? entity;

  UpdateComponentResponse({
    this.entity,
  });

  Map<String, dynamic> toJson() {
    final entity = this.entity;
    return {
      if (entity != null) 'entity': entity,
    };
  }
}

/// Updates and saves all of the information about a form, based on form ID.
class UpdateFormData {
  /// The <code>FormCTA</code> object that stores the call to action configuration
  /// for the form.
  final FormCTA? cta;

  /// The type of data source to use to create the form.
  final FormDataTypeConfig? dataType;

  /// The configuration information for the form's fields.
  final Map<String, FieldConfig>? fields;

  /// Specifies whether to perform a create or update action on the form.
  final FormActionType? formActionType;

  /// Specifies an icon or decoration to display on the form.
  final LabelDecorator? labelDecorator;

  /// The name of the form.
  final String? name;

  /// The schema version of the form.
  final String? schemaVersion;

  /// The configuration information for the visual helper elements for the form.
  /// These elements are not associated with any data.
  final Map<String, SectionalElement>? sectionalElements;

  /// The configuration for the form's style.
  final FormStyle? style;

  UpdateFormData({
    this.cta,
    this.dataType,
    this.fields,
    this.formActionType,
    this.labelDecorator,
    this.name,
    this.schemaVersion,
    this.sectionalElements,
    this.style,
  });

  Map<String, dynamic> toJson() {
    final cta = this.cta;
    final dataType = this.dataType;
    final fields = this.fields;
    final formActionType = this.formActionType;
    final labelDecorator = this.labelDecorator;
    final name = this.name;
    final schemaVersion = this.schemaVersion;
    final sectionalElements = this.sectionalElements;
    final style = this.style;
    return {
      if (cta != null) 'cta': cta,
      if (dataType != null) 'dataType': dataType,
      if (fields != null) 'fields': fields,
      if (formActionType != null) 'formActionType': formActionType.toValue(),
      if (labelDecorator != null) 'labelDecorator': labelDecorator.toValue(),
      if (name != null) 'name': name,
      if (schemaVersion != null) 'schemaVersion': schemaVersion,
      if (sectionalElements != null) 'sectionalElements': sectionalElements,
      if (style != null) 'style': style,
    };
  }
}

class UpdateFormResponse {
  /// Describes the configuration of the updated form.
  final Form? entity;

  UpdateFormResponse({
    this.entity,
  });

  Map<String, dynamic> toJson() {
    final entity = this.entity;
    return {
      if (entity != null) 'entity': entity,
    };
  }
}

/// Saves the data binding information for a theme.
class UpdateThemeData {
  /// A list of key-value pairs that define the theme's properties.
  final List<ThemeValues> values;

  /// The unique ID of the theme to update.
  final String? id;

  /// The name of the theme to update.
  final String? name;

  /// Describes the properties that can be overriden to customize the theme.
  final List<ThemeValues>? overrides;

  UpdateThemeData({
    required this.values,
    this.id,
    this.name,
    this.overrides,
  });

  Map<String, dynamic> toJson() {
    final values = this.values;
    final id = this.id;
    final name = this.name;
    final overrides = this.overrides;
    return {
      'values': values,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (overrides != null) 'overrides': overrides,
    };
  }
}

class UpdateThemeResponse {
  /// Describes the configuration of the updated theme.
  final Theme? entity;

  UpdateThemeResponse({
    this.entity,
  });

  Map<String, dynamic> toJson() {
    final entity = this.entity;
    return {
      if (entity != null) 'entity': entity,
    };
  }
}

/// Associates a complex object with a display value. Use
/// <code>ValueMapping</code> to store how to represent complex objects when
/// they are displayed.
class ValueMapping {
  /// The complex object.
  final FormInputValueProperty value;

  /// The value to display for the complex object.
  final FormInputValueProperty? displayValue;

  ValueMapping({
    required this.value,
    this.displayValue,
  });

  factory ValueMapping.fromJson(Map<String, dynamic> json) {
    return ValueMapping(
      value: FormInputValueProperty.fromJson(
          json['value'] as Map<String, dynamic>),
      displayValue: json['displayValue'] != null
          ? FormInputValueProperty.fromJson(
              json['displayValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final displayValue = this.displayValue;
    return {
      'value': value,
      if (displayValue != null) 'displayValue': displayValue,
    };
  }
}

/// Represents the data binding configuration for a value map.
class ValueMappings {
  /// The value and display value pairs.
  final List<ValueMapping> values;

  /// The information to bind fields to data at runtime.
  final Map<String, FormInputBindingPropertiesValue>? bindingProperties;

  ValueMappings({
    required this.values,
    this.bindingProperties,
  });

  factory ValueMappings.fromJson(Map<String, dynamic> json) {
    return ValueMappings(
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => ValueMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      bindingProperties: (json['bindingProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              FormInputBindingPropertiesValue.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final values = this.values;
    final bindingProperties = this.bindingProperties;
    return {
      'values': values,
      if (bindingProperties != null) 'bindingProperties': bindingProperties,
    };
  }
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String? type, String? message})
      : super(type: type, code: 'ResourceConflictException', message: message);
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

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
