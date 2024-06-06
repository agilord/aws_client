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

/// Amazon Web Services IoT FleetWise is a fully managed service that you can
/// use to collect, model, and transfer vehicle data to the Amazon Web Services
/// cloud at scale. With Amazon Web Services IoT FleetWise, you can standardize
/// all of your vehicle data models, independent of the in-vehicle communication
/// architecture, and define data collection rules to transfer only high-value
/// data to the cloud.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/">What
/// is Amazon Web Services IoT FleetWise?</a> in the <i>Amazon Web Services IoT
/// FleetWise Developer Guide</i>.
class IoTFleetWise {
  final _s.JsonProtocol _protocol;
  IoTFleetWise({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iotfleetwise',
            signingName: 'iotfleetwise',
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

  /// Adds, or associates, a vehicle with a fleet.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [fleetId] :
  /// The ID of a fleet.
  ///
  /// Parameter [vehicleName] :
  /// The unique ID of the vehicle to associate with the fleet.
  Future<void> associateVehicleFleet({
    required String fleetId,
    required String vehicleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.AssociateVehicleFleet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'fleetId': fleetId,
        'vehicleName': vehicleName,
      },
    );
  }

  /// Creates a group, or batch, of vehicles.
  /// <note>
  /// You must specify a decoder manifest and a vehicle model (model manifest)
  /// for each vehicle.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/create-vehicles-cli.html">Create
  /// multiple vehicles (AWS CLI)</a> in the <i>Amazon Web Services IoT
  /// FleetWise Developer Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [vehicles] :
  /// A list of information about each vehicle to create. For more information,
  /// see the API data type.
  Future<BatchCreateVehicleResponse> batchCreateVehicle({
    required List<CreateVehicleRequestItem> vehicles,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.BatchCreateVehicle'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'vehicles': vehicles,
      },
    );

    return BatchCreateVehicleResponse.fromJson(jsonResponse.body);
  }

  /// Updates a group, or batch, of vehicles.
  /// <note>
  /// You must specify a decoder manifest and a vehicle model (model manifest)
  /// for each vehicle.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/update-vehicles-cli.html">Update
  /// multiple vehicles (AWS CLI)</a> in the <i>Amazon Web Services IoT
  /// FleetWise Developer Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [vehicles] :
  /// A list of information about the vehicles to update. For more information,
  /// see the API data type.
  Future<BatchUpdateVehicleResponse> batchUpdateVehicle({
    required List<UpdateVehicleRequestItem> vehicles,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.BatchUpdateVehicle'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'vehicles': vehicles,
      },
    );

