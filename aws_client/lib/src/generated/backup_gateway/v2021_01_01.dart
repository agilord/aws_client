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

/// Backup gateway connects Backup to your hypervisor, so you can create, store,
/// and restore backups of your virtual machines (VMs) anywhere, whether
/// on-premises or in the VMware Cloud (VMC) on Amazon Web Services.
class BackupGateway {
  final _s.JsonProtocol _protocol;
  BackupGateway({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'backup-gateway',
            signingName: 'backup-gateway',
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

  /// Associates a backup gateway with your server. After you complete the
  /// association process, you can back up and restore your VMs through the
  /// gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway. Use the
  /// <code>ListGateways</code> operation to return a list of gateways for your
  /// account and Amazon Web Services Region.
  ///
  /// Parameter [serverArn] :
  /// The Amazon Resource Name (ARN) of the server that hosts your virtual
  /// machines.
  Future<AssociateGatewayToServerOutput> associateGatewayToServer({
    required String gatewayArn,
    required String serverArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.AssociateGatewayToServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayArn': gatewayArn,
        'ServerArn': serverArn,
      },
    );

    return AssociateGatewayToServerOutput.fromJson(jsonResponse.body);
  }

  /// Creates a backup gateway. After you create a gateway, you can associate it
  /// with a server using the <code>AssociateGatewayToServer</code> operation.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [activationKey] :
  /// The activation key of the created gateway.
  ///
  /// Parameter [gatewayDisplayName] :
  /// The display name of the created gateway.
  ///
  /// Parameter [gatewayType] :
  /// The type of created gateway.
  ///
  /// Parameter [tags] :
  /// A list of up to 50 tags to assign to the gateway. Each tag is a key-value
  /// pair.
  Future<CreateGatewayOutput> createGateway({
    required String activationKey,
    required String gatewayDisplayName,
    required GatewayType gatewayType,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.CreateGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ActivationKey': activationKey,
        'GatewayDisplayName': gatewayDisplayName,
        'GatewayType': gatewayType.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateGatewayOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a backup gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway to delete.
  Future<DeleteGatewayOutput> deleteGateway({
    required String gatewayArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.DeleteGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayArn': gatewayArn,
      },
    );

    return DeleteGatewayOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a hypervisor.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [hypervisorArn] :
  /// The Amazon Resource Name (ARN) of the hypervisor to delete.
  Future<DeleteHypervisorOutput> deleteHypervisor({
    required String hypervisorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.DeleteHypervisor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HypervisorArn': hypervisorArn,
      },
    );

    return DeleteHypervisorOutput.fromJson(jsonResponse.body);
  }

  /// Disassociates a backup gateway from the specified server. After the
  /// disassociation process finishes, the gateway can no longer access the
  /// virtual machines on the server.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway to disassociate.
  Future<DisassociateGatewayFromServerOutput> disassociateGatewayFromServer({
    required String gatewayArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.DisassociateGatewayFromServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayArn': gatewayArn,
      },
    );

    return DisassociateGatewayFromServerOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the bandwidth rate limit schedule for a specified gateway. By
  /// default, gateways do not have bandwidth rate limit schedules, which means
  /// no bandwidth rate limiting is in effect. Use this to get a gateway's
  /// bandwidth rate limit schedule.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway. Use the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html">
  /// <code>ListGateways</code> </a> operation to return a list of gateways for
  /// your account and Amazon Web Services Region.
  Future<GetBandwidthRateLimitScheduleOutput> getBandwidthRateLimitSchedule({
    required String gatewayArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.GetBandwidthRateLimitSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayArn': gatewayArn,
      },
    );

    return GetBandwidthRateLimitScheduleOutput.fromJson(jsonResponse.body);
  }

  /// By providing the ARN (Amazon Resource Name), this API returns the gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway.
  Future<GetGatewayOutput> getGateway({
    required String gatewayArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.GetGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayArn': gatewayArn,
      },
    );

    return GetGatewayOutput.fromJson(jsonResponse.body);
  }

  /// This action requests information about the specified hypervisor to which
  /// the gateway will connect. A hypervisor is hardware, software, or firmware
  /// that creates and manages virtual machines, and allocates resources to
  /// them.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [hypervisorArn] :
  /// The Amazon Resource Name (ARN) of the hypervisor.
  Future<GetHypervisorOutput> getHypervisor({
    required String hypervisorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.GetHypervisor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HypervisorArn': hypervisorArn,
      },
    );

