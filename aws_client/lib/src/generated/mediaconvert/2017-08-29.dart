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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2017-08-29.g.dart';

/// AWS Elemental MediaConvert
class MediaConvert {
  final _s.RestJsonProtocol _protocol;
  MediaConvert({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mediaconvert',
            signingName: 'mediaconvert',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates an AWS Certificate Manager (ACM) Amazon Resource Name (ARN)
  /// with AWS Elemental MediaConvert.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// The ARN of the ACM certificate that you want to associate with your
  /// MediaConvert resource.
  Future<void> associateCertificate({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2017-08-29/certificates',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateCertificateResponse.fromJson(response);
  }

  /// Permanently cancel a job. Once you have canceled a job, you can't start it
  /// again.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [id] :
  /// The Job ID of the job to be cancelled.
  Future<void> cancelJob({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-08-29/jobs/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelJobResponse.fromJson(response);
  }

  /// Create a new transcoding job. For information about jobs and job settings,
  /// see the User Guide at
  /// http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [role] :
  /// Required. The IAM role you use for creating this job. For details about
  /// permissions, see the User Guide topic at the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/iam-role.html.
  ///
  /// Parameter [settings] :
  /// JobSettings contains all the transcode settings for a job.
  ///
  /// Parameter [accelerationSettings] :
  /// Optional. Accelerated transcoding can significantly speed up jobs with
  /// long, visually complex content. Outputs that use this feature incur
  /// pro-tier pricing. For information about feature limitations, see the AWS
  /// Elemental MediaConvert User Guide.
  ///
  /// Parameter [billingTagsSource] :
  /// Optional. Choose a tag type that AWS Billing and Cost Management will use
  /// to sort your AWS Elemental MediaConvert costs on any billing report that
  /// you set up. Any transcoding outputs that don't have an associated tag will
  /// appear in your billing report unsorted. If you don't choose a valid value
  /// for this field, your job outputs will appear on the billing report
  /// unsorted.
  ///
  /// Parameter [clientRequestToken] :
  /// Optional. Idempotency token for CreateJob operation.
  ///
  /// Parameter [hopDestinations] :
  /// Optional. Use queue hopping to avoid overly long waits in the backlog of
  /// the queue that you submit your job to. Specify an alternate queue and the
  /// maximum time that your job will wait in the initial queue before hopping.
  /// For more information about this feature, see the AWS Elemental
  /// MediaConvert User Guide.
  ///
  /// Parameter [jobTemplate] :
  /// Optional. When you create a job, you can either specify a job template or
  /// specify the transcoding settings individually.
  ///
  /// Parameter [priority] :
  /// Optional. Specify the relative priority for this job. In any given queue,
  /// the service begins processing the job with the highest value first. When
  /// more than one job has the same priority, the service begins processing the
  /// job that you submitted first. If you don't specify a priority, the service
  /// uses the default value 0.
  ///
  /// Parameter [queue] :
  /// Optional. When you create a job, you can specify a queue to send it to. If
  /// you don't specify, the job will go to the default queue. For more about
  /// queues, see the User Guide topic at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html.
  ///
  /// Parameter [simulateReservedQueue] :
  /// Optional. Enable this setting when you run a test job to estimate how many
  /// reserved transcoding slots (RTS) you need. When this is enabled,
  /// MediaConvert runs your job from an on-demand queue with similar
  /// performance to what you will see with one RTS in a reserved queue. This
  /// setting is disabled by default.
  ///
  /// Parameter [statusUpdateInterval] :
  /// Optional. Specify how often MediaConvert sends STATUS_UPDATE events to
  /// Amazon CloudWatch Events. Set the interval, in seconds, between status
  /// updates. MediaConvert sends an update at this interval from the time the
  /// service begins processing your job to the time it completes the transcode
  /// or encounters an error.
  ///
  /// Parameter [tags] :
  /// Optional. The tags that you want to add to the resource. You can tag
  /// resources with a key-value pair or with only a key.  Use standard AWS tags
  /// on your job for automatic integration with AWS services and for custom
  /// integrations and workflows.
  ///
  /// Parameter [userMetadata] :
  /// Optional. User-defined metadata that you want to associate with an
  /// MediaConvert job. You specify metadata in key/value pairs.  Use only for
  /// existing integrations or workflows that rely on job metadata tags.
  /// Otherwise, we recommend that you use standard AWS tags.
  Future<CreateJobResponse> createJob({
    @_s.required String role,
    @_s.required JobSettings settings,
    AccelerationSettings accelerationSettings,
    BillingTagsSource billingTagsSource,
    String clientRequestToken,
    List<HopDestination> hopDestinations,
    String jobTemplate,
    int priority,
    String queue,
    SimulateReservedQueue simulateReservedQueue,
    StatusUpdateInterval statusUpdateInterval,
    Map<String, String> tags,
    Map<String, String> userMetadata,
  }) async {
    ArgumentError.checkNotNull(role, 'role');
    ArgumentError.checkNotNull(settings, 'settings');
    _s.validateNumRange(
      'priority',
      priority,
      -50,
      50,
    );
    final $payload = <String, dynamic>{
      'role': role,
      'settings': settings,
      if (accelerationSettings != null)
        'accelerationSettings': accelerationSettings,
      if (billingTagsSource != null)
        'billingTagsSource': billingTagsSource.toValue(),
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (hopDestinations != null) 'hopDestinations': hopDestinations,
      if (jobTemplate != null) 'jobTemplate': jobTemplate,
      if (priority != null) 'priority': priority,
      if (queue != null) 'queue': queue,
      if (simulateReservedQueue != null)
        'simulateReservedQueue': simulateReservedQueue.toValue(),
      if (statusUpdateInterval != null)
        'statusUpdateInterval': statusUpdateInterval.toValue(),
      if (tags != null) 'tags': tags,
      if (userMetadata != null) 'userMetadata': userMetadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2017-08-29/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobResponse.fromJson(response);
  }

  /// Create a new job template. For information about job templates see the
  /// User Guide at
  /// http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the job template you are creating.
  ///
  /// Parameter [settings] :
  /// JobTemplateSettings contains all the transcode settings saved in the
  /// template that will be applied to jobs created from it.
  ///
  /// Parameter [accelerationSettings] :
  /// Accelerated transcoding can significantly speed up jobs with long,
  /// visually complex content. Outputs that use this feature incur pro-tier
  /// pricing. For information about feature limitations, see the AWS Elemental
  /// MediaConvert User Guide.
  ///
  /// Parameter [category] :
  /// Optional. A category for the job template you are creating
  ///
  /// Parameter [description] :
  /// Optional. A description of the job template you are creating.
  ///
  /// Parameter [hopDestinations] :
  /// Optional. Use queue hopping to avoid overly long waits in the backlog of
  /// the queue that you submit your job to. Specify an alternate queue and the
  /// maximum time that your job will wait in the initial queue before hopping.
  /// For more information about this feature, see the AWS Elemental
  /// MediaConvert User Guide.
  ///
  /// Parameter [priority] :
  /// Specify the relative priority for this job. In any given queue, the
  /// service begins processing the job with the highest value first. When more
  /// than one job has the same priority, the service begins processing the job
  /// that you submitted first. If you don't specify a priority, the service
  /// uses the default value 0.
  ///
  /// Parameter [queue] :
  /// Optional. The queue that jobs created from this template are assigned to.
  /// If you don't specify this, jobs will go to the default queue.
  ///
  /// Parameter [statusUpdateInterval] :
  /// Specify how often MediaConvert sends STATUS_UPDATE events to Amazon
  /// CloudWatch Events. Set the interval, in seconds, between status updates.
  /// MediaConvert sends an update at this interval from the time the service
  /// begins processing your job to the time it completes the transcode or
  /// encounters an error.
  ///
  /// Parameter [tags] :
  /// The tags that you want to add to the resource. You can tag resources with
  /// a key-value pair or with only a key.
  Future<CreateJobTemplateResponse> createJobTemplate({
    @_s.required String name,
    @_s.required JobTemplateSettings settings,
    AccelerationSettings accelerationSettings,
    String category,
    String description,
    List<HopDestination> hopDestinations,
    int priority,
    String queue,
    StatusUpdateInterval statusUpdateInterval,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(settings, 'settings');
    _s.validateNumRange(
      'priority',
      priority,
      -50,
      50,
    );
    final $payload = <String, dynamic>{
      'name': name,
      'settings': settings,
      if (accelerationSettings != null)
        'accelerationSettings': accelerationSettings,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (hopDestinations != null) 'hopDestinations': hopDestinations,
      if (priority != null) 'priority': priority,
      if (queue != null) 'queue': queue,
      if (statusUpdateInterval != null)
        'statusUpdateInterval': statusUpdateInterval.toValue(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2017-08-29/jobTemplates',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobTemplateResponse.fromJson(response);
  }

  /// Create a new preset. For information about job templates see the User
  /// Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the preset you are creating.
  ///
  /// Parameter [settings] :
  /// Settings for preset
  ///
  /// Parameter [category] :
  /// Optional. A category for the preset you are creating.
  ///
  /// Parameter [description] :
  /// Optional. A description of the preset you are creating.
  ///
  /// Parameter [tags] :
  /// The tags that you want to add to the resource. You can tag resources with
  /// a key-value pair or with only a key.
  Future<CreatePresetResponse> createPreset({
    @_s.required String name,
    @_s.required PresetSettings settings,
    String category,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(settings, 'settings');
    final $payload = <String, dynamic>{
      'name': name,
      'settings': settings,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2017-08-29/presets',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePresetResponse.fromJson(response);
  }

  /// Create a new transcoding queue. For information about queues, see Working
  /// With Queues in the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the queue that you are creating.
  ///
  /// Parameter [description] :
  /// Optional. A description of the queue that you are creating.
  ///
  /// Parameter [pricingPlan] :
  /// Specifies whether the pricing plan for the queue is on-demand or reserved.
  /// For on-demand, you pay per minute, billed in increments of .01 minute. For
  /// reserved, you pay for the transcoding capacity of the entire queue,
  /// regardless of how much or how little you use it. Reserved pricing requires
  /// a 12-month commitment. When you use the API to create a queue, the default
  /// is on-demand.
  ///
  /// Parameter [reservationPlanSettings] :
  /// Details about the pricing plan for your reserved queue. Required for
  /// reserved queues and not applicable to on-demand queues.
  ///
  /// Parameter [status] :
  /// Initial state of the queue. If you create a paused queue, then jobs in
  /// that queue won't begin.
  ///
  /// Parameter [tags] :
  /// The tags that you want to add to the resource. You can tag resources with
  /// a key-value pair or with only a key.
  Future<CreateQueueResponse> createQueue({
    @_s.required String name,
    String description,
    PricingPlan pricingPlan,
    ReservationPlanSettings reservationPlanSettings,
    QueueStatus status,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'name': name,
      if (description != null) 'description': description,
      if (pricingPlan != null) 'pricingPlan': pricingPlan.toValue(),
      if (reservationPlanSettings != null)
        'reservationPlanSettings': reservationPlanSettings,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2017-08-29/queues',
      exceptionFnMap: _exceptionFns,
    );
    return CreateQueueResponse.fromJson(response);
  }

  /// Permanently delete a job template you have created.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the job template to be deleted.
  Future<void> deleteJobTemplate({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-08-29/jobTemplates/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteJobTemplateResponse.fromJson(response);
  }

  /// Permanently delete a preset you have created.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the preset to be deleted.
  Future<void> deletePreset({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-08-29/presets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePresetResponse.fromJson(response);
  }

  /// Permanently delete a queue you have created.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the queue that you want to delete.
  Future<void> deleteQueue({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-08-29/queues/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteQueueResponse.fromJson(response);
  }

  /// Send an request with an empty body to the regional API endpoint to get
  /// your account API endpoint.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [maxResults] :
  /// Optional. Max number of endpoints, up to twenty, that will be returned at
  /// one time.
  ///
  /// Parameter [mode] :
  /// Optional field, defaults to DEFAULT. Specify DEFAULT for this operation to
  /// return your endpoints if any exist, or to create an endpoint for you and
  /// return it if one doesn't already exist. Specify GET_ONLY to return your
  /// endpoints if any exist, or an empty list if none exist.
  ///
  /// Parameter [nextToken] :
  /// Use this string, provided with the response to a previous request, to
  /// request the next batch of endpoints.
  Future<DescribeEndpointsResponse> describeEndpoints({
    int maxResults,
    DescribeEndpointsMode mode,
    String nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (mode != null) 'mode': mode.toValue(),
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2017-08-29/endpoints',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeEndpointsResponse.fromJson(response);
  }

  /// Removes an association between the Amazon Resource Name (ARN) of an AWS
  /// Certificate Manager (ACM) certificate and an AWS Elemental MediaConvert
  /// resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// The ARN of the ACM certificate that you want to disassociate from your
  /// MediaConvert resource.
  Future<void> disassociateCertificate({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-08-29/certificates/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateCertificateResponse.fromJson(response);
  }

  /// Retrieve the JSON for a specific completed transcoding job.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [id] :
  /// the job ID of the job.
  Future<GetJobResponse> getJob({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2017-08-29/jobs/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetJobResponse.fromJson(response);
  }

  /// Retrieve the JSON for a specific job template.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the job template.
  Future<GetJobTemplateResponse> getJobTemplate({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2017-08-29/jobTemplates/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetJobTemplateResponse.fromJson(response);
  }

  /// Retrieve the JSON for a specific preset.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the preset.
  Future<GetPresetResponse> getPreset({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2017-08-29/presets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPresetResponse.fromJson(response);
  }

  /// Retrieve the JSON for a specific queue.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the queue that you want information about.
  Future<GetQueueResponse> getQueue({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2017-08-29/queues/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueueResponse.fromJson(response);
  }

  /// Retrieve a JSON array of up to twenty of your job templates. This will
  /// return the templates themselves, not just a list of them. To retrieve the
  /// next twenty templates, use the nextToken string returned with the array
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [category] :
  /// Optionally, specify a job template category to limit responses to only job
  /// templates from that category.
  ///
  /// Parameter [listBy] :
  /// Optional. When you request a list of job templates, you can choose to list
  /// them alphabetically by NAME or chronologically by CREATION_DATE. If you
  /// don't specify, the service will list them by name.
  ///
  /// Parameter [maxResults] :
  /// Optional. Number of job templates, up to twenty, that will be returned at
  /// one time.
  ///
  /// Parameter [nextToken] :
  /// Use this string, provided with the response to a previous request, to
  /// request the next batch of job templates.
  ///
  /// Parameter [order] :
  /// Optional. When you request lists of resources, you can specify whether
  /// they are sorted in ASCENDING or DESCENDING order. Default varies by
  /// resource.
  Future<ListJobTemplatesResponse> listJobTemplates({
    String category,
    JobTemplateListBy listBy,
    int maxResults,
    String nextToken,
    Order order,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (category != null) 'category': [category],
      if (listBy != null) 'listBy': [listBy.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (order != null) 'order': [order.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2017-08-29/jobTemplates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobTemplatesResponse.fromJson(response);
  }

  /// Retrieve a JSON array of up to twenty of your most recently created jobs.
  /// This array includes in-process, completed, and errored jobs. This will
  /// return the jobs themselves, not just a list of the jobs. To retrieve the
  /// twenty next most recent jobs, use the nextToken string returned with the
  /// array.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [maxResults] :
  /// Optional. Number of jobs, up to twenty, that will be returned at one time.
  ///
  /// Parameter [nextToken] :
  /// Optional. Use this string, provided with the response to a previous
  /// request, to request the next batch of jobs.
  ///
  /// Parameter [order] :
  /// Optional. When you request lists of resources, you can specify whether
  /// they are sorted in ASCENDING or DESCENDING order. Default varies by
  /// resource.
  ///
  /// Parameter [queue] :
  /// Optional. Provide a queue name to get back only jobs from that queue.
  ///
  /// Parameter [status] :
  /// Optional. A job's status can be SUBMITTED, PROGRESSING, COMPLETE,
  /// CANCELED, or ERROR.
  Future<ListJobsResponse> listJobs({
    int maxResults,
    String nextToken,
    Order order,
    String queue,
    JobStatus status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (order != null) 'order': [order.toValue()],
      if (queue != null) 'queue': [queue],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2017-08-29/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsResponse.fromJson(response);
  }

  /// Retrieve a JSON array of up to twenty of your presets. This will return
  /// the presets themselves, not just a list of them. To retrieve the next
  /// twenty presets, use the nextToken string returned with the array.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [category] :
  /// Optionally, specify a preset category to limit responses to only presets
  /// from that category.
  ///
  /// Parameter [listBy] :
  /// Optional. When you request a list of presets, you can choose to list them
  /// alphabetically by NAME or chronologically by CREATION_DATE. If you don't
  /// specify, the service will list them by name.
  ///
  /// Parameter [maxResults] :
  /// Optional. Number of presets, up to twenty, that will be returned at one
  /// time
  ///
  /// Parameter [nextToken] :
  /// Use this string, provided with the response to a previous request, to
  /// request the next batch of presets.
  ///
  /// Parameter [order] :
  /// Optional. When you request lists of resources, you can specify whether
  /// they are sorted in ASCENDING or DESCENDING order. Default varies by
  /// resource.
  Future<ListPresetsResponse> listPresets({
    String category,
    PresetListBy listBy,
    int maxResults,
    String nextToken,
    Order order,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (category != null) 'category': [category],
      if (listBy != null) 'listBy': [listBy.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (order != null) 'order': [order.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2017-08-29/presets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPresetsResponse.fromJson(response);
  }

  /// Retrieve a JSON array of up to twenty of your queues. This will return the
  /// queues themselves, not just a list of them. To retrieve the next twenty
  /// queues, use the nextToken string returned with the array.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [listBy] :
  /// Optional. When you request a list of queues, you can choose to list them
  /// alphabetically by NAME or chronologically by CREATION_DATE. If you don't
  /// specify, the service will list them by creation date.
  ///
  /// Parameter [maxResults] :
  /// Optional. Number of queues, up to twenty, that will be returned at one
  /// time.
  ///
  /// Parameter [nextToken] :
  /// Use this string, provided with the response to a previous request, to
  /// request the next batch of queues.
  ///
  /// Parameter [order] :
  /// Optional. When you request lists of resources, you can specify whether
  /// they are sorted in ASCENDING or DESCENDING order. Default varies by
  /// resource.
  Future<ListQueuesResponse> listQueues({
    QueueListBy listBy,
    int maxResults,
    String nextToken,
    Order order,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (listBy != null) 'listBy': [listBy.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (order != null) 'order': [order.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2017-08-29/queues',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueuesResponse.fromJson(response);
  }

  /// Retrieve the tags for a MediaConvert resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to list tags
  /// for. To get the ARN, send a GET request with the resource name.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2017-08-29/tags/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Add tags to a MediaConvert queue, preset, or job template. For information
  /// about tagging, see the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to tag. To
  /// get the ARN, send a GET request with the resource name.
  ///
  /// Parameter [tags] :
  /// The tags that you want to add to the resource. You can tag resources with
  /// a key-value pair or with only a key.
  Future<void> tagResource({
    @_s.required String arn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'arn': arn,
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2017-08-29/tags',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Remove tags from a MediaConvert queue, preset, or job template. For
  /// information about tagging, see the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to remove
  /// tags from. To get the ARN, send a GET request with the resource name.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags that you want to remove from the resource.
  Future<void> untagResource({
    @_s.required String arn,
    List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    final $payload = <String, dynamic>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/2017-08-29/tags/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Modify one of your existing job templates.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the job template you are modifying
  ///
  /// Parameter [accelerationSettings] :
  /// Accelerated transcoding can significantly speed up jobs with long,
  /// visually complex content. Outputs that use this feature incur pro-tier
  /// pricing. For information about feature limitations, see the AWS Elemental
  /// MediaConvert User Guide.
  ///
  /// Parameter [category] :
  /// The new category for the job template, if you are changing it.
  ///
  /// Parameter [description] :
  /// The new description for the job template, if you are changing it.
  ///
  /// Parameter [hopDestinations] :
  /// Optional list of hop destinations.
  ///
  /// Parameter [priority] :
  /// Specify the relative priority for this job. In any given queue, the
  /// service begins processing the job with the highest value first. When more
  /// than one job has the same priority, the service begins processing the job
  /// that you submitted first. If you don't specify a priority, the service
  /// uses the default value 0.
  ///
  /// Parameter [queue] :
  /// The new queue for the job template, if you are changing it.
  ///
  /// Parameter [settings] :
  /// JobTemplateSettings contains all the transcode settings saved in the
  /// template that will be applied to jobs created from it.
  ///
  /// Parameter [statusUpdateInterval] :
  /// Specify how often MediaConvert sends STATUS_UPDATE events to Amazon
  /// CloudWatch Events. Set the interval, in seconds, between status updates.
  /// MediaConvert sends an update at this interval from the time the service
  /// begins processing your job to the time it completes the transcode or
  /// encounters an error.
  Future<UpdateJobTemplateResponse> updateJobTemplate({
    @_s.required String name,
    AccelerationSettings accelerationSettings,
    String category,
    String description,
    List<HopDestination> hopDestinations,
    int priority,
    String queue,
    JobTemplateSettings settings,
    StatusUpdateInterval statusUpdateInterval,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateNumRange(
      'priority',
      priority,
      -50,
      50,
    );
    final $payload = <String, dynamic>{
      if (accelerationSettings != null)
        'accelerationSettings': accelerationSettings,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (hopDestinations != null) 'hopDestinations': hopDestinations,
      if (priority != null) 'priority': priority,
      if (queue != null) 'queue': queue,
      if (settings != null) 'settings': settings,
      if (statusUpdateInterval != null)
        'statusUpdateInterval': statusUpdateInterval.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/2017-08-29/jobTemplates/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateJobTemplateResponse.fromJson(response);
  }

  /// Modify one of your existing presets.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the preset you are modifying.
  ///
  /// Parameter [category] :
  /// The new category for the preset, if you are changing it.
  ///
  /// Parameter [description] :
  /// The new description for the preset, if you are changing it.
  ///
  /// Parameter [settings] :
  /// Settings for preset
  Future<UpdatePresetResponse> updatePreset({
    @_s.required String name,
    String category,
    String description,
    PresetSettings settings,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (settings != null) 'settings': settings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/2017-08-29/presets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePresetResponse.fromJson(response);
  }

  /// Modify one of your existing queues.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the queue that you are modifying.
  ///
  /// Parameter [description] :
  /// The new description for the queue, if you are changing it.
  ///
  /// Parameter [reservationPlanSettings] :
  /// The new details of your pricing plan for your reserved queue. When you set
  /// up a new pricing plan to replace an expired one, you enter into another
  /// 12-month commitment. When you add capacity to your queue by increasing the
  /// number of RTS, you extend the term of your commitment to 12 months from
  /// when you add capacity. After you make these commitments, you can't cancel
  /// them.
  ///
  /// Parameter [status] :
  /// Pause or activate a queue by changing its status between ACTIVE and
  /// PAUSED. If you pause a queue, jobs in that queue won't begin. Jobs that
  /// are running when you pause the queue continue to run until they finish or
  /// result in an error.
  Future<UpdateQueueResponse> updateQueue({
    @_s.required String name,
    String description,
    ReservationPlanSettings reservationPlanSettings,
    QueueStatus status,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (reservationPlanSettings != null)
        'reservationPlanSettings': reservationPlanSettings,
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/2017-08-29/queues/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateQueueResponse.fromJson(response);
  }
}

/// Choose BROADCASTER_MIXED_AD when the input contains pre-mixed main audio +
/// audio description (AD) as a stereo pair. The value for AudioType will be set
/// to 3, which signals to downstream systems that this stream contains
/// "broadcaster mixed AD". Note that the input received by the encoder must
/// contain pre-mixed audio; the encoder does not perform the mixing. When you
/// choose BROADCASTER_MIXED_AD, the encoder ignores any values you provide in
/// AudioType and  FollowInputAudioType. Choose NORMAL when the input does not
/// contain pre-mixed audio + audio description (AD). In this case, the encoder
/// will use any values you provide for AudioType and FollowInputAudioType.
enum AacAudioDescriptionBroadcasterMix {
  @_s.JsonValue('BROADCASTER_MIXED_AD')
  broadcasterMixedAd,
  @_s.JsonValue('NORMAL')
  normal,
}

/// AAC Profile.
enum AacCodecProfile {
  @_s.JsonValue('LC')
  lc,
  @_s.JsonValue('HEV1')
  hev1,
  @_s.JsonValue('HEV2')
  hev2,
}

/// Mono (Audio Description), Mono, Stereo, or 5.1 channel layout. Valid values
/// depend on rate control mode and profile. "1.0 - Audio Description (Receiver
/// Mix)" setting receives a stereo description plus control track and emits a
/// mono AAC encode of the description track, with control data emitted in the
/// PES header as per ETSI TS 101 154 Annex E.
enum AacCodingMode {
  @_s.JsonValue('AD_RECEIVER_MIX')
  adReceiverMix,
  @_s.JsonValue('CODING_MODE_1_0')
  codingMode_1_0,
  @_s.JsonValue('CODING_MODE_1_1')
  codingMode_1_1,
  @_s.JsonValue('CODING_MODE_2_0')
  codingMode_2_0,
  @_s.JsonValue('CODING_MODE_5_1')
  codingMode_5_1,
}

/// Rate Control Mode.
enum AacRateControlMode {
  @_s.JsonValue('CBR')
  cbr,
  @_s.JsonValue('VBR')
  vbr,
}

/// Enables LATM/LOAS AAC output. Note that if you use LATM/LOAS AAC in an
/// output, you must choose "No container" for the output container.
enum AacRawFormat {
  @_s.JsonValue('LATM_LOAS')
  latmLoas,
  @_s.JsonValue('NONE')
  none,
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value AAC. The service accepts one of two mutually exclusive groups of
/// AAC settings--VBR and CBR. To select one of these modes, set the value of
/// Bitrate control mode (rateControlMode) to "VBR" or "CBR".  In VBR mode, you
/// control the audio quality with the setting VBR quality (vbrQuality). In CBR
/// mode, you use the setting Bitrate (bitrate). Defaults and valid values
/// depend on the rate control mode.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AacSettings {
  /// Choose BROADCASTER_MIXED_AD when the input contains pre-mixed main audio +
  /// audio description (AD) as a stereo pair. The value for AudioType will be set
  /// to 3, which signals to downstream systems that this stream contains
  /// "broadcaster mixed AD". Note that the input received by the encoder must
  /// contain pre-mixed audio; the encoder does not perform the mixing. When you
  /// choose BROADCASTER_MIXED_AD, the encoder ignores any values you provide in
  /// AudioType and  FollowInputAudioType. Choose NORMAL when the input does not
  /// contain pre-mixed audio + audio description (AD). In this case, the encoder
  /// will use any values you provide for AudioType and FollowInputAudioType.
  @_s.JsonKey(name: 'audioDescriptionBroadcasterMix')
  final AacAudioDescriptionBroadcasterMix audioDescriptionBroadcasterMix;

  /// Specify the average bitrate in bits per second. The set of valid values for
  /// this setting is: 6000, 8000, 10000, 12000, 14000, 16000, 20000, 24000,
  /// 28000, 32000, 40000, 48000, 56000, 64000, 80000, 96000, 112000, 128000,
  /// 160000, 192000, 224000, 256000, 288000, 320000, 384000, 448000, 512000,
  /// 576000, 640000, 768000, 896000, 1024000. The value you set is also
  /// constrained by the values that you choose for Profile (codecProfile),
  /// Bitrate control mode (codingMode), and Sample rate (sampleRate). Default
  /// values depend on Bitrate control mode and Profile.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// AAC Profile.
  @_s.JsonKey(name: 'codecProfile')
  final AacCodecProfile codecProfile;

  /// Mono (Audio Description), Mono, Stereo, or 5.1 channel layout. Valid values
  /// depend on rate control mode and profile. "1.0 - Audio Description (Receiver
  /// Mix)" setting receives a stereo description plus control track and emits a
  /// mono AAC encode of the description track, with control data emitted in the
  /// PES header as per ETSI TS 101 154 Annex E.
  @_s.JsonKey(name: 'codingMode')
  final AacCodingMode codingMode;

  /// Rate Control Mode.
  @_s.JsonKey(name: 'rateControlMode')
  final AacRateControlMode rateControlMode;

  /// Enables LATM/LOAS AAC output. Note that if you use LATM/LOAS AAC in an
  /// output, you must choose "No container" for the output container.
  @_s.JsonKey(name: 'rawFormat')
  final AacRawFormat rawFormat;

  /// Sample rate in Hz. Valid values depend on rate control mode and profile.
  @_s.JsonKey(name: 'sampleRate')
  final int sampleRate;

  /// Use MPEG-2 AAC instead of MPEG-4 AAC audio for raw or MPEG-2 Transport
  /// Stream containers.
  @_s.JsonKey(name: 'specification')
  final AacSpecification specification;

  /// VBR Quality Level - Only used if rate_control_mode is VBR.
  @_s.JsonKey(name: 'vbrQuality')
  final AacVbrQuality vbrQuality;

  AacSettings({
    this.audioDescriptionBroadcasterMix,
    this.bitrate,
    this.codecProfile,
    this.codingMode,
    this.rateControlMode,
    this.rawFormat,
    this.sampleRate,
    this.specification,
    this.vbrQuality,
  });
  factory AacSettings.fromJson(Map<String, dynamic> json) =>
      _$AacSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AacSettingsToJson(this);
}

/// Use MPEG-2 AAC instead of MPEG-4 AAC audio for raw or MPEG-2 Transport
/// Stream containers.
enum AacSpecification {
  @_s.JsonValue('MPEG2')
  mpeg2,
  @_s.JsonValue('MPEG4')
  mpeg4,
}

/// VBR Quality Level - Only used if rate_control_mode is VBR.
enum AacVbrQuality {
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM_LOW')
  mediumLow,
  @_s.JsonValue('MEDIUM_HIGH')
  mediumHigh,
  @_s.JsonValue('HIGH')
  high,
}

/// Specify the bitstream mode for the AC-3 stream that the encoder emits. For
/// more information about the AC3 bitstream mode, see ATSC A/52-2012 (Annex E).
enum Ac3BitstreamMode {
  @_s.JsonValue('COMPLETE_MAIN')
  completeMain,
  @_s.JsonValue('COMMENTARY')
  commentary,
  @_s.JsonValue('DIALOGUE')
  dialogue,
  @_s.JsonValue('EMERGENCY')
  emergency,
  @_s.JsonValue('HEARING_IMPAIRED')
  hearingImpaired,
  @_s.JsonValue('MUSIC_AND_EFFECTS')
  musicAndEffects,
  @_s.JsonValue('VISUALLY_IMPAIRED')
  visuallyImpaired,
  @_s.JsonValue('VOICE_OVER')
  voiceOver,
}

/// Dolby Digital coding mode. Determines number of channels.
enum Ac3CodingMode {
  @_s.JsonValue('CODING_MODE_1_0')
  codingMode_1_0,
  @_s.JsonValue('CODING_MODE_1_1')
  codingMode_1_1,
  @_s.JsonValue('CODING_MODE_2_0')
  codingMode_2_0,
  @_s.JsonValue('CODING_MODE_3_2_LFE')
  codingMode_3_2Lfe,
}

/// If set to FILM_STANDARD, adds dynamic range compression signaling to the
/// output bitstream as defined in the Dolby Digital specification.
enum Ac3DynamicRangeCompressionProfile {
  @_s.JsonValue('FILM_STANDARD')
  filmStandard,
  @_s.JsonValue('NONE')
  none,
}

/// Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only
/// valid with 3_2_LFE coding mode.
enum Ac3LfeFilter {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+,
/// or DolbyE decoder that supplied this audio data. If audio was not supplied
/// from one of these streams, then the static metadata settings will be used.
enum Ac3MetadataControl {
  @_s.JsonValue('FOLLOW_INPUT')
  followInput,
  @_s.JsonValue('USE_CONFIGURED')
  useConfigured,
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value AC3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Ac3Settings {
  /// Specify the average bitrate in bits per second. Valid bitrates depend on the
  /// coding mode.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// Specify the bitstream mode for the AC-3 stream that the encoder emits. For
  /// more information about the AC3 bitstream mode, see ATSC A/52-2012 (Annex E).
  @_s.JsonKey(name: 'bitstreamMode')
  final Ac3BitstreamMode bitstreamMode;

  /// Dolby Digital coding mode. Determines number of channels.
  @_s.JsonKey(name: 'codingMode')
  final Ac3CodingMode codingMode;

  /// Sets the dialnorm for the output. If blank and input audio is Dolby Digital,
  /// dialnorm will be passed through.
  @_s.JsonKey(name: 'dialnorm')
  final int dialnorm;

  /// If set to FILM_STANDARD, adds dynamic range compression signaling to the
  /// output bitstream as defined in the Dolby Digital specification.
  @_s.JsonKey(name: 'dynamicRangeCompressionProfile')
  final Ac3DynamicRangeCompressionProfile dynamicRangeCompressionProfile;

  /// Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only
  /// valid with 3_2_LFE coding mode.
  @_s.JsonKey(name: 'lfeFilter')
  final Ac3LfeFilter lfeFilter;

  /// When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+,
  /// or DolbyE decoder that supplied this audio data. If audio was not supplied
  /// from one of these streams, then the static metadata settings will be used.
  @_s.JsonKey(name: 'metadataControl')
  final Ac3MetadataControl metadataControl;

  /// This value is always 48000. It represents the sample rate in Hz.
  @_s.JsonKey(name: 'sampleRate')
  final int sampleRate;

  Ac3Settings({
    this.bitrate,
    this.bitstreamMode,
    this.codingMode,
    this.dialnorm,
    this.dynamicRangeCompressionProfile,
    this.lfeFilter,
    this.metadataControl,
    this.sampleRate,
  });
  factory Ac3Settings.fromJson(Map<String, dynamic> json) =>
      _$Ac3SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Ac3SettingsToJson(this);
}

/// Specify whether the service runs your job with accelerated transcoding.
/// Choose DISABLED if you don't want accelerated transcoding. Choose ENABLED if
/// you want your job to run with accelerated transcoding and to fail if your
/// input files or your job settings aren't compatible with accelerated
/// transcoding. Choose PREFERRED if you want your job to run with accelerated
/// transcoding if the job is compatible with the feature and to run at standard
/// speed if it's not.
enum AccelerationMode {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('PREFERRED')
  preferred,
}

/// Accelerated transcoding can significantly speed up jobs with long, visually
/// complex content.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccelerationSettings {
  /// Specify the conditions when the service will run your job with accelerated
  /// transcoding.
  @_s.JsonKey(name: 'mode')
  final AccelerationMode mode;

  AccelerationSettings({
    @_s.required this.mode,
  });
  factory AccelerationSettings.fromJson(Map<String, dynamic> json) =>
      _$AccelerationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AccelerationSettingsToJson(this);
}

/// Describes whether the current job is running with accelerated transcoding.
/// For jobs that have Acceleration (AccelerationMode) set to DISABLED,
/// AccelerationStatus is always NOT_APPLICABLE. For jobs that have Acceleration
/// (AccelerationMode) set to ENABLED or PREFERRED, AccelerationStatus is one of
/// the other states. AccelerationStatus is IN_PROGRESS initially, while the
/// service determines whether the input files and job settings are compatible
/// with accelerated transcoding. If they are, AcclerationStatus is ACCELERATED.
/// If your input files and job settings aren't compatible with accelerated
/// transcoding, the service either fails your job or runs it without
/// accelerated transcoding, depending on how you set Acceleration
/// (AccelerationMode). When the service runs your job without accelerated
/// transcoding, AccelerationStatus is NOT_ACCELERATED.
enum AccelerationStatus {
  @_s.JsonValue('NOT_APPLICABLE')
  notApplicable,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('ACCELERATED')
  accelerated,
  @_s.JsonValue('NOT_ACCELERATED')
  notAccelerated,
}

/// This setting only applies to H.264, H.265, and MPEG2 outputs. Use Insert AFD
/// signaling (AfdSignaling) to specify whether the service includes AFD values
/// in the output video data and what those values are. * Choose None to remove
/// all AFD values from this output. * Choose Fixed to ignore input AFD values
/// and instead encode the value specified in the job. * Choose Auto to
/// calculate output AFD values based on the input AFD scaler data.
enum AfdSignaling {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('FIXED')
  fixed,
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value AIFF.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AiffSettings {
  /// Specify Bit depth (BitDepth), in bits per sample, to choose the encoding
  /// quality for this audio track.
  @_s.JsonKey(name: 'bitDepth')
  final int bitDepth;

  /// Specify the number of channels in this output audio track. Valid values are
  /// 1 and even numbers up to 64. For example, 1, 2, 4, 6, and so on, up to 64.
  @_s.JsonKey(name: 'channels')
  final int channels;

  /// Sample rate in hz.
  @_s.JsonKey(name: 'sampleRate')
  final int sampleRate;

  AiffSettings({
    this.bitDepth,
    this.channels,
    this.sampleRate,
  });
  factory AiffSettings.fromJson(Map<String, dynamic> json) =>
      _$AiffSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AiffSettingsToJson(this);
}

/// Ignore this setting unless this input is a QuickTime animation with an alpha
/// channel. Use this setting to create separate Key and Fill outputs. In each
/// output, specify which part of the input MediaConvert uses. Leave this
/// setting at the default value DISCARD to delete the alpha channel and
/// preserve the video. Set it to REMAP_TO_LUMA to delete the video and map the
/// alpha channel to the luma channel of your outputs.
enum AlphaBehavior {
  @_s.JsonValue('DISCARD')
  discard,
  @_s.JsonValue('REMAP_TO_LUMA')
  remapToLuma,
}

/// Specify whether this set of input captions appears in your outputs in both
/// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
/// includes the captions data in two ways: it passes the 608 data through using
/// the 608 compatibility bytes fields of the 708 wrapper, and it also
/// translates the 608 data into 708.
enum AncillaryConvert608To708 {
  @_s.JsonValue('UPCONVERT')
  upconvert,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Settings for ancillary captions source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AncillarySourceSettings {
  /// Specify whether this set of input captions appears in your outputs in both
  /// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
  /// includes the captions data in two ways: it passes the 608 data through using
  /// the 608 compatibility bytes fields of the 708 wrapper, and it also
  /// translates the 608 data into 708.
  @_s.JsonKey(name: 'convert608To708')
  final AncillaryConvert608To708 convert608To708;

  /// Specifies the 608 channel number in the ancillary data track from which to
  /// extract captions. Unused for passthrough.
  @_s.JsonKey(name: 'sourceAncillaryChannelNumber')
  final int sourceAncillaryChannelNumber;

  /// By default, the service terminates any unterminated captions at the end of
  /// each input. If you want the caption to continue onto your next input,
  /// disable this setting.
  @_s.JsonKey(name: 'terminateCaptions')
  final AncillaryTerminateCaptions terminateCaptions;

  AncillarySourceSettings({
    this.convert608To708,
    this.sourceAncillaryChannelNumber,
    this.terminateCaptions,
  });
  factory AncillarySourceSettings.fromJson(Map<String, dynamic> json) =>
      _$AncillarySourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AncillarySourceSettingsToJson(this);
}

/// By default, the service terminates any unterminated captions at the end of
/// each input. If you want the caption to continue onto your next input,
/// disable this setting.
enum AncillaryTerminateCaptions {
  @_s.JsonValue('END_OF_INPUT')
  endOfInput,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// The anti-alias filter is automatically applied to all outputs. The service
/// no longer accepts the value DISABLED for AntiAlias. If you specify that in
/// your job, the service will ignore the setting.
enum AntiAlias {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateCertificateResponse {
  AssociateCertificateResponse();
  factory AssociateCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateCertificateResponseFromJson(json);
}

/// You can add a tag for this mono-channel audio track to mimic its placement
/// in a multi-channel layout.  For example, if this track is the left surround
/// channel, choose Left surround (LS).
enum AudioChannelTag {
  @_s.JsonValue('L')
  l,
  @_s.JsonValue('R')
  r,
  @_s.JsonValue('C')
  c,
  @_s.JsonValue('LFE')
  lfe,
  @_s.JsonValue('LS')
  ls,
  @_s.JsonValue('RS')
  rs,
  @_s.JsonValue('LC')
  lc,
  @_s.JsonValue('RC')
  rc,
  @_s.JsonValue('CS')
  cs,
  @_s.JsonValue('LSD')
  lsd,
  @_s.JsonValue('RSD')
  rsd,
  @_s.JsonValue('TCS')
  tcs,
  @_s.JsonValue('VHL')
  vhl,
  @_s.JsonValue('VHC')
  vhc,
  @_s.JsonValue('VHR')
  vhr,
}

/// When you mimic a multi-channel audio layout with multiple mono-channel
/// tracks, you can tag each channel layout manually. For example, you would tag
/// the tracks that contain your left, right, and center audio with Left (L),
/// Right (R), and Center (C), respectively. When you don't specify a value,
/// MediaConvert labels your track as Center (C) by default. To use audio layout
/// tagging, your output must be in a QuickTime (.mov) container; your audio
/// codec must be AAC, WAV, or AIFF; and you must set up your audio track to
/// have only one channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioChannelTaggingSettings {
  /// You can add a tag for this mono-channel audio track to mimic its placement
  /// in a multi-channel layout.  For example, if this track is the left surround
  /// channel, choose Left surround (LS).
  @_s.JsonKey(name: 'channelTag')
  final AudioChannelTag channelTag;

  AudioChannelTaggingSettings({
    this.channelTag,
  });
  factory AudioChannelTaggingSettings.fromJson(Map<String, dynamic> json) =>
      _$AudioChannelTaggingSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AudioChannelTaggingSettingsToJson(this);
}

/// Type of Audio codec.
enum AudioCodec {
  @_s.JsonValue('AAC')
  aac,
  @_s.JsonValue('MP2')
  mp2,
  @_s.JsonValue('MP3')
  mp3,
  @_s.JsonValue('WAV')
  wav,
  @_s.JsonValue('AIFF')
  aiff,
  @_s.JsonValue('AC3')
  ac3,
  @_s.JsonValue('EAC3')
  eac3,
  @_s.JsonValue('EAC3_ATMOS')
  eac3Atmos,
  @_s.JsonValue('VORBIS')
  vorbis,
  @_s.JsonValue('OPUS')
  opus,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// Audio codec settings (CodecSettings) under (AudioDescriptions) contains the
/// group of settings related to audio encoding. The settings in this group vary
/// depending on the value that you choose for Audio codec (Codec). For each
/// codec enum that you choose, define the corresponding settings object. The
/// following lists the codec enum, settings object pairs. * AAC, AacSettings *
/// MP2, Mp2Settings * MP3, Mp3Settings * WAV, WavSettings * AIFF, AiffSettings
/// * AC3, Ac3Settings * EAC3, Eac3Settings * EAC3_ATMOS, Eac3AtmosSettings *
/// VORBIS, VorbisSettings * OPUS, OpusSettings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioCodecSettings {
  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value AAC. The service accepts one of two mutually exclusive groups of
  /// AAC settings--VBR and CBR. To select one of these modes, set the value of
  /// Bitrate control mode (rateControlMode) to "VBR" or "CBR".  In VBR mode, you
  /// control the audio quality with the setting VBR quality (vbrQuality). In CBR
  /// mode, you use the setting Bitrate (bitrate). Defaults and valid values
  /// depend on the rate control mode.
  @_s.JsonKey(name: 'aacSettings')
  final AacSettings aacSettings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value AC3.
  @_s.JsonKey(name: 'ac3Settings')
  final Ac3Settings ac3Settings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value AIFF.
  @_s.JsonKey(name: 'aiffSettings')
  final AiffSettings aiffSettings;

  /// Type of Audio codec.
  @_s.JsonKey(name: 'codec')
  final AudioCodec codec;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value EAC3_ATMOS.
  @_s.JsonKey(name: 'eac3AtmosSettings')
  final Eac3AtmosSettings eac3AtmosSettings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value EAC3.
  @_s.JsonKey(name: 'eac3Settings')
  final Eac3Settings eac3Settings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value MP2.
  @_s.JsonKey(name: 'mp2Settings')
  final Mp2Settings mp2Settings;

  /// Required when you set Codec, under AudioDescriptions>CodecSettings, to the
  /// value MP3.
  @_s.JsonKey(name: 'mp3Settings')
  final Mp3Settings mp3Settings;

  /// Required when you set Codec, under AudioDescriptions>CodecSettings, to the
  /// value OPUS.
  @_s.JsonKey(name: 'opusSettings')
  final OpusSettings opusSettings;

  /// Required when you set Codec, under AudioDescriptions>CodecSettings, to the
  /// value Vorbis.
  @_s.JsonKey(name: 'vorbisSettings')
  final VorbisSettings vorbisSettings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value WAV.
  @_s.JsonKey(name: 'wavSettings')
  final WavSettings wavSettings;

  AudioCodecSettings({
    this.aacSettings,
    this.ac3Settings,
    this.aiffSettings,
    this.codec,
    this.eac3AtmosSettings,
    this.eac3Settings,
    this.mp2Settings,
    this.mp3Settings,
    this.opusSettings,
    this.vorbisSettings,
    this.wavSettings,
  });
  factory AudioCodecSettings.fromJson(Map<String, dynamic> json) =>
      _$AudioCodecSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AudioCodecSettingsToJson(this);
}

/// Enable this setting on one audio selector to set it as the default for the
/// job. The service uses this default for outputs where it can't find the
/// specified input audio. If you don't set a default, those outputs have no
/// audio.
enum AudioDefaultSelection {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('NOT_DEFAULT')
  notDefault,
}

/// Description of audio output
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioDescription {
  /// When you mimic a multi-channel audio layout with multiple mono-channel
  /// tracks, you can tag each channel layout manually. For example, you would tag
  /// the tracks that contain your left, right, and center audio with Left (L),
  /// Right (R), and Center (C), respectively. When you don't specify a value,
  /// MediaConvert labels your track as Center (C) by default. To use audio layout
  /// tagging, your output must be in a QuickTime (.mov) container; your audio
  /// codec must be AAC, WAV, or AIFF; and you must set up your audio track to
  /// have only one channel.
  @_s.JsonKey(name: 'audioChannelTaggingSettings')
  final AudioChannelTaggingSettings audioChannelTaggingSettings;

  /// Advanced audio normalization settings. Ignore these settings unless you need
  /// to comply with a loudness standard.
  @_s.JsonKey(name: 'audioNormalizationSettings')
  final AudioNormalizationSettings audioNormalizationSettings;

  /// Specifies which audio data to use from each input. In the simplest case,
  /// specify an "Audio Selector":#inputs-audio_selector by name based on its
  /// order within each input. For example if you specify "Audio Selector 3", then
  /// the third audio selector will be used from each input. If an input does not
  /// have an "Audio Selector 3", then the audio selector marked as "default" in
  /// that input will be used. If there is no audio selector marked as "default",
  /// silence will be inserted for the duration of that input. Alternatively, an
  /// "Audio Selector Group":#inputs-audio_selector_group name may be specified,
  /// with similar default/silence behavior. If no audio_source_name is specified,
  /// then "Audio Selector 1" will be chosen automatically.
  @_s.JsonKey(name: 'audioSourceName')
  final String audioSourceName;

  /// Applies only if Follow Input Audio Type is unchecked (false). A number
  /// between 0 and 255. The following are defined in ISO-IEC 13818-1: 0 =
  /// Undefined, 1 = Clean Effects, 2 = Hearing Impaired, 3 = Visually Impaired
  /// Commentary, 4-255 = Reserved.
  @_s.JsonKey(name: 'audioType')
  final int audioType;

  /// When set to FOLLOW_INPUT, if the input contains an ISO 639 audio_type, then
  /// that value is passed through to the output. If the input contains no ISO 639
  /// audio_type, the value in Audio Type is included in the output. Otherwise the
  /// value in Audio Type is included in the output. Note that this field and
  /// audioType are both ignored if audioDescriptionBroadcasterMix is set to
  /// BROADCASTER_MIXED_AD.
  @_s.JsonKey(name: 'audioTypeControl')
  final AudioTypeControl audioTypeControl;

  /// Audio codec settings (CodecSettings) under (AudioDescriptions) contains the
  /// group of settings related to audio encoding. The settings in this group vary
  /// depending on the value that you choose for Audio codec (Codec). For each
  /// codec enum that you choose, define the corresponding settings object. The
  /// following lists the codec enum, settings object pairs. * AAC, AacSettings *
  /// MP2, Mp2Settings * MP3, Mp3Settings * WAV, WavSettings * AIFF, AiffSettings
  /// * AC3, Ac3Settings * EAC3, Eac3Settings * EAC3_ATMOS, Eac3AtmosSettings *
  /// VORBIS, VorbisSettings * OPUS, OpusSettings
  @_s.JsonKey(name: 'codecSettings')
  final AudioCodecSettings codecSettings;

  /// Specify the language for this audio output track. The service puts this
  /// language code into your output audio track when you set Language code
  /// control (AudioLanguageCodeControl) to Use configured (USE_CONFIGURED). The
  /// service also uses your specified custom language code when you set Language
  /// code control (AudioLanguageCodeControl) to Follow input (FOLLOW_INPUT), but
  /// your input file doesn't specify a language code. For all outputs, you can
  /// use an ISO 639-2 or ISO 639-3 code. For streaming outputs, you can also use
  /// any other code in the full RFC-5646 specification. Streaming outputs are
  /// those that are in one of the following output groups: CMAF, DASH ISO, Apple
  /// HLS, or Microsoft Smooth Streaming.
  @_s.JsonKey(name: 'customLanguageCode')
  final String customLanguageCode;

  /// Indicates the language of the audio output track. The ISO 639 language
  /// specified in the 'Language Code' drop down will be used when 'Follow Input
  /// Language Code' is not selected or when 'Follow Input Language Code' is
  /// selected but there is no ISO 639 language code specified by the input.
  @_s.JsonKey(name: 'languageCode')
  final LanguageCode languageCode;

  /// Specify which source for language code takes precedence for this audio
  /// track. When you choose Follow input (FOLLOW_INPUT), the service uses the
  /// language code from the input track if it's present. If there's no languge
  /// code on the input track, the service uses the code that you specify in the
  /// setting Language code (languageCode or customLanguageCode). When you choose
  /// Use configured (USE_CONFIGURED), the service uses the language code that you
  /// specify.
  @_s.JsonKey(name: 'languageCodeControl')
  final AudioLanguageCodeControl languageCodeControl;

  /// Advanced audio remixing settings.
  @_s.JsonKey(name: 'remixSettings')
  final RemixSettings remixSettings;

  /// Specify a label for this output audio stream. For example, "English",
  /// "Director commentary", or "track_2". For streaming outputs, MediaConvert
  /// passes this information into destination manifests for display on the
  /// end-viewer's player device. For outputs in other output groups, the service
  /// ignores this setting.
  @_s.JsonKey(name: 'streamName')
  final String streamName;

  AudioDescription({
    this.audioChannelTaggingSettings,
    this.audioNormalizationSettings,
    this.audioSourceName,
    this.audioType,
    this.audioTypeControl,
    this.codecSettings,
    this.customLanguageCode,
    this.languageCode,
    this.languageCodeControl,
    this.remixSettings,
    this.streamName,
  });
  factory AudioDescription.fromJson(Map<String, dynamic> json) =>
      _$AudioDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$AudioDescriptionToJson(this);
}

/// Specify which source for language code takes precedence for this audio
/// track. When you choose Follow input (FOLLOW_INPUT), the service uses the
/// language code from the input track if it's present. If there's no languge
/// code on the input track, the service uses the code that you specify in the
/// setting Language code (languageCode or customLanguageCode). When you choose
/// Use configured (USE_CONFIGURED), the service uses the language code that you
/// specify.
enum AudioLanguageCodeControl {
  @_s.JsonValue('FOLLOW_INPUT')
  followInput,
  @_s.JsonValue('USE_CONFIGURED')
  useConfigured,
}

/// Choose one of the following audio normalization algorithms: ITU-R BS.1770-1:
/// Ungated loudness. A measurement of ungated average loudness for an entire
/// piece of content, suitable for measurement of short-form content under ATSC
/// recommendation A/85. Supports up to 5.1 audio channels. ITU-R BS.1770-2:
/// Gated loudness. A measurement of gated average loudness compliant with the
/// requirements of EBU-R128. Supports up to 5.1 audio channels. ITU-R
/// BS.1770-3: Modified peak. The same loudness measurement algorithm as 1770-2,
/// with an updated true peak measurement. ITU-R BS.1770-4: Higher channel
/// count. Allows for more audio channels than the other algorithms, including
/// configurations such as 7.1.
enum AudioNormalizationAlgorithm {
  @_s.JsonValue('ITU_BS_1770_1')
  ituBs_1770_1,
  @_s.JsonValue('ITU_BS_1770_2')
  ituBs_1770_2,
  @_s.JsonValue('ITU_BS_1770_3')
  ituBs_1770_3,
  @_s.JsonValue('ITU_BS_1770_4')
  ituBs_1770_4,
}

/// When enabled the output audio is corrected using the chosen algorithm. If
/// disabled, the audio will be measured but not adjusted.
enum AudioNormalizationAlgorithmControl {
  @_s.JsonValue('CORRECT_AUDIO')
  correctAudio,
  @_s.JsonValue('MEASURE_ONLY')
  measureOnly,
}

/// If set to LOG, log each output's audio track loudness to a CSV file.
enum AudioNormalizationLoudnessLogging {
  @_s.JsonValue('LOG')
  log,
  @_s.JsonValue('DONT_LOG')
  dontLog,
}

/// If set to TRUE_PEAK, calculate and log the TruePeak for each output's audio
/// track loudness.
enum AudioNormalizationPeakCalculation {
  @_s.JsonValue('TRUE_PEAK')
  truePeak,
  @_s.JsonValue('NONE')
  none,
}

/// Advanced audio normalization settings. Ignore these settings unless you need
/// to comply with a loudness standard.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioNormalizationSettings {
  /// Choose one of the following audio normalization algorithms: ITU-R BS.1770-1:
  /// Ungated loudness. A measurement of ungated average loudness for an entire
  /// piece of content, suitable for measurement of short-form content under ATSC
  /// recommendation A/85. Supports up to 5.1 audio channels. ITU-R BS.1770-2:
  /// Gated loudness. A measurement of gated average loudness compliant with the
  /// requirements of EBU-R128. Supports up to 5.1 audio channels. ITU-R
  /// BS.1770-3: Modified peak. The same loudness measurement algorithm as 1770-2,
  /// with an updated true peak measurement. ITU-R BS.1770-4: Higher channel
  /// count. Allows for more audio channels than the other algorithms, including
  /// configurations such as 7.1.
  @_s.JsonKey(name: 'algorithm')
  final AudioNormalizationAlgorithm algorithm;

  /// When enabled the output audio is corrected using the chosen algorithm. If
  /// disabled, the audio will be measured but not adjusted.
  @_s.JsonKey(name: 'algorithmControl')
  final AudioNormalizationAlgorithmControl algorithmControl;

  /// Content measuring above this level will be corrected to the target level.
  /// Content measuring below this level will not be corrected.
  @_s.JsonKey(name: 'correctionGateLevel')
  final int correctionGateLevel;

  /// If set to LOG, log each output's audio track loudness to a CSV file.
  @_s.JsonKey(name: 'loudnessLogging')
  final AudioNormalizationLoudnessLogging loudnessLogging;

  /// If set to TRUE_PEAK, calculate and log the TruePeak for each output's audio
  /// track loudness.
  @_s.JsonKey(name: 'peakCalculation')
  final AudioNormalizationPeakCalculation peakCalculation;

  /// When you use Audio normalization (AudioNormalizationSettings), optionally
  /// use this setting to specify a target loudness. If you don't specify a value
  /// here, the encoder chooses a value for you, based on the algorithm that you
  /// choose for Algorithm (algorithm). If you choose algorithm 1770-1, the
  /// encoder will choose -24 LKFS; otherwise, the encoder will choose -23 LKFS.
  @_s.JsonKey(name: 'targetLkfs')
  final double targetLkfs;

  AudioNormalizationSettings({
    this.algorithm,
    this.algorithmControl,
    this.correctionGateLevel,
    this.loudnessLogging,
    this.peakCalculation,
    this.targetLkfs,
  });
  factory AudioNormalizationSettings.fromJson(Map<String, dynamic> json) =>
      _$AudioNormalizationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AudioNormalizationSettingsToJson(this);
}

/// Selector for Audio
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioSelector {
  /// Selects a specific language code from within an audio source, using the ISO
  /// 639-2 or ISO 639-3 three-letter language code
  @_s.JsonKey(name: 'customLanguageCode')
  final String customLanguageCode;

  /// Enable this setting on one audio selector to set it as the default for the
  /// job. The service uses this default for outputs where it can't find the
  /// specified input audio. If you don't set a default, those outputs have no
  /// audio.
  @_s.JsonKey(name: 'defaultSelection')
  final AudioDefaultSelection defaultSelection;

  /// Specifies audio data from an external file source.
  @_s.JsonKey(name: 'externalAudioFileInput')
  final String externalAudioFileInput;

  /// Selects a specific language code from within an audio source.
  @_s.JsonKey(name: 'languageCode')
  final LanguageCode languageCode;

  /// Specifies a time delta in milliseconds to offset the audio from the input
  /// video.
  @_s.JsonKey(name: 'offset')
  final int offset;

  /// Selects a specific PID from within an audio source (e.g. 257 selects PID
  /// 0x101).
  @_s.JsonKey(name: 'pids')
  final List<int> pids;

  /// Use this setting for input streams that contain Dolby E, to have the service
  /// extract specific program data from the track. To select multiple programs,
  /// create multiple selectors with the same Track and different Program numbers.
  /// In the console, this setting is visible when you set Selector type to Track.
  /// Choose the program number from the dropdown list. If you are sending a JSON
  /// file, provide the program ID, which is part of the audio metadata. If your
  /// input file has incorrect metadata, you can choose All channels instead of a
  /// program number to have the service ignore the program IDs and include all
  /// the programs in the track.
  @_s.JsonKey(name: 'programSelection')
  final int programSelection;

  /// Use these settings to reorder the audio channels of one input to match those
  /// of another input. This allows you to combine the two files into a single
  /// output, one after the other.
  @_s.JsonKey(name: 'remixSettings')
  final RemixSettings remixSettings;

  /// Specifies the type of the audio selector.
  @_s.JsonKey(name: 'selectorType')
  final AudioSelectorType selectorType;

  /// Identify a track from the input audio to include in this selector by
  /// entering the track index number. To include several tracks in a single audio
  /// selector, specify multiple tracks as follows. Using the console, enter a
  /// comma-separated list. For examle, type "1,2,3" to include tracks 1 through
  /// 3. Specifying directly in your JSON job file, provide the track numbers in
  /// an array. For example, "tracks": [1,2,3].
  @_s.JsonKey(name: 'tracks')
  final List<int> tracks;

  AudioSelector({
    this.customLanguageCode,
    this.defaultSelection,
    this.externalAudioFileInput,
    this.languageCode,
    this.offset,
    this.pids,
    this.programSelection,
    this.remixSettings,
    this.selectorType,
    this.tracks,
  });
  factory AudioSelector.fromJson(Map<String, dynamic> json) =>
      _$AudioSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$AudioSelectorToJson(this);
}

/// Group of Audio Selectors
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioSelectorGroup {
  /// Name of an Audio Selector within the same input to include in the group.
  /// Audio selector names are standardized, based on their order within the input
  /// (e.g., "Audio Selector 1"). The audio selector name parameter can be
  /// repeated to add any number of audio selectors to the group.
  @_s.JsonKey(name: 'audioSelectorNames')
  final List<String> audioSelectorNames;

  AudioSelectorGroup({
    this.audioSelectorNames,
  });
  factory AudioSelectorGroup.fromJson(Map<String, dynamic> json) =>
      _$AudioSelectorGroupFromJson(json);

  Map<String, dynamic> toJson() => _$AudioSelectorGroupToJson(this);
}

/// Specifies the type of the audio selector.
enum AudioSelectorType {
  @_s.JsonValue('PID')
  pid,
  @_s.JsonValue('TRACK')
  track,
  @_s.JsonValue('LANGUAGE_CODE')
  languageCode,
}

/// When set to FOLLOW_INPUT, if the input contains an ISO 639 audio_type, then
/// that value is passed through to the output. If the input contains no ISO 639
/// audio_type, the value in Audio Type is included in the output. Otherwise the
/// value in Audio Type is included in the output. Note that this field and
/// audioType are both ignored if audioDescriptionBroadcasterMix is set to
/// BROADCASTER_MIXED_AD.
enum AudioTypeControl {
  @_s.JsonValue('FOLLOW_INPUT')
  followInput,
  @_s.JsonValue('USE_CONFIGURED')
  useConfigured,
}

/// Use automated ABR to have MediaConvert set up the renditions in your ABR
/// package for you automatically, based on characteristics of your input video.
/// This feature optimizes video quality while minimizing the overall size of
/// your ABR package.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutomatedAbrSettings {
  /// Optional. The maximum target bit rate used in your automated ABR stack. Use
  /// this value to set an upper limit on the bandwidth consumed by the
  /// highest-quality rendition. This is the rendition that is delivered to
  /// viewers with the fastest internet connections. If you don't specify a value,
  /// MediaConvert uses 8,000,000 (8 mb/s) by default.
  @_s.JsonKey(name: 'maxAbrBitrate')
  final int maxAbrBitrate;

  /// Optional. The maximum number of renditions that MediaConvert will create in
  /// your automated ABR stack. The number of renditions is determined
  /// automatically, based on analysis of each job, but will never exceed this
  /// limit. When you set this to Auto in the console, which is equivalent to
  /// excluding it from your JSON job specification, MediaConvert defaults to a
  /// limit of 15.
  @_s.JsonKey(name: 'maxRenditions')
  final int maxRenditions;

  /// Optional. The minimum target bitrate used in your automated ABR stack. Use
  /// this value to set a lower limit on the bitrate of video delivered to viewers
  /// with slow internet connections. If you don't specify a value, MediaConvert
  /// uses 600,000 (600 kb/s) by default.
  @_s.JsonKey(name: 'minAbrBitrate')
  final int minAbrBitrate;

  AutomatedAbrSettings({
    this.maxAbrBitrate,
    this.maxRenditions,
    this.minAbrBitrate,
  });
  factory AutomatedAbrSettings.fromJson(Map<String, dynamic> json) =>
      _$AutomatedAbrSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AutomatedAbrSettingsToJson(this);
}

/// Use automated encoding to have MediaConvert choose your encoding settings
/// for you, based on characteristics of your input video.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutomatedEncodingSettings {
  /// Use automated ABR to have MediaConvert set up the renditions in your ABR
  /// package for you automatically, based on characteristics of your input video.
  /// This feature optimizes video quality while minimizing the overall size of
  /// your ABR package.
  @_s.JsonKey(name: 'abrSettings')
  final AutomatedAbrSettings abrSettings;

  AutomatedEncodingSettings({
    this.abrSettings,
  });
  factory AutomatedEncodingSettings.fromJson(Map<String, dynamic> json) =>
      _$AutomatedEncodingSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AutomatedEncodingSettingsToJson(this);
}

/// Specify the strength of any adaptive quantization filters that you enable.
/// The value that you choose here applies to Spatial adaptive quantization
/// (spatialAdaptiveQuantization).
enum Av1AdaptiveQuantization {
  @_s.JsonValue('OFF')
  off,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('HIGHER')
  higher,
  @_s.JsonValue('MAX')
  max,
}

/// If you are using the console, use the Framerate setting to specify the frame
/// rate for this output. If you want to keep the same frame rate as the input
/// video, choose Follow source. If you want to do frame rate conversion, choose
/// a frame rate from the dropdown list or choose Custom. The framerates shown
/// in the dropdown list are decimal approximations of fractions. If you choose
/// Custom, specify your frame rate as a fraction. If you are creating your
/// transcoding job specification as a JSON file without the console, use
/// FramerateControl to specify which value the service uses for the frame rate
/// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
/// use the frame rate from the input. Choose SPECIFIED if you want the service
/// to use the frame rate you specify in the settings FramerateNumerator and
/// FramerateDenominator.
enum Av1FramerateControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Choose the method that you want MediaConvert to use when increasing or
/// decreasing the frame rate. We recommend using drop duplicate
/// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
/// fps. For numerically complex conversions, you can use interpolate
/// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
/// introduce undesirable video artifacts. For complex frame rate conversions,
/// especially if your source video has already been converted from its original
/// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
/// interpolation. FrameFormer chooses the best conversion method frame by
/// frame. Note that using FrameFormer increases the transcoding time and incurs
/// a significant add-on cost.
enum Av1FramerateConversionAlgorithm {
  @_s.JsonValue('DUPLICATE_DROP')
  duplicateDrop,
  @_s.JsonValue('INTERPOLATE')
  interpolate,
  @_s.JsonValue('FRAMEFORMER')
  frameformer,
}

/// Settings for quality-defined variable bitrate encoding with the AV1 codec.
/// Required when you set Rate control mode to QVBR. Not valid when you set Rate
/// control mode to a value other than QVBR, or when you don't define Rate
/// control mode.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Av1QvbrSettings {
  /// Required when you use QVBR rate control mode. That is, when you specify
  /// qvbrSettings within av1Settings. Specify the general target quality level
  /// for this output, from 1 to 10. Use higher numbers for greater quality. Level
  /// 10 results in nearly lossless compression. The quality level for most
  /// broadcast-quality transcodes is between 6 and 9. Optionally, to specify a
  /// value between whole numbers, also provide a value for the setting
  /// qvbrQualityLevelFineTune. For example, if you want your QVBR quality level
  /// to be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to
  /// .33.
  @_s.JsonKey(name: 'qvbrQualityLevel')
  final int qvbrQualityLevel;

  /// Optional. Specify a value here to set the QVBR quality to a level that is
  /// between whole numbers. For example, if you want your QVBR quality level to
  /// be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33.
  /// MediaConvert rounds your QVBR quality level to the nearest third of a whole
  /// number. For example, if you set qvbrQualityLevel to 7 and you set
  /// qvbrQualityLevelFineTune to .25, your actual QVBR quality level is 7.33.
  @_s.JsonKey(name: 'qvbrQualityLevelFineTune')
  final double qvbrQualityLevelFineTune;

  Av1QvbrSettings({
    this.qvbrQualityLevel,
    this.qvbrQualityLevelFineTune,
  });
  factory Av1QvbrSettings.fromJson(Map<String, dynamic> json) =>
      _$Av1QvbrSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Av1QvbrSettingsToJson(this);
}

/// 'With AV1 outputs, for rate control mode, MediaConvert supports only
/// quality-defined variable bitrate (QVBR). You can''t use CBR or VBR.'
enum Av1RateControlMode {
  @_s.JsonValue('QVBR')
  qvbr,
}

/// Required when you set Codec, under VideoDescription>CodecSettings to the
/// value AV1.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Av1Settings {
  /// Specify the strength of any adaptive quantization filters that you enable.
  /// The value that you choose here applies to Spatial adaptive quantization
  /// (spatialAdaptiveQuantization).
  @_s.JsonKey(name: 'adaptiveQuantization')
  final Av1AdaptiveQuantization adaptiveQuantization;

  /// If you are using the console, use the Framerate setting to specify the frame
  /// rate for this output. If you want to keep the same frame rate as the input
  /// video, choose Follow source. If you want to do frame rate conversion, choose
  /// a frame rate from the dropdown list or choose Custom. The framerates shown
  /// in the dropdown list are decimal approximations of fractions. If you choose
  /// Custom, specify your frame rate as a fraction. If you are creating your
  /// transcoding job specification as a JSON file without the console, use
  /// FramerateControl to specify which value the service uses for the frame rate
  /// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
  /// use the frame rate from the input. Choose SPECIFIED if you want the service
  /// to use the frame rate you specify in the settings FramerateNumerator and
  /// FramerateDenominator.
  @_s.JsonKey(name: 'framerateControl')
  final Av1FramerateControl framerateControl;

  /// Choose the method that you want MediaConvert to use when increasing or
  /// decreasing the frame rate. We recommend using drop duplicate
  /// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
  /// fps. For numerically complex conversions, you can use interpolate
  /// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
  /// introduce undesirable video artifacts. For complex frame rate conversions,
  /// especially if your source video has already been converted from its original
  /// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
  /// interpolation. FrameFormer chooses the best conversion method frame by
  /// frame. Note that using FrameFormer increases the transcoding time and incurs
  /// a significant add-on cost.
  @_s.JsonKey(name: 'framerateConversionAlgorithm')
  final Av1FramerateConversionAlgorithm framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// Specify the GOP length (keyframe interval) in frames. With AV1, MediaConvert
  /// doesn't support GOP length in seconds. This value must be greater than zero
  /// and preferably equal to 1 + ((numberBFrames + 1) * x), where x is an integer
  /// value.
  @_s.JsonKey(name: 'gopSize')
  final double gopSize;

  /// Maximum bitrate in bits/second. For example, enter five megabits per second
  /// as 5000000. Required when Rate control mode is QVBR.
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  /// Specify the number of B-frames. With AV1, MediaConvert supports only 7 or
  /// 15.
  @_s.JsonKey(name: 'numberBFramesBetweenReferenceFrames')
  final int numberBFramesBetweenReferenceFrames;

  /// Settings for quality-defined variable bitrate encoding with the AV1 codec.
  /// Required when you set Rate control mode to QVBR. Not valid when you set Rate
  /// control mode to a value other than QVBR, or when you don't define Rate
  /// control mode.
  @_s.JsonKey(name: 'qvbrSettings')
  final Av1QvbrSettings qvbrSettings;

  /// 'With AV1 outputs, for rate control mode, MediaConvert supports only
  /// quality-defined variable bitrate (QVBR). You can''t use CBR or VBR.'
  @_s.JsonKey(name: 'rateControlMode')
  final Av1RateControlMode rateControlMode;

  /// Specify the number of slices per picture. This value must be 1, 2, 4, 8, 16,
  /// or 32. For progressive pictures, this value must be less than or equal to
  /// the number of macroblock rows. For interlaced pictures, this value must be
  /// less than or equal to half the number of macroblock rows.
  @_s.JsonKey(name: 'slices')
  final int slices;

  /// Keep the default value, Enabled (ENABLED), to adjust quantization within
  /// each frame based on spatial variation of content complexity. When you enable
  /// this feature, the encoder uses fewer bits on areas that can sustain more
  /// distortion with no noticeable visual degradation and uses more bits on areas
  /// where any small distortion will be noticeable. For example, complex textured
  /// blocks are encoded with fewer bits and smooth textured blocks are encoded
  /// with more bits. Enabling this feature will almost always improve your video
  /// quality. Note, though, that this feature doesn't take into account where the
  /// viewer's attention is likely to be. If viewers are likely to be focusing
  /// their attention on a part of the screen with a lot of complex texture, you
  /// might choose to disable this feature. Related setting: When you enable
  /// spatial adaptive quantization, set the value for Adaptive quantization
  /// (adaptiveQuantization) depending on your content. For homogeneous content,
  /// such as cartoons and video games, set it to Low. For content with a wider
  /// variety of textures, set it to High or Higher.
  @_s.JsonKey(name: 'spatialAdaptiveQuantization')
  final Av1SpatialAdaptiveQuantization spatialAdaptiveQuantization;

  Av1Settings({
    this.adaptiveQuantization,
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.gopSize,
    this.maxBitrate,
    this.numberBFramesBetweenReferenceFrames,
    this.qvbrSettings,
    this.rateControlMode,
    this.slices,
    this.spatialAdaptiveQuantization,
  });
  factory Av1Settings.fromJson(Map<String, dynamic> json) =>
      _$Av1SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Av1SettingsToJson(this);
}

/// Keep the default value, Enabled (ENABLED), to adjust quantization within
/// each frame based on spatial variation of content complexity. When you enable
/// this feature, the encoder uses fewer bits on areas that can sustain more
/// distortion with no noticeable visual degradation and uses more bits on areas
/// where any small distortion will be noticeable. For example, complex textured
/// blocks are encoded with fewer bits and smooth textured blocks are encoded
/// with more bits. Enabling this feature will almost always improve your video
/// quality. Note, though, that this feature doesn't take into account where the
/// viewer's attention is likely to be. If viewers are likely to be focusing
/// their attention on a part of the screen with a lot of complex texture, you
/// might choose to disable this feature. Related setting: When you enable
/// spatial adaptive quantization, set the value for Adaptive quantization
/// (adaptiveQuantization) depending on your content. For homogeneous content,
/// such as cartoons and video games, set it to Low. For content with a wider
/// variety of textures, set it to High or Higher.
enum Av1SpatialAdaptiveQuantization {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Settings for Avail Blanking
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AvailBlanking {
  /// Blanking image to be used. Leave empty for solid black. Only bmp and png
  /// images are supported.
  @_s.JsonKey(name: 'availBlankingImage')
  final String availBlankingImage;

  AvailBlanking({
    this.availBlankingImage,
  });
  factory AvailBlanking.fromJson(Map<String, dynamic> json) =>
      _$AvailBlankingFromJson(json);

  Map<String, dynamic> toJson() => _$AvailBlankingToJson(this);
}

/// Specify the AVC-Intra class of your output. The AVC-Intra class selection
/// determines the output video bit rate depending on the frame rate of the
/// output. Outputs with higher class values have higher bitrates and improved
/// image quality.
enum AvcIntraClass {
  @_s.JsonValue('CLASS_50')
  class_50,
  @_s.JsonValue('CLASS_100')
  class_100,
  @_s.JsonValue('CLASS_200')
  class_200,
}

/// If you are using the console, use the Framerate setting to specify the frame
/// rate for this output. If you want to keep the same frame rate as the input
/// video, choose Follow source. If you want to do frame rate conversion, choose
/// a frame rate from the dropdown list or choose Custom. The framerates shown
/// in the dropdown list are decimal approximations of fractions. If you choose
/// Custom, specify your frame rate as a fraction. If you are creating your
/// transcoding job specification as a JSON file without the console, use
/// FramerateControl to specify which value the service uses for the frame rate
/// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
/// use the frame rate from the input. Choose SPECIFIED if you want the service
/// to use the frame rate you specify in the settings FramerateNumerator and
/// FramerateDenominator.
enum AvcIntraFramerateControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Choose the method that you want MediaConvert to use when increasing or
/// decreasing the frame rate. We recommend using drop duplicate
/// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
/// fps. For numerically complex conversions, you can use interpolate
/// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
/// introduce undesirable video artifacts. For complex frame rate conversions,
/// especially if your source video has already been converted from its original
/// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
/// interpolation. FrameFormer chooses the best conversion method frame by
/// frame. Note that using FrameFormer increases the transcoding time and incurs
/// a significant add-on cost.
enum AvcIntraFramerateConversionAlgorithm {
  @_s.JsonValue('DUPLICATE_DROP')
  duplicateDrop,
  @_s.JsonValue('INTERPOLATE')
  interpolate,
  @_s.JsonValue('FRAMEFORMER')
  frameformer,
}

/// Choose the scan line type for the output. Keep the default value,
/// Progressive (PROGRESSIVE) to create a progressive output, regardless of the
/// scan type of your input. Use Top field first (TOP_FIELD) or Bottom field
/// first (BOTTOM_FIELD) to create an output that's interlaced with the same
/// field polarity throughout. Use Follow, default top (FOLLOW_TOP_FIELD) or
/// Follow, default bottom (FOLLOW_BOTTOM_FIELD) to produce outputs with the
/// same field polarity as the source. For jobs that have multiple inputs, the
/// output field polarity might change over the course of the output. Follow
/// behavior depends on the input scan type. If the source is interlaced, the
/// output will be interlaced with the same polarity as the source. If the
/// source is progressive, the output will be interlaced with top field bottom
/// field first, depending on which of the Follow options you choose.
enum AvcIntraInterlaceMode {
  @_s.JsonValue('PROGRESSIVE')
  progressive,
  @_s.JsonValue('TOP_FIELD')
  topField,
  @_s.JsonValue('BOTTOM_FIELD')
  bottomField,
  @_s.JsonValue('FOLLOW_TOP_FIELD')
  followTopField,
  @_s.JsonValue('FOLLOW_BOTTOM_FIELD')
  followBottomField,
}

/// Required when you set your output video codec to AVC-Intra. For more
/// information about the AVC-I settings, see the relevant specification. For
/// detailed information about SD and HD in AVC-I, see
/// https://ieeexplore.ieee.org/document/7290936.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AvcIntraSettings {
  /// Specify the AVC-Intra class of your output. The AVC-Intra class selection
  /// determines the output video bit rate depending on the frame rate of the
  /// output. Outputs with higher class values have higher bitrates and improved
  /// image quality.
  @_s.JsonKey(name: 'avcIntraClass')
  final AvcIntraClass avcIntraClass;

  /// If you are using the console, use the Framerate setting to specify the frame
  /// rate for this output. If you want to keep the same frame rate as the input
  /// video, choose Follow source. If you want to do frame rate conversion, choose
  /// a frame rate from the dropdown list or choose Custom. The framerates shown
  /// in the dropdown list are decimal approximations of fractions. If you choose
  /// Custom, specify your frame rate as a fraction. If you are creating your
  /// transcoding job specification as a JSON file without the console, use
  /// FramerateControl to specify which value the service uses for the frame rate
  /// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
  /// use the frame rate from the input. Choose SPECIFIED if you want the service
  /// to use the frame rate you specify in the settings FramerateNumerator and
  /// FramerateDenominator.
  @_s.JsonKey(name: 'framerateControl')
  final AvcIntraFramerateControl framerateControl;

  /// Choose the method that you want MediaConvert to use when increasing or
  /// decreasing the frame rate. We recommend using drop duplicate
  /// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
  /// fps. For numerically complex conversions, you can use interpolate
  /// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
  /// introduce undesirable video artifacts. For complex frame rate conversions,
  /// especially if your source video has already been converted from its original
  /// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
  /// interpolation. FrameFormer chooses the best conversion method frame by
  /// frame. Note that using FrameFormer increases the transcoding time and incurs
  /// a significant add-on cost.
  @_s.JsonKey(name: 'framerateConversionAlgorithm')
  final AvcIntraFramerateConversionAlgorithm framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// Choose the scan line type for the output. Keep the default value,
  /// Progressive (PROGRESSIVE) to create a progressive output, regardless of the
  /// scan type of your input. Use Top field first (TOP_FIELD) or Bottom field
  /// first (BOTTOM_FIELD) to create an output that's interlaced with the same
  /// field polarity throughout. Use Follow, default top (FOLLOW_TOP_FIELD) or
  /// Follow, default bottom (FOLLOW_BOTTOM_FIELD) to produce outputs with the
  /// same field polarity as the source. For jobs that have multiple inputs, the
  /// output field polarity might change over the course of the output. Follow
  /// behavior depends on the input scan type. If the source is interlaced, the
  /// output will be interlaced with the same polarity as the source. If the
  /// source is progressive, the output will be interlaced with top field bottom
  /// field first, depending on which of the Follow options you choose.
  @_s.JsonKey(name: 'interlaceMode')
  final AvcIntraInterlaceMode interlaceMode;

  /// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
  /// second (fps). Enable slow PAL to create a 25 fps output. When you enable
  /// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
  /// your audio to keep it synchronized with the video. Note that enabling this
  /// setting will slightly reduce the duration of your video. Required settings:
  /// You must also set Framerate to 25. In your JSON job specification, set
  /// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
  /// (framerateDenominator) to 1.
  @_s.JsonKey(name: 'slowPal')
  final AvcIntraSlowPal slowPal;

  /// When you do frame rate conversion from 23.976 frames per second (fps) to
  /// 29.97 fps, and your output scan type is interlaced, you can optionally
  /// enable hard telecine (HARD) to create a smoother picture. When you keep the
  /// default value, None (NONE), MediaConvert does a standard frame rate
  /// conversion to 29.97 without doing anything with the field polarity to create
  /// a smoother picture.
  @_s.JsonKey(name: 'telecine')
  final AvcIntraTelecine telecine;

  AvcIntraSettings({
    this.avcIntraClass,
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.interlaceMode,
    this.slowPal,
    this.telecine,
  });
  factory AvcIntraSettings.fromJson(Map<String, dynamic> json) =>
      _$AvcIntraSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AvcIntraSettingsToJson(this);
}

/// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
/// second (fps). Enable slow PAL to create a 25 fps output. When you enable
/// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
/// your audio to keep it synchronized with the video. Note that enabling this
/// setting will slightly reduce the duration of your video. Required settings:
/// You must also set Framerate to 25. In your JSON job specification, set
/// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
/// (framerateDenominator) to 1.
enum AvcIntraSlowPal {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// When you do frame rate conversion from 23.976 frames per second (fps) to
/// 29.97 fps, and your output scan type is interlaced, you can optionally
/// enable hard telecine (HARD) to create a smoother picture. When you keep the
/// default value, None (NONE), MediaConvert does a standard frame rate
/// conversion to 29.97 without doing anything with the field polarity to create
/// a smoother picture.
enum AvcIntraTelecine {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('HARD')
  hard,
}

/// The tag type that AWS Billing and Cost Management will use to sort your AWS
/// Elemental MediaConvert costs on any billing report that you set up.
enum BillingTagsSource {
  @_s.JsonValue('QUEUE')
  queue,
  @_s.JsonValue('PRESET')
  preset,
  @_s.JsonValue('JOB_TEMPLATE')
  jobTemplate,
  @_s.JsonValue('JOB')
  job,
}

extension on BillingTagsSource {
  String toValue() {
    switch (this) {
      case BillingTagsSource.queue:
        return 'QUEUE';
      case BillingTagsSource.preset:
        return 'PRESET';
      case BillingTagsSource.jobTemplate:
        return 'JOB_TEMPLATE';
      case BillingTagsSource.job:
        return 'JOB';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Burn-In Destination Settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BurninDestinationSettings {
  /// If no explicit x_position or y_position is provided, setting alignment to
  /// centered will place the captions at the bottom center of the output.
  /// Similarly, setting a left alignment will align captions to the bottom left
  /// of the output. If x and y positions are given in conjunction with the
  /// alignment parameter, the font will be justified (either left or centered)
  /// relative to those coordinates. This option is not valid for source captions
  /// that are STL, 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  @_s.JsonKey(name: 'alignment')
  final BurninSubtitleAlignment alignment;

  /// Specifies the color of the rectangle behind the captions.
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'backgroundColor')
  final BurninSubtitleBackgroundColor backgroundColor;

  /// Specifies the opacity of the background rectangle. 255 is opaque; 0 is
  /// transparent. Leaving this parameter blank is equivalent to setting it to 0
  /// (transparent). All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'backgroundOpacity')
  final int backgroundOpacity;

  /// Specifies the color of the burned-in captions. This option is not valid for
  /// source captions that are STL, 608/embedded or teletext. These source
  /// settings are already pre-defined by the caption stream. All burn-in and
  /// DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontColor')
  final BurninSubtitleFontColor fontColor;

  /// Specifies the opacity of the burned-in captions. 255 is opaque; 0 is
  /// transparent.
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontOpacity')
  final int fontOpacity;

  /// Font resolution in DPI (dots per inch); default is 96 dpi.
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontResolution')
  final int fontResolution;

  /// Provide the font script, using an ISO 15924 script code, if the LanguageCode
  /// is not sufficient for determining the script type. Where LanguageCode or
  /// CustomLanguageCode is sufficient, use "AUTOMATIC" or leave unset. This is
  /// used to help determine the appropriate font for rendering burn-in captions.
  @_s.JsonKey(name: 'fontScript')
  final FontScript fontScript;

  /// A positive integer indicates the exact font size in points. Set to 0 for
  /// automatic font size selection. All burn-in and DVB-Sub font settings must
  /// match.
  @_s.JsonKey(name: 'fontSize')
  final int fontSize;

  /// Specifies font outline color. This option is not valid for source captions
  /// that are either 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  @_s.JsonKey(name: 'outlineColor')
  final BurninSubtitleOutlineColor outlineColor;

  /// Specifies font outline size in pixels. This option is not valid for source
  /// captions that are either 608/embedded or teletext. These source settings are
  /// already pre-defined by the caption stream. All burn-in and DVB-Sub font
  /// settings must match.
  @_s.JsonKey(name: 'outlineSize')
  final int outlineSize;

  /// Specifies the color of the shadow cast by the captions.
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowColor')
  final BurninSubtitleShadowColor shadowColor;

  /// Specifies the opacity of the shadow. 255 is opaque; 0 is transparent.
  /// Leaving this parameter blank is equivalent to setting it to 0 (transparent).
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowOpacity')
  final int shadowOpacity;

  /// Specifies the horizontal offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels to the left.
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowXOffset')
  final int shadowXOffset;

  /// Specifies the vertical offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels above the
  /// text. All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowYOffset')
  final int shadowYOffset;

  /// Only applies to jobs with input captions in Teletext or STL formats. Specify
  /// whether the spacing between letters in your captions is set by the captions
  /// grid or varies depending on letter width. Choose fixed grid to conform to
  /// the spacing specified in the captions file more accurately. Choose
  /// proportional to make the text easier to read if the captions are closed
  /// caption.
  @_s.JsonKey(name: 'teletextSpacing')
  final BurninSubtitleTeletextSpacing teletextSpacing;

  /// Specifies the horizontal position of the caption relative to the left side
  /// of the output in pixels. A value of 10 would result in the captions starting
  /// 10 pixels from the left of the output. If no explicit x_position is
  /// provided, the horizontal caption position will be determined by the
  /// alignment parameter. This option is not valid for source captions that are
  /// STL, 608/embedded or teletext. These source settings are already pre-defined
  /// by the caption stream. All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'xPosition')
  final int xPosition;

  /// Specifies the vertical position of the caption relative to the top of the
  /// output in pixels. A value of 10 would result in the captions starting 10
  /// pixels from the top of the output. If no explicit y_position is provided,
  /// the caption will be positioned towards the bottom of the output. This option
  /// is not valid for source captions that are STL, 608/embedded or teletext.
  /// These source settings are already pre-defined by the caption stream. All
  /// burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'yPosition')
  final int yPosition;

  BurninDestinationSettings({
    this.alignment,
    this.backgroundColor,
    this.backgroundOpacity,
    this.fontColor,
    this.fontOpacity,
    this.fontResolution,
    this.fontScript,
    this.fontSize,
    this.outlineColor,
    this.outlineSize,
    this.shadowColor,
    this.shadowOpacity,
    this.shadowXOffset,
    this.shadowYOffset,
    this.teletextSpacing,
    this.xPosition,
    this.yPosition,
  });
  factory BurninDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$BurninDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$BurninDestinationSettingsToJson(this);
}

/// If no explicit x_position or y_position is provided, setting alignment to
/// centered will place the captions at the bottom center of the output.
/// Similarly, setting a left alignment will align captions to the bottom left
/// of the output. If x and y positions are given in conjunction with the
/// alignment parameter, the font will be justified (either left or centered)
/// relative to those coordinates. This option is not valid for source captions
/// that are STL, 608/embedded or teletext. These source settings are already
/// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
/// must match.
enum BurninSubtitleAlignment {
  @_s.JsonValue('CENTERED')
  centered,
  @_s.JsonValue('LEFT')
  left,
}

/// Specifies the color of the rectangle behind the captions.
/// All burn-in and DVB-Sub font settings must match.
enum BurninSubtitleBackgroundColor {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('WHITE')
  white,
}

/// Specifies the color of the burned-in captions. This option is not valid for
/// source captions that are STL, 608/embedded or teletext. These source
/// settings are already pre-defined by the caption stream. All burn-in and
/// DVB-Sub font settings must match.
enum BurninSubtitleFontColor {
  @_s.JsonValue('WHITE')
  white,
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('YELLOW')
  yellow,
  @_s.JsonValue('RED')
  red,
  @_s.JsonValue('GREEN')
  green,
  @_s.JsonValue('BLUE')
  blue,
}

/// Specifies font outline color. This option is not valid for source captions
/// that are either 608/embedded or teletext. These source settings are already
/// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
/// must match.
enum BurninSubtitleOutlineColor {
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('WHITE')
  white,
  @_s.JsonValue('YELLOW')
  yellow,
  @_s.JsonValue('RED')
  red,
  @_s.JsonValue('GREEN')
  green,
  @_s.JsonValue('BLUE')
  blue,
}

/// Specifies the color of the shadow cast by the captions.
/// All burn-in and DVB-Sub font settings must match.
enum BurninSubtitleShadowColor {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('WHITE')
  white,
}

/// Only applies to jobs with input captions in Teletext or STL formats. Specify
/// whether the spacing between letters in your captions is set by the captions
/// grid or varies depending on letter width. Choose fixed grid to conform to
/// the spacing specified in the captions file more accurately. Choose
/// proportional to make the text easier to read if the captions are closed
/// caption.
enum BurninSubtitleTeletextSpacing {
  @_s.JsonValue('FIXED_GRID')
  fixedGrid,
  @_s.JsonValue('PROPORTIONAL')
  proportional,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelJobResponse {
  CancelJobResponse();
  factory CancelJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelJobResponseFromJson(json);
}

/// Description of Caption output
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionDescription {
  /// Specifies which "Caption Selector":#inputs-caption_selector to use from each
  /// input when generating captions. The name should be of the format "Caption
  /// Selector <N>", which denotes that the Nth Caption Selector will be used from
  /// each input.
  @_s.JsonKey(name: 'captionSelectorName')
  final String captionSelectorName;

  /// Specify the language for this captions output track. For most captions
  /// output formats, the encoder puts this language information in the output
  /// captions metadata. If your output captions format is DVB-Sub or Burn in, the
  /// encoder uses this language information when automatically selecting the font
  /// script for rendering the captions text. For all outputs, you can use an ISO
  /// 639-2 or ISO 639-3 code. For streaming outputs, you can also use any other
  /// code in the full RFC-5646 specification. Streaming outputs are those that
  /// are in one of the following output groups: CMAF, DASH ISO, Apple HLS, or
  /// Microsoft Smooth Streaming.
  @_s.JsonKey(name: 'customLanguageCode')
  final String customLanguageCode;

  /// Specific settings required by destination type. Note that
  /// burnin_destination_settings are not available if the source of the caption
  /// data is Embedded or Teletext.
  @_s.JsonKey(name: 'destinationSettings')
  final CaptionDestinationSettings destinationSettings;

  /// Specify the language of this captions output track. For most captions output
  /// formats, the encoder puts this language information in the output captions
  /// metadata. If your output captions format is DVB-Sub or Burn in, the encoder
  /// uses this language information to choose the font language for rendering the
  /// captions text.
  @_s.JsonKey(name: 'languageCode')
  final LanguageCode languageCode;

  /// Specify a label for this set of output captions. For example, "English",
  /// "Director commentary", or "track_2". For streaming outputs, MediaConvert
  /// passes this information into destination manifests for display on the
  /// end-viewer's player device. For outputs in other output groups, the service
  /// ignores this setting.
  @_s.JsonKey(name: 'languageDescription')
  final String languageDescription;

  CaptionDescription({
    this.captionSelectorName,
    this.customLanguageCode,
    this.destinationSettings,
    this.languageCode,
    this.languageDescription,
  });
  factory CaptionDescription.fromJson(Map<String, dynamic> json) =>
      _$CaptionDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionDescriptionToJson(this);
}

/// Caption Description for preset
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionDescriptionPreset {
  /// Specify the language for this captions output track. For most captions
  /// output formats, the encoder puts this language information in the output
  /// captions metadata. If your output captions format is DVB-Sub or Burn in, the
  /// encoder uses this language information when automatically selecting the font
  /// script for rendering the captions text. For all outputs, you can use an ISO
  /// 639-2 or ISO 639-3 code. For streaming outputs, you can also use any other
  /// code in the full RFC-5646 specification. Streaming outputs are those that
  /// are in one of the following output groups: CMAF, DASH ISO, Apple HLS, or
  /// Microsoft Smooth Streaming.
  @_s.JsonKey(name: 'customLanguageCode')
  final String customLanguageCode;

  /// Specific settings required by destination type. Note that
  /// burnin_destination_settings are not available if the source of the caption
  /// data is Embedded or Teletext.
  @_s.JsonKey(name: 'destinationSettings')
  final CaptionDestinationSettings destinationSettings;

  /// Specify the language of this captions output track. For most captions output
  /// formats, the encoder puts this language information in the output captions
  /// metadata. If your output captions format is DVB-Sub or Burn in, the encoder
  /// uses this language information to choose the font language for rendering the
  /// captions text.
  @_s.JsonKey(name: 'languageCode')
  final LanguageCode languageCode;

  /// Specify a label for this set of output captions. For example, "English",
  /// "Director commentary", or "track_2". For streaming outputs, MediaConvert
  /// passes this information into destination manifests for display on the
  /// end-viewer's player device. For outputs in other output groups, the service
  /// ignores this setting.
  @_s.JsonKey(name: 'languageDescription')
  final String languageDescription;

  CaptionDescriptionPreset({
    this.customLanguageCode,
    this.destinationSettings,
    this.languageCode,
    this.languageDescription,
  });
  factory CaptionDescriptionPreset.fromJson(Map<String, dynamic> json) =>
      _$CaptionDescriptionPresetFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionDescriptionPresetToJson(this);
}

/// Specific settings required by destination type. Note that
/// burnin_destination_settings are not available if the source of the caption
/// data is Embedded or Teletext.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionDestinationSettings {
  /// Burn-In Destination Settings.
  @_s.JsonKey(name: 'burninDestinationSettings')
  final BurninDestinationSettings burninDestinationSettings;

  /// Specify the format for this set of captions on this output. The default
  /// format is embedded without SCTE-20. Other options are embedded with SCTE-20,
  /// burn-in, DVB-sub, IMSC, SCC, SRT, teletext, TTML, and web-VTT. If you are
  /// using SCTE-20, choose SCTE-20 plus embedded (SCTE20_PLUS_EMBEDDED) to create
  /// an output that complies with the SCTE-43 spec. To create a non-compliant
  /// output where the embedded captions come first, choose Embedded plus SCTE-20
  /// (EMBEDDED_PLUS_SCTE20).
  @_s.JsonKey(name: 'destinationType')
  final CaptionDestinationType destinationType;

  /// DVB-Sub Destination Settings
  @_s.JsonKey(name: 'dvbSubDestinationSettings')
  final DvbSubDestinationSettings dvbSubDestinationSettings;

  /// Settings specific to embedded/ancillary caption outputs, including 608/708
  /// Channel destination number.
  @_s.JsonKey(name: 'embeddedDestinationSettings')
  final EmbeddedDestinationSettings embeddedDestinationSettings;

  /// Settings specific to IMSC caption outputs.
  @_s.JsonKey(name: 'imscDestinationSettings')
  final ImscDestinationSettings imscDestinationSettings;

  /// Settings for SCC caption output.
  @_s.JsonKey(name: 'sccDestinationSettings')
  final SccDestinationSettings sccDestinationSettings;

  /// Settings for Teletext caption output
  @_s.JsonKey(name: 'teletextDestinationSettings')
  final TeletextDestinationSettings teletextDestinationSettings;

  /// Settings specific to TTML caption outputs, including Pass style information
  /// (TtmlStylePassthrough).
  @_s.JsonKey(name: 'ttmlDestinationSettings')
  final TtmlDestinationSettings ttmlDestinationSettings;

  CaptionDestinationSettings({
    this.burninDestinationSettings,
    this.destinationType,
    this.dvbSubDestinationSettings,
    this.embeddedDestinationSettings,
    this.imscDestinationSettings,
    this.sccDestinationSettings,
    this.teletextDestinationSettings,
    this.ttmlDestinationSettings,
  });
  factory CaptionDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$CaptionDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionDestinationSettingsToJson(this);
}

/// Specify the format for this set of captions on this output. The default
/// format is embedded without SCTE-20. Other options are embedded with SCTE-20,
/// burn-in, DVB-sub, IMSC, SCC, SRT, teletext, TTML, and web-VTT. If you are
/// using SCTE-20, choose SCTE-20 plus embedded (SCTE20_PLUS_EMBEDDED) to create
/// an output that complies with the SCTE-43 spec. To create a non-compliant
/// output where the embedded captions come first, choose Embedded plus SCTE-20
/// (EMBEDDED_PLUS_SCTE20).
enum CaptionDestinationType {
  @_s.JsonValue('BURN_IN')
  burnIn,
  @_s.JsonValue('DVB_SUB')
  dvbSub,
  @_s.JsonValue('EMBEDDED')
  embedded,
  @_s.JsonValue('EMBEDDED_PLUS_SCTE20')
  embeddedPlusScte20,
  @_s.JsonValue('IMSC')
  imsc,
  @_s.JsonValue('SCTE20_PLUS_EMBEDDED')
  scte20PlusEmbedded,
  @_s.JsonValue('SCC')
  scc,
  @_s.JsonValue('SRT')
  srt,
  @_s.JsonValue('SMI')
  smi,
  @_s.JsonValue('TELETEXT')
  teletext,
  @_s.JsonValue('TTML')
  ttml,
  @_s.JsonValue('WEBVTT')
  webvtt,
}

/// Set up captions in your outputs by first selecting them from your input
/// here.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionSelector {
  /// The specific language to extract from source, using the ISO 639-2 or ISO
  /// 639-3 three-letter language code. If input is SCTE-27, complete this field
  /// and/or PID to select the caption language to extract. If input is DVB-Sub
  /// and output is Burn-in or SMPTE-TT, complete this field and/or PID to select
  /// the caption language to extract. If input is DVB-Sub that is being passed
  /// through, omit this field (and PID field); there is no way to extract a
  /// specific language with pass-through captions.
  @_s.JsonKey(name: 'customLanguageCode')
  final String customLanguageCode;

  /// The specific language to extract from source. If input is SCTE-27, complete
  /// this field and/or PID to select the caption language to extract. If input is
  /// DVB-Sub and output is Burn-in or SMPTE-TT, complete this field and/or PID to
  /// select the caption language to extract. If input is DVB-Sub that is being
  /// passed through, omit this field (and PID field); there is no way to extract
  /// a specific language with pass-through captions.
  @_s.JsonKey(name: 'languageCode')
  final LanguageCode languageCode;

  /// If your input captions are SCC, TTML, STL, SMI, SRT, or IMSC in an xml file,
  /// specify the URI of the input captions source file. If your input captions
  /// are IMSC in an IMF package, use TrackSourceSettings instead of
  /// FileSoureSettings.
  @_s.JsonKey(name: 'sourceSettings')
  final CaptionSourceSettings sourceSettings;

  CaptionSelector({
    this.customLanguageCode,
    this.languageCode,
    this.sourceSettings,
  });
  factory CaptionSelector.fromJson(Map<String, dynamic> json) =>
      _$CaptionSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionSelectorToJson(this);
}

/// Ignore this setting unless your input captions format is SCC. To have the
/// service compensate for differing frame rates between your input captions and
/// input video, specify the frame rate of the captions file. Specify this value
/// as a fraction, using the settings Framerate numerator (framerateNumerator)
/// and Framerate denominator (framerateDenominator). For example, you might
/// specify 24 / 1 for 24 fps, 25 / 1 for 25 fps, 24000 / 1001 for 23.976 fps,
/// or 30000 / 1001 for 29.97 fps.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionSourceFramerate {
  /// Specify the denominator of the fraction that represents the frame rate for
  /// the setting Caption source frame rate (CaptionSourceFramerate). Use this
  /// setting along with the setting Framerate numerator (framerateNumerator).
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// Specify the numerator of the fraction that represents the frame rate for the
  /// setting Caption source frame rate (CaptionSourceFramerate). Use this setting
  /// along with the setting Framerate denominator (framerateDenominator).
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  CaptionSourceFramerate({
    this.framerateDenominator,
    this.framerateNumerator,
  });
  factory CaptionSourceFramerate.fromJson(Map<String, dynamic> json) =>
      _$CaptionSourceFramerateFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionSourceFramerateToJson(this);
}

/// If your input captions are SCC, TTML, STL, SMI, SRT, or IMSC in an xml file,
/// specify the URI of the input captions source file. If your input captions
/// are IMSC in an IMF package, use TrackSourceSettings instead of
/// FileSoureSettings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionSourceSettings {
  /// Settings for ancillary captions source.
  @_s.JsonKey(name: 'ancillarySourceSettings')
  final AncillarySourceSettings ancillarySourceSettings;

  /// DVB Sub Source Settings
  @_s.JsonKey(name: 'dvbSubSourceSettings')
  final DvbSubSourceSettings dvbSubSourceSettings;

  /// Settings for embedded captions Source
  @_s.JsonKey(name: 'embeddedSourceSettings')
  final EmbeddedSourceSettings embeddedSourceSettings;

  /// If your input captions are SCC, SMI, SRT, STL, TTML, or IMSC 1.1 in an xml
  /// file, specify the URI of the input caption source file. If your caption
  /// source is IMSC in an IMF package, use TrackSourceSettings instead of
  /// FileSoureSettings.
  @_s.JsonKey(name: 'fileSourceSettings')
  final FileSourceSettings fileSourceSettings;

  /// Use Source (SourceType) to identify the format of your input captions.  The
  /// service cannot auto-detect caption format.
  @_s.JsonKey(name: 'sourceType')
  final CaptionSourceType sourceType;

  /// Settings specific to Teletext caption sources, including Page number.
  @_s.JsonKey(name: 'teletextSourceSettings')
  final TeletextSourceSettings teletextSourceSettings;

  /// Settings specific to caption sources that are specified by track number.
  /// Currently, this is only IMSC captions in an IMF package. If your caption
  /// source is IMSC 1.1 in a separate xml file, use FileSourceSettings instead of
  /// TrackSourceSettings.
  @_s.JsonKey(name: 'trackSourceSettings')
  final TrackSourceSettings trackSourceSettings;

  CaptionSourceSettings({
    this.ancillarySourceSettings,
    this.dvbSubSourceSettings,
    this.embeddedSourceSettings,
    this.fileSourceSettings,
    this.sourceType,
    this.teletextSourceSettings,
    this.trackSourceSettings,
  });
  factory CaptionSourceSettings.fromJson(Map<String, dynamic> json) =>
      _$CaptionSourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionSourceSettingsToJson(this);
}

/// Use Source (SourceType) to identify the format of your input captions.  The
/// service cannot auto-detect caption format.
enum CaptionSourceType {
  @_s.JsonValue('ANCILLARY')
  ancillary,
  @_s.JsonValue('DVB_SUB')
  dvbSub,
  @_s.JsonValue('EMBEDDED')
  embedded,
  @_s.JsonValue('SCTE20')
  scte20,
  @_s.JsonValue('SCC')
  scc,
  @_s.JsonValue('TTML')
  ttml,
  @_s.JsonValue('STL')
  stl,
  @_s.JsonValue('SRT')
  srt,
  @_s.JsonValue('SMI')
  smi,
  @_s.JsonValue('TELETEXT')
  teletext,
  @_s.JsonValue('NULL_SOURCE')
  nullSource,
  @_s.JsonValue('IMSC')
  imsc,
}

/// Channel mapping (ChannelMapping) contains the group of fields that hold the
/// remixing value for each channel. Units are in dB. Acceptable values are
/// within the range from -60 (mute) through 6. A setting of 0 passes the input
/// channel unchanged to the output channel (no attenuation or amplification).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ChannelMapping {
  /// List of output channels
  @_s.JsonKey(name: 'outputChannels')
  final List<OutputChannelMapping> outputChannels;

  ChannelMapping({
    this.outputChannels,
  });
  factory ChannelMapping.fromJson(Map<String, dynamic> json) =>
      _$ChannelMappingFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelMappingToJson(this);
}

/// Specify the details for each pair of HLS and DASH additional manifests that
/// you want the service to generate for this CMAF output group. Each pair of
/// manifests can reference a different subset of outputs in the group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CmafAdditionalManifest {
  /// Specify a name modifier that the service adds to the name of this manifest
  /// to make it different from the file names of the other main manifests in the
  /// output group. For example, say that the default main manifest for your HLS
  /// group is film-name.m3u8. If you enter "-no-premium" for this setting, then
  /// the file name the service generates for this top-level manifest is
  /// film-name-no-premium.m3u8. For HLS output groups, specify a
  /// manifestNameModifier that is different from the nameModifier of the output.
  /// The service uses the output name modifier to create unique names for the
  /// individual variant manifests.
  @_s.JsonKey(name: 'manifestNameModifier')
  final String manifestNameModifier;

  /// Specify the outputs that you want this additional top-level manifest to
  /// reference.
  @_s.JsonKey(name: 'selectedOutputs')
  final List<String> selectedOutputs;

  CmafAdditionalManifest({
    this.manifestNameModifier,
    this.selectedOutputs,
  });
  factory CmafAdditionalManifest.fromJson(Map<String, dynamic> json) =>
      _$CmafAdditionalManifestFromJson(json);

  Map<String, dynamic> toJson() => _$CmafAdditionalManifestToJson(this);
}

/// Disable this setting only when your workflow requires the
/// #EXT-X-ALLOW-CACHE:no tag. Otherwise, keep the default value Enabled
/// (ENABLED) and control caching in your video distribution set up. For
/// example, use the Cache-Control http header.
enum CmafClientCache {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist
/// generation.
enum CmafCodecSpecification {
  @_s.JsonValue('RFC_6381')
  rfc_6381,
  @_s.JsonValue('RFC_4281')
  rfc_4281,
}

/// Settings for CMAF encryption
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CmafEncryptionSettings {
  /// This is a 128-bit, 16-byte hex value represented by a 32-character text
  /// string. If this parameter is not set then the Initialization Vector will
  /// follow the segment number by default.
  @_s.JsonKey(name: 'constantInitializationVector')
  final String constantInitializationVector;

  /// Specify the encryption scheme that you want the service to use when
  /// encrypting your CMAF segments. Choose AES-CBC subsample (SAMPLE-AES) or
  /// AES_CTR (AES-CTR).
  @_s.JsonKey(name: 'encryptionMethod')
  final CmafEncryptionType encryptionMethod;

  /// When you use DRM with CMAF outputs, choose whether the service writes the
  /// 128-bit encryption initialization vector in the HLS and DASH manifests.
  @_s.JsonKey(name: 'initializationVectorInManifest')
  final CmafInitializationVectorInManifest initializationVectorInManifest;

  /// If your output group type is CMAF, use these settings when doing DRM
  /// encryption with a SPEKE-compliant key provider. If your output group type is
  /// HLS, DASH, or Microsoft Smooth, use the SpekeKeyProvider settings instead.
  @_s.JsonKey(name: 'spekeKeyProvider')
  final SpekeKeyProviderCmaf spekeKeyProvider;

  /// Use these settings to set up encryption with a static key provider.
  @_s.JsonKey(name: 'staticKeyProvider')
  final StaticKeyProvider staticKeyProvider;

  /// Specify whether your DRM encryption key is static or from a key provider
  /// that follows the SPEKE standard. For more information about SPEKE, see
  /// https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
  @_s.JsonKey(name: 'type')
  final CmafKeyProviderType type;

  CmafEncryptionSettings({
    this.constantInitializationVector,
    this.encryptionMethod,
    this.initializationVectorInManifest,
    this.spekeKeyProvider,
    this.staticKeyProvider,
    this.type,
  });
  factory CmafEncryptionSettings.fromJson(Map<String, dynamic> json) =>
      _$CmafEncryptionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$CmafEncryptionSettingsToJson(this);
}

/// Specify the encryption scheme that you want the service to use when
/// encrypting your CMAF segments. Choose AES-CBC subsample (SAMPLE-AES) or
/// AES_CTR (AES-CTR).
enum CmafEncryptionType {
  @_s.JsonValue('SAMPLE_AES')
  sampleAes,
  @_s.JsonValue('AES_CTR')
  aesCtr,
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// CMAF_GROUP_SETTINGS. Each output in a CMAF Output Group may only contain a
/// single video, audio, or caption output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CmafGroupSettings {
  /// By default, the service creates one top-level .m3u8 HLS manifest and one top
  /// -level .mpd DASH manifest for each CMAF output group in your job. These
  /// default manifests reference every output in the output group. To create
  /// additional top-level manifests that reference a subset of the outputs in the
  /// output group, specify a list of them here. For each additional manifest that
  /// you specify, the service creates one HLS manifest and one DASH manifest.
  @_s.JsonKey(name: 'additionalManifests')
  final List<CmafAdditionalManifest> additionalManifests;

  /// A partial URI prefix that will be put in the manifest file at the top level
  /// BaseURL element. Can be used if streams are delivered from a different URL
  /// than the manifest file.
  @_s.JsonKey(name: 'baseUrl')
  final String baseUrl;

  /// Disable this setting only when your workflow requires the
  /// #EXT-X-ALLOW-CACHE:no tag. Otherwise, keep the default value Enabled
  /// (ENABLED) and control caching in your video distribution set up. For
  /// example, use the Cache-Control http header.
  @_s.JsonKey(name: 'clientCache')
  final CmafClientCache clientCache;

  /// Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist
  /// generation.
  @_s.JsonKey(name: 'codecSpecification')
  final CmafCodecSpecification codecSpecification;

  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do not
  /// specify the base filename in the URI, the service will use the filename of
  /// the input file. If your job has multiple inputs, the service uses the
  /// filename of the first input file.
  @_s.JsonKey(name: 'destination')
  final String destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  @_s.JsonKey(name: 'destinationSettings')
  final DestinationSettings destinationSettings;

  /// DRM settings.
  @_s.JsonKey(name: 'encryption')
  final CmafEncryptionSettings encryption;

  /// Length of fragments to generate (in seconds). Fragment length must be
  /// compatible with GOP size and Framerate. Note that fragments will end on the
  /// next keyframe after this number of seconds, so actual fragment length may be
  /// longer. When Emit Single File is checked, the fragmentation is internal to a
  /// single output file and it does not cause the creation of many output files
  /// as in other output types.
  @_s.JsonKey(name: 'fragmentLength')
  final int fragmentLength;

  /// When set to GZIP, compresses HLS playlist.
  @_s.JsonKey(name: 'manifestCompression')
  final CmafManifestCompression manifestCompression;

  /// Indicates whether the output manifest should use floating point values for
  /// segment duration.
  @_s.JsonKey(name: 'manifestDurationFormat')
  final CmafManifestDurationFormat manifestDurationFormat;

  /// Minimum time of initially buffered media that is needed to ensure smooth
  /// playout.
  @_s.JsonKey(name: 'minBufferTime')
  final int minBufferTime;

  /// Keep this setting at the default value of 0, unless you are troubleshooting
  /// a problem with how devices play back the end of your video asset. If you
  /// know that player devices are hanging on the final segment of your video
  /// because the length of your final segment is too short, use this setting to
  /// specify a minimum final segment length, in seconds. Choose a value that is
  /// greater than or equal to 1 and less than your segment length. When you
  /// specify a value for this setting, the encoder will combine any final segment
  /// that is shorter than the length that you specify with the previous segment.
  /// For example, your segment length is 3 seconds and your final segment is .5
  /// seconds without a minimum final segment length; when you set the minimum
  /// final segment length to 1, your final segment is 3.5 seconds.
  @_s.JsonKey(name: 'minFinalSegmentLength')
  final double minFinalSegmentLength;

  /// Specify whether your DASH profile is on-demand or main. When you choose Main
  /// profile (MAIN_PROFILE), the service signals
  /// urn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you
  /// choose On-demand (ON_DEMAND_PROFILE), the service signals
  /// urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose
  /// On-demand, you must also set the output group setting Segment control
  /// (SegmentControl) to Single file (SINGLE_FILE).
  @_s.JsonKey(name: 'mpdProfile')
  final CmafMpdProfile mpdProfile;

  /// When set to SINGLE_FILE, a single output file is generated, which is
  /// internally segmented using the Fragment Length and Segment Length. When set
  /// to SEGMENTED_FILES, separate segment files will be created.
  @_s.JsonKey(name: 'segmentControl')
  final CmafSegmentControl segmentControl;

  /// Use this setting to specify the length, in seconds, of each individual CMAF
  /// segment. This value applies to the whole package; that is, to every output
  /// in the output group. Note that segments end on the first keyframe after this
  /// number of seconds, so the actual segment length might be slightly longer. If
  /// you set Segment control (CmafSegmentControl) to single file, the service
  /// puts the content of each output in a single file that has metadata that
  /// marks these segments. If you set it to segmented files, the service creates
  /// multiple files for each output, each with the content of one segment.
  @_s.JsonKey(name: 'segmentLength')
  final int segmentLength;

  /// Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of
  /// variant manifest.
  @_s.JsonKey(name: 'streamInfResolution')
  final CmafStreamInfResolution streamInfResolution;

  /// When set to ENABLED, a DASH MPD manifest will be generated for this output.
  @_s.JsonKey(name: 'writeDashManifest')
  final CmafWriteDASHManifest writeDashManifest;

  /// When set to ENABLED, an Apple HLS manifest will be generated for this
  /// output.
  @_s.JsonKey(name: 'writeHlsManifest')
  final CmafWriteHLSManifest writeHlsManifest;

  /// When you enable Precise segment duration in DASH manifests
  /// (writeSegmentTimelineInRepresentation), your DASH manifest shows precise
  /// segment durations. The segment duration information appears inside the
  /// SegmentTimeline element, inside SegmentTemplate at the Representation level.
  /// When this feature isn't enabled, the segment durations in your DASH manifest
  /// are approximate. The segment duration information appears in the duration
  /// attribute of the SegmentTemplate element.
  @_s.JsonKey(name: 'writeSegmentTimelineInRepresentation')
  final CmafWriteSegmentTimelineInRepresentation
      writeSegmentTimelineInRepresentation;

  CmafGroupSettings({
    this.additionalManifests,
    this.baseUrl,
    this.clientCache,
    this.codecSpecification,
    this.destination,
    this.destinationSettings,
    this.encryption,
    this.fragmentLength,
    this.manifestCompression,
    this.manifestDurationFormat,
    this.minBufferTime,
    this.minFinalSegmentLength,
    this.mpdProfile,
    this.segmentControl,
    this.segmentLength,
    this.streamInfResolution,
    this.writeDashManifest,
    this.writeHlsManifest,
    this.writeSegmentTimelineInRepresentation,
  });
  factory CmafGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$CmafGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$CmafGroupSettingsToJson(this);
}

/// When you use DRM with CMAF outputs, choose whether the service writes the
/// 128-bit encryption initialization vector in the HLS and DASH manifests.
enum CmafInitializationVectorInManifest {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// Specify whether your DRM encryption key is static or from a key provider
/// that follows the SPEKE standard. For more information about SPEKE, see
/// https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
enum CmafKeyProviderType {
  @_s.JsonValue('SPEKE')
  speke,
  @_s.JsonValue('STATIC_KEY')
  staticKey,
}

/// When set to GZIP, compresses HLS playlist.
enum CmafManifestCompression {
  @_s.JsonValue('GZIP')
  gzip,
  @_s.JsonValue('NONE')
  none,
}

/// Indicates whether the output manifest should use floating point values for
/// segment duration.
enum CmafManifestDurationFormat {
  @_s.JsonValue('FLOATING_POINT')
  floatingPoint,
  @_s.JsonValue('INTEGER')
  integer,
}

/// Specify whether your DASH profile is on-demand or main. When you choose Main
/// profile (MAIN_PROFILE), the service signals
/// urn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you
/// choose On-demand (ON_DEMAND_PROFILE), the service signals
/// urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose
/// On-demand, you must also set the output group setting Segment control
/// (SegmentControl) to Single file (SINGLE_FILE).
enum CmafMpdProfile {
  @_s.JsonValue('MAIN_PROFILE')
  mainProfile,
  @_s.JsonValue('ON_DEMAND_PROFILE')
  onDemandProfile,
}

/// When set to SINGLE_FILE, a single output file is generated, which is
/// internally segmented using the Fragment Length and Segment Length. When set
/// to SEGMENTED_FILES, separate segment files will be created.
enum CmafSegmentControl {
  @_s.JsonValue('SINGLE_FILE')
  singleFile,
  @_s.JsonValue('SEGMENTED_FILES')
  segmentedFiles,
}

/// Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of
/// variant manifest.
enum CmafStreamInfResolution {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// When set to ENABLED, a DASH MPD manifest will be generated for this output.
enum CmafWriteDASHManifest {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// When set to ENABLED, an Apple HLS manifest will be generated for this
/// output.
enum CmafWriteHLSManifest {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// When you enable Precise segment duration in DASH manifests
/// (writeSegmentTimelineInRepresentation), your DASH manifest shows precise
/// segment durations. The segment duration information appears inside the
/// SegmentTimeline element, inside SegmentTemplate at the Representation level.
/// When this feature isn't enabled, the segment durations in your DASH manifest
/// are approximate. The segment duration information appears in the duration
/// attribute of the SegmentTemplate element.
enum CmafWriteSegmentTimelineInRepresentation {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Specify this setting only when your output will be consumed by a downstream
/// repackaging workflow that is sensitive to very small duration differences
/// between video and audio. For this situation, choose Match video duration
/// (MATCH_VIDEO_DURATION). In all other cases, keep the default value, Default
/// codec duration (DEFAULT_CODEC_DURATION). When you choose Match video
/// duration, MediaConvert pads the output audio streams with silence or trims
/// them to ensure that the total duration of each audio stream is at least as
/// long as the total duration of the video stream. After padding or trimming,
/// the audio stream duration is no more than one frame longer than the video
/// stream. MediaConvert applies audio padding or trimming only to the end of
/// the last segment of the output. For unsegmented outputs, MediaConvert adds
/// padding only to the end of the file. When you keep the default value, any
/// minor discrepancies between audio and video duration will depend on your
/// output audio codec.
enum CmfcAudioDuration {
  @_s.JsonValue('DEFAULT_CODEC_DURATION')
  defaultCodecDuration,
  @_s.JsonValue('MATCH_VIDEO_DURATION')
  matchVideoDuration,
}

/// Use this setting only when you specify SCTE-35 markers from ESAM. Choose
/// INSERT to put SCTE-35 markers in this output at the insertion points that
/// you specify in an ESAM XML document. Provide the document in the setting SCC
/// XML (sccXml).
enum CmfcScte35Esam {
  @_s.JsonValue('INSERT')
  insert,
  @_s.JsonValue('NONE')
  none,
}

/// Ignore this setting unless you have SCTE-35 markers in your input video
/// file. Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that
/// appear in your input to also appear in this output. Choose None (NONE) if
/// you don't want those SCTE-35 markers in this output.
enum CmfcScte35Source {
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
  @_s.JsonValue('NONE')
  none,
}

/// Settings for MP4 segments in CMAF
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CmfcSettings {
  /// Specify this setting only when your output will be consumed by a downstream
  /// repackaging workflow that is sensitive to very small duration differences
  /// between video and audio. For this situation, choose Match video duration
  /// (MATCH_VIDEO_DURATION). In all other cases, keep the default value, Default
  /// codec duration (DEFAULT_CODEC_DURATION). When you choose Match video
  /// duration, MediaConvert pads the output audio streams with silence or trims
  /// them to ensure that the total duration of each audio stream is at least as
  /// long as the total duration of the video stream. After padding or trimming,
  /// the audio stream duration is no more than one frame longer than the video
  /// stream. MediaConvert applies audio padding or trimming only to the end of
  /// the last segment of the output. For unsegmented outputs, MediaConvert adds
  /// padding only to the end of the file. When you keep the default value, any
  /// minor discrepancies between audio and video duration will depend on your
  /// output audio codec.
  @_s.JsonKey(name: 'audioDuration')
  final CmfcAudioDuration audioDuration;

  /// Use this setting only when you specify SCTE-35 markers from ESAM. Choose
  /// INSERT to put SCTE-35 markers in this output at the insertion points that
  /// you specify in an ESAM XML document. Provide the document in the setting SCC
  /// XML (sccXml).
  @_s.JsonKey(name: 'scte35Esam')
  final CmfcScte35Esam scte35Esam;

  /// Ignore this setting unless you have SCTE-35 markers in your input video
  /// file. Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that
  /// appear in your input to also appear in this output. Choose None (NONE) if
  /// you don't want those SCTE-35 markers in this output.
  @_s.JsonKey(name: 'scte35Source')
  final CmfcScte35Source scte35Source;

  CmfcSettings({
    this.audioDuration,
    this.scte35Esam,
    this.scte35Source,
  });
  factory CmfcSettings.fromJson(Map<String, dynamic> json) =>
      _$CmfcSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$CmfcSettingsToJson(this);
}

/// Settings for color correction.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ColorCorrector {
  /// Brightness level.
  @_s.JsonKey(name: 'brightness')
  final int brightness;

  /// Specify the color space you want for this output. The service supports
  /// conversion between HDR formats, between SDR formats, from SDR to HDR, and
  /// from HDR to SDR. SDR to HDR conversion doesn't upgrade the dynamic range.
  /// The converted video has an HDR format, but visually appears the same as an
  /// unconverted output. HDR to SDR conversion uses Elemental tone mapping
  /// technology to approximate the outcome of manually regrading from HDR to SDR.
  @_s.JsonKey(name: 'colorSpaceConversion')
  final ColorSpaceConversion colorSpaceConversion;

  /// Contrast level.
  @_s.JsonKey(name: 'contrast')
  final int contrast;

  /// Use these settings when you convert to the HDR 10 color space. Specify the
  /// SMPTE ST 2086 Mastering Display Color Volume static metadata that you want
  /// signaled in the output. These values don't affect the pixel values that are
  /// encoded in the video stream. They are intended to help the downstream video
  /// player display content in a way that reflects the intentions of the the
  /// content creator. When you set Color space conversion (ColorSpaceConversion)
  /// to HDR 10 (FORCE_HDR10), these settings are required. You must set values
  /// for Max frame average light level (maxFrameAverageLightLevel) and Max
  /// content light level (maxContentLightLevel); these settings don't have a
  /// default value. The default values for the other HDR 10 metadata settings are
  /// defined by the P3D65 color space. For more information about MediaConvert
  /// HDR jobs, see https://docs.aws.amazon.com/console/mediaconvert/hdr.
  @_s.JsonKey(name: 'hdr10Metadata')
  final Hdr10Metadata hdr10Metadata;

  /// Hue in degrees.
  @_s.JsonKey(name: 'hue')
  final int hue;

  /// Saturation level.
  @_s.JsonKey(name: 'saturation')
  final int saturation;

  ColorCorrector({
    this.brightness,
    this.colorSpaceConversion,
    this.contrast,
    this.hdr10Metadata,
    this.hue,
    this.saturation,
  });
  factory ColorCorrector.fromJson(Map<String, dynamic> json) =>
      _$ColorCorrectorFromJson(json);

  Map<String, dynamic> toJson() => _$ColorCorrectorToJson(this);
}

/// Choose Insert (INSERT) for this setting to include color metadata in this
/// output. Choose Ignore (IGNORE) to exclude color metadata from this output.
/// If you don't specify a value, the service sets this to Insert by default.
enum ColorMetadata {
  @_s.JsonValue('IGNORE')
  ignore,
  @_s.JsonValue('INSERT')
  insert,
}

/// If your input video has accurate color space metadata, or if you don't know
/// about color space, leave this set to the default value Follow (FOLLOW). The
/// service will automatically detect your input color space. If your input
/// video has metadata indicating the wrong color space, specify the accurate
/// color space here. If your input video is HDR 10 and the SMPTE ST 2086
/// Mastering Display Color Volume static metadata isn't present in your video
/// stream, or if that metadata is present but not accurate, choose Force HDR 10
/// (FORCE_HDR10) here and specify correct values in the input HDR 10 metadata
/// (Hdr10Metadata) settings. For more information about MediaConvert HDR jobs,
/// see https://docs.aws.amazon.com/console/mediaconvert/hdr.
enum ColorSpace {
  @_s.JsonValue('FOLLOW')
  follow,
  @_s.JsonValue('REC_601')
  rec_601,
  @_s.JsonValue('REC_709')
  rec_709,
  @_s.JsonValue('HDR10')
  hdr10,
  @_s.JsonValue('HLG_2020')
  hlg_2020,
}

/// Specify the color space you want for this output. The service supports
/// conversion between HDR formats, between SDR formats, from SDR to HDR, and
/// from HDR to SDR. SDR to HDR conversion doesn't upgrade the dynamic range.
/// The converted video has an HDR format, but visually appears the same as an
/// unconverted output. HDR to SDR conversion uses Elemental tone mapping
/// technology to approximate the outcome of manually regrading from HDR to SDR.
enum ColorSpaceConversion {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('FORCE_601')
  force_601,
  @_s.JsonValue('FORCE_709')
  force_709,
  @_s.JsonValue('FORCE_HDR10')
  forceHdr10,
  @_s.JsonValue('FORCE_HLG_2020')
  forceHlg_2020,
}

/// There are two sources for color metadata, the input file and the job input
/// settings Color space (ColorSpace) and HDR master display information
/// settings(Hdr10Metadata). The Color space usage setting determines which
/// takes precedence. Choose Force (FORCE) to use color metadata from the input
/// job settings. If you don't specify values for those settings, the service
/// defaults to using metadata from your input. FALLBACK - Choose Fallback
/// (FALLBACK) to use color metadata from the source when it is present. If
/// there's no color metadata in your input file, the service defaults to using
/// values you specify in the input settings.
enum ColorSpaceUsage {
  @_s.JsonValue('FORCE')
  force,
  @_s.JsonValue('FALLBACK')
  fallback,
}

/// The length of the term of your reserved queue pricing plan commitment.
enum Commitment {
  @_s.JsonValue('ONE_YEAR')
  oneYear,
}

/// Container specific settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContainerSettings {
  /// Settings for MP4 segments in CMAF
  @_s.JsonKey(name: 'cmfcSettings')
  final CmfcSettings cmfcSettings;

  /// Container for this output. Some containers require a container settings
  /// object. If not specified, the default object will be created.
  @_s.JsonKey(name: 'container')
  final ContainerType container;

  /// Settings for F4v container
  @_s.JsonKey(name: 'f4vSettings')
  final F4vSettings f4vSettings;

  /// MPEG-2 TS container settings. These apply to outputs in a File output group
  /// when the output's container (ContainerType) is MPEG-2 Transport Stream
  /// (M2TS). In these assets, data is organized by the program map table (PMT).
  /// Each transport stream program contains subsets of data, including audio,
  /// video, and metadata. Each of these subsets of data has a numerical label
  /// called a packet identifier (PID). Each transport stream program corresponds
  /// to one MediaConvert output. The PMT lists the types of data in a program
  /// along with their PID. Downstream systems and players use the program map
  /// table to look up the PID for each type of data it accesses and then uses the
  /// PIDs to locate specific data within the asset.
  @_s.JsonKey(name: 'm2tsSettings')
  final M2tsSettings m2tsSettings;

  /// Settings for TS segments in HLS
  @_s.JsonKey(name: 'm3u8Settings')
  final M3u8Settings m3u8Settings;

  /// Settings for MOV Container.
  @_s.JsonKey(name: 'movSettings')
  final MovSettings movSettings;

  /// Settings for MP4 container. You can create audio-only AAC outputs with this
  /// container.
  @_s.JsonKey(name: 'mp4Settings')
  final Mp4Settings mp4Settings;

  /// Settings for MP4 segments in DASH
  @_s.JsonKey(name: 'mpdSettings')
  final MpdSettings mpdSettings;

  /// MXF settings
  @_s.JsonKey(name: 'mxfSettings')
  final MxfSettings mxfSettings;

  ContainerSettings({
    this.cmfcSettings,
    this.container,
    this.f4vSettings,
    this.m2tsSettings,
    this.m3u8Settings,
    this.movSettings,
    this.mp4Settings,
    this.mpdSettings,
    this.mxfSettings,
  });
  factory ContainerSettings.fromJson(Map<String, dynamic> json) =>
      _$ContainerSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerSettingsToJson(this);
}

/// Container for this output. Some containers require a container settings
/// object. If not specified, the default object will be created.
enum ContainerType {
  @_s.JsonValue('F4V')
  f4v,
  @_s.JsonValue('ISMV')
  ismv,
  @_s.JsonValue('M2TS')
  m2ts,
  @_s.JsonValue('M3U8')
  m3u8,
  @_s.JsonValue('CMFC')
  cmfc,
  @_s.JsonValue('MOV')
  mov,
  @_s.JsonValue('MP4')
  mp4,
  @_s.JsonValue('MPD')
  mpd,
  @_s.JsonValue('MXF')
  mxf,
  @_s.JsonValue('WEBM')
  webm,
  @_s.JsonValue('RAW')
  raw,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateJobResponse {
  /// Each job converts an input file into an output file or files. For more
  /// information, see the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  @_s.JsonKey(name: 'job')
  final Job job;

  CreateJobResponse({
    this.job,
  });
  factory CreateJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateJobTemplateResponse {
  /// A job template is a pre-made set of encoding instructions that you can use
  /// to quickly create a job.
  @_s.JsonKey(name: 'jobTemplate')
  final JobTemplate jobTemplate;

  CreateJobTemplateResponse({
    this.jobTemplate,
  });
  factory CreateJobTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateJobTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePresetResponse {
  /// A preset is a collection of preconfigured media conversion settings that you
  /// want MediaConvert to apply to the output during the conversion process.
  @_s.JsonKey(name: 'preset')
  final Preset preset;

  CreatePresetResponse({
    this.preset,
  });
  factory CreatePresetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePresetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateQueueResponse {
  /// You can use queues to manage the resources that are available to your AWS
  /// account for running multiple transcoding jobs at the same time. If you don't
  /// specify a queue, the service sends all jobs through the default queue. For
  /// more information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
  @_s.JsonKey(name: 'queue')
  final Queue queue;

  CreateQueueResponse({
    this.queue,
  });
  factory CreateQueueResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateQueueResponseFromJson(json);
}

/// Specify the details for each additional DASH manifest that you want the
/// service to generate for this output group. Each manifest can reference a
/// different subset of outputs in the group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DashAdditionalManifest {
  /// Specify a name modifier that the service adds to the name of this manifest
  /// to make it different from the file names of the other main manifests in the
  /// output group. For example, say that the default main manifest for your DASH
  /// group is film-name.mpd. If you enter "-no-premium" for this setting, then
  /// the file name the service generates for this top-level manifest is
  /// film-name-no-premium.mpd.
  @_s.JsonKey(name: 'manifestNameModifier')
  final String manifestNameModifier;

  /// Specify the outputs that you want this additional top-level manifest to
  /// reference.
  @_s.JsonKey(name: 'selectedOutputs')
  final List<String> selectedOutputs;

  DashAdditionalManifest({
    this.manifestNameModifier,
    this.selectedOutputs,
  });
  factory DashAdditionalManifest.fromJson(Map<String, dynamic> json) =>
      _$DashAdditionalManifestFromJson(json);

  Map<String, dynamic> toJson() => _$DashAdditionalManifestToJson(this);
}

/// Specifies DRM settings for DASH outputs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DashIsoEncryptionSettings {
  /// This setting can improve the compatibility of your output with video players
  /// on obsolete devices. It applies only to DASH H.264 outputs with DRM
  /// encryption. Choose Unencrypted SEI (UNENCRYPTED_SEI) only to correct
  /// problems with playback on older devices. Otherwise, keep the default setting
  /// CENC v1 (CENC_V1). If you choose Unencrypted SEI, for that output, the
  /// service will exclude the access unit delimiter and will leave the SEI NAL
  /// units unencrypted.
  @_s.JsonKey(name: 'playbackDeviceCompatibility')
  final DashIsoPlaybackDeviceCompatibility playbackDeviceCompatibility;

  /// If your output group type is HLS, DASH, or Microsoft Smooth, use these
  /// settings when doing DRM encryption with a SPEKE-compliant key provider.  If
  /// your output group type is CMAF, use the SpekeKeyProviderCmaf settings
  /// instead.
  @_s.JsonKey(name: 'spekeKeyProvider')
  final SpekeKeyProvider spekeKeyProvider;

  DashIsoEncryptionSettings({
    this.playbackDeviceCompatibility,
    this.spekeKeyProvider,
  });
  factory DashIsoEncryptionSettings.fromJson(Map<String, dynamic> json) =>
      _$DashIsoEncryptionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DashIsoEncryptionSettingsToJson(this);
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// DASH_ISO_GROUP_SETTINGS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DashIsoGroupSettings {
  /// By default, the service creates one .mpd DASH manifest for each DASH ISO
  /// output group in your job. This default manifest references every output in
  /// the output group. To create additional DASH manifests that reference a
  /// subset of the outputs in the output group, specify a list of them here.
  @_s.JsonKey(name: 'additionalManifests')
  final List<DashAdditionalManifest> additionalManifests;

  /// A partial URI prefix that will be put in the manifest (.mpd) file at the top
  /// level BaseURL element. Can be used if streams are delivered from a different
  /// URL than the manifest file.
  @_s.JsonKey(name: 'baseUrl')
  final String baseUrl;

  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do not
  /// specify the base filename in the URI, the service will use the filename of
  /// the input file. If your job has multiple inputs, the service uses the
  /// filename of the first input file.
  @_s.JsonKey(name: 'destination')
  final String destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  @_s.JsonKey(name: 'destinationSettings')
  final DestinationSettings destinationSettings;

  /// DRM settings.
  @_s.JsonKey(name: 'encryption')
  final DashIsoEncryptionSettings encryption;

  /// Length of fragments to generate (in seconds). Fragment length must be
  /// compatible with GOP size and Framerate. Note that fragments will end on the
  /// next keyframe after this number of seconds, so actual fragment length may be
  /// longer. When Emit Single File is checked, the fragmentation is internal to a
  /// single output file and it does not cause the creation of many output files
  /// as in other output types.
  @_s.JsonKey(name: 'fragmentLength')
  final int fragmentLength;

  /// Supports HbbTV specification as indicated
  @_s.JsonKey(name: 'hbbtvCompliance')
  final DashIsoHbbtvCompliance hbbtvCompliance;

  /// Minimum time of initially buffered media that is needed to ensure smooth
  /// playout.
  @_s.JsonKey(name: 'minBufferTime')
  final int minBufferTime;

  /// Keep this setting at the default value of 0, unless you are troubleshooting
  /// a problem with how devices play back the end of your video asset. If you
  /// know that player devices are hanging on the final segment of your video
  /// because the length of your final segment is too short, use this setting to
  /// specify a minimum final segment length, in seconds. Choose a value that is
  /// greater than or equal to 1 and less than your segment length. When you
  /// specify a value for this setting, the encoder will combine any final segment
  /// that is shorter than the length that you specify with the previous segment.
  /// For example, your segment length is 3 seconds and your final segment is .5
  /// seconds without a minimum final segment length; when you set the minimum
  /// final segment length to 1, your final segment is 3.5 seconds.
  @_s.JsonKey(name: 'minFinalSegmentLength')
  final double minFinalSegmentLength;

  /// Specify whether your DASH profile is on-demand or main. When you choose Main
  /// profile (MAIN_PROFILE), the service signals
  /// urn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you
  /// choose On-demand (ON_DEMAND_PROFILE), the service signals
  /// urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose
  /// On-demand, you must also set the output group setting Segment control
  /// (SegmentControl) to Single file (SINGLE_FILE).
  @_s.JsonKey(name: 'mpdProfile')
  final DashIsoMpdProfile mpdProfile;

  /// When set to SINGLE_FILE, a single output file is generated, which is
  /// internally segmented using the Fragment Length and Segment Length. When set
  /// to SEGMENTED_FILES, separate segment files will be created.
  @_s.JsonKey(name: 'segmentControl')
  final DashIsoSegmentControl segmentControl;

  /// Length of mpd segments to create (in seconds). Note that segments will end
  /// on the next keyframe after this number of seconds, so actual segment length
  /// may be longer. When Emit Single File is checked, the segmentation is
  /// internal to a single output file and it does not cause the creation of many
  /// output files as in other output types.
  @_s.JsonKey(name: 'segmentLength')
  final int segmentLength;

  /// If you get an HTTP error in the 400 range when you play back your DASH
  /// output, enable this setting and run your transcoding job again. When you
  /// enable this setting, the service writes precise segment durations in the
  /// DASH manifest. The segment duration information appears inside the
  /// SegmentTimeline element, inside SegmentTemplate at the Representation level.
  /// When you don't enable this setting, the service writes approximate segment
  /// durations in your DASH manifest.
  @_s.JsonKey(name: 'writeSegmentTimelineInRepresentation')
  final DashIsoWriteSegmentTimelineInRepresentation
      writeSegmentTimelineInRepresentation;

  DashIsoGroupSettings({
    this.additionalManifests,
    this.baseUrl,
    this.destination,
    this.destinationSettings,
    this.encryption,
    this.fragmentLength,
    this.hbbtvCompliance,
    this.minBufferTime,
    this.minFinalSegmentLength,
    this.mpdProfile,
    this.segmentControl,
    this.segmentLength,
    this.writeSegmentTimelineInRepresentation,
  });
  factory DashIsoGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$DashIsoGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DashIsoGroupSettingsToJson(this);
}

/// Supports HbbTV specification as indicated
enum DashIsoHbbtvCompliance {
  @_s.JsonValue('HBBTV_1_5')
  hbbtv_1_5,
  @_s.JsonValue('NONE')
  none,
}

/// Specify whether your DASH profile is on-demand or main. When you choose Main
/// profile (MAIN_PROFILE), the service signals
/// urn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you
/// choose On-demand (ON_DEMAND_PROFILE), the service signals
/// urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose
/// On-demand, you must also set the output group setting Segment control
/// (SegmentControl) to Single file (SINGLE_FILE).
enum DashIsoMpdProfile {
  @_s.JsonValue('MAIN_PROFILE')
  mainProfile,
  @_s.JsonValue('ON_DEMAND_PROFILE')
  onDemandProfile,
}

/// This setting can improve the compatibility of your output with video players
/// on obsolete devices. It applies only to DASH H.264 outputs with DRM
/// encryption. Choose Unencrypted SEI (UNENCRYPTED_SEI) only to correct
/// problems with playback on older devices. Otherwise, keep the default setting
/// CENC v1 (CENC_V1). If you choose Unencrypted SEI, for that output, the
/// service will exclude the access unit delimiter and will leave the SEI NAL
/// units unencrypted.
enum DashIsoPlaybackDeviceCompatibility {
  @_s.JsonValue('CENC_V1')
  cencV1,
  @_s.JsonValue('UNENCRYPTED_SEI')
  unencryptedSei,
}

/// When set to SINGLE_FILE, a single output file is generated, which is
/// internally segmented using the Fragment Length and Segment Length. When set
/// to SEGMENTED_FILES, separate segment files will be created.
enum DashIsoSegmentControl {
  @_s.JsonValue('SINGLE_FILE')
  singleFile,
  @_s.JsonValue('SEGMENTED_FILES')
  segmentedFiles,
}

/// When you enable Precise segment duration in manifests
/// (writeSegmentTimelineInRepresentation), your DASH manifest shows precise
/// segment durations. The segment duration information appears inside the
/// SegmentTimeline element, inside SegmentTemplate at the Representation level.
/// When this feature isn't enabled, the segment durations in your DASH manifest
/// are approximate. The segment duration information appears in the duration
/// attribute of the SegmentTemplate element.
enum DashIsoWriteSegmentTimelineInRepresentation {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Specify the encryption mode that you used to encrypt your input files.
enum DecryptionMode {
  @_s.JsonValue('AES_CTR')
  aesCtr,
  @_s.JsonValue('AES_CBC')
  aesCbc,
  @_s.JsonValue('AES_GCM')
  aesGcm,
}

/// Only applies when you set Deinterlacer (DeinterlaceMode) to Deinterlace
/// (DEINTERLACE) or Adaptive (ADAPTIVE). Motion adaptive interpolate
/// (INTERPOLATE) produces sharper pictures, while blend (BLEND) produces
/// smoother motion. Use (INTERPOLATE_TICKER) OR (BLEND_TICKER) if your source
/// file includes a ticker, such as a scrolling headline at the bottom of the
/// frame.
enum DeinterlaceAlgorithm {
  @_s.JsonValue('INTERPOLATE')
  interpolate,
  @_s.JsonValue('INTERPOLATE_TICKER')
  interpolateTicker,
  @_s.JsonValue('BLEND')
  blend,
  @_s.JsonValue('BLEND_TICKER')
  blendTicker,
}

/// Settings for deinterlacer
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Deinterlacer {
  /// Only applies when you set Deinterlacer (DeinterlaceMode) to Deinterlace
  /// (DEINTERLACE) or Adaptive (ADAPTIVE). Motion adaptive interpolate
  /// (INTERPOLATE) produces sharper pictures, while blend (BLEND) produces
  /// smoother motion. Use (INTERPOLATE_TICKER) OR (BLEND_TICKER) if your source
  /// file includes a ticker, such as a scrolling headline at the bottom of the
  /// frame.
  @_s.JsonKey(name: 'algorithm')
  final DeinterlaceAlgorithm algorithm;

  /// - When set to NORMAL (default), the deinterlacer does not convert frames
  /// that are tagged  in metadata as progressive. It will only convert those that
  /// are tagged as some other type. - When set to FORCE_ALL_FRAMES, the
  /// deinterlacer converts every frame to progressive - even those that are
  /// already tagged as progressive. Turn Force mode on only if there is  a good
  /// chance that the metadata has tagged frames as progressive when they are not
  /// progressive. Do not turn on otherwise; processing frames that are already
  /// progressive  into progressive will probably result in lower quality video.
  @_s.JsonKey(name: 'control')
  final DeinterlacerControl control;

  /// Use Deinterlacer (DeinterlaceMode) to choose how the service will do
  /// deinterlacing. Default is Deinterlace. - Deinterlace converts interlaced to
  /// progressive. - Inverse telecine converts Hard Telecine 29.97i to progressive
  /// 23.976p. - Adaptive auto-detects and converts to progressive.
  @_s.JsonKey(name: 'mode')
  final DeinterlacerMode mode;

  Deinterlacer({
    this.algorithm,
    this.control,
    this.mode,
  });
  factory Deinterlacer.fromJson(Map<String, dynamic> json) =>
      _$DeinterlacerFromJson(json);

  Map<String, dynamic> toJson() => _$DeinterlacerToJson(this);
}

/// - When set to NORMAL (default), the deinterlacer does not convert frames
/// that are tagged  in metadata as progressive. It will only convert those that
/// are tagged as some other type. - When set to FORCE_ALL_FRAMES, the
/// deinterlacer converts every frame to progressive - even those that are
/// already tagged as progressive. Turn Force mode on only if there is  a good
/// chance that the metadata has tagged frames as progressive when they are not
/// progressive. Do not turn on otherwise; processing frames that are already
/// progressive  into progressive will probably result in lower quality video.
enum DeinterlacerControl {
  @_s.JsonValue('FORCE_ALL_FRAMES')
  forceAllFrames,
  @_s.JsonValue('NORMAL')
  normal,
}

/// Use Deinterlacer (DeinterlaceMode) to choose how the service will do
/// deinterlacing. Default is Deinterlace. - Deinterlace converts interlaced to
/// progressive. - Inverse telecine converts Hard Telecine 29.97i to progressive
/// 23.976p. - Adaptive auto-detects and converts to progressive.
enum DeinterlacerMode {
  @_s.JsonValue('DEINTERLACE')
  deinterlace,
  @_s.JsonValue('INVERSE_TELECINE')
  inverseTelecine,
  @_s.JsonValue('ADAPTIVE')
  adaptive,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteJobTemplateResponse {
  DeleteJobTemplateResponse();
  factory DeleteJobTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteJobTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePresetResponse {
  DeletePresetResponse();
  factory DeletePresetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePresetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteQueueResponse {
  DeleteQueueResponse();
  factory DeleteQueueResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteQueueResponseFromJson(json);
}

/// Optional field, defaults to DEFAULT. Specify DEFAULT for this operation to
/// return your endpoints if any exist, or to create an endpoint for you and
/// return it if one doesn't already exist. Specify GET_ONLY to return your
/// endpoints if any exist, or an empty list if none exist.
enum DescribeEndpointsMode {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('GET_ONLY')
  getOnly,
}

extension on DescribeEndpointsMode {
  String toValue() {
    switch (this) {
      case DescribeEndpointsMode.$default:
        return 'DEFAULT';
      case DescribeEndpointsMode.getOnly:
        return 'GET_ONLY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEndpointsResponse {
  /// List of endpoints
  @_s.JsonKey(name: 'endpoints')
  final List<Endpoint> endpoints;

  /// Use this string to request the next batch of endpoints.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeEndpointsResponse({
    this.endpoints,
    this.nextToken,
  });
  factory DescribeEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEndpointsResponseFromJson(json);
}

/// Settings associated with the destination. Will vary based on the type of
/// destination
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DestinationSettings {
  /// Settings associated with S3 destination
  @_s.JsonKey(name: 's3Settings')
  final S3DestinationSettings s3Settings;

  DestinationSettings({
    this.s3Settings,
  });
  factory DestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$DestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationSettingsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateCertificateResponse {
  DisassociateCertificateResponse();
  factory DisassociateCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateCertificateResponseFromJson(json);
}

/// Settings for Dolby Vision
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DolbyVision {
  /// Use these settings when you set DolbyVisionLevel6Mode to SPECIFY to override
  /// the MaxCLL and MaxFALL values in your input with new values.
  @_s.JsonKey(name: 'l6Metadata')
  final DolbyVisionLevel6Metadata l6Metadata;

  /// Use Dolby Vision Mode to choose how the service will handle Dolby Vision
  /// MaxCLL and MaxFALL properies.
  @_s.JsonKey(name: 'l6Mode')
  final DolbyVisionLevel6Mode l6Mode;

  /// In the current MediaConvert implementation, the Dolby Vision profile is
  /// always 5 (PROFILE_5). Therefore, all of your inputs must contain Dolby
  /// Vision frame interleaved data.
  @_s.JsonKey(name: 'profile')
  final DolbyVisionProfile profile;

  DolbyVision({
    this.l6Metadata,
    this.l6Mode,
    this.profile,
  });
  factory DolbyVision.fromJson(Map<String, dynamic> json) =>
      _$DolbyVisionFromJson(json);

  Map<String, dynamic> toJson() => _$DolbyVisionToJson(this);
}

/// Use these settings when you set DolbyVisionLevel6Mode to SPECIFY to override
/// the MaxCLL and MaxFALL values in your input with new values.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DolbyVisionLevel6Metadata {
  /// Maximum Content Light Level. Static HDR metadata that corresponds to the
  /// brightest pixel in the entire stream. Measured in nits.
  @_s.JsonKey(name: 'maxCll')
  final int maxCll;

  /// Maximum Frame-Average Light Level. Static HDR metadata that corresponds to
  /// the highest frame-average brightness in the entire stream. Measured in nits.
  @_s.JsonKey(name: 'maxFall')
  final int maxFall;

  DolbyVisionLevel6Metadata({
    this.maxCll,
    this.maxFall,
  });
  factory DolbyVisionLevel6Metadata.fromJson(Map<String, dynamic> json) =>
      _$DolbyVisionLevel6MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$DolbyVisionLevel6MetadataToJson(this);
}

/// Use Dolby Vision Mode to choose how the service will handle Dolby Vision
/// MaxCLL and MaxFALL properies.
enum DolbyVisionLevel6Mode {
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
  @_s.JsonValue('RECALCULATE')
  recalculate,
  @_s.JsonValue('SPECIFY')
  specify,
}

/// In the current MediaConvert implementation, the Dolby Vision profile is
/// always 5 (PROFILE_5). Therefore, all of your inputs must contain Dolby
/// Vision frame interleaved data.
enum DolbyVisionProfile {
  @_s.JsonValue('PROFILE_5')
  profile_5,
}

/// Applies only to 29.97 fps outputs. When this feature is enabled, the service
/// will use drop-frame timecode on outputs. If it is not possible to use
/// drop-frame timecode, the system will fall back to non-drop-frame. This
/// setting is enabled by default when Timecode insertion (TimecodeInsertion) is
/// enabled.
enum DropFrameTimecode {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Inserts DVB Network Information Table (NIT) at the specified table
/// repetition interval.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DvbNitSettings {
  /// The numeric value placed in the Network Information Table (NIT).
  @_s.JsonKey(name: 'networkId')
  final int networkId;

  /// The network name text placed in the network_name_descriptor inside the
  /// Network Information Table. Maximum length is 256 characters.
  @_s.JsonKey(name: 'networkName')
  final String networkName;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  @_s.JsonKey(name: 'nitInterval')
  final int nitInterval;

  DvbNitSettings({
    this.networkId,
    this.networkName,
    this.nitInterval,
  });
  factory DvbNitSettings.fromJson(Map<String, dynamic> json) =>
      _$DvbNitSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DvbNitSettingsToJson(this);
}

/// Inserts DVB Service Description Table (NIT) at the specified table
/// repetition interval.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DvbSdtSettings {
  /// Selects method of inserting SDT information into output stream.  "Follow
  /// input SDT" copies SDT information from input stream to  output stream.
  /// "Follow input SDT if present" copies SDT information from  input stream to
  /// output stream if SDT information is present in the input, otherwise it will
  /// fall back on the user-defined values. Enter "SDT  Manually" means user will
  /// enter the SDT information. "No SDT" means output  stream will not contain
  /// SDT information.
  @_s.JsonKey(name: 'outputSdt')
  final OutputSdt outputSdt;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  @_s.JsonKey(name: 'sdtInterval')
  final int sdtInterval;

  /// The service name placed in the service_descriptor in the Service Description
  /// Table. Maximum length is 256 characters.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  /// The service provider name placed in the service_descriptor in the Service
  /// Description Table. Maximum length is 256 characters.
  @_s.JsonKey(name: 'serviceProviderName')
  final String serviceProviderName;

  DvbSdtSettings({
    this.outputSdt,
    this.sdtInterval,
    this.serviceName,
    this.serviceProviderName,
  });
  factory DvbSdtSettings.fromJson(Map<String, dynamic> json) =>
      _$DvbSdtSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DvbSdtSettingsToJson(this);
}

/// DVB-Sub Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DvbSubDestinationSettings {
  /// If no explicit x_position or y_position is provided, setting alignment to
  /// centered will place the captions at the bottom center of the output.
  /// Similarly, setting a left alignment will align captions to the bottom left
  /// of the output. If x and y positions are given in conjunction with the
  /// alignment parameter, the font will be justified (either left or centered)
  /// relative to those coordinates. This option is not valid for source captions
  /// that are STL, 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  @_s.JsonKey(name: 'alignment')
  final DvbSubtitleAlignment alignment;

  /// Specifies the color of the rectangle behind the captions.
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'backgroundColor')
  final DvbSubtitleBackgroundColor backgroundColor;

  /// Specifies the opacity of the background rectangle. 255 is opaque; 0 is
  /// transparent. Leaving this parameter blank is equivalent to setting it to 0
  /// (transparent). All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'backgroundOpacity')
  final int backgroundOpacity;

  /// Specifies the color of the burned-in captions. This option is not valid for
  /// source captions that are STL, 608/embedded or teletext. These source
  /// settings are already pre-defined by the caption stream. All burn-in and
  /// DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontColor')
  final DvbSubtitleFontColor fontColor;

  /// Specifies the opacity of the burned-in captions. 255 is opaque; 0 is
  /// transparent.
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontOpacity')
  final int fontOpacity;

  /// Font resolution in DPI (dots per inch); default is 96 dpi.
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontResolution')
  final int fontResolution;

  /// Provide the font script, using an ISO 15924 script code, if the LanguageCode
  /// is not sufficient for determining the script type. Where LanguageCode or
  /// CustomLanguageCode is sufficient, use "AUTOMATIC" or leave unset. This is
  /// used to help determine the appropriate font for rendering DVB-Sub captions.
  @_s.JsonKey(name: 'fontScript')
  final FontScript fontScript;

  /// A positive integer indicates the exact font size in points. Set to 0 for
  /// automatic font size selection. All burn-in and DVB-Sub font settings must
  /// match.
  @_s.JsonKey(name: 'fontSize')
  final int fontSize;

  /// Specifies font outline color. This option is not valid for source captions
  /// that are either 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  @_s.JsonKey(name: 'outlineColor')
  final DvbSubtitleOutlineColor outlineColor;

  /// Specifies font outline size in pixels. This option is not valid for source
  /// captions that are either 608/embedded or teletext. These source settings are
  /// already pre-defined by the caption stream. All burn-in and DVB-Sub font
  /// settings must match.
  @_s.JsonKey(name: 'outlineSize')
  final int outlineSize;

  /// Specifies the color of the shadow cast by the captions.
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowColor')
  final DvbSubtitleShadowColor shadowColor;

  /// Specifies the opacity of the shadow. 255 is opaque; 0 is transparent.
  /// Leaving this parameter blank is equivalent to setting it to 0 (transparent).
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowOpacity')
  final int shadowOpacity;

  /// Specifies the horizontal offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels to the left.
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowXOffset')
  final int shadowXOffset;

  /// Specifies the vertical offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels above the
  /// text. All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowYOffset')
  final int shadowYOffset;

  /// Specify whether your DVB subtitles are standard or for hearing impaired.
  /// Choose hearing impaired if your subtitles include audio descriptions and
  /// dialogue. Choose standard if your subtitles include only dialogue.
  @_s.JsonKey(name: 'subtitlingType')
  final DvbSubtitlingType subtitlingType;

  /// Only applies to jobs with input captions in Teletext or STL formats. Specify
  /// whether the spacing between letters in your captions is set by the captions
  /// grid or varies depending on letter width. Choose fixed grid to conform to
  /// the spacing specified in the captions file more accurately. Choose
  /// proportional to make the text easier to read if the captions are closed
  /// caption.
  @_s.JsonKey(name: 'teletextSpacing')
  final DvbSubtitleTeletextSpacing teletextSpacing;

  /// Specifies the horizontal position of the caption relative to the left side
  /// of the output in pixels. A value of 10 would result in the captions starting
  /// 10 pixels from the left of the output. If no explicit x_position is
  /// provided, the horizontal caption position will be determined by the
  /// alignment parameter. This option is not valid for source captions that are
  /// STL, 608/embedded or teletext. These source settings are already pre-defined
  /// by the caption stream. All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'xPosition')
  final int xPosition;

  /// Specifies the vertical position of the caption relative to the top of the
  /// output in pixels. A value of 10 would result in the captions starting 10
  /// pixels from the top of the output. If no explicit y_position is provided,
  /// the caption will be positioned towards the bottom of the output. This option
  /// is not valid for source captions that are STL, 608/embedded or teletext.
  /// These source settings are already pre-defined by the caption stream. All
  /// burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'yPosition')
  final int yPosition;

  DvbSubDestinationSettings({
    this.alignment,
    this.backgroundColor,
    this.backgroundOpacity,
    this.fontColor,
    this.fontOpacity,
    this.fontResolution,
    this.fontScript,
    this.fontSize,
    this.outlineColor,
    this.outlineSize,
    this.shadowColor,
    this.shadowOpacity,
    this.shadowXOffset,
    this.shadowYOffset,
    this.subtitlingType,
    this.teletextSpacing,
    this.xPosition,
    this.yPosition,
  });
  factory DvbSubDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$DvbSubDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DvbSubDestinationSettingsToJson(this);
}

/// DVB Sub Source Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DvbSubSourceSettings {
  /// When using DVB-Sub with Burn-In or SMPTE-TT, use this PID for the source
  /// content. Unused for DVB-Sub passthrough. All DVB-Sub content is passed
  /// through, regardless of selectors.
  @_s.JsonKey(name: 'pid')
  final int pid;

  DvbSubSourceSettings({
    this.pid,
  });
  factory DvbSubSourceSettings.fromJson(Map<String, dynamic> json) =>
      _$DvbSubSourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DvbSubSourceSettingsToJson(this);
}

/// If no explicit x_position or y_position is provided, setting alignment to
/// centered will place the captions at the bottom center of the output.
/// Similarly, setting a left alignment will align captions to the bottom left
/// of the output. If x and y positions are given in conjunction with the
/// alignment parameter, the font will be justified (either left or centered)
/// relative to those coordinates. This option is not valid for source captions
/// that are STL, 608/embedded or teletext. These source settings are already
/// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
/// must match.
enum DvbSubtitleAlignment {
  @_s.JsonValue('CENTERED')
  centered,
  @_s.JsonValue('LEFT')
  left,
}

/// Specifies the color of the rectangle behind the captions.
/// All burn-in and DVB-Sub font settings must match.
enum DvbSubtitleBackgroundColor {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('WHITE')
  white,
}

/// Specifies the color of the burned-in captions. This option is not valid for
/// source captions that are STL, 608/embedded or teletext. These source
/// settings are already pre-defined by the caption stream. All burn-in and
/// DVB-Sub font settings must match.
enum DvbSubtitleFontColor {
  @_s.JsonValue('WHITE')
  white,
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('YELLOW')
  yellow,
  @_s.JsonValue('RED')
  red,
  @_s.JsonValue('GREEN')
  green,
  @_s.JsonValue('BLUE')
  blue,
}

/// Specifies font outline color. This option is not valid for source captions
/// that are either 608/embedded or teletext. These source settings are already
/// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
/// must match.
enum DvbSubtitleOutlineColor {
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('WHITE')
  white,
  @_s.JsonValue('YELLOW')
  yellow,
  @_s.JsonValue('RED')
  red,
  @_s.JsonValue('GREEN')
  green,
  @_s.JsonValue('BLUE')
  blue,
}

/// Specifies the color of the shadow cast by the captions.
/// All burn-in and DVB-Sub font settings must match.
enum DvbSubtitleShadowColor {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('WHITE')
  white,
}

/// Only applies to jobs with input captions in Teletext or STL formats. Specify
/// whether the spacing between letters in your captions is set by the captions
/// grid or varies depending on letter width. Choose fixed grid to conform to
/// the spacing specified in the captions file more accurately. Choose
/// proportional to make the text easier to read if the captions are closed
/// caption.
enum DvbSubtitleTeletextSpacing {
  @_s.JsonValue('FIXED_GRID')
  fixedGrid,
  @_s.JsonValue('PROPORTIONAL')
  proportional,
}

/// Specify whether your DVB subtitles are standard or for hearing impaired.
/// Choose hearing impaired if your subtitles include audio descriptions and
/// dialogue. Choose standard if your subtitles include only dialogue.
enum DvbSubtitlingType {
  @_s.JsonValue('HEARING_IMPAIRED')
  hearingImpaired,
  @_s.JsonValue('STANDARD')
  standard,
}

/// Inserts DVB Time and Date Table (TDT) at the specified table repetition
/// interval.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DvbTdtSettings {
  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  @_s.JsonKey(name: 'tdtInterval')
  final int tdtInterval;

  DvbTdtSettings({
    this.tdtInterval,
  });
  factory DvbTdtSettings.fromJson(Map<String, dynamic> json) =>
      _$DvbTdtSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DvbTdtSettingsToJson(this);
}

/// Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For
/// more information about the EAC3 bitstream mode, see ATSC A/52-2012 (Annex
/// E).
enum Eac3AtmosBitstreamMode {
  @_s.JsonValue('COMPLETE_MAIN')
  completeMain,
}

/// The coding mode for Dolby Digital Plus JOC (Atmos) is always 9.1.6
/// (CODING_MODE_9_1_6).
enum Eac3AtmosCodingMode {
  @_s.JsonValue('CODING_MODE_9_1_6')
  codingMode_9_1_6,
}

/// Enable Dolby Dialogue Intelligence to adjust loudness based on dialogue
/// analysis.
enum Eac3AtmosDialogueIntelligence {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Specify the absolute peak level for a signal with dynamic range compression.
enum Eac3AtmosDynamicRangeCompressionLine {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('FILM_STANDARD')
  filmStandard,
  @_s.JsonValue('FILM_LIGHT')
  filmLight,
  @_s.JsonValue('MUSIC_STANDARD')
  musicStandard,
  @_s.JsonValue('MUSIC_LIGHT')
  musicLight,
  @_s.JsonValue('SPEECH')
  speech,
}

/// Specify how the service limits the audio dynamic range when compressing the
/// audio.
enum Eac3AtmosDynamicRangeCompressionRf {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('FILM_STANDARD')
  filmStandard,
  @_s.JsonValue('FILM_LIGHT')
  filmLight,
  @_s.JsonValue('MUSIC_STANDARD')
  musicStandard,
  @_s.JsonValue('MUSIC_LIGHT')
  musicLight,
  @_s.JsonValue('SPEECH')
  speech,
}

/// Choose how the service meters the loudness of your audio.
enum Eac3AtmosMeteringMode {
  @_s.JsonValue('LEQ_A')
  leqA,
  @_s.JsonValue('ITU_BS_1770_1')
  ituBs_1770_1,
  @_s.JsonValue('ITU_BS_1770_2')
  ituBs_1770_2,
  @_s.JsonValue('ITU_BS_1770_3')
  ituBs_1770_3,
  @_s.JsonValue('ITU_BS_1770_4')
  ituBs_1770_4,
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value EAC3_ATMOS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Eac3AtmosSettings {
  /// Specify the average bitrate in bits per second.
  /// Valid values: 384k, 448k, 640k, 768k
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For
  /// more information about the EAC3 bitstream mode, see ATSC A/52-2012 (Annex
  /// E).
  @_s.JsonKey(name: 'bitstreamMode')
  final Eac3AtmosBitstreamMode bitstreamMode;

  /// The coding mode for Dolby Digital Plus JOC (Atmos) is always 9.1.6
  /// (CODING_MODE_9_1_6).
  @_s.JsonKey(name: 'codingMode')
  final Eac3AtmosCodingMode codingMode;

  /// Enable Dolby Dialogue Intelligence to adjust loudness based on dialogue
  /// analysis.
  @_s.JsonKey(name: 'dialogueIntelligence')
  final Eac3AtmosDialogueIntelligence dialogueIntelligence;

  /// Specify the absolute peak level for a signal with dynamic range compression.
  @_s.JsonKey(name: 'dynamicRangeCompressionLine')
  final Eac3AtmosDynamicRangeCompressionLine dynamicRangeCompressionLine;

  /// Specify how the service limits the audio dynamic range when compressing the
  /// audio.
  @_s.JsonKey(name: 'dynamicRangeCompressionRf')
  final Eac3AtmosDynamicRangeCompressionRf dynamicRangeCompressionRf;

  /// Specify a value for the following Dolby Atmos setting: Left only/Right only
  /// center mix
  /// (Lo/Ro center). MediaConvert uses this value for downmixing. How the service
  /// uses this
  /// value depends on the value that you choose for Stereo downmix
  /// (Eac3AtmosStereoDownmix).
  /// Valid values: 3.0, 1.5, 0.0, -1.5, -3.0, -4.5, and -6.0.
  @_s.JsonKey(name: 'loRoCenterMixLevel')
  final double loRoCenterMixLevel;

  /// Specify a value for the following Dolby Atmos setting: Left only/Right only
  /// (Lo/Ro surround). MediaConvert uses this value for downmixing. How the
  /// service uses this value depends on the value that you choose for Stereo
  /// downmix (Eac3AtmosStereoDownmix). Valid values: -1.5, -3.0, -4.5, -6.0, and
  /// -60. The value -60 mutes the channel.
  @_s.JsonKey(name: 'loRoSurroundMixLevel')
  final double loRoSurroundMixLevel;

  /// Specify a value for the following Dolby Atmos setting: Left total/Right
  /// total center mix (Lt/Rt center). MediaConvert uses this value for
  /// downmixing. How the service uses this value depends on the value that you
  /// choose for Stereo downmix (Eac3AtmosStereoDownmix). Valid values: 3.0, 1.5,
  /// 0.0, -1.5, -3.0, -4.5, and -6.0.
  @_s.JsonKey(name: 'ltRtCenterMixLevel')
  final double ltRtCenterMixLevel;

  /// Specify a value for the following Dolby Atmos setting: Left total/Right
  /// total surround mix (Lt/Rt surround). MediaConvert uses this value for
  /// downmixing. How the service uses this value depends on the value that you
  /// choose for Stereo downmix (Eac3AtmosStereoDownmix). Valid values: -1.5,
  /// -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel.
  @_s.JsonKey(name: 'ltRtSurroundMixLevel')
  final double ltRtSurroundMixLevel;

  /// Choose how the service meters the loudness of your audio.
  @_s.JsonKey(name: 'meteringMode')
  final Eac3AtmosMeteringMode meteringMode;

  /// This value is always 48000. It represents the sample rate in Hz.
  @_s.JsonKey(name: 'sampleRate')
  final int sampleRate;

  /// Specify the percentage of audio content that must be speech before the
  /// encoder uses the measured speech loudness as the overall program loudness.
  @_s.JsonKey(name: 'speechThreshold')
  final int speechThreshold;

  /// Choose how the service does stereo downmixing.
  @_s.JsonKey(name: 'stereoDownmix')
  final Eac3AtmosStereoDownmix stereoDownmix;

  /// Specify whether your input audio has an additional center rear surround
  /// channel matrix encoded into your left and right surround channels.
  @_s.JsonKey(name: 'surroundExMode')
  final Eac3AtmosSurroundExMode surroundExMode;

  Eac3AtmosSettings({
    this.bitrate,
    this.bitstreamMode,
    this.codingMode,
    this.dialogueIntelligence,
    this.dynamicRangeCompressionLine,
    this.dynamicRangeCompressionRf,
    this.loRoCenterMixLevel,
    this.loRoSurroundMixLevel,
    this.ltRtCenterMixLevel,
    this.ltRtSurroundMixLevel,
    this.meteringMode,
    this.sampleRate,
    this.speechThreshold,
    this.stereoDownmix,
    this.surroundExMode,
  });
  factory Eac3AtmosSettings.fromJson(Map<String, dynamic> json) =>
      _$Eac3AtmosSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Eac3AtmosSettingsToJson(this);
}

/// Choose how the service does stereo downmixing.
enum Eac3AtmosStereoDownmix {
  @_s.JsonValue('NOT_INDICATED')
  notIndicated,
  @_s.JsonValue('STEREO')
  stereo,
  @_s.JsonValue('SURROUND')
  surround,
  @_s.JsonValue('DPL2')
  dpl2,
}

/// Specify whether your input audio has an additional center rear surround
/// channel matrix encoded into your left and right surround channels.
enum Eac3AtmosSurroundExMode {
  @_s.JsonValue('NOT_INDICATED')
  notIndicated,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// If set to ATTENUATE_3_DB, applies a 3 dB attenuation to the surround
/// channels. Only used for 3/2 coding mode.
enum Eac3AttenuationControl {
  @_s.JsonValue('ATTENUATE_3_DB')
  attenuate_3Db,
  @_s.JsonValue('NONE')
  none,
}

/// Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For
/// more information about the EAC3 bitstream mode, see ATSC A/52-2012 (Annex
/// E).
enum Eac3BitstreamMode {
  @_s.JsonValue('COMPLETE_MAIN')
  completeMain,
  @_s.JsonValue('COMMENTARY')
  commentary,
  @_s.JsonValue('EMERGENCY')
  emergency,
  @_s.JsonValue('HEARING_IMPAIRED')
  hearingImpaired,
  @_s.JsonValue('VISUALLY_IMPAIRED')
  visuallyImpaired,
}

/// Dolby Digital Plus coding mode. Determines number of channels.
enum Eac3CodingMode {
  @_s.JsonValue('CODING_MODE_1_0')
  codingMode_1_0,
  @_s.JsonValue('CODING_MODE_2_0')
  codingMode_2_0,
  @_s.JsonValue('CODING_MODE_3_2')
  codingMode_3_2,
}

/// Activates a DC highpass filter for all input channels.
enum Eac3DcFilter {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Specify the absolute peak level for a signal with dynamic range compression.
enum Eac3DynamicRangeCompressionLine {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('FILM_STANDARD')
  filmStandard,
  @_s.JsonValue('FILM_LIGHT')
  filmLight,
  @_s.JsonValue('MUSIC_STANDARD')
  musicStandard,
  @_s.JsonValue('MUSIC_LIGHT')
  musicLight,
  @_s.JsonValue('SPEECH')
  speech,
}

/// Specify how the service limits the audio dynamic range when compressing the
/// audio.
enum Eac3DynamicRangeCompressionRf {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('FILM_STANDARD')
  filmStandard,
  @_s.JsonValue('FILM_LIGHT')
  filmLight,
  @_s.JsonValue('MUSIC_STANDARD')
  musicStandard,
  @_s.JsonValue('MUSIC_LIGHT')
  musicLight,
  @_s.JsonValue('SPEECH')
  speech,
}

/// When encoding 3/2 audio, controls whether the LFE channel is enabled
enum Eac3LfeControl {
  @_s.JsonValue('LFE')
  lfe,
  @_s.JsonValue('NO_LFE')
  noLfe,
}

/// Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only
/// valid with 3_2_LFE coding mode.
enum Eac3LfeFilter {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+,
/// or DolbyE decoder that supplied this audio data. If audio was not supplied
/// from one of these streams, then the static metadata settings will be used.
enum Eac3MetadataControl {
  @_s.JsonValue('FOLLOW_INPUT')
  followInput,
  @_s.JsonValue('USE_CONFIGURED')
  useConfigured,
}

/// When set to WHEN_POSSIBLE, input DD+ audio will be passed through if it is
/// present on the input. this detection is dynamic over the life of the
/// transcode. Inputs that alternate between DD+ and non-DD+ content will have a
/// consistent DD+ output as the system alternates between passthrough and
/// encoding.
enum Eac3PassthroughControl {
  @_s.JsonValue('WHEN_POSSIBLE')
  whenPossible,
  @_s.JsonValue('NO_PASSTHROUGH')
  noPassthrough,
}

/// Controls the amount of phase-shift applied to the surround channels. Only
/// used for 3/2 coding mode.
enum Eac3PhaseControl {
  @_s.JsonValue('SHIFT_90_DEGREES')
  shift_90Degrees,
  @_s.JsonValue('NO_SHIFT')
  noShift,
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value EAC3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Eac3Settings {
  /// If set to ATTENUATE_3_DB, applies a 3 dB attenuation to the surround
  /// channels. Only used for 3/2 coding mode.
  @_s.JsonKey(name: 'attenuationControl')
  final Eac3AttenuationControl attenuationControl;

  /// Specify the average bitrate in bits per second. Valid bitrates depend on the
  /// coding mode.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For
  /// more information about the EAC3 bitstream mode, see ATSC A/52-2012 (Annex
  /// E).
  @_s.JsonKey(name: 'bitstreamMode')
  final Eac3BitstreamMode bitstreamMode;

  /// Dolby Digital Plus coding mode. Determines number of channels.
  @_s.JsonKey(name: 'codingMode')
  final Eac3CodingMode codingMode;

  /// Activates a DC highpass filter for all input channels.
  @_s.JsonKey(name: 'dcFilter')
  final Eac3DcFilter dcFilter;

  /// Sets the dialnorm for the output. If blank and input audio is Dolby Digital
  /// Plus, dialnorm will be passed through.
  @_s.JsonKey(name: 'dialnorm')
  final int dialnorm;

  /// Specify the absolute peak level for a signal with dynamic range compression.
  @_s.JsonKey(name: 'dynamicRangeCompressionLine')
  final Eac3DynamicRangeCompressionLine dynamicRangeCompressionLine;

  /// Specify how the service limits the audio dynamic range when compressing the
  /// audio.
  @_s.JsonKey(name: 'dynamicRangeCompressionRf')
  final Eac3DynamicRangeCompressionRf dynamicRangeCompressionRf;

  /// When encoding 3/2 audio, controls whether the LFE channel is enabled
  @_s.JsonKey(name: 'lfeControl')
  final Eac3LfeControl lfeControl;

  /// Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only
  /// valid with 3_2_LFE coding mode.
  @_s.JsonKey(name: 'lfeFilter')
  final Eac3LfeFilter lfeFilter;

  /// Specify a value for the following Dolby Digital Plus setting: Left
  /// only/Right only center mix (Lo/Ro center). MediaConvert uses this value for
  /// downmixing. How the service uses this value depends on the value that you
  /// choose for Stereo downmix (Eac3StereoDownmix). Valid values: 3.0, 1.5, 0.0,
  /// -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel. This
  /// setting applies only if you keep the default value of 3/2 - L, R, C, Ls, Rs
  /// (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you
  /// choose a different value for Coding mode, the service ignores Left
  /// only/Right only center (loRoCenterMixLevel).
  @_s.JsonKey(name: 'loRoCenterMixLevel')
  final double loRoCenterMixLevel;

  /// Specify a value for the following Dolby Digital Plus setting: Left
  /// only/Right only (Lo/Ro surround). MediaConvert uses this value for
  /// downmixing. How the service uses this value depends on the value that you
  /// choose for Stereo downmix (Eac3StereoDownmix). Valid values: -1.5, -3.0,
  /// -4.5, -6.0, and -60. The value -60 mutes the channel. This setting applies
  /// only if you keep the default value of 3/2 - L, R, C, Ls, Rs
  /// (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you
  /// choose a different value for Coding mode, the service ignores Left
  /// only/Right only surround (loRoSurroundMixLevel).
  @_s.JsonKey(name: 'loRoSurroundMixLevel')
  final double loRoSurroundMixLevel;

  /// Specify a value for the following Dolby Digital Plus setting: Left
  /// total/Right total center mix (Lt/Rt center). MediaConvert uses this value
  /// for downmixing. How the service uses this value depends on the value that
  /// you choose for Stereo downmix (Eac3StereoDownmix). Valid values: 3.0, 1.5,
  /// 0.0, -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel. This
  /// setting applies only if you keep the default value of 3/2 - L, R, C, Ls, Rs
  /// (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you
  /// choose a different value for Coding mode, the service ignores Left
  /// total/Right total center (ltRtCenterMixLevel).
  @_s.JsonKey(name: 'ltRtCenterMixLevel')
  final double ltRtCenterMixLevel;

  /// Specify a value for the following Dolby Digital Plus setting: Left
  /// total/Right total surround mix (Lt/Rt surround). MediaConvert uses this
  /// value for downmixing. How the service uses this value depends on the value
  /// that you choose for Stereo downmix (Eac3StereoDownmix). Valid values: -1.5,
  /// -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel. This setting
  /// applies only if you keep the default value of 3/2 - L, R, C, Ls, Rs
  /// (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you
  /// choose a different value for Coding mode, the service ignores Left
  /// total/Right total surround (ltRtSurroundMixLevel).
  @_s.JsonKey(name: 'ltRtSurroundMixLevel')
  final double ltRtSurroundMixLevel;

  /// When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+,
  /// or DolbyE decoder that supplied this audio data. If audio was not supplied
  /// from one of these streams, then the static metadata settings will be used.
  @_s.JsonKey(name: 'metadataControl')
  final Eac3MetadataControl metadataControl;

  /// When set to WHEN_POSSIBLE, input DD+ audio will be passed through if it is
  /// present on the input. this detection is dynamic over the life of the
  /// transcode. Inputs that alternate between DD+ and non-DD+ content will have a
  /// consistent DD+ output as the system alternates between passthrough and
  /// encoding.
  @_s.JsonKey(name: 'passthroughControl')
  final Eac3PassthroughControl passthroughControl;

  /// Controls the amount of phase-shift applied to the surround channels. Only
  /// used for 3/2 coding mode.
  @_s.JsonKey(name: 'phaseControl')
  final Eac3PhaseControl phaseControl;

  /// This value is always 48000. It represents the sample rate in Hz.
  @_s.JsonKey(name: 'sampleRate')
  final int sampleRate;

  /// Choose how the service does stereo downmixing. This setting only applies if
  /// you keep the default value of 3/2 - L, R, C, Ls, Rs (CODING_MODE_3_2) for
  /// the setting Coding mode (Eac3CodingMode). If you choose a different value
  /// for Coding mode, the service ignores Stereo downmix (Eac3StereoDownmix).
  @_s.JsonKey(name: 'stereoDownmix')
  final Eac3StereoDownmix stereoDownmix;

  /// When encoding 3/2 audio, sets whether an extra center back surround channel
  /// is matrix encoded into the left and right surround channels.
  @_s.JsonKey(name: 'surroundExMode')
  final Eac3SurroundExMode surroundExMode;

  /// When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded into
  /// the two channels.
  @_s.JsonKey(name: 'surroundMode')
  final Eac3SurroundMode surroundMode;

  Eac3Settings({
    this.attenuationControl,
    this.bitrate,
    this.bitstreamMode,
    this.codingMode,
    this.dcFilter,
    this.dialnorm,
    this.dynamicRangeCompressionLine,
    this.dynamicRangeCompressionRf,
    this.lfeControl,
    this.lfeFilter,
    this.loRoCenterMixLevel,
    this.loRoSurroundMixLevel,
    this.ltRtCenterMixLevel,
    this.ltRtSurroundMixLevel,
    this.metadataControl,
    this.passthroughControl,
    this.phaseControl,
    this.sampleRate,
    this.stereoDownmix,
    this.surroundExMode,
    this.surroundMode,
  });
  factory Eac3Settings.fromJson(Map<String, dynamic> json) =>
      _$Eac3SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Eac3SettingsToJson(this);
}

/// Choose how the service does stereo downmixing. This setting only applies if
/// you keep the default value of 3/2 - L, R, C, Ls, Rs (CODING_MODE_3_2) for
/// the setting Coding mode (Eac3CodingMode). If you choose a different value
/// for Coding mode, the service ignores Stereo downmix (Eac3StereoDownmix).
enum Eac3StereoDownmix {
  @_s.JsonValue('NOT_INDICATED')
  notIndicated,
  @_s.JsonValue('LO_RO')
  loRo,
  @_s.JsonValue('LT_RT')
  ltRt,
  @_s.JsonValue('DPL2')
  dpl2,
}

/// When encoding 3/2 audio, sets whether an extra center back surround channel
/// is matrix encoded into the left and right surround channels.
enum Eac3SurroundExMode {
  @_s.JsonValue('NOT_INDICATED')
  notIndicated,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded into
/// the two channels.
enum Eac3SurroundMode {
  @_s.JsonValue('NOT_INDICATED')
  notIndicated,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Specify whether this set of input captions appears in your outputs in both
/// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
/// includes the captions data in two ways: it passes the 608 data through using
/// the 608 compatibility bytes fields of the 708 wrapper, and it also
/// translates the 608 data into 708.
enum EmbeddedConvert608To708 {
  @_s.JsonValue('UPCONVERT')
  upconvert,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Settings specific to embedded/ancillary caption outputs, including 608/708
/// Channel destination number.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EmbeddedDestinationSettings {
  /// Ignore this setting unless your input captions are SCC format and your
  /// output captions are embedded in the video stream. Specify a CC number for
  /// each captions channel in this output. If you have two channels, choose CC
  /// numbers that aren't in the same field. For example, choose 1 and 3. For more
  /// information, see
  /// https://docs.aws.amazon.com/console/mediaconvert/dual-scc-to-embedded.
  @_s.JsonKey(name: 'destination608ChannelNumber')
  final int destination608ChannelNumber;

  /// Ignore this setting unless your input captions are SCC format and you want
  /// both 608 and 708 captions embedded in your output stream. Optionally,
  /// specify the 708 service number for each output captions channel. Choose a
  /// different number for each channel. To use this setting, also set Force 608
  /// to 708 upconvert (Convert608To708) to Upconvert (UPCONVERT) in your input
  /// captions selector settings. If you choose to upconvert but don't specify a
  /// 708 service number, MediaConvert uses the number that you specify for CC
  /// channel number (destination608ChannelNumber) for the 708 service number. For
  /// more information, see
  /// https://docs.aws.amazon.com/console/mediaconvert/dual-scc-to-embedded.
  @_s.JsonKey(name: 'destination708ServiceNumber')
  final int destination708ServiceNumber;

  EmbeddedDestinationSettings({
    this.destination608ChannelNumber,
    this.destination708ServiceNumber,
  });
  factory EmbeddedDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$EmbeddedDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$EmbeddedDestinationSettingsToJson(this);
}

/// Settings for embedded captions Source
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EmbeddedSourceSettings {
  /// Specify whether this set of input captions appears in your outputs in both
  /// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
  /// includes the captions data in two ways: it passes the 608 data through using
  /// the 608 compatibility bytes fields of the 708 wrapper, and it also
  /// translates the 608 data into 708.
  @_s.JsonKey(name: 'convert608To708')
  final EmbeddedConvert608To708 convert608To708;

  /// Specifies the 608/708 channel number within the video track from which to
  /// extract captions. Unused for passthrough.
  @_s.JsonKey(name: 'source608ChannelNumber')
  final int source608ChannelNumber;

  /// Specifies the video track index used for extracting captions. The system
  /// only supports one input video track, so this should always be set to '1'.
  @_s.JsonKey(name: 'source608TrackNumber')
  final int source608TrackNumber;

  /// By default, the service terminates any unterminated captions at the end of
  /// each input. If you want the caption to continue onto your next input,
  /// disable this setting.
  @_s.JsonKey(name: 'terminateCaptions')
  final EmbeddedTerminateCaptions terminateCaptions;

  EmbeddedSourceSettings({
    this.convert608To708,
    this.source608ChannelNumber,
    this.source608TrackNumber,
    this.terminateCaptions,
  });
  factory EmbeddedSourceSettings.fromJson(Map<String, dynamic> json) =>
      _$EmbeddedSourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$EmbeddedSourceSettingsToJson(this);
}

/// By default, the service terminates any unterminated captions at the end of
/// each input. If you want the caption to continue onto your next input,
/// disable this setting.
enum EmbeddedTerminateCaptions {
  @_s.JsonValue('END_OF_INPUT')
  endOfInput,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Describes an account-specific API endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Endpoint {
  /// URL of endpoint
  @_s.JsonKey(name: 'url')
  final String url;

  Endpoint({
    this.url,
  });
  factory Endpoint.fromJson(Map<String, dynamic> json) =>
      _$EndpointFromJson(json);
}

/// ESAM ManifestConfirmConditionNotification defined by
/// OC-SP-ESAM-API-I03-131025.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EsamManifestConfirmConditionNotification {
  /// Provide your ESAM ManifestConfirmConditionNotification XML document inside
  /// your JSON job settings. Form the XML document as per
  /// OC-SP-ESAM-API-I03-131025. The transcoder will use the Manifest Conditioning
  /// instructions in the message that you supply.
  @_s.JsonKey(name: 'mccXml')
  final String mccXml;

  EsamManifestConfirmConditionNotification({
    this.mccXml,
  });
  factory EsamManifestConfirmConditionNotification.fromJson(
          Map<String, dynamic> json) =>
      _$EsamManifestConfirmConditionNotificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EsamManifestConfirmConditionNotificationToJson(this);
}

/// Settings for Event Signaling And Messaging (ESAM). If you don't do ad
/// insertion, you can ignore these settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EsamSettings {
  /// Specifies an ESAM ManifestConfirmConditionNotification XML as per
  /// OC-SP-ESAM-API-I03-131025. The transcoder uses the manifest conditioning
  /// instructions that you provide in the setting MCC XML (mccXml).
  @_s.JsonKey(name: 'manifestConfirmConditionNotification')
  final EsamManifestConfirmConditionNotification
      manifestConfirmConditionNotification;

  /// Specifies the stream distance, in milliseconds, between the SCTE 35 messages
  /// that the transcoder places and the splice points that they refer to. If the
  /// time between the start of the asset and the SCTE-35 message is less than
  /// this value, then the transcoder places the SCTE-35 marker at the beginning
  /// of the stream.
  @_s.JsonKey(name: 'responseSignalPreroll')
  final int responseSignalPreroll;

  /// Specifies an ESAM SignalProcessingNotification XML as per
  /// OC-SP-ESAM-API-I03-131025. The transcoder uses the signal processing
  /// instructions that you provide in the setting SCC XML (sccXml).
  @_s.JsonKey(name: 'signalProcessingNotification')
  final EsamSignalProcessingNotification signalProcessingNotification;

  EsamSettings({
    this.manifestConfirmConditionNotification,
    this.responseSignalPreroll,
    this.signalProcessingNotification,
  });
  factory EsamSettings.fromJson(Map<String, dynamic> json) =>
      _$EsamSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$EsamSettingsToJson(this);
}

/// ESAM SignalProcessingNotification data defined by OC-SP-ESAM-API-I03-131025.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EsamSignalProcessingNotification {
  /// Provide your ESAM SignalProcessingNotification XML document inside your JSON
  /// job settings. Form the XML document as per OC-SP-ESAM-API-I03-131025. The
  /// transcoder will use the signal processing instructions in the message that
  /// you supply. Provide your ESAM SignalProcessingNotification XML document
  /// inside your JSON job settings. For your MPEG2-TS file outputs, if you want
  /// the service to place SCTE-35 markers at the insertion points you specify in
  /// the XML document, you must also enable SCTE-35 ESAM (scte35Esam). Note that
  /// you can either specify an ESAM XML document or enable SCTE-35 passthrough.
  /// You can't do both.
  @_s.JsonKey(name: 'sccXml')
  final String sccXml;

  EsamSignalProcessingNotification({
    this.sccXml,
  });
  factory EsamSignalProcessingNotification.fromJson(
          Map<String, dynamic> json) =>
      _$EsamSignalProcessingNotificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EsamSignalProcessingNotificationToJson(this);
}

/// If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the beginning
/// of the archive as required for progressive downloading. Otherwise it is
/// placed normally at the end.
enum F4vMoovPlacement {
  @_s.JsonValue('PROGRESSIVE_DOWNLOAD')
  progressiveDownload,
  @_s.JsonValue('NORMAL')
  normal,
}

/// Settings for F4v container
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class F4vSettings {
  /// If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the beginning
  /// of the archive as required for progressive downloading. Otherwise it is
  /// placed normally at the end.
  @_s.JsonKey(name: 'moovPlacement')
  final F4vMoovPlacement moovPlacement;

  F4vSettings({
    this.moovPlacement,
  });
  factory F4vSettings.fromJson(Map<String, dynamic> json) =>
      _$F4vSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$F4vSettingsToJson(this);
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// FILE_GROUP_SETTINGS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FileGroupSettings {
  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do not
  /// specify the base filename in the URI, the service will use the filename of
  /// the input file. If your job has multiple inputs, the service uses the
  /// filename of the first input file.
  @_s.JsonKey(name: 'destination')
  final String destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  @_s.JsonKey(name: 'destinationSettings')
  final DestinationSettings destinationSettings;

  FileGroupSettings({
    this.destination,
    this.destinationSettings,
  });
  factory FileGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$FileGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$FileGroupSettingsToJson(this);
}

/// Specify whether this set of input captions appears in your outputs in both
/// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
/// includes the captions data in two ways: it passes the 608 data through using
/// the 608 compatibility bytes fields of the 708 wrapper, and it also
/// translates the 608 data into 708.
enum FileSourceConvert608To708 {
  @_s.JsonValue('UPCONVERT')
  upconvert,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// If your input captions are SCC, SMI, SRT, STL, TTML, or IMSC 1.1 in an xml
/// file, specify the URI of the input caption source file. If your caption
/// source is IMSC in an IMF package, use TrackSourceSettings instead of
/// FileSoureSettings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FileSourceSettings {
  /// Specify whether this set of input captions appears in your outputs in both
  /// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
  /// includes the captions data in two ways: it passes the 608 data through using
  /// the 608 compatibility bytes fields of the 708 wrapper, and it also
  /// translates the 608 data into 708.
  @_s.JsonKey(name: 'convert608To708')
  final FileSourceConvert608To708 convert608To708;

  /// Ignore this setting unless your input captions format is SCC. To have the
  /// service compensate for differing frame rates between your input captions and
  /// input video, specify the frame rate of the captions file. Specify this value
  /// as a fraction, using the settings Framerate numerator (framerateNumerator)
  /// and Framerate denominator (framerateDenominator). For example, you might
  /// specify 24 / 1 for 24 fps, 25 / 1 for 25 fps, 24000 / 1001 for 23.976 fps,
  /// or 30000 / 1001 for 29.97 fps.
  @_s.JsonKey(name: 'framerate')
  final CaptionSourceFramerate framerate;

  /// External caption file used for loading captions. Accepted file extensions
  /// are 'scc', 'ttml', 'dfxp', 'stl', 'srt', 'xml', and 'smi'.
  @_s.JsonKey(name: 'sourceFile')
  final String sourceFile;

  /// Specifies a time delta in seconds to offset the captions from the source
  /// file.
  @_s.JsonKey(name: 'timeDelta')
  final int timeDelta;

  FileSourceSettings({
    this.convert608To708,
    this.framerate,
    this.sourceFile,
    this.timeDelta,
  });
  factory FileSourceSettings.fromJson(Map<String, dynamic> json) =>
      _$FileSourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$FileSourceSettingsToJson(this);
}

/// Provide the font script, using an ISO 15924 script code, if the LanguageCode
/// is not sufficient for determining the script type. Where LanguageCode or
/// CustomLanguageCode is sufficient, use "AUTOMATIC" or leave unset.
enum FontScript {
  @_s.JsonValue('AUTOMATIC')
  automatic,
  @_s.JsonValue('HANS')
  hans,
  @_s.JsonValue('HANT')
  hant,
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value FRAME_CAPTURE.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FrameCaptureSettings {
  /// Frame capture will encode the first frame of the output stream, then one
  /// frame every framerateDenominator/framerateNumerator seconds. For example,
  /// settings of framerateNumerator = 1 and framerateDenominator = 3 (a rate of
  /// 1/3 frame per second) will capture the first frame, then 1 frame every 3s.
  /// Files will be named as filename.n.jpg where n is the 0-based sequence number
  /// of each Capture.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// Frame capture will encode the first frame of the output stream, then one
  /// frame every framerateDenominator/framerateNumerator seconds. For example,
  /// settings of framerateNumerator = 1 and framerateDenominator = 3 (a rate of
  /// 1/3 frame per second) will capture the first frame, then 1 frame every 3s.
  /// Files will be named as filename.NNNNNNN.jpg where N is the 0-based frame
  /// sequence number zero padded to 7 decimal places.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// Maximum number of captures (encoded jpg output files).
  @_s.JsonKey(name: 'maxCaptures')
  final int maxCaptures;

  /// JPEG Quality - a higher value equals higher quality.
  @_s.JsonKey(name: 'quality')
  final int quality;

  FrameCaptureSettings({
    this.framerateDenominator,
    this.framerateNumerator,
    this.maxCaptures,
    this.quality,
  });
  factory FrameCaptureSettings.fromJson(Map<String, dynamic> json) =>
      _$FrameCaptureSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$FrameCaptureSettingsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobResponse {
  /// Each job converts an input file into an output file or files. For more
  /// information, see the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  @_s.JsonKey(name: 'job')
  final Job job;

  GetJobResponse({
    this.job,
  });
  factory GetJobResponse.fromJson(Map<String, dynamic> json) =>
      _$GetJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobTemplateResponse {
  /// A job template is a pre-made set of encoding instructions that you can use
  /// to quickly create a job.
  @_s.JsonKey(name: 'jobTemplate')
  final JobTemplate jobTemplate;

  GetJobTemplateResponse({
    this.jobTemplate,
  });
  factory GetJobTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetJobTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPresetResponse {
  /// A preset is a collection of preconfigured media conversion settings that you
  /// want MediaConvert to apply to the output during the conversion process.
  @_s.JsonKey(name: 'preset')
  final Preset preset;

  GetPresetResponse({
    this.preset,
  });
  factory GetPresetResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPresetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetQueueResponse {
  /// You can use queues to manage the resources that are available to your AWS
  /// account for running multiple transcoding jobs at the same time. If you don't
  /// specify a queue, the service sends all jobs through the default queue. For
  /// more information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
  @_s.JsonKey(name: 'queue')
  final Queue queue;

  GetQueueResponse({
    this.queue,
  });
  factory GetQueueResponse.fromJson(Map<String, dynamic> json) =>
      _$GetQueueResponseFromJson(json);
}

/// Keep the default value, Auto (AUTO), for this setting to have MediaConvert
/// automatically apply the best types of quantization for your video content.
/// When you want to apply your quantization settings manually, you must set
/// H264AdaptiveQuantization to a value other than Auto (AUTO). Use this setting
/// to specify the strength of any adaptive quantization filters that you
/// enable. If you don't want MediaConvert to do any adaptive quantization in
/// this transcode, set Adaptive quantization (H264AdaptiveQuantization) to Off
/// (OFF). Related settings: The value that you choose here applies to the
/// following settings: H264FlickerAdaptiveQuantization,
/// H264SpatialAdaptiveQuantization, and H264TemporalAdaptiveQuantization.
enum H264AdaptiveQuantization {
  @_s.JsonValue('OFF')
  off,
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('HIGHER')
  higher,
  @_s.JsonValue('MAX')
  max,
}

/// Specify an H.264 level that is consistent with your output video settings.
/// If you aren't sure what level to specify, choose Auto (AUTO).
enum H264CodecLevel {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('LEVEL_1')
  level_1,
  @_s.JsonValue('LEVEL_1_1')
  level_1_1,
  @_s.JsonValue('LEVEL_1_2')
  level_1_2,
  @_s.JsonValue('LEVEL_1_3')
  level_1_3,
  @_s.JsonValue('LEVEL_2')
  level_2,
  @_s.JsonValue('LEVEL_2_1')
  level_2_1,
  @_s.JsonValue('LEVEL_2_2')
  level_2_2,
  @_s.JsonValue('LEVEL_3')
  level_3,
  @_s.JsonValue('LEVEL_3_1')
  level_3_1,
  @_s.JsonValue('LEVEL_3_2')
  level_3_2,
  @_s.JsonValue('LEVEL_4')
  level_4,
  @_s.JsonValue('LEVEL_4_1')
  level_4_1,
  @_s.JsonValue('LEVEL_4_2')
  level_4_2,
  @_s.JsonValue('LEVEL_5')
  level_5,
  @_s.JsonValue('LEVEL_5_1')
  level_5_1,
  @_s.JsonValue('LEVEL_5_2')
  level_5_2,
}

/// H.264 Profile. High 4:2:2 and 10-bit profiles are only available with the
/// AVC-I License.
enum H264CodecProfile {
  @_s.JsonValue('BASELINE')
  baseline,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('HIGH_10BIT')
  high_10bit,
  @_s.JsonValue('HIGH_422')
  high_422,
  @_s.JsonValue('HIGH_422_10BIT')
  high_422_10bit,
  @_s.JsonValue('MAIN')
  main,
}

/// Choose Adaptive to improve subjective video quality for high-motion content.
/// This will cause the service to use fewer B-frames (which infer information
/// based on other frames) for high-motion portions of the video and more
/// B-frames for low-motion portions. The maximum number of B-frames is limited
/// by the value you provide for the setting B frames between reference frames
/// (numberBFramesBetweenReferenceFrames).
enum H264DynamicSubGop {
  @_s.JsonValue('ADAPTIVE')
  adaptive,
  @_s.JsonValue('STATIC')
  static,
}

/// Entropy encoding mode. Use CABAC (must be in Main or High profile) or CAVLC.
enum H264EntropyEncoding {
  @_s.JsonValue('CABAC')
  cabac,
  @_s.JsonValue('CAVLC')
  cavlc,
}

/// Keep the default value, PAFF, to have MediaConvert use PAFF encoding for
/// interlaced outputs. Choose Force field (FORCE_FIELD) to disable PAFF
/// encoding and create separate interlaced fields.
enum H264FieldEncoding {
  @_s.JsonValue('PAFF')
  paff,
  @_s.JsonValue('FORCE_FIELD')
  forceField,
}

/// Only use this setting when you change the default value, AUTO, for the
/// setting H264AdaptiveQuantization. When you keep all defaults, excluding
/// H264AdaptiveQuantization and all other adaptive quantization from your JSON
/// job specification, MediaConvert automatically applies the best types of
/// quantization for your video content. When you set H264AdaptiveQuantization
/// to a value other than AUTO, the default value for
/// H264FlickerAdaptiveQuantization is Disabled (DISABLED). Change this value to
/// Enabled (ENABLED) to reduce I-frame pop. I-frame pop appears as a visual
/// flicker that can arise when the encoder saves bits by copying some
/// macroblocks many times from frame to frame, and then refreshes them at the
/// I-frame. When you enable this setting, the encoder updates these macroblocks
/// slightly more often to smooth out the flicker. To manually enable or disable
/// H264FlickerAdaptiveQuantization, you must set Adaptive quantization
/// (H264AdaptiveQuantization) to a value other than AUTO.
enum H264FlickerAdaptiveQuantization {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// If you are using the console, use the Framerate setting to specify the frame
/// rate for this output. If you want to keep the same frame rate as the input
/// video, choose Follow source. If you want to do frame rate conversion, choose
/// a frame rate from the dropdown list or choose Custom. The framerates shown
/// in the dropdown list are decimal approximations of fractions. If you choose
/// Custom, specify your frame rate as a fraction. If you are creating your
/// transcoding job specification as a JSON file without the console, use
/// FramerateControl to specify which value the service uses for the frame rate
/// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
/// use the frame rate from the input. Choose SPECIFIED if you want the service
/// to use the frame rate you specify in the settings FramerateNumerator and
/// FramerateDenominator.
enum H264FramerateControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Choose the method that you want MediaConvert to use when increasing or
/// decreasing the frame rate. We recommend using drop duplicate
/// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
/// fps. For numerically complex conversions, you can use interpolate
/// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
/// introduce undesirable video artifacts. For complex frame rate conversions,
/// especially if your source video has already been converted from its original
/// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
/// interpolation. FrameFormer chooses the best conversion method frame by
/// frame. Note that using FrameFormer increases the transcoding time and incurs
/// a significant add-on cost.
enum H264FramerateConversionAlgorithm {
  @_s.JsonValue('DUPLICATE_DROP')
  duplicateDrop,
  @_s.JsonValue('INTERPOLATE')
  interpolate,
  @_s.JsonValue('FRAMEFORMER')
  frameformer,
}

/// If enable, use reference B frames for GOP structures that have B frames > 1.
enum H264GopBReference {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Indicates if the GOP Size in H264 is specified in frames or seconds. If
/// seconds the system will convert the GOP Size into a frame count at run time.
enum H264GopSizeUnits {
  @_s.JsonValue('FRAMES')
  frames,
  @_s.JsonValue('SECONDS')
  seconds,
}

/// Choose the scan line type for the output. Keep the default value,
/// Progressive (PROGRESSIVE) to create a progressive output, regardless of the
/// scan type of your input. Use Top field first (TOP_FIELD) or Bottom field
/// first (BOTTOM_FIELD) to create an output that's interlaced with the same
/// field polarity throughout. Use Follow, default top (FOLLOW_TOP_FIELD) or
/// Follow, default bottom (FOLLOW_BOTTOM_FIELD) to produce outputs with the
/// same field polarity as the source. For jobs that have multiple inputs, the
/// output field polarity might change over the course of the output. Follow
/// behavior depends on the input scan type. If the source is interlaced, the
/// output will be interlaced with the same polarity as the source. If the
/// source is progressive, the output will be interlaced with top field bottom
/// field first, depending on which of the Follow options you choose.
enum H264InterlaceMode {
  @_s.JsonValue('PROGRESSIVE')
  progressive,
  @_s.JsonValue('TOP_FIELD')
  topField,
  @_s.JsonValue('BOTTOM_FIELD')
  bottomField,
  @_s.JsonValue('FOLLOW_TOP_FIELD')
  followTopField,
  @_s.JsonValue('FOLLOW_BOTTOM_FIELD')
  followBottomField,
}

/// Optional. Specify how the service determines the pixel aspect ratio (PAR)
/// for this output. The default behavior, Follow source
/// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
/// output. To specify a different PAR in the console, choose any value other
/// than Follow source. To specify a different PAR by editing the JSON job
/// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
/// you must also specify values for the parNumerator and parDenominator
/// settings.
enum H264ParControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
/// want to trade off encoding speed for output video quality. The default
/// behavior is faster, lower quality, single-pass encoding.
enum H264QualityTuningLevel {
  @_s.JsonValue('SINGLE_PASS')
  singlePass,
  @_s.JsonValue('SINGLE_PASS_HQ')
  singlePassHq,
  @_s.JsonValue('MULTI_PASS_HQ')
  multiPassHq,
}

/// Settings for quality-defined variable bitrate encoding with the H.264 codec.
/// Required when you set Rate control mode to QVBR. Not valid when you set Rate
/// control mode to a value other than QVBR, or when you don't define Rate
/// control mode.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class H264QvbrSettings {
  /// Use this setting only when Rate control mode is QVBR and Quality tuning
  /// level is Multi-pass HQ. For Max average bitrate values suited to the
  /// complexity of your input video, the service limits the average bitrate of
  /// the video part of this output to the value that you choose. That is, the
  /// total size of the video element is less than or equal to the value you set
  /// multiplied by the number of seconds of encoded output.
  @_s.JsonKey(name: 'maxAverageBitrate')
  final int maxAverageBitrate;

  /// Required when you use QVBR rate control mode. That is, when you specify
  /// qvbrSettings within h264Settings. Specify the general target quality level
  /// for this output, from 1 to 10. Use higher numbers for greater quality. Level
  /// 10 results in nearly lossless compression. The quality level for most
  /// broadcast-quality transcodes is between 6 and 9. Optionally, to specify a
  /// value between whole numbers, also provide a value for the setting
  /// qvbrQualityLevelFineTune. For example, if you want your QVBR quality level
  /// to be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to
  /// .33.
  @_s.JsonKey(name: 'qvbrQualityLevel')
  final int qvbrQualityLevel;

  /// Optional. Specify a value here to set the QVBR quality to a level that is
  /// between whole numbers. For example, if you want your QVBR quality level to
  /// be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33.
  /// MediaConvert rounds your QVBR quality level to the nearest third of a whole
  /// number. For example, if you set qvbrQualityLevel to 7 and you set
  /// qvbrQualityLevelFineTune to .25, your actual QVBR quality level is 7.33.
  @_s.JsonKey(name: 'qvbrQualityLevelFineTune')
  final double qvbrQualityLevelFineTune;

  H264QvbrSettings({
    this.maxAverageBitrate,
    this.qvbrQualityLevel,
    this.qvbrQualityLevelFineTune,
  });
  factory H264QvbrSettings.fromJson(Map<String, dynamic> json) =>
      _$H264QvbrSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$H264QvbrSettingsToJson(this);
}

/// Use this setting to specify whether this output has a variable bitrate
/// (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
enum H264RateControlMode {
  @_s.JsonValue('VBR')
  vbr,
  @_s.JsonValue('CBR')
  cbr,
  @_s.JsonValue('QVBR')
  qvbr,
}

/// Places a PPS header on each encoded picture, even if repeated.
enum H264RepeatPps {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Enable this setting to insert I-frames at scene changes that the service
/// automatically detects. This improves video quality and is enabled by
/// default. If this output uses QVBR, choose Transition detection
/// (TRANSITION_DETECTION) for further video quality improvement. For more
/// information about QVBR, see
/// https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
enum H264SceneChangeDetect {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('TRANSITION_DETECTION')
  transitionDetection,
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value H_264.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class H264Settings {
  /// Keep the default value, Auto (AUTO), for this setting to have MediaConvert
  /// automatically apply the best types of quantization for your video content.
  /// When you want to apply your quantization settings manually, you must set
  /// H264AdaptiveQuantization to a value other than Auto (AUTO). Use this setting
  /// to specify the strength of any adaptive quantization filters that you
  /// enable. If you don't want MediaConvert to do any adaptive quantization in
  /// this transcode, set Adaptive quantization (H264AdaptiveQuantization) to Off
  /// (OFF). Related settings: The value that you choose here applies to the
  /// following settings: H264FlickerAdaptiveQuantization,
  /// H264SpatialAdaptiveQuantization, and H264TemporalAdaptiveQuantization.
  @_s.JsonKey(name: 'adaptiveQuantization')
  final H264AdaptiveQuantization adaptiveQuantization;

  /// Specify the average bitrate in bits per second. Required for VBR and CBR.
  /// For MS Smooth outputs, bitrates must be unique when rounded down to the
  /// nearest multiple of 1000.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// Specify an H.264 level that is consistent with your output video settings.
  /// If you aren't sure what level to specify, choose Auto (AUTO).
  @_s.JsonKey(name: 'codecLevel')
  final H264CodecLevel codecLevel;

  /// H.264 Profile. High 4:2:2 and 10-bit profiles are only available with the
  /// AVC-I License.
  @_s.JsonKey(name: 'codecProfile')
  final H264CodecProfile codecProfile;

  /// Choose Adaptive to improve subjective video quality for high-motion content.
  /// This will cause the service to use fewer B-frames (which infer information
  /// based on other frames) for high-motion portions of the video and more
  /// B-frames for low-motion portions. The maximum number of B-frames is limited
  /// by the value you provide for the setting B frames between reference frames
  /// (numberBFramesBetweenReferenceFrames).
  @_s.JsonKey(name: 'dynamicSubGop')
  final H264DynamicSubGop dynamicSubGop;

  /// Entropy encoding mode. Use CABAC (must be in Main or High profile) or CAVLC.
  @_s.JsonKey(name: 'entropyEncoding')
  final H264EntropyEncoding entropyEncoding;

  /// Keep the default value, PAFF, to have MediaConvert use PAFF encoding for
  /// interlaced outputs. Choose Force field (FORCE_FIELD) to disable PAFF
  /// encoding and create separate interlaced fields.
  @_s.JsonKey(name: 'fieldEncoding')
  final H264FieldEncoding fieldEncoding;

  /// Only use this setting when you change the default value, AUTO, for the
  /// setting H264AdaptiveQuantization. When you keep all defaults, excluding
  /// H264AdaptiveQuantization and all other adaptive quantization from your JSON
  /// job specification, MediaConvert automatically applies the best types of
  /// quantization for your video content. When you set H264AdaptiveQuantization
  /// to a value other than AUTO, the default value for
  /// H264FlickerAdaptiveQuantization is Disabled (DISABLED). Change this value to
  /// Enabled (ENABLED) to reduce I-frame pop. I-frame pop appears as a visual
  /// flicker that can arise when the encoder saves bits by copying some
  /// macroblocks many times from frame to frame, and then refreshes them at the
  /// I-frame. When you enable this setting, the encoder updates these macroblocks
  /// slightly more often to smooth out the flicker. To manually enable or disable
  /// H264FlickerAdaptiveQuantization, you must set Adaptive quantization
  /// (H264AdaptiveQuantization) to a value other than AUTO.
  @_s.JsonKey(name: 'flickerAdaptiveQuantization')
  final H264FlickerAdaptiveQuantization flickerAdaptiveQuantization;

  /// If you are using the console, use the Framerate setting to specify the frame
  /// rate for this output. If you want to keep the same frame rate as the input
  /// video, choose Follow source. If you want to do frame rate conversion, choose
  /// a frame rate from the dropdown list or choose Custom. The framerates shown
  /// in the dropdown list are decimal approximations of fractions. If you choose
  /// Custom, specify your frame rate as a fraction. If you are creating your
  /// transcoding job specification as a JSON file without the console, use
  /// FramerateControl to specify which value the service uses for the frame rate
  /// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
  /// use the frame rate from the input. Choose SPECIFIED if you want the service
  /// to use the frame rate you specify in the settings FramerateNumerator and
  /// FramerateDenominator.
  @_s.JsonKey(name: 'framerateControl')
  final H264FramerateControl framerateControl;

  /// Choose the method that you want MediaConvert to use when increasing or
  /// decreasing the frame rate. We recommend using drop duplicate
  /// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
  /// fps. For numerically complex conversions, you can use interpolate
  /// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
  /// introduce undesirable video artifacts. For complex frame rate conversions,
  /// especially if your source video has already been converted from its original
  /// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
  /// interpolation. FrameFormer chooses the best conversion method frame by
  /// frame. Note that using FrameFormer increases the transcoding time and incurs
  /// a significant add-on cost.
  @_s.JsonKey(name: 'framerateConversionAlgorithm')
  final H264FramerateConversionAlgorithm framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// If enable, use reference B frames for GOP structures that have B frames > 1.
  @_s.JsonKey(name: 'gopBReference')
  final H264GopBReference gopBReference;

  /// Frequency of closed GOPs. In streaming applications, it is recommended that
  /// this be set to 1 so a decoder joining mid-stream will receive an IDR frame
  /// as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  @_s.JsonKey(name: 'gopClosedCadence')
  final int gopClosedCadence;

  /// GOP Length (keyframe interval) in frames or seconds. Must be greater than
  /// zero.
  @_s.JsonKey(name: 'gopSize')
  final double gopSize;

  /// Indicates if the GOP Size in H264 is specified in frames or seconds. If
  /// seconds the system will convert the GOP Size into a frame count at run time.
  @_s.JsonKey(name: 'gopSizeUnits')
  final H264GopSizeUnits gopSizeUnits;

  /// Percentage of the buffer that should initially be filled (HRD buffer model).
  @_s.JsonKey(name: 'hrdBufferInitialFillPercentage')
  final int hrdBufferInitialFillPercentage;

  /// Size of buffer (HRD buffer model) in bits. For example, enter five megabits
  /// as 5000000.
  @_s.JsonKey(name: 'hrdBufferSize')
  final int hrdBufferSize;

  /// Choose the scan line type for the output. Keep the default value,
  /// Progressive (PROGRESSIVE) to create a progressive output, regardless of the
  /// scan type of your input. Use Top field first (TOP_FIELD) or Bottom field
  /// first (BOTTOM_FIELD) to create an output that's interlaced with the same
  /// field polarity throughout. Use Follow, default top (FOLLOW_TOP_FIELD) or
  /// Follow, default bottom (FOLLOW_BOTTOM_FIELD) to produce outputs with the
  /// same field polarity as the source. For jobs that have multiple inputs, the
  /// output field polarity might change over the course of the output. Follow
  /// behavior depends on the input scan type. If the source is interlaced, the
  /// output will be interlaced with the same polarity as the source. If the
  /// source is progressive, the output will be interlaced with top field bottom
  /// field first, depending on which of the Follow options you choose.
  @_s.JsonKey(name: 'interlaceMode')
  final H264InterlaceMode interlaceMode;

  /// Maximum bitrate in bits/second. For example, enter five megabits per second
  /// as 5000000. Required when Rate control mode is QVBR.
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  /// Enforces separation between repeated (cadence) I-frames and I-frames
  /// inserted by Scene Change Detection. If a scene change I-frame is within
  /// I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched
  /// to the scene change I-frame. GOP stretch requires enabling lookahead as well
  /// as setting I-interval. The normal cadence resumes for the next GOP. This
  /// setting is only used when Scene Change Detect is enabled. Note: Maximum GOP
  /// stretch = GOP size + Min-I-interval - 1
  @_s.JsonKey(name: 'minIInterval')
  final int minIInterval;

  /// Number of B-frames between reference frames.
  @_s.JsonKey(name: 'numberBFramesBetweenReferenceFrames')
  final int numberBFramesBetweenReferenceFrames;

  /// Number of reference frames to use. The encoder may use more than requested
  /// if using B-frames and/or interlaced encoding.
  @_s.JsonKey(name: 'numberReferenceFrames')
  final int numberReferenceFrames;

  /// Optional. Specify how the service determines the pixel aspect ratio (PAR)
  /// for this output. The default behavior, Follow source
  /// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
  /// output. To specify a different PAR in the console, choose any value other
  /// than Follow source. To specify a different PAR by editing the JSON job
  /// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
  /// you must also specify values for the parNumerator and parDenominator
  /// settings.
  @_s.JsonKey(name: 'parControl')
  final H264ParControl parControl;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parDenominator is 33.
  @_s.JsonKey(name: 'parDenominator')
  final int parDenominator;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parNumerator is 40.
  @_s.JsonKey(name: 'parNumerator')
  final int parNumerator;

  /// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
  /// want to trade off encoding speed for output video quality. The default
  /// behavior is faster, lower quality, single-pass encoding.
  @_s.JsonKey(name: 'qualityTuningLevel')
  final H264QualityTuningLevel qualityTuningLevel;

  /// Settings for quality-defined variable bitrate encoding with the H.264 codec.
  /// Required when you set Rate control mode to QVBR. Not valid when you set Rate
  /// control mode to a value other than QVBR, or when you don't define Rate
  /// control mode.
  @_s.JsonKey(name: 'qvbrSettings')
  final H264QvbrSettings qvbrSettings;

  /// Use this setting to specify whether this output has a variable bitrate
  /// (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
  @_s.JsonKey(name: 'rateControlMode')
  final H264RateControlMode rateControlMode;

  /// Places a PPS header on each encoded picture, even if repeated.
  @_s.JsonKey(name: 'repeatPps')
  final H264RepeatPps repeatPps;

  /// Enable this setting to insert I-frames at scene changes that the service
  /// automatically detects. This improves video quality and is enabled by
  /// default. If this output uses QVBR, choose Transition detection
  /// (TRANSITION_DETECTION) for further video quality improvement. For more
  /// information about QVBR, see
  /// https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
  @_s.JsonKey(name: 'sceneChangeDetect')
  final H264SceneChangeDetect sceneChangeDetect;

  /// Number of slices per picture. Must be less than or equal to the number of
  /// macroblock rows for progressive pictures, and less than or equal to half the
  /// number of macroblock rows for interlaced pictures.
  @_s.JsonKey(name: 'slices')
  final int slices;

  /// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
  /// second (fps). Enable slow PAL to create a 25 fps output. When you enable
  /// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
  /// your audio to keep it synchronized with the video. Note that enabling this
  /// setting will slightly reduce the duration of your video. Required settings:
  /// You must also set Framerate to 25. In your JSON job specification, set
  /// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
  /// (framerateDenominator) to 1.
  @_s.JsonKey(name: 'slowPal')
  final H264SlowPal slowPal;

  /// Ignore this setting unless you need to comply with a specification that
  /// requires a specific value. If you don't have a specification requirement, we
  /// recommend that you adjust the softness of your output by using a lower value
  /// for the setting Sharpness (sharpness) or by enabling a noise reducer filter
  /// (noiseReducerFilter). The Softness (softness) setting specifies the
  /// quantization matrices that the encoder uses. Keep the default value, 0, for
  /// flat quantization. Choose the value 1 or 16 to use the default JVT softening
  /// quantization matricies from the H.264 specification. Choose a value from 17
  /// to 128 to use planar interpolation. Increasing values from 17 to 128 result
  /// in increasing reduction of high-frequency data. The value 128 results in the
  /// softest video.
  @_s.JsonKey(name: 'softness')
  final int softness;

  /// Only use this setting when you change the default value, Auto (AUTO), for
  /// the setting H264AdaptiveQuantization. When you keep all defaults, excluding
  /// H264AdaptiveQuantization and all other adaptive quantization from your JSON
  /// job specification, MediaConvert automatically applies the best types of
  /// quantization for your video content. When you set H264AdaptiveQuantization
  /// to a value other than AUTO, the default value for
  /// H264SpatialAdaptiveQuantization is Enabled (ENABLED). Keep this default
  /// value to adjust quantization within each frame based on spatial variation of
  /// content complexity. When you enable this feature, the encoder uses fewer
  /// bits on areas that can sustain more distortion with no noticeable visual
  /// degradation and uses more bits on areas where any small distortion will be
  /// noticeable. For example, complex textured blocks are encoded with fewer bits
  /// and smooth textured blocks are encoded with more bits. Enabling this feature
  /// will almost always improve your video quality. Note, though, that this
  /// feature doesn't take into account where the viewer's attention is likely to
  /// be. If viewers are likely to be focusing their attention on a part of the
  /// screen with a lot of complex texture, you might choose to set
  /// H264SpatialAdaptiveQuantization to Disabled (DISABLED). Related setting:
  /// When you enable spatial adaptive quantization, set the value for Adaptive
  /// quantization (H264AdaptiveQuantization) depending on your content. For
  /// homogeneous content, such as cartoons and video games, set it to Low. For
  /// content with a wider variety of textures, set it to High or Higher. To
  /// manually enable or disable H264SpatialAdaptiveQuantization, you must set
  /// Adaptive quantization (H264AdaptiveQuantization) to a value other than AUTO.
  @_s.JsonKey(name: 'spatialAdaptiveQuantization')
  final H264SpatialAdaptiveQuantization spatialAdaptiveQuantization;

  /// Produces a bitstream compliant with SMPTE RP-2027.
  @_s.JsonKey(name: 'syntax')
  final H264Syntax syntax;

  /// When you do frame rate conversion from 23.976 frames per second (fps) to
  /// 29.97 fps, and your output scan type is interlaced, you can optionally
  /// enable hard or soft telecine to create a smoother picture. Hard telecine
  /// (HARD) produces a 29.97i output. Soft telecine (SOFT) produces an output
  /// with a 23.976 output that signals to the video player device to do the
  /// conversion during play back. When you keep the default value, None (NONE),
  /// MediaConvert does a standard frame rate conversion to 29.97 without doing
  /// anything with the field polarity to create a smoother picture.
  @_s.JsonKey(name: 'telecine')
  final H264Telecine telecine;

  /// Only use this setting when you change the default value, AUTO, for the
  /// setting H264AdaptiveQuantization. When you keep all defaults, excluding
  /// H264AdaptiveQuantization and all other adaptive quantization from your JSON
  /// job specification, MediaConvert automatically applies the best types of
  /// quantization for your video content. When you set H264AdaptiveQuantization
  /// to a value other than AUTO, the default value for
  /// H264TemporalAdaptiveQuantization is Enabled (ENABLED). Keep this default
  /// value to adjust quantization within each frame based on temporal variation
  /// of content complexity. When you enable this feature, the encoder uses fewer
  /// bits on areas of the frame that aren't moving and uses more bits on complex
  /// objects with sharp edges that move a lot. For example, this feature improves
  /// the readability of text tickers on newscasts and scoreboards on sports
  /// matches. Enabling this feature will almost always improve your video
  /// quality. Note, though, that this feature doesn't take into account where the
  /// viewer's attention is likely to be. If viewers are likely to be focusing
  /// their attention on a part of the screen that doesn't have moving objects
  /// with sharp edges, such as sports athletes' faces, you might choose to set
  /// H264TemporalAdaptiveQuantization to Disabled (DISABLED). Related setting:
  /// When you enable temporal quantization, adjust the strength of the filter
  /// with the setting Adaptive quantization (adaptiveQuantization). To manually
  /// enable or disable H264TemporalAdaptiveQuantization, you must set Adaptive
  /// quantization (H264AdaptiveQuantization) to a value other than AUTO.
  @_s.JsonKey(name: 'temporalAdaptiveQuantization')
  final H264TemporalAdaptiveQuantization temporalAdaptiveQuantization;

  /// Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
  @_s.JsonKey(name: 'unregisteredSeiTimecode')
  final H264UnregisteredSeiTimecode unregisteredSeiTimecode;

  H264Settings({
    this.adaptiveQuantization,
    this.bitrate,
    this.codecLevel,
    this.codecProfile,
    this.dynamicSubGop,
    this.entropyEncoding,
    this.fieldEncoding,
    this.flickerAdaptiveQuantization,
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.gopBReference,
    this.gopClosedCadence,
    this.gopSize,
    this.gopSizeUnits,
    this.hrdBufferInitialFillPercentage,
    this.hrdBufferSize,
    this.interlaceMode,
    this.maxBitrate,
    this.minIInterval,
    this.numberBFramesBetweenReferenceFrames,
    this.numberReferenceFrames,
    this.parControl,
    this.parDenominator,
    this.parNumerator,
    this.qualityTuningLevel,
    this.qvbrSettings,
    this.rateControlMode,
    this.repeatPps,
    this.sceneChangeDetect,
    this.slices,
    this.slowPal,
    this.softness,
    this.spatialAdaptiveQuantization,
    this.syntax,
    this.telecine,
    this.temporalAdaptiveQuantization,
    this.unregisteredSeiTimecode,
  });
  factory H264Settings.fromJson(Map<String, dynamic> json) =>
      _$H264SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$H264SettingsToJson(this);
}

/// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
/// second (fps). Enable slow PAL to create a 25 fps output. When you enable
/// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
/// your audio to keep it synchronized with the video. Note that enabling this
/// setting will slightly reduce the duration of your video. Required settings:
/// You must also set Framerate to 25. In your JSON job specification, set
/// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
/// (framerateDenominator) to 1.
enum H264SlowPal {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Only use this setting when you change the default value, Auto (AUTO), for
/// the setting H264AdaptiveQuantization. When you keep all defaults, excluding
/// H264AdaptiveQuantization and all other adaptive quantization from your JSON
/// job specification, MediaConvert automatically applies the best types of
/// quantization for your video content. When you set H264AdaptiveQuantization
/// to a value other than AUTO, the default value for
/// H264SpatialAdaptiveQuantization is Enabled (ENABLED). Keep this default
/// value to adjust quantization within each frame based on spatial variation of
/// content complexity. When you enable this feature, the encoder uses fewer
/// bits on areas that can sustain more distortion with no noticeable visual
/// degradation and uses more bits on areas where any small distortion will be
/// noticeable. For example, complex textured blocks are encoded with fewer bits
/// and smooth textured blocks are encoded with more bits. Enabling this feature
/// will almost always improve your video quality. Note, though, that this
/// feature doesn't take into account where the viewer's attention is likely to
/// be. If viewers are likely to be focusing their attention on a part of the
/// screen with a lot of complex texture, you might choose to set
/// H264SpatialAdaptiveQuantization to Disabled (DISABLED). Related setting:
/// When you enable spatial adaptive quantization, set the value for Adaptive
/// quantization (H264AdaptiveQuantization) depending on your content. For
/// homogeneous content, such as cartoons and video games, set it to Low. For
/// content with a wider variety of textures, set it to High or Higher. To
/// manually enable or disable H264SpatialAdaptiveQuantization, you must set
/// Adaptive quantization (H264AdaptiveQuantization) to a value other than AUTO.
enum H264SpatialAdaptiveQuantization {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Produces a bitstream compliant with SMPTE RP-2027.
enum H264Syntax {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('RP2027')
  rp2027,
}

/// When you do frame rate conversion from 23.976 frames per second (fps) to
/// 29.97 fps, and your output scan type is interlaced, you can optionally
/// enable hard or soft telecine to create a smoother picture. Hard telecine
/// (HARD) produces a 29.97i output. Soft telecine (SOFT) produces an output
/// with a 23.976 output that signals to the video player device to do the
/// conversion during play back. When you keep the default value, None (NONE),
/// MediaConvert does a standard frame rate conversion to 29.97 without doing
/// anything with the field polarity to create a smoother picture.
enum H264Telecine {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('SOFT')
  soft,
  @_s.JsonValue('HARD')
  hard,
}

/// Only use this setting when you change the default value, AUTO, for the
/// setting H264AdaptiveQuantization. When you keep all defaults, excluding
/// H264AdaptiveQuantization and all other adaptive quantization from your JSON
/// job specification, MediaConvert automatically applies the best types of
/// quantization for your video content. When you set H264AdaptiveQuantization
/// to a value other than AUTO, the default value for
/// H264TemporalAdaptiveQuantization is Enabled (ENABLED). Keep this default
/// value to adjust quantization within each frame based on temporal variation
/// of content complexity. When you enable this feature, the encoder uses fewer
/// bits on areas of the frame that aren't moving and uses more bits on complex
/// objects with sharp edges that move a lot. For example, this feature improves
/// the readability of text tickers on newscasts and scoreboards on sports
/// matches. Enabling this feature will almost always improve your video
/// quality. Note, though, that this feature doesn't take into account where the
/// viewer's attention is likely to be. If viewers are likely to be focusing
/// their attention on a part of the screen that doesn't have moving objects
/// with sharp edges, such as sports athletes' faces, you might choose to set
/// H264TemporalAdaptiveQuantization to Disabled (DISABLED). Related setting:
/// When you enable temporal quantization, adjust the strength of the filter
/// with the setting Adaptive quantization (adaptiveQuantization). To manually
/// enable or disable H264TemporalAdaptiveQuantization, you must set Adaptive
/// quantization (H264AdaptiveQuantization) to a value other than AUTO.
enum H264TemporalAdaptiveQuantization {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
enum H264UnregisteredSeiTimecode {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Specify the strength of any adaptive quantization filters that you enable.
/// The value that you choose here applies to the following settings: Flicker
/// adaptive quantization (flickerAdaptiveQuantization), Spatial adaptive
/// quantization (spatialAdaptiveQuantization), and Temporal adaptive
/// quantization (temporalAdaptiveQuantization).
enum H265AdaptiveQuantization {
  @_s.JsonValue('OFF')
  off,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('HIGHER')
  higher,
  @_s.JsonValue('MAX')
  max,
}

/// Enables Alternate Transfer Function SEI message for outputs using Hybrid Log
/// Gamma (HLG) Electro-Optical Transfer Function (EOTF).
enum H265AlternateTransferFunctionSei {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// H.265 Level.
enum H265CodecLevel {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('LEVEL_1')
  level_1,
  @_s.JsonValue('LEVEL_2')
  level_2,
  @_s.JsonValue('LEVEL_2_1')
  level_2_1,
  @_s.JsonValue('LEVEL_3')
  level_3,
  @_s.JsonValue('LEVEL_3_1')
  level_3_1,
  @_s.JsonValue('LEVEL_4')
  level_4,
  @_s.JsonValue('LEVEL_4_1')
  level_4_1,
  @_s.JsonValue('LEVEL_5')
  level_5,
  @_s.JsonValue('LEVEL_5_1')
  level_5_1,
  @_s.JsonValue('LEVEL_5_2')
  level_5_2,
  @_s.JsonValue('LEVEL_6')
  level_6,
  @_s.JsonValue('LEVEL_6_1')
  level_6_1,
  @_s.JsonValue('LEVEL_6_2')
  level_6_2,
}

/// Represents the Profile and Tier, per the HEVC (H.265) specification.
/// Selections are grouped as [Profile] / [Tier], so "Main/High" represents Main
/// Profile with High Tier. 4:2:2 profiles are only available with the HEVC
/// 4:2:2 License.
enum H265CodecProfile {
  @_s.JsonValue('MAIN_MAIN')
  mainMain,
  @_s.JsonValue('MAIN_HIGH')
  mainHigh,
  @_s.JsonValue('MAIN10_MAIN')
  main10Main,
  @_s.JsonValue('MAIN10_HIGH')
  main10High,
  @_s.JsonValue('MAIN_422_8BIT_MAIN')
  main_422_8bitMain,
  @_s.JsonValue('MAIN_422_8BIT_HIGH')
  main_422_8bitHigh,
  @_s.JsonValue('MAIN_422_10BIT_MAIN')
  main_422_10bitMain,
  @_s.JsonValue('MAIN_422_10BIT_HIGH')
  main_422_10bitHigh,
}

/// Choose Adaptive to improve subjective video quality for high-motion content.
/// This will cause the service to use fewer B-frames (which infer information
/// based on other frames) for high-motion portions of the video and more
/// B-frames for low-motion portions. The maximum number of B-frames is limited
/// by the value you provide for the setting B frames between reference frames
/// (numberBFramesBetweenReferenceFrames).
enum H265DynamicSubGop {
  @_s.JsonValue('ADAPTIVE')
  adaptive,
  @_s.JsonValue('STATIC')
  static,
}

/// Enable this setting to have the encoder reduce I-frame pop. I-frame pop
/// appears as a visual flicker that can arise when the encoder saves bits by
/// copying some macroblocks many times from frame to frame, and then refreshes
/// them at the I-frame. When you enable this setting, the encoder updates these
/// macroblocks slightly more often to smooth out the flicker. This setting is
/// disabled by default. Related setting: In addition to enabling this setting,
/// you must also set adaptiveQuantization to a value other than Off (OFF).
enum H265FlickerAdaptiveQuantization {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// If you are using the console, use the Framerate setting to specify the frame
/// rate for this output. If you want to keep the same frame rate as the input
/// video, choose Follow source. If you want to do frame rate conversion, choose
/// a frame rate from the dropdown list or choose Custom. The framerates shown
/// in the dropdown list are decimal approximations of fractions. If you choose
/// Custom, specify your frame rate as a fraction. If you are creating your
/// transcoding job specification as a JSON file without the console, use
/// FramerateControl to specify which value the service uses for the frame rate
/// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
/// use the frame rate from the input. Choose SPECIFIED if you want the service
/// to use the frame rate you specify in the settings FramerateNumerator and
/// FramerateDenominator.
enum H265FramerateControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Choose the method that you want MediaConvert to use when increasing or
/// decreasing the frame rate. We recommend using drop duplicate
/// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
/// fps. For numerically complex conversions, you can use interpolate
/// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
/// introduce undesirable video artifacts. For complex frame rate conversions,
/// especially if your source video has already been converted from its original
/// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
/// interpolation. FrameFormer chooses the best conversion method frame by
/// frame. Note that using FrameFormer increases the transcoding time and incurs
/// a significant add-on cost.
enum H265FramerateConversionAlgorithm {
  @_s.JsonValue('DUPLICATE_DROP')
  duplicateDrop,
  @_s.JsonValue('INTERPOLATE')
  interpolate,
  @_s.JsonValue('FRAMEFORMER')
  frameformer,
}

/// If enable, use reference B frames for GOP structures that have B frames > 1.
enum H265GopBReference {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Indicates if the GOP Size in H265 is specified in frames or seconds. If
/// seconds the system will convert the GOP Size into a frame count at run time.
enum H265GopSizeUnits {
  @_s.JsonValue('FRAMES')
  frames,
  @_s.JsonValue('SECONDS')
  seconds,
}

/// Choose the scan line type for the output. Keep the default value,
/// Progressive (PROGRESSIVE) to create a progressive output, regardless of the
/// scan type of your input. Use Top field first (TOP_FIELD) or Bottom field
/// first (BOTTOM_FIELD) to create an output that's interlaced with the same
/// field polarity throughout. Use Follow, default top (FOLLOW_TOP_FIELD) or
/// Follow, default bottom (FOLLOW_BOTTOM_FIELD) to produce outputs with the
/// same field polarity as the source. For jobs that have multiple inputs, the
/// output field polarity might change over the course of the output. Follow
/// behavior depends on the input scan type. If the source is interlaced, the
/// output will be interlaced with the same polarity as the source. If the
/// source is progressive, the output will be interlaced with top field bottom
/// field first, depending on which of the Follow options you choose.
enum H265InterlaceMode {
  @_s.JsonValue('PROGRESSIVE')
  progressive,
  @_s.JsonValue('TOP_FIELD')
  topField,
  @_s.JsonValue('BOTTOM_FIELD')
  bottomField,
  @_s.JsonValue('FOLLOW_TOP_FIELD')
  followTopField,
  @_s.JsonValue('FOLLOW_BOTTOM_FIELD')
  followBottomField,
}

/// Optional. Specify how the service determines the pixel aspect ratio (PAR)
/// for this output. The default behavior, Follow source
/// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
/// output. To specify a different PAR in the console, choose any value other
/// than Follow source. To specify a different PAR by editing the JSON job
/// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
/// you must also specify values for the parNumerator and parDenominator
/// settings.
enum H265ParControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
/// want to trade off encoding speed for output video quality. The default
/// behavior is faster, lower quality, single-pass encoding.
enum H265QualityTuningLevel {
  @_s.JsonValue('SINGLE_PASS')
  singlePass,
  @_s.JsonValue('SINGLE_PASS_HQ')
  singlePassHq,
  @_s.JsonValue('MULTI_PASS_HQ')
  multiPassHq,
}

/// Settings for quality-defined variable bitrate encoding with the H.265 codec.
/// Required when you set Rate control mode to QVBR. Not valid when you set Rate
/// control mode to a value other than QVBR, or when you don't define Rate
/// control mode.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class H265QvbrSettings {
  /// Use this setting only when Rate control mode is QVBR and Quality tuning
  /// level is Multi-pass HQ. For Max average bitrate values suited to the
  /// complexity of your input video, the service limits the average bitrate of
  /// the video part of this output to the value that you choose. That is, the
  /// total size of the video element is less than or equal to the value you set
  /// multiplied by the number of seconds of encoded output.
  @_s.JsonKey(name: 'maxAverageBitrate')
  final int maxAverageBitrate;

  /// Required when you use QVBR rate control mode. That is, when you specify
  /// qvbrSettings within h265Settings. Specify the general target quality level
  /// for this output, from 1 to 10. Use higher numbers for greater quality. Level
  /// 10 results in nearly lossless compression. The quality level for most
  /// broadcast-quality transcodes is between 6 and 9. Optionally, to specify a
  /// value between whole numbers, also provide a value for the setting
  /// qvbrQualityLevelFineTune. For example, if you want your QVBR quality level
  /// to be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to
  /// .33.
  @_s.JsonKey(name: 'qvbrQualityLevel')
  final int qvbrQualityLevel;

  /// Optional. Specify a value here to set the QVBR quality to a level that is
  /// between whole numbers. For example, if you want your QVBR quality level to
  /// be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33.
  /// MediaConvert rounds your QVBR quality level to the nearest third of a whole
  /// number. For example, if you set qvbrQualityLevel to 7 and you set
  /// qvbrQualityLevelFineTune to .25, your actual QVBR quality level is 7.33.
  @_s.JsonKey(name: 'qvbrQualityLevelFineTune')
  final double qvbrQualityLevelFineTune;

  H265QvbrSettings({
    this.maxAverageBitrate,
    this.qvbrQualityLevel,
    this.qvbrQualityLevelFineTune,
  });
  factory H265QvbrSettings.fromJson(Map<String, dynamic> json) =>
      _$H265QvbrSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$H265QvbrSettingsToJson(this);
}

/// Use this setting to specify whether this output has a variable bitrate
/// (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
enum H265RateControlMode {
  @_s.JsonValue('VBR')
  vbr,
  @_s.JsonValue('CBR')
  cbr,
  @_s.JsonValue('QVBR')
  qvbr,
}

/// Specify Sample Adaptive Offset (SAO) filter strength.  Adaptive mode
/// dynamically selects best strength based on content
enum H265SampleAdaptiveOffsetFilterMode {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('ADAPTIVE')
  adaptive,
  @_s.JsonValue('OFF')
  off,
}

/// Enable this setting to insert I-frames at scene changes that the service
/// automatically detects. This improves video quality and is enabled by
/// default. If this output uses QVBR, choose Transition detection
/// (TRANSITION_DETECTION) for further video quality improvement. For more
/// information about QVBR, see
/// https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
enum H265SceneChangeDetect {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('TRANSITION_DETECTION')
  transitionDetection,
}

/// Settings for H265 codec
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class H265Settings {
  /// Specify the strength of any adaptive quantization filters that you enable.
  /// The value that you choose here applies to the following settings: Flicker
  /// adaptive quantization (flickerAdaptiveQuantization), Spatial adaptive
  /// quantization (spatialAdaptiveQuantization), and Temporal adaptive
  /// quantization (temporalAdaptiveQuantization).
  @_s.JsonKey(name: 'adaptiveQuantization')
  final H265AdaptiveQuantization adaptiveQuantization;

  /// Enables Alternate Transfer Function SEI message for outputs using Hybrid Log
  /// Gamma (HLG) Electro-Optical Transfer Function (EOTF).
  @_s.JsonKey(name: 'alternateTransferFunctionSei')
  final H265AlternateTransferFunctionSei alternateTransferFunctionSei;

  /// Specify the average bitrate in bits per second. Required for VBR and CBR.
  /// For MS Smooth outputs, bitrates must be unique when rounded down to the
  /// nearest multiple of 1000.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// H.265 Level.
  @_s.JsonKey(name: 'codecLevel')
  final H265CodecLevel codecLevel;

  /// Represents the Profile and Tier, per the HEVC (H.265) specification.
  /// Selections are grouped as [Profile] / [Tier], so "Main/High" represents Main
  /// Profile with High Tier. 4:2:2 profiles are only available with the HEVC
  /// 4:2:2 License.
  @_s.JsonKey(name: 'codecProfile')
  final H265CodecProfile codecProfile;

  /// Choose Adaptive to improve subjective video quality for high-motion content.
  /// This will cause the service to use fewer B-frames (which infer information
  /// based on other frames) for high-motion portions of the video and more
  /// B-frames for low-motion portions. The maximum number of B-frames is limited
  /// by the value you provide for the setting B frames between reference frames
  /// (numberBFramesBetweenReferenceFrames).
  @_s.JsonKey(name: 'dynamicSubGop')
  final H265DynamicSubGop dynamicSubGop;

  /// Enable this setting to have the encoder reduce I-frame pop. I-frame pop
  /// appears as a visual flicker that can arise when the encoder saves bits by
  /// copying some macroblocks many times from frame to frame, and then refreshes
  /// them at the I-frame. When you enable this setting, the encoder updates these
  /// macroblocks slightly more often to smooth out the flicker. This setting is
  /// disabled by default. Related setting: In addition to enabling this setting,
  /// you must also set adaptiveQuantization to a value other than Off (OFF).
  @_s.JsonKey(name: 'flickerAdaptiveQuantization')
  final H265FlickerAdaptiveQuantization flickerAdaptiveQuantization;

  /// If you are using the console, use the Framerate setting to specify the frame
  /// rate for this output. If you want to keep the same frame rate as the input
  /// video, choose Follow source. If you want to do frame rate conversion, choose
  /// a frame rate from the dropdown list or choose Custom. The framerates shown
  /// in the dropdown list are decimal approximations of fractions. If you choose
  /// Custom, specify your frame rate as a fraction. If you are creating your
  /// transcoding job specification as a JSON file without the console, use
  /// FramerateControl to specify which value the service uses for the frame rate
  /// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
  /// use the frame rate from the input. Choose SPECIFIED if you want the service
  /// to use the frame rate you specify in the settings FramerateNumerator and
  /// FramerateDenominator.
  @_s.JsonKey(name: 'framerateControl')
  final H265FramerateControl framerateControl;

  /// Choose the method that you want MediaConvert to use when increasing or
  /// decreasing the frame rate. We recommend using drop duplicate
  /// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
  /// fps. For numerically complex conversions, you can use interpolate
  /// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
  /// introduce undesirable video artifacts. For complex frame rate conversions,
  /// especially if your source video has already been converted from its original
  /// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
  /// interpolation. FrameFormer chooses the best conversion method frame by
  /// frame. Note that using FrameFormer increases the transcoding time and incurs
  /// a significant add-on cost.
  @_s.JsonKey(name: 'framerateConversionAlgorithm')
  final H265FramerateConversionAlgorithm framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// If enable, use reference B frames for GOP structures that have B frames > 1.
  @_s.JsonKey(name: 'gopBReference')
  final H265GopBReference gopBReference;

  /// Frequency of closed GOPs. In streaming applications, it is recommended that
  /// this be set to 1 so a decoder joining mid-stream will receive an IDR frame
  /// as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  @_s.JsonKey(name: 'gopClosedCadence')
  final int gopClosedCadence;

  /// GOP Length (keyframe interval) in frames or seconds. Must be greater than
  /// zero.
  @_s.JsonKey(name: 'gopSize')
  final double gopSize;

  /// Indicates if the GOP Size in H265 is specified in frames or seconds. If
  /// seconds the system will convert the GOP Size into a frame count at run time.
  @_s.JsonKey(name: 'gopSizeUnits')
  final H265GopSizeUnits gopSizeUnits;

  /// Percentage of the buffer that should initially be filled (HRD buffer model).
  @_s.JsonKey(name: 'hrdBufferInitialFillPercentage')
  final int hrdBufferInitialFillPercentage;

  /// Size of buffer (HRD buffer model) in bits. For example, enter five megabits
  /// as 5000000.
  @_s.JsonKey(name: 'hrdBufferSize')
  final int hrdBufferSize;

  /// Choose the scan line type for the output. Keep the default value,
  /// Progressive (PROGRESSIVE) to create a progressive output, regardless of the
  /// scan type of your input. Use Top field first (TOP_FIELD) or Bottom field
  /// first (BOTTOM_FIELD) to create an output that's interlaced with the same
  /// field polarity throughout. Use Follow, default top (FOLLOW_TOP_FIELD) or
  /// Follow, default bottom (FOLLOW_BOTTOM_FIELD) to produce outputs with the
  /// same field polarity as the source. For jobs that have multiple inputs, the
  /// output field polarity might change over the course of the output. Follow
  /// behavior depends on the input scan type. If the source is interlaced, the
  /// output will be interlaced with the same polarity as the source. If the
  /// source is progressive, the output will be interlaced with top field bottom
  /// field first, depending on which of the Follow options you choose.
  @_s.JsonKey(name: 'interlaceMode')
  final H265InterlaceMode interlaceMode;

  /// Maximum bitrate in bits/second. For example, enter five megabits per second
  /// as 5000000. Required when Rate control mode is QVBR.
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  /// Enforces separation between repeated (cadence) I-frames and I-frames
  /// inserted by Scene Change Detection. If a scene change I-frame is within
  /// I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched
  /// to the scene change I-frame. GOP stretch requires enabling lookahead as well
  /// as setting I-interval. The normal cadence resumes for the next GOP. This
  /// setting is only used when Scene Change Detect is enabled. Note: Maximum GOP
  /// stretch = GOP size + Min-I-interval - 1
  @_s.JsonKey(name: 'minIInterval')
  final int minIInterval;

  /// Number of B-frames between reference frames.
  @_s.JsonKey(name: 'numberBFramesBetweenReferenceFrames')
  final int numberBFramesBetweenReferenceFrames;

  /// Number of reference frames to use. The encoder may use more than requested
  /// if using B-frames and/or interlaced encoding.
  @_s.JsonKey(name: 'numberReferenceFrames')
  final int numberReferenceFrames;

  /// Optional. Specify how the service determines the pixel aspect ratio (PAR)
  /// for this output. The default behavior, Follow source
  /// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
  /// output. To specify a different PAR in the console, choose any value other
  /// than Follow source. To specify a different PAR by editing the JSON job
  /// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
  /// you must also specify values for the parNumerator and parDenominator
  /// settings.
  @_s.JsonKey(name: 'parControl')
  final H265ParControl parControl;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parDenominator is 33.
  @_s.JsonKey(name: 'parDenominator')
  final int parDenominator;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parNumerator is 40.
  @_s.JsonKey(name: 'parNumerator')
  final int parNumerator;

  /// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
  /// want to trade off encoding speed for output video quality. The default
  /// behavior is faster, lower quality, single-pass encoding.
  @_s.JsonKey(name: 'qualityTuningLevel')
  final H265QualityTuningLevel qualityTuningLevel;

  /// Settings for quality-defined variable bitrate encoding with the H.265 codec.
  /// Required when you set Rate control mode to QVBR. Not valid when you set Rate
  /// control mode to a value other than QVBR, or when you don't define Rate
  /// control mode.
  @_s.JsonKey(name: 'qvbrSettings')
  final H265QvbrSettings qvbrSettings;

  /// Use this setting to specify whether this output has a variable bitrate
  /// (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
  @_s.JsonKey(name: 'rateControlMode')
  final H265RateControlMode rateControlMode;

  /// Specify Sample Adaptive Offset (SAO) filter strength.  Adaptive mode
  /// dynamically selects best strength based on content
  @_s.JsonKey(name: 'sampleAdaptiveOffsetFilterMode')
  final H265SampleAdaptiveOffsetFilterMode sampleAdaptiveOffsetFilterMode;

  /// Enable this setting to insert I-frames at scene changes that the service
  /// automatically detects. This improves video quality and is enabled by
  /// default. If this output uses QVBR, choose Transition detection
  /// (TRANSITION_DETECTION) for further video quality improvement. For more
  /// information about QVBR, see
  /// https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
  @_s.JsonKey(name: 'sceneChangeDetect')
  final H265SceneChangeDetect sceneChangeDetect;

  /// Number of slices per picture. Must be less than or equal to the number of
  /// macroblock rows for progressive pictures, and less than or equal to half the
  /// number of macroblock rows for interlaced pictures.
  @_s.JsonKey(name: 'slices')
  final int slices;

  /// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
  /// second (fps). Enable slow PAL to create a 25 fps output. When you enable
  /// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
  /// your audio to keep it synchronized with the video. Note that enabling this
  /// setting will slightly reduce the duration of your video. Required settings:
  /// You must also set Framerate to 25. In your JSON job specification, set
  /// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
  /// (framerateDenominator) to 1.
  @_s.JsonKey(name: 'slowPal')
  final H265SlowPal slowPal;

  /// Keep the default value, Enabled (ENABLED), to adjust quantization within
  /// each frame based on spatial variation of content complexity. When you enable
  /// this feature, the encoder uses fewer bits on areas that can sustain more
  /// distortion with no noticeable visual degradation and uses more bits on areas
  /// where any small distortion will be noticeable. For example, complex textured
  /// blocks are encoded with fewer bits and smooth textured blocks are encoded
  /// with more bits. Enabling this feature will almost always improve your video
  /// quality. Note, though, that this feature doesn't take into account where the
  /// viewer's attention is likely to be. If viewers are likely to be focusing
  /// their attention on a part of the screen with a lot of complex texture, you
  /// might choose to disable this feature. Related setting: When you enable
  /// spatial adaptive quantization, set the value for Adaptive quantization
  /// (adaptiveQuantization) depending on your content. For homogeneous content,
  /// such as cartoons and video games, set it to Low. For content with a wider
  /// variety of textures, set it to High or Higher.
  @_s.JsonKey(name: 'spatialAdaptiveQuantization')
  final H265SpatialAdaptiveQuantization spatialAdaptiveQuantization;

  /// This field applies only if the Streams > Advanced > Framerate (framerate)
  /// field  is set to 29.970. This field works with the Streams > Advanced >
  /// Preprocessors > Deinterlacer  field (deinterlace_mode) and the Streams >
  /// Advanced > Interlaced Mode field (interlace_mode)  to identify the scan type
  /// for the output: Progressive, Interlaced, Hard Telecine or Soft Telecine. -
  /// Hard: produces 29.97i output from 23.976 input. - Soft: produces 23.976; the
  /// player converts this output to 29.97i.
  @_s.JsonKey(name: 'telecine')
  final H265Telecine telecine;

  /// Keep the default value, Enabled (ENABLED), to adjust quantization within
  /// each frame based on temporal variation of content complexity. When you
  /// enable this feature, the encoder uses fewer bits on areas of the frame that
  /// aren't moving and uses more bits on complex objects with sharp edges that
  /// move a lot. For example, this feature improves the readability of text
  /// tickers on newscasts and scoreboards on sports matches. Enabling this
  /// feature will almost always improve your video quality. Note, though, that
  /// this feature doesn't take into account where the viewer's attention is
  /// likely to be. If viewers are likely to be focusing their attention on a part
  /// of the screen that doesn't have moving objects with sharp edges, such as
  /// sports athletes' faces, you might choose to disable this feature. Related
  /// setting: When you enable temporal quantization, adjust the strength of the
  /// filter with the setting Adaptive quantization (adaptiveQuantization).
  @_s.JsonKey(name: 'temporalAdaptiveQuantization')
  final H265TemporalAdaptiveQuantization temporalAdaptiveQuantization;

  /// Enables temporal layer identifiers in the encoded bitstream. Up to 3 layers
  /// are supported depending on GOP structure: I- and P-frames form one layer,
  /// reference B-frames can form a second layer and non-reference b-frames can
  /// form a third layer. Decoders can optionally decode only the lower temporal
  /// layers to generate a lower frame rate output. For example, given a bitstream
  /// with temporal IDs and with b-frames = 1 (i.e. IbPbPb display order), a
  /// decoder could decode all the frames for full frame rate output or only the I
  /// and P frames (lowest temporal layer) for a half frame rate output.
  @_s.JsonKey(name: 'temporalIds')
  final H265TemporalIds temporalIds;

  /// Enable use of tiles, allowing horizontal as well as vertical subdivision of
  /// the encoded pictures.
  @_s.JsonKey(name: 'tiles')
  final H265Tiles tiles;

  /// Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
  @_s.JsonKey(name: 'unregisteredSeiTimecode')
  final H265UnregisteredSeiTimecode unregisteredSeiTimecode;

  /// If the location of parameter set NAL units doesn't matter in your workflow,
  /// ignore this setting. Use this setting only with CMAF or DASH outputs, or
  /// with standalone file outputs in an MPEG-4 container (MP4 outputs). Choose
  /// HVC1 to mark your output as HVC1. This makes your output compliant with the
  /// following specification: ISO IECJTC1 SC29 N13798 Text ISO/IEC FDIS 14496-15
  /// 3rd Edition. For these outputs, the service stores parameter set NAL units
  /// in the sample headers but not in the samples directly. For MP4 outputs, when
  /// you choose HVC1, your output video might not work properly with some
  /// downstream systems and video players. The service defaults to marking your
  /// output as HEV1. For these outputs, the service writes parameter set NAL
  /// units directly into the samples.
  @_s.JsonKey(name: 'writeMp4PackagingType')
  final H265WriteMp4PackagingType writeMp4PackagingType;

  H265Settings({
    this.adaptiveQuantization,
    this.alternateTransferFunctionSei,
    this.bitrate,
    this.codecLevel,
    this.codecProfile,
    this.dynamicSubGop,
    this.flickerAdaptiveQuantization,
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.gopBReference,
    this.gopClosedCadence,
    this.gopSize,
    this.gopSizeUnits,
    this.hrdBufferInitialFillPercentage,
    this.hrdBufferSize,
    this.interlaceMode,
    this.maxBitrate,
    this.minIInterval,
    this.numberBFramesBetweenReferenceFrames,
    this.numberReferenceFrames,
    this.parControl,
    this.parDenominator,
    this.parNumerator,
    this.qualityTuningLevel,
    this.qvbrSettings,
    this.rateControlMode,
    this.sampleAdaptiveOffsetFilterMode,
    this.sceneChangeDetect,
    this.slices,
    this.slowPal,
    this.spatialAdaptiveQuantization,
    this.telecine,
    this.temporalAdaptiveQuantization,
    this.temporalIds,
    this.tiles,
    this.unregisteredSeiTimecode,
    this.writeMp4PackagingType,
  });
  factory H265Settings.fromJson(Map<String, dynamic> json) =>
      _$H265SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$H265SettingsToJson(this);
}

/// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
/// second (fps). Enable slow PAL to create a 25 fps output. When you enable
/// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
/// your audio to keep it synchronized with the video. Note that enabling this
/// setting will slightly reduce the duration of your video. Required settings:
/// You must also set Framerate to 25. In your JSON job specification, set
/// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
/// (framerateDenominator) to 1.
enum H265SlowPal {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Keep the default value, Enabled (ENABLED), to adjust quantization within
/// each frame based on spatial variation of content complexity. When you enable
/// this feature, the encoder uses fewer bits on areas that can sustain more
/// distortion with no noticeable visual degradation and uses more bits on areas
/// where any small distortion will be noticeable. For example, complex textured
/// blocks are encoded with fewer bits and smooth textured blocks are encoded
/// with more bits. Enabling this feature will almost always improve your video
/// quality. Note, though, that this feature doesn't take into account where the
/// viewer's attention is likely to be. If viewers are likely to be focusing
/// their attention on a part of the screen with a lot of complex texture, you
/// might choose to disable this feature. Related setting: When you enable
/// spatial adaptive quantization, set the value for Adaptive quantization
/// (adaptiveQuantization) depending on your content. For homogeneous content,
/// such as cartoons and video games, set it to Low. For content with a wider
/// variety of textures, set it to High or Higher.
enum H265SpatialAdaptiveQuantization {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// This field applies only if the Streams > Advanced > Framerate (framerate)
/// field  is set to 29.970. This field works with the Streams > Advanced >
/// Preprocessors > Deinterlacer  field (deinterlace_mode) and the Streams >
/// Advanced > Interlaced Mode field (interlace_mode)  to identify the scan type
/// for the output: Progressive, Interlaced, Hard Telecine or Soft Telecine. -
/// Hard: produces 29.97i output from 23.976 input. - Soft: produces 23.976; the
/// player converts this output to 29.97i.
enum H265Telecine {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('SOFT')
  soft,
  @_s.JsonValue('HARD')
  hard,
}

/// Keep the default value, Enabled (ENABLED), to adjust quantization within
/// each frame based on temporal variation of content complexity. When you
/// enable this feature, the encoder uses fewer bits on areas of the frame that
/// aren't moving and uses more bits on complex objects with sharp edges that
/// move a lot. For example, this feature improves the readability of text
/// tickers on newscasts and scoreboards on sports matches. Enabling this
/// feature will almost always improve your video quality. Note, though, that
/// this feature doesn't take into account where the viewer's attention is
/// likely to be. If viewers are likely to be focusing their attention on a part
/// of the screen that doesn't have moving objects with sharp edges, such as
/// sports athletes' faces, you might choose to disable this feature. Related
/// setting: When you enable temporal quantization, adjust the strength of the
/// filter with the setting Adaptive quantization (adaptiveQuantization).
enum H265TemporalAdaptiveQuantization {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Enables temporal layer identifiers in the encoded bitstream. Up to 3 layers
/// are supported depending on GOP structure: I- and P-frames form one layer,
/// reference B-frames can form a second layer and non-reference b-frames can
/// form a third layer. Decoders can optionally decode only the lower temporal
/// layers to generate a lower frame rate output. For example, given a bitstream
/// with temporal IDs and with b-frames = 1 (i.e. IbPbPb display order), a
/// decoder could decode all the frames for full frame rate output or only the I
/// and P frames (lowest temporal layer) for a half frame rate output.
enum H265TemporalIds {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Enable use of tiles, allowing horizontal as well as vertical subdivision of
/// the encoded pictures.
enum H265Tiles {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
enum H265UnregisteredSeiTimecode {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// If the location of parameter set NAL units doesn't matter in your workflow,
/// ignore this setting. Use this setting only with CMAF or DASH outputs, or
/// with standalone file outputs in an MPEG-4 container (MP4 outputs). Choose
/// HVC1 to mark your output as HVC1. This makes your output compliant with the
/// following specification: ISO IECJTC1 SC29 N13798 Text ISO/IEC FDIS 14496-15
/// 3rd Edition. For these outputs, the service stores parameter set NAL units
/// in the sample headers but not in the samples directly. For MP4 outputs, when
/// you choose HVC1, your output video might not work properly with some
/// downstream systems and video players. The service defaults to marking your
/// output as HEV1. For these outputs, the service writes parameter set NAL
/// units directly into the samples.
enum H265WriteMp4PackagingType {
  @_s.JsonValue('HVC1')
  hvc1,
  @_s.JsonValue('HEV1')
  hev1,
}

/// Use these settings to specify static color calibration metadata, as defined
/// by SMPTE ST 2086. These values don't affect the pixel values that are
/// encoded in the video stream. They are intended to help the downstream video
/// player display content in a way that reflects the intentions of the the
/// content creator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Hdr10Metadata {
  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  @_s.JsonKey(name: 'bluePrimaryX')
  final int bluePrimaryX;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  @_s.JsonKey(name: 'bluePrimaryY')
  final int bluePrimaryY;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  @_s.JsonKey(name: 'greenPrimaryX')
  final int greenPrimaryX;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  @_s.JsonKey(name: 'greenPrimaryY')
  final int greenPrimaryY;

  /// Maximum light level among all samples in the coded video sequence, in units
  /// of candelas per square meter.  This setting doesn't have a default value;
  /// you must specify a value that is suitable for the content.
  @_s.JsonKey(name: 'maxContentLightLevel')
  final int maxContentLightLevel;

  /// Maximum average light level of any frame in the coded video sequence, in
  /// units of candelas per square meter. This setting doesn't have a default
  /// value; you must specify a value that is suitable for the content.
  @_s.JsonKey(name: 'maxFrameAverageLightLevel')
  final int maxFrameAverageLightLevel;

  /// Nominal maximum mastering display luminance in units of of 0.0001 candelas
  /// per square meter.
  @_s.JsonKey(name: 'maxLuminance')
  final int maxLuminance;

  /// Nominal minimum mastering display luminance in units of of 0.0001 candelas
  /// per square meter
  @_s.JsonKey(name: 'minLuminance')
  final int minLuminance;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  @_s.JsonKey(name: 'redPrimaryX')
  final int redPrimaryX;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  @_s.JsonKey(name: 'redPrimaryY')
  final int redPrimaryY;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  @_s.JsonKey(name: 'whitePointX')
  final int whitePointX;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  @_s.JsonKey(name: 'whitePointY')
  final int whitePointY;

  Hdr10Metadata({
    this.bluePrimaryX,
    this.bluePrimaryY,
    this.greenPrimaryX,
    this.greenPrimaryY,
    this.maxContentLightLevel,
    this.maxFrameAverageLightLevel,
    this.maxLuminance,
    this.minLuminance,
    this.redPrimaryX,
    this.redPrimaryY,
    this.whitePointX,
    this.whitePointY,
  });
  factory Hdr10Metadata.fromJson(Map<String, dynamic> json) =>
      _$Hdr10MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$Hdr10MetadataToJson(this);
}

enum HlsAdMarkers {
  @_s.JsonValue('ELEMENTAL')
  elemental,
  @_s.JsonValue('ELEMENTAL_SCTE35')
  elementalScte35,
}

/// Specify the details for each additional HLS manifest that you want the
/// service to generate for this output group. Each manifest can reference a
/// different subset of outputs in the group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsAdditionalManifest {
  /// Specify a name modifier that the service adds to the name of this manifest
  /// to make it different from the file names of the other main manifests in the
  /// output group. For example, say that the default main manifest for your HLS
  /// group is film-name.m3u8. If you enter "-no-premium" for this setting, then
  /// the file name the service generates for this top-level manifest is
  /// film-name-no-premium.m3u8. For HLS output groups, specify a
  /// manifestNameModifier that is different from the nameModifier of the output.
  /// The service uses the output name modifier to create unique names for the
  /// individual variant manifests.
  @_s.JsonKey(name: 'manifestNameModifier')
  final String manifestNameModifier;

  /// Specify the outputs that you want this additional top-level manifest to
  /// reference.
  @_s.JsonKey(name: 'selectedOutputs')
  final List<String> selectedOutputs;

  HlsAdditionalManifest({
    this.manifestNameModifier,
    this.selectedOutputs,
  });
  factory HlsAdditionalManifest.fromJson(Map<String, dynamic> json) =>
      _$HlsAdditionalManifestFromJson(json);

  Map<String, dynamic> toJson() => _$HlsAdditionalManifestToJson(this);
}

/// Use this setting only in audio-only outputs. Choose MPEG-2 Transport Stream
/// (M2TS) to create a file in an MPEG2-TS container. Keep the default value
/// Automatic (AUTOMATIC) to create a raw audio-only file with no container.
/// Regardless of the value that you specify here, if this output has video, the
/// service will place outputs into an MPEG2-TS container.
enum HlsAudioOnlyContainer {
  @_s.JsonValue('AUTOMATIC')
  automatic,
  @_s.JsonValue('M2TS')
  m2ts,
}

/// Ignore this setting unless you are using FairPlay DRM with Verimatrix and
/// you encounter playback issues. Keep the default value, Include (INCLUDE), to
/// output audio-only headers. Choose Exclude (EXCLUDE) to remove the audio-only
/// headers from your audio segments.
enum HlsAudioOnlyHeader {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// Four types of audio-only tracks are supported: Audio-Only Variant Stream The
/// client can play back this audio-only stream instead of video in
/// low-bandwidth scenarios. Represented as an EXT-X-STREAM-INF in the HLS
/// manifest. Alternate Audio, Auto Select, Default Alternate rendition that the
/// client should try to play back by default. Represented as an EXT-X-MEDIA in
/// the HLS manifest with DEFAULT=YES, AUTOSELECT=YES Alternate Audio, Auto
/// Select, Not Default Alternate rendition that the client may try to play back
/// by default. Represented as an EXT-X-MEDIA in the HLS manifest with
/// DEFAULT=NO, AUTOSELECT=YES Alternate Audio, not Auto Select Alternate
/// rendition that the client will not try to play back by default. Represented
/// as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO, AUTOSELECT=NO
enum HlsAudioTrackType {
  @_s.JsonValue('ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT')
  alternateAudioAutoSelectDefault,
  @_s.JsonValue('ALTERNATE_AUDIO_AUTO_SELECT')
  alternateAudioAutoSelect,
  @_s.JsonValue('ALTERNATE_AUDIO_NOT_AUTO_SELECT')
  alternateAudioNotAutoSelect,
  @_s.JsonValue('AUDIO_ONLY_VARIANT_STREAM')
  audioOnlyVariantStream,
}

/// Caption Language Mapping
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsCaptionLanguageMapping {
  /// Caption channel.
  @_s.JsonKey(name: 'captionChannel')
  final int captionChannel;

  /// Specify the language for this captions channel, using the ISO 639-2 or ISO
  /// 639-3 three-letter language code
  @_s.JsonKey(name: 'customLanguageCode')
  final String customLanguageCode;

  /// Specify the language, using the ISO 639-2 three-letter code listed at
  /// https://www.loc.gov/standards/iso639-2/php/code_list.php.
  @_s.JsonKey(name: 'languageCode')
  final LanguageCode languageCode;

  /// Caption language description.
  @_s.JsonKey(name: 'languageDescription')
  final String languageDescription;

  HlsCaptionLanguageMapping({
    this.captionChannel,
    this.customLanguageCode,
    this.languageCode,
    this.languageDescription,
  });
  factory HlsCaptionLanguageMapping.fromJson(Map<String, dynamic> json) =>
      _$HlsCaptionLanguageMappingFromJson(json);

  Map<String, dynamic> toJson() => _$HlsCaptionLanguageMappingToJson(this);
}

/// Applies only to 608 Embedded output captions. Insert: Include
/// CLOSED-CAPTIONS lines in the manifest. Specify at least one language in the
/// CC1 Language Code field. One CLOSED-CAPTION line is added for each Language
/// Code you specify. Make sure to specify the languages in the order in which
/// they appear in the original source (if the source is embedded format) or the
/// order of the caption selectors (if the source is other than embedded).
/// Otherwise, languages in the manifest will not match up properly with the
/// output captions. None: Include CLOSED-CAPTIONS=NONE line in the manifest.
/// Omit: Omit any CLOSED-CAPTIONS line from the manifest.
enum HlsCaptionLanguageSetting {
  @_s.JsonValue('INSERT')
  insert,
  @_s.JsonValue('OMIT')
  omit,
  @_s.JsonValue('NONE')
  none,
}

/// Disable this setting only when your workflow requires the
/// #EXT-X-ALLOW-CACHE:no tag. Otherwise, keep the default value Enabled
/// (ENABLED) and control caching in your video distribution set up. For
/// example, use the Cache-Control http header.
enum HlsClientCache {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist
/// generation.
enum HlsCodecSpecification {
  @_s.JsonValue('RFC_6381')
  rfc_6381,
  @_s.JsonValue('RFC_4281')
  rfc_4281,
}

/// Indicates whether segments should be placed in subdirectories.
enum HlsDirectoryStructure {
  @_s.JsonValue('SINGLE_DIRECTORY')
  singleDirectory,
  @_s.JsonValue('SUBDIRECTORY_PER_STREAM')
  subdirectoryPerStream,
}

/// Settings for HLS encryption
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsEncryptionSettings {
  /// This is a 128-bit, 16-byte hex value represented by a 32-character text
  /// string. If this parameter is not set then the Initialization Vector will
  /// follow the segment number by default.
  @_s.JsonKey(name: 'constantInitializationVector')
  final String constantInitializationVector;

  /// Encrypts the segments with the given encryption scheme. Leave blank to
  /// disable. Selecting 'Disabled' in the web interface also disables encryption.
  @_s.JsonKey(name: 'encryptionMethod')
  final HlsEncryptionType encryptionMethod;

  /// The Initialization Vector is a 128-bit number used in conjunction with the
  /// key for encrypting blocks. If set to INCLUDE, Initialization Vector is
  /// listed in the manifest. Otherwise Initialization Vector is not in the
  /// manifest.
  @_s.JsonKey(name: 'initializationVectorInManifest')
  final HlsInitializationVectorInManifest initializationVectorInManifest;

  /// Enable this setting to insert the EXT-X-SESSION-KEY element into the master
  /// playlist. This allows for offline Apple HLS FairPlay content protection.
  @_s.JsonKey(name: 'offlineEncrypted')
  final HlsOfflineEncrypted offlineEncrypted;

  /// If your output group type is HLS, DASH, or Microsoft Smooth, use these
  /// settings when doing DRM encryption with a SPEKE-compliant key provider.  If
  /// your output group type is CMAF, use the SpekeKeyProviderCmaf settings
  /// instead.
  @_s.JsonKey(name: 'spekeKeyProvider')
  final SpekeKeyProvider spekeKeyProvider;

  /// Use these settings to set up encryption with a static key provider.
  @_s.JsonKey(name: 'staticKeyProvider')
  final StaticKeyProvider staticKeyProvider;

  /// Specify whether your DRM encryption key is static or from a key provider
  /// that follows the SPEKE standard. For more information about SPEKE, see
  /// https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
  @_s.JsonKey(name: 'type')
  final HlsKeyProviderType type;

  HlsEncryptionSettings({
    this.constantInitializationVector,
    this.encryptionMethod,
    this.initializationVectorInManifest,
    this.offlineEncrypted,
    this.spekeKeyProvider,
    this.staticKeyProvider,
    this.type,
  });
  factory HlsEncryptionSettings.fromJson(Map<String, dynamic> json) =>
      _$HlsEncryptionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HlsEncryptionSettingsToJson(this);
}

/// Encrypts the segments with the given encryption scheme. Leave blank to
/// disable. Selecting 'Disabled' in the web interface also disables encryption.
enum HlsEncryptionType {
  @_s.JsonValue('AES128')
  aes128,
  @_s.JsonValue('SAMPLE_AES')
  sampleAes,
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// HLS_GROUP_SETTINGS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsGroupSettings {
  /// Choose one or more ad marker types to decorate your Apple HLS manifest. This
  /// setting does not determine whether SCTE-35 markers appear in the outputs
  /// themselves.
  @_s.JsonKey(name: 'adMarkers')
  final List<HlsAdMarkers> adMarkers;

  /// By default, the service creates one top-level .m3u8 HLS manifest for each
  /// HLS output group in your job. This default manifest references every output
  /// in the output group. To create additional top-level manifests that reference
  /// a subset of the outputs in the output group, specify a list of them here.
  @_s.JsonKey(name: 'additionalManifests')
  final List<HlsAdditionalManifest> additionalManifests;

  /// Ignore this setting unless you are using FairPlay DRM with Verimatrix and
  /// you encounter playback issues. Keep the default value, Include (INCLUDE), to
  /// output audio-only headers. Choose Exclude (EXCLUDE) to remove the audio-only
  /// headers from your audio segments.
  @_s.JsonKey(name: 'audioOnlyHeader')
  final HlsAudioOnlyHeader audioOnlyHeader;

  /// A partial URI prefix that will be prepended to each output in the media
  /// .m3u8 file. Can be used if base manifest is delivered from a different URL
  /// than the main .m3u8 file.
  @_s.JsonKey(name: 'baseUrl')
  final String baseUrl;

  /// Language to be used on Caption outputs
  @_s.JsonKey(name: 'captionLanguageMappings')
  final List<HlsCaptionLanguageMapping> captionLanguageMappings;

  /// Applies only to 608 Embedded output captions. Insert: Include
  /// CLOSED-CAPTIONS lines in the manifest. Specify at least one language in the
  /// CC1 Language Code field. One CLOSED-CAPTION line is added for each Language
  /// Code you specify. Make sure to specify the languages in the order in which
  /// they appear in the original source (if the source is embedded format) or the
  /// order of the caption selectors (if the source is other than embedded).
  /// Otherwise, languages in the manifest will not match up properly with the
  /// output captions. None: Include CLOSED-CAPTIONS=NONE line in the manifest.
  /// Omit: Omit any CLOSED-CAPTIONS line from the manifest.
  @_s.JsonKey(name: 'captionLanguageSetting')
  final HlsCaptionLanguageSetting captionLanguageSetting;

  /// Disable this setting only when your workflow requires the
  /// #EXT-X-ALLOW-CACHE:no tag. Otherwise, keep the default value Enabled
  /// (ENABLED) and control caching in your video distribution set up. For
  /// example, use the Cache-Control http header.
  @_s.JsonKey(name: 'clientCache')
  final HlsClientCache clientCache;

  /// Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist
  /// generation.
  @_s.JsonKey(name: 'codecSpecification')
  final HlsCodecSpecification codecSpecification;

  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do not
  /// specify the base filename in the URI, the service will use the filename of
  /// the input file. If your job has multiple inputs, the service uses the
  /// filename of the first input file.
  @_s.JsonKey(name: 'destination')
  final String destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  @_s.JsonKey(name: 'destinationSettings')
  final DestinationSettings destinationSettings;

  /// Indicates whether segments should be placed in subdirectories.
  @_s.JsonKey(name: 'directoryStructure')
  final HlsDirectoryStructure directoryStructure;

  /// DRM settings.
  @_s.JsonKey(name: 'encryption')
  final HlsEncryptionSettings encryption;

  /// When set to GZIP, compresses HLS playlist.
  @_s.JsonKey(name: 'manifestCompression')
  final HlsManifestCompression manifestCompression;

  /// Indicates whether the output manifest should use floating point values for
  /// segment duration.
  @_s.JsonKey(name: 'manifestDurationFormat')
  final HlsManifestDurationFormat manifestDurationFormat;

  /// Keep this setting at the default value of 0, unless you are troubleshooting
  /// a problem with how devices play back the end of your video asset. If you
  /// know that player devices are hanging on the final segment of your video
  /// because the length of your final segment is too short, use this setting to
  /// specify a minimum final segment length, in seconds. Choose a value that is
  /// greater than or equal to 1 and less than your segment length. When you
  /// specify a value for this setting, the encoder will combine any final segment
  /// that is shorter than the length that you specify with the previous segment.
  /// For example, your segment length is 3 seconds and your final segment is .5
  /// seconds without a minimum final segment length; when you set the minimum
  /// final segment length to 1, your final segment is 3.5 seconds.
  @_s.JsonKey(name: 'minFinalSegmentLength')
  final double minFinalSegmentLength;

  /// When set, Minimum Segment Size is enforced by looking ahead and back within
  /// the specified range for a nearby avail and extending the segment size if
  /// needed.
  @_s.JsonKey(name: 'minSegmentLength')
  final int minSegmentLength;

  /// Indicates whether the .m3u8 manifest file should be generated for this HLS
  /// output group.
  @_s.JsonKey(name: 'outputSelection')
  final HlsOutputSelection outputSelection;

  /// Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files.
  /// The value is calculated as follows: either the program date and time are
  /// initialized using the input timecode source, or the time is initialized
  /// using the input timecode source and the date is initialized using the
  /// timestamp_offset.
  @_s.JsonKey(name: 'programDateTime')
  final HlsProgramDateTime programDateTime;

  /// Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.
  @_s.JsonKey(name: 'programDateTimePeriod')
  final int programDateTimePeriod;

  /// When set to SINGLE_FILE, emits program as a single media resource (.ts)
  /// file, uses #EXT-X-BYTERANGE tags to index segment for playback.
  @_s.JsonKey(name: 'segmentControl')
  final HlsSegmentControl segmentControl;

  /// Length of MPEG-2 Transport Stream segments to create (in seconds). Note that
  /// segments will end on the next keyframe after this number of seconds, so
  /// actual segment length may be longer.
  @_s.JsonKey(name: 'segmentLength')
  final int segmentLength;

  /// Number of segments to write to a subdirectory before starting a new one.
  /// directoryStructure must be SINGLE_DIRECTORY for this setting to have an
  /// effect.
  @_s.JsonKey(name: 'segmentsPerSubdirectory')
  final int segmentsPerSubdirectory;

  /// Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of
  /// variant manifest.
  @_s.JsonKey(name: 'streamInfResolution')
  final HlsStreamInfResolution streamInfResolution;

  /// Indicates ID3 frame that has the timecode.
  @_s.JsonKey(name: 'timedMetadataId3Frame')
  final HlsTimedMetadataId3Frame timedMetadataId3Frame;

  /// Timed Metadata interval in seconds.
  @_s.JsonKey(name: 'timedMetadataId3Period')
  final int timedMetadataId3Period;

  /// Provides an extra millisecond delta offset to fine tune the timestamps.
  @_s.JsonKey(name: 'timestampDeltaMilliseconds')
  final int timestampDeltaMilliseconds;

  HlsGroupSettings({
    this.adMarkers,
    this.additionalManifests,
    this.audioOnlyHeader,
    this.baseUrl,
    this.captionLanguageMappings,
    this.captionLanguageSetting,
    this.clientCache,
    this.codecSpecification,
    this.destination,
    this.destinationSettings,
    this.directoryStructure,
    this.encryption,
    this.manifestCompression,
    this.manifestDurationFormat,
    this.minFinalSegmentLength,
    this.minSegmentLength,
    this.outputSelection,
    this.programDateTime,
    this.programDateTimePeriod,
    this.segmentControl,
    this.segmentLength,
    this.segmentsPerSubdirectory,
    this.streamInfResolution,
    this.timedMetadataId3Frame,
    this.timedMetadataId3Period,
    this.timestampDeltaMilliseconds,
  });
  factory HlsGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$HlsGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HlsGroupSettingsToJson(this);
}

/// When set to INCLUDE, writes I-Frame Only Manifest in addition to the HLS
/// manifest
enum HlsIFrameOnlyManifest {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// The Initialization Vector is a 128-bit number used in conjunction with the
/// key for encrypting blocks. If set to INCLUDE, Initialization Vector is
/// listed in the manifest. Otherwise Initialization Vector is not in the
/// manifest.
enum HlsInitializationVectorInManifest {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// Specify whether your DRM encryption key is static or from a key provider
/// that follows the SPEKE standard. For more information about SPEKE, see
/// https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
enum HlsKeyProviderType {
  @_s.JsonValue('SPEKE')
  speke,
  @_s.JsonValue('STATIC_KEY')
  staticKey,
}

/// When set to GZIP, compresses HLS playlist.
enum HlsManifestCompression {
  @_s.JsonValue('GZIP')
  gzip,
  @_s.JsonValue('NONE')
  none,
}

/// Indicates whether the output manifest should use floating point values for
/// segment duration.
enum HlsManifestDurationFormat {
  @_s.JsonValue('FLOATING_POINT')
  floatingPoint,
  @_s.JsonValue('INTEGER')
  integer,
}

/// Enable this setting to insert the EXT-X-SESSION-KEY element into the master
/// playlist. This allows for offline Apple HLS FairPlay content protection.
enum HlsOfflineEncrypted {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Indicates whether the .m3u8 manifest file should be generated for this HLS
/// output group.
enum HlsOutputSelection {
  @_s.JsonValue('MANIFESTS_AND_SEGMENTS')
  manifestsAndSegments,
  @_s.JsonValue('SEGMENTS_ONLY')
  segmentsOnly,
}

/// Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files.
/// The value is calculated as follows: either the program date and time are
/// initialized using the input timecode source, or the time is initialized
/// using the input timecode source and the date is initialized using the
/// timestamp_offset.
enum HlsProgramDateTime {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// When set to SINGLE_FILE, emits program as a single media resource (.ts)
/// file, uses #EXT-X-BYTERANGE tags to index segment for playback.
enum HlsSegmentControl {
  @_s.JsonValue('SINGLE_FILE')
  singleFile,
  @_s.JsonValue('SEGMENTED_FILES')
  segmentedFiles,
}

/// Settings for HLS output groups
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsSettings {
  /// Specifies the group to which the audio Rendition belongs.
  @_s.JsonKey(name: 'audioGroupId')
  final String audioGroupId;

  /// Use this setting only in audio-only outputs. Choose MPEG-2 Transport Stream
  /// (M2TS) to create a file in an MPEG2-TS container. Keep the default value
  /// Automatic (AUTOMATIC) to create an audio-only file in a raw container.
  /// Regardless of the value that you specify here, if this output has video, the
  /// service will place the output into an MPEG2-TS container.
  @_s.JsonKey(name: 'audioOnlyContainer')
  final HlsAudioOnlyContainer audioOnlyContainer;

  /// List all the audio groups that are used with the video output stream. Input
  /// all the audio GROUP-IDs that are associated to the video, separate by ','.
  @_s.JsonKey(name: 'audioRenditionSets')
  final String audioRenditionSets;

  /// Four types of audio-only tracks are supported: Audio-Only Variant Stream The
  /// client can play back this audio-only stream instead of video in
  /// low-bandwidth scenarios. Represented as an EXT-X-STREAM-INF in the HLS
  /// manifest. Alternate Audio, Auto Select, Default Alternate rendition that the
  /// client should try to play back by default. Represented as an EXT-X-MEDIA in
  /// the HLS manifest with DEFAULT=YES, AUTOSELECT=YES Alternate Audio, Auto
  /// Select, Not Default Alternate rendition that the client may try to play back
  /// by default. Represented as an EXT-X-MEDIA in the HLS manifest with
  /// DEFAULT=NO, AUTOSELECT=YES Alternate Audio, not Auto Select Alternate
  /// rendition that the client will not try to play back by default. Represented
  /// as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO, AUTOSELECT=NO
  @_s.JsonKey(name: 'audioTrackType')
  final HlsAudioTrackType audioTrackType;

  /// When set to INCLUDE, writes I-Frame Only Manifest in addition to the HLS
  /// manifest
  @_s.JsonKey(name: 'iFrameOnlyManifest')
  final HlsIFrameOnlyManifest iFrameOnlyManifest;

  /// Use this setting to add an identifying string to the filename of each
  /// segment. The service adds this string between the name modifier and segment
  /// index number. You can use format identifiers in the string. For more
  /// information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/using-variables-in-your-job-settings.html
  @_s.JsonKey(name: 'segmentModifier')
  final String segmentModifier;

  HlsSettings({
    this.audioGroupId,
    this.audioOnlyContainer,
    this.audioRenditionSets,
    this.audioTrackType,
    this.iFrameOnlyManifest,
    this.segmentModifier,
  });
  factory HlsSettings.fromJson(Map<String, dynamic> json) =>
      _$HlsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HlsSettingsToJson(this);
}

/// Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of
/// variant manifest.
enum HlsStreamInfResolution {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// Indicates ID3 frame that has the timecode.
enum HlsTimedMetadataId3Frame {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('PRIV')
  priv,
  @_s.JsonValue('TDRL')
  tdrl,
}

/// Optional. Configuration for a destination queue to which the job can hop
/// once a customer-defined minimum wait time has passed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HopDestination {
  /// Optional. When you set up a job to use queue hopping, you can specify a
  /// different relative priority for the job in the destination queue. If you
  /// don't specify, the relative priority will remain the same as in the previous
  /// queue.
  @_s.JsonKey(name: 'priority')
  final int priority;

  /// Optional unless the job is submitted on the default queue. When you set up a
  /// job to use queue hopping, you can specify a destination queue. This queue
  /// cannot be the original queue to which the job is submitted. If the original
  /// queue isn't the default queue and you don't specify the destination queue,
  /// the job will move to the default queue.
  @_s.JsonKey(name: 'queue')
  final String queue;

  /// Required for setting up a job to use queue hopping. Minimum wait time in
  /// minutes until the job can hop to the destination queue. Valid range is 1 to
  /// 1440 minutes, inclusive.
  @_s.JsonKey(name: 'waitMinutes')
  final int waitMinutes;

  HopDestination({
    this.priority,
    this.queue,
    this.waitMinutes,
  });
  factory HopDestination.fromJson(Map<String, dynamic> json) =>
      _$HopDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$HopDestinationToJson(this);
}

/// To insert ID3 tags in your output, specify two values. Use ID3 tag (Id3) to
/// specify the base 64 encoded string and use Timecode (TimeCode) to specify
/// the time when the tag should be inserted. To insert multiple ID3 tags in
/// your output, create multiple instances of ID3 insertion (Id3Insertion).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Id3Insertion {
  /// Use ID3 tag (Id3) to provide a tag value in base64-encode format.
  @_s.JsonKey(name: 'id3')
  final String id3;

  /// Provide a Timecode (TimeCode) in HH:MM:SS:FF or HH:MM:SS;FF format.
  @_s.JsonKey(name: 'timecode')
  final String timecode;

  Id3Insertion({
    this.id3,
    this.timecode,
  });
  factory Id3Insertion.fromJson(Map<String, dynamic> json) =>
      _$Id3InsertionFromJson(json);

  Map<String, dynamic> toJson() => _$Id3InsertionToJson(this);
}

/// Enable the image inserter feature to include a graphic overlay on your
/// video. Enable or disable this feature for each input or output individually.
/// This setting is disabled by default.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ImageInserter {
  /// Specify the images that you want to overlay on your video. The images must
  /// be PNG or TGA files.
  @_s.JsonKey(name: 'insertableImages')
  final List<InsertableImage> insertableImages;

  ImageInserter({
    this.insertableImages,
  });
  factory ImageInserter.fromJson(Map<String, dynamic> json) =>
      _$ImageInserterFromJson(json);

  Map<String, dynamic> toJson() => _$ImageInserterToJson(this);
}

/// Settings specific to IMSC caption outputs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ImscDestinationSettings {
  /// Keep this setting enabled to have MediaConvert use the font style and
  /// position information from the captions source in the output. This option is
  /// available only when your input captions are IMSC, SMPTE-TT, or TTML. Disable
  /// this setting for simplified output captions.
  @_s.JsonKey(name: 'stylePassthrough')
  final ImscStylePassthrough stylePassthrough;

  ImscDestinationSettings({
    this.stylePassthrough,
  });
  factory ImscDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$ImscDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ImscDestinationSettingsToJson(this);
}

/// Keep this setting enabled to have MediaConvert use the font style and
/// position information from the captions source in the output. This option is
/// available only when your input captions are IMSC, SMPTE-TT, or TTML. Disable
/// this setting for simplified output captions.
enum ImscStylePassthrough {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Specifies media input
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Input {
  /// Specifies set of audio selectors within an input to combine. An input may
  /// have multiple audio selector groups. See "Audio Selector
  /// Group":#inputs-audio_selector_group for more information.
  @_s.JsonKey(name: 'audioSelectorGroups')
  final Map<String, AudioSelectorGroup> audioSelectorGroups;

  /// Use Audio selectors (AudioSelectors) to specify a track or set of tracks
  /// from the input that you will use in your outputs. You can use multiple Audio
  /// selectors per input.
  @_s.JsonKey(name: 'audioSelectors')
  final Map<String, AudioSelector> audioSelectors;

  /// Use captions selectors to specify the captions data from your input that you
  /// use in your outputs. You can use up to 20 captions selectors per input.
  @_s.JsonKey(name: 'captionSelectors')
  final Map<String, CaptionSelector> captionSelectors;

  /// Use Cropping selection (crop) to specify the video area that the service
  /// will include in the output video frame. If you specify a value here, it will
  /// override any value that you specify in the output setting Cropping selection
  /// (crop).
  @_s.JsonKey(name: 'crop')
  final Rectangle crop;

  /// Enable Deblock (InputDeblockFilter) to produce smoother motion in the
  /// output. Default is disabled. Only manually controllable for MPEG2 and
  /// uncompressed video inputs.
  @_s.JsonKey(name: 'deblockFilter')
  final InputDeblockFilter deblockFilter;

  /// Settings for decrypting any input files that you encrypt before you upload
  /// them to Amazon S3. MediaConvert can decrypt files only when you use AWS Key
  /// Management Service (KMS) to encrypt the data key that you use to encrypt
  /// your content.
  @_s.JsonKey(name: 'decryptionSettings')
  final InputDecryptionSettings decryptionSettings;

  /// Enable Denoise (InputDenoiseFilter) to filter noise from the input.  Default
  /// is disabled. Only applicable to MPEG2, H.264, H.265, and uncompressed video
  /// inputs.
  @_s.JsonKey(name: 'denoiseFilter')
  final InputDenoiseFilter denoiseFilter;

  /// Specify the source file for your transcoding job. You can use multiple
  /// inputs in a single job. The service concatenates these inputs, in the order
  /// that you specify them in the job, to create the outputs. If your input
  /// format is IMF, specify your input by providing the path to your CPL. For
  /// example, "s3://bucket/vf/cpl.xml". If the CPL is in an incomplete IMP, make
  /// sure to use *Supplemental IMPs* (SupplementalImps) to specify any
  /// supplemental IMPs that contain assets referenced by the CPL.
  @_s.JsonKey(name: 'fileInput')
  final String fileInput;

  /// Specify how the transcoding service applies the denoise and deblock filters.
  /// You must also enable the filters separately, with Denoise
  /// (InputDenoiseFilter) and Deblock (InputDeblockFilter). * Auto - The
  /// transcoding service determines whether to apply filtering, depending on
  /// input type and quality. * Disable - The input is not filtered. This is true
  /// even if you use the API to enable them in (InputDeblockFilter) and
  /// (InputDeblockFilter). * Force - The input is filtered regardless of input
  /// type.
  @_s.JsonKey(name: 'filterEnable')
  final InputFilterEnable filterEnable;

  /// Use Filter strength (FilterStrength) to adjust the magnitude the input
  /// filter settings (Deblock and Denoise). The range is -5 to 5. Default is 0.
  @_s.JsonKey(name: 'filterStrength')
  final int filterStrength;

  /// Enable the image inserter feature to include a graphic overlay on your
  /// video. Enable or disable this feature for each input individually. This
  /// setting is disabled by default.
  @_s.JsonKey(name: 'imageInserter')
  final ImageInserter imageInserter;

  /// (InputClippings) contains sets of start and end times that together specify
  /// a portion of the input to be used in the outputs. If you provide only a
  /// start time, the clip will be the entire input from that point to the end. If
  /// you provide only an end time, it will be the entire input up to that point.
  /// When you specify more than one input clip, the transcoding service creates
  /// the job outputs by stringing the clips together in the order you specify
  /// them.
  @_s.JsonKey(name: 'inputClippings')
  final List<InputClipping> inputClippings;

  /// When you have a progressive segmented frame (PsF) input, use this setting to
  /// flag the input as PsF. MediaConvert doesn't automatically detect PsF.
  /// Therefore, flagging your input as PsF results in better preservation of
  /// video quality when you do deinterlacing and frame rate conversion. If you
  /// don't specify, the default value is Auto (AUTO). Auto is the correct setting
  /// for all inputs that are not PsF. Don't set this value to PsF when your input
  /// is interlaced. Doing so creates horizontal interlacing artifacts.
  @_s.JsonKey(name: 'inputScanType')
  final InputScanType inputScanType;

  /// Use Selection placement (position) to define the video area in your output
  /// frame. The area outside of the rectangle that you specify here is black. If
  /// you specify a value here, it will override any value that you specify in the
  /// output setting Selection placement (position). If you specify a value here,
  /// this will override any AFD values in your input, even if you set Respond to
  /// AFD (RespondToAfd) to Respond (RESPOND). If you specify a value here, this
  /// will ignore anything that you specify for the setting Scaling Behavior
  /// (scalingBehavior).
  @_s.JsonKey(name: 'position')
  final Rectangle position;

  /// Use Program (programNumber) to select a specific program from within a
  /// multi-program transport stream. Note that Quad 4K is not currently
  /// supported. Default is the first program within the transport stream. If the
  /// program you specify doesn't exist, the transcoding service will use this
  /// default.
  @_s.JsonKey(name: 'programNumber')
  final int programNumber;

  /// Set PSI control (InputPsiControl) for transport stream inputs to specify
  /// which data the demux process to scans. * Ignore PSI - Scan all PIDs for
  /// audio and video. * Use PSI - Scan only PSI data.
  @_s.JsonKey(name: 'psiControl')
  final InputPsiControl psiControl;

  /// Provide a list of any necessary supplemental IMPs. You need supplemental
  /// IMPs if the CPL that you're using for your input is in an incomplete IMP.
  /// Specify either the supplemental IMP directories with a trailing slash or the
  /// ASSETMAP.xml files. For example ["s3://bucket/ov/",
  /// "s3://bucket/vf2/ASSETMAP.xml"]. You don't need to specify the IMP that
  /// contains your input CPL, because the service automatically detects it.
  @_s.JsonKey(name: 'supplementalImps')
  final List<String> supplementalImps;

  /// Use this Timecode source setting, located under the input settings
  /// (InputTimecodeSource), to specify how the service counts input video frames.
  /// This input frame count affects only the behavior of features that apply to a
  /// single input at a time, such as input clipping and synchronizing some
  /// captions formats. Choose Embedded (EMBEDDED) to use the timecodes in your
  /// input video. Choose Start at zero (ZEROBASED) to start the first frame at
  /// zero. Choose Specified start (SPECIFIEDSTART) to start the first frame at
  /// the timecode that you specify in the setting Start timecode (timecodeStart).
  /// If you don't specify a value for Timecode source, the service will use
  /// Embedded by default. For more information about timecodes, see
  /// https://docs.aws.amazon.com/console/mediaconvert/timecode.
  @_s.JsonKey(name: 'timecodeSource')
  final InputTimecodeSource timecodeSource;

  /// Specify the timecode that you want the service to use for this input's
  /// initial frame. To use this setting, you must set the Timecode source
  /// setting, located under the input settings (InputTimecodeSource), to
  /// Specified start (SPECIFIEDSTART). For more information about timecodes, see
  /// https://docs.aws.amazon.com/console/mediaconvert/timecode.
  @_s.JsonKey(name: 'timecodeStart')
  final String timecodeStart;

  /// Selector for video.
  @_s.JsonKey(name: 'videoSelector')
  final VideoSelector videoSelector;

  Input({
    this.audioSelectorGroups,
    this.audioSelectors,
    this.captionSelectors,
    this.crop,
    this.deblockFilter,
    this.decryptionSettings,
    this.denoiseFilter,
    this.fileInput,
    this.filterEnable,
    this.filterStrength,
    this.imageInserter,
    this.inputClippings,
    this.inputScanType,
    this.position,
    this.programNumber,
    this.psiControl,
    this.supplementalImps,
    this.timecodeSource,
    this.timecodeStart,
    this.videoSelector,
  });
  factory Input.fromJson(Map<String, dynamic> json) => _$InputFromJson(json);

  Map<String, dynamic> toJson() => _$InputToJson(this);
}

/// To transcode only portions of your input (clips), include one Input clipping
/// (one instance of InputClipping in the JSON job file) for each input clip.
/// All input clips you specify will be included in every output of the job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputClipping {
  /// Set End timecode (EndTimecode) to the end of the portion of the input you
  /// are clipping. The frame corresponding to the End timecode value is included
  /// in the clip. Start timecode or End timecode may be left blank, but not both.
  /// Use the format HH:MM:SS:FF or HH:MM:SS;FF, where HH is the hour, MM is the
  /// minute, SS is the second, and FF is the frame number. When choosing this
  /// value, take into account your setting for timecode source under input
  /// settings (InputTimecodeSource). For example, if you have embedded timecodes
  /// that start at 01:00:00:00 and you want your clip to end six minutes into the
  /// video, use 01:06:00:00.
  @_s.JsonKey(name: 'endTimecode')
  final String endTimecode;

  /// Set Start timecode (StartTimecode) to the beginning of the portion of the
  /// input you are clipping. The frame corresponding to the Start timecode value
  /// is included in the clip. Start timecode or End timecode may be left blank,
  /// but not both. Use the format HH:MM:SS:FF or HH:MM:SS;FF, where HH is the
  /// hour, MM is the minute, SS is the second, and FF is the frame number. When
  /// choosing this value, take into account your setting for Input timecode
  /// source. For example, if you have embedded timecodes that start at
  /// 01:00:00:00 and you want your clip to begin five minutes into the video, use
  /// 01:05:00:00.
  @_s.JsonKey(name: 'startTimecode')
  final String startTimecode;

  InputClipping({
    this.endTimecode,
    this.startTimecode,
  });
  factory InputClipping.fromJson(Map<String, dynamic> json) =>
      _$InputClippingFromJson(json);

  Map<String, dynamic> toJson() => _$InputClippingToJson(this);
}

/// Enable Deblock (InputDeblockFilter) to produce smoother motion in the
/// output. Default is disabled. Only manually controllable for MPEG2 and
/// uncompressed video inputs.
enum InputDeblockFilter {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Settings for decrypting any input files that you encrypt before you upload
/// them to Amazon S3. MediaConvert can decrypt files only when you use AWS Key
/// Management Service (KMS) to encrypt the data key that you use to encrypt
/// your content.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputDecryptionSettings {
  /// Specify the encryption mode that you used to encrypt your input files.
  @_s.JsonKey(name: 'decryptionMode')
  final DecryptionMode decryptionMode;

  /// Warning! Don't provide your encryption key in plaintext. Your job settings
  /// could be intercepted, making your encrypted content vulnerable. Specify the
  /// encrypted version of the data key that you used to encrypt your content. The
  /// data key must be encrypted by AWS Key Management Service (KMS). The key can
  /// be 128, 192, or 256 bits.
  @_s.JsonKey(name: 'encryptedDecryptionKey')
  final String encryptedDecryptionKey;

  /// Specify the initialization vector that you used when you encrypted your
  /// content before uploading it to Amazon S3. You can use a 16-byte
  /// initialization vector with any encryption mode. Or, you can use a 12-byte
  /// initialization vector with GCM or CTR. MediaConvert accepts only
  /// initialization vectors that are base64-encoded.
  @_s.JsonKey(name: 'initializationVector')
  final String initializationVector;

  /// Specify the AWS Region for AWS Key Management Service (KMS) that you used to
  /// encrypt your data key, if that Region is different from the one you are
  /// using for AWS Elemental MediaConvert.
  @_s.JsonKey(name: 'kmsKeyRegion')
  final String kmsKeyRegion;

  InputDecryptionSettings({
    this.decryptionMode,
    this.encryptedDecryptionKey,
    this.initializationVector,
    this.kmsKeyRegion,
  });
  factory InputDecryptionSettings.fromJson(Map<String, dynamic> json) =>
      _$InputDecryptionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$InputDecryptionSettingsToJson(this);
}

/// Enable Denoise (InputDenoiseFilter) to filter noise from the input.  Default
/// is disabled. Only applicable to MPEG2, H.264, H.265, and uncompressed video
/// inputs.
enum InputDenoiseFilter {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Specify how the transcoding service applies the denoise and deblock filters.
/// You must also enable the filters separately, with Denoise
/// (InputDenoiseFilter) and Deblock (InputDeblockFilter). * Auto - The
/// transcoding service determines whether to apply filtering, depending on
/// input type and quality. * Disable - The input is not filtered. This is true
/// even if you use the API to enable them in (InputDeblockFilter) and
/// (InputDeblockFilter). * Force - The input is filtered regardless of input
/// type.
enum InputFilterEnable {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('DISABLE')
  disable,
  @_s.JsonValue('FORCE')
  force,
}

/// Set PSI control (InputPsiControl) for transport stream inputs to specify
/// which data the demux process to scans. * Ignore PSI - Scan all PIDs for
/// audio and video. * Use PSI - Scan only PSI data.
enum InputPsiControl {
  @_s.JsonValue('IGNORE_PSI')
  ignorePsi,
  @_s.JsonValue('USE_PSI')
  usePsi,
}

/// Use Rotate (InputRotate) to specify how the service rotates your video. You
/// can choose automatic rotation or specify a rotation. You can specify a
/// clockwise rotation of 0, 90, 180, or 270 degrees. If your input video
/// container is .mov or .mp4 and your input has rotation metadata, you can
/// choose Automatic to have the service rotate your video according to the
/// rotation specified in the metadata. The rotation must be within one degree
/// of 90, 180, or 270 degrees. If the rotation metadata specifies any other
/// rotation, the service will default to no rotation. By default, the service
/// does no rotation, even if your input video has rotation metadata. The
/// service doesn't pass through rotation metadata.
enum InputRotate {
  @_s.JsonValue('DEGREE_0')
  degree_0,
  @_s.JsonValue('DEGREES_90')
  degrees_90,
  @_s.JsonValue('DEGREES_180')
  degrees_180,
  @_s.JsonValue('DEGREES_270')
  degrees_270,
  @_s.JsonValue('AUTO')
  auto,
}

/// When you have a progressive segmented frame (PsF) input, use this setting to
/// flag the input as PsF. MediaConvert doesn't automatically detect PsF.
/// Therefore, flagging your input as PsF results in better preservation of
/// video quality when you do deinterlacing and frame rate conversion. If you
/// don't specify, the default value is Auto (AUTO). Auto is the correct setting
/// for all inputs that are not PsF. Don't set this value to PsF when your input
/// is interlaced. Doing so creates horizontal interlacing artifacts.
enum InputScanType {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('PSF')
  psf,
}

/// Specified video input in a template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputTemplate {
  /// Specifies set of audio selectors within an input to combine. An input may
  /// have multiple audio selector groups. See "Audio Selector
  /// Group":#inputs-audio_selector_group for more information.
  @_s.JsonKey(name: 'audioSelectorGroups')
  final Map<String, AudioSelectorGroup> audioSelectorGroups;

  /// Use Audio selectors (AudioSelectors) to specify a track or set of tracks
  /// from the input that you will use in your outputs. You can use multiple Audio
  /// selectors per input.
  @_s.JsonKey(name: 'audioSelectors')
  final Map<String, AudioSelector> audioSelectors;

  /// Use captions selectors to specify the captions data from your input that you
  /// use in your outputs. You can use up to 20 captions selectors per input.
  @_s.JsonKey(name: 'captionSelectors')
  final Map<String, CaptionSelector> captionSelectors;

  /// Use Cropping selection (crop) to specify the video area that the service
  /// will include in the output video frame. If you specify a value here, it will
  /// override any value that you specify in the output setting Cropping selection
  /// (crop).
  @_s.JsonKey(name: 'crop')
  final Rectangle crop;

  /// Enable Deblock (InputDeblockFilter) to produce smoother motion in the
  /// output. Default is disabled. Only manually controllable for MPEG2 and
  /// uncompressed video inputs.
  @_s.JsonKey(name: 'deblockFilter')
  final InputDeblockFilter deblockFilter;

  /// Enable Denoise (InputDenoiseFilter) to filter noise from the input.  Default
  /// is disabled. Only applicable to MPEG2, H.264, H.265, and uncompressed video
  /// inputs.
  @_s.JsonKey(name: 'denoiseFilter')
  final InputDenoiseFilter denoiseFilter;

  /// Specify how the transcoding service applies the denoise and deblock filters.
  /// You must also enable the filters separately, with Denoise
  /// (InputDenoiseFilter) and Deblock (InputDeblockFilter). * Auto - The
  /// transcoding service determines whether to apply filtering, depending on
  /// input type and quality. * Disable - The input is not filtered. This is true
  /// even if you use the API to enable them in (InputDeblockFilter) and
  /// (InputDeblockFilter). * Force - The input is filtered regardless of input
  /// type.
  @_s.JsonKey(name: 'filterEnable')
  final InputFilterEnable filterEnable;

  /// Use Filter strength (FilterStrength) to adjust the magnitude the input
  /// filter settings (Deblock and Denoise). The range is -5 to 5. Default is 0.
  @_s.JsonKey(name: 'filterStrength')
  final int filterStrength;

  /// Enable the image inserter feature to include a graphic overlay on your
  /// video. Enable or disable this feature for each input individually. This
  /// setting is disabled by default.
  @_s.JsonKey(name: 'imageInserter')
  final ImageInserter imageInserter;

  /// (InputClippings) contains sets of start and end times that together specify
  /// a portion of the input to be used in the outputs. If you provide only a
  /// start time, the clip will be the entire input from that point to the end. If
  /// you provide only an end time, it will be the entire input up to that point.
  /// When you specify more than one input clip, the transcoding service creates
  /// the job outputs by stringing the clips together in the order you specify
  /// them.
  @_s.JsonKey(name: 'inputClippings')
  final List<InputClipping> inputClippings;

  /// When you have a progressive segmented frame (PsF) input, use this setting to
  /// flag the input as PsF. MediaConvert doesn't automatically detect PsF.
  /// Therefore, flagging your input as PsF results in better preservation of
  /// video quality when you do deinterlacing and frame rate conversion. If you
  /// don't specify, the default value is Auto (AUTO). Auto is the correct setting
  /// for all inputs that are not PsF. Don't set this value to PsF when your input
  /// is interlaced. Doing so creates horizontal interlacing artifacts.
  @_s.JsonKey(name: 'inputScanType')
  final InputScanType inputScanType;

  /// Use Selection placement (position) to define the video area in your output
  /// frame. The area outside of the rectangle that you specify here is black. If
  /// you specify a value here, it will override any value that you specify in the
  /// output setting Selection placement (position). If you specify a value here,
  /// this will override any AFD values in your input, even if you set Respond to
  /// AFD (RespondToAfd) to Respond (RESPOND). If you specify a value here, this
  /// will ignore anything that you specify for the setting Scaling Behavior
  /// (scalingBehavior).
  @_s.JsonKey(name: 'position')
  final Rectangle position;

  /// Use Program (programNumber) to select a specific program from within a
  /// multi-program transport stream. Note that Quad 4K is not currently
  /// supported. Default is the first program within the transport stream. If the
  /// program you specify doesn't exist, the transcoding service will use this
  /// default.
  @_s.JsonKey(name: 'programNumber')
  final int programNumber;

  /// Set PSI control (InputPsiControl) for transport stream inputs to specify
  /// which data the demux process to scans. * Ignore PSI - Scan all PIDs for
  /// audio and video. * Use PSI - Scan only PSI data.
  @_s.JsonKey(name: 'psiControl')
  final InputPsiControl psiControl;

  /// Use this Timecode source setting, located under the input settings
  /// (InputTimecodeSource), to specify how the service counts input video frames.
  /// This input frame count affects only the behavior of features that apply to a
  /// single input at a time, such as input clipping and synchronizing some
  /// captions formats. Choose Embedded (EMBEDDED) to use the timecodes in your
  /// input video. Choose Start at zero (ZEROBASED) to start the first frame at
  /// zero. Choose Specified start (SPECIFIEDSTART) to start the first frame at
  /// the timecode that you specify in the setting Start timecode (timecodeStart).
  /// If you don't specify a value for Timecode source, the service will use
  /// Embedded by default. For more information about timecodes, see
  /// https://docs.aws.amazon.com/console/mediaconvert/timecode.
  @_s.JsonKey(name: 'timecodeSource')
  final InputTimecodeSource timecodeSource;

  /// Specify the timecode that you want the service to use for this input's
  /// initial frame. To use this setting, you must set the Timecode source
  /// setting, located under the input settings (InputTimecodeSource), to
  /// Specified start (SPECIFIEDSTART). For more information about timecodes, see
  /// https://docs.aws.amazon.com/console/mediaconvert/timecode.
  @_s.JsonKey(name: 'timecodeStart')
  final String timecodeStart;

  /// Selector for video.
  @_s.JsonKey(name: 'videoSelector')
  final VideoSelector videoSelector;

  InputTemplate({
    this.audioSelectorGroups,
    this.audioSelectors,
    this.captionSelectors,
    this.crop,
    this.deblockFilter,
    this.denoiseFilter,
    this.filterEnable,
    this.filterStrength,
    this.imageInserter,
    this.inputClippings,
    this.inputScanType,
    this.position,
    this.programNumber,
    this.psiControl,
    this.timecodeSource,
    this.timecodeStart,
    this.videoSelector,
  });
  factory InputTemplate.fromJson(Map<String, dynamic> json) =>
      _$InputTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$InputTemplateToJson(this);
}

/// Use this Timecode source setting, located under the input settings
/// (InputTimecodeSource), to specify how the service counts input video frames.
/// This input frame count affects only the behavior of features that apply to a
/// single input at a time, such as input clipping and synchronizing some
/// captions formats. Choose Embedded (EMBEDDED) to use the timecodes in your
/// input video. Choose Start at zero (ZEROBASED) to start the first frame at
/// zero. Choose Specified start (SPECIFIEDSTART) to start the first frame at
/// the timecode that you specify in the setting Start timecode (timecodeStart).
/// If you don't specify a value for Timecode source, the service will use
/// Embedded by default. For more information about timecodes, see
/// https://docs.aws.amazon.com/console/mediaconvert/timecode.
enum InputTimecodeSource {
  @_s.JsonValue('EMBEDDED')
  embedded,
  @_s.JsonValue('ZEROBASED')
  zerobased,
  @_s.JsonValue('SPECIFIEDSTART')
  specifiedstart,
}

/// Settings that specify how your still graphic overlay appears.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InsertableImage {
  /// Specify the time, in milliseconds, for the image to remain on the output
  /// video. This duration includes fade-in time but not fade-out time.
  @_s.JsonKey(name: 'duration')
  final int duration;

  /// Specify the length of time, in milliseconds, between the Start time that you
  /// specify for the image insertion and the time that the image appears at full
  /// opacity. Full opacity is the level that you specify for the opacity setting.
  /// If you don't specify a value for Fade-in, the image will appear abruptly at
  /// the overlay start time.
  @_s.JsonKey(name: 'fadeIn')
  final int fadeIn;

  /// Specify the length of time, in milliseconds, between the end of the time
  /// that you have specified for the image overlay Duration and when the overlaid
  /// image has faded to total transparency. If you don't specify a value for
  /// Fade-out, the image will disappear abruptly at the end of the inserted image
  /// duration.
  @_s.JsonKey(name: 'fadeOut')
  final int fadeOut;

  /// Specify the height of the inserted image in pixels. If you specify a value
  /// that's larger than the video resolution height, the service will crop your
  /// overlaid image to fit. To use the native height of the image, keep this
  /// setting blank.
  @_s.JsonKey(name: 'height')
  final int height;

  /// Specify the HTTP, HTTPS, or Amazon S3 location of the image that you want to
  /// overlay on the video. Use a PNG or TGA file.
  @_s.JsonKey(name: 'imageInserterInput')
  final String imageInserterInput;

  /// Specify the distance, in pixels, between the inserted image and the left
  /// edge of the video frame. Required for any image overlay that you specify.
  @_s.JsonKey(name: 'imageX')
  final int imageX;

  /// Specify the distance, in pixels, between the overlaid image and the top edge
  /// of the video frame. Required for any image overlay that you specify.
  @_s.JsonKey(name: 'imageY')
  final int imageY;

  /// Specify how overlapping inserted images appear. Images with higher values
  /// for Layer appear on top of images with lower values for Layer.
  @_s.JsonKey(name: 'layer')
  final int layer;

  /// Use Opacity (Opacity) to specify how much of the underlying video shows
  /// through the inserted image. 0 is transparent and 100 is fully opaque.
  /// Default is 50.
  @_s.JsonKey(name: 'opacity')
  final int opacity;

  /// Specify the timecode of the frame that you want the overlay to first appear
  /// on. This must be in timecode (HH:MM:SS:FF or HH:MM:SS;FF) format. Remember
  /// to take into account your timecode source settings.
  @_s.JsonKey(name: 'startTime')
  final String startTime;

  /// Specify the width of the inserted image in pixels. If you specify a value
  /// that's larger than the video resolution width, the service will crop your
  /// overlaid image to fit. To use the native width of the image, keep this
  /// setting blank.
  @_s.JsonKey(name: 'width')
  final int width;

  InsertableImage({
    this.duration,
    this.fadeIn,
    this.fadeOut,
    this.height,
    this.imageInserterInput,
    this.imageX,
    this.imageY,
    this.layer,
    this.opacity,
    this.startTime,
    this.width,
  });
  factory InsertableImage.fromJson(Map<String, dynamic> json) =>
      _$InsertableImageFromJson(json);

  Map<String, dynamic> toJson() => _$InsertableImageToJson(this);
}

/// Each job converts an input file into an output file or files. For more
/// information, see the User Guide at
/// https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Job {
  /// The IAM role you use for creating this job. For details about permissions,
  /// see the User Guide topic at the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/iam-role.html
  @_s.JsonKey(name: 'role')
  final String role;

  /// JobSettings contains all the transcode settings for a job.
  @_s.JsonKey(name: 'settings')
  final JobSettings settings;

  /// Accelerated transcoding can significantly speed up jobs with long, visually
  /// complex content.
  @_s.JsonKey(name: 'accelerationSettings')
  final AccelerationSettings accelerationSettings;

  /// Describes whether the current job is running with accelerated transcoding.
  /// For jobs that have Acceleration (AccelerationMode) set to DISABLED,
  /// AccelerationStatus is always NOT_APPLICABLE. For jobs that have Acceleration
  /// (AccelerationMode) set to ENABLED or PREFERRED, AccelerationStatus is one of
  /// the other states. AccelerationStatus is IN_PROGRESS initially, while the
  /// service determines whether the input files and job settings are compatible
  /// with accelerated transcoding. If they are, AcclerationStatus is ACCELERATED.
  /// If your input files and job settings aren't compatible with accelerated
  /// transcoding, the service either fails your job or runs it without
  /// accelerated transcoding, depending on how you set Acceleration
  /// (AccelerationMode). When the service runs your job without accelerated
  /// transcoding, AccelerationStatus is NOT_ACCELERATED.
  @_s.JsonKey(name: 'accelerationStatus')
  final AccelerationStatus accelerationStatus;

  /// An identifier for this resource that is unique within all of AWS.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The tag type that AWS Billing and Cost Management will use to sort your AWS
  /// Elemental MediaConvert costs on any billing report that you set up.
  @_s.JsonKey(name: 'billingTagsSource')
  final BillingTagsSource billingTagsSource;

  /// The time, in Unix epoch format in seconds, when the job got created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// A job's phase can be PROBING, TRANSCODING OR UPLOADING
  @_s.JsonKey(name: 'currentPhase')
  final JobPhase currentPhase;

  /// Error code for the job
  @_s.JsonKey(name: 'errorCode')
  final int errorCode;

  /// Error message of Job
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// Optional list of hop destinations.
  @_s.JsonKey(name: 'hopDestinations')
  final List<HopDestination> hopDestinations;

  /// A portion of the job's ARN, unique within your AWS Elemental MediaConvert
  /// resources
  @_s.JsonKey(name: 'id')
  final String id;

  /// An estimate of how far your job has progressed. This estimate is shown as a
  /// percentage of the total time from when your job leaves its queue to when
  /// your output files appear in your output Amazon S3 bucket. AWS Elemental
  /// MediaConvert provides jobPercentComplete in CloudWatch STATUS_UPDATE events
  /// and in the response to GetJob and ListJobs requests. The jobPercentComplete
  /// estimate is reliable for the following input containers: Quicktime,
  /// Transport Stream, MP4, and MXF. For some jobs, the service can't provide
  /// information about job progress. In those cases, jobPercentComplete returns a
  /// null value.
  @_s.JsonKey(name: 'jobPercentComplete')
  final int jobPercentComplete;

  /// The job template that the job is created from, if it is created from a job
  /// template.
  @_s.JsonKey(name: 'jobTemplate')
  final String jobTemplate;

  /// Provides messages from the service about jobs that you have already
  /// successfully submitted.
  @_s.JsonKey(name: 'messages')
  final JobMessages messages;

  /// List of output group details
  @_s.JsonKey(name: 'outputGroupDetails')
  final List<OutputGroupDetail> outputGroupDetails;

  /// Relative priority on the job.
  @_s.JsonKey(name: 'priority')
  final int priority;

  /// When you create a job, you can specify a queue to send it to. If you don't
  /// specify, the job will go to the default queue. For more about queues, see
  /// the User Guide topic at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  @_s.JsonKey(name: 'queue')
  final String queue;

  /// The job's queue hopping history.
  @_s.JsonKey(name: 'queueTransitions')
  final List<QueueTransition> queueTransitions;

  /// The number of times that the service automatically attempted to process your
  /// job after encountering an error.
  @_s.JsonKey(name: 'retryCount')
  final int retryCount;

  /// Enable this setting when you run a test job to estimate how many reserved
  /// transcoding slots (RTS) you need. When this is enabled, MediaConvert runs
  /// your job from an on-demand queue with similar performance to what you will
  /// see with one RTS in a reserved queue. This setting is disabled by default.
  @_s.JsonKey(name: 'simulateReservedQueue')
  final SimulateReservedQueue simulateReservedQueue;

  /// A job's status can be SUBMITTED, PROGRESSING, COMPLETE, CANCELED, or ERROR.
  @_s.JsonKey(name: 'status')
  final JobStatus status;

  /// Specify how often MediaConvert sends STATUS_UPDATE events to Amazon
  /// CloudWatch Events. Set the interval, in seconds, between status updates.
  /// MediaConvert sends an update at this interval from the time the service
  /// begins processing your job to the time it completes the transcode or
  /// encounters an error.
  @_s.JsonKey(name: 'statusUpdateInterval')
  final StatusUpdateInterval statusUpdateInterval;

  /// Information about when jobs are submitted, started, and finished is
  /// specified in Unix epoch format in seconds.
  @_s.JsonKey(name: 'timing')
  final Timing timing;

  /// User-defined metadata that you want to associate with an MediaConvert job.
  /// You specify metadata in key/value pairs.
  @_s.JsonKey(name: 'userMetadata')
  final Map<String, String> userMetadata;

  Job({
    @_s.required this.role,
    @_s.required this.settings,
    this.accelerationSettings,
    this.accelerationStatus,
    this.arn,
    this.billingTagsSource,
    this.createdAt,
    this.currentPhase,
    this.errorCode,
    this.errorMessage,
    this.hopDestinations,
    this.id,
    this.jobPercentComplete,
    this.jobTemplate,
    this.messages,
    this.outputGroupDetails,
    this.priority,
    this.queue,
    this.queueTransitions,
    this.retryCount,
    this.simulateReservedQueue,
    this.status,
    this.statusUpdateInterval,
    this.timing,
    this.userMetadata,
  });
  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}

/// Provides messages from the service about jobs that you have already
/// successfully submitted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobMessages {
  /// List of messages that are informational only and don't indicate a problem
  /// with your job.
  @_s.JsonKey(name: 'info')
  final List<String> info;

  /// List of messages that warn about conditions that might cause your job not to
  /// run or to fail.
  @_s.JsonKey(name: 'warning')
  final List<String> warning;

  JobMessages({
    this.info,
    this.warning,
  });
  factory JobMessages.fromJson(Map<String, dynamic> json) =>
      _$JobMessagesFromJson(json);
}

/// A job's phase can be PROBING, TRANSCODING OR UPLOADING
enum JobPhase {
  @_s.JsonValue('PROBING')
  probing,
  @_s.JsonValue('TRANSCODING')
  transcoding,
  @_s.JsonValue('UPLOADING')
  uploading,
}

/// JobSettings contains all the transcode settings for a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobSettings {
  /// When specified, this offset (in milliseconds) is added to the input Ad Avail
  /// PTS time.
  @_s.JsonKey(name: 'adAvailOffset')
  final int adAvailOffset;

  /// Settings for ad avail blanking.  Video can be blanked or overlaid with an
  /// image, and audio muted during SCTE-35 triggered ad avails.
  @_s.JsonKey(name: 'availBlanking')
  final AvailBlanking availBlanking;

  /// Settings for Event Signaling And Messaging (ESAM).
  @_s.JsonKey(name: 'esam')
  final EsamSettings esam;

  /// Use Inputs (inputs) to define source file used in the transcode job. There
  /// can be multiple inputs add in a job. These inputs will be concantenated
  /// together to create the output.
  @_s.JsonKey(name: 'inputs')
  final List<Input> inputs;

  /// Overlay motion graphics on top of your video. The motion graphics that you
  /// specify here appear on all outputs in all output groups.
  @_s.JsonKey(name: 'motionImageInserter')
  final MotionImageInserter motionImageInserter;

  /// Settings for your Nielsen configuration. If you don't do Nielsen measurement
  /// and analytics, ignore these settings. When you enable Nielsen configuration
  /// (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all
  /// outputs in the job. To enable Nielsen configuration programmatically,
  /// include an instance of nielsenConfiguration in your JSON job specification.
  /// Even if you don't include any children of nielsenConfiguration, you still
  /// enable the setting.
  @_s.JsonKey(name: 'nielsenConfiguration')
  final NielsenConfiguration nielsenConfiguration;

  /// Ignore these settings unless you are using Nielsen non-linear watermarking.
  /// Specify the values that  MediaConvert uses to generate and place Nielsen
  /// watermarks in your output audio. In addition to  specifying these values,
  /// you also need to set up your cloud TIC server. These settings apply to
  /// every output in your job. The MediaConvert implementation is currently with
  /// the following Nielsen versions: Nielsen Watermark SDK Version 5.2.1 Nielsen
  /// NLM Watermark Engine Version 1.2.7 Nielsen Watermark Authenticator [SID_TIC]
  /// Version [5.0.0]
  @_s.JsonKey(name: 'nielsenNonLinearWatermark')
  final NielsenNonLinearWatermarkSettings nielsenNonLinearWatermark;

  /// (OutputGroups) contains one group of settings for each set of outputs that
  /// share a common package type. All unpackaged files (MPEG-4, MPEG-2 TS,
  /// Quicktime, MXF, and no container) are grouped in a single output group as
  /// well. Required in (OutputGroups) is a group of settings that apply to the
  /// whole group. This required object depends on the value you set for (Type)
  /// under (OutputGroups)>(OutputGroupSettings). Type, settings object pairs are
  /// as follows. * FILE_GROUP_SETTINGS, FileGroupSettings * HLS_GROUP_SETTINGS,
  /// HlsGroupSettings * DASH_ISO_GROUP_SETTINGS, DashIsoGroupSettings *
  /// MS_SMOOTH_GROUP_SETTINGS, MsSmoothGroupSettings * CMAF_GROUP_SETTINGS,
  /// CmafGroupSettings
  @_s.JsonKey(name: 'outputGroups')
  final List<OutputGroup> outputGroups;

  /// Contains settings used to acquire and adjust timecode information from
  /// inputs.
  @_s.JsonKey(name: 'timecodeConfig')
  final TimecodeConfig timecodeConfig;

  /// Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3 tags
  /// in any HLS outputs. To include timed metadata, you must enable it here,
  /// enable it in each output container, and specify tags and timecodes in ID3
  /// insertion (Id3Insertion) objects.
  @_s.JsonKey(name: 'timedMetadataInsertion')
  final TimedMetadataInsertion timedMetadataInsertion;

  JobSettings({
    this.adAvailOffset,
    this.availBlanking,
    this.esam,
    this.inputs,
    this.motionImageInserter,
    this.nielsenConfiguration,
    this.nielsenNonLinearWatermark,
    this.outputGroups,
    this.timecodeConfig,
    this.timedMetadataInsertion,
  });
  factory JobSettings.fromJson(Map<String, dynamic> json) =>
      _$JobSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$JobSettingsToJson(this);
}

/// A job's status can be SUBMITTED, PROGRESSING, COMPLETE, CANCELED, or ERROR.
enum JobStatus {
  @_s.JsonValue('SUBMITTED')
  submitted,
  @_s.JsonValue('PROGRESSING')
  progressing,
  @_s.JsonValue('COMPLETE')
  complete,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('ERROR')
  error,
}

extension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.submitted:
        return 'SUBMITTED';
      case JobStatus.progressing:
        return 'PROGRESSING';
      case JobStatus.complete:
        return 'COMPLETE';
      case JobStatus.canceled:
        return 'CANCELED';
      case JobStatus.error:
        return 'ERROR';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A job template is a pre-made set of encoding instructions that you can use
/// to quickly create a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobTemplate {
  /// A name you create for each job template. Each name must be unique within
  /// your account.
  @_s.JsonKey(name: 'name')
  final String name;

  /// JobTemplateSettings contains all the transcode settings saved in the
  /// template that will be applied to jobs created from it.
  @_s.JsonKey(name: 'settings')
  final JobTemplateSettings settings;

  /// Accelerated transcoding can significantly speed up jobs with long, visually
  /// complex content.
  @_s.JsonKey(name: 'accelerationSettings')
  final AccelerationSettings accelerationSettings;

  /// An identifier for this resource that is unique within all of AWS.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// An optional category you create to organize your job templates.
  @_s.JsonKey(name: 'category')
  final String category;

  /// The timestamp in epoch seconds for Job template creation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// An optional description you create for each job template.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Optional list of hop destinations.
  @_s.JsonKey(name: 'hopDestinations')
  final List<HopDestination> hopDestinations;

  /// The timestamp in epoch seconds when the Job template was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdated')
  final DateTime lastUpdated;

  /// Relative priority on the job.
  @_s.JsonKey(name: 'priority')
  final int priority;

  /// Optional. The queue that jobs created from this template are assigned to. If
  /// you don't specify this, jobs will go to the default queue.
  @_s.JsonKey(name: 'queue')
  final String queue;

  /// Specify how often MediaConvert sends STATUS_UPDATE events to Amazon
  /// CloudWatch Events. Set the interval, in seconds, between status updates.
  /// MediaConvert sends an update at this interval from the time the service
  /// begins processing your job to the time it completes the transcode or
  /// encounters an error.
  @_s.JsonKey(name: 'statusUpdateInterval')
  final StatusUpdateInterval statusUpdateInterval;

  /// A job template can be of two types: system or custom. System or built-in job
  /// templates can't be modified or deleted by the user.
  @_s.JsonKey(name: 'type')
  final Type type;

  JobTemplate({
    @_s.required this.name,
    @_s.required this.settings,
    this.accelerationSettings,
    this.arn,
    this.category,
    this.createdAt,
    this.description,
    this.hopDestinations,
    this.lastUpdated,
    this.priority,
    this.queue,
    this.statusUpdateInterval,
    this.type,
  });
  factory JobTemplate.fromJson(Map<String, dynamic> json) =>
      _$JobTemplateFromJson(json);
}

/// Optional. When you request a list of job templates, you can choose to list
/// them alphabetically by NAME or chronologically by CREATION_DATE. If you
/// don't specify, the service will list them by name.
enum JobTemplateListBy {
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('CREATION_DATE')
  creationDate,
  @_s.JsonValue('SYSTEM')
  system,
}

extension on JobTemplateListBy {
  String toValue() {
    switch (this) {
      case JobTemplateListBy.name:
        return 'NAME';
      case JobTemplateListBy.creationDate:
        return 'CREATION_DATE';
      case JobTemplateListBy.system:
        return 'SYSTEM';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// JobTemplateSettings contains all the transcode settings saved in the
/// template that will be applied to jobs created from it.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobTemplateSettings {
  /// When specified, this offset (in milliseconds) is added to the input Ad Avail
  /// PTS time.
  @_s.JsonKey(name: 'adAvailOffset')
  final int adAvailOffset;

  /// Settings for ad avail blanking.  Video can be blanked or overlaid with an
  /// image, and audio muted during SCTE-35 triggered ad avails.
  @_s.JsonKey(name: 'availBlanking')
  final AvailBlanking availBlanking;

  /// Settings for Event Signaling And Messaging (ESAM).
  @_s.JsonKey(name: 'esam')
  final EsamSettings esam;

  /// Use Inputs (inputs) to define the source file used in the transcode job.
  /// There can only be one input in a job template.  Using the API, you can
  /// include multiple inputs when referencing a job template.
  @_s.JsonKey(name: 'inputs')
  final List<InputTemplate> inputs;

  /// Overlay motion graphics on top of your video. The motion graphics that you
  /// specify here appear on all outputs in all output groups.
  @_s.JsonKey(name: 'motionImageInserter')
  final MotionImageInserter motionImageInserter;

  /// Settings for your Nielsen configuration. If you don't do Nielsen measurement
  /// and analytics, ignore these settings. When you enable Nielsen configuration
  /// (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all
  /// outputs in the job. To enable Nielsen configuration programmatically,
  /// include an instance of nielsenConfiguration in your JSON job specification.
  /// Even if you don't include any children of nielsenConfiguration, you still
  /// enable the setting.
  @_s.JsonKey(name: 'nielsenConfiguration')
  final NielsenConfiguration nielsenConfiguration;

  /// Ignore these settings unless you are using Nielsen non-linear watermarking.
  /// Specify the values that  MediaConvert uses to generate and place Nielsen
  /// watermarks in your output audio. In addition to  specifying these values,
  /// you also need to set up your cloud TIC server. These settings apply to
  /// every output in your job. The MediaConvert implementation is currently with
  /// the following Nielsen versions: Nielsen Watermark SDK Version 5.2.1 Nielsen
  /// NLM Watermark Engine Version 1.2.7 Nielsen Watermark Authenticator [SID_TIC]
  /// Version [5.0.0]
  @_s.JsonKey(name: 'nielsenNonLinearWatermark')
  final NielsenNonLinearWatermarkSettings nielsenNonLinearWatermark;

  /// (OutputGroups) contains one group of settings for each set of outputs that
  /// share a common package type. All unpackaged files (MPEG-4, MPEG-2 TS,
  /// Quicktime, MXF, and no container) are grouped in a single output group as
  /// well. Required in (OutputGroups) is a group of settings that apply to the
  /// whole group. This required object depends on the value you set for (Type)
  /// under (OutputGroups)>(OutputGroupSettings). Type, settings object pairs are
  /// as follows. * FILE_GROUP_SETTINGS, FileGroupSettings * HLS_GROUP_SETTINGS,
  /// HlsGroupSettings * DASH_ISO_GROUP_SETTINGS, DashIsoGroupSettings *
  /// MS_SMOOTH_GROUP_SETTINGS, MsSmoothGroupSettings * CMAF_GROUP_SETTINGS,
  /// CmafGroupSettings
  @_s.JsonKey(name: 'outputGroups')
  final List<OutputGroup> outputGroups;

  /// Contains settings used to acquire and adjust timecode information from
  /// inputs.
  @_s.JsonKey(name: 'timecodeConfig')
  final TimecodeConfig timecodeConfig;

  /// Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3 tags
  /// in any HLS outputs. To include timed metadata, you must enable it here,
  /// enable it in each output container, and specify tags and timecodes in ID3
  /// insertion (Id3Insertion) objects.
  @_s.JsonKey(name: 'timedMetadataInsertion')
  final TimedMetadataInsertion timedMetadataInsertion;

  JobTemplateSettings({
    this.adAvailOffset,
    this.availBlanking,
    this.esam,
    this.inputs,
    this.motionImageInserter,
    this.nielsenConfiguration,
    this.nielsenNonLinearWatermark,
    this.outputGroups,
    this.timecodeConfig,
    this.timedMetadataInsertion,
  });
  factory JobTemplateSettings.fromJson(Map<String, dynamic> json) =>
      _$JobTemplateSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$JobTemplateSettingsToJson(this);
}

/// Specify the language, using the ISO 639-2 three-letter code listed at
/// https://www.loc.gov/standards/iso639-2/php/code_list.php.
enum LanguageCode {
  @_s.JsonValue('ENG')
  eng,
  @_s.JsonValue('SPA')
  spa,
  @_s.JsonValue('FRA')
  fra,
  @_s.JsonValue('DEU')
  deu,
  @_s.JsonValue('GER')
  ger,
  @_s.JsonValue('ZHO')
  zho,
  @_s.JsonValue('ARA')
  ara,
  @_s.JsonValue('HIN')
  hin,
  @_s.JsonValue('JPN')
  jpn,
  @_s.JsonValue('RUS')
  rus,
  @_s.JsonValue('POR')
  por,
  @_s.JsonValue('ITA')
  ita,
  @_s.JsonValue('URD')
  urd,
  @_s.JsonValue('VIE')
  vie,
  @_s.JsonValue('KOR')
  kor,
  @_s.JsonValue('PAN')
  pan,
  @_s.JsonValue('ABK')
  abk,
  @_s.JsonValue('AAR')
  aar,
  @_s.JsonValue('AFR')
  afr,
  @_s.JsonValue('AKA')
  aka,
  @_s.JsonValue('SQI')
  sqi,
  @_s.JsonValue('AMH')
  amh,
  @_s.JsonValue('ARG')
  arg,
  @_s.JsonValue('HYE')
  hye,
  @_s.JsonValue('ASM')
  asm,
  @_s.JsonValue('AVA')
  ava,
  @_s.JsonValue('AVE')
  ave,
  @_s.JsonValue('AYM')
  aym,
  @_s.JsonValue('AZE')
  aze,
  @_s.JsonValue('BAM')
  bam,
  @_s.JsonValue('BAK')
  bak,
  @_s.JsonValue('EUS')
  eus,
  @_s.JsonValue('BEL')
  bel,
  @_s.JsonValue('BEN')
  ben,
  @_s.JsonValue('BIH')
  bih,
  @_s.JsonValue('BIS')
  bis,
  @_s.JsonValue('BOS')
  bos,
  @_s.JsonValue('BRE')
  bre,
  @_s.JsonValue('BUL')
  bul,
  @_s.JsonValue('MYA')
  mya,
  @_s.JsonValue('CAT')
  cat,
  @_s.JsonValue('KHM')
  khm,
  @_s.JsonValue('CHA')
  cha,
  @_s.JsonValue('CHE')
  che,
  @_s.JsonValue('NYA')
  nya,
  @_s.JsonValue('CHU')
  chu,
  @_s.JsonValue('CHV')
  chv,
  @_s.JsonValue('COR')
  cor,
  @_s.JsonValue('COS')
  cos,
  @_s.JsonValue('CRE')
  cre,
  @_s.JsonValue('HRV')
  hrv,
  @_s.JsonValue('CES')
  ces,
  @_s.JsonValue('DAN')
  dan,
  @_s.JsonValue('DIV')
  div,
  @_s.JsonValue('NLD')
  nld,
  @_s.JsonValue('DZO')
  dzo,
  @_s.JsonValue('ENM')
  enm,
  @_s.JsonValue('EPO')
  epo,
  @_s.JsonValue('EST')
  est,
  @_s.JsonValue('EWE')
  ewe,
  @_s.JsonValue('FAO')
  fao,
  @_s.JsonValue('FIJ')
  fij,
  @_s.JsonValue('FIN')
  fin,
  @_s.JsonValue('FRM')
  frm,
  @_s.JsonValue('FUL')
  ful,
  @_s.JsonValue('GLA')
  gla,
  @_s.JsonValue('GLG')
  glg,
  @_s.JsonValue('LUG')
  lug,
  @_s.JsonValue('KAT')
  kat,
  @_s.JsonValue('ELL')
  ell,
  @_s.JsonValue('GRN')
  grn,
  @_s.JsonValue('GUJ')
  guj,
  @_s.JsonValue('HAT')
  hat,
  @_s.JsonValue('HAU')
  hau,
  @_s.JsonValue('HEB')
  heb,
  @_s.JsonValue('HER')
  her,
  @_s.JsonValue('HMO')
  hmo,
  @_s.JsonValue('HUN')
  hun,
  @_s.JsonValue('ISL')
  isl,
  @_s.JsonValue('IDO')
  ido,
  @_s.JsonValue('IBO')
  ibo,
  @_s.JsonValue('IND')
  ind,
  @_s.JsonValue('INA')
  ina,
  @_s.JsonValue('ILE')
  ile,
  @_s.JsonValue('IKU')
  iku,
  @_s.JsonValue('IPK')
  ipk,
  @_s.JsonValue('GLE')
  gle,
  @_s.JsonValue('JAV')
  jav,
  @_s.JsonValue('KAL')
  kal,
  @_s.JsonValue('KAN')
  kan,
  @_s.JsonValue('KAU')
  kau,
  @_s.JsonValue('KAS')
  kas,
  @_s.JsonValue('KAZ')
  kaz,
  @_s.JsonValue('KIK')
  kik,
  @_s.JsonValue('KIN')
  kin,
  @_s.JsonValue('KIR')
  kir,
  @_s.JsonValue('KOM')
  kom,
  @_s.JsonValue('KON')
  kon,
  @_s.JsonValue('KUA')
  kua,
  @_s.JsonValue('KUR')
  kur,
  @_s.JsonValue('LAO')
  lao,
  @_s.JsonValue('LAT')
  lat,
  @_s.JsonValue('LAV')
  lav,
  @_s.JsonValue('LIM')
  lim,
  @_s.JsonValue('LIN')
  lin,
  @_s.JsonValue('LIT')
  lit,
  @_s.JsonValue('LUB')
  lub,
  @_s.JsonValue('LTZ')
  ltz,
  @_s.JsonValue('MKD')
  mkd,
  @_s.JsonValue('MLG')
  mlg,
  @_s.JsonValue('MSA')
  msa,
  @_s.JsonValue('MAL')
  mal,
  @_s.JsonValue('MLT')
  mlt,
  @_s.JsonValue('GLV')
  glv,
  @_s.JsonValue('MRI')
  mri,
  @_s.JsonValue('MAR')
  mar,
  @_s.JsonValue('MAH')
  mah,
  @_s.JsonValue('MON')
  mon,
  @_s.JsonValue('NAU')
  nau,
  @_s.JsonValue('NAV')
  nav,
  @_s.JsonValue('NDE')
  nde,
  @_s.JsonValue('NBL')
  nbl,
  @_s.JsonValue('NDO')
  ndo,
  @_s.JsonValue('NEP')
  nep,
  @_s.JsonValue('SME')
  sme,
  @_s.JsonValue('NOR')
  nor,
  @_s.JsonValue('NOB')
  nob,
  @_s.JsonValue('NNO')
  nno,
  @_s.JsonValue('OCI')
  oci,
  @_s.JsonValue('OJI')
  oji,
  @_s.JsonValue('ORI')
  ori,
  @_s.JsonValue('ORM')
  orm,
  @_s.JsonValue('OSS')
  oss,
  @_s.JsonValue('PLI')
  pli,
  @_s.JsonValue('FAS')
  fas,
  @_s.JsonValue('POL')
  pol,
  @_s.JsonValue('PUS')
  pus,
  @_s.JsonValue('QUE')
  que,
  @_s.JsonValue('QAA')
  qaa,
  @_s.JsonValue('RON')
  ron,
  @_s.JsonValue('ROH')
  roh,
  @_s.JsonValue('RUN')
  run,
  @_s.JsonValue('SMO')
  smo,
  @_s.JsonValue('SAG')
  sag,
  @_s.JsonValue('SAN')
  san,
  @_s.JsonValue('SRD')
  srd,
  @_s.JsonValue('SRB')
  srb,
  @_s.JsonValue('SNA')
  sna,
  @_s.JsonValue('III')
  iii,
  @_s.JsonValue('SND')
  snd,
  @_s.JsonValue('SIN')
  sin,
  @_s.JsonValue('SLK')
  slk,
  @_s.JsonValue('SLV')
  slv,
  @_s.JsonValue('SOM')
  som,
  @_s.JsonValue('SOT')
  sot,
  @_s.JsonValue('SUN')
  sun,
  @_s.JsonValue('SWA')
  swa,
  @_s.JsonValue('SSW')
  ssw,
  @_s.JsonValue('SWE')
  swe,
  @_s.JsonValue('TGL')
  tgl,
  @_s.JsonValue('TAH')
  tah,
  @_s.JsonValue('TGK')
  tgk,
  @_s.JsonValue('TAM')
  tam,
  @_s.JsonValue('TAT')
  tat,
  @_s.JsonValue('TEL')
  tel,
  @_s.JsonValue('THA')
  tha,
  @_s.JsonValue('BOD')
  bod,
  @_s.JsonValue('TIR')
  tir,
  @_s.JsonValue('TON')
  ton,
  @_s.JsonValue('TSO')
  tso,
  @_s.JsonValue('TSN')
  tsn,
  @_s.JsonValue('TUR')
  tur,
  @_s.JsonValue('TUK')
  tuk,
  @_s.JsonValue('TWI')
  twi,
  @_s.JsonValue('UIG')
  uig,
  @_s.JsonValue('UKR')
  ukr,
  @_s.JsonValue('UZB')
  uzb,
  @_s.JsonValue('VEN')
  ven,
  @_s.JsonValue('VOL')
  vol,
  @_s.JsonValue('WLN')
  wln,
  @_s.JsonValue('CYM')
  cym,
  @_s.JsonValue('FRY')
  fry,
  @_s.JsonValue('WOL')
  wol,
  @_s.JsonValue('XHO')
  xho,
  @_s.JsonValue('YID')
  yid,
  @_s.JsonValue('YOR')
  yor,
  @_s.JsonValue('ZHA')
  zha,
  @_s.JsonValue('ZUL')
  zul,
  @_s.JsonValue('ORJ')
  orj,
  @_s.JsonValue('QPC')
  qpc,
  @_s.JsonValue('TNG')
  tng,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobTemplatesResponse {
  /// List of Job templates.
  @_s.JsonKey(name: 'jobTemplates')
  final List<JobTemplate> jobTemplates;

  /// Use this string to request the next batch of job templates.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListJobTemplatesResponse({
    this.jobTemplates,
    this.nextToken,
  });
  factory ListJobTemplatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJobTemplatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsResponse {
  /// List of jobs
  @_s.JsonKey(name: 'jobs')
  final List<Job> jobs;

  /// Use this string to request the next batch of jobs.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListJobsResponse({
    this.jobs,
    this.nextToken,
  });
  factory ListJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPresetsResponse {
  /// Use this string to request the next batch of presets.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// List of presets
  @_s.JsonKey(name: 'presets')
  final List<Preset> presets;

  ListPresetsResponse({
    this.nextToken,
    this.presets,
  });
  factory ListPresetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPresetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListQueuesResponse {
  /// Use this string to request the next batch of queues.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// List of queues.
  @_s.JsonKey(name: 'queues')
  final List<Queue> queues;

  ListQueuesResponse({
    this.nextToken,
    this.queues,
  });
  factory ListQueuesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListQueuesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The Amazon Resource Name (ARN) and tags for an AWS Elemental MediaConvert
  /// resource.
  @_s.JsonKey(name: 'resourceTags')
  final ResourceTags resourceTags;

  ListTagsForResourceResponse({
    this.resourceTags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Selects between the DVB and ATSC buffer models for Dolby Digital audio.
enum M2tsAudioBufferModel {
  @_s.JsonValue('DVB')
  dvb,
  @_s.JsonValue('ATSC')
  atsc,
}

/// Specify this setting only when your output will be consumed by a downstream
/// repackaging workflow that is sensitive to very small duration differences
/// between video and audio. For this situation, choose Match video duration
/// (MATCH_VIDEO_DURATION). In all other cases, keep the default value, Default
/// codec duration (DEFAULT_CODEC_DURATION). When you choose Match video
/// duration, MediaConvert pads the output audio streams with silence or trims
/// them to ensure that the total duration of each audio stream is at least as
/// long as the total duration of the video stream. After padding or trimming,
/// the audio stream duration is no more than one frame longer than the video
/// stream. MediaConvert applies audio padding or trimming only to the end of
/// the last segment of the output. For unsegmented outputs, MediaConvert adds
/// padding only to the end of the file. When you keep the default value, any
/// minor discrepancies between audio and video duration will depend on your
/// output audio codec.
enum M2tsAudioDuration {
  @_s.JsonValue('DEFAULT_CODEC_DURATION')
  defaultCodecDuration,
  @_s.JsonValue('MATCH_VIDEO_DURATION')
  matchVideoDuration,
}

/// Controls what buffer model to use for accurate interleaving. If set to
/// MULTIPLEX, use multiplex  buffer model. If set to NONE, this can lead to
/// lower latency, but low-memory devices may not be able to play back the
/// stream without interruptions.
enum M2tsBufferModel {
  @_s.JsonValue('MULTIPLEX')
  multiplex,
  @_s.JsonValue('NONE')
  none,
}

/// When set to VIDEO_AND_FIXED_INTERVALS, audio EBP markers will be added to
/// partitions 3 and 4. The interval between these additional markers will be
/// fixed, and will be slightly shorter than the video EBP marker interval. When
/// set to VIDEO_INTERVAL, these additional markers will not be inserted. Only
/// applicable when EBP segmentation markers are is selected
/// (segmentationMarkers is EBP or EBP_LEGACY).
enum M2tsEbpAudioInterval {
  @_s.JsonValue('VIDEO_AND_FIXED_INTERVALS')
  videoAndFixedIntervals,
  @_s.JsonValue('VIDEO_INTERVAL')
  videoInterval,
}

/// Selects which PIDs to place EBP markers on. They can either be placed only
/// on the video PID, or on both the video PID and all audio PIDs. Only
/// applicable when EBP segmentation markers are is selected
/// (segmentationMarkers is EBP or EBP_LEGACY).
enum M2tsEbpPlacement {
  @_s.JsonValue('VIDEO_AND_AUDIO_PIDS')
  videoAndAudioPids,
  @_s.JsonValue('VIDEO_PID')
  videoPid,
}

/// Controls whether to include the ES Rate field in the PES header.
enum M2tsEsRateInPes {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// Keep the default value (DEFAULT) unless you know that your audio EBP markers
/// are incorrectly appearing before your video EBP markers. To correct this
/// problem, set this value to Force (FORCE).
enum M2tsForceTsVideoEbpOrder {
  @_s.JsonValue('FORCE')
  force,
  @_s.JsonValue('DEFAULT')
  $default,
}

/// If INSERT, Nielsen inaudible tones for media tracking will be detected in
/// the input audio and an equivalent ID3 tag will be inserted in the output.
enum M2tsNielsenId3 {
  @_s.JsonValue('INSERT')
  insert,
  @_s.JsonValue('NONE')
  none,
}

/// When set to PCR_EVERY_PES_PACKET, a Program Clock Reference value is
/// inserted for every Packetized Elementary Stream (PES) header. This is
/// effective only when the PCR PID is the same as the video or audio elementary
/// stream.
enum M2tsPcrControl {
  @_s.JsonValue('PCR_EVERY_PES_PACKET')
  pcrEveryPesPacket,
  @_s.JsonValue('CONFIGURED_PCR_PERIOD')
  configuredPcrPeriod,
}

/// When set to CBR, inserts null packets into transport stream to fill
/// specified bitrate. When set to VBR, the bitrate setting acts as the maximum
/// bitrate, but the output will not be padded up to that bitrate.
enum M2tsRateMode {
  @_s.JsonValue('VBR')
  vbr,
  @_s.JsonValue('CBR')
  cbr,
}

/// Settings for SCTE-35 signals from ESAM. Include this in your job settings to
/// put SCTE-35 markers in your HLS and transport stream outputs at the
/// insertion points that you specify in an ESAM XML document. Provide the
/// document in the setting SCC XML (sccXml).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class M2tsScte35Esam {
  /// Packet Identifier (PID) of the SCTE-35 stream in the transport stream
  /// generated by ESAM.
  @_s.JsonKey(name: 'scte35EsamPid')
  final int scte35EsamPid;

  M2tsScte35Esam({
    this.scte35EsamPid,
  });
  factory M2tsScte35Esam.fromJson(Map<String, dynamic> json) =>
      _$M2tsScte35EsamFromJson(json);

  Map<String, dynamic> toJson() => _$M2tsScte35EsamToJson(this);
}

/// For SCTE-35 markers from your input-- Choose Passthrough (PASSTHROUGH) if
/// you want SCTE-35 markers that appear in your input to also appear in this
/// output. Choose None (NONE) if you don't want SCTE-35 markers in this output.
/// For SCTE-35 markers from an ESAM XML document-- Choose None (NONE). Also
/// provide the ESAM XML as a string in the setting Signal processing
/// notification XML (sccXml). Also enable ESAM SCTE-35 (include the property
/// scte35Esam).
enum M2tsScte35Source {
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
  @_s.JsonValue('NONE')
  none,
}

/// Inserts segmentation markers at each segmentation_time period. rai_segstart
/// sets the Random Access Indicator bit in the adaptation field. rai_adapt sets
/// the RAI bit and adds the current timecode in the private data bytes.
/// psi_segstart inserts PAT and PMT tables at the start of segments. ebp adds
/// Encoder Boundary Point information to the adaptation field as per OpenCable
/// specification OC-SP-EBP-I01-130118. ebp_legacy adds Encoder Boundary Point
/// information to the adaptation field using a legacy proprietary format.
enum M2tsSegmentationMarkers {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('RAI_SEGSTART')
  raiSegstart,
  @_s.JsonValue('RAI_ADAPT')
  raiAdapt,
  @_s.JsonValue('PSI_SEGSTART')
  psiSegstart,
  @_s.JsonValue('EBP')
  ebp,
  @_s.JsonValue('EBP_LEGACY')
  ebpLegacy,
}

/// The segmentation style parameter controls how segmentation markers are
/// inserted into the transport stream. With avails, it is possible that
/// segments may be truncated, which can influence where future segmentation
/// markers are inserted. When a segmentation style of "reset_cadence" is
/// selected and a segment is truncated due to an avail, we will reset the
/// segmentation cadence. This means the subsequent segment will have a duration
/// of of $segmentation_time seconds. When a segmentation style of
/// "maintain_cadence" is selected and a segment is truncated due to an avail,
/// we will not reset the segmentation cadence. This means the subsequent
/// segment will likely be truncated as well. However, all segments after that
/// will have a duration of $segmentation_time seconds. Note that EBP lookahead
/// is a slight exception to this rule.
enum M2tsSegmentationStyle {
  @_s.JsonValue('MAINTAIN_CADENCE')
  maintainCadence,
  @_s.JsonValue('RESET_CADENCE')
  resetCadence,
}

/// MPEG-2 TS container settings. These apply to outputs in a File output group
/// when the output's container (ContainerType) is MPEG-2 Transport Stream
/// (M2TS). In these assets, data is organized by the program map table (PMT).
/// Each transport stream program contains subsets of data, including audio,
/// video, and metadata. Each of these subsets of data has a numerical label
/// called a packet identifier (PID). Each transport stream program corresponds
/// to one MediaConvert output. The PMT lists the types of data in a program
/// along with their PID. Downstream systems and players use the program map
/// table to look up the PID for each type of data it accesses and then uses the
/// PIDs to locate specific data within the asset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class M2tsSettings {
  /// Selects between the DVB and ATSC buffer models for Dolby Digital audio.
  @_s.JsonKey(name: 'audioBufferModel')
  final M2tsAudioBufferModel audioBufferModel;

  /// Specify this setting only when your output will be consumed by a downstream
  /// repackaging workflow that is sensitive to very small duration differences
  /// between video and audio. For this situation, choose Match video duration
  /// (MATCH_VIDEO_DURATION). In all other cases, keep the default value, Default
  /// codec duration (DEFAULT_CODEC_DURATION). When you choose Match video
  /// duration, MediaConvert pads the output audio streams with silence or trims
  /// them to ensure that the total duration of each audio stream is at least as
  /// long as the total duration of the video stream. After padding or trimming,
  /// the audio stream duration is no more than one frame longer than the video
  /// stream. MediaConvert applies audio padding or trimming only to the end of
  /// the last segment of the output. For unsegmented outputs, MediaConvert adds
  /// padding only to the end of the file. When you keep the default value, any
  /// minor discrepancies between audio and video duration will depend on your
  /// output audio codec.
  @_s.JsonKey(name: 'audioDuration')
  final M2tsAudioDuration audioDuration;

  /// The number of audio frames to insert for each PES packet.
  @_s.JsonKey(name: 'audioFramesPerPes')
  final int audioFramesPerPes;

  /// Specify the packet identifiers (PIDs) for any elementary audio streams you
  /// include in this output. Specify multiple PIDs as a JSON array. Default is
  /// the range 482-492.
  @_s.JsonKey(name: 'audioPids')
  final List<int> audioPids;

  /// Specify the output bitrate of the transport stream in bits per second.
  /// Setting to 0 lets the muxer automatically determine the appropriate bitrate.
  /// Other common values are 3750000, 7500000, and 15000000.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// Controls what buffer model to use for accurate interleaving. If set to
  /// MULTIPLEX, use multiplex  buffer model. If set to NONE, this can lead to
  /// lower latency, but low-memory devices may not be able to play back the
  /// stream without interruptions.
  @_s.JsonKey(name: 'bufferModel')
  final M2tsBufferModel bufferModel;

  /// Inserts DVB Network Information Table (NIT) at the specified table
  /// repetition interval.
  @_s.JsonKey(name: 'dvbNitSettings')
  final DvbNitSettings dvbNitSettings;

  /// Inserts DVB Service Description Table (NIT) at the specified table
  /// repetition interval.
  @_s.JsonKey(name: 'dvbSdtSettings')
  final DvbSdtSettings dvbSdtSettings;

  /// Specify the packet identifiers (PIDs) for DVB subtitle data included in this
  /// output. Specify multiple PIDs as a JSON array. Default is the range 460-479.
  @_s.JsonKey(name: 'dvbSubPids')
  final List<int> dvbSubPids;

  /// Inserts DVB Time and Date Table (TDT) at the specified table repetition
  /// interval.
  @_s.JsonKey(name: 'dvbTdtSettings')
  final DvbTdtSettings dvbTdtSettings;

  /// Specify the packet identifier (PID) for DVB teletext data you include in
  /// this output. Default is 499.
  @_s.JsonKey(name: 'dvbTeletextPid')
  final int dvbTeletextPid;

  /// When set to VIDEO_AND_FIXED_INTERVALS, audio EBP markers will be added to
  /// partitions 3 and 4. The interval between these additional markers will be
  /// fixed, and will be slightly shorter than the video EBP marker interval. When
  /// set to VIDEO_INTERVAL, these additional markers will not be inserted. Only
  /// applicable when EBP segmentation markers are is selected
  /// (segmentationMarkers is EBP or EBP_LEGACY).
  @_s.JsonKey(name: 'ebpAudioInterval')
  final M2tsEbpAudioInterval ebpAudioInterval;

  /// Selects which PIDs to place EBP markers on. They can either be placed only
  /// on the video PID, or on both the video PID and all audio PIDs. Only
  /// applicable when EBP segmentation markers are is selected
  /// (segmentationMarkers is EBP or EBP_LEGACY).
  @_s.JsonKey(name: 'ebpPlacement')
  final M2tsEbpPlacement ebpPlacement;

  /// Controls whether to include the ES Rate field in the PES header.
  @_s.JsonKey(name: 'esRateInPes')
  final M2tsEsRateInPes esRateInPes;

  /// Keep the default value (DEFAULT) unless you know that your audio EBP markers
  /// are incorrectly appearing before your video EBP markers. To correct this
  /// problem, set this value to Force (FORCE).
  @_s.JsonKey(name: 'forceTsVideoEbpOrder')
  final M2tsForceTsVideoEbpOrder forceTsVideoEbpOrder;

  /// The length, in seconds, of each fragment. Only used with EBP markers.
  @_s.JsonKey(name: 'fragmentTime')
  final double fragmentTime;

  /// Specify the maximum time, in milliseconds, between Program Clock References
  /// (PCRs) inserted into the transport stream.
  @_s.JsonKey(name: 'maxPcrInterval')
  final int maxPcrInterval;

  /// When set, enforces that Encoder Boundary Points do not come within the
  /// specified time interval of each other by looking ahead at input video. If
  /// another EBP is going to come in within the specified time interval, the
  /// current EBP is not emitted, and the segment is "stretched" to the next
  /// marker. The lookahead value does not add latency to the system. The Live
  /// Event must be configured elsewhere to create sufficient latency to make the
  /// lookahead accurate.
  @_s.JsonKey(name: 'minEbpInterval')
  final int minEbpInterval;

  /// If INSERT, Nielsen inaudible tones for media tracking will be detected in
  /// the input audio and an equivalent ID3 tag will be inserted in the output.
  @_s.JsonKey(name: 'nielsenId3')
  final M2tsNielsenId3 nielsenId3;

  /// Value in bits per second of extra null packets to insert into the transport
  /// stream. This can be used if a downstream encryption system requires periodic
  /// null packets.
  @_s.JsonKey(name: 'nullPacketBitrate')
  final double nullPacketBitrate;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  @_s.JsonKey(name: 'patInterval')
  final int patInterval;

  /// When set to PCR_EVERY_PES_PACKET, a Program Clock Reference value is
  /// inserted for every Packetized Elementary Stream (PES) header. This is
  /// effective only when the PCR PID is the same as the video or audio elementary
  /// stream.
  @_s.JsonKey(name: 'pcrControl')
  final M2tsPcrControl pcrControl;

  /// Specify the packet identifier (PID) for the program clock reference (PCR) in
  /// this output. If you do not specify a value, the service will use the value
  /// for Video PID (VideoPid).
  @_s.JsonKey(name: 'pcrPid')
  final int pcrPid;

  /// Specify the number of milliseconds between instances of the program map
  /// table (PMT) in the output transport stream.
  @_s.JsonKey(name: 'pmtInterval')
  final int pmtInterval;

  /// Specify the packet identifier (PID) for the program map table (PMT) itself.
  /// Default is 480.
  @_s.JsonKey(name: 'pmtPid')
  final int pmtPid;

  /// Specify the packet identifier (PID) of the private metadata stream. Default
  /// is 503.
  @_s.JsonKey(name: 'privateMetadataPid')
  final int privateMetadataPid;

  /// Use Program number (programNumber) to specify the program number used in the
  /// program map table (PMT) for this output. Default is 1. Program numbers and
  /// program map tables are parts of MPEG-2 transport stream containers, used for
  /// organizing data.
  @_s.JsonKey(name: 'programNumber')
  final int programNumber;

  /// When set to CBR, inserts null packets into transport stream to fill
  /// specified bitrate. When set to VBR, the bitrate setting acts as the maximum
  /// bitrate, but the output will not be padded up to that bitrate.
  @_s.JsonKey(name: 'rateMode')
  final M2tsRateMode rateMode;

  /// Include this in your job settings to put SCTE-35 markers in your HLS and
  /// transport stream outputs at the insertion points that you specify in an ESAM
  /// XML document. Provide the document in the setting SCC XML (sccXml).
  @_s.JsonKey(name: 'scte35Esam')
  final M2tsScte35Esam scte35Esam;

  /// Specify the packet identifier (PID) of the SCTE-35 stream in the transport
  /// stream.
  @_s.JsonKey(name: 'scte35Pid')
  final int scte35Pid;

  /// For SCTE-35 markers from your input-- Choose Passthrough (PASSTHROUGH) if
  /// you want SCTE-35 markers that appear in your input to also appear in this
  /// output. Choose None (NONE) if you don't want SCTE-35 markers in this output.
  /// For SCTE-35 markers from an ESAM XML document-- Choose None (NONE). Also
  /// provide the ESAM XML as a string in the setting Signal processing
  /// notification XML (sccXml). Also enable ESAM SCTE-35 (include the property
  /// scte35Esam).
  @_s.JsonKey(name: 'scte35Source')
  final M2tsScte35Source scte35Source;

  /// Inserts segmentation markers at each segmentation_time period. rai_segstart
  /// sets the Random Access Indicator bit in the adaptation field. rai_adapt sets
  /// the RAI bit and adds the current timecode in the private data bytes.
  /// psi_segstart inserts PAT and PMT tables at the start of segments. ebp adds
  /// Encoder Boundary Point information to the adaptation field as per OpenCable
  /// specification OC-SP-EBP-I01-130118. ebp_legacy adds Encoder Boundary Point
  /// information to the adaptation field using a legacy proprietary format.
  @_s.JsonKey(name: 'segmentationMarkers')
  final M2tsSegmentationMarkers segmentationMarkers;

  /// The segmentation style parameter controls how segmentation markers are
  /// inserted into the transport stream. With avails, it is possible that
  /// segments may be truncated, which can influence where future segmentation
  /// markers are inserted. When a segmentation style of "reset_cadence" is
  /// selected and a segment is truncated due to an avail, we will reset the
  /// segmentation cadence. This means the subsequent segment will have a duration
  /// of of $segmentation_time seconds. When a segmentation style of
  /// "maintain_cadence" is selected and a segment is truncated due to an avail,
  /// we will not reset the segmentation cadence. This means the subsequent
  /// segment will likely be truncated as well. However, all segments after that
  /// will have a duration of $segmentation_time seconds. Note that EBP lookahead
  /// is a slight exception to this rule.
  @_s.JsonKey(name: 'segmentationStyle')
  final M2tsSegmentationStyle segmentationStyle;

  /// Specify the length, in seconds, of each segment. Required unless markers is
  /// set to _none_.
  @_s.JsonKey(name: 'segmentationTime')
  final double segmentationTime;

  /// Specify the packet identifier (PID) for timed metadata in this output.
  /// Default is 502.
  @_s.JsonKey(name: 'timedMetadataPid')
  final int timedMetadataPid;

  /// Specify the ID for the transport stream itself in the program map table for
  /// this output. Transport stream IDs and program map tables are parts of MPEG-2
  /// transport stream containers, used for organizing data.
  @_s.JsonKey(name: 'transportStreamId')
  final int transportStreamId;

  /// Specify the packet identifier (PID) of the elementary video stream in the
  /// transport stream.
  @_s.JsonKey(name: 'videoPid')
  final int videoPid;

  M2tsSettings({
    this.audioBufferModel,
    this.audioDuration,
    this.audioFramesPerPes,
    this.audioPids,
    this.bitrate,
    this.bufferModel,
    this.dvbNitSettings,
    this.dvbSdtSettings,
    this.dvbSubPids,
    this.dvbTdtSettings,
    this.dvbTeletextPid,
    this.ebpAudioInterval,
    this.ebpPlacement,
    this.esRateInPes,
    this.forceTsVideoEbpOrder,
    this.fragmentTime,
    this.maxPcrInterval,
    this.minEbpInterval,
    this.nielsenId3,
    this.nullPacketBitrate,
    this.patInterval,
    this.pcrControl,
    this.pcrPid,
    this.pmtInterval,
    this.pmtPid,
    this.privateMetadataPid,
    this.programNumber,
    this.rateMode,
    this.scte35Esam,
    this.scte35Pid,
    this.scte35Source,
    this.segmentationMarkers,
    this.segmentationStyle,
    this.segmentationTime,
    this.timedMetadataPid,
    this.transportStreamId,
    this.videoPid,
  });
  factory M2tsSettings.fromJson(Map<String, dynamic> json) =>
      _$M2tsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$M2tsSettingsToJson(this);
}

/// Specify this setting only when your output will be consumed by a downstream
/// repackaging workflow that is sensitive to very small duration differences
/// between video and audio. For this situation, choose Match video duration
/// (MATCH_VIDEO_DURATION). In all other cases, keep the default value, Default
/// codec duration (DEFAULT_CODEC_DURATION). When you choose Match video
/// duration, MediaConvert pads the output audio streams with silence or trims
/// them to ensure that the total duration of each audio stream is at least as
/// long as the total duration of the video stream. After padding or trimming,
/// the audio stream duration is no more than one frame longer than the video
/// stream. MediaConvert applies audio padding or trimming only to the end of
/// the last segment of the output. For unsegmented outputs, MediaConvert adds
/// padding only to the end of the file. When you keep the default value, any
/// minor discrepancies between audio and video duration will depend on your
/// output audio codec.
enum M3u8AudioDuration {
  @_s.JsonValue('DEFAULT_CODEC_DURATION')
  defaultCodecDuration,
  @_s.JsonValue('MATCH_VIDEO_DURATION')
  matchVideoDuration,
}

/// If INSERT, Nielsen inaudible tones for media tracking will be detected in
/// the input audio and an equivalent ID3 tag will be inserted in the output.
enum M3u8NielsenId3 {
  @_s.JsonValue('INSERT')
  insert,
  @_s.JsonValue('NONE')
  none,
}

/// When set to PCR_EVERY_PES_PACKET a Program Clock Reference value is inserted
/// for every Packetized Elementary Stream (PES) header. This parameter is
/// effective only when the PCR PID is the same as the video or audio elementary
/// stream.
enum M3u8PcrControl {
  @_s.JsonValue('PCR_EVERY_PES_PACKET')
  pcrEveryPesPacket,
  @_s.JsonValue('CONFIGURED_PCR_PERIOD')
  configuredPcrPeriod,
}

/// For SCTE-35 markers from your input-- Choose Passthrough (PASSTHROUGH) if
/// you want SCTE-35 markers that appear in your input to also appear in this
/// output. Choose None (NONE) if you don't want SCTE-35 markers in this output.
/// For SCTE-35 markers from an ESAM XML document-- Choose None (NONE) if you
/// don't want manifest conditioning. Choose Passthrough (PASSTHROUGH) and
/// choose Ad markers (adMarkers) if you do want manifest conditioning. In both
/// cases, also provide the ESAM XML as a string in the setting Signal
/// processing notification XML (sccXml).
enum M3u8Scte35Source {
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
  @_s.JsonValue('NONE')
  none,
}

/// Settings for TS segments in HLS
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class M3u8Settings {
  /// Specify this setting only when your output will be consumed by a downstream
  /// repackaging workflow that is sensitive to very small duration differences
  /// between video and audio. For this situation, choose Match video duration
  /// (MATCH_VIDEO_DURATION). In all other cases, keep the default value, Default
  /// codec duration (DEFAULT_CODEC_DURATION). When you choose Match video
  /// duration, MediaConvert pads the output audio streams with silence or trims
  /// them to ensure that the total duration of each audio stream is at least as
  /// long as the total duration of the video stream. After padding or trimming,
  /// the audio stream duration is no more than one frame longer than the video
  /// stream. MediaConvert applies audio padding or trimming only to the end of
  /// the last segment of the output. For unsegmented outputs, MediaConvert adds
  /// padding only to the end of the file. When you keep the default value, any
  /// minor discrepancies between audio and video duration will depend on your
  /// output audio codec.
  @_s.JsonKey(name: 'audioDuration')
  final M3u8AudioDuration audioDuration;

  /// The number of audio frames to insert for each PES packet.
  @_s.JsonKey(name: 'audioFramesPerPes')
  final int audioFramesPerPes;

  /// Packet Identifier (PID) of the elementary audio stream(s) in the transport
  /// stream. Multiple values are accepted, and can be entered in ranges and/or by
  /// comma separation.
  @_s.JsonKey(name: 'audioPids')
  final List<int> audioPids;

  /// If INSERT, Nielsen inaudible tones for media tracking will be detected in
  /// the input audio and an equivalent ID3 tag will be inserted in the output.
  @_s.JsonKey(name: 'nielsenId3')
  final M3u8NielsenId3 nielsenId3;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  @_s.JsonKey(name: 'patInterval')
  final int patInterval;

  /// When set to PCR_EVERY_PES_PACKET a Program Clock Reference value is inserted
  /// for every Packetized Elementary Stream (PES) header. This parameter is
  /// effective only when the PCR PID is the same as the video or audio elementary
  /// stream.
  @_s.JsonKey(name: 'pcrControl')
  final M3u8PcrControl pcrControl;

  /// Packet Identifier (PID) of the Program Clock Reference (PCR) in the
  /// transport stream. When no value is given, the encoder will assign the same
  /// value as the Video PID.
  @_s.JsonKey(name: 'pcrPid')
  final int pcrPid;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  @_s.JsonKey(name: 'pmtInterval')
  final int pmtInterval;

  /// Packet Identifier (PID) for the Program Map Table (PMT) in the transport
  /// stream.
  @_s.JsonKey(name: 'pmtPid')
  final int pmtPid;

  /// Packet Identifier (PID) of the private metadata stream in the transport
  /// stream.
  @_s.JsonKey(name: 'privateMetadataPid')
  final int privateMetadataPid;

  /// The value of the program number field in the Program Map Table.
  @_s.JsonKey(name: 'programNumber')
  final int programNumber;

  /// Packet Identifier (PID) of the SCTE-35 stream in the transport stream.
  @_s.JsonKey(name: 'scte35Pid')
  final int scte35Pid;

  /// For SCTE-35 markers from your input-- Choose Passthrough (PASSTHROUGH) if
  /// you want SCTE-35 markers that appear in your input to also appear in this
  /// output. Choose None (NONE) if you don't want SCTE-35 markers in this output.
  /// For SCTE-35 markers from an ESAM XML document-- Choose None (NONE) if you
  /// don't want manifest conditioning. Choose Passthrough (PASSTHROUGH) and
  /// choose Ad markers (adMarkers) if you do want manifest conditioning. In both
  /// cases, also provide the ESAM XML as a string in the setting Signal
  /// processing notification XML (sccXml).
  @_s.JsonKey(name: 'scte35Source')
  final M3u8Scte35Source scte35Source;

  /// Applies only to HLS outputs. Use this setting to specify whether the service
  /// inserts the ID3 timed metadata from the input in this output.
  @_s.JsonKey(name: 'timedMetadata')
  final TimedMetadata timedMetadata;

  /// Packet Identifier (PID) of the timed metadata stream in the transport
  /// stream.
  @_s.JsonKey(name: 'timedMetadataPid')
  final int timedMetadataPid;

  /// The value of the transport stream ID field in the Program Map Table.
  @_s.JsonKey(name: 'transportStreamId')
  final int transportStreamId;

  /// Packet Identifier (PID) of the elementary video stream in the transport
  /// stream.
  @_s.JsonKey(name: 'videoPid')
  final int videoPid;

  M3u8Settings({
    this.audioDuration,
    this.audioFramesPerPes,
    this.audioPids,
    this.nielsenId3,
    this.patInterval,
    this.pcrControl,
    this.pcrPid,
    this.pmtInterval,
    this.pmtPid,
    this.privateMetadataPid,
    this.programNumber,
    this.scte35Pid,
    this.scte35Source,
    this.timedMetadata,
    this.timedMetadataPid,
    this.transportStreamId,
    this.videoPid,
  });
  factory M3u8Settings.fromJson(Map<String, dynamic> json) =>
      _$M3u8SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$M3u8SettingsToJson(this);
}

/// Overlay motion graphics on top of your video at the time that you specify.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MotionImageInserter {
  /// If your motion graphic asset is a .mov file, keep this setting unspecified.
  /// If your motion graphic asset is a series of .png files, specify the frame
  /// rate of the overlay in frames per second, as a fraction. For example,
  /// specify 24 fps as 24/1. Make sure that the number of images in your series
  /// matches the frame rate and your intended overlay duration. For example, if
  /// you want a 30-second overlay at 30 fps, you should have 900 .png images.
  /// This overlay frame rate doesn't need to match the frame rate of the
  /// underlying video.
  @_s.JsonKey(name: 'framerate')
  final MotionImageInsertionFramerate framerate;

  /// Specify the .mov file or series of .png files that you want to overlay on
  /// your video. For .png files, provide the file name of the first file in the
  /// series. Make sure that the names of the .png files end with sequential
  /// numbers that specify the order that they are played in. For example,
  /// overlay_000.png, overlay_001.png, overlay_002.png, and so on. The sequence
  /// must start at zero, and each image file name must have the same number of
  /// digits. Pad your initial file names with enough zeros to complete the
  /// sequence. For example, if the first image is overlay_0.png, there can be
  /// only 10 images in the sequence, with the last image being overlay_9.png. But
  /// if the first image is overlay_00.png, there can be 100 images in the
  /// sequence.
  @_s.JsonKey(name: 'input')
  final String input;

  /// Choose the type of motion graphic asset that you are providing for your
  /// overlay. You can choose either a .mov file or a series of .png files.
  @_s.JsonKey(name: 'insertionMode')
  final MotionImageInsertionMode insertionMode;

  /// Use Offset to specify the placement of your motion graphic overlay on the
  /// video frame. Specify in pixels, from the upper-left corner of the frame. If
  /// you don't specify an offset, the service scales your overlay to the full
  /// size of the frame. Otherwise, the service inserts the overlay at its native
  /// resolution and scales the size up or down with any video scaling.
  @_s.JsonKey(name: 'offset')
  final MotionImageInsertionOffset offset;

  /// Specify whether your motion graphic overlay repeats on a loop or plays only
  /// once.
  @_s.JsonKey(name: 'playback')
  final MotionImagePlayback playback;

  /// Specify when the motion overlay begins. Use timecode format (HH:MM:SS:FF or
  /// HH:MM:SS;FF). Make sure that the timecode you provide here takes into
  /// account how you have set up your timecode configuration under both job
  /// settings and input settings. The simplest way to do that is to set both to
  /// start at 0. If you need to set up your job to follow timecodes embedded in
  /// your source that don't start at zero, make sure that you specify a start
  /// time that is after the first embedded timecode. For more information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/setting-up-timecode.html
  /// Find job-wide and input timecode configuration settings in your JSON job
  /// settings specification at settings>timecodeConfig>source and
  /// settings>inputs>timecodeSource.
  @_s.JsonKey(name: 'startTime')
  final String startTime;

  MotionImageInserter({
    this.framerate,
    this.input,
    this.insertionMode,
    this.offset,
    this.playback,
    this.startTime,
  });
  factory MotionImageInserter.fromJson(Map<String, dynamic> json) =>
      _$MotionImageInserterFromJson(json);

  Map<String, dynamic> toJson() => _$MotionImageInserterToJson(this);
}

/// For motion overlays that don't have a built-in frame rate, specify the frame
/// rate of the overlay in frames per second, as a fraction. For example,
/// specify 24 fps as 24/1. The overlay frame rate doesn't need to match the
/// frame rate of the underlying video.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MotionImageInsertionFramerate {
  /// The bottom of the fraction that expresses your overlay frame rate. For
  /// example, if your frame rate is 24 fps, set this value to 1.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// The top of the fraction that expresses your overlay frame rate. For example,
  /// if your frame rate is 24 fps, set this value to 24.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  MotionImageInsertionFramerate({
    this.framerateDenominator,
    this.framerateNumerator,
  });
  factory MotionImageInsertionFramerate.fromJson(Map<String, dynamic> json) =>
      _$MotionImageInsertionFramerateFromJson(json);

  Map<String, dynamic> toJson() => _$MotionImageInsertionFramerateToJson(this);
}

/// Choose the type of motion graphic asset that you are providing for your
/// overlay. You can choose either a .mov file or a series of .png files.
enum MotionImageInsertionMode {
  @_s.JsonValue('MOV')
  mov,
  @_s.JsonValue('PNG')
  png,
}

/// Specify the offset between the upper-left corner of the video frame and the
/// top left corner of the overlay.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MotionImageInsertionOffset {
  /// Set the distance, in pixels, between the overlay and the left edge of the
  /// video frame.
  @_s.JsonKey(name: 'imageX')
  final int imageX;

  /// Set the distance, in pixels, between the overlay and the top edge of the
  /// video frame.
  @_s.JsonKey(name: 'imageY')
  final int imageY;

  MotionImageInsertionOffset({
    this.imageX,
    this.imageY,
  });
  factory MotionImageInsertionOffset.fromJson(Map<String, dynamic> json) =>
      _$MotionImageInsertionOffsetFromJson(json);

  Map<String, dynamic> toJson() => _$MotionImageInsertionOffsetToJson(this);
}

/// Specify whether your motion graphic overlay repeats on a loop or plays only
/// once.
enum MotionImagePlayback {
  @_s.JsonValue('ONCE')
  once,
  @_s.JsonValue('REPEAT')
  repeat,
}

/// When enabled, include 'clap' atom if appropriate for the video output
/// settings.
enum MovClapAtom {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// When enabled, file composition times will start at zero, composition times
/// in the 'ctts' (composition time to sample) box for B-frames will be
/// negative, and a 'cslg' (composition shift least greatest) box will be
/// included per 14496-1 amendment 1. This improves compatibility with Apple
/// players and tools.
enum MovCslgAtom {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// When set to XDCAM, writes MPEG2 video streams into the QuickTime file using
/// XDCAM fourcc codes. This increases compatibility with Apple editors and
/// players, but may decrease compatibility with other players. Only applicable
/// when the video codec is MPEG2.
enum MovMpeg2FourCCControl {
  @_s.JsonValue('XDCAM')
  xdcam,
  @_s.JsonValue('MPEG')
  mpeg,
}

/// To make this output compatible with Omenon, keep the default value, OMNEON.
/// Unless you need Omneon compatibility, set this value to NONE. When you keep
/// the default value, OMNEON, MediaConvert increases the length of the edit
/// list atom. This might cause file rejections when a recipient of the output
/// file doesn't expct this extra padding.
enum MovPaddingControl {
  @_s.JsonValue('OMNEON')
  omneon,
  @_s.JsonValue('NONE')
  none,
}

/// Always keep the default value (SELF_CONTAINED) for this setting.
enum MovReference {
  @_s.JsonValue('SELF_CONTAINED')
  selfContained,
  @_s.JsonValue('EXTERNAL')
  external,
}

/// Settings for MOV Container.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MovSettings {
  /// When enabled, include 'clap' atom if appropriate for the video output
  /// settings.
  @_s.JsonKey(name: 'clapAtom')
  final MovClapAtom clapAtom;

  /// When enabled, file composition times will start at zero, composition times
  /// in the 'ctts' (composition time to sample) box for B-frames will be
  /// negative, and a 'cslg' (composition shift least greatest) box will be
  /// included per 14496-1 amendment 1. This improves compatibility with Apple
  /// players and tools.
  @_s.JsonKey(name: 'cslgAtom')
  final MovCslgAtom cslgAtom;

  /// When set to XDCAM, writes MPEG2 video streams into the QuickTime file using
  /// XDCAM fourcc codes. This increases compatibility with Apple editors and
  /// players, but may decrease compatibility with other players. Only applicable
  /// when the video codec is MPEG2.
  @_s.JsonKey(name: 'mpeg2FourCCControl')
  final MovMpeg2FourCCControl mpeg2FourCCControl;

  /// To make this output compatible with Omenon, keep the default value, OMNEON.
  /// Unless you need Omneon compatibility, set this value to NONE. When you keep
  /// the default value, OMNEON, MediaConvert increases the length of the edit
  /// list atom. This might cause file rejections when a recipient of the output
  /// file doesn't expct this extra padding.
  @_s.JsonKey(name: 'paddingControl')
  final MovPaddingControl paddingControl;

  /// Always keep the default value (SELF_CONTAINED) for this setting.
  @_s.JsonKey(name: 'reference')
  final MovReference reference;

  MovSettings({
    this.clapAtom,
    this.cslgAtom,
    this.mpeg2FourCCControl,
    this.paddingControl,
    this.reference,
  });
  factory MovSettings.fromJson(Map<String, dynamic> json) =>
      _$MovSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MovSettingsToJson(this);
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value MP2.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Mp2Settings {
  /// Specify the average bitrate in bits per second.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// Set Channels to specify the number of channels in this output audio track.
  /// Choosing Mono in the console will give you 1 output channel; choosing Stereo
  /// will give you 2. In the API, valid values are 1 and 2.
  @_s.JsonKey(name: 'channels')
  final int channels;

  /// Sample rate in hz.
  @_s.JsonKey(name: 'sampleRate')
  final int sampleRate;

  Mp2Settings({
    this.bitrate,
    this.channels,
    this.sampleRate,
  });
  factory Mp2Settings.fromJson(Map<String, dynamic> json) =>
      _$Mp2SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Mp2SettingsToJson(this);
}

/// Specify whether the service encodes this MP3 audio output with a constant
/// bitrate (CBR) or a variable bitrate (VBR).
enum Mp3RateControlMode {
  @_s.JsonValue('CBR')
  cbr,
  @_s.JsonValue('VBR')
  vbr,
}

/// Required when you set Codec, under AudioDescriptions>CodecSettings, to the
/// value MP3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Mp3Settings {
  /// Specify the average bitrate in bits per second.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// Specify the number of channels in this output audio track. Choosing Mono on
  /// the console gives you 1 output channel; choosing Stereo gives you 2. In the
  /// API, valid values are 1 and 2.
  @_s.JsonKey(name: 'channels')
  final int channels;

  /// Specify whether the service encodes this MP3 audio output with a constant
  /// bitrate (CBR) or a variable bitrate (VBR).
  @_s.JsonKey(name: 'rateControlMode')
  final Mp3RateControlMode rateControlMode;

  /// Sample rate in hz.
  @_s.JsonKey(name: 'sampleRate')
  final int sampleRate;

  /// Required when you set Bitrate control mode (rateControlMode) to VBR. Specify
  /// the audio quality of this MP3 output from 0 (highest quality) to 9 (lowest
  /// quality).
  @_s.JsonKey(name: 'vbrQuality')
  final int vbrQuality;

  Mp3Settings({
    this.bitrate,
    this.channels,
    this.rateControlMode,
    this.sampleRate,
    this.vbrQuality,
  });
  factory Mp3Settings.fromJson(Map<String, dynamic> json) =>
      _$Mp3SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Mp3SettingsToJson(this);
}

/// When enabled, file composition times will start at zero, composition times
/// in the 'ctts' (composition time to sample) box for B-frames will be
/// negative, and a 'cslg' (composition shift least greatest) box will be
/// included per 14496-1 amendment 1. This improves compatibility with Apple
/// players and tools.
enum Mp4CslgAtom {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// Inserts a free-space box immediately after the moov box.
enum Mp4FreeSpaceBox {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the beginning
/// of the archive as required for progressive downloading. Otherwise it is
/// placed normally at the end.
enum Mp4MoovPlacement {
  @_s.JsonValue('PROGRESSIVE_DOWNLOAD')
  progressiveDownload,
  @_s.JsonValue('NORMAL')
  normal,
}

/// Settings for MP4 container. You can create audio-only AAC outputs with this
/// container.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Mp4Settings {
  /// Specify this setting only when your output will be consumed by a downstream
  /// repackaging workflow that is sensitive to very small duration differences
  /// between video and audio. For this situation, choose Match video duration
  /// (MATCH_VIDEO_DURATION). In all other cases, keep the default value, Default
  /// codec duration (DEFAULT_CODEC_DURATION). When you choose Match video
  /// duration, MediaConvert pads the output audio streams with silence or trims
  /// them to ensure that the total duration of each audio stream is at least as
  /// long as the total duration of the video stream. After padding or trimming,
  /// the audio stream duration is no more than one frame longer than the video
  /// stream. MediaConvert applies audio padding or trimming only to the end of
  /// the last segment of the output. For unsegmented outputs, MediaConvert adds
  /// padding only to the end of the file. When you keep the default value, any
  /// minor discrepancies between audio and video duration will depend on your
  /// output audio codec.
  @_s.JsonKey(name: 'audioDuration')
  final CmfcAudioDuration audioDuration;

  /// When enabled, file composition times will start at zero, composition times
  /// in the 'ctts' (composition time to sample) box for B-frames will be
  /// negative, and a 'cslg' (composition shift least greatest) box will be
  /// included per 14496-1 amendment 1. This improves compatibility with Apple
  /// players and tools.
  @_s.JsonKey(name: 'cslgAtom')
  final Mp4CslgAtom cslgAtom;

  /// Ignore this setting unless compliance to the CTTS box version specification
  /// matters in your workflow. Specify a value of 1 to set your CTTS box version
  /// to 1 and make your output compliant with the specification. When you specify
  /// a value of 1, you must also set CSLG atom (cslgAtom) to the value INCLUDE.
  /// Keep the default value 0 to set your CTTS box version to 0. This can provide
  /// backward compatibility for some players and packagers.
  @_s.JsonKey(name: 'cttsVersion')
  final int cttsVersion;

  /// Inserts a free-space box immediately after the moov box.
  @_s.JsonKey(name: 'freeSpaceBox')
  final Mp4FreeSpaceBox freeSpaceBox;

  /// If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the beginning
  /// of the archive as required for progressive downloading. Otherwise it is
  /// placed normally at the end.
  @_s.JsonKey(name: 'moovPlacement')
  final Mp4MoovPlacement moovPlacement;

  /// Overrides the "Major Brand" field in the output file. Usually not necessary
  /// to specify.
  @_s.JsonKey(name: 'mp4MajorBrand')
  final String mp4MajorBrand;

  Mp4Settings({
    this.audioDuration,
    this.cslgAtom,
    this.cttsVersion,
    this.freeSpaceBox,
    this.moovPlacement,
    this.mp4MajorBrand,
  });
  factory Mp4Settings.fromJson(Map<String, dynamic> json) =>
      _$Mp4SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Mp4SettingsToJson(this);
}

/// Optional. Choose Include (INCLUDE) to have MediaConvert mark up your DASH
/// manifest with <Accessibility> elements for embedded 608 captions. This
/// markup isn't generally required, but some video players require it to
/// discover and play embedded 608 captions. Keep the default value, Exclude
/// (EXCLUDE), to leave these elements out. When you enable this setting, this
/// is the markup that MediaConvert includes in your manifest: <Accessibility
/// schemeIdUri="urn:scte:dash:cc:cea-608:2015" value="CC1=eng"/>
enum MpdAccessibilityCaptionHints {
  @_s.JsonValue('INCLUDE')
  include,
  @_s.JsonValue('EXCLUDE')
  exclude,
}

/// Specify this setting only when your output will be consumed by a downstream
/// repackaging workflow that is sensitive to very small duration differences
/// between video and audio. For this situation, choose Match video duration
/// (MATCH_VIDEO_DURATION). In all other cases, keep the default value, Default
/// codec duration (DEFAULT_CODEC_DURATION). When you choose Match video
/// duration, MediaConvert pads the output audio streams with silence or trims
/// them to ensure that the total duration of each audio stream is at least as
/// long as the total duration of the video stream. After padding or trimming,
/// the audio stream duration is no more than one frame longer than the video
/// stream. MediaConvert applies audio padding or trimming only to the end of
/// the last segment of the output. For unsegmented outputs, MediaConvert adds
/// padding only to the end of the file. When you keep the default value, any
/// minor discrepancies between audio and video duration will depend on your
/// output audio codec.
enum MpdAudioDuration {
  @_s.JsonValue('DEFAULT_CODEC_DURATION')
  defaultCodecDuration,
  @_s.JsonValue('MATCH_VIDEO_DURATION')
  matchVideoDuration,
}

/// Use this setting only in DASH output groups that include sidecar TTML or
/// IMSC captions.  You specify sidecar captions in a separate output from your
/// audio and video. Choose Raw (RAW) for captions in a single XML file in a raw
/// container. Choose Fragmented MPEG-4 (FRAGMENTED_MP4) for captions in XML
/// format contained within fragmented MP4 files. This set of fragmented MP4
/// files is separate from your video and audio fragmented MP4 files.
enum MpdCaptionContainerType {
  @_s.JsonValue('RAW')
  raw,
  @_s.JsonValue('FRAGMENTED_MP4')
  fragmentedMp4,
}

/// Use this setting only when you specify SCTE-35 markers from ESAM. Choose
/// INSERT to put SCTE-35 markers in this output at the insertion points that
/// you specify in an ESAM XML document. Provide the document in the setting SCC
/// XML (sccXml).
enum MpdScte35Esam {
  @_s.JsonValue('INSERT')
  insert,
  @_s.JsonValue('NONE')
  none,
}

/// Ignore this setting unless you have SCTE-35 markers in your input video
/// file. Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that
/// appear in your input to also appear in this output. Choose None (NONE) if
/// you don't want those SCTE-35 markers in this output.
enum MpdScte35Source {
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
  @_s.JsonValue('NONE')
  none,
}

/// Settings for MP4 segments in DASH
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MpdSettings {
  /// Optional. Choose Include (INCLUDE) to have MediaConvert mark up your DASH
  /// manifest with <Accessibility> elements for embedded 608 captions. This
  /// markup isn't generally required, but some video players require it to
  /// discover and play embedded 608 captions. Keep the default value, Exclude
  /// (EXCLUDE), to leave these elements out. When you enable this setting, this
  /// is the markup that MediaConvert includes in your manifest: <Accessibility
  /// schemeIdUri="urn:scte:dash:cc:cea-608:2015" value="CC1=eng"/>
  @_s.JsonKey(name: 'accessibilityCaptionHints')
  final MpdAccessibilityCaptionHints accessibilityCaptionHints;

  /// Specify this setting only when your output will be consumed by a downstream
  /// repackaging workflow that is sensitive to very small duration differences
  /// between video and audio. For this situation, choose Match video duration
  /// (MATCH_VIDEO_DURATION). In all other cases, keep the default value, Default
  /// codec duration (DEFAULT_CODEC_DURATION). When you choose Match video
  /// duration, MediaConvert pads the output audio streams with silence or trims
  /// them to ensure that the total duration of each audio stream is at least as
  /// long as the total duration of the video stream. After padding or trimming,
  /// the audio stream duration is no more than one frame longer than the video
  /// stream. MediaConvert applies audio padding or trimming only to the end of
  /// the last segment of the output. For unsegmented outputs, MediaConvert adds
  /// padding only to the end of the file. When you keep the default value, any
  /// minor discrepancies between audio and video duration will depend on your
  /// output audio codec.
  @_s.JsonKey(name: 'audioDuration')
  final MpdAudioDuration audioDuration;

  /// Use this setting only in DASH output groups that include sidecar TTML or
  /// IMSC captions.  You specify sidecar captions in a separate output from your
  /// audio and video. Choose Raw (RAW) for captions in a single XML file in a raw
  /// container. Choose Fragmented MPEG-4 (FRAGMENTED_MP4) for captions in XML
  /// format contained within fragmented MP4 files. This set of fragmented MP4
  /// files is separate from your video and audio fragmented MP4 files.
  @_s.JsonKey(name: 'captionContainerType')
  final MpdCaptionContainerType captionContainerType;

  /// Use this setting only when you specify SCTE-35 markers from ESAM. Choose
  /// INSERT to put SCTE-35 markers in this output at the insertion points that
  /// you specify in an ESAM XML document. Provide the document in the setting SCC
  /// XML (sccXml).
  @_s.JsonKey(name: 'scte35Esam')
  final MpdScte35Esam scte35Esam;

  /// Ignore this setting unless you have SCTE-35 markers in your input video
  /// file. Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that
  /// appear in your input to also appear in this output. Choose None (NONE) if
  /// you don't want those SCTE-35 markers in this output.
  @_s.JsonKey(name: 'scte35Source')
  final MpdScte35Source scte35Source;

  MpdSettings({
    this.accessibilityCaptionHints,
    this.audioDuration,
    this.captionContainerType,
    this.scte35Esam,
    this.scte35Source,
  });
  factory MpdSettings.fromJson(Map<String, dynamic> json) =>
      _$MpdSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MpdSettingsToJson(this);
}

/// Specify the strength of any adaptive quantization filters that you enable.
/// The value that you choose here applies to the following settings: Spatial
/// adaptive quantization (spatialAdaptiveQuantization), and Temporal adaptive
/// quantization (temporalAdaptiveQuantization).
enum Mpeg2AdaptiveQuantization {
  @_s.JsonValue('OFF')
  off,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('HIGH')
  high,
}

/// Use Level (Mpeg2CodecLevel) to set the MPEG-2 level for the video output.
enum Mpeg2CodecLevel {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MAIN')
  main,
  @_s.JsonValue('HIGH1440')
  high1440,
  @_s.JsonValue('HIGH')
  high,
}

/// Use Profile (Mpeg2CodecProfile) to set the MPEG-2 profile for the video
/// output.
enum Mpeg2CodecProfile {
  @_s.JsonValue('MAIN')
  main,
  @_s.JsonValue('PROFILE_422')
  profile_422,
}

/// Choose Adaptive to improve subjective video quality for high-motion content.
/// This will cause the service to use fewer B-frames (which infer information
/// based on other frames) for high-motion portions of the video and more
/// B-frames for low-motion portions. The maximum number of B-frames is limited
/// by the value you provide for the setting B frames between reference frames
/// (numberBFramesBetweenReferenceFrames).
enum Mpeg2DynamicSubGop {
  @_s.JsonValue('ADAPTIVE')
  adaptive,
  @_s.JsonValue('STATIC')
  static,
}

/// If you are using the console, use the Framerate setting to specify the frame
/// rate for this output. If you want to keep the same frame rate as the input
/// video, choose Follow source. If you want to do frame rate conversion, choose
/// a frame rate from the dropdown list or choose Custom. The framerates shown
/// in the dropdown list are decimal approximations of fractions. If you choose
/// Custom, specify your frame rate as a fraction. If you are creating your
/// transcoding job specification as a JSON file without the console, use
/// FramerateControl to specify which value the service uses for the frame rate
/// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
/// use the frame rate from the input. Choose SPECIFIED if you want the service
/// to use the frame rate you specify in the settings FramerateNumerator and
/// FramerateDenominator.
enum Mpeg2FramerateControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Choose the method that you want MediaConvert to use when increasing or
/// decreasing the frame rate. We recommend using drop duplicate
/// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
/// fps. For numerically complex conversions, you can use interpolate
/// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
/// introduce undesirable video artifacts. For complex frame rate conversions,
/// especially if your source video has already been converted from its original
/// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
/// interpolation. FrameFormer chooses the best conversion method frame by
/// frame. Note that using FrameFormer increases the transcoding time and incurs
/// a significant add-on cost.
enum Mpeg2FramerateConversionAlgorithm {
  @_s.JsonValue('DUPLICATE_DROP')
  duplicateDrop,
  @_s.JsonValue('INTERPOLATE')
  interpolate,
  @_s.JsonValue('FRAMEFORMER')
  frameformer,
}

/// Indicates if the GOP Size in MPEG2 is specified in frames or seconds. If
/// seconds the system will convert the GOP Size into a frame count at run time.
enum Mpeg2GopSizeUnits {
  @_s.JsonValue('FRAMES')
  frames,
  @_s.JsonValue('SECONDS')
  seconds,
}

/// Choose the scan line type for the output. Keep the default value,
/// Progressive (PROGRESSIVE) to create a progressive output, regardless of the
/// scan type of your input. Use Top field first (TOP_FIELD) or Bottom field
/// first (BOTTOM_FIELD) to create an output that's interlaced with the same
/// field polarity throughout. Use Follow, default top (FOLLOW_TOP_FIELD) or
/// Follow, default bottom (FOLLOW_BOTTOM_FIELD) to produce outputs with the
/// same field polarity as the source. For jobs that have multiple inputs, the
/// output field polarity might change over the course of the output. Follow
/// behavior depends on the input scan type. If the source is interlaced, the
/// output will be interlaced with the same polarity as the source. If the
/// source is progressive, the output will be interlaced with top field bottom
/// field first, depending on which of the Follow options you choose.
enum Mpeg2InterlaceMode {
  @_s.JsonValue('PROGRESSIVE')
  progressive,
  @_s.JsonValue('TOP_FIELD')
  topField,
  @_s.JsonValue('BOTTOM_FIELD')
  bottomField,
  @_s.JsonValue('FOLLOW_TOP_FIELD')
  followTopField,
  @_s.JsonValue('FOLLOW_BOTTOM_FIELD')
  followBottomField,
}

/// Use Intra DC precision (Mpeg2IntraDcPrecision) to set quantization precision
/// for intra-block DC coefficients. If you choose the value auto, the service
/// will automatically select the precision based on the per-frame compression
/// ratio.
enum Mpeg2IntraDcPrecision {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('INTRA_DC_PRECISION_8')
  intraDcPrecision_8,
  @_s.JsonValue('INTRA_DC_PRECISION_9')
  intraDcPrecision_9,
  @_s.JsonValue('INTRA_DC_PRECISION_10')
  intraDcPrecision_10,
  @_s.JsonValue('INTRA_DC_PRECISION_11')
  intraDcPrecision_11,
}

/// Optional. Specify how the service determines the pixel aspect ratio (PAR)
/// for this output. The default behavior, Follow source
/// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
/// output. To specify a different PAR in the console, choose any value other
/// than Follow source. To specify a different PAR by editing the JSON job
/// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
/// you must also specify values for the parNumerator and parDenominator
/// settings.
enum Mpeg2ParControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
/// want to trade off encoding speed for output video quality. The default
/// behavior is faster, lower quality, single-pass encoding.
enum Mpeg2QualityTuningLevel {
  @_s.JsonValue('SINGLE_PASS')
  singlePass,
  @_s.JsonValue('MULTI_PASS')
  multiPass,
}

/// Use Rate control mode (Mpeg2RateControlMode) to specifiy whether the bitrate
/// is variable (vbr) or constant (cbr).
enum Mpeg2RateControlMode {
  @_s.JsonValue('VBR')
  vbr,
  @_s.JsonValue('CBR')
  cbr,
}

/// Enable this setting to insert I-frames at scene changes that the service
/// automatically detects. This improves video quality and is enabled by
/// default.
enum Mpeg2SceneChangeDetect {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value MPEG2.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Mpeg2Settings {
  /// Specify the strength of any adaptive quantization filters that you enable.
  /// The value that you choose here applies to the following settings: Spatial
  /// adaptive quantization (spatialAdaptiveQuantization), and Temporal adaptive
  /// quantization (temporalAdaptiveQuantization).
  @_s.JsonKey(name: 'adaptiveQuantization')
  final Mpeg2AdaptiveQuantization adaptiveQuantization;

  /// Specify the average bitrate in bits per second. Required for VBR and CBR.
  /// For MS Smooth outputs, bitrates must be unique when rounded down to the
  /// nearest multiple of 1000.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// Use Level (Mpeg2CodecLevel) to set the MPEG-2 level for the video output.
  @_s.JsonKey(name: 'codecLevel')
  final Mpeg2CodecLevel codecLevel;

  /// Use Profile (Mpeg2CodecProfile) to set the MPEG-2 profile for the video
  /// output.
  @_s.JsonKey(name: 'codecProfile')
  final Mpeg2CodecProfile codecProfile;

  /// Choose Adaptive to improve subjective video quality for high-motion content.
  /// This will cause the service to use fewer B-frames (which infer information
  /// based on other frames) for high-motion portions of the video and more
  /// B-frames for low-motion portions. The maximum number of B-frames is limited
  /// by the value you provide for the setting B frames between reference frames
  /// (numberBFramesBetweenReferenceFrames).
  @_s.JsonKey(name: 'dynamicSubGop')
  final Mpeg2DynamicSubGop dynamicSubGop;

  /// If you are using the console, use the Framerate setting to specify the frame
  /// rate for this output. If you want to keep the same frame rate as the input
  /// video, choose Follow source. If you want to do frame rate conversion, choose
  /// a frame rate from the dropdown list or choose Custom. The framerates shown
  /// in the dropdown list are decimal approximations of fractions. If you choose
  /// Custom, specify your frame rate as a fraction. If you are creating your
  /// transcoding job specification as a JSON file without the console, use
  /// FramerateControl to specify which value the service uses for the frame rate
  /// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
  /// use the frame rate from the input. Choose SPECIFIED if you want the service
  /// to use the frame rate you specify in the settings FramerateNumerator and
  /// FramerateDenominator.
  @_s.JsonKey(name: 'framerateControl')
  final Mpeg2FramerateControl framerateControl;

  /// Choose the method that you want MediaConvert to use when increasing or
  /// decreasing the frame rate. We recommend using drop duplicate
  /// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
  /// fps. For numerically complex conversions, you can use interpolate
  /// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
  /// introduce undesirable video artifacts. For complex frame rate conversions,
  /// especially if your source video has already been converted from its original
  /// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
  /// interpolation. FrameFormer chooses the best conversion method frame by
  /// frame. Note that using FrameFormer increases the transcoding time and incurs
  /// a significant add-on cost.
  @_s.JsonKey(name: 'framerateConversionAlgorithm')
  final Mpeg2FramerateConversionAlgorithm framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// Frequency of closed GOPs. In streaming applications, it is recommended that
  /// this be set to 1 so a decoder joining mid-stream will receive an IDR frame
  /// as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  @_s.JsonKey(name: 'gopClosedCadence')
  final int gopClosedCadence;

  /// GOP Length (keyframe interval) in frames or seconds. Must be greater than
  /// zero.
  @_s.JsonKey(name: 'gopSize')
  final double gopSize;

  /// Indicates if the GOP Size in MPEG2 is specified in frames or seconds. If
  /// seconds the system will convert the GOP Size into a frame count at run time.
  @_s.JsonKey(name: 'gopSizeUnits')
  final Mpeg2GopSizeUnits gopSizeUnits;

  /// Percentage of the buffer that should initially be filled (HRD buffer model).
  @_s.JsonKey(name: 'hrdBufferInitialFillPercentage')
  final int hrdBufferInitialFillPercentage;

  /// Size of buffer (HRD buffer model) in bits. For example, enter five megabits
  /// as 5000000.
  @_s.JsonKey(name: 'hrdBufferSize')
  final int hrdBufferSize;

  /// Choose the scan line type for the output. Keep the default value,
  /// Progressive (PROGRESSIVE) to create a progressive output, regardless of the
  /// scan type of your input. Use Top field first (TOP_FIELD) or Bottom field
  /// first (BOTTOM_FIELD) to create an output that's interlaced with the same
  /// field polarity throughout. Use Follow, default top (FOLLOW_TOP_FIELD) or
  /// Follow, default bottom (FOLLOW_BOTTOM_FIELD) to produce outputs with the
  /// same field polarity as the source. For jobs that have multiple inputs, the
  /// output field polarity might change over the course of the output. Follow
  /// behavior depends on the input scan type. If the source is interlaced, the
  /// output will be interlaced with the same polarity as the source. If the
  /// source is progressive, the output will be interlaced with top field bottom
  /// field first, depending on which of the Follow options you choose.
  @_s.JsonKey(name: 'interlaceMode')
  final Mpeg2InterlaceMode interlaceMode;

  /// Use Intra DC precision (Mpeg2IntraDcPrecision) to set quantization precision
  /// for intra-block DC coefficients. If you choose the value auto, the service
  /// will automatically select the precision based on the per-frame compression
  /// ratio.
  @_s.JsonKey(name: 'intraDcPrecision')
  final Mpeg2IntraDcPrecision intraDcPrecision;

  /// Maximum bitrate in bits/second. For example, enter five megabits per second
  /// as 5000000.
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  /// Enforces separation between repeated (cadence) I-frames and I-frames
  /// inserted by Scene Change Detection. If a scene change I-frame is within
  /// I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched
  /// to the scene change I-frame. GOP stretch requires enabling lookahead as well
  /// as setting I-interval. The normal cadence resumes for the next GOP. This
  /// setting is only used when Scene Change Detect is enabled. Note: Maximum GOP
  /// stretch = GOP size + Min-I-interval - 1
  @_s.JsonKey(name: 'minIInterval')
  final int minIInterval;

  /// Number of B-frames between reference frames.
  @_s.JsonKey(name: 'numberBFramesBetweenReferenceFrames')
  final int numberBFramesBetweenReferenceFrames;

  /// Optional. Specify how the service determines the pixel aspect ratio (PAR)
  /// for this output. The default behavior, Follow source
  /// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
  /// output. To specify a different PAR in the console, choose any value other
  /// than Follow source. To specify a different PAR by editing the JSON job
  /// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
  /// you must also specify values for the parNumerator and parDenominator
  /// settings.
  @_s.JsonKey(name: 'parControl')
  final Mpeg2ParControl parControl;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parDenominator is 33.
  @_s.JsonKey(name: 'parDenominator')
  final int parDenominator;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parNumerator is 40.
  @_s.JsonKey(name: 'parNumerator')
  final int parNumerator;

  /// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
  /// want to trade off encoding speed for output video quality. The default
  /// behavior is faster, lower quality, single-pass encoding.
  @_s.JsonKey(name: 'qualityTuningLevel')
  final Mpeg2QualityTuningLevel qualityTuningLevel;

  /// Use Rate control mode (Mpeg2RateControlMode) to specifiy whether the bitrate
  /// is variable (vbr) or constant (cbr).
  @_s.JsonKey(name: 'rateControlMode')
  final Mpeg2RateControlMode rateControlMode;

  /// Enable this setting to insert I-frames at scene changes that the service
  /// automatically detects. This improves video quality and is enabled by
  /// default.
  @_s.JsonKey(name: 'sceneChangeDetect')
  final Mpeg2SceneChangeDetect sceneChangeDetect;

  /// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
  /// second (fps). Enable slow PAL to create a 25 fps output. When you enable
  /// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
  /// your audio to keep it synchronized with the video. Note that enabling this
  /// setting will slightly reduce the duration of your video. Required settings:
  /// You must also set Framerate to 25. In your JSON job specification, set
  /// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
  /// (framerateDenominator) to 1.
  @_s.JsonKey(name: 'slowPal')
  final Mpeg2SlowPal slowPal;

  /// Ignore this setting unless you need to comply with a specification that
  /// requires a specific value. If you don't have a specification requirement, we
  /// recommend that you adjust the softness of your output by using a lower value
  /// for the setting Sharpness (sharpness) or by enabling a noise reducer filter
  /// (noiseReducerFilter). The Softness (softness) setting specifies the
  /// quantization matrices that the encoder uses. Keep the default value, 0, to
  /// use the AWS Elemental default matrices. Choose a value from 17 to 128 to use
  /// planar interpolation. Increasing values from 17 to 128 result in increasing
  /// reduction of high-frequency data. The value 128 results in the softest
  /// video.
  @_s.JsonKey(name: 'softness')
  final int softness;

  /// Keep the default value, Enabled (ENABLED), to adjust quantization within
  /// each frame based on spatial variation of content complexity. When you enable
  /// this feature, the encoder uses fewer bits on areas that can sustain more
  /// distortion with no noticeable visual degradation and uses more bits on areas
  /// where any small distortion will be noticeable. For example, complex textured
  /// blocks are encoded with fewer bits and smooth textured blocks are encoded
  /// with more bits. Enabling this feature will almost always improve your video
  /// quality. Note, though, that this feature doesn't take into account where the
  /// viewer's attention is likely to be. If viewers are likely to be focusing
  /// their attention on a part of the screen with a lot of complex texture, you
  /// might choose to disable this feature. Related setting: When you enable
  /// spatial adaptive quantization, set the value for Adaptive quantization
  /// (adaptiveQuantization) depending on your content. For homogeneous content,
  /// such as cartoons and video games, set it to Low. For content with a wider
  /// variety of textures, set it to High or Higher.
  @_s.JsonKey(name: 'spatialAdaptiveQuantization')
  final Mpeg2SpatialAdaptiveQuantization spatialAdaptiveQuantization;

  /// Specify whether this output's video uses the D10 syntax. Keep the default
  /// value to  not use the syntax. Related settings: When you choose D10 (D_10)
  /// for your MXF  profile (profile), you must also set this value to to D10
  /// (D_10).
  @_s.JsonKey(name: 'syntax')
  final Mpeg2Syntax syntax;

  /// When you do frame rate conversion from 23.976 frames per second (fps) to
  /// 29.97 fps, and your output scan type is interlaced, you can optionally
  /// enable hard or soft telecine to create a smoother picture. Hard telecine
  /// (HARD) produces a 29.97i output. Soft telecine (SOFT) produces an output
  /// with a 23.976 output that signals to the video player device to do the
  /// conversion during play back. When you keep the default value, None (NONE),
  /// MediaConvert does a standard frame rate conversion to 29.97 without doing
  /// anything with the field polarity to create a smoother picture.
  @_s.JsonKey(name: 'telecine')
  final Mpeg2Telecine telecine;

  /// Keep the default value, Enabled (ENABLED), to adjust quantization within
  /// each frame based on temporal variation of content complexity. When you
  /// enable this feature, the encoder uses fewer bits on areas of the frame that
  /// aren't moving and uses more bits on complex objects with sharp edges that
  /// move a lot. For example, this feature improves the readability of text
  /// tickers on newscasts and scoreboards on sports matches. Enabling this
  /// feature will almost always improve your video quality. Note, though, that
  /// this feature doesn't take into account where the viewer's attention is
  /// likely to be. If viewers are likely to be focusing their attention on a part
  /// of the screen that doesn't have moving objects with sharp edges, such as
  /// sports athletes' faces, you might choose to disable this feature. Related
  /// setting: When you enable temporal quantization, adjust the strength of the
  /// filter with the setting Adaptive quantization (adaptiveQuantization).
  @_s.JsonKey(name: 'temporalAdaptiveQuantization')
  final Mpeg2TemporalAdaptiveQuantization temporalAdaptiveQuantization;

  Mpeg2Settings({
    this.adaptiveQuantization,
    this.bitrate,
    this.codecLevel,
    this.codecProfile,
    this.dynamicSubGop,
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.gopClosedCadence,
    this.gopSize,
    this.gopSizeUnits,
    this.hrdBufferInitialFillPercentage,
    this.hrdBufferSize,
    this.interlaceMode,
    this.intraDcPrecision,
    this.maxBitrate,
    this.minIInterval,
    this.numberBFramesBetweenReferenceFrames,
    this.parControl,
    this.parDenominator,
    this.parNumerator,
    this.qualityTuningLevel,
    this.rateControlMode,
    this.sceneChangeDetect,
    this.slowPal,
    this.softness,
    this.spatialAdaptiveQuantization,
    this.syntax,
    this.telecine,
    this.temporalAdaptiveQuantization,
  });
  factory Mpeg2Settings.fromJson(Map<String, dynamic> json) =>
      _$Mpeg2SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Mpeg2SettingsToJson(this);
}

/// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
/// second (fps). Enable slow PAL to create a 25 fps output. When you enable
/// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
/// your audio to keep it synchronized with the video. Note that enabling this
/// setting will slightly reduce the duration of your video. Required settings:
/// You must also set Framerate to 25. In your JSON job specification, set
/// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
/// (framerateDenominator) to 1.
enum Mpeg2SlowPal {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Keep the default value, Enabled (ENABLED), to adjust quantization within
/// each frame based on spatial variation of content complexity. When you enable
/// this feature, the encoder uses fewer bits on areas that can sustain more
/// distortion with no noticeable visual degradation and uses more bits on areas
/// where any small distortion will be noticeable. For example, complex textured
/// blocks are encoded with fewer bits and smooth textured blocks are encoded
/// with more bits. Enabling this feature will almost always improve your video
/// quality. Note, though, that this feature doesn't take into account where the
/// viewer's attention is likely to be. If viewers are likely to be focusing
/// their attention on a part of the screen with a lot of complex texture, you
/// might choose to disable this feature. Related setting: When you enable
/// spatial adaptive quantization, set the value for Adaptive quantization
/// (adaptiveQuantization) depending on your content. For homogeneous content,
/// such as cartoons and video games, set it to Low. For content with a wider
/// variety of textures, set it to High or Higher.
enum Mpeg2SpatialAdaptiveQuantization {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Specify whether this output's video uses the D10 syntax. Keep the default
/// value to  not use the syntax. Related settings: When you choose D10 (D_10)
/// for your MXF  profile (profile), you must also set this value to to D10
/// (D_10).
enum Mpeg2Syntax {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('D_10')
  d_10,
}

/// When you do frame rate conversion from 23.976 frames per second (fps) to
/// 29.97 fps, and your output scan type is interlaced, you can optionally
/// enable hard or soft telecine to create a smoother picture. Hard telecine
/// (HARD) produces a 29.97i output. Soft telecine (SOFT) produces an output
/// with a 23.976 output that signals to the video player device to do the
/// conversion during play back. When you keep the default value, None (NONE),
/// MediaConvert does a standard frame rate conversion to 29.97 without doing
/// anything with the field polarity to create a smoother picture.
enum Mpeg2Telecine {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('SOFT')
  soft,
  @_s.JsonValue('HARD')
  hard,
}

/// Keep the default value, Enabled (ENABLED), to adjust quantization within
/// each frame based on temporal variation of content complexity. When you
/// enable this feature, the encoder uses fewer bits on areas of the frame that
/// aren't moving and uses more bits on complex objects with sharp edges that
/// move a lot. For example, this feature improves the readability of text
/// tickers on newscasts and scoreboards on sports matches. Enabling this
/// feature will almost always improve your video quality. Note, though, that
/// this feature doesn't take into account where the viewer's attention is
/// likely to be. If viewers are likely to be focusing their attention on a part
/// of the screen that doesn't have moving objects with sharp edges, such as
/// sports athletes' faces, you might choose to disable this feature. Related
/// setting: When you enable temporal quantization, adjust the strength of the
/// filter with the setting Adaptive quantization (adaptiveQuantization).
enum Mpeg2TemporalAdaptiveQuantization {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Specify the details for each additional Microsoft Smooth Streaming manifest
/// that you want the service to generate for this output group. Each manifest
/// can reference a different subset of outputs in the group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MsSmoothAdditionalManifest {
  /// Specify a name modifier that the service adds to the name of this manifest
  /// to make it different from the file names of the other main manifests in the
  /// output group. For example, say that the default main manifest for your
  /// Microsoft Smooth group is film-name.ismv. If you enter "-no-premium" for
  /// this setting, then the file name the service generates for this top-level
  /// manifest is film-name-no-premium.ismv.
  @_s.JsonKey(name: 'manifestNameModifier')
  final String manifestNameModifier;

  /// Specify the outputs that you want this additional top-level manifest to
  /// reference.
  @_s.JsonKey(name: 'selectedOutputs')
  final List<String> selectedOutputs;

  MsSmoothAdditionalManifest({
    this.manifestNameModifier,
    this.selectedOutputs,
  });
  factory MsSmoothAdditionalManifest.fromJson(Map<String, dynamic> json) =>
      _$MsSmoothAdditionalManifestFromJson(json);

  Map<String, dynamic> toJson() => _$MsSmoothAdditionalManifestToJson(this);
}

/// COMBINE_DUPLICATE_STREAMS combines identical audio encoding settings across
/// a Microsoft Smooth output group into a single audio stream.
enum MsSmoothAudioDeduplication {
  @_s.JsonValue('COMBINE_DUPLICATE_STREAMS')
  combineDuplicateStreams,
  @_s.JsonValue('NONE')
  none,
}

/// If you are using DRM, set DRM System (MsSmoothEncryptionSettings) to specify
/// the value SpekeKeyProvider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MsSmoothEncryptionSettings {
  /// If your output group type is HLS, DASH, or Microsoft Smooth, use these
  /// settings when doing DRM encryption with a SPEKE-compliant key provider.  If
  /// your output group type is CMAF, use the SpekeKeyProviderCmaf settings
  /// instead.
  @_s.JsonKey(name: 'spekeKeyProvider')
  final SpekeKeyProvider spekeKeyProvider;

  MsSmoothEncryptionSettings({
    this.spekeKeyProvider,
  });
  factory MsSmoothEncryptionSettings.fromJson(Map<String, dynamic> json) =>
      _$MsSmoothEncryptionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MsSmoothEncryptionSettingsToJson(this);
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// MS_SMOOTH_GROUP_SETTINGS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MsSmoothGroupSettings {
  /// By default, the service creates one .ism Microsoft Smooth Streaming manifest
  /// for each Microsoft Smooth Streaming output group in your job. This default
  /// manifest references every output in the output group. To create additional
  /// manifests that reference a subset of the outputs in the output group,
  /// specify a list of them here.
  @_s.JsonKey(name: 'additionalManifests')
  final List<MsSmoothAdditionalManifest> additionalManifests;

  /// COMBINE_DUPLICATE_STREAMS combines identical audio encoding settings across
  /// a Microsoft Smooth output group into a single audio stream.
  @_s.JsonKey(name: 'audioDeduplication')
  final MsSmoothAudioDeduplication audioDeduplication;

  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do not
  /// specify the base filename in the URI, the service will use the filename of
  /// the input file. If your job has multiple inputs, the service uses the
  /// filename of the first input file.
  @_s.JsonKey(name: 'destination')
  final String destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  @_s.JsonKey(name: 'destinationSettings')
  final DestinationSettings destinationSettings;

  /// If you are using DRM, set DRM System (MsSmoothEncryptionSettings) to specify
  /// the value SpekeKeyProvider.
  @_s.JsonKey(name: 'encryption')
  final MsSmoothEncryptionSettings encryption;

  /// Use Fragment length (FragmentLength) to specify the mp4 fragment sizes in
  /// seconds. Fragment length must be compatible with GOP size and frame rate.
  @_s.JsonKey(name: 'fragmentLength')
  final int fragmentLength;

  /// Use Manifest encoding (MsSmoothManifestEncoding) to specify the encoding
  /// format for the server and client manifest. Valid options are utf8 and utf16.
  @_s.JsonKey(name: 'manifestEncoding')
  final MsSmoothManifestEncoding manifestEncoding;

  MsSmoothGroupSettings({
    this.additionalManifests,
    this.audioDeduplication,
    this.destination,
    this.destinationSettings,
    this.encryption,
    this.fragmentLength,
    this.manifestEncoding,
  });
  factory MsSmoothGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$MsSmoothGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MsSmoothGroupSettingsToJson(this);
}

/// Use Manifest encoding (MsSmoothManifestEncoding) to specify the encoding
/// format for the server and client manifest. Valid options are utf8 and utf16.
enum MsSmoothManifestEncoding {
  @_s.JsonValue('UTF8')
  utf8,
  @_s.JsonValue('UTF16')
  utf16,
}

/// Optional. When you have AFD signaling set up in your output video stream,
/// use this setting to choose whether to also include it in the MXF wrapper.
/// Choose Don't copy (NO_COPY) to exclude AFD signaling from the MXF wrapper.
/// Choose Copy from video stream (COPY_FROM_VIDEO) to copy the AFD values from
/// the video stream for this output to the MXF wrapper. Regardless of which
/// option you choose, the AFD values remain in the video stream. Related
/// settings: To set up your output to include or exclude AFD values, see
/// AfdSignaling, under VideoDescription. On the console, find AFD signaling
/// under the output's video encoding settings.
enum MxfAfdSignaling {
  @_s.JsonValue('NO_COPY')
  noCopy,
  @_s.JsonValue('COPY_FROM_VIDEO')
  copyFromVideo,
}

/// Specify the MXF profile, also called shim, for this output. When you choose
/// Auto, MediaConvert chooses a profile based on the video codec and
/// resolution. For a list of codecs supported with each MXF profile, see
/// https://docs.aws.amazon.com/mediaconvert/latest/ug/codecs-supported-with-each-mxf-profile.html.
/// For more information about the automatic selection behavior, see
/// https://docs.aws.amazon.com/mediaconvert/latest/ug/default-automatic-selection-of-mxf-profiles.html.
enum MxfProfile {
  @_s.JsonValue('D_10')
  d_10,
  @_s.JsonValue('XDCAM')
  xdcam,
  @_s.JsonValue('OP1A')
  op1a,
}

/// MXF settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MxfSettings {
  /// Optional. When you have AFD signaling set up in your output video stream,
  /// use this setting to choose whether to also include it in the MXF wrapper.
  /// Choose Don't copy (NO_COPY) to exclude AFD signaling from the MXF wrapper.
  /// Choose Copy from video stream (COPY_FROM_VIDEO) to copy the AFD values from
  /// the video stream for this output to the MXF wrapper. Regardless of which
  /// option you choose, the AFD values remain in the video stream. Related
  /// settings: To set up your output to include or exclude AFD values, see
  /// AfdSignaling, under VideoDescription. On the console, find AFD signaling
  /// under the output's video encoding settings.
  @_s.JsonKey(name: 'afdSignaling')
  final MxfAfdSignaling afdSignaling;

  /// Specify the MXF profile, also called shim, for this output. When you choose
  /// Auto, MediaConvert chooses a profile based on the video codec and
  /// resolution. For a list of codecs supported with each MXF profile, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/codecs-supported-with-each-mxf-profile.html.
  /// For more information about the automatic selection behavior, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/default-automatic-selection-of-mxf-profiles.html.
  @_s.JsonKey(name: 'profile')
  final MxfProfile profile;

  MxfSettings({
    this.afdSignaling,
    this.profile,
  });
  factory MxfSettings.fromJson(Map<String, dynamic> json) =>
      _$MxfSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MxfSettingsToJson(this);
}

/// For forensic video watermarking, MediaConvert supports Nagra NexGuard File
/// Marker watermarking. MediaConvert supports both PreRelease Content (NGPR/G2)
/// and OTT Streaming workflows.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NexGuardFileMarkerSettings {
  /// Use the base64 license string that Nagra provides you. Enter it directly in
  /// your JSON job specification or in the console. Required when you include
  /// Nagra NexGuard File Marker watermarking (NexGuardWatermarkingSettings) in
  /// your job.
  @_s.JsonKey(name: 'license')
  final String license;

  /// Specify the payload ID that you want associated with this output. Valid
  /// values vary depending on your Nagra NexGuard forensic watermarking workflow.
  /// Required when you include Nagra NexGuard File Marker watermarking
  /// (NexGuardWatermarkingSettings) in your job. For PreRelease Content
  /// (NGPR/G2), specify an integer from 1 through 4,194,303. You must generate a
  /// unique ID for each asset you watermark, and keep a record of which ID you
  /// have assigned to each asset. Neither Nagra nor MediaConvert keep track of
  /// the relationship between output files and your IDs. For OTT Streaming,
  /// create two adaptive bitrate (ABR) stacks for each asset. Do this by setting
  /// up two output groups. For one output group, set the value of Payload ID
  /// (payload) to 0 in every output. For the other output group, set Payload ID
  /// (payload) to 1 in every output.
  @_s.JsonKey(name: 'payload')
  final int payload;

  /// Enter one of the watermarking preset strings that Nagra provides you.
  /// Required when you include Nagra NexGuard File Marker watermarking
  /// (NexGuardWatermarkingSettings) in your job.
  @_s.JsonKey(name: 'preset')
  final String preset;

  /// Optional. Ignore this setting unless Nagra support directs you to specify a
  /// value. When you don't specify a value here, the Nagra NexGuard library uses
  /// its default value.
  @_s.JsonKey(name: 'strength')
  final WatermarkingStrength strength;

  NexGuardFileMarkerSettings({
    this.license,
    this.payload,
    this.preset,
    this.strength,
  });
  factory NexGuardFileMarkerSettings.fromJson(Map<String, dynamic> json) =>
      _$NexGuardFileMarkerSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$NexGuardFileMarkerSettingsToJson(this);
}

/// Choose the type of Nielsen watermarks that you want in your outputs. When
/// you choose NAES 2 and NW (NAES2_AND_NW), you must provide a value for the
/// setting SID (sourceId). When you choose CBET (CBET), you must provide a
/// value for the setting CSID (cbetSourceId). When you choose NAES 2, NW, and
/// CBET (NAES2_AND_NW_AND_CBET), you must provide values for both of these
/// settings.
enum NielsenActiveWatermarkProcessType {
  @_s.JsonValue('NAES2_AND_NW')
  naes2AndNw,
  @_s.JsonValue('CBET')
  cbet,
  @_s.JsonValue('NAES2_AND_NW_AND_CBET')
  naes2AndNwAndCbet,
}

/// Settings for your Nielsen configuration. If you don't do Nielsen measurement
/// and analytics, ignore these settings. When you enable Nielsen configuration
/// (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all
/// outputs in the job. To enable Nielsen configuration programmatically,
/// include an instance of nielsenConfiguration in your JSON job specification.
/// Even if you don't include any children of nielsenConfiguration, you still
/// enable the setting.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NielsenConfiguration {
  /// Nielsen has discontinued the use of breakout code functionality. If you must
  /// include this property, set the value to zero.
  @_s.JsonKey(name: 'breakoutCode')
  final int breakoutCode;

  /// Use Distributor ID (DistributorID) to specify the distributor ID that is
  /// assigned to your organization by Neilsen.
  @_s.JsonKey(name: 'distributorId')
  final String distributorId;

  NielsenConfiguration({
    this.breakoutCode,
    this.distributorId,
  });
  factory NielsenConfiguration.fromJson(Map<String, dynamic> json) =>
      _$NielsenConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$NielsenConfigurationToJson(this);
}

/// Ignore these settings unless you are using Nielsen non-linear watermarking.
/// Specify the values that  MediaConvert uses to generate and place Nielsen
/// watermarks in your output audio. In addition to  specifying these values,
/// you also need to set up your cloud TIC server. These settings apply to
/// every output in your job. The MediaConvert implementation is currently with
/// the following Nielsen versions: Nielsen Watermark SDK Version 5.2.1 Nielsen
/// NLM Watermark Engine Version 1.2.7 Nielsen Watermark Authenticator [SID_TIC]
/// Version [5.0.0]
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NielsenNonLinearWatermarkSettings {
  /// Choose the type of Nielsen watermarks that you want in your outputs. When
  /// you choose NAES 2 and NW (NAES2_AND_NW), you must provide a value for the
  /// setting SID (sourceId). When you choose CBET (CBET), you must provide a
  /// value for the setting CSID (cbetSourceId). When you choose NAES 2, NW, and
  /// CBET (NAES2_AND_NW_AND_CBET), you must provide values for both of these
  /// settings.
  @_s.JsonKey(name: 'activeWatermarkProcess')
  final NielsenActiveWatermarkProcessType activeWatermarkProcess;

  /// Optional. Use this setting when you want the service to include an ADI file
  /// in the Nielsen  metadata .zip file. To provide an ADI file, store it in
  /// Amazon S3 and provide a URL to it  here. The URL should be in the following
  /// format: S3://bucket/path/ADI-file. For more information about the metadata
  /// .zip file, see the setting Metadata destination (metadataDestination).
  @_s.JsonKey(name: 'adiFilename')
  final String adiFilename;

  /// Use the asset ID that you provide to Nielsen to uniquely identify this
  /// asset. Required for all Nielsen non-linear watermarking.
  @_s.JsonKey(name: 'assetId')
  final String assetId;

  /// Use the asset name that you provide to Nielsen for this asset. Required for
  /// all Nielsen non-linear watermarking.
  @_s.JsonKey(name: 'assetName')
  final String assetName;

  /// Use the CSID that Nielsen provides to you. This CBET source ID should be
  /// unique to your Nielsen account but common to all of your output assets that
  /// have CBET watermarking. Required when you choose a value for the setting
  /// Watermark types (ActiveWatermarkProcess) that includes CBET.
  @_s.JsonKey(name: 'cbetSourceId')
  final String cbetSourceId;

  /// Optional. If this asset uses an episode ID with Nielsen, provide it here.
  @_s.JsonKey(name: 'episodeId')
  final String episodeId;

  /// Specify the Amazon S3 location where you want MediaConvert to save your
  /// Nielsen non-linear metadata .zip file. This Amazon S3 bucket must be in the
  /// same Region as the one where you do your MediaConvert transcoding. If you
  /// want to include an ADI file in this .zip file, use the setting ADI file
  /// (adiFilename) to specify it. MediaConvert delivers the Nielsen metadata .zip
  /// files only to your metadata destination Amazon S3 bucket. It doesn't deliver
  /// the .zip files to Nielsen. You are responsible for delivering the metadata
  /// .zip files to Nielsen.
  @_s.JsonKey(name: 'metadataDestination')
  final String metadataDestination;

  /// Use the SID that Nielsen provides to you. This source ID should be unique to
  /// your Nielsen account but common to all of your output assets. Required for
  /// all Nielsen non-linear watermarking. This ID should be unique to your
  /// Nielsen account but common to all of your output assets. Required for all
  /// Nielsen non-linear watermarking.
  @_s.JsonKey(name: 'sourceId')
  final int sourceId;

  /// Required. Specify whether your source content already contains Nielsen
  /// non-linear watermarks. When you set this value to Watermarked (WATERMARKED),
  /// the service fails the job. Nielsen requires that you add non-linear
  /// watermarking to only clean content that doesn't already  have non-linear
  /// Nielsen watermarks.
  @_s.JsonKey(name: 'sourceWatermarkStatus')
  final NielsenSourceWatermarkStatusType sourceWatermarkStatus;

  /// Specify the endpoint for the TIC server that you have deployed and
  /// configured in the AWS Cloud. Required for all Nielsen non-linear
  /// watermarking. MediaConvert can't connect directly to a TIC server. Instead,
  /// you must use API Gateway to provide a RESTful interface between MediaConvert
  /// and a TIC server that you deploy in your AWS account. For more information
  /// on deploying a TIC server in your AWS account and the required API Gateway,
  /// contact Nielsen support.
  @_s.JsonKey(name: 'ticServerUrl')
  final String ticServerUrl;

  /// To create assets that have the same TIC values in each audio track, keep the
  /// default value Share TICs (SAME_TICS_PER_TRACK). To create assets that have
  /// unique TIC values for each audio track, choose Use unique TICs
  /// (RESERVE_UNIQUE_TICS_PER_TRACK).
  @_s.JsonKey(name: 'uniqueTicPerAudioTrack')
  final NielsenUniqueTicPerAudioTrackType uniqueTicPerAudioTrack;

  NielsenNonLinearWatermarkSettings({
    this.activeWatermarkProcess,
    this.adiFilename,
    this.assetId,
    this.assetName,
    this.cbetSourceId,
    this.episodeId,
    this.metadataDestination,
    this.sourceId,
    this.sourceWatermarkStatus,
    this.ticServerUrl,
    this.uniqueTicPerAudioTrack,
  });
  factory NielsenNonLinearWatermarkSettings.fromJson(
          Map<String, dynamic> json) =>
      _$NielsenNonLinearWatermarkSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NielsenNonLinearWatermarkSettingsToJson(this);
}

/// Required. Specify whether your source content already contains Nielsen
/// non-linear watermarks. When you set this value to Watermarked (WATERMARKED),
/// the service fails the job. Nielsen requires that you add non-linear
/// watermarking to only clean content that doesn't already  have non-linear
/// Nielsen watermarks.
enum NielsenSourceWatermarkStatusType {
  @_s.JsonValue('CLEAN')
  clean,
  @_s.JsonValue('WATERMARKED')
  watermarked,
}

/// To create assets that have the same TIC values in each audio track, keep the
/// default value Share TICs (SAME_TICS_PER_TRACK). To create assets that have
/// unique TIC values for each audio track, choose Use unique TICs
/// (RESERVE_UNIQUE_TICS_PER_TRACK).
enum NielsenUniqueTicPerAudioTrackType {
  @_s.JsonValue('RESERVE_UNIQUE_TICS_PER_TRACK')
  reserveUniqueTicsPerTrack,
  @_s.JsonValue('SAME_TICS_PER_TRACK')
  sameTicsPerTrack,
}

/// Optional. When you set Noise reducer (noiseReducer) to Temporal (TEMPORAL),
/// you can use this setting to apply sharpening. The default behavior, Auto
/// (AUTO), allows the transcoder to determine whether to apply filtering,
/// depending on input type and quality. When you set Noise reducer to Temporal,
/// your output bandwidth is reduced. When Post temporal sharpening is also
/// enabled, that bandwidth reduction is smaller.
enum NoiseFilterPostTemporalSharpening {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('AUTO')
  auto,
}

/// Enable the Noise reducer (NoiseReducer) feature to remove noise from your
/// video output if necessary. Enable or disable this feature for each output
/// individually. This setting is disabled by default. When you enable Noise
/// reducer (NoiseReducer), you must also select a value for Noise reducer
/// filter (NoiseReducerFilter).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NoiseReducer {
  /// Use Noise reducer filter (NoiseReducerFilter) to select one of the following
  /// spatial image filtering functions. To use this setting, you must also enable
  /// Noise reducer (NoiseReducer). * Bilateral preserves edges while reducing
  /// noise. * Mean (softest), Gaussian, Lanczos, and Sharpen (sharpest) do
  /// convolution filtering. * Conserve does min/max noise reduction. * Spatial
  /// does frequency-domain filtering based on JND principles. * Temporal
  /// optimizes video quality for complex motion.
  @_s.JsonKey(name: 'filter')
  final NoiseReducerFilter filter;

  /// Settings for a noise reducer filter
  @_s.JsonKey(name: 'filterSettings')
  final NoiseReducerFilterSettings filterSettings;

  /// Noise reducer filter settings for spatial filter.
  @_s.JsonKey(name: 'spatialFilterSettings')
  final NoiseReducerSpatialFilterSettings spatialFilterSettings;

  /// Noise reducer filter settings for temporal filter.
  @_s.JsonKey(name: 'temporalFilterSettings')
  final NoiseReducerTemporalFilterSettings temporalFilterSettings;

  NoiseReducer({
    this.filter,
    this.filterSettings,
    this.spatialFilterSettings,
    this.temporalFilterSettings,
  });
  factory NoiseReducer.fromJson(Map<String, dynamic> json) =>
      _$NoiseReducerFromJson(json);

  Map<String, dynamic> toJson() => _$NoiseReducerToJson(this);
}

/// Use Noise reducer filter (NoiseReducerFilter) to select one of the following
/// spatial image filtering functions. To use this setting, you must also enable
/// Noise reducer (NoiseReducer). * Bilateral preserves edges while reducing
/// noise. * Mean (softest), Gaussian, Lanczos, and Sharpen (sharpest) do
/// convolution filtering. * Conserve does min/max noise reduction. * Spatial
/// does frequency-domain filtering based on JND principles. * Temporal
/// optimizes video quality for complex motion.
enum NoiseReducerFilter {
  @_s.JsonValue('BILATERAL')
  bilateral,
  @_s.JsonValue('MEAN')
  mean,
  @_s.JsonValue('GAUSSIAN')
  gaussian,
  @_s.JsonValue('LANCZOS')
  lanczos,
  @_s.JsonValue('SHARPEN')
  sharpen,
  @_s.JsonValue('CONSERVE')
  conserve,
  @_s.JsonValue('SPATIAL')
  spatial,
  @_s.JsonValue('TEMPORAL')
  temporal,
}

/// Settings for a noise reducer filter
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NoiseReducerFilterSettings {
  /// Relative strength of noise reducing filter. Higher values produce stronger
  /// filtering.
  @_s.JsonKey(name: 'strength')
  final int strength;

  NoiseReducerFilterSettings({
    this.strength,
  });
  factory NoiseReducerFilterSettings.fromJson(Map<String, dynamic> json) =>
      _$NoiseReducerFilterSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$NoiseReducerFilterSettingsToJson(this);
}

/// Noise reducer filter settings for spatial filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NoiseReducerSpatialFilterSettings {
  /// Specify strength of post noise reduction sharpening filter, with 0 disabling
  /// the filter and 3 enabling it at maximum strength.
  @_s.JsonKey(name: 'postFilterSharpenStrength')
  final int postFilterSharpenStrength;

  /// The speed of the filter, from -2 (lower speed) to 3 (higher speed), with 0
  /// being the nominal value.
  @_s.JsonKey(name: 'speed')
  final int speed;

  /// Relative strength of noise reducing filter. Higher values produce stronger
  /// filtering.
  @_s.JsonKey(name: 'strength')
  final int strength;

  NoiseReducerSpatialFilterSettings({
    this.postFilterSharpenStrength,
    this.speed,
    this.strength,
  });
  factory NoiseReducerSpatialFilterSettings.fromJson(
          Map<String, dynamic> json) =>
      _$NoiseReducerSpatialFilterSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NoiseReducerSpatialFilterSettingsToJson(this);
}

/// Noise reducer filter settings for temporal filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NoiseReducerTemporalFilterSettings {
  /// Use Aggressive mode for content that has complex motion. Higher values
  /// produce stronger temporal filtering. This filters highly complex scenes more
  /// aggressively and creates better VQ for low bitrate outputs.
  @_s.JsonKey(name: 'aggressiveMode')
  final int aggressiveMode;

  /// Optional. When you set Noise reducer (noiseReducer) to Temporal (TEMPORAL),
  /// you can use this setting to apply sharpening. The default behavior, Auto
  /// (AUTO), allows the transcoder to determine whether to apply filtering,
  /// depending on input type and quality. When you set Noise reducer to Temporal,
  /// your output bandwidth is reduced. When Post temporal sharpening is also
  /// enabled, that bandwidth reduction is smaller.
  @_s.JsonKey(name: 'postTemporalSharpening')
  final NoiseFilterPostTemporalSharpening postTemporalSharpening;

  /// The speed of the filter (higher number is faster). Low setting reduces bit
  /// rate at the cost of transcode time, high setting improves transcode time at
  /// the cost of bit rate.
  @_s.JsonKey(name: 'speed')
  final int speed;

  /// Specify the strength of the noise reducing filter on this output. Higher
  /// values produce stronger filtering. We recommend the following value ranges,
  /// depending on the result that you want: * 0-2 for complexity reduction with
  /// minimal sharpness loss * 2-8 for complexity reduction with image
  /// preservation * 8-16 for a high level of complexity reduction
  @_s.JsonKey(name: 'strength')
  final int strength;

  NoiseReducerTemporalFilterSettings({
    this.aggressiveMode,
    this.postTemporalSharpening,
    this.speed,
    this.strength,
  });
  factory NoiseReducerTemporalFilterSettings.fromJson(
          Map<String, dynamic> json) =>
      _$NoiseReducerTemporalFilterSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NoiseReducerTemporalFilterSettingsToJson(this);
}

/// Required when you set Codec, under AudioDescriptions>CodecSettings, to the
/// value OPUS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OpusSettings {
  /// Optional. Specify the average bitrate in bits per second. Valid values are
  /// multiples of 8000, from 32000 through 192000. The default value is 96000,
  /// which we recommend for quality and bandwidth.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// Specify the number of channels in this output audio track. Choosing Mono on
  /// the console gives you 1 output channel; choosing Stereo gives you 2. In the
  /// API, valid values are 1 and 2.
  @_s.JsonKey(name: 'channels')
  final int channels;

  /// Optional. Sample rate in hz. Valid values are 16000, 24000, and 48000. The
  /// default value is 48000.
  @_s.JsonKey(name: 'sampleRate')
  final int sampleRate;

  OpusSettings({
    this.bitrate,
    this.channels,
    this.sampleRate,
  });
  factory OpusSettings.fromJson(Map<String, dynamic> json) =>
      _$OpusSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$OpusSettingsToJson(this);
}

/// Optional. When you request lists of resources, you can specify whether they
/// are sorted in ASCENDING or DESCENDING order. Default varies by resource.
enum Order {
  @_s.JsonValue('ASCENDING')
  ascending,
  @_s.JsonValue('DESCENDING')
  descending,
}

extension on Order {
  String toValue() {
    switch (this) {
      case Order.ascending:
        return 'ASCENDING';
      case Order.descending:
        return 'DESCENDING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An output object describes the settings for a single output file or stream
/// in an output group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Output {
  /// (AudioDescriptions) contains groups of audio encoding settings organized by
  /// audio codec. Include one instance of (AudioDescriptions) per output.
  /// (AudioDescriptions) can contain multiple groups of encoding settings.
  @_s.JsonKey(name: 'audioDescriptions')
  final List<AudioDescription> audioDescriptions;

  /// (CaptionDescriptions) contains groups of captions settings. For each output
  /// that has captions, include one instance of (CaptionDescriptions).
  /// (CaptionDescriptions) can contain multiple groups of captions settings.
  @_s.JsonKey(name: 'captionDescriptions')
  final List<CaptionDescription> captionDescriptions;

  /// Container specific settings.
  @_s.JsonKey(name: 'containerSettings')
  final ContainerSettings containerSettings;

  /// Use Extension (Extension) to specify the file extension for outputs in File
  /// output groups. If you do not specify a value, the service will use default
  /// extensions by container type as follows * MPEG-2 transport stream, m2ts *
  /// Quicktime, mov * MXF container, mxf * MPEG-4 container, mp4 * WebM
  /// container, webm * No Container, the service will use codec extensions (e.g.
  /// AAC, H265, H265, AC3)
  @_s.JsonKey(name: 'extension')
  final String extension;

  /// Use Name modifier (NameModifier) to have the service add a string to the end
  /// of each output filename. You specify the base filename as part of your
  /// destination URI. When you create multiple outputs in the same output group,
  /// Name modifier (NameModifier) is required. Name modifier also accepts format
  /// identifiers. For DASH ISO outputs, if you use the format identifiers
  /// $Number$ or $Time$ in one output, you must use them in the same way in all
  /// outputs of the output group.
  @_s.JsonKey(name: 'nameModifier')
  final String nameModifier;

  /// Specific settings for this type of output.
  @_s.JsonKey(name: 'outputSettings')
  final OutputSettings outputSettings;

  /// Use Preset (Preset) to specifiy a preset for your transcoding settings.
  /// Provide the system or custom preset name. You can specify either Preset
  /// (Preset) or Container settings (ContainerSettings), but not both.
  @_s.JsonKey(name: 'preset')
  final String preset;

  /// (VideoDescription) contains a group of video encoding settings. The specific
  /// video settings depend on the video codec that you choose when you specify a
  /// value for Video codec (codec). Include one instance of (VideoDescription)
  /// per output.
  @_s.JsonKey(name: 'videoDescription')
  final VideoDescription videoDescription;

  Output({
    this.audioDescriptions,
    this.captionDescriptions,
    this.containerSettings,
    this.extension,
    this.nameModifier,
    this.outputSettings,
    this.preset,
    this.videoDescription,
  });
  factory Output.fromJson(Map<String, dynamic> json) => _$OutputFromJson(json);

  Map<String, dynamic> toJson() => _$OutputToJson(this);
}

/// OutputChannel mapping settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputChannelMapping {
  /// List of input channels
  @_s.JsonKey(name: 'inputChannels')
  final List<int> inputChannels;

  OutputChannelMapping({
    this.inputChannels,
  });
  factory OutputChannelMapping.fromJson(Map<String, dynamic> json) =>
      _$OutputChannelMappingFromJson(json);

  Map<String, dynamic> toJson() => _$OutputChannelMappingToJson(this);
}

/// Details regarding output
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputDetail {
  /// Duration in milliseconds
  @_s.JsonKey(name: 'durationInMs')
  final int durationInMs;

  /// Contains details about the output's video stream
  @_s.JsonKey(name: 'videoDetails')
  final VideoDetail videoDetails;

  OutputDetail({
    this.durationInMs,
    this.videoDetails,
  });
  factory OutputDetail.fromJson(Map<String, dynamic> json) =>
      _$OutputDetailFromJson(json);
}

/// Group of outputs
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputGroup {
  /// Use automated encoding to have MediaConvert choose your encoding settings
  /// for you, based on characteristics of your input video.
  @_s.JsonKey(name: 'automatedEncodingSettings')
  final AutomatedEncodingSettings automatedEncodingSettings;

  /// Use Custom Group Name (CustomName) to specify a name for the output group.
  /// This value is displayed on the console and can make your job settings JSON
  /// more human-readable. It does not affect your outputs. Use up to twelve
  /// characters that are either letters, numbers, spaces, or underscores.
  @_s.JsonKey(name: 'customName')
  final String customName;

  /// Name of the output group
  @_s.JsonKey(name: 'name')
  final String name;

  /// Output Group settings, including type
  @_s.JsonKey(name: 'outputGroupSettings')
  final OutputGroupSettings outputGroupSettings;

  /// This object holds groups of encoding settings, one group of settings per
  /// output.
  @_s.JsonKey(name: 'outputs')
  final List<Output> outputs;

  OutputGroup({
    this.automatedEncodingSettings,
    this.customName,
    this.name,
    this.outputGroupSettings,
    this.outputs,
  });
  factory OutputGroup.fromJson(Map<String, dynamic> json) =>
      _$OutputGroupFromJson(json);

  Map<String, dynamic> toJson() => _$OutputGroupToJson(this);
}

/// Contains details about the output groups specified in the job settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputGroupDetail {
  /// Details about the output
  @_s.JsonKey(name: 'outputDetails')
  final List<OutputDetail> outputDetails;

  OutputGroupDetail({
    this.outputDetails,
  });
  factory OutputGroupDetail.fromJson(Map<String, dynamic> json) =>
      _$OutputGroupDetailFromJson(json);
}

/// Output Group settings, including type
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputGroupSettings {
  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// CMAF_GROUP_SETTINGS. Each output in a CMAF Output Group may only contain a
  /// single video, audio, or caption output.
  @_s.JsonKey(name: 'cmafGroupSettings')
  final CmafGroupSettings cmafGroupSettings;

  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// DASH_ISO_GROUP_SETTINGS.
  @_s.JsonKey(name: 'dashIsoGroupSettings')
  final DashIsoGroupSettings dashIsoGroupSettings;

  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// FILE_GROUP_SETTINGS.
  @_s.JsonKey(name: 'fileGroupSettings')
  final FileGroupSettings fileGroupSettings;

  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// HLS_GROUP_SETTINGS.
  @_s.JsonKey(name: 'hlsGroupSettings')
  final HlsGroupSettings hlsGroupSettings;

  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// MS_SMOOTH_GROUP_SETTINGS.
  @_s.JsonKey(name: 'msSmoothGroupSettings')
  final MsSmoothGroupSettings msSmoothGroupSettings;

  /// Type of output group (File group, Apple HLS, DASH ISO, Microsoft Smooth
  /// Streaming, CMAF)
  @_s.JsonKey(name: 'type')
  final OutputGroupType type;

  OutputGroupSettings({
    this.cmafGroupSettings,
    this.dashIsoGroupSettings,
    this.fileGroupSettings,
    this.hlsGroupSettings,
    this.msSmoothGroupSettings,
    this.type,
  });
  factory OutputGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$OutputGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$OutputGroupSettingsToJson(this);
}

/// Type of output group (File group, Apple HLS, DASH ISO, Microsoft Smooth
/// Streaming, CMAF)
enum OutputGroupType {
  @_s.JsonValue('HLS_GROUP_SETTINGS')
  hlsGroupSettings,
  @_s.JsonValue('DASH_ISO_GROUP_SETTINGS')
  dashIsoGroupSettings,
  @_s.JsonValue('FILE_GROUP_SETTINGS')
  fileGroupSettings,
  @_s.JsonValue('MS_SMOOTH_GROUP_SETTINGS')
  msSmoothGroupSettings,
  @_s.JsonValue('CMAF_GROUP_SETTINGS')
  cmafGroupSettings,
}

/// Selects method of inserting SDT information into output stream.  "Follow
/// input SDT" copies SDT information from input stream to  output stream.
/// "Follow input SDT if present" copies SDT information from  input stream to
/// output stream if SDT information is present in the input, otherwise it will
/// fall back on the user-defined values. Enter "SDT  Manually" means user will
/// enter the SDT information. "No SDT" means output  stream will not contain
/// SDT information.
enum OutputSdt {
  @_s.JsonValue('SDT_FOLLOW')
  sdtFollow,
  @_s.JsonValue('SDT_FOLLOW_IF_PRESENT')
  sdtFollowIfPresent,
  @_s.JsonValue('SDT_MANUAL')
  sdtManual,
  @_s.JsonValue('SDT_NONE')
  sdtNone,
}

/// Specific settings for this type of output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputSettings {
  /// Settings for HLS output groups
  @_s.JsonKey(name: 'hlsSettings')
  final HlsSettings hlsSettings;

  OutputSettings({
    this.hlsSettings,
  });
  factory OutputSettings.fromJson(Map<String, dynamic> json) =>
      _$OutputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$OutputSettingsToJson(this);
}

/// If you work with a third party video watermarking partner, use the group of
/// settings that correspond with your watermarking partner to include
/// watermarks in your output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PartnerWatermarking {
  /// For forensic video watermarking, MediaConvert supports Nagra NexGuard File
  /// Marker watermarking. MediaConvert supports both PreRelease Content (NGPR/G2)
  /// and OTT Streaming workflows.
  @_s.JsonKey(name: 'nexguardFileMarkerSettings')
  final NexGuardFileMarkerSettings nexguardFileMarkerSettings;

  PartnerWatermarking({
    this.nexguardFileMarkerSettings,
  });
  factory PartnerWatermarking.fromJson(Map<String, dynamic> json) =>
      _$PartnerWatermarkingFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerWatermarkingToJson(this);
}

/// A preset is a collection of preconfigured media conversion settings that you
/// want MediaConvert to apply to the output during the conversion process.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Preset {
  /// A name you create for each preset. Each name must be unique within your
  /// account.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Settings for preset
  @_s.JsonKey(name: 'settings')
  final PresetSettings settings;

  /// An identifier for this resource that is unique within all of AWS.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// An optional category you create to organize your presets.
  @_s.JsonKey(name: 'category')
  final String category;

  /// The timestamp in epoch seconds for preset creation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// An optional description you create for each preset.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The timestamp in epoch seconds when the preset was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdated')
  final DateTime lastUpdated;

  /// A preset can be of two types: system or custom. System or built-in preset
  /// can't be modified or deleted by the user.
  @_s.JsonKey(name: 'type')
  final Type type;

  Preset({
    @_s.required this.name,
    @_s.required this.settings,
    this.arn,
    this.category,
    this.createdAt,
    this.description,
    this.lastUpdated,
    this.type,
  });
  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}

/// Optional. When you request a list of presets, you can choose to list them
/// alphabetically by NAME or chronologically by CREATION_DATE. If you don't
/// specify, the service will list them by name.
enum PresetListBy {
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('CREATION_DATE')
  creationDate,
  @_s.JsonValue('SYSTEM')
  system,
}

extension on PresetListBy {
  String toValue() {
    switch (this) {
      case PresetListBy.name:
        return 'NAME';
      case PresetListBy.creationDate:
        return 'CREATION_DATE';
      case PresetListBy.system:
        return 'SYSTEM';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Settings for preset
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PresetSettings {
  /// (AudioDescriptions) contains groups of audio encoding settings organized by
  /// audio codec. Include one instance of (AudioDescriptions) per output.
  /// (AudioDescriptions) can contain multiple groups of encoding settings.
  @_s.JsonKey(name: 'audioDescriptions')
  final List<AudioDescription> audioDescriptions;

  /// Caption settings for this preset. There can be multiple caption settings in
  /// a single output.
  @_s.JsonKey(name: 'captionDescriptions')
  final List<CaptionDescriptionPreset> captionDescriptions;

  /// Container specific settings.
  @_s.JsonKey(name: 'containerSettings')
  final ContainerSettings containerSettings;

  /// (VideoDescription) contains a group of video encoding settings. The specific
  /// video settings depend on the video codec that you choose when you specify a
  /// value for Video codec (codec). Include one instance of (VideoDescription)
  /// per output.
  @_s.JsonKey(name: 'videoDescription')
  final VideoDescription videoDescription;

  PresetSettings({
    this.audioDescriptions,
    this.captionDescriptions,
    this.containerSettings,
    this.videoDescription,
  });
  factory PresetSettings.fromJson(Map<String, dynamic> json) =>
      _$PresetSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$PresetSettingsToJson(this);
}

/// Specifies whether the pricing plan for the queue is on-demand or reserved.
/// For on-demand, you pay per minute, billed in increments of .01 minute. For
/// reserved, you pay for the transcoding capacity of the entire queue,
/// regardless of how much or how little you use it. Reserved pricing requires a
/// 12-month commitment.
enum PricingPlan {
  @_s.JsonValue('ON_DEMAND')
  onDemand,
  @_s.JsonValue('RESERVED')
  reserved,
}

extension on PricingPlan {
  String toValue() {
    switch (this) {
      case PricingPlan.onDemand:
        return 'ON_DEMAND';
      case PricingPlan.reserved:
        return 'RESERVED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Use Profile (ProResCodecProfile) to specifiy the type of Apple ProRes codec
/// to use for this output.
enum ProresCodecProfile {
  @_s.JsonValue('APPLE_PRORES_422')
  appleProres_422,
  @_s.JsonValue('APPLE_PRORES_422_HQ')
  appleProres_422Hq,
  @_s.JsonValue('APPLE_PRORES_422_LT')
  appleProres_422Lt,
  @_s.JsonValue('APPLE_PRORES_422_PROXY')
  appleProres_422Proxy,
}

/// If you are using the console, use the Framerate setting to specify the frame
/// rate for this output. If you want to keep the same frame rate as the input
/// video, choose Follow source. If you want to do frame rate conversion, choose
/// a frame rate from the dropdown list or choose Custom. The framerates shown
/// in the dropdown list are decimal approximations of fractions. If you choose
/// Custom, specify your frame rate as a fraction. If you are creating your
/// transcoding job specification as a JSON file without the console, use
/// FramerateControl to specify which value the service uses for the frame rate
/// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
/// use the frame rate from the input. Choose SPECIFIED if you want the service
/// to use the frame rate you specify in the settings FramerateNumerator and
/// FramerateDenominator.
enum ProresFramerateControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Choose the method that you want MediaConvert to use when increasing or
/// decreasing the frame rate. We recommend using drop duplicate
/// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
/// fps. For numerically complex conversions, you can use interpolate
/// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
/// introduce undesirable video artifacts. For complex frame rate conversions,
/// especially if your source video has already been converted from its original
/// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
/// interpolation. FrameFormer chooses the best conversion method frame by
/// frame. Note that using FrameFormer increases the transcoding time and incurs
/// a significant add-on cost.
enum ProresFramerateConversionAlgorithm {
  @_s.JsonValue('DUPLICATE_DROP')
  duplicateDrop,
  @_s.JsonValue('INTERPOLATE')
  interpolate,
  @_s.JsonValue('FRAMEFORMER')
  frameformer,
}

/// Choose the scan line type for the output. Keep the default value,
/// Progressive (PROGRESSIVE) to create a progressive output, regardless of the
/// scan type of your input. Use Top field first (TOP_FIELD) or Bottom field
/// first (BOTTOM_FIELD) to create an output that's interlaced with the same
/// field polarity throughout. Use Follow, default top (FOLLOW_TOP_FIELD) or
/// Follow, default bottom (FOLLOW_BOTTOM_FIELD) to produce outputs with the
/// same field polarity as the source. For jobs that have multiple inputs, the
/// output field polarity might change over the course of the output. Follow
/// behavior depends on the input scan type. If the source is interlaced, the
/// output will be interlaced with the same polarity as the source. If the
/// source is progressive, the output will be interlaced with top field bottom
/// field first, depending on which of the Follow options you choose.
enum ProresInterlaceMode {
  @_s.JsonValue('PROGRESSIVE')
  progressive,
  @_s.JsonValue('TOP_FIELD')
  topField,
  @_s.JsonValue('BOTTOM_FIELD')
  bottomField,
  @_s.JsonValue('FOLLOW_TOP_FIELD')
  followTopField,
  @_s.JsonValue('FOLLOW_BOTTOM_FIELD')
  followBottomField,
}

/// Optional. Specify how the service determines the pixel aspect ratio (PAR)
/// for this output. The default behavior, Follow source
/// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
/// output. To specify a different PAR in the console, choose any value other
/// than Follow source. To specify a different PAR by editing the JSON job
/// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
/// you must also specify values for the parNumerator and parDenominator
/// settings.
enum ProresParControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value PRORES.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProresSettings {
  /// Use Profile (ProResCodecProfile) to specifiy the type of Apple ProRes codec
  /// to use for this output.
  @_s.JsonKey(name: 'codecProfile')
  final ProresCodecProfile codecProfile;

  /// If you are using the console, use the Framerate setting to specify the frame
  /// rate for this output. If you want to keep the same frame rate as the input
  /// video, choose Follow source. If you want to do frame rate conversion, choose
  /// a frame rate from the dropdown list or choose Custom. The framerates shown
  /// in the dropdown list are decimal approximations of fractions. If you choose
  /// Custom, specify your frame rate as a fraction. If you are creating your
  /// transcoding job specification as a JSON file without the console, use
  /// FramerateControl to specify which value the service uses for the frame rate
  /// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
  /// use the frame rate from the input. Choose SPECIFIED if you want the service
  /// to use the frame rate you specify in the settings FramerateNumerator and
  /// FramerateDenominator.
  @_s.JsonKey(name: 'framerateControl')
  final ProresFramerateControl framerateControl;

  /// Choose the method that you want MediaConvert to use when increasing or
  /// decreasing the frame rate. We recommend using drop duplicate
  /// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
  /// fps. For numerically complex conversions, you can use interpolate
  /// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
  /// introduce undesirable video artifacts. For complex frame rate conversions,
  /// especially if your source video has already been converted from its original
  /// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
  /// interpolation. FrameFormer chooses the best conversion method frame by
  /// frame. Note that using FrameFormer increases the transcoding time and incurs
  /// a significant add-on cost.
  @_s.JsonKey(name: 'framerateConversionAlgorithm')
  final ProresFramerateConversionAlgorithm framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// Choose the scan line type for the output. Keep the default value,
  /// Progressive (PROGRESSIVE) to create a progressive output, regardless of the
  /// scan type of your input. Use Top field first (TOP_FIELD) or Bottom field
  /// first (BOTTOM_FIELD) to create an output that's interlaced with the same
  /// field polarity throughout. Use Follow, default top (FOLLOW_TOP_FIELD) or
  /// Follow, default bottom (FOLLOW_BOTTOM_FIELD) to produce outputs with the
  /// same field polarity as the source. For jobs that have multiple inputs, the
  /// output field polarity might change over the course of the output. Follow
  /// behavior depends on the input scan type. If the source is interlaced, the
  /// output will be interlaced with the same polarity as the source. If the
  /// source is progressive, the output will be interlaced with top field bottom
  /// field first, depending on which of the Follow options you choose.
  @_s.JsonKey(name: 'interlaceMode')
  final ProresInterlaceMode interlaceMode;

  /// Optional. Specify how the service determines the pixel aspect ratio (PAR)
  /// for this output. The default behavior, Follow source
  /// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
  /// output. To specify a different PAR in the console, choose any value other
  /// than Follow source. To specify a different PAR by editing the JSON job
  /// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
  /// you must also specify values for the parNumerator and parDenominator
  /// settings.
  @_s.JsonKey(name: 'parControl')
  final ProresParControl parControl;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parDenominator is 33.
  @_s.JsonKey(name: 'parDenominator')
  final int parDenominator;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parNumerator is 40.
  @_s.JsonKey(name: 'parNumerator')
  final int parNumerator;

  /// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
  /// second (fps). Enable slow PAL to create a 25 fps output. When you enable
  /// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
  /// your audio to keep it synchronized with the video. Note that enabling this
  /// setting will slightly reduce the duration of your video. Required settings:
  /// You must also set Framerate to 25. In your JSON job specification, set
  /// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
  /// (framerateDenominator) to 1.
  @_s.JsonKey(name: 'slowPal')
  final ProresSlowPal slowPal;

  /// When you do frame rate conversion from 23.976 frames per second (fps) to
  /// 29.97 fps, and your output scan type is interlaced, you can optionally
  /// enable hard telecine (HARD) to create a smoother picture. When you keep the
  /// default value, None (NONE), MediaConvert does a standard frame rate
  /// conversion to 29.97 without doing anything with the field polarity to create
  /// a smoother picture.
  @_s.JsonKey(name: 'telecine')
  final ProresTelecine telecine;

  ProresSettings({
    this.codecProfile,
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.interlaceMode,
    this.parControl,
    this.parDenominator,
    this.parNumerator,
    this.slowPal,
    this.telecine,
  });
  factory ProresSettings.fromJson(Map<String, dynamic> json) =>
      _$ProresSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ProresSettingsToJson(this);
}

/// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
/// second (fps). Enable slow PAL to create a 25 fps output. When you enable
/// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
/// your audio to keep it synchronized with the video. Note that enabling this
/// setting will slightly reduce the duration of your video. Required settings:
/// You must also set Framerate to 25. In your JSON job specification, set
/// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
/// (framerateDenominator) to 1.
enum ProresSlowPal {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// When you do frame rate conversion from 23.976 frames per second (fps) to
/// 29.97 fps, and your output scan type is interlaced, you can optionally
/// enable hard telecine (HARD) to create a smoother picture. When you keep the
/// default value, None (NONE), MediaConvert does a standard frame rate
/// conversion to 29.97 without doing anything with the field polarity to create
/// a smoother picture.
enum ProresTelecine {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('HARD')
  hard,
}

/// You can use queues to manage the resources that are available to your AWS
/// account for running multiple transcoding jobs at the same time. If you don't
/// specify a queue, the service sends all jobs through the default queue. For
/// more information, see
/// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Queue {
  /// A name that you create for each queue. Each name must be unique within your
  /// account.
  @_s.JsonKey(name: 'name')
  final String name;

  /// An identifier for this resource that is unique within all of AWS.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The timestamp in epoch seconds for when you created the queue.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// An optional description that you create for each queue.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The timestamp in epoch seconds for when you most recently updated the queue.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdated')
  final DateTime lastUpdated;

  /// Specifies whether the pricing plan for the queue is on-demand or reserved.
  /// For on-demand, you pay per minute, billed in increments of .01 minute. For
  /// reserved, you pay for the transcoding capacity of the entire queue,
  /// regardless of how much or how little you use it. Reserved pricing requires a
  /// 12-month commitment.
  @_s.JsonKey(name: 'pricingPlan')
  final PricingPlan pricingPlan;

  /// The estimated number of jobs with a PROGRESSING status.
  @_s.JsonKey(name: 'progressingJobsCount')
  final int progressingJobsCount;

  /// Details about the pricing plan for your reserved queue. Required for
  /// reserved queues and not applicable to on-demand queues.
  @_s.JsonKey(name: 'reservationPlan')
  final ReservationPlan reservationPlan;

  /// Queues can be ACTIVE or PAUSED. If you pause a queue, the service won't
  /// begin processing jobs in that queue. Jobs that are running when you pause
  /// the queue continue to run until they finish or result in an error.
  @_s.JsonKey(name: 'status')
  final QueueStatus status;

  /// The estimated number of jobs with a SUBMITTED status.
  @_s.JsonKey(name: 'submittedJobsCount')
  final int submittedJobsCount;

  /// Specifies whether this on-demand queue is system or custom. System queues
  /// are built in. You can't modify or delete system queues. You can create and
  /// modify custom queues.
  @_s.JsonKey(name: 'type')
  final Type type;

  Queue({
    @_s.required this.name,
    this.arn,
    this.createdAt,
    this.description,
    this.lastUpdated,
    this.pricingPlan,
    this.progressingJobsCount,
    this.reservationPlan,
    this.status,
    this.submittedJobsCount,
    this.type,
  });
  factory Queue.fromJson(Map<String, dynamic> json) => _$QueueFromJson(json);
}

/// Optional. When you request a list of queues, you can choose to list them
/// alphabetically by NAME or chronologically by CREATION_DATE. If you don't
/// specify, the service will list them by creation date.
enum QueueListBy {
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('CREATION_DATE')
  creationDate,
}

extension on QueueListBy {
  String toValue() {
    switch (this) {
      case QueueListBy.name:
        return 'NAME';
      case QueueListBy.creationDate:
        return 'CREATION_DATE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Queues can be ACTIVE or PAUSED. If you pause a queue, jobs in that queue
/// won't begin. Jobs that are running when you pause a queue continue to run
/// until they finish or result in an error.
enum QueueStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('PAUSED')
  paused,
}

extension on QueueStatus {
  String toValue() {
    switch (this) {
      case QueueStatus.active:
        return 'ACTIVE';
      case QueueStatus.paused:
        return 'PAUSED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Description of the source and destination queues between which the job has
/// moved, along with the timestamp of the move
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueueTransition {
  /// The queue that the job was on after the transition.
  @_s.JsonKey(name: 'destinationQueue')
  final String destinationQueue;

  /// The queue that the job was on before the transition.
  @_s.JsonKey(name: 'sourceQueue')
  final String sourceQueue;

  /// The time, in Unix epoch format, that the job moved from the source queue to
  /// the destination queue.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'timestamp')
  final DateTime timestamp;

  QueueTransition({
    this.destinationQueue,
    this.sourceQueue,
    this.timestamp,
  });
  factory QueueTransition.fromJson(Map<String, dynamic> json) =>
      _$QueueTransitionFromJson(json);
}

/// Use Rectangle to identify a specific area of the video frame.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Rectangle {
  /// Height of rectangle in pixels. Specify only even numbers.
  @_s.JsonKey(name: 'height')
  final int height;

  /// Width of rectangle in pixels. Specify only even numbers.
  @_s.JsonKey(name: 'width')
  final int width;

  /// The distance, in pixels, between the rectangle and the left edge of the
  /// video frame. Specify only even numbers.
  @_s.JsonKey(name: 'x')
  final int x;

  /// The distance, in pixels, between the rectangle and the top edge of the video
  /// frame. Specify only even numbers.
  @_s.JsonKey(name: 'y')
  final int y;

  Rectangle({
    this.height,
    this.width,
    this.x,
    this.y,
  });
  factory Rectangle.fromJson(Map<String, dynamic> json) =>
      _$RectangleFromJson(json);

  Map<String, dynamic> toJson() => _$RectangleToJson(this);
}

/// Use Manual audio remixing (RemixSettings) to adjust audio levels for each
/// audio channel in each output of your job. With audio remixing, you can
/// output more or fewer audio channels than your input audio source provides.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RemixSettings {
  /// Channel mapping (ChannelMapping) contains the group of fields that hold the
  /// remixing value for each channel. Units are in dB. Acceptable values are
  /// within the range from -60 (mute) through 6. A setting of 0 passes the input
  /// channel unchanged to the output channel (no attenuation or amplification).
  @_s.JsonKey(name: 'channelMapping')
  final ChannelMapping channelMapping;

  /// Specify the number of audio channels from your input that you want to use in
  /// your output. With remixing, you might combine or split the data in these
  /// channels, so the number of channels in your final output might be different.
  @_s.JsonKey(name: 'channelsIn')
  final int channelsIn;

  /// Specify the number of channels in this output after remixing. Valid values:
  /// 1, 2, 4, 6, 8... 64. (1 and even numbers to 64.)
  @_s.JsonKey(name: 'channelsOut')
  final int channelsOut;

  RemixSettings({
    this.channelMapping,
    this.channelsIn,
    this.channelsOut,
  });
  factory RemixSettings.fromJson(Map<String, dynamic> json) =>
      _$RemixSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$RemixSettingsToJson(this);
}

/// Specifies whether the term of your reserved queue pricing plan is
/// automatically extended (AUTO_RENEW) or expires (EXPIRE) at the end of the
/// term.
enum RenewalType {
  @_s.JsonValue('AUTO_RENEW')
  autoRenew,
  @_s.JsonValue('EXPIRE')
  expire,
}

/// Details about the pricing plan for your reserved queue. Required for
/// reserved queues and not applicable to on-demand queues.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReservationPlan {
  /// The length of the term of your reserved queue pricing plan commitment.
  @_s.JsonKey(name: 'commitment')
  final Commitment commitment;

  /// The timestamp in epoch seconds for when the current pricing plan term for
  /// this reserved queue expires.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expiresAt')
  final DateTime expiresAt;

  /// The timestamp in epoch seconds for when you set up the current pricing plan
  /// for this reserved queue.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'purchasedAt')
  final DateTime purchasedAt;

  /// Specifies whether the term of your reserved queue pricing plan is
  /// automatically extended (AUTO_RENEW) or expires (EXPIRE) at the end of the
  /// term.
  @_s.JsonKey(name: 'renewalType')
  final RenewalType renewalType;

  /// Specifies the number of reserved transcode slots (RTS) for this queue. The
  /// number of RTS determines how many jobs the queue can process in parallel;
  /// each RTS can process one job at a time. When you increase this number, you
  /// extend your existing commitment with a new 12-month commitment for a larger
  /// number of RTS. The new commitment begins when you purchase the additional
  /// capacity. You can't decrease the number of RTS in your reserved queue.
  @_s.JsonKey(name: 'reservedSlots')
  final int reservedSlots;

  /// Specifies whether the pricing plan for your reserved queue is ACTIVE or
  /// EXPIRED.
  @_s.JsonKey(name: 'status')
  final ReservationPlanStatus status;

  ReservationPlan({
    this.commitment,
    this.expiresAt,
    this.purchasedAt,
    this.renewalType,
    this.reservedSlots,
    this.status,
  });
  factory ReservationPlan.fromJson(Map<String, dynamic> json) =>
      _$ReservationPlanFromJson(json);
}

/// Details about the pricing plan for your reserved queue. Required for
/// reserved queues and not applicable to on-demand queues.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReservationPlanSettings {
  /// The length of the term of your reserved queue pricing plan commitment.
  @_s.JsonKey(name: 'commitment')
  final Commitment commitment;

  /// Specifies whether the term of your reserved queue pricing plan is
  /// automatically extended (AUTO_RENEW) or expires (EXPIRE) at the end of the
  /// term. When your term is auto renewed, you extend your commitment by 12
  /// months from the auto renew date. You can cancel this commitment.
  @_s.JsonKey(name: 'renewalType')
  final RenewalType renewalType;

  /// Specifies the number of reserved transcode slots (RTS) for this queue. The
  /// number of RTS determines how many jobs the queue can process in parallel;
  /// each RTS can process one job at a time. You can't decrease the number of RTS
  /// in your reserved queue. You can increase the number of RTS by extending your
  /// existing commitment with a new 12-month commitment for the larger number.
  /// The new commitment begins when you purchase the additional capacity. You
  /// can't cancel your commitment or revert to your original commitment after you
  /// increase the capacity.
  @_s.JsonKey(name: 'reservedSlots')
  final int reservedSlots;

  ReservationPlanSettings({
    @_s.required this.commitment,
    @_s.required this.renewalType,
    @_s.required this.reservedSlots,
  });
  Map<String, dynamic> toJson() => _$ReservationPlanSettingsToJson(this);
}

/// Specifies whether the pricing plan for your reserved queue is ACTIVE or
/// EXPIRED.
enum ReservationPlanStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('EXPIRED')
  expired,
}

/// The Amazon Resource Name (ARN) and tags for an AWS Elemental MediaConvert
/// resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceTags {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The tags for the resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ResourceTags({
    this.arn,
    this.tags,
  });
  factory ResourceTags.fromJson(Map<String, dynamic> json) =>
      _$ResourceTagsFromJson(json);
}

/// Use Respond to AFD (RespondToAfd) to specify how the service changes the
/// video itself in response to AFD values in the input. * Choose Respond to
/// clip the input video frame according to the AFD value, input display aspect
/// ratio, and output display aspect ratio. * Choose Passthrough to include the
/// input AFD values. Do not choose this when AfdSignaling is set to (NONE). A
/// preferred implementation of this workflow is to set RespondToAfd to (NONE)
/// and set AfdSignaling to (AUTO). * Choose None to remove all input AFD values
/// from this output.
enum RespondToAfd {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('RESPOND')
  respond,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// Optional. Have MediaConvert automatically apply Amazon S3 access control for
/// the outputs in this output group. When you don't use this setting, S3
/// automatically applies the default access control list PRIVATE.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3DestinationAccessControl {
  /// Choose an Amazon S3 canned ACL for MediaConvert to apply to this output.
  @_s.JsonKey(name: 'cannedAcl')
  final S3ObjectCannedAcl cannedAcl;

  S3DestinationAccessControl({
    this.cannedAcl,
  });
  factory S3DestinationAccessControl.fromJson(Map<String, dynamic> json) =>
      _$S3DestinationAccessControlFromJson(json);

  Map<String, dynamic> toJson() => _$S3DestinationAccessControlToJson(this);
}

/// Settings associated with S3 destination
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3DestinationSettings {
  /// Optional. Have MediaConvert automatically apply Amazon S3 access control for
  /// the outputs in this output group. When you don't use this setting, S3
  /// automatically applies the default access control list PRIVATE.
  @_s.JsonKey(name: 'accessControl')
  final S3DestinationAccessControl accessControl;

  /// Settings for how your job outputs are encrypted as they are uploaded to
  /// Amazon S3.
  @_s.JsonKey(name: 'encryption')
  final S3EncryptionSettings encryption;

  S3DestinationSettings({
    this.accessControl,
    this.encryption,
  });
  factory S3DestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$S3DestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$S3DestinationSettingsToJson(this);
}

/// Settings for how your job outputs are encrypted as they are uploaded to
/// Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3EncryptionSettings {
  /// Specify how you want your data keys managed. AWS uses data keys to encrypt
  /// your content. AWS also encrypts the data keys themselves, using a customer
  /// master key (CMK), and then stores the encrypted data keys alongside your
  /// encrypted content. Use this setting to specify which AWS service manages the
  /// CMK. For simplest set up, choose Amazon S3 (SERVER_SIDE_ENCRYPTION_S3). If
  /// you want your master key to be managed by AWS Key Management Service (KMS),
  /// choose AWS KMS (SERVER_SIDE_ENCRYPTION_KMS). By default, when you choose AWS
  /// KMS, KMS uses the AWS managed customer master key (CMK) associated with
  /// Amazon S3 to encrypt your data keys. You can optionally choose to specify a
  /// different, customer managed CMK. Do so by specifying the Amazon Resource
  /// Name (ARN) of the key for the setting  KMS ARN (kmsKeyArn).
  @_s.JsonKey(name: 'encryptionType')
  final S3ServerSideEncryptionType encryptionType;

  /// Optionally, specify the customer master key (CMK) that you want to use to
  /// encrypt the data key that AWS uses to encrypt your output content. Enter the
  /// Amazon Resource Name (ARN) of the CMK. To use this setting, you must also
  /// set Server-side encryption (S3ServerSideEncryptionType) to AWS KMS
  /// (SERVER_SIDE_ENCRYPTION_KMS). If you set Server-side encryption to AWS KMS
  /// but don't specify a CMK here, AWS uses the AWS managed CMK associated with
  /// Amazon S3.
  @_s.JsonKey(name: 'kmsKeyArn')
  final String kmsKeyArn;

  S3EncryptionSettings({
    this.encryptionType,
    this.kmsKeyArn,
  });
  factory S3EncryptionSettings.fromJson(Map<String, dynamic> json) =>
      _$S3EncryptionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$S3EncryptionSettingsToJson(this);
}

/// Choose an Amazon S3 canned ACL for MediaConvert to apply to this output.
enum S3ObjectCannedAcl {
  @_s.JsonValue('PUBLIC_READ')
  publicRead,
  @_s.JsonValue('AUTHENTICATED_READ')
  authenticatedRead,
  @_s.JsonValue('BUCKET_OWNER_READ')
  bucketOwnerRead,
  @_s.JsonValue('BUCKET_OWNER_FULL_CONTROL')
  bucketOwnerFullControl,
}

/// Specify how you want your data keys managed. AWS uses data keys to encrypt
/// your content. AWS also encrypts the data keys themselves, using a customer
/// master key (CMK), and then stores the encrypted data keys alongside your
/// encrypted content. Use this setting to specify which AWS service manages the
/// CMK. For simplest set up, choose Amazon S3 (SERVER_SIDE_ENCRYPTION_S3). If
/// you want your master key to be managed by AWS Key Management Service (KMS),
/// choose AWS KMS (SERVER_SIDE_ENCRYPTION_KMS). By default, when you choose AWS
/// KMS, KMS uses the AWS managed customer master key (CMK) associated with
/// Amazon S3 to encrypt your data keys. You can optionally choose to specify a
/// different, customer managed CMK. Do so by specifying the Amazon Resource
/// Name (ARN) of the key for the setting  KMS ARN (kmsKeyArn).
enum S3ServerSideEncryptionType {
  @_s.JsonValue('SERVER_SIDE_ENCRYPTION_S3')
  serverSideEncryptionS3,
  @_s.JsonValue('SERVER_SIDE_ENCRYPTION_KMS')
  serverSideEncryptionKms,
}

/// Specify how the service handles outputs that have a different aspect ratio
/// from the input aspect ratio. Choose Stretch to output (STRETCH_TO_OUTPUT) to
/// have the service stretch your video image to fit. Keep the setting Default
/// (DEFAULT) to have the service letterbox your video instead. This setting
/// overrides any value that you specify for the setting Selection placement
/// (position) in this output.
enum ScalingBehavior {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('STRETCH_TO_OUTPUT')
  stretchToOutput,
}

/// Set Framerate (SccDestinationFramerate) to make sure that the captions and
/// the video are synchronized in the output. Specify a frame rate that matches
/// the frame rate of the associated video. If the video frame rate is 29.97,
/// choose 29.97 dropframe (FRAMERATE_29_97_DROPFRAME) only if the video has
/// video_insertion=true and drop_frame_timecode=true; otherwise, choose 29.97
/// non-dropframe (FRAMERATE_29_97_NON_DROPFRAME).
enum SccDestinationFramerate {
  @_s.JsonValue('FRAMERATE_23_97')
  framerate_23_97,
  @_s.JsonValue('FRAMERATE_24')
  framerate_24,
  @_s.JsonValue('FRAMERATE_25')
  framerate_25,
  @_s.JsonValue('FRAMERATE_29_97_DROPFRAME')
  framerate_29_97Dropframe,
  @_s.JsonValue('FRAMERATE_29_97_NON_DROPFRAME')
  framerate_29_97NonDropframe,
}

/// Settings for SCC caption output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SccDestinationSettings {
  /// Set Framerate (SccDestinationFramerate) to make sure that the captions and
  /// the video are synchronized in the output. Specify a frame rate that matches
  /// the frame rate of the associated video. If the video frame rate is 29.97,
  /// choose 29.97 dropframe (FRAMERATE_29_97_DROPFRAME) only if the video has
  /// video_insertion=true and drop_frame_timecode=true; otherwise, choose 29.97
  /// non-dropframe (FRAMERATE_29_97_NON_DROPFRAME).
  @_s.JsonKey(name: 'framerate')
  final SccDestinationFramerate framerate;

  SccDestinationSettings({
    this.framerate,
  });
  factory SccDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$SccDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SccDestinationSettingsToJson(this);
}

/// Enable this setting when you run a test job to estimate how many reserved
/// transcoding slots (RTS) you need. When this is enabled, MediaConvert runs
/// your job from an on-demand queue with similar performance to what you will
/// see with one RTS in a reserved queue. This setting is disabled by default.
enum SimulateReservedQueue {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

extension on SimulateReservedQueue {
  String toValue() {
    switch (this) {
      case SimulateReservedQueue.disabled:
        return 'DISABLED';
      case SimulateReservedQueue.enabled:
        return 'ENABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// If your output group type is HLS, DASH, or Microsoft Smooth, use these
/// settings when doing DRM encryption with a SPEKE-compliant key provider.  If
/// your output group type is CMAF, use the SpekeKeyProviderCmaf settings
/// instead.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SpekeKeyProvider {
  /// If you want your key provider to encrypt the content keys that it provides
  /// to MediaConvert, set up a certificate with a master key using AWS
  /// Certificate Manager. Specify the certificate's Amazon Resource Name (ARN)
  /// here.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// Specify the resource ID that your SPEKE-compliant key provider uses to
  /// identify this content.
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// Relates to SPEKE implementation. DRM system identifiers. DASH output groups
  /// support a max of two system ids. Other group types support one system id.
  /// See
  /// https://dashif.org/identifiers/content_protection/ for more details.
  @_s.JsonKey(name: 'systemIds')
  final List<String> systemIds;

  /// Specify the URL to the key server that your SPEKE-compliant DRM key provider
  /// uses to provide keys for encrypting your content.
  @_s.JsonKey(name: 'url')
  final String url;

  SpekeKeyProvider({
    this.certificateArn,
    this.resourceId,
    this.systemIds,
    this.url,
  });
  factory SpekeKeyProvider.fromJson(Map<String, dynamic> json) =>
      _$SpekeKeyProviderFromJson(json);

  Map<String, dynamic> toJson() => _$SpekeKeyProviderToJson(this);
}

/// If your output group type is CMAF, use these settings when doing DRM
/// encryption with a SPEKE-compliant key provider. If your output group type is
/// HLS, DASH, or Microsoft Smooth, use the SpekeKeyProvider settings instead.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SpekeKeyProviderCmaf {
  /// If you want your key provider to encrypt the content keys that it provides
  /// to MediaConvert, set up a certificate with a master key using AWS
  /// Certificate Manager. Specify the certificate's Amazon Resource Name (ARN)
  /// here.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// Specify the DRM system IDs that you want signaled in the DASH manifest that
  /// MediaConvert creates as part of this CMAF package. The DASH manifest can
  /// currently signal up to three system IDs. For more information, see
  /// https://dashif.org/identifiers/content_protection/.
  @_s.JsonKey(name: 'dashSignaledSystemIds')
  final List<String> dashSignaledSystemIds;

  /// Specify the DRM system ID that you want signaled in the HLS manifest that
  /// MediaConvert creates as part of this CMAF package. The HLS manifest can
  /// currently signal only one system ID. For more information, see
  /// https://dashif.org/identifiers/content_protection/.
  @_s.JsonKey(name: 'hlsSignaledSystemIds')
  final List<String> hlsSignaledSystemIds;

  /// Specify the resource ID that your SPEKE-compliant key provider uses to
  /// identify this content.
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// Specify the URL to the key server that your SPEKE-compliant DRM key provider
  /// uses to provide keys for encrypting your content.
  @_s.JsonKey(name: 'url')
  final String url;

  SpekeKeyProviderCmaf({
    this.certificateArn,
    this.dashSignaledSystemIds,
    this.hlsSignaledSystemIds,
    this.resourceId,
    this.url,
  });
  factory SpekeKeyProviderCmaf.fromJson(Map<String, dynamic> json) =>
      _$SpekeKeyProviderCmafFromJson(json);

  Map<String, dynamic> toJson() => _$SpekeKeyProviderCmafToJson(this);
}

/// Use these settings to set up encryption with a static key provider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StaticKeyProvider {
  /// Relates to DRM implementation. Sets the value of the KEYFORMAT attribute.
  /// Must be 'identity' or a reverse DNS string. May be omitted to indicate an
  /// implicit value of 'identity'.
  @_s.JsonKey(name: 'keyFormat')
  final String keyFormat;

  /// Relates to DRM implementation. Either a single positive integer version
  /// value or a slash delimited list of version values (1/2/3).
  @_s.JsonKey(name: 'keyFormatVersions')
  final String keyFormatVersions;

  /// Relates to DRM implementation. Use a 32-character hexidecimal string to
  /// specify Key Value (StaticKeyValue).
  @_s.JsonKey(name: 'staticKeyValue')
  final String staticKeyValue;

  /// Relates to DRM implementation. The location of the license server used for
  /// protecting content.
  @_s.JsonKey(name: 'url')
  final String url;

  StaticKeyProvider({
    this.keyFormat,
    this.keyFormatVersions,
    this.staticKeyValue,
    this.url,
  });
  factory StaticKeyProvider.fromJson(Map<String, dynamic> json) =>
      _$StaticKeyProviderFromJson(json);

  Map<String, dynamic> toJson() => _$StaticKeyProviderToJson(this);
}

/// Specify how often MediaConvert sends STATUS_UPDATE events to Amazon
/// CloudWatch Events. Set the interval, in seconds, between status updates.
/// MediaConvert sends an update at this interval from the time the service
/// begins processing your job to the time it completes the transcode or
/// encounters an error.
enum StatusUpdateInterval {
  @_s.JsonValue('SECONDS_10')
  seconds_10,
  @_s.JsonValue('SECONDS_12')
  seconds_12,
  @_s.JsonValue('SECONDS_15')
  seconds_15,
  @_s.JsonValue('SECONDS_20')
  seconds_20,
  @_s.JsonValue('SECONDS_30')
  seconds_30,
  @_s.JsonValue('SECONDS_60')
  seconds_60,
  @_s.JsonValue('SECONDS_120')
  seconds_120,
  @_s.JsonValue('SECONDS_180')
  seconds_180,
  @_s.JsonValue('SECONDS_240')
  seconds_240,
  @_s.JsonValue('SECONDS_300')
  seconds_300,
  @_s.JsonValue('SECONDS_360')
  seconds_360,
  @_s.JsonValue('SECONDS_420')
  seconds_420,
  @_s.JsonValue('SECONDS_480')
  seconds_480,
  @_s.JsonValue('SECONDS_540')
  seconds_540,
  @_s.JsonValue('SECONDS_600')
  seconds_600,
}

extension on StatusUpdateInterval {
  String toValue() {
    switch (this) {
      case StatusUpdateInterval.seconds_10:
        return 'SECONDS_10';
      case StatusUpdateInterval.seconds_12:
        return 'SECONDS_12';
      case StatusUpdateInterval.seconds_15:
        return 'SECONDS_15';
      case StatusUpdateInterval.seconds_20:
        return 'SECONDS_20';
      case StatusUpdateInterval.seconds_30:
        return 'SECONDS_30';
      case StatusUpdateInterval.seconds_60:
        return 'SECONDS_60';
      case StatusUpdateInterval.seconds_120:
        return 'SECONDS_120';
      case StatusUpdateInterval.seconds_180:
        return 'SECONDS_180';
      case StatusUpdateInterval.seconds_240:
        return 'SECONDS_240';
      case StatusUpdateInterval.seconds_300:
        return 'SECONDS_300';
      case StatusUpdateInterval.seconds_360:
        return 'SECONDS_360';
      case StatusUpdateInterval.seconds_420:
        return 'SECONDS_420';
      case StatusUpdateInterval.seconds_480:
        return 'SECONDS_480';
      case StatusUpdateInterval.seconds_540:
        return 'SECONDS_540';
      case StatusUpdateInterval.seconds_600:
        return 'SECONDS_600';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// Settings for Teletext caption output
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TeletextDestinationSettings {
  /// Set pageNumber to the Teletext page number for the destination captions for
  /// this output. This value must be a three-digit hexadecimal string; strings
  /// ending in -FF are invalid. If you are passing through the entire set of
  /// Teletext data, do not use this field.
  @_s.JsonKey(name: 'pageNumber')
  final String pageNumber;

  /// Specify the page types for this Teletext page. If you don't specify a value
  /// here, the service sets the page type to the default value Subtitle
  /// (PAGE_TYPE_SUBTITLE). If you pass through the entire set of Teletext data,
  /// don't use this field. When you pass through a set of Teletext pages, your
  /// output has the same page types as your input.
  @_s.JsonKey(name: 'pageTypes')
  final List<TeletextPageType> pageTypes;

  TeletextDestinationSettings({
    this.pageNumber,
    this.pageTypes,
  });
  factory TeletextDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$TeletextDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$TeletextDestinationSettingsToJson(this);
}

/// A page type as defined in the standard ETSI EN 300 468, Table 94
enum TeletextPageType {
  @_s.JsonValue('PAGE_TYPE_INITIAL')
  pageTypeInitial,
  @_s.JsonValue('PAGE_TYPE_SUBTITLE')
  pageTypeSubtitle,
  @_s.JsonValue('PAGE_TYPE_ADDL_INFO')
  pageTypeAddlInfo,
  @_s.JsonValue('PAGE_TYPE_PROGRAM_SCHEDULE')
  pageTypeProgramSchedule,
  @_s.JsonValue('PAGE_TYPE_HEARING_IMPAIRED_SUBTITLE')
  pageTypeHearingImpairedSubtitle,
}

/// Settings specific to Teletext caption sources, including Page number.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TeletextSourceSettings {
  /// Use Page Number (PageNumber) to specify the three-digit hexadecimal page
  /// number that will be used for Teletext captions. Do not use this setting if
  /// you are passing through teletext from the input source to output.
  @_s.JsonKey(name: 'pageNumber')
  final String pageNumber;

  TeletextSourceSettings({
    this.pageNumber,
  });
  factory TeletextSourceSettings.fromJson(Map<String, dynamic> json) =>
      _$TeletextSourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$TeletextSourceSettingsToJson(this);
}

/// Timecode burn-in (TimecodeBurnIn)--Burns the output timecode and specified
/// prefix into the output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimecodeBurnin {
  /// Use Font Size (FontSize) to set the font size of any burned-in timecode.
  /// Valid values are 10, 16, 32, 48.
  @_s.JsonKey(name: 'fontSize')
  final int fontSize;

  /// Use Position (Position) under under Timecode burn-in (TimecodeBurnIn) to
  /// specify the location the burned-in timecode on output video.
  @_s.JsonKey(name: 'position')
  final TimecodeBurninPosition position;

  /// Use Prefix (Prefix) to place ASCII characters before any burned-in timecode.
  /// For example, a prefix of "EZ-" will result in the timecode "EZ-00:00:00:00".
  /// Provide either the characters themselves or the ASCII code equivalents. The
  /// supported range of characters is 0x20 through 0x7e. This includes letters,
  /// numbers, and all special characters represented on a standard English
  /// keyboard.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  TimecodeBurnin({
    this.fontSize,
    this.position,
    this.prefix,
  });
  factory TimecodeBurnin.fromJson(Map<String, dynamic> json) =>
      _$TimecodeBurninFromJson(json);

  Map<String, dynamic> toJson() => _$TimecodeBurninToJson(this);
}

/// Use Position (Position) under under Timecode burn-in (TimecodeBurnIn) to
/// specify the location the burned-in timecode on output video.
enum TimecodeBurninPosition {
  @_s.JsonValue('TOP_CENTER')
  topCenter,
  @_s.JsonValue('TOP_LEFT')
  topLeft,
  @_s.JsonValue('TOP_RIGHT')
  topRight,
  @_s.JsonValue('MIDDLE_LEFT')
  middleLeft,
  @_s.JsonValue('MIDDLE_CENTER')
  middleCenter,
  @_s.JsonValue('MIDDLE_RIGHT')
  middleRight,
  @_s.JsonValue('BOTTOM_LEFT')
  bottomLeft,
  @_s.JsonValue('BOTTOM_CENTER')
  bottomCenter,
  @_s.JsonValue('BOTTOM_RIGHT')
  bottomRight,
}

/// These settings control how the service handles timecodes throughout the job.
/// These settings don't affect input clipping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimecodeConfig {
  /// If you use an editing platform that relies on an anchor timecode, use Anchor
  /// Timecode (Anchor) to specify a timecode that will match the input video
  /// frame to the output video frame. Use 24-hour format with frame number,
  /// (HH:MM:SS:FF) or (HH:MM:SS;FF). This setting ignores frame rate conversion.
  /// System behavior for Anchor Timecode varies depending on your setting for
  /// Source (TimecodeSource). * If Source (TimecodeSource) is set to Specified
  /// Start (SPECIFIEDSTART), the first input frame is the specified value in
  /// Start Timecode (Start). Anchor Timecode (Anchor) and Start Timecode (Start)
  /// are used calculate output timecode. * If Source (TimecodeSource) is set to
  /// Start at 0 (ZEROBASED)  the  first frame is 00:00:00:00. * If Source
  /// (TimecodeSource) is set to Embedded (EMBEDDED), the  first frame is the
  /// timecode value on the first input frame of the input.
  @_s.JsonKey(name: 'anchor')
  final String anchor;

  /// Use Source (TimecodeSource) to set how timecodes are handled within this
  /// job. To make sure that your video, audio, captions, and markers are
  /// synchronized and that time-based features, such as image inserter, work
  /// correctly, choose the Timecode source option that matches your assets. All
  /// timecodes are in a 24-hour format with frame number (HH:MM:SS:FF). *
  /// Embedded (EMBEDDED) - Use the timecode that is in the input video. If no
  /// embedded timecode is in the source, the service will use Start at 0
  /// (ZEROBASED) instead. * Start at 0 (ZEROBASED) - Set the timecode of the
  /// initial frame to 00:00:00:00. * Specified Start (SPECIFIEDSTART) - Set the
  /// timecode of the initial frame to a value other than zero. You use Start
  /// timecode (Start) to provide this value.
  @_s.JsonKey(name: 'source')
  final TimecodeSource source;

  /// Only use when you set Source (TimecodeSource) to Specified start
  /// (SPECIFIEDSTART). Use Start timecode (Start) to specify the timecode for the
  /// initial frame. Use 24-hour format with frame number, (HH:MM:SS:FF) or
  /// (HH:MM:SS;FF).
  @_s.JsonKey(name: 'start')
  final String start;

  /// Only applies to outputs that support program-date-time stamp. Use Timestamp
  /// offset (TimestampOffset) to overwrite the timecode date without affecting
  /// the time and frame number. Provide the new date as a string in the format
  /// "yyyy-mm-dd".  To use Time stamp offset, you must also enable Insert
  /// program-date-time (InsertProgramDateTime) in the output settings. For
  /// example, if the date part of your timecodes is 2002-1-25 and you want to
  /// change it to one year later, set Timestamp offset (TimestampOffset) to
  /// 2003-1-25.
  @_s.JsonKey(name: 'timestampOffset')
  final String timestampOffset;

  TimecodeConfig({
    this.anchor,
    this.source,
    this.start,
    this.timestampOffset,
  });
  factory TimecodeConfig.fromJson(Map<String, dynamic> json) =>
      _$TimecodeConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TimecodeConfigToJson(this);
}

/// Use Source (TimecodeSource) to set how timecodes are handled within this
/// job. To make sure that your video, audio, captions, and markers are
/// synchronized and that time-based features, such as image inserter, work
/// correctly, choose the Timecode source option that matches your assets. All
/// timecodes are in a 24-hour format with frame number (HH:MM:SS:FF). *
/// Embedded (EMBEDDED) - Use the timecode that is in the input video. If no
/// embedded timecode is in the source, the service will use Start at 0
/// (ZEROBASED) instead. * Start at 0 (ZEROBASED) - Set the timecode of the
/// initial frame to 00:00:00:00. * Specified Start (SPECIFIEDSTART) - Set the
/// timecode of the initial frame to a value other than zero. You use Start
/// timecode (Start) to provide this value.
enum TimecodeSource {
  @_s.JsonValue('EMBEDDED')
  embedded,
  @_s.JsonValue('ZEROBASED')
  zerobased,
  @_s.JsonValue('SPECIFIEDSTART')
  specifiedstart,
}

/// Applies only to HLS outputs. Use this setting to specify whether the service
/// inserts the ID3 timed metadata from the input in this output.
enum TimedMetadata {
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
  @_s.JsonValue('NONE')
  none,
}

/// Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3 tags
/// in any HLS outputs. To include timed metadata, you must enable it here,
/// enable it in each output container, and specify tags and timecodes in ID3
/// insertion (Id3Insertion) objects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimedMetadataInsertion {
  /// Id3Insertions contains the array of Id3Insertion instances.
  @_s.JsonKey(name: 'id3Insertions')
  final List<Id3Insertion> id3Insertions;

  TimedMetadataInsertion({
    this.id3Insertions,
  });
  factory TimedMetadataInsertion.fromJson(Map<String, dynamic> json) =>
      _$TimedMetadataInsertionFromJson(json);

  Map<String, dynamic> toJson() => _$TimedMetadataInsertionToJson(this);
}

/// Information about when jobs are submitted, started, and finished is
/// specified in Unix epoch format in seconds.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Timing {
  /// The time, in Unix epoch format, that the transcoding job finished
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'finishTime')
  final DateTime finishTime;

  /// The time, in Unix epoch format, that transcoding for the job began.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// The time, in Unix epoch format, that you submitted the job.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'submitTime')
  final DateTime submitTime;

  Timing({
    this.finishTime,
    this.startTime,
    this.submitTime,
  });
  factory Timing.fromJson(Map<String, dynamic> json) => _$TimingFromJson(json);
}

/// Settings specific to caption sources that are specified by track number.
/// Currently, this is only IMSC captions in an IMF package. If your caption
/// source is IMSC 1.1 in a separate xml file, use FileSourceSettings instead of
/// TrackSourceSettings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrackSourceSettings {
  /// Use this setting to select a single captions track from a source. Track
  /// numbers correspond to the order in the captions source file. For IMF
  /// sources, track numbering is based on the order that the captions appear in
  /// the CPL. For example, use 1 to select the captions asset that is listed
  /// first in the CPL. To include more than one captions track in your job
  /// outputs, create multiple input captions selectors. Specify one track per
  /// selector.
  @_s.JsonKey(name: 'trackNumber')
  final int trackNumber;

  TrackSourceSettings({
    this.trackNumber,
  });
  factory TrackSourceSettings.fromJson(Map<String, dynamic> json) =>
      _$TrackSourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$TrackSourceSettingsToJson(this);
}

/// Settings specific to TTML caption outputs, including Pass style information
/// (TtmlStylePassthrough).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TtmlDestinationSettings {
  /// Pass through style and position information from a TTML-like input source
  /// (TTML, SMPTE-TT) to the TTML output.
  @_s.JsonKey(name: 'stylePassthrough')
  final TtmlStylePassthrough stylePassthrough;

  TtmlDestinationSettings({
    this.stylePassthrough,
  });
  factory TtmlDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$TtmlDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$TtmlDestinationSettingsToJson(this);
}

/// Pass through style and position information from a TTML-like input source
/// (TTML, SMPTE-TT) to the TTML output.
enum TtmlStylePassthrough {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

enum Type {
  @_s.JsonValue('SYSTEM')
  system,
  @_s.JsonValue('CUSTOM')
  custom,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateJobTemplateResponse {
  /// A job template is a pre-made set of encoding instructions that you can use
  /// to quickly create a job.
  @_s.JsonKey(name: 'jobTemplate')
  final JobTemplate jobTemplate;

  UpdateJobTemplateResponse({
    this.jobTemplate,
  });
  factory UpdateJobTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateJobTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePresetResponse {
  /// A preset is a collection of preconfigured media conversion settings that you
  /// want MediaConvert to apply to the output during the conversion process.
  @_s.JsonKey(name: 'preset')
  final Preset preset;

  UpdatePresetResponse({
    this.preset,
  });
  factory UpdatePresetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePresetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateQueueResponse {
  /// You can use queues to manage the resources that are available to your AWS
  /// account for running multiple transcoding jobs at the same time. If you don't
  /// specify a queue, the service sends all jobs through the default queue. For
  /// more information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
  @_s.JsonKey(name: 'queue')
  final Queue queue;

  UpdateQueueResponse({
    this.queue,
  });
  factory UpdateQueueResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateQueueResponseFromJson(json);
}

/// Specify the VC3 class to choose the quality characteristics for this output.
/// VC3 class, together with the settings Framerate (framerateNumerator and
/// framerateDenominator) and Resolution (height and width), determine your
/// output bitrate. For example, say that your video resolution is 1920x1080 and
/// your framerate is 29.97. Then Class 145 (CLASS_145) gives you an output with
/// a bitrate of approximately 145 Mbps and Class 220 (CLASS_220) gives you and
/// output with a bitrate of approximately 220 Mbps. VC3 class also specifies
/// the color bit depth of your output.
enum Vc3Class {
  @_s.JsonValue('CLASS_145_8BIT')
  class_145_8bit,
  @_s.JsonValue('CLASS_220_8BIT')
  class_220_8bit,
  @_s.JsonValue('CLASS_220_10BIT')
  class_220_10bit,
}

/// If you are using the console, use the Framerate setting to specify the frame
/// rate for this output. If you want to keep the same frame rate as the input
/// video, choose Follow source. If you want to do frame rate conversion, choose
/// a frame rate from the dropdown list or choose Custom. The framerates shown
/// in the dropdown list are decimal approximations of fractions. If you choose
/// Custom, specify your frame rate as a fraction. If you are creating your
/// transcoding job specification as a JSON file without the console, use
/// FramerateControl to specify which value the service uses for the frame rate
/// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
/// use the frame rate from the input. Choose SPECIFIED if you want the service
/// to use the frame rate you specify in the settings FramerateNumerator and
/// FramerateDenominator.
enum Vc3FramerateControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Choose the method that you want MediaConvert to use when increasing or
/// decreasing the frame rate. We recommend using drop duplicate
/// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
/// fps. For numerically complex conversions, you can use interpolate
/// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
/// introduce undesirable video artifacts. For complex frame rate conversions,
/// especially if your source video has already been converted from its original
/// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
/// interpolation. FrameFormer chooses the best conversion method frame by
/// frame. Note that using FrameFormer increases the transcoding time and incurs
/// a significant add-on cost.
enum Vc3FramerateConversionAlgorithm {
  @_s.JsonValue('DUPLICATE_DROP')
  duplicateDrop,
  @_s.JsonValue('INTERPOLATE')
  interpolate,
  @_s.JsonValue('FRAMEFORMER')
  frameformer,
}

/// Optional. Choose the scan line type for this output. If you don't specify a
/// value, MediaConvert will create a progressive output.
enum Vc3InterlaceMode {
  @_s.JsonValue('INTERLACED')
  interlaced,
  @_s.JsonValue('PROGRESSIVE')
  progressive,
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value VC3
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Vc3Settings {
  /// If you are using the console, use the Framerate setting to specify the frame
  /// rate for this output. If you want to keep the same frame rate as the input
  /// video, choose Follow source. If you want to do frame rate conversion, choose
  /// a frame rate from the dropdown list or choose Custom. The framerates shown
  /// in the dropdown list are decimal approximations of fractions. If you choose
  /// Custom, specify your frame rate as a fraction. If you are creating your
  /// transcoding job specification as a JSON file without the console, use
  /// FramerateControl to specify which value the service uses for the frame rate
  /// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
  /// use the frame rate from the input. Choose SPECIFIED if you want the service
  /// to use the frame rate you specify in the settings FramerateNumerator and
  /// FramerateDenominator.
  @_s.JsonKey(name: 'framerateControl')
  final Vc3FramerateControl framerateControl;

  /// Choose the method that you want MediaConvert to use when increasing or
  /// decreasing the frame rate. We recommend using drop duplicate
  /// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
  /// fps. For numerically complex conversions, you can use interpolate
  /// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
  /// introduce undesirable video artifacts. For complex frame rate conversions,
  /// especially if your source video has already been converted from its original
  /// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
  /// interpolation. FrameFormer chooses the best conversion method frame by
  /// frame. Note that using FrameFormer increases the transcoding time and incurs
  /// a significant add-on cost.
  @_s.JsonKey(name: 'framerateConversionAlgorithm')
  final Vc3FramerateConversionAlgorithm framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// Optional. Choose the scan line type for this output. If you don't specify a
  /// value, MediaConvert will create a progressive output.
  @_s.JsonKey(name: 'interlaceMode')
  final Vc3InterlaceMode interlaceMode;

  /// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
  /// second (fps). Enable slow PAL to create a 25 fps output by relabeling the
  /// video frames and resampling your audio. Note that enabling this setting will
  /// slightly reduce the duration of your video. Related settings: You must also
  /// set Framerate to 25. In your JSON job specification, set (framerateControl)
  /// to (SPECIFIED), (framerateNumerator) to 25 and (framerateDenominator) to 1.
  @_s.JsonKey(name: 'slowPal')
  final Vc3SlowPal slowPal;

  /// When you do frame rate conversion from 23.976 frames per second (fps) to
  /// 29.97 fps, and your output scan type is interlaced, you can optionally
  /// enable hard telecine (HARD) to create a smoother picture. When you keep the
  /// default value, None (NONE), MediaConvert does a standard frame rate
  /// conversion to 29.97 without doing anything with the field polarity to create
  /// a smoother picture.
  @_s.JsonKey(name: 'telecine')
  final Vc3Telecine telecine;

  /// Specify the VC3 class to choose the quality characteristics for this output.
  /// VC3 class, together with the settings Framerate (framerateNumerator and
  /// framerateDenominator) and Resolution (height and width), determine your
  /// output bitrate. For example, say that your video resolution is 1920x1080 and
  /// your framerate is 29.97. Then Class 145 (CLASS_145) gives you an output with
  /// a bitrate of approximately 145 Mbps and Class 220 (CLASS_220) gives you and
  /// output with a bitrate of approximately 220 Mbps. VC3 class also specifies
  /// the color bit depth of your output.
  @_s.JsonKey(name: 'vc3Class')
  final Vc3Class vc3Class;

  Vc3Settings({
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.interlaceMode,
    this.slowPal,
    this.telecine,
    this.vc3Class,
  });
  factory Vc3Settings.fromJson(Map<String, dynamic> json) =>
      _$Vc3SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Vc3SettingsToJson(this);
}

/// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
/// second (fps). Enable slow PAL to create a 25 fps output by relabeling the
/// video frames and resampling your audio. Note that enabling this setting will
/// slightly reduce the duration of your video. Related settings: You must also
/// set Framerate to 25. In your JSON job specification, set (framerateControl)
/// to (SPECIFIED), (framerateNumerator) to 25 and (framerateDenominator) to 1.
enum Vc3SlowPal {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// When you do frame rate conversion from 23.976 frames per second (fps) to
/// 29.97 fps, and your output scan type is interlaced, you can optionally
/// enable hard telecine (HARD) to create a smoother picture. When you keep the
/// default value, None (NONE), MediaConvert does a standard frame rate
/// conversion to 29.97 without doing anything with the field polarity to create
/// a smoother picture.
enum Vc3Telecine {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('HARD')
  hard,
}

/// Type of video codec
enum VideoCodec {
  @_s.JsonValue('AV1')
  av1,
  @_s.JsonValue('AVC_INTRA')
  avcIntra,
  @_s.JsonValue('FRAME_CAPTURE')
  frameCapture,
  @_s.JsonValue('H_264')
  h_264,
  @_s.JsonValue('H_265')
  h_265,
  @_s.JsonValue('MPEG2')
  mpeg2,
  @_s.JsonValue('PRORES')
  prores,
  @_s.JsonValue('VC3')
  vc3,
  @_s.JsonValue('VP8')
  vp8,
  @_s.JsonValue('VP9')
  vp9,
}

/// Video codec settings, (CodecSettings) under (VideoDescription), contains the
/// group of settings related to video encoding. The settings in this group vary
/// depending on the value that you choose for Video codec (Codec). For each
/// codec enum that you choose, define the corresponding settings object. The
/// following lists the codec enum, settings object pairs. * AV1, Av1Settings *
/// AVC_INTRA, AvcIntraSettings * FRAME_CAPTURE, FrameCaptureSettings * H_264,
/// H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES,
/// ProresSettings * VC3, Vc3Settings * VP8, Vp8Settings * VP9, Vp9Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VideoCodecSettings {
  /// Required when you set Codec, under VideoDescription>CodecSettings to the
  /// value AV1.
  @_s.JsonKey(name: 'av1Settings')
  final Av1Settings av1Settings;

  /// Required when you set your output video codec to AVC-Intra. For more
  /// information about the AVC-I settings, see the relevant specification. For
  /// detailed information about SD and HD in AVC-I, see
  /// https://ieeexplore.ieee.org/document/7290936.
  @_s.JsonKey(name: 'avcIntraSettings')
  final AvcIntraSettings avcIntraSettings;

  /// Specifies the video codec. This must be equal to one of the enum values
  /// defined by the object  VideoCodec.
  @_s.JsonKey(name: 'codec')
  final VideoCodec codec;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value FRAME_CAPTURE.
  @_s.JsonKey(name: 'frameCaptureSettings')
  final FrameCaptureSettings frameCaptureSettings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value H_264.
  @_s.JsonKey(name: 'h264Settings')
  final H264Settings h264Settings;

  /// Settings for H265 codec
  @_s.JsonKey(name: 'h265Settings')
  final H265Settings h265Settings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value MPEG2.
  @_s.JsonKey(name: 'mpeg2Settings')
  final Mpeg2Settings mpeg2Settings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value PRORES.
  @_s.JsonKey(name: 'proresSettings')
  final ProresSettings proresSettings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value VC3
  @_s.JsonKey(name: 'vc3Settings')
  final Vc3Settings vc3Settings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value VP8.
  @_s.JsonKey(name: 'vp8Settings')
  final Vp8Settings vp8Settings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value VP9.
  @_s.JsonKey(name: 'vp9Settings')
  final Vp9Settings vp9Settings;

  VideoCodecSettings({
    this.av1Settings,
    this.avcIntraSettings,
    this.codec,
    this.frameCaptureSettings,
    this.h264Settings,
    this.h265Settings,
    this.mpeg2Settings,
    this.proresSettings,
    this.vc3Settings,
    this.vp8Settings,
    this.vp9Settings,
  });
  factory VideoCodecSettings.fromJson(Map<String, dynamic> json) =>
      _$VideoCodecSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCodecSettingsToJson(this);
}

/// Settings for video outputs
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VideoDescription {
  /// This setting only applies to H.264, H.265, and MPEG2 outputs. Use Insert AFD
  /// signaling (AfdSignaling) to specify whether the service includes AFD values
  /// in the output video data and what those values are. * Choose None to remove
  /// all AFD values from this output. * Choose Fixed to ignore input AFD values
  /// and instead encode the value specified in the job. * Choose Auto to
  /// calculate output AFD values based on the input AFD scaler data.
  @_s.JsonKey(name: 'afdSignaling')
  final AfdSignaling afdSignaling;

  /// The anti-alias filter is automatically applied to all outputs. The service
  /// no longer accepts the value DISABLED for AntiAlias. If you specify that in
  /// your job, the service will ignore the setting.
  @_s.JsonKey(name: 'antiAlias')
  final AntiAlias antiAlias;

  /// Video codec settings, (CodecSettings) under (VideoDescription), contains the
  /// group of settings related to video encoding. The settings in this group vary
  /// depending on the value that you choose for Video codec (Codec). For each
  /// codec enum that you choose, define the corresponding settings object. The
  /// following lists the codec enum, settings object pairs. * AV1, Av1Settings *
  /// AVC_INTRA, AvcIntraSettings * FRAME_CAPTURE, FrameCaptureSettings * H_264,
  /// H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES,
  /// ProresSettings * VC3, Vc3Settings * VP8, Vp8Settings * VP9, Vp9Settings
  @_s.JsonKey(name: 'codecSettings')
  final VideoCodecSettings codecSettings;

  /// Choose Insert (INSERT) for this setting to include color metadata in this
  /// output. Choose Ignore (IGNORE) to exclude color metadata from this output.
  /// If you don't specify a value, the service sets this to Insert by default.
  @_s.JsonKey(name: 'colorMetadata')
  final ColorMetadata colorMetadata;

  /// Use Cropping selection (crop) to specify the video area that the service
  /// will include in the output video frame.
  @_s.JsonKey(name: 'crop')
  final Rectangle crop;

  /// Applies only to 29.97 fps outputs. When this feature is enabled, the service
  /// will use drop-frame timecode on outputs. If it is not possible to use
  /// drop-frame timecode, the system will fall back to non-drop-frame. This
  /// setting is enabled by default when Timecode insertion (TimecodeInsertion) is
  /// enabled.
  @_s.JsonKey(name: 'dropFrameTimecode')
  final DropFrameTimecode dropFrameTimecode;

  /// Applies only if you set AFD Signaling(AfdSignaling) to Fixed (FIXED). Use
  /// Fixed (FixedAfd) to specify a four-bit AFD value which the service will
  /// write on all  frames of this video output.
  @_s.JsonKey(name: 'fixedAfd')
  final int fixedAfd;

  /// Use the Height (Height) setting to define the video resolution height for
  /// this output. Specify in pixels. If you don't provide a value here, the
  /// service will use the input height.
  @_s.JsonKey(name: 'height')
  final int height;

  /// Use Selection placement (position) to define the video area in your output
  /// frame. The area outside of the rectangle that you specify here is black.
  @_s.JsonKey(name: 'position')
  final Rectangle position;

  /// Use Respond to AFD (RespondToAfd) to specify how the service changes the
  /// video itself in response to AFD values in the input. * Choose Respond to
  /// clip the input video frame according to the AFD value, input display aspect
  /// ratio, and output display aspect ratio. * Choose Passthrough to include the
  /// input AFD values. Do not choose this when AfdSignaling is set to (NONE). A
  /// preferred implementation of this workflow is to set RespondToAfd to (NONE)
  /// and set AfdSignaling to (AUTO). * Choose None to remove all input AFD values
  /// from this output.
  @_s.JsonKey(name: 'respondToAfd')
  final RespondToAfd respondToAfd;

  /// Specify how the service handles outputs that have a different aspect ratio
  /// from the input aspect ratio. Choose Stretch to output (STRETCH_TO_OUTPUT) to
  /// have the service stretch your video image to fit. Keep the setting Default
  /// (DEFAULT) to have the service letterbox your video instead. This setting
  /// overrides any value that you specify for the setting Selection placement
  /// (position) in this output.
  @_s.JsonKey(name: 'scalingBehavior')
  final ScalingBehavior scalingBehavior;

  /// Use Sharpness (Sharpness) setting to specify the strength of anti-aliasing.
  /// This setting changes the width of the anti-alias filter kernel used for
  /// scaling. Sharpness only applies if your output resolution is different from
  /// your input resolution. 0 is the softest setting, 100 the sharpest, and 50
  /// recommended for most content.
  @_s.JsonKey(name: 'sharpness')
  final int sharpness;

  /// Applies only to H.264, H.265, MPEG2, and ProRes outputs. Only enable
  /// Timecode insertion when the input frame rate is identical to the output
  /// frame rate. To include timecodes in this output, set Timecode insertion
  /// (VideoTimecodeInsertion) to PIC_TIMING_SEI. To leave them out, set it to
  /// DISABLED. Default is DISABLED. When the service inserts timecodes in an
  /// output, by default, it uses any embedded timecodes from the input. If none
  /// are present, the service will set the timecode for the first output frame to
  /// zero. To change this default behavior, adjust the settings under Timecode
  /// configuration (TimecodeConfig). In the console, these settings are located
  /// under Job > Job settings > Timecode configuration. Note - Timecode source
  /// under input settings (InputTimecodeSource) does not affect the timecodes
  /// that are inserted in the output. Source under Job settings > Timecode
  /// configuration (TimecodeSource) does.
  @_s.JsonKey(name: 'timecodeInsertion')
  final VideoTimecodeInsertion timecodeInsertion;

  /// Find additional transcoding features under Preprocessors
  /// (VideoPreprocessors). Enable the features at each output individually. These
  /// features are disabled by default.
  @_s.JsonKey(name: 'videoPreprocessors')
  final VideoPreprocessor videoPreprocessors;

  /// Use Width (Width) to define the video resolution width, in pixels, for this
  /// output. If you don't provide a value here, the service will use the input
  /// width.
  @_s.JsonKey(name: 'width')
  final int width;

  VideoDescription({
    this.afdSignaling,
    this.antiAlias,
    this.codecSettings,
    this.colorMetadata,
    this.crop,
    this.dropFrameTimecode,
    this.fixedAfd,
    this.height,
    this.position,
    this.respondToAfd,
    this.scalingBehavior,
    this.sharpness,
    this.timecodeInsertion,
    this.videoPreprocessors,
    this.width,
  });
  factory VideoDescription.fromJson(Map<String, dynamic> json) =>
      _$VideoDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$VideoDescriptionToJson(this);
}

/// Contains details about the output's video stream
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VideoDetail {
  /// Height in pixels for the output
  @_s.JsonKey(name: 'heightInPx')
  final int heightInPx;

  /// Width in pixels for the output
  @_s.JsonKey(name: 'widthInPx')
  final int widthInPx;

  VideoDetail({
    this.heightInPx,
    this.widthInPx,
  });
  factory VideoDetail.fromJson(Map<String, dynamic> json) =>
      _$VideoDetailFromJson(json);
}

/// Find additional transcoding features under Preprocessors
/// (VideoPreprocessors). Enable the features at each output individually. These
/// features are disabled by default.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VideoPreprocessor {
  /// Enable the Color corrector (ColorCorrector) feature if necessary. Enable or
  /// disable this feature for each output individually. This setting is disabled
  /// by default.
  @_s.JsonKey(name: 'colorCorrector')
  final ColorCorrector colorCorrector;

  /// Use Deinterlacer (Deinterlacer) to produce smoother motion and a clearer
  /// picture.
  @_s.JsonKey(name: 'deinterlacer')
  final Deinterlacer deinterlacer;

  /// Enable Dolby Vision feature to produce Dolby Vision compatible video output.
  @_s.JsonKey(name: 'dolbyVision')
  final DolbyVision dolbyVision;

  /// Enable the Image inserter (ImageInserter) feature to include a graphic
  /// overlay on your video. Enable or disable this feature for each output
  /// individually. This setting is disabled by default.
  @_s.JsonKey(name: 'imageInserter')
  final ImageInserter imageInserter;

  /// Enable the Noise reducer (NoiseReducer) feature to remove noise from your
  /// video output if necessary. Enable or disable this feature for each output
  /// individually. This setting is disabled by default.
  @_s.JsonKey(name: 'noiseReducer')
  final NoiseReducer noiseReducer;

  /// If you work with a third party video watermarking partner, use the group of
  /// settings that correspond with your watermarking partner to include
  /// watermarks in your output.
  @_s.JsonKey(name: 'partnerWatermarking')
  final PartnerWatermarking partnerWatermarking;

  /// Timecode burn-in (TimecodeBurnIn)--Burns the output timecode and specified
  /// prefix into the output.
  @_s.JsonKey(name: 'timecodeBurnin')
  final TimecodeBurnin timecodeBurnin;

  VideoPreprocessor({
    this.colorCorrector,
    this.deinterlacer,
    this.dolbyVision,
    this.imageInserter,
    this.noiseReducer,
    this.partnerWatermarking,
    this.timecodeBurnin,
  });
  factory VideoPreprocessor.fromJson(Map<String, dynamic> json) =>
      _$VideoPreprocessorFromJson(json);

  Map<String, dynamic> toJson() => _$VideoPreprocessorToJson(this);
}

/// Selector for video.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VideoSelector {
  /// Ignore this setting unless this input is a QuickTime animation with an alpha
  /// channel. Use this setting to create separate Key and Fill outputs. In each
  /// output, specify which part of the input MediaConvert uses. Leave this
  /// setting at the default value DISCARD to delete the alpha channel and
  /// preserve the video. Set it to REMAP_TO_LUMA to delete the video and map the
  /// alpha channel to the luma channel of your outputs.
  @_s.JsonKey(name: 'alphaBehavior')
  final AlphaBehavior alphaBehavior;

  /// If your input video has accurate color space metadata, or if you don't know
  /// about color space, leave this set to the default value Follow (FOLLOW). The
  /// service will automatically detect your input color space. If your input
  /// video has metadata indicating the wrong color space, specify the accurate
  /// color space here. If your input video is HDR 10 and the SMPTE ST 2086
  /// Mastering Display Color Volume static metadata isn't present in your video
  /// stream, or if that metadata is present but not accurate, choose Force HDR 10
  /// (FORCE_HDR10) here and specify correct values in the input HDR 10 metadata
  /// (Hdr10Metadata) settings. For more information about MediaConvert HDR jobs,
  /// see https://docs.aws.amazon.com/console/mediaconvert/hdr.
  @_s.JsonKey(name: 'colorSpace')
  final ColorSpace colorSpace;

  /// There are two sources for color metadata, the input file and the job input
  /// settings Color space (ColorSpace) and HDR master display information
  /// settings(Hdr10Metadata). The Color space usage setting determines which
  /// takes precedence. Choose Force (FORCE) to use color metadata from the input
  /// job settings. If you don't specify values for those settings, the service
  /// defaults to using metadata from your input. FALLBACK - Choose Fallback
  /// (FALLBACK) to use color metadata from the source when it is present. If
  /// there's no color metadata in your input file, the service defaults to using
  /// values you specify in the input settings.
  @_s.JsonKey(name: 'colorSpaceUsage')
  final ColorSpaceUsage colorSpaceUsage;

  /// Use these settings to provide HDR 10 metadata that is missing or inaccurate
  /// in your input video. Appropriate values vary depending on the input video
  /// and must be provided by a color grader. The color grader generates these
  /// values during the HDR 10 mastering process. The valid range for each of
  /// these settings is 0 to 50,000. Each increment represents 0.00002 in CIE1931
  /// color coordinate. Related settings - When you specify these values, you must
  /// also set Color space (ColorSpace) to HDR 10 (HDR10). To specify whether the
  /// the values you specify here take precedence over the values in the metadata
  /// of your input file, set Color space usage (ColorSpaceUsage). To specify
  /// whether color metadata is included in an output, set Color metadata
  /// (ColorMetadata). For more information about MediaConvert HDR jobs, see
  /// https://docs.aws.amazon.com/console/mediaconvert/hdr.
  @_s.JsonKey(name: 'hdr10Metadata')
  final Hdr10Metadata hdr10Metadata;

  /// Use PID (Pid) to select specific video data from an input file. Specify this
  /// value as an integer; the system automatically converts it to the hexidecimal
  /// value. For example, 257 selects PID 0x101. A PID, or packet identifier, is
  /// an identifier for a set of data in an MPEG-2 transport stream container.
  @_s.JsonKey(name: 'pid')
  final int pid;

  /// Selects a specific program from within a multi-program transport stream.
  /// Note that Quad 4K is not currently supported.
  @_s.JsonKey(name: 'programNumber')
  final int programNumber;

  /// Use Rotate (InputRotate) to specify how the service rotates your video. You
  /// can choose automatic rotation or specify a rotation. You can specify a
  /// clockwise rotation of 0, 90, 180, or 270 degrees. If your input video
  /// container is .mov or .mp4 and your input has rotation metadata, you can
  /// choose Automatic to have the service rotate your video according to the
  /// rotation specified in the metadata. The rotation must be within one degree
  /// of 90, 180, or 270 degrees. If the rotation metadata specifies any other
  /// rotation, the service will default to no rotation. By default, the service
  /// does no rotation, even if your input video has rotation metadata. The
  /// service doesn't pass through rotation metadata.
  @_s.JsonKey(name: 'rotate')
  final InputRotate rotate;

  VideoSelector({
    this.alphaBehavior,
    this.colorSpace,
    this.colorSpaceUsage,
    this.hdr10Metadata,
    this.pid,
    this.programNumber,
    this.rotate,
  });
  factory VideoSelector.fromJson(Map<String, dynamic> json) =>
      _$VideoSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSelectorToJson(this);
}

/// Applies only to H.264, H.265, MPEG2, and ProRes outputs. Only enable
/// Timecode insertion when the input frame rate is identical to the output
/// frame rate. To include timecodes in this output, set Timecode insertion
/// (VideoTimecodeInsertion) to PIC_TIMING_SEI. To leave them out, set it to
/// DISABLED. Default is DISABLED. When the service inserts timecodes in an
/// output, by default, it uses any embedded timecodes from the input. If none
/// are present, the service will set the timecode for the first output frame to
/// zero. To change this default behavior, adjust the settings under Timecode
/// configuration (TimecodeConfig). In the console, these settings are located
/// under Job > Job settings > Timecode configuration. Note - Timecode source
/// under input settings (InputTimecodeSource) does not affect the timecodes
/// that are inserted in the output. Source under Job settings > Timecode
/// configuration (TimecodeSource) does.
enum VideoTimecodeInsertion {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('PIC_TIMING_SEI')
  picTimingSei,
}

/// Required when you set Codec, under AudioDescriptions>CodecSettings, to the
/// value Vorbis.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VorbisSettings {
  /// Optional. Specify the number of channels in this output audio track.
  /// Choosing Mono on the console gives you 1 output channel; choosing Stereo
  /// gives you 2. In the API, valid values are 1 and 2. The default value is 2.
  @_s.JsonKey(name: 'channels')
  final int channels;

  /// Optional. Specify the audio sample rate in Hz. Valid values are 22050,
  /// 32000, 44100, and 48000. The default value is 48000.
  @_s.JsonKey(name: 'sampleRate')
  final int sampleRate;

  /// Optional. Specify the variable audio quality of this Vorbis output from -1
  /// (lowest quality, ~45 kbit/s) to 10 (highest quality, ~500 kbit/s). The
  /// default value is 4 (~128 kbit/s). Values 5 and 6 are approximately 160 and
  /// 192 kbit/s, respectively.
  @_s.JsonKey(name: 'vbrQuality')
  final int vbrQuality;

  VorbisSettings({
    this.channels,
    this.sampleRate,
    this.vbrQuality,
  });
  factory VorbisSettings.fromJson(Map<String, dynamic> json) =>
      _$VorbisSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$VorbisSettingsToJson(this);
}

/// If you are using the console, use the Framerate setting to specify the frame
/// rate for this output. If you want to keep the same frame rate as the input
/// video, choose Follow source. If you want to do frame rate conversion, choose
/// a frame rate from the dropdown list or choose Custom. The framerates shown
/// in the dropdown list are decimal approximations of fractions. If you choose
/// Custom, specify your frame rate as a fraction. If you are creating your
/// transcoding job specification as a JSON file without the console, use
/// FramerateControl to specify which value the service uses for the frame rate
/// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
/// use the frame rate from the input. Choose SPECIFIED if you want the service
/// to use the frame rate you specify in the settings FramerateNumerator and
/// FramerateDenominator.
enum Vp8FramerateControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Choose the method that you want MediaConvert to use when increasing or
/// decreasing the frame rate. We recommend using drop duplicate
/// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
/// fps. For numerically complex conversions, you can use interpolate
/// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
/// introduce undesirable video artifacts. For complex frame rate conversions,
/// especially if your source video has already been converted from its original
/// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
/// interpolation. FrameFormer chooses the best conversion method frame by
/// frame. Note that using FrameFormer increases the transcoding time and incurs
/// a significant add-on cost.
enum Vp8FramerateConversionAlgorithm {
  @_s.JsonValue('DUPLICATE_DROP')
  duplicateDrop,
  @_s.JsonValue('INTERPOLATE')
  interpolate,
  @_s.JsonValue('FRAMEFORMER')
  frameformer,
}

/// Optional. Specify how the service determines the pixel aspect ratio (PAR)
/// for this output. The default behavior, Follow source
/// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
/// output. To specify a different PAR in the console, choose any value other
/// than Follow source. To specify a different PAR by editing the JSON job
/// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
/// you must also specify values for the parNumerator and parDenominator
/// settings.
enum Vp8ParControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
/// want to trade off encoding speed for output video quality. The default
/// behavior is faster, lower quality, multi-pass encoding.
enum Vp8QualityTuningLevel {
  @_s.JsonValue('MULTI_PASS')
  multiPass,
  @_s.JsonValue('MULTI_PASS_HQ')
  multiPassHq,
}

/// With the VP8 codec, you can use only the variable bitrate (VBR) rate control
/// mode.
enum Vp8RateControlMode {
  @_s.JsonValue('VBR')
  vbr,
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value VP8.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Vp8Settings {
  /// Target bitrate in bits/second. For example, enter five megabits per second
  /// as 5000000.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// If you are using the console, use the Framerate setting to specify the frame
  /// rate for this output. If you want to keep the same frame rate as the input
  /// video, choose Follow source. If you want to do frame rate conversion, choose
  /// a frame rate from the dropdown list or choose Custom. The framerates shown
  /// in the dropdown list are decimal approximations of fractions. If you choose
  /// Custom, specify your frame rate as a fraction. If you are creating your
  /// transcoding job specification as a JSON file without the console, use
  /// FramerateControl to specify which value the service uses for the frame rate
  /// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
  /// use the frame rate from the input. Choose SPECIFIED if you want the service
  /// to use the frame rate you specify in the settings FramerateNumerator and
  /// FramerateDenominator.
  @_s.JsonKey(name: 'framerateControl')
  final Vp8FramerateControl framerateControl;

  /// Choose the method that you want MediaConvert to use when increasing or
  /// decreasing the frame rate. We recommend using drop duplicate
  /// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
  /// fps. For numerically complex conversions, you can use interpolate
  /// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
  /// introduce undesirable video artifacts. For complex frame rate conversions,
  /// especially if your source video has already been converted from its original
  /// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
  /// interpolation. FrameFormer chooses the best conversion method frame by
  /// frame. Note that using FrameFormer increases the transcoding time and incurs
  /// a significant add-on cost.
  @_s.JsonKey(name: 'framerateConversionAlgorithm')
  final Vp8FramerateConversionAlgorithm framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// GOP Length (keyframe interval) in frames. Must be greater than zero.
  @_s.JsonKey(name: 'gopSize')
  final double gopSize;

  /// Optional. Size of buffer (HRD buffer model) in bits. For example, enter five
  /// megabits as 5000000.
  @_s.JsonKey(name: 'hrdBufferSize')
  final int hrdBufferSize;

  /// Ignore this setting unless you set qualityTuningLevel to MULTI_PASS.
  /// Optional. Specify the maximum bitrate in bits/second. For example, enter
  /// five megabits per second as 5000000. The default behavior uses twice the
  /// target bitrate as the maximum bitrate.
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  /// Optional. Specify how the service determines the pixel aspect ratio (PAR)
  /// for this output. The default behavior, Follow source
  /// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
  /// output. To specify a different PAR in the console, choose any value other
  /// than Follow source. To specify a different PAR by editing the JSON job
  /// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
  /// you must also specify values for the parNumerator and parDenominator
  /// settings.
  @_s.JsonKey(name: 'parControl')
  final Vp8ParControl parControl;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parDenominator is 33.
  @_s.JsonKey(name: 'parDenominator')
  final int parDenominator;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parNumerator is 40.
  @_s.JsonKey(name: 'parNumerator')
  final int parNumerator;

  /// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
  /// want to trade off encoding speed for output video quality. The default
  /// behavior is faster, lower quality, multi-pass encoding.
  @_s.JsonKey(name: 'qualityTuningLevel')
  final Vp8QualityTuningLevel qualityTuningLevel;

  /// With the VP8 codec, you can use only the variable bitrate (VBR) rate control
  /// mode.
  @_s.JsonKey(name: 'rateControlMode')
  final Vp8RateControlMode rateControlMode;

  Vp8Settings({
    this.bitrate,
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.gopSize,
    this.hrdBufferSize,
    this.maxBitrate,
    this.parControl,
    this.parDenominator,
    this.parNumerator,
    this.qualityTuningLevel,
    this.rateControlMode,
  });
  factory Vp8Settings.fromJson(Map<String, dynamic> json) =>
      _$Vp8SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Vp8SettingsToJson(this);
}

/// If you are using the console, use the Framerate setting to specify the frame
/// rate for this output. If you want to keep the same frame rate as the input
/// video, choose Follow source. If you want to do frame rate conversion, choose
/// a frame rate from the dropdown list or choose Custom. The framerates shown
/// in the dropdown list are decimal approximations of fractions. If you choose
/// Custom, specify your frame rate as a fraction. If you are creating your
/// transcoding job specification as a JSON file without the console, use
/// FramerateControl to specify which value the service uses for the frame rate
/// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
/// use the frame rate from the input. Choose SPECIFIED if you want the service
/// to use the frame rate you specify in the settings FramerateNumerator and
/// FramerateDenominator.
enum Vp9FramerateControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Choose the method that you want MediaConvert to use when increasing or
/// decreasing the frame rate. We recommend using drop duplicate
/// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
/// fps. For numerically complex conversions, you can use interpolate
/// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
/// introduce undesirable video artifacts. For complex frame rate conversions,
/// especially if your source video has already been converted from its original
/// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
/// interpolation. FrameFormer chooses the best conversion method frame by
/// frame. Note that using FrameFormer increases the transcoding time and incurs
/// a significant add-on cost.
enum Vp9FramerateConversionAlgorithm {
  @_s.JsonValue('DUPLICATE_DROP')
  duplicateDrop,
  @_s.JsonValue('INTERPOLATE')
  interpolate,
  @_s.JsonValue('FRAMEFORMER')
  frameformer,
}

/// Optional. Specify how the service determines the pixel aspect ratio (PAR)
/// for this output. The default behavior, Follow source
/// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
/// output. To specify a different PAR in the console, choose any value other
/// than Follow source. To specify a different PAR by editing the JSON job
/// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
/// you must also specify values for the parNumerator and parDenominator
/// settings.
enum Vp9ParControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
/// want to trade off encoding speed for output video quality. The default
/// behavior is faster, lower quality, multi-pass encoding.
enum Vp9QualityTuningLevel {
  @_s.JsonValue('MULTI_PASS')
  multiPass,
  @_s.JsonValue('MULTI_PASS_HQ')
  multiPassHq,
}

/// With the VP9 codec, you can use only the variable bitrate (VBR) rate control
/// mode.
enum Vp9RateControlMode {
  @_s.JsonValue('VBR')
  vbr,
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value VP9.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Vp9Settings {
  /// Target bitrate in bits/second. For example, enter five megabits per second
  /// as 5000000.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// If you are using the console, use the Framerate setting to specify the frame
  /// rate for this output. If you want to keep the same frame rate as the input
  /// video, choose Follow source. If you want to do frame rate conversion, choose
  /// a frame rate from the dropdown list or choose Custom. The framerates shown
  /// in the dropdown list are decimal approximations of fractions. If you choose
  /// Custom, specify your frame rate as a fraction. If you are creating your
  /// transcoding job specification as a JSON file without the console, use
  /// FramerateControl to specify which value the service uses for the frame rate
  /// for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to
  /// use the frame rate from the input. Choose SPECIFIED if you want the service
  /// to use the frame rate you specify in the settings FramerateNumerator and
  /// FramerateDenominator.
  @_s.JsonKey(name: 'framerateControl')
  final Vp9FramerateControl framerateControl;

  /// Choose the method that you want MediaConvert to use when increasing or
  /// decreasing the frame rate. We recommend using drop duplicate
  /// (DUPLICATE_DROP) for numerically simple conversions, such as 60 fps to 30
  /// fps. For numerically complex conversions, you can use interpolate
  /// (INTERPOLATE) to avoid stutter. This results in a smooth picture, but might
  /// introduce undesirable video artifacts. For complex frame rate conversions,
  /// especially if your source video has already been converted from its original
  /// cadence, use FrameFormer (FRAMEFORMER) to do motion-compensated
  /// interpolation. FrameFormer chooses the best conversion method frame by
  /// frame. Note that using FrameFormer increases the transcoding time and incurs
  /// a significant add-on cost.
  @_s.JsonKey(name: 'framerateConversionAlgorithm')
  final Vp9FramerateConversionAlgorithm framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// GOP Length (keyframe interval) in frames. Must be greater than zero.
  @_s.JsonKey(name: 'gopSize')
  final double gopSize;

  /// Size of buffer (HRD buffer model) in bits. For example, enter five megabits
  /// as 5000000.
  @_s.JsonKey(name: 'hrdBufferSize')
  final int hrdBufferSize;

  /// Ignore this setting unless you set qualityTuningLevel to MULTI_PASS.
  /// Optional. Specify the maximum bitrate in bits/second. For example, enter
  /// five megabits per second as 5000000. The default behavior uses twice the
  /// target bitrate as the maximum bitrate.
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  /// Optional. Specify how the service determines the pixel aspect ratio for this
  /// output. The default behavior is to use the same pixel aspect ratio as your
  /// input video.
  @_s.JsonKey(name: 'parControl')
  final Vp9ParControl parControl;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parDenominator is 33.
  @_s.JsonKey(name: 'parDenominator')
  final int parDenominator;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parNumerator is 40.
  @_s.JsonKey(name: 'parNumerator')
  final int parNumerator;

  /// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
  /// want to trade off encoding speed for output video quality. The default
  /// behavior is faster, lower quality, multi-pass encoding.
  @_s.JsonKey(name: 'qualityTuningLevel')
  final Vp9QualityTuningLevel qualityTuningLevel;

  /// With the VP9 codec, you can use only the variable bitrate (VBR) rate control
  /// mode.
  @_s.JsonKey(name: 'rateControlMode')
  final Vp9RateControlMode rateControlMode;

  Vp9Settings({
    this.bitrate,
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.gopSize,
    this.hrdBufferSize,
    this.maxBitrate,
    this.parControl,
    this.parDenominator,
    this.parNumerator,
    this.qualityTuningLevel,
    this.rateControlMode,
  });
  factory Vp9Settings.fromJson(Map<String, dynamic> json) =>
      _$Vp9SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Vp9SettingsToJson(this);
}

/// Optional. Ignore this setting unless Nagra support directs you to specify a
/// value. When you don't specify a value here, the Nagra NexGuard library uses
/// its default value.
enum WatermarkingStrength {
  @_s.JsonValue('LIGHTEST')
  lightest,
  @_s.JsonValue('LIGHTER')
  lighter,
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('STRONGER')
  stronger,
  @_s.JsonValue('STRONGEST')
  strongest,
}

/// The service defaults to using RIFF for WAV outputs. If your output audio is
/// likely to exceed 4 GB in file size, or if you otherwise need the extended
/// support of the RF64 format, set your output WAV file format to RF64.
enum WavFormat {
  @_s.JsonValue('RIFF')
  riff,
  @_s.JsonValue('RF64')
  rf64,
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value WAV.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WavSettings {
  /// Specify Bit depth (BitDepth), in bits per sample, to choose the encoding
  /// quality for this audio track.
  @_s.JsonKey(name: 'bitDepth')
  final int bitDepth;

  /// Specify the number of channels in this output audio track. Valid values are
  /// 1 and even numbers up to 64. For example, 1, 2, 4, 6, and so on, up to 64.
  @_s.JsonKey(name: 'channels')
  final int channels;

  /// The service defaults to using RIFF for WAV outputs. If your output audio is
  /// likely to exceed 4 GB in file size, or if you otherwise need the extended
  /// support of the RF64 format, set your output WAV file format to RF64.
  @_s.JsonKey(name: 'format')
  final WavFormat format;

  /// Sample rate in Hz.
  @_s.JsonKey(name: 'sampleRate')
  final int sampleRate;

  WavSettings({
    this.bitDepth,
    this.channels,
    this.format,
    this.sampleRate,
  });
  factory WavSettings.fromJson(Map<String, dynamic> json) =>
      _$WavSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$WavSettingsToJson(this);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
