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

/// An AWS Elemental MediaStore container is a namespace that holds folders and
/// objects. You use a container endpoint to create, read, and delete objects.
class MediaStore {
  final _s.JsonProtocol _protocol;
  MediaStore({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mediastore',
            signingName: 'mediastore',
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

  /// Creates a storage container to hold objects. A container is similar to a
  /// bucket in the Amazon S3 service.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name for the container. The name must be from 1 to 255 characters.
  /// Container names must be unique to your AWS account within a specific
  /// region. As an example, you could create a container named
  /// <code>movies</code> in every region, as long as you don’t have an existing
  /// container with that name.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs that you define. These values can be anything
  /// that you want. Typically, the tag key represents a category (such as
  /// "environment") and the tag value represents a specific value within that
  /// category (such as "test," "development," or "production"). You can add up
  /// to 50 tags to each container. For more information about tagging,
  /// including naming and usage conventions, see <a
  /// href="https://docs.aws.amazon.com/mediastore/latest/ug/tagging.html">Tagging
  /// Resources in MediaStore</a>.
  Future<CreateContainerOutput> createContainer({
    required String containerName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.CreateContainer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateContainerOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the specified container. Before you make a
  /// <code>DeleteContainer</code> request, delete any objects in the container
  /// or in any folders in the container. You can delete only empty containers.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container to delete.
  Future<void> deleteContainer({
    required String containerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.DeleteContainer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
      },
    );
  }

  /// Deletes the access policy that is associated with the specified container.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [PolicyNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container that holds the policy.
  Future<void> deleteContainerPolicy({
    required String containerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.DeleteContainerPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
      },
    );
  }

  /// Deletes the cross-origin resource sharing (CORS) configuration information
  /// that is set for the container.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>MediaStore:DeleteCorsPolicy</code> action. The container owner has
  /// this permission by default and can grant this permission to others.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [CorsPolicyNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container to remove the policy from.
  Future<void> deleteCorsPolicy({
    required String containerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.DeleteCorsPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
      },
    );
  }

  /// Removes an object lifecycle policy from a container. It takes up to 20
  /// minutes for the change to take effect.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [PolicyNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container that holds the object lifecycle policy.
  Future<void> deleteLifecyclePolicy({
    required String containerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.DeleteLifecyclePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
      },
    );
  }

