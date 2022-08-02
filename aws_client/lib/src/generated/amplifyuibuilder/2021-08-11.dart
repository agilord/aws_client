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
          endpointUrl: endpointUrl,
        );

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
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(componentToCreate, 'componentToCreate');
    ArgumentError.checkNotNull(environmentName, 'environmentName');
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
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    ArgumentError.checkNotNull(themeToCreate, 'themeToCreate');
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
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    ArgumentError.checkNotNull(id, 'id');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/components/${Uri.encodeComponent(id)}',
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
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    ArgumentError.checkNotNull(id, 'id');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/app/${Uri.encodeComponent(appId)}/environment/${Uri.encodeComponent(environmentName)}/themes/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Exchanges an access code for a token.
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
    ArgumentError.checkNotNull(provider, 'provider');
    ArgumentError.checkNotNull(request, 'request');
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
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(environmentName, 'environmentName');
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
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(environmentName, 'environmentName');
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
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    ArgumentError.checkNotNull(id, 'id');
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
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    ArgumentError.checkNotNull(id, 'id');
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
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(environmentName, 'environmentName');
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
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(environmentName, 'environmentName');
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

  /// Refreshes a previously issued access token that might have expired.
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
    ArgumentError.checkNotNull(provider, 'provider');
    ArgumentError.checkNotNull(refreshTokenBody, 'refreshTokenBody');
    final response = await _protocol.send(
      payload: refreshTokenBody,
      method: 'POST',
      requestUri: '/tokens/${Uri.encodeComponent(provider.toValue())}/refresh',
      exceptionFnMap: _exceptionFns,
    );
    return RefreshTokenResponse.fromJson(response);
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
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(updatedComponent, 'updatedComponent');
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
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(updatedTheme, 'updatedTheme');
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

  /// An authenticated user attribute.
  final String? userAttribute;

  ComponentBindingPropertiesValueProperties({
    this.bucket,
    this.defaultValue,
    this.field,
    this.key,
    this.model,
    this.predicates,
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
    final userAttribute = this.userAttribute;
    return {
      if (bucket != null) 'bucket': bucket,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (field != null) 'field': field,
      if (key != null) 'key': key,
      if (model != null) 'model': model,
      if (predicates != null) 'predicates': predicates,
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

  factory CreateComponentData.fromJson(Map<String, dynamic> json) {
    return CreateComponentData(
      bindingProperties: (json['bindingProperties'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(
              k,
              ComponentBindingPropertiesValue.fromJson(
                  e as Map<String, dynamic>))),
      componentType: json['componentType'] as String,
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
      schemaVersion: json['schemaVersion'] as String?,
      sourceId: json['sourceId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

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

  factory CreateComponentResponse.fromJson(Map<String, dynamic> json) {
    return CreateComponentResponse(
      entity: json['entity'] != null
          ? Component.fromJson(json['entity'] as Map<String, dynamic>)
          : null,
    );
  }

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

  factory CreateThemeData.fromJson(Map<String, dynamic> json) {
    return CreateThemeData(
      name: json['name'] as String,
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => ThemeValues.fromJson(e as Map<String, dynamic>))
          .toList(),
      overrides: (json['overrides'] as List?)
          ?.whereNotNull()
          .map((e) => ThemeValues.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

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

  factory CreateThemeResponse.fromJson(Map<String, dynamic> json) {
    return CreateThemeResponse(
      entity: json['entity'] != null
          ? Theme.fromJson(json['entity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entity = this.entity;
    return {
      if (entity != null) 'entity': entity,
    };
  }
}

/// Describes the configuration of a request to exchange an access code for a
/// token.
class ExchangeCodeForTokenRequestBody {
  /// The access code to send in the request.
  final String code;

  /// The location of the application that will receive the access code.
  final String redirectUri;

  ExchangeCodeForTokenRequestBody({
    required this.code,
    required this.redirectUri,
  });

  factory ExchangeCodeForTokenRequestBody.fromJson(Map<String, dynamic> json) {
    return ExchangeCodeForTokenRequestBody(
      code: json['code'] as String,
      redirectUri: json['redirectUri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final redirectUri = this.redirectUri;
    return {
      'code': code,
      'redirectUri': redirectUri,
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

class GetComponentResponse {
  /// Represents the configuration settings for the component.
  final Component? component;

  GetComponentResponse({
    this.component,
  });

  factory GetComponentResponse.fromJson(Map<String, dynamic> json) {
    return GetComponentResponse(
      component: json['component'] != null
          ? Component.fromJson(json['component'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final component = this.component;
    return {
      if (component != null) 'component': component,
    };
  }
}

class GetThemeResponse {
  /// Represents the configuration settings for the theme.
  final Theme? theme;

  GetThemeResponse({
    this.theme,
  });

  factory GetThemeResponse.fromJson(Map<String, dynamic> json) {
    return GetThemeResponse(
      theme: json['theme'] != null
          ? Theme.fromJson(json['theme'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final theme = this.theme;
    return {
      if (theme != null) 'theme': theme,
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

/// Stores information for generating Amplify DataStore queries. Use a
/// <code>Predicate</code> to retrieve a subset of the data in a collection.
class Predicate {
  /// A list of predicates to combine logically.
  final List<Predicate>? and;

  /// The field to query.
  final String? field;

  /// The value to use when performing the evaluation.
  final String? operand;

  /// The operator to use to perform the evaluation.
  final String? operator;

  /// A list of predicates to combine logically.
  final List<Predicate>? or;

  Predicate({
    this.and,
    this.field,
    this.operand,
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
    final operator = this.operator;
    final or = this.or;
    return {
      if (and != null) 'and': and,
      if (field != null) 'field': field,
      if (operand != null) 'operand': operand,
      if (operator != null) 'operator': operator,
      if (or != null) 'or': or,
    };
  }
}

/// Describes a refresh token.
class RefreshTokenRequestBody {
  /// The token to use to refresh a previously issued access token that might have
  /// expired.
  final String token;

  RefreshTokenRequestBody({
    required this.token,
  });

  factory RefreshTokenRequestBody.fromJson(Map<String, dynamic> json) {
    return RefreshTokenRequestBody(
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final token = this.token;
    return {
      'token': token,
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

enum SortDirection {
  asc,
  desc,
}

extension on SortDirection {
  String toValue() {
    switch (this) {
      case SortDirection.asc:
        return 'ASC';
      case SortDirection.desc:
        return 'DESC';
    }
  }
}

extension on String {
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

extension on TokenProviders {
  String toValue() {
    switch (this) {
      case TokenProviders.figma:
        return 'figma';
    }
  }
}

extension on String {
  TokenProviders toTokenProviders() {
    switch (this) {
      case 'figma':
        return TokenProviders.figma;
    }
    throw Exception('$this is not known in enum TokenProviders');
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

  factory UpdateComponentData.fromJson(Map<String, dynamic> json) {
    return UpdateComponentData(
      bindingProperties: (json['bindingProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              ComponentBindingPropertiesValue.fromJson(
                  e as Map<String, dynamic>))),
      children: (json['children'] as List?)
          ?.whereNotNull()
          .map((e) => ComponentChild.fromJson(e as Map<String, dynamic>))
          .toList(),
      collectionProperties: (json['collectionProperties']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k,
              ComponentDataConfiguration.fromJson(e as Map<String, dynamic>))),
      componentType: json['componentType'] as String?,
      events: (json['events'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ComponentEvent.fromJson(e as Map<String, dynamic>))),
      id: json['id'] as String?,
      name: json['name'] as String?,
      overrides: (json['overrides'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))),
      properties: (json['properties'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ComponentProperty.fromJson(e as Map<String, dynamic>))),
      schemaVersion: json['schemaVersion'] as String?,
      sourceId: json['sourceId'] as String?,
      variants: (json['variants'] as List?)
          ?.whereNotNull()
          .map((e) => ComponentVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

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

  factory UpdateComponentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateComponentResponse(
      entity: json['entity'] != null
          ? Component.fromJson(json['entity'] as Map<String, dynamic>)
          : null,
    );
  }

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

  factory UpdateThemeData.fromJson(Map<String, dynamic> json) {
    return UpdateThemeData(
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => ThemeValues.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      name: json['name'] as String?,
      overrides: (json['overrides'] as List?)
          ?.whereNotNull()
          .map((e) => ThemeValues.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

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

  factory UpdateThemeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateThemeResponse(
      entity: json['entity'] != null
          ? Theme.fromJson(json['entity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entity = this.entity;
    return {
      if (entity != null) 'entity': entity,
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
};
