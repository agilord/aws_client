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

/// Integrate high-quality base map data into your applications using <a
/// href="https://maplibre.org">MapLibre</a>. Capabilities include:
///
/// <ul>
/// <li>
/// Access to comprehensive base map data, allowing you to tailor the map
/// display to your specific needs.
/// </li>
/// <li>
/// Multiple pre-designed map styles suited for various application types, such
/// as navigation, logistics, or data visualization.
/// </li>
/// <li>
/// Generation of static map images for scenarios where interactive maps aren't
/// suitable, such as:
///
/// <ul>
/// <li>
/// Embedding in emails or documents
/// </li>
/// <li>
/// Displaying in low-bandwidth environments
/// </li>
/// <li>
/// Creating printable maps
/// </li>
/// <li>
/// Enhancing application performance by reducing client-side rendering
/// </li>
/// </ul> </li>
/// </ul>
class GeoMaps {
  final _s.RestJsonProtocol _protocol;
  GeoMaps({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'geo-maps',
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

  /// <code>GetGlyphs</code> returns the map's glyphs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/styling-labels-with-glyphs.html">Style
  /// labels with glyphs</a> in the <i>Amazon Location Service Developer
  /// Guide</i>.
  ///
  /// Parameter [fontStack] :
  /// Name of the <code>FontStack</code> to retrieve.
  ///
  /// Example: <code>Amazon Ember Bold,Noto Sans Bold</code>.
  ///
  /// The supported font stacks are as follows:
  ///
  /// <ul>
  /// <li>
  /// Amazon Ember Bold
  /// </li>
  /// <li>
  /// Amazon Ember Bold Italic
  /// </li>
  /// <li>
  /// Amazon Ember Bold,Noto Sans Bold
  /// </li>
  /// <li>
  /// Amazon Ember Bold,Noto Sans Bold,Noto Sans Arabic Bold
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC BdItalic
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC Bold
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC Bold Italic
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC Bold,Noto Sans Bold
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC Bold,Noto Sans Bold,Noto Sans Arabic Condensed
  /// Bold
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC Light
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC Light Italic
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC LtItalic
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC Regular
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC Regular Italic
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC Regular,Noto Sans Regular
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC Regular,Noto Sans Regular,Noto Sans Arabic
  /// Condensed Regular
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC RgItalic
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC ThItalic
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC Thin
  /// </li>
  /// <li>
  /// Amazon Ember Condensed RC Thin Italic
  /// </li>
  /// <li>
  /// Amazon Ember Heavy
  /// </li>
  /// <li>
  /// Amazon Ember Heavy Italic
  /// </li>
  /// <li>
  /// Amazon Ember Light
  /// </li>
  /// <li>
  /// Amazon Ember Light Italic
  /// </li>
  /// <li>
  /// Amazon Ember Medium
  /// </li>
  /// <li>
  /// Amazon Ember Medium Italic
  /// </li>
  /// <li>
  /// Amazon Ember Medium,Noto Sans Medium
  /// </li>
  /// <li>
  /// Amazon Ember Medium,Noto Sans Medium,Noto Sans Arabic Medium
  /// </li>
  /// <li>
  /// Amazon Ember Regular
  /// </li>
  /// <li>
  /// Amazon Ember Regular Italic
  /// </li>
  /// <li>
  /// Amazon Ember Regular Italic,Noto Sans Italic
  /// </li>
  /// <li>
  /// Amazon Ember Regular Italic,Noto Sans Italic,Noto Sans Arabic Regular
  /// </li>
  /// <li>
  /// Amazon Ember Regular,Noto Sans Regular
  /// </li>
  /// <li>
  /// Amazon Ember Regular,Noto Sans Regular,Noto Sans Arabic Regular
  /// </li>
  /// <li>
  /// Amazon Ember Thin
  /// </li>
  /// <li>
  /// Amazon Ember Thin Italic
  /// </li>
  /// <li>
  /// AmazonEmberCdRC_Bd
  /// </li>
  /// <li>
  /// AmazonEmberCdRC_BdIt
  /// </li>
  /// <li>
  /// AmazonEmberCdRC_Lt
  /// </li>
  /// <li>
  /// AmazonEmberCdRC_LtIt
  /// </li>
  /// <li>
  /// AmazonEmberCdRC_Rg
  /// </li>
  /// <li>
  /// AmazonEmberCdRC_RgIt
  /// </li>
  /// <li>
  /// AmazonEmberCdRC_Th
  /// </li>
  /// <li>
  /// AmazonEmberCdRC_ThIt
  /// </li>
  /// <li>
  /// AmazonEmber_Bd
  /// </li>
  /// <li>
  /// AmazonEmber_BdIt
  /// </li>
  /// <li>
  /// AmazonEmber_He
  /// </li>
  /// <li>
  /// AmazonEmber_HeIt
  /// </li>
  /// <li>
  /// AmazonEmber_Lt
  /// </li>
  /// <li>
  /// AmazonEmber_LtIt
  /// </li>
  /// <li>
  /// AmazonEmber_Md
  /// </li>
  /// <li>
  /// AmazonEmber_MdIt
  /// </li>
  /// <li>
  /// AmazonEmber_Rg
  /// </li>
  /// <li>
  /// AmazonEmber_RgIt
  /// </li>
  /// <li>
  /// AmazonEmber_Th
  /// </li>
  /// <li>
  /// AmazonEmber_ThIt
  /// </li>
  /// <li>
  /// Noto Sans Black
  /// </li>
  /// <li>
  /// Noto Sans Black Italic
  /// </li>
  /// <li>
  /// Noto Sans Bold
  /// </li>
  /// <li>
  /// Noto Sans Bold Italic
  /// </li>
  /// <li>
  /// Noto Sans Extra Bold
  /// </li>
  /// <li>
  /// Noto Sans Extra Bold Italic
  /// </li>
  /// <li>
  /// Noto Sans Extra Light
  /// </li>
  /// <li>
  /// Noto Sans Extra Light Italic
  /// </li>
  /// <li>
  /// Noto Sans Italic
  /// </li>
  /// <li>
  /// Noto Sans Light
  /// </li>
  /// <li>
  /// Noto Sans Light Italic
  /// </li>
  /// <li>
  /// Noto Sans Medium
  /// </li>
  /// <li>
  /// Noto Sans Medium Italic
  /// </li>
  /// <li>
  /// Noto Sans Regular
  /// </li>
  /// <li>
  /// Noto Sans Semi Bold
  /// </li>
  /// <li>
  /// Noto Sans Semi Bold Italic
  /// </li>
  /// <li>
  /// Noto Sans Thin
  /// </li>
  /// <li>
  /// Noto Sans Thin Italic
  /// </li>
  /// <li>
  /// NotoSans-Bold
  /// </li>
  /// <li>
  /// NotoSans-Italic
  /// </li>
  /// <li>
  /// NotoSans-Medium
  /// </li>
  /// <li>
  /// NotoSans-Regular
  /// </li>
  /// <li>
  /// Open Sans Regular,Arial Unicode MS Regular
  /// </li>
  /// </ul>
  ///
  /// Parameter [fontUnicodeRange] :
  /// A Unicode range of characters to download glyphs for. This must be aligned
  /// to multiples of 256.
  ///
  /// Example: <code>0-255.pbf</code>
  Future<GetGlyphsResponse> getGlyphs({
    required String fontStack,
    required String fontUnicodeRange,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/glyphs/${Uri.encodeComponent(fontStack)}/${Uri.encodeComponent(fontUnicodeRange)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGlyphsResponse(
      blob: await response.stream.toBytes(),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag'),
    );
  }

  /// <code>GetSprites</code> returns the map's sprites.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/styling-iconography-with-sprites.html">Style
  /// iconography with sprites</a> in the <i>Amazon Location Service Developer
  /// Guide</i>.
  ///
  /// Parameter [colorScheme] :
  /// Sets the color tone for the map sprites, such as dark and light.
  ///
  /// Example: <code>Light</code>
  ///
  /// Default value: <code>Light</code>
  /// <note>
  /// Valid values for ColorScheme are case sensitive.
  /// </note>
  ///
  /// Parameter [fileName] :
  /// <code>Sprites</code> API: The name of the sprite ﬁle to retrieve,
  /// following pattern <code>sprites(@2x)?\.(png|json)</code>.
  ///
  /// Example: <code>sprites.png</code>
  ///
  /// Parameter [style] :
  /// Style specifies the desired map style for the <code>Sprites</code> APIs.
  ///
  /// Parameter [variant] :
  /// Optimizes map styles for specific use case or industry. You can choose
  /// allowed variant only with Standard map style.
  ///
  /// Example: <code>Default</code>
  /// <note>
  /// Valid values for Variant are case sensitive.
  /// </note>
  Future<GetSpritesResponse> getSprites({
    required ColorScheme colorScheme,
    required String fileName,
    required MapStyle style,
    required Variant variant,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/styles/${Uri.encodeComponent(style.value)}/${Uri.encodeComponent(colorScheme.value)}/${Uri.encodeComponent(variant.value)}/sprites/${Uri.encodeComponent(fileName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSpritesResponse(
      blob: await response.stream.toBytes(),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag'),
    );
  }

  /// <note>
  /// This operation is not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  /// </note>
  /// <code>GetStaticMap</code> provides high-quality static map images with
  /// customizable options. You can modify the map's appearance and overlay
  /// additional information. It's an ideal solution for applications requiring
  /// tailored static map snapshots.
  ///
  /// For more information, see the following topics in the <i>Amazon Location
  /// Service Developer Guide</i>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/static-maps.html">Static
  /// maps</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/customizing-static-maps.html">Customize
  /// static maps</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/overlaying-static-map.html">Overlay
  /// on the static map</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileName] :
  /// The map scaling parameter to size the image, icons, and labels. It follows
  /// the pattern of <code>^map(@2x)?$</code>.
  ///
  /// Example: <code>map, map@2x</code>
  ///
  /// Parameter [height] :
  /// Specifies the height of the map image.
  ///
  /// Parameter [width] :
  /// Specifies the width of the map image.
  ///
  /// Parameter [boundedPositions] :
  /// Takes in two or more pair of coordinates in World Geodetic System (WGS 84)
  /// format: \[longitude, latitude\], with each coordinate separated by a
  /// comma. The API will generate an image to encompass all of the provided
  /// coordinates.
  /// <note>
  /// Cannot be used with <code>Zoom</code> and or <code>Radius</code>
  /// </note>
  /// Example: 97.170451,78.039098,99.045536,27.176178
  ///
  /// Parameter [boundingBox] :
  /// Takes in two pairs of coordinates in World Geodetic System (WGS 84)
  /// format: \[longitude, latitude\], denoting south-westerly and
  /// north-easterly edges of the image. The underlying area becomes the view of
  /// the image.
  ///
  /// Example: -123.17075,49.26959,-123.08125,49.31429
  ///
  /// Parameter [center] :
  /// Takes in a pair of coordinates in World Geodetic System (WGS 84) format:
  /// \[longitude, latitude\], which becomes the center point of the image. This
  /// parameter requires that either zoom or radius is set.
  /// <note>
  /// Cannot be used with <code>Zoom</code> and or <code>Radius</code>
  /// </note>
  /// Example: 49.295,-123.108
  ///
  /// Parameter [colorScheme] :
  /// Sets the color tone for the map, such as dark and light.
  ///
  /// Example: <code>Light</code>
  ///
  /// Default value: <code>Light</code>
  /// <note>
  /// Valid values for <code>ColorScheme</code> are case sensitive.
  /// </note>
  ///
  /// Parameter [compactOverlay] :
  /// Takes in a string to draw geometries on the image. The input is a comma
  /// separated format as follows format: <code>\[Lon, Lat\]</code>
  ///
  /// Example:
  /// <code>line:-122.407653,37.798557,-122.413291,37.802443;color=%23DD0000;width=7;outline-color=#00DD00;outline-width=5yd|point:-122.40572,37.80004;label=Fog
  /// Hill Market;size=large;text-color=%23DD0000;color=#EE4B2B</code>
  /// <note>
  /// Currently it supports the following geometry types: point, line and
  /// polygon. It does not support multiPoint , multiLine and multiPolgyon.
  /// </note>
  ///
  /// Parameter [cropLabels] :
  /// It is a flag that takes in true or false. It prevents the labels that are
  /// on the edge of the image from being cut or obscured.
  ///
  /// Parameter [geoJsonOverlay] :
  /// Takes in a string to draw geometries on the image. The input is a valid
  /// GeoJSON collection object.
  ///
  /// Example: <code>{"type":"FeatureCollection","features":
  /// \[{"type":"Feature","geometry":{"type":"MultiPoint","coordinates":
  /// \[\[-90.076345,51.504107\],\[-0.074451,51.506892\]\]},"properties":
  /// {"color":"#00DD00"}}\]}</code>
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [labelSize] :
  /// Overrides the label size auto-calculated by <code>FileName</code>. Takes
  /// in one of the values - <code>Small</code> or <code>Large</code>.
  ///
  /// Parameter [language] :
  /// Specifies the language on the map labels using the BCP 47 language tag,
  /// limited to ISO 639-1 two-letter language codes. If the specified language
  /// data isn't available for the map image, the labels will default to the
  /// regional primary language.
  ///
  /// Supported codes:
  ///
  /// <ul>
  /// <li>
  /// <code>ar</code>
  /// </li>
  /// <li>
  /// <code>as</code>
  /// </li>
  /// <li>
  /// <code>az</code>
  /// </li>
  /// <li>
  /// <code>be</code>
  /// </li>
  /// <li>
  /// <code>bg</code>
  /// </li>
  /// <li>
  /// <code>bn</code>
  /// </li>
  /// <li>
  /// <code>bs</code>
  /// </li>
  /// <li>
  /// <code>ca</code>
  /// </li>
  /// <li>
  /// <code>cs</code>
  /// </li>
  /// <li>
  /// <code>cy</code>
  /// </li>
  /// <li>
  /// <code>da</code>
  /// </li>
  /// <li>
  /// <code>de</code>
  /// </li>
  /// <li>
  /// <code>el</code>
  /// </li>
  /// <li>
  /// <code>en</code>
  /// </li>
  /// <li>
  /// <code>es</code>
  /// </li>
  /// <li>
  /// <code>et</code>
  /// </li>
  /// <li>
  /// <code>eu</code>
  /// </li>
  /// <li>
  /// <code>fi</code>
  /// </li>
  /// <li>
  /// <code>fo</code>
  /// </li>
  /// <li>
  /// <code>fr</code>
  /// </li>
  /// <li>
  /// <code>ga</code>
  /// </li>
  /// <li>
  /// <code>gl</code>
  /// </li>
  /// <li>
  /// <code>gn</code>
  /// </li>
  /// <li>
  /// <code>gu</code>
  /// </li>
  /// <li>
  /// <code>he</code>
  /// </li>
  /// <li>
  /// <code>hi</code>
  /// </li>
  /// <li>
  /// <code>hr</code>
  /// </li>
  /// <li>
  /// <code>hu</code>
  /// </li>
  /// <li>
  /// <code>hy</code>
  /// </li>
  /// <li>
  /// <code>id</code>
  /// </li>
  /// <li>
  /// <code>is</code>
  /// </li>
  /// <li>
  /// <code>it</code>
  /// </li>
  /// <li>
  /// <code>ja</code>
  /// </li>
  /// <li>
  /// <code>ka</code>
  /// </li>
  /// <li>
  /// <code>kk</code>
  /// </li>
  /// <li>
  /// <code>km</code>
  /// </li>
  /// <li>
  /// <code>kn</code>
  /// </li>
  /// <li>
  /// <code>ko</code>
  /// </li>
  /// <li>
  /// <code>ky</code>
  /// </li>
  /// <li>
  /// <code>lt</code>
  /// </li>
  /// <li>
  /// <code>lv</code>
  /// </li>
  /// <li>
  /// <code>mk</code>
  /// </li>
  /// <li>
  /// <code>ml</code>
  /// </li>
  /// <li>
  /// <code>mr</code>
  /// </li>
  /// <li>
  /// <code>ms</code>
  /// </li>
  /// <li>
  /// <code>mt</code>
  /// </li>
  /// <li>
  /// <code>my</code>
  /// </li>
  /// <li>
  /// <code>nl</code>
  /// </li>
  /// <li>
  /// <code>no</code>
  /// </li>
  /// <li>
  /// <code>or</code>
  /// </li>
  /// <li>
  /// <code>pa</code>
  /// </li>
  /// <li>
  /// <code>pl</code>
  /// </li>
  /// <li>
  /// <code>pt</code>
  /// </li>
  /// <li>
  /// <code>ro</code>
  /// </li>
  /// <li>
  /// <code>ru</code>
  /// </li>
  /// <li>
  /// <code>sk</code>
  /// </li>
  /// <li>
  /// <code>sl</code>
  /// </li>
  /// <li>
  /// <code>sq</code>
  /// </li>
  /// <li>
  /// <code>sr</code>
  /// </li>
  /// <li>
  /// <code>sv</code>
  /// </li>
  /// <li>
  /// <code>ta</code>
  /// </li>
  /// <li>
  /// <code>te</code>
  /// </li>
  /// <li>
  /// <code>th</code>
  /// </li>
  /// <li>
  /// <code>tr</code>
  /// </li>
  /// <li>
  /// <code>uk</code>
  /// </li>
  /// <li>
  /// <code>uz</code>
  /// </li>
  /// <li>
  /// <code>vi</code>
  /// </li>
  /// <li>
  /// <code>zh</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [padding] :
  /// Applies additional space (in pixels) around overlay feature to prevent
  /// them from being cut or obscured.
  /// <note>
  /// Value for max and min is determined by:
  ///
  /// Min: <code>1</code>
  ///
  /// Max: <code>min(height, width)/4</code>
  /// </note>
  /// Example: <code>100</code>
  ///
  /// Parameter [pointsOfInterests] :
  /// Determines if the result image will display icons representing points of
  /// interest on the map.
  ///
  /// Parameter [politicalView] :
  /// Specifies the political view, using ISO 3166-2 or ISO 3166-3 country code
  /// format.
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
  /// Parameter [radius] :
  /// Used with center parameter, it specifies the zoom of the image where you
  /// can control it on a granular level. Takes in any value <code>&gt;=
  /// 1</code>.
  ///
  /// Example: <code>1500</code>
  /// <note>
  /// Cannot be used with <code>Zoom</code>.
  /// </note>
  /// <b>Unit</b>: <code>Meters</code>
  /// <p/>
  ///
  /// Parameter [scaleBarUnit] :
  /// Displays a scale on the bottom right of the map image with the unit
  /// specified in the input.
  ///
  /// Example: <code>KilometersMiles, Miles, Kilometers, MilesKilometers</code>
  ///
  /// Parameter [style] :
  /// <code>Style</code> specifies the desired map style.
  ///
  /// Parameter [zoom] :
  /// Specifies the zoom level of the map image.
  /// <note>
  /// Cannot be used with <code>Radius</code>.
  /// </note>
  Future<GetStaticMapResponse> getStaticMap({
    required String fileName,
    required int height,
    required int width,
    String? boundedPositions,
    String? boundingBox,
    String? center,
    ColorScheme? colorScheme,
    String? compactOverlay,
    bool? cropLabels,
    String? geoJsonOverlay,
    String? key,
    LabelSize? labelSize,
    String? language,
    int? padding,
    MapFeatureMode? pointsOfInterests,
    String? politicalView,
    int? radius,
    ScaleBarUnit? scaleBarUnit,
    StaticMapStyle? style,
    double? zoom,
  }) async {
    _s.validateNumRange(
      'radius',
      radius,
      0,
      4294967295,
    );
    final $query = <String, List<String>>{
      'height': [height.toString()],
      'width': [width.toString()],
      if (boundedPositions != null) 'bounded-positions': [boundedPositions],
      if (boundingBox != null) 'bounding-box': [boundingBox],
      if (center != null) 'center': [center],
      if (colorScheme != null) 'color-scheme': [colorScheme.value],
      if (compactOverlay != null) 'compact-overlay': [compactOverlay],
      if (cropLabels != null) 'crop-labels': [cropLabels.toString()],
      if (geoJsonOverlay != null) 'geojson-overlay': [geoJsonOverlay],
      if (key != null) 'key': [key],
      if (labelSize != null) 'label-size': [labelSize.value],
      if (language != null) 'lang': [language],
      if (padding != null) 'padding': [padding.toString()],
      if (pointsOfInterests != null) 'pois': [pointsOfInterests.value],
      if (politicalView != null) 'political-view': [politicalView],
      if (radius != null) 'radius': [radius.toString()],
      if (scaleBarUnit != null) 'scale-unit': [scaleBarUnit.value],
      if (style != null) 'style': [style.value],
      if (zoom != null) 'zoom': [zoom.toString()],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/static/${Uri.encodeComponent(fileName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetStaticMapResponse(
      blob: await response.stream.toBytes(),
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag'),
    );
  }

  /// <code>GetStyleDescriptor</code> returns information about the style.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/styling-dynamic-maps.html">Style
  /// dynamic maps</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// Parameter [style] :
  /// Style specifies the desired map style. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only the <code>Standard</code> and <code>Monochrome</code>
  /// values.
  ///
  /// Parameter [buildings] :
  /// Adjusts how building details are rendered on the map.
  ///
  /// The following building styles are currently supported:
  ///
  /// <ul>
  /// <li>
  /// <code>Buildings3D</code>: Displays buildings as three-dimensional
  /// extrusions on the map.
  /// </li>
  /// </ul>
  /// <code>Buildings3D</code> is valid only for the <code>Standard</code> and
  /// <code>Monochrome</code> map styles.
  ///
  /// Parameter [colorScheme] :
  /// Sets the color tone for the map, such as dark and light.
  ///
  /// Example: <code>Light</code>
  ///
  /// Default value: <code>Light</code>
  /// <note>
  /// Valid values for ColorScheme are case sensitive.
  /// </note>
  ///
  /// Parameter [contourDensity] :
  /// Displays the shape and steepness of terrain features using elevation
  /// lines. The density value controls how densely the available contour line
  /// information is rendered on the map. Not supported in
  /// <code>ap-southeast-1</code> and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// This parameter is valid for all map styles except <code>Satellite</code>.
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  ///
  /// Parameter [politicalView] :
  /// Specifies the political view using ISO 3166-2 or ISO 3166-3 country code
  /// format. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
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
  /// Parameter [terrain] :
  /// Adjusts how physical terrain details are rendered on the map. Not
  /// supported in <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// The following terrain styles are currently supported:
  ///
  /// <ul>
  /// <li>
  /// <code>Hillshade</code>: Displays the physical terrain details through
  /// shading and highlighting of elevation change and geographic features.
  /// </li>
  /// <li>
  /// <code>Terrain3D</code>: Displays physical terrain details and elevations
  /// as a three-dimensional model.
  /// </li>
  /// </ul>
  /// <code>Hillshade</code> is valid only for the <code>Standard</code> and
  /// <code>Monochrome</code> map styles.
  ///
  /// Parameter [traffic] :
  /// Displays real-time traffic information overlay on map, such as incident
  /// events and flow events. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// This parameter is valid for all map styles except <code>Satellite</code>.
  ///
  /// Parameter [travelModes] :
  /// Renders additional map information relevant to selected travel modes.
  /// Information for multiple travel modes can be displayed simultaneously,
  /// although this increases the overall information density rendered on the
  /// map. Not supported in <code>ap-southeast-1</code> and
  /// <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// This parameter is valid for all map styles except <code>Satellite</code>.
  Future<GetStyleDescriptorResponse> getStyleDescriptor({
    required MapStyle style,
    Buildings? buildings,
    ColorScheme? colorScheme,
    ContourDensity? contourDensity,
    String? key,
    String? politicalView,
    Terrain? terrain,
    Traffic? traffic,
    List<TravelMode>? travelModes,
  }) async {
    final $query = <String, List<String>>{
      if (buildings != null) 'buildings': [buildings.value],
      if (colorScheme != null) 'color-scheme': [colorScheme.value],
      if (contourDensity != null) 'contour-density': [contourDensity.value],
      if (key != null) 'key': [key],
      if (politicalView != null) 'political-view': [politicalView],
      if (terrain != null) 'terrain': [terrain.value],
      if (traffic != null) 'traffic': [traffic.value],
      if (travelModes != null)
        'travel-modes': travelModes.map((e) => e.value).toList(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/styles/${Uri.encodeComponent(style.value)}/descriptor',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetStyleDescriptorResponse(
      blob: await response.stream.toBytes(),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag'),
    );
  }

  /// <code>GetTile</code> returns a tile. Map tiles are used by clients to
  /// render a map. They're addressed using a grid arrangement with an X
  /// coordinate, Y coordinate, and Z (zoom) level.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/tiles.html">Tiles</a>
  /// in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [tileset] :
  /// Specifies the desired tile set. For <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers, <code>ap-southeast-1</code> and <code>ap-southeast-5</code>
  /// regions support only the <code>vector.basemap</code> value.
  ///
  /// Valid Values: <code>raster.satellite | vector.basemap | vector.traffic |
  /// raster.dem</code>
  ///
  /// Parameter [x] :
  /// The X axis value for the map tile.
  ///
  /// Parameter [y] :
  /// The Y axis value for the map tile.
  ///
  /// Parameter [z] :
  /// The zoom value for the map tile.
  ///
  /// Parameter [additionalFeatures] :
  /// A list of optional additional parameters such as map styles that can be
  /// requested for each result. Not supported in <code>ap-southeast-1</code>
  /// and <code>ap-southeast-5</code> regions for <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/GrabMaps.html">GrabMaps</a>
  /// customers.
  ///
  /// Parameter [key] :
  /// Optional: The API key to be used for authorization. Either an API key or
  /// valid SigV4 signature must be provided when making a request.
  Future<GetTileResponse> getTile({
    required String tileset,
    required String x,
    required String y,
    required String z,
    List<TileAdditionalFeature>? additionalFeatures,
    String? key,
  }) async {
    final $query = <String, List<String>>{
      if (additionalFeatures != null)
        'additional-features': additionalFeatures.map((e) => e.value).toList(),
      if (key != null) 'key': [key],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/tiles/${Uri.encodeComponent(tileset)}/${Uri.encodeComponent(z)}/${Uri.encodeComponent(x)}/${Uri.encodeComponent(y)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTileResponse(
      blob: await response.stream.toBytes(),
      pricingBucket: _s.extractHeaderStringValue(
          response.headers, 'x-amz-geo-pricing-bucket')!,
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag'),
    );
  }
}

/// @nodoc
class GetGlyphsResponse {
  /// The Glyph, as a binary blob.
  final Uint8List? blob;

  /// Header that instructs caching configuration for the client.
  final String? cacheControl;

  /// Header that represents the format of the response. The response returns the
  /// following as the HTTP body.
  final String? contentType;

  /// The glyph's Etag.
  final String? eTag;

  GetGlyphsResponse({
    this.blob,
    this.cacheControl,
    this.contentType,
    this.eTag,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    final eTag = this.eTag;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

/// @nodoc
class GetSpritesResponse {
  /// The body of the sprite sheet or JSON offset file (image/png or
  /// application/json, depending on input).
  final Uint8List? blob;

  /// Header that instructs caching configuration for the client.
  final String? cacheControl;

  /// Header that represents the format of the response. The response returns the
  /// following as the HTTP body.
  final String? contentType;

  /// The sprite's Etag.
  final String? eTag;

  GetSpritesResponse({
    this.blob,
    this.cacheControl,
    this.contentType,
    this.eTag,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    final eTag = this.eTag;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

/// @nodoc
class GetStaticMapResponse {
  /// The pricing bucket for which the request is charged at.
  final String pricingBucket;

  /// The blob represents a map image as a <code>jpeg</code> for the
  /// <code>GetStaticMap</code> API.
  final Uint8List? blob;

  /// Header that instructs caching configuration for the client.
  final String? cacheControl;

  /// Header that represents the format of the response. The response returns the
  /// following as the HTTP body.
  final String? contentType;

  /// The static map's Etag.
  final String? eTag;

  GetStaticMapResponse({
    required this.pricingBucket,
    this.blob,
    this.cacheControl,
    this.contentType,
    this.eTag,
  });

  Map<String, dynamic> toJson() {
    final pricingBucket = this.pricingBucket;
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    final eTag = this.eTag;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

/// @nodoc
class GetStyleDescriptorResponse {
  /// This Blob contains the body of the style descriptor which is in
  /// application/json format.
  final Uint8List? blob;

  /// Header that instructs caching configuration for the client.
  final String? cacheControl;

  /// Header that represents the format of the response. The response returns the
  /// following as the HTTP body.
  final String? contentType;

  /// The style descriptor's Etag.
  final String? eTag;

  GetStyleDescriptorResponse({
    this.blob,
    this.cacheControl,
    this.contentType,
    this.eTag,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    final eTag = this.eTag;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

/// @nodoc
class GetTileResponse {
  /// The pricing bucket for which the request is charged at.
  final String pricingBucket;

  /// The blob represents a vector tile in <code>mvt</code> or a raster tile in an
  /// image format.
  final Uint8List? blob;

  /// Header that instructs caching configuration for the client.
  final String? cacheControl;

  /// Header that represents the format of the response. The response returns the
  /// following as the HTTP body.
  final String? contentType;

  /// The pricing bucket for which the request is charged at.
  final String? eTag;

  GetTileResponse({
    required this.pricingBucket,
    this.blob,
    this.cacheControl,
    this.contentType,
    this.eTag,
  });

  Map<String, dynamic> toJson() {
    final pricingBucket = this.pricingBucket;
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    final eTag = this.eTag;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

/// @nodoc
class TileAdditionalFeature {
  static const contourLines = TileAdditionalFeature._('ContourLines');
  static const hillshade = TileAdditionalFeature._('Hillshade');
  static const logistics = TileAdditionalFeature._('Logistics');
  static const transit = TileAdditionalFeature._('Transit');

  final String value;

  const TileAdditionalFeature._(this.value);

  static const values = [contourLines, hillshade, logistics, transit];

  static TileAdditionalFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TileAdditionalFeature._(value));

  @override
  bool operator ==(other) =>
      other is TileAdditionalFeature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MapStyle {
  static const standard = MapStyle._('Standard');
  static const monochrome = MapStyle._('Monochrome');
  static const hybrid = MapStyle._('Hybrid');
  static const satellite = MapStyle._('Satellite');

  final String value;

  const MapStyle._(this.value);

  static const values = [standard, monochrome, hybrid, satellite];

  static MapStyle fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MapStyle._(value));

  @override
  bool operator ==(other) => other is MapStyle && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ColorScheme {
  static const light = ColorScheme._('Light');
  static const dark = ColorScheme._('Dark');

  final String value;

  const ColorScheme._(this.value);

  static const values = [light, dark];

  static ColorScheme fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ColorScheme._(value));

  @override
  bool operator ==(other) => other is ColorScheme && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Terrain {
  static const hillshade = Terrain._('Hillshade');
  static const terrain3D = Terrain._('Terrain3D');

  final String value;

  const Terrain._(this.value);

  static const values = [hillshade, terrain3D];

  static Terrain fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Terrain._(value));

  @override
  bool operator ==(other) => other is Terrain && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ContourDensity {
  static const low = ContourDensity._('Low');
  static const medium = ContourDensity._('Medium');
  static const high = ContourDensity._('High');

  final String value;

  const ContourDensity._(this.value);

  static const values = [low, medium, high];

  static ContourDensity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContourDensity._(value));

  @override
  bool operator ==(other) => other is ContourDensity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Traffic {
  static const all = Traffic._('All');
  static const congestion = Traffic._('Congestion');

  final String value;

  const Traffic._(this.value);

  static const values = [all, congestion];

  static Traffic fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Traffic._(value));

  @override
  bool operator ==(other) => other is Traffic && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Buildings {
  static const buildings3D = Buildings._('Buildings3D');

  final String value;

  const Buildings._(this.value);

  static const values = [buildings3D];

  static Buildings fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Buildings._(value));

  @override
  bool operator ==(other) => other is Buildings && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TravelMode {
  static const transit = TravelMode._('Transit');
  static const truck = TravelMode._('Truck');

  final String value;

  const TravelMode._(this.value);

  static const values = [transit, truck];

  static TravelMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TravelMode._(value));

  @override
  bool operator ==(other) => other is TravelMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LabelSize {
  static const small = LabelSize._('Small');
  static const large = LabelSize._('Large');

  final String value;

  const LabelSize._(this.value);

  static const values = [small, large];

  static LabelSize fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LabelSize._(value));

  @override
  bool operator ==(other) => other is LabelSize && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MapFeatureMode {
  static const enabled = MapFeatureMode._('Enabled');
  static const disabled = MapFeatureMode._('Disabled');

  final String value;

  const MapFeatureMode._(this.value);

  static const values = [enabled, disabled];

  static MapFeatureMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MapFeatureMode._(value));

  @override
  bool operator ==(other) => other is MapFeatureMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ScaleBarUnit {
  static const kilometers = ScaleBarUnit._('Kilometers');
  static const kilometersMiles = ScaleBarUnit._('KilometersMiles');
  static const miles = ScaleBarUnit._('Miles');
  static const milesKilometers = ScaleBarUnit._('MilesKilometers');

  final String value;

  const ScaleBarUnit._(this.value);

  static const values = [kilometers, kilometersMiles, miles, milesKilometers];

  static ScaleBarUnit fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScaleBarUnit._(value));

  @override
  bool operator ==(other) => other is ScaleBarUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StaticMapStyle {
  static const satellite = StaticMapStyle._('Satellite');
  static const standard = StaticMapStyle._('Standard');

  final String value;

  const StaticMapStyle._(this.value);

  static const values = [satellite, standard];

  static StaticMapStyle fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StaticMapStyle._(value));

  @override
  bool operator ==(other) => other is StaticMapStyle && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Variant {
  static const $default = Variant._('Default');

  final String value;

  const Variant._(this.value);

  static const values = [$default];

  static Variant fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Variant._(value));

  @override
  bool operator ==(other) => other is Variant && other.value == value;

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
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