    return GetHypervisorOutput.fromJson(jsonResponse.body);
  }

  /// This action retrieves the property mappings for the specified hypervisor.
  /// A hypervisor property mapping displays the relationship of entity
  /// properties available from the on-premises hypervisor to the properties
  /// available in Amazon Web Services.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [hypervisorArn] :
  /// The Amazon Resource Name (ARN) of the hypervisor.
  Future<GetHypervisorPropertyMappingsOutput> getHypervisorPropertyMappings({
    required String hypervisorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.GetHypervisorPropertyMappings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HypervisorArn': hypervisorArn,
      },
    );

    return GetHypervisorPropertyMappingsOutput.fromJson(jsonResponse.body);
  }

  /// By providing the ARN (Amazon Resource Name), this API returns the virtual
  /// machine.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the virtual machine.
  Future<GetVirtualMachineOutput> getVirtualMachine({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.GetVirtualMachine'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return GetVirtualMachineOutput.fromJson(jsonResponse.body);
  }

  /// Connect to a hypervisor by importing its configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [host] :
  /// The server host of the hypervisor. This can be either an IP address or a
  /// fully-qualified domain name (FQDN).
  ///
  /// Parameter [name] :
  /// The name of the hypervisor.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Key Management Service for the hypervisor.
  ///
  /// Parameter [password] :
  /// The password for the hypervisor.
  ///
  /// Parameter [tags] :
  /// The tags of the hypervisor configuration to import.
  ///
  /// Parameter [username] :
  /// The username for the hypervisor.
  Future<ImportHypervisorConfigurationOutput> importHypervisorConfiguration({
    required String host,
    required String name,
    String? kmsKeyArn,
    String? password,
    List<Tag>? tags,
    String? username,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.ImportHypervisorConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Host': host,
        'Name': name,
        if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
        if (password != null) 'Password': password,
        if (tags != null) 'Tags': tags,
        if (username != null) 'Username': username,
      },
    );

    return ImportHypervisorConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// Lists backup gateways owned by an Amazon Web Services account in an Amazon
  /// Web Services Region. The returned list is ordered by gateway Amazon
  /// Resource Name (ARN).
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of gateways to list.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>MaxResults</code> number of
  /// resources, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  Future<ListGatewaysOutput> listGateways({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.ListGateways'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListGatewaysOutput.fromJson(jsonResponse.body);
  }

  /// Lists your hypervisors.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of hypervisors to list.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>maxResults</code> number of
  /// resources, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  Future<ListHypervisorsOutput> listHypervisors({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.ListHypervisors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListHypervisorsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the tags applied to the resource identified by its Amazon Resource
  /// Name (ARN).
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource's tags to list.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Lists your virtual machines.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [hypervisorArn] :
  /// The Amazon Resource Name (ARN) of the hypervisor connected to your virtual
  /// machine.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of virtual machines to list.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>maxResults</code> number of
  /// resources, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  Future<ListVirtualMachinesOutput> listVirtualMachines({
    String? hypervisorArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.ListVirtualMachines'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (hypervisorArn != null) 'HypervisorArn': hypervisorArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListVirtualMachinesOutput.fromJson(jsonResponse.body);
  }

  /// This action sets the bandwidth rate limit schedule for a specified
  /// gateway. By default, gateways do not have a bandwidth rate limit schedule,
  /// which means no bandwidth rate limiting is in effect. Use this to initiate
  /// a gateway's bandwidth rate limit schedule.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [bandwidthRateLimitIntervals] :
  /// An array containing bandwidth rate limit schedule intervals for a gateway.
  /// When no bandwidth rate limit intervals have been scheduled, the array is
  /// empty.
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway. Use the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html">
  /// <code>ListGateways</code> </a> operation to return a list of gateways for
  /// your account and Amazon Web Services Region.
  Future<PutBandwidthRateLimitScheduleOutput> putBandwidthRateLimitSchedule({
    required List<BandwidthRateLimitInterval> bandwidthRateLimitIntervals,
    required String gatewayArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.PutBandwidthRateLimitSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BandwidthRateLimitIntervals': bandwidthRateLimitIntervals,
        'GatewayArn': gatewayArn,
      },
    );

    return PutBandwidthRateLimitScheduleOutput.fromJson(jsonResponse.body);
  }

  /// This action sets the property mappings for the specified hypervisor. A
  /// hypervisor property mapping displays the relationship of entity properties
  /// available from the on-premises hypervisor to the properties available in
  /// Amazon Web Services.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [hypervisorArn] :
  /// The Amazon Resource Name (ARN) of the hypervisor.
  ///
  /// Parameter [iamRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role.
  ///
  /// Parameter [vmwareToAwsTagMappings] :
  /// This action requests the mappings of on-premises VMware tags to the Amazon
  /// Web Services tags.
  Future<PutHypervisorPropertyMappingsOutput> putHypervisorPropertyMappings({
    required String hypervisorArn,
    required String iamRoleArn,
    required List<VmwareToAwsTagMapping> vmwareToAwsTagMappings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.PutHypervisorPropertyMappings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HypervisorArn': hypervisorArn,
        'IamRoleArn': iamRoleArn,
        'VmwareToAwsTagMappings': vmwareToAwsTagMappings,
      },
    );

    return PutHypervisorPropertyMappingsOutput.fromJson(jsonResponse.body);
  }

  /// Set the maintenance start time for a gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) for the gateway, used to specify its
  /// maintenance start time.
  ///
  /// Parameter [hourOfDay] :
  /// The hour of the day to start maintenance on a gateway.
  ///
  /// Parameter [minuteOfHour] :
  /// The minute of the hour to start maintenance on a gateway.
  ///
  /// Parameter [dayOfMonth] :
  /// The day of the month start maintenance on a gateway.
  ///
  /// Valid values range from <code>Sunday</code> to <code>Saturday</code>.
  ///
  /// Parameter [dayOfWeek] :
  /// The day of the week to start maintenance on a gateway.
  Future<PutMaintenanceStartTimeOutput> putMaintenanceStartTime({
    required String gatewayArn,
    required int hourOfDay,
    required int minuteOfHour,
    int? dayOfMonth,
    int? dayOfWeek,
  }) async {
    _s.validateNumRange(
      'hourOfDay',
      hourOfDay,
      0,
      23,
      isRequired: true,
    );
    _s.validateNumRange(
      'minuteOfHour',
      minuteOfHour,
      0,
      59,
      isRequired: true,
    );
    _s.validateNumRange(
      'dayOfMonth',
      dayOfMonth,
      1,
      31,
    );
    _s.validateNumRange(
      'dayOfWeek',
      dayOfWeek,
      0,
      6,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.PutMaintenanceStartTime'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayArn': gatewayArn,
        'HourOfDay': hourOfDay,
        'MinuteOfHour': minuteOfHour,
        if (dayOfMonth != null) 'DayOfMonth': dayOfMonth,
        if (dayOfWeek != null) 'DayOfWeek': dayOfWeek,
      },
    );

    return PutMaintenanceStartTimeOutput.fromJson(jsonResponse.body);
  }

  /// This action sends a request to sync metadata across the specified virtual
  /// machines.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [hypervisorArn] :
  /// The Amazon Resource Name (ARN) of the hypervisor.
  Future<StartVirtualMachinesMetadataSyncOutput>
      startVirtualMachinesMetadataSync({
    required String hypervisorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'BackupOnPremises_v20210101.StartVirtualMachinesMetadataSync'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HypervisorArn': hypervisorArn,
      },
    );

    return StartVirtualMachinesMetadataSyncOutput.fromJson(jsonResponse.body);
  }

  /// Tag the resource.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource to tag.
  ///
  /// Parameter [tags] :
  /// A list of tags to assign to the resource.
  Future<TagResourceOutput> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return TagResourceOutput.fromJson(jsonResponse.body);
  }

  /// Tests your hypervisor configuration to validate that backup gateway can
  /// connect with the hypervisor and its resources.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway to the hypervisor to test.
  ///
  /// Parameter [host] :
  /// The server host of the hypervisor. This can be either an IP address or a
  /// fully-qualified domain name (FQDN).
  ///
  /// Parameter [password] :
  /// The password for the hypervisor.
  ///
  /// Parameter [username] :
  /// The username for the hypervisor.
  Future<void> testHypervisorConfiguration({
    required String gatewayArn,
    required String host,
    String? password,
    String? username,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.TestHypervisorConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayArn': gatewayArn,
        'Host': host,
        if (password != null) 'Password': password,
        if (username != null) 'Username': username,
      },
    );
  }

  /// Removes tags from the resource.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource from which to remove tags.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys specifying which tags to remove.
  Future<UntagResourceOutput> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UntagResourceOutput.fromJson(jsonResponse.body);
  }

  /// Updates a gateway's name. Specify which gateway to update using the Amazon
  /// Resource Name (ARN) of the gateway in your request.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway to update.
  ///
  /// Parameter [gatewayDisplayName] :
  /// The updated display name of the gateway.
  Future<UpdateGatewayInformationOutput> updateGatewayInformation({
    required String gatewayArn,
    String? gatewayDisplayName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.UpdateGatewayInformation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayArn': gatewayArn,
        if (gatewayDisplayName != null)
          'GatewayDisplayName': gatewayDisplayName,
      },
    );

    return UpdateGatewayInformationOutput.fromJson(jsonResponse.body);
  }

  /// Updates the gateway virtual machine (VM) software. The request immediately
  /// triggers the software update.
  /// <note>
  /// When you make this request, you get a <code>200 OK</code> success response
  /// immediately. However, it might take some time for the update to complete.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway to be updated.
  Future<UpdateGatewaySoftwareNowOutput> updateGatewaySoftwareNow({
    required String gatewayArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.UpdateGatewaySoftwareNow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayArn': gatewayArn,
      },
    );

    return UpdateGatewaySoftwareNowOutput.fromJson(jsonResponse.body);
  }

  /// Updates a hypervisor metadata, including its host, username, and password.
  /// Specify which hypervisor to update using the Amazon Resource Name (ARN) of
  /// the hypervisor in your request.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [hypervisorArn] :
  /// The Amazon Resource Name (ARN) of the hypervisor to update.
  ///
  /// Parameter [host] :
  /// The updated host of the hypervisor. This can be either an IP address or a
  /// fully-qualified domain name (FQDN).
  ///
  /// Parameter [logGroupArn] :
  /// The Amazon Resource Name (ARN) of the group of gateways within the
  /// requested log.
  ///
  /// Parameter [name] :
  /// The updated name for the hypervisor
  ///
  /// Parameter [password] :
  /// The updated password for the hypervisor.
  ///
  /// Parameter [username] :
  /// The updated username for the hypervisor.
  Future<UpdateHypervisorOutput> updateHypervisor({
    required String hypervisorArn,
    String? host,
    String? logGroupArn,
    String? name,
    String? password,
    String? username,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BackupOnPremises_v20210101.UpdateHypervisor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HypervisorArn': hypervisorArn,
        if (host != null) 'Host': host,
        if (logGroupArn != null) 'LogGroupArn': logGroupArn,
        if (name != null) 'Name': name,
        if (password != null) 'Password': password,
        if (username != null) 'Username': username,
      },
    );

    return UpdateHypervisorOutput.fromJson(jsonResponse.body);
  }
}

