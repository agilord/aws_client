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

/// The Places API enables powerful location search and geocoding capabilities
/// for your applications, offering global coverage with rich, detailed
/// information. Key features include:
///
/// <ul>
/// <li>
/// Forward and reverse geocoding for addresses and coordinates
/// </li>
/// <li>
/// Comprehensive place searches with detailed information, including:
///
/// <ul>
/// <li>
/// Business names and addresses
/// </li>
/// <li>
/// Contact information
/// </li>
/// <li>
/// Hours of operation
/// </li>
/// <li>
/// POI (Points of Interest) categories
/// </li>
/// <li>
/// Food types for restaurants
/// </li>
/// <li>
/// Chain affiliation for relevant businesses
/// </li>
/// </ul> </li>
/// <li>
/// Global data coverage with a wide range of POI categories
/// </li>
/// <li>
/// Regular data updates to ensure accuracy and relevance
/// </li>
/// </ul>
class GeoPlaces {
  final _s.RestJsonProtocol _protocol;
  GeoPlaces({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'geo-places',
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

  /// <code>Autocomplete</code> completes potential places and addresses as the
  /// user types, based on the partial input. The API enhances the efficiency
  /// and accuracy of address by completing query based on a few entered
  /// keystrokes. It helps you by completing partial queries with valid address
  /// completion. Also, the API supports the filtering of results based on
  /// geographic location, country, or specific place types, and can be tailored
  /// using optional parameters like language and political views.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/autocomplete.html">Autocomplete</a>
  /// in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryText] :
  /// The free-form text query to match addresses against. This is usually a
  /// partially typed address from an end user in an address box or form.
  /// <note>
  /// The fields <code>QueryText</code>, and <code>QueryID</code> are mutually
  /// exclusive.
  /// </note>
  ///
  /// Parameter [additionalFeatures] :
  /// A list of optional additional parameters that can be requested for each
  /// result.
  ///
  /// Parameter [biasPosition] :
  /// The position in longitude and latitude that the results should be close
  /// to. Typically, place results returned are ranked higher the closer they
  /// are to this position. Stored in <code>\[lng, lat\]</code> and in the WGS
  /// 84 format.
  /// <note>
  /// The fields <code>BiasPosition</code>, <code>FilterBoundingBox</code>, and
  /// <code>FilterCircle</code> are mutually exclusive.
  /// </note>
  ///
  /// Parameter [filter] :
  /// A structure which contains a set of inclusion/exclusion properties that
  /// results must possess in order to be returned as a result.
  ///
  /// Parameter [intendedUse] :
  /// Indicates if the query results will be persisted in customer
  /// infrastructure. Defaults to <code>SingleUse</code> (not stored).
  /// Currently, <code>Autocomplete</code> does not support storage of results.
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [language] :
  /// A list of <a href="https://en.wikipedia.org/wiki/IETF_language_tag">BCP
  /// 47</a> compliant language codes for the results to be rendered in. If
  /// there is no data for the result in the requested language, data will be
  /// returned in the default language for the entry.
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of results returned in a single call.
  ///
  /// Default value: 5
  ///
  /// Parameter [politicalView] :
  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country.
  ///
  /// The following political views are currently supported:
  ///
  /// <ul>
  /// <li>
  /// <code>ARG</code>: Argentina's view on the Southern Patagonian Ice Field
  /// and Tierra Del Fuego, including the Falkland Islands, South Georgia, and
  /// South Sandwich Islands
  /// </li>
  /// <li>
  /// <code>EGY</code>: Egypt's view on Bir Tawil
  /// </li>
  /// <li>
  /// <code>IND</code>: India's view on Gilgit-Baltistan
  /// </li>
  /// <li>
  /// <code>KEN</code>: Kenya's view on the Ilemi Triangle
  /// </li>
  /// <li>
  /// <code>MAR</code>: Morocco's view on Western Sahara
  /// </li>
  /// <li>
  /// <code>RUS</code>: Russia's view on Crimea
  /// </li>
  /// <li>
  /// <code>SDN</code>: Sudan's view on the Halaib Triangle
  /// </li>
  /// <li>
  /// <code>SRB</code>: Serbia's view on Kosovo, Vukovar, and Sarengrad Islands
  /// </li>
  /// <li>
  /// <code>SUR</code>: Suriname's view on the Courantyne Headwaters and Lawa
  /// Headwaters
  /// </li>
  /// <li>
  /// <code>SYR</code>: Syria's view on the Golan Heights
  /// </li>
  /// <li>
  /// <code>TUR</code>: Turkey's view on Cyprus and Northern Cyprus
  /// </li>
  /// <li>
  /// <code>TZA</code>: Tanzania's view on Lake Malawi
  /// </li>
  /// <li>
  /// <code>URY</code>: Uruguay's view on Rincon de Artigas
  /// </li>
  /// <li>
  /// <code>VNM</code>: Vietnam's view on the Paracel Islands and Spratly
  /// Islands
  /// </li>
  /// </ul>
  ///
  /// Parameter [postalCodeMode] :
  /// The <code>PostalCodeMode</code> affects how postal code results are
  /// returned. If a postal code spans multiple localities and this value is
  /// empty, partial district or locality information may be returned under a
  /// single postal code result entry. If it's populated with the value
  /// <code>EnumerateSpannedLocalities</code>, all cities in that postal code
  /// are returned.
  Future<AutocompleteResponse> autocomplete({
    required String queryText,
    List<AutocompleteAdditionalFeature>? additionalFeatures,
    List<double>? biasPosition,
    AutocompleteFilter? filter,
    AutocompleteIntendedUse? intendedUse,
    String? key,
    String? language,
    int? maxResults,
    String? politicalView,
    PostalCodeMode? postalCodeMode,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'QueryText': queryText,
      if (additionalFeatures != null)
        'AdditionalFeatures': additionalFeatures.map((e) => e.value).toList(),
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filter != null) 'Filter': filter,
      if (intendedUse != null) 'IntendedUse': intendedUse.value,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
      if (politicalView != null) 'PoliticalView': politicalView,
      if (postalCodeMode != null) 'PostalCodeMode': postalCodeMode.value,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/autocomplete',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return AutocompleteResponse(
      resultItems: ($json['ResultItems'] as List?)
          ?.nonNulls
          .map(
              (e) => AutocompleteResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
    );
  }

  /// <code>Geocode</code> converts a textual address or place into geographic
  /// coordinates. You can obtain geographic coordinates, address component, and
  /// other related information. It supports flexible queries, including
  /// free-form text or structured queries with components like street names,
  /// postal codes, and regions. The Geocode API can also provide additional
  /// features such as time zone information and the inclusion of political
  /// views.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/geocode.html">Geocode</a>
  /// in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [additionalFeatures] :
  /// A list of optional additional parameters, such as time zone, that can be
  /// requested for each result.
  ///
  /// Parameter [biasPosition] :
  /// The position, in longitude and latitude, that the results should be close
  /// to. Typically, place results returned are ranked higher the closer they
  /// are to this position. Stored in <code>\[lng, lat\]</code> and in the WGS
  /// 84 format.
  ///
  /// Parameter [filter] :
  /// A structure which contains a set of inclusion/exclusion properties that
  /// results must possess in order to be returned as a result.
  ///
  /// Parameter [intendedUse] :
  /// Indicates if the query results will be persisted in customer
  /// infrastructure. Defaults to <code>SingleUse</code> (not stored). Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// <note>
  /// When storing <code>Geocode</code> responses, you <i>must</i> set this
  /// field to <code>Storage</code> to comply with the terms of service. These
  /// requests will be charged at a higher rate. Please review the <a
  /// href="https://aws.amazon.com/location/sla/">user agreement</a> and <a
  /// href="https://aws.amazon.com/location/pricing/">service pricing
  /// structure</a> to determine the correct setting for your use case.
  /// </note>
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [language] :
  /// A list of <a href="https://en.wikipedia.org/wiki/IETF_language_tag">BCP
  /// 47</a> compliant language codes for the results to be rendered in. If
  /// there is no data for the result in the requested language, data will be
  /// returned in the default language for the entry.
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of results returned in a single call.
  ///
  /// Default value: 20
  ///
  /// Parameter [politicalView] :
  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country.
  ///
  /// Parameter [queryText] :
  /// The free-form text query to match addresses against. This is usually a
  /// partially typed address from an end user in an address box or form.
  Future<GeocodeResponse> geocode({
    List<GeocodeAdditionalFeature>? additionalFeatures,
    List<double>? biasPosition,
    GeocodeFilter? filter,
    GeocodeIntendedUse? intendedUse,
    String? key,
    String? language,
    int? maxResults,
    String? politicalView,
    GeocodeQueryComponents? queryComponents,
    String? queryText,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      if (additionalFeatures != null)
        'AdditionalFeatures': additionalFeatures.map((e) => e.value).toList(),
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filter != null) 'Filter': filter,
      if (intendedUse != null) 'IntendedUse': intendedUse.value,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
      if (politicalView != null) 'PoliticalView': politicalView,
      if (queryComponents != null) 'QueryComponents': queryComponents,
      if (queryText != null) 'QueryText': queryText,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/geocode',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GeocodeResponse(
      resultItems: ($json['ResultItems'] as List?)
          ?.nonNulls
          .map((e) => GeocodeResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
    );
  }

  /// <code>GetPlace</code> finds a place by its unique ID. A
  /// <code>PlaceId</code> is returned by other place operations.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/get-place.html">GetPlace</a>
  /// in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [placeId] :
  /// The <code>PlaceId</code> of the place you wish to receive the information
  /// for.
  ///
  /// Parameter [additionalFeatures] :
  /// A list of optional additional parameters such as time zone that can be
  /// requested for each result. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only the <code>TimeZone</code> value.
  ///
  /// Parameter [intendedUse] :
  /// Indicates if the query results will be persisted in customer
  /// infrastructure. Defaults to <code>SingleUse</code> (not stored). Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// <note>
  /// When storing <code>GetPlace</code> responses, you <i>must</i> set this
  /// field to <code>Storage</code> to comply with the terms of service. These
  /// requests will be charged at a higher rate. Please review the <a
  /// href="https://aws.amazon.com/location/sla/">user agreement</a> and <a
  /// href="https://aws.amazon.com/location/pricing/">service pricing
  /// structure</a> to determine the correct setting for your use case.
  /// </note>
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [language] :
  /// A list of <a href="https://en.wikipedia.org/wiki/IETF_language_tag">BCP
  /// 47</a> compliant language codes for the results to be rendered in. If
  /// there is no data for the result in the requested language, data will be
  /// returned in the default language for the entry. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only the following codes: <code>en, id, km, lo, ms, my,
  /// pt, th, tl, vi, zh</code>
  ///
  /// Parameter [politicalView] :
  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  Future<GetPlaceResponse> getPlace({
    required String placeId,
    List<GetPlaceAdditionalFeature>? additionalFeatures,
    GetPlaceIntendedUse? intendedUse,
    String? key,
    String? language,
    String? politicalView,
  }) async {
    final $query = <String, List<String>>{
      if (additionalFeatures != null)
        'additional-features': additionalFeatures.map((e) => e.value).toList(),
      if (intendedUse != null) 'intended-use': [intendedUse.value],
      if (key != null) 'key': [key],
      if (language != null) 'language': [language],
      if (politicalView != null) 'political-view': [politicalView],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v2/place/${Uri.encodeComponent(placeId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetPlaceResponse(
      placeId: ($json['PlaceId'] as String?) ?? '',
      placeType: PlaceType.fromString(($json['PlaceType'] as String?) ?? ''),
      title: ($json['Title'] as String?) ?? '',
      accessPoints: ($json['AccessPoints'] as List?)
          ?.nonNulls
          .map((e) => AccessPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessRestrictions: ($json['AccessRestrictions'] as List?)
          ?.nonNulls
          .map((e) => AccessRestriction.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: $json['Address'] != null
          ? Address.fromJson($json['Address'] as Map<String, dynamic>)
          : null,
      addressNumberCorrected: $json['AddressNumberCorrected'] as bool?,
      businessChains: ($json['BusinessChains'] as List?)
          ?.nonNulls
          .map((e) => BusinessChain.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: ($json['Categories'] as List?)
          ?.nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      contacts: $json['Contacts'] != null
          ? Contacts.fromJson($json['Contacts'] as Map<String, dynamic>)
          : null,
      foodTypes: ($json['FoodTypes'] as List?)
          ?.nonNulls
          .map((e) => FoodType.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainAddress: $json['MainAddress'] != null
          ? RelatedPlace.fromJson($json['MainAddress'] as Map<String, dynamic>)
          : null,
      mapView: ($json['MapView'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      openingHours: ($json['OpeningHours'] as List?)
          ?.nonNulls
          .map((e) => OpeningHours.fromJson(e as Map<String, dynamic>))
          .toList(),
      phonemes: $json['Phonemes'] != null
          ? PhonemeDetails.fromJson($json['Phonemes'] as Map<String, dynamic>)
          : null,
      politicalView: $json['PoliticalView'] as String?,
      position: ($json['Position'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      postalCodeDetails: ($json['PostalCodeDetails'] as List?)
          ?.nonNulls
          .map((e) => PostalCodeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondaryAddresses: ($json['SecondaryAddresses'] as List?)
          ?.nonNulls
          .map((e) => RelatedPlace.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeZone: $json['TimeZone'] != null
          ? TimeZone.fromJson($json['TimeZone'] as Map<String, dynamic>)
          : null,
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
    );
  }

  /// <code>ReverseGeocode</code> converts geographic coordinates into a
  /// human-readable address or place. You can obtain address component, and
  /// other related information such as place type, category, street
  /// information. The Reverse Geocode API supports filtering to on place type
  /// so that you can refine result based on your need. Also, The Reverse
  /// Geocode API can also provide additional features such as time zone
  /// information and the inclusion of political views.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/reverse-geocode.html">Reverse
  /// Geocode</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryPosition] :
  /// The position in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\] for which you are querying nearby results for. Results closer
  /// to the position will be ranked higher then results further away from the
  /// position
  ///
  /// Parameter [additionalFeatures] :
  /// A list of optional additional parameters, such as time zone that can be
  /// requested for each result. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only the <code>TimeZone</code> value.
  ///
  /// Parameter [filter] :
  /// A structure which contains a set of inclusion/exclusion properties that
  /// results must possess in order to be returned as a result.
  ///
  /// Parameter [heading] :
  /// The heading in degrees from true north in a navigation context. The
  /// heading is measured as the angle clockwise from the North direction.
  ///
  /// Example: North is <code>0</code> degrees, East is <code>90</code> degrees,
  /// South is <code>180</code> degrees, and West is <code>270</code> degrees.
  ///
  /// Parameter [intendedUse] :
  /// Indicates if the query results will be persisted in customer
  /// infrastructure. Defaults to <code>SingleUse</code> (not stored).
  /// <note>
  /// When storing <code>ReverseGeocode</code> responses, you <i>must</i> set
  /// this field to <code>Storage</code> to comply with the terms of service.
  /// These requests will be charged at a higher rate. Please review the <a
  /// href="https://aws.amazon.com/location/sla/">user agreement</a> and <a
  /// href="https://aws.amazon.com/location/pricing/">service pricing
  /// structure</a> to determine the correct setting for your use case.
  /// </note>
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [language] :
  /// A list of <a href="https://en.wikipedia.org/wiki/IETF_language_tag">BCP
  /// 47</a> compliant language codes for the results to be rendered in. If
  /// there is no data for the result in the requested language, data will be
  /// returned in the default language for the entry. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only the following codes: <code>en, id, km, lo, ms, my,
  /// pt, th, tl, vi, zh</code>
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of results returned in a single call.
  ///
  /// Default value: 1
  ///
  /// Parameter [politicalView] :
  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [queryRadius] :
  /// The maximum distance in meters from the QueryPosition from which a result
  /// will be returned. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only up to a maximum value of 100,000.
  Future<ReverseGeocodeResponse> reverseGeocode({
    required List<double> queryPosition,
    List<ReverseGeocodeAdditionalFeature>? additionalFeatures,
    ReverseGeocodeFilter? filter,
    double? heading,
    ReverseGeocodeIntendedUse? intendedUse,
    String? key,
    String? language,
    int? maxResults,
    String? politicalView,
    int? queryRadius,
  }) async {
    _s.validateNumRange(
      'heading',
      heading,
      0.0,
      360.0,
    );
    _s.validateNumRange(
      'queryRadius',
      queryRadius,
      0,
      4294967295,
    );
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'QueryPosition': queryPosition,
      if (additionalFeatures != null)
        'AdditionalFeatures': additionalFeatures.map((e) => e.value).toList(),
      if (filter != null) 'Filter': filter,
      if (heading != null) 'Heading': heading,
      if (intendedUse != null) 'IntendedUse': intendedUse.value,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
      if (politicalView != null) 'PoliticalView': politicalView,
      if (queryRadius != null) 'QueryRadius': queryRadius,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/reverse-geocode',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ReverseGeocodeResponse(
      resultItems: ($json['ResultItems'] as List?)
          ?.nonNulls
          .map((e) =>
              ReverseGeocodeResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
    );
  }

  /// <code>SearchNearby</code> queries for points of interest within a radius
  /// from a central coordinates, returning place results with optional filters
  /// such as categories, business chains, food types and more. The API returns
  /// details such as a place name, address, phone, category, food type,
  /// contact, opening hours. Also, the API can return phonemes, time zones and
  /// more based on requested parameters.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/search-nearby.html">Search
  /// Nearby</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryPosition] :
  /// The position in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\] for which you are querying nearby results for. Results closer
  /// to the position will be ranked higher then results further away from the
  /// position
  ///
  /// Parameter [additionalFeatures] :
  /// A list of optional additional parameters, such as time zone, that can be
  /// requested for each result.
  ///
  /// Parameter [filter] :
  /// A structure which contains a set of inclusion/exclusion properties that
  /// results must possess in order to be returned as a result.
  ///
  /// Parameter [intendedUse] :
  /// Indicates if the query results will be persisted in customer
  /// infrastructure. Defaults to <code>SingleUse</code> (not stored). Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// <note>
  /// When storing <code>SearchNearby</code> responses, you <i>must</i> set this
  /// field to <code>Storage</code> to comply with the terms of service. These
  /// requests will be charged at a higher rate. Please review the <a
  /// href="https://aws.amazon.com/location/sla/">user agreement</a> and <a
  /// href="https://aws.amazon.com/location/pricing/">service pricing
  /// structure</a> to determine the correct setting for your use case.
  /// </note>
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [language] :
  /// A list of <a href="https://en.wikipedia.org/wiki/IETF_language_tag">BCP
  /// 47</a> compliant language codes for the results to be rendered in. If
  /// there is no data for the result in the requested language, data will be
  /// returned in the default language for the entry.
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of results returned in a single call.
  ///
  /// Default value: 20
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page.
  ///
  /// Parameter [politicalView] :
  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country.
  ///
  /// Parameter [queryRadius] :
  /// The maximum distance in meters from the QueryPosition from which a result
  /// will be returned.
  /// <note>
  /// The fields <code>QueryText</code>, and <code>QueryID</code> are mutually
  /// exclusive.
  /// </note>
  Future<SearchNearbyResponse> searchNearby({
    required List<double> queryPosition,
    List<SearchNearbyAdditionalFeature>? additionalFeatures,
    SearchNearbyFilter? filter,
    SearchNearbyIntendedUse? intendedUse,
    String? key,
    String? language,
    int? maxResults,
    String? nextToken,
    String? politicalView,
    int? queryRadius,
  }) async {
    _s.validateNumRange(
      'queryRadius',
      queryRadius,
      0,
      4294967295,
    );
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'QueryPosition': queryPosition,
      if (additionalFeatures != null)
        'AdditionalFeatures': additionalFeatures.map((e) => e.value).toList(),
      if (filter != null) 'Filter': filter,
      if (intendedUse != null) 'IntendedUse': intendedUse.value,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (politicalView != null) 'PoliticalView': politicalView,
      if (queryRadius != null) 'QueryRadius': queryRadius,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/search-nearby',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return SearchNearbyResponse(
      nextToken: $json['NextToken'] as String?,
      resultItems: ($json['ResultItems'] as List?)
          ?.nonNulls
          .map(
              (e) => SearchNearbyResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
    );
  }

  /// <code>SearchText</code> searches for geocode and place information. You
  /// can then complete a follow-up query suggested from the
  /// <code>Suggest</code> API via a query id.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/search-text.html">Search
  /// Text</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [additionalFeatures] :
  /// A list of optional additional parameters, such as time zone, that can be
  /// requested for each result. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only the <code>TimeZone</code> value.
  ///
  /// Parameter [biasPosition] :
  /// The position, in longitude and latitude, that the results should be close
  /// to. Typically, place results returned are ranked higher the closer they
  /// are to this position. Stored in <code>\[lng, lat\]</code> and in the WGS
  /// 84 format.
  /// <note>
  /// Exactly one of the following fields must be set:
  /// <code>BiasPosition</code>, <code>Filter.BoundingBox</code>, or
  /// <code>Filter.Circle</code>.
  /// </note>
  ///
  /// Parameter [filter] :
  /// A structure which contains a set of inclusion/exclusion properties that
  /// results must possess in order to be returned as a result.
  ///
  /// Parameter [intendedUse] :
  /// Indicates if the query results will be persisted in customer
  /// infrastructure. Defaults to <code>SingleUse</code> (not stored).
  /// <note>
  /// When storing <code>SearchText</code> responses, you <i>must</i> set this
  /// field to <code>Storage</code> to comply with the terms of service. These
  /// requests will be charged at a higher rate. Please review the <a
  /// href="https://aws.amazon.com/location/sla/">user agreement</a> and <a
  /// href="https://aws.amazon.com/location/pricing/">service pricing
  /// structure</a> to determine the correct setting for your use case.
  /// </note>
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [language] :
  /// A list of <a href="https://en.wikipedia.org/wiki/IETF_language_tag">BCP
  /// 47</a> compliant language codes for the results to be rendered in. If
  /// there is no data for the result in the requested language, data will be
  /// returned in the default language for the entry. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only the following codes: <code>en, id, km, lo, ms, my,
  /// pt, th, tl, vi, zh</code>
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of results returned in a single call.
  ///
  /// Default value: 20
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page.
  ///
  /// Parameter [politicalView] :
  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [queryId] :
  /// The query Id returned by the suggest API. If passed in the request, the
  /// SearchText API will preform a SearchText query with the improved query
  /// terms for the original query made to the suggest API. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// <note>
  /// Exactly one of the following fields must be set: <code>QueryText</code> or
  /// <code>QueryId</code>.
  /// </note>
  ///
  /// Parameter [queryText] :
  /// The free-form text query to match addresses against. This is usually a
  /// partially typed address from an end user in an address box or form.
  /// <note>
  /// Exactly one of the following fields must be set: <code>QueryText</code> or
  /// <code>QueryId</code>.
  /// </note>
  Future<SearchTextResponse> searchText({
    List<SearchTextAdditionalFeature>? additionalFeatures,
    List<double>? biasPosition,
    SearchTextFilter? filter,
    SearchTextIntendedUse? intendedUse,
    String? key,
    String? language,
    int? maxResults,
    String? nextToken,
    String? politicalView,
    String? queryId,
    String? queryText,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      if (additionalFeatures != null)
        'AdditionalFeatures': additionalFeatures.map((e) => e.value).toList(),
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filter != null) 'Filter': filter,
      if (intendedUse != null) 'IntendedUse': intendedUse.value,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (politicalView != null) 'PoliticalView': politicalView,
      if (queryId != null) 'QueryId': queryId,
      if (queryText != null) 'QueryText': queryText,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/search-text',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return SearchTextResponse(
      nextToken: $json['NextToken'] as String?,
      resultItems: ($json['ResultItems'] as List?)
          ?.nonNulls
          .map((e) => SearchTextResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
    );
  }

  /// <code>Suggest</code> provides intelligent predictions or recommendations
  /// based on the user's input or context, such as relevant places, points of
  /// interest, query terms or search category. It is designed to help users
  /// find places or point of interests candidates or identify a follow on query
  /// based on incomplete or misspelled queries. It returns a list of possible
  /// matches or refinements that can be used to formulate a more accurate
  /// query. Users can select the most appropriate suggestion and use it for
  /// further searching. The API provides options for filtering results by
  /// location and other attributes, and allows for additional features like
  /// phonemes and timezones. The response includes refined query terms and
  /// detailed place information.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/suggest.html">Suggest</a>
  /// in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryText] :
  /// The free-form text query to match addresses against. This is usually a
  /// partially typed address from an end user in an address box or form.
  /// <note>
  /// The fields <code>QueryText</code> and <code>QueryID</code> are mutually
  /// exclusive.
  /// </note>
  ///
  /// Parameter [additionalFeatures] :
  /// A list of optional additional parameters, such as time zone, that can be
  /// requested for each result. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only the <code>Core</code> and <code>TimeZone</code>
  /// values.
  ///
  /// Parameter [biasPosition] :
  /// The position, in longitude and latitude, that the results should be close
  /// to. Typically, place results returned are ranked higher the closer they
  /// are to this position. Stored in <code>\[lng, lat\]</code> and in the WGS
  /// 84 format.
  /// <note>
  /// The fields <code>BiasPosition</code>, <code>FilterBoundingBox</code>, and
  /// <code>FilterCircle</code> are mutually exclusive.
  /// </note>
  ///
  /// Parameter [filter] :
  /// A structure which contains a set of inclusion/exclusion properties that
  /// results must possess in order to be returned as a result.
  ///
  /// Parameter [intendedUse] :
  /// Indicates if the query results will be persisted in customer
  /// infrastructure. Defaults to <code>SingleUse</code> (not stored).
  /// Currently, <code>Suggest</code> does not support storage of results.
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [language] :
  /// A list of <a href="https://en.wikipedia.org/wiki/IETF_language_tag">BCP
  /// 47</a> compliant language codes for the results to be rendered in. If
  /// there is no data for the result in the requested language, data will be
  /// returned in the default language for the entry. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only the following codes: <code>en, id, km, lo, ms, my,
  /// pt, th, tl, vi, zh</code>
  ///
  /// Parameter [maxQueryRefinements] :
  /// Maximum number of query terms to be returned for use with a search text
  /// query. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of results returned in a single call.
  ///
  /// Default value: 20
  ///
  /// Parameter [politicalView] :
  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  Future<SuggestResponse> suggest({
    required String queryText,
    List<SuggestAdditionalFeature>? additionalFeatures,
    List<double>? biasPosition,
    SuggestFilter? filter,
    SuggestIntendedUse? intendedUse,
    String? key,
    String? language,
    int? maxQueryRefinements,
    int? maxResults,
    String? politicalView,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'QueryText': queryText,
      if (additionalFeatures != null)
        'AdditionalFeatures': additionalFeatures.map((e) => e.value).toList(),
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filter != null) 'Filter': filter,
      if (intendedUse != null) 'IntendedUse': intendedUse.value,
      if (language != null) 'Language': language,
      if (maxQueryRefinements != null)
        'MaxQueryRefinements': maxQueryRefinements,
      if (maxResults != null) 'MaxResults': maxResults,
      if (politicalView != null) 'PoliticalView': politicalView,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/suggest',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return SuggestResponse(
      queryRefinements: ($json['QueryRefinements'] as List?)
          ?.nonNulls
          .map((e) => QueryRefinement.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultItems: ($json['ResultItems'] as List?)
          ?.nonNulls
          .map((e) => SuggestResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
    );
  }
}

/// @nodoc
class AutocompleteResponse {
  /// The pricing bucket for which the query is charged at.
  ///
  /// For more information on pricing, please visit <a
  /// href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// Pricing</a>.
  final String pricingBucket;

  /// List of places or results returned for a query.
  final List<AutocompleteResultItem>? resultItems;

  AutocompleteResponse({
    required this.pricingBucket,
    this.resultItems,
  });

  Map<String, dynamic> toJson() {
    final pricingBucket = this.pricingBucket;
    final resultItems = this.resultItems;
    return {
      if (resultItems != null) 'ResultItems': resultItems,
    };
  }
}

/// @nodoc
class GeocodeResponse {
  /// The pricing bucket for which the query is charged at, or the maximum pricing
  /// bucket when the query is charged per item within the query.
  ///
  /// For more information on pricing, please visit <a
  /// href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// Pricing</a>.
  final String pricingBucket;

  /// List of places or results returned for a query.
  final List<GeocodeResultItem>? resultItems;

  GeocodeResponse({
    required this.pricingBucket,
    this.resultItems,
  });

  Map<String, dynamic> toJson() {
    final pricingBucket = this.pricingBucket;
    final resultItems = this.resultItems;
    return {
      if (resultItems != null) 'ResultItems': resultItems,
    };
  }
}

/// @nodoc
class GetPlaceResponse {
  /// The <code>PlaceId</code> of the place you wish to receive the information
  /// for.
  final String placeId;

  /// A <code>PlaceType</code> is a category that the result place must belong to.
  final PlaceType placeType;

  /// The pricing bucket for which the query is charged at.
  ///
  /// For more information on pricing, please visit <a
  /// href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// Pricing</a>.
  final String pricingBucket;

  /// The localized display name of this result item based on request parameter
  /// <code>language</code>.
  final String title;

  /// Position of the access point in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\]. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<AccessPoint>? accessPoints;

  /// Indicates known access restrictions on a vehicle access point. The index
  /// correlates to an access point and indicates if access through this point has
  /// some form of restriction. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<AccessRestriction>? accessRestrictions;

  /// The place's address.
  final Address? address;

  /// Boolean indicating if the address provided has been corrected. Not available
  /// in <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final bool? addressNumberCorrected;

  /// The Business Chains associated with the place.
  final List<BusinessChain>? businessChains;

  /// Categories of results that results must belong to.
  final List<Category>? categories;

  /// List of potential contact methods for the result/place. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final Contacts? contacts;

  /// List of food types offered by this result. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<FoodType>? foodTypes;

  /// The main address corresponding to a place of type Secondary Address. Not
  /// available in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final RelatedPlace? mainAddress;

  /// The bounding box enclosing the geometric shape (area or line) that an
  /// individual result covers.
  ///
  /// The bounding box formed is defined as a set of four coordinates:
  /// <code>\[{westward lng}, {southern lat}, {eastward lng}, {northern
  /// lat}\]</code>
  final List<double>? mapView;

  /// List of opening hours objects. Not available in <code>ap-southeast-1</code>
  /// and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<OpeningHours>? openingHours;

  /// How the various components of the result's address are pronounced in various
  /// languages. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final PhonemeDetails? phonemes;

  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final String? politicalView;

  /// The position in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\].
  final List<double>? position;

  /// Contains details about the postal code of the place/result. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<PostalCodeDetails>? postalCodeDetails;

  /// All secondary addresses that are associated with a main address. A secondary
  /// address is one that includes secondary designators, such as a Suite or Unit
  /// Number, Building, or Floor information. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// <note>
  /// Coverage for this functionality is available in the following countries:
  /// AUS, CAN, NZL, USA, PRI.
  /// </note>
  final List<RelatedPlace>? secondaryAddresses;

  /// The time zone in which the place is located.
  final TimeZone? timeZone;

  GetPlaceResponse({
    required this.placeId,
    required this.placeType,
    required this.pricingBucket,
    required this.title,
    this.accessPoints,
    this.accessRestrictions,
    this.address,
    this.addressNumberCorrected,
    this.businessChains,
    this.categories,
    this.contacts,
    this.foodTypes,
    this.mainAddress,
    this.mapView,
    this.openingHours,
    this.phonemes,
    this.politicalView,
    this.position,
    this.postalCodeDetails,
    this.secondaryAddresses,
    this.timeZone,
  });

  Map<String, dynamic> toJson() {
    final placeId = this.placeId;
    final placeType = this.placeType;
    final pricingBucket = this.pricingBucket;
    final title = this.title;
    final accessPoints = this.accessPoints;
    final accessRestrictions = this.accessRestrictions;
    final address = this.address;
    final addressNumberCorrected = this.addressNumberCorrected;
    final businessChains = this.businessChains;
    final categories = this.categories;
    final contacts = this.contacts;
    final foodTypes = this.foodTypes;
    final mainAddress = this.mainAddress;
    final mapView = this.mapView;
    final openingHours = this.openingHours;
    final phonemes = this.phonemes;
    final politicalView = this.politicalView;
    final position = this.position;
    final postalCodeDetails = this.postalCodeDetails;
    final secondaryAddresses = this.secondaryAddresses;
    final timeZone = this.timeZone;
    return {
      'PlaceId': placeId,
      'PlaceType': placeType.value,
      'Title': title,
      if (accessPoints != null) 'AccessPoints': accessPoints,
      if (accessRestrictions != null) 'AccessRestrictions': accessRestrictions,
      if (address != null) 'Address': address,
      if (addressNumberCorrected != null)
        'AddressNumberCorrected': addressNumberCorrected,
      if (businessChains != null) 'BusinessChains': businessChains,
      if (categories != null) 'Categories': categories,
      if (contacts != null) 'Contacts': contacts,
      if (foodTypes != null) 'FoodTypes': foodTypes,
      if (mainAddress != null) 'MainAddress': mainAddress,
      if (mapView != null) 'MapView': mapView,
      if (openingHours != null) 'OpeningHours': openingHours,
      if (phonemes != null) 'Phonemes': phonemes,
      if (politicalView != null) 'PoliticalView': politicalView,
      if (position != null) 'Position': position,
      if (postalCodeDetails != null) 'PostalCodeDetails': postalCodeDetails,
      if (secondaryAddresses != null) 'SecondaryAddresses': secondaryAddresses,
      if (timeZone != null) 'TimeZone': timeZone,
    };
  }
}

/// @nodoc
class ReverseGeocodeResponse {
  /// The pricing bucket for which the query is charged at.
  ///
  /// For more information on pricing, please visit <a
  /// href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// Pricing</a>.
  final String pricingBucket;

  /// List of places or results returned for a query.
  final List<ReverseGeocodeResultItem>? resultItems;

  ReverseGeocodeResponse({
    required this.pricingBucket,
    this.resultItems,
  });

  Map<String, dynamic> toJson() {
    final pricingBucket = this.pricingBucket;
    final resultItems = this.resultItems;
    return {
      if (resultItems != null) 'ResultItems': resultItems,
    };
  }
}

/// @nodoc
class SearchNearbyResponse {
  /// The pricing bucket for which the query is charged at.
  ///
  /// For more information on pricing, please visit <a
  /// href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// Pricing</a>.
  final String pricingBucket;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  final String? nextToken;

  /// List of places or results returned for a query.
  final List<SearchNearbyResultItem>? resultItems;

  SearchNearbyResponse({
    required this.pricingBucket,
    this.nextToken,
    this.resultItems,
  });

  Map<String, dynamic> toJson() {
    final pricingBucket = this.pricingBucket;
    final nextToken = this.nextToken;
    final resultItems = this.resultItems;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resultItems != null) 'ResultItems': resultItems,
    };
  }
}

/// @nodoc
class SearchTextResponse {
  /// The pricing bucket for which the query is charged at.
  ///
  /// For more information on pricing, please visit <a
  /// href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// Pricing</a>.
  final String pricingBucket;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  final String? nextToken;

  /// List of places or results returned for a query.
  final List<SearchTextResultItem>? resultItems;

  SearchTextResponse({
    required this.pricingBucket,
    this.nextToken,
    this.resultItems,
  });

  Map<String, dynamic> toJson() {
    final pricingBucket = this.pricingBucket;
    final nextToken = this.nextToken;
    final resultItems = this.resultItems;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resultItems != null) 'ResultItems': resultItems,
    };
  }
}

/// @nodoc
class SuggestResponse {
  /// The pricing bucket for which the query is charged at.
  ///
  /// For more information on pricing, please visit <a
  /// href="https://aws.amazon.com/location/pricing/">Amazon Location Service
  /// Pricing</a>.
  final String pricingBucket;

  /// Maximum number of query terms to be returned for use with a search text
  /// query. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<QueryRefinement>? queryRefinements;

  /// List of places or results returned for a query.
  final List<SuggestResultItem>? resultItems;

  SuggestResponse({
    required this.pricingBucket,
    this.queryRefinements,
    this.resultItems,
  });

  Map<String, dynamic> toJson() {
    final pricingBucket = this.pricingBucket;
    final queryRefinements = this.queryRefinements;
    final resultItems = this.resultItems;
    return {
      if (queryRefinements != null) 'QueryRefinements': queryRefinements,
      if (resultItems != null) 'ResultItems': resultItems,
    };
  }
}

/// Suggestions for refining individual query terms. Suggestions are returned as
/// objects which note the term, suggested replacement, and its index in the
/// query.
///
/// @nodoc
class QueryRefinement {
  /// End index of the parsed query.
  final int endIndex;

  /// The sub-string of the original query that is replaced by this query term.
  final String originalTerm;

  /// The term that will be suggested to the user.
  final String refinedTerm;

  /// Start index of the parsed component.
  final int startIndex;

  QueryRefinement({
    required this.endIndex,
    required this.originalTerm,
    required this.refinedTerm,
    required this.startIndex,
  });

  factory QueryRefinement.fromJson(Map<String, dynamic> json) {
    return QueryRefinement(
      endIndex: (json['EndIndex'] as int?) ?? 0,
      originalTerm: (json['OriginalTerm'] as String?) ?? '',
      refinedTerm: (json['RefinedTerm'] as String?) ?? '',
      startIndex: (json['StartIndex'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final endIndex = this.endIndex;
    final originalTerm = this.originalTerm;
    final refinedTerm = this.refinedTerm;
    final startIndex = this.startIndex;
    return {
      'EndIndex': endIndex,
      'OriginalTerm': originalTerm,
      'RefinedTerm': refinedTerm,
      'StartIndex': startIndex,
    };
  }
}

/// The resulting item from the suggested query.
///
/// @nodoc
class SuggestResultItem {
  /// The result type. Place results represent the final result for a point of
  /// interest, Query results represent a follow up query which can be completed
  /// through the SearchText operation.
  final SuggestResultItemType suggestResultItemType;

  /// The display title that should be used when presenting this option to the end
  /// user.
  final String title;

  /// Describes how the parts of the response element matched the input query by
  /// returning the sections of the response which matched to input query terms.
  final SuggestHighlights? highlights;

  /// The suggested place by its unique ID.
  final SuggestPlaceResult? place;
  final SuggestQueryResult? query;

  SuggestResultItem({
    required this.suggestResultItemType,
    required this.title,
    this.highlights,
    this.place,
    this.query,
  });

  factory SuggestResultItem.fromJson(Map<String, dynamic> json) {
    return SuggestResultItem(
      suggestResultItemType: SuggestResultItemType.fromString(
          (json['SuggestResultItemType'] as String?) ?? ''),
      title: (json['Title'] as String?) ?? '',
      highlights: json['Highlights'] != null
          ? SuggestHighlights.fromJson(
              json['Highlights'] as Map<String, dynamic>)
          : null,
      place: json['Place'] != null
          ? SuggestPlaceResult.fromJson(json['Place'] as Map<String, dynamic>)
          : null,
      query: json['Query'] != null
          ? SuggestQueryResult.fromJson(json['Query'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final suggestResultItemType = this.suggestResultItemType;
    final title = this.title;
    final highlights = this.highlights;
    final place = this.place;
    final query = this.query;
    return {
      'SuggestResultItemType': suggestResultItemType.value,
      'Title': title,
      if (highlights != null) 'Highlights': highlights,
      if (place != null) 'Place': place,
      if (query != null) 'Query': query,
    };
  }
}

/// @nodoc
class SuggestResultItemType {
  static const place = SuggestResultItemType._('Place');
  static const query = SuggestResultItemType._('Query');

  final String value;

  const SuggestResultItemType._(this.value);

  static const values = [place, query];

  static SuggestResultItemType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SuggestResultItemType._(value));

  @override
  bool operator ==(other) =>
      other is SuggestResultItemType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The suggested place results.
///
/// @nodoc
class SuggestPlaceResult {
  /// Position of the access point in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\]. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<AccessPoint>? accessPoints;

  /// Indicates known access restrictions on a vehicle access point. The index
  /// correlates to an access point and indicates if access through this point has
  /// some form of restriction. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<AccessRestriction>? accessRestrictions;

  /// The place's address.
  final Address? address;

  /// The Business Chains associated with the place. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<BusinessChain>? businessChains;

  /// Categories of results that results must belong to.
  final List<Category>? categories;

  /// The distance in meters from the QueryPosition.
  final int? distance;

  /// List of food types offered by this result. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<FoodType>? foodTypes;

  /// The bounding box enclosing the geometric shape (area or line) that an
  /// individual result covers.
  ///
  /// The bounding box formed is defined as a set 4 coordinates: <code>\[{westward
  /// lng}, {southern lat}, {eastward lng}, {northern lat}\]</code>
  final List<double>? mapView;

  /// How the various components of the result's address are pronounced in various
  /// languages. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final PhonemeDetails? phonemes;

  /// The <code>PlaceId</code> of the place you wish to receive the information
  /// for.
  final String? placeId;

  /// A <code>PlaceType</code> is a category that the result place must belong to.
  final PlaceType? placeType;

  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final String? politicalView;

  /// The position in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\].
  final List<double>? position;

  /// The time zone in which the place is located.
  final TimeZone? timeZone;

  SuggestPlaceResult({
    this.accessPoints,
    this.accessRestrictions,
    this.address,
    this.businessChains,
    this.categories,
    this.distance,
    this.foodTypes,
    this.mapView,
    this.phonemes,
    this.placeId,
    this.placeType,
    this.politicalView,
    this.position,
    this.timeZone,
  });

  factory SuggestPlaceResult.fromJson(Map<String, dynamic> json) {
    return SuggestPlaceResult(
      accessPoints: (json['AccessPoints'] as List?)
          ?.nonNulls
          .map((e) => AccessPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessRestrictions: (json['AccessRestrictions'] as List?)
          ?.nonNulls
          .map((e) => AccessRestriction.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      businessChains: (json['BusinessChains'] as List?)
          ?.nonNulls
          .map((e) => BusinessChain.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['Categories'] as List?)
          ?.nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      distance: json['Distance'] as int?,
      foodTypes: (json['FoodTypes'] as List?)
          ?.nonNulls
          .map((e) => FoodType.fromJson(e as Map<String, dynamic>))
          .toList(),
      mapView:
          (json['MapView'] as List?)?.nonNulls.map((e) => e as double).toList(),
      phonemes: json['Phonemes'] != null
          ? PhonemeDetails.fromJson(json['Phonemes'] as Map<String, dynamic>)
          : null,
      placeId: json['PlaceId'] as String?,
      placeType: (json['PlaceType'] as String?)?.let(PlaceType.fromString),
      politicalView: json['PoliticalView'] as String?,
      position: (json['Position'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      timeZone: json['TimeZone'] != null
          ? TimeZone.fromJson(json['TimeZone'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPoints = this.accessPoints;
    final accessRestrictions = this.accessRestrictions;
    final address = this.address;
    final businessChains = this.businessChains;
    final categories = this.categories;
    final distance = this.distance;
    final foodTypes = this.foodTypes;
    final mapView = this.mapView;
    final phonemes = this.phonemes;
    final placeId = this.placeId;
    final placeType = this.placeType;
    final politicalView = this.politicalView;
    final position = this.position;
    final timeZone = this.timeZone;
    return {
      if (accessPoints != null) 'AccessPoints': accessPoints,
      if (accessRestrictions != null) 'AccessRestrictions': accessRestrictions,
      if (address != null) 'Address': address,
      if (businessChains != null) 'BusinessChains': businessChains,
      if (categories != null) 'Categories': categories,
      if (distance != null) 'Distance': distance,
      if (foodTypes != null) 'FoodTypes': foodTypes,
      if (mapView != null) 'MapView': mapView,
      if (phonemes != null) 'Phonemes': phonemes,
      if (placeId != null) 'PlaceId': placeId,
      if (placeType != null) 'PlaceType': placeType.value,
      if (politicalView != null) 'PoliticalView': politicalView,
      if (position != null) 'Position': position,
      if (timeZone != null) 'TimeZone': timeZone,
    };
  }
}

/// The suggested query results.
///
/// @nodoc
class SuggestQueryResult {
  /// QueryId can be used to complete a follow up query through the SearchText
  /// API. The QueryId retains context from the original Suggest request such as
  /// filters, political view and language. See the SearchText API documentation
  /// for more details <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_geoplaces_SearchText.html">SearchText
  /// API docs</a>. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// <note>
  /// The fields <code>QueryText</code>, and <code>QueryID</code> are mutually
  /// exclusive.
  /// </note>
  final String? queryId;

  /// The query type. Category queries will search for places which have an entry
  /// matching the given category, for example "doctor office". BusinessChain
  /// queries will search for instances of a given business. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final QueryType? queryType;

  SuggestQueryResult({
    this.queryId,
    this.queryType,
  });

  factory SuggestQueryResult.fromJson(Map<String, dynamic> json) {
    return SuggestQueryResult(
      queryId: json['QueryId'] as String?,
      queryType: (json['QueryType'] as String?)?.let(QueryType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final queryId = this.queryId;
    final queryType = this.queryType;
    return {
      if (queryId != null) 'QueryId': queryId,
      if (queryType != null) 'QueryType': queryType.value,
    };
  }
}

/// Describes how the parts of the textQuery matched the input query by
/// returning the sections of the response which matched to textQuery terms.
///
/// @nodoc
class SuggestHighlights {
  /// The place's address.
  final SuggestAddressHighlights? address;

  /// Indicates the starting and ending index of the title in the text query that
  /// match the found title.
  final List<Highlight>? title;

  SuggestHighlights({
    this.address,
    this.title,
  });

  factory SuggestHighlights.fromJson(Map<String, dynamic> json) {
    return SuggestHighlights(
      address: json['Address'] != null
          ? SuggestAddressHighlights.fromJson(
              json['Address'] as Map<String, dynamic>)
          : null,
      title: (json['Title'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final title = this.title;
    return {
      if (address != null) 'Address': address,
      if (title != null) 'Title': title,
    };
  }
}

/// Describes how the parts of the textQuery matched the input query by
/// returning the sections of the response which matched to textQuery terms.
///
/// @nodoc
class SuggestAddressHighlights {
  /// Indicates the starting and ending indexes of the places in the result which
  /// were identified to match the textQuery. This result is useful for providing
  /// emphasis to results where the user query directly matched to make selecting
  /// the correct result from a list easier for an end user.
  final List<Highlight>? label;

  SuggestAddressHighlights({
    this.label,
  });

  factory SuggestAddressHighlights.fromJson(Map<String, dynamic> json) {
    return SuggestAddressHighlights(
      label: (json['Label'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final label = this.label;
    return {
      if (label != null) 'Label': label,
    };
  }
}

/// Indicates the starting and ending index of the text query that match the
/// found title.
///
/// @nodoc
class Highlight {
  /// End index of the highlight.
  final int? endIndex;

  /// Start index of the highlight.
  final int? startIndex;

  /// The highlight's value.
  final String? value;

  Highlight({
    this.endIndex,
    this.startIndex,
    this.value,
  });

  factory Highlight.fromJson(Map<String, dynamic> json) {
    return Highlight(
      endIndex: json['EndIndex'] as int?,
      startIndex: json['StartIndex'] as int?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endIndex = this.endIndex;
    final startIndex = this.startIndex;
    final value = this.value;
    return {
      if (endIndex != null) 'EndIndex': endIndex,
      if (startIndex != null) 'StartIndex': startIndex,
      if (value != null) 'Value': value,
    };
  }
}

/// @nodoc
class QueryType {
  static const category = QueryType._('Category');
  static const businessChain = QueryType._('BusinessChain');

  final String value;

  const QueryType._(this.value);

  static const values = [category, businessChain];

  static QueryType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => QueryType._(value));

  @override
  bool operator ==(other) => other is QueryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PlaceType {
  static const country = PlaceType._('Country');
  static const region = PlaceType._('Region');
  static const subRegion = PlaceType._('SubRegion');
  static const locality = PlaceType._('Locality');
  static const district = PlaceType._('District');
  static const subDistrict = PlaceType._('SubDistrict');
  static const postalCode = PlaceType._('PostalCode');
  static const block = PlaceType._('Block');
  static const subBlock = PlaceType._('SubBlock');
  static const intersection = PlaceType._('Intersection');
  static const street = PlaceType._('Street');
  static const pointOfInterest = PlaceType._('PointOfInterest');
  static const pointAddress = PlaceType._('PointAddress');
  static const interpolatedAddress = PlaceType._('InterpolatedAddress');
  static const secondaryAddress = PlaceType._('SecondaryAddress');
  static const inferredSecondaryAddress =
      PlaceType._('InferredSecondaryAddress');

  final String value;

  const PlaceType._(this.value);

  static const values = [
    country,
    region,
    subRegion,
    locality,
    district,
    subDistrict,
    postalCode,
    block,
    subBlock,
    intersection,
    street,
    pointOfInterest,
    pointAddress,
    interpolatedAddress,
    secondaryAddress,
    inferredSecondaryAddress
  ];

  static PlaceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PlaceType._(value));

  @override
  bool operator ==(other) => other is PlaceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The place address.
///
/// @nodoc
class Address {
  /// The number that identifies an address within a street.
  final String? addressNumber;

  /// Name of the block. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Example: <code>Sunny Mansion 203 block: 2 Chome</code>
  final String? block;

  /// The name of the building at the address. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final String? building;

  /// The country component of the address.
  final Country? country;

  /// The district or division of a locality associated with this address.
  final String? district;

  /// Name of the streets in the intersection. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Example: <code>\["Friedrichstraße","Unter den Linden"\]</code>
  final List<String>? intersection;

  /// Assembled address value built out of the address components, according to
  /// the regional postal rules. This is the correctly formatted address.
  final String? label;

  /// The city or locality of the address.
  ///
  /// Example: <code>Vancouver</code>.
  final String? locality;

  /// An alphanumeric string included in a postal address to facilitate mail
  /// sorting, such as post code, postcode, or ZIP code, for which the result
  /// should possess.
  final String? postalCode;

  /// The region or state results should be present in.
  ///
  /// Example: <code>North Rhine-Westphalia</code>.
  final Region? region;

  /// Components that correspond to secondary identifiers on an Address. Secondary
  /// address components include information such as Suite or Unit Number,
  /// Building, or Floor. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// <note>
  /// Coverage for <code>Address.SecondaryAddressComponents</code> is available in
  /// the following countries:
  ///
  /// AUS, CAN, NZL, USA, PRI
  /// </note>
  final List<SecondaryAddressComponent>? secondaryAddressComponents;

  /// The name of the street results should be present in.
  final String? street;

  /// Components of the street. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Example: Yonge from "Yonge street".
  final List<StreetComponents>? streetComponents;

  /// Name of sub-block. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Example: <code>Sunny Mansion 203 sub-block: 4</code>
  final String? subBlock;

  /// A subdivision of a district.
  ///
  /// Example: <code>Minden-Lübbecke</code>.
  final String? subDistrict;

  /// The sub-region or county for which results should be present in.
  final SubRegion? subRegion;

  Address({
    this.addressNumber,
    this.block,
    this.building,
    this.country,
    this.district,
    this.intersection,
    this.label,
    this.locality,
    this.postalCode,
    this.region,
    this.secondaryAddressComponents,
    this.street,
    this.streetComponents,
    this.subBlock,
    this.subDistrict,
    this.subRegion,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressNumber: json['AddressNumber'] as String?,
      block: json['Block'] as String?,
      building: json['Building'] as String?,
      country: json['Country'] != null
          ? Country.fromJson(json['Country'] as Map<String, dynamic>)
          : null,
      district: json['District'] as String?,
      intersection: (json['Intersection'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      label: json['Label'] as String?,
      locality: json['Locality'] as String?,
      postalCode: json['PostalCode'] as String?,
      region: json['Region'] != null
          ? Region.fromJson(json['Region'] as Map<String, dynamic>)
          : null,
      secondaryAddressComponents: (json['SecondaryAddressComponents'] as List?)
          ?.nonNulls
          .map((e) =>
              SecondaryAddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      street: json['Street'] as String?,
      streetComponents: (json['StreetComponents'] as List?)
          ?.nonNulls
          .map((e) => StreetComponents.fromJson(e as Map<String, dynamic>))
          .toList(),
      subBlock: json['SubBlock'] as String?,
      subDistrict: json['SubDistrict'] as String?,
      subRegion: json['SubRegion'] != null
          ? SubRegion.fromJson(json['SubRegion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addressNumber = this.addressNumber;
    final block = this.block;
    final building = this.building;
    final country = this.country;
    final district = this.district;
    final intersection = this.intersection;
    final label = this.label;
    final locality = this.locality;
    final postalCode = this.postalCode;
    final region = this.region;
    final secondaryAddressComponents = this.secondaryAddressComponents;
    final street = this.street;
    final streetComponents = this.streetComponents;
    final subBlock = this.subBlock;
    final subDistrict = this.subDistrict;
    final subRegion = this.subRegion;
    return {
      if (addressNumber != null) 'AddressNumber': addressNumber,
      if (block != null) 'Block': block,
      if (building != null) 'Building': building,
      if (country != null) 'Country': country,
      if (district != null) 'District': district,
      if (intersection != null) 'Intersection': intersection,
      if (label != null) 'Label': label,
      if (locality != null) 'Locality': locality,
      if (postalCode != null) 'PostalCode': postalCode,
      if (region != null) 'Region': region,
      if (secondaryAddressComponents != null)
        'SecondaryAddressComponents': secondaryAddressComponents,
      if (street != null) 'Street': street,
      if (streetComponents != null) 'StreetComponents': streetComponents,
      if (subBlock != null) 'SubBlock': subBlock,
      if (subDistrict != null) 'SubDistrict': subDistrict,
      if (subRegion != null) 'SubRegion': subRegion,
    };
  }
}

/// The time zone in which the place is located.
///
/// @nodoc
class TimeZone {
  /// The time zone name.
  final String name;

  /// Time zone offset of the timezone from UTC.
  final String? offset;

  /// The offset of the time zone from UTC, in seconds.
  final int? offsetSeconds;

  TimeZone({
    required this.name,
    this.offset,
    this.offsetSeconds,
  });

  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return TimeZone(
      name: (json['Name'] as String?) ?? '',
      offset: json['Offset'] as String?,
      offsetSeconds: json['OffsetSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final offset = this.offset;
    final offsetSeconds = this.offsetSeconds;
    return {
      'Name': name,
      if (offset != null) 'Offset': offset,
      if (offsetSeconds != null) 'OffsetSeconds': offsetSeconds,
    };
  }
}

/// The phoneme details.
///
/// @nodoc
class PhonemeDetails {
  /// How to pronounce the address.
  final AddressComponentPhonemes? address;

  /// List of <code>PhonemeTranscription</code>. See
  /// <code>PhonemeTranscription</code> for fields.
  final List<PhonemeTranscription>? title;

  PhonemeDetails({
    this.address,
    this.title,
  });

  factory PhonemeDetails.fromJson(Map<String, dynamic> json) {
    return PhonemeDetails(
      address: json['Address'] != null
          ? AddressComponentPhonemes.fromJson(
              json['Address'] as Map<String, dynamic>)
          : null,
      title: (json['Title'] as List?)
          ?.nonNulls
          .map((e) => PhonemeTranscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final title = this.title;
    return {
      if (address != null) 'Address': address,
      if (title != null) 'Title': title,
    };
  }
}

/// How to pronounce the various components of the address or place.
///
/// @nodoc
class AddressComponentPhonemes {
  /// How to pronounce the name of the block.
  final List<PhonemeTranscription>? block;

  /// The alpha-2 or alpha-3 character code for the country that the results will
  /// be present in.
  final List<PhonemeTranscription>? country;

  /// How to pronounce the district or division of a city results should be
  /// present in.
  final List<PhonemeTranscription>? district;

  /// How to pronounce the city or locality results should be present in.
  ///
  /// Example: <code>Vancouver</code>.
  final List<PhonemeTranscription>? locality;

  /// How to pronounce the region or state results should be to be present in.
  final List<PhonemeTranscription>? region;

  /// How to pronounce the name of the street results should be present in.
  final List<PhonemeTranscription>? street;

  /// How to pronounce the name of the sub-block.
  final List<PhonemeTranscription>? subBlock;

  /// How to pronounce the sub-district or division of a city results should be
  /// present in.
  final List<PhonemeTranscription>? subDistrict;

  /// How to pronounce the sub-region or county for which results should be
  /// present in.
  final List<PhonemeTranscription>? subRegion;

  AddressComponentPhonemes({
    this.block,
    this.country,
    this.district,
    this.locality,
    this.region,
    this.street,
    this.subBlock,
    this.subDistrict,
    this.subRegion,
  });

  factory AddressComponentPhonemes.fromJson(Map<String, dynamic> json) {
    return AddressComponentPhonemes(
      block: (json['Block'] as List?)
          ?.nonNulls
          .map((e) => PhonemeTranscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      country: (json['Country'] as List?)
          ?.nonNulls
          .map((e) => PhonemeTranscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      district: (json['District'] as List?)
          ?.nonNulls
          .map((e) => PhonemeTranscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      locality: (json['Locality'] as List?)
          ?.nonNulls
          .map((e) => PhonemeTranscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: (json['Region'] as List?)
          ?.nonNulls
          .map((e) => PhonemeTranscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      street: (json['Street'] as List?)
          ?.nonNulls
          .map((e) => PhonemeTranscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      subBlock: (json['SubBlock'] as List?)
          ?.nonNulls
          .map((e) => PhonemeTranscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      subDistrict: (json['SubDistrict'] as List?)
          ?.nonNulls
          .map((e) => PhonemeTranscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      subRegion: (json['SubRegion'] as List?)
          ?.nonNulls
          .map((e) => PhonemeTranscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final block = this.block;
    final country = this.country;
    final district = this.district;
    final locality = this.locality;
    final region = this.region;
    final street = this.street;
    final subBlock = this.subBlock;
    final subDistrict = this.subDistrict;
    final subRegion = this.subRegion;
    return {
      if (block != null) 'Block': block,
      if (country != null) 'Country': country,
      if (district != null) 'District': district,
      if (locality != null) 'Locality': locality,
      if (region != null) 'Region': region,
      if (street != null) 'Street': street,
      if (subBlock != null) 'SubBlock': subBlock,
      if (subDistrict != null) 'SubDistrict': subDistrict,
      if (subRegion != null) 'SubRegion': subRegion,
    };
  }
}

/// How to pronounce the various components of the address or place.
///
/// @nodoc
class PhonemeTranscription {
  /// A list of <a href="https://en.wikipedia.org/wiki/IETF_language_tag">BCP
  /// 47</a> compliant language codes for the results to be rendered in. If there
  /// is no data for the result in the requested language, data will be returned
  /// in the default language for the entry.
  final String? language;

  /// Boolean which indicates if it the preferred pronunciation.
  final bool? preferred;

  /// Value which indicates how to pronounce the value.
  final String? value;

  PhonemeTranscription({
    this.language,
    this.preferred,
    this.value,
  });

  factory PhonemeTranscription.fromJson(Map<String, dynamic> json) {
    return PhonemeTranscription(
      language: json['Language'] as String?,
      preferred: json['Preferred'] as bool?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final language = this.language;
    final preferred = this.preferred;
    final value = this.value;
    return {
      if (language != null) 'Language': language,
      if (preferred != null) 'Preferred': preferred,
      if (value != null) 'Value': value,
    };
  }
}

/// Indicates if the access location is restricted. Index correlates to that of
/// an access point and indicates if access through this point has some form of
/// restriction.
///
/// @nodoc
class AccessRestriction {
  /// Categories of results that results must belong too.
  final List<Category>? categories;

  /// The restriction.
  final bool? restricted;

  AccessRestriction({
    this.categories,
    this.restricted,
  });

  factory AccessRestriction.fromJson(Map<String, dynamic> json) {
    return AccessRestriction(
      categories: (json['Categories'] as List?)
          ?.nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      restricted: json['Restricted'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final categories = this.categories;
    final restricted = this.restricted;
    return {
      if (categories != null) 'Categories': categories,
      if (restricted != null) 'Restricted': restricted,
    };
  }
}

/// Position of the access point represented by longitude and latitude for a
/// vehicle.
///
/// @nodoc
class AccessPoint {
  /// The position in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\].
  final List<double>? position;

  AccessPoint({
    this.position,
  });

  factory AccessPoint.fromJson(Map<String, dynamic> json) {
    return AccessPoint(
      position: (json['Position'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    return {
      if (position != null) 'Position': position,
    };
  }
}

/// A businesschain is a chain of businesses that belong to the same brand. For
/// example <code>7-11</code>.
///
/// @nodoc
class BusinessChain {
  /// The Business Chain Id.
  final String? id;

  /// The business chain name.
  final String? name;

  BusinessChain({
    this.id,
    this.name,
  });

  factory BusinessChain.fromJson(Map<String, dynamic> json) {
    return BusinessChain(
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    return {
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

/// List of <code>Food</code> types offered by this result.
///
/// @nodoc
class FoodType {
  /// Localized name of the food type.
  final String localizedName;

  /// The Food Type Id.
  final String? id;

  /// Boolean which indicates if this food type is the primary offered by the
  /// place. For example, if a location serves fast food, but also dessert, he
  /// primary would likely be fast food.
  final bool? primary;

  FoodType({
    required this.localizedName,
    this.id,
    this.primary,
  });

  factory FoodType.fromJson(Map<String, dynamic> json) {
    return FoodType(
      localizedName: (json['LocalizedName'] as String?) ?? '',
      id: json['Id'] as String?,
      primary: json['Primary'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final localizedName = this.localizedName;
    final id = this.id;
    final primary = this.primary;
    return {
      'LocalizedName': localizedName,
      if (id != null) 'Id': id,
      if (primary != null) 'Primary': primary,
    };
  }
}

/// Category of the <code>Place</code> returned.
///
/// @nodoc
class Category {
  /// The category ID.
  final String id;

  /// The category name.
  final String name;

  /// Localized name of the category type.
  final String? localizedName;

  /// Boolean which indicates if this category is the primary offered by the
  /// place.
  final bool? primary;

  Category({
    required this.id,
    required this.name,
    this.localizedName,
    this.primary,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      localizedName: json['LocalizedName'] as String?,
      primary: json['Primary'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final localizedName = this.localizedName;
    final primary = this.primary;
    return {
      'Id': id,
      'Name': name,
      if (localizedName != null) 'LocalizedName': localizedName,
      if (primary != null) 'Primary': primary,
    };
  }
}

/// The alpha-2 or alpha-3 character code for the country that the results will
/// be present in.
///
/// @nodoc
class Country {
  /// Country, represented by its alpha 2-character code.
  final String? code2;

  /// Country, represented by its alpha t-character code.
  final String? code3;

  /// Name of the country.
  final String? name;

  Country({
    this.code2,
    this.code3,
    this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code2: json['Code2'] as String?,
      code3: json['Code3'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code2 = this.code2;
    final code3 = this.code3;
    final name = this.name;
    return {
      if (code2 != null) 'Code2': code2,
      if (code3 != null) 'Code3': code3,
      if (name != null) 'Name': name,
    };
  }
}

/// The region or state results should be to be present in.
///
/// Example: <code>North Rhine-Westphalia</code>.
///
/// @nodoc
class Region {
  /// Abbreviated code for a the state, province or region of the country. Not
  /// available in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Example: <code>BC</code>.
  final String? code;

  /// Name for a the state, province, or region of the country.
  ///
  /// Example: <code>British Columbia</code>.
  final String? name;

  Region({
    this.code,
    this.name,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      code: json['Code'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final name = this.name;
    return {
      if (code != null) 'Code': code,
      if (name != null) 'Name': name,
    };
  }
}

/// The sub-region.
///
/// @nodoc
class SubRegion {
  /// Abbreviated code for the county or sub-region. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final String? code;

  /// Name for the county or sub-region.
  final String? name;

  SubRegion({
    this.code,
    this.name,
  });

  factory SubRegion.fromJson(Map<String, dynamic> json) {
    return SubRegion(
      code: json['Code'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final name = this.name;
    return {
      if (code != null) 'Code': code,
      if (name != null) 'Name': name,
    };
  }
}

/// Components that correspond to secondary identifiers on an address. The only
/// component type supported currently is Unit.
///
/// @nodoc
class SecondaryAddressComponent {
  /// Number that uniquely identifies a secondary address.
  final String number;

  /// The designator of the secondary address component.
  ///
  /// Example: <code>Apt</code>.
  final String? designator;

  SecondaryAddressComponent({
    required this.number,
    this.designator,
  });

  factory SecondaryAddressComponent.fromJson(Map<String, dynamic> json) {
    return SecondaryAddressComponent(
      number: (json['Number'] as String?) ?? '',
      designator: json['Designator'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final number = this.number;
    final designator = this.designator;
    return {
      'Number': number,
      if (designator != null) 'Designator': designator,
    };
  }
}

/// Components of a street.
///
/// @nodoc
class StreetComponents {
  /// Base name part of the street name.
  ///
  /// Example: Younge from the "Younge street".
  final String? baseName;

  /// Indicates the official directional identifiers assigned to highways.
  final String? direction;

  /// A <a href="https://en.wikipedia.org/wiki/IETF_language_tag">BCP 47</a>
  /// compliant language codes for the results to be rendered in. If there is no
  /// data for the result in the requested language, data will be returned in the
  /// default language for the entry.
  final String? language;

  /// A prefix is a directional identifier that precedes, but is not included in,
  /// the base name of a road.
  ///
  /// Example: E for East.
  final String? prefix;

  /// A suffix is a directional identifier that follows, but is not included in,
  /// the base name of a road.
  ///
  /// Example W for West.
  final String? suffix;

  /// Street type part of the street name.
  ///
  /// Example: <code>"avenue"</code>.
  final String? type;

  /// Defines if the street type is before or after the base name.
  final TypePlacement? typePlacement;

  /// Defines a separator character such as <code>""</code> or <code>" "</code>
  /// between the base name and type.
  final String? typeSeparator;

  StreetComponents({
    this.baseName,
    this.direction,
    this.language,
    this.prefix,
    this.suffix,
    this.type,
    this.typePlacement,
    this.typeSeparator,
  });

  factory StreetComponents.fromJson(Map<String, dynamic> json) {
    return StreetComponents(
      baseName: json['BaseName'] as String?,
      direction: json['Direction'] as String?,
      language: json['Language'] as String?,
      prefix: json['Prefix'] as String?,
      suffix: json['Suffix'] as String?,
      type: json['Type'] as String?,
      typePlacement:
          (json['TypePlacement'] as String?)?.let(TypePlacement.fromString),
      typeSeparator: json['TypeSeparator'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseName = this.baseName;
    final direction = this.direction;
    final language = this.language;
    final prefix = this.prefix;
    final suffix = this.suffix;
    final type = this.type;
    final typePlacement = this.typePlacement;
    final typeSeparator = this.typeSeparator;
    return {
      if (baseName != null) 'BaseName': baseName,
      if (direction != null) 'Direction': direction,
      if (language != null) 'Language': language,
      if (prefix != null) 'Prefix': prefix,
      if (suffix != null) 'Suffix': suffix,
      if (type != null) 'Type': type,
      if (typePlacement != null) 'TypePlacement': typePlacement.value,
      if (typeSeparator != null) 'TypeSeparator': typeSeparator,
    };
  }
}

/// @nodoc
class TypePlacement {
  static const beforeBaseName = TypePlacement._('BeforeBaseName');
  static const afterBaseName = TypePlacement._('AfterBaseName');

  final String value;

  const TypePlacement._(this.value);

  static const values = [beforeBaseName, afterBaseName];

  static TypePlacement fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TypePlacement._(value));

  @override
  bool operator ==(other) => other is TypePlacement && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// SuggestFilter structure which contains a set of inclusion/exclusion
/// properties that results must possess in order to be returned as a result.
///
/// @nodoc
class SuggestFilter {
  /// The bounding box enclosing the geometric shape (area or line) that an
  /// individual result covers.
  ///
  /// The bounding box formed is defined as a set 4 coordinates: <code>\[{westward
  /// lng}, {southern lat}, {eastward lng}, {northern lat}\]</code>
  final List<double>? boundingBox;
  final FilterCircle? circle;

  /// A list of countries that all results must be in. Countries are represented
  /// by either their alpha-2 or alpha-3 character codes.
  final List<String>? includeCountries;

  SuggestFilter({
    this.boundingBox,
    this.circle,
    this.includeCountries,
  });

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final circle = this.circle;
    final includeCountries = this.includeCountries;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (circle != null) 'Circle': circle,
      if (includeCountries != null) 'IncludeCountries': includeCountries,
    };
  }
}

/// @nodoc
class SuggestIntendedUse {
  static const singleUse = SuggestIntendedUse._('SingleUse');

  final String value;

  const SuggestIntendedUse._(this.value);

  static const values = [singleUse];

  static SuggestIntendedUse fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SuggestIntendedUse._(value));

  @override
  bool operator ==(other) =>
      other is SuggestIntendedUse && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SuggestAdditionalFeature {
  static const core = SuggestAdditionalFeature._('Core');
  static const timeZone = SuggestAdditionalFeature._('TimeZone');
  static const phonemes = SuggestAdditionalFeature._('Phonemes');
  static const access = SuggestAdditionalFeature._('Access');

  final String value;

  const SuggestAdditionalFeature._(this.value);

  static const values = [core, timeZone, phonemes, access];

  static SuggestAdditionalFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SuggestAdditionalFeature._(value));

  @override
  bool operator ==(other) =>
      other is SuggestAdditionalFeature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The <code>Circle</code> that all results must be in.
///
/// @nodoc
class FilterCircle {
  /// The center position in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\].
  final List<double> center;

  /// The radius, in meters, of the <code>FilterCircle</code>. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers,<code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only up to a maximum value of 300,000.
  final int radius;

  FilterCircle({
    required this.center,
    required this.radius,
  });

  Map<String, dynamic> toJson() {
    final center = this.center;
    final radius = this.radius;
    return {
      'Center': center,
      'Radius': radius,
    };
  }
}

/// The text search result.
///
/// @nodoc
class SearchTextResultItem {
  /// The <code>PlaceId</code> of the place you wish to receive the information
  /// for.
  final String placeId;

  /// A <code>PlaceType</code> is a category that the result place must belong to.
  final PlaceType placeType;

  /// The item's title.
  final String title;

  /// Position of the access point in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\].
  final List<AccessPoint>? accessPoints;

  /// Indicates known access restrictions on a vehicle access point. The index
  /// correlates to an access point and indicates if access through this point has
  /// some form of restriction.
  final List<AccessRestriction>? accessRestrictions;

  /// The place's address.
  final Address? address;

  /// Boolean indicating if the address provided has been corrected.
  final bool? addressNumberCorrected;

  /// The Business Chains associated with the place.
  final List<BusinessChain>? businessChains;

  /// Categories of results that results must belong to.
  final List<Category>? categories;

  /// List of potential contact methods for the result/place.
  final Contacts? contacts;

  /// The distance in meters from the QueryPosition.
  final int? distance;

  /// List of food types offered by this result.
  final List<FoodType>? foodTypes;

  /// The bounding box enclosing the geometric shape (area or line) that an
  /// individual result covers.
  ///
  /// The bounding box formed is defined as a set 4 coordinates: <code>\[{westward
  /// lng}, {southern lat}, {eastward lng}, {northern lat}\]</code>
  final List<double>? mapView;

  /// List of opening hours objects.
  final List<OpeningHours>? openingHours;

  /// How the various components of the result's address are pronounced in various
  /// languages.
  final PhonemeDetails? phonemes;

  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country.
  final String? politicalView;

  /// The position in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\].
  final List<double>? position;

  /// The time zone in which the place is located.
  final TimeZone? timeZone;

  SearchTextResultItem({
    required this.placeId,
    required this.placeType,
    required this.title,
    this.accessPoints,
    this.accessRestrictions,
    this.address,
    this.addressNumberCorrected,
    this.businessChains,
    this.categories,
    this.contacts,
    this.distance,
    this.foodTypes,
    this.mapView,
    this.openingHours,
    this.phonemes,
    this.politicalView,
    this.position,
    this.timeZone,
  });

  factory SearchTextResultItem.fromJson(Map<String, dynamic> json) {
    return SearchTextResultItem(
      placeId: (json['PlaceId'] as String?) ?? '',
      placeType: PlaceType.fromString((json['PlaceType'] as String?) ?? ''),
      title: (json['Title'] as String?) ?? '',
      accessPoints: (json['AccessPoints'] as List?)
          ?.nonNulls
          .map((e) => AccessPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessRestrictions: (json['AccessRestrictions'] as List?)
          ?.nonNulls
          .map((e) => AccessRestriction.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      addressNumberCorrected: json['AddressNumberCorrected'] as bool?,
      businessChains: (json['BusinessChains'] as List?)
          ?.nonNulls
          .map((e) => BusinessChain.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['Categories'] as List?)
          ?.nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      contacts: json['Contacts'] != null
          ? Contacts.fromJson(json['Contacts'] as Map<String, dynamic>)
          : null,
      distance: json['Distance'] as int?,
      foodTypes: (json['FoodTypes'] as List?)
          ?.nonNulls
          .map((e) => FoodType.fromJson(e as Map<String, dynamic>))
          .toList(),
      mapView:
          (json['MapView'] as List?)?.nonNulls.map((e) => e as double).toList(),
      openingHours: (json['OpeningHours'] as List?)
          ?.nonNulls
          .map((e) => OpeningHours.fromJson(e as Map<String, dynamic>))
          .toList(),
      phonemes: json['Phonemes'] != null
          ? PhonemeDetails.fromJson(json['Phonemes'] as Map<String, dynamic>)
          : null,
      politicalView: json['PoliticalView'] as String?,
      position: (json['Position'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      timeZone: json['TimeZone'] != null
          ? TimeZone.fromJson(json['TimeZone'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final placeId = this.placeId;
    final placeType = this.placeType;
    final title = this.title;
    final accessPoints = this.accessPoints;
    final accessRestrictions = this.accessRestrictions;
    final address = this.address;
    final addressNumberCorrected = this.addressNumberCorrected;
    final businessChains = this.businessChains;
    final categories = this.categories;
    final contacts = this.contacts;
    final distance = this.distance;
    final foodTypes = this.foodTypes;
    final mapView = this.mapView;
    final openingHours = this.openingHours;
    final phonemes = this.phonemes;
    final politicalView = this.politicalView;
    final position = this.position;
    final timeZone = this.timeZone;
    return {
      'PlaceId': placeId,
      'PlaceType': placeType.value,
      'Title': title,
      if (accessPoints != null) 'AccessPoints': accessPoints,
      if (accessRestrictions != null) 'AccessRestrictions': accessRestrictions,
      if (address != null) 'Address': address,
      if (addressNumberCorrected != null)
        'AddressNumberCorrected': addressNumberCorrected,
      if (businessChains != null) 'BusinessChains': businessChains,
      if (categories != null) 'Categories': categories,
      if (contacts != null) 'Contacts': contacts,
      if (distance != null) 'Distance': distance,
      if (foodTypes != null) 'FoodTypes': foodTypes,
      if (mapView != null) 'MapView': mapView,
      if (openingHours != null) 'OpeningHours': openingHours,
      if (phonemes != null) 'Phonemes': phonemes,
      if (politicalView != null) 'PoliticalView': politicalView,
      if (position != null) 'Position': position,
      if (timeZone != null) 'TimeZone': timeZone,
    };
  }
}

/// A list of potential contact methods for the result/place.
///
/// @nodoc
class Contacts {
  /// List of emails for contacts of the result.
  final List<ContactDetails>? emails;

  /// List of fax addresses for the result contact.
  final List<ContactDetails>? faxes;

  /// List of phone numbers for the results contact.
  final List<ContactDetails>? phones;

  /// List of website URLs that belong to the result.
  final List<ContactDetails>? websites;

  Contacts({
    this.emails,
    this.faxes,
    this.phones,
    this.websites,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) {
    return Contacts(
      emails: (json['Emails'] as List?)
          ?.nonNulls
          .map((e) => ContactDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      faxes: (json['Faxes'] as List?)
          ?.nonNulls
          .map((e) => ContactDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      phones: (json['Phones'] as List?)
          ?.nonNulls
          .map((e) => ContactDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      websites: (json['Websites'] as List?)
          ?.nonNulls
          .map((e) => ContactDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final emails = this.emails;
    final faxes = this.faxes;
    final phones = this.phones;
    final websites = this.websites;
    return {
      if (emails != null) 'Emails': emails,
      if (faxes != null) 'Faxes': faxes,
      if (phones != null) 'Phones': phones,
      if (websites != null) 'Websites': websites,
    };
  }
}

/// List of opening hours objects.
///
/// @nodoc
class OpeningHours {
  /// Categories of results that results must belong too.
  final List<Category>? categories;

  /// Components of the opening hours object.
  final List<OpeningHoursComponents>? components;

  /// List of opening hours in the format they are displayed in. This can vary by
  /// result and in most cases represents how the result uniquely formats their
  /// opening hours.
  final List<String>? display;

  /// Boolean which indicates if the result/place is currently open.
  final bool? openNow;

  OpeningHours({
    this.categories,
    this.components,
    this.display,
    this.openNow,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(
      categories: (json['Categories'] as List?)
          ?.nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      components: (json['Components'] as List?)
          ?.nonNulls
          .map(
              (e) => OpeningHoursComponents.fromJson(e as Map<String, dynamic>))
          .toList(),
      display:
          (json['Display'] as List?)?.nonNulls.map((e) => e as String).toList(),
      openNow: json['OpenNow'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final categories = this.categories;
    final components = this.components;
    final display = this.display;
    final openNow = this.openNow;
    return {
      if (categories != null) 'Categories': categories,
      if (components != null) 'Components': components,
      if (display != null) 'Display': display,
      if (openNow != null) 'OpenNow': openNow,
    };
  }
}

/// Components of the opening hours object.
///
/// @nodoc
class OpeningHoursComponents {
  /// String which represents the duration of the opening period, such as
  /// <code>"PT12H00M"</code>.
  final String? openDuration;

  /// String which represents the opening hours, such as <code>"T070000"</code>.
  final String? openTime;

  /// Days or periods when the provided opening hours are in affect.
  ///
  /// Example: <code>FREQ:DAILY;BYDAY:MO,TU,WE,TH,SU</code>
  final String? recurrence;

  OpeningHoursComponents({
    this.openDuration,
    this.openTime,
    this.recurrence,
  });

  factory OpeningHoursComponents.fromJson(Map<String, dynamic> json) {
    return OpeningHoursComponents(
      openDuration: json['OpenDuration'] as String?,
      openTime: json['OpenTime'] as String?,
      recurrence: json['Recurrence'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final openDuration = this.openDuration;
    final openTime = this.openTime;
    final recurrence = this.recurrence;
    return {
      if (openDuration != null) 'OpenDuration': openDuration,
      if (openTime != null) 'OpenTime': openTime,
      if (recurrence != null) 'Recurrence': recurrence,
    };
  }
}

/// Details related to contacts.
///
/// @nodoc
class ContactDetails {
  /// Categories of results that results must belong too.
  final List<Category>? categories;

  /// The contact's label.
  final String? label;

  /// The contact's value.
  final String? value;

  ContactDetails({
    this.categories,
    this.label,
    this.value,
  });

  factory ContactDetails.fromJson(Map<String, dynamic> json) {
    return ContactDetails(
      categories: (json['Categories'] as List?)
          ?.nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      label: json['Label'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final categories = this.categories;
    final label = this.label;
    final value = this.value;
    return {
      if (categories != null) 'Categories': categories,
      if (label != null) 'Label': label,
      if (value != null) 'Value': value,
    };
  }
}

/// SearchText structure which contains a set of inclusion/exclusion properties
/// that results must possess in order to be returned as a result.
///
/// @nodoc
class SearchTextFilter {
  /// The bounding box enclosing the geometric shape (area or line) that an
  /// individual result covers.
  ///
  /// The bounding box formed is defined as a set 4 coordinates: <code>\[{westward
  /// lng}, {southern lat}, {eastward lng}, {northern lat}\]</code>
  final List<double>? boundingBox;
  final FilterCircle? circle;

  /// A list of countries that all results must be in. Countries are represented
  /// by either their alpha-2 or alpha-3 character codes.
  final List<String>? includeCountries;

  SearchTextFilter({
    this.boundingBox,
    this.circle,
    this.includeCountries,
  });

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final circle = this.circle;
    final includeCountries = this.includeCountries;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (circle != null) 'Circle': circle,
      if (includeCountries != null) 'IncludeCountries': includeCountries,
    };
  }
}

/// @nodoc
class SearchTextIntendedUse {
  static const singleUse = SearchTextIntendedUse._('SingleUse');
  static const storage = SearchTextIntendedUse._('Storage');

  final String value;

  const SearchTextIntendedUse._(this.value);

  static const values = [singleUse, storage];

  static SearchTextIntendedUse fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchTextIntendedUse._(value));

  @override
  bool operator ==(other) =>
      other is SearchTextIntendedUse && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SearchTextAdditionalFeature {
  static const timeZone = SearchTextAdditionalFeature._('TimeZone');
  static const phonemes = SearchTextAdditionalFeature._('Phonemes');
  static const access = SearchTextAdditionalFeature._('Access');
  static const contact = SearchTextAdditionalFeature._('Contact');

  final String value;

  const SearchTextAdditionalFeature._(this.value);

  static const values = [timeZone, phonemes, access, contact];

  static SearchTextAdditionalFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchTextAdditionalFeature._(value));

  @override
  bool operator ==(other) =>
      other is SearchTextAdditionalFeature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The search results of nearby places.
///
/// @nodoc
class SearchNearbyResultItem {
  /// The <code>PlaceId</code> of the place you wish to receive the information
  /// for.
  final String placeId;

  /// A <code>PlaceType</code> is a category that the result place must belong to.
  final PlaceType placeType;

  /// The item's title.
  final String title;

  /// Position of the access point in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\].
  final List<AccessPoint>? accessPoints;

  /// Indicates known access restrictions on a vehicle access point. The index
  /// correlates to an access point and indicates if access through this point has
  /// some form of restriction.
  final List<AccessRestriction>? accessRestrictions;

  /// The place's address.
  final Address? address;

  /// Boolean indicating if the address provided has been corrected.
  final bool? addressNumberCorrected;

  /// The Business Chains associated with the place.
  final List<BusinessChain>? businessChains;

  /// Categories of results that results must belong to.
  final List<Category>? categories;

  /// List of potential contact methods for the result/place.
  final Contacts? contacts;

  /// The distance in meters from the QueryPosition.
  final int? distance;

  /// List of food types offered by this result.
  final List<FoodType>? foodTypes;

  /// The bounding box enclosing the geometric shape (area or line) that an
  /// individual result covers.
  ///
  /// The bounding box formed is defined as a set 4 coordinates: <code>\[{westward
  /// lng}, {southern lat}, {eastward lng}, {northern lat}\]</code>
  final List<double>? mapView;

  /// List of opening hours objects.
  final List<OpeningHours>? openingHours;

  /// How the various components of the result's address are pronounced in various
  /// languages.
  final PhonemeDetails? phonemes;

  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country.
  final String? politicalView;

  /// The position in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\].
  final List<double>? position;

  /// The time zone in which the place is located.
  final TimeZone? timeZone;

  SearchNearbyResultItem({
    required this.placeId,
    required this.placeType,
    required this.title,
    this.accessPoints,
    this.accessRestrictions,
    this.address,
    this.addressNumberCorrected,
    this.businessChains,
    this.categories,
    this.contacts,
    this.distance,
    this.foodTypes,
    this.mapView,
    this.openingHours,
    this.phonemes,
    this.politicalView,
    this.position,
    this.timeZone,
  });

  factory SearchNearbyResultItem.fromJson(Map<String, dynamic> json) {
    return SearchNearbyResultItem(
      placeId: (json['PlaceId'] as String?) ?? '',
      placeType: PlaceType.fromString((json['PlaceType'] as String?) ?? ''),
      title: (json['Title'] as String?) ?? '',
      accessPoints: (json['AccessPoints'] as List?)
          ?.nonNulls
          .map((e) => AccessPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessRestrictions: (json['AccessRestrictions'] as List?)
          ?.nonNulls
          .map((e) => AccessRestriction.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      addressNumberCorrected: json['AddressNumberCorrected'] as bool?,
      businessChains: (json['BusinessChains'] as List?)
          ?.nonNulls
          .map((e) => BusinessChain.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['Categories'] as List?)
          ?.nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      contacts: json['Contacts'] != null
          ? Contacts.fromJson(json['Contacts'] as Map<String, dynamic>)
          : null,
      distance: json['Distance'] as int?,
      foodTypes: (json['FoodTypes'] as List?)
          ?.nonNulls
          .map((e) => FoodType.fromJson(e as Map<String, dynamic>))
          .toList(),
      mapView:
          (json['MapView'] as List?)?.nonNulls.map((e) => e as double).toList(),
      openingHours: (json['OpeningHours'] as List?)
          ?.nonNulls
          .map((e) => OpeningHours.fromJson(e as Map<String, dynamic>))
          .toList(),
      phonemes: json['Phonemes'] != null
          ? PhonemeDetails.fromJson(json['Phonemes'] as Map<String, dynamic>)
          : null,
      politicalView: json['PoliticalView'] as String?,
      position: (json['Position'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      timeZone: json['TimeZone'] != null
          ? TimeZone.fromJson(json['TimeZone'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final placeId = this.placeId;
    final placeType = this.placeType;
    final title = this.title;
    final accessPoints = this.accessPoints;
    final accessRestrictions = this.accessRestrictions;
    final address = this.address;
    final addressNumberCorrected = this.addressNumberCorrected;
    final businessChains = this.businessChains;
    final categories = this.categories;
    final contacts = this.contacts;
    final distance = this.distance;
    final foodTypes = this.foodTypes;
    final mapView = this.mapView;
    final openingHours = this.openingHours;
    final phonemes = this.phonemes;
    final politicalView = this.politicalView;
    final position = this.position;
    final timeZone = this.timeZone;
    return {
      'PlaceId': placeId,
      'PlaceType': placeType.value,
      'Title': title,
      if (accessPoints != null) 'AccessPoints': accessPoints,
      if (accessRestrictions != null) 'AccessRestrictions': accessRestrictions,
      if (address != null) 'Address': address,
      if (addressNumberCorrected != null)
        'AddressNumberCorrected': addressNumberCorrected,
      if (businessChains != null) 'BusinessChains': businessChains,
      if (categories != null) 'Categories': categories,
      if (contacts != null) 'Contacts': contacts,
      if (distance != null) 'Distance': distance,
      if (foodTypes != null) 'FoodTypes': foodTypes,
      if (mapView != null) 'MapView': mapView,
      if (openingHours != null) 'OpeningHours': openingHours,
      if (phonemes != null) 'Phonemes': phonemes,
      if (politicalView != null) 'PoliticalView': politicalView,
      if (position != null) 'Position': position,
      if (timeZone != null) 'TimeZone': timeZone,
    };
  }
}

/// SearchNearby structure which contains a set of inclusion/exclusion
/// properties that results must possess in order to be returned as a result.
///
/// @nodoc
class SearchNearbyFilter {
  /// The bounding box enclosing the geometric shape (area or line) that an
  /// individual result covers.
  ///
  /// The bounding box formed is defined as a set 4 coordinates: <code>\[{westward
  /// lng}, {southern lat}, {eastward lng}, {northern lat}\]</code>
  final List<double>? boundingBox;

  /// The Business Chains associated with the place.
  final List<String>? excludeBusinessChains;

  /// Categories of results that results are excluded from.
  final List<String>? excludeCategories;

  /// Food types that results are excluded from.
  final List<String>? excludeFoodTypes;

  /// The Business Chains associated with the place.
  final List<String>? includeBusinessChains;

  /// Categories of results that results must belong too.
  final List<String>? includeCategories;

  /// A list of countries that all results must be in. Countries are represented
  /// by either their alpha-2 or alpha-3 character codes.
  final List<String>? includeCountries;

  /// Food types that results are included from.
  final List<String>? includeFoodTypes;

  SearchNearbyFilter({
    this.boundingBox,
    this.excludeBusinessChains,
    this.excludeCategories,
    this.excludeFoodTypes,
    this.includeBusinessChains,
    this.includeCategories,
    this.includeCountries,
    this.includeFoodTypes,
  });

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final excludeBusinessChains = this.excludeBusinessChains;
    final excludeCategories = this.excludeCategories;
    final excludeFoodTypes = this.excludeFoodTypes;
    final includeBusinessChains = this.includeBusinessChains;
    final includeCategories = this.includeCategories;
    final includeCountries = this.includeCountries;
    final includeFoodTypes = this.includeFoodTypes;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (excludeBusinessChains != null)
        'ExcludeBusinessChains': excludeBusinessChains,
      if (excludeCategories != null) 'ExcludeCategories': excludeCategories,
      if (excludeFoodTypes != null) 'ExcludeFoodTypes': excludeFoodTypes,
      if (includeBusinessChains != null)
        'IncludeBusinessChains': includeBusinessChains,
      if (includeCategories != null) 'IncludeCategories': includeCategories,
      if (includeCountries != null) 'IncludeCountries': includeCountries,
      if (includeFoodTypes != null) 'IncludeFoodTypes': includeFoodTypes,
    };
  }
}

/// @nodoc
class SearchNearbyIntendedUse {
  static const singleUse = SearchNearbyIntendedUse._('SingleUse');
  static const storage = SearchNearbyIntendedUse._('Storage');

  final String value;

  const SearchNearbyIntendedUse._(this.value);

  static const values = [singleUse, storage];

  static SearchNearbyIntendedUse fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchNearbyIntendedUse._(value));

  @override
  bool operator ==(other) =>
      other is SearchNearbyIntendedUse && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SearchNearbyAdditionalFeature {
  static const timeZone = SearchNearbyAdditionalFeature._('TimeZone');
  static const phonemes = SearchNearbyAdditionalFeature._('Phonemes');
  static const access = SearchNearbyAdditionalFeature._('Access');
  static const contact = SearchNearbyAdditionalFeature._('Contact');

  final String value;

  const SearchNearbyAdditionalFeature._(this.value);

  static const values = [timeZone, phonemes, access, contact];

  static SearchNearbyAdditionalFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchNearbyAdditionalFeature._(value));

  @override
  bool operator ==(other) =>
      other is SearchNearbyAdditionalFeature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The returned location from the <code>Reverse Geocode</code> action.
///
/// @nodoc
class ReverseGeocodeResultItem {
  /// The <code>PlaceId</code> of the place you wish to receive the information
  /// for.
  final String placeId;

  /// A <code>PlaceType</code> is a category that the result place must belong to.
  final PlaceType placeType;

  /// The localized display name of this result item based on request parameter
  /// <code>language</code>.
  final String title;

  /// Position of the access point in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\]. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<AccessPoint>? accessPoints;

  /// The place's address.
  final Address? address;

  /// Boolean indicating if the address provided has been corrected. Not available
  /// in <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final bool? addressNumberCorrected;

  /// Categories of results that results must belong to.
  final List<Category>? categories;

  /// The distance in meters from the QueryPosition.
  final int? distance;

  /// List of food types offered by this result. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<FoodType>? foodTypes;

  /// All Intersections that are near the provided address. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<Intersection>? intersections;

  /// The bounding box enclosing the geometric shape (area or line) that an
  /// individual result covers.
  ///
  /// The bounding box formed is defined as a set 4 coordinates: <code>\[{westward
  /// lng}, {southern lat}, {eastward lng}, {northern lat}\]</code>
  final List<double>? mapView;

  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country. Not available in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final String? politicalView;

  /// The position in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\].
  final List<double>? position;

  /// Contains details about the postal code of the place/result. Not available in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  final List<PostalCodeDetails>? postalCodeDetails;

  /// The time zone in which the place is located.
  final TimeZone? timeZone;

  ReverseGeocodeResultItem({
    required this.placeId,
    required this.placeType,
    required this.title,
    this.accessPoints,
    this.address,
    this.addressNumberCorrected,
    this.categories,
    this.distance,
    this.foodTypes,
    this.intersections,
    this.mapView,
    this.politicalView,
    this.position,
    this.postalCodeDetails,
    this.timeZone,
  });

  factory ReverseGeocodeResultItem.fromJson(Map<String, dynamic> json) {
    return ReverseGeocodeResultItem(
      placeId: (json['PlaceId'] as String?) ?? '',
      placeType: PlaceType.fromString((json['PlaceType'] as String?) ?? ''),
      title: (json['Title'] as String?) ?? '',
      accessPoints: (json['AccessPoints'] as List?)
          ?.nonNulls
          .map((e) => AccessPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      addressNumberCorrected: json['AddressNumberCorrected'] as bool?,
      categories: (json['Categories'] as List?)
          ?.nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      distance: json['Distance'] as int?,
      foodTypes: (json['FoodTypes'] as List?)
          ?.nonNulls
          .map((e) => FoodType.fromJson(e as Map<String, dynamic>))
          .toList(),
      intersections: (json['Intersections'] as List?)
          ?.nonNulls
          .map((e) => Intersection.fromJson(e as Map<String, dynamic>))
          .toList(),
      mapView:
          (json['MapView'] as List?)?.nonNulls.map((e) => e as double).toList(),
      politicalView: json['PoliticalView'] as String?,
      position: (json['Position'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      postalCodeDetails: (json['PostalCodeDetails'] as List?)
          ?.nonNulls
          .map((e) => PostalCodeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeZone: json['TimeZone'] != null
          ? TimeZone.fromJson(json['TimeZone'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final placeId = this.placeId;
    final placeType = this.placeType;
    final title = this.title;
    final accessPoints = this.accessPoints;
    final address = this.address;
    final addressNumberCorrected = this.addressNumberCorrected;
    final categories = this.categories;
    final distance = this.distance;
    final foodTypes = this.foodTypes;
    final intersections = this.intersections;
    final mapView = this.mapView;
    final politicalView = this.politicalView;
    final position = this.position;
    final postalCodeDetails = this.postalCodeDetails;
    final timeZone = this.timeZone;
    return {
      'PlaceId': placeId,
      'PlaceType': placeType.value,
      'Title': title,
      if (accessPoints != null) 'AccessPoints': accessPoints,
      if (address != null) 'Address': address,
      if (addressNumberCorrected != null)
        'AddressNumberCorrected': addressNumberCorrected,
      if (categories != null) 'Categories': categories,
      if (distance != null) 'Distance': distance,
      if (foodTypes != null) 'FoodTypes': foodTypes,
      if (intersections != null) 'Intersections': intersections,
      if (mapView != null) 'MapView': mapView,
      if (politicalView != null) 'PoliticalView': politicalView,
      if (position != null) 'Position': position,
      if (postalCodeDetails != null) 'PostalCodeDetails': postalCodeDetails,
      if (timeZone != null) 'TimeZone': timeZone,
    };
  }
}

/// All Intersections that are near the provided address.
///
/// @nodoc
class Intersection {
  /// The <code>PlaceId</code> of the place result.
  final String placeId;

  /// The localized display name of this result item based on request parameter
  /// <code>language</code>.
  final String title;

  /// Position of the access point in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\].
  final List<AccessPoint>? accessPoints;
  final Address? address;

  /// The distance in meters from the QueryPosition.
  final int? distance;

  /// The bounding box enclosing the geometric shape (area or line) that an
  /// individual result covers.
  ///
  /// The bounding box formed is defined as a set of four coordinates:
  /// <code>\[{westward lng}, {southern lat}, {eastward lng}, {northern
  /// lat}\]</code>
  final List<double>? mapView;

  /// The position in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\].
  final List<double>? position;

  /// The distance from the routing position of the nearby address to the street
  /// result.
  final int? routeDistance;

  Intersection({
    required this.placeId,
    required this.title,
    this.accessPoints,
    this.address,
    this.distance,
    this.mapView,
    this.position,
    this.routeDistance,
  });

  factory Intersection.fromJson(Map<String, dynamic> json) {
    return Intersection(
      placeId: (json['PlaceId'] as String?) ?? '',
      title: (json['Title'] as String?) ?? '',
      accessPoints: (json['AccessPoints'] as List?)
          ?.nonNulls
          .map((e) => AccessPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      distance: json['Distance'] as int?,
      mapView:
          (json['MapView'] as List?)?.nonNulls.map((e) => e as double).toList(),
      position: (json['Position'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      routeDistance: json['RouteDistance'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final placeId = this.placeId;
    final title = this.title;
    final accessPoints = this.accessPoints;
    final address = this.address;
    final distance = this.distance;
    final mapView = this.mapView;
    final position = this.position;
    final routeDistance = this.routeDistance;
    return {
      'PlaceId': placeId,
      'Title': title,
      if (accessPoints != null) 'AccessPoints': accessPoints,
      if (address != null) 'Address': address,
      if (distance != null) 'Distance': distance,
      if (mapView != null) 'MapView': mapView,
      if (position != null) 'Position': position,
      if (routeDistance != null) 'RouteDistance': routeDistance,
    };
  }
}

/// Contains details about the postal code of the place or result.
///
/// @nodoc
class PostalCodeDetails {
  /// The postal authority or entity. This could be a governmental authority, a
  /// regulatory authority, or a designated postal operator.
  final PostalAuthority? postalAuthority;

  /// An alphanumeric string included in a postal address to facilitate mail
  /// sorting, such as post code, postcode, or ZIP code for which the result
  /// should possess.
  final String? postalCode;

  /// The postal code type.
  final PostalCodeType? postalCodeType;

  /// The ZIP Classification Code, or in other words what type of postal code is
  /// it.
  final UspsZip? uspsZip;

  /// The USPS ZIP+4 Record Type Code.
  final UspsZipPlus4? uspsZipPlus4;

  PostalCodeDetails({
    this.postalAuthority,
    this.postalCode,
    this.postalCodeType,
    this.uspsZip,
    this.uspsZipPlus4,
  });

  factory PostalCodeDetails.fromJson(Map<String, dynamic> json) {
    return PostalCodeDetails(
      postalAuthority:
          (json['PostalAuthority'] as String?)?.let(PostalAuthority.fromString),
      postalCode: json['PostalCode'] as String?,
      postalCodeType:
          (json['PostalCodeType'] as String?)?.let(PostalCodeType.fromString),
      uspsZip: json['UspsZip'] != null
          ? UspsZip.fromJson(json['UspsZip'] as Map<String, dynamic>)
          : null,
      uspsZipPlus4: json['UspsZipPlus4'] != null
          ? UspsZipPlus4.fromJson(json['UspsZipPlus4'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final postalAuthority = this.postalAuthority;
    final postalCode = this.postalCode;
    final postalCodeType = this.postalCodeType;
    final uspsZip = this.uspsZip;
    final uspsZipPlus4 = this.uspsZipPlus4;
    return {
      if (postalAuthority != null) 'PostalAuthority': postalAuthority.value,
      if (postalCode != null) 'PostalCode': postalCode,
      if (postalCodeType != null) 'PostalCodeType': postalCodeType.value,
      if (uspsZip != null) 'UspsZip': uspsZip,
      if (uspsZipPlus4 != null) 'UspsZipPlus4': uspsZipPlus4,
    };
  }
}

/// @nodoc
class PostalAuthority {
  static const usps = PostalAuthority._('Usps');

  final String value;

  const PostalAuthority._(this.value);

  static const values = [usps];

  static PostalAuthority fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PostalAuthority._(value));

  @override
  bool operator ==(other) => other is PostalAuthority && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PostalCodeType {
  static const uspsZip = PostalCodeType._('UspsZip');
  static const uspsZipPlus4 = PostalCodeType._('UspsZipPlus4');

  final String value;

  const PostalCodeType._(this.value);

  static const values = [uspsZip, uspsZipPlus4];

  static PostalCodeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PostalCodeType._(value));

  @override
  bool operator ==(other) => other is PostalCodeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The USPS zip code.
///
/// @nodoc
class UspsZip {
  /// The ZIP Classification Code, or in other words what type of postal code is
  /// it.
  final ZipClassificationCode? zipClassificationCode;

  UspsZip({
    this.zipClassificationCode,
  });

  factory UspsZip.fromJson(Map<String, dynamic> json) {
    return UspsZip(
      zipClassificationCode: (json['ZipClassificationCode'] as String?)
          ?.let(ZipClassificationCode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final zipClassificationCode = this.zipClassificationCode;
    return {
      if (zipClassificationCode != null)
        'ZipClassificationCode': zipClassificationCode.value,
    };
  }
}

/// The USPS zip+4 code.
///
/// @nodoc
class UspsZipPlus4 {
  /// The USPS ZIP+4 Record Type Code.
  final RecordTypeCode? recordTypeCode;

  UspsZipPlus4({
    this.recordTypeCode,
  });

  factory UspsZipPlus4.fromJson(Map<String, dynamic> json) {
    return UspsZipPlus4(
      recordTypeCode:
          (json['RecordTypeCode'] as String?)?.let(RecordTypeCode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final recordTypeCode = this.recordTypeCode;
    return {
      if (recordTypeCode != null) 'RecordTypeCode': recordTypeCode.value,
    };
  }
}

/// @nodoc
class RecordTypeCode {
  static const firm = RecordTypeCode._('Firm');
  static const general = RecordTypeCode._('General');
  static const highRise = RecordTypeCode._('HighRise');
  static const postOfficeBox = RecordTypeCode._('PostOfficeBox');
  static const rural = RecordTypeCode._('Rural');
  static const street = RecordTypeCode._('Street');

  final String value;

  const RecordTypeCode._(this.value);

  static const values = [firm, general, highRise, postOfficeBox, rural, street];

  static RecordTypeCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecordTypeCode._(value));

  @override
  bool operator ==(other) => other is RecordTypeCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ZipClassificationCode {
  static const military = ZipClassificationCode._('Military');
  static const postOfficeBoxes = ZipClassificationCode._('PostOfficeBoxes');
  static const unique = ZipClassificationCode._('Unique');

  final String value;

  const ZipClassificationCode._(this.value);

  static const values = [military, postOfficeBoxes, unique];

  static ZipClassificationCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ZipClassificationCode._(value));

  @override
  bool operator ==(other) =>
      other is ZipClassificationCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The included place types.
///
/// @nodoc
class ReverseGeocodeFilter {
  /// The included place types. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only <code>Street</code> and <code>PointAddress</code>
  /// values.
  final List<ReverseGeocodeFilterPlaceType>? includePlaceTypes;

  ReverseGeocodeFilter({
    this.includePlaceTypes,
  });

  Map<String, dynamic> toJson() {
    final includePlaceTypes = this.includePlaceTypes;
    return {
      if (includePlaceTypes != null)
        'IncludePlaceTypes': includePlaceTypes.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class ReverseGeocodeIntendedUse {
  static const singleUse = ReverseGeocodeIntendedUse._('SingleUse');
  static const storage = ReverseGeocodeIntendedUse._('Storage');

  final String value;

  const ReverseGeocodeIntendedUse._(this.value);

  static const values = [singleUse, storage];

  static ReverseGeocodeIntendedUse fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReverseGeocodeIntendedUse._(value));

  @override
  bool operator ==(other) =>
      other is ReverseGeocodeIntendedUse && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ReverseGeocodeAdditionalFeature {
  static const timeZone = ReverseGeocodeAdditionalFeature._('TimeZone');
  static const access = ReverseGeocodeAdditionalFeature._('Access');
  static const intersections =
      ReverseGeocodeAdditionalFeature._('Intersections');

  final String value;

  const ReverseGeocodeAdditionalFeature._(this.value);

  static const values = [timeZone, access, intersections];

  static ReverseGeocodeAdditionalFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReverseGeocodeAdditionalFeature._(value));

  @override
  bool operator ==(other) =>
      other is ReverseGeocodeAdditionalFeature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ReverseGeocodeFilterPlaceType {
  static const locality = ReverseGeocodeFilterPlaceType._('Locality');
  static const intersection = ReverseGeocodeFilterPlaceType._('Intersection');
  static const street = ReverseGeocodeFilterPlaceType._('Street');
  static const pointAddress = ReverseGeocodeFilterPlaceType._('PointAddress');
  static const interpolatedAddress =
      ReverseGeocodeFilterPlaceType._('InterpolatedAddress');

  final String value;

  const ReverseGeocodeFilterPlaceType._(this.value);

  static const values = [
    locality,
    intersection,
    street,
    pointAddress,
    interpolatedAddress
  ];

  static ReverseGeocodeFilterPlaceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReverseGeocodeFilterPlaceType._(value));

  @override
  bool operator ==(other) =>
      other is ReverseGeocodeFilterPlaceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Place that is related to the result item.
///
/// @nodoc
class RelatedPlace {
  /// The <code>PlaceId</code> of the place result.
  final String placeId;

  /// A <code>PlaceType</code> is a category that the result place must belong to.
  final PlaceType placeType;

  /// The localized display name of this result item based on request parameter
  /// <code>language</code>.
  final String title;

  /// Position of the access point in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\].
  final List<AccessPoint>? accessPoints;
  final Address? address;

  /// The position in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\].
  final List<double>? position;

  RelatedPlace({
    required this.placeId,
    required this.placeType,
    required this.title,
    this.accessPoints,
    this.address,
    this.position,
  });

  factory RelatedPlace.fromJson(Map<String, dynamic> json) {
    return RelatedPlace(
      placeId: (json['PlaceId'] as String?) ?? '',
      placeType: PlaceType.fromString((json['PlaceType'] as String?) ?? ''),
      title: (json['Title'] as String?) ?? '',
      accessPoints: (json['AccessPoints'] as List?)
          ?.nonNulls
          .map((e) => AccessPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      position: (json['Position'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final placeId = this.placeId;
    final placeType = this.placeType;
    final title = this.title;
    final accessPoints = this.accessPoints;
    final address = this.address;
    final position = this.position;
    return {
      'PlaceId': placeId,
      'PlaceType': placeType.value,
      'Title': title,
      if (accessPoints != null) 'AccessPoints': accessPoints,
      if (address != null) 'Address': address,
      if (position != null) 'Position': position,
    };
  }
}

/// @nodoc
class GetPlaceIntendedUse {
  static const singleUse = GetPlaceIntendedUse._('SingleUse');
  static const storage = GetPlaceIntendedUse._('Storage');

  final String value;

  const GetPlaceIntendedUse._(this.value);

  static const values = [singleUse, storage];

  static GetPlaceIntendedUse fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GetPlaceIntendedUse._(value));

  @override
  bool operator ==(other) =>
      other is GetPlaceIntendedUse && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GetPlaceAdditionalFeature {
  static const timeZone = GetPlaceAdditionalFeature._('TimeZone');
  static const phonemes = GetPlaceAdditionalFeature._('Phonemes');
  static const access = GetPlaceAdditionalFeature._('Access');
  static const contact = GetPlaceAdditionalFeature._('Contact');
  static const secondaryAddresses =
      GetPlaceAdditionalFeature._('SecondaryAddresses');

  final String value;

  const GetPlaceAdditionalFeature._(this.value);

  static const values = [
    timeZone,
    phonemes,
    access,
    contact,
    secondaryAddresses
  ];

  static GetPlaceAdditionalFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GetPlaceAdditionalFeature._(value));

  @override
  bool operator ==(other) =>
      other is GetPlaceAdditionalFeature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Geocoded result.
///
/// @nodoc
class GeocodeResultItem {
  /// The <code>PlaceId</code> of the place result.
  final String placeId;

  /// A <code>PlaceType</code> is a category that the result place must belong to.
  final PlaceType placeType;

  /// The localized display name of this result item based on request parameter
  /// <code>language</code>.
  final String title;

  /// Position of the access point in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\].
  final List<AccessPoint>? accessPoints;

  /// The place's address.
  final Address? address;

  /// Boolean indicating if the address provided has been corrected.
  final bool? addressNumberCorrected;

  /// Categories of results that results must belong to.
  final List<Category>? categories;

  /// The distance in meters from the QueryPosition.
  final int? distance;

  /// List of food types offered by this result.
  final List<FoodType>? foodTypes;

  /// All Intersections that are near the provided address.
  final List<Intersection>? intersections;

  /// The main address corresponding to a place of type Secondary Address.
  final RelatedPlace? mainAddress;

  /// The bounding box enclosing the geometric shape (area or line) that an
  /// individual result covers.
  ///
  /// The bounding box formed is defined as a set 4 coordinates: <code>\[{westward
  /// lng}, {southern lat}, {eastward lng}, {northern lat}\]</code>
  final List<double>? mapView;

  /// Indicates how well the entire input matches the returned. It is equal to 1
  /// if all input tokens are recognized and matched.
  final MatchScoreDetails? matchScores;

  /// Free-form text query.
  final GeocodeParsedQuery? parsedQuery;

  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country.
  final String? politicalView;

  /// The position in World Geodetic System (WGS 84) format: \[longitude,
  /// latitude\].
  final List<double>? position;

  /// Contains details about the postal code of the place/result.
  final List<PostalCodeDetails>? postalCodeDetails;

  /// All secondary addresses that are associated with a main address. A secondary
  /// address is one that includes secondary designators, such as a Suite or Unit
  /// Number, Building, or Floor information.
  /// <note>
  /// Coverage for this functionality is available in the following countries:
  /// AUS, CAN, NZL, USA, PRI.
  /// </note>
  final List<RelatedPlace>? secondaryAddresses;

  /// The time zone in which the place is located.
  final TimeZone? timeZone;

  GeocodeResultItem({
    required this.placeId,
    required this.placeType,
    required this.title,
    this.accessPoints,
    this.address,
    this.addressNumberCorrected,
    this.categories,
    this.distance,
    this.foodTypes,
    this.intersections,
    this.mainAddress,
    this.mapView,
    this.matchScores,
    this.parsedQuery,
    this.politicalView,
    this.position,
    this.postalCodeDetails,
    this.secondaryAddresses,
    this.timeZone,
  });

  factory GeocodeResultItem.fromJson(Map<String, dynamic> json) {
    return GeocodeResultItem(
      placeId: (json['PlaceId'] as String?) ?? '',
      placeType: PlaceType.fromString((json['PlaceType'] as String?) ?? ''),
      title: (json['Title'] as String?) ?? '',
      accessPoints: (json['AccessPoints'] as List?)
          ?.nonNulls
          .map((e) => AccessPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      addressNumberCorrected: json['AddressNumberCorrected'] as bool?,
      categories: (json['Categories'] as List?)
          ?.nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      distance: json['Distance'] as int?,
      foodTypes: (json['FoodTypes'] as List?)
          ?.nonNulls
          .map((e) => FoodType.fromJson(e as Map<String, dynamic>))
          .toList(),
      intersections: (json['Intersections'] as List?)
          ?.nonNulls
          .map((e) => Intersection.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainAddress: json['MainAddress'] != null
          ? RelatedPlace.fromJson(json['MainAddress'] as Map<String, dynamic>)
          : null,
      mapView:
          (json['MapView'] as List?)?.nonNulls.map((e) => e as double).toList(),
      matchScores: json['MatchScores'] != null
          ? MatchScoreDetails.fromJson(
              json['MatchScores'] as Map<String, dynamic>)
          : null,
      parsedQuery: json['ParsedQuery'] != null
          ? GeocodeParsedQuery.fromJson(
              json['ParsedQuery'] as Map<String, dynamic>)
          : null,
      politicalView: json['PoliticalView'] as String?,
      position: (json['Position'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      postalCodeDetails: (json['PostalCodeDetails'] as List?)
          ?.nonNulls
          .map((e) => PostalCodeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondaryAddresses: (json['SecondaryAddresses'] as List?)
          ?.nonNulls
          .map((e) => RelatedPlace.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeZone: json['TimeZone'] != null
          ? TimeZone.fromJson(json['TimeZone'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final placeId = this.placeId;
    final placeType = this.placeType;
    final title = this.title;
    final accessPoints = this.accessPoints;
    final address = this.address;
    final addressNumberCorrected = this.addressNumberCorrected;
    final categories = this.categories;
    final distance = this.distance;
    final foodTypes = this.foodTypes;
    final intersections = this.intersections;
    final mainAddress = this.mainAddress;
    final mapView = this.mapView;
    final matchScores = this.matchScores;
    final parsedQuery = this.parsedQuery;
    final politicalView = this.politicalView;
    final position = this.position;
    final postalCodeDetails = this.postalCodeDetails;
    final secondaryAddresses = this.secondaryAddresses;
    final timeZone = this.timeZone;
    return {
      'PlaceId': placeId,
      'PlaceType': placeType.value,
      'Title': title,
      if (accessPoints != null) 'AccessPoints': accessPoints,
      if (address != null) 'Address': address,
      if (addressNumberCorrected != null)
        'AddressNumberCorrected': addressNumberCorrected,
      if (categories != null) 'Categories': categories,
      if (distance != null) 'Distance': distance,
      if (foodTypes != null) 'FoodTypes': foodTypes,
      if (intersections != null) 'Intersections': intersections,
      if (mainAddress != null) 'MainAddress': mainAddress,
      if (mapView != null) 'MapView': mapView,
      if (matchScores != null) 'MatchScores': matchScores,
      if (parsedQuery != null) 'ParsedQuery': parsedQuery,
      if (politicalView != null) 'PoliticalView': politicalView,
      if (position != null) 'Position': position,
      if (postalCodeDetails != null) 'PostalCodeDetails': postalCodeDetails,
      if (secondaryAddresses != null) 'SecondaryAddresses': secondaryAddresses,
      if (timeZone != null) 'TimeZone': timeZone,
    };
  }
}

/// Details related to the match score.
///
/// @nodoc
class MatchScoreDetails {
  /// Indicates how well the component input matches the returned. It is equal to
  /// 1 if all input tokens are recognized and matched.
  final ComponentMatchScores? components;

  /// Indicates how well the entire input matches the returned. It is equal to 1
  /// if all input tokens are recognized and matched.
  final double? overall;

  MatchScoreDetails({
    this.components,
    this.overall,
  });

  factory MatchScoreDetails.fromJson(Map<String, dynamic> json) {
    return MatchScoreDetails(
      components: json['Components'] != null
          ? ComponentMatchScores.fromJson(
              json['Components'] as Map<String, dynamic>)
          : null,
      overall: json['Overall'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final components = this.components;
    final overall = this.overall;
    return {
      if (components != null) 'Components': components,
      if (overall != null) 'Overall': overall,
    };
  }
}

/// Parsed components in the provided QueryText.
///
/// @nodoc
class GeocodeParsedQuery {
  /// The place address.
  final GeocodeParsedQueryAddressComponents? address;

  /// The localized display name of this result item based on request parameter
  /// <code>language</code>.
  final List<ParsedQueryComponent>? title;

  GeocodeParsedQuery({
    this.address,
    this.title,
  });

  factory GeocodeParsedQuery.fromJson(Map<String, dynamic> json) {
    return GeocodeParsedQuery(
      address: json['Address'] != null
          ? GeocodeParsedQueryAddressComponents.fromJson(
              json['Address'] as Map<String, dynamic>)
          : null,
      title: (json['Title'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final title = this.title;
    return {
      if (address != null) 'Address': address,
      if (title != null) 'Title': title,
    };
  }
}

/// Parsed address components in the provided QueryText.
///
/// @nodoc
class GeocodeParsedQueryAddressComponents {
  /// The number that identifies an address within a street.
  final List<ParsedQueryComponent>? addressNumber;

  /// Name of the block.
  ///
  /// Example: <code>Sunny Mansion 203 block: 2 Chome</code>
  final List<ParsedQueryComponent>? block;

  /// The name of the building at the address.
  final List<ParsedQueryComponent>? building;

  /// The alpha-2 or alpha-3 character code for the country that the results will
  /// be present in.
  final List<ParsedQueryComponent>? country;

  /// The district or division of a city the results should be present in.
  final List<ParsedQueryComponent>? district;

  /// The city or locality of the address.
  ///
  /// Example: <code>Vancouver</code>.
  final List<ParsedQueryComponent>? locality;

  /// An alphanumeric string included in a postal address to facilitate mail
  /// sorting, such as post code, postcode, or ZIP code, for which the result
  /// should possess.
  final List<ParsedQueryComponent>? postalCode;

  /// The region or state results should be present in.
  ///
  /// Example: <code>North Rhine-Westphalia</code>.
  final List<ParsedQueryComponent>? region;

  /// Parsed secondary address components from the provided query text.
  /// <note>
  /// Coverage for <code>ParsedQuery.Address.SecondaryAddressComponents</code> is
  /// available in the following countries:
  ///
  /// AUS, AUT, BRA, CAN, ESP, FRA, GBR, HKG, IDN, IND, NZL, TUR, TWN, USA
  /// </note>
  final List<ParsedQuerySecondaryAddressComponent>? secondaryAddressComponents;

  /// The name of the street results should be present in.
  final List<ParsedQueryComponent>? street;

  /// Name of sub-block.
  ///
  /// Example: <code>Sunny Mansion 203 sub-block: 4</code>
  final List<ParsedQueryComponent>? subBlock;

  /// A subdivision of a district.
  ///
  /// Example: <code>Minden-Lübbecke</code>.
  final List<ParsedQueryComponent>? subDistrict;

  /// The sub-region or county for which results should be present in.
  final List<ParsedQueryComponent>? subRegion;

  GeocodeParsedQueryAddressComponents({
    this.addressNumber,
    this.block,
    this.building,
    this.country,
    this.district,
    this.locality,
    this.postalCode,
    this.region,
    this.secondaryAddressComponents,
    this.street,
    this.subBlock,
    this.subDistrict,
    this.subRegion,
  });

  factory GeocodeParsedQueryAddressComponents.fromJson(
      Map<String, dynamic> json) {
    return GeocodeParsedQueryAddressComponents(
      addressNumber: (json['AddressNumber'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      block: (json['Block'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      building: (json['Building'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      country: (json['Country'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      district: (json['District'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      locality: (json['Locality'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      postalCode: (json['PostalCode'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: (json['Region'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondaryAddressComponents: (json['SecondaryAddressComponents'] as List?)
          ?.nonNulls
          .map((e) => ParsedQuerySecondaryAddressComponent.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      street: (json['Street'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      subBlock: (json['SubBlock'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      subDistrict: (json['SubDistrict'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      subRegion: (json['SubRegion'] as List?)
          ?.nonNulls
          .map((e) => ParsedQueryComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final addressNumber = this.addressNumber;
    final block = this.block;
    final building = this.building;
    final country = this.country;
    final district = this.district;
    final locality = this.locality;
    final postalCode = this.postalCode;
    final region = this.region;
    final secondaryAddressComponents = this.secondaryAddressComponents;
    final street = this.street;
    final subBlock = this.subBlock;
    final subDistrict = this.subDistrict;
    final subRegion = this.subRegion;
    return {
      if (addressNumber != null) 'AddressNumber': addressNumber,
      if (block != null) 'Block': block,
      if (building != null) 'Building': building,
      if (country != null) 'Country': country,
      if (district != null) 'District': district,
      if (locality != null) 'Locality': locality,
      if (postalCode != null) 'PostalCode': postalCode,
      if (region != null) 'Region': region,
      if (secondaryAddressComponents != null)
        'SecondaryAddressComponents': secondaryAddressComponents,
      if (street != null) 'Street': street,
      if (subBlock != null) 'SubBlock': subBlock,
      if (subDistrict != null) 'SubDistrict': subDistrict,
      if (subRegion != null) 'SubRegion': subRegion,
    };
  }
}

/// Information about a secondary address component parsed from the query text.
///
/// @nodoc
class ParsedQuerySecondaryAddressComponent {
  /// Secondary address designator provided in the query.
  final String designator;

  /// End index of the parsed secondary address component in the query text.
  final int endIndex;

  /// Secondary address number provided in the query.
  final String number;

  /// Start index of the parsed secondary address component in the query text.
  final int startIndex;

  /// Value of the parsed secondary address component.
  final String value;

  ParsedQuerySecondaryAddressComponent({
    required this.designator,
    required this.endIndex,
    required this.number,
    required this.startIndex,
    required this.value,
  });

  factory ParsedQuerySecondaryAddressComponent.fromJson(
      Map<String, dynamic> json) {
    return ParsedQuerySecondaryAddressComponent(
      designator: (json['Designator'] as String?) ?? '',
      endIndex: (json['EndIndex'] as int?) ?? 0,
      number: (json['Number'] as String?) ?? '',
      startIndex: (json['StartIndex'] as int?) ?? 0,
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final designator = this.designator;
    final endIndex = this.endIndex;
    final number = this.number;
    final startIndex = this.startIndex;
    final value = this.value;
    return {
      'Designator': designator,
      'EndIndex': endIndex,
      'Number': number,
      'StartIndex': startIndex,
      'Value': value,
    };
  }
}

/// Parsed components in the provided QueryText.
///
/// @nodoc
class ParsedQueryComponent {
  /// End index of the parsed query component.
  final int? endIndex;

  /// The address component that the parsed query component corresponds to.
  final String? queryComponent;

  /// Start index of the parsed query component.
  final int? startIndex;

  /// Value of the parsed query component.
  final String? value;

  ParsedQueryComponent({
    this.endIndex,
    this.queryComponent,
    this.startIndex,
    this.value,
  });

  factory ParsedQueryComponent.fromJson(Map<String, dynamic> json) {
    return ParsedQueryComponent(
      endIndex: json['EndIndex'] as int?,
      queryComponent: json['QueryComponent'] as String?,
      startIndex: json['StartIndex'] as int?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endIndex = this.endIndex;
    final queryComponent = this.queryComponent;
    final startIndex = this.startIndex;
    final value = this.value;
    return {
      if (endIndex != null) 'EndIndex': endIndex,
      if (queryComponent != null) 'QueryComponent': queryComponent,
      if (startIndex != null) 'StartIndex': startIndex,
      if (value != null) 'Value': value,
    };
  }
}

/// Indicates how well the returned title and address components matches the
/// input TextQuery. For each component a score is provied with 1 indicating all
/// tokens were matched and 0 indicating no tokens were matched.
///
/// @nodoc
class ComponentMatchScores {
  /// The place's address.
  final AddressComponentMatchScores? address;

  /// Indicates the match score of the title in the text query that match the
  /// found title.
  final double? title;

  ComponentMatchScores({
    this.address,
    this.title,
  });

  factory ComponentMatchScores.fromJson(Map<String, dynamic> json) {
    return ComponentMatchScores(
      address: json['Address'] != null
          ? AddressComponentMatchScores.fromJson(
              json['Address'] as Map<String, dynamic>)
          : null,
      title: json['Title'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final title = this.title;
    return {
      if (address != null) 'Address': address,
      if (title != null) 'Title': title,
    };
  }
}

/// Indicates how well the entire input matches the returned. It is equal to 1
/// if all input tokens are recognized and matched.
///
/// @nodoc
class AddressComponentMatchScores {
  /// The house number or address results should have.
  final double? addressNumber;

  /// Name of the block.
  ///
  /// Example: <code>Sunny Mansion 203 block: 2 Chome</code>
  final double? block;

  /// The name of the building at the address.
  final double? building;

  /// The alpha-2 or alpha-3 character code for the country that the results will
  /// be present in.
  final double? country;

  /// The district or division of a city the results should be present in.
  final double? district;

  /// Name of the streets in the intersection.
  ///
  /// Example: <code>\["Friedrichstraße","Unter den Linden"\]</code>
  final List<double>? intersection;

  /// The city or locality results should be present in.
  ///
  /// Example: <code>Vancouver</code>.
  final double? locality;

  /// An alphanumeric string included in a postal address to facilitate mail
  /// sorting, such as post code, postcode, or ZIP code, for which the result
  /// should possess.
  final double? postalCode;

  /// The region or state results should be to be present in.
  ///
  /// Example: <code>North Rhine-Westphalia</code>.
  final double? region;

  /// Match scores for the secondary address components in the result.
  /// <note>
  /// Coverage for this functionality is available in the following countries:
  /// AUS, AUT, BRA, CAN, ESP, FRA, GBR, IDN, IND, NZL, TUR, TWN, USA.
  /// </note>
  final List<SecondaryAddressComponentMatchScore>? secondaryAddressComponents;

  /// Name of sub-block.
  ///
  /// Example: <code>Sunny Mansion 203 sub-block: 4</code>
  final double? subBlock;

  /// A subdivision of a district.
  ///
  /// Example: <code>Minden-Lübbecke</code>
  final double? subDistrict;

  /// The sub-region or county for which results should be present in.
  final double? subRegion;

  AddressComponentMatchScores({
    this.addressNumber,
    this.block,
    this.building,
    this.country,
    this.district,
    this.intersection,
    this.locality,
    this.postalCode,
    this.region,
    this.secondaryAddressComponents,
    this.subBlock,
    this.subDistrict,
    this.subRegion,
  });

  factory AddressComponentMatchScores.fromJson(Map<String, dynamic> json) {
    return AddressComponentMatchScores(
      addressNumber: json['AddressNumber'] as double?,
      block: json['Block'] as double?,
      building: json['Building'] as double?,
      country: json['Country'] as double?,
      district: json['District'] as double?,
      intersection: (json['Intersection'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      locality: json['Locality'] as double?,
      postalCode: json['PostalCode'] as double?,
      region: json['Region'] as double?,
      secondaryAddressComponents: (json['SecondaryAddressComponents'] as List?)
          ?.nonNulls
          .map((e) => SecondaryAddressComponentMatchScore.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      subBlock: json['SubBlock'] as double?,
      subDistrict: json['SubDistrict'] as double?,
      subRegion: json['SubRegion'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final addressNumber = this.addressNumber;
    final block = this.block;
    final building = this.building;
    final country = this.country;
    final district = this.district;
    final intersection = this.intersection;
    final locality = this.locality;
    final postalCode = this.postalCode;
    final region = this.region;
    final secondaryAddressComponents = this.secondaryAddressComponents;
    final subBlock = this.subBlock;
    final subDistrict = this.subDistrict;
    final subRegion = this.subRegion;
    return {
      if (addressNumber != null) 'AddressNumber': addressNumber,
      if (block != null) 'Block': block,
      if (building != null) 'Building': building,
      if (country != null) 'Country': country,
      if (district != null) 'District': district,
      if (intersection != null) 'Intersection': intersection,
      if (locality != null) 'Locality': locality,
      if (postalCode != null) 'PostalCode': postalCode,
      if (region != null) 'Region': region,
      if (secondaryAddressComponents != null)
        'SecondaryAddressComponents': secondaryAddressComponents,
      if (subBlock != null) 'SubBlock': subBlock,
      if (subDistrict != null) 'SubDistrict': subDistrict,
      if (subRegion != null) 'SubRegion': subRegion,
    };
  }
}

/// Match score for a secondary address component in the result.
///
/// @nodoc
class SecondaryAddressComponentMatchScore {
  /// Match score for the secondary address number.
  final double? number;

  SecondaryAddressComponentMatchScore({
    this.number,
  });

  factory SecondaryAddressComponentMatchScore.fromJson(
      Map<String, dynamic> json) {
    return SecondaryAddressComponentMatchScore(
      number: json['Number'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final number = this.number;
    return {
      if (number != null) 'Number': number,
    };
  }
}

/// A structured free text query allows you to search for places by the name or
/// text representation of specific properties of the place.
///
/// @nodoc
class GeocodeQueryComponents {
  /// The house number or address results should have.
  final String? addressNumber;

  /// The alpha-2 or alpha-3 character code for the country that the results will
  /// be present in.
  final String? country;

  /// The district or division of a city the results should be present in.
  final String? district;

  /// The city or locality results should be present in.
  ///
  /// Example: <code>Vancouver</code>.
  final String? locality;

  /// An alphanumeric string included in a postal address to facilitate mail
  /// sorting, such as post code, postcode, or ZIP code for which the result
  /// should possess.
  final String? postalCode;

  /// The region or state results should be to be present in.
  ///
  /// Example: <code>North Rhine-Westphalia</code>.
  final String? region;

  /// The name of the street results should be present in.
  final String? street;

  /// The sub-region or county for which results should be present in.
  final String? subRegion;

  GeocodeQueryComponents({
    this.addressNumber,
    this.country,
    this.district,
    this.locality,
    this.postalCode,
    this.region,
    this.street,
    this.subRegion,
  });

  Map<String, dynamic> toJson() {
    final addressNumber = this.addressNumber;
    final country = this.country;
    final district = this.district;
    final locality = this.locality;
    final postalCode = this.postalCode;
    final region = this.region;
    final street = this.street;
    final subRegion = this.subRegion;
    return {
      if (addressNumber != null) 'AddressNumber': addressNumber,
      if (country != null) 'Country': country,
      if (district != null) 'District': district,
      if (locality != null) 'Locality': locality,
      if (postalCode != null) 'PostalCode': postalCode,
      if (region != null) 'Region': region,
      if (street != null) 'Street': street,
      if (subRegion != null) 'SubRegion': subRegion,
    };
  }
}

/// Geocode structure which contains a set of inclusion/exclusion properties
/// that results must possess in order to be returned as a result.
///
/// @nodoc
class GeocodeFilter {
  /// A list of countries that all results must be in. Countries are represented
  /// by either their alpha-2 or alpha-3 character codes.
  final List<String>? includeCountries;

  /// The included place types.
  final List<GeocodeFilterPlaceType>? includePlaceTypes;

  GeocodeFilter({
    this.includeCountries,
    this.includePlaceTypes,
  });

  Map<String, dynamic> toJson() {
    final includeCountries = this.includeCountries;
    final includePlaceTypes = this.includePlaceTypes;
    return {
      if (includeCountries != null) 'IncludeCountries': includeCountries,
      if (includePlaceTypes != null)
        'IncludePlaceTypes': includePlaceTypes.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class GeocodeIntendedUse {
  static const singleUse = GeocodeIntendedUse._('SingleUse');
  static const storage = GeocodeIntendedUse._('Storage');

  final String value;

  const GeocodeIntendedUse._(this.value);

  static const values = [singleUse, storage];

  static GeocodeIntendedUse fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GeocodeIntendedUse._(value));

  @override
  bool operator ==(other) =>
      other is GeocodeIntendedUse && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GeocodeAdditionalFeature {
  static const timeZone = GeocodeAdditionalFeature._('TimeZone');
  static const access = GeocodeAdditionalFeature._('Access');
  static const secondaryAddresses =
      GeocodeAdditionalFeature._('SecondaryAddresses');
  static const intersections = GeocodeAdditionalFeature._('Intersections');

  final String value;

  const GeocodeAdditionalFeature._(this.value);

  static const values = [timeZone, access, secondaryAddresses, intersections];

  static GeocodeAdditionalFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GeocodeAdditionalFeature._(value));

  @override
  bool operator ==(other) =>
      other is GeocodeAdditionalFeature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GeocodeFilterPlaceType {
  static const locality = GeocodeFilterPlaceType._('Locality');
  static const postalCode = GeocodeFilterPlaceType._('PostalCode');
  static const intersection = GeocodeFilterPlaceType._('Intersection');
  static const street = GeocodeFilterPlaceType._('Street');
  static const pointAddress = GeocodeFilterPlaceType._('PointAddress');
  static const interpolatedAddress =
      GeocodeFilterPlaceType._('InterpolatedAddress');

  final String value;

  const GeocodeFilterPlaceType._(this.value);

  static const values = [
    locality,
    postalCode,
    intersection,
    street,
    pointAddress,
    interpolatedAddress
  ];

  static GeocodeFilterPlaceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GeocodeFilterPlaceType._(value));

  @override
  bool operator ==(other) =>
      other is GeocodeFilterPlaceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A result matching the input query text.
///
/// @nodoc
class AutocompleteResultItem {
  /// The PlaceId of the place associated with this result. This can be used to
  /// look up additional details about the result via GetPlace.
  final String placeId;

  /// PlaceType describes the type of result entry returned.
  final PlaceType placeType;

  /// A formatted string for display when presenting this result to an end user.
  final String title;

  /// The address associated with this result.
  final Address? address;

  /// The distance in meters between the center of the search area and this
  /// result. Useful to evaluate how far away from the original bias position the
  /// result is.
  final int? distance;

  /// Indicates the starting and ending index of the place in the text query that
  /// match the found title.
  final AutocompleteHighlights? highlights;

  /// A list of <a href="https://en.wikipedia.org/wiki/IETF_language_tag">BCP
  /// 47</a> compliant language codes for the results to be rendered in. If there
  /// is no data for the result in the requested language, data will be returned
  /// in the default language for the entry.
  final String? language;

  /// The alpha-2 or alpha-3 character code for the political view of a country.
  /// The political view applies to the results of the request to represent
  /// unresolved territorial claims through the point of view of the specified
  /// country.
  final String? politicalView;

  AutocompleteResultItem({
    required this.placeId,
    required this.placeType,
    required this.title,
    this.address,
    this.distance,
    this.highlights,
    this.language,
    this.politicalView,
  });

  factory AutocompleteResultItem.fromJson(Map<String, dynamic> json) {
    return AutocompleteResultItem(
      placeId: (json['PlaceId'] as String?) ?? '',
      placeType: PlaceType.fromString((json['PlaceType'] as String?) ?? ''),
      title: (json['Title'] as String?) ?? '',
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      distance: json['Distance'] as int?,
      highlights: json['Highlights'] != null
          ? AutocompleteHighlights.fromJson(
              json['Highlights'] as Map<String, dynamic>)
          : null,
      language: json['Language'] as String?,
      politicalView: json['PoliticalView'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final placeId = this.placeId;
    final placeType = this.placeType;
    final title = this.title;
    final address = this.address;
    final distance = this.distance;
    final highlights = this.highlights;
    final language = this.language;
    final politicalView = this.politicalView;
    return {
      'PlaceId': placeId,
      'PlaceType': placeType.value,
      'Title': title,
      if (address != null) 'Address': address,
      if (distance != null) 'Distance': distance,
      if (highlights != null) 'Highlights': highlights,
      if (language != null) 'Language': language,
      if (politicalView != null) 'PoliticalView': politicalView,
    };
  }
}

/// Describes how the parts of the response element matched the input query by
/// returning the sections of the response which matched to input query terms.
///
/// @nodoc
class AutocompleteHighlights {
  /// Describes how part of the result address match the input query.
  final AutocompleteAddressHighlights? address;

  /// Indicates where the title field in the result matches the input query.
  final List<Highlight>? title;

  AutocompleteHighlights({
    this.address,
    this.title,
  });

  factory AutocompleteHighlights.fromJson(Map<String, dynamic> json) {
    return AutocompleteHighlights(
      address: json['Address'] != null
          ? AutocompleteAddressHighlights.fromJson(
              json['Address'] as Map<String, dynamic>)
          : null,
      title: (json['Title'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final title = this.title;
    return {
      if (address != null) 'Address': address,
      if (title != null) 'Title': title,
    };
  }
}

/// Describes how the parts of the response element matched the input query by
/// returning the sections of the response which matched to input query terms.
///
/// @nodoc
class AutocompleteAddressHighlights {
  /// The house number or address results should have.
  final List<Highlight>? addressNumber;

  /// Name of the block.
  ///
  /// Example: <code>Sunny Mansion 203 block: 2 Chome</code>
  final List<Highlight>? block;

  /// The name of the building at the address.
  final List<Highlight>? building;

  /// The alpha-2 or alpha-3 character code for the country that the results will
  /// be present in.
  final CountryHighlights? country;

  /// The district or division of a city the results should be present in.
  final List<Highlight>? district;

  /// Name of the streets in the intersection. For example: e.g.
  /// \["Friedrichstraße","Unter den Linden"\]
  final List<List<Highlight>>? intersection;

  /// Indicates the starting and ending indexes for result items where they are
  /// identified to match the input query. This should be used to provide emphasis
  /// to output display to make selecting the correct result from a list easier
  /// for end users.
  final List<Highlight>? label;

  /// The city or locality results should be present in.
  ///
  /// Example: <code>Vancouver</code>.
  final List<Highlight>? locality;

  /// An alphanumeric string included in a postal address to facilitate mail
  /// sorting, such as post code, postcode, or ZIP code for which the result
  /// should possess.
  final List<Highlight>? postalCode;

  /// The region or state results should be to be present in.
  ///
  /// Example: <code>North Rhine-Westphalia</code>.
  final RegionHighlights? region;

  /// The name of the street results should be present in.
  final List<Highlight>? street;

  /// Name of sub-block.
  ///
  /// Example: <code>Sunny Mansion 203 sub-block: 4</code>
  final List<Highlight>? subBlock;

  /// Indicates the starting and ending index of the title in the text query that
  /// match the found title.
  final List<Highlight>? subDistrict;

  /// The sub-region or county for which results should be present in.
  final SubRegionHighlights? subRegion;

  AutocompleteAddressHighlights({
    this.addressNumber,
    this.block,
    this.building,
    this.country,
    this.district,
    this.intersection,
    this.label,
    this.locality,
    this.postalCode,
    this.region,
    this.street,
    this.subBlock,
    this.subDistrict,
    this.subRegion,
  });

  factory AutocompleteAddressHighlights.fromJson(Map<String, dynamic> json) {
    return AutocompleteAddressHighlights(
      addressNumber: (json['AddressNumber'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      block: (json['Block'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      building: (json['Building'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      country: json['Country'] != null
          ? CountryHighlights.fromJson(json['Country'] as Map<String, dynamic>)
          : null,
      district: (json['District'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      intersection: (json['Intersection'] as List?)
          ?.nonNulls
          .map((e) => (e as List)
              .nonNulls
              .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      label: (json['Label'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      locality: (json['Locality'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      postalCode: (json['PostalCode'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: json['Region'] != null
          ? RegionHighlights.fromJson(json['Region'] as Map<String, dynamic>)
          : null,
      street: (json['Street'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      subBlock: (json['SubBlock'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      subDistrict: (json['SubDistrict'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      subRegion: json['SubRegion'] != null
          ? SubRegionHighlights.fromJson(
              json['SubRegion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addressNumber = this.addressNumber;
    final block = this.block;
    final building = this.building;
    final country = this.country;
    final district = this.district;
    final intersection = this.intersection;
    final label = this.label;
    final locality = this.locality;
    final postalCode = this.postalCode;
    final region = this.region;
    final street = this.street;
    final subBlock = this.subBlock;
    final subDistrict = this.subDistrict;
    final subRegion = this.subRegion;
    return {
      if (addressNumber != null) 'AddressNumber': addressNumber,
      if (block != null) 'Block': block,
      if (building != null) 'Building': building,
      if (country != null) 'Country': country,
      if (district != null) 'District': district,
      if (intersection != null) 'Intersection': intersection,
      if (label != null) 'Label': label,
      if (locality != null) 'Locality': locality,
      if (postalCode != null) 'PostalCode': postalCode,
      if (region != null) 'Region': region,
      if (street != null) 'Street': street,
      if (subBlock != null) 'SubBlock': subBlock,
      if (subDistrict != null) 'SubDistrict': subDistrict,
      if (subRegion != null) 'SubRegion': subRegion,
    };
  }
}

/// Indicates the starting and ending index of the country in the text query
/// that match the found title.
///
/// @nodoc
class CountryHighlights {
  /// Indicates the starting and ending index of the country code in the text
  /// query that match the found title.
  final List<Highlight>? code;

  /// Indicates the starting and ending index of the country code in the text
  /// query that match the found title.
  final List<Highlight>? name;

  CountryHighlights({
    this.code,
    this.name,
  });

  factory CountryHighlights.fromJson(Map<String, dynamic> json) {
    return CountryHighlights(
      code: (json['Code'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: (json['Name'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final name = this.name;
    return {
      if (code != null) 'Code': code,
      if (name != null) 'Name': name,
    };
  }
}

/// Indicates the starting and ending index of the region in the text query that
/// match the found title.
///
/// @nodoc
class RegionHighlights {
  /// Indicates the starting and ending index of the region in the text query that
  /// match the found title.
  final List<Highlight>? code;

  /// Indicates the starting and ending index of the region name in the text query
  /// that match the found title.
  final List<Highlight>? name;

  RegionHighlights({
    this.code,
    this.name,
  });

  factory RegionHighlights.fromJson(Map<String, dynamic> json) {
    return RegionHighlights(
      code: (json['Code'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: (json['Name'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final name = this.name;
    return {
      if (code != null) 'Code': code,
      if (name != null) 'Name': name,
    };
  }
}

/// Indicates the starting and ending index of the sub-region in the text query
/// that match the found title.
///
/// @nodoc
class SubRegionHighlights {
  /// Indicates the starting and ending index of the sub-region in the text query
  /// that match the found title.
  final List<Highlight>? code;

  /// Indicates the starting and ending index of the name in the text query that
  /// match the found title.
  final List<Highlight>? name;

  SubRegionHighlights({
    this.code,
    this.name,
  });

  factory SubRegionHighlights.fromJson(Map<String, dynamic> json) {
    return SubRegionHighlights(
      code: (json['Code'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: (json['Name'] as List?)
          ?.nonNulls
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final name = this.name;
    return {
      if (code != null) 'Code': code,
      if (name != null) 'Name': name,
    };
  }
}

/// Autocomplete structure which contains a set of inclusion/exclusion
/// properties that results must possess in order to be returned as a result.
///
/// @nodoc
class AutocompleteFilter {
  /// The bounding box enclosing the geometric shape (area or line) that an
  /// individual result covers.
  ///
  /// The bounding box formed is defined as a set 4 coordinates: <code>\[{westward
  /// lng}, {southern lat}, {eastward lng}, {northern lat}\]</code>
  final List<double>? boundingBox;
  final FilterCircle? circle;

  /// A list of countries that all results must be in. Countries are represented
  /// by either their alpha-2 or alpha-3 character codes.
  final List<String>? includeCountries;

  /// The included place types.
  final List<AutocompleteFilterPlaceType>? includePlaceTypes;

  AutocompleteFilter({
    this.boundingBox,
    this.circle,
    this.includeCountries,
    this.includePlaceTypes,
  });

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final circle = this.circle;
    final includeCountries = this.includeCountries;
    final includePlaceTypes = this.includePlaceTypes;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (circle != null) 'Circle': circle,
      if (includeCountries != null) 'IncludeCountries': includeCountries,
      if (includePlaceTypes != null)
        'IncludePlaceTypes': includePlaceTypes.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class PostalCodeMode {
  static const mergeAllSpannedLocalities =
      PostalCodeMode._('MergeAllSpannedLocalities');
  static const enumerateSpannedLocalities =
      PostalCodeMode._('EnumerateSpannedLocalities');

  final String value;

  const PostalCodeMode._(this.value);

  static const values = [mergeAllSpannedLocalities, enumerateSpannedLocalities];

  static PostalCodeMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PostalCodeMode._(value));

  @override
  bool operator ==(other) => other is PostalCodeMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AutocompleteIntendedUse {
  static const singleUse = AutocompleteIntendedUse._('SingleUse');

  final String value;

  const AutocompleteIntendedUse._(this.value);

  static const values = [singleUse];

  static AutocompleteIntendedUse fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutocompleteIntendedUse._(value));

  @override
  bool operator ==(other) =>
      other is AutocompleteIntendedUse && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AutocompleteAdditionalFeature {
  static const core = AutocompleteAdditionalFeature._('Core');

  final String value;

  const AutocompleteAdditionalFeature._(this.value);

  static const values = [core];

  static AutocompleteAdditionalFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutocompleteAdditionalFeature._(value));

  @override
  bool operator ==(other) =>
      other is AutocompleteAdditionalFeature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AutocompleteFilterPlaceType {
  static const locality = AutocompleteFilterPlaceType._('Locality');
  static const postalCode = AutocompleteFilterPlaceType._('PostalCode');

  final String value;

  const AutocompleteFilterPlaceType._(this.value);

  static const values = [locality, postalCode];

  static AutocompleteFilterPlaceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutocompleteFilterPlaceType._(value));

  @override
  bool operator ==(other) =>
      other is AutocompleteFilterPlaceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