    return BatchUpdateVehicleResponse.fromJson(jsonResponse.body);
  }

  /// Creates an orchestration of data collection rules. The Amazon Web Services
  /// IoT FleetWise Edge Agent software running in vehicles uses campaigns to
  /// decide how to collect and transfer data to the cloud. You create campaigns
  /// in the cloud. After you or your team approve campaigns, Amazon Web
  /// Services IoT FleetWise automatically deploys them to vehicles.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/campaigns.html">Collect
  /// and transfer data with campaigns</a> in the <i>Amazon Web Services IoT
  /// FleetWise Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [collectionScheme] :
  /// The data collection scheme associated with the campaign. You can specify a
  /// scheme that collects data based on time or an event.
  ///
  /// Parameter [name] :
  /// The name of the campaign to create.
  ///
  /// Parameter [signalCatalogArn] :
  /// The Amazon Resource Name (ARN) of the signal catalog to associate with the
  /// campaign.
  ///
  /// Parameter [targetArn] :
  /// The ARN of the vehicle or fleet to deploy a campaign to.
  ///
  /// Parameter [compression] :
  /// (Optional) Whether to compress signals before transmitting data to Amazon
  /// Web Services IoT FleetWise. If you don't want to compress the signals, use
  /// <code>OFF</code>. If it's not specified, <code>SNAPPY</code> is used.
  ///
  /// Default: <code>SNAPPY</code>
  ///
  /// Parameter [dataDestinationConfigs] :
  /// The destination where the campaign sends data. You can choose to send data
  /// to be stored in Amazon S3 or Amazon Timestream.
  ///
  /// Amazon S3 optimizes the cost of data storage and provides additional
  /// mechanisms to use vehicle data, such as data lakes, centralized data
  /// storage, data processing pipelines, and analytics. Amazon Web Services IoT
  /// FleetWise supports at-least-once file delivery to S3. Your vehicle data is
  /// stored on multiple Amazon Web Services IoT FleetWise servers for
  /// redundancy and high availability.
  ///
  /// You can use Amazon Timestream to access and analyze time series data, and
  /// Timestream to query vehicle data so that you can identify trends and
  /// patterns.
  ///
  /// Parameter [dataExtraDimensions] :
  /// (Optional) A list of vehicle attributes to associate with a campaign.
  ///
  /// Enrich the data with specified vehicle attributes. For example, add
  /// <code>make</code> and <code>model</code> to the campaign, and Amazon Web
  /// Services IoT FleetWise will associate the data with those attributes as
  /// dimensions in Amazon Timestream. You can then query the data against
  /// <code>make</code> and <code>model</code>.
  ///
  /// Default: An empty array
  ///
  /// Parameter [description] :
  /// An optional description of the campaign to help identify its purpose.
  ///
  /// Parameter [diagnosticsMode] :
  /// (Optional) Option for a vehicle to send diagnostic trouble codes to Amazon
  /// Web Services IoT FleetWise. If you want to send diagnostic trouble codes,
  /// use <code>SEND_ACTIVE_DTCS</code>. If it's not specified, <code>OFF</code>
  /// is used.
  ///
  /// Default: <code>OFF</code>
  ///
  /// Parameter [expiryTime] :
  /// (Optional) The time the campaign expires, in seconds since epoch (January
  /// 1, 1970 at midnight UTC time). Vehicle data isn't collected after the
  /// campaign expires.
  ///
  /// Default: 253402214400 (December 31, 9999, 00:00:00 UTC)
  ///
  /// Parameter [postTriggerCollectionDuration] :
  /// (Optional) How long (in milliseconds) to collect raw data after a
  /// triggering event initiates the collection. If it's not specified,
  /// <code>0</code> is used.
  ///
  /// Default: <code>0</code>
  ///
  /// Parameter [priority] :
  /// (Optional) A number indicating the priority of one campaign over another
  /// campaign for a certain vehicle or fleet. A campaign with the lowest value
  /// is deployed to vehicles before any other campaigns. If it's not specified,
  /// <code>0</code> is used.
  ///
  /// Default: <code>0</code>
  ///
  /// Parameter [signalsToCollect] :
  /// (Optional) A list of information about signals to collect.
  ///
  /// Parameter [spoolingMode] :
  /// (Optional) Whether to store collected data after a vehicle lost a
  /// connection with the cloud. After a connection is re-established, the data
  /// is automatically forwarded to Amazon Web Services IoT FleetWise. If you
  /// want to store collected data when a vehicle loses connection with the
  /// cloud, use <code>TO_DISK</code>. If it's not specified, <code>OFF</code>
  /// is used.
  ///
  /// Default: <code>OFF</code>
  ///
  /// Parameter [startTime] :
  /// (Optional) The time, in milliseconds, to deliver a campaign after it was
  /// approved. If it's not specified, <code>0</code> is used.
  ///
  /// Default: <code>0</code>
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the campaign.
  Future<CreateCampaignResponse> createCampaign({
    required CollectionScheme collectionScheme,
    required String name,
    required String signalCatalogArn,
    required String targetArn,
    Compression? compression,
    List<DataDestinationConfig>? dataDestinationConfigs,
    List<String>? dataExtraDimensions,
    String? description,
    DiagnosticsMode? diagnosticsMode,
    DateTime? expiryTime,
    int? postTriggerCollectionDuration,
    int? priority,
    List<SignalInformation>? signalsToCollect,
    SpoolingMode? spoolingMode,
    DateTime? startTime,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'postTriggerCollectionDuration',
      postTriggerCollectionDuration,
      0,
      4294967295,
    );
    _s.validateNumRange(
      'priority',
      priority,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.CreateCampaign'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'collectionScheme': collectionScheme,
        'name': name,
        'signalCatalogArn': signalCatalogArn,
        'targetArn': targetArn,
        if (compression != null) 'compression': compression.toValue(),
        if (dataDestinationConfigs != null)
          'dataDestinationConfigs': dataDestinationConfigs,
        if (dataExtraDimensions != null)
          'dataExtraDimensions': dataExtraDimensions,
        if (description != null) 'description': description,
        if (diagnosticsMode != null)
          'diagnosticsMode': diagnosticsMode.toValue(),
        if (expiryTime != null) 'expiryTime': unixTimestampToJson(expiryTime),
        if (postTriggerCollectionDuration != null)
          'postTriggerCollectionDuration': postTriggerCollectionDuration,
        if (priority != null) 'priority': priority,
        if (signalsToCollect != null) 'signalsToCollect': signalsToCollect,
        if (spoolingMode != null) 'spoolingMode': spoolingMode.toValue(),
        if (startTime != null) 'startTime': unixTimestampToJson(startTime),
        if (tags != null) 'tags': tags,
      },
    );

    return CreateCampaignResponse.fromJson(jsonResponse.body);
  }

  /// Creates the decoder manifest associated with a model manifest. To create a
  /// decoder manifest, the following must be true:
  ///
  /// <ul>
  /// <li>
  /// Every signal decoder has a unique name.
  /// </li>
  /// <li>
  /// Each signal decoder is associated with a network interface.
  /// </li>
  /// <li>
  /// Each network interface has a unique ID.
  /// </li>
  /// <li>
  /// The signal decoders are specified in the model manifest.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [DecoderManifestValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [modelManifestArn] :
  /// The Amazon Resource Name (ARN) of the vehicle model (model manifest).
  ///
  /// Parameter [name] :
  /// The unique name of the decoder manifest to create.
  ///
  /// Parameter [description] :
  /// A brief description of the decoder manifest.
  ///
  /// Parameter [networkInterfaces] :
  /// A list of information about available network interfaces.
  ///
  /// Parameter [signalDecoders] :
  /// A list of information about signal decoders.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the decoder manifest.
  Future<CreateDecoderManifestResponse> createDecoderManifest({
    required String modelManifestArn,
    required String name,
    String? description,
    List<NetworkInterface>? networkInterfaces,
    List<SignalDecoder>? signalDecoders,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.CreateDecoderManifest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'modelManifestArn': modelManifestArn,
        'name': name,
        if (description != null) 'description': description,
        if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
        if (signalDecoders != null) 'signalDecoders': signalDecoders,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateDecoderManifestResponse.fromJson(jsonResponse.body);
  }

  /// Creates a fleet that represents a group of vehicles.
  /// <note>
  /// You must create both a signal catalog and vehicles before you can create a
  /// fleet.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleets.html">Fleets</a>
  /// in the <i>Amazon Web Services IoT FleetWise Developer Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [fleetId] :
  /// The unique ID of the fleet to create.
  ///
  /// Parameter [signalCatalogArn] :
  /// The Amazon Resource Name (ARN) of a signal catalog.
  ///
  /// Parameter [description] :
  /// A brief description of the fleet to create.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the fleet.
  Future<CreateFleetResponse> createFleet({
    required String fleetId,
    required String signalCatalogArn,
    String? description,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.CreateFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'fleetId': fleetId,
        'signalCatalogArn': signalCatalogArn,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateFleetResponse.fromJson(jsonResponse.body);
  }

  /// Creates a vehicle model (model manifest) that specifies signals
  /// (attributes, branches, sensors, and actuators).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/vehicle-models.html">Vehicle
  /// models</a> in the <i>Amazon Web Services IoT FleetWise Developer
  /// Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidSignalsException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the vehicle model to create.
  ///
  /// Parameter [nodes] :
  /// A list of nodes, which are a general abstraction of signals.
  ///
  /// Parameter [signalCatalogArn] :
  /// The Amazon Resource Name (ARN) of a signal catalog.
  ///
  /// Parameter [description] :
  /// A brief description of the vehicle model.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the vehicle model.
  Future<CreateModelManifestResponse> createModelManifest({
    required String name,
    required List<String> nodes,
    required String signalCatalogArn,
    String? description,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.CreateModelManifest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'nodes': nodes,
        'signalCatalogArn': signalCatalogArn,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateModelManifestResponse.fromJson(jsonResponse.body);
  }

  /// Creates a collection of standardized signals that can be reused to create
  /// vehicle models.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidNodeException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidSignalsException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the signal catalog to create.
  ///
  /// Parameter [description] :
  /// A brief description of the signal catalog.
  ///
  /// Parameter [nodes] :
  /// A list of information about nodes, which are a general abstraction of
  /// signals. For more information, see the API data type.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the signal catalog.
  Future<CreateSignalCatalogResponse> createSignalCatalog({
    required String name,
    String? description,
    List<Node>? nodes,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.CreateSignalCatalog'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (nodes != null) 'nodes': nodes,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateSignalCatalogResponse.fromJson(jsonResponse.body);
  }

  /// Creates a vehicle, which is an instance of a vehicle model (model
  /// manifest). Vehicles created from the same vehicle model consist of the
  /// same signals inherited from the vehicle model.
  /// <note>
  /// If you have an existing Amazon Web Services IoT thing, you can use Amazon
  /// Web Services IoT FleetWise to create a vehicle and collect data from your
  /// thing.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/create-vehicle-cli.html">Create
  /// a vehicle (AWS CLI)</a> in the <i>Amazon Web Services IoT FleetWise
  /// Developer Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [decoderManifestArn] :
  /// The ARN of a decoder manifest.
  ///
  /// Parameter [modelManifestArn] :
  /// The Amazon Resource Name ARN of a vehicle model.
  ///
  /// Parameter [vehicleName] :
  /// The unique ID of the vehicle to create.
  ///
  /// Parameter [associationBehavior] :
  /// An option to create a new Amazon Web Services IoT thing when creating a
  /// vehicle, or to validate an existing Amazon Web Services IoT thing as a
  /// vehicle.
  ///
  /// Default: <code/>
  ///
  /// Parameter [attributes] :
  /// Static information about a vehicle in a key-value pair. For example:
  /// <code>"engineType"</code> : <code>"1.3 L R2"</code>
  ///
  /// A campaign must include the keys (attribute names) in
  /// <code>dataExtraDimensions</code> for them to display in Amazon Timestream.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the vehicle.
  Future<CreateVehicleResponse> createVehicle({
    required String decoderManifestArn,
    required String modelManifestArn,
    required String vehicleName,
    VehicleAssociationBehavior? associationBehavior,
    Map<String, String>? attributes,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.CreateVehicle'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'decoderManifestArn': decoderManifestArn,
        'modelManifestArn': modelManifestArn,
        'vehicleName': vehicleName,
        if (associationBehavior != null)
          'associationBehavior': associationBehavior.toValue(),
        if (attributes != null) 'attributes': attributes,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateVehicleResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a data collection campaign. Deleting a campaign suspends all data
  /// collection and removes it from any vehicles.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the campaign to delete.
  Future<DeleteCampaignResponse> deleteCampaign({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.DeleteCampaign'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteCampaignResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a decoder manifest. You can't delete a decoder manifest if it has
  /// vehicles associated with it.
  /// <note>
  /// If the decoder manifest is successfully deleted, Amazon Web Services IoT
  /// FleetWise sends back an HTTP 200 response with an empty body.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the decoder manifest to delete.
  Future<DeleteDecoderManifestResponse> deleteDecoderManifest({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.DeleteDecoderManifest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteDecoderManifestResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a fleet. Before you delete a fleet, all vehicles must be
  /// dissociated from the fleet. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/delete-fleet-cli.html">Delete
  /// a fleet (AWS CLI)</a> in the <i>Amazon Web Services IoT FleetWise
  /// Developer Guide</i>.
  /// <note>
  /// If the fleet is successfully deleted, Amazon Web Services IoT FleetWise
  /// sends back an HTTP 200 response with an empty body.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [fleetId] :
  /// The ID of the fleet to delete.
  Future<DeleteFleetResponse> deleteFleet({
    required String fleetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.DeleteFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'fleetId': fleetId,
      },
    );

    return DeleteFleetResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a vehicle model (model manifest).
  /// <note>
  /// If the vehicle model is successfully deleted, Amazon Web Services IoT
  /// FleetWise sends back an HTTP 200 response with an empty body.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the model manifest to delete.
  Future<DeleteModelManifestResponse> deleteModelManifest({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.DeleteModelManifest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteModelManifestResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a signal catalog.
  /// <note>
  /// If the signal catalog is successfully deleted, Amazon Web Services IoT
  /// FleetWise sends back an HTTP 200 response with an empty body.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the signal catalog to delete.
  Future<DeleteSignalCatalogResponse> deleteSignalCatalog({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.DeleteSignalCatalog'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteSignalCatalogResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a vehicle and removes it from any campaigns.
  /// <note>
  /// If the vehicle is successfully deleted, Amazon Web Services IoT FleetWise
  /// sends back an HTTP 200 response with an empty body.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [vehicleName] :
  /// The ID of the vehicle to delete.
  Future<DeleteVehicleResponse> deleteVehicle({
    required String vehicleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.DeleteVehicle'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'vehicleName': vehicleName,
      },
    );

    return DeleteVehicleResponse.fromJson(jsonResponse.body);
  }

  /// Removes, or disassociates, a vehicle from a fleet. Disassociating a
  /// vehicle from a fleet doesn't delete the vehicle.
  /// <note>
  /// If the vehicle is successfully dissociated from a fleet, Amazon Web
  /// Services IoT FleetWise sends back an HTTP 200 response with an empty body.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [fleetId] :
  /// The unique ID of a fleet.
  ///
  /// Parameter [vehicleName] :
  /// The unique ID of the vehicle to disassociate from the fleet.
  Future<void> disassociateVehicleFleet({
    required String fleetId,
    required String vehicleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.DisassociateVehicleFleet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'fleetId': fleetId,
        'vehicleName': vehicleName,
      },
    );
  }

  /// Retrieves information about a campaign.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the campaign to retrieve information about.
  Future<GetCampaignResponse> getCampaign({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.GetCampaign'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return GetCampaignResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a created decoder manifest.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the decoder manifest to retrieve information about.
  Future<GetDecoderManifestResponse> getDecoderManifest({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.GetDecoderManifest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return GetDecoderManifestResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the encryption configuration for resources and data in Amazon
  /// Web Services IoT FleetWise.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  Future<GetEncryptionConfigurationResponse>
      getEncryptionConfiguration() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.GetEncryptionConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetEncryptionConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a fleet.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [fleetId] :
  /// The ID of the fleet to retrieve information about.
  Future<GetFleetResponse> getFleet({
    required String fleetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.GetFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'fleetId': fleetId,
      },
    );

    return GetFleetResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the logging options.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  Future<GetLoggingOptionsResponse> getLoggingOptions() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.GetLoggingOptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetLoggingOptionsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a vehicle model (model manifest).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the vehicle model to retrieve information about.
  Future<GetModelManifestResponse> getModelManifest({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.GetModelManifest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return GetModelManifestResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the status of registering your Amazon Web
  /// Services account, IAM, and Amazon Timestream resources so that Amazon Web
  /// Services IoT FleetWise can transfer your vehicle data to the Amazon Web
  /// Services Cloud.
  ///
  /// For more information, including step-by-step procedures, see <a
  /// href="https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/setting-up.html">Setting
  /// up Amazon Web Services IoT FleetWise</a>.
  /// <note>
  /// This API operation doesn't require input parameters.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  Future<GetRegisterAccountStatusResponse> getRegisterAccountStatus() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.GetRegisterAccountStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetRegisterAccountStatusResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a signal catalog.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the signal catalog to retrieve information about.
  Future<GetSignalCatalogResponse> getSignalCatalog({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.GetSignalCatalog'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return GetSignalCatalogResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a vehicle.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [vehicleName] :
  /// The ID of the vehicle to retrieve information about.
  Future<GetVehicleResponse> getVehicle({
    required String vehicleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.GetVehicle'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'vehicleName': vehicleName,
      },
    );

    return GetVehicleResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the status of a vehicle with any associated
  /// campaigns.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [vehicleName] :
  /// The ID of the vehicle to retrieve information about.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  Future<GetVehicleStatusResponse> getVehicleStatus({
    required String vehicleName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.GetVehicleStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'vehicleName': vehicleName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetVehicleStatusResponse.fromJson(jsonResponse.body);
  }

  /// Creates a decoder manifest using your existing CAN DBC file from your
  /// local device.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [DecoderManifestValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidSignalsException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the decoder manifest to import.
  ///
  /// Parameter [networkFileDefinitions] :
  /// The file to load into an Amazon Web Services account.
  Future<ImportDecoderManifestResponse> importDecoderManifest({
    required String name,
    required List<NetworkFileDefinition> networkFileDefinitions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ImportDecoderManifest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'networkFileDefinitions': networkFileDefinitions,
      },
    );

    return ImportDecoderManifestResponse.fromJson(jsonResponse.body);
  }

  /// Creates a signal catalog using your existing VSS formatted content from
  /// your local device.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidSignalsException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the signal catalog to import.
  ///
  /// Parameter [description] :
  /// A brief description of the signal catalog.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the signal catalog.
  ///
  /// Parameter [vss] :
  /// The contents of the Vehicle Signal Specification (VSS) configuration. VSS
  /// is a precise language used to describe and model signals in vehicle
  /// networks.
  Future<ImportSignalCatalogResponse> importSignalCatalog({
    required String name,
    String? description,
    List<Tag>? tags,
    FormattedVss? vss,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ImportSignalCatalog'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
        if (vss != null) 'vss': vss,
      },
    );

    return ImportSignalCatalogResponse.fromJson(jsonResponse.body);
  }

  /// Lists information about created campaigns.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the request to return more results.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  ///
  /// Parameter [status] :
  /// Optional parameter to filter the results by the status of each created
  /// campaign in your account. The status can be one of: <code>CREATING</code>,
  /// <code>WAITING_FOR_APPROVAL</code>, <code>RUNNING</code>, or
  /// <code>SUSPENDED</code>.
  Future<ListCampaignsResponse> listCampaigns({
    int? maxResults,
    String? nextToken,
    String? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ListCampaigns'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (status != null) 'status': status,
      },
    );

    return ListCampaignsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the network interfaces specified in a decoder manifest.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the request to return more results.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the decoder manifest to list information about.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  Future<ListDecoderManifestNetworkInterfacesResponse>
      listDecoderManifestNetworkInterfaces({
    required String name,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'IoTAutobahnControlPlane.ListDecoderManifestNetworkInterfaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDecoderManifestNetworkInterfacesResponse.fromJson(
        jsonResponse.body);
  }

  /// A list of information about signal decoders specified in a decoder
  /// manifest.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the request to return more results.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the decoder manifest to list information about.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  Future<ListDecoderManifestSignalsResponse> listDecoderManifestSignals({
    required String name,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ListDecoderManifestSignals'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDecoderManifestSignalsResponse.fromJson(jsonResponse.body);
  }

  /// Lists decoder manifests.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the request to return more results.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [modelManifestArn] :
  /// The Amazon Resource Name (ARN) of a vehicle model (model manifest)
  /// associated with the decoder manifest.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  Future<ListDecoderManifestsResponse> listDecoderManifests({
    int? maxResults,
    String? modelManifestArn,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ListDecoderManifests'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (modelManifestArn != null) 'modelManifestArn': modelManifestArn,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDecoderManifestsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information for each created fleet in an Amazon Web Services
  /// account.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the request to return more results.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  Future<ListFleetsResponse> listFleets({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ListFleets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListFleetsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of IDs for all fleets that the vehicle is associated
  /// with.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the request to return more results.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [vehicleName] :
  /// The ID of the vehicle to retrieve information about.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  Future<ListFleetsForVehicleResponse> listFleetsForVehicle({
    required String vehicleName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ListFleetsForVehicle'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'vehicleName': vehicleName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListFleetsForVehicleResponse.fromJson(jsonResponse.body);
  }

  /// Lists information about nodes specified in a vehicle model (model
  /// manifest).
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the request to return more results.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the vehicle model to list information about.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  Future<ListModelManifestNodesResponse> listModelManifestNodes({
    required String name,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ListModelManifestNodes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListModelManifestNodesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of vehicle models (model manifests).
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the request to return more results.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  ///
  /// Parameter [signalCatalogArn] :
  /// The ARN of a signal catalog. If you specify a signal catalog, only the
  /// vehicle models associated with it are returned.
  Future<ListModelManifestsResponse> listModelManifests({
    int? maxResults,
    String? nextToken,
    String? signalCatalogArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ListModelManifests'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (signalCatalogArn != null) 'signalCatalogArn': signalCatalogArn,
      },
    );

    return ListModelManifestsResponse.fromJson(jsonResponse.body);
  }

  /// Lists of information about the signals (nodes) specified in a signal
  /// catalog.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the request to return more results.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the signal catalog to list information about.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  ///
  /// Parameter [signalNodeType] :
  /// The type of node in the signal catalog.
  Future<ListSignalCatalogNodesResponse> listSignalCatalogNodes({
    required String name,
    int? maxResults,
    String? nextToken,
    SignalNodeType? signalNodeType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ListSignalCatalogNodes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (signalNodeType != null) 'signalNodeType': signalNodeType.toValue(),
      },
    );

    return ListSignalCatalogNodesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the created signal catalogs in an Amazon Web Services account.
  ///
  /// You can use to list information about each signal (node) specified in a
  /// signal catalog.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the request to return more results.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  Future<ListSignalCatalogsResponse> listSignalCatalogs({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ListSignalCatalogs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListSignalCatalogsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags (metadata) you have assigned to the resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of summaries of created vehicles.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the request to return more results.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [attributeNames] :
  /// The fully qualified names of the attributes. For example, the fully
  /// qualified name of an attribute might be
  /// <code>Vehicle.Body.Engine.Type</code>.
  ///
  /// Parameter [attributeValues] :
  /// Static information about a vehicle attribute value in string format. For
  /// example:
  ///
  /// <code>"1.3 L R2"</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [modelManifestArn] :
  /// The Amazon Resource Name (ARN) of a vehicle model (model manifest). You
  /// can use this optional parameter to list only the vehicles created from a
  /// certain vehicle model.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  Future<ListVehiclesResponse> listVehicles({
    List<String>? attributeNames,
    List<String>? attributeValues,
    int? maxResults,
    String? modelManifestArn,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ListVehicles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (attributeNames != null) 'attributeNames': attributeNames,
        if (attributeValues != null) 'attributeValues': attributeValues,
        if (maxResults != null) 'maxResults': maxResults,
        if (modelManifestArn != null) 'modelManifestArn': modelManifestArn,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListVehiclesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of summaries of all vehicles associated with a fleet.
  /// <note>
  /// This API operation uses pagination. Specify the <code>nextToken</code>
  /// parameter in the request to return more results.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [fleetId] :
  /// The ID of a fleet.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return, between 1 and 100, inclusive.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for the next set of results.
  ///
  /// If the results of a search are large, only a portion of the results are
  /// returned, and a <code>nextToken</code> pagination token is returned in the
  /// response. To retrieve the next set of results, reissue the search request
  /// and include the returned token. When all results have been returned, the
  /// response does not contain a pagination token value.
  Future<ListVehiclesInFleetResponse> listVehiclesInFleet({
    required String fleetId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.ListVehiclesInFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'fleetId': fleetId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListVehiclesInFleetResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates the encryption configuration. Amazon Web Services IoT
  /// FleetWise can encrypt your data and resources using an Amazon Web Services
  /// managed key. Or, you can use a KMS key that you own and manage. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/data-encryption.html">Data
  /// encryption</a> in the <i>Amazon Web Services IoT FleetWise Developer
  /// Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [encryptionType] :
  /// The type of encryption. Choose <code>KMS_BASED_ENCRYPTION</code> to use a
  /// KMS key or <code>FLEETWISE_DEFAULT_ENCRYPTION</code> to use an Amazon Web
  /// Services managed key.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key that is used for encryption.
  Future<PutEncryptionConfigurationResponse> putEncryptionConfiguration({
    required EncryptionType encryptionType,
    String? kmsKeyId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.PutEncryptionConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'encryptionType': encryptionType.toValue(),
        if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      },
    );

    return PutEncryptionConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates the logging option.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [cloudWatchLogDelivery] :
  /// Creates or updates the log delivery option to Amazon CloudWatch Logs.
  Future<void> putLoggingOptions({
    required CloudWatchLogDeliveryOptions cloudWatchLogDelivery,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.PutLoggingOptions'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'cloudWatchLogDelivery': cloudWatchLogDelivery,
      },
    );
  }

  /// <important>
  /// This API operation contains deprecated parameters. Register your account
  /// again without the Timestream resources parameter so that Amazon Web
  /// Services IoT FleetWise can remove the Timestream metadata stored. You
  /// should then pass the data destination into the <a
  /// href="https://docs.aws.amazon.com/iot-fleetwise/latest/APIReference/API_CreateCampaign.html">CreateCampaign</a>
  /// API operation.
  ///
  /// You must delete any existing campaigns that include an empty data
  /// destination before you register your account again. For more information,
  /// see the <a
  /// href="https://docs.aws.amazon.com/iot-fleetwise/latest/APIReference/API_DeleteCampaign.html">DeleteCampaign</a>
  /// API operation.
  ///
  /// If you want to delete the Timestream inline policy from the service-linked
  /// role, such as to mitigate an overly permissive policy, you must first
  /// delete any existing campaigns. Then delete the service-linked role and
  /// register your account again to enable CloudWatch metrics. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteServiceLinkedRole.html">DeleteServiceLinkedRole</a>
  /// in the <i>Identity and Access Management API Reference</i>.
  /// </important>
  /// Registers your Amazon Web Services account, IAM, and Amazon Timestream
  /// resources so Amazon Web Services IoT FleetWise can transfer your vehicle
  /// data to the Amazon Web Services Cloud. For more information, including
  /// step-by-step procedures, see <a
  /// href="https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/setting-up.html">Setting
  /// up Amazon Web Services IoT FleetWise</a>.
  /// <note>
  /// An Amazon Web Services account is <b>not</b> the same thing as a "user."
  /// An <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction_identity-management.html#intro-identity-users">Amazon
  /// Web Services user</a> is an identity that you create using Identity and
  /// Access Management (IAM) and takes the form of either an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users.html">IAM
  /// user</a> or an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// role, both with credentials</a>. A single Amazon Web Services account can,
  /// and typically does, contain many users and roles.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [iamResources] :
  /// The IAM resource that allows Amazon Web Services IoT FleetWise to send
  /// data to Amazon Timestream.
  Future<RegisterAccountResponse> registerAccount({
    IamResources? iamResources,
    TimestreamResources? timestreamResources,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.RegisterAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (iamResources != null) 'iamResources': iamResources,
        if (timestreamResources != null)
          'timestreamResources': timestreamResources,
      },
    );

    return RegisterAccountResponse.fromJson(jsonResponse.body);
  }

  /// Adds to or modifies the tags of the given resource. Tags are metadata
  /// which can be used to manage a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource.
  ///
  /// Parameter [tags] :
  /// The new or modified tags for the resource.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Removes the given tags (metadata) from the resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// A list of the keys of the tags to be removed from the resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates a campaign.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [action] :
  /// Specifies how to update a campaign. The action can be one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>APPROVE</code> - To approve delivering a data collection scheme to
  /// vehicles.
  /// </li>
  /// <li>
  /// <code>SUSPEND</code> - To suspend collecting signal data. The campaign is
  /// deleted from vehicles and all vehicles in the suspended campaign will stop
  /// sending data.
  /// </li>
  /// <li>
  /// <code>RESUME</code> - To reactivate the <code>SUSPEND</code> campaign. The
  /// campaign is redeployed to all vehicles and the vehicles will resume
  /// sending data.
  /// </li>
  /// <li>
  /// <code>UPDATE</code> - To update a campaign.
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The name of the campaign to update.
  ///
  /// Parameter [dataExtraDimensions] :
  /// A list of vehicle attributes to associate with a signal.
  ///
  /// Default: An empty array
  ///
  /// Parameter [description] :
  /// The description of the campaign.
  Future<UpdateCampaignResponse> updateCampaign({
    required UpdateCampaignAction action,
    required String name,
    List<String>? dataExtraDimensions,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.UpdateCampaign'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'action': action.toValue(),
        'name': name,
        if (dataExtraDimensions != null)
          'dataExtraDimensions': dataExtraDimensions,
        if (description != null) 'description': description,
      },
    );

    return UpdateCampaignResponse.fromJson(jsonResponse.body);
  }

  /// Updates a decoder manifest.
  ///
  /// A decoder manifest can only be updated when the status is
  /// <code>DRAFT</code>. Only <code>ACTIVE</code> decoder manifests can be
  /// associated with vehicles.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [DecoderManifestValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the decoder manifest to update.
  ///
  /// Parameter [description] :
  /// A brief description of the decoder manifest to update.
  ///
  /// Parameter [networkInterfacesToAdd] :
  /// A list of information about the network interfaces to add to the decoder
  /// manifest.
  ///
  /// Parameter [networkInterfacesToRemove] :
  /// A list of network interfaces to remove from the decoder manifest.
  ///
  /// Parameter [networkInterfacesToUpdate] :
  /// A list of information about the network interfaces to update in the
  /// decoder manifest.
  ///
  /// Parameter [signalDecodersToAdd] :
  /// A list of information about decoding additional signals to add to the
  /// decoder manifest.
  ///
  /// Parameter [signalDecodersToRemove] :
  /// A list of signal decoders to remove from the decoder manifest.
  ///
  /// Parameter [signalDecodersToUpdate] :
  /// A list of updated information about decoding signals to update in the
  /// decoder manifest.
  ///
  /// Parameter [status] :
  /// The state of the decoder manifest. If the status is <code>ACTIVE</code>,
  /// the decoder manifest can't be edited. If the status is <code>DRAFT</code>,
  /// you can edit the decoder manifest.
  Future<UpdateDecoderManifestResponse> updateDecoderManifest({
    required String name,
    String? description,
    List<NetworkInterface>? networkInterfacesToAdd,
    List<String>? networkInterfacesToRemove,
    List<NetworkInterface>? networkInterfacesToUpdate,
    List<SignalDecoder>? signalDecodersToAdd,
    List<String>? signalDecodersToRemove,
    List<SignalDecoder>? signalDecodersToUpdate,
    ManifestStatus? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.UpdateDecoderManifest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (networkInterfacesToAdd != null)
          'networkInterfacesToAdd': networkInterfacesToAdd,
        if (networkInterfacesToRemove != null)
          'networkInterfacesToRemove': networkInterfacesToRemove,
        if (networkInterfacesToUpdate != null)
          'networkInterfacesToUpdate': networkInterfacesToUpdate,
        if (signalDecodersToAdd != null)
          'signalDecodersToAdd': signalDecodersToAdd,
        if (signalDecodersToRemove != null)
          'signalDecodersToRemove': signalDecodersToRemove,
        if (signalDecodersToUpdate != null)
          'signalDecodersToUpdate': signalDecodersToUpdate,
        if (status != null) 'status': status.toValue(),
      },
    );

    return UpdateDecoderManifestResponse.fromJson(jsonResponse.body);
  }

  /// Updates the description of an existing fleet.
  /// <note>
  /// If the fleet is successfully updated, Amazon Web Services IoT FleetWise
  /// sends back an HTTP 200 response with an empty HTTP body.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [fleetId] :
  /// The ID of the fleet to update.
  ///
  /// Parameter [description] :
  /// An updated description of the fleet.
  Future<UpdateFleetResponse> updateFleet({
    required String fleetId,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.UpdateFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'fleetId': fleetId,
        if (description != null) 'description': description,
      },
    );

    return UpdateFleetResponse.fromJson(jsonResponse.body);
  }

  /// Updates a vehicle model (model manifest). If created vehicles are
  /// associated with a vehicle model, it can't be updated.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidSignalsException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the vehicle model to update.
  ///
  /// Parameter [description] :
  /// A brief description of the vehicle model.
  ///
  /// Parameter [nodesToAdd] :
  /// A list of <code>fullyQualifiedName</code> of nodes, which are a general
  /// abstraction of signals, to add to the vehicle model.
  ///
  /// Parameter [nodesToRemove] :
  /// A list of <code>fullyQualifiedName</code> of nodes, which are a general
  /// abstraction of signals, to remove from the vehicle model.
  ///
  /// Parameter [status] :
  /// The state of the vehicle model. If the status is <code>ACTIVE</code>, the
  /// vehicle model can't be edited. If the status is <code>DRAFT</code>, you
  /// can edit the vehicle model.
  Future<UpdateModelManifestResponse> updateModelManifest({
    required String name,
    String? description,
    List<String>? nodesToAdd,
    List<String>? nodesToRemove,
    ManifestStatus? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.UpdateModelManifest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (nodesToAdd != null) 'nodesToAdd': nodesToAdd,
        if (nodesToRemove != null) 'nodesToRemove': nodesToRemove,
        if (status != null) 'status': status.toValue(),
      },
    );

    return UpdateModelManifestResponse.fromJson(jsonResponse.body);
  }

  /// Updates a signal catalog.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidNodeException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InvalidSignalsException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the signal catalog to update.
  ///
  /// Parameter [description] :
  /// A brief description of the signal catalog to update.
  ///
  /// Parameter [nodesToAdd] :
  /// A list of information about nodes to add to the signal catalog.
  ///
  /// Parameter [nodesToRemove] :
  /// A list of <code>fullyQualifiedName</code> of nodes to remove from the
  /// signal catalog.
  ///
  /// Parameter [nodesToUpdate] :
  /// A list of information about nodes to update in the signal catalog.
  Future<UpdateSignalCatalogResponse> updateSignalCatalog({
    required String name,
    String? description,
    List<Node>? nodesToAdd,
    List<String>? nodesToRemove,
    List<Node>? nodesToUpdate,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.UpdateSignalCatalog'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
        if (nodesToAdd != null) 'nodesToAdd': nodesToAdd,
        if (nodesToRemove != null) 'nodesToRemove': nodesToRemove,
        if (nodesToUpdate != null) 'nodesToUpdate': nodesToUpdate,
      },
    );

    return UpdateSignalCatalogResponse.fromJson(jsonResponse.body);
  }

  /// Updates a vehicle.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [vehicleName] :
  /// The unique ID of the vehicle to update.
  ///
  /// Parameter [attributeUpdateMode] :
  /// The method the specified attributes will update the existing attributes on
  /// the vehicle. Use<code>Overwite</code> to replace the vehicle attributes
  /// with the specified attributes. Or use <code>Merge</code> to combine all
  /// attributes.
  ///
  /// This is required if attributes are present in the input.
  ///
  /// Parameter [attributes] :
  /// Static information about a vehicle in a key-value pair. For example:
  ///
  /// <code>"engineType"</code> : <code>"1.3 L R2"</code>
  ///
  /// Parameter [decoderManifestArn] :
  /// The ARN of the decoder manifest associated with this vehicle.
  ///
  /// Parameter [modelManifestArn] :
  /// The ARN of a vehicle model (model manifest) associated with the vehicle.
  Future<UpdateVehicleResponse> updateVehicle({
    required String vehicleName,
    UpdateMode? attributeUpdateMode,
    Map<String, String>? attributes,
    String? decoderManifestArn,
    String? modelManifestArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'IoTAutobahnControlPlane.UpdateVehicle'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'vehicleName': vehicleName,
        if (attributeUpdateMode != null)
          'attributeUpdateMode': attributeUpdateMode.toValue(),
        if (attributes != null) 'attributes': attributes,
        if (decoderManifestArn != null)
          'decoderManifestArn': decoderManifestArn,
        if (modelManifestArn != null) 'modelManifestArn': modelManifestArn,
      },
    );

    return UpdateVehicleResponse.fromJson(jsonResponse.body);
  }
}

/// A signal that represents a vehicle device such as the engine, heater, and
/// door locks. Data from an actuator reports the state of a certain vehicle
/// device.
/// <note>
/// Updating actuator data can change the state of a device. For example, you
/// can turn on or off the heater by updating its actuator data.
/// </note>
class Actuator {
  /// The specified data type of the actuator.
  final NodeDataType dataType;

  /// The fully qualified name of the actuator. For example, the fully qualified
  /// name of an actuator might be <code>Vehicle.Front.Left.Door.Lock</code>.
  final String fullyQualifiedName;

  /// A list of possible values an actuator can take.
  final List<String>? allowedValues;

  /// A specified value for the actuator.
  final String? assignedValue;

  /// A comment in addition to the description.
  final String? comment;

  /// The deprecation message for the node or the branch that was moved or
  /// deleted.
  final String? deprecationMessage;

  /// A brief description of the actuator.
  final String? description;

  /// The specified possible maximum value of an actuator.
  final double? max;

  /// The specified possible minimum value of an actuator.
  final double? min;

  /// The fully qualified name of the struct node for the actuator if the data
  /// type of the actuator is <code>Struct</code> or <code>StructArray</code>. For
  /// example, the struct fully qualified name of an actuator might be
  /// <code>Vehicle.Door.LockStruct</code>.
  final String? structFullyQualifiedName;

  /// The scientific unit for the actuator.
  final String? unit;

  Actuator({
    required this.dataType,
    required this.fullyQualifiedName,
    this.allowedValues,
    this.assignedValue,
    this.comment,
    this.deprecationMessage,
    this.description,
    this.max,
    this.min,
    this.structFullyQualifiedName,
    this.unit,
  });

  factory Actuator.fromJson(Map<String, dynamic> json) {
    return Actuator(
      dataType: (json['dataType'] as String).toNodeDataType(),
      fullyQualifiedName: json['fullyQualifiedName'] as String,
      allowedValues: (json['allowedValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      assignedValue: json['assignedValue'] as String?,
      comment: json['comment'] as String?,
      deprecationMessage: json['deprecationMessage'] as String?,
      description: json['description'] as String?,
      max: json['max'] as double?,
      min: json['min'] as double?,
      structFullyQualifiedName: json['structFullyQualifiedName'] as String?,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final fullyQualifiedName = this.fullyQualifiedName;
    final allowedValues = this.allowedValues;
    final assignedValue = this.assignedValue;
    final comment = this.comment;
    final deprecationMessage = this.deprecationMessage;
    final description = this.description;
    final max = this.max;
    final min = this.min;
    final structFullyQualifiedName = this.structFullyQualifiedName;
    final unit = this.unit;
    return {
      'dataType': dataType.toValue(),
      'fullyQualifiedName': fullyQualifiedName,
      if (allowedValues != null) 'allowedValues': allowedValues,
      if (assignedValue != null) 'assignedValue': assignedValue,
      if (comment != null) 'comment': comment,
      if (deprecationMessage != null) 'deprecationMessage': deprecationMessage,
      if (description != null) 'description': description,
      if (max != null) 'max': max,
      if (min != null) 'min': min,
      if (structFullyQualifiedName != null)
        'structFullyQualifiedName': structFullyQualifiedName,
      if (unit != null) 'unit': unit,
    };
  }
}

class AssociateVehicleFleetResponse {
  AssociateVehicleFleetResponse();

  factory AssociateVehicleFleetResponse.fromJson(Map<String, dynamic> _) {
    return AssociateVehicleFleetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A signal that represents static information about the vehicle, such as
/// engine type or manufacturing date.
class Attribute {
  /// The specified data type of the attribute.
  final NodeDataType dataType;

  /// The fully qualified name of the attribute. For example, the fully qualified
  /// name of an attribute might be <code>Vehicle.Body.Engine.Type</code>.
  final String fullyQualifiedName;

  /// A list of possible values an attribute can be assigned.
  final List<String>? allowedValues;

  /// A specified value for the attribute.
  final String? assignedValue;

  /// A comment in addition to the description.
  final String? comment;

  /// The default value of the attribute.
  final String? defaultValue;

  /// The deprecation message for the node or the branch that was moved or
  /// deleted.
  final String? deprecationMessage;

  /// A brief description of the attribute.
  final String? description;

  /// The specified possible maximum value of the attribute.
  final double? max;

  /// The specified possible minimum value of the attribute.
  final double? min;

  /// The scientific unit for the attribute.
  final String? unit;

  Attribute({
    required this.dataType,
    required this.fullyQualifiedName,
    this.allowedValues,
    this.assignedValue,
    this.comment,
    this.defaultValue,
    this.deprecationMessage,
    this.description,
    this.max,
    this.min,
    this.unit,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      dataType: (json['dataType'] as String).toNodeDataType(),
      fullyQualifiedName: json['fullyQualifiedName'] as String,
      allowedValues: (json['allowedValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      assignedValue: json['assignedValue'] as String?,
      comment: json['comment'] as String?,
      defaultValue: json['defaultValue'] as String?,
      deprecationMessage: json['deprecationMessage'] as String?,
      description: json['description'] as String?,
      max: json['max'] as double?,
      min: json['min'] as double?,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final fullyQualifiedName = this.fullyQualifiedName;
    final allowedValues = this.allowedValues;
    final assignedValue = this.assignedValue;
    final comment = this.comment;
    final defaultValue = this.defaultValue;
    final deprecationMessage = this.deprecationMessage;
    final description = this.description;
    final max = this.max;
    final min = this.min;
    final unit = this.unit;
    return {
      'dataType': dataType.toValue(),
      'fullyQualifiedName': fullyQualifiedName,
      if (allowedValues != null) 'allowedValues': allowedValues,
      if (assignedValue != null) 'assignedValue': assignedValue,
      if (comment != null) 'comment': comment,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (deprecationMessage != null) 'deprecationMessage': deprecationMessage,
      if (description != null) 'description': description,
      if (max != null) 'max': max,
      if (min != null) 'min': min,
      if (unit != null) 'unit': unit,
    };
  }
}

class BatchCreateVehicleResponse {
  /// A list of information about creation errors, or an empty list if there
  /// aren't any errors.
  final List<CreateVehicleError>? errors;

  /// A list of information about a batch of created vehicles. For more
  /// information, see the API data type.
  final List<CreateVehicleResponseItem>? vehicles;

  BatchCreateVehicleResponse({
    this.errors,
    this.vehicles,
  });

  factory BatchCreateVehicleResponse.fromJson(Map<String, dynamic> json) {
    return BatchCreateVehicleResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => CreateVehicleError.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicles: (json['vehicles'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CreateVehicleResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final vehicles = this.vehicles;
    return {
      if (errors != null) 'errors': errors,
      if (vehicles != null) 'vehicles': vehicles,
    };
  }
}

class BatchUpdateVehicleResponse {
  /// A list of information about errors returned while updating a batch of
  /// vehicles, or, if there aren't any errors, an empty list.
  final List<UpdateVehicleError>? errors;

  /// A list of information about the batch of updated vehicles.
  /// <note>
  /// This list contains only unique IDs for the vehicles that were updated.
  /// </note>
  final List<UpdateVehicleResponseItem>? vehicles;

  BatchUpdateVehicleResponse({
    this.errors,
    this.vehicles,
  });

  factory BatchUpdateVehicleResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdateVehicleResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => UpdateVehicleError.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicles: (json['vehicles'] as List?)
          ?.whereNotNull()
          .map((e) =>
              UpdateVehicleResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final vehicles = this.vehicles;
    return {
      if (errors != null) 'errors': errors,
      if (vehicles != null) 'vehicles': vehicles,
    };
  }
}

/// A group of signals that are defined in a hierarchical structure.
class Branch {
  /// The fully qualified name of the branch. For example, the fully qualified
  /// name of a branch might be <code>Vehicle.Body.Engine</code>.
  final String fullyQualifiedName;

  /// A comment in addition to the description.
  final String? comment;

  /// The deprecation message for the node or the branch that was moved or
  /// deleted.
  final String? deprecationMessage;

  /// A brief description of the branch.
  final String? description;

  Branch({
    required this.fullyQualifiedName,
    this.comment,
    this.deprecationMessage,
    this.description,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      fullyQualifiedName: json['fullyQualifiedName'] as String,
      comment: json['comment'] as String?,
      deprecationMessage: json['deprecationMessage'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fullyQualifiedName = this.fullyQualifiedName;
    final comment = this.comment;
    final deprecationMessage = this.deprecationMessage;
    final description = this.description;
    return {
      'fullyQualifiedName': fullyQualifiedName,
      if (comment != null) 'comment': comment,
      if (deprecationMessage != null) 'deprecationMessage': deprecationMessage,
      if (description != null) 'description': description,
    };
  }
}

enum CampaignStatus {
  creating,
  waitingForApproval,
  running,
  suspended,
}

extension CampaignStatusValueExtension on CampaignStatus {
  String toValue() {
    switch (this) {
      case CampaignStatus.creating:
        return 'CREATING';
      case CampaignStatus.waitingForApproval:
        return 'WAITING_FOR_APPROVAL';
      case CampaignStatus.running:
        return 'RUNNING';
      case CampaignStatus.suspended:
        return 'SUSPENDED';
    }
  }
}

extension CampaignStatusFromString on String {
  CampaignStatus toCampaignStatus() {
    switch (this) {
      case 'CREATING':
        return CampaignStatus.creating;
      case 'WAITING_FOR_APPROVAL':
        return CampaignStatus.waitingForApproval;
      case 'RUNNING':
        return CampaignStatus.running;
      case 'SUSPENDED':
        return CampaignStatus.suspended;
    }
    throw Exception('$this is not known in enum CampaignStatus');
  }
}

/// Information about a campaign.
///
/// You can use the API operation to return this information about multiple
/// created campaigns.
class CampaignSummary {
  /// The time the campaign was created.
  final DateTime creationTime;

  /// The last time the campaign was modified.
  final DateTime lastModificationTime;

  /// The Amazon Resource Name (ARN) of a campaign.
  final String? arn;

  /// The description of the campaign.
  final String? description;

  /// The name of a campaign.
  final String? name;

  /// The ARN of the signal catalog associated with the campaign.
  final String? signalCatalogArn;

  /// The state of a campaign. The status can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - Amazon Web Services IoT FleetWise is processing your
  /// request to create the campaign.
  /// </li>
  /// <li>
  /// <code>WAITING_FOR_APPROVAL</code> - After a campaign is created, it enters
  /// the <code>WAITING_FOR_APPROVAL</code> state. To allow Amazon Web Services
  /// IoT FleetWise to deploy the campaign to the target vehicle or fleet, use the
  /// API operation to approve the campaign.
  /// </li>
  /// <li>
  /// <code>RUNNING</code> - The campaign is active.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code> - The campaign is suspended. To resume the campaign,
  /// use the API operation.
  /// </li>
  /// </ul>
  final CampaignStatus? status;

  /// The ARN of a vehicle or fleet to which the campaign is deployed.
  final String? targetArn;

  CampaignSummary({
    required this.creationTime,
    required this.lastModificationTime,
    this.arn,
    this.description,
    this.name,
    this.signalCatalogArn,
    this.status,
    this.targetArn,
  });

  factory CampaignSummary.fromJson(Map<String, dynamic> json) {
    return CampaignSummary(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      lastModificationTime:
          nonNullableTimeStampFromJson(json['lastModificationTime'] as Object),
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      signalCatalogArn: json['signalCatalogArn'] as String?,
      status: (json['status'] as String?)?.toCampaignStatus(),
      targetArn: json['targetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    final arn = this.arn;
    final description = this.description;
    final name = this.name;
    final signalCatalogArn = this.signalCatalogArn;
    final status = this.status;
    final targetArn = this.targetArn;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'lastModificationTime': unixTimestampToJson(lastModificationTime),
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (signalCatalogArn != null) 'signalCatalogArn': signalCatalogArn,
      if (status != null) 'status': status.toValue(),
      if (targetArn != null) 'targetArn': targetArn,
    };
  }
}

/// Configurations used to create a decoder manifest.
class CanDbcDefinition {
  /// A list of DBC files. You can upload only one DBC file for each network
  /// interface and specify up to five (inclusive) files in the list. The DBC file
  /// can be a maximum size of 200 MB.
  final List<Uint8List> canDbcFiles;

  /// Contains information about a network interface.
  final String networkInterface;

  /// Pairs every signal specified in your vehicle model with a signal decoder.
  final Map<String, String>? signalsMap;

  CanDbcDefinition({
    required this.canDbcFiles,
    required this.networkInterface,
    this.signalsMap,
  });

  Map<String, dynamic> toJson() {
    final canDbcFiles = this.canDbcFiles;
    final networkInterface = this.networkInterface;
    final signalsMap = this.signalsMap;
    return {
      'canDbcFiles': canDbcFiles.map(base64Encode).toList(),
      'networkInterface': networkInterface,
      if (signalsMap != null) 'signalsMap': signalsMap,
    };
  }
}

/// A single controller area network (CAN) device interface.
class CanInterface {
  /// The unique name of the interface.
  final String name;

  /// The name of the communication protocol for the interface.
  final String? protocolName;

  /// The version of the communication protocol for the interface.
  final String? protocolVersion;

  CanInterface({
    required this.name,
    this.protocolName,
    this.protocolVersion,
  });

  factory CanInterface.fromJson(Map<String, dynamic> json) {
    return CanInterface(
      name: json['name'] as String,
      protocolName: json['protocolName'] as String?,
      protocolVersion: json['protocolVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final protocolName = this.protocolName;
    final protocolVersion = this.protocolVersion;
    return {
      'name': name,
      if (protocolName != null) 'protocolName': protocolName,
      if (protocolVersion != null) 'protocolVersion': protocolVersion,
    };
  }
}

/// Information about a single controller area network (CAN) signal and the
/// messages it receives and transmits.
class CanSignal {
  /// A multiplier used to decode the CAN message.
  final double factor;

  /// Whether the byte ordering of a CAN message is big-endian.
  final bool isBigEndian;

  /// Whether the message data is specified as a signed value.
  final bool isSigned;

  /// How many bytes of data are in the message.
  final int length;

  /// The ID of the message.
  final int messageId;

  /// The offset used to calculate the signal value. Combined with factor, the
  /// calculation is <code>value = raw_value * factor + offset</code>.
  final double offset;

  /// Indicates the beginning of the CAN signal. This should always be the least
  /// significant bit (LSB).
  ///
  /// This value might be different from the value in a DBC file. For little
  /// endian signals, <code>startBit</code> is the same value as in the DBC file.
  /// For big endian signals in a DBC file, the start bit is the most significant
  /// bit (MSB). You will have to calculate the LSB instead and pass it as the
  /// <code>startBit</code>.
  final int startBit;

  /// The name of the signal.
  final String? name;

  CanSignal({
    required this.factor,
    required this.isBigEndian,
    required this.isSigned,
    required this.length,
    required this.messageId,
    required this.offset,
    required this.startBit,
    this.name,
  });

  factory CanSignal.fromJson(Map<String, dynamic> json) {
    return CanSignal(
      factor: json['factor'] as double,
      isBigEndian: json['isBigEndian'] as bool,
      isSigned: json['isSigned'] as bool,
      length: json['length'] as int,
      messageId: json['messageId'] as int,
      offset: json['offset'] as double,
      startBit: json['startBit'] as int,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final factor = this.factor;
    final isBigEndian = this.isBigEndian;
    final isSigned = this.isSigned;
    final length = this.length;
    final messageId = this.messageId;
    final offset = this.offset;
    final startBit = this.startBit;
    final name = this.name;
    return {
      'factor': factor,
      'isBigEndian': isBigEndian,
      'isSigned': isSigned,
      'length': length,
      'messageId': messageId,
      'offset': offset,
      'startBit': startBit,
      if (name != null) 'name': name,
    };
  }
}

/// The log delivery option to send data to Amazon CloudWatch Logs.
class CloudWatchLogDeliveryOptions {
  /// The type of log to send data to Amazon CloudWatch Logs.
  final LogType logType;

  /// The Amazon CloudWatch Logs group the operation sends data to.
  final String? logGroupName;

  CloudWatchLogDeliveryOptions({
    required this.logType,
    this.logGroupName,
  });

  factory CloudWatchLogDeliveryOptions.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogDeliveryOptions(
      logType: (json['logType'] as String).toLogType(),
      logGroupName: json['logGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logType = this.logType;
    final logGroupName = this.logGroupName;
    return {
      'logType': logType.toValue(),
      if (logGroupName != null) 'logGroupName': logGroupName,
    };
  }
}

/// Specifies what data to collect and how often or when to collect it.
class CollectionScheme {
  /// Information about a collection scheme that uses a simple logical expression
  /// to recognize what data to collect.
  final ConditionBasedCollectionScheme? conditionBasedCollectionScheme;

  /// Information about a collection scheme that uses a time period to decide how
  /// often to collect data.
  final TimeBasedCollectionScheme? timeBasedCollectionScheme;

  CollectionScheme({
    this.conditionBasedCollectionScheme,
    this.timeBasedCollectionScheme,
  });

  factory CollectionScheme.fromJson(Map<String, dynamic> json) {
    return CollectionScheme(
      conditionBasedCollectionScheme: json['conditionBasedCollectionScheme'] !=
              null
          ? ConditionBasedCollectionScheme.fromJson(
              json['conditionBasedCollectionScheme'] as Map<String, dynamic>)
          : null,
      timeBasedCollectionScheme: json['timeBasedCollectionScheme'] != null
          ? TimeBasedCollectionScheme.fromJson(
              json['timeBasedCollectionScheme'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final conditionBasedCollectionScheme = this.conditionBasedCollectionScheme;
    final timeBasedCollectionScheme = this.timeBasedCollectionScheme;
    return {
      if (conditionBasedCollectionScheme != null)
        'conditionBasedCollectionScheme': conditionBasedCollectionScheme,
      if (timeBasedCollectionScheme != null)
        'timeBasedCollectionScheme': timeBasedCollectionScheme,
    };
  }
}

enum Compression {
  off,
  snappy,
}

extension CompressionValueExtension on Compression {
  String toValue() {
    switch (this) {
      case Compression.off:
        return 'OFF';
      case Compression.snappy:
        return 'SNAPPY';
    }
  }
}

extension CompressionFromString on String {
  Compression toCompression() {
    switch (this) {
      case 'OFF':
        return Compression.off;
      case 'SNAPPY':
        return Compression.snappy;
    }
    throw Exception('$this is not known in enum Compression');
  }
}

/// Information about a collection scheme that uses a simple logical expression
/// to recognize what data to collect.
class ConditionBasedCollectionScheme {
  /// The logical expression used to recognize what data to collect. For example,
  /// <code>$variable.`Vehicle.OutsideAirTemperature` &gt;= 105.0</code>.
  final String expression;

  /// Specifies the version of the conditional expression language.
  final int? conditionLanguageVersion;

  /// The minimum duration of time between two triggering events to collect data,
  /// in milliseconds.
  /// <note>
  /// If a signal changes often, you might want to collect data at a slower rate.
  /// </note>
  final int? minimumTriggerIntervalMs;

  /// Whether to collect data for all triggering events (<code>ALWAYS</code>).
  /// Specify (<code>RISING_EDGE</code>), or specify only when the condition first
  /// evaluates to false. For example, triggering on "AirbagDeployed"; Users
  /// aren't interested on triggering when the airbag is already exploded; they
  /// only care about the change from not deployed =&gt; deployed.
  final TriggerMode? triggerMode;

  ConditionBasedCollectionScheme({
    required this.expression,
    this.conditionLanguageVersion,
    this.minimumTriggerIntervalMs,
    this.triggerMode,
  });

  factory ConditionBasedCollectionScheme.fromJson(Map<String, dynamic> json) {
    return ConditionBasedCollectionScheme(
      expression: json['expression'] as String,
      conditionLanguageVersion: json['conditionLanguageVersion'] as int?,
      minimumTriggerIntervalMs: json['minimumTriggerIntervalMs'] as int?,
      triggerMode: (json['triggerMode'] as String?)?.toTriggerMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final conditionLanguageVersion = this.conditionLanguageVersion;
    final minimumTriggerIntervalMs = this.minimumTriggerIntervalMs;
    final triggerMode = this.triggerMode;
    return {
      'expression': expression,
      if (conditionLanguageVersion != null)
        'conditionLanguageVersion': conditionLanguageVersion,
      if (minimumTriggerIntervalMs != null)
        'minimumTriggerIntervalMs': minimumTriggerIntervalMs,
      if (triggerMode != null) 'triggerMode': triggerMode.toValue(),
    };
  }
}

class CreateCampaignResponse {
  /// The ARN of the created campaign.
  final String? arn;

  /// The name of the created campaign.
  final String? name;

  CreateCampaignResponse({
    this.arn,
    this.name,
  });

  factory CreateCampaignResponse.fromJson(Map<String, dynamic> json) {
    return CreateCampaignResponse(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
    };
  }
}

class CreateDecoderManifestResponse {
  /// The ARN of the created decoder manifest.
  final String arn;

  /// The name of the created decoder manifest.
  final String name;

  CreateDecoderManifestResponse({
    required this.arn,
    required this.name,
  });

  factory CreateDecoderManifestResponse.fromJson(Map<String, dynamic> json) {
    return CreateDecoderManifestResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      'arn': arn,
      'name': name,
    };
  }
}

class CreateFleetResponse {
  /// The ARN of the created fleet.
  final String arn;

  /// The ID of the created fleet.
  final String id;

  CreateFleetResponse({
    required this.arn,
    required this.id,
  });

  factory CreateFleetResponse.fromJson(Map<String, dynamic> json) {
    return CreateFleetResponse(
      arn: json['arn'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      'arn': arn,
      'id': id,
    };
  }
}

class CreateModelManifestResponse {
  /// The ARN of the created vehicle model.
  final String arn;

  /// The name of the created vehicle model.
  final String name;

  CreateModelManifestResponse({
    required this.arn,
    required this.name,
  });

  factory CreateModelManifestResponse.fromJson(Map<String, dynamic> json) {
    return CreateModelManifestResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      'arn': arn,
      'name': name,
    };
  }
}

class CreateSignalCatalogResponse {
  /// The ARN of the created signal catalog.
  final String arn;

  /// The name of the created signal catalog.
  final String name;

  CreateSignalCatalogResponse({
    required this.arn,
    required this.name,
  });

  factory CreateSignalCatalogResponse.fromJson(Map<String, dynamic> json) {
    return CreateSignalCatalogResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      'arn': arn,
      'name': name,
    };
  }
}

/// An HTTP error resulting from creating a vehicle.
class CreateVehicleError {
  /// An HTTP error code.
  final String? code;

  /// A description of the HTTP error.
  final String? message;

  /// The ID of the vehicle with the error.
  final String? vehicleName;

  CreateVehicleError({
    this.code,
    this.message,
    this.vehicleName,
  });

  factory CreateVehicleError.fromJson(Map<String, dynamic> json) {
    return CreateVehicleError(
      code: json['code'] as String?,
      message: json['message'] as String?,
      vehicleName: json['vehicleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final vehicleName = this.vehicleName;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
      if (vehicleName != null) 'vehicleName': vehicleName,
    };
  }
}

/// Information about the vehicle to create.
class CreateVehicleRequestItem {
  /// The Amazon Resource Name (ARN) of a decoder manifest associated with the
  /// vehicle to create.
  final String decoderManifestArn;

  /// The ARN of the vehicle model (model manifest) to create the vehicle from.
  final String modelManifestArn;

  /// The unique ID of the vehicle to create.
  final String vehicleName;

  /// An option to create a new Amazon Web Services IoT thing when creating a
  /// vehicle, or to validate an existing thing as a vehicle.
  final VehicleAssociationBehavior? associationBehavior;

  /// Static information about a vehicle in a key-value pair. For example:
  /// <code>"engine Type"</code> : <code>"v6"</code>
  final Map<String, String>? attributes;

  /// Metadata which can be used to manage the vehicle.
  final List<Tag>? tags;

  CreateVehicleRequestItem({
    required this.decoderManifestArn,
    required this.modelManifestArn,
    required this.vehicleName,
    this.associationBehavior,
    this.attributes,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final decoderManifestArn = this.decoderManifestArn;
    final modelManifestArn = this.modelManifestArn;
    final vehicleName = this.vehicleName;
    final associationBehavior = this.associationBehavior;
    final attributes = this.attributes;
    final tags = this.tags;
    return {
      'decoderManifestArn': decoderManifestArn,
      'modelManifestArn': modelManifestArn,
      'vehicleName': vehicleName,
      if (associationBehavior != null)
        'associationBehavior': associationBehavior.toValue(),
      if (attributes != null) 'attributes': attributes,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateVehicleResponse {
  /// The ARN of the created vehicle.
  final String? arn;

  /// The ARN of a created or validated Amazon Web Services IoT thing.
  final String? thingArn;

  /// The unique ID of the created vehicle.
  final String? vehicleName;

  CreateVehicleResponse({
    this.arn,
    this.thingArn,
    this.vehicleName,
  });

  factory CreateVehicleResponse.fromJson(Map<String, dynamic> json) {
    return CreateVehicleResponse(
      arn: json['arn'] as String?,
      thingArn: json['thingArn'] as String?,
      vehicleName: json['vehicleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final thingArn = this.thingArn;
    final vehicleName = this.vehicleName;
    return {
      if (arn != null) 'arn': arn,
      if (thingArn != null) 'thingArn': thingArn,
      if (vehicleName != null) 'vehicleName': vehicleName,
    };
  }
}

/// Information about a created vehicle.
class CreateVehicleResponseItem {
  /// The ARN of the created vehicle.
  final String? arn;

  /// The ARN of a created or validated Amazon Web Services IoT thing.
  final String? thingArn;

  /// The unique ID of the vehicle to create.
  final String? vehicleName;

  CreateVehicleResponseItem({
    this.arn,
    this.thingArn,
    this.vehicleName,
  });

  factory CreateVehicleResponseItem.fromJson(Map<String, dynamic> json) {
    return CreateVehicleResponseItem(
      arn: json['arn'] as String?,
      thingArn: json['thingArn'] as String?,
      vehicleName: json['vehicleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final thingArn = this.thingArn;
    final vehicleName = this.vehicleName;
    return {
      if (arn != null) 'arn': arn,
      if (thingArn != null) 'thingArn': thingArn,
      if (vehicleName != null) 'vehicleName': vehicleName,
    };
  }
}

/// Represents a member of the complex data structure. The data type of the
/// property can be either primitive or another <code>struct</code>.
class CustomProperty {
  /// The data type for the custom property.
  final NodeDataType dataType;

  /// The fully qualified name of the custom property. For example, the fully
  /// qualified name of a custom property might be
  /// <code>ComplexDataTypes.VehicleDataTypes.SVMCamera.FPS</code>.
  final String fullyQualifiedName;

  /// A comment in addition to the description.
  final String? comment;

  /// Indicates whether the property is binary data.
  final NodeDataEncoding? dataEncoding;

  /// The deprecation message for the node or the branch that was moved or
  /// deleted.
  final String? deprecationMessage;

  /// A brief description of the custom property.
  final String? description;

  /// The fully qualified name of the struct node for the custom property if the
  /// data type of the custom property is <code>Struct</code> or
  /// <code>StructArray</code>.
  final String? structFullyQualifiedName;

  CustomProperty({
    required this.dataType,
    required this.fullyQualifiedName,
    this.comment,
    this.dataEncoding,
    this.deprecationMessage,
    this.description,
    this.structFullyQualifiedName,
  });

  factory CustomProperty.fromJson(Map<String, dynamic> json) {
    return CustomProperty(
      dataType: (json['dataType'] as String).toNodeDataType(),
      fullyQualifiedName: json['fullyQualifiedName'] as String,
      comment: json['comment'] as String?,
      dataEncoding: (json['dataEncoding'] as String?)?.toNodeDataEncoding(),
      deprecationMessage: json['deprecationMessage'] as String?,
      description: json['description'] as String?,
      structFullyQualifiedName: json['structFullyQualifiedName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final fullyQualifiedName = this.fullyQualifiedName;
    final comment = this.comment;
    final dataEncoding = this.dataEncoding;
    final deprecationMessage = this.deprecationMessage;
    final description = this.description;
    final structFullyQualifiedName = this.structFullyQualifiedName;
    return {
      'dataType': dataType.toValue(),
      'fullyQualifiedName': fullyQualifiedName,
      if (comment != null) 'comment': comment,
      if (dataEncoding != null) 'dataEncoding': dataEncoding.toValue(),
      if (deprecationMessage != null) 'deprecationMessage': deprecationMessage,
      if (description != null) 'description': description,
      if (structFullyQualifiedName != null)
        'structFullyQualifiedName': structFullyQualifiedName,
    };
  }
}

/// The custom structure represents a complex or higher-order data structure.
class CustomStruct {
  /// The fully qualified name of the custom structure. For example, the fully
  /// qualified name of a custom structure might be
  /// <code>ComplexDataTypes.VehicleDataTypes.SVMCamera</code>.
  final String fullyQualifiedName;

  /// A comment in addition to the description.
  final String? comment;

  /// The deprecation message for the node or the branch that was moved or
  /// deleted.
  final String? deprecationMessage;

  /// A brief description of the custom structure.
  final String? description;

  CustomStruct({
    required this.fullyQualifiedName,
    this.comment,
    this.deprecationMessage,
    this.description,
  });

  factory CustomStruct.fromJson(Map<String, dynamic> json) {
    return CustomStruct(
      fullyQualifiedName: json['fullyQualifiedName'] as String,
      comment: json['comment'] as String?,
      deprecationMessage: json['deprecationMessage'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fullyQualifiedName = this.fullyQualifiedName;
    final comment = this.comment;
    final deprecationMessage = this.deprecationMessage;
    final description = this.description;
    return {
      'fullyQualifiedName': fullyQualifiedName,
      if (comment != null) 'comment': comment,
      if (deprecationMessage != null) 'deprecationMessage': deprecationMessage,
      if (description != null) 'description': description,
    };
  }
}

/// The destination where the Amazon Web Services IoT FleetWise campaign sends
/// data. You can send data to be stored in Amazon S3 or Amazon Timestream.
class DataDestinationConfig {
  /// The Amazon S3 bucket where the Amazon Web Services IoT FleetWise campaign
  /// sends data.
  final S3Config? s3Config;

  /// The Amazon Timestream table where the campaign sends data.
  final TimestreamConfig? timestreamConfig;

  DataDestinationConfig({
    this.s3Config,
    this.timestreamConfig,
  });

  factory DataDestinationConfig.fromJson(Map<String, dynamic> json) {
    return DataDestinationConfig(
      s3Config: json['s3Config'] != null
          ? S3Config.fromJson(json['s3Config'] as Map<String, dynamic>)
          : null,
      timestreamConfig: json['timestreamConfig'] != null
          ? TimestreamConfig.fromJson(
              json['timestreamConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Config = this.s3Config;
    final timestreamConfig = this.timestreamConfig;
    return {
      if (s3Config != null) 's3Config': s3Config,
      if (timestreamConfig != null) 'timestreamConfig': timestreamConfig,
    };
  }
}

enum DataFormat {
  json,
  parquet,
}

extension DataFormatValueExtension on DataFormat {
  String toValue() {
    switch (this) {
      case DataFormat.json:
        return 'JSON';
      case DataFormat.parquet:
        return 'PARQUET';
    }
  }
}

extension DataFormatFromString on String {
  DataFormat toDataFormat() {
    switch (this) {
      case 'JSON':
        return DataFormat.json;
      case 'PARQUET':
        return DataFormat.parquet;
    }
    throw Exception('$this is not known in enum DataFormat');
  }
}

/// Information about a created decoder manifest. You can use the API operation
/// to return this information about multiple decoder manifests.
class DecoderManifestSummary {
  /// The time the decoder manifest was created in seconds since epoch (January 1,
  /// 1970 at midnight UTC time).
  final DateTime creationTime;

  /// The time the decoder manifest was last updated in seconds since epoch
  /// (January 1, 1970 at midnight UTC time).
  final DateTime lastModificationTime;

  /// The ARN of a vehicle model (model manifest) associated with the decoder
  /// manifest.
  final String? arn;

  /// A brief description of the decoder manifest.
  final String? description;

  /// The detailed message for the decoder manifest. When a decoder manifest is in
  /// an <code>INVALID</code> status, the message contains detailed reason and
  /// help information.
  final String? message;

  /// The ARN of a vehicle model (model manifest) associated with the decoder
  /// manifest.
  final String? modelManifestArn;

  /// The name of the decoder manifest.
  final String? name;

  /// The state of the decoder manifest. If the status is <code>ACTIVE</code>, the
  /// decoder manifest can't be edited. If the status is marked
  /// <code>DRAFT</code>, you can edit the decoder manifest.
  final ManifestStatus? status;

  DecoderManifestSummary({
    required this.creationTime,
    required this.lastModificationTime,
    this.arn,
    this.description,
    this.message,
    this.modelManifestArn,
    this.name,
    this.status,
  });

  factory DecoderManifestSummary.fromJson(Map<String, dynamic> json) {
    return DecoderManifestSummary(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      lastModificationTime:
          nonNullableTimeStampFromJson(json['lastModificationTime'] as Object),
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      message: json['message'] as String?,
      modelManifestArn: json['modelManifestArn'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toManifestStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    final arn = this.arn;
    final description = this.description;
    final message = this.message;
    final modelManifestArn = this.modelManifestArn;
    final name = this.name;
    final status = this.status;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'lastModificationTime': unixTimestampToJson(lastModificationTime),
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (message != null) 'message': message,
      if (modelManifestArn != null) 'modelManifestArn': modelManifestArn,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class DeleteCampaignResponse {
  /// The Amazon Resource Name (ARN) of the deleted campaign.
  /// <note>
  /// The ARN isn’t returned if a campaign doesn’t exist.
  /// </note>
  final String? arn;

  /// The name of the deleted campaign.
  final String? name;

  DeleteCampaignResponse({
    this.arn,
    this.name,
  });

  factory DeleteCampaignResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCampaignResponse(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
    };
  }
}

class DeleteDecoderManifestResponse {
  /// The Amazon Resource Name (ARN) of the deleted decoder manifest.
  final String arn;

  /// The name of the deleted decoder manifest.
  final String name;

  DeleteDecoderManifestResponse({
    required this.arn,
    required this.name,
  });

  factory DeleteDecoderManifestResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDecoderManifestResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      'arn': arn,
      'name': name,
    };
  }
}

class DeleteFleetResponse {
  /// The Amazon Resource Name (ARN) of the deleted fleet.
  final String? arn;

  /// The ID of the deleted fleet.
  final String? id;

  DeleteFleetResponse({
    this.arn,
    this.id,
  });

  factory DeleteFleetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFleetResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
    };
  }
}

class DeleteModelManifestResponse {
  /// The Amazon Resource Name (ARN) of the deleted model manifest.
  final String arn;

  /// The name of the deleted model manifest.
  final String name;

  DeleteModelManifestResponse({
    required this.arn,
    required this.name,
  });

  factory DeleteModelManifestResponse.fromJson(Map<String, dynamic> json) {
    return DeleteModelManifestResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      'arn': arn,
      'name': name,
    };
  }
}

class DeleteSignalCatalogResponse {
  /// The Amazon Resource Name (ARN) of the deleted signal catalog.
  final String arn;

  /// The name of the deleted signal catalog.
  final String name;

  DeleteSignalCatalogResponse({
    required this.arn,
    required this.name,
  });

  factory DeleteSignalCatalogResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSignalCatalogResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      'arn': arn,
      'name': name,
    };
  }
}

class DeleteVehicleResponse {
  /// The Amazon Resource Name (ARN) of the deleted vehicle.
  final String arn;

  /// The ID of the deleted vehicle.
  final String vehicleName;

  DeleteVehicleResponse({
    required this.arn,
    required this.vehicleName,
  });

  factory DeleteVehicleResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVehicleResponse(
      arn: json['arn'] as String,
      vehicleName: json['vehicleName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final vehicleName = this.vehicleName;
    return {
      'arn': arn,
      'vehicleName': vehicleName,
    };
  }
}

enum DiagnosticsMode {
  off,
  sendActiveDtcs,
}

extension DiagnosticsModeValueExtension on DiagnosticsMode {
  String toValue() {
    switch (this) {
      case DiagnosticsMode.off:
        return 'OFF';
      case DiagnosticsMode.sendActiveDtcs:
        return 'SEND_ACTIVE_DTCS';
    }
  }
}

extension DiagnosticsModeFromString on String {
  DiagnosticsMode toDiagnosticsMode() {
    switch (this) {
      case 'OFF':
        return DiagnosticsMode.off;
      case 'SEND_ACTIVE_DTCS':
        return DiagnosticsMode.sendActiveDtcs;
    }
    throw Exception('$this is not known in enum DiagnosticsMode');
  }
}

class DisassociateVehicleFleetResponse {
  DisassociateVehicleFleetResponse();

  factory DisassociateVehicleFleetResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateVehicleFleetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum EncryptionStatus {
  pending,
  success,
  failure,
}

extension EncryptionStatusValueExtension on EncryptionStatus {
  String toValue() {
    switch (this) {
      case EncryptionStatus.pending:
        return 'PENDING';
      case EncryptionStatus.success:
        return 'SUCCESS';
      case EncryptionStatus.failure:
        return 'FAILURE';
    }
  }
}

extension EncryptionStatusFromString on String {
  EncryptionStatus toEncryptionStatus() {
    switch (this) {
      case 'PENDING':
        return EncryptionStatus.pending;
      case 'SUCCESS':
        return EncryptionStatus.success;
      case 'FAILURE':
        return EncryptionStatus.failure;
    }
    throw Exception('$this is not known in enum EncryptionStatus');
  }
}

enum EncryptionType {
  kmsBasedEncryption,
  fleetwiseDefaultEncryption,
}

extension EncryptionTypeValueExtension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.kmsBasedEncryption:
        return 'KMS_BASED_ENCRYPTION';
      case EncryptionType.fleetwiseDefaultEncryption:
        return 'FLEETWISE_DEFAULT_ENCRYPTION';
    }
  }
}

extension EncryptionTypeFromString on String {
  EncryptionType toEncryptionType() {
    switch (this) {
      case 'KMS_BASED_ENCRYPTION':
        return EncryptionType.kmsBasedEncryption;
      case 'FLEETWISE_DEFAULT_ENCRYPTION':
        return EncryptionType.fleetwiseDefaultEncryption;
    }
    throw Exception('$this is not known in enum EncryptionType');
  }
}

/// Information about a fleet.
///
/// You can use the API operation to return this information about multiple
/// fleets.
class FleetSummary {
  /// The Amazon Resource Name (ARN) of the fleet.
  final String arn;

  /// The time the fleet was created, in seconds since epoch (January 1, 1970 at
  /// midnight UTC time).
  final DateTime creationTime;

  /// The unique ID of the fleet.
  final String id;

  /// The ARN of the signal catalog associated with the fleet.
  final String signalCatalogArn;

  /// A brief description of the fleet.
  final String? description;

  /// The time the fleet was last updated in seconds since epoch (January 1, 1970
  /// at midnight UTC time).
  final DateTime? lastModificationTime;

  FleetSummary({
    required this.arn,
    required this.creationTime,
    required this.id,
    required this.signalCatalogArn,
    this.description,
    this.lastModificationTime,
  });

  factory FleetSummary.fromJson(Map<String, dynamic> json) {
    return FleetSummary(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      signalCatalogArn: json['signalCatalogArn'] as String,
      description: json['description'] as String?,
      lastModificationTime: timeStampFromJson(json['lastModificationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final signalCatalogArn = this.signalCatalogArn;
    final description = this.description;
    final lastModificationTime = this.lastModificationTime;
    return {
      'arn': arn,
      'creationTime': unixTimestampToJson(creationTime),
      'id': id,
      'signalCatalogArn': signalCatalogArn,
      if (description != null) 'description': description,
      if (lastModificationTime != null)
        'lastModificationTime': unixTimestampToJson(lastModificationTime),
    };
  }
}

/// <a
/// href="https://www.w3.org/auto/wg/wiki/Vehicle_Signal_Specification_(VSS)/Vehicle_Data_Spec">Vehicle
/// Signal Specification (VSS)</a> is a precise language used to describe and
/// model signals in vehicle networks. The JSON file collects signal
/// specificiations in a VSS format.
class FormattedVss {
  /// Provides the VSS in JSON format.
  final String? vssJson;

  FormattedVss({
    this.vssJson,
  });

  Map<String, dynamic> toJson() {
    final vssJson = this.vssJson;
    return {
      if (vssJson != null) 'vssJson': vssJson,
    };
  }
}

class GetCampaignResponse {
  /// The Amazon Resource Name (ARN) of the campaign.
  final String? arn;

  /// Information about the data collection scheme associated with the campaign.
  final CollectionScheme? collectionScheme;

  /// Whether to compress signals before transmitting data to Amazon Web Services
  /// IoT FleetWise. If <code>OFF</code> is specified, the signals aren't
  /// compressed. If it's not specified, <code>SNAPPY</code> is used.
  final Compression? compression;

  /// The time the campaign was created in seconds since epoch (January 1, 1970 at
  /// midnight UTC time).
  final DateTime? creationTime;

  /// The destination where the campaign sends data. You can choose to send data
  /// to be stored in Amazon S3 or Amazon Timestream.
  ///
  /// Amazon S3 optimizes the cost of data storage and provides additional
  /// mechanisms to use vehicle data, such as data lakes, centralized data
  /// storage, data processing pipelines, and analytics.
  ///
  /// You can use Amazon Timestream to access and analyze time series data, and
  /// Timestream to query vehicle data so that you can identify trends and
  /// patterns.
  final List<DataDestinationConfig>? dataDestinationConfigs;

  /// A list of vehicle attributes associated with the campaign.
  final List<String>? dataExtraDimensions;

  /// The description of the campaign.
  final String? description;

  /// Option for a vehicle to send diagnostic trouble codes to Amazon Web Services
  /// IoT FleetWise.
  final DiagnosticsMode? diagnosticsMode;

  /// The time the campaign expires, in seconds since epoch (January 1, 1970 at
  /// midnight UTC time). Vehicle data won't be collected after the campaign
  /// expires.
  final DateTime? expiryTime;

  /// The last time the campaign was modified.
  final DateTime? lastModificationTime;

  /// The name of the campaign.
  final String? name;

  /// How long (in seconds) to collect raw data after a triggering event initiates
  /// the collection.
  final int? postTriggerCollectionDuration;

  /// A number indicating the priority of one campaign over another campaign for a
  /// certain vehicle or fleet. A campaign with the lowest value is deployed to
  /// vehicles before any other campaigns.
  final int? priority;

  /// The ARN of a signal catalog.
  final String? signalCatalogArn;

  /// Information about a list of signals to collect data on.
  final List<SignalInformation>? signalsToCollect;

  /// Whether to store collected data after a vehicle lost a connection with the
  /// cloud. After a connection is re-established, the data is automatically
  /// forwarded to Amazon Web Services IoT FleetWise.
  final SpoolingMode? spoolingMode;

  /// The time, in milliseconds, to deliver a campaign after it was approved.
  final DateTime? startTime;

  /// The state of the campaign. The status can be one of: <code>CREATING</code>,
  /// <code>WAITING_FOR_APPROVAL</code>, <code>RUNNING</code>, and
  /// <code>SUSPENDED</code>.
  final CampaignStatus? status;

  /// The ARN of the vehicle or the fleet targeted by the campaign.
  final String? targetArn;

  GetCampaignResponse({
    this.arn,
    this.collectionScheme,
    this.compression,
    this.creationTime,
    this.dataDestinationConfigs,
    this.dataExtraDimensions,
    this.description,
    this.diagnosticsMode,
    this.expiryTime,
    this.lastModificationTime,
    this.name,
    this.postTriggerCollectionDuration,
    this.priority,
    this.signalCatalogArn,
    this.signalsToCollect,
    this.spoolingMode,
    this.startTime,
    this.status,
    this.targetArn,
  });

  factory GetCampaignResponse.fromJson(Map<String, dynamic> json) {
    return GetCampaignResponse(
      arn: json['arn'] as String?,
      collectionScheme: json['collectionScheme'] != null
          ? CollectionScheme.fromJson(
              json['collectionScheme'] as Map<String, dynamic>)
          : null,
      compression: (json['compression'] as String?)?.toCompression(),
      creationTime: timeStampFromJson(json['creationTime']),
      dataDestinationConfigs: (json['dataDestinationConfigs'] as List?)
          ?.whereNotNull()
          .map((e) => DataDestinationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataExtraDimensions: (json['dataExtraDimensions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      diagnosticsMode:
          (json['diagnosticsMode'] as String?)?.toDiagnosticsMode(),
      expiryTime: timeStampFromJson(json['expiryTime']),
      lastModificationTime: timeStampFromJson(json['lastModificationTime']),
      name: json['name'] as String?,
      postTriggerCollectionDuration:
          json['postTriggerCollectionDuration'] as int?,
      priority: json['priority'] as int?,
      signalCatalogArn: json['signalCatalogArn'] as String?,
      signalsToCollect: (json['signalsToCollect'] as List?)
          ?.whereNotNull()
          .map((e) => SignalInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      spoolingMode: (json['spoolingMode'] as String?)?.toSpoolingMode(),
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toCampaignStatus(),
      targetArn: json['targetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collectionScheme = this.collectionScheme;
    final compression = this.compression;
    final creationTime = this.creationTime;
    final dataDestinationConfigs = this.dataDestinationConfigs;
    final dataExtraDimensions = this.dataExtraDimensions;
    final description = this.description;
    final diagnosticsMode = this.diagnosticsMode;
    final expiryTime = this.expiryTime;
    final lastModificationTime = this.lastModificationTime;
    final name = this.name;
    final postTriggerCollectionDuration = this.postTriggerCollectionDuration;
    final priority = this.priority;
    final signalCatalogArn = this.signalCatalogArn;
    final signalsToCollect = this.signalsToCollect;
    final spoolingMode = this.spoolingMode;
    final startTime = this.startTime;
    final status = this.status;
    final targetArn = this.targetArn;
    return {
      if (arn != null) 'arn': arn,
      if (collectionScheme != null) 'collectionScheme': collectionScheme,
      if (compression != null) 'compression': compression.toValue(),
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (dataDestinationConfigs != null)
        'dataDestinationConfigs': dataDestinationConfigs,
      if (dataExtraDimensions != null)
        'dataExtraDimensions': dataExtraDimensions,
      if (description != null) 'description': description,
      if (diagnosticsMode != null) 'diagnosticsMode': diagnosticsMode.toValue(),
      if (expiryTime != null) 'expiryTime': unixTimestampToJson(expiryTime),
      if (lastModificationTime != null)
        'lastModificationTime': unixTimestampToJson(lastModificationTime),
      if (name != null) 'name': name,
      if (postTriggerCollectionDuration != null)
        'postTriggerCollectionDuration': postTriggerCollectionDuration,
      if (priority != null) 'priority': priority,
      if (signalCatalogArn != null) 'signalCatalogArn': signalCatalogArn,
      if (signalsToCollect != null) 'signalsToCollect': signalsToCollect,
      if (spoolingMode != null) 'spoolingMode': spoolingMode.toValue(),
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (targetArn != null) 'targetArn': targetArn,
    };
  }
}

class GetDecoderManifestResponse {
  /// The Amazon Resource Name (ARN) of the decoder manifest.
  final String arn;

  /// The time the decoder manifest was created in seconds since epoch (January 1,
  /// 1970 at midnight UTC time).
  final DateTime creationTime;

  /// The time the decoder manifest was last updated in seconds since epoch
  /// (January 1, 1970 at midnight UTC time).
  final DateTime lastModificationTime;

  /// The name of the decoder manifest.
  final String name;

  /// A brief description of the decoder manifest.
  final String? description;

  /// The detailed message for the decoder manifest. When a decoder manifest is in
  /// an <code>INVALID</code> status, the message contains detailed reason and
  /// help information.
  final String? message;

  /// The ARN of a vehicle model (model manifest) associated with the decoder
  /// manifest.
  final String? modelManifestArn;

  /// The state of the decoder manifest. If the status is <code>ACTIVE</code>, the
  /// decoder manifest can't be edited. If the status is marked
  /// <code>DRAFT</code>, you can edit the decoder manifest.
  final ManifestStatus? status;

  GetDecoderManifestResponse({
    required this.arn,
    required this.creationTime,
    required this.lastModificationTime,
    required this.name,
    this.description,
    this.message,
    this.modelManifestArn,
    this.status,
  });

  factory GetDecoderManifestResponse.fromJson(Map<String, dynamic> json) {
    return GetDecoderManifestResponse(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      lastModificationTime:
          nonNullableTimeStampFromJson(json['lastModificationTime'] as Object),
      name: json['name'] as String,
      description: json['description'] as String?,
      message: json['message'] as String?,
      modelManifestArn: json['modelManifestArn'] as String?,
      status: (json['status'] as String?)?.toManifestStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    final name = this.name;
    final description = this.description;
    final message = this.message;
    final modelManifestArn = this.modelManifestArn;
    final status = this.status;
    return {
      'arn': arn,
      'creationTime': unixTimestampToJson(creationTime),
      'lastModificationTime': unixTimestampToJson(lastModificationTime),
      'name': name,
      if (description != null) 'description': description,
      if (message != null) 'message': message,
      if (modelManifestArn != null) 'modelManifestArn': modelManifestArn,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetEncryptionConfigurationResponse {
  /// The encryption status.
  final EncryptionStatus encryptionStatus;

  /// The type of encryption. Set to <code>KMS_BASED_ENCRYPTION</code> to use a
  /// KMS key that you own and manage. Set to
  /// <code>FLEETWISE_DEFAULT_ENCRYPTION</code> to use an Amazon Web Services
  /// managed key that is owned by the Amazon Web Services IoT FleetWise service
  /// account.
  final EncryptionType encryptionType;

  /// The time when encryption was configured in seconds since epoch (January 1,
  /// 1970 at midnight UTC time).
  final DateTime? creationTime;

  /// The error message that describes why encryption settings couldn't be
  /// configured, if applicable.
  final String? errorMessage;

  /// The ID of the KMS key that is used for encryption.
  final String? kmsKeyId;

  /// The time when encryption was last updated in seconds since epoch (January 1,
  /// 1970 at midnight UTC time).
  final DateTime? lastModificationTime;

  GetEncryptionConfigurationResponse({
    required this.encryptionStatus,
    required this.encryptionType,
    this.creationTime,
    this.errorMessage,
    this.kmsKeyId,
    this.lastModificationTime,
  });

  factory GetEncryptionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEncryptionConfigurationResponse(
      encryptionStatus:
          (json['encryptionStatus'] as String).toEncryptionStatus(),
      encryptionType: (json['encryptionType'] as String).toEncryptionType(),
      creationTime: timeStampFromJson(json['creationTime']),
      errorMessage: json['errorMessage'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      lastModificationTime: timeStampFromJson(json['lastModificationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionStatus = this.encryptionStatus;
    final encryptionType = this.encryptionType;
    final creationTime = this.creationTime;
    final errorMessage = this.errorMessage;
    final kmsKeyId = this.kmsKeyId;
    final lastModificationTime = this.lastModificationTime;
    return {
      'encryptionStatus': encryptionStatus.toValue(),
      'encryptionType': encryptionType.toValue(),
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (lastModificationTime != null)
        'lastModificationTime': unixTimestampToJson(lastModificationTime),
    };
  }
}

class GetFleetResponse {
  /// The Amazon Resource Name (ARN) of the fleet.
  final String arn;

  /// The time the fleet was created in seconds since epoch (January 1, 1970 at
  /// midnight UTC time).
  final DateTime creationTime;

  /// The ID of the fleet.
  final String id;

  /// The time the fleet was last updated, in seconds since epoch (January 1, 1970
  /// at midnight UTC time).
  final DateTime lastModificationTime;

  /// The ARN of a signal catalog associated with the fleet.
  final String signalCatalogArn;

  /// A brief description of the fleet.
  final String? description;

  GetFleetResponse({
    required this.arn,
    required this.creationTime,
    required this.id,
    required this.lastModificationTime,
    required this.signalCatalogArn,
    this.description,
  });

  factory GetFleetResponse.fromJson(Map<String, dynamic> json) {
    return GetFleetResponse(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      lastModificationTime:
          nonNullableTimeStampFromJson(json['lastModificationTime'] as Object),
      signalCatalogArn: json['signalCatalogArn'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final lastModificationTime = this.lastModificationTime;
    final signalCatalogArn = this.signalCatalogArn;
    final description = this.description;
    return {
      'arn': arn,
      'creationTime': unixTimestampToJson(creationTime),
      'id': id,
      'lastModificationTime': unixTimestampToJson(lastModificationTime),
      'signalCatalogArn': signalCatalogArn,
      if (description != null) 'description': description,
    };
  }
}

class GetLoggingOptionsResponse {
  /// Returns information about log delivery to Amazon CloudWatch Logs.
  final CloudWatchLogDeliveryOptions cloudWatchLogDelivery;

  GetLoggingOptionsResponse({
    required this.cloudWatchLogDelivery,
  });

  factory GetLoggingOptionsResponse.fromJson(Map<String, dynamic> json) {
    return GetLoggingOptionsResponse(
      cloudWatchLogDelivery: CloudWatchLogDeliveryOptions.fromJson(
          json['cloudWatchLogDelivery'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogDelivery = this.cloudWatchLogDelivery;
    return {
      'cloudWatchLogDelivery': cloudWatchLogDelivery,
    };
  }
}

class GetModelManifestResponse {
  /// The Amazon Resource Name (ARN) of the vehicle model.
  final String arn;

  /// The time the vehicle model was created, in seconds since epoch (January 1,
  /// 1970 at midnight UTC time).
  final DateTime creationTime;

  /// The last time the vehicle model was modified.
  final DateTime lastModificationTime;

  /// The name of the vehicle model.
  final String name;

  /// A brief description of the vehicle model.
  final String? description;

  /// The ARN of the signal catalog associated with the vehicle model.
  final String? signalCatalogArn;

  /// The state of the vehicle model. If the status is <code>ACTIVE</code>, the
  /// vehicle model can't be edited. You can edit the vehicle model if the status
  /// is marked <code>DRAFT</code>.
  final ManifestStatus? status;

  GetModelManifestResponse({
    required this.arn,
    required this.creationTime,
    required this.lastModificationTime,
    required this.name,
    this.description,
    this.signalCatalogArn,
    this.status,
  });

  factory GetModelManifestResponse.fromJson(Map<String, dynamic> json) {
    return GetModelManifestResponse(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      lastModificationTime:
          nonNullableTimeStampFromJson(json['lastModificationTime'] as Object),
      name: json['name'] as String,
      description: json['description'] as String?,
      signalCatalogArn: json['signalCatalogArn'] as String?,
      status: (json['status'] as String?)?.toManifestStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    final name = this.name;
    final description = this.description;
    final signalCatalogArn = this.signalCatalogArn;
    final status = this.status;
    return {
      'arn': arn,
      'creationTime': unixTimestampToJson(creationTime),
      'lastModificationTime': unixTimestampToJson(lastModificationTime),
      'name': name,
      if (description != null) 'description': description,
      if (signalCatalogArn != null) 'signalCatalogArn': signalCatalogArn,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetRegisterAccountStatusResponse {
  /// The status of registering your account and resources. The status can be one
  /// of:
  ///
  /// <ul>
  /// <li>
  /// <code>REGISTRATION_SUCCESS</code> - The Amazon Web Services resource is
  /// successfully registered.
  /// </li>
  /// <li>
  /// <code>REGISTRATION_PENDING</code> - Amazon Web Services IoT FleetWise is
  /// processing the registration request. This process takes approximately five
  /// minutes to complete.
  /// </li>
  /// <li>
  /// <code>REGISTRATION_FAILURE</code> - Amazon Web Services IoT FleetWise can't
  /// register the AWS resource. Try again later.
  /// </li>
  /// </ul>
  final RegistrationStatus accountStatus;

  /// The time the account was registered, in seconds since epoch (January 1, 1970
  /// at midnight UTC time).
  final DateTime creationTime;

  /// The unique ID of the Amazon Web Services account, provided at account
  /// creation.
  final String customerAccountId;

  /// Information about the registered IAM resources or errors, if any.
  final IamRegistrationResponse iamRegistrationResponse;

  /// The time this registration was last updated, in seconds since epoch (January
  /// 1, 1970 at midnight UTC time).
  final DateTime lastModificationTime;

  /// Information about the registered Amazon Timestream resources or errors, if
  /// any.
  final TimestreamRegistrationResponse? timestreamRegistrationResponse;

  GetRegisterAccountStatusResponse({
    required this.accountStatus,
    required this.creationTime,
    required this.customerAccountId,
    required this.iamRegistrationResponse,
    required this.lastModificationTime,
    this.timestreamRegistrationResponse,
  });

  factory GetRegisterAccountStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetRegisterAccountStatusResponse(
      accountStatus: (json['accountStatus'] as String).toRegistrationStatus(),
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      customerAccountId: json['customerAccountId'] as String,
      iamRegistrationResponse: IamRegistrationResponse.fromJson(
          json['iamRegistrationResponse'] as Map<String, dynamic>),
      lastModificationTime:
          nonNullableTimeStampFromJson(json['lastModificationTime'] as Object),
      timestreamRegistrationResponse: json['timestreamRegistrationResponse'] !=
              null
          ? TimestreamRegistrationResponse.fromJson(
              json['timestreamRegistrationResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountStatus = this.accountStatus;
    final creationTime = this.creationTime;
    final customerAccountId = this.customerAccountId;
    final iamRegistrationResponse = this.iamRegistrationResponse;
    final lastModificationTime = this.lastModificationTime;
    final timestreamRegistrationResponse = this.timestreamRegistrationResponse;
    return {
      'accountStatus': accountStatus.toValue(),
      'creationTime': unixTimestampToJson(creationTime),
      'customerAccountId': customerAccountId,
      'iamRegistrationResponse': iamRegistrationResponse,
      'lastModificationTime': unixTimestampToJson(lastModificationTime),
      if (timestreamRegistrationResponse != null)
        'timestreamRegistrationResponse': timestreamRegistrationResponse,
    };
  }
}

class GetSignalCatalogResponse {
  /// The Amazon Resource Name (ARN) of the signal catalog.
  final String arn;

  /// The time the signal catalog was created in seconds since epoch (January 1,
  /// 1970 at midnight UTC time).
  final DateTime creationTime;

  /// The last time the signal catalog was modified.
  final DateTime lastModificationTime;

  /// The name of the signal catalog.
  final String name;

  /// A brief description of the signal catalog.
  final String? description;

  /// The total number of network nodes specified in a signal catalog.
  final NodeCounts? nodeCounts;

  GetSignalCatalogResponse({
    required this.arn,
    required this.creationTime,
    required this.lastModificationTime,
    required this.name,
    this.description,
    this.nodeCounts,
  });

  factory GetSignalCatalogResponse.fromJson(Map<String, dynamic> json) {
    return GetSignalCatalogResponse(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      lastModificationTime:
          nonNullableTimeStampFromJson(json['lastModificationTime'] as Object),
      name: json['name'] as String,
      description: json['description'] as String?,
      nodeCounts: json['nodeCounts'] != null
          ? NodeCounts.fromJson(json['nodeCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    final name = this.name;
    final description = this.description;
    final nodeCounts = this.nodeCounts;
    return {
      'arn': arn,
      'creationTime': unixTimestampToJson(creationTime),
      'lastModificationTime': unixTimestampToJson(lastModificationTime),
      'name': name,
      if (description != null) 'description': description,
      if (nodeCounts != null) 'nodeCounts': nodeCounts,
    };
  }
}

class GetVehicleResponse {
  /// The Amazon Resource Name (ARN) of the vehicle to retrieve information about.
  final String? arn;

  /// Static information about a vehicle in a key-value pair. For example:
  ///
  /// <code>"engineType"</code> : <code>"1.3 L R2"</code>
  final Map<String, String>? attributes;

  /// The time the vehicle was created in seconds since epoch (January 1, 1970 at
  /// midnight UTC time).
  final DateTime? creationTime;

  /// The ARN of a decoder manifest associated with the vehicle.
  final String? decoderManifestArn;

  /// The time the vehicle was last updated in seconds since epoch (January 1,
  /// 1970 at midnight UTC time).
  final DateTime? lastModificationTime;

  /// The ARN of a vehicle model (model manifest) associated with the vehicle.
  final String? modelManifestArn;

  /// The ID of the vehicle.
  final String? vehicleName;

  GetVehicleResponse({
    this.arn,
    this.attributes,
    this.creationTime,
    this.decoderManifestArn,
    this.lastModificationTime,
    this.modelManifestArn,
    this.vehicleName,
  });

  factory GetVehicleResponse.fromJson(Map<String, dynamic> json) {
    return GetVehicleResponse(
      arn: json['arn'] as String?,
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      creationTime: timeStampFromJson(json['creationTime']),
      decoderManifestArn: json['decoderManifestArn'] as String?,
      lastModificationTime: timeStampFromJson(json['lastModificationTime']),
      modelManifestArn: json['modelManifestArn'] as String?,
      vehicleName: json['vehicleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attributes = this.attributes;
    final creationTime = this.creationTime;
    final decoderManifestArn = this.decoderManifestArn;
    final lastModificationTime = this.lastModificationTime;
    final modelManifestArn = this.modelManifestArn;
    final vehicleName = this.vehicleName;
    return {
      if (arn != null) 'arn': arn,
      if (attributes != null) 'attributes': attributes,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (decoderManifestArn != null) 'decoderManifestArn': decoderManifestArn,
      if (lastModificationTime != null)
        'lastModificationTime': unixTimestampToJson(lastModificationTime),
      if (modelManifestArn != null) 'modelManifestArn': modelManifestArn,
      if (vehicleName != null) 'vehicleName': vehicleName,
    };
  }
}

class GetVehicleStatusResponse {
  /// Lists information about the state of the vehicle with deployed campaigns.
  final List<VehicleStatus>? campaigns;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  GetVehicleStatusResponse({
    this.campaigns,
    this.nextToken,
  });

  factory GetVehicleStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetVehicleStatusResponse(
      campaigns: (json['campaigns'] as List?)
          ?.whereNotNull()
          .map((e) => VehicleStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final campaigns = this.campaigns;
    final nextToken = this.nextToken;
    return {
      if (campaigns != null) 'campaigns': campaigns,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Information about registering an Identity and Access Management (IAM)
/// resource so Amazon Web Services IoT FleetWise edge agent software can
/// transfer your vehicle data to Amazon Timestream.
class IamRegistrationResponse {
  /// The status of registering your IAM resource. The status can be one of
  /// <code>REGISTRATION_SUCCESS</code>, <code>REGISTRATION_PENDING</code>,
  /// <code>REGISTRATION_FAILURE</code>.
  final RegistrationStatus registrationStatus;

  /// The Amazon Resource Name (ARN) of the IAM role to register.
  final String roleArn;

  /// A message associated with a registration error.
  final String? errorMessage;

  IamRegistrationResponse({
    required this.registrationStatus,
    required this.roleArn,
    this.errorMessage,
  });

  factory IamRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return IamRegistrationResponse(
      registrationStatus:
          (json['registrationStatus'] as String).toRegistrationStatus(),
      roleArn: json['roleArn'] as String,
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationStatus = this.registrationStatus;
    final roleArn = this.roleArn;
    final errorMessage = this.errorMessage;
    return {
      'registrationStatus': registrationStatus.toValue(),
      'roleArn': roleArn,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// The IAM resource that enables Amazon Web Services IoT FleetWise edge agent
/// software to send data to Amazon Timestream.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
/// roles</a> in the <i>Identity and Access Management User Guide</i>.
class IamResources {
  /// The Amazon Resource Name (ARN) of the IAM resource that allows Amazon Web
  /// Services IoT FleetWise to send data to Amazon Timestream. For example,
  /// <code>arn:aws:iam::123456789012:role/SERVICE-ROLE-ARN</code>.
  final String roleArn;

  IamResources({
    required this.roleArn,
  });

  factory IamResources.fromJson(Map<String, dynamic> json) {
    return IamResources(
      roleArn: json['roleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    return {
      'roleArn': roleArn,
    };
  }
}

class ImportDecoderManifestResponse {
  /// The Amazon Resource Name (ARN) of the decoder manifest that was imported.
  final String arn;

  /// The name of the imported decoder manifest.
  final String name;

  ImportDecoderManifestResponse({
    required this.arn,
    required this.name,
  });

  factory ImportDecoderManifestResponse.fromJson(Map<String, dynamic> json) {
    return ImportDecoderManifestResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      'arn': arn,
      'name': name,
    };
  }
}

class ImportSignalCatalogResponse {
  /// The Amazon Resource Name (ARN) of the imported signal catalog.
  final String arn;

  /// The name of the imported signal catalog.
  final String name;

  ImportSignalCatalogResponse({
    required this.arn,
    required this.name,
  });

  factory ImportSignalCatalogResponse.fromJson(Map<String, dynamic> json) {
    return ImportSignalCatalogResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      'arn': arn,
      'name': name,
    };
  }
}

class ListCampaignsResponse {
  /// A summary of information about each campaign.
  final List<CampaignSummary>? campaignSummaries;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  ListCampaignsResponse({
    this.campaignSummaries,
    this.nextToken,
  });

  factory ListCampaignsResponse.fromJson(Map<String, dynamic> json) {
    return ListCampaignsResponse(
      campaignSummaries: (json['campaignSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => CampaignSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final campaignSummaries = this.campaignSummaries;
    final nextToken = this.nextToken;
    return {
      if (campaignSummaries != null) 'campaignSummaries': campaignSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDecoderManifestNetworkInterfacesResponse {
  /// A list of information about network interfaces.
  final List<NetworkInterface>? networkInterfaces;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  ListDecoderManifestNetworkInterfacesResponse({
    this.networkInterfaces,
    this.nextToken,
  });

  factory ListDecoderManifestNetworkInterfacesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDecoderManifestNetworkInterfacesResponse(
      networkInterfaces: (json['networkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkInterfaces = this.networkInterfaces;
    final nextToken = this.nextToken;
    return {
      if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDecoderManifestSignalsResponse {
  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  /// Information about a list of signals to decode.
  final List<SignalDecoder>? signalDecoders;

  ListDecoderManifestSignalsResponse({
    this.nextToken,
    this.signalDecoders,
  });

  factory ListDecoderManifestSignalsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDecoderManifestSignalsResponse(
      nextToken: json['nextToken'] as String?,
      signalDecoders: (json['signalDecoders'] as List?)
          ?.whereNotNull()
          .map((e) => SignalDecoder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final signalDecoders = this.signalDecoders;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (signalDecoders != null) 'signalDecoders': signalDecoders,
    };
  }
}

class ListDecoderManifestsResponse {
  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  /// A list of information about each decoder manifest.
  final List<DecoderManifestSummary>? summaries;

  ListDecoderManifestsResponse({
    this.nextToken,
    this.summaries,
  });

  factory ListDecoderManifestsResponse.fromJson(Map<String, dynamic> json) {
    return ListDecoderManifestsResponse(
      nextToken: json['nextToken'] as String?,
      summaries: (json['summaries'] as List?)
          ?.whereNotNull()
          .map(
              (e) => DecoderManifestSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (summaries != null) 'summaries': summaries,
    };
  }
}

class ListFleetsForVehicleResponse {
  /// A list of fleet IDs that the vehicle is associated with.
  final List<String>? fleets;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  ListFleetsForVehicleResponse({
    this.fleets,
    this.nextToken,
  });

  factory ListFleetsForVehicleResponse.fromJson(Map<String, dynamic> json) {
    return ListFleetsForVehicleResponse(
      fleets: (json['fleets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleets = this.fleets;
    final nextToken = this.nextToken;
    return {
      if (fleets != null) 'fleets': fleets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFleetsResponse {
  /// A list of information for each fleet.
  final List<FleetSummary>? fleetSummaries;

  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  ListFleetsResponse({
    this.fleetSummaries,
    this.nextToken,
  });

  factory ListFleetsResponse.fromJson(Map<String, dynamic> json) {
    return ListFleetsResponse(
      fleetSummaries: (json['fleetSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => FleetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetSummaries = this.fleetSummaries;
    final nextToken = this.nextToken;
    return {
      if (fleetSummaries != null) 'fleetSummaries': fleetSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListModelManifestNodesResponse {
  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  /// A list of information about nodes.
  final List<Node>? nodes;

  ListModelManifestNodesResponse({
    this.nextToken,
    this.nodes,
  });

  factory ListModelManifestNodesResponse.fromJson(Map<String, dynamic> json) {
    return ListModelManifestNodesResponse(
      nextToken: json['nextToken'] as String?,
      nodes: (json['nodes'] as List?)
          ?.whereNotNull()
          .map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final nodes = this.nodes;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (nodes != null) 'nodes': nodes,
    };
  }
}

class ListModelManifestsResponse {
  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  /// A list of information about vehicle models.
  final List<ModelManifestSummary>? summaries;

  ListModelManifestsResponse({
    this.nextToken,
    this.summaries,
  });

  factory ListModelManifestsResponse.fromJson(Map<String, dynamic> json) {
    return ListModelManifestsResponse(
      nextToken: json['nextToken'] as String?,
      summaries: (json['summaries'] as List?)
          ?.whereNotNull()
          .map((e) => ModelManifestSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (summaries != null) 'summaries': summaries,
    };
  }
}

class ListSignalCatalogNodesResponse {
  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  /// A list of information about nodes.
  final List<Node>? nodes;

  ListSignalCatalogNodesResponse({
    this.nextToken,
    this.nodes,
  });

  factory ListSignalCatalogNodesResponse.fromJson(Map<String, dynamic> json) {
    return ListSignalCatalogNodesResponse(
      nextToken: json['nextToken'] as String?,
      nodes: (json['nodes'] as List?)
          ?.whereNotNull()
          .map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final nodes = this.nodes;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (nodes != null) 'nodes': nodes,
    };
  }
}

class ListSignalCatalogsResponse {
  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  /// A list of information about each signal catalog.
  final List<SignalCatalogSummary>? summaries;

  ListSignalCatalogsResponse({
    this.nextToken,
    this.summaries,
  });

  factory ListSignalCatalogsResponse.fromJson(Map<String, dynamic> json) {
    return ListSignalCatalogsResponse(
      nextToken: json['nextToken'] as String?,
      summaries: (json['summaries'] as List?)
          ?.whereNotNull()
          .map((e) => SignalCatalogSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (summaries != null) 'summaries': summaries,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tags assigned to the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListVehiclesInFleetResponse {
  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  /// A list of vehicles associated with the fleet.
  final List<String>? vehicles;

  ListVehiclesInFleetResponse({
    this.nextToken,
    this.vehicles,
  });

  factory ListVehiclesInFleetResponse.fromJson(Map<String, dynamic> json) {
    return ListVehiclesInFleetResponse(
      nextToken: json['nextToken'] as String?,
      vehicles: (json['vehicles'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final vehicles = this.vehicles;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (vehicles != null) 'vehicles': vehicles,
    };
  }
}

class ListVehiclesResponse {
  /// The token to retrieve the next set of results, or <code>null</code> if there
  /// are no more results.
  final String? nextToken;

  /// A list of vehicles and information about them.
  final List<VehicleSummary>? vehicleSummaries;

  ListVehiclesResponse({
    this.nextToken,
    this.vehicleSummaries,
  });

  factory ListVehiclesResponse.fromJson(Map<String, dynamic> json) {
    return ListVehiclesResponse(
      nextToken: json['nextToken'] as String?,
      vehicleSummaries: (json['vehicleSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => VehicleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final vehicleSummaries = this.vehicleSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (vehicleSummaries != null) 'vehicleSummaries': vehicleSummaries,
    };
  }
}

enum LogType {
  off,
  error,
}

extension LogTypeValueExtension on LogType {
  String toValue() {
    switch (this) {
      case LogType.off:
        return 'OFF';
      case LogType.error:
        return 'ERROR';
    }
  }
}

extension LogTypeFromString on String {
  LogType toLogType() {
    switch (this) {
      case 'OFF':
        return LogType.off;
      case 'ERROR':
        return LogType.error;
    }
    throw Exception('$this is not known in enum LogType');
  }
}

enum ManifestStatus {
  active,
  draft,
  invalid,
  validating,
}

extension ManifestStatusValueExtension on ManifestStatus {
  String toValue() {
    switch (this) {
      case ManifestStatus.active:
        return 'ACTIVE';
      case ManifestStatus.draft:
        return 'DRAFT';
      case ManifestStatus.invalid:
        return 'INVALID';
      case ManifestStatus.validating:
        return 'VALIDATING';
    }
  }
}

extension ManifestStatusFromString on String {
  ManifestStatus toManifestStatus() {
    switch (this) {
      case 'ACTIVE':
        return ManifestStatus.active;
      case 'DRAFT':
        return ManifestStatus.draft;
      case 'INVALID':
        return ManifestStatus.invalid;
      case 'VALIDATING':
        return ManifestStatus.validating;
    }
    throw Exception('$this is not known in enum ManifestStatus');
  }
}

/// The decoding information for a specific message which support higher order
/// data types.
class MessageSignal {
  /// The structured message for the message signal. It can be defined with either
  /// a <code>primitiveMessageDefinition</code>,
  /// <code>structuredMessageListDefinition</code>, or
  /// <code>structuredMessageDefinition</code> recursively.
  final StructuredMessage structuredMessage;

  /// The topic name for the message signal. It corresponds to topics in ROS 2.
  final String topicName;

  MessageSignal({
    required this.structuredMessage,
    required this.topicName,
  });

  factory MessageSignal.fromJson(Map<String, dynamic> json) {
    return MessageSignal(
      structuredMessage: StructuredMessage.fromJson(
          json['structuredMessage'] as Map<String, dynamic>),
      topicName: json['topicName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final structuredMessage = this.structuredMessage;
    final topicName = this.topicName;
    return {
      'structuredMessage': structuredMessage,
      'topicName': topicName,
    };
  }
}

/// Information about a vehicle model (model manifest). You can use the API
/// operation to return this information about multiple vehicle models.
class ModelManifestSummary {
  /// The time the vehicle model was created, in seconds since epoch (January 1,
  /// 1970 at midnight UTC time).
  final DateTime creationTime;

  /// The time the vehicle model was last updated, in seconds since epoch (January
  /// 1, 1970 at midnight UTC time).
  final DateTime lastModificationTime;

  /// The Amazon Resource Name (ARN) of the vehicle model.
  final String? arn;

  /// A brief description of the vehicle model.
  final String? description;

  /// The name of the vehicle model.
  final String? name;

  /// The ARN of the signal catalog associated with the vehicle model.
  final String? signalCatalogArn;

  /// The state of the vehicle model. If the status is <code>ACTIVE</code>, the
  /// vehicle model can't be edited. If the status is <code>DRAFT</code>, you can
  /// edit the vehicle model.
  final ManifestStatus? status;

  ModelManifestSummary({
    required this.creationTime,
    required this.lastModificationTime,
    this.arn,
    this.description,
    this.name,
    this.signalCatalogArn,
    this.status,
  });

  factory ModelManifestSummary.fromJson(Map<String, dynamic> json) {
    return ModelManifestSummary(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      lastModificationTime:
          nonNullableTimeStampFromJson(json['lastModificationTime'] as Object),
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      signalCatalogArn: json['signalCatalogArn'] as String?,
      status: (json['status'] as String?)?.toManifestStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    final arn = this.arn;
    final description = this.description;
    final name = this.name;
    final signalCatalogArn = this.signalCatalogArn;
    final status = this.status;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'lastModificationTime': unixTimestampToJson(lastModificationTime),
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (signalCatalogArn != null) 'signalCatalogArn': signalCatalogArn,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Specifications for defining a vehicle network.
class NetworkFileDefinition {
  /// Information, including CAN DBC files, about the configurations used to
  /// create a decoder manifest.
  final CanDbcDefinition? canDbc;

  NetworkFileDefinition({
    this.canDbc,
  });

  Map<String, dynamic> toJson() {
    final canDbc = this.canDbc;
    return {
      if (canDbc != null) 'canDbc': canDbc,
    };
  }
}

/// Represents a node and its specifications in an in-vehicle communication
/// network. All signal decoders must be associated with a network node.
///
/// To return this information about all the network interfaces specified in a
/// decoder manifest, use the API operation.
class NetworkInterface {
  /// The ID of the network interface.
  final String interfaceId;

  /// The network protocol for the vehicle. For example, <code>CAN_SIGNAL</code>
  /// specifies a protocol that defines how data is communicated between
  /// electronic control units (ECUs). <code>OBD_SIGNAL</code> specifies a
  /// protocol that defines how self-diagnostic data is communicated between ECUs.
  final NetworkInterfaceType type;

  /// Information about a network interface specified by the Controller Area
  /// Network (CAN) protocol.
  final CanInterface? canInterface;

  /// Information about a network interface specified by the On-board diagnostic
  /// (OBD) II protocol.
  final ObdInterface? obdInterface;

  /// The vehicle middleware defined as a type of network interface. Examples of
  /// vehicle middleware include <code>ROS2</code> and <code>SOME/IP</code>.
  final VehicleMiddleware? vehicleMiddleware;

  NetworkInterface({
    required this.interfaceId,
    required this.type,
    this.canInterface,
    this.obdInterface,
    this.vehicleMiddleware,
  });

  factory NetworkInterface.fromJson(Map<String, dynamic> json) {
    return NetworkInterface(
      interfaceId: json['interfaceId'] as String,
      type: (json['type'] as String).toNetworkInterfaceType(),
      canInterface: json['canInterface'] != null
          ? CanInterface.fromJson(json['canInterface'] as Map<String, dynamic>)
          : null,
      obdInterface: json['obdInterface'] != null
          ? ObdInterface.fromJson(json['obdInterface'] as Map<String, dynamic>)
          : null,
      vehicleMiddleware: json['vehicleMiddleware'] != null
          ? VehicleMiddleware.fromJson(
              json['vehicleMiddleware'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final interfaceId = this.interfaceId;
    final type = this.type;
    final canInterface = this.canInterface;
    final obdInterface = this.obdInterface;
    final vehicleMiddleware = this.vehicleMiddleware;
    return {
      'interfaceId': interfaceId,
      'type': type.toValue(),
      if (canInterface != null) 'canInterface': canInterface,
      if (obdInterface != null) 'obdInterface': obdInterface,
      if (vehicleMiddleware != null) 'vehicleMiddleware': vehicleMiddleware,
    };
  }
}

enum NetworkInterfaceType {
  canInterface,
  obdInterface,
  vehicleMiddleware,
}

extension NetworkInterfaceTypeValueExtension on NetworkInterfaceType {
  String toValue() {
    switch (this) {
      case NetworkInterfaceType.canInterface:
        return 'CAN_INTERFACE';
      case NetworkInterfaceType.obdInterface:
        return 'OBD_INTERFACE';
      case NetworkInterfaceType.vehicleMiddleware:
        return 'VEHICLE_MIDDLEWARE';
    }
  }
}

extension NetworkInterfaceTypeFromString on String {
  NetworkInterfaceType toNetworkInterfaceType() {
    switch (this) {
      case 'CAN_INTERFACE':
        return NetworkInterfaceType.canInterface;
      case 'OBD_INTERFACE':
        return NetworkInterfaceType.obdInterface;
      case 'VEHICLE_MIDDLEWARE':
        return NetworkInterfaceType.vehicleMiddleware;
    }
    throw Exception('$this is not known in enum NetworkInterfaceType');
  }
}

/// A general abstraction of a signal. A node can be specified as an actuator,
/// attribute, branch, or sensor.
class Node {
  /// Information about a node specified as an actuator.
  /// <note>
  /// An actuator is a digital representation of a vehicle device.
  /// </note>
  final Actuator? actuator;

  /// Information about a node specified as an attribute.
  /// <note>
  /// An attribute represents static information about a vehicle.
  /// </note>
  final Attribute? attribute;

  /// Information about a node specified as a branch.
  /// <note>
  /// A group of signals that are defined in a hierarchical structure.
  /// </note>
  final Branch? branch;

  /// Represents a member of the complex data structure. The <code>datatype</code>
  /// of the property can be either primitive or another <code>struct</code>.
  final CustomProperty? property;
  final Sensor? sensor;

  /// Represents a complex or higher-order data structure.
  final CustomStruct? struct;

  Node({
    this.actuator,
    this.attribute,
    this.branch,
    this.property,
    this.sensor,
    this.struct,
  });

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      actuator: json['actuator'] != null
          ? Actuator.fromJson(json['actuator'] as Map<String, dynamic>)
          : null,
      attribute: json['attribute'] != null
          ? Attribute.fromJson(json['attribute'] as Map<String, dynamic>)
          : null,
      branch: json['branch'] != null
          ? Branch.fromJson(json['branch'] as Map<String, dynamic>)
          : null,
      property: json['property'] != null
          ? CustomProperty.fromJson(json['property'] as Map<String, dynamic>)
          : null,
      sensor: json['sensor'] != null
          ? Sensor.fromJson(json['sensor'] as Map<String, dynamic>)
          : null,
      struct: json['struct'] != null
          ? CustomStruct.fromJson(json['struct'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actuator = this.actuator;
    final attribute = this.attribute;
    final branch = this.branch;
    final property = this.property;
    final sensor = this.sensor;
    final struct = this.struct;
    return {
      if (actuator != null) 'actuator': actuator,
      if (attribute != null) 'attribute': attribute,
      if (branch != null) 'branch': branch,
      if (property != null) 'property': property,
      if (sensor != null) 'sensor': sensor,
      if (struct != null) 'struct': struct,
    };
  }
}

/// Information about the number of nodes and node types in a vehicle network.
class NodeCounts {
  /// The total number of nodes in a vehicle network that represent actuators.
  final int? totalActuators;

  /// The total number of nodes in a vehicle network that represent attributes.
  final int? totalAttributes;

  /// The total number of nodes in a vehicle network that represent branches.
  final int? totalBranches;

  /// The total number of nodes in a vehicle network.
  final int? totalNodes;

  /// The total properties for the node.
  final int? totalProperties;

  /// The total number of nodes in a vehicle network that represent sensors.
  final int? totalSensors;

  /// The total structure for the node.
  final int? totalStructs;

  NodeCounts({
    this.totalActuators,
    this.totalAttributes,
    this.totalBranches,
    this.totalNodes,
    this.totalProperties,
    this.totalSensors,
    this.totalStructs,
  });

  factory NodeCounts.fromJson(Map<String, dynamic> json) {
    return NodeCounts(
      totalActuators: json['totalActuators'] as int?,
      totalAttributes: json['totalAttributes'] as int?,
      totalBranches: json['totalBranches'] as int?,
      totalNodes: json['totalNodes'] as int?,
      totalProperties: json['totalProperties'] as int?,
      totalSensors: json['totalSensors'] as int?,
      totalStructs: json['totalStructs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final totalActuators = this.totalActuators;
    final totalAttributes = this.totalAttributes;
    final totalBranches = this.totalBranches;
    final totalNodes = this.totalNodes;
    final totalProperties = this.totalProperties;
    final totalSensors = this.totalSensors;
    final totalStructs = this.totalStructs;
    return {
      if (totalActuators != null) 'totalActuators': totalActuators,
      if (totalAttributes != null) 'totalAttributes': totalAttributes,
      if (totalBranches != null) 'totalBranches': totalBranches,
      if (totalNodes != null) 'totalNodes': totalNodes,
      if (totalProperties != null) 'totalProperties': totalProperties,
      if (totalSensors != null) 'totalSensors': totalSensors,
      if (totalStructs != null) 'totalStructs': totalStructs,
    };
  }
}

enum NodeDataEncoding {
  binary,
  typed,
}

extension NodeDataEncodingValueExtension on NodeDataEncoding {
  String toValue() {
    switch (this) {
      case NodeDataEncoding.binary:
        return 'BINARY';
      case NodeDataEncoding.typed:
        return 'TYPED';
    }
  }
}

extension NodeDataEncodingFromString on String {
  NodeDataEncoding toNodeDataEncoding() {
    switch (this) {
      case 'BINARY':
        return NodeDataEncoding.binary;
      case 'TYPED':
        return NodeDataEncoding.typed;
    }
    throw Exception('$this is not known in enum NodeDataEncoding');
  }
}

enum NodeDataType {
  int8,
  uint8,
  int16,
  uint16,
  int32,
  uint32,
  int64,
  uint64,
  boolean,
  float,
  double,
  string,
  unixTimestamp,
  int8Array,
  uint8Array,
  int16Array,
  uint16Array,
  int32Array,
  uint32Array,
  int64Array,
  uint64Array,
  booleanArray,
  floatArray,
  doubleArray,
  stringArray,
  unixTimestampArray,
  unknown,
  struct,
  structArray,
}

extension NodeDataTypeValueExtension on NodeDataType {
  String toValue() {
    switch (this) {
      case NodeDataType.int8:
        return 'INT8';
      case NodeDataType.uint8:
        return 'UINT8';
      case NodeDataType.int16:
        return 'INT16';
      case NodeDataType.uint16:
        return 'UINT16';
      case NodeDataType.int32:
        return 'INT32';
      case NodeDataType.uint32:
        return 'UINT32';
      case NodeDataType.int64:
        return 'INT64';
      case NodeDataType.uint64:
        return 'UINT64';
      case NodeDataType.boolean:
        return 'BOOLEAN';
      case NodeDataType.float:
        return 'FLOAT';
      case NodeDataType.double:
        return 'DOUBLE';
      case NodeDataType.string:
        return 'STRING';
      case NodeDataType.unixTimestamp:
        return 'UNIX_TIMESTAMP';
      case NodeDataType.int8Array:
        return 'INT8_ARRAY';
      case NodeDataType.uint8Array:
        return 'UINT8_ARRAY';
      case NodeDataType.int16Array:
        return 'INT16_ARRAY';
      case NodeDataType.uint16Array:
        return 'UINT16_ARRAY';
      case NodeDataType.int32Array:
        return 'INT32_ARRAY';
      case NodeDataType.uint32Array:
        return 'UINT32_ARRAY';
      case NodeDataType.int64Array:
        return 'INT64_ARRAY';
      case NodeDataType.uint64Array:
        return 'UINT64_ARRAY';
      case NodeDataType.booleanArray:
        return 'BOOLEAN_ARRAY';
      case NodeDataType.floatArray:
        return 'FLOAT_ARRAY';
      case NodeDataType.doubleArray:
        return 'DOUBLE_ARRAY';
      case NodeDataType.stringArray:
        return 'STRING_ARRAY';
      case NodeDataType.unixTimestampArray:
        return 'UNIX_TIMESTAMP_ARRAY';
      case NodeDataType.unknown:
        return 'UNKNOWN';
      case NodeDataType.struct:
        return 'STRUCT';
      case NodeDataType.structArray:
        return 'STRUCT_ARRAY';
    }
  }
}

extension NodeDataTypeFromString on String {
  NodeDataType toNodeDataType() {
    switch (this) {
      case 'INT8':
        return NodeDataType.int8;
      case 'UINT8':
        return NodeDataType.uint8;
      case 'INT16':
        return NodeDataType.int16;
      case 'UINT16':
        return NodeDataType.uint16;
      case 'INT32':
        return NodeDataType.int32;
      case 'UINT32':
        return NodeDataType.uint32;
      case 'INT64':
        return NodeDataType.int64;
      case 'UINT64':
        return NodeDataType.uint64;
      case 'BOOLEAN':
        return NodeDataType.boolean;
      case 'FLOAT':
        return NodeDataType.float;
      case 'DOUBLE':
        return NodeDataType.double;
      case 'STRING':
        return NodeDataType.string;
      case 'UNIX_TIMESTAMP':
        return NodeDataType.unixTimestamp;
      case 'INT8_ARRAY':
        return NodeDataType.int8Array;
      case 'UINT8_ARRAY':
        return NodeDataType.uint8Array;
      case 'INT16_ARRAY':
        return NodeDataType.int16Array;
      case 'UINT16_ARRAY':
        return NodeDataType.uint16Array;
      case 'INT32_ARRAY':
        return NodeDataType.int32Array;
      case 'UINT32_ARRAY':
        return NodeDataType.uint32Array;
      case 'INT64_ARRAY':
        return NodeDataType.int64Array;
      case 'UINT64_ARRAY':
        return NodeDataType.uint64Array;
      case 'BOOLEAN_ARRAY':
        return NodeDataType.booleanArray;
      case 'FLOAT_ARRAY':
        return NodeDataType.floatArray;
      case 'DOUBLE_ARRAY':
        return NodeDataType.doubleArray;
      case 'STRING_ARRAY':
        return NodeDataType.stringArray;
      case 'UNIX_TIMESTAMP_ARRAY':
        return NodeDataType.unixTimestampArray;
      case 'UNKNOWN':
        return NodeDataType.unknown;
      case 'STRUCT':
        return NodeDataType.struct;
      case 'STRUCT_ARRAY':
        return NodeDataType.structArray;
    }
    throw Exception('$this is not known in enum NodeDataType');
  }
}

/// A network interface that specifies the On-board diagnostic (OBD) II network
/// protocol.
class ObdInterface {
  /// The name of the interface.
  final String name;

  /// The ID of the message requesting vehicle data.
  final int requestMessageId;

  /// The maximum number message requests per diagnostic trouble code per second.
  final int? dtcRequestIntervalSeconds;

  /// Whether the vehicle has a transmission control module (TCM).
  final bool? hasTransmissionEcu;

  /// The standard OBD II PID.
  final String? obdStandard;

  /// The maximum number message requests per second.
  final int? pidRequestIntervalSeconds;

  /// Whether to use extended IDs in the message.
  final bool? useExtendedIds;

  ObdInterface({
    required this.name,
    required this.requestMessageId,
    this.dtcRequestIntervalSeconds,
    this.hasTransmissionEcu,
    this.obdStandard,
    this.pidRequestIntervalSeconds,
    this.useExtendedIds,
  });

  factory ObdInterface.fromJson(Map<String, dynamic> json) {
    return ObdInterface(
      name: json['name'] as String,
      requestMessageId: json['requestMessageId'] as int,
      dtcRequestIntervalSeconds: json['dtcRequestIntervalSeconds'] as int?,
      hasTransmissionEcu: json['hasTransmissionEcu'] as bool?,
      obdStandard: json['obdStandard'] as String?,
      pidRequestIntervalSeconds: json['pidRequestIntervalSeconds'] as int?,
      useExtendedIds: json['useExtendedIds'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final requestMessageId = this.requestMessageId;
    final dtcRequestIntervalSeconds = this.dtcRequestIntervalSeconds;
    final hasTransmissionEcu = this.hasTransmissionEcu;
    final obdStandard = this.obdStandard;
    final pidRequestIntervalSeconds = this.pidRequestIntervalSeconds;
    final useExtendedIds = this.useExtendedIds;
    return {
      'name': name,
      'requestMessageId': requestMessageId,
      if (dtcRequestIntervalSeconds != null)
        'dtcRequestIntervalSeconds': dtcRequestIntervalSeconds,
      if (hasTransmissionEcu != null) 'hasTransmissionEcu': hasTransmissionEcu,
      if (obdStandard != null) 'obdStandard': obdStandard,
      if (pidRequestIntervalSeconds != null)
        'pidRequestIntervalSeconds': pidRequestIntervalSeconds,
      if (useExtendedIds != null) 'useExtendedIds': useExtendedIds,
    };
  }
}

/// Information about signal messages using the on-board diagnostics (OBD) II
/// protocol in a vehicle.
class ObdSignal {
  /// The length of a message.
  final int byteLength;

  /// The offset used to calculate the signal value. Combined with scaling, the
  /// calculation is <code>value = raw_value * scaling + offset</code>.
  final double offset;

  /// The diagnostic code used to request data from a vehicle for this signal.
  final int pid;

  /// The length of the requested data.
  final int pidResponseLength;

  /// A multiplier used to decode the message.
  final double scaling;

  /// The mode of operation (diagnostic service) in a message.
  final int serviceMode;

  /// Indicates the beginning of the message.
  final int startByte;

  /// The number of bits to mask in a message.
  final int? bitMaskLength;

  /// The number of positions to shift bits in the message.
  final int? bitRightShift;

  ObdSignal({
    required this.byteLength,
    required this.offset,
    required this.pid,
    required this.pidResponseLength,
    required this.scaling,
    required this.serviceMode,
    required this.startByte,
    this.bitMaskLength,
    this.bitRightShift,
  });

  factory ObdSignal.fromJson(Map<String, dynamic> json) {
    return ObdSignal(
      byteLength: json['byteLength'] as int,
      offset: json['offset'] as double,
      pid: json['pid'] as int,
      pidResponseLength: json['pidResponseLength'] as int,
      scaling: json['scaling'] as double,
      serviceMode: json['serviceMode'] as int,
      startByte: json['startByte'] as int,
      bitMaskLength: json['bitMaskLength'] as int?,
      bitRightShift: json['bitRightShift'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final byteLength = this.byteLength;
    final offset = this.offset;
    final pid = this.pid;
    final pidResponseLength = this.pidResponseLength;
    final scaling = this.scaling;
    final serviceMode = this.serviceMode;
    final startByte = this.startByte;
    final bitMaskLength = this.bitMaskLength;
    final bitRightShift = this.bitRightShift;
    return {
      'byteLength': byteLength,
      'offset': offset,
      'pid': pid,
      'pidResponseLength': pidResponseLength,
      'scaling': scaling,
      'serviceMode': serviceMode,
      'startByte': startByte,
      if (bitMaskLength != null) 'bitMaskLength': bitMaskLength,
      if (bitRightShift != null) 'bitRightShift': bitRightShift,
    };
  }
}

/// Represents a primitive type node of the complex data structure.
class PrimitiveMessageDefinition {
  /// Information about a <code>PrimitiveMessage</code> using a ROS 2 compliant
  /// primitive type message of the complex data structure.
  final ROS2PrimitiveMessageDefinition? ros2PrimitiveMessageDefinition;

  PrimitiveMessageDefinition({
    this.ros2PrimitiveMessageDefinition,
  });

  factory PrimitiveMessageDefinition.fromJson(Map<String, dynamic> json) {
    return PrimitiveMessageDefinition(
      ros2PrimitiveMessageDefinition: json['ros2PrimitiveMessageDefinition'] !=
              null
          ? ROS2PrimitiveMessageDefinition.fromJson(
              json['ros2PrimitiveMessageDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ros2PrimitiveMessageDefinition = this.ros2PrimitiveMessageDefinition;
    return {
      if (ros2PrimitiveMessageDefinition != null)
        'ros2PrimitiveMessageDefinition': ros2PrimitiveMessageDefinition,
    };
  }
}

class PutEncryptionConfigurationResponse {
  /// The encryption status.
  final EncryptionStatus encryptionStatus;

  /// The type of encryption. Set to <code>KMS_BASED_ENCRYPTION</code> to use an
  /// KMS key that you own and manage. Set to
  /// <code>FLEETWISE_DEFAULT_ENCRYPTION</code> to use an Amazon Web Services
  /// managed key that is owned by the Amazon Web Services IoT FleetWise service
  /// account.
  final EncryptionType encryptionType;

  /// The ID of the KMS key that is used for encryption.
  final String? kmsKeyId;

  PutEncryptionConfigurationResponse({
    required this.encryptionStatus,
    required this.encryptionType,
    this.kmsKeyId,
  });

  factory PutEncryptionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutEncryptionConfigurationResponse(
      encryptionStatus:
          (json['encryptionStatus'] as String).toEncryptionStatus(),
      encryptionType: (json['encryptionType'] as String).toEncryptionType(),
      kmsKeyId: json['kmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionStatus = this.encryptionStatus;
    final encryptionType = this.encryptionType;
    final kmsKeyId = this.kmsKeyId;
    return {
      'encryptionStatus': encryptionStatus.toValue(),
      'encryptionType': encryptionType.toValue(),
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
  }
}

class PutLoggingOptionsResponse {
  PutLoggingOptionsResponse();

  factory PutLoggingOptionsResponse.fromJson(Map<String, dynamic> _) {
    return PutLoggingOptionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a ROS 2 compliant primitive type message of the complex data
/// structure.
class ROS2PrimitiveMessageDefinition {
  /// The primitive type (integer, floating point, boolean, etc.) for the ROS 2
  /// primitive message definition.
  final ROS2PrimitiveType primitiveType;

  /// The offset used to calculate the signal value. Combined with scaling, the
  /// calculation is <code>value = raw_value * scaling + offset</code>.
  final double? offset;

  /// A multiplier used to decode the message.
  final double? scaling;

  /// An optional attribute specifying the upper bound for <code>STRING</code> and
  /// <code>WSTRING</code>.
  final int? upperBound;

  ROS2PrimitiveMessageDefinition({
    required this.primitiveType,
    this.offset,
    this.scaling,
    this.upperBound,
  });

  factory ROS2PrimitiveMessageDefinition.fromJson(Map<String, dynamic> json) {
    return ROS2PrimitiveMessageDefinition(
      primitiveType: (json['primitiveType'] as String).toROS2PrimitiveType(),
      offset: json['offset'] as double?,
      scaling: json['scaling'] as double?,
      upperBound: json['upperBound'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final primitiveType = this.primitiveType;
    final offset = this.offset;
    final scaling = this.scaling;
    final upperBound = this.upperBound;
    return {
      'primitiveType': primitiveType.toValue(),
      if (offset != null) 'offset': offset,
      if (scaling != null) 'scaling': scaling,
      if (upperBound != null) 'upperBound': upperBound,
    };
  }
}

enum ROS2PrimitiveType {
  $bool,
  byte,
  char,
  float32,
  float64,
  int8,
  uint8,
  int16,
  uint16,
  int32,
  uint32,
  int64,
  uint64,
  string,
  wstring,
}

extension ROS2PrimitiveTypeValueExtension on ROS2PrimitiveType {
  String toValue() {
    switch (this) {
      case ROS2PrimitiveType.$bool:
        return 'BOOL';
      case ROS2PrimitiveType.byte:
        return 'BYTE';
      case ROS2PrimitiveType.char:
        return 'CHAR';
      case ROS2PrimitiveType.float32:
        return 'FLOAT32';
      case ROS2PrimitiveType.float64:
        return 'FLOAT64';
      case ROS2PrimitiveType.int8:
        return 'INT8';
      case ROS2PrimitiveType.uint8:
        return 'UINT8';
      case ROS2PrimitiveType.int16:
        return 'INT16';
      case ROS2PrimitiveType.uint16:
        return 'UINT16';
      case ROS2PrimitiveType.int32:
        return 'INT32';
      case ROS2PrimitiveType.uint32:
        return 'UINT32';
      case ROS2PrimitiveType.int64:
        return 'INT64';
      case ROS2PrimitiveType.uint64:
        return 'UINT64';
      case ROS2PrimitiveType.string:
        return 'STRING';
      case ROS2PrimitiveType.wstring:
        return 'WSTRING';
    }
  }
}

extension ROS2PrimitiveTypeFromString on String {
  ROS2PrimitiveType toROS2PrimitiveType() {
    switch (this) {
      case 'BOOL':
        return ROS2PrimitiveType.$bool;
      case 'BYTE':
        return ROS2PrimitiveType.byte;
      case 'CHAR':
        return ROS2PrimitiveType.char;
      case 'FLOAT32':
        return ROS2PrimitiveType.float32;
      case 'FLOAT64':
        return ROS2PrimitiveType.float64;
      case 'INT8':
        return ROS2PrimitiveType.int8;
      case 'UINT8':
        return ROS2PrimitiveType.uint8;
      case 'INT16':
        return ROS2PrimitiveType.int16;
      case 'UINT16':
        return ROS2PrimitiveType.uint16;
      case 'INT32':
        return ROS2PrimitiveType.int32;
      case 'UINT32':
        return ROS2PrimitiveType.uint32;
      case 'INT64':
        return ROS2PrimitiveType.int64;
      case 'UINT64':
        return ROS2PrimitiveType.uint64;
      case 'STRING':
        return ROS2PrimitiveType.string;
      case 'WSTRING':
        return ROS2PrimitiveType.wstring;
    }
    throw Exception('$this is not known in enum ROS2PrimitiveType');
  }
}

class RegisterAccountResponse {
  /// The time the account was registered, in seconds since epoch (January 1, 1970
  /// at midnight UTC time).
  final DateTime creationTime;

  /// The registered IAM resource that allows Amazon Web Services IoT FleetWise to
  /// send data to Amazon Timestream.
  final IamResources iamResources;

  /// The time this registration was last updated, in seconds since epoch (January
  /// 1, 1970 at midnight UTC time).
  final DateTime lastModificationTime;

  /// The status of registering your Amazon Web Services account, IAM role, and
  /// Timestream resources.
  final RegistrationStatus registerAccountStatus;
  final TimestreamResources? timestreamResources;

  RegisterAccountResponse({
    required this.creationTime,
    required this.iamResources,
    required this.lastModificationTime,
    required this.registerAccountStatus,
    this.timestreamResources,
  });

  factory RegisterAccountResponse.fromJson(Map<String, dynamic> json) {
    return RegisterAccountResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      iamResources:
          IamResources.fromJson(json['iamResources'] as Map<String, dynamic>),
      lastModificationTime:
          nonNullableTimeStampFromJson(json['lastModificationTime'] as Object),
      registerAccountStatus:
          (json['registerAccountStatus'] as String).toRegistrationStatus(),
      timestreamResources: json['timestreamResources'] != null
          ? TimestreamResources.fromJson(
              json['timestreamResources'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final iamResources = this.iamResources;
    final lastModificationTime = this.lastModificationTime;
    final registerAccountStatus = this.registerAccountStatus;
    final timestreamResources = this.timestreamResources;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'iamResources': iamResources,
      'lastModificationTime': unixTimestampToJson(lastModificationTime),
      'registerAccountStatus': registerAccountStatus.toValue(),
      if (timestreamResources != null)
        'timestreamResources': timestreamResources,
    };
  }
}

enum RegistrationStatus {
  registrationPending,
  registrationSuccess,
  registrationFailure,
}

extension RegistrationStatusValueExtension on RegistrationStatus {
  String toValue() {
    switch (this) {
      case RegistrationStatus.registrationPending:
        return 'REGISTRATION_PENDING';
      case RegistrationStatus.registrationSuccess:
        return 'REGISTRATION_SUCCESS';
      case RegistrationStatus.registrationFailure:
        return 'REGISTRATION_FAILURE';
    }
  }
}

extension RegistrationStatusFromString on String {
  RegistrationStatus toRegistrationStatus() {
    switch (this) {
      case 'REGISTRATION_PENDING':
        return RegistrationStatus.registrationPending;
      case 'REGISTRATION_SUCCESS':
        return RegistrationStatus.registrationSuccess;
      case 'REGISTRATION_FAILURE':
        return RegistrationStatus.registrationFailure;
    }
    throw Exception('$this is not known in enum RegistrationStatus');
  }
}

/// The Amazon S3 bucket where the Amazon Web Services IoT FleetWise campaign
/// sends data. Amazon S3 is an object storage service that stores data as
/// objects within buckets. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-buckets-s3.html">Creating,
/// configuring, and working with Amazon S3 buckets</a> in the <i>Amazon Simple
/// Storage Service User Guide</i>.
class S3Config {
  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket.
  final String bucketArn;

  /// Specify the format that files are saved in the Amazon S3 bucket. You can
  /// save files in an Apache Parquet or JSON format.
  ///
  /// <ul>
  /// <li>
  /// Parquet - Store data in a columnar storage file format. Parquet is optimal
  /// for fast data retrieval and can reduce costs. This option is selected by
  /// default.
  /// </li>
  /// <li>
  /// JSON - Store data in a standard text-based JSON file format.
  /// </li>
  /// </ul>
  final DataFormat? dataFormat;

  /// (Optional) Enter an S3 bucket prefix. The prefix is the string of characters
  /// after the bucket name and before the object name. You can use the prefix to
  /// organize data stored in Amazon S3 buckets. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-prefixes.html">Organizing
  /// objects using prefixes</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  ///
  /// By default, Amazon Web Services IoT FleetWise sets the prefix
  /// <code>processed-data/year=YY/month=MM/date=DD/hour=HH/</code> (in UTC) to
  /// data it delivers to Amazon S3. You can enter a prefix to append it to this
  /// default prefix. For example, if you enter the prefix <code>vehicles</code>,
  /// the prefix will be
  /// <code>vehicles/processed-data/year=YY/month=MM/date=DD/hour=HH/</code>.
  final String? prefix;

  /// By default, stored data is compressed as a .gzip file. Compressed files have
  /// a reduced file size, which can optimize the cost of data storage.
  final StorageCompressionFormat? storageCompressionFormat;

  S3Config({
    required this.bucketArn,
    this.dataFormat,
    this.prefix,
    this.storageCompressionFormat,
  });

  factory S3Config.fromJson(Map<String, dynamic> json) {
    return S3Config(
      bucketArn: json['bucketArn'] as String,
      dataFormat: (json['dataFormat'] as String?)?.toDataFormat(),
      prefix: json['prefix'] as String?,
      storageCompressionFormat: (json['storageCompressionFormat'] as String?)
          ?.toStorageCompressionFormat(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketArn = this.bucketArn;
    final dataFormat = this.dataFormat;
    final prefix = this.prefix;
    final storageCompressionFormat = this.storageCompressionFormat;
    return {
      'bucketArn': bucketArn,
      if (dataFormat != null) 'dataFormat': dataFormat.toValue(),
      if (prefix != null) 'prefix': prefix,
      if (storageCompressionFormat != null)
        'storageCompressionFormat': storageCompressionFormat.toValue(),
    };
  }
}

/// An input component that reports the environmental condition of a vehicle.
/// <note>
/// You can collect data about fluid levels, temperatures, vibrations, or
/// battery voltage from sensors.
/// </note>
class Sensor {
  /// The specified data type of the sensor.
  final NodeDataType dataType;

  /// The fully qualified name of the sensor. For example, the fully qualified
  /// name of a sensor might be <code>Vehicle.Body.Engine.Battery</code>.
  final String fullyQualifiedName;

  /// A list of possible values a sensor can take.
  final List<String>? allowedValues;

  /// A comment in addition to the description.
  final String? comment;

  /// The deprecation message for the node or the branch that was moved or
  /// deleted.
  final String? deprecationMessage;

  /// A brief description of a sensor.
  final String? description;

  /// The specified possible maximum value of the sensor.
  final double? max;

  /// The specified possible minimum value of the sensor.
  final double? min;

  /// The fully qualified name of the struct node for a sensor if the data type of
  /// the actuator is <code>Struct</code> or <code>StructArray</code>. For
  /// example, the struct fully qualified name of a sensor might be
  /// <code>Vehicle.ADAS.CameraStruct</code>.
  final String? structFullyQualifiedName;

  /// The scientific unit of measurement for data collected by the sensor.
  final String? unit;

  Sensor({
    required this.dataType,
    required this.fullyQualifiedName,
    this.allowedValues,
    this.comment,
    this.deprecationMessage,
    this.description,
    this.max,
    this.min,
    this.structFullyQualifiedName,
    this.unit,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      dataType: (json['dataType'] as String).toNodeDataType(),
      fullyQualifiedName: json['fullyQualifiedName'] as String,
      allowedValues: (json['allowedValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      comment: json['comment'] as String?,
      deprecationMessage: json['deprecationMessage'] as String?,
      description: json['description'] as String?,
      max: json['max'] as double?,
      min: json['min'] as double?,
      structFullyQualifiedName: json['structFullyQualifiedName'] as String?,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final fullyQualifiedName = this.fullyQualifiedName;
    final allowedValues = this.allowedValues;
    final comment = this.comment;
    final deprecationMessage = this.deprecationMessage;
    final description = this.description;
    final max = this.max;
    final min = this.min;
    final structFullyQualifiedName = this.structFullyQualifiedName;
    final unit = this.unit;
    return {
      'dataType': dataType.toValue(),
      'fullyQualifiedName': fullyQualifiedName,
      if (allowedValues != null) 'allowedValues': allowedValues,
      if (comment != null) 'comment': comment,
      if (deprecationMessage != null) 'deprecationMessage': deprecationMessage,
      if (description != null) 'description': description,
      if (max != null) 'max': max,
      if (min != null) 'min': min,
      if (structFullyQualifiedName != null)
        'structFullyQualifiedName': structFullyQualifiedName,
      if (unit != null) 'unit': unit,
    };
  }
}

/// Information about a collection of standardized signals, which can be
/// attributes, branches, sensors, or actuators.
class SignalCatalogSummary {
  /// The Amazon Resource Name (ARN) of the signal catalog.
  final String? arn;

  /// The time the signal catalog was created in seconds since epoch (January 1,
  /// 1970 at midnight UTC time).
  final DateTime? creationTime;

  /// The time the signal catalog was last updated in seconds since epoch (January
  /// 1, 1970 at midnight UTC time).
  final DateTime? lastModificationTime;

  /// The name of the signal catalog.
  final String? name;

  SignalCatalogSummary({
    this.arn,
    this.creationTime,
    this.lastModificationTime,
    this.name,
  });

  factory SignalCatalogSummary.fromJson(Map<String, dynamic> json) {
    return SignalCatalogSummary(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      lastModificationTime: timeStampFromJson(json['lastModificationTime']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (lastModificationTime != null)
        'lastModificationTime': unixTimestampToJson(lastModificationTime),
      if (name != null) 'name': name,
    };
  }
}

/// Information about a signal decoder.
class SignalDecoder {
  /// The fully qualified name of a signal decoder as defined in a vehicle model.
  final String fullyQualifiedName;

  /// The ID of a network interface that specifies what network protocol a vehicle
  /// follows.
  final String interfaceId;

  /// The network protocol for the vehicle. For example, <code>CAN_SIGNAL</code>
  /// specifies a protocol that defines how data is communicated between
  /// electronic control units (ECUs). <code>OBD_SIGNAL</code> specifies a
  /// protocol that defines how self-diagnostic data is communicated between ECUs.
  final SignalDecoderType type;

  /// Information about signal decoder using the Controller Area Network (CAN)
  /// protocol.
  final CanSignal? canSignal;

  /// The decoding information for a specific message which supports higher order
  /// data types.
  final MessageSignal? messageSignal;

  /// Information about signal decoder using the On-board diagnostic (OBD) II
  /// protocol.
  final ObdSignal? obdSignal;

  SignalDecoder({
    required this.fullyQualifiedName,
    required this.interfaceId,
    required this.type,
    this.canSignal,
    this.messageSignal,
    this.obdSignal,
  });

  factory SignalDecoder.fromJson(Map<String, dynamic> json) {
    return SignalDecoder(
      fullyQualifiedName: json['fullyQualifiedName'] as String,
      interfaceId: json['interfaceId'] as String,
      type: (json['type'] as String).toSignalDecoderType(),
      canSignal: json['canSignal'] != null
          ? CanSignal.fromJson(json['canSignal'] as Map<String, dynamic>)
          : null,
      messageSignal: json['messageSignal'] != null
          ? MessageSignal.fromJson(
              json['messageSignal'] as Map<String, dynamic>)
          : null,
      obdSignal: json['obdSignal'] != null
          ? ObdSignal.fromJson(json['obdSignal'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fullyQualifiedName = this.fullyQualifiedName;
    final interfaceId = this.interfaceId;
    final type = this.type;
    final canSignal = this.canSignal;
    final messageSignal = this.messageSignal;
    final obdSignal = this.obdSignal;
    return {
      'fullyQualifiedName': fullyQualifiedName,
      'interfaceId': interfaceId,
      'type': type.toValue(),
      if (canSignal != null) 'canSignal': canSignal,
      if (messageSignal != null) 'messageSignal': messageSignal,
      if (obdSignal != null) 'obdSignal': obdSignal,
    };
  }
}

enum SignalDecoderType {
  canSignal,
  obdSignal,
  messageSignal,
}

extension SignalDecoderTypeValueExtension on SignalDecoderType {
  String toValue() {
    switch (this) {
      case SignalDecoderType.canSignal:
        return 'CAN_SIGNAL';
      case SignalDecoderType.obdSignal:
        return 'OBD_SIGNAL';
      case SignalDecoderType.messageSignal:
        return 'MESSAGE_SIGNAL';
    }
  }
}

extension SignalDecoderTypeFromString on String {
  SignalDecoderType toSignalDecoderType() {
    switch (this) {
      case 'CAN_SIGNAL':
        return SignalDecoderType.canSignal;
      case 'OBD_SIGNAL':
        return SignalDecoderType.obdSignal;
      case 'MESSAGE_SIGNAL':
        return SignalDecoderType.messageSignal;
    }
    throw Exception('$this is not known in enum SignalDecoderType');
  }
}

/// Information about a signal.
class SignalInformation {
  /// The name of the signal.
  final String name;

  /// The maximum number of samples to collect.
  final int? maxSampleCount;

  /// The minimum duration of time (in milliseconds) between two triggering events
  /// to collect data.
  /// <note>
  /// If a signal changes often, you might want to collect data at a slower rate.
  /// </note>
  final int? minimumSamplingIntervalMs;

  SignalInformation({
    required this.name,
    this.maxSampleCount,
    this.minimumSamplingIntervalMs,
  });

  factory SignalInformation.fromJson(Map<String, dynamic> json) {
    return SignalInformation(
      name: json['name'] as String,
      maxSampleCount: json['maxSampleCount'] as int?,
      minimumSamplingIntervalMs: json['minimumSamplingIntervalMs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final maxSampleCount = this.maxSampleCount;
    final minimumSamplingIntervalMs = this.minimumSamplingIntervalMs;
    return {
      'name': name,
      if (maxSampleCount != null) 'maxSampleCount': maxSampleCount,
      if (minimumSamplingIntervalMs != null)
        'minimumSamplingIntervalMs': minimumSamplingIntervalMs,
    };
  }
}

enum SignalNodeType {
  sensor,
  actuator,
  attribute,
  branch,
  customStruct,
  customProperty,
}

extension SignalNodeTypeValueExtension on SignalNodeType {
  String toValue() {
    switch (this) {
      case SignalNodeType.sensor:
        return 'SENSOR';
      case SignalNodeType.actuator:
        return 'ACTUATOR';
      case SignalNodeType.attribute:
        return 'ATTRIBUTE';
      case SignalNodeType.branch:
        return 'BRANCH';
      case SignalNodeType.customStruct:
        return 'CUSTOM_STRUCT';
      case SignalNodeType.customProperty:
        return 'CUSTOM_PROPERTY';
    }
  }
}

extension SignalNodeTypeFromString on String {
  SignalNodeType toSignalNodeType() {
    switch (this) {
      case 'SENSOR':
        return SignalNodeType.sensor;
      case 'ACTUATOR':
        return SignalNodeType.actuator;
      case 'ATTRIBUTE':
        return SignalNodeType.attribute;
      case 'BRANCH':
        return SignalNodeType.branch;
      case 'CUSTOM_STRUCT':
        return SignalNodeType.customStruct;
      case 'CUSTOM_PROPERTY':
        return SignalNodeType.customProperty;
    }
    throw Exception('$this is not known in enum SignalNodeType');
  }
}

enum SpoolingMode {
  off,
  toDisk,
}

extension SpoolingModeValueExtension on SpoolingMode {
  String toValue() {
    switch (this) {
      case SpoolingMode.off:
        return 'OFF';
      case SpoolingMode.toDisk:
        return 'TO_DISK';
    }
  }
}

extension SpoolingModeFromString on String {
  SpoolingMode toSpoolingMode() {
    switch (this) {
      case 'OFF':
        return SpoolingMode.off;
      case 'TO_DISK':
        return SpoolingMode.toDisk;
    }
    throw Exception('$this is not known in enum SpoolingMode');
  }
}

enum StorageCompressionFormat {
  none,
  gzip,
}

extension StorageCompressionFormatValueExtension on StorageCompressionFormat {
  String toValue() {
    switch (this) {
      case StorageCompressionFormat.none:
        return 'NONE';
      case StorageCompressionFormat.gzip:
        return 'GZIP';
    }
  }
}

extension StorageCompressionFormatFromString on String {
  StorageCompressionFormat toStorageCompressionFormat() {
    switch (this) {
      case 'NONE':
        return StorageCompressionFormat.none;
      case 'GZIP':
        return StorageCompressionFormat.gzip;
    }
    throw Exception('$this is not known in enum StorageCompressionFormat');
  }
}

/// The structured message for the message signal. It can be defined with either
/// a <code>primitiveMessageDefinition</code>,
/// <code>structuredMessageListDefinition</code>, or
/// <code>structuredMessageDefinition</code> recursively.
class StructuredMessage {
  /// Represents a primitive type node of the complex data structure.
  final PrimitiveMessageDefinition? primitiveMessageDefinition;

  /// Represents a struct type node of the complex data structure.
  final List<StructuredMessageFieldNameAndDataTypePair>?
      structuredMessageDefinition;

  /// Represents a list type node of the complex data structure.
  final StructuredMessageListDefinition? structuredMessageListDefinition;

  StructuredMessage({
    this.primitiveMessageDefinition,
    this.structuredMessageDefinition,
    this.structuredMessageListDefinition,
  });

  factory StructuredMessage.fromJson(Map<String, dynamic> json) {
    return StructuredMessage(
      primitiveMessageDefinition: json['primitiveMessageDefinition'] != null
          ? PrimitiveMessageDefinition.fromJson(
              json['primitiveMessageDefinition'] as Map<String, dynamic>)
          : null,
      structuredMessageDefinition:
          (json['structuredMessageDefinition'] as List?)
              ?.whereNotNull()
              .map((e) => StructuredMessageFieldNameAndDataTypePair.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      structuredMessageListDefinition:
          json['structuredMessageListDefinition'] != null
              ? StructuredMessageListDefinition.fromJson(
                  json['structuredMessageListDefinition']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final primitiveMessageDefinition = this.primitiveMessageDefinition;
    final structuredMessageDefinition = this.structuredMessageDefinition;
    final structuredMessageListDefinition =
        this.structuredMessageListDefinition;
    return {
      if (primitiveMessageDefinition != null)
        'primitiveMessageDefinition': primitiveMessageDefinition,
      if (structuredMessageDefinition != null)
        'structuredMessageDefinition': structuredMessageDefinition,
      if (structuredMessageListDefinition != null)
        'structuredMessageListDefinition': structuredMessageListDefinition,
    };
  }
}

/// Represents a <code>StructureMessageName</code> to <code>DataType</code> map
/// element.
class StructuredMessageFieldNameAndDataTypePair {
  /// The data type.
  final StructuredMessage dataType;

  /// The field name of the structured message. It determines how a data value is
  /// referenced in the target language.
  final String fieldName;

  StructuredMessageFieldNameAndDataTypePair({
    required this.dataType,
    required this.fieldName,
  });

  factory StructuredMessageFieldNameAndDataTypePair.fromJson(
      Map<String, dynamic> json) {
    return StructuredMessageFieldNameAndDataTypePair(
      dataType:
          StructuredMessage.fromJson(json['dataType'] as Map<String, dynamic>),
      fieldName: json['fieldName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final fieldName = this.fieldName;
    return {
      'dataType': dataType,
      'fieldName': fieldName,
    };
  }
}

/// Represents a list type node of the complex data structure.
class StructuredMessageListDefinition {
  /// The type of list of the structured message list definition.
  final StructuredMessageListType listType;

  /// The member type of the structured message list definition.
  final StructuredMessage memberType;

  /// The name of the structured message list definition.
  final String name;

  /// The capacity of the structured message list definition when the list type is
  /// <code>FIXED_CAPACITY</code> or <code>DYNAMIC_BOUNDED_CAPACITY</code>.
  final int? capacity;

  StructuredMessageListDefinition({
    required this.listType,
    required this.memberType,
    required this.name,
    this.capacity,
  });

  factory StructuredMessageListDefinition.fromJson(Map<String, dynamic> json) {
    return StructuredMessageListDefinition(
      listType: (json['listType'] as String).toStructuredMessageListType(),
      memberType: StructuredMessage.fromJson(
          json['memberType'] as Map<String, dynamic>),
      name: json['name'] as String,
      capacity: json['capacity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final listType = this.listType;
    final memberType = this.memberType;
    final name = this.name;
    final capacity = this.capacity;
    return {
      'listType': listType.toValue(),
      'memberType': memberType,
      'name': name,
      if (capacity != null) 'capacity': capacity,
    };
  }
}

enum StructuredMessageListType {
  fixedCapacity,
  dynamicUnboundedCapacity,
  dynamicBoundedCapacity,
}

extension StructuredMessageListTypeValueExtension on StructuredMessageListType {
  String toValue() {
    switch (this) {
      case StructuredMessageListType.fixedCapacity:
        return 'FIXED_CAPACITY';
      case StructuredMessageListType.dynamicUnboundedCapacity:
        return 'DYNAMIC_UNBOUNDED_CAPACITY';
      case StructuredMessageListType.dynamicBoundedCapacity:
        return 'DYNAMIC_BOUNDED_CAPACITY';
    }
  }
}

extension StructuredMessageListTypeFromString on String {
  StructuredMessageListType toStructuredMessageListType() {
    switch (this) {
      case 'FIXED_CAPACITY':
        return StructuredMessageListType.fixedCapacity;
      case 'DYNAMIC_UNBOUNDED_CAPACITY':
        return StructuredMessageListType.dynamicUnboundedCapacity;
      case 'DYNAMIC_BOUNDED_CAPACITY':
        return StructuredMessageListType.dynamicBoundedCapacity;
    }
    throw Exception('$this is not known in enum StructuredMessageListType');
  }
}

/// A set of key/value pairs that are used to manage the resource.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
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

/// Information about a collection scheme that uses a time period to decide how
/// often to collect data.
class TimeBasedCollectionScheme {
  /// The time period (in milliseconds) to decide how often to collect data. For
  /// example, if the time period is <code>60000</code>, the Edge Agent software
  /// collects data once every minute.
  final int periodMs;

  TimeBasedCollectionScheme({
    required this.periodMs,
  });

  factory TimeBasedCollectionScheme.fromJson(Map<String, dynamic> json) {
    return TimeBasedCollectionScheme(
      periodMs: json['periodMs'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final periodMs = this.periodMs;
    return {
      'periodMs': periodMs,
    };
  }
}

/// The Amazon Timestream table where the Amazon Web Services IoT FleetWise
/// campaign sends data. Timestream stores and organizes data to optimize query
/// processing time and to reduce storage costs. For more information, see <a
/// href="https://docs.aws.amazon.com/timestream/latest/developerguide/data-modeling.html">Data
/// modeling</a> in the <i>Amazon Timestream Developer Guide</i>.
class TimestreamConfig {
  /// The Amazon Resource Name (ARN) of the task execution role that grants Amazon
  /// Web Services IoT FleetWise permission to deliver data to the Amazon
  /// Timestream table.
  final String executionRoleArn;

  /// The Amazon Resource Name (ARN) of the Amazon Timestream table.
  final String timestreamTableArn;

  TimestreamConfig({
    required this.executionRoleArn,
    required this.timestreamTableArn,
  });

  factory TimestreamConfig.fromJson(Map<String, dynamic> json) {
    return TimestreamConfig(
      executionRoleArn: json['executionRoleArn'] as String,
      timestreamTableArn: json['timestreamTableArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final executionRoleArn = this.executionRoleArn;
    final timestreamTableArn = this.timestreamTableArn;
    return {
      'executionRoleArn': executionRoleArn,
      'timestreamTableArn': timestreamTableArn,
    };
  }
}

/// Information about the registered Amazon Timestream resources or errors, if
/// any.
class TimestreamRegistrationResponse {
  /// The status of registering your Amazon Timestream resources. The status can
  /// be one of <code>REGISTRATION_SUCCESS</code>,
  /// <code>REGISTRATION_PENDING</code>, <code>REGISTRATION_FAILURE</code>.
  final RegistrationStatus registrationStatus;

  /// The name of the Timestream database.
  final String timestreamDatabaseName;

  /// The name of the Timestream database table.
  final String timestreamTableName;

  /// A message associated with a registration error.
  final String? errorMessage;

  /// The Amazon Resource Name (ARN) of the Timestream database.
  final String? timestreamDatabaseArn;

  /// The ARN of the Timestream database table.
  final String? timestreamTableArn;

  TimestreamRegistrationResponse({
    required this.registrationStatus,
    required this.timestreamDatabaseName,
    required this.timestreamTableName,
    this.errorMessage,
    this.timestreamDatabaseArn,
    this.timestreamTableArn,
  });

  factory TimestreamRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return TimestreamRegistrationResponse(
      registrationStatus:
          (json['registrationStatus'] as String).toRegistrationStatus(),
      timestreamDatabaseName: json['timestreamDatabaseName'] as String,
      timestreamTableName: json['timestreamTableName'] as String,
      errorMessage: json['errorMessage'] as String?,
      timestreamDatabaseArn: json['timestreamDatabaseArn'] as String?,
      timestreamTableArn: json['timestreamTableArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationStatus = this.registrationStatus;
    final timestreamDatabaseName = this.timestreamDatabaseName;
    final timestreamTableName = this.timestreamTableName;
    final errorMessage = this.errorMessage;
    final timestreamDatabaseArn = this.timestreamDatabaseArn;
    final timestreamTableArn = this.timestreamTableArn;
    return {
      'registrationStatus': registrationStatus.toValue(),
      'timestreamDatabaseName': timestreamDatabaseName,
      'timestreamTableName': timestreamTableName,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (timestreamDatabaseArn != null)
        'timestreamDatabaseArn': timestreamDatabaseArn,
      if (timestreamTableArn != null) 'timestreamTableArn': timestreamTableArn,
    };
  }
}

/// The registered Amazon Timestream resources that Amazon Web Services IoT
/// FleetWise edge agent software can transfer your vehicle data to.
class TimestreamResources {
  /// The name of the registered Amazon Timestream database.
  final String timestreamDatabaseName;

  /// The name of the registered Amazon Timestream database table.
  final String timestreamTableName;

  TimestreamResources({
    required this.timestreamDatabaseName,
    required this.timestreamTableName,
  });

  factory TimestreamResources.fromJson(Map<String, dynamic> json) {
    return TimestreamResources(
      timestreamDatabaseName: json['timestreamDatabaseName'] as String,
      timestreamTableName: json['timestreamTableName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final timestreamDatabaseName = this.timestreamDatabaseName;
    final timestreamTableName = this.timestreamTableName;
    return {
      'timestreamDatabaseName': timestreamDatabaseName,
      'timestreamTableName': timestreamTableName,
    };
  }
}

enum TriggerMode {
  always,
  risingEdge,
}

extension TriggerModeValueExtension on TriggerMode {
  String toValue() {
    switch (this) {
      case TriggerMode.always:
        return 'ALWAYS';
      case TriggerMode.risingEdge:
        return 'RISING_EDGE';
    }
  }
}

extension TriggerModeFromString on String {
  TriggerMode toTriggerMode() {
    switch (this) {
      case 'ALWAYS':
        return TriggerMode.always;
      case 'RISING_EDGE':
        return TriggerMode.risingEdge;
    }
    throw Exception('$this is not known in enum TriggerMode');
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

enum UpdateCampaignAction {
  approve,
  suspend,
  resume,
  update,
}

extension UpdateCampaignActionValueExtension on UpdateCampaignAction {
  String toValue() {
    switch (this) {
      case UpdateCampaignAction.approve:
        return 'APPROVE';
      case UpdateCampaignAction.suspend:
        return 'SUSPEND';
      case UpdateCampaignAction.resume:
        return 'RESUME';
      case UpdateCampaignAction.update:
        return 'UPDATE';
    }
  }
}

extension UpdateCampaignActionFromString on String {
  UpdateCampaignAction toUpdateCampaignAction() {
    switch (this) {
      case 'APPROVE':
        return UpdateCampaignAction.approve;
      case 'SUSPEND':
        return UpdateCampaignAction.suspend;
      case 'RESUME':
        return UpdateCampaignAction.resume;
      case 'UPDATE':
        return UpdateCampaignAction.update;
    }
    throw Exception('$this is not known in enum UpdateCampaignAction');
  }
}

class UpdateCampaignResponse {
  /// The Amazon Resource Name (ARN) of the campaign.
  final String? arn;

  /// The name of the updated campaign.
  final String? name;

  /// The state of a campaign. The status can be one of:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - Amazon Web Services IoT FleetWise is processing your
  /// request to create the campaign.
  /// </li>
  /// <li>
  /// <code>WAITING_FOR_APPROVAL</code> - After a campaign is created, it enters
  /// the <code>WAITING_FOR_APPROVAL</code> state. To allow Amazon Web Services
  /// IoT FleetWise to deploy the campaign to the target vehicle or fleet, use the
  /// API operation to approve the campaign.
  /// </li>
  /// <li>
  /// <code>RUNNING</code> - The campaign is active.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code> - The campaign is suspended. To resume the campaign,
  /// use the API operation.
  /// </li>
  /// </ul>
  final CampaignStatus? status;

  UpdateCampaignResponse({
    this.arn,
    this.name,
    this.status,
  });

  factory UpdateCampaignResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCampaignResponse(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toCampaignStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class UpdateDecoderManifestResponse {
  /// The Amazon Resource Name (ARN) of the updated decoder manifest.
  final String arn;

  /// The name of the updated decoder manifest.
  final String name;

  UpdateDecoderManifestResponse({
    required this.arn,
    required this.name,
  });

  factory UpdateDecoderManifestResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDecoderManifestResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      'arn': arn,
      'name': name,
    };
  }
}

class UpdateFleetResponse {
  /// The Amazon Resource Name (ARN) of the updated fleet.
  final String? arn;

  /// The ID of the updated fleet.
  final String? id;

  UpdateFleetResponse({
    this.arn,
    this.id,
  });

  factory UpdateFleetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFleetResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
    };
  }
}

enum UpdateMode {
  overwrite,
  merge,
}

extension UpdateModeValueExtension on UpdateMode {
  String toValue() {
    switch (this) {
      case UpdateMode.overwrite:
        return 'Overwrite';
      case UpdateMode.merge:
        return 'Merge';
    }
  }
}

extension UpdateModeFromString on String {
  UpdateMode toUpdateMode() {
    switch (this) {
      case 'Overwrite':
        return UpdateMode.overwrite;
      case 'Merge':
        return UpdateMode.merge;
    }
    throw Exception('$this is not known in enum UpdateMode');
  }
}

class UpdateModelManifestResponse {
  /// The Amazon Resource Name (ARN) of the updated vehicle model.
  final String arn;

  /// The name of the updated vehicle model.
  final String name;

  UpdateModelManifestResponse({
    required this.arn,
    required this.name,
  });

  factory UpdateModelManifestResponse.fromJson(Map<String, dynamic> json) {
    return UpdateModelManifestResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      'arn': arn,
      'name': name,
    };
  }
}

class UpdateSignalCatalogResponse {
  /// The ARN of the updated signal catalog.
  final String arn;

  /// The name of the updated signal catalog.
  final String name;

  UpdateSignalCatalogResponse({
    required this.arn,
    required this.name,
  });

  factory UpdateSignalCatalogResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSignalCatalogResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      'arn': arn,
      'name': name,
    };
  }
}

/// An HTTP error resulting from updating the description for a vehicle.
class UpdateVehicleError {
  /// The relevant HTTP error code (400+).
  final int? code;

  /// A message associated with the error.
  final String? message;

  /// The ID of the vehicle with the error.
  final String? vehicleName;

  UpdateVehicleError({
    this.code,
    this.message,
    this.vehicleName,
  });

  factory UpdateVehicleError.fromJson(Map<String, dynamic> json) {
    return UpdateVehicleError(
      code: json['code'] as int?,
      message: json['message'] as String?,
      vehicleName: json['vehicleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final vehicleName = this.vehicleName;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
      if (vehicleName != null) 'vehicleName': vehicleName,
    };
  }
}

/// Information about the vehicle to update.
class UpdateVehicleRequestItem {
  /// The unique ID of the vehicle to update.
  final String vehicleName;

  /// The method the specified attributes will update the existing attributes on
  /// the vehicle. Use<code>Overwite</code> to replace the vehicle attributes with
  /// the specified attributes. Or use <code>Merge</code> to combine all
  /// attributes.
  ///
  /// This is required if attributes are present in the input.
  final UpdateMode? attributeUpdateMode;

  /// Static information about a vehicle in a key-value pair. For example:
  ///
  /// <code>"engineType"</code> : <code>"1.3 L R2"</code>
  final Map<String, String>? attributes;

  /// The ARN of the signal decoder manifest associated with the vehicle to
  /// update.
  final String? decoderManifestArn;

  /// The ARN of the vehicle model (model manifest) associated with the vehicle to
  /// update.
  final String? modelManifestArn;

  UpdateVehicleRequestItem({
    required this.vehicleName,
    this.attributeUpdateMode,
    this.attributes,
    this.decoderManifestArn,
    this.modelManifestArn,
  });

  Map<String, dynamic> toJson() {
    final vehicleName = this.vehicleName;
    final attributeUpdateMode = this.attributeUpdateMode;
    final attributes = this.attributes;
    final decoderManifestArn = this.decoderManifestArn;
    final modelManifestArn = this.modelManifestArn;
    return {
      'vehicleName': vehicleName,
      if (attributeUpdateMode != null)
        'attributeUpdateMode': attributeUpdateMode.toValue(),
      if (attributes != null) 'attributes': attributes,
      if (decoderManifestArn != null) 'decoderManifestArn': decoderManifestArn,
      if (modelManifestArn != null) 'modelManifestArn': modelManifestArn,
    };
  }
}

class UpdateVehicleResponse {
  /// The ARN of the updated vehicle.
  final String? arn;

  /// The ID of the updated vehicle.
  final String? vehicleName;

  UpdateVehicleResponse({
    this.arn,
    this.vehicleName,
  });

  factory UpdateVehicleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVehicleResponse(
      arn: json['arn'] as String?,
      vehicleName: json['vehicleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final vehicleName = this.vehicleName;
    return {
      if (arn != null) 'arn': arn,
      if (vehicleName != null) 'vehicleName': vehicleName,
    };
  }
}

/// Information about the updated vehicle.
class UpdateVehicleResponseItem {
  /// The Amazon Resource Name (ARN) of the updated vehicle.
  final String? arn;

  /// The unique ID of the updated vehicle.
  final String? vehicleName;

  UpdateVehicleResponseItem({
    this.arn,
    this.vehicleName,
  });

  factory UpdateVehicleResponseItem.fromJson(Map<String, dynamic> json) {
    return UpdateVehicleResponseItem(
      arn: json['arn'] as String?,
      vehicleName: json['vehicleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final vehicleName = this.vehicleName;
    return {
      if (arn != null) 'arn': arn,
      if (vehicleName != null) 'vehicleName': vehicleName,
    };
  }
}

enum VehicleAssociationBehavior {
  createIotThing,
  validateIotThingExists,
}

extension VehicleAssociationBehaviorValueExtension
    on VehicleAssociationBehavior {
  String toValue() {
    switch (this) {
      case VehicleAssociationBehavior.createIotThing:
        return 'CreateIotThing';
      case VehicleAssociationBehavior.validateIotThingExists:
        return 'ValidateIotThingExists';
    }
  }
}

extension VehicleAssociationBehaviorFromString on String {
  VehicleAssociationBehavior toVehicleAssociationBehavior() {
    switch (this) {
      case 'CreateIotThing':
        return VehicleAssociationBehavior.createIotThing;
      case 'ValidateIotThingExists':
        return VehicleAssociationBehavior.validateIotThingExists;
    }
    throw Exception('$this is not known in enum VehicleAssociationBehavior');
  }
}

/// The vehicle middleware defined as a type of network interface. Examples of
/// vehicle middleware include <code>ROS2</code> and <code>SOME/IP</code>.
class VehicleMiddleware {
  /// The name of the vehicle middleware.
  final String name;

  /// The protocol name of the vehicle middleware.
  final VehicleMiddlewareProtocol protocolName;

  VehicleMiddleware({
    required this.name,
    required this.protocolName,
  });

  factory VehicleMiddleware.fromJson(Map<String, dynamic> json) {
    return VehicleMiddleware(
      name: json['name'] as String,
      protocolName:
          (json['protocolName'] as String).toVehicleMiddlewareProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final protocolName = this.protocolName;
    return {
      'name': name,
      'protocolName': protocolName.toValue(),
    };
  }
}

enum VehicleMiddlewareProtocol {
  ros_2,
}

extension VehicleMiddlewareProtocolValueExtension on VehicleMiddlewareProtocol {
  String toValue() {
    switch (this) {
      case VehicleMiddlewareProtocol.ros_2:
        return 'ROS_2';
    }
  }
}

extension VehicleMiddlewareProtocolFromString on String {
  VehicleMiddlewareProtocol toVehicleMiddlewareProtocol() {
    switch (this) {
      case 'ROS_2':
        return VehicleMiddlewareProtocol.ros_2;
    }
    throw Exception('$this is not known in enum VehicleMiddlewareProtocol');
  }
}

enum VehicleState {
  created,
  ready,
  healthy,
  suspended,
  deleting,
}

extension VehicleStateValueExtension on VehicleState {
  String toValue() {
    switch (this) {
      case VehicleState.created:
        return 'CREATED';
      case VehicleState.ready:
        return 'READY';
      case VehicleState.healthy:
        return 'HEALTHY';
      case VehicleState.suspended:
        return 'SUSPENDED';
      case VehicleState.deleting:
        return 'DELETING';
    }
  }
}

extension VehicleStateFromString on String {
  VehicleState toVehicleState() {
    switch (this) {
      case 'CREATED':
        return VehicleState.created;
      case 'READY':
        return VehicleState.ready;
      case 'HEALTHY':
        return VehicleState.healthy;
      case 'SUSPENDED':
        return VehicleState.suspended;
      case 'DELETING':
        return VehicleState.deleting;
    }
    throw Exception('$this is not known in enum VehicleState');
  }
}

/// Information about the state of a vehicle and how it relates to the status of
/// a campaign.
class VehicleStatus {
  /// The name of a campaign.
  final String? campaignName;

  /// The state of a vehicle, which can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATED</code> - Amazon Web Services IoT FleetWise sucessfully created
  /// the vehicle.
  /// </li>
  /// <li>
  /// <code>READY</code> - The vehicle is ready to receive a campaign deployment.
  /// </li>
  /// <li>
  /// <code>HEALTHY</code> - A campaign deployment was delivered to the vehicle.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code> - A campaign associated with the vehicle was
  /// suspended and data collection was paused.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - Amazon Web Services IoT FleetWise is removing a
  /// campaign from the vehicle.
  /// </li>
  /// </ul>
  final VehicleState? status;

  /// The unique ID of the vehicle.
  final String? vehicleName;

  VehicleStatus({
    this.campaignName,
    this.status,
    this.vehicleName,
  });

  factory VehicleStatus.fromJson(Map<String, dynamic> json) {
    return VehicleStatus(
      campaignName: json['campaignName'] as String?,
      status: (json['status'] as String?)?.toVehicleState(),
      vehicleName: json['vehicleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final campaignName = this.campaignName;
    final status = this.status;
    final vehicleName = this.vehicleName;
    return {
      if (campaignName != null) 'campaignName': campaignName,
      if (status != null) 'status': status.toValue(),
      if (vehicleName != null) 'vehicleName': vehicleName,
    };
  }
}

/// Information about a vehicle.
///
/// To return this information about vehicles in your account, you can use the
/// API operation.
class VehicleSummary {
  /// The Amazon Resource Name (ARN) of the vehicle.
  final String arn;

  /// The time the vehicle was created in seconds since epoch (January 1, 1970 at
  /// midnight UTC time).
  final DateTime creationTime;

  /// The ARN of a decoder manifest associated with the vehicle.
  final String decoderManifestArn;

  /// The time the vehicle was last updated in seconds since epoch (January 1,
  /// 1970 at midnight UTC time).
  final DateTime lastModificationTime;

  /// The ARN of a vehicle model (model manifest) associated with the vehicle.
  final String modelManifestArn;

  /// The unique ID of the vehicle.
  final String vehicleName;

  /// Static information about a vehicle in a key-value pair. For example:
  ///
  /// <code>"engineType"</code> : <code>"1.3 L R2"</code>
  final Map<String, String>? attributes;

  VehicleSummary({
    required this.arn,
    required this.creationTime,
    required this.decoderManifestArn,
    required this.lastModificationTime,
    required this.modelManifestArn,
    required this.vehicleName,
    this.attributes,
  });

  factory VehicleSummary.fromJson(Map<String, dynamic> json) {
    return VehicleSummary(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      decoderManifestArn: json['decoderManifestArn'] as String,
      lastModificationTime:
          nonNullableTimeStampFromJson(json['lastModificationTime'] as Object),
      modelManifestArn: json['modelManifestArn'] as String,
      vehicleName: json['vehicleName'] as String,
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final decoderManifestArn = this.decoderManifestArn;
    final lastModificationTime = this.lastModificationTime;
    final modelManifestArn = this.modelManifestArn;
    final vehicleName = this.vehicleName;
    final attributes = this.attributes;
    return {
      'arn': arn,
      'creationTime': unixTimestampToJson(creationTime),
      'decoderManifestArn': decoderManifestArn,
      'lastModificationTime': unixTimestampToJson(lastModificationTime),
      'modelManifestArn': modelManifestArn,
      'vehicleName': vehicleName,
      if (attributes != null) 'attributes': attributes,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class DecoderManifestValidationException extends _s.GenericAwsException {
  DecoderManifestValidationException({String? type, String? message})
      : super(
            type: type,
            code: 'DecoderManifestValidationException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidNodeException extends _s.GenericAwsException {
  InvalidNodeException({String? type, String? message})
      : super(type: type, code: 'InvalidNodeException', message: message);
}

class InvalidSignalsException extends _s.GenericAwsException {
  InvalidSignalsException({String? type, String? message})
      : super(type: type, code: 'InvalidSignalsException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'DecoderManifestValidationException': (type, message) =>
      DecoderManifestValidationException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidNodeException': (type, message) =>
      InvalidNodeException(type: type, message: message),
  'InvalidSignalsException': (type, message) =>
      InvalidSignalsException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