  /// Deletes the metric policy that is associated with the specified container.
  /// If there is no metric policy associated with the container, MediaStore
  /// doesn't send metrics to CloudWatch.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [PolicyNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container that is associated with the metric policy that
  /// you want to delete.
  Future<void> deleteMetricPolicy({
    required String containerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.DeleteMetricPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
      },
    );
  }

  /// Retrieves the properties of the requested container. This request is
  /// commonly used to retrieve the endpoint of a container. An endpoint is a
  /// value assigned by the service when a new container is created. A
  /// container's endpoint does not change after it has been assigned. The
  /// <code>DescribeContainer</code> request returns a single
  /// <code>Container</code> object based on <code>ContainerName</code>. To
  /// return all <code>Container</code> objects that are associated with a
  /// specified AWS account, use <a>ListContainers</a>.
  ///
  /// May throw [ContainerNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container to query.
  Future<DescribeContainerOutput> describeContainer({
    String? containerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.DescribeContainer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (containerName != null) 'ContainerName': containerName,
      },
    );

    return DescribeContainerOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the access policy for the specified container. For information
  /// about the data that is included in an access policy, see the <a
  /// href="https://aws.amazon.com/documentation/iam/">AWS Identity and Access
  /// Management User Guide</a>.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [PolicyNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container.
  Future<GetContainerPolicyOutput> getContainerPolicy({
    required String containerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.GetContainerPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
      },
    );

    return GetContainerPolicyOutput.fromJson(jsonResponse.body);
  }

  /// Returns the cross-origin resource sharing (CORS) configuration information
  /// that is set for the container.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>MediaStore:GetCorsPolicy</code> action. By default, the container
  /// owner has this permission and can grant it to others.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [CorsPolicyNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container that the policy is assigned to.
  Future<GetCorsPolicyOutput> getCorsPolicy({
    required String containerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.GetCorsPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
      },
    );

    return GetCorsPolicyOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the object lifecycle policy that is assigned to a container.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [PolicyNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container that the object lifecycle policy is assigned to.
  Future<GetLifecyclePolicyOutput> getLifecyclePolicy({
    required String containerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.GetLifecyclePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
      },
    );

    return GetLifecyclePolicyOutput.fromJson(jsonResponse.body);
  }

  /// Returns the metric policy for the specified container.
  ///
  /// May throw [ContainerNotFoundException].
  /// May throw [PolicyNotFoundException].
  /// May throw [ContainerInUseException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container that is associated with the metric policy.
  Future<GetMetricPolicyOutput> getMetricPolicy({
    required String containerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.GetMetricPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
      },
    );

    return GetMetricPolicyOutput.fromJson(jsonResponse.body);
  }

  /// Lists the properties of all containers in AWS Elemental MediaStore.
  ///
  /// You can query to receive all the containers in one response. Or you can
  /// include the <code>MaxResults</code> parameter to receive a limited number
  /// of containers in each response. In this case, the response includes a
  /// token. To get the next set of containers, send the command again, this
  /// time with the <code>NextToken</code> parameter (with the returned token as
  /// its value). The next set of responses appears, with a token if there are
  /// still more containers to receive.
  ///
  /// See also <a>DescribeContainer</a>, which gets the properties of one
  /// container.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [maxResults] :
  /// Enter the maximum number of containers in the response. Use from 1 to 255
  /// characters.
  ///
  /// Parameter [nextToken] :
  /// Only if you used <code>MaxResults</code> in the first command, enter the
  /// token (which was included in the previous response) to obtain the next set
  /// of containers. This token is included in a response only if there actually
  /// are more containers to list.
  Future<ListContainersOutput> listContainers({
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.ListContainers'
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

    return ListContainersOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of the tags assigned to the specified container.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [resource] :
  /// The Amazon Resource Name (ARN) for the container.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resource,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Resource': resource,
      },
    );

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Creates an access policy for the specified container to restrict the users
  /// and clients that can access it. For information about the data that is
  /// included in an access policy, see the <a
  /// href="https://aws.amazon.com/documentation/iam/">AWS Identity and Access
  /// Management User Guide</a>.
  ///
  /// For this release of the REST API, you can create only one policy for a
  /// container. If you enter <code>PutContainerPolicy</code> twice, the second
  /// command modifies the existing policy.
  ///
  /// May throw [ContainerNotFoundException].
  /// May throw [ContainerInUseException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container.
  ///
  /// Parameter [policy] :
  /// The contents of the policy, which includes the following:
  ///
  /// <ul>
  /// <li>
  /// One <code>Version</code> tag
  /// </li>
  /// <li>
  /// One <code>Statement</code> tag that contains the standard tags for the
  /// policy.
  /// </li>
  /// </ul>
  Future<void> putContainerPolicy({
    required String containerName,
    required String policy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.PutContainerPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
        'Policy': policy,
      },
    );
  }

  /// Sets the cross-origin resource sharing (CORS) configuration on a container
  /// so that the container can service cross-origin requests. For example, you
  /// might want to enable a request whose origin is http://www.example.com to
  /// access your AWS Elemental MediaStore container at my.example.container.com
  /// by using the browser's XMLHttpRequest capability.
  ///
  /// To enable CORS on a container, you attach a CORS policy to the container.
  /// In the CORS policy, you configure rules that identify origins and the HTTP
  /// methods that can be executed on your container. The policy can contain up
  /// to 398,000 characters. You can add up to 100 rules to a CORS policy. If
  /// more than one rule applies, the service uses the first applicable rule
  /// listed.
  ///
  /// To learn more about CORS, see <a
  /// href="https://docs.aws.amazon.com/mediastore/latest/ug/cors-policy.html">Cross-Origin
  /// Resource Sharing (CORS) in AWS Elemental MediaStore</a>.
  ///
  /// May throw [ContainerNotFoundException].
  /// May throw [ContainerInUseException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container that you want to assign the CORS policy to.
  ///
  /// Parameter [corsPolicy] :
  /// The CORS policy to apply to the container.
  Future<void> putCorsPolicy({
    required String containerName,
    required List<CorsRule> corsPolicy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.PutCorsPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
        'CorsPolicy': corsPolicy,
      },
    );
  }

  /// Writes an object lifecycle policy to a container. If the container already
  /// has an object lifecycle policy, the service replaces the existing policy
  /// with the new policy. It takes up to 20 minutes for the change to take
  /// effect.
  ///
  /// For information about how to construct an object lifecycle policy, see <a
  /// href="https://docs.aws.amazon.com/mediastore/latest/ug/policies-object-lifecycle-components.html">Components
  /// of an Object Lifecycle Policy</a>.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container that you want to assign the object lifecycle
  /// policy to.
  ///
  /// Parameter [lifecyclePolicy] :
  /// The object lifecycle policy to apply to the container.
  Future<void> putLifecyclePolicy({
    required String containerName,
    required String lifecyclePolicy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.PutLifecyclePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
        'LifecyclePolicy': lifecyclePolicy,
      },
    );
  }

  /// The metric policy that you want to add to the container. A metric policy
  /// allows AWS Elemental MediaStore to send metrics to Amazon CloudWatch. It
  /// takes up to 20 minutes for the new policy to take effect.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container that you want to add the metric policy to.
  ///
  /// Parameter [metricPolicy] :
  /// The metric policy that you want to associate with the container. In the
  /// policy, you must indicate whether you want MediaStore to send
  /// container-level metrics. You can also include up to five rules to define
  /// groups of objects that you want MediaStore to send object-level metrics
  /// for. If you include rules in the policy, construct each rule with both of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// An object group that defines which objects to include in the group. The
  /// definition can be a path or a file name, but it can't have more than 900
  /// characters. Valid characters are: a-z, A-Z, 0-9, _ (underscore), =
  /// (equal), : (colon), . (period), - (hyphen), ~ (tilde), / (forward slash),
  /// and * (asterisk). Wildcards (*) are acceptable.
  /// </li>
  /// <li>
  /// An object group name that allows you to refer to the object group. The
  /// name can't have more than 30 characters. Valid characters are: a-z, A-Z,
  /// 0-9, and _ (underscore).
  /// </li>
  /// </ul>
  Future<void> putMetricPolicy({
    required String containerName,
    required MetricPolicy metricPolicy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.PutMetricPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
        'MetricPolicy': metricPolicy,
      },
    );
  }

  /// Starts access logging on the specified container. When you enable access
  /// logging on a container, MediaStore delivers access logs for objects stored
  /// in that container to Amazon CloudWatch Logs.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container that you want to start access logging on.
  Future<void> startAccessLogging({
    required String containerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.StartAccessLogging'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
      },
    );
  }

  /// Stops access logging on the specified container. When you stop access
  /// logging on a container, MediaStore stops sending access logs to Amazon
  /// CloudWatch Logs. These access logs are not saved and are not retrievable.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [containerName] :
  /// The name of the container that you want to stop access logging on.
  Future<void> stopAccessLogging({
    required String containerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.StopAccessLogging'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContainerName': containerName,
      },
    );
  }

  /// Adds tags to the specified AWS Elemental MediaStore container. Tags are
  /// key:value pairs that you can associate with AWS resources. For example,
  /// the tag key might be "customer" and the tag value might be "companyA." You
  /// can specify one or more tags to add to each container. You can add up to
  /// 50 tags to each container. For more information about tagging, including
  /// naming and usage conventions, see <a
  /// href="https://docs.aws.amazon.com/mediastore/latest/ug/tagging.html">Tagging
  /// Resources in MediaStore</a>.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [resource] :
  /// The Amazon Resource Name (ARN) for the container.
  ///
  /// Parameter [tags] :
  /// An array of key:value pairs that you want to add to the container. You
  /// need to specify only the tags that you want to add or update. For example,
  /// suppose a container already has two tags (customer:CompanyA and
  /// priority:High). You want to change the priority tag and also add a third
  /// tag (type:Contract). For TagResource, you specify the following tags:
  /// priority:Medium, type:Contract. The result is that your container has
  /// three tags: customer:CompanyA, priority:Medium, and type:Contract.
  Future<void> tagResource({
    required String resource,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Resource': resource,
        'Tags': tags,
      },
    );
  }

  /// Removes tags from the specified container. You can specify one or more
  /// tags to remove.
  ///
  /// May throw [ContainerInUseException].
  /// May throw [ContainerNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [resource] :
  /// The Amazon Resource Name (ARN) for the container.
  ///
  /// Parameter [tagKeys] :
  /// A comma-separated list of keys for tags that you want to remove from the
  /// container. For example, if your container has two tags (customer:CompanyA
  /// and priority:High) and you want to remove one of the tags (priority:High),
  /// you specify the key for the tag that you want to remove (priority).
  Future<void> untagResource({
    required String resource,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MediaStore_20170901.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Resource': resource,
        'TagKeys': tagKeys,
      },
    );
  }
}