class AssociateGatewayToServerOutput {
  /// The Amazon Resource Name (ARN) of a gateway.
  final String? gatewayArn;

  AssociateGatewayToServerOutput({
    this.gatewayArn,
  });

  factory AssociateGatewayToServerOutput.fromJson(Map<String, dynamic> json) {
    return AssociateGatewayToServerOutput(
      gatewayArn: json['GatewayArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    return {
      if (gatewayArn != null) 'GatewayArn': gatewayArn,
    };
  }
}

/// Describes a bandwidth rate limit interval for a gateway. A bandwidth rate
/// limit schedule consists of one or more bandwidth rate limit intervals. A
/// bandwidth rate limit interval defines a period of time on one or more days
/// of the week, during which bandwidth rate limits are specified for uploading,
/// downloading, or both.
class BandwidthRateLimitInterval {
  /// The days of the week component of the bandwidth rate limit interval,
  /// represented as ordinal numbers from 0 to 6, where 0 represents Sunday and 6
  /// represents Saturday.
  final List<int> daysOfWeek;

  /// The hour of the day to end the bandwidth rate limit interval.
  final int endHourOfDay;

  /// The minute of the hour to end the bandwidth rate limit interval.
  /// <important>
  /// The bandwidth rate limit interval ends at the end of the minute. To end an
  /// interval at the end of an hour, use the value <code>59</code>.
  /// </important>
  final int endMinuteOfHour;

  /// The hour of the day to start the bandwidth rate limit interval.
  final int startHourOfDay;

  /// The minute of the hour to start the bandwidth rate limit interval. The
  /// interval begins at the start of that minute. To begin an interval exactly at
  /// the start of the hour, use the value <code>0</code>.
  final int startMinuteOfHour;

  /// The average upload rate limit component of the bandwidth rate limit
  /// interval, in bits per second. This field does not appear in the response if
  /// the upload rate limit is not set.
  /// <note>
  /// For Backup Gateway, the minimum value is <code>(Value)</code>.
  /// </note>
  final int? averageUploadRateLimitInBitsPerSec;

  BandwidthRateLimitInterval({
    required this.daysOfWeek,
    required this.endHourOfDay,
    required this.endMinuteOfHour,
    required this.startHourOfDay,
    required this.startMinuteOfHour,
    this.averageUploadRateLimitInBitsPerSec,
  });

