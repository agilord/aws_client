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

/// Backup gateway connects Backup to your hypervisor, so you can create, store,
/// and restore backups of your virtual machines (VMs) anywhere, whether
/// on-premises or in the VMware Cloud (VMC) on Amazon Web Services.
class BackupGateway {
  final _s.JsonProtocol _protocol;
  BackupGateway({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

  /// Associates a backup gateway with your server. After you complete the
  /// association process, you can back up and restore your VMs through the
  /// gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
    ArgumentError.checkNotNull(gatewayArn, 'gatewayArn');
    ArgumentError.checkNotNull(serverArn, 'serverArn');
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
    ArgumentError.checkNotNull(activationKey, 'activationKey');
    ArgumentError.checkNotNull(gatewayDisplayName, 'gatewayDisplayName');
    ArgumentError.checkNotNull(gatewayType, 'gatewayType');
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
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway to delete.
  Future<DeleteGatewayOutput> deleteGateway({
    required String gatewayArn,
  }) async {
    ArgumentError.checkNotNull(gatewayArn, 'gatewayArn');
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
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [hypervisorArn] :
  /// The Amazon Resource Name (ARN) of the hypervisor to delete.
  Future<DeleteHypervisorOutput> deleteHypervisor({
    required String hypervisorArn,
  }) async {
    ArgumentError.checkNotNull(hypervisorArn, 'hypervisorArn');
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
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway to disassociate.
  Future<DisassociateGatewayFromServerOutput> disassociateGatewayFromServer({
    required String gatewayArn,
  }) async {
    ArgumentError.checkNotNull(gatewayArn, 'gatewayArn');
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

  /// By providing the ARN (Amazon Resource Name), this API returns the gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway.
  Future<GetGatewayOutput> getGateway({
    required String gatewayArn,
  }) async {
    ArgumentError.checkNotNull(gatewayArn, 'gatewayArn');
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

  /// Connect to a hypervisor by importing its configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
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
    ArgumentError.checkNotNull(host, 'host');
    ArgumentError.checkNotNull(name, 'name');
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
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource's tags to list.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListVirtualMachinesOutput.fromJson(jsonResponse.body);
  }

  /// Set the maintenance start time for a gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
    ArgumentError.checkNotNull(gatewayArn, 'gatewayArn');
    ArgumentError.checkNotNull(hourOfDay, 'hourOfDay');
    _s.validateNumRange(
      'hourOfDay',
      hourOfDay,
      0,
      23,
      isRequired: true,
    );
    ArgumentError.checkNotNull(minuteOfHour, 'minuteOfHour');
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

  /// Tag the resource.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(gatewayArn, 'gatewayArn');
    ArgumentError.checkNotNull(host, 'host');
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
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
    ArgumentError.checkNotNull(gatewayArn, 'gatewayArn');
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
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway to be updated.
  Future<UpdateGatewaySoftwareNowOutput> updateGatewaySoftwareNow({
    required String gatewayArn,
  }) async {
    ArgumentError.checkNotNull(gatewayArn, 'gatewayArn');
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
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [hypervisorArn] :
  /// The Amazon Resource Name (ARN) of the hypervisor to update.
  ///
  /// Parameter [host] :
  /// The updated host of the hypervisor. This can be either an IP address or a
  /// fully-qualified domain name (FQDN).
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
    String? name,
    String? password,
    String? username,
  }) async {
    ArgumentError.checkNotNull(hypervisorArn, 'hypervisorArn');
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
    final nextUpdateAvailabilityTime = this.nextUpdateAvailabilityTime;
    final vpcEndpoint = this.vpcEndpoint;
    return {
      if (gatewayArn != null) 'GatewayArn': gatewayArn,
      if (gatewayDisplayName != null) 'GatewayDisplayName': gatewayDisplayName,
      if (gatewayType != null) 'GatewayType': gatewayType.toValue(),
      if (hypervisorId != null) 'HypervisorId': hypervisorId,
      if (lastSeenTime != null)
        'LastSeenTime': unixTimestampToJson(lastSeenTime),
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

extension on GatewayType {
  String toValue() {
    switch (this) {
      case GatewayType.backupVm:
        return 'BACKUP_VM';
    }
  }
}

extension on String {
  GatewayType toGatewayType() {
    switch (this) {
      case 'BACKUP_VM':
        return GatewayType.backupVm;
    }
    throw Exception('$this is not known in enum GatewayType');
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

enum HypervisorState {
  pending,
  online,
  offline,
  error,
}

extension on HypervisorState {
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

extension on String {
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
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