/// This section describes operations that you can perform on an AWS Elemental
/// MediaStore container.
class Container {
  /// The Amazon Resource Name (ARN) of the container. The ARN has the following
  /// format:
  ///
  /// arn:aws:&lt;region&gt;:&lt;account that owns this
  /// container&gt;:container/&lt;name of container&gt;
  ///
  /// For example: arn:aws:mediastore:us-west-2:111122223333:container/movies
  final String? arn;

  /// The state of access logging on the container. This value is
  /// <code>false</code> by default, indicating that AWS Elemental MediaStore does
  /// not send access logs to Amazon CloudWatch Logs. When you enable access
  /// logging on the container, MediaStore changes this value to
  /// <code>true</code>, indicating that the service delivers access logs for
  /// objects stored in that container to CloudWatch Logs.
  final bool? accessLoggingEnabled;

  /// Unix timestamp.
  final DateTime? creationTime;

  /// The DNS endpoint of the container. Use the endpoint to identify the specific
  /// container when sending requests to the data plane. The service assigns this
  /// value when the container is created. Once the value has been assigned, it
  /// does not change.
  final String? endpoint;

  /// The name of the container.
  final String? name;

  /// The status of container creation or deletion. The status is one of the
  /// following: <code>CREATING</code>, <code>ACTIVE</code>, or
  /// <code>DELETING</code>. While the service is creating the container, the
  /// status is <code>CREATING</code>. When the endpoint is available, the status
  /// changes to <code>ACTIVE</code>.
  final ContainerStatus? status;

