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

/// Amazon Web Services Telco Network Builder (TNB) is a network automation
/// service that helps you deploy and manage telecom networks. AWS TNB helps you
/// with the lifecycle management of your telecommunication network functions
/// throughout planning, deployment, and post-deployment activities.
class TelcoNetworkBuilder {
  final _s.RestJsonProtocol _protocol;
  TelcoNetworkBuilder({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'tnb',
            signingName: 'tnb',
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

  /// Cancels a network operation.
  ///
  /// A network operation is any operation that is done to your network, such as
  /// network instance instantiation or termination.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nsLcmOpOccId] :
  /// The identifier of the network operation.
  Future<void> cancelSolNetworkOperation({
    required String nsLcmOpOccId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/sol/nslcm/v1/ns_lcm_op_occs/${Uri.encodeComponent(nsLcmOpOccId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a function package.
  ///
  /// A function package is a .zip file in CSAR (Cloud Service Archive) format
  /// that contains a network function (an ETSI standard telecommunication
  /// application) and function package descriptor that uses the TOSCA standard
  /// to describe how the network functions should run on your network. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/tnb/latest/ug/function-packages.html">Function
  /// packages</a> in the <i>Amazon Web Services Telco Network Builder User
  /// Guide</i>.
  ///
  /// Creating a function package is the first step for creating a network in
  /// AWS TNB. This request creates an empty container with an ID. The next step
  /// is to upload the actual CSAR zip file into that empty container. To upload
  /// function package content, see <a
  /// href="https://docs.aws.amazon.com/tnb/latest/APIReference/API_PutSolFunctionPackageContent.html">PutSolFunctionPackageContent</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [tags] :
  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search
  /// and filter your resources or track your Amazon Web Services costs.
  Future<CreateSolFunctionPackageOutput> createSolFunctionPackage({
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sol/vnfpkgm/v1/vnf_packages',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSolFunctionPackageOutput.fromJson(response);
  }

  /// Creates a network instance.
  ///
  /// A network instance is a single network created in Amazon Web Services TNB
  /// that can be deployed and on which life-cycle operations (like terminate,
  /// update, and delete) can be performed. Creating a network instance is the
  /// third step after creating a network package. For more information about
  /// network instances, <a
  /// href="https://docs.aws.amazon.com/tnb/latest/ug/network-instances.html">Network
  /// instances</a> in the <i>Amazon Web Services Telco Network Builder User
  /// Guide</i>.
  ///
  /// Once you create a network instance, you can instantiate it. To instantiate
  /// a network, see <a
  /// href="https://docs.aws.amazon.com/tnb/latest/APIReference/API_InstantiateSolNetworkInstance.html">InstantiateSolNetworkInstance</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nsName] :
  /// Network instance name.
  ///
  /// Parameter [nsdInfoId] :
  /// ID for network service descriptor.
  ///
  /// Parameter [nsDescription] :
  /// Network instance description.
  ///
  /// Parameter [tags] :
  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search
  /// and filter your resources or track your Amazon Web Services costs.
  Future<CreateSolNetworkInstanceOutput> createSolNetworkInstance({
    required String nsName,
    required String nsdInfoId,
    String? nsDescription,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'nsName': nsName,
      'nsdInfoId': nsdInfoId,
      if (nsDescription != null) 'nsDescription': nsDescription,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sol/nslcm/v1/ns_instances',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSolNetworkInstanceOutput.fromJson(response);
  }

  /// Creates a network package.
  ///
  /// A network package is a .zip file in CSAR (Cloud Service Archive) format
  /// defines the function packages you want to deploy and the Amazon Web
  /// Services infrastructure you want to deploy them on. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/tnb/latest/ug/network-instances.html">Network
  /// instances</a> in the <i>Amazon Web Services Telco Network Builder User
  /// Guide</i>.
  ///
  /// A network package consists of a network service descriptor (NSD) file
  /// (required) and any additional files (optional), such as scripts specific
  /// to your needs. For example, if you have multiple function packages in your
  /// network package, you can use the NSD to define which network functions
  /// should run in certain VPCs, subnets, or EKS clusters.
  ///
  /// This request creates an empty network package container with an ID. Once
  /// you create a network package, you can upload the network package content
  /// using <a
  /// href="https://docs.aws.amazon.com/tnb/latest/APIReference/API_PutSolNetworkPackageContent.html">PutSolNetworkPackageContent</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [tags] :
  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search
  /// and filter your resources or track your Amazon Web Services costs.
  Future<CreateSolNetworkPackageOutput> createSolNetworkPackage({
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sol/nsd/v1/ns_descriptors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSolNetworkPackageOutput.fromJson(response);
  }

  /// Deletes a function package.
  ///
  /// A function package is a .zip file in CSAR (Cloud Service Archive) format
  /// that contains a network function (an ETSI standard telecommunication
  /// application) and function package descriptor that uses the TOSCA standard
  /// to describe how the network functions should run on your network.
  ///
  /// To delete a function package, the package must be in a disabled state. To
  /// disable a function package, see <a
  /// href="https://docs.aws.amazon.com/tnb/latest/APIReference/API_UpdateSolFunctionPackage.html">UpdateSolFunctionPackage</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [vnfPkgId] :
  /// ID of the function package.
  Future<void> deleteSolFunctionPackage({
    required String vnfPkgId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sol/vnfpkgm/v1/vnf_packages/${Uri.encodeComponent(vnfPkgId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a network instance.
  ///
  /// A network instance is a single network created in Amazon Web Services TNB
  /// that can be deployed and on which life-cycle operations (like terminate,
  /// update, and delete) can be performed.
  ///
  /// To delete a network instance, the instance must be in a stopped or
  /// terminated state. To terminate a network instance, see <a
  /// href="https://docs.aws.amazon.com/tnb/latest/APIReference/API_TerminateSolNetworkInstance.html">TerminateSolNetworkInstance</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nsInstanceId] :
  /// Network instance ID.
  Future<void> deleteSolNetworkInstance({
    required String nsInstanceId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sol/nslcm/v1/ns_instances/${Uri.encodeComponent(nsInstanceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes network package.
  ///
  /// A network package is a .zip file in CSAR (Cloud Service Archive) format
  /// defines the function packages you want to deploy and the Amazon Web
  /// Services infrastructure you want to deploy them on.
  ///
  /// To delete a network package, the package must be in a disable state. To
  /// disable a network package, see <a
  /// href="https://docs.aws.amazon.com/tnb/latest/APIReference/API_UpdateSolNetworkPackage.html">UpdateSolNetworkPackage</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nsdInfoId] :
  /// ID of the network service descriptor in the network package.
  Future<void> deleteSolNetworkPackage({
    required String nsdInfoId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sol/nsd/v1/ns_descriptors/${Uri.encodeComponent(nsdInfoId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the details of a network function instance, including the
  /// instantation state and metadata from the function package descriptor in
  /// the network function package.
  ///
  /// A network function instance is a function in a function package .
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [vnfInstanceId] :
  /// ID of the network function.
  Future<GetSolFunctionInstanceOutput> getSolFunctionInstance({
    required String vnfInstanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sol/vnflcm/v1/vnf_instances/${Uri.encodeComponent(vnfInstanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSolFunctionInstanceOutput.fromJson(response);
  }

  /// Gets the details of an individual function package, such as the
  /// operational state and whether the package is in use.
  ///
  /// A function package is a .zip file in CSAR (Cloud Service Archive) format
  /// that contains a network function (an ETSI standard telecommunication
  /// application) and function package descriptor that uses the TOSCA standard
  /// to describe how the network functions should run on your network..
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [vnfPkgId] :
  /// ID of the function package.
  Future<GetSolFunctionPackageOutput> getSolFunctionPackage({
    required String vnfPkgId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sol/vnfpkgm/v1/vnf_packages/${Uri.encodeComponent(vnfPkgId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSolFunctionPackageOutput.fromJson(response);
  }

  /// Gets the contents of a function package.
  ///
  /// A function package is a .zip file in CSAR (Cloud Service Archive) format
  /// that contains a network function (an ETSI standard telecommunication
  /// application) and function package descriptor that uses the TOSCA standard
  /// to describe how the network functions should run on your network.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [accept] :
  /// The format of the package that you want to download from the function
  /// packages.
  ///
  /// Parameter [vnfPkgId] :
  /// ID of the function package.
  Future<GetSolFunctionPackageContentOutput> getSolFunctionPackageContent({
    required PackageContentType accept,
    required String vnfPkgId,
  }) async {
    final headers = <String, String>{
      'Accept': accept.toValue(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/sol/vnfpkgm/v1/vnf_packages/${Uri.encodeComponent(vnfPkgId)}/package_content',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetSolFunctionPackageContentOutput(
      packageContent: await response.stream.toBytes(),
      contentType: _s
          .extractHeaderStringValue(response.headers, 'Content-Type')
          ?.toPackageContentType(),
    );
  }

  /// Gets a function package descriptor in a function package.
  ///
  /// A function package descriptor is a .yaml file in a function package that
  /// uses the TOSCA standard to describe how the network function in the
  /// function package should run on your network.
  ///
  /// A function package is a .zip file in CSAR (Cloud Service Archive) format
  /// that contains a network function (an ETSI standard telecommunication
  /// application) and function package descriptor that uses the TOSCA standard
  /// to describe how the network functions should run on your network.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [accept] :
  /// Indicates which content types, expressed as MIME types, the client is able
  /// to understand.
  ///
  /// Parameter [vnfPkgId] :
  /// ID of the function package.
  Future<GetSolFunctionPackageDescriptorOutput>
      getSolFunctionPackageDescriptor({
    required DescriptorContentType accept,
    required String vnfPkgId,
  }) async {
    final headers = <String, String>{
      'Accept': accept.toValue(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/sol/vnfpkgm/v1/vnf_packages/${Uri.encodeComponent(vnfPkgId)}/vnfd',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetSolFunctionPackageDescriptorOutput(
      vnfd: await response.stream.toBytes(),
      contentType: _s
          .extractHeaderStringValue(response.headers, 'Content-Type')
          ?.toDescriptorContentType(),
    );
  }

  /// Gets the details of the network instance.
  ///
  /// A network instance is a single network created in Amazon Web Services TNB
  /// that can be deployed and on which life-cycle operations (like terminate,
  /// update, and delete) can be performed.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nsInstanceId] :
  /// ID of the network instance.
  Future<GetSolNetworkInstanceOutput> getSolNetworkInstance({
    required String nsInstanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sol/nslcm/v1/ns_instances/${Uri.encodeComponent(nsInstanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSolNetworkInstanceOutput.fromJson(response);
  }

  /// Gets the details of a network operation, including the tasks involved in
  /// the network operation and the status of the tasks.
  ///
  /// A network operation is any operation that is done to your network, such as
  /// network instance instantiation or termination.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nsLcmOpOccId] :
  /// The identifier of the network operation.
  Future<GetSolNetworkOperationOutput> getSolNetworkOperation({
    required String nsLcmOpOccId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sol/nslcm/v1/ns_lcm_op_occs/${Uri.encodeComponent(nsLcmOpOccId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSolNetworkOperationOutput.fromJson(response);
  }

  /// Gets the details of a network package.
  ///
  /// A network package is a .zip file in CSAR (Cloud Service Archive) format
  /// defines the function packages you want to deploy and the Amazon Web
  /// Services infrastructure you want to deploy them on.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nsdInfoId] :
  /// ID of the network service descriptor in the network package.
  Future<GetSolNetworkPackageOutput> getSolNetworkPackage({
    required String nsdInfoId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sol/nsd/v1/ns_descriptors/${Uri.encodeComponent(nsdInfoId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSolNetworkPackageOutput.fromJson(response);
  }

  /// Gets the contents of a network package.
  ///
  /// A network package is a .zip file in CSAR (Cloud Service Archive) format
  /// defines the function packages you want to deploy and the Amazon Web
  /// Services infrastructure you want to deploy them on.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [accept] :
  /// The format of the package you want to download from the network package.
  ///
  /// Parameter [nsdInfoId] :
  /// ID of the network service descriptor in the network package.
  Future<GetSolNetworkPackageContentOutput> getSolNetworkPackageContent({
    required PackageContentType accept,
    required String nsdInfoId,
  }) async {
    final headers = <String, String>{
      'Accept': accept.toValue(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/sol/nsd/v1/ns_descriptors/${Uri.encodeComponent(nsdInfoId)}/nsd_content',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetSolNetworkPackageContentOutput(
      nsdContent: await response.stream.toBytes(),
      contentType: _s
          .extractHeaderStringValue(response.headers, 'Content-Type')
          ?.toPackageContentType(),
    );
  }

  /// Gets the content of the network service descriptor.
  ///
  /// A network service descriptor is a .yaml file in a network package that
  /// uses the TOSCA standard to describe the network functions you want to
  /// deploy and the Amazon Web Services infrastructure you want to deploy the
  /// network functions on.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nsdInfoId] :
  /// ID of the network service descriptor in the network package.
  Future<GetSolNetworkPackageDescriptorOutput> getSolNetworkPackageDescriptor({
    required String nsdInfoId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/sol/nsd/v1/ns_descriptors/${Uri.encodeComponent(nsdInfoId)}/nsd',
      exceptionFnMap: _exceptionFns,
    );
    return GetSolNetworkPackageDescriptorOutput(
      nsd: await response.stream.toBytes(),
      contentType: _s
          .extractHeaderStringValue(response.headers, 'Content-Type')
          ?.toDescriptorContentType(),
    );
  }

  /// Instantiates a network instance.
  ///
  /// A network instance is a single network created in Amazon Web Services TNB
  /// that can be deployed and on which life-cycle operations (like terminate,
  /// update, and delete) can be performed.
  ///
  /// Before you can instantiate a network instance, you have to create a
  /// network instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/tnb/latest/APIReference/API_CreateSolNetworkInstance.html">CreateSolNetworkInstance</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nsInstanceId] :
  /// ID of the network instance.
  ///
  /// Parameter [additionalParamsForNs] :
  /// Provides values for the configurable properties.
  ///
  /// Parameter [dryRun] :
  /// A check for whether you have the required permissions for the action
  /// without actually making the request and provides an error response. If you
  /// have the required permissions, the error response is
  /// <code>DryRunOperation</code>. Otherwise, it is
  /// <code>UnauthorizedOperation</code>.
  ///
  /// Parameter [tags] :
  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. When you use this API, the
  /// tags are transferred to the network operation that is created. Use tags to
  /// search and filter your resources or track your Amazon Web Services costs.
  Future<InstantiateSolNetworkInstanceOutput> instantiateSolNetworkInstance({
    required String nsInstanceId,
    Document? additionalParamsForNs,
    bool? dryRun,
    Map<String, String>? tags,
  }) async {
    final $query = <String, List<String>>{
      if (dryRun != null) 'dry_run': [dryRun.toString()],
    };
    final $payload = <String, dynamic>{
      if (additionalParamsForNs != null)
        'additionalParamsForNs': additionalParamsForNs,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sol/nslcm/v1/ns_instances/${Uri.encodeComponent(nsInstanceId)}/instantiate',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return InstantiateSolNetworkInstanceOutput.fromJson(response);
  }

  /// Lists network function instances.
  ///
  /// A network function instance is a function in a function package .
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListSolFunctionInstancesOutput> listSolFunctionInstances({
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
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'nextpage_opaque_marker': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sol/vnflcm/v1/vnf_instances',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSolFunctionInstancesOutput.fromJson(response);
  }

  /// Lists information about function packages.
  ///
  /// A function package is a .zip file in CSAR (Cloud Service Archive) format
  /// that contains a network function (an ETSI standard telecommunication
  /// application) and function package descriptor that uses the TOSCA standard
  /// to describe how the network functions should run on your network.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListSolFunctionPackagesOutput> listSolFunctionPackages({
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
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'nextpage_opaque_marker': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sol/vnfpkgm/v1/vnf_packages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSolFunctionPackagesOutput.fromJson(response);
  }

  /// Lists your network instances.
  ///
  /// A network instance is a single network created in Amazon Web Services TNB
  /// that can be deployed and on which life-cycle operations (like terminate,
  /// update, and delete) can be performed.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListSolNetworkInstancesOutput> listSolNetworkInstances({
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
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'nextpage_opaque_marker': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sol/nslcm/v1/ns_instances',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSolNetworkInstancesOutput.fromJson(response);
  }

  /// Lists details for a network operation, including when the operation
  /// started and the status of the operation.
  ///
  /// A network operation is any operation that is done to your network, such as
  /// network instance instantiation or termination.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListSolNetworkOperationsOutput> listSolNetworkOperations({
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
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'nextpage_opaque_marker': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sol/nslcm/v1/ns_lcm_op_occs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSolNetworkOperationsOutput.fromJson(response);
  }

  /// Lists network packages.
  ///
  /// A network package is a .zip file in CSAR (Cloud Service Archive) format
  /// defines the function packages you want to deploy and the Amazon Web
  /// Services infrastructure you want to deploy them on.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListSolNetworkPackagesOutput> listSolNetworkPackages({
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
      if (maxResults != null) 'max_results': [maxResults.toString()],
      if (nextToken != null) 'nextpage_opaque_marker': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sol/nsd/v1/ns_descriptors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSolNetworkPackagesOutput.fromJson(response);
  }

  /// Lists tags for AWS TNB resources.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// Resource ARN.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Uploads the contents of a function package.
  ///
  /// A function package is a .zip file in CSAR (Cloud Service Archive) format
  /// that contains a network function (an ETSI standard telecommunication
  /// application) and function package descriptor that uses the TOSCA standard
  /// to describe how the network functions should run on your network.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [file] :
  /// Function package file.
  ///
  /// Parameter [vnfPkgId] :
  /// Function package ID.
  ///
  /// Parameter [contentType] :
  /// Function package content type.
  Future<PutSolFunctionPackageContentOutput> putSolFunctionPackageContent({
    required Uint8List file,
    required String vnfPkgId,
    PackageContentType? contentType,
  }) async {
    final headers = <String, String>{
      if (contentType != null) 'Content-Type': contentType.toValue(),
    };
    final response = await _protocol.send(
      payload: file,
      method: 'PUT',
      requestUri:
          '/sol/vnfpkgm/v1/vnf_packages/${Uri.encodeComponent(vnfPkgId)}/package_content',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return PutSolFunctionPackageContentOutput.fromJson(response);
  }

  /// Uploads the contents of a network package.
  ///
  /// A network package is a .zip file in CSAR (Cloud Service Archive) format
  /// defines the function packages you want to deploy and the Amazon Web
  /// Services infrastructure you want to deploy them on.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [file] :
  /// Network package file.
  ///
  /// Parameter [nsdInfoId] :
  /// Network service descriptor info ID.
  ///
  /// Parameter [contentType] :
  /// Network package content type.
  Future<PutSolNetworkPackageContentOutput> putSolNetworkPackageContent({
    required Uint8List file,
    required String nsdInfoId,
    PackageContentType? contentType,
  }) async {
    final headers = <String, String>{
      if (contentType != null) 'Content-Type': contentType.toValue(),
    };
    final response = await _protocol.send(
      payload: file,
      method: 'PUT',
      requestUri:
          '/sol/nsd/v1/ns_descriptors/${Uri.encodeComponent(nsdInfoId)}/nsd_content',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return PutSolNetworkPackageContentOutput.fromJson(response);
  }

  /// Tags an AWS TNB resource.
  ///
  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search
  /// and filter your resources or track your Amazon Web Services costs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// Resource ARN.
  ///
  /// Parameter [tags] :
  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search
  /// and filter your resources or track your Amazon Web Services costs.
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

  /// Terminates a network instance.
  ///
  /// A network instance is a single network created in Amazon Web Services TNB
  /// that can be deployed and on which life-cycle operations (like terminate,
  /// update, and delete) can be performed.
  ///
  /// You must terminate a network instance before you can delete it.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nsInstanceId] :
  /// ID of the network instance.
  ///
  /// Parameter [tags] :
  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. When you use this API, the
  /// tags are transferred to the network operation that is created. Use tags to
  /// search and filter your resources or track your Amazon Web Services costs.
  Future<TerminateSolNetworkInstanceOutput> terminateSolNetworkInstance({
    required String nsInstanceId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sol/nslcm/v1/ns_instances/${Uri.encodeComponent(nsInstanceId)}/terminate',
      exceptionFnMap: _exceptionFns,
    );
    return TerminateSolNetworkInstanceOutput.fromJson(response);
  }

  /// Untags an AWS TNB resource.
  ///
  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search
  /// and filter your resources or track your Amazon Web Services costs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// Resource ARN.
  ///
  /// Parameter [tagKeys] :
  /// Tag keys.
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

  /// Updates the operational state of function package.
  ///
  /// A function package is a .zip file in CSAR (Cloud Service Archive) format
  /// that contains a network function (an ETSI standard telecommunication
  /// application) and function package descriptor that uses the TOSCA standard
  /// to describe how the network functions should run on your network.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [operationalState] :
  /// Operational state of the function package.
  ///
  /// Parameter [vnfPkgId] :
  /// ID of the function package.
  Future<UpdateSolFunctionPackageOutput> updateSolFunctionPackage({
    required OperationalState operationalState,
    required String vnfPkgId,
  }) async {
    final $payload = <String, dynamic>{
      'operationalState': operationalState.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/sol/vnfpkgm/v1/vnf_packages/${Uri.encodeComponent(vnfPkgId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSolFunctionPackageOutput.fromJson(response);
  }

  /// Update a network instance.
  ///
  /// A network instance is a single network created in Amazon Web Services TNB
  /// that can be deployed and on which life-cycle operations (like terminate,
  /// update, and delete) can be performed.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nsInstanceId] :
  /// ID of the network instance.
  ///
  /// Parameter [updateType] :
  /// The type of update.
  ///
  /// Parameter [modifyVnfInfoData] :
  /// Identifies the network function information parameters and/or the
  /// configurable properties of the network function to be modified.
  ///
  /// Parameter [tags] :
  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. When you use this API, the
  /// tags are transferred to the network operation that is created. Use tags to
  /// search and filter your resources or track your Amazon Web Services costs.
  Future<UpdateSolNetworkInstanceOutput> updateSolNetworkInstance({
    required String nsInstanceId,
    required UpdateSolNetworkType updateType,
    UpdateSolNetworkModify? modifyVnfInfoData,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'updateType': updateType.toValue(),
      if (modifyVnfInfoData != null) 'modifyVnfInfoData': modifyVnfInfoData,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sol/nslcm/v1/ns_instances/${Uri.encodeComponent(nsInstanceId)}/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSolNetworkInstanceOutput.fromJson(response);
  }

  /// Updates the operational state of a network package.
  ///
  /// A network package is a .zip file in CSAR (Cloud Service Archive) format
  /// defines the function packages you want to deploy and the Amazon Web
  /// Services infrastructure you want to deploy them on.
  ///
  /// A network service descriptor is a .yaml file in a network package that
  /// uses the TOSCA standard to describe the network functions you want to
  /// deploy and the Amazon Web Services infrastructure you want to deploy the
  /// network functions on.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [nsdInfoId] :
  /// ID of the network service descriptor in the network package.
  ///
  /// Parameter [nsdOperationalState] :
  /// Operational state of the network service descriptor in the network
  /// package.
  Future<UpdateSolNetworkPackageOutput> updateSolNetworkPackage({
    required String nsdInfoId,
    required NsdOperationalState nsdOperationalState,
  }) async {
    final $payload = <String, dynamic>{
      'nsdOperationalState': nsdOperationalState.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/sol/nsd/v1/ns_descriptors/${Uri.encodeComponent(nsdInfoId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSolNetworkPackageOutput.fromJson(response);
  }

  /// Validates function package content. This can be used as a dry run before
  /// uploading function package content with <a
  /// href="https://docs.aws.amazon.com/tnb/latest/APIReference/API_PutSolFunctionPackageContent.html">PutSolFunctionPackageContent</a>.
  ///
  /// A function package is a .zip file in CSAR (Cloud Service Archive) format
  /// that contains a network function (an ETSI standard telecommunication
  /// application) and function package descriptor that uses the TOSCA standard
  /// to describe how the network functions should run on your network.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [file] :
  /// Function package file.
  ///
  /// Parameter [vnfPkgId] :
  /// Function package ID.
  ///
  /// Parameter [contentType] :
  /// Function package content type.
  Future<ValidateSolFunctionPackageContentOutput>
      validateSolFunctionPackageContent({
    required Uint8List file,
    required String vnfPkgId,
    PackageContentType? contentType,
  }) async {
    final headers = <String, String>{
      if (contentType != null) 'Content-Type': contentType.toValue(),
    };
    final response = await _protocol.send(
      payload: file,
      method: 'PUT',
      requestUri:
          '/sol/vnfpkgm/v1/vnf_packages/${Uri.encodeComponent(vnfPkgId)}/package_content/validate',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ValidateSolFunctionPackageContentOutput.fromJson(response);
  }

  /// Validates network package content. This can be used as a dry run before
  /// uploading network package content with <a
  /// href="https://docs.aws.amazon.com/tnb/latest/APIReference/API_PutSolNetworkPackageContent.html">PutSolNetworkPackageContent</a>.
  ///
  /// A network package is a .zip file in CSAR (Cloud Service Archive) format
  /// defines the function packages you want to deploy and the Amazon Web
  /// Services infrastructure you want to deploy them on.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [file] :
  /// Network package file.
  ///
  /// Parameter [nsdInfoId] :
  /// Network service descriptor file.
  ///
  /// Parameter [contentType] :
  /// Network package content type.
  Future<ValidateSolNetworkPackageContentOutput>
      validateSolNetworkPackageContent({
    required Uint8List file,
    required String nsdInfoId,
    PackageContentType? contentType,
  }) async {
    final headers = <String, String>{
      if (contentType != null) 'Content-Type': contentType.toValue(),
    };
    final response = await _protocol.send(
      payload: file,
      method: 'PUT',
      requestUri:
          '/sol/nsd/v1/ns_descriptors/${Uri.encodeComponent(nsdInfoId)}/nsd_content/validate',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ValidateSolNetworkPackageContentOutput.fromJson(response);
  }
}

class CreateSolFunctionPackageOutput {
  /// Function package ARN.
  final String arn;

  /// ID of the function package.
  final String id;

  /// Onboarding state of the function package.
  final OnboardingState onboardingState;

  /// Operational state of the function package.
  final OperationalState operationalState;

  /// Usage state of the function package.
  final UsageState usageState;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search and
  /// filter your resources or track your Amazon Web Services costs.
  final Map<String, String>? tags;

  CreateSolFunctionPackageOutput({
    required this.arn,
    required this.id,
    required this.onboardingState,
    required this.operationalState,
    required this.usageState,
    this.tags,
  });

  factory CreateSolFunctionPackageOutput.fromJson(Map<String, dynamic> json) {
    return CreateSolFunctionPackageOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      onboardingState: (json['onboardingState'] as String).toOnboardingState(),
      operationalState:
          (json['operationalState'] as String).toOperationalState(),
      usageState: (json['usageState'] as String).toUsageState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final onboardingState = this.onboardingState;
    final operationalState = this.operationalState;
    final usageState = this.usageState;
    final tags = this.tags;
    return {
      'arn': arn,
      'id': id,
      'onboardingState': onboardingState.toValue(),
      'operationalState': operationalState.toValue(),
      'usageState': usageState.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateSolNetworkInstanceOutput {
  /// Network instance ARN.
  final String arn;

  /// Network instance ID.
  final String id;

  /// Network instance name.
  final String nsInstanceName;

  /// Network service descriptor ID.
  final String nsdInfoId;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search and
  /// filter your resources or track your Amazon Web Services costs.
  final Map<String, String>? tags;

  CreateSolNetworkInstanceOutput({
    required this.arn,
    required this.id,
    required this.nsInstanceName,
    required this.nsdInfoId,
    this.tags,
  });

  factory CreateSolNetworkInstanceOutput.fromJson(Map<String, dynamic> json) {
    return CreateSolNetworkInstanceOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      nsInstanceName: json['nsInstanceName'] as String,
      nsdInfoId: json['nsdInfoId'] as String,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final nsInstanceName = this.nsInstanceName;
    final nsdInfoId = this.nsdInfoId;
    final tags = this.tags;
    return {
      'arn': arn,
      'id': id,
      'nsInstanceName': nsInstanceName,
      'nsdInfoId': nsdInfoId,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateSolNetworkPackageOutput {
  /// Network package ARN.
  final String arn;

  /// ID of the network package.
  final String id;

  /// Onboarding state of the network service descriptor in the network package.
  final NsdOnboardingState nsdOnboardingState;

  /// Operational state of the network service descriptor in the network package.
  final NsdOperationalState nsdOperationalState;

  /// Usage state of the network service descriptor in the network package.
  final NsdUsageState nsdUsageState;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search and
  /// filter your resources or track your Amazon Web Services costs.
  final Map<String, String>? tags;

  CreateSolNetworkPackageOutput({
    required this.arn,
    required this.id,
    required this.nsdOnboardingState,
    required this.nsdOperationalState,
    required this.nsdUsageState,
    this.tags,
  });

  factory CreateSolNetworkPackageOutput.fromJson(Map<String, dynamic> json) {
    return CreateSolNetworkPackageOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      nsdOnboardingState:
          (json['nsdOnboardingState'] as String).toNsdOnboardingState(),
      nsdOperationalState:
          (json['nsdOperationalState'] as String).toNsdOperationalState(),
      nsdUsageState: (json['nsdUsageState'] as String).toNsdUsageState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final nsdOnboardingState = this.nsdOnboardingState;
    final nsdOperationalState = this.nsdOperationalState;
    final nsdUsageState = this.nsdUsageState;
    final tags = this.tags;
    return {
      'arn': arn,
      'id': id,
      'nsdOnboardingState': nsdOnboardingState.toValue(),
      'nsdOperationalState': nsdOperationalState.toValue(),
      'nsdUsageState': nsdUsageState.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

enum DescriptorContentType {
  textPlain,
}

extension DescriptorContentTypeValueExtension on DescriptorContentType {
  String toValue() {
    switch (this) {
      case DescriptorContentType.textPlain:
        return 'text/plain';
    }
  }
}

extension DescriptorContentTypeFromString on String {
  DescriptorContentType toDescriptorContentType() {
    switch (this) {
      case 'text/plain':
        return DescriptorContentType.textPlain;
    }
    throw Exception('$this is not known in enum DescriptorContentType');
  }
}

class Document {
  Document();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides error information.
class ErrorInfo {
  /// Error cause.
  final String? cause;

  /// Error details.
  final String? details;

  ErrorInfo({
    this.cause,
    this.details,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) {
    return ErrorInfo(
      cause: json['cause'] as String?,
      details: json['details'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final details = this.details;
    return {
      if (cause != null) 'cause': cause,
      if (details != null) 'details': details,
    };
  }
}

/// Metadata for function package artifacts.
///
/// Artifacts are the contents of the package descriptor file and the state of
/// the package.
class FunctionArtifactMeta {
  /// Lists of function package overrides.
  final List<ToscaOverride>? overrides;

  FunctionArtifactMeta({
    this.overrides,
  });

  factory FunctionArtifactMeta.fromJson(Map<String, dynamic> json) {
    return FunctionArtifactMeta(
      overrides: (json['overrides'] as List?)
          ?.whereNotNull()
          .map((e) => ToscaOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final overrides = this.overrides;
    return {
      if (overrides != null) 'overrides': overrides,
    };
  }
}

/// The metadata of a network function instance.
///
/// A network function instance is a function in a function package .
class GetSolFunctionInstanceMetadata {
  /// The date that the resource was created.
  final DateTime createdAt;

  /// The date that the resource was last modified.
  final DateTime lastModified;

  GetSolFunctionInstanceMetadata({
    required this.createdAt,
    required this.lastModified,
  });

  factory GetSolFunctionInstanceMetadata.fromJson(Map<String, dynamic> json) {
    return GetSolFunctionInstanceMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModified:
          nonNullableTimeStampFromJson(json['lastModified'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastModified = this.lastModified;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastModified': iso8601ToJson(lastModified),
    };
  }
}

class GetSolFunctionInstanceOutput {
  /// Network function instance ARN.
  final String arn;

  /// Network function instance ID.
  final String id;

  /// Network function instantiation state.
  final VnfInstantiationState instantiationState;
  final GetSolFunctionInstanceMetadata metadata;

  /// Network instance ID.
  final String nsInstanceId;

  /// Function package ID.
  final String vnfPkgId;

  /// Function package descriptor ID.
  final String vnfdId;
  final GetSolVnfInfo? instantiatedVnfInfo;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search and
  /// filter your resources or track your Amazon Web Services costs.
  final Map<String, String>? tags;

  /// Network function product name.
  final String? vnfProductName;

  /// Network function provider.
  final String? vnfProvider;

  /// Function package descriptor version.
  final String? vnfdVersion;

  GetSolFunctionInstanceOutput({
    required this.arn,
    required this.id,
    required this.instantiationState,
    required this.metadata,
    required this.nsInstanceId,
    required this.vnfPkgId,
    required this.vnfdId,
    this.instantiatedVnfInfo,
    this.tags,
    this.vnfProductName,
    this.vnfProvider,
    this.vnfdVersion,
  });

  factory GetSolFunctionInstanceOutput.fromJson(Map<String, dynamic> json) {
    return GetSolFunctionInstanceOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      instantiationState:
          (json['instantiationState'] as String).toVnfInstantiationState(),
      metadata: GetSolFunctionInstanceMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      nsInstanceId: json['nsInstanceId'] as String,
      vnfPkgId: json['vnfPkgId'] as String,
      vnfdId: json['vnfdId'] as String,
      instantiatedVnfInfo: json['instantiatedVnfInfo'] != null
          ? GetSolVnfInfo.fromJson(
              json['instantiatedVnfInfo'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vnfProductName: json['vnfProductName'] as String?,
      vnfProvider: json['vnfProvider'] as String?,
      vnfdVersion: json['vnfdVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final instantiationState = this.instantiationState;
    final metadata = this.metadata;
    final nsInstanceId = this.nsInstanceId;
    final vnfPkgId = this.vnfPkgId;
    final vnfdId = this.vnfdId;
    final instantiatedVnfInfo = this.instantiatedVnfInfo;
    final tags = this.tags;
    final vnfProductName = this.vnfProductName;
    final vnfProvider = this.vnfProvider;
    final vnfdVersion = this.vnfdVersion;
    return {
      'arn': arn,
      'id': id,
      'instantiationState': instantiationState.toValue(),
      'metadata': metadata,
      'nsInstanceId': nsInstanceId,
      'vnfPkgId': vnfPkgId,
      'vnfdId': vnfdId,
      if (instantiatedVnfInfo != null)
        'instantiatedVnfInfo': instantiatedVnfInfo,
      if (tags != null) 'tags': tags,
      if (vnfProductName != null) 'vnfProductName': vnfProductName,
      if (vnfProvider != null) 'vnfProvider': vnfProvider,
      if (vnfdVersion != null) 'vnfdVersion': vnfdVersion,
    };
  }
}

class GetSolFunctionPackageContentOutput {
  /// Indicates the media type of the resource.
  final PackageContentType? contentType;

  /// Contents of the function package.
  final Uint8List? packageContent;

  GetSolFunctionPackageContentOutput({
    this.contentType,
    this.packageContent,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final packageContent = this.packageContent;
    return {
      if (packageContent != null)
        'packageContent': base64Encode(packageContent),
    };
  }
}

class GetSolFunctionPackageDescriptorOutput {
  /// Indicates the media type of the resource.
  final DescriptorContentType? contentType;

  /// Contents of the function package descriptor.
  final Uint8List? vnfd;

  GetSolFunctionPackageDescriptorOutput({
    this.contentType,
    this.vnfd,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final vnfd = this.vnfd;
    return {
      if (vnfd != null) 'vnfd': base64Encode(vnfd),
    };
  }
}

/// Metadata related to the function package.
///
/// A function package is a .zip file in CSAR (Cloud Service Archive) format
/// that contains a network function (an ETSI standard telecommunication
/// application) and function package descriptor that uses the TOSCA standard to
/// describe how the network functions should run on your network.
class GetSolFunctionPackageMetadata {
  /// The date that the resource was created.
  final DateTime createdAt;

  /// The date that the resource was last modified.
  final DateTime lastModified;

  /// Metadata related to the function package descriptor of the function package.
  final FunctionArtifactMeta? vnfd;

  GetSolFunctionPackageMetadata({
    required this.createdAt,
    required this.lastModified,
    this.vnfd,
  });

  factory GetSolFunctionPackageMetadata.fromJson(Map<String, dynamic> json) {
    return GetSolFunctionPackageMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModified:
          nonNullableTimeStampFromJson(json['lastModified'] as Object),
      vnfd: json['vnfd'] != null
          ? FunctionArtifactMeta.fromJson(json['vnfd'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastModified = this.lastModified;
    final vnfd = this.vnfd;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastModified': iso8601ToJson(lastModified),
      if (vnfd != null) 'vnfd': vnfd,
    };
  }
}

class GetSolFunctionPackageOutput {
  /// Function package ARN.
  final String arn;

  /// Function package ID.
  final String id;

  /// Function package onboarding state.
  final OnboardingState onboardingState;

  /// Function package operational state.
  final OperationalState operationalState;

  /// Function package usage state.
  final UsageState usageState;
  final GetSolFunctionPackageMetadata? metadata;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search and
  /// filter your resources or track your Amazon Web Services costs.
  final Map<String, String>? tags;

  /// Network function product name.
  final String? vnfProductName;

  /// Network function provider.
  final String? vnfProvider;

  /// Function package descriptor ID.
  final String? vnfdId;

  /// Function package descriptor version.
  final String? vnfdVersion;

  GetSolFunctionPackageOutput({
    required this.arn,
    required this.id,
    required this.onboardingState,
    required this.operationalState,
    required this.usageState,
    this.metadata,
    this.tags,
    this.vnfProductName,
    this.vnfProvider,
    this.vnfdId,
    this.vnfdVersion,
  });

  factory GetSolFunctionPackageOutput.fromJson(Map<String, dynamic> json) {
    return GetSolFunctionPackageOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      onboardingState: (json['onboardingState'] as String).toOnboardingState(),
      operationalState:
          (json['operationalState'] as String).toOperationalState(),
      usageState: (json['usageState'] as String).toUsageState(),
      metadata: json['metadata'] != null
          ? GetSolFunctionPackageMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vnfProductName: json['vnfProductName'] as String?,
      vnfProvider: json['vnfProvider'] as String?,
      vnfdId: json['vnfdId'] as String?,
      vnfdVersion: json['vnfdVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final onboardingState = this.onboardingState;
    final operationalState = this.operationalState;
    final usageState = this.usageState;
    final metadata = this.metadata;
    final tags = this.tags;
    final vnfProductName = this.vnfProductName;
    final vnfProvider = this.vnfProvider;
    final vnfdId = this.vnfdId;
    final vnfdVersion = this.vnfdVersion;
    return {
      'arn': arn,
      'id': id,
      'onboardingState': onboardingState.toValue(),
      'operationalState': operationalState.toValue(),
      'usageState': usageState.toValue(),
      if (metadata != null) 'metadata': metadata,
      if (tags != null) 'tags': tags,
      if (vnfProductName != null) 'vnfProductName': vnfProductName,
      if (vnfProvider != null) 'vnfProvider': vnfProvider,
      if (vnfdId != null) 'vnfdId': vnfdId,
      if (vnfdVersion != null) 'vnfdVersion': vnfdVersion,
    };
  }
}

/// Information about a network function.
///
/// A network instance is a single network created in Amazon Web Services TNB
/// that can be deployed and on which life-cycle operations (like terminate,
/// update, and delete) can be performed.
class GetSolInstantiatedVnfInfo {
  /// State of the network function.
  final VnfOperationalState? vnfState;

  GetSolInstantiatedVnfInfo({
    this.vnfState,
  });

  factory GetSolInstantiatedVnfInfo.fromJson(Map<String, dynamic> json) {
    return GetSolInstantiatedVnfInfo(
      vnfState: (json['vnfState'] as String?)?.toVnfOperationalState(),
    );
  }

  Map<String, dynamic> toJson() {
    final vnfState = this.vnfState;
    return {
      if (vnfState != null) 'vnfState': vnfState.toValue(),
    };
  }
}

/// The metadata of a network instance.
///
/// A network instance is a single network created in Amazon Web Services TNB
/// that can be deployed and on which life-cycle operations (like terminate,
/// update, and delete) can be performed.
class GetSolNetworkInstanceMetadata {
  /// The date that the resource was created.
  final DateTime createdAt;

  /// The date that the resource was last modified.
  final DateTime lastModified;

  GetSolNetworkInstanceMetadata({
    required this.createdAt,
    required this.lastModified,
  });

  factory GetSolNetworkInstanceMetadata.fromJson(Map<String, dynamic> json) {
    return GetSolNetworkInstanceMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModified:
          nonNullableTimeStampFromJson(json['lastModified'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastModified = this.lastModified;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastModified': iso8601ToJson(lastModified),
    };
  }
}

class GetSolNetworkInstanceOutput {
  /// Network instance ARN.
  final String arn;

  /// Network instance ID.
  final String id;
  final GetSolNetworkInstanceMetadata metadata;

  /// Network instance description.
  final String nsInstanceDescription;

  /// Network instance name.
  final String nsInstanceName;

  /// Network service descriptor ID.
  final String nsdId;

  /// Network service descriptor info ID.
  final String nsdInfoId;
  final LcmOperationInfo? lcmOpInfo;

  /// Network instance state.
  final NsState? nsState;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search and
  /// filter your resources or track your Amazon Web Services costs.
  final Map<String, String>? tags;

  GetSolNetworkInstanceOutput({
    required this.arn,
    required this.id,
    required this.metadata,
    required this.nsInstanceDescription,
    required this.nsInstanceName,
    required this.nsdId,
    required this.nsdInfoId,
    this.lcmOpInfo,
    this.nsState,
    this.tags,
  });

  factory GetSolNetworkInstanceOutput.fromJson(Map<String, dynamic> json) {
    return GetSolNetworkInstanceOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      metadata: GetSolNetworkInstanceMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      nsInstanceDescription: json['nsInstanceDescription'] as String,
      nsInstanceName: json['nsInstanceName'] as String,
      nsdId: json['nsdId'] as String,
      nsdInfoId: json['nsdInfoId'] as String,
      lcmOpInfo: json['lcmOpInfo'] != null
          ? LcmOperationInfo.fromJson(json['lcmOpInfo'] as Map<String, dynamic>)
          : null,
      nsState: (json['nsState'] as String?)?.toNsState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final metadata = this.metadata;
    final nsInstanceDescription = this.nsInstanceDescription;
    final nsInstanceName = this.nsInstanceName;
    final nsdId = this.nsdId;
    final nsdInfoId = this.nsdInfoId;
    final lcmOpInfo = this.lcmOpInfo;
    final nsState = this.nsState;
    final tags = this.tags;
    return {
      'arn': arn,
      'id': id,
      'metadata': metadata,
      'nsInstanceDescription': nsInstanceDescription,
      'nsInstanceName': nsInstanceName,
      'nsdId': nsdId,
      'nsdInfoId': nsdInfoId,
      if (lcmOpInfo != null) 'lcmOpInfo': lcmOpInfo,
      if (nsState != null) 'nsState': nsState.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Metadata related to a network operation occurrence.
///
/// A network operation is any operation that is done to your network, such as
/// network instance instantiation or termination.
class GetSolNetworkOperationMetadata {
  /// The date that the resource was created.
  final DateTime createdAt;

  /// The date that the resource was last modified.
  final DateTime lastModified;

  GetSolNetworkOperationMetadata({
    required this.createdAt,
    required this.lastModified,
  });

  factory GetSolNetworkOperationMetadata.fromJson(Map<String, dynamic> json) {
    return GetSolNetworkOperationMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModified:
          nonNullableTimeStampFromJson(json['lastModified'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastModified = this.lastModified;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastModified': iso8601ToJson(lastModified),
    };
  }
}

class GetSolNetworkOperationOutput {
  /// Network operation ARN.
  final String arn;

  /// Error related to this specific network operation occurrence.
  final ProblemDetails? error;

  /// ID of this network operation occurrence.
  final String? id;

  /// Type of the operation represented by this occurrence.
  final LcmOperationType? lcmOperationType;

  /// Metadata of this network operation occurrence.
  final GetSolNetworkOperationMetadata? metadata;

  /// ID of the network operation instance.
  final String? nsInstanceId;

  /// The state of the network operation.
  final NsLcmOperationState? operationState;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search and
  /// filter your resources or track your Amazon Web Services costs.
  final Map<String, String>? tags;

  /// All tasks associated with this operation occurrence.
  final List<GetSolNetworkOperationTaskDetails>? tasks;

  GetSolNetworkOperationOutput({
    required this.arn,
    this.error,
    this.id,
    this.lcmOperationType,
    this.metadata,
    this.nsInstanceId,
    this.operationState,
    this.tags,
    this.tasks,
  });

  factory GetSolNetworkOperationOutput.fromJson(Map<String, dynamic> json) {
    return GetSolNetworkOperationOutput(
      arn: json['arn'] as String,
      error: json['error'] != null
          ? ProblemDetails.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      lcmOperationType:
          (json['lcmOperationType'] as String?)?.toLcmOperationType(),
      metadata: json['metadata'] != null
          ? GetSolNetworkOperationMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>)
          : null,
      nsInstanceId: json['nsInstanceId'] as String?,
      operationState:
          (json['operationState'] as String?)?.toNsLcmOperationState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tasks: (json['tasks'] as List?)
          ?.whereNotNull()
          .map((e) => GetSolNetworkOperationTaskDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final error = this.error;
    final id = this.id;
    final lcmOperationType = this.lcmOperationType;
    final metadata = this.metadata;
    final nsInstanceId = this.nsInstanceId;
    final operationState = this.operationState;
    final tags = this.tags;
    final tasks = this.tasks;
    return {
      'arn': arn,
      if (error != null) 'error': error,
      if (id != null) 'id': id,
      if (lcmOperationType != null)
        'lcmOperationType': lcmOperationType.toValue(),
      if (metadata != null) 'metadata': metadata,
      if (nsInstanceId != null) 'nsInstanceId': nsInstanceId,
      if (operationState != null) 'operationState': operationState.toValue(),
      if (tags != null) 'tags': tags,
      if (tasks != null) 'tasks': tasks,
    };
  }
}

/// Gets the details of a network operation.
///
/// A network operation is any operation that is done to your network, such as
/// network instance instantiation or termination.
class GetSolNetworkOperationTaskDetails {
  /// Context for the network operation task.
  final Map<String, String>? taskContext;

  /// Task end time.
  final DateTime? taskEndTime;

  /// Task error details.
  final ErrorInfo? taskErrorDetails;

  /// Task name.
  final String? taskName;

  /// Task start time.
  final DateTime? taskStartTime;

  /// Task status.
  final TaskStatus? taskStatus;

  GetSolNetworkOperationTaskDetails({
    this.taskContext,
    this.taskEndTime,
    this.taskErrorDetails,
    this.taskName,
    this.taskStartTime,
    this.taskStatus,
  });

  factory GetSolNetworkOperationTaskDetails.fromJson(
      Map<String, dynamic> json) {
    return GetSolNetworkOperationTaskDetails(
      taskContext: (json['taskContext'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      taskEndTime: timeStampFromJson(json['taskEndTime']),
      taskErrorDetails: json['taskErrorDetails'] != null
          ? ErrorInfo.fromJson(json['taskErrorDetails'] as Map<String, dynamic>)
          : null,
      taskName: json['taskName'] as String?,
      taskStartTime: timeStampFromJson(json['taskStartTime']),
      taskStatus: (json['taskStatus'] as String?)?.toTaskStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final taskContext = this.taskContext;
    final taskEndTime = this.taskEndTime;
    final taskErrorDetails = this.taskErrorDetails;
    final taskName = this.taskName;
    final taskStartTime = this.taskStartTime;
    final taskStatus = this.taskStatus;
    return {
      if (taskContext != null) 'taskContext': taskContext,
      if (taskEndTime != null) 'taskEndTime': iso8601ToJson(taskEndTime),
      if (taskErrorDetails != null) 'taskErrorDetails': taskErrorDetails,
      if (taskName != null) 'taskName': taskName,
      if (taskStartTime != null) 'taskStartTime': iso8601ToJson(taskStartTime),
      if (taskStatus != null) 'taskStatus': taskStatus.toValue(),
    };
  }
}

class GetSolNetworkPackageContentOutput {
  /// Indicates the media type of the resource.
  final PackageContentType? contentType;

  /// Content of the network service descriptor in the network package.
  final Uint8List? nsdContent;

  GetSolNetworkPackageContentOutput({
    this.contentType,
    this.nsdContent,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final nsdContent = this.nsdContent;
    return {
      if (nsdContent != null) 'nsdContent': base64Encode(nsdContent),
    };
  }
}

class GetSolNetworkPackageDescriptorOutput {
  /// Indicates the media type of the resource.
  final DescriptorContentType? contentType;

  /// Contents of the network service descriptor in the network package.
  final Uint8List? nsd;

  GetSolNetworkPackageDescriptorOutput({
    this.contentType,
    this.nsd,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final nsd = this.nsd;
    return {
      if (nsd != null) 'nsd': base64Encode(nsd),
    };
  }
}

/// Metadata associated with a network package.
///
/// A network package is a .zip file in CSAR (Cloud Service Archive) format
/// defines the function packages you want to deploy and the Amazon Web Services
/// infrastructure you want to deploy them on.
class GetSolNetworkPackageMetadata {
  /// The date that the resource was created.
  final DateTime createdAt;

  /// The date that the resource was last modified.
  final DateTime lastModified;

  /// Metadata related to the onboarded network service descriptor in the network
  /// package.
  final NetworkArtifactMeta? nsd;

  GetSolNetworkPackageMetadata({
    required this.createdAt,
    required this.lastModified,
    this.nsd,
  });

  factory GetSolNetworkPackageMetadata.fromJson(Map<String, dynamic> json) {
    return GetSolNetworkPackageMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModified:
          nonNullableTimeStampFromJson(json['lastModified'] as Object),
      nsd: json['nsd'] != null
          ? NetworkArtifactMeta.fromJson(json['nsd'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastModified = this.lastModified;
    final nsd = this.nsd;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastModified': iso8601ToJson(lastModified),
      if (nsd != null) 'nsd': nsd,
    };
  }
}

class GetSolNetworkPackageOutput {
  /// Network package ARN.
  final String arn;

  /// Network package ID.
  final String id;
  final GetSolNetworkPackageMetadata metadata;

  /// Network service descriptor ID.
  final String nsdId;

  /// Network service descriptor name.
  final String nsdName;

  /// Network service descriptor onboarding state.
  final NsdOnboardingState nsdOnboardingState;

  /// Network service descriptor operational state.
  final NsdOperationalState nsdOperationalState;

  /// Network service descriptor usage state.
  final NsdUsageState nsdUsageState;

  /// Network service descriptor version.
  final String nsdVersion;

  /// Identifies the function package for the function package descriptor
  /// referenced by the onboarded network package.
  final List<String> vnfPkgIds;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search and
  /// filter your resources or track your Amazon Web Services costs.
  final Map<String, String>? tags;

  GetSolNetworkPackageOutput({
    required this.arn,
    required this.id,
    required this.metadata,
    required this.nsdId,
    required this.nsdName,
    required this.nsdOnboardingState,
    required this.nsdOperationalState,
    required this.nsdUsageState,
    required this.nsdVersion,
    required this.vnfPkgIds,
    this.tags,
  });

  factory GetSolNetworkPackageOutput.fromJson(Map<String, dynamic> json) {
    return GetSolNetworkPackageOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      metadata: GetSolNetworkPackageMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      nsdId: json['nsdId'] as String,
      nsdName: json['nsdName'] as String,
      nsdOnboardingState:
          (json['nsdOnboardingState'] as String).toNsdOnboardingState(),
      nsdOperationalState:
          (json['nsdOperationalState'] as String).toNsdOperationalState(),
      nsdUsageState: (json['nsdUsageState'] as String).toNsdUsageState(),
      nsdVersion: json['nsdVersion'] as String,
      vnfPkgIds: (json['vnfPkgIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final metadata = this.metadata;
    final nsdId = this.nsdId;
    final nsdName = this.nsdName;
    final nsdOnboardingState = this.nsdOnboardingState;
    final nsdOperationalState = this.nsdOperationalState;
    final nsdUsageState = this.nsdUsageState;
    final nsdVersion = this.nsdVersion;
    final vnfPkgIds = this.vnfPkgIds;
    final tags = this.tags;
    return {
      'arn': arn,
      'id': id,
      'metadata': metadata,
      'nsdId': nsdId,
      'nsdName': nsdName,
      'nsdOnboardingState': nsdOnboardingState.toValue(),
      'nsdOperationalState': nsdOperationalState.toValue(),
      'nsdUsageState': nsdUsageState.toValue(),
      'nsdVersion': nsdVersion,
      'vnfPkgIds': vnfPkgIds,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Information about the network function.
///
/// A network function instance is a function in a function package .
class GetSolVnfInfo {
  /// State of the network function instance.
  final VnfOperationalState? vnfState;

  /// Compute info used by the network function instance.
  final List<GetSolVnfcResourceInfo>? vnfcResourceInfo;

  GetSolVnfInfo({
    this.vnfState,
    this.vnfcResourceInfo,
  });

  factory GetSolVnfInfo.fromJson(Map<String, dynamic> json) {
    return GetSolVnfInfo(
      vnfState: (json['vnfState'] as String?)?.toVnfOperationalState(),
      vnfcResourceInfo: (json['vnfcResourceInfo'] as List?)
          ?.whereNotNull()
          .map(
              (e) => GetSolVnfcResourceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final vnfState = this.vnfState;
    final vnfcResourceInfo = this.vnfcResourceInfo;
    return {
      if (vnfState != null) 'vnfState': vnfState.toValue(),
      if (vnfcResourceInfo != null) 'vnfcResourceInfo': vnfcResourceInfo,
    };
  }
}

/// Details of resource associated with a network function.
///
/// A network instance is a single network created in Amazon Web Services TNB
/// that can be deployed and on which life-cycle operations (like terminate,
/// update, and delete) can be performed.
class GetSolVnfcResourceInfo {
  /// The metadata of the network function compute.
  final GetSolVnfcResourceInfoMetadata? metadata;

  GetSolVnfcResourceInfo({
    this.metadata,
  });

  factory GetSolVnfcResourceInfo.fromJson(Map<String, dynamic> json) {
    return GetSolVnfcResourceInfo(
      metadata: json['metadata'] != null
          ? GetSolVnfcResourceInfoMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    return {
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// The metadata of a network function.
///
/// A network instance is a single network created in Amazon Web Services TNB
/// that can be deployed and on which life-cycle operations (like terminate,
/// update, and delete) can be performed.
class GetSolVnfcResourceInfoMetadata {
  /// Information about the cluster.
  final String? cluster;

  /// Information about the helm chart.
  final String? helmChart;

  /// Information about the node group.
  final String? nodeGroup;

  GetSolVnfcResourceInfoMetadata({
    this.cluster,
    this.helmChart,
    this.nodeGroup,
  });

  factory GetSolVnfcResourceInfoMetadata.fromJson(Map<String, dynamic> json) {
    return GetSolVnfcResourceInfoMetadata(
      cluster: json['cluster'] as String?,
      helmChart: json['helmChart'] as String?,
      nodeGroup: json['nodeGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    final helmChart = this.helmChart;
    final nodeGroup = this.nodeGroup;
    return {
      if (cluster != null) 'cluster': cluster,
      if (helmChart != null) 'helmChart': helmChart,
      if (nodeGroup != null) 'nodeGroup': nodeGroup,
    };
  }
}

class InstantiateSolNetworkInstanceOutput {
  /// The identifier of the network operation.
  final String nsLcmOpOccId;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. When you use this API, the tags
  /// are transferred to the network operation that is created. Use tags to search
  /// and filter your resources or track your Amazon Web Services costs.
  final Map<String, String>? tags;

  InstantiateSolNetworkInstanceOutput({
    required this.nsLcmOpOccId,
    this.tags,
  });

  factory InstantiateSolNetworkInstanceOutput.fromJson(
      Map<String, dynamic> json) {
    return InstantiateSolNetworkInstanceOutput(
      nsLcmOpOccId: json['nsLcmOpOccId'] as String,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final nsLcmOpOccId = this.nsLcmOpOccId;
    final tags = this.tags;
    return {
      'nsLcmOpOccId': nsLcmOpOccId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Lifecycle management operation details on the network instance.
///
/// Lifecycle management operations are deploy, update, or delete operations.
class LcmOperationInfo {
  /// The identifier of the network operation.
  final String nsLcmOpOccId;

  LcmOperationInfo({
    required this.nsLcmOpOccId,
  });

  factory LcmOperationInfo.fromJson(Map<String, dynamic> json) {
    return LcmOperationInfo(
      nsLcmOpOccId: json['nsLcmOpOccId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final nsLcmOpOccId = this.nsLcmOpOccId;
    return {
      'nsLcmOpOccId': nsLcmOpOccId,
    };
  }
}

enum LcmOperationType {
  instantiate,
  update,
  terminate,
}

extension LcmOperationTypeValueExtension on LcmOperationType {
  String toValue() {
    switch (this) {
      case LcmOperationType.instantiate:
        return 'INSTANTIATE';
      case LcmOperationType.update:
        return 'UPDATE';
      case LcmOperationType.terminate:
        return 'TERMINATE';
    }
  }
}

extension LcmOperationTypeFromString on String {
  LcmOperationType toLcmOperationType() {
    switch (this) {
      case 'INSTANTIATE':
        return LcmOperationType.instantiate;
      case 'UPDATE':
        return LcmOperationType.update;
      case 'TERMINATE':
        return LcmOperationType.terminate;
    }
    throw Exception('$this is not known in enum LcmOperationType');
  }
}

/// Lists information about a network function instance.
///
/// A network function instance is a function in a function package .
class ListSolFunctionInstanceInfo {
  /// Network function instance ARN.
  final String arn;

  /// Network function instance ID.
  final String id;

  /// Network function instance instantiation state.
  final VnfInstantiationState instantiationState;

  /// Network function instance metadata.
  final ListSolFunctionInstanceMetadata metadata;

  /// Network instance ID.
  final String nsInstanceId;

  /// Function package ID.
  final String vnfPkgId;
  final GetSolInstantiatedVnfInfo? instantiatedVnfInfo;

  /// Function package name.
  final String? vnfPkgName;

  ListSolFunctionInstanceInfo({
    required this.arn,
    required this.id,
    required this.instantiationState,
    required this.metadata,
    required this.nsInstanceId,
    required this.vnfPkgId,
    this.instantiatedVnfInfo,
    this.vnfPkgName,
  });

  factory ListSolFunctionInstanceInfo.fromJson(Map<String, dynamic> json) {
    return ListSolFunctionInstanceInfo(
      arn: json['arn'] as String,
      id: json['id'] as String,
      instantiationState:
          (json['instantiationState'] as String).toVnfInstantiationState(),
      metadata: ListSolFunctionInstanceMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      nsInstanceId: json['nsInstanceId'] as String,
      vnfPkgId: json['vnfPkgId'] as String,
      instantiatedVnfInfo: json['instantiatedVnfInfo'] != null
          ? GetSolInstantiatedVnfInfo.fromJson(
              json['instantiatedVnfInfo'] as Map<String, dynamic>)
          : null,
      vnfPkgName: json['vnfPkgName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final instantiationState = this.instantiationState;
    final metadata = this.metadata;
    final nsInstanceId = this.nsInstanceId;
    final vnfPkgId = this.vnfPkgId;
    final instantiatedVnfInfo = this.instantiatedVnfInfo;
    final vnfPkgName = this.vnfPkgName;
    return {
      'arn': arn,
      'id': id,
      'instantiationState': instantiationState.toValue(),
      'metadata': metadata,
      'nsInstanceId': nsInstanceId,
      'vnfPkgId': vnfPkgId,
      if (instantiatedVnfInfo != null)
        'instantiatedVnfInfo': instantiatedVnfInfo,
      if (vnfPkgName != null) 'vnfPkgName': vnfPkgName,
    };
  }
}

/// Lists network function instance metadata.
///
/// A network function instance is a function in a function package .
class ListSolFunctionInstanceMetadata {
  /// When the network function instance was created.
  final DateTime createdAt;

  /// When the network function instance was last modified.
  final DateTime lastModified;

  ListSolFunctionInstanceMetadata({
    required this.createdAt,
    required this.lastModified,
  });

  factory ListSolFunctionInstanceMetadata.fromJson(Map<String, dynamic> json) {
    return ListSolFunctionInstanceMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModified:
          nonNullableTimeStampFromJson(json['lastModified'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastModified = this.lastModified;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastModified': iso8601ToJson(lastModified),
    };
  }
}

class ListSolFunctionInstancesOutput {
  /// Network function instances.
  final List<ListSolFunctionInstanceInfo>? functionInstances;

  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListSolFunctionInstancesOutput({
    this.functionInstances,
    this.nextToken,
  });

  factory ListSolFunctionInstancesOutput.fromJson(Map<String, dynamic> json) {
    return ListSolFunctionInstancesOutput(
      functionInstances: (json['functionInstances'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ListSolFunctionInstanceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionInstances = this.functionInstances;
    final nextToken = this.nextToken;
    return {
      if (functionInstances != null) 'functionInstances': functionInstances,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Information about a function package.
///
/// A function package is a .zip file in CSAR (Cloud Service Archive) format
/// that contains a network function (an ETSI standard telecommunication
/// application) and function package descriptor that uses the TOSCA standard to
/// describe how the network functions should run on your network.
class ListSolFunctionPackageInfo {
  /// Function package ARN.
  final String arn;

  /// ID of the function package.
  final String id;

  /// Onboarding state of the function package.
  final OnboardingState onboardingState;

  /// Operational state of the function package.
  final OperationalState operationalState;

  /// Usage state of the function package.
  final UsageState usageState;

  /// The metadata of the function package.
  final ListSolFunctionPackageMetadata? metadata;

  /// The product name for the network function.
  final String? vnfProductName;

  /// Provider of the function package and the function package descriptor.
  final String? vnfProvider;

  /// Identifies the function package and the function package descriptor.
  final String? vnfdId;

  /// Identifies the version of the function package descriptor.
  final String? vnfdVersion;

  ListSolFunctionPackageInfo({
    required this.arn,
    required this.id,
    required this.onboardingState,
    required this.operationalState,
    required this.usageState,
    this.metadata,
    this.vnfProductName,
    this.vnfProvider,
    this.vnfdId,
    this.vnfdVersion,
  });

  factory ListSolFunctionPackageInfo.fromJson(Map<String, dynamic> json) {
    return ListSolFunctionPackageInfo(
      arn: json['arn'] as String,
      id: json['id'] as String,
      onboardingState: (json['onboardingState'] as String).toOnboardingState(),
      operationalState:
          (json['operationalState'] as String).toOperationalState(),
      usageState: (json['usageState'] as String).toUsageState(),
      metadata: json['metadata'] != null
          ? ListSolFunctionPackageMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>)
          : null,
      vnfProductName: json['vnfProductName'] as String?,
      vnfProvider: json['vnfProvider'] as String?,
      vnfdId: json['vnfdId'] as String?,
      vnfdVersion: json['vnfdVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final onboardingState = this.onboardingState;
    final operationalState = this.operationalState;
    final usageState = this.usageState;
    final metadata = this.metadata;
    final vnfProductName = this.vnfProductName;
    final vnfProvider = this.vnfProvider;
    final vnfdId = this.vnfdId;
    final vnfdVersion = this.vnfdVersion;
    return {
      'arn': arn,
      'id': id,
      'onboardingState': onboardingState.toValue(),
      'operationalState': operationalState.toValue(),
      'usageState': usageState.toValue(),
      if (metadata != null) 'metadata': metadata,
      if (vnfProductName != null) 'vnfProductName': vnfProductName,
      if (vnfProvider != null) 'vnfProvider': vnfProvider,
      if (vnfdId != null) 'vnfdId': vnfdId,
      if (vnfdVersion != null) 'vnfdVersion': vnfdVersion,
    };
  }
}

/// Details for the function package metadata.
///
/// A function package is a .zip file in CSAR (Cloud Service Archive) format
/// that contains a network function (an ETSI standard telecommunication
/// application) and function package descriptor that uses the TOSCA standard to
/// describe how the network functions should run on your network.
class ListSolFunctionPackageMetadata {
  /// The date that the resource was created.
  final DateTime createdAt;

  /// The date that the resource was last modified.
  final DateTime lastModified;

  ListSolFunctionPackageMetadata({
    required this.createdAt,
    required this.lastModified,
  });

  factory ListSolFunctionPackageMetadata.fromJson(Map<String, dynamic> json) {
    return ListSolFunctionPackageMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModified:
          nonNullableTimeStampFromJson(json['lastModified'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastModified = this.lastModified;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastModified': iso8601ToJson(lastModified),
    };
  }
}

class ListSolFunctionPackagesOutput {
  /// Function packages. A function package is a .zip file in CSAR (Cloud Service
  /// Archive) format that contains a network function (an ETSI standard
  /// telecommunication application) and function package descriptor that uses the
  /// TOSCA standard to describe how the network functions should run on your
  /// network.
  final List<ListSolFunctionPackageInfo> functionPackages;

  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListSolFunctionPackagesOutput({
    required this.functionPackages,
    this.nextToken,
  });

  factory ListSolFunctionPackagesOutput.fromJson(Map<String, dynamic> json) {
    return ListSolFunctionPackagesOutput(
      functionPackages: (json['functionPackages'] as List)
          .whereNotNull()
          .map((e) =>
              ListSolFunctionPackageInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionPackages = this.functionPackages;
    final nextToken = this.nextToken;
    return {
      'functionPackages': functionPackages,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Info about the specific network instance.
///
/// A network instance is a single network created in Amazon Web Services TNB
/// that can be deployed and on which life-cycle operations (like terminate,
/// update, and delete) can be performed.
class ListSolNetworkInstanceInfo {
  /// Network instance ARN.
  final String arn;

  /// ID of the network instance.
  final String id;

  /// The metadata of the network instance.
  final ListSolNetworkInstanceMetadata metadata;

  /// Human-readable description of the network instance.
  final String nsInstanceDescription;

  /// Human-readable name of the network instance.
  final String nsInstanceName;

  /// The state of the network instance.
  final NsState nsState;

  /// ID of the network service descriptor in the network package.
  final String nsdId;

  /// ID of the network service descriptor in the network package.
  final String nsdInfoId;

  ListSolNetworkInstanceInfo({
    required this.arn,
    required this.id,
    required this.metadata,
    required this.nsInstanceDescription,
    required this.nsInstanceName,
    required this.nsState,
    required this.nsdId,
    required this.nsdInfoId,
  });

  factory ListSolNetworkInstanceInfo.fromJson(Map<String, dynamic> json) {
    return ListSolNetworkInstanceInfo(
      arn: json['arn'] as String,
      id: json['id'] as String,
      metadata: ListSolNetworkInstanceMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      nsInstanceDescription: json['nsInstanceDescription'] as String,
      nsInstanceName: json['nsInstanceName'] as String,
      nsState: (json['nsState'] as String).toNsState(),
      nsdId: json['nsdId'] as String,
      nsdInfoId: json['nsdInfoId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final metadata = this.metadata;
    final nsInstanceDescription = this.nsInstanceDescription;
    final nsInstanceName = this.nsInstanceName;
    final nsState = this.nsState;
    final nsdId = this.nsdId;
    final nsdInfoId = this.nsdInfoId;
    return {
      'arn': arn,
      'id': id,
      'metadata': metadata,
      'nsInstanceDescription': nsInstanceDescription,
      'nsInstanceName': nsInstanceName,
      'nsState': nsState.toValue(),
      'nsdId': nsdId,
      'nsdInfoId': nsdInfoId,
    };
  }
}

/// Metadata details for a network instance.
///
/// A network instance is a single network created in Amazon Web Services TNB
/// that can be deployed and on which life-cycle operations (like terminate,
/// update, and delete) can be performed.
class ListSolNetworkInstanceMetadata {
  /// The date that the resource was created.
  final DateTime createdAt;

  /// The date that the resource was last modified.
  final DateTime lastModified;

  ListSolNetworkInstanceMetadata({
    required this.createdAt,
    required this.lastModified,
  });

  factory ListSolNetworkInstanceMetadata.fromJson(Map<String, dynamic> json) {
    return ListSolNetworkInstanceMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModified:
          nonNullableTimeStampFromJson(json['lastModified'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastModified = this.lastModified;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastModified': iso8601ToJson(lastModified),
    };
  }
}

class ListSolNetworkInstancesOutput {
  /// Lists network instances.
  final List<ListSolNetworkInstanceInfo>? networkInstances;

  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListSolNetworkInstancesOutput({
    this.networkInstances,
    this.nextToken,
  });

  factory ListSolNetworkInstancesOutput.fromJson(Map<String, dynamic> json) {
    return ListSolNetworkInstancesOutput(
      networkInstances: (json['networkInstances'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ListSolNetworkInstanceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkInstances = this.networkInstances;
    final nextToken = this.nextToken;
    return {
      if (networkInstances != null) 'networkInstances': networkInstances,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Information parameters for a network operation.
class ListSolNetworkOperationsInfo {
  /// Network operation ARN.
  final String arn;

  /// ID of this network operation.
  final String id;

  /// Type of lifecycle management network operation.
  final LcmOperationType lcmOperationType;

  /// ID of the network instance related to this operation.
  final String nsInstanceId;

  /// The state of the network operation.
  final NsLcmOperationState operationState;

  /// Error related to this specific network operation.
  final ProblemDetails? error;

  /// Metadata related to this network operation.
  final ListSolNetworkOperationsMetadata? metadata;

  ListSolNetworkOperationsInfo({
    required this.arn,
    required this.id,
    required this.lcmOperationType,
    required this.nsInstanceId,
    required this.operationState,
    this.error,
    this.metadata,
  });

  factory ListSolNetworkOperationsInfo.fromJson(Map<String, dynamic> json) {
    return ListSolNetworkOperationsInfo(
      arn: json['arn'] as String,
      id: json['id'] as String,
      lcmOperationType:
          (json['lcmOperationType'] as String).toLcmOperationType(),
      nsInstanceId: json['nsInstanceId'] as String,
      operationState:
          (json['operationState'] as String).toNsLcmOperationState(),
      error: json['error'] != null
          ? ProblemDetails.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      metadata: json['metadata'] != null
          ? ListSolNetworkOperationsMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final lcmOperationType = this.lcmOperationType;
    final nsInstanceId = this.nsInstanceId;
    final operationState = this.operationState;
    final error = this.error;
    final metadata = this.metadata;
    return {
      'arn': arn,
      'id': id,
      'lcmOperationType': lcmOperationType.toValue(),
      'nsInstanceId': nsInstanceId,
      'operationState': operationState.toValue(),
      if (error != null) 'error': error,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// Metadata related to a network operation.
///
/// A network operation is any operation that is done to your network, such as
/// network instance instantiation or termination.
class ListSolNetworkOperationsMetadata {
  /// The date that the resource was created.
  final DateTime createdAt;

  /// The date that the resource was last modified.
  final DateTime lastModified;

  ListSolNetworkOperationsMetadata({
    required this.createdAt,
    required this.lastModified,
  });

  factory ListSolNetworkOperationsMetadata.fromJson(Map<String, dynamic> json) {
    return ListSolNetworkOperationsMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModified:
          nonNullableTimeStampFromJson(json['lastModified'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastModified = this.lastModified;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastModified': iso8601ToJson(lastModified),
    };
  }
}

class ListSolNetworkOperationsOutput {
  /// Lists network operation occurrences. Lifecycle management operations are
  /// deploy, update, or delete operations.
  final List<ListSolNetworkOperationsInfo>? networkOperations;

  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListSolNetworkOperationsOutput({
    this.networkOperations,
    this.nextToken,
  });

  factory ListSolNetworkOperationsOutput.fromJson(Map<String, dynamic> json) {
    return ListSolNetworkOperationsOutput(
      networkOperations: (json['networkOperations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ListSolNetworkOperationsInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkOperations = this.networkOperations;
    final nextToken = this.nextToken;
    return {
      if (networkOperations != null) 'networkOperations': networkOperations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Details of a network package.
///
/// A network package is a .zip file in CSAR (Cloud Service Archive) format
/// defines the function packages you want to deploy and the Amazon Web Services
/// infrastructure you want to deploy them on.
class ListSolNetworkPackageInfo {
  /// Network package ARN.
  final String arn;

  /// ID of the individual network package.
  final String id;

  /// The metadata of the network package.
  final ListSolNetworkPackageMetadata metadata;

  /// Onboarding state of the network service descriptor in the network package.
  final NsdOnboardingState nsdOnboardingState;

  /// Operational state of the network service descriptor in the network package.
  final NsdOperationalState nsdOperationalState;

  /// Usage state of the network service descriptor in the network package.
  final NsdUsageState nsdUsageState;

  /// Designer of the onboarded network service descriptor in the network package.
  final String? nsdDesigner;

  /// ID of the network service descriptor on which the network package is based.
  final String? nsdId;

  /// Identifies a network service descriptor in a version independent manner.
  final String? nsdInvariantId;

  /// Name of the onboarded network service descriptor in the network package.
  final String? nsdName;

  /// Version of the onboarded network service descriptor in the network package.
  final String? nsdVersion;

  /// Identifies the function package for the function package descriptor
  /// referenced by the onboarded network package.
  final List<String>? vnfPkgIds;

  ListSolNetworkPackageInfo({
    required this.arn,
    required this.id,
    required this.metadata,
    required this.nsdOnboardingState,
    required this.nsdOperationalState,
    required this.nsdUsageState,
    this.nsdDesigner,
    this.nsdId,
    this.nsdInvariantId,
    this.nsdName,
    this.nsdVersion,
    this.vnfPkgIds,
  });

  factory ListSolNetworkPackageInfo.fromJson(Map<String, dynamic> json) {
    return ListSolNetworkPackageInfo(
      arn: json['arn'] as String,
      id: json['id'] as String,
      metadata: ListSolNetworkPackageMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      nsdOnboardingState:
          (json['nsdOnboardingState'] as String).toNsdOnboardingState(),
      nsdOperationalState:
          (json['nsdOperationalState'] as String).toNsdOperationalState(),
      nsdUsageState: (json['nsdUsageState'] as String).toNsdUsageState(),
      nsdDesigner: json['nsdDesigner'] as String?,
      nsdId: json['nsdId'] as String?,
      nsdInvariantId: json['nsdInvariantId'] as String?,
      nsdName: json['nsdName'] as String?,
      nsdVersion: json['nsdVersion'] as String?,
      vnfPkgIds: (json['vnfPkgIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final metadata = this.metadata;
    final nsdOnboardingState = this.nsdOnboardingState;
    final nsdOperationalState = this.nsdOperationalState;
    final nsdUsageState = this.nsdUsageState;
    final nsdDesigner = this.nsdDesigner;
    final nsdId = this.nsdId;
    final nsdInvariantId = this.nsdInvariantId;
    final nsdName = this.nsdName;
    final nsdVersion = this.nsdVersion;
    final vnfPkgIds = this.vnfPkgIds;
    return {
      'arn': arn,
      'id': id,
      'metadata': metadata,
      'nsdOnboardingState': nsdOnboardingState.toValue(),
      'nsdOperationalState': nsdOperationalState.toValue(),
      'nsdUsageState': nsdUsageState.toValue(),
      if (nsdDesigner != null) 'nsdDesigner': nsdDesigner,
      if (nsdId != null) 'nsdId': nsdId,
      if (nsdInvariantId != null) 'nsdInvariantId': nsdInvariantId,
      if (nsdName != null) 'nsdName': nsdName,
      if (nsdVersion != null) 'nsdVersion': nsdVersion,
      if (vnfPkgIds != null) 'vnfPkgIds': vnfPkgIds,
    };
  }
}

/// Metadata related to a network package.
///
/// A network package is a .zip file in CSAR (Cloud Service Archive) format
/// defines the function packages you want to deploy and the Amazon Web Services
/// infrastructure you want to deploy them on.
class ListSolNetworkPackageMetadata {
  /// The date that the resource was created.
  final DateTime createdAt;

  /// The date that the resource was last modified.
  final DateTime lastModified;

  ListSolNetworkPackageMetadata({
    required this.createdAt,
    required this.lastModified,
  });

  factory ListSolNetworkPackageMetadata.fromJson(Map<String, dynamic> json) {
    return ListSolNetworkPackageMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastModified:
          nonNullableTimeStampFromJson(json['lastModified'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastModified = this.lastModified;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastModified': iso8601ToJson(lastModified),
    };
  }
}

class ListSolNetworkPackagesOutput {
  /// Network packages. A network package is a .zip file in CSAR (Cloud Service
  /// Archive) format defines the function packages you want to deploy and the
  /// Amazon Web Services infrastructure you want to deploy them on.
  final List<ListSolNetworkPackageInfo> networkPackages;

  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListSolNetworkPackagesOutput({
    required this.networkPackages,
    this.nextToken,
  });

  factory ListSolNetworkPackagesOutput.fromJson(Map<String, dynamic> json) {
    return ListSolNetworkPackagesOutput(
      networkPackages: (json['networkPackages'] as List)
          .whereNotNull()
          .map((e) =>
              ListSolNetworkPackageInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkPackages = this.networkPackages;
    final nextToken = this.nextToken;
    return {
      'networkPackages': networkPackages,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceOutput {
  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. You can use tags to search and
  /// filter your resources or track your Amazon Web Services costs.
  final Map<String, String> tags;

  ListTagsForResourceOutput({
    required this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
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

/// Metadata for network package artifacts.
///
/// Artifacts are the contents of the package descriptor file and the state of
/// the package.
class NetworkArtifactMeta {
  /// Lists network package overrides.
  final List<ToscaOverride>? overrides;

  NetworkArtifactMeta({
    this.overrides,
  });

  factory NetworkArtifactMeta.fromJson(Map<String, dynamic> json) {
    return NetworkArtifactMeta(
      overrides: (json['overrides'] as List?)
          ?.whereNotNull()
          .map((e) => ToscaOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final overrides = this.overrides;
    return {
      if (overrides != null) 'overrides': overrides,
    };
  }
}

enum NsLcmOperationState {
  processing,
  completed,
  failed,
  cancelling,
  cancelled,
}

extension NsLcmOperationStateValueExtension on NsLcmOperationState {
  String toValue() {
    switch (this) {
      case NsLcmOperationState.processing:
        return 'PROCESSING';
      case NsLcmOperationState.completed:
        return 'COMPLETED';
      case NsLcmOperationState.failed:
        return 'FAILED';
      case NsLcmOperationState.cancelling:
        return 'CANCELLING';
      case NsLcmOperationState.cancelled:
        return 'CANCELLED';
    }
  }
}

extension NsLcmOperationStateFromString on String {
  NsLcmOperationState toNsLcmOperationState() {
    switch (this) {
      case 'PROCESSING':
        return NsLcmOperationState.processing;
      case 'COMPLETED':
        return NsLcmOperationState.completed;
      case 'FAILED':
        return NsLcmOperationState.failed;
      case 'CANCELLING':
        return NsLcmOperationState.cancelling;
      case 'CANCELLED':
        return NsLcmOperationState.cancelled;
    }
    throw Exception('$this is not known in enum NsLcmOperationState');
  }
}

enum NsState {
  instantiated,
  notInstantiated,
  impaired,
  stopped,
  deleted,
  instantiateInProgress,
  updateInProgress,
  terminateInProgress,
}

extension NsStateValueExtension on NsState {
  String toValue() {
    switch (this) {
      case NsState.instantiated:
        return 'INSTANTIATED';
      case NsState.notInstantiated:
        return 'NOT_INSTANTIATED';
      case NsState.impaired:
        return 'IMPAIRED';
      case NsState.stopped:
        return 'STOPPED';
      case NsState.deleted:
        return 'DELETED';
      case NsState.instantiateInProgress:
        return 'INSTANTIATE_IN_PROGRESS';
      case NsState.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case NsState.terminateInProgress:
        return 'TERMINATE_IN_PROGRESS';
    }
  }
}

extension NsStateFromString on String {
  NsState toNsState() {
    switch (this) {
      case 'INSTANTIATED':
        return NsState.instantiated;
      case 'NOT_INSTANTIATED':
        return NsState.notInstantiated;
      case 'IMPAIRED':
        return NsState.impaired;
      case 'STOPPED':
        return NsState.stopped;
      case 'DELETED':
        return NsState.deleted;
      case 'INSTANTIATE_IN_PROGRESS':
        return NsState.instantiateInProgress;
      case 'UPDATE_IN_PROGRESS':
        return NsState.updateInProgress;
      case 'TERMINATE_IN_PROGRESS':
        return NsState.terminateInProgress;
    }
    throw Exception('$this is not known in enum NsState');
  }
}

enum NsdOnboardingState {
  created,
  onboarded,
  error,
}

extension NsdOnboardingStateValueExtension on NsdOnboardingState {
  String toValue() {
    switch (this) {
      case NsdOnboardingState.created:
        return 'CREATED';
      case NsdOnboardingState.onboarded:
        return 'ONBOARDED';
      case NsdOnboardingState.error:
        return 'ERROR';
    }
  }
}

extension NsdOnboardingStateFromString on String {
  NsdOnboardingState toNsdOnboardingState() {
    switch (this) {
      case 'CREATED':
        return NsdOnboardingState.created;
      case 'ONBOARDED':
        return NsdOnboardingState.onboarded;
      case 'ERROR':
        return NsdOnboardingState.error;
    }
    throw Exception('$this is not known in enum NsdOnboardingState');
  }
}

enum NsdOperationalState {
  enabled,
  disabled,
}

extension NsdOperationalStateValueExtension on NsdOperationalState {
  String toValue() {
    switch (this) {
      case NsdOperationalState.enabled:
        return 'ENABLED';
      case NsdOperationalState.disabled:
        return 'DISABLED';
    }
  }
}

extension NsdOperationalStateFromString on String {
  NsdOperationalState toNsdOperationalState() {
    switch (this) {
      case 'ENABLED':
        return NsdOperationalState.enabled;
      case 'DISABLED':
        return NsdOperationalState.disabled;
    }
    throw Exception('$this is not known in enum NsdOperationalState');
  }
}

enum NsdUsageState {
  inUse,
  notInUse,
}

extension NsdUsageStateValueExtension on NsdUsageState {
  String toValue() {
    switch (this) {
      case NsdUsageState.inUse:
        return 'IN_USE';
      case NsdUsageState.notInUse:
        return 'NOT_IN_USE';
    }
  }
}

extension NsdUsageStateFromString on String {
  NsdUsageState toNsdUsageState() {
    switch (this) {
      case 'IN_USE':
        return NsdUsageState.inUse;
      case 'NOT_IN_USE':
        return NsdUsageState.notInUse;
    }
    throw Exception('$this is not known in enum NsdUsageState');
  }
}

enum OnboardingState {
  created,
  onboarded,
  error,
}

extension OnboardingStateValueExtension on OnboardingState {
  String toValue() {
    switch (this) {
      case OnboardingState.created:
        return 'CREATED';
      case OnboardingState.onboarded:
        return 'ONBOARDED';
      case OnboardingState.error:
        return 'ERROR';
    }
  }
}

extension OnboardingStateFromString on String {
  OnboardingState toOnboardingState() {
    switch (this) {
      case 'CREATED':
        return OnboardingState.created;
      case 'ONBOARDED':
        return OnboardingState.onboarded;
      case 'ERROR':
        return OnboardingState.error;
    }
    throw Exception('$this is not known in enum OnboardingState');
  }
}

enum OperationalState {
  enabled,
  disabled,
}

extension OperationalStateValueExtension on OperationalState {
  String toValue() {
    switch (this) {
      case OperationalState.enabled:
        return 'ENABLED';
      case OperationalState.disabled:
        return 'DISABLED';
    }
  }
}

extension OperationalStateFromString on String {
  OperationalState toOperationalState() {
    switch (this) {
      case 'ENABLED':
        return OperationalState.enabled;
      case 'DISABLED':
        return OperationalState.disabled;
    }
    throw Exception('$this is not known in enum OperationalState');
  }
}

enum PackageContentType {
  applicationZip,
}

extension PackageContentTypeValueExtension on PackageContentType {
  String toValue() {
    switch (this) {
      case PackageContentType.applicationZip:
        return 'application/zip';
    }
  }
}

extension PackageContentTypeFromString on String {
  PackageContentType toPackageContentType() {
    switch (this) {
      case 'application/zip':
        return PackageContentType.applicationZip;
    }
    throw Exception('$this is not known in enum PackageContentType');
  }
}

/// Details related to problems with AWS TNB resources.
class ProblemDetails {
  /// A human-readable explanation specific to this occurrence of the problem.
  final String detail;

  /// A human-readable title of the problem type.
  final String? title;

  ProblemDetails({
    required this.detail,
    this.title,
  });

  factory ProblemDetails.fromJson(Map<String, dynamic> json) {
    return ProblemDetails(
      detail: json['detail'] as String,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detail = this.detail;
    final title = this.title;
    return {
      'detail': detail,
      if (title != null) 'title': title,
    };
  }
}

/// Update metadata in a function package.
///
/// A function package is a .zip file in CSAR (Cloud Service Archive) format
/// that contains a network function (an ETSI standard telecommunication
/// application) and function package descriptor that uses the TOSCA standard to
/// describe how the network functions should run on your network.
class PutSolFunctionPackageContentMetadata {
  final FunctionArtifactMeta? vnfd;

  PutSolFunctionPackageContentMetadata({
    this.vnfd,
  });

  factory PutSolFunctionPackageContentMetadata.fromJson(
      Map<String, dynamic> json) {
    return PutSolFunctionPackageContentMetadata(
      vnfd: json['vnfd'] != null
          ? FunctionArtifactMeta.fromJson(json['vnfd'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vnfd = this.vnfd;
    return {
      if (vnfd != null) 'vnfd': vnfd,
    };
  }
}

class PutSolFunctionPackageContentOutput {
  /// Function package ID.
  final String id;

  /// Function package metadata.
  final PutSolFunctionPackageContentMetadata metadata;

  /// Function product name.
  final String vnfProductName;

  /// Function provider.
  final String vnfProvider;

  /// Function package descriptor ID.
  final String vnfdId;

  /// Function package descriptor version.
  final String vnfdVersion;

  PutSolFunctionPackageContentOutput({
    required this.id,
    required this.metadata,
    required this.vnfProductName,
    required this.vnfProvider,
    required this.vnfdId,
    required this.vnfdVersion,
  });

  factory PutSolFunctionPackageContentOutput.fromJson(
      Map<String, dynamic> json) {
    return PutSolFunctionPackageContentOutput(
      id: json['id'] as String,
      metadata: PutSolFunctionPackageContentMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      vnfProductName: json['vnfProductName'] as String,
      vnfProvider: json['vnfProvider'] as String,
      vnfdId: json['vnfdId'] as String,
      vnfdVersion: json['vnfdVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final metadata = this.metadata;
    final vnfProductName = this.vnfProductName;
    final vnfProvider = this.vnfProvider;
    final vnfdId = this.vnfdId;
    final vnfdVersion = this.vnfdVersion;
    return {
      'id': id,
      'metadata': metadata,
      'vnfProductName': vnfProductName,
      'vnfProvider': vnfProvider,
      'vnfdId': vnfdId,
      'vnfdVersion': vnfdVersion,
    };
  }
}

/// Update metadata in a network package.
///
/// A network package is a .zip file in CSAR (Cloud Service Archive) format
/// defines the function packages you want to deploy and the Amazon Web Services
/// infrastructure you want to deploy them on.
class PutSolNetworkPackageContentMetadata {
  final NetworkArtifactMeta? nsd;

  PutSolNetworkPackageContentMetadata({
    this.nsd,
  });

  factory PutSolNetworkPackageContentMetadata.fromJson(
      Map<String, dynamic> json) {
    return PutSolNetworkPackageContentMetadata(
      nsd: json['nsd'] != null
          ? NetworkArtifactMeta.fromJson(json['nsd'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nsd = this.nsd;
    return {
      if (nsd != null) 'nsd': nsd,
    };
  }
}

class PutSolNetworkPackageContentOutput {
  /// Network package ARN.
  final String arn;

  /// Network package ID.
  final String id;

  /// Network package metadata.
  final PutSolNetworkPackageContentMetadata metadata;

  /// Network service descriptor ID.
  final String nsdId;

  /// Network service descriptor name.
  final String nsdName;

  /// Network service descriptor version.
  final String nsdVersion;

  /// Function package IDs.
  final List<String> vnfPkgIds;

  PutSolNetworkPackageContentOutput({
    required this.arn,
    required this.id,
    required this.metadata,
    required this.nsdId,
    required this.nsdName,
    required this.nsdVersion,
    required this.vnfPkgIds,
  });

  factory PutSolNetworkPackageContentOutput.fromJson(
      Map<String, dynamic> json) {
    return PutSolNetworkPackageContentOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      metadata: PutSolNetworkPackageContentMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      nsdId: json['nsdId'] as String,
      nsdName: json['nsdName'] as String,
      nsdVersion: json['nsdVersion'] as String,
      vnfPkgIds: (json['vnfPkgIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final metadata = this.metadata;
    final nsdId = this.nsdId;
    final nsdName = this.nsdName;
    final nsdVersion = this.nsdVersion;
    final vnfPkgIds = this.vnfPkgIds;
    return {
      'arn': arn,
      'id': id,
      'metadata': metadata,
      'nsdId': nsdId,
      'nsdName': nsdName,
      'nsdVersion': nsdVersion,
      'vnfPkgIds': vnfPkgIds,
    };
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum TaskStatus {
  scheduled,
  started,
  inProgress,
  completed,
  error,
  skipped,
  cancelled,
}

extension TaskStatusValueExtension on TaskStatus {
  String toValue() {
    switch (this) {
      case TaskStatus.scheduled:
        return 'SCHEDULED';
      case TaskStatus.started:
        return 'STARTED';
      case TaskStatus.inProgress:
        return 'IN_PROGRESS';
      case TaskStatus.completed:
        return 'COMPLETED';
      case TaskStatus.error:
        return 'ERROR';
      case TaskStatus.skipped:
        return 'SKIPPED';
      case TaskStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension TaskStatusFromString on String {
  TaskStatus toTaskStatus() {
    switch (this) {
      case 'SCHEDULED':
        return TaskStatus.scheduled;
      case 'STARTED':
        return TaskStatus.started;
      case 'IN_PROGRESS':
        return TaskStatus.inProgress;
      case 'COMPLETED':
        return TaskStatus.completed;
      case 'ERROR':
        return TaskStatus.error;
      case 'SKIPPED':
        return TaskStatus.skipped;
      case 'CANCELLED':
        return TaskStatus.cancelled;
    }
    throw Exception('$this is not known in enum TaskStatus');
  }
}

class TerminateSolNetworkInstanceOutput {
  /// The identifier of the network operation.
  final String? nsLcmOpOccId;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. When you use this API, the tags
  /// are transferred to the network operation that is created. Use tags to search
  /// and filter your resources or track your Amazon Web Services costs.
  final Map<String, String>? tags;

  TerminateSolNetworkInstanceOutput({
    this.nsLcmOpOccId,
    this.tags,
  });

  factory TerminateSolNetworkInstanceOutput.fromJson(
      Map<String, dynamic> json) {
    return TerminateSolNetworkInstanceOutput(
      nsLcmOpOccId: json['nsLcmOpOccId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final nsLcmOpOccId = this.nsLcmOpOccId;
    final tags = this.tags;
    return {
      if (nsLcmOpOccId != null) 'nsLcmOpOccId': nsLcmOpOccId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Overrides of the TOSCA node.
class ToscaOverride {
  /// Default value for the override.
  final String? defaultValue;

  /// Name of the TOSCA override.
  final String? name;

  ToscaOverride({
    this.defaultValue,
    this.name,
  });

  factory ToscaOverride.fromJson(Map<String, dynamic> json) {
    return ToscaOverride(
      defaultValue: json['defaultValue'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final name = this.name;
    return {
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (name != null) 'name': name,
    };
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateSolFunctionPackageOutput {
  /// Operational state of the function package.
  final OperationalState operationalState;

  UpdateSolFunctionPackageOutput({
    required this.operationalState,
  });

  factory UpdateSolFunctionPackageOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSolFunctionPackageOutput(
      operationalState:
          (json['operationalState'] as String).toOperationalState(),
    );
  }

  Map<String, dynamic> toJson() {
    final operationalState = this.operationalState;
    return {
      'operationalState': operationalState.toValue(),
    };
  }
}

class UpdateSolNetworkInstanceOutput {
  /// The identifier of the network operation.
  final String? nsLcmOpOccId;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value. When you use this API, the tags
  /// are transferred to the network operation that is created. Use tags to search
  /// and filter your resources or track your Amazon Web Services costs.
  final Map<String, String>? tags;

  UpdateSolNetworkInstanceOutput({
    this.nsLcmOpOccId,
    this.tags,
  });

  factory UpdateSolNetworkInstanceOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSolNetworkInstanceOutput(
      nsLcmOpOccId: json['nsLcmOpOccId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final nsLcmOpOccId = this.nsLcmOpOccId;
    final tags = this.tags;
    return {
      if (nsLcmOpOccId != null) 'nsLcmOpOccId': nsLcmOpOccId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Information parameters and/or the configurable properties for a network
/// function.
///
/// A network function instance is a function in a function package .
class UpdateSolNetworkModify {
  /// Provides values for the configurable properties declared in the function
  /// package descriptor.
  final Document vnfConfigurableProperties;

  /// ID of the network function instance.
  ///
  /// A network function instance is a function in a function package .
  final String vnfInstanceId;

  UpdateSolNetworkModify({
    required this.vnfConfigurableProperties,
    required this.vnfInstanceId,
  });

  Map<String, dynamic> toJson() {
    final vnfConfigurableProperties = this.vnfConfigurableProperties;
    final vnfInstanceId = this.vnfInstanceId;
    return {
      'vnfConfigurableProperties': vnfConfigurableProperties,
      'vnfInstanceId': vnfInstanceId,
    };
  }
}

class UpdateSolNetworkPackageOutput {
  /// Operational state of the network service descriptor in the network package.
  final NsdOperationalState nsdOperationalState;

  UpdateSolNetworkPackageOutput({
    required this.nsdOperationalState,
  });

  factory UpdateSolNetworkPackageOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSolNetworkPackageOutput(
      nsdOperationalState:
          (json['nsdOperationalState'] as String).toNsdOperationalState(),
    );
  }

  Map<String, dynamic> toJson() {
    final nsdOperationalState = this.nsdOperationalState;
    return {
      'nsdOperationalState': nsdOperationalState.toValue(),
    };
  }
}

enum UpdateSolNetworkType {
  modifyVnfInformation,
}

extension UpdateSolNetworkTypeValueExtension on UpdateSolNetworkType {
  String toValue() {
    switch (this) {
      case UpdateSolNetworkType.modifyVnfInformation:
        return 'MODIFY_VNF_INFORMATION';
    }
  }
}

extension UpdateSolNetworkTypeFromString on String {
  UpdateSolNetworkType toUpdateSolNetworkType() {
    switch (this) {
      case 'MODIFY_VNF_INFORMATION':
        return UpdateSolNetworkType.modifyVnfInformation;
    }
    throw Exception('$this is not known in enum UpdateSolNetworkType');
  }
}

enum UsageState {
  inUse,
  notInUse,
}

extension UsageStateValueExtension on UsageState {
  String toValue() {
    switch (this) {
      case UsageState.inUse:
        return 'IN_USE';
      case UsageState.notInUse:
        return 'NOT_IN_USE';
    }
  }
}

extension UsageStateFromString on String {
  UsageState toUsageState() {
    switch (this) {
      case 'IN_USE':
        return UsageState.inUse;
      case 'NOT_IN_USE':
        return UsageState.notInUse;
    }
    throw Exception('$this is not known in enum UsageState');
  }
}

/// Validates function package content metadata.
///
/// A function package is a .zip file in CSAR (Cloud Service Archive) format
/// that contains a network function (an ETSI standard telecommunication
/// application) and function package descriptor that uses the TOSCA standard to
/// describe how the network functions should run on your network.
class ValidateSolFunctionPackageContentMetadata {
  final FunctionArtifactMeta? vnfd;

  ValidateSolFunctionPackageContentMetadata({
    this.vnfd,
  });

  factory ValidateSolFunctionPackageContentMetadata.fromJson(
      Map<String, dynamic> json) {
    return ValidateSolFunctionPackageContentMetadata(
      vnfd: json['vnfd'] != null
          ? FunctionArtifactMeta.fromJson(json['vnfd'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vnfd = this.vnfd;
    return {
      if (vnfd != null) 'vnfd': vnfd,
    };
  }
}

class ValidateSolFunctionPackageContentOutput {
  /// Function package ID.
  final String id;

  /// Function package metadata.
  final ValidateSolFunctionPackageContentMetadata metadata;

  /// Network function product name.
  final String vnfProductName;

  /// Network function provider.
  final String vnfProvider;

  /// Function package descriptor ID.
  final String vnfdId;

  /// Function package descriptor version.
  final String vnfdVersion;

  ValidateSolFunctionPackageContentOutput({
    required this.id,
    required this.metadata,
    required this.vnfProductName,
    required this.vnfProvider,
    required this.vnfdId,
    required this.vnfdVersion,
  });

  factory ValidateSolFunctionPackageContentOutput.fromJson(
      Map<String, dynamic> json) {
    return ValidateSolFunctionPackageContentOutput(
      id: json['id'] as String,
      metadata: ValidateSolFunctionPackageContentMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      vnfProductName: json['vnfProductName'] as String,
      vnfProvider: json['vnfProvider'] as String,
      vnfdId: json['vnfdId'] as String,
      vnfdVersion: json['vnfdVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final metadata = this.metadata;
    final vnfProductName = this.vnfProductName;
    final vnfProvider = this.vnfProvider;
    final vnfdId = this.vnfdId;
    final vnfdVersion = this.vnfdVersion;
    return {
      'id': id,
      'metadata': metadata,
      'vnfProductName': vnfProductName,
      'vnfProvider': vnfProvider,
      'vnfdId': vnfdId,
      'vnfdVersion': vnfdVersion,
    };
  }
}

/// Validates network package content metadata.
///
/// A network package is a .zip file in CSAR (Cloud Service Archive) format
/// defines the function packages you want to deploy and the Amazon Web Services
/// infrastructure you want to deploy them on.
class ValidateSolNetworkPackageContentMetadata {
  final NetworkArtifactMeta? nsd;

  ValidateSolNetworkPackageContentMetadata({
    this.nsd,
  });

  factory ValidateSolNetworkPackageContentMetadata.fromJson(
      Map<String, dynamic> json) {
    return ValidateSolNetworkPackageContentMetadata(
      nsd: json['nsd'] != null
          ? NetworkArtifactMeta.fromJson(json['nsd'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nsd = this.nsd;
    return {
      if (nsd != null) 'nsd': nsd,
    };
  }
}

class ValidateSolNetworkPackageContentOutput {
  /// Network package ARN.
  final String arn;

  /// Network package ID.
  final String id;

  /// Network package metadata.
  final ValidateSolNetworkPackageContentMetadata metadata;

  /// Network service descriptor ID.
  final String nsdId;

  /// Network service descriptor name.
  final String nsdName;

  /// Network service descriptor version.
  final String nsdVersion;

  /// Function package IDs.
  final List<String> vnfPkgIds;

  ValidateSolNetworkPackageContentOutput({
    required this.arn,
    required this.id,
    required this.metadata,
    required this.nsdId,
    required this.nsdName,
    required this.nsdVersion,
    required this.vnfPkgIds,
  });

  factory ValidateSolNetworkPackageContentOutput.fromJson(
      Map<String, dynamic> json) {
    return ValidateSolNetworkPackageContentOutput(
      arn: json['arn'] as String,
      id: json['id'] as String,
      metadata: ValidateSolNetworkPackageContentMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
      nsdId: json['nsdId'] as String,
      nsdName: json['nsdName'] as String,
      nsdVersion: json['nsdVersion'] as String,
      vnfPkgIds: (json['vnfPkgIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final metadata = this.metadata;
    final nsdId = this.nsdId;
    final nsdName = this.nsdName;
    final nsdVersion = this.nsdVersion;
    final vnfPkgIds = this.vnfPkgIds;
    return {
      'arn': arn,
      'id': id,
      'metadata': metadata,
      'nsdId': nsdId,
      'nsdName': nsdName,
      'nsdVersion': nsdVersion,
      'vnfPkgIds': vnfPkgIds,
    };
  }
}

enum VnfInstantiationState {
  instantiated,
  notInstantiated,
}

extension VnfInstantiationStateValueExtension on VnfInstantiationState {
  String toValue() {
    switch (this) {
      case VnfInstantiationState.instantiated:
        return 'INSTANTIATED';
      case VnfInstantiationState.notInstantiated:
        return 'NOT_INSTANTIATED';
    }
  }
}

extension VnfInstantiationStateFromString on String {
  VnfInstantiationState toVnfInstantiationState() {
    switch (this) {
      case 'INSTANTIATED':
        return VnfInstantiationState.instantiated;
      case 'NOT_INSTANTIATED':
        return VnfInstantiationState.notInstantiated;
    }
    throw Exception('$this is not known in enum VnfInstantiationState');
  }
}

enum VnfOperationalState {
  started,
  stopped,
}

extension VnfOperationalStateValueExtension on VnfOperationalState {
  String toValue() {
    switch (this) {
      case VnfOperationalState.started:
        return 'STARTED';
      case VnfOperationalState.stopped:
        return 'STOPPED';
    }
  }
}

extension VnfOperationalStateFromString on String {
  VnfOperationalState toVnfOperationalState() {
    switch (this) {
      case 'STARTED':
        return VnfOperationalState.started;
      case 'STOPPED':
        return VnfOperationalState.stopped;
    }
    throw Exception('$this is not known in enum VnfOperationalState');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