  factory BandwidthRateLimitInterval.fromJson(Map<String, dynamic> json) {
    return BandwidthRateLimitInterval(
      daysOfWeek: (json['DaysOfWeek'] as List)
          .whereNotNull()
          .map((e) => e as int)
          .toList(),
      endHourOfDay: json['EndHourOfDay'] as int,
      endMinuteOfHour: json['EndMinuteOfHour'] as int,
      startHourOfDay: json['StartHourOfDay'] as int,
      startMinuteOfHour: json['StartMinuteOfHour'] as int,
      averageUploadRateLimitInBitsPerSec:
          json['AverageUploadRateLimitInBitsPerSec'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final daysOfWeek = this.daysOfWeek;
    final endHourOfDay = this.endHourOfDay;
    final endMinuteOfHour = this.endMinuteOfHour;
    final startHourOfDay = this.startHourOfDay;
    final startMinuteOfHour = this.startMinuteOfHour;
    final averageUploadRateLimitInBitsPerSec =
        this.averageUploadRateLimitInBitsPerSec;
    return {
      'DaysOfWeek': daysOfWeek,
      'EndHourOfDay': endHourOfDay,
      'EndMinuteOfHour': endMinuteOfHour,
      'StartHourOfDay': startHourOfDay,
      'StartMinuteOfHour': startMinuteOfHour,
      if (averageUploadRateLimitInBitsPerSec != null)
        'AverageUploadRateLimitInBitsPerSec':
            averageUploadRateLimitInBitsPerSec,
    };
  }
}

class CreateGatewayOutput {
  /// The Amazon Resource Name (ARN) of the gateway you create.
  final String? gatewayArn;

  CreateGatewayOutput({
    this.gatewayArn,
  });

  factory CreateGatewayOutput.fromJson(Map<String, dynamic> json) {
    return CreateGatewayOutput(
      gatewayArn: json['GatewayArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    return {
      if (gatewayArn != null) 'GatewayArn': gatewayArn,
    };
  }
}

class DeleteGatewayOutput {
  /// The Amazon Resource Name (ARN) of the gateway you deleted.
  final String? gatewayArn;

  DeleteGatewayOutput({
    this.gatewayArn,
  });

  factory DeleteGatewayOutput.fromJson(Map<String, dynamic> json) {
    return DeleteGatewayOutput(
      gatewayArn: json['GatewayArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    return {
      if (gatewayArn != null) 'GatewayArn': gatewayArn,
    };
  }
}

class DeleteHypervisorOutput {
  /// The Amazon Resource Name (ARN) of the hypervisor you deleted.
  final String? hypervisorArn;

  DeleteHypervisorOutput({
    this.hypervisorArn,
  });

  factory DeleteHypervisorOutput.fromJson(Map<String, dynamic> json) {
    return DeleteHypervisorOutput(
      hypervisorArn: json['HypervisorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hypervisorArn = this.hypervisorArn;
    return {
      if (hypervisorArn != null) 'HypervisorArn': hypervisorArn,
    };
  }
}

class DisassociateGatewayFromServerOutput {
  /// The Amazon Resource Name (ARN) of the gateway you disassociated.
  final String? gatewayArn;

  DisassociateGatewayFromServerOutput({
    this.gatewayArn,
  });

  factory DisassociateGatewayFromServerOutput.fromJson(
      Map<String, dynamic> json) {
    return DisassociateGatewayFromServerOutput(
      gatewayArn: json['GatewayArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    return {
      if (gatewayArn != null) 'GatewayArn': gatewayArn,
    };
  }
}

/// A gateway is an Backup Gateway appliance that runs on the customer's network
/// to provide seamless connectivity to backup storage in the Amazon Web
/// Services Cloud.
class Gateway {
  /// The Amazon Resource Name (ARN) of the gateway. Use the
  /// <code>ListGateways</code> operation to return a list of gateways for your
  /// account and Amazon Web Services Region.
  final String? gatewayArn;

  /// The display name of the gateway.
  final String? gatewayDisplayName;

  /// The type of the gateway.
  final GatewayType? gatewayType;

  /// The hypervisor ID of the gateway.
  final String? hypervisorId;

  /// The last time Backup gateway communicated with the gateway, in Unix format
  /// and UTC time.
  final DateTime? lastSeenTime;

  Gateway({
    this.gatewayArn,
    this.gatewayDisplayName,
    this.gatewayType,
    this.hypervisorId,
    this.lastSeenTime,
  });

  factory Gateway.fromJson(Map<String, dynamic> json) {
    return Gateway(
      gatewayArn: json['GatewayArn'] as String?,
      gatewayDisplayName: json['GatewayDisplayName'] as String?,
      gatewayType: (json['GatewayType'] as String?)?.toGatewayType(),
      hypervisorId: json['HypervisorId'] as String?,
      lastSeenTime: timeStampFromJson(json['LastSeenTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    final gatewayDisplayName = this.gatewayDisplayName;
    final gatewayType = this.gatewayType;
    final hypervisorId = this.hypervisorId;
    final lastSeenTime = this.lastSeenTime;
    return {
      if (gatewayArn != null) 'GatewayArn': gatewayArn,
      if (gatewayDisplayName != null) 'GatewayDisplayName': gatewayDisplayName,
      if (gatewayType != null) 'GatewayType': gatewayType.toValue(),
      if (hypervisorId != null) 'HypervisorId': hypervisorId,
      if (lastSeenTime != null)
        'LastSeenTime': unixTimestampToJson(lastSeenTime),
    };
  }
}

/// The details of gateway.
class GatewayDetails {
  /// The Amazon Resource Name (ARN) of the gateway. Use the
  /// <code>ListGateways</code> operation to return a list of gateways for your
  /// account and Amazon Web Services Region.
  final String? gatewayArn;

  /// The display name of the gateway.
  final String? gatewayDisplayName;

  /// The type of the gateway type.
  final GatewayType? gatewayType;

  /// The hypervisor ID of the gateway.
  final String? hypervisorId;

  /// Details showing the last time Backup gateway communicated with the cloud, in
  /// Unix format and UTC time.
  final DateTime? lastSeenTime;

  /// Returns your gateway's weekly maintenance start time including the day and
  /// time of the week. Note that values are in terms of the gateway's time zone.
  /// Can be weekly or monthly.
  final MaintenanceStartTime? maintenanceStartTime;

  /// Details showing the next update availability time of the gateway.
  final DateTime? nextUpdateAvailabilityTime;

  /// The DNS name for the virtual private cloud (VPC) endpoint the gateway uses
  /// to connect to the cloud for backup gateway.
  final String? vpcEndpoint;

  GatewayDetails({
    this.gatewayArn,
    this.gatewayDisplayName,
    this.gatewayType,
    this.hypervisorId,
    this.lastSeenTime,
    this.maintenanceStartTime,
    this.nextUpdateAvailabilityTime,
    this.vpcEndpoint,
  });

  factory GatewayDetails.fromJson(Map<String, dynamic> json) {
    return GatewayDetails(
      gatewayArn: json['GatewayArn'] as String?,
      gatewayDisplayName: json['GatewayDisplayName'] as String?,
      gatewayType: (json['GatewayType'] as String?)?.toGatewayType(),
      hypervisorId: json['HypervisorId'] as String?,
      lastSeenTime: timeStampFromJson(json['LastSeenTime']),
      maintenanceStartTime: json['MaintenanceStartTime'] != null
          ? MaintenanceStartTime.fromJson(
              json['MaintenanceStartTime'] as Map<String, dynamic>)
          : null,
      nextUpdateAvailabilityTime:
          timeStampFromJson(json['NextUpdateAvailabilityTime']),
      vpcEndpoint: json['VpcEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    final gatewayDisplayName = this.gatewayDisplayName;
    final gatewayType = this.gatewayType;
    final hypervisorId = this.hypervisorId;
    final lastSeenTime = this.lastSeenTime;
    final maintenanceStartTime = this.maintenanceStartTime;
    final nextUpdateAvailabilityTime = this.nextUpdateAvailabilityTime;
    final vpcEndpoint = this.vpcEndpoint;
    return {
      if (gatewayArn != null) 'GatewayArn': gatewayArn,
      if (gatewayDisplayName != null) 'GatewayDisplayName': gatewayDisplayName,
      if (gatewayType != null) 'GatewayType': gatewayType.toValue(),
      if (hypervisorId != null) 'HypervisorId': hypervisorId,
      if (lastSeenTime != null)
        'LastSeenTime': unixTimestampToJson(lastSeenTime),
      if (maintenanceStartTime != null)
        'MaintenanceStartTime': maintenanceStartTime,
      if (nextUpdateAvailabilityTime != null)
        'NextUpdateAvailabilityTime':
            unixTimestampToJson(nextUpdateAvailabilityTime),
      if (vpcEndpoint != null) 'VpcEndpoint': vpcEndpoint,
    };
  }
}

enum GatewayType {
  backupVm,
}

extension GatewayTypeValueExtension on GatewayType {
  String toValue() {
    switch (this) {
      case GatewayType.backupVm:
        return 'BACKUP_VM';
    }
  }
}

extension GatewayTypeFromString on String {
  GatewayType toGatewayType() {
    switch (this) {
      case 'BACKUP_VM':
        return GatewayType.backupVm;
    }
    throw Exception('$this is not known in enum GatewayType');
  }
}

class GetBandwidthRateLimitScheduleOutput {
  /// An array containing bandwidth rate limit schedule intervals for a gateway.
  /// When no bandwidth rate limit intervals have been scheduled, the array is
  /// empty.
  final List<BandwidthRateLimitInterval>? bandwidthRateLimitIntervals;

  /// The Amazon Resource Name (ARN) of the gateway. Use the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html">
  /// <code>ListGateways</code> </a> operation to return a list of gateways for
  /// your account and Amazon Web Services Region.
  final String? gatewayArn;

  GetBandwidthRateLimitScheduleOutput({
    this.bandwidthRateLimitIntervals,
    this.gatewayArn,
  });

  factory GetBandwidthRateLimitScheduleOutput.fromJson(
      Map<String, dynamic> json) {
    return GetBandwidthRateLimitScheduleOutput(
      bandwidthRateLimitIntervals: (json['BandwidthRateLimitIntervals']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              BandwidthRateLimitInterval.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatewayArn: json['GatewayArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bandwidthRateLimitIntervals = this.bandwidthRateLimitIntervals;
    final gatewayArn = this.gatewayArn;
    return {
      if (bandwidthRateLimitIntervals != null)
        'BandwidthRateLimitIntervals': bandwidthRateLimitIntervals,
      if (gatewayArn != null) 'GatewayArn': gatewayArn,
    };
  }
}

class GetGatewayOutput {
  /// By providing the ARN (Amazon Resource Name), this API returns the gateway.
  final GatewayDetails? gateway;

  GetGatewayOutput({
    this.gateway,
  });

  factory GetGatewayOutput.fromJson(Map<String, dynamic> json) {
    return GetGatewayOutput(
      gateway: json['Gateway'] != null
          ? GatewayDetails.fromJson(json['Gateway'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gateway = this.gateway;
    return {
      if (gateway != null) 'Gateway': gateway,
    };
  }
}

class GetHypervisorOutput {
  /// Details about the requested hypervisor.
  final HypervisorDetails? hypervisor;

  GetHypervisorOutput({
    this.hypervisor,
  });

  factory GetHypervisorOutput.fromJson(Map<String, dynamic> json) {
    return GetHypervisorOutput(
      hypervisor: json['Hypervisor'] != null
          ? HypervisorDetails.fromJson(
              json['Hypervisor'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hypervisor = this.hypervisor;
    return {
      if (hypervisor != null) 'Hypervisor': hypervisor,
    };
  }
}

class GetHypervisorPropertyMappingsOutput {
  /// The Amazon Resource Name (ARN) of the hypervisor.
  final String? hypervisorArn;

  /// The Amazon Resource Name (ARN) of the IAM role.
  final String? iamRoleArn;

  /// This is a display of the mappings of on-premises VMware tags to the Amazon
  /// Web Services tags.
  final List<VmwareToAwsTagMapping>? vmwareToAwsTagMappings;

  GetHypervisorPropertyMappingsOutput({
    this.hypervisorArn,
    this.iamRoleArn,
    this.vmwareToAwsTagMappings,
  });

  factory GetHypervisorPropertyMappingsOutput.fromJson(
      Map<String, dynamic> json) {
    return GetHypervisorPropertyMappingsOutput(
      hypervisorArn: json['HypervisorArn'] as String?,
      iamRoleArn: json['IamRoleArn'] as String?,
      vmwareToAwsTagMappings: (json['VmwareToAwsTagMappings'] as List?)
          ?.whereNotNull()
          .map((e) => VmwareToAwsTagMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final hypervisorArn = this.hypervisorArn;
    final iamRoleArn = this.iamRoleArn;
    final vmwareToAwsTagMappings = this.vmwareToAwsTagMappings;
    return {
      if (hypervisorArn != null) 'HypervisorArn': hypervisorArn,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (vmwareToAwsTagMappings != null)
        'VmwareToAwsTagMappings': vmwareToAwsTagMappings,
    };
  }
}

class GetVirtualMachineOutput {
  /// This object contains the basic attributes of <code>VirtualMachine</code>
  /// contained by the output of <code>GetVirtualMachine</code>
  final VirtualMachineDetails? virtualMachine;

  GetVirtualMachineOutput({
    this.virtualMachine,
  });

  factory GetVirtualMachineOutput.fromJson(Map<String, dynamic> json) {
    return GetVirtualMachineOutput(
      virtualMachine: json['VirtualMachine'] != null
          ? VirtualMachineDetails.fromJson(
              json['VirtualMachine'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualMachine = this.virtualMachine;
    return {
      if (virtualMachine != null) 'VirtualMachine': virtualMachine,
    };
  }
}

/// Represents the hypervisor's permissions to which the gateway will connect.
///
/// A hypervisor is hardware, software, or firmware that creates and manages
/// virtual machines, and allocates resources to them.
class Hypervisor {
  /// The server host of the hypervisor. This can be either an IP address or a
  /// fully-qualified domain name (FQDN).
  final String? host;

  /// The Amazon Resource Name (ARN) of the hypervisor.
  final String? hypervisorArn;

  /// The Amazon Resource Name (ARN) of the Key Management Service used to encrypt
  /// the hypervisor.
  final String? kmsKeyArn;

  /// The name of the hypervisor.
  final String? name;

  /// The state of the hypervisor.
  final HypervisorState? state;

  Hypervisor({
    this.host,
    this.hypervisorArn,
    this.kmsKeyArn,
    this.name,
    this.state,
  });

  factory Hypervisor.fromJson(Map<String, dynamic> json) {
    return Hypervisor(
      host: json['Host'] as String?,
      hypervisorArn: json['HypervisorArn'] as String?,
      kmsKeyArn: json['KmsKeyArn'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toHypervisorState(),
    );
  }

  Map<String, dynamic> toJson() {
    final host = this.host;
    final hypervisorArn = this.hypervisorArn;
    final kmsKeyArn = this.kmsKeyArn;
    final name = this.name;
    final state = this.state;
    return {
      if (host != null) 'Host': host,
      if (hypervisorArn != null) 'HypervisorArn': hypervisorArn,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// These are the details of the specified hypervisor. A hypervisor is hardware,
/// software, or firmware that creates and manages virtual machines, and
/// allocates resources to them.
class HypervisorDetails {
  /// The server host of the hypervisor. This can be either an IP address or a
  /// fully-qualified domain name (FQDN).
  final String? host;

  /// The Amazon Resource Name (ARN) of the hypervisor.
  final String? hypervisorArn;

  /// The Amazon Resource Name (ARN) of the KMS used to encrypt the hypervisor.
  final String? kmsKeyArn;

  /// This is the time when the most recent successful sync of metadata occurred.
  final DateTime? lastSuccessfulMetadataSyncTime;

  /// This is the most recent status for the indicated metadata sync.
  final SyncMetadataStatus? latestMetadataSyncStatus;

  /// This is the most recent status for the indicated metadata sync.
  final String? latestMetadataSyncStatusMessage;

  /// The Amazon Resource Name (ARN) of the group of gateways within the requested
  /// log.
  final String? logGroupArn;

  /// This is the name of the specified hypervisor.
  final String? name;

  /// This is the current state of the specified hypervisor.
  ///
  /// The possible states are <code>PENDING</code>, <code>ONLINE</code>,
  /// <code>OFFLINE</code>, or <code>ERROR</code>.
  final HypervisorState? state;

  HypervisorDetails({
    this.host,
    this.hypervisorArn,
    this.kmsKeyArn,
    this.lastSuccessfulMetadataSyncTime,
    this.latestMetadataSyncStatus,
    this.latestMetadataSyncStatusMessage,
    this.logGroupArn,
    this.name,
    this.state,
  });

  factory HypervisorDetails.fromJson(Map<String, dynamic> json) {
    return HypervisorDetails(
      host: json['Host'] as String?,
      hypervisorArn: json['HypervisorArn'] as String?,
      kmsKeyArn: json['KmsKeyArn'] as String?,
      lastSuccessfulMetadataSyncTime:
          timeStampFromJson(json['LastSuccessfulMetadataSyncTime']),
      latestMetadataSyncStatus:
          (json['LatestMetadataSyncStatus'] as String?)?.toSyncMetadataStatus(),
      latestMetadataSyncStatusMessage:
          json['LatestMetadataSyncStatusMessage'] as String?,
      logGroupArn: json['LogGroupArn'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toHypervisorState(),
    );
  }

  Map<String, dynamic> toJson() {
    final host = this.host;
    final hypervisorArn = this.hypervisorArn;
    final kmsKeyArn = this.kmsKeyArn;
    final lastSuccessfulMetadataSyncTime = this.lastSuccessfulMetadataSyncTime;
    final latestMetadataSyncStatus = this.latestMetadataSyncStatus;
    final latestMetadataSyncStatusMessage =
        this.latestMetadataSyncStatusMessage;
    final logGroupArn = this.logGroupArn;
    final name = this.name;
    final state = this.state;
    return {
      if (host != null) 'Host': host,
      if (hypervisorArn != null) 'HypervisorArn': hypervisorArn,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (lastSuccessfulMetadataSyncTime != null)
        'LastSuccessfulMetadataSyncTime':
            unixTimestampToJson(lastSuccessfulMetadataSyncTime),
      if (latestMetadataSyncStatus != null)
        'LatestMetadataSyncStatus': latestMetadataSyncStatus.toValue(),
      if (latestMetadataSyncStatusMessage != null)
        'LatestMetadataSyncStatusMessage': latestMetadataSyncStatusMessage,
      if (logGroupArn != null) 'LogGroupArn': logGroupArn,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum HypervisorState {
  pending,
  online,
  offline,
  error,
}

extension HypervisorStateValueExtension on HypervisorState {
  String toValue() {
    switch (this) {
      case HypervisorState.pending:
        return 'PENDING';
      case HypervisorState.online:
        return 'ONLINE';
      case HypervisorState.offline:
        return 'OFFLINE';
      case HypervisorState.error:
        return 'ERROR';
    }
  }
}

extension HypervisorStateFromString on String {
  HypervisorState toHypervisorState() {
    switch (this) {
      case 'PENDING':
        return HypervisorState.pending;
      case 'ONLINE':
        return HypervisorState.online;
      case 'OFFLINE':
        return HypervisorState.offline;
      case 'ERROR':
        return HypervisorState.error;
    }
    throw Exception('$this is not known in enum HypervisorState');
  }
}

class ImportHypervisorConfigurationOutput {
  /// The Amazon Resource Name (ARN) of the hypervisor you disassociated.
  final String? hypervisorArn;

  ImportHypervisorConfigurationOutput({
    this.hypervisorArn,
  });

  factory ImportHypervisorConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return ImportHypervisorConfigurationOutput(
      hypervisorArn: json['HypervisorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hypervisorArn = this.hypervisorArn;
    return {
      if (hypervisorArn != null) 'HypervisorArn': hypervisorArn,
    };
  }
}

class ListGatewaysOutput {
  /// A list of your gateways.
  final List<Gateway>? gateways;

  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>maxResults</code> number of resources,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  ListGatewaysOutput({
    this.gateways,
    this.nextToken,
  });

  factory ListGatewaysOutput.fromJson(Map<String, dynamic> json) {
    return ListGatewaysOutput(
      gateways: (json['Gateways'] as List?)
          ?.whereNotNull()
          .map((e) => Gateway.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gateways = this.gateways;
    final nextToken = this.nextToken;
    return {
      if (gateways != null) 'Gateways': gateways,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListHypervisorsOutput {
  /// A list of your <code>Hypervisor</code> objects, ordered by their Amazon
  /// Resource Names (ARNs).
  final List<Hypervisor>? hypervisors;

  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>maxResults</code> number of resources,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  ListHypervisorsOutput({
    this.hypervisors,
    this.nextToken,
  });

  factory ListHypervisorsOutput.fromJson(Map<String, dynamic> json) {
    return ListHypervisorsOutput(
      hypervisors: (json['Hypervisors'] as List?)
          ?.whereNotNull()
          .map((e) => Hypervisor.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hypervisors = this.hypervisors;
    final nextToken = this.nextToken;
    return {
      if (hypervisors != null) 'Hypervisors': hypervisors,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceOutput {
  /// The Amazon Resource Name (ARN) of the resource's tags that you listed.
  final String? resourceArn;

  /// A list of the resource's tags.
  final List<Tag>? tags;

  ListTagsForResourceOutput({
    this.resourceArn,
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      resourceArn: json['ResourceArn'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListVirtualMachinesOutput {
  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>maxResults</code> number of resources,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// A list of your <code>VirtualMachine</code> objects, ordered by their Amazon
  /// Resource Names (ARNs).
  final List<VirtualMachine>? virtualMachines;

  ListVirtualMachinesOutput({
    this.nextToken,
    this.virtualMachines,
  });

  factory ListVirtualMachinesOutput.fromJson(Map<String, dynamic> json) {
    return ListVirtualMachinesOutput(
      nextToken: json['NextToken'] as String?,
      virtualMachines: (json['VirtualMachines'] as List?)
          ?.whereNotNull()
          .map((e) => VirtualMachine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final virtualMachines = this.virtualMachines;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (virtualMachines != null) 'VirtualMachines': virtualMachines,
    };
  }
}

/// This is your gateway's weekly maintenance start time including the day and
/// time of the week. Note that values are in terms of the gateway's time zone.
/// Can be weekly or monthly.
class MaintenanceStartTime {
  /// The hour component of the maintenance start time represented as <i>hh</i>,
  /// where <i>hh</i> is the hour (0 to 23). The hour of the day is in the time
  /// zone of the gateway.
  final int hourOfDay;

  /// The minute component of the maintenance start time represented as <i>mm</i>,
  /// where <i>mm</i> is the minute (0 to 59). The minute of the hour is in the
  /// time zone of the gateway.
  final int minuteOfHour;

  /// The day of the month component of the maintenance start time represented as
  /// an ordinal number from 1 to 28, where 1 represents the first day of the
  /// month and 28 represents the last day of the month.
  final int? dayOfMonth;

  /// An ordinal number between 0 and 6 that represents the day of the week, where
  /// 0 represents Sunday and 6 represents Saturday. The day of week is in the
  /// time zone of the gateway.
  final int? dayOfWeek;

  MaintenanceStartTime({
    required this.hourOfDay,
    required this.minuteOfHour,
    this.dayOfMonth,
    this.dayOfWeek,
  });

  factory MaintenanceStartTime.fromJson(Map<String, dynamic> json) {
    return MaintenanceStartTime(
      hourOfDay: json['HourOfDay'] as int,
      minuteOfHour: json['MinuteOfHour'] as int,
      dayOfMonth: json['DayOfMonth'] as int?,
      dayOfWeek: json['DayOfWeek'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final hourOfDay = this.hourOfDay;
    final minuteOfHour = this.minuteOfHour;
    final dayOfMonth = this.dayOfMonth;
    final dayOfWeek = this.dayOfWeek;
    return {
      'HourOfDay': hourOfDay,
      'MinuteOfHour': minuteOfHour,
      if (dayOfMonth != null) 'DayOfMonth': dayOfMonth,
      if (dayOfWeek != null) 'DayOfWeek': dayOfWeek,
    };
  }
}

class PutBandwidthRateLimitScheduleOutput {
  /// The Amazon Resource Name (ARN) of the gateway. Use the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html">
  /// <code>ListGateways</code> </a> operation to return a list of gateways for
  /// your account and Amazon Web Services Region.
  final String? gatewayArn;

  PutBandwidthRateLimitScheduleOutput({
    this.gatewayArn,
  });

  factory PutBandwidthRateLimitScheduleOutput.fromJson(
      Map<String, dynamic> json) {
    return PutBandwidthRateLimitScheduleOutput(
      gatewayArn: json['GatewayArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    return {
      if (gatewayArn != null) 'GatewayArn': gatewayArn,
    };
  }
}

class PutHypervisorPropertyMappingsOutput {
  /// The Amazon Resource Name (ARN) of the hypervisor.
  final String? hypervisorArn;

  PutHypervisorPropertyMappingsOutput({
    this.hypervisorArn,
  });

  factory PutHypervisorPropertyMappingsOutput.fromJson(
      Map<String, dynamic> json) {
    return PutHypervisorPropertyMappingsOutput(
      hypervisorArn: json['HypervisorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hypervisorArn = this.hypervisorArn;
    return {
      if (hypervisorArn != null) 'HypervisorArn': hypervisorArn,
    };
  }
}

class PutMaintenanceStartTimeOutput {
  /// The Amazon Resource Name (ARN) of a gateway for which you set the
  /// maintenance start time.
  final String? gatewayArn;

  PutMaintenanceStartTimeOutput({
    this.gatewayArn,
  });

  factory PutMaintenanceStartTimeOutput.fromJson(Map<String, dynamic> json) {
    return PutMaintenanceStartTimeOutput(
      gatewayArn: json['GatewayArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    return {
      if (gatewayArn != null) 'GatewayArn': gatewayArn,
    };
  }
}

class StartVirtualMachinesMetadataSyncOutput {
  /// The Amazon Resource Name (ARN) of the hypervisor.
  final String? hypervisorArn;

  StartVirtualMachinesMetadataSyncOutput({
    this.hypervisorArn,
  });

  factory StartVirtualMachinesMetadataSyncOutput.fromJson(
      Map<String, dynamic> json) {
    return StartVirtualMachinesMetadataSyncOutput(
      hypervisorArn: json['HypervisorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hypervisorArn = this.hypervisorArn;
    return {
      if (hypervisorArn != null) 'HypervisorArn': hypervisorArn,
    };
  }
}

enum SyncMetadataStatus {
  created,
  running,
  failed,
  partiallyFailed,
  succeeded,
}

extension SyncMetadataStatusValueExtension on SyncMetadataStatus {
  String toValue() {
    switch (this) {
      case SyncMetadataStatus.created:
        return 'CREATED';
      case SyncMetadataStatus.running:
        return 'RUNNING';
      case SyncMetadataStatus.failed:
        return 'FAILED';
      case SyncMetadataStatus.partiallyFailed:
        return 'PARTIALLY_FAILED';
      case SyncMetadataStatus.succeeded:
        return 'SUCCEEDED';
    }
  }
}

extension SyncMetadataStatusFromString on String {
  SyncMetadataStatus toSyncMetadataStatus() {
    switch (this) {
      case 'CREATED':
        return SyncMetadataStatus.created;
      case 'RUNNING':
        return SyncMetadataStatus.running;
      case 'FAILED':
        return SyncMetadataStatus.failed;
      case 'PARTIALLY_FAILED':
        return SyncMetadataStatus.partiallyFailed;
      case 'SUCCEEDED':
        return SyncMetadataStatus.succeeded;
    }
    throw Exception('$this is not known in enum SyncMetadataStatus');
  }
}

/// A key-value pair you can use to manage, filter, and search for your
/// resources. Allowed characters include UTF-8 letters, numbers, spaces, and
/// the following characters: + - = . _ : /.
class Tag {
  /// The key part of a tag's key-value pair. The key can't start with
  /// <code>aws:</code>.
  final String key;

  /// The value part of a tag's key-value pair.
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

class TagResourceOutput {
  /// The Amazon Resource Name (ARN) of the resource you tagged.
  final String? resourceARN;

  TagResourceOutput({
    this.resourceARN,
  });

  factory TagResourceOutput.fromJson(Map<String, dynamic> json) {
    return TagResourceOutput(
      resourceARN: json['ResourceARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    return {
      if (resourceARN != null) 'ResourceARN': resourceARN,
    };
  }
}

class TestHypervisorConfigurationOutput {
  TestHypervisorConfigurationOutput();

  factory TestHypervisorConfigurationOutput.fromJson(Map<String, dynamic> _) {
    return TestHypervisorConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceOutput {
  /// The Amazon Resource Name (ARN) of the resource from which you removed tags.
  final String? resourceARN;

  UntagResourceOutput({
    this.resourceARN,
  });

  factory UntagResourceOutput.fromJson(Map<String, dynamic> json) {
    return UntagResourceOutput(
      resourceARN: json['ResourceARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    return {
      if (resourceARN != null) 'ResourceARN': resourceARN,
    };
  }
}

class UpdateGatewayInformationOutput {
  /// The Amazon Resource Name (ARN) of the gateway you updated.
  final String? gatewayArn;

  UpdateGatewayInformationOutput({
    this.gatewayArn,
  });

  factory UpdateGatewayInformationOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGatewayInformationOutput(
      gatewayArn: json['GatewayArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    return {
      if (gatewayArn != null) 'GatewayArn': gatewayArn,
    };
  }
}

class UpdateGatewaySoftwareNowOutput {
  /// The Amazon Resource Name (ARN) of the gateway you updated.
  final String? gatewayArn;

  UpdateGatewaySoftwareNowOutput({
    this.gatewayArn,
  });

  factory UpdateGatewaySoftwareNowOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGatewaySoftwareNowOutput(
      gatewayArn: json['GatewayArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    return {
      if (gatewayArn != null) 'GatewayArn': gatewayArn,
    };
  }
}

class UpdateHypervisorOutput {
  /// The Amazon Resource Name (ARN) of the hypervisor you updated.
  final String? hypervisorArn;

  UpdateHypervisorOutput({
    this.hypervisorArn,
  });

  factory UpdateHypervisorOutput.fromJson(Map<String, dynamic> json) {
    return UpdateHypervisorOutput(
      hypervisorArn: json['HypervisorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hypervisorArn = this.hypervisorArn;
    return {
      if (hypervisorArn != null) 'HypervisorArn': hypervisorArn,
    };
  }
}

/// A virtual machine that is on a hypervisor.
class VirtualMachine {
  /// The host name of the virtual machine.
  final String? hostName;

  /// The ID of the virtual machine's hypervisor.
  final String? hypervisorId;

  /// The most recent date a virtual machine was backed up, in Unix format and UTC
  /// time.
  final DateTime? lastBackupDate;

  /// The name of the virtual machine.
  final String? name;

  /// The path of the virtual machine.
  final String? path;

  /// The Amazon Resource Name (ARN) of the virtual machine. For example,
  /// <code>arn:aws:backup-gateway:us-west-1:0000000000000:vm/vm-0000ABCDEFGIJKL</code>.
  final String? resourceArn;

  VirtualMachine({
    this.hostName,
    this.hypervisorId,
    this.lastBackupDate,
    this.name,
    this.path,
    this.resourceArn,
  });

  factory VirtualMachine.fromJson(Map<String, dynamic> json) {
    return VirtualMachine(
      hostName: json['HostName'] as String?,
      hypervisorId: json['HypervisorId'] as String?,
      lastBackupDate: timeStampFromJson(json['LastBackupDate']),
      name: json['Name'] as String?,
      path: json['Path'] as String?,
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostName = this.hostName;
    final hypervisorId = this.hypervisorId;
    final lastBackupDate = this.lastBackupDate;
    final name = this.name;
    final path = this.path;
    final resourceArn = this.resourceArn;
    return {
      if (hostName != null) 'HostName': hostName,
      if (hypervisorId != null) 'HypervisorId': hypervisorId,
      if (lastBackupDate != null)
        'LastBackupDate': unixTimestampToJson(lastBackupDate),
      if (name != null) 'Name': name,
      if (path != null) 'Path': path,
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

/// Your <code>VirtualMachine</code> objects, ordered by their Amazon Resource
/// Names (ARNs).
class VirtualMachineDetails {
  /// The host name of the virtual machine.
  final String? hostName;

  /// The ID of the virtual machine's hypervisor.
  final String? hypervisorId;

  /// The most recent date a virtual machine was backed up, in Unix format and UTC
  /// time.
  final DateTime? lastBackupDate;

  /// The name of the virtual machine.
  final String? name;

  /// The path of the virtual machine.
  final String? path;

  /// The Amazon Resource Name (ARN) of the virtual machine. For example,
  /// <code>arn:aws:backup-gateway:us-west-1:0000000000000:vm/vm-0000ABCDEFGIJKL</code>.
  final String? resourceArn;

  /// These are the details of the VMware tags associated with the specified
  /// virtual machine.
  final List<VmwareTag>? vmwareTags;

  VirtualMachineDetails({
    this.hostName,
    this.hypervisorId,
    this.lastBackupDate,
    this.name,
    this.path,
    this.resourceArn,
    this.vmwareTags,
  });

  factory VirtualMachineDetails.fromJson(Map<String, dynamic> json) {
    return VirtualMachineDetails(
      hostName: json['HostName'] as String?,
      hypervisorId: json['HypervisorId'] as String?,
      lastBackupDate: timeStampFromJson(json['LastBackupDate']),
      name: json['Name'] as String?,
      path: json['Path'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      vmwareTags: (json['VmwareTags'] as List?)
          ?.whereNotNull()
          .map((e) => VmwareTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final hostName = this.hostName;
    final hypervisorId = this.hypervisorId;
    final lastBackupDate = this.lastBackupDate;
    final name = this.name;
    final path = this.path;
    final resourceArn = this.resourceArn;
    final vmwareTags = this.vmwareTags;
    return {
      if (hostName != null) 'HostName': hostName,
      if (hypervisorId != null) 'HypervisorId': hypervisorId,
      if (lastBackupDate != null)
        'LastBackupDate': unixTimestampToJson(lastBackupDate),
      if (name != null) 'Name': name,
      if (path != null) 'Path': path,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (vmwareTags != null) 'VmwareTags': vmwareTags,
    };
  }
}

/// A VMware tag is a tag attached to a specific virtual machine. A <a
/// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_Tag.html">tag</a>
/// is a key-value pair you can use to manage, filter, and search for your
/// resources.
///
/// The content of VMware tags can be matched to Amazon Web Services tags.
class VmwareTag {
  /// The is the category of VMware.
  final String? vmwareCategory;

  /// This is a user-defined description of a VMware tag.
  final String? vmwareTagDescription;

  /// This is the user-defined name of a VMware tag.
  final String? vmwareTagName;

  VmwareTag({
    this.vmwareCategory,
    this.vmwareTagDescription,
    this.vmwareTagName,
  });

  factory VmwareTag.fromJson(Map<String, dynamic> json) {
    return VmwareTag(
      vmwareCategory: json['VmwareCategory'] as String?,
      vmwareTagDescription: json['VmwareTagDescription'] as String?,
      vmwareTagName: json['VmwareTagName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vmwareCategory = this.vmwareCategory;
    final vmwareTagDescription = this.vmwareTagDescription;
    final vmwareTagName = this.vmwareTagName;
    return {
      if (vmwareCategory != null) 'VmwareCategory': vmwareCategory,
      if (vmwareTagDescription != null)
        'VmwareTagDescription': vmwareTagDescription,
      if (vmwareTagName != null) 'VmwareTagName': vmwareTagName,
    };
  }
}

/// This displays the mapping of on-premises VMware tags to the corresponding
/// Amazon Web Services tags.
class VmwareToAwsTagMapping {
  /// The key part of the Amazon Web Services tag's key-value pair.
  final String awsTagKey;

  /// The value part of the Amazon Web Services tag's key-value pair.
  final String awsTagValue;

  /// The is the category of VMware.
  final String vmwareCategory;

  /// This is the user-defined name of a VMware tag.
  final String vmwareTagName;

  VmwareToAwsTagMapping({
    required this.awsTagKey,
    required this.awsTagValue,
    required this.vmwareCategory,
    required this.vmwareTagName,
  });

  factory VmwareToAwsTagMapping.fromJson(Map<String, dynamic> json) {
    return VmwareToAwsTagMapping(
      awsTagKey: json['AwsTagKey'] as String,
      awsTagValue: json['AwsTagValue'] as String,
      vmwareCategory: json['VmwareCategory'] as String,
      vmwareTagName: json['VmwareTagName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final awsTagKey = this.awsTagKey;
    final awsTagValue = this.awsTagValue;
    final vmwareCategory = this.vmwareCategory;
    final vmwareTagName = this.vmwareTagName;
    return {
      'AwsTagKey': awsTagKey,
      'AwsTagValue': awsTagValue,
      'VmwareCategory': vmwareCategory,
      'VmwareTagName': vmwareTagName,
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

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