  Container({
    this.arn,
    this.accessLoggingEnabled,
    this.creationTime,
    this.endpoint,
    this.name,
    this.status,
  });

  factory Container.fromJson(Map<String, dynamic> json) {
    return Container(
      arn: json['ARN'] as String?,
      accessLoggingEnabled: json['AccessLoggingEnabled'] as bool?,
      creationTime: timeStampFromJson(json['CreationTime']),
      endpoint: json['Endpoint'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toContainerStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final accessLoggingEnabled = this.accessLoggingEnabled;
    final creationTime = this.creationTime;
    final endpoint = this.endpoint;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'ARN': arn,
      if (accessLoggingEnabled != null)
        'AccessLoggingEnabled': accessLoggingEnabled,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (endpoint != null) 'Endpoint': endpoint,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ContainerLevelMetrics {
  enabled,
  disabled,
}

extension ContainerLevelMetricsValueExtension on ContainerLevelMetrics {
  String toValue() {
    switch (this) {
      case ContainerLevelMetrics.enabled:
        return 'ENABLED';
      case ContainerLevelMetrics.disabled:
        return 'DISABLED';
    }
  }
}

extension ContainerLevelMetricsFromString on String {
  ContainerLevelMetrics toContainerLevelMetrics() {
    switch (this) {
      case 'ENABLED':
        return ContainerLevelMetrics.enabled;
      case 'DISABLED':
        return ContainerLevelMetrics.disabled;
    }
    throw Exception('$this is not known in enum ContainerLevelMetrics');
  }
}

enum ContainerStatus {
  active,
  creating,
  deleting,
}

extension ContainerStatusValueExtension on ContainerStatus {
  String toValue() {
    switch (this) {
      case ContainerStatus.active:
        return 'ACTIVE';
      case ContainerStatus.creating:
        return 'CREATING';
      case ContainerStatus.deleting:
        return 'DELETING';
    }
  }
}

extension ContainerStatusFromString on String {
  ContainerStatus toContainerStatus() {
    switch (this) {
      case 'ACTIVE':
        return ContainerStatus.active;
      case 'CREATING':
        return ContainerStatus.creating;
      case 'DELETING':
        return ContainerStatus.deleting;
    }
    throw Exception('$this is not known in enum ContainerStatus');
  }
}

/// A rule for a CORS policy. You can add up to 100 rules to a CORS policy. If
/// more than one rule applies, the service uses the first applicable rule
/// listed.
class CorsRule {
  /// Specifies which headers are allowed in a preflight <code>OPTIONS</code>
  /// request through the <code>Access-Control-Request-Headers</code> header. Each
  /// header name that is specified in <code>Access-Control-Request-Headers</code>
  /// must have a corresponding entry in the rule. Only the headers that were
  /// requested are sent back.
  ///
  /// This element can contain only one wildcard character (*).
  final List<String> allowedHeaders;

  /// One or more response headers that you want users to be able to access from
  /// their applications (for example, from a JavaScript
  /// <code>XMLHttpRequest</code> object).
  ///
  /// Each CORS rule must have at least one <code>AllowedOrigins</code> element.
  /// The string value can include only one wildcard character (*), for example,
  /// http://*.example.com. Additionally, you can specify only one wildcard
  /// character to allow cross-origin access for all origins.
  final List<String> allowedOrigins;

  /// Identifies an HTTP method that the origin that is specified in the rule is
  /// allowed to execute.
  ///
  /// Each CORS rule must contain at least one <code>AllowedMethods</code> and one
  /// <code>AllowedOrigins</code> element.
  final List<MethodName>? allowedMethods;

  /// One or more headers in the response that you want users to be able to access
  /// from their applications (for example, from a JavaScript
  /// <code>XMLHttpRequest</code> object).
  ///
  /// This element is optional for each rule.
  final List<String>? exposeHeaders;

  /// The time in seconds that your browser caches the preflight response for the
  /// specified resource.
  ///
  /// A CORS rule can have only one <code>MaxAgeSeconds</code> element.
  final int? maxAgeSeconds;

  CorsRule({
    required this.allowedHeaders,
    required this.allowedOrigins,
    this.allowedMethods,
    this.exposeHeaders,
    this.maxAgeSeconds,
  });

  factory CorsRule.fromJson(Map<String, dynamic> json) {
    return CorsRule(
      allowedHeaders: (json['AllowedHeaders'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowedOrigins: (json['AllowedOrigins'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowedMethods: (json['AllowedMethods'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toMethodName())
          .toList(),
      exposeHeaders: (json['ExposeHeaders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      maxAgeSeconds: json['MaxAgeSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedHeaders = this.allowedHeaders;
    final allowedOrigins = this.allowedOrigins;
    final allowedMethods = this.allowedMethods;
    final exposeHeaders = this.exposeHeaders;
    final maxAgeSeconds = this.maxAgeSeconds;
    return {
      'AllowedHeaders': allowedHeaders,
      'AllowedOrigins': allowedOrigins,
      if (allowedMethods != null)
        'AllowedMethods': allowedMethods.map((e) => e.toValue()).toList(),
      if (exposeHeaders != null) 'ExposeHeaders': exposeHeaders,
      if (maxAgeSeconds != null) 'MaxAgeSeconds': maxAgeSeconds,
    };
  }
}

class CreateContainerOutput {
  /// ContainerARN: The Amazon Resource Name (ARN) of the newly created container.
  /// The ARN has the following format: arn:aws:&lt;region&gt;:&lt;account that
  /// owns this container&gt;:container/&lt;name of container&gt;. For example:
  /// arn:aws:mediastore:us-west-2:111122223333:container/movies
  ///
  /// ContainerName: The container name as specified in the request.
  ///
  /// CreationTime: Unix time stamp.
  ///
  /// Status: The status of container creation or deletion. The status is one of
  /// the following: <code>CREATING</code>, <code>ACTIVE</code>, or
  /// <code>DELETING</code>. While the service is creating the container, the
  /// status is <code>CREATING</code>. When an endpoint is available, the status
  /// changes to <code>ACTIVE</code>.
  ///
  /// The return value does not include the container's endpoint. To make
  /// downstream requests, you must obtain this value by using
  /// <a>DescribeContainer</a> or <a>ListContainers</a>.
  final Container container;

  CreateContainerOutput({
    required this.container,
  });

  factory CreateContainerOutput.fromJson(Map<String, dynamic> json) {
    return CreateContainerOutput(
      container: Container.fromJson(json['Container'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final container = this.container;
    return {
      'Container': container,
    };
  }
}

class DeleteContainerOutput {
  DeleteContainerOutput();

  factory DeleteContainerOutput.fromJson(Map<String, dynamic> _) {
    return DeleteContainerOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteContainerPolicyOutput {
  DeleteContainerPolicyOutput();

  factory DeleteContainerPolicyOutput.fromJson(Map<String, dynamic> _) {
    return DeleteContainerPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteCorsPolicyOutput {
  DeleteCorsPolicyOutput();

  factory DeleteCorsPolicyOutput.fromJson(Map<String, dynamic> _) {
    return DeleteCorsPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLifecyclePolicyOutput {
  DeleteLifecyclePolicyOutput();

  factory DeleteLifecyclePolicyOutput.fromJson(Map<String, dynamic> _) {
    return DeleteLifecyclePolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMetricPolicyOutput {
  DeleteMetricPolicyOutput();

  factory DeleteMetricPolicyOutput.fromJson(Map<String, dynamic> _) {
    return DeleteMetricPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeContainerOutput {
  /// The name of the queried container.
  final Container? container;

  DescribeContainerOutput({
    this.container,
  });

  factory DescribeContainerOutput.fromJson(Map<String, dynamic> json) {
    return DescribeContainerOutput(
      container: json['Container'] != null
          ? Container.fromJson(json['Container'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final container = this.container;
    return {
      if (container != null) 'Container': container,
    };
  }
}

class GetContainerPolicyOutput {
  /// The contents of the access policy.
  final String policy;

  GetContainerPolicyOutput({
    required this.policy,
  });

  factory GetContainerPolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetContainerPolicyOutput(
      policy: json['Policy'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      'Policy': policy,
    };
  }
}

class GetCorsPolicyOutput {
  /// The CORS policy assigned to the container.
  final List<CorsRule> corsPolicy;

  GetCorsPolicyOutput({
    required this.corsPolicy,
  });

  factory GetCorsPolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetCorsPolicyOutput(
      corsPolicy: (json['CorsPolicy'] as List)
          .whereNotNull()
          .map((e) => CorsRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final corsPolicy = this.corsPolicy;
    return {
      'CorsPolicy': corsPolicy,
    };
  }
}

class GetLifecyclePolicyOutput {
  /// The object lifecycle policy that is assigned to the container.
  final String lifecyclePolicy;

  GetLifecyclePolicyOutput({
    required this.lifecyclePolicy,
  });

  factory GetLifecyclePolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetLifecyclePolicyOutput(
      lifecyclePolicy: json['LifecyclePolicy'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicy = this.lifecyclePolicy;
    return {
      'LifecyclePolicy': lifecyclePolicy,
    };
  }
}

class GetMetricPolicyOutput {
  /// The metric policy that is associated with the specific container.
  final MetricPolicy metricPolicy;

  GetMetricPolicyOutput({
    required this.metricPolicy,
  });

  factory GetMetricPolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetMetricPolicyOutput(
      metricPolicy:
          MetricPolicy.fromJson(json['MetricPolicy'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final metricPolicy = this.metricPolicy;
    return {
      'MetricPolicy': metricPolicy,
    };
  }
}

class ListContainersOutput {
  /// The names of the containers.
  final List<Container> containers;

  /// <code>NextToken</code> is the token to use in the next call to
  /// <code>ListContainers</code>. This token is returned only if you included the
  /// <code>MaxResults</code> tag in the original command, and only if there are
  /// still containers to return.
  final String? nextToken;

  ListContainersOutput({
    required this.containers,
    this.nextToken,
  });

  factory ListContainersOutput.fromJson(Map<String, dynamic> json) {
    return ListContainersOutput(
      containers: (json['Containers'] as List)
          .whereNotNull()
          .map((e) => Container.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containers = this.containers;
    final nextToken = this.nextToken;
    return {
      'Containers': containers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceOutput {
  /// An array of key:value pairs that are assigned to the container.
  final List<Tag>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
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

enum MethodName {
  put,
  get,
  delete,
  head,
}

extension MethodNameValueExtension on MethodName {
  String toValue() {
    switch (this) {
      case MethodName.put:
        return 'PUT';
      case MethodName.get:
        return 'GET';
      case MethodName.delete:
        return 'DELETE';
      case MethodName.head:
        return 'HEAD';
    }
  }
}

extension MethodNameFromString on String {
  MethodName toMethodName() {
    switch (this) {
      case 'PUT':
        return MethodName.put;
      case 'GET':
        return MethodName.get;
      case 'DELETE':
        return MethodName.delete;
      case 'HEAD':
        return MethodName.head;
    }
    throw Exception('$this is not known in enum MethodName');
  }
}

/// The metric policy that is associated with the container. A metric policy
/// allows AWS Elemental MediaStore to send metrics to Amazon CloudWatch. In the
/// policy, you must indicate whether you want MediaStore to send
/// container-level metrics. You can also include rules to define groups of
/// objects that you want MediaStore to send object-level metrics for.
///
/// To view examples of how to construct a metric policy for your use case, see
/// <a
/// href="https://docs.aws.amazon.com/mediastore/latest/ug/policies-metric-examples.html">Example
/// Metric Policies</a>.
class MetricPolicy {
  /// A setting to enable or disable metrics at the container level.
  final ContainerLevelMetrics containerLevelMetrics;

  /// A parameter that holds an array of rules that enable metrics at the object
  /// level. This parameter is optional, but if you choose to include it, you must
  /// also include at least one rule. By default, you can include up to five
  /// rules. You can also <a
  /// href="https://console.aws.amazon.com/servicequotas/home?region=us-east-1#!/services/mediastore/quotas">request
  /// a quota increase</a> to allow up to 300 rules per policy.
  final List<MetricPolicyRule>? metricPolicyRules;

  MetricPolicy({
    required this.containerLevelMetrics,
    this.metricPolicyRules,
  });

  factory MetricPolicy.fromJson(Map<String, dynamic> json) {
    return MetricPolicy(
      containerLevelMetrics:
          (json['ContainerLevelMetrics'] as String).toContainerLevelMetrics(),
      metricPolicyRules: (json['MetricPolicyRules'] as List?)
          ?.whereNotNull()
          .map((e) => MetricPolicyRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containerLevelMetrics = this.containerLevelMetrics;
    final metricPolicyRules = this.metricPolicyRules;
    return {
      'ContainerLevelMetrics': containerLevelMetrics.toValue(),
      if (metricPolicyRules != null) 'MetricPolicyRules': metricPolicyRules,
    };
  }
}

/// A setting that enables metrics at the object level. Each rule contains an
/// object group and an object group name. If the policy includes the
/// MetricPolicyRules parameter, you must include at least one rule. Each metric
/// policy can include up to five rules by default. You can also <a
/// href="https://console.aws.amazon.com/servicequotas/home?region=us-east-1#!/services/mediastore/quotas">request
/// a quota increase</a> to allow up to 300 rules per policy.
class MetricPolicyRule {
  /// A path or file name that defines which objects to include in the group.
  /// Wildcards (*) are acceptable.
  final String objectGroup;

  /// A name that allows you to refer to the object group.
  final String objectGroupName;

  MetricPolicyRule({
    required this.objectGroup,
    required this.objectGroupName,
  });

  factory MetricPolicyRule.fromJson(Map<String, dynamic> json) {
    return MetricPolicyRule(
      objectGroup: json['ObjectGroup'] as String,
      objectGroupName: json['ObjectGroupName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final objectGroup = this.objectGroup;
    final objectGroupName = this.objectGroupName;
    return {
      'ObjectGroup': objectGroup,
      'ObjectGroupName': objectGroupName,
    };
  }
}

class PutContainerPolicyOutput {
  PutContainerPolicyOutput();

  factory PutContainerPolicyOutput.fromJson(Map<String, dynamic> _) {
    return PutContainerPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutCorsPolicyOutput {
  PutCorsPolicyOutput();

  factory PutCorsPolicyOutput.fromJson(Map<String, dynamic> _) {
    return PutCorsPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutLifecyclePolicyOutput {
  PutLifecyclePolicyOutput();

  factory PutLifecyclePolicyOutput.fromJson(Map<String, dynamic> _) {
    return PutLifecyclePolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutMetricPolicyOutput {
  PutMetricPolicyOutput();

  factory PutMetricPolicyOutput.fromJson(Map<String, dynamic> _) {
    return PutMetricPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartAccessLoggingOutput {
  StartAccessLoggingOutput();

  factory StartAccessLoggingOutput.fromJson(Map<String, dynamic> _) {
    return StartAccessLoggingOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopAccessLoggingOutput {
  StopAccessLoggingOutput();

  factory StopAccessLoggingOutput.fromJson(Map<String, dynamic> _) {
    return StopAccessLoggingOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A collection of tags associated with a container. Each tag consists of a
/// key:value pair, which can be anything you define. Typically, the tag key
/// represents a category (such as "environment") and the tag value represents a
/// specific value within that category (such as "test," "development," or
/// "production"). You can add up to 50 tags to each container. For more
/// information about tagging, including naming and usage conventions, see <a
/// href="https://docs.aws.amazon.com/mediastore/latest/ug/tagging.html">Tagging
/// Resources in MediaStore</a>.
class Tag {
  /// Part of the key:value pair that defines a tag. You can use a tag key to
  /// describe a category of information, such as "customer." Tag keys are
  /// case-sensitive.
  final String key;

  /// Part of the key:value pair that defines a tag. You can use a tag value to
  /// describe a specific value within a category, such as "companyA" or
  /// "companyB." Tag values are case-sensitive.
  final String? value;

  Tag({
    required this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      if (value != null) 'Value': value,
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

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ContainerInUseException extends _s.GenericAwsException {
  ContainerInUseException({String? type, String? message})
      : super(type: type, code: 'ContainerInUseException', message: message);
}

class ContainerNotFoundException extends _s.GenericAwsException {
  ContainerNotFoundException({String? type, String? message})
      : super(type: type, code: 'ContainerNotFoundException', message: message);
}

class CorsPolicyNotFoundException extends _s.GenericAwsException {
  CorsPolicyNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'CorsPolicyNotFoundException', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class PolicyNotFoundException extends _s.GenericAwsException {
  PolicyNotFoundException({String? type, String? message})
      : super(type: type, code: 'PolicyNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ContainerInUseException': (type, message) =>
      ContainerInUseException(type: type, message: message),
  'ContainerNotFoundException': (type, message) =>
      ContainerNotFoundException(type: type, message: message),
  'CorsPolicyNotFoundException': (type, message) =>
      CorsPolicyNotFoundException(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'PolicyNotFoundException': (type, message) =>
      PolicyNotFoundException(type: type, message: message),
};
