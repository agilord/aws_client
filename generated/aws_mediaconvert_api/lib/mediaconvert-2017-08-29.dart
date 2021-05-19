// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// AWS Elemental MediaConvert
class MediaConvert {
  final _s.RestJsonProtocol _protocol;
  MediaConvert({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
    required String arn,
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
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-08-29/jobs/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String role,
    required JobSettings settings,
    AccelerationSettings? accelerationSettings,
    BillingTagsSource? billingTagsSource,
    String? clientRequestToken,
    List<HopDestination>? hopDestinations,
    String? jobTemplate,
    int? priority,
    String? queue,
    SimulateReservedQueue? simulateReservedQueue,
    StatusUpdateInterval? statusUpdateInterval,
    Map<String, String>? tags,
    Map<String, String>? userMetadata,
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
    required String name,
    required JobTemplateSettings settings,
    AccelerationSettings? accelerationSettings,
    String? category,
    String? description,
    List<HopDestination>? hopDestinations,
    int? priority,
    String? queue,
    StatusUpdateInterval? statusUpdateInterval,
    Map<String, String>? tags,
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
    required String name,
    required PresetSettings settings,
    String? category,
    String? description,
    Map<String, String>? tags,
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
    required String name,
    String? description,
    PricingPlan? pricingPlan,
    ReservationPlanSettings? reservationPlanSettings,
    QueueStatus? status,
    Map<String, String>? tags,
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-08-29/jobTemplates/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-08-29/presets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-08-29/queues/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
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
    int? maxResults,
    DescribeEndpointsMode? mode,
    String? nextToken,
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
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-08-29/certificates/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String id,
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
    required String name,
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
    required String name,
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
    required String name,
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
    String? category,
    JobTemplateListBy? listBy,
    int? maxResults,
    String? nextToken,
    Order? order,
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
    int? maxResults,
    String? nextToken,
    Order? order,
    String? queue,
    JobStatus? status,
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
    String? category,
    PresetListBy? listBy,
    int? maxResults,
    String? nextToken,
    Order? order,
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
    QueueListBy? listBy,
    int? maxResults,
    String? nextToken,
    Order? order,
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
    required String arn,
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
    required String arn,
    required Map<String, String> tags,
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
    required String arn,
    List<String>? tagKeys,
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
    required String name,
    AccelerationSettings? accelerationSettings,
    String? category,
    String? description,
    List<HopDestination>? hopDestinations,
    int? priority,
    String? queue,
    JobTemplateSettings? settings,
    StatusUpdateInterval? statusUpdateInterval,
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
    required String name,
    String? category,
    String? description,
    PresetSettings? settings,
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
    required String name,
    String? description,
    ReservationPlanSettings? reservationPlanSettings,
    QueueStatus? status,
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
  broadcasterMixedAd,
  normal,
}

extension on AacAudioDescriptionBroadcasterMix {
  String toValue() {
    switch (this) {
      case AacAudioDescriptionBroadcasterMix.broadcasterMixedAd:
        return 'BROADCASTER_MIXED_AD';
      case AacAudioDescriptionBroadcasterMix.normal:
        return 'NORMAL';
    }
  }
}

extension on String {
  AacAudioDescriptionBroadcasterMix toAacAudioDescriptionBroadcasterMix() {
    switch (this) {
      case 'BROADCASTER_MIXED_AD':
        return AacAudioDescriptionBroadcasterMix.broadcasterMixedAd;
      case 'NORMAL':
        return AacAudioDescriptionBroadcasterMix.normal;
    }
    throw Exception(
        '$this is not known in enum AacAudioDescriptionBroadcasterMix');
  }
}

/// AAC Profile.
enum AacCodecProfile {
  lc,
  hev1,
  hev2,
}

extension on AacCodecProfile {
  String toValue() {
    switch (this) {
      case AacCodecProfile.lc:
        return 'LC';
      case AacCodecProfile.hev1:
        return 'HEV1';
      case AacCodecProfile.hev2:
        return 'HEV2';
    }
  }
}

extension on String {
  AacCodecProfile toAacCodecProfile() {
    switch (this) {
      case 'LC':
        return AacCodecProfile.lc;
      case 'HEV1':
        return AacCodecProfile.hev1;
      case 'HEV2':
        return AacCodecProfile.hev2;
    }
    throw Exception('$this is not known in enum AacCodecProfile');
  }
}

/// Mono (Audio Description), Mono, Stereo, or 5.1 channel layout. Valid values
/// depend on rate control mode and profile. "1.0 - Audio Description (Receiver
/// Mix)" setting receives a stereo description plus control track and emits a
/// mono AAC encode of the description track, with control data emitted in the
/// PES header as per ETSI TS 101 154 Annex E.
enum AacCodingMode {
  adReceiverMix,
  codingMode_1_0,
  codingMode_1_1,
  codingMode_2_0,
  codingMode_5_1,
}

extension on AacCodingMode {
  String toValue() {
    switch (this) {
      case AacCodingMode.adReceiverMix:
        return 'AD_RECEIVER_MIX';
      case AacCodingMode.codingMode_1_0:
        return 'CODING_MODE_1_0';
      case AacCodingMode.codingMode_1_1:
        return 'CODING_MODE_1_1';
      case AacCodingMode.codingMode_2_0:
        return 'CODING_MODE_2_0';
      case AacCodingMode.codingMode_5_1:
        return 'CODING_MODE_5_1';
    }
  }
}

extension on String {
  AacCodingMode toAacCodingMode() {
    switch (this) {
      case 'AD_RECEIVER_MIX':
        return AacCodingMode.adReceiverMix;
      case 'CODING_MODE_1_0':
        return AacCodingMode.codingMode_1_0;
      case 'CODING_MODE_1_1':
        return AacCodingMode.codingMode_1_1;
      case 'CODING_MODE_2_0':
        return AacCodingMode.codingMode_2_0;
      case 'CODING_MODE_5_1':
        return AacCodingMode.codingMode_5_1;
    }
    throw Exception('$this is not known in enum AacCodingMode');
  }
}

/// Rate Control Mode.
enum AacRateControlMode {
  cbr,
  vbr,
}

extension on AacRateControlMode {
  String toValue() {
    switch (this) {
      case AacRateControlMode.cbr:
        return 'CBR';
      case AacRateControlMode.vbr:
        return 'VBR';
    }
  }
}

extension on String {
  AacRateControlMode toAacRateControlMode() {
    switch (this) {
      case 'CBR':
        return AacRateControlMode.cbr;
      case 'VBR':
        return AacRateControlMode.vbr;
    }
    throw Exception('$this is not known in enum AacRateControlMode');
  }
}

/// Enables LATM/LOAS AAC output. Note that if you use LATM/LOAS AAC in an
/// output, you must choose "No container" for the output container.
enum AacRawFormat {
  latmLoas,
  none,
}

extension on AacRawFormat {
  String toValue() {
    switch (this) {
      case AacRawFormat.latmLoas:
        return 'LATM_LOAS';
      case AacRawFormat.none:
        return 'NONE';
    }
  }
}

extension on String {
  AacRawFormat toAacRawFormat() {
    switch (this) {
      case 'LATM_LOAS':
        return AacRawFormat.latmLoas;
      case 'NONE':
        return AacRawFormat.none;
    }
    throw Exception('$this is not known in enum AacRawFormat');
  }
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value AAC. The service accepts one of two mutually exclusive groups of
/// AAC settings--VBR and CBR. To select one of these modes, set the value of
/// Bitrate control mode (rateControlMode) to "VBR" or "CBR".  In VBR mode, you
/// control the audio quality with the setting VBR quality (vbrQuality). In CBR
/// mode, you use the setting Bitrate (bitrate). Defaults and valid values
/// depend on the rate control mode.
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
  final AacAudioDescriptionBroadcasterMix? audioDescriptionBroadcasterMix;

  /// Specify the average bitrate in bits per second. The set of valid values for
  /// this setting is: 6000, 8000, 10000, 12000, 14000, 16000, 20000, 24000,
  /// 28000, 32000, 40000, 48000, 56000, 64000, 80000, 96000, 112000, 128000,
  /// 160000, 192000, 224000, 256000, 288000, 320000, 384000, 448000, 512000,
  /// 576000, 640000, 768000, 896000, 1024000. The value you set is also
  /// constrained by the values that you choose for Profile (codecProfile),
  /// Bitrate control mode (codingMode), and Sample rate (sampleRate). Default
  /// values depend on Bitrate control mode and Profile.
  final int? bitrate;

  /// AAC Profile.
  final AacCodecProfile? codecProfile;

  /// Mono (Audio Description), Mono, Stereo, or 5.1 channel layout. Valid values
  /// depend on rate control mode and profile. "1.0 - Audio Description (Receiver
  /// Mix)" setting receives a stereo description plus control track and emits a
  /// mono AAC encode of the description track, with control data emitted in the
  /// PES header as per ETSI TS 101 154 Annex E.
  final AacCodingMode? codingMode;

  /// Rate Control Mode.
  final AacRateControlMode? rateControlMode;

  /// Enables LATM/LOAS AAC output. Note that if you use LATM/LOAS AAC in an
  /// output, you must choose "No container" for the output container.
  final AacRawFormat? rawFormat;

  /// Sample rate in Hz. Valid values depend on rate control mode and profile.
  final int? sampleRate;

  /// Use MPEG-2 AAC instead of MPEG-4 AAC audio for raw or MPEG-2 Transport
  /// Stream containers.
  final AacSpecification? specification;

  /// VBR Quality Level - Only used if rate_control_mode is VBR.
  final AacVbrQuality? vbrQuality;

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
  factory AacSettings.fromJson(Map<String, dynamic> json) {
    return AacSettings(
      audioDescriptionBroadcasterMix:
          (json['audioDescriptionBroadcasterMix'] as String?)
              ?.toAacAudioDescriptionBroadcasterMix(),
      bitrate: json['bitrate'] as int?,
      codecProfile: (json['codecProfile'] as String?)?.toAacCodecProfile(),
      codingMode: (json['codingMode'] as String?)?.toAacCodingMode(),
      rateControlMode:
          (json['rateControlMode'] as String?)?.toAacRateControlMode(),
      rawFormat: (json['rawFormat'] as String?)?.toAacRawFormat(),
      sampleRate: json['sampleRate'] as int?,
      specification: (json['specification'] as String?)?.toAacSpecification(),
      vbrQuality: (json['vbrQuality'] as String?)?.toAacVbrQuality(),
    );
  }

  Map<String, dynamic> toJson() {
    final audioDescriptionBroadcasterMix = this.audioDescriptionBroadcasterMix;
    final bitrate = this.bitrate;
    final codecProfile = this.codecProfile;
    final codingMode = this.codingMode;
    final rateControlMode = this.rateControlMode;
    final rawFormat = this.rawFormat;
    final sampleRate = this.sampleRate;
    final specification = this.specification;
    final vbrQuality = this.vbrQuality;
    return {
      if (audioDescriptionBroadcasterMix != null)
        'audioDescriptionBroadcasterMix':
            audioDescriptionBroadcasterMix.toValue(),
      if (bitrate != null) 'bitrate': bitrate,
      if (codecProfile != null) 'codecProfile': codecProfile.toValue(),
      if (codingMode != null) 'codingMode': codingMode.toValue(),
      if (rateControlMode != null) 'rateControlMode': rateControlMode.toValue(),
      if (rawFormat != null) 'rawFormat': rawFormat.toValue(),
      if (sampleRate != null) 'sampleRate': sampleRate,
      if (specification != null) 'specification': specification.toValue(),
      if (vbrQuality != null) 'vbrQuality': vbrQuality.toValue(),
    };
  }
}

/// Use MPEG-2 AAC instead of MPEG-4 AAC audio for raw or MPEG-2 Transport
/// Stream containers.
enum AacSpecification {
  mpeg2,
  mpeg4,
}

extension on AacSpecification {
  String toValue() {
    switch (this) {
      case AacSpecification.mpeg2:
        return 'MPEG2';
      case AacSpecification.mpeg4:
        return 'MPEG4';
    }
  }
}

extension on String {
  AacSpecification toAacSpecification() {
    switch (this) {
      case 'MPEG2':
        return AacSpecification.mpeg2;
      case 'MPEG4':
        return AacSpecification.mpeg4;
    }
    throw Exception('$this is not known in enum AacSpecification');
  }
}

/// VBR Quality Level - Only used if rate_control_mode is VBR.
enum AacVbrQuality {
  low,
  mediumLow,
  mediumHigh,
  high,
}

extension on AacVbrQuality {
  String toValue() {
    switch (this) {
      case AacVbrQuality.low:
        return 'LOW';
      case AacVbrQuality.mediumLow:
        return 'MEDIUM_LOW';
      case AacVbrQuality.mediumHigh:
        return 'MEDIUM_HIGH';
      case AacVbrQuality.high:
        return 'HIGH';
    }
  }
}

extension on String {
  AacVbrQuality toAacVbrQuality() {
    switch (this) {
      case 'LOW':
        return AacVbrQuality.low;
      case 'MEDIUM_LOW':
        return AacVbrQuality.mediumLow;
      case 'MEDIUM_HIGH':
        return AacVbrQuality.mediumHigh;
      case 'HIGH':
        return AacVbrQuality.high;
    }
    throw Exception('$this is not known in enum AacVbrQuality');
  }
}

/// Specify the bitstream mode for the AC-3 stream that the encoder emits. For
/// more information about the AC3 bitstream mode, see ATSC A/52-2012 (Annex E).
enum Ac3BitstreamMode {
  completeMain,
  commentary,
  dialogue,
  emergency,
  hearingImpaired,
  musicAndEffects,
  visuallyImpaired,
  voiceOver,
}

extension on Ac3BitstreamMode {
  String toValue() {
    switch (this) {
      case Ac3BitstreamMode.completeMain:
        return 'COMPLETE_MAIN';
      case Ac3BitstreamMode.commentary:
        return 'COMMENTARY';
      case Ac3BitstreamMode.dialogue:
        return 'DIALOGUE';
      case Ac3BitstreamMode.emergency:
        return 'EMERGENCY';
      case Ac3BitstreamMode.hearingImpaired:
        return 'HEARING_IMPAIRED';
      case Ac3BitstreamMode.musicAndEffects:
        return 'MUSIC_AND_EFFECTS';
      case Ac3BitstreamMode.visuallyImpaired:
        return 'VISUALLY_IMPAIRED';
      case Ac3BitstreamMode.voiceOver:
        return 'VOICE_OVER';
    }
  }
}

extension on String {
  Ac3BitstreamMode toAc3BitstreamMode() {
    switch (this) {
      case 'COMPLETE_MAIN':
        return Ac3BitstreamMode.completeMain;
      case 'COMMENTARY':
        return Ac3BitstreamMode.commentary;
      case 'DIALOGUE':
        return Ac3BitstreamMode.dialogue;
      case 'EMERGENCY':
        return Ac3BitstreamMode.emergency;
      case 'HEARING_IMPAIRED':
        return Ac3BitstreamMode.hearingImpaired;
      case 'MUSIC_AND_EFFECTS':
        return Ac3BitstreamMode.musicAndEffects;
      case 'VISUALLY_IMPAIRED':
        return Ac3BitstreamMode.visuallyImpaired;
      case 'VOICE_OVER':
        return Ac3BitstreamMode.voiceOver;
    }
    throw Exception('$this is not known in enum Ac3BitstreamMode');
  }
}

/// Dolby Digital coding mode. Determines number of channels.
enum Ac3CodingMode {
  codingMode_1_0,
  codingMode_1_1,
  codingMode_2_0,
  codingMode_3_2Lfe,
}

extension on Ac3CodingMode {
  String toValue() {
    switch (this) {
      case Ac3CodingMode.codingMode_1_0:
        return 'CODING_MODE_1_0';
      case Ac3CodingMode.codingMode_1_1:
        return 'CODING_MODE_1_1';
      case Ac3CodingMode.codingMode_2_0:
        return 'CODING_MODE_2_0';
      case Ac3CodingMode.codingMode_3_2Lfe:
        return 'CODING_MODE_3_2_LFE';
    }
  }
}

extension on String {
  Ac3CodingMode toAc3CodingMode() {
    switch (this) {
      case 'CODING_MODE_1_0':
        return Ac3CodingMode.codingMode_1_0;
      case 'CODING_MODE_1_1':
        return Ac3CodingMode.codingMode_1_1;
      case 'CODING_MODE_2_0':
        return Ac3CodingMode.codingMode_2_0;
      case 'CODING_MODE_3_2_LFE':
        return Ac3CodingMode.codingMode_3_2Lfe;
    }
    throw Exception('$this is not known in enum Ac3CodingMode');
  }
}

/// If set to FILM_STANDARD, adds dynamic range compression signaling to the
/// output bitstream as defined in the Dolby Digital specification.
enum Ac3DynamicRangeCompressionProfile {
  filmStandard,
  none,
}

extension on Ac3DynamicRangeCompressionProfile {
  String toValue() {
    switch (this) {
      case Ac3DynamicRangeCompressionProfile.filmStandard:
        return 'FILM_STANDARD';
      case Ac3DynamicRangeCompressionProfile.none:
        return 'NONE';
    }
  }
}

extension on String {
  Ac3DynamicRangeCompressionProfile toAc3DynamicRangeCompressionProfile() {
    switch (this) {
      case 'FILM_STANDARD':
        return Ac3DynamicRangeCompressionProfile.filmStandard;
      case 'NONE':
        return Ac3DynamicRangeCompressionProfile.none;
    }
    throw Exception(
        '$this is not known in enum Ac3DynamicRangeCompressionProfile');
  }
}

/// Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only
/// valid with 3_2_LFE coding mode.
enum Ac3LfeFilter {
  enabled,
  disabled,
}

extension on Ac3LfeFilter {
  String toValue() {
    switch (this) {
      case Ac3LfeFilter.enabled:
        return 'ENABLED';
      case Ac3LfeFilter.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  Ac3LfeFilter toAc3LfeFilter() {
    switch (this) {
      case 'ENABLED':
        return Ac3LfeFilter.enabled;
      case 'DISABLED':
        return Ac3LfeFilter.disabled;
    }
    throw Exception('$this is not known in enum Ac3LfeFilter');
  }
}

/// When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+,
/// or DolbyE decoder that supplied this audio data. If audio was not supplied
/// from one of these streams, then the static metadata settings will be used.
enum Ac3MetadataControl {
  followInput,
  useConfigured,
}

extension on Ac3MetadataControl {
  String toValue() {
    switch (this) {
      case Ac3MetadataControl.followInput:
        return 'FOLLOW_INPUT';
      case Ac3MetadataControl.useConfigured:
        return 'USE_CONFIGURED';
    }
  }
}

extension on String {
  Ac3MetadataControl toAc3MetadataControl() {
    switch (this) {
      case 'FOLLOW_INPUT':
        return Ac3MetadataControl.followInput;
      case 'USE_CONFIGURED':
        return Ac3MetadataControl.useConfigured;
    }
    throw Exception('$this is not known in enum Ac3MetadataControl');
  }
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value AC3.
class Ac3Settings {
  /// Specify the average bitrate in bits per second. Valid bitrates depend on the
  /// coding mode.
  final int? bitrate;

  /// Specify the bitstream mode for the AC-3 stream that the encoder emits. For
  /// more information about the AC3 bitstream mode, see ATSC A/52-2012 (Annex E).
  final Ac3BitstreamMode? bitstreamMode;

  /// Dolby Digital coding mode. Determines number of channels.
  final Ac3CodingMode? codingMode;

  /// Sets the dialnorm for the output. If blank and input audio is Dolby Digital,
  /// dialnorm will be passed through.
  final int? dialnorm;

  /// If set to FILM_STANDARD, adds dynamic range compression signaling to the
  /// output bitstream as defined in the Dolby Digital specification.
  final Ac3DynamicRangeCompressionProfile? dynamicRangeCompressionProfile;

  /// Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only
  /// valid with 3_2_LFE coding mode.
  final Ac3LfeFilter? lfeFilter;

  /// When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+,
  /// or DolbyE decoder that supplied this audio data. If audio was not supplied
  /// from one of these streams, then the static metadata settings will be used.
  final Ac3MetadataControl? metadataControl;

  /// This value is always 48000. It represents the sample rate in Hz.
  final int? sampleRate;

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
  factory Ac3Settings.fromJson(Map<String, dynamic> json) {
    return Ac3Settings(
      bitrate: json['bitrate'] as int?,
      bitstreamMode: (json['bitstreamMode'] as String?)?.toAc3BitstreamMode(),
      codingMode: (json['codingMode'] as String?)?.toAc3CodingMode(),
      dialnorm: json['dialnorm'] as int?,
      dynamicRangeCompressionProfile:
          (json['dynamicRangeCompressionProfile'] as String?)
              ?.toAc3DynamicRangeCompressionProfile(),
      lfeFilter: (json['lfeFilter'] as String?)?.toAc3LfeFilter(),
      metadataControl:
          (json['metadataControl'] as String?)?.toAc3MetadataControl(),
      sampleRate: json['sampleRate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bitrate = this.bitrate;
    final bitstreamMode = this.bitstreamMode;
    final codingMode = this.codingMode;
    final dialnorm = this.dialnorm;
    final dynamicRangeCompressionProfile = this.dynamicRangeCompressionProfile;
    final lfeFilter = this.lfeFilter;
    final metadataControl = this.metadataControl;
    final sampleRate = this.sampleRate;
    return {
      if (bitrate != null) 'bitrate': bitrate,
      if (bitstreamMode != null) 'bitstreamMode': bitstreamMode.toValue(),
      if (codingMode != null) 'codingMode': codingMode.toValue(),
      if (dialnorm != null) 'dialnorm': dialnorm,
      if (dynamicRangeCompressionProfile != null)
        'dynamicRangeCompressionProfile':
            dynamicRangeCompressionProfile.toValue(),
      if (lfeFilter != null) 'lfeFilter': lfeFilter.toValue(),
      if (metadataControl != null) 'metadataControl': metadataControl.toValue(),
      if (sampleRate != null) 'sampleRate': sampleRate,
    };
  }
}

/// Specify whether the service runs your job with accelerated transcoding.
/// Choose DISABLED if you don't want accelerated transcoding. Choose ENABLED if
/// you want your job to run with accelerated transcoding and to fail if your
/// input files or your job settings aren't compatible with accelerated
/// transcoding. Choose PREFERRED if you want your job to run with accelerated
/// transcoding if the job is compatible with the feature and to run at standard
/// speed if it's not.
enum AccelerationMode {
  disabled,
  enabled,
  preferred,
}

extension on AccelerationMode {
  String toValue() {
    switch (this) {
      case AccelerationMode.disabled:
        return 'DISABLED';
      case AccelerationMode.enabled:
        return 'ENABLED';
      case AccelerationMode.preferred:
        return 'PREFERRED';
    }
  }
}

extension on String {
  AccelerationMode toAccelerationMode() {
    switch (this) {
      case 'DISABLED':
        return AccelerationMode.disabled;
      case 'ENABLED':
        return AccelerationMode.enabled;
      case 'PREFERRED':
        return AccelerationMode.preferred;
    }
    throw Exception('$this is not known in enum AccelerationMode');
  }
}

/// Accelerated transcoding can significantly speed up jobs with long, visually
/// complex content.
class AccelerationSettings {
  /// Specify the conditions when the service will run your job with accelerated
  /// transcoding.
  final AccelerationMode mode;

  AccelerationSettings({
    required this.mode,
  });
  factory AccelerationSettings.fromJson(Map<String, dynamic> json) {
    return AccelerationSettings(
      mode: (json['mode'] as String).toAccelerationMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      'mode': mode.toValue(),
    };
  }
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
  notApplicable,
  inProgress,
  accelerated,
  notAccelerated,
}

extension on AccelerationStatus {
  String toValue() {
    switch (this) {
      case AccelerationStatus.notApplicable:
        return 'NOT_APPLICABLE';
      case AccelerationStatus.inProgress:
        return 'IN_PROGRESS';
      case AccelerationStatus.accelerated:
        return 'ACCELERATED';
      case AccelerationStatus.notAccelerated:
        return 'NOT_ACCELERATED';
    }
  }
}

extension on String {
  AccelerationStatus toAccelerationStatus() {
    switch (this) {
      case 'NOT_APPLICABLE':
        return AccelerationStatus.notApplicable;
      case 'IN_PROGRESS':
        return AccelerationStatus.inProgress;
      case 'ACCELERATED':
        return AccelerationStatus.accelerated;
      case 'NOT_ACCELERATED':
        return AccelerationStatus.notAccelerated;
    }
    throw Exception('$this is not known in enum AccelerationStatus');
  }
}

/// This setting only applies to H.264, H.265, and MPEG2 outputs. Use Insert AFD
/// signaling (AfdSignaling) to specify whether the service includes AFD values
/// in the output video data and what those values are. * Choose None to remove
/// all AFD values from this output. * Choose Fixed to ignore input AFD values
/// and instead encode the value specified in the job. * Choose Auto to
/// calculate output AFD values based on the input AFD scaler data.
enum AfdSignaling {
  none,
  auto,
  fixed,
}

extension on AfdSignaling {
  String toValue() {
    switch (this) {
      case AfdSignaling.none:
        return 'NONE';
      case AfdSignaling.auto:
        return 'AUTO';
      case AfdSignaling.fixed:
        return 'FIXED';
    }
  }
}

extension on String {
  AfdSignaling toAfdSignaling() {
    switch (this) {
      case 'NONE':
        return AfdSignaling.none;
      case 'AUTO':
        return AfdSignaling.auto;
      case 'FIXED':
        return AfdSignaling.fixed;
    }
    throw Exception('$this is not known in enum AfdSignaling');
  }
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value AIFF.
class AiffSettings {
  /// Specify Bit depth (BitDepth), in bits per sample, to choose the encoding
  /// quality for this audio track.
  final int? bitDepth;

  /// Specify the number of channels in this output audio track. Valid values are
  /// 1 and even numbers up to 64. For example, 1, 2, 4, 6, and so on, up to 64.
  final int? channels;

  /// Sample rate in hz.
  final int? sampleRate;

  AiffSettings({
    this.bitDepth,
    this.channels,
    this.sampleRate,
  });
  factory AiffSettings.fromJson(Map<String, dynamic> json) {
    return AiffSettings(
      bitDepth: json['bitDepth'] as int?,
      channels: json['channels'] as int?,
      sampleRate: json['sampleRate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bitDepth = this.bitDepth;
    final channels = this.channels;
    final sampleRate = this.sampleRate;
    return {
      if (bitDepth != null) 'bitDepth': bitDepth,
      if (channels != null) 'channels': channels,
      if (sampleRate != null) 'sampleRate': sampleRate,
    };
  }
}

/// Ignore this setting unless this input is a QuickTime animation with an alpha
/// channel. Use this setting to create separate Key and Fill outputs. In each
/// output, specify which part of the input MediaConvert uses. Leave this
/// setting at the default value DISCARD to delete the alpha channel and
/// preserve the video. Set it to REMAP_TO_LUMA to delete the video and map the
/// alpha channel to the luma channel of your outputs.
enum AlphaBehavior {
  discard,
  remapToLuma,
}

extension on AlphaBehavior {
  String toValue() {
    switch (this) {
      case AlphaBehavior.discard:
        return 'DISCARD';
      case AlphaBehavior.remapToLuma:
        return 'REMAP_TO_LUMA';
    }
  }
}

extension on String {
  AlphaBehavior toAlphaBehavior() {
    switch (this) {
      case 'DISCARD':
        return AlphaBehavior.discard;
      case 'REMAP_TO_LUMA':
        return AlphaBehavior.remapToLuma;
    }
    throw Exception('$this is not known in enum AlphaBehavior');
  }
}

/// Specify whether this set of input captions appears in your outputs in both
/// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
/// includes the captions data in two ways: it passes the 608 data through using
/// the 608 compatibility bytes fields of the 708 wrapper, and it also
/// translates the 608 data into 708.
enum AncillaryConvert608To708 {
  upconvert,
  disabled,
}

extension on AncillaryConvert608To708 {
  String toValue() {
    switch (this) {
      case AncillaryConvert608To708.upconvert:
        return 'UPCONVERT';
      case AncillaryConvert608To708.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  AncillaryConvert608To708 toAncillaryConvert608To708() {
    switch (this) {
      case 'UPCONVERT':
        return AncillaryConvert608To708.upconvert;
      case 'DISABLED':
        return AncillaryConvert608To708.disabled;
    }
    throw Exception('$this is not known in enum AncillaryConvert608To708');
  }
}

/// Settings for ancillary captions source.
class AncillarySourceSettings {
  /// Specify whether this set of input captions appears in your outputs in both
  /// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
  /// includes the captions data in two ways: it passes the 608 data through using
  /// the 608 compatibility bytes fields of the 708 wrapper, and it also
  /// translates the 608 data into 708.
  final AncillaryConvert608To708? convert608To708;

  /// Specifies the 608 channel number in the ancillary data track from which to
  /// extract captions. Unused for passthrough.
  final int? sourceAncillaryChannelNumber;

  /// By default, the service terminates any unterminated captions at the end of
  /// each input. If you want the caption to continue onto your next input,
  /// disable this setting.
  final AncillaryTerminateCaptions? terminateCaptions;

  AncillarySourceSettings({
    this.convert608To708,
    this.sourceAncillaryChannelNumber,
    this.terminateCaptions,
  });
  factory AncillarySourceSettings.fromJson(Map<String, dynamic> json) {
    return AncillarySourceSettings(
      convert608To708:
          (json['convert608To708'] as String?)?.toAncillaryConvert608To708(),
      sourceAncillaryChannelNumber:
          json['sourceAncillaryChannelNumber'] as int?,
      terminateCaptions: (json['terminateCaptions'] as String?)
          ?.toAncillaryTerminateCaptions(),
    );
  }

  Map<String, dynamic> toJson() {
    final convert608To708 = this.convert608To708;
    final sourceAncillaryChannelNumber = this.sourceAncillaryChannelNumber;
    final terminateCaptions = this.terminateCaptions;
    return {
      if (convert608To708 != null) 'convert608To708': convert608To708.toValue(),
      if (sourceAncillaryChannelNumber != null)
        'sourceAncillaryChannelNumber': sourceAncillaryChannelNumber,
      if (terminateCaptions != null)
        'terminateCaptions': terminateCaptions.toValue(),
    };
  }
}

/// By default, the service terminates any unterminated captions at the end of
/// each input. If you want the caption to continue onto your next input,
/// disable this setting.
enum AncillaryTerminateCaptions {
  endOfInput,
  disabled,
}

extension on AncillaryTerminateCaptions {
  String toValue() {
    switch (this) {
      case AncillaryTerminateCaptions.endOfInput:
        return 'END_OF_INPUT';
      case AncillaryTerminateCaptions.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  AncillaryTerminateCaptions toAncillaryTerminateCaptions() {
    switch (this) {
      case 'END_OF_INPUT':
        return AncillaryTerminateCaptions.endOfInput;
      case 'DISABLED':
        return AncillaryTerminateCaptions.disabled;
    }
    throw Exception('$this is not known in enum AncillaryTerminateCaptions');
  }
}

/// The anti-alias filter is automatically applied to all outputs. The service
/// no longer accepts the value DISABLED for AntiAlias. If you specify that in
/// your job, the service will ignore the setting.
enum AntiAlias {
  disabled,
  enabled,
}

extension on AntiAlias {
  String toValue() {
    switch (this) {
      case AntiAlias.disabled:
        return 'DISABLED';
      case AntiAlias.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  AntiAlias toAntiAlias() {
    switch (this) {
      case 'DISABLED':
        return AntiAlias.disabled;
      case 'ENABLED':
        return AntiAlias.enabled;
    }
    throw Exception('$this is not known in enum AntiAlias');
  }
}

class AssociateCertificateResponse {
  AssociateCertificateResponse();
  factory AssociateCertificateResponse.fromJson(Map<String, dynamic> _) {
    return AssociateCertificateResponse();
  }
}

/// You can add a tag for this mono-channel audio track to mimic its placement
/// in a multi-channel layout.  For example, if this track is the left surround
/// channel, choose Left surround (LS).
enum AudioChannelTag {
  l,
  r,
  c,
  lfe,
  ls,
  rs,
  lc,
  rc,
  cs,
  lsd,
  rsd,
  tcs,
  vhl,
  vhc,
  vhr,
}

extension on AudioChannelTag {
  String toValue() {
    switch (this) {
      case AudioChannelTag.l:
        return 'L';
      case AudioChannelTag.r:
        return 'R';
      case AudioChannelTag.c:
        return 'C';
      case AudioChannelTag.lfe:
        return 'LFE';
      case AudioChannelTag.ls:
        return 'LS';
      case AudioChannelTag.rs:
        return 'RS';
      case AudioChannelTag.lc:
        return 'LC';
      case AudioChannelTag.rc:
        return 'RC';
      case AudioChannelTag.cs:
        return 'CS';
      case AudioChannelTag.lsd:
        return 'LSD';
      case AudioChannelTag.rsd:
        return 'RSD';
      case AudioChannelTag.tcs:
        return 'TCS';
      case AudioChannelTag.vhl:
        return 'VHL';
      case AudioChannelTag.vhc:
        return 'VHC';
      case AudioChannelTag.vhr:
        return 'VHR';
    }
  }
}

extension on String {
  AudioChannelTag toAudioChannelTag() {
    switch (this) {
      case 'L':
        return AudioChannelTag.l;
      case 'R':
        return AudioChannelTag.r;
      case 'C':
        return AudioChannelTag.c;
      case 'LFE':
        return AudioChannelTag.lfe;
      case 'LS':
        return AudioChannelTag.ls;
      case 'RS':
        return AudioChannelTag.rs;
      case 'LC':
        return AudioChannelTag.lc;
      case 'RC':
        return AudioChannelTag.rc;
      case 'CS':
        return AudioChannelTag.cs;
      case 'LSD':
        return AudioChannelTag.lsd;
      case 'RSD':
        return AudioChannelTag.rsd;
      case 'TCS':
        return AudioChannelTag.tcs;
      case 'VHL':
        return AudioChannelTag.vhl;
      case 'VHC':
        return AudioChannelTag.vhc;
      case 'VHR':
        return AudioChannelTag.vhr;
    }
    throw Exception('$this is not known in enum AudioChannelTag');
  }
}

/// When you mimic a multi-channel audio layout with multiple mono-channel
/// tracks, you can tag each channel layout manually. For example, you would tag
/// the tracks that contain your left, right, and center audio with Left (L),
/// Right (R), and Center (C), respectively. When you don't specify a value,
/// MediaConvert labels your track as Center (C) by default. To use audio layout
/// tagging, your output must be in a QuickTime (.mov) container; your audio
/// codec must be AAC, WAV, or AIFF; and you must set up your audio track to
/// have only one channel.
class AudioChannelTaggingSettings {
  /// You can add a tag for this mono-channel audio track to mimic its placement
  /// in a multi-channel layout.  For example, if this track is the left surround
  /// channel, choose Left surround (LS).
  final AudioChannelTag? channelTag;

  AudioChannelTaggingSettings({
    this.channelTag,
  });
  factory AudioChannelTaggingSettings.fromJson(Map<String, dynamic> json) {
    return AudioChannelTaggingSettings(
      channelTag: (json['channelTag'] as String?)?.toAudioChannelTag(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelTag = this.channelTag;
    return {
      if (channelTag != null) 'channelTag': channelTag.toValue(),
    };
  }
}

/// Type of Audio codec.
enum AudioCodec {
  aac,
  mp2,
  mp3,
  wav,
  aiff,
  ac3,
  eac3,
  eac3Atmos,
  vorbis,
  opus,
  passthrough,
}

extension on AudioCodec {
  String toValue() {
    switch (this) {
      case AudioCodec.aac:
        return 'AAC';
      case AudioCodec.mp2:
        return 'MP2';
      case AudioCodec.mp3:
        return 'MP3';
      case AudioCodec.wav:
        return 'WAV';
      case AudioCodec.aiff:
        return 'AIFF';
      case AudioCodec.ac3:
        return 'AC3';
      case AudioCodec.eac3:
        return 'EAC3';
      case AudioCodec.eac3Atmos:
        return 'EAC3_ATMOS';
      case AudioCodec.vorbis:
        return 'VORBIS';
      case AudioCodec.opus:
        return 'OPUS';
      case AudioCodec.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  AudioCodec toAudioCodec() {
    switch (this) {
      case 'AAC':
        return AudioCodec.aac;
      case 'MP2':
        return AudioCodec.mp2;
      case 'MP3':
        return AudioCodec.mp3;
      case 'WAV':
        return AudioCodec.wav;
      case 'AIFF':
        return AudioCodec.aiff;
      case 'AC3':
        return AudioCodec.ac3;
      case 'EAC3':
        return AudioCodec.eac3;
      case 'EAC3_ATMOS':
        return AudioCodec.eac3Atmos;
      case 'VORBIS':
        return AudioCodec.vorbis;
      case 'OPUS':
        return AudioCodec.opus;
      case 'PASSTHROUGH':
        return AudioCodec.passthrough;
    }
    throw Exception('$this is not known in enum AudioCodec');
  }
}

/// Audio codec settings (CodecSettings) under (AudioDescriptions) contains the
/// group of settings related to audio encoding. The settings in this group vary
/// depending on the value that you choose for Audio codec (Codec). For each
/// codec enum that you choose, define the corresponding settings object. The
/// following lists the codec enum, settings object pairs. * AAC, AacSettings *
/// MP2, Mp2Settings * MP3, Mp3Settings * WAV, WavSettings * AIFF, AiffSettings
/// * AC3, Ac3Settings * EAC3, Eac3Settings * EAC3_ATMOS, Eac3AtmosSettings *
/// VORBIS, VorbisSettings * OPUS, OpusSettings
class AudioCodecSettings {
  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value AAC. The service accepts one of two mutually exclusive groups of
  /// AAC settings--VBR and CBR. To select one of these modes, set the value of
  /// Bitrate control mode (rateControlMode) to "VBR" or "CBR".  In VBR mode, you
  /// control the audio quality with the setting VBR quality (vbrQuality). In CBR
  /// mode, you use the setting Bitrate (bitrate). Defaults and valid values
  /// depend on the rate control mode.
  final AacSettings? aacSettings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value AC3.
  final Ac3Settings? ac3Settings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value AIFF.
  final AiffSettings? aiffSettings;

  /// Type of Audio codec.
  final AudioCodec? codec;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value EAC3_ATMOS.
  final Eac3AtmosSettings? eac3AtmosSettings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value EAC3.
  final Eac3Settings? eac3Settings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value MP2.
  final Mp2Settings? mp2Settings;

  /// Required when you set Codec, under AudioDescriptions>CodecSettings, to the
  /// value MP3.
  final Mp3Settings? mp3Settings;

  /// Required when you set Codec, under AudioDescriptions>CodecSettings, to the
  /// value OPUS.
  final OpusSettings? opusSettings;

  /// Required when you set Codec, under AudioDescriptions>CodecSettings, to the
  /// value Vorbis.
  final VorbisSettings? vorbisSettings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value WAV.
  final WavSettings? wavSettings;

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
  factory AudioCodecSettings.fromJson(Map<String, dynamic> json) {
    return AudioCodecSettings(
      aacSettings: json['aacSettings'] != null
          ? AacSettings.fromJson(json['aacSettings'] as Map<String, dynamic>)
          : null,
      ac3Settings: json['ac3Settings'] != null
          ? Ac3Settings.fromJson(json['ac3Settings'] as Map<String, dynamic>)
          : null,
      aiffSettings: json['aiffSettings'] != null
          ? AiffSettings.fromJson(json['aiffSettings'] as Map<String, dynamic>)
          : null,
      codec: (json['codec'] as String?)?.toAudioCodec(),
      eac3AtmosSettings: json['eac3AtmosSettings'] != null
          ? Eac3AtmosSettings.fromJson(
              json['eac3AtmosSettings'] as Map<String, dynamic>)
          : null,
      eac3Settings: json['eac3Settings'] != null
          ? Eac3Settings.fromJson(json['eac3Settings'] as Map<String, dynamic>)
          : null,
      mp2Settings: json['mp2Settings'] != null
          ? Mp2Settings.fromJson(json['mp2Settings'] as Map<String, dynamic>)
          : null,
      mp3Settings: json['mp3Settings'] != null
          ? Mp3Settings.fromJson(json['mp3Settings'] as Map<String, dynamic>)
          : null,
      opusSettings: json['opusSettings'] != null
          ? OpusSettings.fromJson(json['opusSettings'] as Map<String, dynamic>)
          : null,
      vorbisSettings: json['vorbisSettings'] != null
          ? VorbisSettings.fromJson(
              json['vorbisSettings'] as Map<String, dynamic>)
          : null,
      wavSettings: json['wavSettings'] != null
          ? WavSettings.fromJson(json['wavSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aacSettings = this.aacSettings;
    final ac3Settings = this.ac3Settings;
    final aiffSettings = this.aiffSettings;
    final codec = this.codec;
    final eac3AtmosSettings = this.eac3AtmosSettings;
    final eac3Settings = this.eac3Settings;
    final mp2Settings = this.mp2Settings;
    final mp3Settings = this.mp3Settings;
    final opusSettings = this.opusSettings;
    final vorbisSettings = this.vorbisSettings;
    final wavSettings = this.wavSettings;
    return {
      if (aacSettings != null) 'aacSettings': aacSettings,
      if (ac3Settings != null) 'ac3Settings': ac3Settings,
      if (aiffSettings != null) 'aiffSettings': aiffSettings,
      if (codec != null) 'codec': codec.toValue(),
      if (eac3AtmosSettings != null) 'eac3AtmosSettings': eac3AtmosSettings,
      if (eac3Settings != null) 'eac3Settings': eac3Settings,
      if (mp2Settings != null) 'mp2Settings': mp2Settings,
      if (mp3Settings != null) 'mp3Settings': mp3Settings,
      if (opusSettings != null) 'opusSettings': opusSettings,
      if (vorbisSettings != null) 'vorbisSettings': vorbisSettings,
      if (wavSettings != null) 'wavSettings': wavSettings,
    };
  }
}

/// Enable this setting on one audio selector to set it as the default for the
/// job. The service uses this default for outputs where it can't find the
/// specified input audio. If you don't set a default, those outputs have no
/// audio.
enum AudioDefaultSelection {
  $default,
  notDefault,
}

extension on AudioDefaultSelection {
  String toValue() {
    switch (this) {
      case AudioDefaultSelection.$default:
        return 'DEFAULT';
      case AudioDefaultSelection.notDefault:
        return 'NOT_DEFAULT';
    }
  }
}

extension on String {
  AudioDefaultSelection toAudioDefaultSelection() {
    switch (this) {
      case 'DEFAULT':
        return AudioDefaultSelection.$default;
      case 'NOT_DEFAULT':
        return AudioDefaultSelection.notDefault;
    }
    throw Exception('$this is not known in enum AudioDefaultSelection');
  }
}

/// Description of audio output
class AudioDescription {
  /// When you mimic a multi-channel audio layout with multiple mono-channel
  /// tracks, you can tag each channel layout manually. For example, you would tag
  /// the tracks that contain your left, right, and center audio with Left (L),
  /// Right (R), and Center (C), respectively. When you don't specify a value,
  /// MediaConvert labels your track as Center (C) by default. To use audio layout
  /// tagging, your output must be in a QuickTime (.mov) container; your audio
  /// codec must be AAC, WAV, or AIFF; and you must set up your audio track to
  /// have only one channel.
  final AudioChannelTaggingSettings? audioChannelTaggingSettings;

  /// Advanced audio normalization settings. Ignore these settings unless you need
  /// to comply with a loudness standard.
  final AudioNormalizationSettings? audioNormalizationSettings;

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
  final String? audioSourceName;

  /// Applies only if Follow Input Audio Type is unchecked (false). A number
  /// between 0 and 255. The following are defined in ISO-IEC 13818-1: 0 =
  /// Undefined, 1 = Clean Effects, 2 = Hearing Impaired, 3 = Visually Impaired
  /// Commentary, 4-255 = Reserved.
  final int? audioType;

  /// When set to FOLLOW_INPUT, if the input contains an ISO 639 audio_type, then
  /// that value is passed through to the output. If the input contains no ISO 639
  /// audio_type, the value in Audio Type is included in the output. Otherwise the
  /// value in Audio Type is included in the output. Note that this field and
  /// audioType are both ignored if audioDescriptionBroadcasterMix is set to
  /// BROADCASTER_MIXED_AD.
  final AudioTypeControl? audioTypeControl;

  /// Audio codec settings (CodecSettings) under (AudioDescriptions) contains the
  /// group of settings related to audio encoding. The settings in this group vary
  /// depending on the value that you choose for Audio codec (Codec). For each
  /// codec enum that you choose, define the corresponding settings object. The
  /// following lists the codec enum, settings object pairs. * AAC, AacSettings *
  /// MP2, Mp2Settings * MP3, Mp3Settings * WAV, WavSettings * AIFF, AiffSettings
  /// * AC3, Ac3Settings * EAC3, Eac3Settings * EAC3_ATMOS, Eac3AtmosSettings *
  /// VORBIS, VorbisSettings * OPUS, OpusSettings
  final AudioCodecSettings? codecSettings;

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
  final String? customLanguageCode;

  /// Indicates the language of the audio output track. The ISO 639 language
  /// specified in the 'Language Code' drop down will be used when 'Follow Input
  /// Language Code' is not selected or when 'Follow Input Language Code' is
  /// selected but there is no ISO 639 language code specified by the input.
  final LanguageCode? languageCode;

  /// Specify which source for language code takes precedence for this audio
  /// track. When you choose Follow input (FOLLOW_INPUT), the service uses the
  /// language code from the input track if it's present. If there's no languge
  /// code on the input track, the service uses the code that you specify in the
  /// setting Language code (languageCode or customLanguageCode). When you choose
  /// Use configured (USE_CONFIGURED), the service uses the language code that you
  /// specify.
  final AudioLanguageCodeControl? languageCodeControl;

  /// Advanced audio remixing settings.
  final RemixSettings? remixSettings;

  /// Specify a label for this output audio stream. For example, "English",
  /// "Director commentary", or "track_2". For streaming outputs, MediaConvert
  /// passes this information into destination manifests for display on the
  /// end-viewer's player device. For outputs in other output groups, the service
  /// ignores this setting.
  final String? streamName;

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
  factory AudioDescription.fromJson(Map<String, dynamic> json) {
    return AudioDescription(
      audioChannelTaggingSettings: json['audioChannelTaggingSettings'] != null
          ? AudioChannelTaggingSettings.fromJson(
              json['audioChannelTaggingSettings'] as Map<String, dynamic>)
          : null,
      audioNormalizationSettings: json['audioNormalizationSettings'] != null
          ? AudioNormalizationSettings.fromJson(
              json['audioNormalizationSettings'] as Map<String, dynamic>)
          : null,
      audioSourceName: json['audioSourceName'] as String?,
      audioType: json['audioType'] as int?,
      audioTypeControl:
          (json['audioTypeControl'] as String?)?.toAudioTypeControl(),
      codecSettings: json['codecSettings'] != null
          ? AudioCodecSettings.fromJson(
              json['codecSettings'] as Map<String, dynamic>)
          : null,
      customLanguageCode: json['customLanguageCode'] as String?,
      languageCode: (json['languageCode'] as String?)?.toLanguageCode(),
      languageCodeControl: (json['languageCodeControl'] as String?)
          ?.toAudioLanguageCodeControl(),
      remixSettings: json['remixSettings'] != null
          ? RemixSettings.fromJson(
              json['remixSettings'] as Map<String, dynamic>)
          : null,
      streamName: json['streamName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioChannelTaggingSettings = this.audioChannelTaggingSettings;
    final audioNormalizationSettings = this.audioNormalizationSettings;
    final audioSourceName = this.audioSourceName;
    final audioType = this.audioType;
    final audioTypeControl = this.audioTypeControl;
    final codecSettings = this.codecSettings;
    final customLanguageCode = this.customLanguageCode;
    final languageCode = this.languageCode;
    final languageCodeControl = this.languageCodeControl;
    final remixSettings = this.remixSettings;
    final streamName = this.streamName;
    return {
      if (audioChannelTaggingSettings != null)
        'audioChannelTaggingSettings': audioChannelTaggingSettings,
      if (audioNormalizationSettings != null)
        'audioNormalizationSettings': audioNormalizationSettings,
      if (audioSourceName != null) 'audioSourceName': audioSourceName,
      if (audioType != null) 'audioType': audioType,
      if (audioTypeControl != null)
        'audioTypeControl': audioTypeControl.toValue(),
      if (codecSettings != null) 'codecSettings': codecSettings,
      if (customLanguageCode != null) 'customLanguageCode': customLanguageCode,
      if (languageCode != null) 'languageCode': languageCode.toValue(),
      if (languageCodeControl != null)
        'languageCodeControl': languageCodeControl.toValue(),
      if (remixSettings != null) 'remixSettings': remixSettings,
      if (streamName != null) 'streamName': streamName,
    };
  }
}

/// Specify which source for language code takes precedence for this audio
/// track. When you choose Follow input (FOLLOW_INPUT), the service uses the
/// language code from the input track if it's present. If there's no languge
/// code on the input track, the service uses the code that you specify in the
/// setting Language code (languageCode or customLanguageCode). When you choose
/// Use configured (USE_CONFIGURED), the service uses the language code that you
/// specify.
enum AudioLanguageCodeControl {
  followInput,
  useConfigured,
}

extension on AudioLanguageCodeControl {
  String toValue() {
    switch (this) {
      case AudioLanguageCodeControl.followInput:
        return 'FOLLOW_INPUT';
      case AudioLanguageCodeControl.useConfigured:
        return 'USE_CONFIGURED';
    }
  }
}

extension on String {
  AudioLanguageCodeControl toAudioLanguageCodeControl() {
    switch (this) {
      case 'FOLLOW_INPUT':
        return AudioLanguageCodeControl.followInput;
      case 'USE_CONFIGURED':
        return AudioLanguageCodeControl.useConfigured;
    }
    throw Exception('$this is not known in enum AudioLanguageCodeControl');
  }
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
  ituBs_1770_1,
  ituBs_1770_2,
  ituBs_1770_3,
  ituBs_1770_4,
}

extension on AudioNormalizationAlgorithm {
  String toValue() {
    switch (this) {
      case AudioNormalizationAlgorithm.ituBs_1770_1:
        return 'ITU_BS_1770_1';
      case AudioNormalizationAlgorithm.ituBs_1770_2:
        return 'ITU_BS_1770_2';
      case AudioNormalizationAlgorithm.ituBs_1770_3:
        return 'ITU_BS_1770_3';
      case AudioNormalizationAlgorithm.ituBs_1770_4:
        return 'ITU_BS_1770_4';
    }
  }
}

extension on String {
  AudioNormalizationAlgorithm toAudioNormalizationAlgorithm() {
    switch (this) {
      case 'ITU_BS_1770_1':
        return AudioNormalizationAlgorithm.ituBs_1770_1;
      case 'ITU_BS_1770_2':
        return AudioNormalizationAlgorithm.ituBs_1770_2;
      case 'ITU_BS_1770_3':
        return AudioNormalizationAlgorithm.ituBs_1770_3;
      case 'ITU_BS_1770_4':
        return AudioNormalizationAlgorithm.ituBs_1770_4;
    }
    throw Exception('$this is not known in enum AudioNormalizationAlgorithm');
  }
}

/// When enabled the output audio is corrected using the chosen algorithm. If
/// disabled, the audio will be measured but not adjusted.
enum AudioNormalizationAlgorithmControl {
  correctAudio,
  measureOnly,
}

extension on AudioNormalizationAlgorithmControl {
  String toValue() {
    switch (this) {
      case AudioNormalizationAlgorithmControl.correctAudio:
        return 'CORRECT_AUDIO';
      case AudioNormalizationAlgorithmControl.measureOnly:
        return 'MEASURE_ONLY';
    }
  }
}

extension on String {
  AudioNormalizationAlgorithmControl toAudioNormalizationAlgorithmControl() {
    switch (this) {
      case 'CORRECT_AUDIO':
        return AudioNormalizationAlgorithmControl.correctAudio;
      case 'MEASURE_ONLY':
        return AudioNormalizationAlgorithmControl.measureOnly;
    }
    throw Exception(
        '$this is not known in enum AudioNormalizationAlgorithmControl');
  }
}

/// If set to LOG, log each output's audio track loudness to a CSV file.
enum AudioNormalizationLoudnessLogging {
  log,
  dontLog,
}

extension on AudioNormalizationLoudnessLogging {
  String toValue() {
    switch (this) {
      case AudioNormalizationLoudnessLogging.log:
        return 'LOG';
      case AudioNormalizationLoudnessLogging.dontLog:
        return 'DONT_LOG';
    }
  }
}

extension on String {
  AudioNormalizationLoudnessLogging toAudioNormalizationLoudnessLogging() {
    switch (this) {
      case 'LOG':
        return AudioNormalizationLoudnessLogging.log;
      case 'DONT_LOG':
        return AudioNormalizationLoudnessLogging.dontLog;
    }
    throw Exception(
        '$this is not known in enum AudioNormalizationLoudnessLogging');
  }
}

/// If set to TRUE_PEAK, calculate and log the TruePeak for each output's audio
/// track loudness.
enum AudioNormalizationPeakCalculation {
  truePeak,
  none,
}

extension on AudioNormalizationPeakCalculation {
  String toValue() {
    switch (this) {
      case AudioNormalizationPeakCalculation.truePeak:
        return 'TRUE_PEAK';
      case AudioNormalizationPeakCalculation.none:
        return 'NONE';
    }
  }
}

extension on String {
  AudioNormalizationPeakCalculation toAudioNormalizationPeakCalculation() {
    switch (this) {
      case 'TRUE_PEAK':
        return AudioNormalizationPeakCalculation.truePeak;
      case 'NONE':
        return AudioNormalizationPeakCalculation.none;
    }
    throw Exception(
        '$this is not known in enum AudioNormalizationPeakCalculation');
  }
}

/// Advanced audio normalization settings. Ignore these settings unless you need
/// to comply with a loudness standard.
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
  final AudioNormalizationAlgorithm? algorithm;

  /// When enabled the output audio is corrected using the chosen algorithm. If
  /// disabled, the audio will be measured but not adjusted.
  final AudioNormalizationAlgorithmControl? algorithmControl;

  /// Content measuring above this level will be corrected to the target level.
  /// Content measuring below this level will not be corrected.
  final int? correctionGateLevel;

  /// If set to LOG, log each output's audio track loudness to a CSV file.
  final AudioNormalizationLoudnessLogging? loudnessLogging;

  /// If set to TRUE_PEAK, calculate and log the TruePeak for each output's audio
  /// track loudness.
  final AudioNormalizationPeakCalculation? peakCalculation;

  /// When you use Audio normalization (AudioNormalizationSettings), optionally
  /// use this setting to specify a target loudness. If you don't specify a value
  /// here, the encoder chooses a value for you, based on the algorithm that you
  /// choose for Algorithm (algorithm). If you choose algorithm 1770-1, the
  /// encoder will choose -24 LKFS; otherwise, the encoder will choose -23 LKFS.
  final double? targetLkfs;

  AudioNormalizationSettings({
    this.algorithm,
    this.algorithmControl,
    this.correctionGateLevel,
    this.loudnessLogging,
    this.peakCalculation,
    this.targetLkfs,
  });
  factory AudioNormalizationSettings.fromJson(Map<String, dynamic> json) {
    return AudioNormalizationSettings(
      algorithm:
          (json['algorithm'] as String?)?.toAudioNormalizationAlgorithm(),
      algorithmControl: (json['algorithmControl'] as String?)
          ?.toAudioNormalizationAlgorithmControl(),
      correctionGateLevel: json['correctionGateLevel'] as int?,
      loudnessLogging: (json['loudnessLogging'] as String?)
          ?.toAudioNormalizationLoudnessLogging(),
      peakCalculation: (json['peakCalculation'] as String?)
          ?.toAudioNormalizationPeakCalculation(),
      targetLkfs: json['targetLkfs'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    final algorithmControl = this.algorithmControl;
    final correctionGateLevel = this.correctionGateLevel;
    final loudnessLogging = this.loudnessLogging;
    final peakCalculation = this.peakCalculation;
    final targetLkfs = this.targetLkfs;
    return {
      if (algorithm != null) 'algorithm': algorithm.toValue(),
      if (algorithmControl != null)
        'algorithmControl': algorithmControl.toValue(),
      if (correctionGateLevel != null)
        'correctionGateLevel': correctionGateLevel,
      if (loudnessLogging != null) 'loudnessLogging': loudnessLogging.toValue(),
      if (peakCalculation != null) 'peakCalculation': peakCalculation.toValue(),
      if (targetLkfs != null) 'targetLkfs': targetLkfs,
    };
  }
}

/// Selector for Audio
class AudioSelector {
  /// Selects a specific language code from within an audio source, using the ISO
  /// 639-2 or ISO 639-3 three-letter language code
  final String? customLanguageCode;

  /// Enable this setting on one audio selector to set it as the default for the
  /// job. The service uses this default for outputs where it can't find the
  /// specified input audio. If you don't set a default, those outputs have no
  /// audio.
  final AudioDefaultSelection? defaultSelection;

  /// Specifies audio data from an external file source.
  final String? externalAudioFileInput;

  /// Selects a specific language code from within an audio source.
  final LanguageCode? languageCode;

  /// Specifies a time delta in milliseconds to offset the audio from the input
  /// video.
  final int? offset;

  /// Selects a specific PID from within an audio source (e.g. 257 selects PID
  /// 0x101).
  final List<int>? pids;

  /// Use this setting for input streams that contain Dolby E, to have the service
  /// extract specific program data from the track. To select multiple programs,
  /// create multiple selectors with the same Track and different Program numbers.
  /// In the console, this setting is visible when you set Selector type to Track.
  /// Choose the program number from the dropdown list. If you are sending a JSON
  /// file, provide the program ID, which is part of the audio metadata. If your
  /// input file has incorrect metadata, you can choose All channels instead of a
  /// program number to have the service ignore the program IDs and include all
  /// the programs in the track.
  final int? programSelection;

  /// Use these settings to reorder the audio channels of one input to match those
  /// of another input. This allows you to combine the two files into a single
  /// output, one after the other.
  final RemixSettings? remixSettings;

  /// Specifies the type of the audio selector.
  final AudioSelectorType? selectorType;

  /// Identify a track from the input audio to include in this selector by
  /// entering the track index number. To include several tracks in a single audio
  /// selector, specify multiple tracks as follows. Using the console, enter a
  /// comma-separated list. For examle, type "1,2,3" to include tracks 1 through
  /// 3. Specifying directly in your JSON job file, provide the track numbers in
  /// an array. For example, "tracks": [1,2,3].
  final List<int>? tracks;

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
  factory AudioSelector.fromJson(Map<String, dynamic> json) {
    return AudioSelector(
      customLanguageCode: json['customLanguageCode'] as String?,
      defaultSelection:
          (json['defaultSelection'] as String?)?.toAudioDefaultSelection(),
      externalAudioFileInput: json['externalAudioFileInput'] as String?,
      languageCode: (json['languageCode'] as String?)?.toLanguageCode(),
      offset: json['offset'] as int?,
      pids:
          (json['pids'] as List?)?.whereNotNull().map((e) => e as int).toList(),
      programSelection: json['programSelection'] as int?,
      remixSettings: json['remixSettings'] != null
          ? RemixSettings.fromJson(
              json['remixSettings'] as Map<String, dynamic>)
          : null,
      selectorType: (json['selectorType'] as String?)?.toAudioSelectorType(),
      tracks: (json['tracks'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customLanguageCode = this.customLanguageCode;
    final defaultSelection = this.defaultSelection;
    final externalAudioFileInput = this.externalAudioFileInput;
    final languageCode = this.languageCode;
    final offset = this.offset;
    final pids = this.pids;
    final programSelection = this.programSelection;
    final remixSettings = this.remixSettings;
    final selectorType = this.selectorType;
    final tracks = this.tracks;
    return {
      if (customLanguageCode != null) 'customLanguageCode': customLanguageCode,
      if (defaultSelection != null)
        'defaultSelection': defaultSelection.toValue(),
      if (externalAudioFileInput != null)
        'externalAudioFileInput': externalAudioFileInput,
      if (languageCode != null) 'languageCode': languageCode.toValue(),
      if (offset != null) 'offset': offset,
      if (pids != null) 'pids': pids,
      if (programSelection != null) 'programSelection': programSelection,
      if (remixSettings != null) 'remixSettings': remixSettings,
      if (selectorType != null) 'selectorType': selectorType.toValue(),
      if (tracks != null) 'tracks': tracks,
    };
  }
}

/// Group of Audio Selectors
class AudioSelectorGroup {
  /// Name of an Audio Selector within the same input to include in the group.
  /// Audio selector names are standardized, based on their order within the input
  /// (e.g., "Audio Selector 1"). The audio selector name parameter can be
  /// repeated to add any number of audio selectors to the group.
  final List<String>? audioSelectorNames;

  AudioSelectorGroup({
    this.audioSelectorNames,
  });
  factory AudioSelectorGroup.fromJson(Map<String, dynamic> json) {
    return AudioSelectorGroup(
      audioSelectorNames: (json['audioSelectorNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final audioSelectorNames = this.audioSelectorNames;
    return {
      if (audioSelectorNames != null) 'audioSelectorNames': audioSelectorNames,
    };
  }
}

/// Specifies the type of the audio selector.
enum AudioSelectorType {
  pid,
  track,
  languageCode,
}

extension on AudioSelectorType {
  String toValue() {
    switch (this) {
      case AudioSelectorType.pid:
        return 'PID';
      case AudioSelectorType.track:
        return 'TRACK';
      case AudioSelectorType.languageCode:
        return 'LANGUAGE_CODE';
    }
  }
}

extension on String {
  AudioSelectorType toAudioSelectorType() {
    switch (this) {
      case 'PID':
        return AudioSelectorType.pid;
      case 'TRACK':
        return AudioSelectorType.track;
      case 'LANGUAGE_CODE':
        return AudioSelectorType.languageCode;
    }
    throw Exception('$this is not known in enum AudioSelectorType');
  }
}

/// When set to FOLLOW_INPUT, if the input contains an ISO 639 audio_type, then
/// that value is passed through to the output. If the input contains no ISO 639
/// audio_type, the value in Audio Type is included in the output. Otherwise the
/// value in Audio Type is included in the output. Note that this field and
/// audioType are both ignored if audioDescriptionBroadcasterMix is set to
/// BROADCASTER_MIXED_AD.
enum AudioTypeControl {
  followInput,
  useConfigured,
}

extension on AudioTypeControl {
  String toValue() {
    switch (this) {
      case AudioTypeControl.followInput:
        return 'FOLLOW_INPUT';
      case AudioTypeControl.useConfigured:
        return 'USE_CONFIGURED';
    }
  }
}

extension on String {
  AudioTypeControl toAudioTypeControl() {
    switch (this) {
      case 'FOLLOW_INPUT':
        return AudioTypeControl.followInput;
      case 'USE_CONFIGURED':
        return AudioTypeControl.useConfigured;
    }
    throw Exception('$this is not known in enum AudioTypeControl');
  }
}

/// Use automated ABR to have MediaConvert set up the renditions in your ABR
/// package for you automatically, based on characteristics of your input video.
/// This feature optimizes video quality while minimizing the overall size of
/// your ABR package.
class AutomatedAbrSettings {
  /// Optional. The maximum target bit rate used in your automated ABR stack. Use
  /// this value to set an upper limit on the bandwidth consumed by the
  /// highest-quality rendition. This is the rendition that is delivered to
  /// viewers with the fastest internet connections. If you don't specify a value,
  /// MediaConvert uses 8,000,000 (8 mb/s) by default.
  final int? maxAbrBitrate;

  /// Optional. The maximum number of renditions that MediaConvert will create in
  /// your automated ABR stack. The number of renditions is determined
  /// automatically, based on analysis of each job, but will never exceed this
  /// limit. When you set this to Auto in the console, which is equivalent to
  /// excluding it from your JSON job specification, MediaConvert defaults to a
  /// limit of 15.
  final int? maxRenditions;

  /// Optional. The minimum target bitrate used in your automated ABR stack. Use
  /// this value to set a lower limit on the bitrate of video delivered to viewers
  /// with slow internet connections. If you don't specify a value, MediaConvert
  /// uses 600,000 (600 kb/s) by default.
  final int? minAbrBitrate;

  AutomatedAbrSettings({
    this.maxAbrBitrate,
    this.maxRenditions,
    this.minAbrBitrate,
  });
  factory AutomatedAbrSettings.fromJson(Map<String, dynamic> json) {
    return AutomatedAbrSettings(
      maxAbrBitrate: json['maxAbrBitrate'] as int?,
      maxRenditions: json['maxRenditions'] as int?,
      minAbrBitrate: json['minAbrBitrate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxAbrBitrate = this.maxAbrBitrate;
    final maxRenditions = this.maxRenditions;
    final minAbrBitrate = this.minAbrBitrate;
    return {
      if (maxAbrBitrate != null) 'maxAbrBitrate': maxAbrBitrate,
      if (maxRenditions != null) 'maxRenditions': maxRenditions,
      if (minAbrBitrate != null) 'minAbrBitrate': minAbrBitrate,
    };
  }
}

/// Use automated encoding to have MediaConvert choose your encoding settings
/// for you, based on characteristics of your input video.
class AutomatedEncodingSettings {
  /// Use automated ABR to have MediaConvert set up the renditions in your ABR
  /// package for you automatically, based on characteristics of your input video.
  /// This feature optimizes video quality while minimizing the overall size of
  /// your ABR package.
  final AutomatedAbrSettings? abrSettings;

  AutomatedEncodingSettings({
    this.abrSettings,
  });
  factory AutomatedEncodingSettings.fromJson(Map<String, dynamic> json) {
    return AutomatedEncodingSettings(
      abrSettings: json['abrSettings'] != null
          ? AutomatedAbrSettings.fromJson(
              json['abrSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final abrSettings = this.abrSettings;
    return {
      if (abrSettings != null) 'abrSettings': abrSettings,
    };
  }
}

/// Specify the strength of any adaptive quantization filters that you enable.
/// The value that you choose here applies to Spatial adaptive quantization
/// (spatialAdaptiveQuantization).
enum Av1AdaptiveQuantization {
  off,
  low,
  medium,
  high,
  higher,
  max,
}

extension on Av1AdaptiveQuantization {
  String toValue() {
    switch (this) {
      case Av1AdaptiveQuantization.off:
        return 'OFF';
      case Av1AdaptiveQuantization.low:
        return 'LOW';
      case Av1AdaptiveQuantization.medium:
        return 'MEDIUM';
      case Av1AdaptiveQuantization.high:
        return 'HIGH';
      case Av1AdaptiveQuantization.higher:
        return 'HIGHER';
      case Av1AdaptiveQuantization.max:
        return 'MAX';
    }
  }
}

extension on String {
  Av1AdaptiveQuantization toAv1AdaptiveQuantization() {
    switch (this) {
      case 'OFF':
        return Av1AdaptiveQuantization.off;
      case 'LOW':
        return Av1AdaptiveQuantization.low;
      case 'MEDIUM':
        return Av1AdaptiveQuantization.medium;
      case 'HIGH':
        return Av1AdaptiveQuantization.high;
      case 'HIGHER':
        return Av1AdaptiveQuantization.higher;
      case 'MAX':
        return Av1AdaptiveQuantization.max;
    }
    throw Exception('$this is not known in enum Av1AdaptiveQuantization');
  }
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
  initializeFromSource,
  specified,
}

extension on Av1FramerateControl {
  String toValue() {
    switch (this) {
      case Av1FramerateControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case Av1FramerateControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  Av1FramerateControl toAv1FramerateControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return Av1FramerateControl.initializeFromSource;
      case 'SPECIFIED':
        return Av1FramerateControl.specified;
    }
    throw Exception('$this is not known in enum Av1FramerateControl');
  }
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
  duplicateDrop,
  interpolate,
  frameformer,
}

extension on Av1FramerateConversionAlgorithm {
  String toValue() {
    switch (this) {
      case Av1FramerateConversionAlgorithm.duplicateDrop:
        return 'DUPLICATE_DROP';
      case Av1FramerateConversionAlgorithm.interpolate:
        return 'INTERPOLATE';
      case Av1FramerateConversionAlgorithm.frameformer:
        return 'FRAMEFORMER';
    }
  }
}

extension on String {
  Av1FramerateConversionAlgorithm toAv1FramerateConversionAlgorithm() {
    switch (this) {
      case 'DUPLICATE_DROP':
        return Av1FramerateConversionAlgorithm.duplicateDrop;
      case 'INTERPOLATE':
        return Av1FramerateConversionAlgorithm.interpolate;
      case 'FRAMEFORMER':
        return Av1FramerateConversionAlgorithm.frameformer;
    }
    throw Exception(
        '$this is not known in enum Av1FramerateConversionAlgorithm');
  }
}

/// Settings for quality-defined variable bitrate encoding with the AV1 codec.
/// Required when you set Rate control mode to QVBR. Not valid when you set Rate
/// control mode to a value other than QVBR, or when you don't define Rate
/// control mode.
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
  final int? qvbrQualityLevel;

  /// Optional. Specify a value here to set the QVBR quality to a level that is
  /// between whole numbers. For example, if you want your QVBR quality level to
  /// be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33.
  /// MediaConvert rounds your QVBR quality level to the nearest third of a whole
  /// number. For example, if you set qvbrQualityLevel to 7 and you set
  /// qvbrQualityLevelFineTune to .25, your actual QVBR quality level is 7.33.
  final double? qvbrQualityLevelFineTune;

  Av1QvbrSettings({
    this.qvbrQualityLevel,
    this.qvbrQualityLevelFineTune,
  });
  factory Av1QvbrSettings.fromJson(Map<String, dynamic> json) {
    return Av1QvbrSettings(
      qvbrQualityLevel: json['qvbrQualityLevel'] as int?,
      qvbrQualityLevelFineTune: json['qvbrQualityLevelFineTune'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final qvbrQualityLevel = this.qvbrQualityLevel;
    final qvbrQualityLevelFineTune = this.qvbrQualityLevelFineTune;
    return {
      if (qvbrQualityLevel != null) 'qvbrQualityLevel': qvbrQualityLevel,
      if (qvbrQualityLevelFineTune != null)
        'qvbrQualityLevelFineTune': qvbrQualityLevelFineTune,
    };
  }
}

/// 'With AV1 outputs, for rate control mode, MediaConvert supports only
/// quality-defined variable bitrate (QVBR). You can''t use CBR or VBR.'
enum Av1RateControlMode {
  qvbr,
}

extension on Av1RateControlMode {
  String toValue() {
    switch (this) {
      case Av1RateControlMode.qvbr:
        return 'QVBR';
    }
  }
}

extension on String {
  Av1RateControlMode toAv1RateControlMode() {
    switch (this) {
      case 'QVBR':
        return Av1RateControlMode.qvbr;
    }
    throw Exception('$this is not known in enum Av1RateControlMode');
  }
}

/// Required when you set Codec, under VideoDescription>CodecSettings to the
/// value AV1.
class Av1Settings {
  /// Specify the strength of any adaptive quantization filters that you enable.
  /// The value that you choose here applies to Spatial adaptive quantization
  /// (spatialAdaptiveQuantization).
  final Av1AdaptiveQuantization? adaptiveQuantization;

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
  final Av1FramerateControl? framerateControl;

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
  final Av1FramerateConversionAlgorithm? framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  final int? framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  final int? framerateNumerator;

  /// Specify the GOP length (keyframe interval) in frames. With AV1, MediaConvert
  /// doesn't support GOP length in seconds. This value must be greater than zero
  /// and preferably equal to 1 + ((numberBFrames + 1) * x), where x is an integer
  /// value.
  final double? gopSize;

  /// Maximum bitrate in bits/second. For example, enter five megabits per second
  /// as 5000000. Required when Rate control mode is QVBR.
  final int? maxBitrate;

  /// Specify the number of B-frames. With AV1, MediaConvert supports only 7 or
  /// 15.
  final int? numberBFramesBetweenReferenceFrames;

  /// Settings for quality-defined variable bitrate encoding with the AV1 codec.
  /// Required when you set Rate control mode to QVBR. Not valid when you set Rate
  /// control mode to a value other than QVBR, or when you don't define Rate
  /// control mode.
  final Av1QvbrSettings? qvbrSettings;

  /// 'With AV1 outputs, for rate control mode, MediaConvert supports only
  /// quality-defined variable bitrate (QVBR). You can''t use CBR or VBR.'
  final Av1RateControlMode? rateControlMode;

  /// Specify the number of slices per picture. This value must be 1, 2, 4, 8, 16,
  /// or 32. For progressive pictures, this value must be less than or equal to
  /// the number of macroblock rows. For interlaced pictures, this value must be
  /// less than or equal to half the number of macroblock rows.
  final int? slices;

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
  final Av1SpatialAdaptiveQuantization? spatialAdaptiveQuantization;

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
  factory Av1Settings.fromJson(Map<String, dynamic> json) {
    return Av1Settings(
      adaptiveQuantization: (json['adaptiveQuantization'] as String?)
          ?.toAv1AdaptiveQuantization(),
      framerateControl:
          (json['framerateControl'] as String?)?.toAv1FramerateControl(),
      framerateConversionAlgorithm:
          (json['framerateConversionAlgorithm'] as String?)
              ?.toAv1FramerateConversionAlgorithm(),
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
      gopSize: json['gopSize'] as double?,
      maxBitrate: json['maxBitrate'] as int?,
      numberBFramesBetweenReferenceFrames:
          json['numberBFramesBetweenReferenceFrames'] as int?,
      qvbrSettings: json['qvbrSettings'] != null
          ? Av1QvbrSettings.fromJson(
              json['qvbrSettings'] as Map<String, dynamic>)
          : null,
      rateControlMode:
          (json['rateControlMode'] as String?)?.toAv1RateControlMode(),
      slices: json['slices'] as int?,
      spatialAdaptiveQuantization:
          (json['spatialAdaptiveQuantization'] as String?)
              ?.toAv1SpatialAdaptiveQuantization(),
    );
  }

  Map<String, dynamic> toJson() {
    final adaptiveQuantization = this.adaptiveQuantization;
    final framerateControl = this.framerateControl;
    final framerateConversionAlgorithm = this.framerateConversionAlgorithm;
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final gopSize = this.gopSize;
    final maxBitrate = this.maxBitrate;
    final numberBFramesBetweenReferenceFrames =
        this.numberBFramesBetweenReferenceFrames;
    final qvbrSettings = this.qvbrSettings;
    final rateControlMode = this.rateControlMode;
    final slices = this.slices;
    final spatialAdaptiveQuantization = this.spatialAdaptiveQuantization;
    return {
      if (adaptiveQuantization != null)
        'adaptiveQuantization': adaptiveQuantization.toValue(),
      if (framerateControl != null)
        'framerateControl': framerateControl.toValue(),
      if (framerateConversionAlgorithm != null)
        'framerateConversionAlgorithm': framerateConversionAlgorithm.toValue(),
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
      if (gopSize != null) 'gopSize': gopSize,
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (numberBFramesBetweenReferenceFrames != null)
        'numberBFramesBetweenReferenceFrames':
            numberBFramesBetweenReferenceFrames,
      if (qvbrSettings != null) 'qvbrSettings': qvbrSettings,
      if (rateControlMode != null) 'rateControlMode': rateControlMode.toValue(),
      if (slices != null) 'slices': slices,
      if (spatialAdaptiveQuantization != null)
        'spatialAdaptiveQuantization': spatialAdaptiveQuantization.toValue(),
    };
  }
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
  disabled,
  enabled,
}

extension on Av1SpatialAdaptiveQuantization {
  String toValue() {
    switch (this) {
      case Av1SpatialAdaptiveQuantization.disabled:
        return 'DISABLED';
      case Av1SpatialAdaptiveQuantization.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  Av1SpatialAdaptiveQuantization toAv1SpatialAdaptiveQuantization() {
    switch (this) {
      case 'DISABLED':
        return Av1SpatialAdaptiveQuantization.disabled;
      case 'ENABLED':
        return Av1SpatialAdaptiveQuantization.enabled;
    }
    throw Exception(
        '$this is not known in enum Av1SpatialAdaptiveQuantization');
  }
}

/// Settings for Avail Blanking
class AvailBlanking {
  /// Blanking image to be used. Leave empty for solid black. Only bmp and png
  /// images are supported.
  final String? availBlankingImage;

  AvailBlanking({
    this.availBlankingImage,
  });
  factory AvailBlanking.fromJson(Map<String, dynamic> json) {
    return AvailBlanking(
      availBlankingImage: json['availBlankingImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availBlankingImage = this.availBlankingImage;
    return {
      if (availBlankingImage != null) 'availBlankingImage': availBlankingImage,
    };
  }
}

/// Specify the AVC-Intra class of your output. The AVC-Intra class selection
/// determines the output video bit rate depending on the frame rate of the
/// output. Outputs with higher class values have higher bitrates and improved
/// image quality.
enum AvcIntraClass {
  class_50,
  class_100,
  class_200,
}

extension on AvcIntraClass {
  String toValue() {
    switch (this) {
      case AvcIntraClass.class_50:
        return 'CLASS_50';
      case AvcIntraClass.class_100:
        return 'CLASS_100';
      case AvcIntraClass.class_200:
        return 'CLASS_200';
    }
  }
}

extension on String {
  AvcIntraClass toAvcIntraClass() {
    switch (this) {
      case 'CLASS_50':
        return AvcIntraClass.class_50;
      case 'CLASS_100':
        return AvcIntraClass.class_100;
      case 'CLASS_200':
        return AvcIntraClass.class_200;
    }
    throw Exception('$this is not known in enum AvcIntraClass');
  }
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
  initializeFromSource,
  specified,
}

extension on AvcIntraFramerateControl {
  String toValue() {
    switch (this) {
      case AvcIntraFramerateControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case AvcIntraFramerateControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  AvcIntraFramerateControl toAvcIntraFramerateControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return AvcIntraFramerateControl.initializeFromSource;
      case 'SPECIFIED':
        return AvcIntraFramerateControl.specified;
    }
    throw Exception('$this is not known in enum AvcIntraFramerateControl');
  }
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
  duplicateDrop,
  interpolate,
  frameformer,
}

extension on AvcIntraFramerateConversionAlgorithm {
  String toValue() {
    switch (this) {
      case AvcIntraFramerateConversionAlgorithm.duplicateDrop:
        return 'DUPLICATE_DROP';
      case AvcIntraFramerateConversionAlgorithm.interpolate:
        return 'INTERPOLATE';
      case AvcIntraFramerateConversionAlgorithm.frameformer:
        return 'FRAMEFORMER';
    }
  }
}

extension on String {
  AvcIntraFramerateConversionAlgorithm
      toAvcIntraFramerateConversionAlgorithm() {
    switch (this) {
      case 'DUPLICATE_DROP':
        return AvcIntraFramerateConversionAlgorithm.duplicateDrop;
      case 'INTERPOLATE':
        return AvcIntraFramerateConversionAlgorithm.interpolate;
      case 'FRAMEFORMER':
        return AvcIntraFramerateConversionAlgorithm.frameformer;
    }
    throw Exception(
        '$this is not known in enum AvcIntraFramerateConversionAlgorithm');
  }
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
  progressive,
  topField,
  bottomField,
  followTopField,
  followBottomField,
}

extension on AvcIntraInterlaceMode {
  String toValue() {
    switch (this) {
      case AvcIntraInterlaceMode.progressive:
        return 'PROGRESSIVE';
      case AvcIntraInterlaceMode.topField:
        return 'TOP_FIELD';
      case AvcIntraInterlaceMode.bottomField:
        return 'BOTTOM_FIELD';
      case AvcIntraInterlaceMode.followTopField:
        return 'FOLLOW_TOP_FIELD';
      case AvcIntraInterlaceMode.followBottomField:
        return 'FOLLOW_BOTTOM_FIELD';
    }
  }
}

extension on String {
  AvcIntraInterlaceMode toAvcIntraInterlaceMode() {
    switch (this) {
      case 'PROGRESSIVE':
        return AvcIntraInterlaceMode.progressive;
      case 'TOP_FIELD':
        return AvcIntraInterlaceMode.topField;
      case 'BOTTOM_FIELD':
        return AvcIntraInterlaceMode.bottomField;
      case 'FOLLOW_TOP_FIELD':
        return AvcIntraInterlaceMode.followTopField;
      case 'FOLLOW_BOTTOM_FIELD':
        return AvcIntraInterlaceMode.followBottomField;
    }
    throw Exception('$this is not known in enum AvcIntraInterlaceMode');
  }
}

/// Required when you set your output video codec to AVC-Intra. For more
/// information about the AVC-I settings, see the relevant specification. For
/// detailed information about SD and HD in AVC-I, see
/// https://ieeexplore.ieee.org/document/7290936.
class AvcIntraSettings {
  /// Specify the AVC-Intra class of your output. The AVC-Intra class selection
  /// determines the output video bit rate depending on the frame rate of the
  /// output. Outputs with higher class values have higher bitrates and improved
  /// image quality.
  final AvcIntraClass? avcIntraClass;

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
  final AvcIntraFramerateControl? framerateControl;

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
  final AvcIntraFramerateConversionAlgorithm? framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  final int? framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  final int? framerateNumerator;

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
  final AvcIntraInterlaceMode? interlaceMode;

  /// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
  /// second (fps). Enable slow PAL to create a 25 fps output. When you enable
  /// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
  /// your audio to keep it synchronized with the video. Note that enabling this
  /// setting will slightly reduce the duration of your video. Required settings:
  /// You must also set Framerate to 25. In your JSON job specification, set
  /// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
  /// (framerateDenominator) to 1.
  final AvcIntraSlowPal? slowPal;

  /// When you do frame rate conversion from 23.976 frames per second (fps) to
  /// 29.97 fps, and your output scan type is interlaced, you can optionally
  /// enable hard telecine (HARD) to create a smoother picture. When you keep the
  /// default value, None (NONE), MediaConvert does a standard frame rate
  /// conversion to 29.97 without doing anything with the field polarity to create
  /// a smoother picture.
  final AvcIntraTelecine? telecine;

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
  factory AvcIntraSettings.fromJson(Map<String, dynamic> json) {
    return AvcIntraSettings(
      avcIntraClass: (json['avcIntraClass'] as String?)?.toAvcIntraClass(),
      framerateControl:
          (json['framerateControl'] as String?)?.toAvcIntraFramerateControl(),
      framerateConversionAlgorithm:
          (json['framerateConversionAlgorithm'] as String?)
              ?.toAvcIntraFramerateConversionAlgorithm(),
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
      interlaceMode:
          (json['interlaceMode'] as String?)?.toAvcIntraInterlaceMode(),
      slowPal: (json['slowPal'] as String?)?.toAvcIntraSlowPal(),
      telecine: (json['telecine'] as String?)?.toAvcIntraTelecine(),
    );
  }

  Map<String, dynamic> toJson() {
    final avcIntraClass = this.avcIntraClass;
    final framerateControl = this.framerateControl;
    final framerateConversionAlgorithm = this.framerateConversionAlgorithm;
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final interlaceMode = this.interlaceMode;
    final slowPal = this.slowPal;
    final telecine = this.telecine;
    return {
      if (avcIntraClass != null) 'avcIntraClass': avcIntraClass.toValue(),
      if (framerateControl != null)
        'framerateControl': framerateControl.toValue(),
      if (framerateConversionAlgorithm != null)
        'framerateConversionAlgorithm': framerateConversionAlgorithm.toValue(),
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
      if (interlaceMode != null) 'interlaceMode': interlaceMode.toValue(),
      if (slowPal != null) 'slowPal': slowPal.toValue(),
      if (telecine != null) 'telecine': telecine.toValue(),
    };
  }
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
  disabled,
  enabled,
}

extension on AvcIntraSlowPal {
  String toValue() {
    switch (this) {
      case AvcIntraSlowPal.disabled:
        return 'DISABLED';
      case AvcIntraSlowPal.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  AvcIntraSlowPal toAvcIntraSlowPal() {
    switch (this) {
      case 'DISABLED':
        return AvcIntraSlowPal.disabled;
      case 'ENABLED':
        return AvcIntraSlowPal.enabled;
    }
    throw Exception('$this is not known in enum AvcIntraSlowPal');
  }
}

/// When you do frame rate conversion from 23.976 frames per second (fps) to
/// 29.97 fps, and your output scan type is interlaced, you can optionally
/// enable hard telecine (HARD) to create a smoother picture. When you keep the
/// default value, None (NONE), MediaConvert does a standard frame rate
/// conversion to 29.97 without doing anything with the field polarity to create
/// a smoother picture.
enum AvcIntraTelecine {
  none,
  hard,
}

extension on AvcIntraTelecine {
  String toValue() {
    switch (this) {
      case AvcIntraTelecine.none:
        return 'NONE';
      case AvcIntraTelecine.hard:
        return 'HARD';
    }
  }
}

extension on String {
  AvcIntraTelecine toAvcIntraTelecine() {
    switch (this) {
      case 'NONE':
        return AvcIntraTelecine.none;
      case 'HARD':
        return AvcIntraTelecine.hard;
    }
    throw Exception('$this is not known in enum AvcIntraTelecine');
  }
}

/// The tag type that AWS Billing and Cost Management will use to sort your AWS
/// Elemental MediaConvert costs on any billing report that you set up.
enum BillingTagsSource {
  queue,
  preset,
  jobTemplate,
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
  }
}

extension on String {
  BillingTagsSource toBillingTagsSource() {
    switch (this) {
      case 'QUEUE':
        return BillingTagsSource.queue;
      case 'PRESET':
        return BillingTagsSource.preset;
      case 'JOB_TEMPLATE':
        return BillingTagsSource.jobTemplate;
      case 'JOB':
        return BillingTagsSource.job;
    }
    throw Exception('$this is not known in enum BillingTagsSource');
  }
}

/// Burn-In Destination Settings.
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
  final BurninSubtitleAlignment? alignment;

  /// Specifies the color of the rectangle behind the captions.
  /// All burn-in and DVB-Sub font settings must match.
  final BurninSubtitleBackgroundColor? backgroundColor;

  /// Specifies the opacity of the background rectangle. 255 is opaque; 0 is
  /// transparent. Leaving this parameter blank is equivalent to setting it to 0
  /// (transparent). All burn-in and DVB-Sub font settings must match.
  final int? backgroundOpacity;

  /// Specifies the color of the burned-in captions. This option is not valid for
  /// source captions that are STL, 608/embedded or teletext. These source
  /// settings are already pre-defined by the caption stream. All burn-in and
  /// DVB-Sub font settings must match.
  final BurninSubtitleFontColor? fontColor;

  /// Specifies the opacity of the burned-in captions. 255 is opaque; 0 is
  /// transparent.
  /// All burn-in and DVB-Sub font settings must match.
  final int? fontOpacity;

  /// Font resolution in DPI (dots per inch); default is 96 dpi.
  /// All burn-in and DVB-Sub font settings must match.
  final int? fontResolution;

  /// Provide the font script, using an ISO 15924 script code, if the LanguageCode
  /// is not sufficient for determining the script type. Where LanguageCode or
  /// CustomLanguageCode is sufficient, use "AUTOMATIC" or leave unset. This is
  /// used to help determine the appropriate font for rendering burn-in captions.
  final FontScript? fontScript;

  /// A positive integer indicates the exact font size in points. Set to 0 for
  /// automatic font size selection. All burn-in and DVB-Sub font settings must
  /// match.
  final int? fontSize;

  /// Specifies font outline color. This option is not valid for source captions
  /// that are either 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  final BurninSubtitleOutlineColor? outlineColor;

  /// Specifies font outline size in pixels. This option is not valid for source
  /// captions that are either 608/embedded or teletext. These source settings are
  /// already pre-defined by the caption stream. All burn-in and DVB-Sub font
  /// settings must match.
  final int? outlineSize;

  /// Specifies the color of the shadow cast by the captions.
  /// All burn-in and DVB-Sub font settings must match.
  final BurninSubtitleShadowColor? shadowColor;

  /// Specifies the opacity of the shadow. 255 is opaque; 0 is transparent.
  /// Leaving this parameter blank is equivalent to setting it to 0 (transparent).
  /// All burn-in and DVB-Sub font settings must match.
  final int? shadowOpacity;

  /// Specifies the horizontal offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels to the left.
  /// All burn-in and DVB-Sub font settings must match.
  final int? shadowXOffset;

  /// Specifies the vertical offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels above the
  /// text. All burn-in and DVB-Sub font settings must match.
  final int? shadowYOffset;

  /// Only applies to jobs with input captions in Teletext or STL formats. Specify
  /// whether the spacing between letters in your captions is set by the captions
  /// grid or varies depending on letter width. Choose fixed grid to conform to
  /// the spacing specified in the captions file more accurately. Choose
  /// proportional to make the text easier to read if the captions are closed
  /// caption.
  final BurninSubtitleTeletextSpacing? teletextSpacing;

  /// Specifies the horizontal position of the caption relative to the left side
  /// of the output in pixels. A value of 10 would result in the captions starting
  /// 10 pixels from the left of the output. If no explicit x_position is
  /// provided, the horizontal caption position will be determined by the
  /// alignment parameter. This option is not valid for source captions that are
  /// STL, 608/embedded or teletext. These source settings are already pre-defined
  /// by the caption stream. All burn-in and DVB-Sub font settings must match.
  final int? xPosition;

  /// Specifies the vertical position of the caption relative to the top of the
  /// output in pixels. A value of 10 would result in the captions starting 10
  /// pixels from the top of the output. If no explicit y_position is provided,
  /// the caption will be positioned towards the bottom of the output. This option
  /// is not valid for source captions that are STL, 608/embedded or teletext.
  /// These source settings are already pre-defined by the caption stream. All
  /// burn-in and DVB-Sub font settings must match.
  final int? yPosition;

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
  factory BurninDestinationSettings.fromJson(Map<String, dynamic> json) {
    return BurninDestinationSettings(
      alignment: (json['alignment'] as String?)?.toBurninSubtitleAlignment(),
      backgroundColor: (json['backgroundColor'] as String?)
          ?.toBurninSubtitleBackgroundColor(),
      backgroundOpacity: json['backgroundOpacity'] as int?,
      fontColor: (json['fontColor'] as String?)?.toBurninSubtitleFontColor(),
      fontOpacity: json['fontOpacity'] as int?,
      fontResolution: json['fontResolution'] as int?,
      fontScript: (json['fontScript'] as String?)?.toFontScript(),
      fontSize: json['fontSize'] as int?,
      outlineColor:
          (json['outlineColor'] as String?)?.toBurninSubtitleOutlineColor(),
      outlineSize: json['outlineSize'] as int?,
      shadowColor:
          (json['shadowColor'] as String?)?.toBurninSubtitleShadowColor(),
      shadowOpacity: json['shadowOpacity'] as int?,
      shadowXOffset: json['shadowXOffset'] as int?,
      shadowYOffset: json['shadowYOffset'] as int?,
      teletextSpacing: (json['teletextSpacing'] as String?)
          ?.toBurninSubtitleTeletextSpacing(),
      xPosition: json['xPosition'] as int?,
      yPosition: json['yPosition'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final alignment = this.alignment;
    final backgroundColor = this.backgroundColor;
    final backgroundOpacity = this.backgroundOpacity;
    final fontColor = this.fontColor;
    final fontOpacity = this.fontOpacity;
    final fontResolution = this.fontResolution;
    final fontScript = this.fontScript;
    final fontSize = this.fontSize;
    final outlineColor = this.outlineColor;
    final outlineSize = this.outlineSize;
    final shadowColor = this.shadowColor;
    final shadowOpacity = this.shadowOpacity;
    final shadowXOffset = this.shadowXOffset;
    final shadowYOffset = this.shadowYOffset;
    final teletextSpacing = this.teletextSpacing;
    final xPosition = this.xPosition;
    final yPosition = this.yPosition;
    return {
      if (alignment != null) 'alignment': alignment.toValue(),
      if (backgroundColor != null) 'backgroundColor': backgroundColor.toValue(),
      if (backgroundOpacity != null) 'backgroundOpacity': backgroundOpacity,
      if (fontColor != null) 'fontColor': fontColor.toValue(),
      if (fontOpacity != null) 'fontOpacity': fontOpacity,
      if (fontResolution != null) 'fontResolution': fontResolution,
      if (fontScript != null) 'fontScript': fontScript.toValue(),
      if (fontSize != null) 'fontSize': fontSize,
      if (outlineColor != null) 'outlineColor': outlineColor.toValue(),
      if (outlineSize != null) 'outlineSize': outlineSize,
      if (shadowColor != null) 'shadowColor': shadowColor.toValue(),
      if (shadowOpacity != null) 'shadowOpacity': shadowOpacity,
      if (shadowXOffset != null) 'shadowXOffset': shadowXOffset,
      if (shadowYOffset != null) 'shadowYOffset': shadowYOffset,
      if (teletextSpacing != null) 'teletextSpacing': teletextSpacing.toValue(),
      if (xPosition != null) 'xPosition': xPosition,
      if (yPosition != null) 'yPosition': yPosition,
    };
  }
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
  centered,
  left,
}

extension on BurninSubtitleAlignment {
  String toValue() {
    switch (this) {
      case BurninSubtitleAlignment.centered:
        return 'CENTERED';
      case BurninSubtitleAlignment.left:
        return 'LEFT';
    }
  }
}

extension on String {
  BurninSubtitleAlignment toBurninSubtitleAlignment() {
    switch (this) {
      case 'CENTERED':
        return BurninSubtitleAlignment.centered;
      case 'LEFT':
        return BurninSubtitleAlignment.left;
    }
    throw Exception('$this is not known in enum BurninSubtitleAlignment');
  }
}

/// Specifies the color of the rectangle behind the captions.
/// All burn-in and DVB-Sub font settings must match.
enum BurninSubtitleBackgroundColor {
  none,
  black,
  white,
}

extension on BurninSubtitleBackgroundColor {
  String toValue() {
    switch (this) {
      case BurninSubtitleBackgroundColor.none:
        return 'NONE';
      case BurninSubtitleBackgroundColor.black:
        return 'BLACK';
      case BurninSubtitleBackgroundColor.white:
        return 'WHITE';
    }
  }
}

extension on String {
  BurninSubtitleBackgroundColor toBurninSubtitleBackgroundColor() {
    switch (this) {
      case 'NONE':
        return BurninSubtitleBackgroundColor.none;
      case 'BLACK':
        return BurninSubtitleBackgroundColor.black;
      case 'WHITE':
        return BurninSubtitleBackgroundColor.white;
    }
    throw Exception('$this is not known in enum BurninSubtitleBackgroundColor');
  }
}

/// Specifies the color of the burned-in captions. This option is not valid for
/// source captions that are STL, 608/embedded or teletext. These source
/// settings are already pre-defined by the caption stream. All burn-in and
/// DVB-Sub font settings must match.
enum BurninSubtitleFontColor {
  white,
  black,
  yellow,
  red,
  green,
  blue,
}

extension on BurninSubtitleFontColor {
  String toValue() {
    switch (this) {
      case BurninSubtitleFontColor.white:
        return 'WHITE';
      case BurninSubtitleFontColor.black:
        return 'BLACK';
      case BurninSubtitleFontColor.yellow:
        return 'YELLOW';
      case BurninSubtitleFontColor.red:
        return 'RED';
      case BurninSubtitleFontColor.green:
        return 'GREEN';
      case BurninSubtitleFontColor.blue:
        return 'BLUE';
    }
  }
}

extension on String {
  BurninSubtitleFontColor toBurninSubtitleFontColor() {
    switch (this) {
      case 'WHITE':
        return BurninSubtitleFontColor.white;
      case 'BLACK':
        return BurninSubtitleFontColor.black;
      case 'YELLOW':
        return BurninSubtitleFontColor.yellow;
      case 'RED':
        return BurninSubtitleFontColor.red;
      case 'GREEN':
        return BurninSubtitleFontColor.green;
      case 'BLUE':
        return BurninSubtitleFontColor.blue;
    }
    throw Exception('$this is not known in enum BurninSubtitleFontColor');
  }
}

/// Specifies font outline color. This option is not valid for source captions
/// that are either 608/embedded or teletext. These source settings are already
/// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
/// must match.
enum BurninSubtitleOutlineColor {
  black,
  white,
  yellow,
  red,
  green,
  blue,
}

extension on BurninSubtitleOutlineColor {
  String toValue() {
    switch (this) {
      case BurninSubtitleOutlineColor.black:
        return 'BLACK';
      case BurninSubtitleOutlineColor.white:
        return 'WHITE';
      case BurninSubtitleOutlineColor.yellow:
        return 'YELLOW';
      case BurninSubtitleOutlineColor.red:
        return 'RED';
      case BurninSubtitleOutlineColor.green:
        return 'GREEN';
      case BurninSubtitleOutlineColor.blue:
        return 'BLUE';
    }
  }
}

extension on String {
  BurninSubtitleOutlineColor toBurninSubtitleOutlineColor() {
    switch (this) {
      case 'BLACK':
        return BurninSubtitleOutlineColor.black;
      case 'WHITE':
        return BurninSubtitleOutlineColor.white;
      case 'YELLOW':
        return BurninSubtitleOutlineColor.yellow;
      case 'RED':
        return BurninSubtitleOutlineColor.red;
      case 'GREEN':
        return BurninSubtitleOutlineColor.green;
      case 'BLUE':
        return BurninSubtitleOutlineColor.blue;
    }
    throw Exception('$this is not known in enum BurninSubtitleOutlineColor');
  }
}

/// Specifies the color of the shadow cast by the captions.
/// All burn-in and DVB-Sub font settings must match.
enum BurninSubtitleShadowColor {
  none,
  black,
  white,
}

extension on BurninSubtitleShadowColor {
  String toValue() {
    switch (this) {
      case BurninSubtitleShadowColor.none:
        return 'NONE';
      case BurninSubtitleShadowColor.black:
        return 'BLACK';
      case BurninSubtitleShadowColor.white:
        return 'WHITE';
    }
  }
}

extension on String {
  BurninSubtitleShadowColor toBurninSubtitleShadowColor() {
    switch (this) {
      case 'NONE':
        return BurninSubtitleShadowColor.none;
      case 'BLACK':
        return BurninSubtitleShadowColor.black;
      case 'WHITE':
        return BurninSubtitleShadowColor.white;
    }
    throw Exception('$this is not known in enum BurninSubtitleShadowColor');
  }
}

/// Only applies to jobs with input captions in Teletext or STL formats. Specify
/// whether the spacing between letters in your captions is set by the captions
/// grid or varies depending on letter width. Choose fixed grid to conform to
/// the spacing specified in the captions file more accurately. Choose
/// proportional to make the text easier to read if the captions are closed
/// caption.
enum BurninSubtitleTeletextSpacing {
  fixedGrid,
  proportional,
}

extension on BurninSubtitleTeletextSpacing {
  String toValue() {
    switch (this) {
      case BurninSubtitleTeletextSpacing.fixedGrid:
        return 'FIXED_GRID';
      case BurninSubtitleTeletextSpacing.proportional:
        return 'PROPORTIONAL';
    }
  }
}

extension on String {
  BurninSubtitleTeletextSpacing toBurninSubtitleTeletextSpacing() {
    switch (this) {
      case 'FIXED_GRID':
        return BurninSubtitleTeletextSpacing.fixedGrid;
      case 'PROPORTIONAL':
        return BurninSubtitleTeletextSpacing.proportional;
    }
    throw Exception('$this is not known in enum BurninSubtitleTeletextSpacing');
  }
}

class CancelJobResponse {
  CancelJobResponse();
  factory CancelJobResponse.fromJson(Map<String, dynamic> _) {
    return CancelJobResponse();
  }
}

/// Description of Caption output
class CaptionDescription {
  /// Specifies which "Caption Selector":#inputs-caption_selector to use from each
  /// input when generating captions. The name should be of the format "Caption
  /// Selector <N>", which denotes that the Nth Caption Selector will be used from
  /// each input.
  final String? captionSelectorName;

  /// Specify the language for this captions output track. For most captions
  /// output formats, the encoder puts this language information in the output
  /// captions metadata. If your output captions format is DVB-Sub or Burn in, the
  /// encoder uses this language information when automatically selecting the font
  /// script for rendering the captions text. For all outputs, you can use an ISO
  /// 639-2 or ISO 639-3 code. For streaming outputs, you can also use any other
  /// code in the full RFC-5646 specification. Streaming outputs are those that
  /// are in one of the following output groups: CMAF, DASH ISO, Apple HLS, or
  /// Microsoft Smooth Streaming.
  final String? customLanguageCode;

  /// Specific settings required by destination type. Note that
  /// burnin_destination_settings are not available if the source of the caption
  /// data is Embedded or Teletext.
  final CaptionDestinationSettings? destinationSettings;

  /// Specify the language of this captions output track. For most captions output
  /// formats, the encoder puts this language information in the output captions
  /// metadata. If your output captions format is DVB-Sub or Burn in, the encoder
  /// uses this language information to choose the font language for rendering the
  /// captions text.
  final LanguageCode? languageCode;

  /// Specify a label for this set of output captions. For example, "English",
  /// "Director commentary", or "track_2". For streaming outputs, MediaConvert
  /// passes this information into destination manifests for display on the
  /// end-viewer's player device. For outputs in other output groups, the service
  /// ignores this setting.
  final String? languageDescription;

  CaptionDescription({
    this.captionSelectorName,
    this.customLanguageCode,
    this.destinationSettings,
    this.languageCode,
    this.languageDescription,
  });
  factory CaptionDescription.fromJson(Map<String, dynamic> json) {
    return CaptionDescription(
      captionSelectorName: json['captionSelectorName'] as String?,
      customLanguageCode: json['customLanguageCode'] as String?,
      destinationSettings: json['destinationSettings'] != null
          ? CaptionDestinationSettings.fromJson(
              json['destinationSettings'] as Map<String, dynamic>)
          : null,
      languageCode: (json['languageCode'] as String?)?.toLanguageCode(),
      languageDescription: json['languageDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final captionSelectorName = this.captionSelectorName;
    final customLanguageCode = this.customLanguageCode;
    final destinationSettings = this.destinationSettings;
    final languageCode = this.languageCode;
    final languageDescription = this.languageDescription;
    return {
      if (captionSelectorName != null)
        'captionSelectorName': captionSelectorName,
      if (customLanguageCode != null) 'customLanguageCode': customLanguageCode,
      if (destinationSettings != null)
        'destinationSettings': destinationSettings,
      if (languageCode != null) 'languageCode': languageCode.toValue(),
      if (languageDescription != null)
        'languageDescription': languageDescription,
    };
  }
}

/// Caption Description for preset
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
  final String? customLanguageCode;

  /// Specific settings required by destination type. Note that
  /// burnin_destination_settings are not available if the source of the caption
  /// data is Embedded or Teletext.
  final CaptionDestinationSettings? destinationSettings;

  /// Specify the language of this captions output track. For most captions output
  /// formats, the encoder puts this language information in the output captions
  /// metadata. If your output captions format is DVB-Sub or Burn in, the encoder
  /// uses this language information to choose the font language for rendering the
  /// captions text.
  final LanguageCode? languageCode;

  /// Specify a label for this set of output captions. For example, "English",
  /// "Director commentary", or "track_2". For streaming outputs, MediaConvert
  /// passes this information into destination manifests for display on the
  /// end-viewer's player device. For outputs in other output groups, the service
  /// ignores this setting.
  final String? languageDescription;

  CaptionDescriptionPreset({
    this.customLanguageCode,
    this.destinationSettings,
    this.languageCode,
    this.languageDescription,
  });
  factory CaptionDescriptionPreset.fromJson(Map<String, dynamic> json) {
    return CaptionDescriptionPreset(
      customLanguageCode: json['customLanguageCode'] as String?,
      destinationSettings: json['destinationSettings'] != null
          ? CaptionDestinationSettings.fromJson(
              json['destinationSettings'] as Map<String, dynamic>)
          : null,
      languageCode: (json['languageCode'] as String?)?.toLanguageCode(),
      languageDescription: json['languageDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customLanguageCode = this.customLanguageCode;
    final destinationSettings = this.destinationSettings;
    final languageCode = this.languageCode;
    final languageDescription = this.languageDescription;
    return {
      if (customLanguageCode != null) 'customLanguageCode': customLanguageCode,
      if (destinationSettings != null)
        'destinationSettings': destinationSettings,
      if (languageCode != null) 'languageCode': languageCode.toValue(),
      if (languageDescription != null)
        'languageDescription': languageDescription,
    };
  }
}

/// Specific settings required by destination type. Note that
/// burnin_destination_settings are not available if the source of the caption
/// data is Embedded or Teletext.
class CaptionDestinationSettings {
  /// Burn-In Destination Settings.
  final BurninDestinationSettings? burninDestinationSettings;

  /// Specify the format for this set of captions on this output. The default
  /// format is embedded without SCTE-20. Other options are embedded with SCTE-20,
  /// burn-in, DVB-sub, IMSC, SCC, SRT, teletext, TTML, and web-VTT. If you are
  /// using SCTE-20, choose SCTE-20 plus embedded (SCTE20_PLUS_EMBEDDED) to create
  /// an output that complies with the SCTE-43 spec. To create a non-compliant
  /// output where the embedded captions come first, choose Embedded plus SCTE-20
  /// (EMBEDDED_PLUS_SCTE20).
  final CaptionDestinationType? destinationType;

  /// DVB-Sub Destination Settings
  final DvbSubDestinationSettings? dvbSubDestinationSettings;

  /// Settings specific to embedded/ancillary caption outputs, including 608/708
  /// Channel destination number.
  final EmbeddedDestinationSettings? embeddedDestinationSettings;

  /// Settings specific to IMSC caption outputs.
  final ImscDestinationSettings? imscDestinationSettings;

  /// Settings for SCC caption output.
  final SccDestinationSettings? sccDestinationSettings;

  /// Settings for Teletext caption output
  final TeletextDestinationSettings? teletextDestinationSettings;

  /// Settings specific to TTML caption outputs, including Pass style information
  /// (TtmlStylePassthrough).
  final TtmlDestinationSettings? ttmlDestinationSettings;

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
  factory CaptionDestinationSettings.fromJson(Map<String, dynamic> json) {
    return CaptionDestinationSettings(
      burninDestinationSettings: json['burninDestinationSettings'] != null
          ? BurninDestinationSettings.fromJson(
              json['burninDestinationSettings'] as Map<String, dynamic>)
          : null,
      destinationType:
          (json['destinationType'] as String?)?.toCaptionDestinationType(),
      dvbSubDestinationSettings: json['dvbSubDestinationSettings'] != null
          ? DvbSubDestinationSettings.fromJson(
              json['dvbSubDestinationSettings'] as Map<String, dynamic>)
          : null,
      embeddedDestinationSettings: json['embeddedDestinationSettings'] != null
          ? EmbeddedDestinationSettings.fromJson(
              json['embeddedDestinationSettings'] as Map<String, dynamic>)
          : null,
      imscDestinationSettings: json['imscDestinationSettings'] != null
          ? ImscDestinationSettings.fromJson(
              json['imscDestinationSettings'] as Map<String, dynamic>)
          : null,
      sccDestinationSettings: json['sccDestinationSettings'] != null
          ? SccDestinationSettings.fromJson(
              json['sccDestinationSettings'] as Map<String, dynamic>)
          : null,
      teletextDestinationSettings: json['teletextDestinationSettings'] != null
          ? TeletextDestinationSettings.fromJson(
              json['teletextDestinationSettings'] as Map<String, dynamic>)
          : null,
      ttmlDestinationSettings: json['ttmlDestinationSettings'] != null
          ? TtmlDestinationSettings.fromJson(
              json['ttmlDestinationSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final burninDestinationSettings = this.burninDestinationSettings;
    final destinationType = this.destinationType;
    final dvbSubDestinationSettings = this.dvbSubDestinationSettings;
    final embeddedDestinationSettings = this.embeddedDestinationSettings;
    final imscDestinationSettings = this.imscDestinationSettings;
    final sccDestinationSettings = this.sccDestinationSettings;
    final teletextDestinationSettings = this.teletextDestinationSettings;
    final ttmlDestinationSettings = this.ttmlDestinationSettings;
    return {
      if (burninDestinationSettings != null)
        'burninDestinationSettings': burninDestinationSettings,
      if (destinationType != null) 'destinationType': destinationType.toValue(),
      if (dvbSubDestinationSettings != null)
        'dvbSubDestinationSettings': dvbSubDestinationSettings,
      if (embeddedDestinationSettings != null)
        'embeddedDestinationSettings': embeddedDestinationSettings,
      if (imscDestinationSettings != null)
        'imscDestinationSettings': imscDestinationSettings,
      if (sccDestinationSettings != null)
        'sccDestinationSettings': sccDestinationSettings,
      if (teletextDestinationSettings != null)
        'teletextDestinationSettings': teletextDestinationSettings,
      if (ttmlDestinationSettings != null)
        'ttmlDestinationSettings': ttmlDestinationSettings,
    };
  }
}

/// Specify the format for this set of captions on this output. The default
/// format is embedded without SCTE-20. Other options are embedded with SCTE-20,
/// burn-in, DVB-sub, IMSC, SCC, SRT, teletext, TTML, and web-VTT. If you are
/// using SCTE-20, choose SCTE-20 plus embedded (SCTE20_PLUS_EMBEDDED) to create
/// an output that complies with the SCTE-43 spec. To create a non-compliant
/// output where the embedded captions come first, choose Embedded plus SCTE-20
/// (EMBEDDED_PLUS_SCTE20).
enum CaptionDestinationType {
  burnIn,
  dvbSub,
  embedded,
  embeddedPlusScte20,
  imsc,
  scte20PlusEmbedded,
  scc,
  srt,
  smi,
  teletext,
  ttml,
  webvtt,
}

extension on CaptionDestinationType {
  String toValue() {
    switch (this) {
      case CaptionDestinationType.burnIn:
        return 'BURN_IN';
      case CaptionDestinationType.dvbSub:
        return 'DVB_SUB';
      case CaptionDestinationType.embedded:
        return 'EMBEDDED';
      case CaptionDestinationType.embeddedPlusScte20:
        return 'EMBEDDED_PLUS_SCTE20';
      case CaptionDestinationType.imsc:
        return 'IMSC';
      case CaptionDestinationType.scte20PlusEmbedded:
        return 'SCTE20_PLUS_EMBEDDED';
      case CaptionDestinationType.scc:
        return 'SCC';
      case CaptionDestinationType.srt:
        return 'SRT';
      case CaptionDestinationType.smi:
        return 'SMI';
      case CaptionDestinationType.teletext:
        return 'TELETEXT';
      case CaptionDestinationType.ttml:
        return 'TTML';
      case CaptionDestinationType.webvtt:
        return 'WEBVTT';
    }
  }
}

extension on String {
  CaptionDestinationType toCaptionDestinationType() {
    switch (this) {
      case 'BURN_IN':
        return CaptionDestinationType.burnIn;
      case 'DVB_SUB':
        return CaptionDestinationType.dvbSub;
      case 'EMBEDDED':
        return CaptionDestinationType.embedded;
      case 'EMBEDDED_PLUS_SCTE20':
        return CaptionDestinationType.embeddedPlusScte20;
      case 'IMSC':
        return CaptionDestinationType.imsc;
      case 'SCTE20_PLUS_EMBEDDED':
        return CaptionDestinationType.scte20PlusEmbedded;
      case 'SCC':
        return CaptionDestinationType.scc;
      case 'SRT':
        return CaptionDestinationType.srt;
      case 'SMI':
        return CaptionDestinationType.smi;
      case 'TELETEXT':
        return CaptionDestinationType.teletext;
      case 'TTML':
        return CaptionDestinationType.ttml;
      case 'WEBVTT':
        return CaptionDestinationType.webvtt;
    }
    throw Exception('$this is not known in enum CaptionDestinationType');
  }
}

/// Set up captions in your outputs by first selecting them from your input
/// here.
class CaptionSelector {
  /// The specific language to extract from source, using the ISO 639-2 or ISO
  /// 639-3 three-letter language code. If input is SCTE-27, complete this field
  /// and/or PID to select the caption language to extract. If input is DVB-Sub
  /// and output is Burn-in or SMPTE-TT, complete this field and/or PID to select
  /// the caption language to extract. If input is DVB-Sub that is being passed
  /// through, omit this field (and PID field); there is no way to extract a
  /// specific language with pass-through captions.
  final String? customLanguageCode;

  /// The specific language to extract from source. If input is SCTE-27, complete
  /// this field and/or PID to select the caption language to extract. If input is
  /// DVB-Sub and output is Burn-in or SMPTE-TT, complete this field and/or PID to
  /// select the caption language to extract. If input is DVB-Sub that is being
  /// passed through, omit this field (and PID field); there is no way to extract
  /// a specific language with pass-through captions.
  final LanguageCode? languageCode;

  /// If your input captions are SCC, TTML, STL, SMI, SRT, or IMSC in an xml file,
  /// specify the URI of the input captions source file. If your input captions
  /// are IMSC in an IMF package, use TrackSourceSettings instead of
  /// FileSoureSettings.
  final CaptionSourceSettings? sourceSettings;

  CaptionSelector({
    this.customLanguageCode,
    this.languageCode,
    this.sourceSettings,
  });
  factory CaptionSelector.fromJson(Map<String, dynamic> json) {
    return CaptionSelector(
      customLanguageCode: json['customLanguageCode'] as String?,
      languageCode: (json['languageCode'] as String?)?.toLanguageCode(),
      sourceSettings: json['sourceSettings'] != null
          ? CaptionSourceSettings.fromJson(
              json['sourceSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customLanguageCode = this.customLanguageCode;
    final languageCode = this.languageCode;
    final sourceSettings = this.sourceSettings;
    return {
      if (customLanguageCode != null) 'customLanguageCode': customLanguageCode,
      if (languageCode != null) 'languageCode': languageCode.toValue(),
      if (sourceSettings != null) 'sourceSettings': sourceSettings,
    };
  }
}

/// Ignore this setting unless your input captions format is SCC. To have the
/// service compensate for differing frame rates between your input captions and
/// input video, specify the frame rate of the captions file. Specify this value
/// as a fraction, using the settings Framerate numerator (framerateNumerator)
/// and Framerate denominator (framerateDenominator). For example, you might
/// specify 24 / 1 for 24 fps, 25 / 1 for 25 fps, 24000 / 1001 for 23.976 fps,
/// or 30000 / 1001 for 29.97 fps.
class CaptionSourceFramerate {
  /// Specify the denominator of the fraction that represents the frame rate for
  /// the setting Caption source frame rate (CaptionSourceFramerate). Use this
  /// setting along with the setting Framerate numerator (framerateNumerator).
  final int? framerateDenominator;

  /// Specify the numerator of the fraction that represents the frame rate for the
  /// setting Caption source frame rate (CaptionSourceFramerate). Use this setting
  /// along with the setting Framerate denominator (framerateDenominator).
  final int? framerateNumerator;

  CaptionSourceFramerate({
    this.framerateDenominator,
    this.framerateNumerator,
  });
  factory CaptionSourceFramerate.fromJson(Map<String, dynamic> json) {
    return CaptionSourceFramerate(
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    return {
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
    };
  }
}

/// If your input captions are SCC, TTML, STL, SMI, SRT, or IMSC in an xml file,
/// specify the URI of the input captions source file. If your input captions
/// are IMSC in an IMF package, use TrackSourceSettings instead of
/// FileSoureSettings.
class CaptionSourceSettings {
  /// Settings for ancillary captions source.
  final AncillarySourceSettings? ancillarySourceSettings;

  /// DVB Sub Source Settings
  final DvbSubSourceSettings? dvbSubSourceSettings;

  /// Settings for embedded captions Source
  final EmbeddedSourceSettings? embeddedSourceSettings;

  /// If your input captions are SCC, SMI, SRT, STL, TTML, or IMSC 1.1 in an xml
  /// file, specify the URI of the input caption source file. If your caption
  /// source is IMSC in an IMF package, use TrackSourceSettings instead of
  /// FileSoureSettings.
  final FileSourceSettings? fileSourceSettings;

  /// Use Source (SourceType) to identify the format of your input captions.  The
  /// service cannot auto-detect caption format.
  final CaptionSourceType? sourceType;

  /// Settings specific to Teletext caption sources, including Page number.
  final TeletextSourceSettings? teletextSourceSettings;

  /// Settings specific to caption sources that are specified by track number.
  /// Currently, this is only IMSC captions in an IMF package. If your caption
  /// source is IMSC 1.1 in a separate xml file, use FileSourceSettings instead of
  /// TrackSourceSettings.
  final TrackSourceSettings? trackSourceSettings;

  CaptionSourceSettings({
    this.ancillarySourceSettings,
    this.dvbSubSourceSettings,
    this.embeddedSourceSettings,
    this.fileSourceSettings,
    this.sourceType,
    this.teletextSourceSettings,
    this.trackSourceSettings,
  });
  factory CaptionSourceSettings.fromJson(Map<String, dynamic> json) {
    return CaptionSourceSettings(
      ancillarySourceSettings: json['ancillarySourceSettings'] != null
          ? AncillarySourceSettings.fromJson(
              json['ancillarySourceSettings'] as Map<String, dynamic>)
          : null,
      dvbSubSourceSettings: json['dvbSubSourceSettings'] != null
          ? DvbSubSourceSettings.fromJson(
              json['dvbSubSourceSettings'] as Map<String, dynamic>)
          : null,
      embeddedSourceSettings: json['embeddedSourceSettings'] != null
          ? EmbeddedSourceSettings.fromJson(
              json['embeddedSourceSettings'] as Map<String, dynamic>)
          : null,
      fileSourceSettings: json['fileSourceSettings'] != null
          ? FileSourceSettings.fromJson(
              json['fileSourceSettings'] as Map<String, dynamic>)
          : null,
      sourceType: (json['sourceType'] as String?)?.toCaptionSourceType(),
      teletextSourceSettings: json['teletextSourceSettings'] != null
          ? TeletextSourceSettings.fromJson(
              json['teletextSourceSettings'] as Map<String, dynamic>)
          : null,
      trackSourceSettings: json['trackSourceSettings'] != null
          ? TrackSourceSettings.fromJson(
              json['trackSourceSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ancillarySourceSettings = this.ancillarySourceSettings;
    final dvbSubSourceSettings = this.dvbSubSourceSettings;
    final embeddedSourceSettings = this.embeddedSourceSettings;
    final fileSourceSettings = this.fileSourceSettings;
    final sourceType = this.sourceType;
    final teletextSourceSettings = this.teletextSourceSettings;
    final trackSourceSettings = this.trackSourceSettings;
    return {
      if (ancillarySourceSettings != null)
        'ancillarySourceSettings': ancillarySourceSettings,
      if (dvbSubSourceSettings != null)
        'dvbSubSourceSettings': dvbSubSourceSettings,
      if (embeddedSourceSettings != null)
        'embeddedSourceSettings': embeddedSourceSettings,
      if (fileSourceSettings != null) 'fileSourceSettings': fileSourceSettings,
      if (sourceType != null) 'sourceType': sourceType.toValue(),
      if (teletextSourceSettings != null)
        'teletextSourceSettings': teletextSourceSettings,
      if (trackSourceSettings != null)
        'trackSourceSettings': trackSourceSettings,
    };
  }
}

/// Use Source (SourceType) to identify the format of your input captions.  The
/// service cannot auto-detect caption format.
enum CaptionSourceType {
  ancillary,
  dvbSub,
  embedded,
  scte20,
  scc,
  ttml,
  stl,
  srt,
  smi,
  teletext,
  nullSource,
  imsc,
}

extension on CaptionSourceType {
  String toValue() {
    switch (this) {
      case CaptionSourceType.ancillary:
        return 'ANCILLARY';
      case CaptionSourceType.dvbSub:
        return 'DVB_SUB';
      case CaptionSourceType.embedded:
        return 'EMBEDDED';
      case CaptionSourceType.scte20:
        return 'SCTE20';
      case CaptionSourceType.scc:
        return 'SCC';
      case CaptionSourceType.ttml:
        return 'TTML';
      case CaptionSourceType.stl:
        return 'STL';
      case CaptionSourceType.srt:
        return 'SRT';
      case CaptionSourceType.smi:
        return 'SMI';
      case CaptionSourceType.teletext:
        return 'TELETEXT';
      case CaptionSourceType.nullSource:
        return 'NULL_SOURCE';
      case CaptionSourceType.imsc:
        return 'IMSC';
    }
  }
}

extension on String {
  CaptionSourceType toCaptionSourceType() {
    switch (this) {
      case 'ANCILLARY':
        return CaptionSourceType.ancillary;
      case 'DVB_SUB':
        return CaptionSourceType.dvbSub;
      case 'EMBEDDED':
        return CaptionSourceType.embedded;
      case 'SCTE20':
        return CaptionSourceType.scte20;
      case 'SCC':
        return CaptionSourceType.scc;
      case 'TTML':
        return CaptionSourceType.ttml;
      case 'STL':
        return CaptionSourceType.stl;
      case 'SRT':
        return CaptionSourceType.srt;
      case 'SMI':
        return CaptionSourceType.smi;
      case 'TELETEXT':
        return CaptionSourceType.teletext;
      case 'NULL_SOURCE':
        return CaptionSourceType.nullSource;
      case 'IMSC':
        return CaptionSourceType.imsc;
    }
    throw Exception('$this is not known in enum CaptionSourceType');
  }
}

/// Channel mapping (ChannelMapping) contains the group of fields that hold the
/// remixing value for each channel. Units are in dB. Acceptable values are
/// within the range from -60 (mute) through 6. A setting of 0 passes the input
/// channel unchanged to the output channel (no attenuation or amplification).
class ChannelMapping {
  /// List of output channels
  final List<OutputChannelMapping>? outputChannels;

  ChannelMapping({
    this.outputChannels,
  });
  factory ChannelMapping.fromJson(Map<String, dynamic> json) {
    return ChannelMapping(
      outputChannels: (json['outputChannels'] as List?)
          ?.whereNotNull()
          .map((e) => OutputChannelMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final outputChannels = this.outputChannels;
    return {
      if (outputChannels != null) 'outputChannels': outputChannels,
    };
  }
}

/// Specify the details for each pair of HLS and DASH additional manifests that
/// you want the service to generate for this CMAF output group. Each pair of
/// manifests can reference a different subset of outputs in the group.
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
  final String? manifestNameModifier;

  /// Specify the outputs that you want this additional top-level manifest to
  /// reference.
  final List<String>? selectedOutputs;

  CmafAdditionalManifest({
    this.manifestNameModifier,
    this.selectedOutputs,
  });
  factory CmafAdditionalManifest.fromJson(Map<String, dynamic> json) {
    return CmafAdditionalManifest(
      manifestNameModifier: json['manifestNameModifier'] as String?,
      selectedOutputs: (json['selectedOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final manifestNameModifier = this.manifestNameModifier;
    final selectedOutputs = this.selectedOutputs;
    return {
      if (manifestNameModifier != null)
        'manifestNameModifier': manifestNameModifier,
      if (selectedOutputs != null) 'selectedOutputs': selectedOutputs,
    };
  }
}

/// Disable this setting only when your workflow requires the
/// #EXT-X-ALLOW-CACHE:no tag. Otherwise, keep the default value Enabled
/// (ENABLED) and control caching in your video distribution set up. For
/// example, use the Cache-Control http header.
enum CmafClientCache {
  disabled,
  enabled,
}

extension on CmafClientCache {
  String toValue() {
    switch (this) {
      case CmafClientCache.disabled:
        return 'DISABLED';
      case CmafClientCache.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  CmafClientCache toCmafClientCache() {
    switch (this) {
      case 'DISABLED':
        return CmafClientCache.disabled;
      case 'ENABLED':
        return CmafClientCache.enabled;
    }
    throw Exception('$this is not known in enum CmafClientCache');
  }
}

/// Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist
/// generation.
enum CmafCodecSpecification {
  rfc_6381,
  rfc_4281,
}

extension on CmafCodecSpecification {
  String toValue() {
    switch (this) {
      case CmafCodecSpecification.rfc_6381:
        return 'RFC_6381';
      case CmafCodecSpecification.rfc_4281:
        return 'RFC_4281';
    }
  }
}

extension on String {
  CmafCodecSpecification toCmafCodecSpecification() {
    switch (this) {
      case 'RFC_6381':
        return CmafCodecSpecification.rfc_6381;
      case 'RFC_4281':
        return CmafCodecSpecification.rfc_4281;
    }
    throw Exception('$this is not known in enum CmafCodecSpecification');
  }
}

/// Settings for CMAF encryption
class CmafEncryptionSettings {
  /// This is a 128-bit, 16-byte hex value represented by a 32-character text
  /// string. If this parameter is not set then the Initialization Vector will
  /// follow the segment number by default.
  final String? constantInitializationVector;

  /// Specify the encryption scheme that you want the service to use when
  /// encrypting your CMAF segments. Choose AES-CBC subsample (SAMPLE-AES) or
  /// AES_CTR (AES-CTR).
  final CmafEncryptionType? encryptionMethod;

  /// When you use DRM with CMAF outputs, choose whether the service writes the
  /// 128-bit encryption initialization vector in the HLS and DASH manifests.
  final CmafInitializationVectorInManifest? initializationVectorInManifest;

  /// If your output group type is CMAF, use these settings when doing DRM
  /// encryption with a SPEKE-compliant key provider. If your output group type is
  /// HLS, DASH, or Microsoft Smooth, use the SpekeKeyProvider settings instead.
  final SpekeKeyProviderCmaf? spekeKeyProvider;

  /// Use these settings to set up encryption with a static key provider.
  final StaticKeyProvider? staticKeyProvider;

  /// Specify whether your DRM encryption key is static or from a key provider
  /// that follows the SPEKE standard. For more information about SPEKE, see
  /// https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
  final CmafKeyProviderType? type;

  CmafEncryptionSettings({
    this.constantInitializationVector,
    this.encryptionMethod,
    this.initializationVectorInManifest,
    this.spekeKeyProvider,
    this.staticKeyProvider,
    this.type,
  });
  factory CmafEncryptionSettings.fromJson(Map<String, dynamic> json) {
    return CmafEncryptionSettings(
      constantInitializationVector:
          json['constantInitializationVector'] as String?,
      encryptionMethod:
          (json['encryptionMethod'] as String?)?.toCmafEncryptionType(),
      initializationVectorInManifest:
          (json['initializationVectorInManifest'] as String?)
              ?.toCmafInitializationVectorInManifest(),
      spekeKeyProvider: json['spekeKeyProvider'] != null
          ? SpekeKeyProviderCmaf.fromJson(
              json['spekeKeyProvider'] as Map<String, dynamic>)
          : null,
      staticKeyProvider: json['staticKeyProvider'] != null
          ? StaticKeyProvider.fromJson(
              json['staticKeyProvider'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.toCmafKeyProviderType(),
    );
  }

  Map<String, dynamic> toJson() {
    final constantInitializationVector = this.constantInitializationVector;
    final encryptionMethod = this.encryptionMethod;
    final initializationVectorInManifest = this.initializationVectorInManifest;
    final spekeKeyProvider = this.spekeKeyProvider;
    final staticKeyProvider = this.staticKeyProvider;
    final type = this.type;
    return {
      if (constantInitializationVector != null)
        'constantInitializationVector': constantInitializationVector,
      if (encryptionMethod != null)
        'encryptionMethod': encryptionMethod.toValue(),
      if (initializationVectorInManifest != null)
        'initializationVectorInManifest':
            initializationVectorInManifest.toValue(),
      if (spekeKeyProvider != null) 'spekeKeyProvider': spekeKeyProvider,
      if (staticKeyProvider != null) 'staticKeyProvider': staticKeyProvider,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Specify the encryption scheme that you want the service to use when
/// encrypting your CMAF segments. Choose AES-CBC subsample (SAMPLE-AES) or
/// AES_CTR (AES-CTR).
enum CmafEncryptionType {
  sampleAes,
  aesCtr,
}

extension on CmafEncryptionType {
  String toValue() {
    switch (this) {
      case CmafEncryptionType.sampleAes:
        return 'SAMPLE_AES';
      case CmafEncryptionType.aesCtr:
        return 'AES_CTR';
    }
  }
}

extension on String {
  CmafEncryptionType toCmafEncryptionType() {
    switch (this) {
      case 'SAMPLE_AES':
        return CmafEncryptionType.sampleAes;
      case 'AES_CTR':
        return CmafEncryptionType.aesCtr;
    }
    throw Exception('$this is not known in enum CmafEncryptionType');
  }
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// CMAF_GROUP_SETTINGS. Each output in a CMAF Output Group may only contain a
/// single video, audio, or caption output.
class CmafGroupSettings {
  /// By default, the service creates one top-level .m3u8 HLS manifest and one top
  /// -level .mpd DASH manifest for each CMAF output group in your job. These
  /// default manifests reference every output in the output group. To create
  /// additional top-level manifests that reference a subset of the outputs in the
  /// output group, specify a list of them here. For each additional manifest that
  /// you specify, the service creates one HLS manifest and one DASH manifest.
  final List<CmafAdditionalManifest>? additionalManifests;

  /// A partial URI prefix that will be put in the manifest file at the top level
  /// BaseURL element. Can be used if streams are delivered from a different URL
  /// than the manifest file.
  final String? baseUrl;

  /// Disable this setting only when your workflow requires the
  /// #EXT-X-ALLOW-CACHE:no tag. Otherwise, keep the default value Enabled
  /// (ENABLED) and control caching in your video distribution set up. For
  /// example, use the Cache-Control http header.
  final CmafClientCache? clientCache;

  /// Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist
  /// generation.
  final CmafCodecSpecification? codecSpecification;

  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do not
  /// specify the base filename in the URI, the service will use the filename of
  /// the input file. If your job has multiple inputs, the service uses the
  /// filename of the first input file.
  final String? destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  final DestinationSettings? destinationSettings;

  /// DRM settings.
  final CmafEncryptionSettings? encryption;

  /// Length of fragments to generate (in seconds). Fragment length must be
  /// compatible with GOP size and Framerate. Note that fragments will end on the
  /// next keyframe after this number of seconds, so actual fragment length may be
  /// longer. When Emit Single File is checked, the fragmentation is internal to a
  /// single output file and it does not cause the creation of many output files
  /// as in other output types.
  final int? fragmentLength;

  /// When set to GZIP, compresses HLS playlist.
  final CmafManifestCompression? manifestCompression;

  /// Indicates whether the output manifest should use floating point values for
  /// segment duration.
  final CmafManifestDurationFormat? manifestDurationFormat;

  /// Minimum time of initially buffered media that is needed to ensure smooth
  /// playout.
  final int? minBufferTime;

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
  final double? minFinalSegmentLength;

  /// Specify whether your DASH profile is on-demand or main. When you choose Main
  /// profile (MAIN_PROFILE), the service signals
  /// urn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you
  /// choose On-demand (ON_DEMAND_PROFILE), the service signals
  /// urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose
  /// On-demand, you must also set the output group setting Segment control
  /// (SegmentControl) to Single file (SINGLE_FILE).
  final CmafMpdProfile? mpdProfile;

  /// When set to SINGLE_FILE, a single output file is generated, which is
  /// internally segmented using the Fragment Length and Segment Length. When set
  /// to SEGMENTED_FILES, separate segment files will be created.
  final CmafSegmentControl? segmentControl;

  /// Use this setting to specify the length, in seconds, of each individual CMAF
  /// segment. This value applies to the whole package; that is, to every output
  /// in the output group. Note that segments end on the first keyframe after this
  /// number of seconds, so the actual segment length might be slightly longer. If
  /// you set Segment control (CmafSegmentControl) to single file, the service
  /// puts the content of each output in a single file that has metadata that
  /// marks these segments. If you set it to segmented files, the service creates
  /// multiple files for each output, each with the content of one segment.
  final int? segmentLength;

  /// Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of
  /// variant manifest.
  final CmafStreamInfResolution? streamInfResolution;

  /// When set to ENABLED, a DASH MPD manifest will be generated for this output.
  final CmafWriteDASHManifest? writeDashManifest;

  /// When set to ENABLED, an Apple HLS manifest will be generated for this
  /// output.
  final CmafWriteHLSManifest? writeHlsManifest;

  /// When you enable Precise segment duration in DASH manifests
  /// (writeSegmentTimelineInRepresentation), your DASH manifest shows precise
  /// segment durations. The segment duration information appears inside the
  /// SegmentTimeline element, inside SegmentTemplate at the Representation level.
  /// When this feature isn't enabled, the segment durations in your DASH manifest
  /// are approximate. The segment duration information appears in the duration
  /// attribute of the SegmentTemplate element.
  final CmafWriteSegmentTimelineInRepresentation?
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
  factory CmafGroupSettings.fromJson(Map<String, dynamic> json) {
    return CmafGroupSettings(
      additionalManifests: (json['additionalManifests'] as List?)
          ?.whereNotNull()
          .map(
              (e) => CmafAdditionalManifest.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseUrl: json['baseUrl'] as String?,
      clientCache: (json['clientCache'] as String?)?.toCmafClientCache(),
      codecSpecification:
          (json['codecSpecification'] as String?)?.toCmafCodecSpecification(),
      destination: json['destination'] as String?,
      destinationSettings: json['destinationSettings'] != null
          ? DestinationSettings.fromJson(
              json['destinationSettings'] as Map<String, dynamic>)
          : null,
      encryption: json['encryption'] != null
          ? CmafEncryptionSettings.fromJson(
              json['encryption'] as Map<String, dynamic>)
          : null,
      fragmentLength: json['fragmentLength'] as int?,
      manifestCompression:
          (json['manifestCompression'] as String?)?.toCmafManifestCompression(),
      manifestDurationFormat: (json['manifestDurationFormat'] as String?)
          ?.toCmafManifestDurationFormat(),
      minBufferTime: json['minBufferTime'] as int?,
      minFinalSegmentLength: json['minFinalSegmentLength'] as double?,
      mpdProfile: (json['mpdProfile'] as String?)?.toCmafMpdProfile(),
      segmentControl:
          (json['segmentControl'] as String?)?.toCmafSegmentControl(),
      segmentLength: json['segmentLength'] as int?,
      streamInfResolution:
          (json['streamInfResolution'] as String?)?.toCmafStreamInfResolution(),
      writeDashManifest:
          (json['writeDashManifest'] as String?)?.toCmafWriteDASHManifest(),
      writeHlsManifest:
          (json['writeHlsManifest'] as String?)?.toCmafWriteHLSManifest(),
      writeSegmentTimelineInRepresentation:
          (json['writeSegmentTimelineInRepresentation'] as String?)
              ?.toCmafWriteSegmentTimelineInRepresentation(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalManifests = this.additionalManifests;
    final baseUrl = this.baseUrl;
    final clientCache = this.clientCache;
    final codecSpecification = this.codecSpecification;
    final destination = this.destination;
    final destinationSettings = this.destinationSettings;
    final encryption = this.encryption;
    final fragmentLength = this.fragmentLength;
    final manifestCompression = this.manifestCompression;
    final manifestDurationFormat = this.manifestDurationFormat;
    final minBufferTime = this.minBufferTime;
    final minFinalSegmentLength = this.minFinalSegmentLength;
    final mpdProfile = this.mpdProfile;
    final segmentControl = this.segmentControl;
    final segmentLength = this.segmentLength;
    final streamInfResolution = this.streamInfResolution;
    final writeDashManifest = this.writeDashManifest;
    final writeHlsManifest = this.writeHlsManifest;
    final writeSegmentTimelineInRepresentation =
        this.writeSegmentTimelineInRepresentation;
    return {
      if (additionalManifests != null)
        'additionalManifests': additionalManifests,
      if (baseUrl != null) 'baseUrl': baseUrl,
      if (clientCache != null) 'clientCache': clientCache.toValue(),
      if (codecSpecification != null)
        'codecSpecification': codecSpecification.toValue(),
      if (destination != null) 'destination': destination,
      if (destinationSettings != null)
        'destinationSettings': destinationSettings,
      if (encryption != null) 'encryption': encryption,
      if (fragmentLength != null) 'fragmentLength': fragmentLength,
      if (manifestCompression != null)
        'manifestCompression': manifestCompression.toValue(),
      if (manifestDurationFormat != null)
        'manifestDurationFormat': manifestDurationFormat.toValue(),
      if (minBufferTime != null) 'minBufferTime': minBufferTime,
      if (minFinalSegmentLength != null)
        'minFinalSegmentLength': minFinalSegmentLength,
      if (mpdProfile != null) 'mpdProfile': mpdProfile.toValue(),
      if (segmentControl != null) 'segmentControl': segmentControl.toValue(),
      if (segmentLength != null) 'segmentLength': segmentLength,
      if (streamInfResolution != null)
        'streamInfResolution': streamInfResolution.toValue(),
      if (writeDashManifest != null)
        'writeDashManifest': writeDashManifest.toValue(),
      if (writeHlsManifest != null)
        'writeHlsManifest': writeHlsManifest.toValue(),
      if (writeSegmentTimelineInRepresentation != null)
        'writeSegmentTimelineInRepresentation':
            writeSegmentTimelineInRepresentation.toValue(),
    };
  }
}

/// When you use DRM with CMAF outputs, choose whether the service writes the
/// 128-bit encryption initialization vector in the HLS and DASH manifests.
enum CmafInitializationVectorInManifest {
  include,
  exclude,
}

extension on CmafInitializationVectorInManifest {
  String toValue() {
    switch (this) {
      case CmafInitializationVectorInManifest.include:
        return 'INCLUDE';
      case CmafInitializationVectorInManifest.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  CmafInitializationVectorInManifest toCmafInitializationVectorInManifest() {
    switch (this) {
      case 'INCLUDE':
        return CmafInitializationVectorInManifest.include;
      case 'EXCLUDE':
        return CmafInitializationVectorInManifest.exclude;
    }
    throw Exception(
        '$this is not known in enum CmafInitializationVectorInManifest');
  }
}

/// Specify whether your DRM encryption key is static or from a key provider
/// that follows the SPEKE standard. For more information about SPEKE, see
/// https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
enum CmafKeyProviderType {
  speke,
  staticKey,
}

extension on CmafKeyProviderType {
  String toValue() {
    switch (this) {
      case CmafKeyProviderType.speke:
        return 'SPEKE';
      case CmafKeyProviderType.staticKey:
        return 'STATIC_KEY';
    }
  }
}

extension on String {
  CmafKeyProviderType toCmafKeyProviderType() {
    switch (this) {
      case 'SPEKE':
        return CmafKeyProviderType.speke;
      case 'STATIC_KEY':
        return CmafKeyProviderType.staticKey;
    }
    throw Exception('$this is not known in enum CmafKeyProviderType');
  }
}

/// When set to GZIP, compresses HLS playlist.
enum CmafManifestCompression {
  gzip,
  none,
}

extension on CmafManifestCompression {
  String toValue() {
    switch (this) {
      case CmafManifestCompression.gzip:
        return 'GZIP';
      case CmafManifestCompression.none:
        return 'NONE';
    }
  }
}

extension on String {
  CmafManifestCompression toCmafManifestCompression() {
    switch (this) {
      case 'GZIP':
        return CmafManifestCompression.gzip;
      case 'NONE':
        return CmafManifestCompression.none;
    }
    throw Exception('$this is not known in enum CmafManifestCompression');
  }
}

/// Indicates whether the output manifest should use floating point values for
/// segment duration.
enum CmafManifestDurationFormat {
  floatingPoint,
  integer,
}

extension on CmafManifestDurationFormat {
  String toValue() {
    switch (this) {
      case CmafManifestDurationFormat.floatingPoint:
        return 'FLOATING_POINT';
      case CmafManifestDurationFormat.integer:
        return 'INTEGER';
    }
  }
}

extension on String {
  CmafManifestDurationFormat toCmafManifestDurationFormat() {
    switch (this) {
      case 'FLOATING_POINT':
        return CmafManifestDurationFormat.floatingPoint;
      case 'INTEGER':
        return CmafManifestDurationFormat.integer;
    }
    throw Exception('$this is not known in enum CmafManifestDurationFormat');
  }
}

/// Specify whether your DASH profile is on-demand or main. When you choose Main
/// profile (MAIN_PROFILE), the service signals
/// urn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you
/// choose On-demand (ON_DEMAND_PROFILE), the service signals
/// urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose
/// On-demand, you must also set the output group setting Segment control
/// (SegmentControl) to Single file (SINGLE_FILE).
enum CmafMpdProfile {
  mainProfile,
  onDemandProfile,
}

extension on CmafMpdProfile {
  String toValue() {
    switch (this) {
      case CmafMpdProfile.mainProfile:
        return 'MAIN_PROFILE';
      case CmafMpdProfile.onDemandProfile:
        return 'ON_DEMAND_PROFILE';
    }
  }
}

extension on String {
  CmafMpdProfile toCmafMpdProfile() {
    switch (this) {
      case 'MAIN_PROFILE':
        return CmafMpdProfile.mainProfile;
      case 'ON_DEMAND_PROFILE':
        return CmafMpdProfile.onDemandProfile;
    }
    throw Exception('$this is not known in enum CmafMpdProfile');
  }
}

/// When set to SINGLE_FILE, a single output file is generated, which is
/// internally segmented using the Fragment Length and Segment Length. When set
/// to SEGMENTED_FILES, separate segment files will be created.
enum CmafSegmentControl {
  singleFile,
  segmentedFiles,
}

extension on CmafSegmentControl {
  String toValue() {
    switch (this) {
      case CmafSegmentControl.singleFile:
        return 'SINGLE_FILE';
      case CmafSegmentControl.segmentedFiles:
        return 'SEGMENTED_FILES';
    }
  }
}

extension on String {
  CmafSegmentControl toCmafSegmentControl() {
    switch (this) {
      case 'SINGLE_FILE':
        return CmafSegmentControl.singleFile;
      case 'SEGMENTED_FILES':
        return CmafSegmentControl.segmentedFiles;
    }
    throw Exception('$this is not known in enum CmafSegmentControl');
  }
}

/// Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of
/// variant manifest.
enum CmafStreamInfResolution {
  include,
  exclude,
}

extension on CmafStreamInfResolution {
  String toValue() {
    switch (this) {
      case CmafStreamInfResolution.include:
        return 'INCLUDE';
      case CmafStreamInfResolution.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  CmafStreamInfResolution toCmafStreamInfResolution() {
    switch (this) {
      case 'INCLUDE':
        return CmafStreamInfResolution.include;
      case 'EXCLUDE':
        return CmafStreamInfResolution.exclude;
    }
    throw Exception('$this is not known in enum CmafStreamInfResolution');
  }
}

/// When set to ENABLED, a DASH MPD manifest will be generated for this output.
enum CmafWriteDASHManifest {
  disabled,
  enabled,
}

extension on CmafWriteDASHManifest {
  String toValue() {
    switch (this) {
      case CmafWriteDASHManifest.disabled:
        return 'DISABLED';
      case CmafWriteDASHManifest.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  CmafWriteDASHManifest toCmafWriteDASHManifest() {
    switch (this) {
      case 'DISABLED':
        return CmafWriteDASHManifest.disabled;
      case 'ENABLED':
        return CmafWriteDASHManifest.enabled;
    }
    throw Exception('$this is not known in enum CmafWriteDASHManifest');
  }
}

/// When set to ENABLED, an Apple HLS manifest will be generated for this
/// output.
enum CmafWriteHLSManifest {
  disabled,
  enabled,
}

extension on CmafWriteHLSManifest {
  String toValue() {
    switch (this) {
      case CmafWriteHLSManifest.disabled:
        return 'DISABLED';
      case CmafWriteHLSManifest.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  CmafWriteHLSManifest toCmafWriteHLSManifest() {
    switch (this) {
      case 'DISABLED':
        return CmafWriteHLSManifest.disabled;
      case 'ENABLED':
        return CmafWriteHLSManifest.enabled;
    }
    throw Exception('$this is not known in enum CmafWriteHLSManifest');
  }
}

/// When you enable Precise segment duration in DASH manifests
/// (writeSegmentTimelineInRepresentation), your DASH manifest shows precise
/// segment durations. The segment duration information appears inside the
/// SegmentTimeline element, inside SegmentTemplate at the Representation level.
/// When this feature isn't enabled, the segment durations in your DASH manifest
/// are approximate. The segment duration information appears in the duration
/// attribute of the SegmentTemplate element.
enum CmafWriteSegmentTimelineInRepresentation {
  enabled,
  disabled,
}

extension on CmafWriteSegmentTimelineInRepresentation {
  String toValue() {
    switch (this) {
      case CmafWriteSegmentTimelineInRepresentation.enabled:
        return 'ENABLED';
      case CmafWriteSegmentTimelineInRepresentation.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  CmafWriteSegmentTimelineInRepresentation
      toCmafWriteSegmentTimelineInRepresentation() {
    switch (this) {
      case 'ENABLED':
        return CmafWriteSegmentTimelineInRepresentation.enabled;
      case 'DISABLED':
        return CmafWriteSegmentTimelineInRepresentation.disabled;
    }
    throw Exception(
        '$this is not known in enum CmafWriteSegmentTimelineInRepresentation');
  }
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
  defaultCodecDuration,
  matchVideoDuration,
}

extension on CmfcAudioDuration {
  String toValue() {
    switch (this) {
      case CmfcAudioDuration.defaultCodecDuration:
        return 'DEFAULT_CODEC_DURATION';
      case CmfcAudioDuration.matchVideoDuration:
        return 'MATCH_VIDEO_DURATION';
    }
  }
}

extension on String {
  CmfcAudioDuration toCmfcAudioDuration() {
    switch (this) {
      case 'DEFAULT_CODEC_DURATION':
        return CmfcAudioDuration.defaultCodecDuration;
      case 'MATCH_VIDEO_DURATION':
        return CmfcAudioDuration.matchVideoDuration;
    }
    throw Exception('$this is not known in enum CmfcAudioDuration');
  }
}

/// Use this setting only when you specify SCTE-35 markers from ESAM. Choose
/// INSERT to put SCTE-35 markers in this output at the insertion points that
/// you specify in an ESAM XML document. Provide the document in the setting SCC
/// XML (sccXml).
enum CmfcScte35Esam {
  insert,
  none,
}

extension on CmfcScte35Esam {
  String toValue() {
    switch (this) {
      case CmfcScte35Esam.insert:
        return 'INSERT';
      case CmfcScte35Esam.none:
        return 'NONE';
    }
  }
}

extension on String {
  CmfcScte35Esam toCmfcScte35Esam() {
    switch (this) {
      case 'INSERT':
        return CmfcScte35Esam.insert;
      case 'NONE':
        return CmfcScte35Esam.none;
    }
    throw Exception('$this is not known in enum CmfcScte35Esam');
  }
}

/// Ignore this setting unless you have SCTE-35 markers in your input video
/// file. Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that
/// appear in your input to also appear in this output. Choose None (NONE) if
/// you don't want those SCTE-35 markers in this output.
enum CmfcScte35Source {
  passthrough,
  none,
}

extension on CmfcScte35Source {
  String toValue() {
    switch (this) {
      case CmfcScte35Source.passthrough:
        return 'PASSTHROUGH';
      case CmfcScte35Source.none:
        return 'NONE';
    }
  }
}

extension on String {
  CmfcScte35Source toCmfcScte35Source() {
    switch (this) {
      case 'PASSTHROUGH':
        return CmfcScte35Source.passthrough;
      case 'NONE':
        return CmfcScte35Source.none;
    }
    throw Exception('$this is not known in enum CmfcScte35Source');
  }
}

/// Settings for MP4 segments in CMAF
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
  final CmfcAudioDuration? audioDuration;

  /// Use this setting only when you specify SCTE-35 markers from ESAM. Choose
  /// INSERT to put SCTE-35 markers in this output at the insertion points that
  /// you specify in an ESAM XML document. Provide the document in the setting SCC
  /// XML (sccXml).
  final CmfcScte35Esam? scte35Esam;

  /// Ignore this setting unless you have SCTE-35 markers in your input video
  /// file. Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that
  /// appear in your input to also appear in this output. Choose None (NONE) if
  /// you don't want those SCTE-35 markers in this output.
  final CmfcScte35Source? scte35Source;

  CmfcSettings({
    this.audioDuration,
    this.scte35Esam,
    this.scte35Source,
  });
  factory CmfcSettings.fromJson(Map<String, dynamic> json) {
    return CmfcSettings(
      audioDuration: (json['audioDuration'] as String?)?.toCmfcAudioDuration(),
      scte35Esam: (json['scte35Esam'] as String?)?.toCmfcScte35Esam(),
      scte35Source: (json['scte35Source'] as String?)?.toCmfcScte35Source(),
    );
  }

  Map<String, dynamic> toJson() {
    final audioDuration = this.audioDuration;
    final scte35Esam = this.scte35Esam;
    final scte35Source = this.scte35Source;
    return {
      if (audioDuration != null) 'audioDuration': audioDuration.toValue(),
      if (scte35Esam != null) 'scte35Esam': scte35Esam.toValue(),
      if (scte35Source != null) 'scte35Source': scte35Source.toValue(),
    };
  }
}

/// Settings for color correction.
class ColorCorrector {
  /// Brightness level.
  final int? brightness;

  /// Specify the color space you want for this output. The service supports
  /// conversion between HDR formats, between SDR formats, from SDR to HDR, and
  /// from HDR to SDR. SDR to HDR conversion doesn't upgrade the dynamic range.
  /// The converted video has an HDR format, but visually appears the same as an
  /// unconverted output. HDR to SDR conversion uses Elemental tone mapping
  /// technology to approximate the outcome of manually regrading from HDR to SDR.
  final ColorSpaceConversion? colorSpaceConversion;

  /// Contrast level.
  final int? contrast;

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
  final Hdr10Metadata? hdr10Metadata;

  /// Hue in degrees.
  final int? hue;

  /// Saturation level.
  final int? saturation;

  ColorCorrector({
    this.brightness,
    this.colorSpaceConversion,
    this.contrast,
    this.hdr10Metadata,
    this.hue,
    this.saturation,
  });
  factory ColorCorrector.fromJson(Map<String, dynamic> json) {
    return ColorCorrector(
      brightness: json['brightness'] as int?,
      colorSpaceConversion:
          (json['colorSpaceConversion'] as String?)?.toColorSpaceConversion(),
      contrast: json['contrast'] as int?,
      hdr10Metadata: json['hdr10Metadata'] != null
          ? Hdr10Metadata.fromJson(
              json['hdr10Metadata'] as Map<String, dynamic>)
          : null,
      hue: json['hue'] as int?,
      saturation: json['saturation'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final brightness = this.brightness;
    final colorSpaceConversion = this.colorSpaceConversion;
    final contrast = this.contrast;
    final hdr10Metadata = this.hdr10Metadata;
    final hue = this.hue;
    final saturation = this.saturation;
    return {
      if (brightness != null) 'brightness': brightness,
      if (colorSpaceConversion != null)
        'colorSpaceConversion': colorSpaceConversion.toValue(),
      if (contrast != null) 'contrast': contrast,
      if (hdr10Metadata != null) 'hdr10Metadata': hdr10Metadata,
      if (hue != null) 'hue': hue,
      if (saturation != null) 'saturation': saturation,
    };
  }
}

/// Choose Insert (INSERT) for this setting to include color metadata in this
/// output. Choose Ignore (IGNORE) to exclude color metadata from this output.
/// If you don't specify a value, the service sets this to Insert by default.
enum ColorMetadata {
  ignore,
  insert,
}

extension on ColorMetadata {
  String toValue() {
    switch (this) {
      case ColorMetadata.ignore:
        return 'IGNORE';
      case ColorMetadata.insert:
        return 'INSERT';
    }
  }
}

extension on String {
  ColorMetadata toColorMetadata() {
    switch (this) {
      case 'IGNORE':
        return ColorMetadata.ignore;
      case 'INSERT':
        return ColorMetadata.insert;
    }
    throw Exception('$this is not known in enum ColorMetadata');
  }
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
  follow,
  rec_601,
  rec_709,
  hdr10,
  hlg_2020,
}

extension on ColorSpace {
  String toValue() {
    switch (this) {
      case ColorSpace.follow:
        return 'FOLLOW';
      case ColorSpace.rec_601:
        return 'REC_601';
      case ColorSpace.rec_709:
        return 'REC_709';
      case ColorSpace.hdr10:
        return 'HDR10';
      case ColorSpace.hlg_2020:
        return 'HLG_2020';
    }
  }
}

extension on String {
  ColorSpace toColorSpace() {
    switch (this) {
      case 'FOLLOW':
        return ColorSpace.follow;
      case 'REC_601':
        return ColorSpace.rec_601;
      case 'REC_709':
        return ColorSpace.rec_709;
      case 'HDR10':
        return ColorSpace.hdr10;
      case 'HLG_2020':
        return ColorSpace.hlg_2020;
    }
    throw Exception('$this is not known in enum ColorSpace');
  }
}

/// Specify the color space you want for this output. The service supports
/// conversion between HDR formats, between SDR formats, from SDR to HDR, and
/// from HDR to SDR. SDR to HDR conversion doesn't upgrade the dynamic range.
/// The converted video has an HDR format, but visually appears the same as an
/// unconverted output. HDR to SDR conversion uses Elemental tone mapping
/// technology to approximate the outcome of manually regrading from HDR to SDR.
enum ColorSpaceConversion {
  none,
  force_601,
  force_709,
  forceHdr10,
  forceHlg_2020,
}

extension on ColorSpaceConversion {
  String toValue() {
    switch (this) {
      case ColorSpaceConversion.none:
        return 'NONE';
      case ColorSpaceConversion.force_601:
        return 'FORCE_601';
      case ColorSpaceConversion.force_709:
        return 'FORCE_709';
      case ColorSpaceConversion.forceHdr10:
        return 'FORCE_HDR10';
      case ColorSpaceConversion.forceHlg_2020:
        return 'FORCE_HLG_2020';
    }
  }
}

extension on String {
  ColorSpaceConversion toColorSpaceConversion() {
    switch (this) {
      case 'NONE':
        return ColorSpaceConversion.none;
      case 'FORCE_601':
        return ColorSpaceConversion.force_601;
      case 'FORCE_709':
        return ColorSpaceConversion.force_709;
      case 'FORCE_HDR10':
        return ColorSpaceConversion.forceHdr10;
      case 'FORCE_HLG_2020':
        return ColorSpaceConversion.forceHlg_2020;
    }
    throw Exception('$this is not known in enum ColorSpaceConversion');
  }
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
  force,
  fallback,
}

extension on ColorSpaceUsage {
  String toValue() {
    switch (this) {
      case ColorSpaceUsage.force:
        return 'FORCE';
      case ColorSpaceUsage.fallback:
        return 'FALLBACK';
    }
  }
}

extension on String {
  ColorSpaceUsage toColorSpaceUsage() {
    switch (this) {
      case 'FORCE':
        return ColorSpaceUsage.force;
      case 'FALLBACK':
        return ColorSpaceUsage.fallback;
    }
    throw Exception('$this is not known in enum ColorSpaceUsage');
  }
}

/// The length of the term of your reserved queue pricing plan commitment.
enum Commitment {
  oneYear,
}

extension on Commitment {
  String toValue() {
    switch (this) {
      case Commitment.oneYear:
        return 'ONE_YEAR';
    }
  }
}

extension on String {
  Commitment toCommitment() {
    switch (this) {
      case 'ONE_YEAR':
        return Commitment.oneYear;
    }
    throw Exception('$this is not known in enum Commitment');
  }
}

/// Container specific settings.
class ContainerSettings {
  /// Settings for MP4 segments in CMAF
  final CmfcSettings? cmfcSettings;

  /// Container for this output. Some containers require a container settings
  /// object. If not specified, the default object will be created.
  final ContainerType? container;

  /// Settings for F4v container
  final F4vSettings? f4vSettings;

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
  final M2tsSettings? m2tsSettings;

  /// Settings for TS segments in HLS
  final M3u8Settings? m3u8Settings;

  /// Settings for MOV Container.
  final MovSettings? movSettings;

  /// Settings for MP4 container. You can create audio-only AAC outputs with this
  /// container.
  final Mp4Settings? mp4Settings;

  /// Settings for MP4 segments in DASH
  final MpdSettings? mpdSettings;

  /// MXF settings
  final MxfSettings? mxfSettings;

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
  factory ContainerSettings.fromJson(Map<String, dynamic> json) {
    return ContainerSettings(
      cmfcSettings: json['cmfcSettings'] != null
          ? CmfcSettings.fromJson(json['cmfcSettings'] as Map<String, dynamic>)
          : null,
      container: (json['container'] as String?)?.toContainerType(),
      f4vSettings: json['f4vSettings'] != null
          ? F4vSettings.fromJson(json['f4vSettings'] as Map<String, dynamic>)
          : null,
      m2tsSettings: json['m2tsSettings'] != null
          ? M2tsSettings.fromJson(json['m2tsSettings'] as Map<String, dynamic>)
          : null,
      m3u8Settings: json['m3u8Settings'] != null
          ? M3u8Settings.fromJson(json['m3u8Settings'] as Map<String, dynamic>)
          : null,
      movSettings: json['movSettings'] != null
          ? MovSettings.fromJson(json['movSettings'] as Map<String, dynamic>)
          : null,
      mp4Settings: json['mp4Settings'] != null
          ? Mp4Settings.fromJson(json['mp4Settings'] as Map<String, dynamic>)
          : null,
      mpdSettings: json['mpdSettings'] != null
          ? MpdSettings.fromJson(json['mpdSettings'] as Map<String, dynamic>)
          : null,
      mxfSettings: json['mxfSettings'] != null
          ? MxfSettings.fromJson(json['mxfSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cmfcSettings = this.cmfcSettings;
    final container = this.container;
    final f4vSettings = this.f4vSettings;
    final m2tsSettings = this.m2tsSettings;
    final m3u8Settings = this.m3u8Settings;
    final movSettings = this.movSettings;
    final mp4Settings = this.mp4Settings;
    final mpdSettings = this.mpdSettings;
    final mxfSettings = this.mxfSettings;
    return {
      if (cmfcSettings != null) 'cmfcSettings': cmfcSettings,
      if (container != null) 'container': container.toValue(),
      if (f4vSettings != null) 'f4vSettings': f4vSettings,
      if (m2tsSettings != null) 'm2tsSettings': m2tsSettings,
      if (m3u8Settings != null) 'm3u8Settings': m3u8Settings,
      if (movSettings != null) 'movSettings': movSettings,
      if (mp4Settings != null) 'mp4Settings': mp4Settings,
      if (mpdSettings != null) 'mpdSettings': mpdSettings,
      if (mxfSettings != null) 'mxfSettings': mxfSettings,
    };
  }
}

/// Container for this output. Some containers require a container settings
/// object. If not specified, the default object will be created.
enum ContainerType {
  f4v,
  ismv,
  m2ts,
  m3u8,
  cmfc,
  mov,
  mp4,
  mpd,
  mxf,
  webm,
  raw,
}

extension on ContainerType {
  String toValue() {
    switch (this) {
      case ContainerType.f4v:
        return 'F4V';
      case ContainerType.ismv:
        return 'ISMV';
      case ContainerType.m2ts:
        return 'M2TS';
      case ContainerType.m3u8:
        return 'M3U8';
      case ContainerType.cmfc:
        return 'CMFC';
      case ContainerType.mov:
        return 'MOV';
      case ContainerType.mp4:
        return 'MP4';
      case ContainerType.mpd:
        return 'MPD';
      case ContainerType.mxf:
        return 'MXF';
      case ContainerType.webm:
        return 'WEBM';
      case ContainerType.raw:
        return 'RAW';
    }
  }
}

extension on String {
  ContainerType toContainerType() {
    switch (this) {
      case 'F4V':
        return ContainerType.f4v;
      case 'ISMV':
        return ContainerType.ismv;
      case 'M2TS':
        return ContainerType.m2ts;
      case 'M3U8':
        return ContainerType.m3u8;
      case 'CMFC':
        return ContainerType.cmfc;
      case 'MOV':
        return ContainerType.mov;
      case 'MP4':
        return ContainerType.mp4;
      case 'MPD':
        return ContainerType.mpd;
      case 'MXF':
        return ContainerType.mxf;
      case 'WEBM':
        return ContainerType.webm;
      case 'RAW':
        return ContainerType.raw;
    }
    throw Exception('$this is not known in enum ContainerType');
  }
}

class CreateJobResponse {
  /// Each job converts an input file into an output file or files. For more
  /// information, see the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  final Job? job;

  CreateJobResponse({
    this.job,
  });
  factory CreateJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobResponse(
      job: json['job'] != null
          ? Job.fromJson(json['job'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateJobTemplateResponse {
  /// A job template is a pre-made set of encoding instructions that you can use
  /// to quickly create a job.
  final JobTemplate? jobTemplate;

  CreateJobTemplateResponse({
    this.jobTemplate,
  });
  factory CreateJobTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobTemplateResponse(
      jobTemplate: json['jobTemplate'] != null
          ? JobTemplate.fromJson(json['jobTemplate'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreatePresetResponse {
  /// A preset is a collection of preconfigured media conversion settings that you
  /// want MediaConvert to apply to the output during the conversion process.
  final Preset? preset;

  CreatePresetResponse({
    this.preset,
  });
  factory CreatePresetResponse.fromJson(Map<String, dynamic> json) {
    return CreatePresetResponse(
      preset: json['preset'] != null
          ? Preset.fromJson(json['preset'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateQueueResponse {
  /// You can use queues to manage the resources that are available to your AWS
  /// account for running multiple transcoding jobs at the same time. If you don't
  /// specify a queue, the service sends all jobs through the default queue. For
  /// more information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
  final Queue? queue;

  CreateQueueResponse({
    this.queue,
  });
  factory CreateQueueResponse.fromJson(Map<String, dynamic> json) {
    return CreateQueueResponse(
      queue: json['queue'] != null
          ? Queue.fromJson(json['queue'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Specify the details for each additional DASH manifest that you want the
/// service to generate for this output group. Each manifest can reference a
/// different subset of outputs in the group.
class DashAdditionalManifest {
  /// Specify a name modifier that the service adds to the name of this manifest
  /// to make it different from the file names of the other main manifests in the
  /// output group. For example, say that the default main manifest for your DASH
  /// group is film-name.mpd. If you enter "-no-premium" for this setting, then
  /// the file name the service generates for this top-level manifest is
  /// film-name-no-premium.mpd.
  final String? manifestNameModifier;

  /// Specify the outputs that you want this additional top-level manifest to
  /// reference.
  final List<String>? selectedOutputs;

  DashAdditionalManifest({
    this.manifestNameModifier,
    this.selectedOutputs,
  });
  factory DashAdditionalManifest.fromJson(Map<String, dynamic> json) {
    return DashAdditionalManifest(
      manifestNameModifier: json['manifestNameModifier'] as String?,
      selectedOutputs: (json['selectedOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final manifestNameModifier = this.manifestNameModifier;
    final selectedOutputs = this.selectedOutputs;
    return {
      if (manifestNameModifier != null)
        'manifestNameModifier': manifestNameModifier,
      if (selectedOutputs != null) 'selectedOutputs': selectedOutputs,
    };
  }
}

/// Specifies DRM settings for DASH outputs.
class DashIsoEncryptionSettings {
  /// This setting can improve the compatibility of your output with video players
  /// on obsolete devices. It applies only to DASH H.264 outputs with DRM
  /// encryption. Choose Unencrypted SEI (UNENCRYPTED_SEI) only to correct
  /// problems with playback on older devices. Otherwise, keep the default setting
  /// CENC v1 (CENC_V1). If you choose Unencrypted SEI, for that output, the
  /// service will exclude the access unit delimiter and will leave the SEI NAL
  /// units unencrypted.
  final DashIsoPlaybackDeviceCompatibility? playbackDeviceCompatibility;

  /// If your output group type is HLS, DASH, or Microsoft Smooth, use these
  /// settings when doing DRM encryption with a SPEKE-compliant key provider.  If
  /// your output group type is CMAF, use the SpekeKeyProviderCmaf settings
  /// instead.
  final SpekeKeyProvider? spekeKeyProvider;

  DashIsoEncryptionSettings({
    this.playbackDeviceCompatibility,
    this.spekeKeyProvider,
  });
  factory DashIsoEncryptionSettings.fromJson(Map<String, dynamic> json) {
    return DashIsoEncryptionSettings(
      playbackDeviceCompatibility:
          (json['playbackDeviceCompatibility'] as String?)
              ?.toDashIsoPlaybackDeviceCompatibility(),
      spekeKeyProvider: json['spekeKeyProvider'] != null
          ? SpekeKeyProvider.fromJson(
              json['spekeKeyProvider'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final playbackDeviceCompatibility = this.playbackDeviceCompatibility;
    final spekeKeyProvider = this.spekeKeyProvider;
    return {
      if (playbackDeviceCompatibility != null)
        'playbackDeviceCompatibility': playbackDeviceCompatibility.toValue(),
      if (spekeKeyProvider != null) 'spekeKeyProvider': spekeKeyProvider,
    };
  }
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// DASH_ISO_GROUP_SETTINGS.
class DashIsoGroupSettings {
  /// By default, the service creates one .mpd DASH manifest for each DASH ISO
  /// output group in your job. This default manifest references every output in
  /// the output group. To create additional DASH manifests that reference a
  /// subset of the outputs in the output group, specify a list of them here.
  final List<DashAdditionalManifest>? additionalManifests;

  /// A partial URI prefix that will be put in the manifest (.mpd) file at the top
  /// level BaseURL element. Can be used if streams are delivered from a different
  /// URL than the manifest file.
  final String? baseUrl;

  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do not
  /// specify the base filename in the URI, the service will use the filename of
  /// the input file. If your job has multiple inputs, the service uses the
  /// filename of the first input file.
  final String? destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  final DestinationSettings? destinationSettings;

  /// DRM settings.
  final DashIsoEncryptionSettings? encryption;

  /// Length of fragments to generate (in seconds). Fragment length must be
  /// compatible with GOP size and Framerate. Note that fragments will end on the
  /// next keyframe after this number of seconds, so actual fragment length may be
  /// longer. When Emit Single File is checked, the fragmentation is internal to a
  /// single output file and it does not cause the creation of many output files
  /// as in other output types.
  final int? fragmentLength;

  /// Supports HbbTV specification as indicated
  final DashIsoHbbtvCompliance? hbbtvCompliance;

  /// Minimum time of initially buffered media that is needed to ensure smooth
  /// playout.
  final int? minBufferTime;

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
  final double? minFinalSegmentLength;

  /// Specify whether your DASH profile is on-demand or main. When you choose Main
  /// profile (MAIN_PROFILE), the service signals
  /// urn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you
  /// choose On-demand (ON_DEMAND_PROFILE), the service signals
  /// urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose
  /// On-demand, you must also set the output group setting Segment control
  /// (SegmentControl) to Single file (SINGLE_FILE).
  final DashIsoMpdProfile? mpdProfile;

  /// When set to SINGLE_FILE, a single output file is generated, which is
  /// internally segmented using the Fragment Length and Segment Length. When set
  /// to SEGMENTED_FILES, separate segment files will be created.
  final DashIsoSegmentControl? segmentControl;

  /// Length of mpd segments to create (in seconds). Note that segments will end
  /// on the next keyframe after this number of seconds, so actual segment length
  /// may be longer. When Emit Single File is checked, the segmentation is
  /// internal to a single output file and it does not cause the creation of many
  /// output files as in other output types.
  final int? segmentLength;

  /// If you get an HTTP error in the 400 range when you play back your DASH
  /// output, enable this setting and run your transcoding job again. When you
  /// enable this setting, the service writes precise segment durations in the
  /// DASH manifest. The segment duration information appears inside the
  /// SegmentTimeline element, inside SegmentTemplate at the Representation level.
  /// When you don't enable this setting, the service writes approximate segment
  /// durations in your DASH manifest.
  final DashIsoWriteSegmentTimelineInRepresentation?
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
  factory DashIsoGroupSettings.fromJson(Map<String, dynamic> json) {
    return DashIsoGroupSettings(
      additionalManifests: (json['additionalManifests'] as List?)
          ?.whereNotNull()
          .map(
              (e) => DashAdditionalManifest.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseUrl: json['baseUrl'] as String?,
      destination: json['destination'] as String?,
      destinationSettings: json['destinationSettings'] != null
          ? DestinationSettings.fromJson(
              json['destinationSettings'] as Map<String, dynamic>)
          : null,
      encryption: json['encryption'] != null
          ? DashIsoEncryptionSettings.fromJson(
              json['encryption'] as Map<String, dynamic>)
          : null,
      fragmentLength: json['fragmentLength'] as int?,
      hbbtvCompliance:
          (json['hbbtvCompliance'] as String?)?.toDashIsoHbbtvCompliance(),
      minBufferTime: json['minBufferTime'] as int?,
      minFinalSegmentLength: json['minFinalSegmentLength'] as double?,
      mpdProfile: (json['mpdProfile'] as String?)?.toDashIsoMpdProfile(),
      segmentControl:
          (json['segmentControl'] as String?)?.toDashIsoSegmentControl(),
      segmentLength: json['segmentLength'] as int?,
      writeSegmentTimelineInRepresentation:
          (json['writeSegmentTimelineInRepresentation'] as String?)
              ?.toDashIsoWriteSegmentTimelineInRepresentation(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalManifests = this.additionalManifests;
    final baseUrl = this.baseUrl;
    final destination = this.destination;
    final destinationSettings = this.destinationSettings;
    final encryption = this.encryption;
    final fragmentLength = this.fragmentLength;
    final hbbtvCompliance = this.hbbtvCompliance;
    final minBufferTime = this.minBufferTime;
    final minFinalSegmentLength = this.minFinalSegmentLength;
    final mpdProfile = this.mpdProfile;
    final segmentControl = this.segmentControl;
    final segmentLength = this.segmentLength;
    final writeSegmentTimelineInRepresentation =
        this.writeSegmentTimelineInRepresentation;
    return {
      if (additionalManifests != null)
        'additionalManifests': additionalManifests,
      if (baseUrl != null) 'baseUrl': baseUrl,
      if (destination != null) 'destination': destination,
      if (destinationSettings != null)
        'destinationSettings': destinationSettings,
      if (encryption != null) 'encryption': encryption,
      if (fragmentLength != null) 'fragmentLength': fragmentLength,
      if (hbbtvCompliance != null) 'hbbtvCompliance': hbbtvCompliance.toValue(),
      if (minBufferTime != null) 'minBufferTime': minBufferTime,
      if (minFinalSegmentLength != null)
        'minFinalSegmentLength': minFinalSegmentLength,
      if (mpdProfile != null) 'mpdProfile': mpdProfile.toValue(),
      if (segmentControl != null) 'segmentControl': segmentControl.toValue(),
      if (segmentLength != null) 'segmentLength': segmentLength,
      if (writeSegmentTimelineInRepresentation != null)
        'writeSegmentTimelineInRepresentation':
            writeSegmentTimelineInRepresentation.toValue(),
    };
  }
}

/// Supports HbbTV specification as indicated
enum DashIsoHbbtvCompliance {
  hbbtv_1_5,
  none,
}

extension on DashIsoHbbtvCompliance {
  String toValue() {
    switch (this) {
      case DashIsoHbbtvCompliance.hbbtv_1_5:
        return 'HBBTV_1_5';
      case DashIsoHbbtvCompliance.none:
        return 'NONE';
    }
  }
}

extension on String {
  DashIsoHbbtvCompliance toDashIsoHbbtvCompliance() {
    switch (this) {
      case 'HBBTV_1_5':
        return DashIsoHbbtvCompliance.hbbtv_1_5;
      case 'NONE':
        return DashIsoHbbtvCompliance.none;
    }
    throw Exception('$this is not known in enum DashIsoHbbtvCompliance');
  }
}

/// Specify whether your DASH profile is on-demand or main. When you choose Main
/// profile (MAIN_PROFILE), the service signals
/// urn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you
/// choose On-demand (ON_DEMAND_PROFILE), the service signals
/// urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose
/// On-demand, you must also set the output group setting Segment control
/// (SegmentControl) to Single file (SINGLE_FILE).
enum DashIsoMpdProfile {
  mainProfile,
  onDemandProfile,
}

extension on DashIsoMpdProfile {
  String toValue() {
    switch (this) {
      case DashIsoMpdProfile.mainProfile:
        return 'MAIN_PROFILE';
      case DashIsoMpdProfile.onDemandProfile:
        return 'ON_DEMAND_PROFILE';
    }
  }
}

extension on String {
  DashIsoMpdProfile toDashIsoMpdProfile() {
    switch (this) {
      case 'MAIN_PROFILE':
        return DashIsoMpdProfile.mainProfile;
      case 'ON_DEMAND_PROFILE':
        return DashIsoMpdProfile.onDemandProfile;
    }
    throw Exception('$this is not known in enum DashIsoMpdProfile');
  }
}

/// This setting can improve the compatibility of your output with video players
/// on obsolete devices. It applies only to DASH H.264 outputs with DRM
/// encryption. Choose Unencrypted SEI (UNENCRYPTED_SEI) only to correct
/// problems with playback on older devices. Otherwise, keep the default setting
/// CENC v1 (CENC_V1). If you choose Unencrypted SEI, for that output, the
/// service will exclude the access unit delimiter and will leave the SEI NAL
/// units unencrypted.
enum DashIsoPlaybackDeviceCompatibility {
  cencV1,
  unencryptedSei,
}

extension on DashIsoPlaybackDeviceCompatibility {
  String toValue() {
    switch (this) {
      case DashIsoPlaybackDeviceCompatibility.cencV1:
        return 'CENC_V1';
      case DashIsoPlaybackDeviceCompatibility.unencryptedSei:
        return 'UNENCRYPTED_SEI';
    }
  }
}

extension on String {
  DashIsoPlaybackDeviceCompatibility toDashIsoPlaybackDeviceCompatibility() {
    switch (this) {
      case 'CENC_V1':
        return DashIsoPlaybackDeviceCompatibility.cencV1;
      case 'UNENCRYPTED_SEI':
        return DashIsoPlaybackDeviceCompatibility.unencryptedSei;
    }
    throw Exception(
        '$this is not known in enum DashIsoPlaybackDeviceCompatibility');
  }
}

/// When set to SINGLE_FILE, a single output file is generated, which is
/// internally segmented using the Fragment Length and Segment Length. When set
/// to SEGMENTED_FILES, separate segment files will be created.
enum DashIsoSegmentControl {
  singleFile,
  segmentedFiles,
}

extension on DashIsoSegmentControl {
  String toValue() {
    switch (this) {
      case DashIsoSegmentControl.singleFile:
        return 'SINGLE_FILE';
      case DashIsoSegmentControl.segmentedFiles:
        return 'SEGMENTED_FILES';
    }
  }
}

extension on String {
  DashIsoSegmentControl toDashIsoSegmentControl() {
    switch (this) {
      case 'SINGLE_FILE':
        return DashIsoSegmentControl.singleFile;
      case 'SEGMENTED_FILES':
        return DashIsoSegmentControl.segmentedFiles;
    }
    throw Exception('$this is not known in enum DashIsoSegmentControl');
  }
}

/// When you enable Precise segment duration in manifests
/// (writeSegmentTimelineInRepresentation), your DASH manifest shows precise
/// segment durations. The segment duration information appears inside the
/// SegmentTimeline element, inside SegmentTemplate at the Representation level.
/// When this feature isn't enabled, the segment durations in your DASH manifest
/// are approximate. The segment duration information appears in the duration
/// attribute of the SegmentTemplate element.
enum DashIsoWriteSegmentTimelineInRepresentation {
  enabled,
  disabled,
}

extension on DashIsoWriteSegmentTimelineInRepresentation {
  String toValue() {
    switch (this) {
      case DashIsoWriteSegmentTimelineInRepresentation.enabled:
        return 'ENABLED';
      case DashIsoWriteSegmentTimelineInRepresentation.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  DashIsoWriteSegmentTimelineInRepresentation
      toDashIsoWriteSegmentTimelineInRepresentation() {
    switch (this) {
      case 'ENABLED':
        return DashIsoWriteSegmentTimelineInRepresentation.enabled;
      case 'DISABLED':
        return DashIsoWriteSegmentTimelineInRepresentation.disabled;
    }
    throw Exception(
        '$this is not known in enum DashIsoWriteSegmentTimelineInRepresentation');
  }
}

/// Specify the encryption mode that you used to encrypt your input files.
enum DecryptionMode {
  aesCtr,
  aesCbc,
  aesGcm,
}

extension on DecryptionMode {
  String toValue() {
    switch (this) {
      case DecryptionMode.aesCtr:
        return 'AES_CTR';
      case DecryptionMode.aesCbc:
        return 'AES_CBC';
      case DecryptionMode.aesGcm:
        return 'AES_GCM';
    }
  }
}

extension on String {
  DecryptionMode toDecryptionMode() {
    switch (this) {
      case 'AES_CTR':
        return DecryptionMode.aesCtr;
      case 'AES_CBC':
        return DecryptionMode.aesCbc;
      case 'AES_GCM':
        return DecryptionMode.aesGcm;
    }
    throw Exception('$this is not known in enum DecryptionMode');
  }
}

/// Only applies when you set Deinterlacer (DeinterlaceMode) to Deinterlace
/// (DEINTERLACE) or Adaptive (ADAPTIVE). Motion adaptive interpolate
/// (INTERPOLATE) produces sharper pictures, while blend (BLEND) produces
/// smoother motion. Use (INTERPOLATE_TICKER) OR (BLEND_TICKER) if your source
/// file includes a ticker, such as a scrolling headline at the bottom of the
/// frame.
enum DeinterlaceAlgorithm {
  interpolate,
  interpolateTicker,
  blend,
  blendTicker,
}

extension on DeinterlaceAlgorithm {
  String toValue() {
    switch (this) {
      case DeinterlaceAlgorithm.interpolate:
        return 'INTERPOLATE';
      case DeinterlaceAlgorithm.interpolateTicker:
        return 'INTERPOLATE_TICKER';
      case DeinterlaceAlgorithm.blend:
        return 'BLEND';
      case DeinterlaceAlgorithm.blendTicker:
        return 'BLEND_TICKER';
    }
  }
}

extension on String {
  DeinterlaceAlgorithm toDeinterlaceAlgorithm() {
    switch (this) {
      case 'INTERPOLATE':
        return DeinterlaceAlgorithm.interpolate;
      case 'INTERPOLATE_TICKER':
        return DeinterlaceAlgorithm.interpolateTicker;
      case 'BLEND':
        return DeinterlaceAlgorithm.blend;
      case 'BLEND_TICKER':
        return DeinterlaceAlgorithm.blendTicker;
    }
    throw Exception('$this is not known in enum DeinterlaceAlgorithm');
  }
}

/// Settings for deinterlacer
class Deinterlacer {
  /// Only applies when you set Deinterlacer (DeinterlaceMode) to Deinterlace
  /// (DEINTERLACE) or Adaptive (ADAPTIVE). Motion adaptive interpolate
  /// (INTERPOLATE) produces sharper pictures, while blend (BLEND) produces
  /// smoother motion. Use (INTERPOLATE_TICKER) OR (BLEND_TICKER) if your source
  /// file includes a ticker, such as a scrolling headline at the bottom of the
  /// frame.
  final DeinterlaceAlgorithm? algorithm;

  /// - When set to NORMAL (default), the deinterlacer does not convert frames
  /// that are tagged  in metadata as progressive. It will only convert those that
  /// are tagged as some other type. - When set to FORCE_ALL_FRAMES, the
  /// deinterlacer converts every frame to progressive - even those that are
  /// already tagged as progressive. Turn Force mode on only if there is  a good
  /// chance that the metadata has tagged frames as progressive when they are not
  /// progressive. Do not turn on otherwise; processing frames that are already
  /// progressive  into progressive will probably result in lower quality video.
  final DeinterlacerControl? control;

  /// Use Deinterlacer (DeinterlaceMode) to choose how the service will do
  /// deinterlacing. Default is Deinterlace. - Deinterlace converts interlaced to
  /// progressive. - Inverse telecine converts Hard Telecine 29.97i to progressive
  /// 23.976p. - Adaptive auto-detects and converts to progressive.
  final DeinterlacerMode? mode;

  Deinterlacer({
    this.algorithm,
    this.control,
    this.mode,
  });
  factory Deinterlacer.fromJson(Map<String, dynamic> json) {
    return Deinterlacer(
      algorithm: (json['algorithm'] as String?)?.toDeinterlaceAlgorithm(),
      control: (json['control'] as String?)?.toDeinterlacerControl(),
      mode: (json['mode'] as String?)?.toDeinterlacerMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    final control = this.control;
    final mode = this.mode;
    return {
      if (algorithm != null) 'algorithm': algorithm.toValue(),
      if (control != null) 'control': control.toValue(),
      if (mode != null) 'mode': mode.toValue(),
    };
  }
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
  forceAllFrames,
  normal,
}

extension on DeinterlacerControl {
  String toValue() {
    switch (this) {
      case DeinterlacerControl.forceAllFrames:
        return 'FORCE_ALL_FRAMES';
      case DeinterlacerControl.normal:
        return 'NORMAL';
    }
  }
}

extension on String {
  DeinterlacerControl toDeinterlacerControl() {
    switch (this) {
      case 'FORCE_ALL_FRAMES':
        return DeinterlacerControl.forceAllFrames;
      case 'NORMAL':
        return DeinterlacerControl.normal;
    }
    throw Exception('$this is not known in enum DeinterlacerControl');
  }
}

/// Use Deinterlacer (DeinterlaceMode) to choose how the service will do
/// deinterlacing. Default is Deinterlace. - Deinterlace converts interlaced to
/// progressive. - Inverse telecine converts Hard Telecine 29.97i to progressive
/// 23.976p. - Adaptive auto-detects and converts to progressive.
enum DeinterlacerMode {
  deinterlace,
  inverseTelecine,
  adaptive,
}

extension on DeinterlacerMode {
  String toValue() {
    switch (this) {
      case DeinterlacerMode.deinterlace:
        return 'DEINTERLACE';
      case DeinterlacerMode.inverseTelecine:
        return 'INVERSE_TELECINE';
      case DeinterlacerMode.adaptive:
        return 'ADAPTIVE';
    }
  }
}

extension on String {
  DeinterlacerMode toDeinterlacerMode() {
    switch (this) {
      case 'DEINTERLACE':
        return DeinterlacerMode.deinterlace;
      case 'INVERSE_TELECINE':
        return DeinterlacerMode.inverseTelecine;
      case 'ADAPTIVE':
        return DeinterlacerMode.adaptive;
    }
    throw Exception('$this is not known in enum DeinterlacerMode');
  }
}

class DeleteJobTemplateResponse {
  DeleteJobTemplateResponse();
  factory DeleteJobTemplateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteJobTemplateResponse();
  }
}

class DeletePresetResponse {
  DeletePresetResponse();
  factory DeletePresetResponse.fromJson(Map<String, dynamic> _) {
    return DeletePresetResponse();
  }
}

class DeleteQueueResponse {
  DeleteQueueResponse();
  factory DeleteQueueResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueueResponse();
  }
}

/// Optional field, defaults to DEFAULT. Specify DEFAULT for this operation to
/// return your endpoints if any exist, or to create an endpoint for you and
/// return it if one doesn't already exist. Specify GET_ONLY to return your
/// endpoints if any exist, or an empty list if none exist.
enum DescribeEndpointsMode {
  $default,
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
  }
}

extension on String {
  DescribeEndpointsMode toDescribeEndpointsMode() {
    switch (this) {
      case 'DEFAULT':
        return DescribeEndpointsMode.$default;
      case 'GET_ONLY':
        return DescribeEndpointsMode.getOnly;
    }
    throw Exception('$this is not known in enum DescribeEndpointsMode');
  }
}

class DescribeEndpointsResponse {
  /// List of endpoints
  final List<Endpoint>? endpoints;

  /// Use this string to request the next batch of endpoints.
  final String? nextToken;

  DescribeEndpointsResponse({
    this.endpoints,
    this.nextToken,
  });
  factory DescribeEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEndpointsResponse(
      endpoints: (json['endpoints'] as List?)
          ?.whereNotNull()
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

/// Settings associated with the destination. Will vary based on the type of
/// destination
class DestinationSettings {
  /// Settings associated with S3 destination
  final S3DestinationSettings? s3Settings;

  DestinationSettings({
    this.s3Settings,
  });
  factory DestinationSettings.fromJson(Map<String, dynamic> json) {
    return DestinationSettings(
      s3Settings: json['s3Settings'] != null
          ? S3DestinationSettings.fromJson(
              json['s3Settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Settings = this.s3Settings;
    return {
      if (s3Settings != null) 's3Settings': s3Settings,
    };
  }
}

class DisassociateCertificateResponse {
  DisassociateCertificateResponse();
  factory DisassociateCertificateResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateCertificateResponse();
  }
}

/// Settings for Dolby Vision
class DolbyVision {
  /// Use these settings when you set DolbyVisionLevel6Mode to SPECIFY to override
  /// the MaxCLL and MaxFALL values in your input with new values.
  final DolbyVisionLevel6Metadata? l6Metadata;

  /// Use Dolby Vision Mode to choose how the service will handle Dolby Vision
  /// MaxCLL and MaxFALL properies.
  final DolbyVisionLevel6Mode? l6Mode;

  /// In the current MediaConvert implementation, the Dolby Vision profile is
  /// always 5 (PROFILE_5). Therefore, all of your inputs must contain Dolby
  /// Vision frame interleaved data.
  final DolbyVisionProfile? profile;

  DolbyVision({
    this.l6Metadata,
    this.l6Mode,
    this.profile,
  });
  factory DolbyVision.fromJson(Map<String, dynamic> json) {
    return DolbyVision(
      l6Metadata: json['l6Metadata'] != null
          ? DolbyVisionLevel6Metadata.fromJson(
              json['l6Metadata'] as Map<String, dynamic>)
          : null,
      l6Mode: (json['l6Mode'] as String?)?.toDolbyVisionLevel6Mode(),
      profile: (json['profile'] as String?)?.toDolbyVisionProfile(),
    );
  }

  Map<String, dynamic> toJson() {
    final l6Metadata = this.l6Metadata;
    final l6Mode = this.l6Mode;
    final profile = this.profile;
    return {
      if (l6Metadata != null) 'l6Metadata': l6Metadata,
      if (l6Mode != null) 'l6Mode': l6Mode.toValue(),
      if (profile != null) 'profile': profile.toValue(),
    };
  }
}

/// Use these settings when you set DolbyVisionLevel6Mode to SPECIFY to override
/// the MaxCLL and MaxFALL values in your input with new values.
class DolbyVisionLevel6Metadata {
  /// Maximum Content Light Level. Static HDR metadata that corresponds to the
  /// brightest pixel in the entire stream. Measured in nits.
  final int? maxCll;

  /// Maximum Frame-Average Light Level. Static HDR metadata that corresponds to
  /// the highest frame-average brightness in the entire stream. Measured in nits.
  final int? maxFall;

  DolbyVisionLevel6Metadata({
    this.maxCll,
    this.maxFall,
  });
  factory DolbyVisionLevel6Metadata.fromJson(Map<String, dynamic> json) {
    return DolbyVisionLevel6Metadata(
      maxCll: json['maxCll'] as int?,
      maxFall: json['maxFall'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxCll = this.maxCll;
    final maxFall = this.maxFall;
    return {
      if (maxCll != null) 'maxCll': maxCll,
      if (maxFall != null) 'maxFall': maxFall,
    };
  }
}

/// Use Dolby Vision Mode to choose how the service will handle Dolby Vision
/// MaxCLL and MaxFALL properies.
enum DolbyVisionLevel6Mode {
  passthrough,
  recalculate,
  specify,
}

extension on DolbyVisionLevel6Mode {
  String toValue() {
    switch (this) {
      case DolbyVisionLevel6Mode.passthrough:
        return 'PASSTHROUGH';
      case DolbyVisionLevel6Mode.recalculate:
        return 'RECALCULATE';
      case DolbyVisionLevel6Mode.specify:
        return 'SPECIFY';
    }
  }
}

extension on String {
  DolbyVisionLevel6Mode toDolbyVisionLevel6Mode() {
    switch (this) {
      case 'PASSTHROUGH':
        return DolbyVisionLevel6Mode.passthrough;
      case 'RECALCULATE':
        return DolbyVisionLevel6Mode.recalculate;
      case 'SPECIFY':
        return DolbyVisionLevel6Mode.specify;
    }
    throw Exception('$this is not known in enum DolbyVisionLevel6Mode');
  }
}

/// In the current MediaConvert implementation, the Dolby Vision profile is
/// always 5 (PROFILE_5). Therefore, all of your inputs must contain Dolby
/// Vision frame interleaved data.
enum DolbyVisionProfile {
  profile_5,
}

extension on DolbyVisionProfile {
  String toValue() {
    switch (this) {
      case DolbyVisionProfile.profile_5:
        return 'PROFILE_5';
    }
  }
}

extension on String {
  DolbyVisionProfile toDolbyVisionProfile() {
    switch (this) {
      case 'PROFILE_5':
        return DolbyVisionProfile.profile_5;
    }
    throw Exception('$this is not known in enum DolbyVisionProfile');
  }
}

/// Applies only to 29.97 fps outputs. When this feature is enabled, the service
/// will use drop-frame timecode on outputs. If it is not possible to use
/// drop-frame timecode, the system will fall back to non-drop-frame. This
/// setting is enabled by default when Timecode insertion (TimecodeInsertion) is
/// enabled.
enum DropFrameTimecode {
  disabled,
  enabled,
}

extension on DropFrameTimecode {
  String toValue() {
    switch (this) {
      case DropFrameTimecode.disabled:
        return 'DISABLED';
      case DropFrameTimecode.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  DropFrameTimecode toDropFrameTimecode() {
    switch (this) {
      case 'DISABLED':
        return DropFrameTimecode.disabled;
      case 'ENABLED':
        return DropFrameTimecode.enabled;
    }
    throw Exception('$this is not known in enum DropFrameTimecode');
  }
}

/// Inserts DVB Network Information Table (NIT) at the specified table
/// repetition interval.
class DvbNitSettings {
  /// The numeric value placed in the Network Information Table (NIT).
  final int? networkId;

  /// The network name text placed in the network_name_descriptor inside the
  /// Network Information Table. Maximum length is 256 characters.
  final String? networkName;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int? nitInterval;

  DvbNitSettings({
    this.networkId,
    this.networkName,
    this.nitInterval,
  });
  factory DvbNitSettings.fromJson(Map<String, dynamic> json) {
    return DvbNitSettings(
      networkId: json['networkId'] as int?,
      networkName: json['networkName'] as String?,
      nitInterval: json['nitInterval'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkId = this.networkId;
    final networkName = this.networkName;
    final nitInterval = this.nitInterval;
    return {
      if (networkId != null) 'networkId': networkId,
      if (networkName != null) 'networkName': networkName,
      if (nitInterval != null) 'nitInterval': nitInterval,
    };
  }
}

/// Inserts DVB Service Description Table (NIT) at the specified table
/// repetition interval.
class DvbSdtSettings {
  /// Selects method of inserting SDT information into output stream.  "Follow
  /// input SDT" copies SDT information from input stream to  output stream.
  /// "Follow input SDT if present" copies SDT information from  input stream to
  /// output stream if SDT information is present in the input, otherwise it will
  /// fall back on the user-defined values. Enter "SDT  Manually" means user will
  /// enter the SDT information. "No SDT" means output  stream will not contain
  /// SDT information.
  final OutputSdt? outputSdt;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int? sdtInterval;

  /// The service name placed in the service_descriptor in the Service Description
  /// Table. Maximum length is 256 characters.
  final String? serviceName;

  /// The service provider name placed in the service_descriptor in the Service
  /// Description Table. Maximum length is 256 characters.
  final String? serviceProviderName;

  DvbSdtSettings({
    this.outputSdt,
    this.sdtInterval,
    this.serviceName,
    this.serviceProviderName,
  });
  factory DvbSdtSettings.fromJson(Map<String, dynamic> json) {
    return DvbSdtSettings(
      outputSdt: (json['outputSdt'] as String?)?.toOutputSdt(),
      sdtInterval: json['sdtInterval'] as int?,
      serviceName: json['serviceName'] as String?,
      serviceProviderName: json['serviceProviderName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputSdt = this.outputSdt;
    final sdtInterval = this.sdtInterval;
    final serviceName = this.serviceName;
    final serviceProviderName = this.serviceProviderName;
    return {
      if (outputSdt != null) 'outputSdt': outputSdt.toValue(),
      if (sdtInterval != null) 'sdtInterval': sdtInterval,
      if (serviceName != null) 'serviceName': serviceName,
      if (serviceProviderName != null)
        'serviceProviderName': serviceProviderName,
    };
  }
}

/// DVB-Sub Destination Settings
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
  final DvbSubtitleAlignment? alignment;

  /// Specifies the color of the rectangle behind the captions.
  /// All burn-in and DVB-Sub font settings must match.
  final DvbSubtitleBackgroundColor? backgroundColor;

  /// Specifies the opacity of the background rectangle. 255 is opaque; 0 is
  /// transparent. Leaving this parameter blank is equivalent to setting it to 0
  /// (transparent). All burn-in and DVB-Sub font settings must match.
  final int? backgroundOpacity;

  /// Specifies the color of the burned-in captions. This option is not valid for
  /// source captions that are STL, 608/embedded or teletext. These source
  /// settings are already pre-defined by the caption stream. All burn-in and
  /// DVB-Sub font settings must match.
  final DvbSubtitleFontColor? fontColor;

  /// Specifies the opacity of the burned-in captions. 255 is opaque; 0 is
  /// transparent.
  /// All burn-in and DVB-Sub font settings must match.
  final int? fontOpacity;

  /// Font resolution in DPI (dots per inch); default is 96 dpi.
  /// All burn-in and DVB-Sub font settings must match.
  final int? fontResolution;

  /// Provide the font script, using an ISO 15924 script code, if the LanguageCode
  /// is not sufficient for determining the script type. Where LanguageCode or
  /// CustomLanguageCode is sufficient, use "AUTOMATIC" or leave unset. This is
  /// used to help determine the appropriate font for rendering DVB-Sub captions.
  final FontScript? fontScript;

  /// A positive integer indicates the exact font size in points. Set to 0 for
  /// automatic font size selection. All burn-in and DVB-Sub font settings must
  /// match.
  final int? fontSize;

  /// Specifies font outline color. This option is not valid for source captions
  /// that are either 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  final DvbSubtitleOutlineColor? outlineColor;

  /// Specifies font outline size in pixels. This option is not valid for source
  /// captions that are either 608/embedded or teletext. These source settings are
  /// already pre-defined by the caption stream. All burn-in and DVB-Sub font
  /// settings must match.
  final int? outlineSize;

  /// Specifies the color of the shadow cast by the captions.
  /// All burn-in and DVB-Sub font settings must match.
  final DvbSubtitleShadowColor? shadowColor;

  /// Specifies the opacity of the shadow. 255 is opaque; 0 is transparent.
  /// Leaving this parameter blank is equivalent to setting it to 0 (transparent).
  /// All burn-in and DVB-Sub font settings must match.
  final int? shadowOpacity;

  /// Specifies the horizontal offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels to the left.
  /// All burn-in and DVB-Sub font settings must match.
  final int? shadowXOffset;

  /// Specifies the vertical offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels above the
  /// text. All burn-in and DVB-Sub font settings must match.
  final int? shadowYOffset;

  /// Specify whether your DVB subtitles are standard or for hearing impaired.
  /// Choose hearing impaired if your subtitles include audio descriptions and
  /// dialogue. Choose standard if your subtitles include only dialogue.
  final DvbSubtitlingType? subtitlingType;

  /// Only applies to jobs with input captions in Teletext or STL formats. Specify
  /// whether the spacing between letters in your captions is set by the captions
  /// grid or varies depending on letter width. Choose fixed grid to conform to
  /// the spacing specified in the captions file more accurately. Choose
  /// proportional to make the text easier to read if the captions are closed
  /// caption.
  final DvbSubtitleTeletextSpacing? teletextSpacing;

  /// Specifies the horizontal position of the caption relative to the left side
  /// of the output in pixels. A value of 10 would result in the captions starting
  /// 10 pixels from the left of the output. If no explicit x_position is
  /// provided, the horizontal caption position will be determined by the
  /// alignment parameter. This option is not valid for source captions that are
  /// STL, 608/embedded or teletext. These source settings are already pre-defined
  /// by the caption stream. All burn-in and DVB-Sub font settings must match.
  final int? xPosition;

  /// Specifies the vertical position of the caption relative to the top of the
  /// output in pixels. A value of 10 would result in the captions starting 10
  /// pixels from the top of the output. If no explicit y_position is provided,
  /// the caption will be positioned towards the bottom of the output. This option
  /// is not valid for source captions that are STL, 608/embedded or teletext.
  /// These source settings are already pre-defined by the caption stream. All
  /// burn-in and DVB-Sub font settings must match.
  final int? yPosition;

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
  factory DvbSubDestinationSettings.fromJson(Map<String, dynamic> json) {
    return DvbSubDestinationSettings(
      alignment: (json['alignment'] as String?)?.toDvbSubtitleAlignment(),
      backgroundColor:
          (json['backgroundColor'] as String?)?.toDvbSubtitleBackgroundColor(),
      backgroundOpacity: json['backgroundOpacity'] as int?,
      fontColor: (json['fontColor'] as String?)?.toDvbSubtitleFontColor(),
      fontOpacity: json['fontOpacity'] as int?,
      fontResolution: json['fontResolution'] as int?,
      fontScript: (json['fontScript'] as String?)?.toFontScript(),
      fontSize: json['fontSize'] as int?,
      outlineColor:
          (json['outlineColor'] as String?)?.toDvbSubtitleOutlineColor(),
      outlineSize: json['outlineSize'] as int?,
      shadowColor: (json['shadowColor'] as String?)?.toDvbSubtitleShadowColor(),
      shadowOpacity: json['shadowOpacity'] as int?,
      shadowXOffset: json['shadowXOffset'] as int?,
      shadowYOffset: json['shadowYOffset'] as int?,
      subtitlingType:
          (json['subtitlingType'] as String?)?.toDvbSubtitlingType(),
      teletextSpacing:
          (json['teletextSpacing'] as String?)?.toDvbSubtitleTeletextSpacing(),
      xPosition: json['xPosition'] as int?,
      yPosition: json['yPosition'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final alignment = this.alignment;
    final backgroundColor = this.backgroundColor;
    final backgroundOpacity = this.backgroundOpacity;
    final fontColor = this.fontColor;
    final fontOpacity = this.fontOpacity;
    final fontResolution = this.fontResolution;
    final fontScript = this.fontScript;
    final fontSize = this.fontSize;
    final outlineColor = this.outlineColor;
    final outlineSize = this.outlineSize;
    final shadowColor = this.shadowColor;
    final shadowOpacity = this.shadowOpacity;
    final shadowXOffset = this.shadowXOffset;
    final shadowYOffset = this.shadowYOffset;
    final subtitlingType = this.subtitlingType;
    final teletextSpacing = this.teletextSpacing;
    final xPosition = this.xPosition;
    final yPosition = this.yPosition;
    return {
      if (alignment != null) 'alignment': alignment.toValue(),
      if (backgroundColor != null) 'backgroundColor': backgroundColor.toValue(),
      if (backgroundOpacity != null) 'backgroundOpacity': backgroundOpacity,
      if (fontColor != null) 'fontColor': fontColor.toValue(),
      if (fontOpacity != null) 'fontOpacity': fontOpacity,
      if (fontResolution != null) 'fontResolution': fontResolution,
      if (fontScript != null) 'fontScript': fontScript.toValue(),
      if (fontSize != null) 'fontSize': fontSize,
      if (outlineColor != null) 'outlineColor': outlineColor.toValue(),
      if (outlineSize != null) 'outlineSize': outlineSize,
      if (shadowColor != null) 'shadowColor': shadowColor.toValue(),
      if (shadowOpacity != null) 'shadowOpacity': shadowOpacity,
      if (shadowXOffset != null) 'shadowXOffset': shadowXOffset,
      if (shadowYOffset != null) 'shadowYOffset': shadowYOffset,
      if (subtitlingType != null) 'subtitlingType': subtitlingType.toValue(),
      if (teletextSpacing != null) 'teletextSpacing': teletextSpacing.toValue(),
      if (xPosition != null) 'xPosition': xPosition,
      if (yPosition != null) 'yPosition': yPosition,
    };
  }
}

/// DVB Sub Source Settings
class DvbSubSourceSettings {
  /// When using DVB-Sub with Burn-In or SMPTE-TT, use this PID for the source
  /// content. Unused for DVB-Sub passthrough. All DVB-Sub content is passed
  /// through, regardless of selectors.
  final int? pid;

  DvbSubSourceSettings({
    this.pid,
  });
  factory DvbSubSourceSettings.fromJson(Map<String, dynamic> json) {
    return DvbSubSourceSettings(
      pid: json['pid'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final pid = this.pid;
    return {
      if (pid != null) 'pid': pid,
    };
  }
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
  centered,
  left,
}

extension on DvbSubtitleAlignment {
  String toValue() {
    switch (this) {
      case DvbSubtitleAlignment.centered:
        return 'CENTERED';
      case DvbSubtitleAlignment.left:
        return 'LEFT';
    }
  }
}

extension on String {
  DvbSubtitleAlignment toDvbSubtitleAlignment() {
    switch (this) {
      case 'CENTERED':
        return DvbSubtitleAlignment.centered;
      case 'LEFT':
        return DvbSubtitleAlignment.left;
    }
    throw Exception('$this is not known in enum DvbSubtitleAlignment');
  }
}

/// Specifies the color of the rectangle behind the captions.
/// All burn-in and DVB-Sub font settings must match.
enum DvbSubtitleBackgroundColor {
  none,
  black,
  white,
}

extension on DvbSubtitleBackgroundColor {
  String toValue() {
    switch (this) {
      case DvbSubtitleBackgroundColor.none:
        return 'NONE';
      case DvbSubtitleBackgroundColor.black:
        return 'BLACK';
      case DvbSubtitleBackgroundColor.white:
        return 'WHITE';
    }
  }
}

extension on String {
  DvbSubtitleBackgroundColor toDvbSubtitleBackgroundColor() {
    switch (this) {
      case 'NONE':
        return DvbSubtitleBackgroundColor.none;
      case 'BLACK':
        return DvbSubtitleBackgroundColor.black;
      case 'WHITE':
        return DvbSubtitleBackgroundColor.white;
    }
    throw Exception('$this is not known in enum DvbSubtitleBackgroundColor');
  }
}

/// Specifies the color of the burned-in captions. This option is not valid for
/// source captions that are STL, 608/embedded or teletext. These source
/// settings are already pre-defined by the caption stream. All burn-in and
/// DVB-Sub font settings must match.
enum DvbSubtitleFontColor {
  white,
  black,
  yellow,
  red,
  green,
  blue,
}

extension on DvbSubtitleFontColor {
  String toValue() {
    switch (this) {
      case DvbSubtitleFontColor.white:
        return 'WHITE';
      case DvbSubtitleFontColor.black:
        return 'BLACK';
      case DvbSubtitleFontColor.yellow:
        return 'YELLOW';
      case DvbSubtitleFontColor.red:
        return 'RED';
      case DvbSubtitleFontColor.green:
        return 'GREEN';
      case DvbSubtitleFontColor.blue:
        return 'BLUE';
    }
  }
}

extension on String {
  DvbSubtitleFontColor toDvbSubtitleFontColor() {
    switch (this) {
      case 'WHITE':
        return DvbSubtitleFontColor.white;
      case 'BLACK':
        return DvbSubtitleFontColor.black;
      case 'YELLOW':
        return DvbSubtitleFontColor.yellow;
      case 'RED':
        return DvbSubtitleFontColor.red;
      case 'GREEN':
        return DvbSubtitleFontColor.green;
      case 'BLUE':
        return DvbSubtitleFontColor.blue;
    }
    throw Exception('$this is not known in enum DvbSubtitleFontColor');
  }
}

/// Specifies font outline color. This option is not valid for source captions
/// that are either 608/embedded or teletext. These source settings are already
/// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
/// must match.
enum DvbSubtitleOutlineColor {
  black,
  white,
  yellow,
  red,
  green,
  blue,
}

extension on DvbSubtitleOutlineColor {
  String toValue() {
    switch (this) {
      case DvbSubtitleOutlineColor.black:
        return 'BLACK';
      case DvbSubtitleOutlineColor.white:
        return 'WHITE';
      case DvbSubtitleOutlineColor.yellow:
        return 'YELLOW';
      case DvbSubtitleOutlineColor.red:
        return 'RED';
      case DvbSubtitleOutlineColor.green:
        return 'GREEN';
      case DvbSubtitleOutlineColor.blue:
        return 'BLUE';
    }
  }
}

extension on String {
  DvbSubtitleOutlineColor toDvbSubtitleOutlineColor() {
    switch (this) {
      case 'BLACK':
        return DvbSubtitleOutlineColor.black;
      case 'WHITE':
        return DvbSubtitleOutlineColor.white;
      case 'YELLOW':
        return DvbSubtitleOutlineColor.yellow;
      case 'RED':
        return DvbSubtitleOutlineColor.red;
      case 'GREEN':
        return DvbSubtitleOutlineColor.green;
      case 'BLUE':
        return DvbSubtitleOutlineColor.blue;
    }
    throw Exception('$this is not known in enum DvbSubtitleOutlineColor');
  }
}

/// Specifies the color of the shadow cast by the captions.
/// All burn-in and DVB-Sub font settings must match.
enum DvbSubtitleShadowColor {
  none,
  black,
  white,
}

extension on DvbSubtitleShadowColor {
  String toValue() {
    switch (this) {
      case DvbSubtitleShadowColor.none:
        return 'NONE';
      case DvbSubtitleShadowColor.black:
        return 'BLACK';
      case DvbSubtitleShadowColor.white:
        return 'WHITE';
    }
  }
}

extension on String {
  DvbSubtitleShadowColor toDvbSubtitleShadowColor() {
    switch (this) {
      case 'NONE':
        return DvbSubtitleShadowColor.none;
      case 'BLACK':
        return DvbSubtitleShadowColor.black;
      case 'WHITE':
        return DvbSubtitleShadowColor.white;
    }
    throw Exception('$this is not known in enum DvbSubtitleShadowColor');
  }
}

/// Only applies to jobs with input captions in Teletext or STL formats. Specify
/// whether the spacing between letters in your captions is set by the captions
/// grid or varies depending on letter width. Choose fixed grid to conform to
/// the spacing specified in the captions file more accurately. Choose
/// proportional to make the text easier to read if the captions are closed
/// caption.
enum DvbSubtitleTeletextSpacing {
  fixedGrid,
  proportional,
}

extension on DvbSubtitleTeletextSpacing {
  String toValue() {
    switch (this) {
      case DvbSubtitleTeletextSpacing.fixedGrid:
        return 'FIXED_GRID';
      case DvbSubtitleTeletextSpacing.proportional:
        return 'PROPORTIONAL';
    }
  }
}

extension on String {
  DvbSubtitleTeletextSpacing toDvbSubtitleTeletextSpacing() {
    switch (this) {
      case 'FIXED_GRID':
        return DvbSubtitleTeletextSpacing.fixedGrid;
      case 'PROPORTIONAL':
        return DvbSubtitleTeletextSpacing.proportional;
    }
    throw Exception('$this is not known in enum DvbSubtitleTeletextSpacing');
  }
}

/// Specify whether your DVB subtitles are standard or for hearing impaired.
/// Choose hearing impaired if your subtitles include audio descriptions and
/// dialogue. Choose standard if your subtitles include only dialogue.
enum DvbSubtitlingType {
  hearingImpaired,
  standard,
}

extension on DvbSubtitlingType {
  String toValue() {
    switch (this) {
      case DvbSubtitlingType.hearingImpaired:
        return 'HEARING_IMPAIRED';
      case DvbSubtitlingType.standard:
        return 'STANDARD';
    }
  }
}

extension on String {
  DvbSubtitlingType toDvbSubtitlingType() {
    switch (this) {
      case 'HEARING_IMPAIRED':
        return DvbSubtitlingType.hearingImpaired;
      case 'STANDARD':
        return DvbSubtitlingType.standard;
    }
    throw Exception('$this is not known in enum DvbSubtitlingType');
  }
}

/// Inserts DVB Time and Date Table (TDT) at the specified table repetition
/// interval.
class DvbTdtSettings {
  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int? tdtInterval;

  DvbTdtSettings({
    this.tdtInterval,
  });
  factory DvbTdtSettings.fromJson(Map<String, dynamic> json) {
    return DvbTdtSettings(
      tdtInterval: json['tdtInterval'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final tdtInterval = this.tdtInterval;
    return {
      if (tdtInterval != null) 'tdtInterval': tdtInterval,
    };
  }
}

/// Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For
/// more information about the EAC3 bitstream mode, see ATSC A/52-2012 (Annex
/// E).
enum Eac3AtmosBitstreamMode {
  completeMain,
}

extension on Eac3AtmosBitstreamMode {
  String toValue() {
    switch (this) {
      case Eac3AtmosBitstreamMode.completeMain:
        return 'COMPLETE_MAIN';
    }
  }
}

extension on String {
  Eac3AtmosBitstreamMode toEac3AtmosBitstreamMode() {
    switch (this) {
      case 'COMPLETE_MAIN':
        return Eac3AtmosBitstreamMode.completeMain;
    }
    throw Exception('$this is not known in enum Eac3AtmosBitstreamMode');
  }
}

/// The coding mode for Dolby Digital Plus JOC (Atmos) is always 9.1.6
/// (CODING_MODE_9_1_6).
enum Eac3AtmosCodingMode {
  codingMode_9_1_6,
}

extension on Eac3AtmosCodingMode {
  String toValue() {
    switch (this) {
      case Eac3AtmosCodingMode.codingMode_9_1_6:
        return 'CODING_MODE_9_1_6';
    }
  }
}

extension on String {
  Eac3AtmosCodingMode toEac3AtmosCodingMode() {
    switch (this) {
      case 'CODING_MODE_9_1_6':
        return Eac3AtmosCodingMode.codingMode_9_1_6;
    }
    throw Exception('$this is not known in enum Eac3AtmosCodingMode');
  }
}

/// Enable Dolby Dialogue Intelligence to adjust loudness based on dialogue
/// analysis.
enum Eac3AtmosDialogueIntelligence {
  enabled,
  disabled,
}

extension on Eac3AtmosDialogueIntelligence {
  String toValue() {
    switch (this) {
      case Eac3AtmosDialogueIntelligence.enabled:
        return 'ENABLED';
      case Eac3AtmosDialogueIntelligence.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  Eac3AtmosDialogueIntelligence toEac3AtmosDialogueIntelligence() {
    switch (this) {
      case 'ENABLED':
        return Eac3AtmosDialogueIntelligence.enabled;
      case 'DISABLED':
        return Eac3AtmosDialogueIntelligence.disabled;
    }
    throw Exception('$this is not known in enum Eac3AtmosDialogueIntelligence');
  }
}

/// Specify the absolute peak level for a signal with dynamic range compression.
enum Eac3AtmosDynamicRangeCompressionLine {
  none,
  filmStandard,
  filmLight,
  musicStandard,
  musicLight,
  speech,
}

extension on Eac3AtmosDynamicRangeCompressionLine {
  String toValue() {
    switch (this) {
      case Eac3AtmosDynamicRangeCompressionLine.none:
        return 'NONE';
      case Eac3AtmosDynamicRangeCompressionLine.filmStandard:
        return 'FILM_STANDARD';
      case Eac3AtmosDynamicRangeCompressionLine.filmLight:
        return 'FILM_LIGHT';
      case Eac3AtmosDynamicRangeCompressionLine.musicStandard:
        return 'MUSIC_STANDARD';
      case Eac3AtmosDynamicRangeCompressionLine.musicLight:
        return 'MUSIC_LIGHT';
      case Eac3AtmosDynamicRangeCompressionLine.speech:
        return 'SPEECH';
    }
  }
}

extension on String {
  Eac3AtmosDynamicRangeCompressionLine
      toEac3AtmosDynamicRangeCompressionLine() {
    switch (this) {
      case 'NONE':
        return Eac3AtmosDynamicRangeCompressionLine.none;
      case 'FILM_STANDARD':
        return Eac3AtmosDynamicRangeCompressionLine.filmStandard;
      case 'FILM_LIGHT':
        return Eac3AtmosDynamicRangeCompressionLine.filmLight;
      case 'MUSIC_STANDARD':
        return Eac3AtmosDynamicRangeCompressionLine.musicStandard;
      case 'MUSIC_LIGHT':
        return Eac3AtmosDynamicRangeCompressionLine.musicLight;
      case 'SPEECH':
        return Eac3AtmosDynamicRangeCompressionLine.speech;
    }
    throw Exception(
        '$this is not known in enum Eac3AtmosDynamicRangeCompressionLine');
  }
}

/// Specify how the service limits the audio dynamic range when compressing the
/// audio.
enum Eac3AtmosDynamicRangeCompressionRf {
  none,
  filmStandard,
  filmLight,
  musicStandard,
  musicLight,
  speech,
}

extension on Eac3AtmosDynamicRangeCompressionRf {
  String toValue() {
    switch (this) {
      case Eac3AtmosDynamicRangeCompressionRf.none:
        return 'NONE';
      case Eac3AtmosDynamicRangeCompressionRf.filmStandard:
        return 'FILM_STANDARD';
      case Eac3AtmosDynamicRangeCompressionRf.filmLight:
        return 'FILM_LIGHT';
      case Eac3AtmosDynamicRangeCompressionRf.musicStandard:
        return 'MUSIC_STANDARD';
      case Eac3AtmosDynamicRangeCompressionRf.musicLight:
        return 'MUSIC_LIGHT';
      case Eac3AtmosDynamicRangeCompressionRf.speech:
        return 'SPEECH';
    }
  }
}

extension on String {
  Eac3AtmosDynamicRangeCompressionRf toEac3AtmosDynamicRangeCompressionRf() {
    switch (this) {
      case 'NONE':
        return Eac3AtmosDynamicRangeCompressionRf.none;
      case 'FILM_STANDARD':
        return Eac3AtmosDynamicRangeCompressionRf.filmStandard;
      case 'FILM_LIGHT':
        return Eac3AtmosDynamicRangeCompressionRf.filmLight;
      case 'MUSIC_STANDARD':
        return Eac3AtmosDynamicRangeCompressionRf.musicStandard;
      case 'MUSIC_LIGHT':
        return Eac3AtmosDynamicRangeCompressionRf.musicLight;
      case 'SPEECH':
        return Eac3AtmosDynamicRangeCompressionRf.speech;
    }
    throw Exception(
        '$this is not known in enum Eac3AtmosDynamicRangeCompressionRf');
  }
}

/// Choose how the service meters the loudness of your audio.
enum Eac3AtmosMeteringMode {
  leqA,
  ituBs_1770_1,
  ituBs_1770_2,
  ituBs_1770_3,
  ituBs_1770_4,
}

extension on Eac3AtmosMeteringMode {
  String toValue() {
    switch (this) {
      case Eac3AtmosMeteringMode.leqA:
        return 'LEQ_A';
      case Eac3AtmosMeteringMode.ituBs_1770_1:
        return 'ITU_BS_1770_1';
      case Eac3AtmosMeteringMode.ituBs_1770_2:
        return 'ITU_BS_1770_2';
      case Eac3AtmosMeteringMode.ituBs_1770_3:
        return 'ITU_BS_1770_3';
      case Eac3AtmosMeteringMode.ituBs_1770_4:
        return 'ITU_BS_1770_4';
    }
  }
}

extension on String {
  Eac3AtmosMeteringMode toEac3AtmosMeteringMode() {
    switch (this) {
      case 'LEQ_A':
        return Eac3AtmosMeteringMode.leqA;
      case 'ITU_BS_1770_1':
        return Eac3AtmosMeteringMode.ituBs_1770_1;
      case 'ITU_BS_1770_2':
        return Eac3AtmosMeteringMode.ituBs_1770_2;
      case 'ITU_BS_1770_3':
        return Eac3AtmosMeteringMode.ituBs_1770_3;
      case 'ITU_BS_1770_4':
        return Eac3AtmosMeteringMode.ituBs_1770_4;
    }
    throw Exception('$this is not known in enum Eac3AtmosMeteringMode');
  }
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value EAC3_ATMOS.
class Eac3AtmosSettings {
  /// Specify the average bitrate in bits per second.
  /// Valid values: 384k, 448k, 640k, 768k
  final int? bitrate;

  /// Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For
  /// more information about the EAC3 bitstream mode, see ATSC A/52-2012 (Annex
  /// E).
  final Eac3AtmosBitstreamMode? bitstreamMode;

  /// The coding mode for Dolby Digital Plus JOC (Atmos) is always 9.1.6
  /// (CODING_MODE_9_1_6).
  final Eac3AtmosCodingMode? codingMode;

  /// Enable Dolby Dialogue Intelligence to adjust loudness based on dialogue
  /// analysis.
  final Eac3AtmosDialogueIntelligence? dialogueIntelligence;

  /// Specify the absolute peak level for a signal with dynamic range compression.
  final Eac3AtmosDynamicRangeCompressionLine? dynamicRangeCompressionLine;

  /// Specify how the service limits the audio dynamic range when compressing the
  /// audio.
  final Eac3AtmosDynamicRangeCompressionRf? dynamicRangeCompressionRf;

  /// Specify a value for the following Dolby Atmos setting: Left only/Right only
  /// center mix
  /// (Lo/Ro center). MediaConvert uses this value for downmixing. How the service
  /// uses this
  /// value depends on the value that you choose for Stereo downmix
  /// (Eac3AtmosStereoDownmix).
  /// Valid values: 3.0, 1.5, 0.0, -1.5, -3.0, -4.5, and -6.0.
  final double? loRoCenterMixLevel;

  /// Specify a value for the following Dolby Atmos setting: Left only/Right only
  /// (Lo/Ro surround). MediaConvert uses this value for downmixing. How the
  /// service uses this value depends on the value that you choose for Stereo
  /// downmix (Eac3AtmosStereoDownmix). Valid values: -1.5, -3.0, -4.5, -6.0, and
  /// -60. The value -60 mutes the channel.
  final double? loRoSurroundMixLevel;

  /// Specify a value for the following Dolby Atmos setting: Left total/Right
  /// total center mix (Lt/Rt center). MediaConvert uses this value for
  /// downmixing. How the service uses this value depends on the value that you
  /// choose for Stereo downmix (Eac3AtmosStereoDownmix). Valid values: 3.0, 1.5,
  /// 0.0, -1.5, -3.0, -4.5, and -6.0.
  final double? ltRtCenterMixLevel;

  /// Specify a value for the following Dolby Atmos setting: Left total/Right
  /// total surround mix (Lt/Rt surround). MediaConvert uses this value for
  /// downmixing. How the service uses this value depends on the value that you
  /// choose for Stereo downmix (Eac3AtmosStereoDownmix). Valid values: -1.5,
  /// -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel.
  final double? ltRtSurroundMixLevel;

  /// Choose how the service meters the loudness of your audio.
  final Eac3AtmosMeteringMode? meteringMode;

  /// This value is always 48000. It represents the sample rate in Hz.
  final int? sampleRate;

  /// Specify the percentage of audio content that must be speech before the
  /// encoder uses the measured speech loudness as the overall program loudness.
  final int? speechThreshold;

  /// Choose how the service does stereo downmixing.
  final Eac3AtmosStereoDownmix? stereoDownmix;

  /// Specify whether your input audio has an additional center rear surround
  /// channel matrix encoded into your left and right surround channels.
  final Eac3AtmosSurroundExMode? surroundExMode;

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
  factory Eac3AtmosSettings.fromJson(Map<String, dynamic> json) {
    return Eac3AtmosSettings(
      bitrate: json['bitrate'] as int?,
      bitstreamMode:
          (json['bitstreamMode'] as String?)?.toEac3AtmosBitstreamMode(),
      codingMode: (json['codingMode'] as String?)?.toEac3AtmosCodingMode(),
      dialogueIntelligence: (json['dialogueIntelligence'] as String?)
          ?.toEac3AtmosDialogueIntelligence(),
      dynamicRangeCompressionLine:
          (json['dynamicRangeCompressionLine'] as String?)
              ?.toEac3AtmosDynamicRangeCompressionLine(),
      dynamicRangeCompressionRf: (json['dynamicRangeCompressionRf'] as String?)
          ?.toEac3AtmosDynamicRangeCompressionRf(),
      loRoCenterMixLevel: json['loRoCenterMixLevel'] as double?,
      loRoSurroundMixLevel: json['loRoSurroundMixLevel'] as double?,
      ltRtCenterMixLevel: json['ltRtCenterMixLevel'] as double?,
      ltRtSurroundMixLevel: json['ltRtSurroundMixLevel'] as double?,
      meteringMode:
          (json['meteringMode'] as String?)?.toEac3AtmosMeteringMode(),
      sampleRate: json['sampleRate'] as int?,
      speechThreshold: json['speechThreshold'] as int?,
      stereoDownmix:
          (json['stereoDownmix'] as String?)?.toEac3AtmosStereoDownmix(),
      surroundExMode:
          (json['surroundExMode'] as String?)?.toEac3AtmosSurroundExMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final bitrate = this.bitrate;
    final bitstreamMode = this.bitstreamMode;
    final codingMode = this.codingMode;
    final dialogueIntelligence = this.dialogueIntelligence;
    final dynamicRangeCompressionLine = this.dynamicRangeCompressionLine;
    final dynamicRangeCompressionRf = this.dynamicRangeCompressionRf;
    final loRoCenterMixLevel = this.loRoCenterMixLevel;
    final loRoSurroundMixLevel = this.loRoSurroundMixLevel;
    final ltRtCenterMixLevel = this.ltRtCenterMixLevel;
    final ltRtSurroundMixLevel = this.ltRtSurroundMixLevel;
    final meteringMode = this.meteringMode;
    final sampleRate = this.sampleRate;
    final speechThreshold = this.speechThreshold;
    final stereoDownmix = this.stereoDownmix;
    final surroundExMode = this.surroundExMode;
    return {
      if (bitrate != null) 'bitrate': bitrate,
      if (bitstreamMode != null) 'bitstreamMode': bitstreamMode.toValue(),
      if (codingMode != null) 'codingMode': codingMode.toValue(),
      if (dialogueIntelligence != null)
        'dialogueIntelligence': dialogueIntelligence.toValue(),
      if (dynamicRangeCompressionLine != null)
        'dynamicRangeCompressionLine': dynamicRangeCompressionLine.toValue(),
      if (dynamicRangeCompressionRf != null)
        'dynamicRangeCompressionRf': dynamicRangeCompressionRf.toValue(),
      if (loRoCenterMixLevel != null) 'loRoCenterMixLevel': loRoCenterMixLevel,
      if (loRoSurroundMixLevel != null)
        'loRoSurroundMixLevel': loRoSurroundMixLevel,
      if (ltRtCenterMixLevel != null) 'ltRtCenterMixLevel': ltRtCenterMixLevel,
      if (ltRtSurroundMixLevel != null)
        'ltRtSurroundMixLevel': ltRtSurroundMixLevel,
      if (meteringMode != null) 'meteringMode': meteringMode.toValue(),
      if (sampleRate != null) 'sampleRate': sampleRate,
      if (speechThreshold != null) 'speechThreshold': speechThreshold,
      if (stereoDownmix != null) 'stereoDownmix': stereoDownmix.toValue(),
      if (surroundExMode != null) 'surroundExMode': surroundExMode.toValue(),
    };
  }
}

/// Choose how the service does stereo downmixing.
enum Eac3AtmosStereoDownmix {
  notIndicated,
  stereo,
  surround,
  dpl2,
}

extension on Eac3AtmosStereoDownmix {
  String toValue() {
    switch (this) {
      case Eac3AtmosStereoDownmix.notIndicated:
        return 'NOT_INDICATED';
      case Eac3AtmosStereoDownmix.stereo:
        return 'STEREO';
      case Eac3AtmosStereoDownmix.surround:
        return 'SURROUND';
      case Eac3AtmosStereoDownmix.dpl2:
        return 'DPL2';
    }
  }
}

extension on String {
  Eac3AtmosStereoDownmix toEac3AtmosStereoDownmix() {
    switch (this) {
      case 'NOT_INDICATED':
        return Eac3AtmosStereoDownmix.notIndicated;
      case 'STEREO':
        return Eac3AtmosStereoDownmix.stereo;
      case 'SURROUND':
        return Eac3AtmosStereoDownmix.surround;
      case 'DPL2':
        return Eac3AtmosStereoDownmix.dpl2;
    }
    throw Exception('$this is not known in enum Eac3AtmosStereoDownmix');
  }
}

/// Specify whether your input audio has an additional center rear surround
/// channel matrix encoded into your left and right surround channels.
enum Eac3AtmosSurroundExMode {
  notIndicated,
  enabled,
  disabled,
}

extension on Eac3AtmosSurroundExMode {
  String toValue() {
    switch (this) {
      case Eac3AtmosSurroundExMode.notIndicated:
        return 'NOT_INDICATED';
      case Eac3AtmosSurroundExMode.enabled:
        return 'ENABLED';
      case Eac3AtmosSurroundExMode.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  Eac3AtmosSurroundExMode toEac3AtmosSurroundExMode() {
    switch (this) {
      case 'NOT_INDICATED':
        return Eac3AtmosSurroundExMode.notIndicated;
      case 'ENABLED':
        return Eac3AtmosSurroundExMode.enabled;
      case 'DISABLED':
        return Eac3AtmosSurroundExMode.disabled;
    }
    throw Exception('$this is not known in enum Eac3AtmosSurroundExMode');
  }
}

/// If set to ATTENUATE_3_DB, applies a 3 dB attenuation to the surround
/// channels. Only used for 3/2 coding mode.
enum Eac3AttenuationControl {
  attenuate_3Db,
  none,
}

extension on Eac3AttenuationControl {
  String toValue() {
    switch (this) {
      case Eac3AttenuationControl.attenuate_3Db:
        return 'ATTENUATE_3_DB';
      case Eac3AttenuationControl.none:
        return 'NONE';
    }
  }
}

extension on String {
  Eac3AttenuationControl toEac3AttenuationControl() {
    switch (this) {
      case 'ATTENUATE_3_DB':
        return Eac3AttenuationControl.attenuate_3Db;
      case 'NONE':
        return Eac3AttenuationControl.none;
    }
    throw Exception('$this is not known in enum Eac3AttenuationControl');
  }
}

/// Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For
/// more information about the EAC3 bitstream mode, see ATSC A/52-2012 (Annex
/// E).
enum Eac3BitstreamMode {
  completeMain,
  commentary,
  emergency,
  hearingImpaired,
  visuallyImpaired,
}

extension on Eac3BitstreamMode {
  String toValue() {
    switch (this) {
      case Eac3BitstreamMode.completeMain:
        return 'COMPLETE_MAIN';
      case Eac3BitstreamMode.commentary:
        return 'COMMENTARY';
      case Eac3BitstreamMode.emergency:
        return 'EMERGENCY';
      case Eac3BitstreamMode.hearingImpaired:
        return 'HEARING_IMPAIRED';
      case Eac3BitstreamMode.visuallyImpaired:
        return 'VISUALLY_IMPAIRED';
    }
  }
}

extension on String {
  Eac3BitstreamMode toEac3BitstreamMode() {
    switch (this) {
      case 'COMPLETE_MAIN':
        return Eac3BitstreamMode.completeMain;
      case 'COMMENTARY':
        return Eac3BitstreamMode.commentary;
      case 'EMERGENCY':
        return Eac3BitstreamMode.emergency;
      case 'HEARING_IMPAIRED':
        return Eac3BitstreamMode.hearingImpaired;
      case 'VISUALLY_IMPAIRED':
        return Eac3BitstreamMode.visuallyImpaired;
    }
    throw Exception('$this is not known in enum Eac3BitstreamMode');
  }
}

/// Dolby Digital Plus coding mode. Determines number of channels.
enum Eac3CodingMode {
  codingMode_1_0,
  codingMode_2_0,
  codingMode_3_2,
}

extension on Eac3CodingMode {
  String toValue() {
    switch (this) {
      case Eac3CodingMode.codingMode_1_0:
        return 'CODING_MODE_1_0';
      case Eac3CodingMode.codingMode_2_0:
        return 'CODING_MODE_2_0';
      case Eac3CodingMode.codingMode_3_2:
        return 'CODING_MODE_3_2';
    }
  }
}

extension on String {
  Eac3CodingMode toEac3CodingMode() {
    switch (this) {
      case 'CODING_MODE_1_0':
        return Eac3CodingMode.codingMode_1_0;
      case 'CODING_MODE_2_0':
        return Eac3CodingMode.codingMode_2_0;
      case 'CODING_MODE_3_2':
        return Eac3CodingMode.codingMode_3_2;
    }
    throw Exception('$this is not known in enum Eac3CodingMode');
  }
}

/// Activates a DC highpass filter for all input channels.
enum Eac3DcFilter {
  enabled,
  disabled,
}

extension on Eac3DcFilter {
  String toValue() {
    switch (this) {
      case Eac3DcFilter.enabled:
        return 'ENABLED';
      case Eac3DcFilter.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  Eac3DcFilter toEac3DcFilter() {
    switch (this) {
      case 'ENABLED':
        return Eac3DcFilter.enabled;
      case 'DISABLED':
        return Eac3DcFilter.disabled;
    }
    throw Exception('$this is not known in enum Eac3DcFilter');
  }
}

/// Specify the absolute peak level for a signal with dynamic range compression.
enum Eac3DynamicRangeCompressionLine {
  none,
  filmStandard,
  filmLight,
  musicStandard,
  musicLight,
  speech,
}

extension on Eac3DynamicRangeCompressionLine {
  String toValue() {
    switch (this) {
      case Eac3DynamicRangeCompressionLine.none:
        return 'NONE';
      case Eac3DynamicRangeCompressionLine.filmStandard:
        return 'FILM_STANDARD';
      case Eac3DynamicRangeCompressionLine.filmLight:
        return 'FILM_LIGHT';
      case Eac3DynamicRangeCompressionLine.musicStandard:
        return 'MUSIC_STANDARD';
      case Eac3DynamicRangeCompressionLine.musicLight:
        return 'MUSIC_LIGHT';
      case Eac3DynamicRangeCompressionLine.speech:
        return 'SPEECH';
    }
  }
}

extension on String {
  Eac3DynamicRangeCompressionLine toEac3DynamicRangeCompressionLine() {
    switch (this) {
      case 'NONE':
        return Eac3DynamicRangeCompressionLine.none;
      case 'FILM_STANDARD':
        return Eac3DynamicRangeCompressionLine.filmStandard;
      case 'FILM_LIGHT':
        return Eac3DynamicRangeCompressionLine.filmLight;
      case 'MUSIC_STANDARD':
        return Eac3DynamicRangeCompressionLine.musicStandard;
      case 'MUSIC_LIGHT':
        return Eac3DynamicRangeCompressionLine.musicLight;
      case 'SPEECH':
        return Eac3DynamicRangeCompressionLine.speech;
    }
    throw Exception(
        '$this is not known in enum Eac3DynamicRangeCompressionLine');
  }
}

/// Specify how the service limits the audio dynamic range when compressing the
/// audio.
enum Eac3DynamicRangeCompressionRf {
  none,
  filmStandard,
  filmLight,
  musicStandard,
  musicLight,
  speech,
}

extension on Eac3DynamicRangeCompressionRf {
  String toValue() {
    switch (this) {
      case Eac3DynamicRangeCompressionRf.none:
        return 'NONE';
      case Eac3DynamicRangeCompressionRf.filmStandard:
        return 'FILM_STANDARD';
      case Eac3DynamicRangeCompressionRf.filmLight:
        return 'FILM_LIGHT';
      case Eac3DynamicRangeCompressionRf.musicStandard:
        return 'MUSIC_STANDARD';
      case Eac3DynamicRangeCompressionRf.musicLight:
        return 'MUSIC_LIGHT';
      case Eac3DynamicRangeCompressionRf.speech:
        return 'SPEECH';
    }
  }
}

extension on String {
  Eac3DynamicRangeCompressionRf toEac3DynamicRangeCompressionRf() {
    switch (this) {
      case 'NONE':
        return Eac3DynamicRangeCompressionRf.none;
      case 'FILM_STANDARD':
        return Eac3DynamicRangeCompressionRf.filmStandard;
      case 'FILM_LIGHT':
        return Eac3DynamicRangeCompressionRf.filmLight;
      case 'MUSIC_STANDARD':
        return Eac3DynamicRangeCompressionRf.musicStandard;
      case 'MUSIC_LIGHT':
        return Eac3DynamicRangeCompressionRf.musicLight;
      case 'SPEECH':
        return Eac3DynamicRangeCompressionRf.speech;
    }
    throw Exception('$this is not known in enum Eac3DynamicRangeCompressionRf');
  }
}

/// When encoding 3/2 audio, controls whether the LFE channel is enabled
enum Eac3LfeControl {
  lfe,
  noLfe,
}

extension on Eac3LfeControl {
  String toValue() {
    switch (this) {
      case Eac3LfeControl.lfe:
        return 'LFE';
      case Eac3LfeControl.noLfe:
        return 'NO_LFE';
    }
  }
}

extension on String {
  Eac3LfeControl toEac3LfeControl() {
    switch (this) {
      case 'LFE':
        return Eac3LfeControl.lfe;
      case 'NO_LFE':
        return Eac3LfeControl.noLfe;
    }
    throw Exception('$this is not known in enum Eac3LfeControl');
  }
}

/// Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only
/// valid with 3_2_LFE coding mode.
enum Eac3LfeFilter {
  enabled,
  disabled,
}

extension on Eac3LfeFilter {
  String toValue() {
    switch (this) {
      case Eac3LfeFilter.enabled:
        return 'ENABLED';
      case Eac3LfeFilter.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  Eac3LfeFilter toEac3LfeFilter() {
    switch (this) {
      case 'ENABLED':
        return Eac3LfeFilter.enabled;
      case 'DISABLED':
        return Eac3LfeFilter.disabled;
    }
    throw Exception('$this is not known in enum Eac3LfeFilter');
  }
}

/// When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+,
/// or DolbyE decoder that supplied this audio data. If audio was not supplied
/// from one of these streams, then the static metadata settings will be used.
enum Eac3MetadataControl {
  followInput,
  useConfigured,
}

extension on Eac3MetadataControl {
  String toValue() {
    switch (this) {
      case Eac3MetadataControl.followInput:
        return 'FOLLOW_INPUT';
      case Eac3MetadataControl.useConfigured:
        return 'USE_CONFIGURED';
    }
  }
}

extension on String {
  Eac3MetadataControl toEac3MetadataControl() {
    switch (this) {
      case 'FOLLOW_INPUT':
        return Eac3MetadataControl.followInput;
      case 'USE_CONFIGURED':
        return Eac3MetadataControl.useConfigured;
    }
    throw Exception('$this is not known in enum Eac3MetadataControl');
  }
}

/// When set to WHEN_POSSIBLE, input DD+ audio will be passed through if it is
/// present on the input. this detection is dynamic over the life of the
/// transcode. Inputs that alternate between DD+ and non-DD+ content will have a
/// consistent DD+ output as the system alternates between passthrough and
/// encoding.
enum Eac3PassthroughControl {
  whenPossible,
  noPassthrough,
}

extension on Eac3PassthroughControl {
  String toValue() {
    switch (this) {
      case Eac3PassthroughControl.whenPossible:
        return 'WHEN_POSSIBLE';
      case Eac3PassthroughControl.noPassthrough:
        return 'NO_PASSTHROUGH';
    }
  }
}

extension on String {
  Eac3PassthroughControl toEac3PassthroughControl() {
    switch (this) {
      case 'WHEN_POSSIBLE':
        return Eac3PassthroughControl.whenPossible;
      case 'NO_PASSTHROUGH':
        return Eac3PassthroughControl.noPassthrough;
    }
    throw Exception('$this is not known in enum Eac3PassthroughControl');
  }
}

/// Controls the amount of phase-shift applied to the surround channels. Only
/// used for 3/2 coding mode.
enum Eac3PhaseControl {
  shift_90Degrees,
  noShift,
}

extension on Eac3PhaseControl {
  String toValue() {
    switch (this) {
      case Eac3PhaseControl.shift_90Degrees:
        return 'SHIFT_90_DEGREES';
      case Eac3PhaseControl.noShift:
        return 'NO_SHIFT';
    }
  }
}

extension on String {
  Eac3PhaseControl toEac3PhaseControl() {
    switch (this) {
      case 'SHIFT_90_DEGREES':
        return Eac3PhaseControl.shift_90Degrees;
      case 'NO_SHIFT':
        return Eac3PhaseControl.noShift;
    }
    throw Exception('$this is not known in enum Eac3PhaseControl');
  }
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value EAC3.
class Eac3Settings {
  /// If set to ATTENUATE_3_DB, applies a 3 dB attenuation to the surround
  /// channels. Only used for 3/2 coding mode.
  final Eac3AttenuationControl? attenuationControl;

  /// Specify the average bitrate in bits per second. Valid bitrates depend on the
  /// coding mode.
  final int? bitrate;

  /// Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For
  /// more information about the EAC3 bitstream mode, see ATSC A/52-2012 (Annex
  /// E).
  final Eac3BitstreamMode? bitstreamMode;

  /// Dolby Digital Plus coding mode. Determines number of channels.
  final Eac3CodingMode? codingMode;

  /// Activates a DC highpass filter for all input channels.
  final Eac3DcFilter? dcFilter;

  /// Sets the dialnorm for the output. If blank and input audio is Dolby Digital
  /// Plus, dialnorm will be passed through.
  final int? dialnorm;

  /// Specify the absolute peak level for a signal with dynamic range compression.
  final Eac3DynamicRangeCompressionLine? dynamicRangeCompressionLine;

  /// Specify how the service limits the audio dynamic range when compressing the
  /// audio.
  final Eac3DynamicRangeCompressionRf? dynamicRangeCompressionRf;

  /// When encoding 3/2 audio, controls whether the LFE channel is enabled
  final Eac3LfeControl? lfeControl;

  /// Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only
  /// valid with 3_2_LFE coding mode.
  final Eac3LfeFilter? lfeFilter;

  /// Specify a value for the following Dolby Digital Plus setting: Left
  /// only/Right only center mix (Lo/Ro center). MediaConvert uses this value for
  /// downmixing. How the service uses this value depends on the value that you
  /// choose for Stereo downmix (Eac3StereoDownmix). Valid values: 3.0, 1.5, 0.0,
  /// -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel. This
  /// setting applies only if you keep the default value of 3/2 - L, R, C, Ls, Rs
  /// (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you
  /// choose a different value for Coding mode, the service ignores Left
  /// only/Right only center (loRoCenterMixLevel).
  final double? loRoCenterMixLevel;

  /// Specify a value for the following Dolby Digital Plus setting: Left
  /// only/Right only (Lo/Ro surround). MediaConvert uses this value for
  /// downmixing. How the service uses this value depends on the value that you
  /// choose for Stereo downmix (Eac3StereoDownmix). Valid values: -1.5, -3.0,
  /// -4.5, -6.0, and -60. The value -60 mutes the channel. This setting applies
  /// only if you keep the default value of 3/2 - L, R, C, Ls, Rs
  /// (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you
  /// choose a different value for Coding mode, the service ignores Left
  /// only/Right only surround (loRoSurroundMixLevel).
  final double? loRoSurroundMixLevel;

  /// Specify a value for the following Dolby Digital Plus setting: Left
  /// total/Right total center mix (Lt/Rt center). MediaConvert uses this value
  /// for downmixing. How the service uses this value depends on the value that
  /// you choose for Stereo downmix (Eac3StereoDownmix). Valid values: 3.0, 1.5,
  /// 0.0, -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel. This
  /// setting applies only if you keep the default value of 3/2 - L, R, C, Ls, Rs
  /// (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you
  /// choose a different value for Coding mode, the service ignores Left
  /// total/Right total center (ltRtCenterMixLevel).
  final double? ltRtCenterMixLevel;

  /// Specify a value for the following Dolby Digital Plus setting: Left
  /// total/Right total surround mix (Lt/Rt surround). MediaConvert uses this
  /// value for downmixing. How the service uses this value depends on the value
  /// that you choose for Stereo downmix (Eac3StereoDownmix). Valid values: -1.5,
  /// -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel. This setting
  /// applies only if you keep the default value of 3/2 - L, R, C, Ls, Rs
  /// (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you
  /// choose a different value for Coding mode, the service ignores Left
  /// total/Right total surround (ltRtSurroundMixLevel).
  final double? ltRtSurroundMixLevel;

  /// When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+,
  /// or DolbyE decoder that supplied this audio data. If audio was not supplied
  /// from one of these streams, then the static metadata settings will be used.
  final Eac3MetadataControl? metadataControl;

  /// When set to WHEN_POSSIBLE, input DD+ audio will be passed through if it is
  /// present on the input. this detection is dynamic over the life of the
  /// transcode. Inputs that alternate between DD+ and non-DD+ content will have a
  /// consistent DD+ output as the system alternates between passthrough and
  /// encoding.
  final Eac3PassthroughControl? passthroughControl;

  /// Controls the amount of phase-shift applied to the surround channels. Only
  /// used for 3/2 coding mode.
  final Eac3PhaseControl? phaseControl;

  /// This value is always 48000. It represents the sample rate in Hz.
  final int? sampleRate;

  /// Choose how the service does stereo downmixing. This setting only applies if
  /// you keep the default value of 3/2 - L, R, C, Ls, Rs (CODING_MODE_3_2) for
  /// the setting Coding mode (Eac3CodingMode). If you choose a different value
  /// for Coding mode, the service ignores Stereo downmix (Eac3StereoDownmix).
  final Eac3StereoDownmix? stereoDownmix;

  /// When encoding 3/2 audio, sets whether an extra center back surround channel
  /// is matrix encoded into the left and right surround channels.
  final Eac3SurroundExMode? surroundExMode;

  /// When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded into
  /// the two channels.
  final Eac3SurroundMode? surroundMode;

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
  factory Eac3Settings.fromJson(Map<String, dynamic> json) {
    return Eac3Settings(
      attenuationControl:
          (json['attenuationControl'] as String?)?.toEac3AttenuationControl(),
      bitrate: json['bitrate'] as int?,
      bitstreamMode: (json['bitstreamMode'] as String?)?.toEac3BitstreamMode(),
      codingMode: (json['codingMode'] as String?)?.toEac3CodingMode(),
      dcFilter: (json['dcFilter'] as String?)?.toEac3DcFilter(),
      dialnorm: json['dialnorm'] as int?,
      dynamicRangeCompressionLine:
          (json['dynamicRangeCompressionLine'] as String?)
              ?.toEac3DynamicRangeCompressionLine(),
      dynamicRangeCompressionRf: (json['dynamicRangeCompressionRf'] as String?)
          ?.toEac3DynamicRangeCompressionRf(),
      lfeControl: (json['lfeControl'] as String?)?.toEac3LfeControl(),
      lfeFilter: (json['lfeFilter'] as String?)?.toEac3LfeFilter(),
      loRoCenterMixLevel: json['loRoCenterMixLevel'] as double?,
      loRoSurroundMixLevel: json['loRoSurroundMixLevel'] as double?,
      ltRtCenterMixLevel: json['ltRtCenterMixLevel'] as double?,
      ltRtSurroundMixLevel: json['ltRtSurroundMixLevel'] as double?,
      metadataControl:
          (json['metadataControl'] as String?)?.toEac3MetadataControl(),
      passthroughControl:
          (json['passthroughControl'] as String?)?.toEac3PassthroughControl(),
      phaseControl: (json['phaseControl'] as String?)?.toEac3PhaseControl(),
      sampleRate: json['sampleRate'] as int?,
      stereoDownmix: (json['stereoDownmix'] as String?)?.toEac3StereoDownmix(),
      surroundExMode:
          (json['surroundExMode'] as String?)?.toEac3SurroundExMode(),
      surroundMode: (json['surroundMode'] as String?)?.toEac3SurroundMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final attenuationControl = this.attenuationControl;
    final bitrate = this.bitrate;
    final bitstreamMode = this.bitstreamMode;
    final codingMode = this.codingMode;
    final dcFilter = this.dcFilter;
    final dialnorm = this.dialnorm;
    final dynamicRangeCompressionLine = this.dynamicRangeCompressionLine;
    final dynamicRangeCompressionRf = this.dynamicRangeCompressionRf;
    final lfeControl = this.lfeControl;
    final lfeFilter = this.lfeFilter;
    final loRoCenterMixLevel = this.loRoCenterMixLevel;
    final loRoSurroundMixLevel = this.loRoSurroundMixLevel;
    final ltRtCenterMixLevel = this.ltRtCenterMixLevel;
    final ltRtSurroundMixLevel = this.ltRtSurroundMixLevel;
    final metadataControl = this.metadataControl;
    final passthroughControl = this.passthroughControl;
    final phaseControl = this.phaseControl;
    final sampleRate = this.sampleRate;
    final stereoDownmix = this.stereoDownmix;
    final surroundExMode = this.surroundExMode;
    final surroundMode = this.surroundMode;
    return {
      if (attenuationControl != null)
        'attenuationControl': attenuationControl.toValue(),
      if (bitrate != null) 'bitrate': bitrate,
      if (bitstreamMode != null) 'bitstreamMode': bitstreamMode.toValue(),
      if (codingMode != null) 'codingMode': codingMode.toValue(),
      if (dcFilter != null) 'dcFilter': dcFilter.toValue(),
      if (dialnorm != null) 'dialnorm': dialnorm,
      if (dynamicRangeCompressionLine != null)
        'dynamicRangeCompressionLine': dynamicRangeCompressionLine.toValue(),
      if (dynamicRangeCompressionRf != null)
        'dynamicRangeCompressionRf': dynamicRangeCompressionRf.toValue(),
      if (lfeControl != null) 'lfeControl': lfeControl.toValue(),
      if (lfeFilter != null) 'lfeFilter': lfeFilter.toValue(),
      if (loRoCenterMixLevel != null) 'loRoCenterMixLevel': loRoCenterMixLevel,
      if (loRoSurroundMixLevel != null)
        'loRoSurroundMixLevel': loRoSurroundMixLevel,
      if (ltRtCenterMixLevel != null) 'ltRtCenterMixLevel': ltRtCenterMixLevel,
      if (ltRtSurroundMixLevel != null)
        'ltRtSurroundMixLevel': ltRtSurroundMixLevel,
      if (metadataControl != null) 'metadataControl': metadataControl.toValue(),
      if (passthroughControl != null)
        'passthroughControl': passthroughControl.toValue(),
      if (phaseControl != null) 'phaseControl': phaseControl.toValue(),
      if (sampleRate != null) 'sampleRate': sampleRate,
      if (stereoDownmix != null) 'stereoDownmix': stereoDownmix.toValue(),
      if (surroundExMode != null) 'surroundExMode': surroundExMode.toValue(),
      if (surroundMode != null) 'surroundMode': surroundMode.toValue(),
    };
  }
}

/// Choose how the service does stereo downmixing. This setting only applies if
/// you keep the default value of 3/2 - L, R, C, Ls, Rs (CODING_MODE_3_2) for
/// the setting Coding mode (Eac3CodingMode). If you choose a different value
/// for Coding mode, the service ignores Stereo downmix (Eac3StereoDownmix).
enum Eac3StereoDownmix {
  notIndicated,
  loRo,
  ltRt,
  dpl2,
}

extension on Eac3StereoDownmix {
  String toValue() {
    switch (this) {
      case Eac3StereoDownmix.notIndicated:
        return 'NOT_INDICATED';
      case Eac3StereoDownmix.loRo:
        return 'LO_RO';
      case Eac3StereoDownmix.ltRt:
        return 'LT_RT';
      case Eac3StereoDownmix.dpl2:
        return 'DPL2';
    }
  }
}

extension on String {
  Eac3StereoDownmix toEac3StereoDownmix() {
    switch (this) {
      case 'NOT_INDICATED':
        return Eac3StereoDownmix.notIndicated;
      case 'LO_RO':
        return Eac3StereoDownmix.loRo;
      case 'LT_RT':
        return Eac3StereoDownmix.ltRt;
      case 'DPL2':
        return Eac3StereoDownmix.dpl2;
    }
    throw Exception('$this is not known in enum Eac3StereoDownmix');
  }
}

/// When encoding 3/2 audio, sets whether an extra center back surround channel
/// is matrix encoded into the left and right surround channels.
enum Eac3SurroundExMode {
  notIndicated,
  enabled,
  disabled,
}

extension on Eac3SurroundExMode {
  String toValue() {
    switch (this) {
      case Eac3SurroundExMode.notIndicated:
        return 'NOT_INDICATED';
      case Eac3SurroundExMode.enabled:
        return 'ENABLED';
      case Eac3SurroundExMode.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  Eac3SurroundExMode toEac3SurroundExMode() {
    switch (this) {
      case 'NOT_INDICATED':
        return Eac3SurroundExMode.notIndicated;
      case 'ENABLED':
        return Eac3SurroundExMode.enabled;
      case 'DISABLED':
        return Eac3SurroundExMode.disabled;
    }
    throw Exception('$this is not known in enum Eac3SurroundExMode');
  }
}

/// When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded into
/// the two channels.
enum Eac3SurroundMode {
  notIndicated,
  enabled,
  disabled,
}

extension on Eac3SurroundMode {
  String toValue() {
    switch (this) {
      case Eac3SurroundMode.notIndicated:
        return 'NOT_INDICATED';
      case Eac3SurroundMode.enabled:
        return 'ENABLED';
      case Eac3SurroundMode.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  Eac3SurroundMode toEac3SurroundMode() {
    switch (this) {
      case 'NOT_INDICATED':
        return Eac3SurroundMode.notIndicated;
      case 'ENABLED':
        return Eac3SurroundMode.enabled;
      case 'DISABLED':
        return Eac3SurroundMode.disabled;
    }
    throw Exception('$this is not known in enum Eac3SurroundMode');
  }
}

/// Specify whether this set of input captions appears in your outputs in both
/// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
/// includes the captions data in two ways: it passes the 608 data through using
/// the 608 compatibility bytes fields of the 708 wrapper, and it also
/// translates the 608 data into 708.
enum EmbeddedConvert608To708 {
  upconvert,
  disabled,
}

extension on EmbeddedConvert608To708 {
  String toValue() {
    switch (this) {
      case EmbeddedConvert608To708.upconvert:
        return 'UPCONVERT';
      case EmbeddedConvert608To708.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  EmbeddedConvert608To708 toEmbeddedConvert608To708() {
    switch (this) {
      case 'UPCONVERT':
        return EmbeddedConvert608To708.upconvert;
      case 'DISABLED':
        return EmbeddedConvert608To708.disabled;
    }
    throw Exception('$this is not known in enum EmbeddedConvert608To708');
  }
}

/// Settings specific to embedded/ancillary caption outputs, including 608/708
/// Channel destination number.
class EmbeddedDestinationSettings {
  /// Ignore this setting unless your input captions are SCC format and your
  /// output captions are embedded in the video stream. Specify a CC number for
  /// each captions channel in this output. If you have two channels, choose CC
  /// numbers that aren't in the same field. For example, choose 1 and 3. For more
  /// information, see
  /// https://docs.aws.amazon.com/console/mediaconvert/dual-scc-to-embedded.
  final int? destination608ChannelNumber;

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
  final int? destination708ServiceNumber;

  EmbeddedDestinationSettings({
    this.destination608ChannelNumber,
    this.destination708ServiceNumber,
  });
  factory EmbeddedDestinationSettings.fromJson(Map<String, dynamic> json) {
    return EmbeddedDestinationSettings(
      destination608ChannelNumber: json['destination608ChannelNumber'] as int?,
      destination708ServiceNumber: json['destination708ServiceNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination608ChannelNumber = this.destination608ChannelNumber;
    final destination708ServiceNumber = this.destination708ServiceNumber;
    return {
      if (destination608ChannelNumber != null)
        'destination608ChannelNumber': destination608ChannelNumber,
      if (destination708ServiceNumber != null)
        'destination708ServiceNumber': destination708ServiceNumber,
    };
  }
}

/// Settings for embedded captions Source
class EmbeddedSourceSettings {
  /// Specify whether this set of input captions appears in your outputs in both
  /// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
  /// includes the captions data in two ways: it passes the 608 data through using
  /// the 608 compatibility bytes fields of the 708 wrapper, and it also
  /// translates the 608 data into 708.
  final EmbeddedConvert608To708? convert608To708;

  /// Specifies the 608/708 channel number within the video track from which to
  /// extract captions. Unused for passthrough.
  final int? source608ChannelNumber;

  /// Specifies the video track index used for extracting captions. The system
  /// only supports one input video track, so this should always be set to '1'.
  final int? source608TrackNumber;

  /// By default, the service terminates any unterminated captions at the end of
  /// each input. If you want the caption to continue onto your next input,
  /// disable this setting.
  final EmbeddedTerminateCaptions? terminateCaptions;

  EmbeddedSourceSettings({
    this.convert608To708,
    this.source608ChannelNumber,
    this.source608TrackNumber,
    this.terminateCaptions,
  });
  factory EmbeddedSourceSettings.fromJson(Map<String, dynamic> json) {
    return EmbeddedSourceSettings(
      convert608To708:
          (json['convert608To708'] as String?)?.toEmbeddedConvert608To708(),
      source608ChannelNumber: json['source608ChannelNumber'] as int?,
      source608TrackNumber: json['source608TrackNumber'] as int?,
      terminateCaptions:
          (json['terminateCaptions'] as String?)?.toEmbeddedTerminateCaptions(),
    );
  }

  Map<String, dynamic> toJson() {
    final convert608To708 = this.convert608To708;
    final source608ChannelNumber = this.source608ChannelNumber;
    final source608TrackNumber = this.source608TrackNumber;
    final terminateCaptions = this.terminateCaptions;
    return {
      if (convert608To708 != null) 'convert608To708': convert608To708.toValue(),
      if (source608ChannelNumber != null)
        'source608ChannelNumber': source608ChannelNumber,
      if (source608TrackNumber != null)
        'source608TrackNumber': source608TrackNumber,
      if (terminateCaptions != null)
        'terminateCaptions': terminateCaptions.toValue(),
    };
  }
}

/// By default, the service terminates any unterminated captions at the end of
/// each input. If you want the caption to continue onto your next input,
/// disable this setting.
enum EmbeddedTerminateCaptions {
  endOfInput,
  disabled,
}

extension on EmbeddedTerminateCaptions {
  String toValue() {
    switch (this) {
      case EmbeddedTerminateCaptions.endOfInput:
        return 'END_OF_INPUT';
      case EmbeddedTerminateCaptions.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  EmbeddedTerminateCaptions toEmbeddedTerminateCaptions() {
    switch (this) {
      case 'END_OF_INPUT':
        return EmbeddedTerminateCaptions.endOfInput;
      case 'DISABLED':
        return EmbeddedTerminateCaptions.disabled;
    }
    throw Exception('$this is not known in enum EmbeddedTerminateCaptions');
  }
}

/// Describes an account-specific API endpoint.
class Endpoint {
  /// URL of endpoint
  final String? url;

  Endpoint({
    this.url,
  });
  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      url: json['url'] as String?,
    );
  }
}

/// ESAM ManifestConfirmConditionNotification defined by
/// OC-SP-ESAM-API-I03-131025.
class EsamManifestConfirmConditionNotification {
  /// Provide your ESAM ManifestConfirmConditionNotification XML document inside
  /// your JSON job settings. Form the XML document as per
  /// OC-SP-ESAM-API-I03-131025. The transcoder will use the Manifest Conditioning
  /// instructions in the message that you supply.
  final String? mccXml;

  EsamManifestConfirmConditionNotification({
    this.mccXml,
  });
  factory EsamManifestConfirmConditionNotification.fromJson(
      Map<String, dynamic> json) {
    return EsamManifestConfirmConditionNotification(
      mccXml: json['mccXml'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mccXml = this.mccXml;
    return {
      if (mccXml != null) 'mccXml': mccXml,
    };
  }
}

/// Settings for Event Signaling And Messaging (ESAM). If you don't do ad
/// insertion, you can ignore these settings.
class EsamSettings {
  /// Specifies an ESAM ManifestConfirmConditionNotification XML as per
  /// OC-SP-ESAM-API-I03-131025. The transcoder uses the manifest conditioning
  /// instructions that you provide in the setting MCC XML (mccXml).
  final EsamManifestConfirmConditionNotification?
      manifestConfirmConditionNotification;

  /// Specifies the stream distance, in milliseconds, between the SCTE 35 messages
  /// that the transcoder places and the splice points that they refer to. If the
  /// time between the start of the asset and the SCTE-35 message is less than
  /// this value, then the transcoder places the SCTE-35 marker at the beginning
  /// of the stream.
  final int? responseSignalPreroll;

  /// Specifies an ESAM SignalProcessingNotification XML as per
  /// OC-SP-ESAM-API-I03-131025. The transcoder uses the signal processing
  /// instructions that you provide in the setting SCC XML (sccXml).
  final EsamSignalProcessingNotification? signalProcessingNotification;

  EsamSettings({
    this.manifestConfirmConditionNotification,
    this.responseSignalPreroll,
    this.signalProcessingNotification,
  });
  factory EsamSettings.fromJson(Map<String, dynamic> json) {
    return EsamSettings(
      manifestConfirmConditionNotification:
          json['manifestConfirmConditionNotification'] != null
              ? EsamManifestConfirmConditionNotification.fromJson(
                  json['manifestConfirmConditionNotification']
                      as Map<String, dynamic>)
              : null,
      responseSignalPreroll: json['responseSignalPreroll'] as int?,
      signalProcessingNotification: json['signalProcessingNotification'] != null
          ? EsamSignalProcessingNotification.fromJson(
              json['signalProcessingNotification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestConfirmConditionNotification =
        this.manifestConfirmConditionNotification;
    final responseSignalPreroll = this.responseSignalPreroll;
    final signalProcessingNotification = this.signalProcessingNotification;
    return {
      if (manifestConfirmConditionNotification != null)
        'manifestConfirmConditionNotification':
            manifestConfirmConditionNotification,
      if (responseSignalPreroll != null)
        'responseSignalPreroll': responseSignalPreroll,
      if (signalProcessingNotification != null)
        'signalProcessingNotification': signalProcessingNotification,
    };
  }
}

/// ESAM SignalProcessingNotification data defined by OC-SP-ESAM-API-I03-131025.
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
  final String? sccXml;

  EsamSignalProcessingNotification({
    this.sccXml,
  });
  factory EsamSignalProcessingNotification.fromJson(Map<String, dynamic> json) {
    return EsamSignalProcessingNotification(
      sccXml: json['sccXml'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sccXml = this.sccXml;
    return {
      if (sccXml != null) 'sccXml': sccXml,
    };
  }
}

/// If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the beginning
/// of the archive as required for progressive downloading. Otherwise it is
/// placed normally at the end.
enum F4vMoovPlacement {
  progressiveDownload,
  normal,
}

extension on F4vMoovPlacement {
  String toValue() {
    switch (this) {
      case F4vMoovPlacement.progressiveDownload:
        return 'PROGRESSIVE_DOWNLOAD';
      case F4vMoovPlacement.normal:
        return 'NORMAL';
    }
  }
}

extension on String {
  F4vMoovPlacement toF4vMoovPlacement() {
    switch (this) {
      case 'PROGRESSIVE_DOWNLOAD':
        return F4vMoovPlacement.progressiveDownload;
      case 'NORMAL':
        return F4vMoovPlacement.normal;
    }
    throw Exception('$this is not known in enum F4vMoovPlacement');
  }
}

/// Settings for F4v container
class F4vSettings {
  /// If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the beginning
  /// of the archive as required for progressive downloading. Otherwise it is
  /// placed normally at the end.
  final F4vMoovPlacement? moovPlacement;

  F4vSettings({
    this.moovPlacement,
  });
  factory F4vSettings.fromJson(Map<String, dynamic> json) {
    return F4vSettings(
      moovPlacement: (json['moovPlacement'] as String?)?.toF4vMoovPlacement(),
    );
  }

  Map<String, dynamic> toJson() {
    final moovPlacement = this.moovPlacement;
    return {
      if (moovPlacement != null) 'moovPlacement': moovPlacement.toValue(),
    };
  }
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// FILE_GROUP_SETTINGS.
class FileGroupSettings {
  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do not
  /// specify the base filename in the URI, the service will use the filename of
  /// the input file. If your job has multiple inputs, the service uses the
  /// filename of the first input file.
  final String? destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  final DestinationSettings? destinationSettings;

  FileGroupSettings({
    this.destination,
    this.destinationSettings,
  });
  factory FileGroupSettings.fromJson(Map<String, dynamic> json) {
    return FileGroupSettings(
      destination: json['destination'] as String?,
      destinationSettings: json['destinationSettings'] != null
          ? DestinationSettings.fromJson(
              json['destinationSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final destinationSettings = this.destinationSettings;
    return {
      if (destination != null) 'destination': destination,
      if (destinationSettings != null)
        'destinationSettings': destinationSettings,
    };
  }
}

/// Specify whether this set of input captions appears in your outputs in both
/// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
/// includes the captions data in two ways: it passes the 608 data through using
/// the 608 compatibility bytes fields of the 708 wrapper, and it also
/// translates the 608 data into 708.
enum FileSourceConvert608To708 {
  upconvert,
  disabled,
}

extension on FileSourceConvert608To708 {
  String toValue() {
    switch (this) {
      case FileSourceConvert608To708.upconvert:
        return 'UPCONVERT';
      case FileSourceConvert608To708.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  FileSourceConvert608To708 toFileSourceConvert608To708() {
    switch (this) {
      case 'UPCONVERT':
        return FileSourceConvert608To708.upconvert;
      case 'DISABLED':
        return FileSourceConvert608To708.disabled;
    }
    throw Exception('$this is not known in enum FileSourceConvert608To708');
  }
}

/// If your input captions are SCC, SMI, SRT, STL, TTML, or IMSC 1.1 in an xml
/// file, specify the URI of the input caption source file. If your caption
/// source is IMSC in an IMF package, use TrackSourceSettings instead of
/// FileSoureSettings.
class FileSourceSettings {
  /// Specify whether this set of input captions appears in your outputs in both
  /// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
  /// includes the captions data in two ways: it passes the 608 data through using
  /// the 608 compatibility bytes fields of the 708 wrapper, and it also
  /// translates the 608 data into 708.
  final FileSourceConvert608To708? convert608To708;

  /// Ignore this setting unless your input captions format is SCC. To have the
  /// service compensate for differing frame rates between your input captions and
  /// input video, specify the frame rate of the captions file. Specify this value
  /// as a fraction, using the settings Framerate numerator (framerateNumerator)
  /// and Framerate denominator (framerateDenominator). For example, you might
  /// specify 24 / 1 for 24 fps, 25 / 1 for 25 fps, 24000 / 1001 for 23.976 fps,
  /// or 30000 / 1001 for 29.97 fps.
  final CaptionSourceFramerate? framerate;

  /// External caption file used for loading captions. Accepted file extensions
  /// are 'scc', 'ttml', 'dfxp', 'stl', 'srt', 'xml', and 'smi'.
  final String? sourceFile;

  /// Specifies a time delta in seconds to offset the captions from the source
  /// file.
  final int? timeDelta;

  FileSourceSettings({
    this.convert608To708,
    this.framerate,
    this.sourceFile,
    this.timeDelta,
  });
  factory FileSourceSettings.fromJson(Map<String, dynamic> json) {
    return FileSourceSettings(
      convert608To708:
          (json['convert608To708'] as String?)?.toFileSourceConvert608To708(),
      framerate: json['framerate'] != null
          ? CaptionSourceFramerate.fromJson(
              json['framerate'] as Map<String, dynamic>)
          : null,
      sourceFile: json['sourceFile'] as String?,
      timeDelta: json['timeDelta'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final convert608To708 = this.convert608To708;
    final framerate = this.framerate;
    final sourceFile = this.sourceFile;
    final timeDelta = this.timeDelta;
    return {
      if (convert608To708 != null) 'convert608To708': convert608To708.toValue(),
      if (framerate != null) 'framerate': framerate,
      if (sourceFile != null) 'sourceFile': sourceFile,
      if (timeDelta != null) 'timeDelta': timeDelta,
    };
  }
}

/// Provide the font script, using an ISO 15924 script code, if the LanguageCode
/// is not sufficient for determining the script type. Where LanguageCode or
/// CustomLanguageCode is sufficient, use "AUTOMATIC" or leave unset.
enum FontScript {
  automatic,
  hans,
  hant,
}

extension on FontScript {
  String toValue() {
    switch (this) {
      case FontScript.automatic:
        return 'AUTOMATIC';
      case FontScript.hans:
        return 'HANS';
      case FontScript.hant:
        return 'HANT';
    }
  }
}

extension on String {
  FontScript toFontScript() {
    switch (this) {
      case 'AUTOMATIC':
        return FontScript.automatic;
      case 'HANS':
        return FontScript.hans;
      case 'HANT':
        return FontScript.hant;
    }
    throw Exception('$this is not known in enum FontScript');
  }
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value FRAME_CAPTURE.
class FrameCaptureSettings {
  /// Frame capture will encode the first frame of the output stream, then one
  /// frame every framerateDenominator/framerateNumerator seconds. For example,
  /// settings of framerateNumerator = 1 and framerateDenominator = 3 (a rate of
  /// 1/3 frame per second) will capture the first frame, then 1 frame every 3s.
  /// Files will be named as filename.n.jpg where n is the 0-based sequence number
  /// of each Capture.
  final int? framerateDenominator;

  /// Frame capture will encode the first frame of the output stream, then one
  /// frame every framerateDenominator/framerateNumerator seconds. For example,
  /// settings of framerateNumerator = 1 and framerateDenominator = 3 (a rate of
  /// 1/3 frame per second) will capture the first frame, then 1 frame every 3s.
  /// Files will be named as filename.NNNNNNN.jpg where N is the 0-based frame
  /// sequence number zero padded to 7 decimal places.
  final int? framerateNumerator;

  /// Maximum number of captures (encoded jpg output files).
  final int? maxCaptures;

  /// JPEG Quality - a higher value equals higher quality.
  final int? quality;

  FrameCaptureSettings({
    this.framerateDenominator,
    this.framerateNumerator,
    this.maxCaptures,
    this.quality,
  });
  factory FrameCaptureSettings.fromJson(Map<String, dynamic> json) {
    return FrameCaptureSettings(
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
      maxCaptures: json['maxCaptures'] as int?,
      quality: json['quality'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final maxCaptures = this.maxCaptures;
    final quality = this.quality;
    return {
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
      if (maxCaptures != null) 'maxCaptures': maxCaptures,
      if (quality != null) 'quality': quality,
    };
  }
}

class GetJobResponse {
  /// Each job converts an input file into an output file or files. For more
  /// information, see the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  final Job? job;

  GetJobResponse({
    this.job,
  });
  factory GetJobResponse.fromJson(Map<String, dynamic> json) {
    return GetJobResponse(
      job: json['job'] != null
          ? Job.fromJson(json['job'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetJobTemplateResponse {
  /// A job template is a pre-made set of encoding instructions that you can use
  /// to quickly create a job.
  final JobTemplate? jobTemplate;

  GetJobTemplateResponse({
    this.jobTemplate,
  });
  factory GetJobTemplateResponse.fromJson(Map<String, dynamic> json) {
    return GetJobTemplateResponse(
      jobTemplate: json['jobTemplate'] != null
          ? JobTemplate.fromJson(json['jobTemplate'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetPresetResponse {
  /// A preset is a collection of preconfigured media conversion settings that you
  /// want MediaConvert to apply to the output during the conversion process.
  final Preset? preset;

  GetPresetResponse({
    this.preset,
  });
  factory GetPresetResponse.fromJson(Map<String, dynamic> json) {
    return GetPresetResponse(
      preset: json['preset'] != null
          ? Preset.fromJson(json['preset'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetQueueResponse {
  /// You can use queues to manage the resources that are available to your AWS
  /// account for running multiple transcoding jobs at the same time. If you don't
  /// specify a queue, the service sends all jobs through the default queue. For
  /// more information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
  final Queue? queue;

  GetQueueResponse({
    this.queue,
  });
  factory GetQueueResponse.fromJson(Map<String, dynamic> json) {
    return GetQueueResponse(
      queue: json['queue'] != null
          ? Queue.fromJson(json['queue'] as Map<String, dynamic>)
          : null,
    );
  }
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
  off,
  auto,
  low,
  medium,
  high,
  higher,
  max,
}

extension on H264AdaptiveQuantization {
  String toValue() {
    switch (this) {
      case H264AdaptiveQuantization.off:
        return 'OFF';
      case H264AdaptiveQuantization.auto:
        return 'AUTO';
      case H264AdaptiveQuantization.low:
        return 'LOW';
      case H264AdaptiveQuantization.medium:
        return 'MEDIUM';
      case H264AdaptiveQuantization.high:
        return 'HIGH';
      case H264AdaptiveQuantization.higher:
        return 'HIGHER';
      case H264AdaptiveQuantization.max:
        return 'MAX';
    }
  }
}

extension on String {
  H264AdaptiveQuantization toH264AdaptiveQuantization() {
    switch (this) {
      case 'OFF':
        return H264AdaptiveQuantization.off;
      case 'AUTO':
        return H264AdaptiveQuantization.auto;
      case 'LOW':
        return H264AdaptiveQuantization.low;
      case 'MEDIUM':
        return H264AdaptiveQuantization.medium;
      case 'HIGH':
        return H264AdaptiveQuantization.high;
      case 'HIGHER':
        return H264AdaptiveQuantization.higher;
      case 'MAX':
        return H264AdaptiveQuantization.max;
    }
    throw Exception('$this is not known in enum H264AdaptiveQuantization');
  }
}

/// Specify an H.264 level that is consistent with your output video settings.
/// If you aren't sure what level to specify, choose Auto (AUTO).
enum H264CodecLevel {
  auto,
  level_1,
  level_1_1,
  level_1_2,
  level_1_3,
  level_2,
  level_2_1,
  level_2_2,
  level_3,
  level_3_1,
  level_3_2,
  level_4,
  level_4_1,
  level_4_2,
  level_5,
  level_5_1,
  level_5_2,
}

extension on H264CodecLevel {
  String toValue() {
    switch (this) {
      case H264CodecLevel.auto:
        return 'AUTO';
      case H264CodecLevel.level_1:
        return 'LEVEL_1';
      case H264CodecLevel.level_1_1:
        return 'LEVEL_1_1';
      case H264CodecLevel.level_1_2:
        return 'LEVEL_1_2';
      case H264CodecLevel.level_1_3:
        return 'LEVEL_1_3';
      case H264CodecLevel.level_2:
        return 'LEVEL_2';
      case H264CodecLevel.level_2_1:
        return 'LEVEL_2_1';
      case H264CodecLevel.level_2_2:
        return 'LEVEL_2_2';
      case H264CodecLevel.level_3:
        return 'LEVEL_3';
      case H264CodecLevel.level_3_1:
        return 'LEVEL_3_1';
      case H264CodecLevel.level_3_2:
        return 'LEVEL_3_2';
      case H264CodecLevel.level_4:
        return 'LEVEL_4';
      case H264CodecLevel.level_4_1:
        return 'LEVEL_4_1';
      case H264CodecLevel.level_4_2:
        return 'LEVEL_4_2';
      case H264CodecLevel.level_5:
        return 'LEVEL_5';
      case H264CodecLevel.level_5_1:
        return 'LEVEL_5_1';
      case H264CodecLevel.level_5_2:
        return 'LEVEL_5_2';
    }
  }
}

extension on String {
  H264CodecLevel toH264CodecLevel() {
    switch (this) {
      case 'AUTO':
        return H264CodecLevel.auto;
      case 'LEVEL_1':
        return H264CodecLevel.level_1;
      case 'LEVEL_1_1':
        return H264CodecLevel.level_1_1;
      case 'LEVEL_1_2':
        return H264CodecLevel.level_1_2;
      case 'LEVEL_1_3':
        return H264CodecLevel.level_1_3;
      case 'LEVEL_2':
        return H264CodecLevel.level_2;
      case 'LEVEL_2_1':
        return H264CodecLevel.level_2_1;
      case 'LEVEL_2_2':
        return H264CodecLevel.level_2_2;
      case 'LEVEL_3':
        return H264CodecLevel.level_3;
      case 'LEVEL_3_1':
        return H264CodecLevel.level_3_1;
      case 'LEVEL_3_2':
        return H264CodecLevel.level_3_2;
      case 'LEVEL_4':
        return H264CodecLevel.level_4;
      case 'LEVEL_4_1':
        return H264CodecLevel.level_4_1;
      case 'LEVEL_4_2':
        return H264CodecLevel.level_4_2;
      case 'LEVEL_5':
        return H264CodecLevel.level_5;
      case 'LEVEL_5_1':
        return H264CodecLevel.level_5_1;
      case 'LEVEL_5_2':
        return H264CodecLevel.level_5_2;
    }
    throw Exception('$this is not known in enum H264CodecLevel');
  }
}

/// H.264 Profile. High 4:2:2 and 10-bit profiles are only available with the
/// AVC-I License.
enum H264CodecProfile {
  baseline,
  high,
  high_10bit,
  high_422,
  high_422_10bit,
  main,
}

extension on H264CodecProfile {
  String toValue() {
    switch (this) {
      case H264CodecProfile.baseline:
        return 'BASELINE';
      case H264CodecProfile.high:
        return 'HIGH';
      case H264CodecProfile.high_10bit:
        return 'HIGH_10BIT';
      case H264CodecProfile.high_422:
        return 'HIGH_422';
      case H264CodecProfile.high_422_10bit:
        return 'HIGH_422_10BIT';
      case H264CodecProfile.main:
        return 'MAIN';
    }
  }
}

extension on String {
  H264CodecProfile toH264CodecProfile() {
    switch (this) {
      case 'BASELINE':
        return H264CodecProfile.baseline;
      case 'HIGH':
        return H264CodecProfile.high;
      case 'HIGH_10BIT':
        return H264CodecProfile.high_10bit;
      case 'HIGH_422':
        return H264CodecProfile.high_422;
      case 'HIGH_422_10BIT':
        return H264CodecProfile.high_422_10bit;
      case 'MAIN':
        return H264CodecProfile.main;
    }
    throw Exception('$this is not known in enum H264CodecProfile');
  }
}

/// Choose Adaptive to improve subjective video quality for high-motion content.
/// This will cause the service to use fewer B-frames (which infer information
/// based on other frames) for high-motion portions of the video and more
/// B-frames for low-motion portions. The maximum number of B-frames is limited
/// by the value you provide for the setting B frames between reference frames
/// (numberBFramesBetweenReferenceFrames).
enum H264DynamicSubGop {
  adaptive,
  static,
}

extension on H264DynamicSubGop {
  String toValue() {
    switch (this) {
      case H264DynamicSubGop.adaptive:
        return 'ADAPTIVE';
      case H264DynamicSubGop.static:
        return 'STATIC';
    }
  }
}

extension on String {
  H264DynamicSubGop toH264DynamicSubGop() {
    switch (this) {
      case 'ADAPTIVE':
        return H264DynamicSubGop.adaptive;
      case 'STATIC':
        return H264DynamicSubGop.static;
    }
    throw Exception('$this is not known in enum H264DynamicSubGop');
  }
}

/// Entropy encoding mode. Use CABAC (must be in Main or High profile) or CAVLC.
enum H264EntropyEncoding {
  cabac,
  cavlc,
}

extension on H264EntropyEncoding {
  String toValue() {
    switch (this) {
      case H264EntropyEncoding.cabac:
        return 'CABAC';
      case H264EntropyEncoding.cavlc:
        return 'CAVLC';
    }
  }
}

extension on String {
  H264EntropyEncoding toH264EntropyEncoding() {
    switch (this) {
      case 'CABAC':
        return H264EntropyEncoding.cabac;
      case 'CAVLC':
        return H264EntropyEncoding.cavlc;
    }
    throw Exception('$this is not known in enum H264EntropyEncoding');
  }
}

/// Keep the default value, PAFF, to have MediaConvert use PAFF encoding for
/// interlaced outputs. Choose Force field (FORCE_FIELD) to disable PAFF
/// encoding and create separate interlaced fields.
enum H264FieldEncoding {
  paff,
  forceField,
}

extension on H264FieldEncoding {
  String toValue() {
    switch (this) {
      case H264FieldEncoding.paff:
        return 'PAFF';
      case H264FieldEncoding.forceField:
        return 'FORCE_FIELD';
    }
  }
}

extension on String {
  H264FieldEncoding toH264FieldEncoding() {
    switch (this) {
      case 'PAFF':
        return H264FieldEncoding.paff;
      case 'FORCE_FIELD':
        return H264FieldEncoding.forceField;
    }
    throw Exception('$this is not known in enum H264FieldEncoding');
  }
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
  disabled,
  enabled,
}

extension on H264FlickerAdaptiveQuantization {
  String toValue() {
    switch (this) {
      case H264FlickerAdaptiveQuantization.disabled:
        return 'DISABLED';
      case H264FlickerAdaptiveQuantization.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264FlickerAdaptiveQuantization toH264FlickerAdaptiveQuantization() {
    switch (this) {
      case 'DISABLED':
        return H264FlickerAdaptiveQuantization.disabled;
      case 'ENABLED':
        return H264FlickerAdaptiveQuantization.enabled;
    }
    throw Exception(
        '$this is not known in enum H264FlickerAdaptiveQuantization');
  }
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
  initializeFromSource,
  specified,
}

extension on H264FramerateControl {
  String toValue() {
    switch (this) {
      case H264FramerateControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case H264FramerateControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  H264FramerateControl toH264FramerateControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return H264FramerateControl.initializeFromSource;
      case 'SPECIFIED':
        return H264FramerateControl.specified;
    }
    throw Exception('$this is not known in enum H264FramerateControl');
  }
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
  duplicateDrop,
  interpolate,
  frameformer,
}

extension on H264FramerateConversionAlgorithm {
  String toValue() {
    switch (this) {
      case H264FramerateConversionAlgorithm.duplicateDrop:
        return 'DUPLICATE_DROP';
      case H264FramerateConversionAlgorithm.interpolate:
        return 'INTERPOLATE';
      case H264FramerateConversionAlgorithm.frameformer:
        return 'FRAMEFORMER';
    }
  }
}

extension on String {
  H264FramerateConversionAlgorithm toH264FramerateConversionAlgorithm() {
    switch (this) {
      case 'DUPLICATE_DROP':
        return H264FramerateConversionAlgorithm.duplicateDrop;
      case 'INTERPOLATE':
        return H264FramerateConversionAlgorithm.interpolate;
      case 'FRAMEFORMER':
        return H264FramerateConversionAlgorithm.frameformer;
    }
    throw Exception(
        '$this is not known in enum H264FramerateConversionAlgorithm');
  }
}

/// If enable, use reference B frames for GOP structures that have B frames > 1.
enum H264GopBReference {
  disabled,
  enabled,
}

extension on H264GopBReference {
  String toValue() {
    switch (this) {
      case H264GopBReference.disabled:
        return 'DISABLED';
      case H264GopBReference.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264GopBReference toH264GopBReference() {
    switch (this) {
      case 'DISABLED':
        return H264GopBReference.disabled;
      case 'ENABLED':
        return H264GopBReference.enabled;
    }
    throw Exception('$this is not known in enum H264GopBReference');
  }
}

/// Indicates if the GOP Size in H264 is specified in frames or seconds. If
/// seconds the system will convert the GOP Size into a frame count at run time.
enum H264GopSizeUnits {
  frames,
  seconds,
}

extension on H264GopSizeUnits {
  String toValue() {
    switch (this) {
      case H264GopSizeUnits.frames:
        return 'FRAMES';
      case H264GopSizeUnits.seconds:
        return 'SECONDS';
    }
  }
}

extension on String {
  H264GopSizeUnits toH264GopSizeUnits() {
    switch (this) {
      case 'FRAMES':
        return H264GopSizeUnits.frames;
      case 'SECONDS':
        return H264GopSizeUnits.seconds;
    }
    throw Exception('$this is not known in enum H264GopSizeUnits');
  }
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
  progressive,
  topField,
  bottomField,
  followTopField,
  followBottomField,
}

extension on H264InterlaceMode {
  String toValue() {
    switch (this) {
      case H264InterlaceMode.progressive:
        return 'PROGRESSIVE';
      case H264InterlaceMode.topField:
        return 'TOP_FIELD';
      case H264InterlaceMode.bottomField:
        return 'BOTTOM_FIELD';
      case H264InterlaceMode.followTopField:
        return 'FOLLOW_TOP_FIELD';
      case H264InterlaceMode.followBottomField:
        return 'FOLLOW_BOTTOM_FIELD';
    }
  }
}

extension on String {
  H264InterlaceMode toH264InterlaceMode() {
    switch (this) {
      case 'PROGRESSIVE':
        return H264InterlaceMode.progressive;
      case 'TOP_FIELD':
        return H264InterlaceMode.topField;
      case 'BOTTOM_FIELD':
        return H264InterlaceMode.bottomField;
      case 'FOLLOW_TOP_FIELD':
        return H264InterlaceMode.followTopField;
      case 'FOLLOW_BOTTOM_FIELD':
        return H264InterlaceMode.followBottomField;
    }
    throw Exception('$this is not known in enum H264InterlaceMode');
  }
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
  initializeFromSource,
  specified,
}

extension on H264ParControl {
  String toValue() {
    switch (this) {
      case H264ParControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case H264ParControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  H264ParControl toH264ParControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return H264ParControl.initializeFromSource;
      case 'SPECIFIED':
        return H264ParControl.specified;
    }
    throw Exception('$this is not known in enum H264ParControl');
  }
}

/// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
/// want to trade off encoding speed for output video quality. The default
/// behavior is faster, lower quality, single-pass encoding.
enum H264QualityTuningLevel {
  singlePass,
  singlePassHq,
  multiPassHq,
}

extension on H264QualityTuningLevel {
  String toValue() {
    switch (this) {
      case H264QualityTuningLevel.singlePass:
        return 'SINGLE_PASS';
      case H264QualityTuningLevel.singlePassHq:
        return 'SINGLE_PASS_HQ';
      case H264QualityTuningLevel.multiPassHq:
        return 'MULTI_PASS_HQ';
    }
  }
}

extension on String {
  H264QualityTuningLevel toH264QualityTuningLevel() {
    switch (this) {
      case 'SINGLE_PASS':
        return H264QualityTuningLevel.singlePass;
      case 'SINGLE_PASS_HQ':
        return H264QualityTuningLevel.singlePassHq;
      case 'MULTI_PASS_HQ':
        return H264QualityTuningLevel.multiPassHq;
    }
    throw Exception('$this is not known in enum H264QualityTuningLevel');
  }
}

/// Settings for quality-defined variable bitrate encoding with the H.264 codec.
/// Required when you set Rate control mode to QVBR. Not valid when you set Rate
/// control mode to a value other than QVBR, or when you don't define Rate
/// control mode.
class H264QvbrSettings {
  /// Use this setting only when Rate control mode is QVBR and Quality tuning
  /// level is Multi-pass HQ. For Max average bitrate values suited to the
  /// complexity of your input video, the service limits the average bitrate of
  /// the video part of this output to the value that you choose. That is, the
  /// total size of the video element is less than or equal to the value you set
  /// multiplied by the number of seconds of encoded output.
  final int? maxAverageBitrate;

  /// Required when you use QVBR rate control mode. That is, when you specify
  /// qvbrSettings within h264Settings. Specify the general target quality level
  /// for this output, from 1 to 10. Use higher numbers for greater quality. Level
  /// 10 results in nearly lossless compression. The quality level for most
  /// broadcast-quality transcodes is between 6 and 9. Optionally, to specify a
  /// value between whole numbers, also provide a value for the setting
  /// qvbrQualityLevelFineTune. For example, if you want your QVBR quality level
  /// to be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to
  /// .33.
  final int? qvbrQualityLevel;

  /// Optional. Specify a value here to set the QVBR quality to a level that is
  /// between whole numbers. For example, if you want your QVBR quality level to
  /// be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33.
  /// MediaConvert rounds your QVBR quality level to the nearest third of a whole
  /// number. For example, if you set qvbrQualityLevel to 7 and you set
  /// qvbrQualityLevelFineTune to .25, your actual QVBR quality level is 7.33.
  final double? qvbrQualityLevelFineTune;

  H264QvbrSettings({
    this.maxAverageBitrate,
    this.qvbrQualityLevel,
    this.qvbrQualityLevelFineTune,
  });
  factory H264QvbrSettings.fromJson(Map<String, dynamic> json) {
    return H264QvbrSettings(
      maxAverageBitrate: json['maxAverageBitrate'] as int?,
      qvbrQualityLevel: json['qvbrQualityLevel'] as int?,
      qvbrQualityLevelFineTune: json['qvbrQualityLevelFineTune'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxAverageBitrate = this.maxAverageBitrate;
    final qvbrQualityLevel = this.qvbrQualityLevel;
    final qvbrQualityLevelFineTune = this.qvbrQualityLevelFineTune;
    return {
      if (maxAverageBitrate != null) 'maxAverageBitrate': maxAverageBitrate,
      if (qvbrQualityLevel != null) 'qvbrQualityLevel': qvbrQualityLevel,
      if (qvbrQualityLevelFineTune != null)
        'qvbrQualityLevelFineTune': qvbrQualityLevelFineTune,
    };
  }
}

/// Use this setting to specify whether this output has a variable bitrate
/// (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
enum H264RateControlMode {
  vbr,
  cbr,
  qvbr,
}

extension on H264RateControlMode {
  String toValue() {
    switch (this) {
      case H264RateControlMode.vbr:
        return 'VBR';
      case H264RateControlMode.cbr:
        return 'CBR';
      case H264RateControlMode.qvbr:
        return 'QVBR';
    }
  }
}

extension on String {
  H264RateControlMode toH264RateControlMode() {
    switch (this) {
      case 'VBR':
        return H264RateControlMode.vbr;
      case 'CBR':
        return H264RateControlMode.cbr;
      case 'QVBR':
        return H264RateControlMode.qvbr;
    }
    throw Exception('$this is not known in enum H264RateControlMode');
  }
}

/// Places a PPS header on each encoded picture, even if repeated.
enum H264RepeatPps {
  disabled,
  enabled,
}

extension on H264RepeatPps {
  String toValue() {
    switch (this) {
      case H264RepeatPps.disabled:
        return 'DISABLED';
      case H264RepeatPps.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264RepeatPps toH264RepeatPps() {
    switch (this) {
      case 'DISABLED':
        return H264RepeatPps.disabled;
      case 'ENABLED':
        return H264RepeatPps.enabled;
    }
    throw Exception('$this is not known in enum H264RepeatPps');
  }
}

/// Enable this setting to insert I-frames at scene changes that the service
/// automatically detects. This improves video quality and is enabled by
/// default. If this output uses QVBR, choose Transition detection
/// (TRANSITION_DETECTION) for further video quality improvement. For more
/// information about QVBR, see
/// https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
enum H264SceneChangeDetect {
  disabled,
  enabled,
  transitionDetection,
}

extension on H264SceneChangeDetect {
  String toValue() {
    switch (this) {
      case H264SceneChangeDetect.disabled:
        return 'DISABLED';
      case H264SceneChangeDetect.enabled:
        return 'ENABLED';
      case H264SceneChangeDetect.transitionDetection:
        return 'TRANSITION_DETECTION';
    }
  }
}

extension on String {
  H264SceneChangeDetect toH264SceneChangeDetect() {
    switch (this) {
      case 'DISABLED':
        return H264SceneChangeDetect.disabled;
      case 'ENABLED':
        return H264SceneChangeDetect.enabled;
      case 'TRANSITION_DETECTION':
        return H264SceneChangeDetect.transitionDetection;
    }
    throw Exception('$this is not known in enum H264SceneChangeDetect');
  }
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value H_264.
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
  final H264AdaptiveQuantization? adaptiveQuantization;

  /// Specify the average bitrate in bits per second. Required for VBR and CBR.
  /// For MS Smooth outputs, bitrates must be unique when rounded down to the
  /// nearest multiple of 1000.
  final int? bitrate;

  /// Specify an H.264 level that is consistent with your output video settings.
  /// If you aren't sure what level to specify, choose Auto (AUTO).
  final H264CodecLevel? codecLevel;

  /// H.264 Profile. High 4:2:2 and 10-bit profiles are only available with the
  /// AVC-I License.
  final H264CodecProfile? codecProfile;

  /// Choose Adaptive to improve subjective video quality for high-motion content.
  /// This will cause the service to use fewer B-frames (which infer information
  /// based on other frames) for high-motion portions of the video and more
  /// B-frames for low-motion portions. The maximum number of B-frames is limited
  /// by the value you provide for the setting B frames between reference frames
  /// (numberBFramesBetweenReferenceFrames).
  final H264DynamicSubGop? dynamicSubGop;

  /// Entropy encoding mode. Use CABAC (must be in Main or High profile) or CAVLC.
  final H264EntropyEncoding? entropyEncoding;

  /// Keep the default value, PAFF, to have MediaConvert use PAFF encoding for
  /// interlaced outputs. Choose Force field (FORCE_FIELD) to disable PAFF
  /// encoding and create separate interlaced fields.
  final H264FieldEncoding? fieldEncoding;

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
  final H264FlickerAdaptiveQuantization? flickerAdaptiveQuantization;

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
  final H264FramerateControl? framerateControl;

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
  final H264FramerateConversionAlgorithm? framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  final int? framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  final int? framerateNumerator;

  /// If enable, use reference B frames for GOP structures that have B frames > 1.
  final H264GopBReference? gopBReference;

  /// Frequency of closed GOPs. In streaming applications, it is recommended that
  /// this be set to 1 so a decoder joining mid-stream will receive an IDR frame
  /// as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  final int? gopClosedCadence;

  /// GOP Length (keyframe interval) in frames or seconds. Must be greater than
  /// zero.
  final double? gopSize;

  /// Indicates if the GOP Size in H264 is specified in frames or seconds. If
  /// seconds the system will convert the GOP Size into a frame count at run time.
  final H264GopSizeUnits? gopSizeUnits;

  /// Percentage of the buffer that should initially be filled (HRD buffer model).
  final int? hrdBufferInitialFillPercentage;

  /// Size of buffer (HRD buffer model) in bits. For example, enter five megabits
  /// as 5000000.
  final int? hrdBufferSize;

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
  final H264InterlaceMode? interlaceMode;

  /// Maximum bitrate in bits/second. For example, enter five megabits per second
  /// as 5000000. Required when Rate control mode is QVBR.
  final int? maxBitrate;

  /// Enforces separation between repeated (cadence) I-frames and I-frames
  /// inserted by Scene Change Detection. If a scene change I-frame is within
  /// I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched
  /// to the scene change I-frame. GOP stretch requires enabling lookahead as well
  /// as setting I-interval. The normal cadence resumes for the next GOP. This
  /// setting is only used when Scene Change Detect is enabled. Note: Maximum GOP
  /// stretch = GOP size + Min-I-interval - 1
  final int? minIInterval;

  /// Number of B-frames between reference frames.
  final int? numberBFramesBetweenReferenceFrames;

  /// Number of reference frames to use. The encoder may use more than requested
  /// if using B-frames and/or interlaced encoding.
  final int? numberReferenceFrames;

  /// Optional. Specify how the service determines the pixel aspect ratio (PAR)
  /// for this output. The default behavior, Follow source
  /// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
  /// output. To specify a different PAR in the console, choose any value other
  /// than Follow source. To specify a different PAR by editing the JSON job
  /// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
  /// you must also specify values for the parNumerator and parDenominator
  /// settings.
  final H264ParControl? parControl;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parDenominator is 33.
  final int? parDenominator;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parNumerator is 40.
  final int? parNumerator;

  /// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
  /// want to trade off encoding speed for output video quality. The default
  /// behavior is faster, lower quality, single-pass encoding.
  final H264QualityTuningLevel? qualityTuningLevel;

  /// Settings for quality-defined variable bitrate encoding with the H.264 codec.
  /// Required when you set Rate control mode to QVBR. Not valid when you set Rate
  /// control mode to a value other than QVBR, or when you don't define Rate
  /// control mode.
  final H264QvbrSettings? qvbrSettings;

  /// Use this setting to specify whether this output has a variable bitrate
  /// (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
  final H264RateControlMode? rateControlMode;

  /// Places a PPS header on each encoded picture, even if repeated.
  final H264RepeatPps? repeatPps;

  /// Enable this setting to insert I-frames at scene changes that the service
  /// automatically detects. This improves video quality and is enabled by
  /// default. If this output uses QVBR, choose Transition detection
  /// (TRANSITION_DETECTION) for further video quality improvement. For more
  /// information about QVBR, see
  /// https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
  final H264SceneChangeDetect? sceneChangeDetect;

  /// Number of slices per picture. Must be less than or equal to the number of
  /// macroblock rows for progressive pictures, and less than or equal to half the
  /// number of macroblock rows for interlaced pictures.
  final int? slices;

  /// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
  /// second (fps). Enable slow PAL to create a 25 fps output. When you enable
  /// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
  /// your audio to keep it synchronized with the video. Note that enabling this
  /// setting will slightly reduce the duration of your video. Required settings:
  /// You must also set Framerate to 25. In your JSON job specification, set
  /// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
  /// (framerateDenominator) to 1.
  final H264SlowPal? slowPal;

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
  final int? softness;

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
  final H264SpatialAdaptiveQuantization? spatialAdaptiveQuantization;

  /// Produces a bitstream compliant with SMPTE RP-2027.
  final H264Syntax? syntax;

  /// When you do frame rate conversion from 23.976 frames per second (fps) to
  /// 29.97 fps, and your output scan type is interlaced, you can optionally
  /// enable hard or soft telecine to create a smoother picture. Hard telecine
  /// (HARD) produces a 29.97i output. Soft telecine (SOFT) produces an output
  /// with a 23.976 output that signals to the video player device to do the
  /// conversion during play back. When you keep the default value, None (NONE),
  /// MediaConvert does a standard frame rate conversion to 29.97 without doing
  /// anything with the field polarity to create a smoother picture.
  final H264Telecine? telecine;

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
  final H264TemporalAdaptiveQuantization? temporalAdaptiveQuantization;

  /// Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
  final H264UnregisteredSeiTimecode? unregisteredSeiTimecode;

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
  factory H264Settings.fromJson(Map<String, dynamic> json) {
    return H264Settings(
      adaptiveQuantization: (json['adaptiveQuantization'] as String?)
          ?.toH264AdaptiveQuantization(),
      bitrate: json['bitrate'] as int?,
      codecLevel: (json['codecLevel'] as String?)?.toH264CodecLevel(),
      codecProfile: (json['codecProfile'] as String?)?.toH264CodecProfile(),
      dynamicSubGop: (json['dynamicSubGop'] as String?)?.toH264DynamicSubGop(),
      entropyEncoding:
          (json['entropyEncoding'] as String?)?.toH264EntropyEncoding(),
      fieldEncoding: (json['fieldEncoding'] as String?)?.toH264FieldEncoding(),
      flickerAdaptiveQuantization:
          (json['flickerAdaptiveQuantization'] as String?)
              ?.toH264FlickerAdaptiveQuantization(),
      framerateControl:
          (json['framerateControl'] as String?)?.toH264FramerateControl(),
      framerateConversionAlgorithm:
          (json['framerateConversionAlgorithm'] as String?)
              ?.toH264FramerateConversionAlgorithm(),
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
      gopBReference: (json['gopBReference'] as String?)?.toH264GopBReference(),
      gopClosedCadence: json['gopClosedCadence'] as int?,
      gopSize: json['gopSize'] as double?,
      gopSizeUnits: (json['gopSizeUnits'] as String?)?.toH264GopSizeUnits(),
      hrdBufferInitialFillPercentage:
          json['hrdBufferInitialFillPercentage'] as int?,
      hrdBufferSize: json['hrdBufferSize'] as int?,
      interlaceMode: (json['interlaceMode'] as String?)?.toH264InterlaceMode(),
      maxBitrate: json['maxBitrate'] as int?,
      minIInterval: json['minIInterval'] as int?,
      numberBFramesBetweenReferenceFrames:
          json['numberBFramesBetweenReferenceFrames'] as int?,
      numberReferenceFrames: json['numberReferenceFrames'] as int?,
      parControl: (json['parControl'] as String?)?.toH264ParControl(),
      parDenominator: json['parDenominator'] as int?,
      parNumerator: json['parNumerator'] as int?,
      qualityTuningLevel:
          (json['qualityTuningLevel'] as String?)?.toH264QualityTuningLevel(),
      qvbrSettings: json['qvbrSettings'] != null
          ? H264QvbrSettings.fromJson(
              json['qvbrSettings'] as Map<String, dynamic>)
          : null,
      rateControlMode:
          (json['rateControlMode'] as String?)?.toH264RateControlMode(),
      repeatPps: (json['repeatPps'] as String?)?.toH264RepeatPps(),
      sceneChangeDetect:
          (json['sceneChangeDetect'] as String?)?.toH264SceneChangeDetect(),
      slices: json['slices'] as int?,
      slowPal: (json['slowPal'] as String?)?.toH264SlowPal(),
      softness: json['softness'] as int?,
      spatialAdaptiveQuantization:
          (json['spatialAdaptiveQuantization'] as String?)
              ?.toH264SpatialAdaptiveQuantization(),
      syntax: (json['syntax'] as String?)?.toH264Syntax(),
      telecine: (json['telecine'] as String?)?.toH264Telecine(),
      temporalAdaptiveQuantization:
          (json['temporalAdaptiveQuantization'] as String?)
              ?.toH264TemporalAdaptiveQuantization(),
      unregisteredSeiTimecode: (json['unregisteredSeiTimecode'] as String?)
          ?.toH264UnregisteredSeiTimecode(),
    );
  }

  Map<String, dynamic> toJson() {
    final adaptiveQuantization = this.adaptiveQuantization;
    final bitrate = this.bitrate;
    final codecLevel = this.codecLevel;
    final codecProfile = this.codecProfile;
    final dynamicSubGop = this.dynamicSubGop;
    final entropyEncoding = this.entropyEncoding;
    final fieldEncoding = this.fieldEncoding;
    final flickerAdaptiveQuantization = this.flickerAdaptiveQuantization;
    final framerateControl = this.framerateControl;
    final framerateConversionAlgorithm = this.framerateConversionAlgorithm;
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final gopBReference = this.gopBReference;
    final gopClosedCadence = this.gopClosedCadence;
    final gopSize = this.gopSize;
    final gopSizeUnits = this.gopSizeUnits;
    final hrdBufferInitialFillPercentage = this.hrdBufferInitialFillPercentage;
    final hrdBufferSize = this.hrdBufferSize;
    final interlaceMode = this.interlaceMode;
    final maxBitrate = this.maxBitrate;
    final minIInterval = this.minIInterval;
    final numberBFramesBetweenReferenceFrames =
        this.numberBFramesBetweenReferenceFrames;
    final numberReferenceFrames = this.numberReferenceFrames;
    final parControl = this.parControl;
    final parDenominator = this.parDenominator;
    final parNumerator = this.parNumerator;
    final qualityTuningLevel = this.qualityTuningLevel;
    final qvbrSettings = this.qvbrSettings;
    final rateControlMode = this.rateControlMode;
    final repeatPps = this.repeatPps;
    final sceneChangeDetect = this.sceneChangeDetect;
    final slices = this.slices;
    final slowPal = this.slowPal;
    final softness = this.softness;
    final spatialAdaptiveQuantization = this.spatialAdaptiveQuantization;
    final syntax = this.syntax;
    final telecine = this.telecine;
    final temporalAdaptiveQuantization = this.temporalAdaptiveQuantization;
    final unregisteredSeiTimecode = this.unregisteredSeiTimecode;
    return {
      if (adaptiveQuantization != null)
        'adaptiveQuantization': adaptiveQuantization.toValue(),
      if (bitrate != null) 'bitrate': bitrate,
      if (codecLevel != null) 'codecLevel': codecLevel.toValue(),
      if (codecProfile != null) 'codecProfile': codecProfile.toValue(),
      if (dynamicSubGop != null) 'dynamicSubGop': dynamicSubGop.toValue(),
      if (entropyEncoding != null) 'entropyEncoding': entropyEncoding.toValue(),
      if (fieldEncoding != null) 'fieldEncoding': fieldEncoding.toValue(),
      if (flickerAdaptiveQuantization != null)
        'flickerAdaptiveQuantization': flickerAdaptiveQuantization.toValue(),
      if (framerateControl != null)
        'framerateControl': framerateControl.toValue(),
      if (framerateConversionAlgorithm != null)
        'framerateConversionAlgorithm': framerateConversionAlgorithm.toValue(),
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
      if (gopBReference != null) 'gopBReference': gopBReference.toValue(),
      if (gopClosedCadence != null) 'gopClosedCadence': gopClosedCadence,
      if (gopSize != null) 'gopSize': gopSize,
      if (gopSizeUnits != null) 'gopSizeUnits': gopSizeUnits.toValue(),
      if (hrdBufferInitialFillPercentage != null)
        'hrdBufferInitialFillPercentage': hrdBufferInitialFillPercentage,
      if (hrdBufferSize != null) 'hrdBufferSize': hrdBufferSize,
      if (interlaceMode != null) 'interlaceMode': interlaceMode.toValue(),
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (minIInterval != null) 'minIInterval': minIInterval,
      if (numberBFramesBetweenReferenceFrames != null)
        'numberBFramesBetweenReferenceFrames':
            numberBFramesBetweenReferenceFrames,
      if (numberReferenceFrames != null)
        'numberReferenceFrames': numberReferenceFrames,
      if (parControl != null) 'parControl': parControl.toValue(),
      if (parDenominator != null) 'parDenominator': parDenominator,
      if (parNumerator != null) 'parNumerator': parNumerator,
      if (qualityTuningLevel != null)
        'qualityTuningLevel': qualityTuningLevel.toValue(),
      if (qvbrSettings != null) 'qvbrSettings': qvbrSettings,
      if (rateControlMode != null) 'rateControlMode': rateControlMode.toValue(),
      if (repeatPps != null) 'repeatPps': repeatPps.toValue(),
      if (sceneChangeDetect != null)
        'sceneChangeDetect': sceneChangeDetect.toValue(),
      if (slices != null) 'slices': slices,
      if (slowPal != null) 'slowPal': slowPal.toValue(),
      if (softness != null) 'softness': softness,
      if (spatialAdaptiveQuantization != null)
        'spatialAdaptiveQuantization': spatialAdaptiveQuantization.toValue(),
      if (syntax != null) 'syntax': syntax.toValue(),
      if (telecine != null) 'telecine': telecine.toValue(),
      if (temporalAdaptiveQuantization != null)
        'temporalAdaptiveQuantization': temporalAdaptiveQuantization.toValue(),
      if (unregisteredSeiTimecode != null)
        'unregisteredSeiTimecode': unregisteredSeiTimecode.toValue(),
    };
  }
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
  disabled,
  enabled,
}

extension on H264SlowPal {
  String toValue() {
    switch (this) {
      case H264SlowPal.disabled:
        return 'DISABLED';
      case H264SlowPal.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264SlowPal toH264SlowPal() {
    switch (this) {
      case 'DISABLED':
        return H264SlowPal.disabled;
      case 'ENABLED':
        return H264SlowPal.enabled;
    }
    throw Exception('$this is not known in enum H264SlowPal');
  }
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
  disabled,
  enabled,
}

extension on H264SpatialAdaptiveQuantization {
  String toValue() {
    switch (this) {
      case H264SpatialAdaptiveQuantization.disabled:
        return 'DISABLED';
      case H264SpatialAdaptiveQuantization.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264SpatialAdaptiveQuantization toH264SpatialAdaptiveQuantization() {
    switch (this) {
      case 'DISABLED':
        return H264SpatialAdaptiveQuantization.disabled;
      case 'ENABLED':
        return H264SpatialAdaptiveQuantization.enabled;
    }
    throw Exception(
        '$this is not known in enum H264SpatialAdaptiveQuantization');
  }
}

/// Produces a bitstream compliant with SMPTE RP-2027.
enum H264Syntax {
  $default,
  rp2027,
}

extension on H264Syntax {
  String toValue() {
    switch (this) {
      case H264Syntax.$default:
        return 'DEFAULT';
      case H264Syntax.rp2027:
        return 'RP2027';
    }
  }
}

extension on String {
  H264Syntax toH264Syntax() {
    switch (this) {
      case 'DEFAULT':
        return H264Syntax.$default;
      case 'RP2027':
        return H264Syntax.rp2027;
    }
    throw Exception('$this is not known in enum H264Syntax');
  }
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
  none,
  soft,
  hard,
}

extension on H264Telecine {
  String toValue() {
    switch (this) {
      case H264Telecine.none:
        return 'NONE';
      case H264Telecine.soft:
        return 'SOFT';
      case H264Telecine.hard:
        return 'HARD';
    }
  }
}

extension on String {
  H264Telecine toH264Telecine() {
    switch (this) {
      case 'NONE':
        return H264Telecine.none;
      case 'SOFT':
        return H264Telecine.soft;
      case 'HARD':
        return H264Telecine.hard;
    }
    throw Exception('$this is not known in enum H264Telecine');
  }
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
  disabled,
  enabled,
}

extension on H264TemporalAdaptiveQuantization {
  String toValue() {
    switch (this) {
      case H264TemporalAdaptiveQuantization.disabled:
        return 'DISABLED';
      case H264TemporalAdaptiveQuantization.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264TemporalAdaptiveQuantization toH264TemporalAdaptiveQuantization() {
    switch (this) {
      case 'DISABLED':
        return H264TemporalAdaptiveQuantization.disabled;
      case 'ENABLED':
        return H264TemporalAdaptiveQuantization.enabled;
    }
    throw Exception(
        '$this is not known in enum H264TemporalAdaptiveQuantization');
  }
}

/// Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
enum H264UnregisteredSeiTimecode {
  disabled,
  enabled,
}

extension on H264UnregisteredSeiTimecode {
  String toValue() {
    switch (this) {
      case H264UnregisteredSeiTimecode.disabled:
        return 'DISABLED';
      case H264UnregisteredSeiTimecode.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264UnregisteredSeiTimecode toH264UnregisteredSeiTimecode() {
    switch (this) {
      case 'DISABLED':
        return H264UnregisteredSeiTimecode.disabled;
      case 'ENABLED':
        return H264UnregisteredSeiTimecode.enabled;
    }
    throw Exception('$this is not known in enum H264UnregisteredSeiTimecode');
  }
}

/// Specify the strength of any adaptive quantization filters that you enable.
/// The value that you choose here applies to the following settings: Flicker
/// adaptive quantization (flickerAdaptiveQuantization), Spatial adaptive
/// quantization (spatialAdaptiveQuantization), and Temporal adaptive
/// quantization (temporalAdaptiveQuantization).
enum H265AdaptiveQuantization {
  off,
  low,
  medium,
  high,
  higher,
  max,
}

extension on H265AdaptiveQuantization {
  String toValue() {
    switch (this) {
      case H265AdaptiveQuantization.off:
        return 'OFF';
      case H265AdaptiveQuantization.low:
        return 'LOW';
      case H265AdaptiveQuantization.medium:
        return 'MEDIUM';
      case H265AdaptiveQuantization.high:
        return 'HIGH';
      case H265AdaptiveQuantization.higher:
        return 'HIGHER';
      case H265AdaptiveQuantization.max:
        return 'MAX';
    }
  }
}

extension on String {
  H265AdaptiveQuantization toH265AdaptiveQuantization() {
    switch (this) {
      case 'OFF':
        return H265AdaptiveQuantization.off;
      case 'LOW':
        return H265AdaptiveQuantization.low;
      case 'MEDIUM':
        return H265AdaptiveQuantization.medium;
      case 'HIGH':
        return H265AdaptiveQuantization.high;
      case 'HIGHER':
        return H265AdaptiveQuantization.higher;
      case 'MAX':
        return H265AdaptiveQuantization.max;
    }
    throw Exception('$this is not known in enum H265AdaptiveQuantization');
  }
}

/// Enables Alternate Transfer Function SEI message for outputs using Hybrid Log
/// Gamma (HLG) Electro-Optical Transfer Function (EOTF).
enum H265AlternateTransferFunctionSei {
  disabled,
  enabled,
}

extension on H265AlternateTransferFunctionSei {
  String toValue() {
    switch (this) {
      case H265AlternateTransferFunctionSei.disabled:
        return 'DISABLED';
      case H265AlternateTransferFunctionSei.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H265AlternateTransferFunctionSei toH265AlternateTransferFunctionSei() {
    switch (this) {
      case 'DISABLED':
        return H265AlternateTransferFunctionSei.disabled;
      case 'ENABLED':
        return H265AlternateTransferFunctionSei.enabled;
    }
    throw Exception(
        '$this is not known in enum H265AlternateTransferFunctionSei');
  }
}

/// H.265 Level.
enum H265CodecLevel {
  auto,
  level_1,
  level_2,
  level_2_1,
  level_3,
  level_3_1,
  level_4,
  level_4_1,
  level_5,
  level_5_1,
  level_5_2,
  level_6,
  level_6_1,
  level_6_2,
}

extension on H265CodecLevel {
  String toValue() {
    switch (this) {
      case H265CodecLevel.auto:
        return 'AUTO';
      case H265CodecLevel.level_1:
        return 'LEVEL_1';
      case H265CodecLevel.level_2:
        return 'LEVEL_2';
      case H265CodecLevel.level_2_1:
        return 'LEVEL_2_1';
      case H265CodecLevel.level_3:
        return 'LEVEL_3';
      case H265CodecLevel.level_3_1:
        return 'LEVEL_3_1';
      case H265CodecLevel.level_4:
        return 'LEVEL_4';
      case H265CodecLevel.level_4_1:
        return 'LEVEL_4_1';
      case H265CodecLevel.level_5:
        return 'LEVEL_5';
      case H265CodecLevel.level_5_1:
        return 'LEVEL_5_1';
      case H265CodecLevel.level_5_2:
        return 'LEVEL_5_2';
      case H265CodecLevel.level_6:
        return 'LEVEL_6';
      case H265CodecLevel.level_6_1:
        return 'LEVEL_6_1';
      case H265CodecLevel.level_6_2:
        return 'LEVEL_6_2';
    }
  }
}

extension on String {
  H265CodecLevel toH265CodecLevel() {
    switch (this) {
      case 'AUTO':
        return H265CodecLevel.auto;
      case 'LEVEL_1':
        return H265CodecLevel.level_1;
      case 'LEVEL_2':
        return H265CodecLevel.level_2;
      case 'LEVEL_2_1':
        return H265CodecLevel.level_2_1;
      case 'LEVEL_3':
        return H265CodecLevel.level_3;
      case 'LEVEL_3_1':
        return H265CodecLevel.level_3_1;
      case 'LEVEL_4':
        return H265CodecLevel.level_4;
      case 'LEVEL_4_1':
        return H265CodecLevel.level_4_1;
      case 'LEVEL_5':
        return H265CodecLevel.level_5;
      case 'LEVEL_5_1':
        return H265CodecLevel.level_5_1;
      case 'LEVEL_5_2':
        return H265CodecLevel.level_5_2;
      case 'LEVEL_6':
        return H265CodecLevel.level_6;
      case 'LEVEL_6_1':
        return H265CodecLevel.level_6_1;
      case 'LEVEL_6_2':
        return H265CodecLevel.level_6_2;
    }
    throw Exception('$this is not known in enum H265CodecLevel');
  }
}

/// Represents the Profile and Tier, per the HEVC (H.265) specification.
/// Selections are grouped as [Profile] / [Tier], so "Main/High" represents Main
/// Profile with High Tier. 4:2:2 profiles are only available with the HEVC
/// 4:2:2 License.
enum H265CodecProfile {
  mainMain,
  mainHigh,
  main10Main,
  main10High,
  main_422_8bitMain,
  main_422_8bitHigh,
  main_422_10bitMain,
  main_422_10bitHigh,
}

extension on H265CodecProfile {
  String toValue() {
    switch (this) {
      case H265CodecProfile.mainMain:
        return 'MAIN_MAIN';
      case H265CodecProfile.mainHigh:
        return 'MAIN_HIGH';
      case H265CodecProfile.main10Main:
        return 'MAIN10_MAIN';
      case H265CodecProfile.main10High:
        return 'MAIN10_HIGH';
      case H265CodecProfile.main_422_8bitMain:
        return 'MAIN_422_8BIT_MAIN';
      case H265CodecProfile.main_422_8bitHigh:
        return 'MAIN_422_8BIT_HIGH';
      case H265CodecProfile.main_422_10bitMain:
        return 'MAIN_422_10BIT_MAIN';
      case H265CodecProfile.main_422_10bitHigh:
        return 'MAIN_422_10BIT_HIGH';
    }
  }
}

extension on String {
  H265CodecProfile toH265CodecProfile() {
    switch (this) {
      case 'MAIN_MAIN':
        return H265CodecProfile.mainMain;
      case 'MAIN_HIGH':
        return H265CodecProfile.mainHigh;
      case 'MAIN10_MAIN':
        return H265CodecProfile.main10Main;
      case 'MAIN10_HIGH':
        return H265CodecProfile.main10High;
      case 'MAIN_422_8BIT_MAIN':
        return H265CodecProfile.main_422_8bitMain;
      case 'MAIN_422_8BIT_HIGH':
        return H265CodecProfile.main_422_8bitHigh;
      case 'MAIN_422_10BIT_MAIN':
        return H265CodecProfile.main_422_10bitMain;
      case 'MAIN_422_10BIT_HIGH':
        return H265CodecProfile.main_422_10bitHigh;
    }
    throw Exception('$this is not known in enum H265CodecProfile');
  }
}

/// Choose Adaptive to improve subjective video quality for high-motion content.
/// This will cause the service to use fewer B-frames (which infer information
/// based on other frames) for high-motion portions of the video and more
/// B-frames for low-motion portions. The maximum number of B-frames is limited
/// by the value you provide for the setting B frames between reference frames
/// (numberBFramesBetweenReferenceFrames).
enum H265DynamicSubGop {
  adaptive,
  static,
}

extension on H265DynamicSubGop {
  String toValue() {
    switch (this) {
      case H265DynamicSubGop.adaptive:
        return 'ADAPTIVE';
      case H265DynamicSubGop.static:
        return 'STATIC';
    }
  }
}

extension on String {
  H265DynamicSubGop toH265DynamicSubGop() {
    switch (this) {
      case 'ADAPTIVE':
        return H265DynamicSubGop.adaptive;
      case 'STATIC':
        return H265DynamicSubGop.static;
    }
    throw Exception('$this is not known in enum H265DynamicSubGop');
  }
}

/// Enable this setting to have the encoder reduce I-frame pop. I-frame pop
/// appears as a visual flicker that can arise when the encoder saves bits by
/// copying some macroblocks many times from frame to frame, and then refreshes
/// them at the I-frame. When you enable this setting, the encoder updates these
/// macroblocks slightly more often to smooth out the flicker. This setting is
/// disabled by default. Related setting: In addition to enabling this setting,
/// you must also set adaptiveQuantization to a value other than Off (OFF).
enum H265FlickerAdaptiveQuantization {
  disabled,
  enabled,
}

extension on H265FlickerAdaptiveQuantization {
  String toValue() {
    switch (this) {
      case H265FlickerAdaptiveQuantization.disabled:
        return 'DISABLED';
      case H265FlickerAdaptiveQuantization.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H265FlickerAdaptiveQuantization toH265FlickerAdaptiveQuantization() {
    switch (this) {
      case 'DISABLED':
        return H265FlickerAdaptiveQuantization.disabled;
      case 'ENABLED':
        return H265FlickerAdaptiveQuantization.enabled;
    }
    throw Exception(
        '$this is not known in enum H265FlickerAdaptiveQuantization');
  }
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
  initializeFromSource,
  specified,
}

extension on H265FramerateControl {
  String toValue() {
    switch (this) {
      case H265FramerateControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case H265FramerateControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  H265FramerateControl toH265FramerateControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return H265FramerateControl.initializeFromSource;
      case 'SPECIFIED':
        return H265FramerateControl.specified;
    }
    throw Exception('$this is not known in enum H265FramerateControl');
  }
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
  duplicateDrop,
  interpolate,
  frameformer,
}

extension on H265FramerateConversionAlgorithm {
  String toValue() {
    switch (this) {
      case H265FramerateConversionAlgorithm.duplicateDrop:
        return 'DUPLICATE_DROP';
      case H265FramerateConversionAlgorithm.interpolate:
        return 'INTERPOLATE';
      case H265FramerateConversionAlgorithm.frameformer:
        return 'FRAMEFORMER';
    }
  }
}

extension on String {
  H265FramerateConversionAlgorithm toH265FramerateConversionAlgorithm() {
    switch (this) {
      case 'DUPLICATE_DROP':
        return H265FramerateConversionAlgorithm.duplicateDrop;
      case 'INTERPOLATE':
        return H265FramerateConversionAlgorithm.interpolate;
      case 'FRAMEFORMER':
        return H265FramerateConversionAlgorithm.frameformer;
    }
    throw Exception(
        '$this is not known in enum H265FramerateConversionAlgorithm');
  }
}

/// If enable, use reference B frames for GOP structures that have B frames > 1.
enum H265GopBReference {
  disabled,
  enabled,
}

extension on H265GopBReference {
  String toValue() {
    switch (this) {
      case H265GopBReference.disabled:
        return 'DISABLED';
      case H265GopBReference.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H265GopBReference toH265GopBReference() {
    switch (this) {
      case 'DISABLED':
        return H265GopBReference.disabled;
      case 'ENABLED':
        return H265GopBReference.enabled;
    }
    throw Exception('$this is not known in enum H265GopBReference');
  }
}

/// Indicates if the GOP Size in H265 is specified in frames or seconds. If
/// seconds the system will convert the GOP Size into a frame count at run time.
enum H265GopSizeUnits {
  frames,
  seconds,
}

extension on H265GopSizeUnits {
  String toValue() {
    switch (this) {
      case H265GopSizeUnits.frames:
        return 'FRAMES';
      case H265GopSizeUnits.seconds:
        return 'SECONDS';
    }
  }
}

extension on String {
  H265GopSizeUnits toH265GopSizeUnits() {
    switch (this) {
      case 'FRAMES':
        return H265GopSizeUnits.frames;
      case 'SECONDS':
        return H265GopSizeUnits.seconds;
    }
    throw Exception('$this is not known in enum H265GopSizeUnits');
  }
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
  progressive,
  topField,
  bottomField,
  followTopField,
  followBottomField,
}

extension on H265InterlaceMode {
  String toValue() {
    switch (this) {
      case H265InterlaceMode.progressive:
        return 'PROGRESSIVE';
      case H265InterlaceMode.topField:
        return 'TOP_FIELD';
      case H265InterlaceMode.bottomField:
        return 'BOTTOM_FIELD';
      case H265InterlaceMode.followTopField:
        return 'FOLLOW_TOP_FIELD';
      case H265InterlaceMode.followBottomField:
        return 'FOLLOW_BOTTOM_FIELD';
    }
  }
}

extension on String {
  H265InterlaceMode toH265InterlaceMode() {
    switch (this) {
      case 'PROGRESSIVE':
        return H265InterlaceMode.progressive;
      case 'TOP_FIELD':
        return H265InterlaceMode.topField;
      case 'BOTTOM_FIELD':
        return H265InterlaceMode.bottomField;
      case 'FOLLOW_TOP_FIELD':
        return H265InterlaceMode.followTopField;
      case 'FOLLOW_BOTTOM_FIELD':
        return H265InterlaceMode.followBottomField;
    }
    throw Exception('$this is not known in enum H265InterlaceMode');
  }
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
  initializeFromSource,
  specified,
}

extension on H265ParControl {
  String toValue() {
    switch (this) {
      case H265ParControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case H265ParControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  H265ParControl toH265ParControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return H265ParControl.initializeFromSource;
      case 'SPECIFIED':
        return H265ParControl.specified;
    }
    throw Exception('$this is not known in enum H265ParControl');
  }
}

/// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
/// want to trade off encoding speed for output video quality. The default
/// behavior is faster, lower quality, single-pass encoding.
enum H265QualityTuningLevel {
  singlePass,
  singlePassHq,
  multiPassHq,
}

extension on H265QualityTuningLevel {
  String toValue() {
    switch (this) {
      case H265QualityTuningLevel.singlePass:
        return 'SINGLE_PASS';
      case H265QualityTuningLevel.singlePassHq:
        return 'SINGLE_PASS_HQ';
      case H265QualityTuningLevel.multiPassHq:
        return 'MULTI_PASS_HQ';
    }
  }
}

extension on String {
  H265QualityTuningLevel toH265QualityTuningLevel() {
    switch (this) {
      case 'SINGLE_PASS':
        return H265QualityTuningLevel.singlePass;
      case 'SINGLE_PASS_HQ':
        return H265QualityTuningLevel.singlePassHq;
      case 'MULTI_PASS_HQ':
        return H265QualityTuningLevel.multiPassHq;
    }
    throw Exception('$this is not known in enum H265QualityTuningLevel');
  }
}

/// Settings for quality-defined variable bitrate encoding with the H.265 codec.
/// Required when you set Rate control mode to QVBR. Not valid when you set Rate
/// control mode to a value other than QVBR, or when you don't define Rate
/// control mode.
class H265QvbrSettings {
  /// Use this setting only when Rate control mode is QVBR and Quality tuning
  /// level is Multi-pass HQ. For Max average bitrate values suited to the
  /// complexity of your input video, the service limits the average bitrate of
  /// the video part of this output to the value that you choose. That is, the
  /// total size of the video element is less than or equal to the value you set
  /// multiplied by the number of seconds of encoded output.
  final int? maxAverageBitrate;

  /// Required when you use QVBR rate control mode. That is, when you specify
  /// qvbrSettings within h265Settings. Specify the general target quality level
  /// for this output, from 1 to 10. Use higher numbers for greater quality. Level
  /// 10 results in nearly lossless compression. The quality level for most
  /// broadcast-quality transcodes is between 6 and 9. Optionally, to specify a
  /// value between whole numbers, also provide a value for the setting
  /// qvbrQualityLevelFineTune. For example, if you want your QVBR quality level
  /// to be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to
  /// .33.
  final int? qvbrQualityLevel;

  /// Optional. Specify a value here to set the QVBR quality to a level that is
  /// between whole numbers. For example, if you want your QVBR quality level to
  /// be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33.
  /// MediaConvert rounds your QVBR quality level to the nearest third of a whole
  /// number. For example, if you set qvbrQualityLevel to 7 and you set
  /// qvbrQualityLevelFineTune to .25, your actual QVBR quality level is 7.33.
  final double? qvbrQualityLevelFineTune;

  H265QvbrSettings({
    this.maxAverageBitrate,
    this.qvbrQualityLevel,
    this.qvbrQualityLevelFineTune,
  });
  factory H265QvbrSettings.fromJson(Map<String, dynamic> json) {
    return H265QvbrSettings(
      maxAverageBitrate: json['maxAverageBitrate'] as int?,
      qvbrQualityLevel: json['qvbrQualityLevel'] as int?,
      qvbrQualityLevelFineTune: json['qvbrQualityLevelFineTune'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxAverageBitrate = this.maxAverageBitrate;
    final qvbrQualityLevel = this.qvbrQualityLevel;
    final qvbrQualityLevelFineTune = this.qvbrQualityLevelFineTune;
    return {
      if (maxAverageBitrate != null) 'maxAverageBitrate': maxAverageBitrate,
      if (qvbrQualityLevel != null) 'qvbrQualityLevel': qvbrQualityLevel,
      if (qvbrQualityLevelFineTune != null)
        'qvbrQualityLevelFineTune': qvbrQualityLevelFineTune,
    };
  }
}

/// Use this setting to specify whether this output has a variable bitrate
/// (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
enum H265RateControlMode {
  vbr,
  cbr,
  qvbr,
}

extension on H265RateControlMode {
  String toValue() {
    switch (this) {
      case H265RateControlMode.vbr:
        return 'VBR';
      case H265RateControlMode.cbr:
        return 'CBR';
      case H265RateControlMode.qvbr:
        return 'QVBR';
    }
  }
}

extension on String {
  H265RateControlMode toH265RateControlMode() {
    switch (this) {
      case 'VBR':
        return H265RateControlMode.vbr;
      case 'CBR':
        return H265RateControlMode.cbr;
      case 'QVBR':
        return H265RateControlMode.qvbr;
    }
    throw Exception('$this is not known in enum H265RateControlMode');
  }
}

/// Specify Sample Adaptive Offset (SAO) filter strength.  Adaptive mode
/// dynamically selects best strength based on content
enum H265SampleAdaptiveOffsetFilterMode {
  $default,
  adaptive,
  off,
}

extension on H265SampleAdaptiveOffsetFilterMode {
  String toValue() {
    switch (this) {
      case H265SampleAdaptiveOffsetFilterMode.$default:
        return 'DEFAULT';
      case H265SampleAdaptiveOffsetFilterMode.adaptive:
        return 'ADAPTIVE';
      case H265SampleAdaptiveOffsetFilterMode.off:
        return 'OFF';
    }
  }
}

extension on String {
  H265SampleAdaptiveOffsetFilterMode toH265SampleAdaptiveOffsetFilterMode() {
    switch (this) {
      case 'DEFAULT':
        return H265SampleAdaptiveOffsetFilterMode.$default;
      case 'ADAPTIVE':
        return H265SampleAdaptiveOffsetFilterMode.adaptive;
      case 'OFF':
        return H265SampleAdaptiveOffsetFilterMode.off;
    }
    throw Exception(
        '$this is not known in enum H265SampleAdaptiveOffsetFilterMode');
  }
}

/// Enable this setting to insert I-frames at scene changes that the service
/// automatically detects. This improves video quality and is enabled by
/// default. If this output uses QVBR, choose Transition detection
/// (TRANSITION_DETECTION) for further video quality improvement. For more
/// information about QVBR, see
/// https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
enum H265SceneChangeDetect {
  disabled,
  enabled,
  transitionDetection,
}

extension on H265SceneChangeDetect {
  String toValue() {
    switch (this) {
      case H265SceneChangeDetect.disabled:
        return 'DISABLED';
      case H265SceneChangeDetect.enabled:
        return 'ENABLED';
      case H265SceneChangeDetect.transitionDetection:
        return 'TRANSITION_DETECTION';
    }
  }
}

extension on String {
  H265SceneChangeDetect toH265SceneChangeDetect() {
    switch (this) {
      case 'DISABLED':
        return H265SceneChangeDetect.disabled;
      case 'ENABLED':
        return H265SceneChangeDetect.enabled;
      case 'TRANSITION_DETECTION':
        return H265SceneChangeDetect.transitionDetection;
    }
    throw Exception('$this is not known in enum H265SceneChangeDetect');
  }
}

/// Settings for H265 codec
class H265Settings {
  /// Specify the strength of any adaptive quantization filters that you enable.
  /// The value that you choose here applies to the following settings: Flicker
  /// adaptive quantization (flickerAdaptiveQuantization), Spatial adaptive
  /// quantization (spatialAdaptiveQuantization), and Temporal adaptive
  /// quantization (temporalAdaptiveQuantization).
  final H265AdaptiveQuantization? adaptiveQuantization;

  /// Enables Alternate Transfer Function SEI message for outputs using Hybrid Log
  /// Gamma (HLG) Electro-Optical Transfer Function (EOTF).
  final H265AlternateTransferFunctionSei? alternateTransferFunctionSei;

  /// Specify the average bitrate in bits per second. Required for VBR and CBR.
  /// For MS Smooth outputs, bitrates must be unique when rounded down to the
  /// nearest multiple of 1000.
  final int? bitrate;

  /// H.265 Level.
  final H265CodecLevel? codecLevel;

  /// Represents the Profile and Tier, per the HEVC (H.265) specification.
  /// Selections are grouped as [Profile] / [Tier], so "Main/High" represents Main
  /// Profile with High Tier. 4:2:2 profiles are only available with the HEVC
  /// 4:2:2 License.
  final H265CodecProfile? codecProfile;

  /// Choose Adaptive to improve subjective video quality for high-motion content.
  /// This will cause the service to use fewer B-frames (which infer information
  /// based on other frames) for high-motion portions of the video and more
  /// B-frames for low-motion portions. The maximum number of B-frames is limited
  /// by the value you provide for the setting B frames between reference frames
  /// (numberBFramesBetweenReferenceFrames).
  final H265DynamicSubGop? dynamicSubGop;

  /// Enable this setting to have the encoder reduce I-frame pop. I-frame pop
  /// appears as a visual flicker that can arise when the encoder saves bits by
  /// copying some macroblocks many times from frame to frame, and then refreshes
  /// them at the I-frame. When you enable this setting, the encoder updates these
  /// macroblocks slightly more often to smooth out the flicker. This setting is
  /// disabled by default. Related setting: In addition to enabling this setting,
  /// you must also set adaptiveQuantization to a value other than Off (OFF).
  final H265FlickerAdaptiveQuantization? flickerAdaptiveQuantization;

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
  final H265FramerateControl? framerateControl;

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
  final H265FramerateConversionAlgorithm? framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  final int? framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  final int? framerateNumerator;

  /// If enable, use reference B frames for GOP structures that have B frames > 1.
  final H265GopBReference? gopBReference;

  /// Frequency of closed GOPs. In streaming applications, it is recommended that
  /// this be set to 1 so a decoder joining mid-stream will receive an IDR frame
  /// as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  final int? gopClosedCadence;

  /// GOP Length (keyframe interval) in frames or seconds. Must be greater than
  /// zero.
  final double? gopSize;

  /// Indicates if the GOP Size in H265 is specified in frames or seconds. If
  /// seconds the system will convert the GOP Size into a frame count at run time.
  final H265GopSizeUnits? gopSizeUnits;

  /// Percentage of the buffer that should initially be filled (HRD buffer model).
  final int? hrdBufferInitialFillPercentage;

  /// Size of buffer (HRD buffer model) in bits. For example, enter five megabits
  /// as 5000000.
  final int? hrdBufferSize;

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
  final H265InterlaceMode? interlaceMode;

  /// Maximum bitrate in bits/second. For example, enter five megabits per second
  /// as 5000000. Required when Rate control mode is QVBR.
  final int? maxBitrate;

  /// Enforces separation between repeated (cadence) I-frames and I-frames
  /// inserted by Scene Change Detection. If a scene change I-frame is within
  /// I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched
  /// to the scene change I-frame. GOP stretch requires enabling lookahead as well
  /// as setting I-interval. The normal cadence resumes for the next GOP. This
  /// setting is only used when Scene Change Detect is enabled. Note: Maximum GOP
  /// stretch = GOP size + Min-I-interval - 1
  final int? minIInterval;

  /// Number of B-frames between reference frames.
  final int? numberBFramesBetweenReferenceFrames;

  /// Number of reference frames to use. The encoder may use more than requested
  /// if using B-frames and/or interlaced encoding.
  final int? numberReferenceFrames;

  /// Optional. Specify how the service determines the pixel aspect ratio (PAR)
  /// for this output. The default behavior, Follow source
  /// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
  /// output. To specify a different PAR in the console, choose any value other
  /// than Follow source. To specify a different PAR by editing the JSON job
  /// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
  /// you must also specify values for the parNumerator and parDenominator
  /// settings.
  final H265ParControl? parControl;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parDenominator is 33.
  final int? parDenominator;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parNumerator is 40.
  final int? parNumerator;

  /// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
  /// want to trade off encoding speed for output video quality. The default
  /// behavior is faster, lower quality, single-pass encoding.
  final H265QualityTuningLevel? qualityTuningLevel;

  /// Settings for quality-defined variable bitrate encoding with the H.265 codec.
  /// Required when you set Rate control mode to QVBR. Not valid when you set Rate
  /// control mode to a value other than QVBR, or when you don't define Rate
  /// control mode.
  final H265QvbrSettings? qvbrSettings;

  /// Use this setting to specify whether this output has a variable bitrate
  /// (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
  final H265RateControlMode? rateControlMode;

  /// Specify Sample Adaptive Offset (SAO) filter strength.  Adaptive mode
  /// dynamically selects best strength based on content
  final H265SampleAdaptiveOffsetFilterMode? sampleAdaptiveOffsetFilterMode;

  /// Enable this setting to insert I-frames at scene changes that the service
  /// automatically detects. This improves video quality and is enabled by
  /// default. If this output uses QVBR, choose Transition detection
  /// (TRANSITION_DETECTION) for further video quality improvement. For more
  /// information about QVBR, see
  /// https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
  final H265SceneChangeDetect? sceneChangeDetect;

  /// Number of slices per picture. Must be less than or equal to the number of
  /// macroblock rows for progressive pictures, and less than or equal to half the
  /// number of macroblock rows for interlaced pictures.
  final int? slices;

  /// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
  /// second (fps). Enable slow PAL to create a 25 fps output. When you enable
  /// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
  /// your audio to keep it synchronized with the video. Note that enabling this
  /// setting will slightly reduce the duration of your video. Required settings:
  /// You must also set Framerate to 25. In your JSON job specification, set
  /// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
  /// (framerateDenominator) to 1.
  final H265SlowPal? slowPal;

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
  final H265SpatialAdaptiveQuantization? spatialAdaptiveQuantization;

  /// This field applies only if the Streams > Advanced > Framerate (framerate)
  /// field  is set to 29.970. This field works with the Streams > Advanced >
  /// Preprocessors > Deinterlacer  field (deinterlace_mode) and the Streams >
  /// Advanced > Interlaced Mode field (interlace_mode)  to identify the scan type
  /// for the output: Progressive, Interlaced, Hard Telecine or Soft Telecine. -
  /// Hard: produces 29.97i output from 23.976 input. - Soft: produces 23.976; the
  /// player converts this output to 29.97i.
  final H265Telecine? telecine;

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
  final H265TemporalAdaptiveQuantization? temporalAdaptiveQuantization;

  /// Enables temporal layer identifiers in the encoded bitstream. Up to 3 layers
  /// are supported depending on GOP structure: I- and P-frames form one layer,
  /// reference B-frames can form a second layer and non-reference b-frames can
  /// form a third layer. Decoders can optionally decode only the lower temporal
  /// layers to generate a lower frame rate output. For example, given a bitstream
  /// with temporal IDs and with b-frames = 1 (i.e. IbPbPb display order), a
  /// decoder could decode all the frames for full frame rate output or only the I
  /// and P frames (lowest temporal layer) for a half frame rate output.
  final H265TemporalIds? temporalIds;

  /// Enable use of tiles, allowing horizontal as well as vertical subdivision of
  /// the encoded pictures.
  final H265Tiles? tiles;

  /// Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
  final H265UnregisteredSeiTimecode? unregisteredSeiTimecode;

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
  final H265WriteMp4PackagingType? writeMp4PackagingType;

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
  factory H265Settings.fromJson(Map<String, dynamic> json) {
    return H265Settings(
      adaptiveQuantization: (json['adaptiveQuantization'] as String?)
          ?.toH265AdaptiveQuantization(),
      alternateTransferFunctionSei:
          (json['alternateTransferFunctionSei'] as String?)
              ?.toH265AlternateTransferFunctionSei(),
      bitrate: json['bitrate'] as int?,
      codecLevel: (json['codecLevel'] as String?)?.toH265CodecLevel(),
      codecProfile: (json['codecProfile'] as String?)?.toH265CodecProfile(),
      dynamicSubGop: (json['dynamicSubGop'] as String?)?.toH265DynamicSubGop(),
      flickerAdaptiveQuantization:
          (json['flickerAdaptiveQuantization'] as String?)
              ?.toH265FlickerAdaptiveQuantization(),
      framerateControl:
          (json['framerateControl'] as String?)?.toH265FramerateControl(),
      framerateConversionAlgorithm:
          (json['framerateConversionAlgorithm'] as String?)
              ?.toH265FramerateConversionAlgorithm(),
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
      gopBReference: (json['gopBReference'] as String?)?.toH265GopBReference(),
      gopClosedCadence: json['gopClosedCadence'] as int?,
      gopSize: json['gopSize'] as double?,
      gopSizeUnits: (json['gopSizeUnits'] as String?)?.toH265GopSizeUnits(),
      hrdBufferInitialFillPercentage:
          json['hrdBufferInitialFillPercentage'] as int?,
      hrdBufferSize: json['hrdBufferSize'] as int?,
      interlaceMode: (json['interlaceMode'] as String?)?.toH265InterlaceMode(),
      maxBitrate: json['maxBitrate'] as int?,
      minIInterval: json['minIInterval'] as int?,
      numberBFramesBetweenReferenceFrames:
          json['numberBFramesBetweenReferenceFrames'] as int?,
      numberReferenceFrames: json['numberReferenceFrames'] as int?,
      parControl: (json['parControl'] as String?)?.toH265ParControl(),
      parDenominator: json['parDenominator'] as int?,
      parNumerator: json['parNumerator'] as int?,
      qualityTuningLevel:
          (json['qualityTuningLevel'] as String?)?.toH265QualityTuningLevel(),
      qvbrSettings: json['qvbrSettings'] != null
          ? H265QvbrSettings.fromJson(
              json['qvbrSettings'] as Map<String, dynamic>)
          : null,
      rateControlMode:
          (json['rateControlMode'] as String?)?.toH265RateControlMode(),
      sampleAdaptiveOffsetFilterMode:
          (json['sampleAdaptiveOffsetFilterMode'] as String?)
              ?.toH265SampleAdaptiveOffsetFilterMode(),
      sceneChangeDetect:
          (json['sceneChangeDetect'] as String?)?.toH265SceneChangeDetect(),
      slices: json['slices'] as int?,
      slowPal: (json['slowPal'] as String?)?.toH265SlowPal(),
      spatialAdaptiveQuantization:
          (json['spatialAdaptiveQuantization'] as String?)
              ?.toH265SpatialAdaptiveQuantization(),
      telecine: (json['telecine'] as String?)?.toH265Telecine(),
      temporalAdaptiveQuantization:
          (json['temporalAdaptiveQuantization'] as String?)
              ?.toH265TemporalAdaptiveQuantization(),
      temporalIds: (json['temporalIds'] as String?)?.toH265TemporalIds(),
      tiles: (json['tiles'] as String?)?.toH265Tiles(),
      unregisteredSeiTimecode: (json['unregisteredSeiTimecode'] as String?)
          ?.toH265UnregisteredSeiTimecode(),
      writeMp4PackagingType: (json['writeMp4PackagingType'] as String?)
          ?.toH265WriteMp4PackagingType(),
    );
  }

  Map<String, dynamic> toJson() {
    final adaptiveQuantization = this.adaptiveQuantization;
    final alternateTransferFunctionSei = this.alternateTransferFunctionSei;
    final bitrate = this.bitrate;
    final codecLevel = this.codecLevel;
    final codecProfile = this.codecProfile;
    final dynamicSubGop = this.dynamicSubGop;
    final flickerAdaptiveQuantization = this.flickerAdaptiveQuantization;
    final framerateControl = this.framerateControl;
    final framerateConversionAlgorithm = this.framerateConversionAlgorithm;
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final gopBReference = this.gopBReference;
    final gopClosedCadence = this.gopClosedCadence;
    final gopSize = this.gopSize;
    final gopSizeUnits = this.gopSizeUnits;
    final hrdBufferInitialFillPercentage = this.hrdBufferInitialFillPercentage;
    final hrdBufferSize = this.hrdBufferSize;
    final interlaceMode = this.interlaceMode;
    final maxBitrate = this.maxBitrate;
    final minIInterval = this.minIInterval;
    final numberBFramesBetweenReferenceFrames =
        this.numberBFramesBetweenReferenceFrames;
    final numberReferenceFrames = this.numberReferenceFrames;
    final parControl = this.parControl;
    final parDenominator = this.parDenominator;
    final parNumerator = this.parNumerator;
    final qualityTuningLevel = this.qualityTuningLevel;
    final qvbrSettings = this.qvbrSettings;
    final rateControlMode = this.rateControlMode;
    final sampleAdaptiveOffsetFilterMode = this.sampleAdaptiveOffsetFilterMode;
    final sceneChangeDetect = this.sceneChangeDetect;
    final slices = this.slices;
    final slowPal = this.slowPal;
    final spatialAdaptiveQuantization = this.spatialAdaptiveQuantization;
    final telecine = this.telecine;
    final temporalAdaptiveQuantization = this.temporalAdaptiveQuantization;
    final temporalIds = this.temporalIds;
    final tiles = this.tiles;
    final unregisteredSeiTimecode = this.unregisteredSeiTimecode;
    final writeMp4PackagingType = this.writeMp4PackagingType;
    return {
      if (adaptiveQuantization != null)
        'adaptiveQuantization': adaptiveQuantization.toValue(),
      if (alternateTransferFunctionSei != null)
        'alternateTransferFunctionSei': alternateTransferFunctionSei.toValue(),
      if (bitrate != null) 'bitrate': bitrate,
      if (codecLevel != null) 'codecLevel': codecLevel.toValue(),
      if (codecProfile != null) 'codecProfile': codecProfile.toValue(),
      if (dynamicSubGop != null) 'dynamicSubGop': dynamicSubGop.toValue(),
      if (flickerAdaptiveQuantization != null)
        'flickerAdaptiveQuantization': flickerAdaptiveQuantization.toValue(),
      if (framerateControl != null)
        'framerateControl': framerateControl.toValue(),
      if (framerateConversionAlgorithm != null)
        'framerateConversionAlgorithm': framerateConversionAlgorithm.toValue(),
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
      if (gopBReference != null) 'gopBReference': gopBReference.toValue(),
      if (gopClosedCadence != null) 'gopClosedCadence': gopClosedCadence,
      if (gopSize != null) 'gopSize': gopSize,
      if (gopSizeUnits != null) 'gopSizeUnits': gopSizeUnits.toValue(),
      if (hrdBufferInitialFillPercentage != null)
        'hrdBufferInitialFillPercentage': hrdBufferInitialFillPercentage,
      if (hrdBufferSize != null) 'hrdBufferSize': hrdBufferSize,
      if (interlaceMode != null) 'interlaceMode': interlaceMode.toValue(),
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (minIInterval != null) 'minIInterval': minIInterval,
      if (numberBFramesBetweenReferenceFrames != null)
        'numberBFramesBetweenReferenceFrames':
            numberBFramesBetweenReferenceFrames,
      if (numberReferenceFrames != null)
        'numberReferenceFrames': numberReferenceFrames,
      if (parControl != null) 'parControl': parControl.toValue(),
      if (parDenominator != null) 'parDenominator': parDenominator,
      if (parNumerator != null) 'parNumerator': parNumerator,
      if (qualityTuningLevel != null)
        'qualityTuningLevel': qualityTuningLevel.toValue(),
      if (qvbrSettings != null) 'qvbrSettings': qvbrSettings,
      if (rateControlMode != null) 'rateControlMode': rateControlMode.toValue(),
      if (sampleAdaptiveOffsetFilterMode != null)
        'sampleAdaptiveOffsetFilterMode':
            sampleAdaptiveOffsetFilterMode.toValue(),
      if (sceneChangeDetect != null)
        'sceneChangeDetect': sceneChangeDetect.toValue(),
      if (slices != null) 'slices': slices,
      if (slowPal != null) 'slowPal': slowPal.toValue(),
      if (spatialAdaptiveQuantization != null)
        'spatialAdaptiveQuantization': spatialAdaptiveQuantization.toValue(),
      if (telecine != null) 'telecine': telecine.toValue(),
      if (temporalAdaptiveQuantization != null)
        'temporalAdaptiveQuantization': temporalAdaptiveQuantization.toValue(),
      if (temporalIds != null) 'temporalIds': temporalIds.toValue(),
      if (tiles != null) 'tiles': tiles.toValue(),
      if (unregisteredSeiTimecode != null)
        'unregisteredSeiTimecode': unregisteredSeiTimecode.toValue(),
      if (writeMp4PackagingType != null)
        'writeMp4PackagingType': writeMp4PackagingType.toValue(),
    };
  }
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
  disabled,
  enabled,
}

extension on H265SlowPal {
  String toValue() {
    switch (this) {
      case H265SlowPal.disabled:
        return 'DISABLED';
      case H265SlowPal.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H265SlowPal toH265SlowPal() {
    switch (this) {
      case 'DISABLED':
        return H265SlowPal.disabled;
      case 'ENABLED':
        return H265SlowPal.enabled;
    }
    throw Exception('$this is not known in enum H265SlowPal');
  }
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
  disabled,
  enabled,
}

extension on H265SpatialAdaptiveQuantization {
  String toValue() {
    switch (this) {
      case H265SpatialAdaptiveQuantization.disabled:
        return 'DISABLED';
      case H265SpatialAdaptiveQuantization.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H265SpatialAdaptiveQuantization toH265SpatialAdaptiveQuantization() {
    switch (this) {
      case 'DISABLED':
        return H265SpatialAdaptiveQuantization.disabled;
      case 'ENABLED':
        return H265SpatialAdaptiveQuantization.enabled;
    }
    throw Exception(
        '$this is not known in enum H265SpatialAdaptiveQuantization');
  }
}

/// This field applies only if the Streams > Advanced > Framerate (framerate)
/// field  is set to 29.970. This field works with the Streams > Advanced >
/// Preprocessors > Deinterlacer  field (deinterlace_mode) and the Streams >
/// Advanced > Interlaced Mode field (interlace_mode)  to identify the scan type
/// for the output: Progressive, Interlaced, Hard Telecine or Soft Telecine. -
/// Hard: produces 29.97i output from 23.976 input. - Soft: produces 23.976; the
/// player converts this output to 29.97i.
enum H265Telecine {
  none,
  soft,
  hard,
}

extension on H265Telecine {
  String toValue() {
    switch (this) {
      case H265Telecine.none:
        return 'NONE';
      case H265Telecine.soft:
        return 'SOFT';
      case H265Telecine.hard:
        return 'HARD';
    }
  }
}

extension on String {
  H265Telecine toH265Telecine() {
    switch (this) {
      case 'NONE':
        return H265Telecine.none;
      case 'SOFT':
        return H265Telecine.soft;
      case 'HARD':
        return H265Telecine.hard;
    }
    throw Exception('$this is not known in enum H265Telecine');
  }
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
  disabled,
  enabled,
}

extension on H265TemporalAdaptiveQuantization {
  String toValue() {
    switch (this) {
      case H265TemporalAdaptiveQuantization.disabled:
        return 'DISABLED';
      case H265TemporalAdaptiveQuantization.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H265TemporalAdaptiveQuantization toH265TemporalAdaptiveQuantization() {
    switch (this) {
      case 'DISABLED':
        return H265TemporalAdaptiveQuantization.disabled;
      case 'ENABLED':
        return H265TemporalAdaptiveQuantization.enabled;
    }
    throw Exception(
        '$this is not known in enum H265TemporalAdaptiveQuantization');
  }
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
  disabled,
  enabled,
}

extension on H265TemporalIds {
  String toValue() {
    switch (this) {
      case H265TemporalIds.disabled:
        return 'DISABLED';
      case H265TemporalIds.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H265TemporalIds toH265TemporalIds() {
    switch (this) {
      case 'DISABLED':
        return H265TemporalIds.disabled;
      case 'ENABLED':
        return H265TemporalIds.enabled;
    }
    throw Exception('$this is not known in enum H265TemporalIds');
  }
}

/// Enable use of tiles, allowing horizontal as well as vertical subdivision of
/// the encoded pictures.
enum H265Tiles {
  disabled,
  enabled,
}

extension on H265Tiles {
  String toValue() {
    switch (this) {
      case H265Tiles.disabled:
        return 'DISABLED';
      case H265Tiles.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H265Tiles toH265Tiles() {
    switch (this) {
      case 'DISABLED':
        return H265Tiles.disabled;
      case 'ENABLED':
        return H265Tiles.enabled;
    }
    throw Exception('$this is not known in enum H265Tiles');
  }
}

/// Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
enum H265UnregisteredSeiTimecode {
  disabled,
  enabled,
}

extension on H265UnregisteredSeiTimecode {
  String toValue() {
    switch (this) {
      case H265UnregisteredSeiTimecode.disabled:
        return 'DISABLED';
      case H265UnregisteredSeiTimecode.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H265UnregisteredSeiTimecode toH265UnregisteredSeiTimecode() {
    switch (this) {
      case 'DISABLED':
        return H265UnregisteredSeiTimecode.disabled;
      case 'ENABLED':
        return H265UnregisteredSeiTimecode.enabled;
    }
    throw Exception('$this is not known in enum H265UnregisteredSeiTimecode');
  }
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
  hvc1,
  hev1,
}

extension on H265WriteMp4PackagingType {
  String toValue() {
    switch (this) {
      case H265WriteMp4PackagingType.hvc1:
        return 'HVC1';
      case H265WriteMp4PackagingType.hev1:
        return 'HEV1';
    }
  }
}

extension on String {
  H265WriteMp4PackagingType toH265WriteMp4PackagingType() {
    switch (this) {
      case 'HVC1':
        return H265WriteMp4PackagingType.hvc1;
      case 'HEV1':
        return H265WriteMp4PackagingType.hev1;
    }
    throw Exception('$this is not known in enum H265WriteMp4PackagingType');
  }
}

/// Use these settings to specify static color calibration metadata, as defined
/// by SMPTE ST 2086. These values don't affect the pixel values that are
/// encoded in the video stream. They are intended to help the downstream video
/// player display content in a way that reflects the intentions of the the
/// content creator.
class Hdr10Metadata {
  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  final int? bluePrimaryX;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  final int? bluePrimaryY;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  final int? greenPrimaryX;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  final int? greenPrimaryY;

  /// Maximum light level among all samples in the coded video sequence, in units
  /// of candelas per square meter.  This setting doesn't have a default value;
  /// you must specify a value that is suitable for the content.
  final int? maxContentLightLevel;

  /// Maximum average light level of any frame in the coded video sequence, in
  /// units of candelas per square meter. This setting doesn't have a default
  /// value; you must specify a value that is suitable for the content.
  final int? maxFrameAverageLightLevel;

  /// Nominal maximum mastering display luminance in units of of 0.0001 candelas
  /// per square meter.
  final int? maxLuminance;

  /// Nominal minimum mastering display luminance in units of of 0.0001 candelas
  /// per square meter
  final int? minLuminance;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  final int? redPrimaryX;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  final int? redPrimaryY;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  final int? whitePointX;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents 0.00002
  /// in CIE1931 color coordinate. Note that this setting is not for color
  /// correction.
  final int? whitePointY;

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
  factory Hdr10Metadata.fromJson(Map<String, dynamic> json) {
    return Hdr10Metadata(
      bluePrimaryX: json['bluePrimaryX'] as int?,
      bluePrimaryY: json['bluePrimaryY'] as int?,
      greenPrimaryX: json['greenPrimaryX'] as int?,
      greenPrimaryY: json['greenPrimaryY'] as int?,
      maxContentLightLevel: json['maxContentLightLevel'] as int?,
      maxFrameAverageLightLevel: json['maxFrameAverageLightLevel'] as int?,
      maxLuminance: json['maxLuminance'] as int?,
      minLuminance: json['minLuminance'] as int?,
      redPrimaryX: json['redPrimaryX'] as int?,
      redPrimaryY: json['redPrimaryY'] as int?,
      whitePointX: json['whitePointX'] as int?,
      whitePointY: json['whitePointY'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bluePrimaryX = this.bluePrimaryX;
    final bluePrimaryY = this.bluePrimaryY;
    final greenPrimaryX = this.greenPrimaryX;
    final greenPrimaryY = this.greenPrimaryY;
    final maxContentLightLevel = this.maxContentLightLevel;
    final maxFrameAverageLightLevel = this.maxFrameAverageLightLevel;
    final maxLuminance = this.maxLuminance;
    final minLuminance = this.minLuminance;
    final redPrimaryX = this.redPrimaryX;
    final redPrimaryY = this.redPrimaryY;
    final whitePointX = this.whitePointX;
    final whitePointY = this.whitePointY;
    return {
      if (bluePrimaryX != null) 'bluePrimaryX': bluePrimaryX,
      if (bluePrimaryY != null) 'bluePrimaryY': bluePrimaryY,
      if (greenPrimaryX != null) 'greenPrimaryX': greenPrimaryX,
      if (greenPrimaryY != null) 'greenPrimaryY': greenPrimaryY,
      if (maxContentLightLevel != null)
        'maxContentLightLevel': maxContentLightLevel,
      if (maxFrameAverageLightLevel != null)
        'maxFrameAverageLightLevel': maxFrameAverageLightLevel,
      if (maxLuminance != null) 'maxLuminance': maxLuminance,
      if (minLuminance != null) 'minLuminance': minLuminance,
      if (redPrimaryX != null) 'redPrimaryX': redPrimaryX,
      if (redPrimaryY != null) 'redPrimaryY': redPrimaryY,
      if (whitePointX != null) 'whitePointX': whitePointX,
      if (whitePointY != null) 'whitePointY': whitePointY,
    };
  }
}

enum HlsAdMarkers {
  elemental,
  elementalScte35,
}

extension on HlsAdMarkers {
  String toValue() {
    switch (this) {
      case HlsAdMarkers.elemental:
        return 'ELEMENTAL';
      case HlsAdMarkers.elementalScte35:
        return 'ELEMENTAL_SCTE35';
    }
  }
}

extension on String {
  HlsAdMarkers toHlsAdMarkers() {
    switch (this) {
      case 'ELEMENTAL':
        return HlsAdMarkers.elemental;
      case 'ELEMENTAL_SCTE35':
        return HlsAdMarkers.elementalScte35;
    }
    throw Exception('$this is not known in enum HlsAdMarkers');
  }
}

/// Specify the details for each additional HLS manifest that you want the
/// service to generate for this output group. Each manifest can reference a
/// different subset of outputs in the group.
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
  final String? manifestNameModifier;

  /// Specify the outputs that you want this additional top-level manifest to
  /// reference.
  final List<String>? selectedOutputs;

  HlsAdditionalManifest({
    this.manifestNameModifier,
    this.selectedOutputs,
  });
  factory HlsAdditionalManifest.fromJson(Map<String, dynamic> json) {
    return HlsAdditionalManifest(
      manifestNameModifier: json['manifestNameModifier'] as String?,
      selectedOutputs: (json['selectedOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final manifestNameModifier = this.manifestNameModifier;
    final selectedOutputs = this.selectedOutputs;
    return {
      if (manifestNameModifier != null)
        'manifestNameModifier': manifestNameModifier,
      if (selectedOutputs != null) 'selectedOutputs': selectedOutputs,
    };
  }
}

/// Use this setting only in audio-only outputs. Choose MPEG-2 Transport Stream
/// (M2TS) to create a file in an MPEG2-TS container. Keep the default value
/// Automatic (AUTOMATIC) to create a raw audio-only file with no container.
/// Regardless of the value that you specify here, if this output has video, the
/// service will place outputs into an MPEG2-TS container.
enum HlsAudioOnlyContainer {
  automatic,
  m2ts,
}

extension on HlsAudioOnlyContainer {
  String toValue() {
    switch (this) {
      case HlsAudioOnlyContainer.automatic:
        return 'AUTOMATIC';
      case HlsAudioOnlyContainer.m2ts:
        return 'M2TS';
    }
  }
}

extension on String {
  HlsAudioOnlyContainer toHlsAudioOnlyContainer() {
    switch (this) {
      case 'AUTOMATIC':
        return HlsAudioOnlyContainer.automatic;
      case 'M2TS':
        return HlsAudioOnlyContainer.m2ts;
    }
    throw Exception('$this is not known in enum HlsAudioOnlyContainer');
  }
}

/// Ignore this setting unless you are using FairPlay DRM with Verimatrix and
/// you encounter playback issues. Keep the default value, Include (INCLUDE), to
/// output audio-only headers. Choose Exclude (EXCLUDE) to remove the audio-only
/// headers from your audio segments.
enum HlsAudioOnlyHeader {
  include,
  exclude,
}

extension on HlsAudioOnlyHeader {
  String toValue() {
    switch (this) {
      case HlsAudioOnlyHeader.include:
        return 'INCLUDE';
      case HlsAudioOnlyHeader.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  HlsAudioOnlyHeader toHlsAudioOnlyHeader() {
    switch (this) {
      case 'INCLUDE':
        return HlsAudioOnlyHeader.include;
      case 'EXCLUDE':
        return HlsAudioOnlyHeader.exclude;
    }
    throw Exception('$this is not known in enum HlsAudioOnlyHeader');
  }
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
  alternateAudioAutoSelectDefault,
  alternateAudioAutoSelect,
  alternateAudioNotAutoSelect,
  audioOnlyVariantStream,
}

extension on HlsAudioTrackType {
  String toValue() {
    switch (this) {
      case HlsAudioTrackType.alternateAudioAutoSelectDefault:
        return 'ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT';
      case HlsAudioTrackType.alternateAudioAutoSelect:
        return 'ALTERNATE_AUDIO_AUTO_SELECT';
      case HlsAudioTrackType.alternateAudioNotAutoSelect:
        return 'ALTERNATE_AUDIO_NOT_AUTO_SELECT';
      case HlsAudioTrackType.audioOnlyVariantStream:
        return 'AUDIO_ONLY_VARIANT_STREAM';
    }
  }
}

extension on String {
  HlsAudioTrackType toHlsAudioTrackType() {
    switch (this) {
      case 'ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT':
        return HlsAudioTrackType.alternateAudioAutoSelectDefault;
      case 'ALTERNATE_AUDIO_AUTO_SELECT':
        return HlsAudioTrackType.alternateAudioAutoSelect;
      case 'ALTERNATE_AUDIO_NOT_AUTO_SELECT':
        return HlsAudioTrackType.alternateAudioNotAutoSelect;
      case 'AUDIO_ONLY_VARIANT_STREAM':
        return HlsAudioTrackType.audioOnlyVariantStream;
    }
    throw Exception('$this is not known in enum HlsAudioTrackType');
  }
}

/// Caption Language Mapping
class HlsCaptionLanguageMapping {
  /// Caption channel.
  final int? captionChannel;

  /// Specify the language for this captions channel, using the ISO 639-2 or ISO
  /// 639-3 three-letter language code
  final String? customLanguageCode;

  /// Specify the language, using the ISO 639-2 three-letter code listed at
  /// https://www.loc.gov/standards/iso639-2/php/code_list.php.
  final LanguageCode? languageCode;

  /// Caption language description.
  final String? languageDescription;

  HlsCaptionLanguageMapping({
    this.captionChannel,
    this.customLanguageCode,
    this.languageCode,
    this.languageDescription,
  });
  factory HlsCaptionLanguageMapping.fromJson(Map<String, dynamic> json) {
    return HlsCaptionLanguageMapping(
      captionChannel: json['captionChannel'] as int?,
      customLanguageCode: json['customLanguageCode'] as String?,
      languageCode: (json['languageCode'] as String?)?.toLanguageCode(),
      languageDescription: json['languageDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final captionChannel = this.captionChannel;
    final customLanguageCode = this.customLanguageCode;
    final languageCode = this.languageCode;
    final languageDescription = this.languageDescription;
    return {
      if (captionChannel != null) 'captionChannel': captionChannel,
      if (customLanguageCode != null) 'customLanguageCode': customLanguageCode,
      if (languageCode != null) 'languageCode': languageCode.toValue(),
      if (languageDescription != null)
        'languageDescription': languageDescription,
    };
  }
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
  insert,
  omit,
  none,
}

extension on HlsCaptionLanguageSetting {
  String toValue() {
    switch (this) {
      case HlsCaptionLanguageSetting.insert:
        return 'INSERT';
      case HlsCaptionLanguageSetting.omit:
        return 'OMIT';
      case HlsCaptionLanguageSetting.none:
        return 'NONE';
    }
  }
}

extension on String {
  HlsCaptionLanguageSetting toHlsCaptionLanguageSetting() {
    switch (this) {
      case 'INSERT':
        return HlsCaptionLanguageSetting.insert;
      case 'OMIT':
        return HlsCaptionLanguageSetting.omit;
      case 'NONE':
        return HlsCaptionLanguageSetting.none;
    }
    throw Exception('$this is not known in enum HlsCaptionLanguageSetting');
  }
}

/// Disable this setting only when your workflow requires the
/// #EXT-X-ALLOW-CACHE:no tag. Otherwise, keep the default value Enabled
/// (ENABLED) and control caching in your video distribution set up. For
/// example, use the Cache-Control http header.
enum HlsClientCache {
  disabled,
  enabled,
}

extension on HlsClientCache {
  String toValue() {
    switch (this) {
      case HlsClientCache.disabled:
        return 'DISABLED';
      case HlsClientCache.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  HlsClientCache toHlsClientCache() {
    switch (this) {
      case 'DISABLED':
        return HlsClientCache.disabled;
      case 'ENABLED':
        return HlsClientCache.enabled;
    }
    throw Exception('$this is not known in enum HlsClientCache');
  }
}

/// Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist
/// generation.
enum HlsCodecSpecification {
  rfc_6381,
  rfc_4281,
}

extension on HlsCodecSpecification {
  String toValue() {
    switch (this) {
      case HlsCodecSpecification.rfc_6381:
        return 'RFC_6381';
      case HlsCodecSpecification.rfc_4281:
        return 'RFC_4281';
    }
  }
}

extension on String {
  HlsCodecSpecification toHlsCodecSpecification() {
    switch (this) {
      case 'RFC_6381':
        return HlsCodecSpecification.rfc_6381;
      case 'RFC_4281':
        return HlsCodecSpecification.rfc_4281;
    }
    throw Exception('$this is not known in enum HlsCodecSpecification');
  }
}

/// Indicates whether segments should be placed in subdirectories.
enum HlsDirectoryStructure {
  singleDirectory,
  subdirectoryPerStream,
}

extension on HlsDirectoryStructure {
  String toValue() {
    switch (this) {
      case HlsDirectoryStructure.singleDirectory:
        return 'SINGLE_DIRECTORY';
      case HlsDirectoryStructure.subdirectoryPerStream:
        return 'SUBDIRECTORY_PER_STREAM';
    }
  }
}

extension on String {
  HlsDirectoryStructure toHlsDirectoryStructure() {
    switch (this) {
      case 'SINGLE_DIRECTORY':
        return HlsDirectoryStructure.singleDirectory;
      case 'SUBDIRECTORY_PER_STREAM':
        return HlsDirectoryStructure.subdirectoryPerStream;
    }
    throw Exception('$this is not known in enum HlsDirectoryStructure');
  }
}

/// Settings for HLS encryption
class HlsEncryptionSettings {
  /// This is a 128-bit, 16-byte hex value represented by a 32-character text
  /// string. If this parameter is not set then the Initialization Vector will
  /// follow the segment number by default.
  final String? constantInitializationVector;

  /// Encrypts the segments with the given encryption scheme. Leave blank to
  /// disable. Selecting 'Disabled' in the web interface also disables encryption.
  final HlsEncryptionType? encryptionMethod;

  /// The Initialization Vector is a 128-bit number used in conjunction with the
  /// key for encrypting blocks. If set to INCLUDE, Initialization Vector is
  /// listed in the manifest. Otherwise Initialization Vector is not in the
  /// manifest.
  final HlsInitializationVectorInManifest? initializationVectorInManifest;

  /// Enable this setting to insert the EXT-X-SESSION-KEY element into the master
  /// playlist. This allows for offline Apple HLS FairPlay content protection.
  final HlsOfflineEncrypted? offlineEncrypted;

  /// If your output group type is HLS, DASH, or Microsoft Smooth, use these
  /// settings when doing DRM encryption with a SPEKE-compliant key provider.  If
  /// your output group type is CMAF, use the SpekeKeyProviderCmaf settings
  /// instead.
  final SpekeKeyProvider? spekeKeyProvider;

  /// Use these settings to set up encryption with a static key provider.
  final StaticKeyProvider? staticKeyProvider;

  /// Specify whether your DRM encryption key is static or from a key provider
  /// that follows the SPEKE standard. For more information about SPEKE, see
  /// https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
  final HlsKeyProviderType? type;

  HlsEncryptionSettings({
    this.constantInitializationVector,
    this.encryptionMethod,
    this.initializationVectorInManifest,
    this.offlineEncrypted,
    this.spekeKeyProvider,
    this.staticKeyProvider,
    this.type,
  });
  factory HlsEncryptionSettings.fromJson(Map<String, dynamic> json) {
    return HlsEncryptionSettings(
      constantInitializationVector:
          json['constantInitializationVector'] as String?,
      encryptionMethod:
          (json['encryptionMethod'] as String?)?.toHlsEncryptionType(),
      initializationVectorInManifest:
          (json['initializationVectorInManifest'] as String?)
              ?.toHlsInitializationVectorInManifest(),
      offlineEncrypted:
          (json['offlineEncrypted'] as String?)?.toHlsOfflineEncrypted(),
      spekeKeyProvider: json['spekeKeyProvider'] != null
          ? SpekeKeyProvider.fromJson(
              json['spekeKeyProvider'] as Map<String, dynamic>)
          : null,
      staticKeyProvider: json['staticKeyProvider'] != null
          ? StaticKeyProvider.fromJson(
              json['staticKeyProvider'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.toHlsKeyProviderType(),
    );
  }

  Map<String, dynamic> toJson() {
    final constantInitializationVector = this.constantInitializationVector;
    final encryptionMethod = this.encryptionMethod;
    final initializationVectorInManifest = this.initializationVectorInManifest;
    final offlineEncrypted = this.offlineEncrypted;
    final spekeKeyProvider = this.spekeKeyProvider;
    final staticKeyProvider = this.staticKeyProvider;
    final type = this.type;
    return {
      if (constantInitializationVector != null)
        'constantInitializationVector': constantInitializationVector,
      if (encryptionMethod != null)
        'encryptionMethod': encryptionMethod.toValue(),
      if (initializationVectorInManifest != null)
        'initializationVectorInManifest':
            initializationVectorInManifest.toValue(),
      if (offlineEncrypted != null)
        'offlineEncrypted': offlineEncrypted.toValue(),
      if (spekeKeyProvider != null) 'spekeKeyProvider': spekeKeyProvider,
      if (staticKeyProvider != null) 'staticKeyProvider': staticKeyProvider,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Encrypts the segments with the given encryption scheme. Leave blank to
/// disable. Selecting 'Disabled' in the web interface also disables encryption.
enum HlsEncryptionType {
  aes128,
  sampleAes,
}

extension on HlsEncryptionType {
  String toValue() {
    switch (this) {
      case HlsEncryptionType.aes128:
        return 'AES128';
      case HlsEncryptionType.sampleAes:
        return 'SAMPLE_AES';
    }
  }
}

extension on String {
  HlsEncryptionType toHlsEncryptionType() {
    switch (this) {
      case 'AES128':
        return HlsEncryptionType.aes128;
      case 'SAMPLE_AES':
        return HlsEncryptionType.sampleAes;
    }
    throw Exception('$this is not known in enum HlsEncryptionType');
  }
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// HLS_GROUP_SETTINGS.
class HlsGroupSettings {
  /// Choose one or more ad marker types to decorate your Apple HLS manifest. This
  /// setting does not determine whether SCTE-35 markers appear in the outputs
  /// themselves.
  final List<HlsAdMarkers>? adMarkers;

  /// By default, the service creates one top-level .m3u8 HLS manifest for each
  /// HLS output group in your job. This default manifest references every output
  /// in the output group. To create additional top-level manifests that reference
  /// a subset of the outputs in the output group, specify a list of them here.
  final List<HlsAdditionalManifest>? additionalManifests;

  /// Ignore this setting unless you are using FairPlay DRM with Verimatrix and
  /// you encounter playback issues. Keep the default value, Include (INCLUDE), to
  /// output audio-only headers. Choose Exclude (EXCLUDE) to remove the audio-only
  /// headers from your audio segments.
  final HlsAudioOnlyHeader? audioOnlyHeader;

  /// A partial URI prefix that will be prepended to each output in the media
  /// .m3u8 file. Can be used if base manifest is delivered from a different URL
  /// than the main .m3u8 file.
  final String? baseUrl;

  /// Language to be used on Caption outputs
  final List<HlsCaptionLanguageMapping>? captionLanguageMappings;

  /// Applies only to 608 Embedded output captions. Insert: Include
  /// CLOSED-CAPTIONS lines in the manifest. Specify at least one language in the
  /// CC1 Language Code field. One CLOSED-CAPTION line is added for each Language
  /// Code you specify. Make sure to specify the languages in the order in which
  /// they appear in the original source (if the source is embedded format) or the
  /// order of the caption selectors (if the source is other than embedded).
  /// Otherwise, languages in the manifest will not match up properly with the
  /// output captions. None: Include CLOSED-CAPTIONS=NONE line in the manifest.
  /// Omit: Omit any CLOSED-CAPTIONS line from the manifest.
  final HlsCaptionLanguageSetting? captionLanguageSetting;

  /// Disable this setting only when your workflow requires the
  /// #EXT-X-ALLOW-CACHE:no tag. Otherwise, keep the default value Enabled
  /// (ENABLED) and control caching in your video distribution set up. For
  /// example, use the Cache-Control http header.
  final HlsClientCache? clientCache;

  /// Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist
  /// generation.
  final HlsCodecSpecification? codecSpecification;

  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do not
  /// specify the base filename in the URI, the service will use the filename of
  /// the input file. If your job has multiple inputs, the service uses the
  /// filename of the first input file.
  final String? destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  final DestinationSettings? destinationSettings;

  /// Indicates whether segments should be placed in subdirectories.
  final HlsDirectoryStructure? directoryStructure;

  /// DRM settings.
  final HlsEncryptionSettings? encryption;

  /// When set to GZIP, compresses HLS playlist.
  final HlsManifestCompression? manifestCompression;

  /// Indicates whether the output manifest should use floating point values for
  /// segment duration.
  final HlsManifestDurationFormat? manifestDurationFormat;

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
  final double? minFinalSegmentLength;

  /// When set, Minimum Segment Size is enforced by looking ahead and back within
  /// the specified range for a nearby avail and extending the segment size if
  /// needed.
  final int? minSegmentLength;

  /// Indicates whether the .m3u8 manifest file should be generated for this HLS
  /// output group.
  final HlsOutputSelection? outputSelection;

  /// Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files.
  /// The value is calculated as follows: either the program date and time are
  /// initialized using the input timecode source, or the time is initialized
  /// using the input timecode source and the date is initialized using the
  /// timestamp_offset.
  final HlsProgramDateTime? programDateTime;

  /// Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.
  final int? programDateTimePeriod;

  /// When set to SINGLE_FILE, emits program as a single media resource (.ts)
  /// file, uses #EXT-X-BYTERANGE tags to index segment for playback.
  final HlsSegmentControl? segmentControl;

  /// Length of MPEG-2 Transport Stream segments to create (in seconds). Note that
  /// segments will end on the next keyframe after this number of seconds, so
  /// actual segment length may be longer.
  final int? segmentLength;

  /// Number of segments to write to a subdirectory before starting a new one.
  /// directoryStructure must be SINGLE_DIRECTORY for this setting to have an
  /// effect.
  final int? segmentsPerSubdirectory;

  /// Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of
  /// variant manifest.
  final HlsStreamInfResolution? streamInfResolution;

  /// Indicates ID3 frame that has the timecode.
  final HlsTimedMetadataId3Frame? timedMetadataId3Frame;

  /// Timed Metadata interval in seconds.
  final int? timedMetadataId3Period;

  /// Provides an extra millisecond delta offset to fine tune the timestamps.
  final int? timestampDeltaMilliseconds;

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
  factory HlsGroupSettings.fromJson(Map<String, dynamic> json) {
    return HlsGroupSettings(
      adMarkers: (json['adMarkers'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toHlsAdMarkers())
          .toList(),
      additionalManifests: (json['additionalManifests'] as List?)
          ?.whereNotNull()
          .map((e) => HlsAdditionalManifest.fromJson(e as Map<String, dynamic>))
          .toList(),
      audioOnlyHeader:
          (json['audioOnlyHeader'] as String?)?.toHlsAudioOnlyHeader(),
      baseUrl: json['baseUrl'] as String?,
      captionLanguageMappings: (json['captionLanguageMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              HlsCaptionLanguageMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      captionLanguageSetting: (json['captionLanguageSetting'] as String?)
          ?.toHlsCaptionLanguageSetting(),
      clientCache: (json['clientCache'] as String?)?.toHlsClientCache(),
      codecSpecification:
          (json['codecSpecification'] as String?)?.toHlsCodecSpecification(),
      destination: json['destination'] as String?,
      destinationSettings: json['destinationSettings'] != null
          ? DestinationSettings.fromJson(
              json['destinationSettings'] as Map<String, dynamic>)
          : null,
      directoryStructure:
          (json['directoryStructure'] as String?)?.toHlsDirectoryStructure(),
      encryption: json['encryption'] != null
          ? HlsEncryptionSettings.fromJson(
              json['encryption'] as Map<String, dynamic>)
          : null,
      manifestCompression:
          (json['manifestCompression'] as String?)?.toHlsManifestCompression(),
      manifestDurationFormat: (json['manifestDurationFormat'] as String?)
          ?.toHlsManifestDurationFormat(),
      minFinalSegmentLength: json['minFinalSegmentLength'] as double?,
      minSegmentLength: json['minSegmentLength'] as int?,
      outputSelection:
          (json['outputSelection'] as String?)?.toHlsOutputSelection(),
      programDateTime:
          (json['programDateTime'] as String?)?.toHlsProgramDateTime(),
      programDateTimePeriod: json['programDateTimePeriod'] as int?,
      segmentControl:
          (json['segmentControl'] as String?)?.toHlsSegmentControl(),
      segmentLength: json['segmentLength'] as int?,
      segmentsPerSubdirectory: json['segmentsPerSubdirectory'] as int?,
      streamInfResolution:
          (json['streamInfResolution'] as String?)?.toHlsStreamInfResolution(),
      timedMetadataId3Frame: (json['timedMetadataId3Frame'] as String?)
          ?.toHlsTimedMetadataId3Frame(),
      timedMetadataId3Period: json['timedMetadataId3Period'] as int?,
      timestampDeltaMilliseconds: json['timestampDeltaMilliseconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final adMarkers = this.adMarkers;
    final additionalManifests = this.additionalManifests;
    final audioOnlyHeader = this.audioOnlyHeader;
    final baseUrl = this.baseUrl;
    final captionLanguageMappings = this.captionLanguageMappings;
    final captionLanguageSetting = this.captionLanguageSetting;
    final clientCache = this.clientCache;
    final codecSpecification = this.codecSpecification;
    final destination = this.destination;
    final destinationSettings = this.destinationSettings;
    final directoryStructure = this.directoryStructure;
    final encryption = this.encryption;
    final manifestCompression = this.manifestCompression;
    final manifestDurationFormat = this.manifestDurationFormat;
    final minFinalSegmentLength = this.minFinalSegmentLength;
    final minSegmentLength = this.minSegmentLength;
    final outputSelection = this.outputSelection;
    final programDateTime = this.programDateTime;
    final programDateTimePeriod = this.programDateTimePeriod;
    final segmentControl = this.segmentControl;
    final segmentLength = this.segmentLength;
    final segmentsPerSubdirectory = this.segmentsPerSubdirectory;
    final streamInfResolution = this.streamInfResolution;
    final timedMetadataId3Frame = this.timedMetadataId3Frame;
    final timedMetadataId3Period = this.timedMetadataId3Period;
    final timestampDeltaMilliseconds = this.timestampDeltaMilliseconds;
    return {
      if (adMarkers != null)
        'adMarkers': adMarkers.map((e) => e.toValue()).toList(),
      if (additionalManifests != null)
        'additionalManifests': additionalManifests,
      if (audioOnlyHeader != null) 'audioOnlyHeader': audioOnlyHeader.toValue(),
      if (baseUrl != null) 'baseUrl': baseUrl,
      if (captionLanguageMappings != null)
        'captionLanguageMappings': captionLanguageMappings,
      if (captionLanguageSetting != null)
        'captionLanguageSetting': captionLanguageSetting.toValue(),
      if (clientCache != null) 'clientCache': clientCache.toValue(),
      if (codecSpecification != null)
        'codecSpecification': codecSpecification.toValue(),
      if (destination != null) 'destination': destination,
      if (destinationSettings != null)
        'destinationSettings': destinationSettings,
      if (directoryStructure != null)
        'directoryStructure': directoryStructure.toValue(),
      if (encryption != null) 'encryption': encryption,
      if (manifestCompression != null)
        'manifestCompression': manifestCompression.toValue(),
      if (manifestDurationFormat != null)
        'manifestDurationFormat': manifestDurationFormat.toValue(),
      if (minFinalSegmentLength != null)
        'minFinalSegmentLength': minFinalSegmentLength,
      if (minSegmentLength != null) 'minSegmentLength': minSegmentLength,
      if (outputSelection != null) 'outputSelection': outputSelection.toValue(),
      if (programDateTime != null) 'programDateTime': programDateTime.toValue(),
      if (programDateTimePeriod != null)
        'programDateTimePeriod': programDateTimePeriod,
      if (segmentControl != null) 'segmentControl': segmentControl.toValue(),
      if (segmentLength != null) 'segmentLength': segmentLength,
      if (segmentsPerSubdirectory != null)
        'segmentsPerSubdirectory': segmentsPerSubdirectory,
      if (streamInfResolution != null)
        'streamInfResolution': streamInfResolution.toValue(),
      if (timedMetadataId3Frame != null)
        'timedMetadataId3Frame': timedMetadataId3Frame.toValue(),
      if (timedMetadataId3Period != null)
        'timedMetadataId3Period': timedMetadataId3Period,
      if (timestampDeltaMilliseconds != null)
        'timestampDeltaMilliseconds': timestampDeltaMilliseconds,
    };
  }
}

/// When set to INCLUDE, writes I-Frame Only Manifest in addition to the HLS
/// manifest
enum HlsIFrameOnlyManifest {
  include,
  exclude,
}

extension on HlsIFrameOnlyManifest {
  String toValue() {
    switch (this) {
      case HlsIFrameOnlyManifest.include:
        return 'INCLUDE';
      case HlsIFrameOnlyManifest.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  HlsIFrameOnlyManifest toHlsIFrameOnlyManifest() {
    switch (this) {
      case 'INCLUDE':
        return HlsIFrameOnlyManifest.include;
      case 'EXCLUDE':
        return HlsIFrameOnlyManifest.exclude;
    }
    throw Exception('$this is not known in enum HlsIFrameOnlyManifest');
  }
}

/// The Initialization Vector is a 128-bit number used in conjunction with the
/// key for encrypting blocks. If set to INCLUDE, Initialization Vector is
/// listed in the manifest. Otherwise Initialization Vector is not in the
/// manifest.
enum HlsInitializationVectorInManifest {
  include,
  exclude,
}

extension on HlsInitializationVectorInManifest {
  String toValue() {
    switch (this) {
      case HlsInitializationVectorInManifest.include:
        return 'INCLUDE';
      case HlsInitializationVectorInManifest.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  HlsInitializationVectorInManifest toHlsInitializationVectorInManifest() {
    switch (this) {
      case 'INCLUDE':
        return HlsInitializationVectorInManifest.include;
      case 'EXCLUDE':
        return HlsInitializationVectorInManifest.exclude;
    }
    throw Exception(
        '$this is not known in enum HlsInitializationVectorInManifest');
  }
}

/// Specify whether your DRM encryption key is static or from a key provider
/// that follows the SPEKE standard. For more information about SPEKE, see
/// https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
enum HlsKeyProviderType {
  speke,
  staticKey,
}

extension on HlsKeyProviderType {
  String toValue() {
    switch (this) {
      case HlsKeyProviderType.speke:
        return 'SPEKE';
      case HlsKeyProviderType.staticKey:
        return 'STATIC_KEY';
    }
  }
}

extension on String {
  HlsKeyProviderType toHlsKeyProviderType() {
    switch (this) {
      case 'SPEKE':
        return HlsKeyProviderType.speke;
      case 'STATIC_KEY':
        return HlsKeyProviderType.staticKey;
    }
    throw Exception('$this is not known in enum HlsKeyProviderType');
  }
}

/// When set to GZIP, compresses HLS playlist.
enum HlsManifestCompression {
  gzip,
  none,
}

extension on HlsManifestCompression {
  String toValue() {
    switch (this) {
      case HlsManifestCompression.gzip:
        return 'GZIP';
      case HlsManifestCompression.none:
        return 'NONE';
    }
  }
}

extension on String {
  HlsManifestCompression toHlsManifestCompression() {
    switch (this) {
      case 'GZIP':
        return HlsManifestCompression.gzip;
      case 'NONE':
        return HlsManifestCompression.none;
    }
    throw Exception('$this is not known in enum HlsManifestCompression');
  }
}

/// Indicates whether the output manifest should use floating point values for
/// segment duration.
enum HlsManifestDurationFormat {
  floatingPoint,
  integer,
}

extension on HlsManifestDurationFormat {
  String toValue() {
    switch (this) {
      case HlsManifestDurationFormat.floatingPoint:
        return 'FLOATING_POINT';
      case HlsManifestDurationFormat.integer:
        return 'INTEGER';
    }
  }
}

extension on String {
  HlsManifestDurationFormat toHlsManifestDurationFormat() {
    switch (this) {
      case 'FLOATING_POINT':
        return HlsManifestDurationFormat.floatingPoint;
      case 'INTEGER':
        return HlsManifestDurationFormat.integer;
    }
    throw Exception('$this is not known in enum HlsManifestDurationFormat');
  }
}

/// Enable this setting to insert the EXT-X-SESSION-KEY element into the master
/// playlist. This allows for offline Apple HLS FairPlay content protection.
enum HlsOfflineEncrypted {
  enabled,
  disabled,
}

extension on HlsOfflineEncrypted {
  String toValue() {
    switch (this) {
      case HlsOfflineEncrypted.enabled:
        return 'ENABLED';
      case HlsOfflineEncrypted.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  HlsOfflineEncrypted toHlsOfflineEncrypted() {
    switch (this) {
      case 'ENABLED':
        return HlsOfflineEncrypted.enabled;
      case 'DISABLED':
        return HlsOfflineEncrypted.disabled;
    }
    throw Exception('$this is not known in enum HlsOfflineEncrypted');
  }
}

/// Indicates whether the .m3u8 manifest file should be generated for this HLS
/// output group.
enum HlsOutputSelection {
  manifestsAndSegments,
  segmentsOnly,
}

extension on HlsOutputSelection {
  String toValue() {
    switch (this) {
      case HlsOutputSelection.manifestsAndSegments:
        return 'MANIFESTS_AND_SEGMENTS';
      case HlsOutputSelection.segmentsOnly:
        return 'SEGMENTS_ONLY';
    }
  }
}

extension on String {
  HlsOutputSelection toHlsOutputSelection() {
    switch (this) {
      case 'MANIFESTS_AND_SEGMENTS':
        return HlsOutputSelection.manifestsAndSegments;
      case 'SEGMENTS_ONLY':
        return HlsOutputSelection.segmentsOnly;
    }
    throw Exception('$this is not known in enum HlsOutputSelection');
  }
}

/// Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files.
/// The value is calculated as follows: either the program date and time are
/// initialized using the input timecode source, or the time is initialized
/// using the input timecode source and the date is initialized using the
/// timestamp_offset.
enum HlsProgramDateTime {
  include,
  exclude,
}

extension on HlsProgramDateTime {
  String toValue() {
    switch (this) {
      case HlsProgramDateTime.include:
        return 'INCLUDE';
      case HlsProgramDateTime.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  HlsProgramDateTime toHlsProgramDateTime() {
    switch (this) {
      case 'INCLUDE':
        return HlsProgramDateTime.include;
      case 'EXCLUDE':
        return HlsProgramDateTime.exclude;
    }
    throw Exception('$this is not known in enum HlsProgramDateTime');
  }
}

/// When set to SINGLE_FILE, emits program as a single media resource (.ts)
/// file, uses #EXT-X-BYTERANGE tags to index segment for playback.
enum HlsSegmentControl {
  singleFile,
  segmentedFiles,
}

extension on HlsSegmentControl {
  String toValue() {
    switch (this) {
      case HlsSegmentControl.singleFile:
        return 'SINGLE_FILE';
      case HlsSegmentControl.segmentedFiles:
        return 'SEGMENTED_FILES';
    }
  }
}

extension on String {
  HlsSegmentControl toHlsSegmentControl() {
    switch (this) {
      case 'SINGLE_FILE':
        return HlsSegmentControl.singleFile;
      case 'SEGMENTED_FILES':
        return HlsSegmentControl.segmentedFiles;
    }
    throw Exception('$this is not known in enum HlsSegmentControl');
  }
}

/// Settings for HLS output groups
class HlsSettings {
  /// Specifies the group to which the audio Rendition belongs.
  final String? audioGroupId;

  /// Use this setting only in audio-only outputs. Choose MPEG-2 Transport Stream
  /// (M2TS) to create a file in an MPEG2-TS container. Keep the default value
  /// Automatic (AUTOMATIC) to create an audio-only file in a raw container.
  /// Regardless of the value that you specify here, if this output has video, the
  /// service will place the output into an MPEG2-TS container.
  final HlsAudioOnlyContainer? audioOnlyContainer;

  /// List all the audio groups that are used with the video output stream. Input
  /// all the audio GROUP-IDs that are associated to the video, separate by ','.
  final String? audioRenditionSets;

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
  final HlsAudioTrackType? audioTrackType;

  /// When set to INCLUDE, writes I-Frame Only Manifest in addition to the HLS
  /// manifest
  final HlsIFrameOnlyManifest? iFrameOnlyManifest;

  /// Use this setting to add an identifying string to the filename of each
  /// segment. The service adds this string between the name modifier and segment
  /// index number. You can use format identifiers in the string. For more
  /// information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/using-variables-in-your-job-settings.html
  final String? segmentModifier;

  HlsSettings({
    this.audioGroupId,
    this.audioOnlyContainer,
    this.audioRenditionSets,
    this.audioTrackType,
    this.iFrameOnlyManifest,
    this.segmentModifier,
  });
  factory HlsSettings.fromJson(Map<String, dynamic> json) {
    return HlsSettings(
      audioGroupId: json['audioGroupId'] as String?,
      audioOnlyContainer:
          (json['audioOnlyContainer'] as String?)?.toHlsAudioOnlyContainer(),
      audioRenditionSets: json['audioRenditionSets'] as String?,
      audioTrackType:
          (json['audioTrackType'] as String?)?.toHlsAudioTrackType(),
      iFrameOnlyManifest:
          (json['iFrameOnlyManifest'] as String?)?.toHlsIFrameOnlyManifest(),
      segmentModifier: json['segmentModifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioGroupId = this.audioGroupId;
    final audioOnlyContainer = this.audioOnlyContainer;
    final audioRenditionSets = this.audioRenditionSets;
    final audioTrackType = this.audioTrackType;
    final iFrameOnlyManifest = this.iFrameOnlyManifest;
    final segmentModifier = this.segmentModifier;
    return {
      if (audioGroupId != null) 'audioGroupId': audioGroupId,
      if (audioOnlyContainer != null)
        'audioOnlyContainer': audioOnlyContainer.toValue(),
      if (audioRenditionSets != null) 'audioRenditionSets': audioRenditionSets,
      if (audioTrackType != null) 'audioTrackType': audioTrackType.toValue(),
      if (iFrameOnlyManifest != null)
        'iFrameOnlyManifest': iFrameOnlyManifest.toValue(),
      if (segmentModifier != null) 'segmentModifier': segmentModifier,
    };
  }
}

/// Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of
/// variant manifest.
enum HlsStreamInfResolution {
  include,
  exclude,
}

extension on HlsStreamInfResolution {
  String toValue() {
    switch (this) {
      case HlsStreamInfResolution.include:
        return 'INCLUDE';
      case HlsStreamInfResolution.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  HlsStreamInfResolution toHlsStreamInfResolution() {
    switch (this) {
      case 'INCLUDE':
        return HlsStreamInfResolution.include;
      case 'EXCLUDE':
        return HlsStreamInfResolution.exclude;
    }
    throw Exception('$this is not known in enum HlsStreamInfResolution');
  }
}

/// Indicates ID3 frame that has the timecode.
enum HlsTimedMetadataId3Frame {
  none,
  priv,
  tdrl,
}

extension on HlsTimedMetadataId3Frame {
  String toValue() {
    switch (this) {
      case HlsTimedMetadataId3Frame.none:
        return 'NONE';
      case HlsTimedMetadataId3Frame.priv:
        return 'PRIV';
      case HlsTimedMetadataId3Frame.tdrl:
        return 'TDRL';
    }
  }
}

extension on String {
  HlsTimedMetadataId3Frame toHlsTimedMetadataId3Frame() {
    switch (this) {
      case 'NONE':
        return HlsTimedMetadataId3Frame.none;
      case 'PRIV':
        return HlsTimedMetadataId3Frame.priv;
      case 'TDRL':
        return HlsTimedMetadataId3Frame.tdrl;
    }
    throw Exception('$this is not known in enum HlsTimedMetadataId3Frame');
  }
}

/// Optional. Configuration for a destination queue to which the job can hop
/// once a customer-defined minimum wait time has passed.
class HopDestination {
  /// Optional. When you set up a job to use queue hopping, you can specify a
  /// different relative priority for the job in the destination queue. If you
  /// don't specify, the relative priority will remain the same as in the previous
  /// queue.
  final int? priority;

  /// Optional unless the job is submitted on the default queue. When you set up a
  /// job to use queue hopping, you can specify a destination queue. This queue
  /// cannot be the original queue to which the job is submitted. If the original
  /// queue isn't the default queue and you don't specify the destination queue,
  /// the job will move to the default queue.
  final String? queue;

  /// Required for setting up a job to use queue hopping. Minimum wait time in
  /// minutes until the job can hop to the destination queue. Valid range is 1 to
  /// 1440 minutes, inclusive.
  final int? waitMinutes;

  HopDestination({
    this.priority,
    this.queue,
    this.waitMinutes,
  });
  factory HopDestination.fromJson(Map<String, dynamic> json) {
    return HopDestination(
      priority: json['priority'] as int?,
      queue: json['queue'] as String?,
      waitMinutes: json['waitMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final priority = this.priority;
    final queue = this.queue;
    final waitMinutes = this.waitMinutes;
    return {
      if (priority != null) 'priority': priority,
      if (queue != null) 'queue': queue,
      if (waitMinutes != null) 'waitMinutes': waitMinutes,
    };
  }
}

/// To insert ID3 tags in your output, specify two values. Use ID3 tag (Id3) to
/// specify the base 64 encoded string and use Timecode (TimeCode) to specify
/// the time when the tag should be inserted. To insert multiple ID3 tags in
/// your output, create multiple instances of ID3 insertion (Id3Insertion).
class Id3Insertion {
  /// Use ID3 tag (Id3) to provide a tag value in base64-encode format.
  final String? id3;

  /// Provide a Timecode (TimeCode) in HH:MM:SS:FF or HH:MM:SS;FF format.
  final String? timecode;

  Id3Insertion({
    this.id3,
    this.timecode,
  });
  factory Id3Insertion.fromJson(Map<String, dynamic> json) {
    return Id3Insertion(
      id3: json['id3'] as String?,
      timecode: json['timecode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id3 = this.id3;
    final timecode = this.timecode;
    return {
      if (id3 != null) 'id3': id3,
      if (timecode != null) 'timecode': timecode,
    };
  }
}

/// Enable the image inserter feature to include a graphic overlay on your
/// video. Enable or disable this feature for each input or output individually.
/// This setting is disabled by default.
class ImageInserter {
  /// Specify the images that you want to overlay on your video. The images must
  /// be PNG or TGA files.
  final List<InsertableImage>? insertableImages;

  ImageInserter({
    this.insertableImages,
  });
  factory ImageInserter.fromJson(Map<String, dynamic> json) {
    return ImageInserter(
      insertableImages: (json['insertableImages'] as List?)
          ?.whereNotNull()
          .map((e) => InsertableImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final insertableImages = this.insertableImages;
    return {
      if (insertableImages != null) 'insertableImages': insertableImages,
    };
  }
}

/// Settings specific to IMSC caption outputs.
class ImscDestinationSettings {
  /// Keep this setting enabled to have MediaConvert use the font style and
  /// position information from the captions source in the output. This option is
  /// available only when your input captions are IMSC, SMPTE-TT, or TTML. Disable
  /// this setting for simplified output captions.
  final ImscStylePassthrough? stylePassthrough;

  ImscDestinationSettings({
    this.stylePassthrough,
  });
  factory ImscDestinationSettings.fromJson(Map<String, dynamic> json) {
    return ImscDestinationSettings(
      stylePassthrough:
          (json['stylePassthrough'] as String?)?.toImscStylePassthrough(),
    );
  }

  Map<String, dynamic> toJson() {
    final stylePassthrough = this.stylePassthrough;
    return {
      if (stylePassthrough != null)
        'stylePassthrough': stylePassthrough.toValue(),
    };
  }
}

/// Keep this setting enabled to have MediaConvert use the font style and
/// position information from the captions source in the output. This option is
/// available only when your input captions are IMSC, SMPTE-TT, or TTML. Disable
/// this setting for simplified output captions.
enum ImscStylePassthrough {
  enabled,
  disabled,
}

extension on ImscStylePassthrough {
  String toValue() {
    switch (this) {
      case ImscStylePassthrough.enabled:
        return 'ENABLED';
      case ImscStylePassthrough.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  ImscStylePassthrough toImscStylePassthrough() {
    switch (this) {
      case 'ENABLED':
        return ImscStylePassthrough.enabled;
      case 'DISABLED':
        return ImscStylePassthrough.disabled;
    }
    throw Exception('$this is not known in enum ImscStylePassthrough');
  }
}

/// Specifies media input
class Input {
  /// Specifies set of audio selectors within an input to combine. An input may
  /// have multiple audio selector groups. See "Audio Selector
  /// Group":#inputs-audio_selector_group for more information.
  final Map<String, AudioSelectorGroup>? audioSelectorGroups;

  /// Use Audio selectors (AudioSelectors) to specify a track or set of tracks
  /// from the input that you will use in your outputs. You can use multiple Audio
  /// selectors per input.
  final Map<String, AudioSelector>? audioSelectors;

  /// Use captions selectors to specify the captions data from your input that you
  /// use in your outputs. You can use up to 20 captions selectors per input.
  final Map<String, CaptionSelector>? captionSelectors;

  /// Use Cropping selection (crop) to specify the video area that the service
  /// will include in the output video frame. If you specify a value here, it will
  /// override any value that you specify in the output setting Cropping selection
  /// (crop).
  final Rectangle? crop;

  /// Enable Deblock (InputDeblockFilter) to produce smoother motion in the
  /// output. Default is disabled. Only manually controllable for MPEG2 and
  /// uncompressed video inputs.
  final InputDeblockFilter? deblockFilter;

  /// Settings for decrypting any input files that you encrypt before you upload
  /// them to Amazon S3. MediaConvert can decrypt files only when you use AWS Key
  /// Management Service (KMS) to encrypt the data key that you use to encrypt
  /// your content.
  final InputDecryptionSettings? decryptionSettings;

  /// Enable Denoise (InputDenoiseFilter) to filter noise from the input.  Default
  /// is disabled. Only applicable to MPEG2, H.264, H.265, and uncompressed video
  /// inputs.
  final InputDenoiseFilter? denoiseFilter;

  /// Specify the source file for your transcoding job. You can use multiple
  /// inputs in a single job. The service concatenates these inputs, in the order
  /// that you specify them in the job, to create the outputs. If your input
  /// format is IMF, specify your input by providing the path to your CPL. For
  /// example, "s3://bucket/vf/cpl.xml". If the CPL is in an incomplete IMP, make
  /// sure to use *Supplemental IMPs* (SupplementalImps) to specify any
  /// supplemental IMPs that contain assets referenced by the CPL.
  final String? fileInput;

  /// Specify how the transcoding service applies the denoise and deblock filters.
  /// You must also enable the filters separately, with Denoise
  /// (InputDenoiseFilter) and Deblock (InputDeblockFilter). * Auto - The
  /// transcoding service determines whether to apply filtering, depending on
  /// input type and quality. * Disable - The input is not filtered. This is true
  /// even if you use the API to enable them in (InputDeblockFilter) and
  /// (InputDeblockFilter). * Force - The input is filtered regardless of input
  /// type.
  final InputFilterEnable? filterEnable;

  /// Use Filter strength (FilterStrength) to adjust the magnitude the input
  /// filter settings (Deblock and Denoise). The range is -5 to 5. Default is 0.
  final int? filterStrength;

  /// Enable the image inserter feature to include a graphic overlay on your
  /// video. Enable or disable this feature for each input individually. This
  /// setting is disabled by default.
  final ImageInserter? imageInserter;

  /// (InputClippings) contains sets of start and end times that together specify
  /// a portion of the input to be used in the outputs. If you provide only a
  /// start time, the clip will be the entire input from that point to the end. If
  /// you provide only an end time, it will be the entire input up to that point.
  /// When you specify more than one input clip, the transcoding service creates
  /// the job outputs by stringing the clips together in the order you specify
  /// them.
  final List<InputClipping>? inputClippings;

  /// When you have a progressive segmented frame (PsF) input, use this setting to
  /// flag the input as PsF. MediaConvert doesn't automatically detect PsF.
  /// Therefore, flagging your input as PsF results in better preservation of
  /// video quality when you do deinterlacing and frame rate conversion. If you
  /// don't specify, the default value is Auto (AUTO). Auto is the correct setting
  /// for all inputs that are not PsF. Don't set this value to PsF when your input
  /// is interlaced. Doing so creates horizontal interlacing artifacts.
  final InputScanType? inputScanType;

  /// Use Selection placement (position) to define the video area in your output
  /// frame. The area outside of the rectangle that you specify here is black. If
  /// you specify a value here, it will override any value that you specify in the
  /// output setting Selection placement (position). If you specify a value here,
  /// this will override any AFD values in your input, even if you set Respond to
  /// AFD (RespondToAfd) to Respond (RESPOND). If you specify a value here, this
  /// will ignore anything that you specify for the setting Scaling Behavior
  /// (scalingBehavior).
  final Rectangle? position;

  /// Use Program (programNumber) to select a specific program from within a
  /// multi-program transport stream. Note that Quad 4K is not currently
  /// supported. Default is the first program within the transport stream. If the
  /// program you specify doesn't exist, the transcoding service will use this
  /// default.
  final int? programNumber;

  /// Set PSI control (InputPsiControl) for transport stream inputs to specify
  /// which data the demux process to scans. * Ignore PSI - Scan all PIDs for
  /// audio and video. * Use PSI - Scan only PSI data.
  final InputPsiControl? psiControl;

  /// Provide a list of any necessary supplemental IMPs. You need supplemental
  /// IMPs if the CPL that you're using for your input is in an incomplete IMP.
  /// Specify either the supplemental IMP directories with a trailing slash or the
  /// ASSETMAP.xml files. For example ["s3://bucket/ov/",
  /// "s3://bucket/vf2/ASSETMAP.xml"]. You don't need to specify the IMP that
  /// contains your input CPL, because the service automatically detects it.
  final List<String>? supplementalImps;

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
  final InputTimecodeSource? timecodeSource;

  /// Specify the timecode that you want the service to use for this input's
  /// initial frame. To use this setting, you must set the Timecode source
  /// setting, located under the input settings (InputTimecodeSource), to
  /// Specified start (SPECIFIEDSTART). For more information about timecodes, see
  /// https://docs.aws.amazon.com/console/mediaconvert/timecode.
  final String? timecodeStart;

  /// Selector for video.
  final VideoSelector? videoSelector;

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
  factory Input.fromJson(Map<String, dynamic> json) {
    return Input(
      audioSelectorGroups:
          (json['audioSelectorGroups'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k, AudioSelectorGroup.fromJson(e as Map<String, dynamic>))),
      audioSelectors: (json['audioSelectors'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, AudioSelector.fromJson(e as Map<String, dynamic>))),
      captionSelectors: (json['captionSelectors'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, CaptionSelector.fromJson(e as Map<String, dynamic>))),
      crop: json['crop'] != null
          ? Rectangle.fromJson(json['crop'] as Map<String, dynamic>)
          : null,
      deblockFilter: (json['deblockFilter'] as String?)?.toInputDeblockFilter(),
      decryptionSettings: json['decryptionSettings'] != null
          ? InputDecryptionSettings.fromJson(
              json['decryptionSettings'] as Map<String, dynamic>)
          : null,
      denoiseFilter: (json['denoiseFilter'] as String?)?.toInputDenoiseFilter(),
      fileInput: json['fileInput'] as String?,
      filterEnable: (json['filterEnable'] as String?)?.toInputFilterEnable(),
      filterStrength: json['filterStrength'] as int?,
      imageInserter: json['imageInserter'] != null
          ? ImageInserter.fromJson(
              json['imageInserter'] as Map<String, dynamic>)
          : null,
      inputClippings: (json['inputClippings'] as List?)
          ?.whereNotNull()
          .map((e) => InputClipping.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputScanType: (json['inputScanType'] as String?)?.toInputScanType(),
      position: json['position'] != null
          ? Rectangle.fromJson(json['position'] as Map<String, dynamic>)
          : null,
      programNumber: json['programNumber'] as int?,
      psiControl: (json['psiControl'] as String?)?.toInputPsiControl(),
      supplementalImps: (json['supplementalImps'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      timecodeSource:
          (json['timecodeSource'] as String?)?.toInputTimecodeSource(),
      timecodeStart: json['timecodeStart'] as String?,
      videoSelector: json['videoSelector'] != null
          ? VideoSelector.fromJson(
              json['videoSelector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioSelectorGroups = this.audioSelectorGroups;
    final audioSelectors = this.audioSelectors;
    final captionSelectors = this.captionSelectors;
    final crop = this.crop;
    final deblockFilter = this.deblockFilter;
    final decryptionSettings = this.decryptionSettings;
    final denoiseFilter = this.denoiseFilter;
    final fileInput = this.fileInput;
    final filterEnable = this.filterEnable;
    final filterStrength = this.filterStrength;
    final imageInserter = this.imageInserter;
    final inputClippings = this.inputClippings;
    final inputScanType = this.inputScanType;
    final position = this.position;
    final programNumber = this.programNumber;
    final psiControl = this.psiControl;
    final supplementalImps = this.supplementalImps;
    final timecodeSource = this.timecodeSource;
    final timecodeStart = this.timecodeStart;
    final videoSelector = this.videoSelector;
    return {
      if (audioSelectorGroups != null)
        'audioSelectorGroups': audioSelectorGroups,
      if (audioSelectors != null) 'audioSelectors': audioSelectors,
      if (captionSelectors != null) 'captionSelectors': captionSelectors,
      if (crop != null) 'crop': crop,
      if (deblockFilter != null) 'deblockFilter': deblockFilter.toValue(),
      if (decryptionSettings != null) 'decryptionSettings': decryptionSettings,
      if (denoiseFilter != null) 'denoiseFilter': denoiseFilter.toValue(),
      if (fileInput != null) 'fileInput': fileInput,
      if (filterEnable != null) 'filterEnable': filterEnable.toValue(),
      if (filterStrength != null) 'filterStrength': filterStrength,
      if (imageInserter != null) 'imageInserter': imageInserter,
      if (inputClippings != null) 'inputClippings': inputClippings,
      if (inputScanType != null) 'inputScanType': inputScanType.toValue(),
      if (position != null) 'position': position,
      if (programNumber != null) 'programNumber': programNumber,
      if (psiControl != null) 'psiControl': psiControl.toValue(),
      if (supplementalImps != null) 'supplementalImps': supplementalImps,
      if (timecodeSource != null) 'timecodeSource': timecodeSource.toValue(),
      if (timecodeStart != null) 'timecodeStart': timecodeStart,
      if (videoSelector != null) 'videoSelector': videoSelector,
    };
  }
}

/// To transcode only portions of your input (clips), include one Input clipping
/// (one instance of InputClipping in the JSON job file) for each input clip.
/// All input clips you specify will be included in every output of the job.
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
  final String? endTimecode;

  /// Set Start timecode (StartTimecode) to the beginning of the portion of the
  /// input you are clipping. The frame corresponding to the Start timecode value
  /// is included in the clip. Start timecode or End timecode may be left blank,
  /// but not both. Use the format HH:MM:SS:FF or HH:MM:SS;FF, where HH is the
  /// hour, MM is the minute, SS is the second, and FF is the frame number. When
  /// choosing this value, take into account your setting for Input timecode
  /// source. For example, if you have embedded timecodes that start at
  /// 01:00:00:00 and you want your clip to begin five minutes into the video, use
  /// 01:05:00:00.
  final String? startTimecode;

  InputClipping({
    this.endTimecode,
    this.startTimecode,
  });
  factory InputClipping.fromJson(Map<String, dynamic> json) {
    return InputClipping(
      endTimecode: json['endTimecode'] as String?,
      startTimecode: json['startTimecode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTimecode = this.endTimecode;
    final startTimecode = this.startTimecode;
    return {
      if (endTimecode != null) 'endTimecode': endTimecode,
      if (startTimecode != null) 'startTimecode': startTimecode,
    };
  }
}

/// Enable Deblock (InputDeblockFilter) to produce smoother motion in the
/// output. Default is disabled. Only manually controllable for MPEG2 and
/// uncompressed video inputs.
enum InputDeblockFilter {
  enabled,
  disabled,
}

extension on InputDeblockFilter {
  String toValue() {
    switch (this) {
      case InputDeblockFilter.enabled:
        return 'ENABLED';
      case InputDeblockFilter.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  InputDeblockFilter toInputDeblockFilter() {
    switch (this) {
      case 'ENABLED':
        return InputDeblockFilter.enabled;
      case 'DISABLED':
        return InputDeblockFilter.disabled;
    }
    throw Exception('$this is not known in enum InputDeblockFilter');
  }
}

/// Settings for decrypting any input files that you encrypt before you upload
/// them to Amazon S3. MediaConvert can decrypt files only when you use AWS Key
/// Management Service (KMS) to encrypt the data key that you use to encrypt
/// your content.
class InputDecryptionSettings {
  /// Specify the encryption mode that you used to encrypt your input files.
  final DecryptionMode? decryptionMode;

  /// Warning! Don't provide your encryption key in plaintext. Your job settings
  /// could be intercepted, making your encrypted content vulnerable. Specify the
  /// encrypted version of the data key that you used to encrypt your content. The
  /// data key must be encrypted by AWS Key Management Service (KMS). The key can
  /// be 128, 192, or 256 bits.
  final String? encryptedDecryptionKey;

  /// Specify the initialization vector that you used when you encrypted your
  /// content before uploading it to Amazon S3. You can use a 16-byte
  /// initialization vector with any encryption mode. Or, you can use a 12-byte
  /// initialization vector with GCM or CTR. MediaConvert accepts only
  /// initialization vectors that are base64-encoded.
  final String? initializationVector;

  /// Specify the AWS Region for AWS Key Management Service (KMS) that you used to
  /// encrypt your data key, if that Region is different from the one you are
  /// using for AWS Elemental MediaConvert.
  final String? kmsKeyRegion;

  InputDecryptionSettings({
    this.decryptionMode,
    this.encryptedDecryptionKey,
    this.initializationVector,
    this.kmsKeyRegion,
  });
  factory InputDecryptionSettings.fromJson(Map<String, dynamic> json) {
    return InputDecryptionSettings(
      decryptionMode: (json['decryptionMode'] as String?)?.toDecryptionMode(),
      encryptedDecryptionKey: json['encryptedDecryptionKey'] as String?,
      initializationVector: json['initializationVector'] as String?,
      kmsKeyRegion: json['kmsKeyRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final decryptionMode = this.decryptionMode;
    final encryptedDecryptionKey = this.encryptedDecryptionKey;
    final initializationVector = this.initializationVector;
    final kmsKeyRegion = this.kmsKeyRegion;
    return {
      if (decryptionMode != null) 'decryptionMode': decryptionMode.toValue(),
      if (encryptedDecryptionKey != null)
        'encryptedDecryptionKey': encryptedDecryptionKey,
      if (initializationVector != null)
        'initializationVector': initializationVector,
      if (kmsKeyRegion != null) 'kmsKeyRegion': kmsKeyRegion,
    };
  }
}

/// Enable Denoise (InputDenoiseFilter) to filter noise from the input.  Default
/// is disabled. Only applicable to MPEG2, H.264, H.265, and uncompressed video
/// inputs.
enum InputDenoiseFilter {
  enabled,
  disabled,
}

extension on InputDenoiseFilter {
  String toValue() {
    switch (this) {
      case InputDenoiseFilter.enabled:
        return 'ENABLED';
      case InputDenoiseFilter.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  InputDenoiseFilter toInputDenoiseFilter() {
    switch (this) {
      case 'ENABLED':
        return InputDenoiseFilter.enabled;
      case 'DISABLED':
        return InputDenoiseFilter.disabled;
    }
    throw Exception('$this is not known in enum InputDenoiseFilter');
  }
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
  auto,
  disable,
  force,
}

extension on InputFilterEnable {
  String toValue() {
    switch (this) {
      case InputFilterEnable.auto:
        return 'AUTO';
      case InputFilterEnable.disable:
        return 'DISABLE';
      case InputFilterEnable.force:
        return 'FORCE';
    }
  }
}

extension on String {
  InputFilterEnable toInputFilterEnable() {
    switch (this) {
      case 'AUTO':
        return InputFilterEnable.auto;
      case 'DISABLE':
        return InputFilterEnable.disable;
      case 'FORCE':
        return InputFilterEnable.force;
    }
    throw Exception('$this is not known in enum InputFilterEnable');
  }
}

/// Set PSI control (InputPsiControl) for transport stream inputs to specify
/// which data the demux process to scans. * Ignore PSI - Scan all PIDs for
/// audio and video. * Use PSI - Scan only PSI data.
enum InputPsiControl {
  ignorePsi,
  usePsi,
}

extension on InputPsiControl {
  String toValue() {
    switch (this) {
      case InputPsiControl.ignorePsi:
        return 'IGNORE_PSI';
      case InputPsiControl.usePsi:
        return 'USE_PSI';
    }
  }
}

extension on String {
  InputPsiControl toInputPsiControl() {
    switch (this) {
      case 'IGNORE_PSI':
        return InputPsiControl.ignorePsi;
      case 'USE_PSI':
        return InputPsiControl.usePsi;
    }
    throw Exception('$this is not known in enum InputPsiControl');
  }
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
  degree_0,
  degrees_90,
  degrees_180,
  degrees_270,
  auto,
}

extension on InputRotate {
  String toValue() {
    switch (this) {
      case InputRotate.degree_0:
        return 'DEGREE_0';
      case InputRotate.degrees_90:
        return 'DEGREES_90';
      case InputRotate.degrees_180:
        return 'DEGREES_180';
      case InputRotate.degrees_270:
        return 'DEGREES_270';
      case InputRotate.auto:
        return 'AUTO';
    }
  }
}

extension on String {
  InputRotate toInputRotate() {
    switch (this) {
      case 'DEGREE_0':
        return InputRotate.degree_0;
      case 'DEGREES_90':
        return InputRotate.degrees_90;
      case 'DEGREES_180':
        return InputRotate.degrees_180;
      case 'DEGREES_270':
        return InputRotate.degrees_270;
      case 'AUTO':
        return InputRotate.auto;
    }
    throw Exception('$this is not known in enum InputRotate');
  }
}

/// When you have a progressive segmented frame (PsF) input, use this setting to
/// flag the input as PsF. MediaConvert doesn't automatically detect PsF.
/// Therefore, flagging your input as PsF results in better preservation of
/// video quality when you do deinterlacing and frame rate conversion. If you
/// don't specify, the default value is Auto (AUTO). Auto is the correct setting
/// for all inputs that are not PsF. Don't set this value to PsF when your input
/// is interlaced. Doing so creates horizontal interlacing artifacts.
enum InputScanType {
  auto,
  psf,
}

extension on InputScanType {
  String toValue() {
    switch (this) {
      case InputScanType.auto:
        return 'AUTO';
      case InputScanType.psf:
        return 'PSF';
    }
  }
}

extension on String {
  InputScanType toInputScanType() {
    switch (this) {
      case 'AUTO':
        return InputScanType.auto;
      case 'PSF':
        return InputScanType.psf;
    }
    throw Exception('$this is not known in enum InputScanType');
  }
}

/// Specified video input in a template.
class InputTemplate {
  /// Specifies set of audio selectors within an input to combine. An input may
  /// have multiple audio selector groups. See "Audio Selector
  /// Group":#inputs-audio_selector_group for more information.
  final Map<String, AudioSelectorGroup>? audioSelectorGroups;

  /// Use Audio selectors (AudioSelectors) to specify a track or set of tracks
  /// from the input that you will use in your outputs. You can use multiple Audio
  /// selectors per input.
  final Map<String, AudioSelector>? audioSelectors;

  /// Use captions selectors to specify the captions data from your input that you
  /// use in your outputs. You can use up to 20 captions selectors per input.
  final Map<String, CaptionSelector>? captionSelectors;

  /// Use Cropping selection (crop) to specify the video area that the service
  /// will include in the output video frame. If you specify a value here, it will
  /// override any value that you specify in the output setting Cropping selection
  /// (crop).
  final Rectangle? crop;

  /// Enable Deblock (InputDeblockFilter) to produce smoother motion in the
  /// output. Default is disabled. Only manually controllable for MPEG2 and
  /// uncompressed video inputs.
  final InputDeblockFilter? deblockFilter;

  /// Enable Denoise (InputDenoiseFilter) to filter noise from the input.  Default
  /// is disabled. Only applicable to MPEG2, H.264, H.265, and uncompressed video
  /// inputs.
  final InputDenoiseFilter? denoiseFilter;

  /// Specify how the transcoding service applies the denoise and deblock filters.
  /// You must also enable the filters separately, with Denoise
  /// (InputDenoiseFilter) and Deblock (InputDeblockFilter). * Auto - The
  /// transcoding service determines whether to apply filtering, depending on
  /// input type and quality. * Disable - The input is not filtered. This is true
  /// even if you use the API to enable them in (InputDeblockFilter) and
  /// (InputDeblockFilter). * Force - The input is filtered regardless of input
  /// type.
  final InputFilterEnable? filterEnable;

  /// Use Filter strength (FilterStrength) to adjust the magnitude the input
  /// filter settings (Deblock and Denoise). The range is -5 to 5. Default is 0.
  final int? filterStrength;

  /// Enable the image inserter feature to include a graphic overlay on your
  /// video. Enable or disable this feature for each input individually. This
  /// setting is disabled by default.
  final ImageInserter? imageInserter;

  /// (InputClippings) contains sets of start and end times that together specify
  /// a portion of the input to be used in the outputs. If you provide only a
  /// start time, the clip will be the entire input from that point to the end. If
  /// you provide only an end time, it will be the entire input up to that point.
  /// When you specify more than one input clip, the transcoding service creates
  /// the job outputs by stringing the clips together in the order you specify
  /// them.
  final List<InputClipping>? inputClippings;

  /// When you have a progressive segmented frame (PsF) input, use this setting to
  /// flag the input as PsF. MediaConvert doesn't automatically detect PsF.
  /// Therefore, flagging your input as PsF results in better preservation of
  /// video quality when you do deinterlacing and frame rate conversion. If you
  /// don't specify, the default value is Auto (AUTO). Auto is the correct setting
  /// for all inputs that are not PsF. Don't set this value to PsF when your input
  /// is interlaced. Doing so creates horizontal interlacing artifacts.
  final InputScanType? inputScanType;

  /// Use Selection placement (position) to define the video area in your output
  /// frame. The area outside of the rectangle that you specify here is black. If
  /// you specify a value here, it will override any value that you specify in the
  /// output setting Selection placement (position). If you specify a value here,
  /// this will override any AFD values in your input, even if you set Respond to
  /// AFD (RespondToAfd) to Respond (RESPOND). If you specify a value here, this
  /// will ignore anything that you specify for the setting Scaling Behavior
  /// (scalingBehavior).
  final Rectangle? position;

  /// Use Program (programNumber) to select a specific program from within a
  /// multi-program transport stream. Note that Quad 4K is not currently
  /// supported. Default is the first program within the transport stream. If the
  /// program you specify doesn't exist, the transcoding service will use this
  /// default.
  final int? programNumber;

  /// Set PSI control (InputPsiControl) for transport stream inputs to specify
  /// which data the demux process to scans. * Ignore PSI - Scan all PIDs for
  /// audio and video. * Use PSI - Scan only PSI data.
  final InputPsiControl? psiControl;

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
  final InputTimecodeSource? timecodeSource;

  /// Specify the timecode that you want the service to use for this input's
  /// initial frame. To use this setting, you must set the Timecode source
  /// setting, located under the input settings (InputTimecodeSource), to
  /// Specified start (SPECIFIEDSTART). For more information about timecodes, see
  /// https://docs.aws.amazon.com/console/mediaconvert/timecode.
  final String? timecodeStart;

  /// Selector for video.
  final VideoSelector? videoSelector;

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
  factory InputTemplate.fromJson(Map<String, dynamic> json) {
    return InputTemplate(
      audioSelectorGroups:
          (json['audioSelectorGroups'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k, AudioSelectorGroup.fromJson(e as Map<String, dynamic>))),
      audioSelectors: (json['audioSelectors'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, AudioSelector.fromJson(e as Map<String, dynamic>))),
      captionSelectors: (json['captionSelectors'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, CaptionSelector.fromJson(e as Map<String, dynamic>))),
      crop: json['crop'] != null
          ? Rectangle.fromJson(json['crop'] as Map<String, dynamic>)
          : null,
      deblockFilter: (json['deblockFilter'] as String?)?.toInputDeblockFilter(),
      denoiseFilter: (json['denoiseFilter'] as String?)?.toInputDenoiseFilter(),
      filterEnable: (json['filterEnable'] as String?)?.toInputFilterEnable(),
      filterStrength: json['filterStrength'] as int?,
      imageInserter: json['imageInserter'] != null
          ? ImageInserter.fromJson(
              json['imageInserter'] as Map<String, dynamic>)
          : null,
      inputClippings: (json['inputClippings'] as List?)
          ?.whereNotNull()
          .map((e) => InputClipping.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputScanType: (json['inputScanType'] as String?)?.toInputScanType(),
      position: json['position'] != null
          ? Rectangle.fromJson(json['position'] as Map<String, dynamic>)
          : null,
      programNumber: json['programNumber'] as int?,
      psiControl: (json['psiControl'] as String?)?.toInputPsiControl(),
      timecodeSource:
          (json['timecodeSource'] as String?)?.toInputTimecodeSource(),
      timecodeStart: json['timecodeStart'] as String?,
      videoSelector: json['videoSelector'] != null
          ? VideoSelector.fromJson(
              json['videoSelector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioSelectorGroups = this.audioSelectorGroups;
    final audioSelectors = this.audioSelectors;
    final captionSelectors = this.captionSelectors;
    final crop = this.crop;
    final deblockFilter = this.deblockFilter;
    final denoiseFilter = this.denoiseFilter;
    final filterEnable = this.filterEnable;
    final filterStrength = this.filterStrength;
    final imageInserter = this.imageInserter;
    final inputClippings = this.inputClippings;
    final inputScanType = this.inputScanType;
    final position = this.position;
    final programNumber = this.programNumber;
    final psiControl = this.psiControl;
    final timecodeSource = this.timecodeSource;
    final timecodeStart = this.timecodeStart;
    final videoSelector = this.videoSelector;
    return {
      if (audioSelectorGroups != null)
        'audioSelectorGroups': audioSelectorGroups,
      if (audioSelectors != null) 'audioSelectors': audioSelectors,
      if (captionSelectors != null) 'captionSelectors': captionSelectors,
      if (crop != null) 'crop': crop,
      if (deblockFilter != null) 'deblockFilter': deblockFilter.toValue(),
      if (denoiseFilter != null) 'denoiseFilter': denoiseFilter.toValue(),
      if (filterEnable != null) 'filterEnable': filterEnable.toValue(),
      if (filterStrength != null) 'filterStrength': filterStrength,
      if (imageInserter != null) 'imageInserter': imageInserter,
      if (inputClippings != null) 'inputClippings': inputClippings,
      if (inputScanType != null) 'inputScanType': inputScanType.toValue(),
      if (position != null) 'position': position,
      if (programNumber != null) 'programNumber': programNumber,
      if (psiControl != null) 'psiControl': psiControl.toValue(),
      if (timecodeSource != null) 'timecodeSource': timecodeSource.toValue(),
      if (timecodeStart != null) 'timecodeStart': timecodeStart,
      if (videoSelector != null) 'videoSelector': videoSelector,
    };
  }
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
  embedded,
  zerobased,
  specifiedstart,
}

extension on InputTimecodeSource {
  String toValue() {
    switch (this) {
      case InputTimecodeSource.embedded:
        return 'EMBEDDED';
      case InputTimecodeSource.zerobased:
        return 'ZEROBASED';
      case InputTimecodeSource.specifiedstart:
        return 'SPECIFIEDSTART';
    }
  }
}

extension on String {
  InputTimecodeSource toInputTimecodeSource() {
    switch (this) {
      case 'EMBEDDED':
        return InputTimecodeSource.embedded;
      case 'ZEROBASED':
        return InputTimecodeSource.zerobased;
      case 'SPECIFIEDSTART':
        return InputTimecodeSource.specifiedstart;
    }
    throw Exception('$this is not known in enum InputTimecodeSource');
  }
}

/// Settings that specify how your still graphic overlay appears.
class InsertableImage {
  /// Specify the time, in milliseconds, for the image to remain on the output
  /// video. This duration includes fade-in time but not fade-out time.
  final int? duration;

  /// Specify the length of time, in milliseconds, between the Start time that you
  /// specify for the image insertion and the time that the image appears at full
  /// opacity. Full opacity is the level that you specify for the opacity setting.
  /// If you don't specify a value for Fade-in, the image will appear abruptly at
  /// the overlay start time.
  final int? fadeIn;

  /// Specify the length of time, in milliseconds, between the end of the time
  /// that you have specified for the image overlay Duration and when the overlaid
  /// image has faded to total transparency. If you don't specify a value for
  /// Fade-out, the image will disappear abruptly at the end of the inserted image
  /// duration.
  final int? fadeOut;

  /// Specify the height of the inserted image in pixels. If you specify a value
  /// that's larger than the video resolution height, the service will crop your
  /// overlaid image to fit. To use the native height of the image, keep this
  /// setting blank.
  final int? height;

  /// Specify the HTTP, HTTPS, or Amazon S3 location of the image that you want to
  /// overlay on the video. Use a PNG or TGA file.
  final String? imageInserterInput;

  /// Specify the distance, in pixels, between the inserted image and the left
  /// edge of the video frame. Required for any image overlay that you specify.
  final int? imageX;

  /// Specify the distance, in pixels, between the overlaid image and the top edge
  /// of the video frame. Required for any image overlay that you specify.
  final int? imageY;

  /// Specify how overlapping inserted images appear. Images with higher values
  /// for Layer appear on top of images with lower values for Layer.
  final int? layer;

  /// Use Opacity (Opacity) to specify how much of the underlying video shows
  /// through the inserted image. 0 is transparent and 100 is fully opaque.
  /// Default is 50.
  final int? opacity;

  /// Specify the timecode of the frame that you want the overlay to first appear
  /// on. This must be in timecode (HH:MM:SS:FF or HH:MM:SS;FF) format. Remember
  /// to take into account your timecode source settings.
  final String? startTime;

  /// Specify the width of the inserted image in pixels. If you specify a value
  /// that's larger than the video resolution width, the service will crop your
  /// overlaid image to fit. To use the native width of the image, keep this
  /// setting blank.
  final int? width;

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
  factory InsertableImage.fromJson(Map<String, dynamic> json) {
    return InsertableImage(
      duration: json['duration'] as int?,
      fadeIn: json['fadeIn'] as int?,
      fadeOut: json['fadeOut'] as int?,
      height: json['height'] as int?,
      imageInserterInput: json['imageInserterInput'] as String?,
      imageX: json['imageX'] as int?,
      imageY: json['imageY'] as int?,
      layer: json['layer'] as int?,
      opacity: json['opacity'] as int?,
      startTime: json['startTime'] as String?,
      width: json['width'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final fadeIn = this.fadeIn;
    final fadeOut = this.fadeOut;
    final height = this.height;
    final imageInserterInput = this.imageInserterInput;
    final imageX = this.imageX;
    final imageY = this.imageY;
    final layer = this.layer;
    final opacity = this.opacity;
    final startTime = this.startTime;
    final width = this.width;
    return {
      if (duration != null) 'duration': duration,
      if (fadeIn != null) 'fadeIn': fadeIn,
      if (fadeOut != null) 'fadeOut': fadeOut,
      if (height != null) 'height': height,
      if (imageInserterInput != null) 'imageInserterInput': imageInserterInput,
      if (imageX != null) 'imageX': imageX,
      if (imageY != null) 'imageY': imageY,
      if (layer != null) 'layer': layer,
      if (opacity != null) 'opacity': opacity,
      if (startTime != null) 'startTime': startTime,
      if (width != null) 'width': width,
    };
  }
}

/// Each job converts an input file into an output file or files. For more
/// information, see the User Guide at
/// https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
class Job {
  /// The IAM role you use for creating this job. For details about permissions,
  /// see the User Guide topic at the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/iam-role.html
  final String role;

  /// JobSettings contains all the transcode settings for a job.
  final JobSettings settings;

  /// Accelerated transcoding can significantly speed up jobs with long, visually
  /// complex content.
  final AccelerationSettings? accelerationSettings;

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
  final AccelerationStatus? accelerationStatus;

  /// An identifier for this resource that is unique within all of AWS.
  final String? arn;

  /// The tag type that AWS Billing and Cost Management will use to sort your AWS
  /// Elemental MediaConvert costs on any billing report that you set up.
  final BillingTagsSource? billingTagsSource;

  /// The time, in Unix epoch format in seconds, when the job got created.
  final DateTime? createdAt;

  /// A job's phase can be PROBING, TRANSCODING OR UPLOADING
  final JobPhase? currentPhase;

  /// Error code for the job
  final int? errorCode;

  /// Error message of Job
  final String? errorMessage;

  /// Optional list of hop destinations.
  final List<HopDestination>? hopDestinations;

  /// A portion of the job's ARN, unique within your AWS Elemental MediaConvert
  /// resources
  final String? id;

  /// An estimate of how far your job has progressed. This estimate is shown as a
  /// percentage of the total time from when your job leaves its queue to when
  /// your output files appear in your output Amazon S3 bucket. AWS Elemental
  /// MediaConvert provides jobPercentComplete in CloudWatch STATUS_UPDATE events
  /// and in the response to GetJob and ListJobs requests. The jobPercentComplete
  /// estimate is reliable for the following input containers: Quicktime,
  /// Transport Stream, MP4, and MXF. For some jobs, the service can't provide
  /// information about job progress. In those cases, jobPercentComplete returns a
  /// null value.
  final int? jobPercentComplete;

  /// The job template that the job is created from, if it is created from a job
  /// template.
  final String? jobTemplate;

  /// Provides messages from the service about jobs that you have already
  /// successfully submitted.
  final JobMessages? messages;

  /// List of output group details
  final List<OutputGroupDetail>? outputGroupDetails;

  /// Relative priority on the job.
  final int? priority;

  /// When you create a job, you can specify a queue to send it to. If you don't
  /// specify, the job will go to the default queue. For more about queues, see
  /// the User Guide topic at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  final String? queue;

  /// The job's queue hopping history.
  final List<QueueTransition>? queueTransitions;

  /// The number of times that the service automatically attempted to process your
  /// job after encountering an error.
  final int? retryCount;

  /// Enable this setting when you run a test job to estimate how many reserved
  /// transcoding slots (RTS) you need. When this is enabled, MediaConvert runs
  /// your job from an on-demand queue with similar performance to what you will
  /// see with one RTS in a reserved queue. This setting is disabled by default.
  final SimulateReservedQueue? simulateReservedQueue;

  /// A job's status can be SUBMITTED, PROGRESSING, COMPLETE, CANCELED, or ERROR.
  final JobStatus? status;

  /// Specify how often MediaConvert sends STATUS_UPDATE events to Amazon
  /// CloudWatch Events. Set the interval, in seconds, between status updates.
  /// MediaConvert sends an update at this interval from the time the service
  /// begins processing your job to the time it completes the transcode or
  /// encounters an error.
  final StatusUpdateInterval? statusUpdateInterval;

  /// Information about when jobs are submitted, started, and finished is
  /// specified in Unix epoch format in seconds.
  final Timing? timing;

  /// User-defined metadata that you want to associate with an MediaConvert job.
  /// You specify metadata in key/value pairs.
  final Map<String, String>? userMetadata;

  Job({
    required this.role,
    required this.settings,
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
  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      role: json['role'] as String,
      settings: JobSettings.fromJson(json['settings'] as Map<String, dynamic>),
      accelerationSettings: json['accelerationSettings'] != null
          ? AccelerationSettings.fromJson(
              json['accelerationSettings'] as Map<String, dynamic>)
          : null,
      accelerationStatus:
          (json['accelerationStatus'] as String?)?.toAccelerationStatus(),
      arn: json['arn'] as String?,
      billingTagsSource:
          (json['billingTagsSource'] as String?)?.toBillingTagsSource(),
      createdAt: timeStampFromJson(json['createdAt']),
      currentPhase: (json['currentPhase'] as String?)?.toJobPhase(),
      errorCode: json['errorCode'] as int?,
      errorMessage: json['errorMessage'] as String?,
      hopDestinations: (json['hopDestinations'] as List?)
          ?.whereNotNull()
          .map((e) => HopDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      jobPercentComplete: json['jobPercentComplete'] as int?,
      jobTemplate: json['jobTemplate'] as String?,
      messages: json['messages'] != null
          ? JobMessages.fromJson(json['messages'] as Map<String, dynamic>)
          : null,
      outputGroupDetails: (json['outputGroupDetails'] as List?)
          ?.whereNotNull()
          .map((e) => OutputGroupDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      priority: json['priority'] as int?,
      queue: json['queue'] as String?,
      queueTransitions: (json['queueTransitions'] as List?)
          ?.whereNotNull()
          .map((e) => QueueTransition.fromJson(e as Map<String, dynamic>))
          .toList(),
      retryCount: json['retryCount'] as int?,
      simulateReservedQueue:
          (json['simulateReservedQueue'] as String?)?.toSimulateReservedQueue(),
      status: (json['status'] as String?)?.toJobStatus(),
      statusUpdateInterval:
          (json['statusUpdateInterval'] as String?)?.toStatusUpdateInterval(),
      timing: json['timing'] != null
          ? Timing.fromJson(json['timing'] as Map<String, dynamic>)
          : null,
      userMetadata: (json['userMetadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

/// Provides messages from the service about jobs that you have already
/// successfully submitted.
class JobMessages {
  /// List of messages that are informational only and don't indicate a problem
  /// with your job.
  final List<String>? info;

  /// List of messages that warn about conditions that might cause your job not to
  /// run or to fail.
  final List<String>? warning;

  JobMessages({
    this.info,
    this.warning,
  });
  factory JobMessages.fromJson(Map<String, dynamic> json) {
    return JobMessages(
      info: (json['info'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      warning: (json['warning'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// A job's phase can be PROBING, TRANSCODING OR UPLOADING
enum JobPhase {
  probing,
  transcoding,
  uploading,
}

extension on JobPhase {
  String toValue() {
    switch (this) {
      case JobPhase.probing:
        return 'PROBING';
      case JobPhase.transcoding:
        return 'TRANSCODING';
      case JobPhase.uploading:
        return 'UPLOADING';
    }
  }
}

extension on String {
  JobPhase toJobPhase() {
    switch (this) {
      case 'PROBING':
        return JobPhase.probing;
      case 'TRANSCODING':
        return JobPhase.transcoding;
      case 'UPLOADING':
        return JobPhase.uploading;
    }
    throw Exception('$this is not known in enum JobPhase');
  }
}

/// JobSettings contains all the transcode settings for a job.
class JobSettings {
  /// When specified, this offset (in milliseconds) is added to the input Ad Avail
  /// PTS time.
  final int? adAvailOffset;

  /// Settings for ad avail blanking.  Video can be blanked or overlaid with an
  /// image, and audio muted during SCTE-35 triggered ad avails.
  final AvailBlanking? availBlanking;

  /// Settings for Event Signaling And Messaging (ESAM).
  final EsamSettings? esam;

  /// Use Inputs (inputs) to define source file used in the transcode job. There
  /// can be multiple inputs add in a job. These inputs will be concantenated
  /// together to create the output.
  final List<Input>? inputs;

  /// Overlay motion graphics on top of your video. The motion graphics that you
  /// specify here appear on all outputs in all output groups.
  final MotionImageInserter? motionImageInserter;

  /// Settings for your Nielsen configuration. If you don't do Nielsen measurement
  /// and analytics, ignore these settings. When you enable Nielsen configuration
  /// (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all
  /// outputs in the job. To enable Nielsen configuration programmatically,
  /// include an instance of nielsenConfiguration in your JSON job specification.
  /// Even if you don't include any children of nielsenConfiguration, you still
  /// enable the setting.
  final NielsenConfiguration? nielsenConfiguration;

  /// Ignore these settings unless you are using Nielsen non-linear watermarking.
  /// Specify the values that  MediaConvert uses to generate and place Nielsen
  /// watermarks in your output audio. In addition to  specifying these values,
  /// you also need to set up your cloud TIC server. These settings apply to
  /// every output in your job. The MediaConvert implementation is currently with
  /// the following Nielsen versions: Nielsen Watermark SDK Version 5.2.1 Nielsen
  /// NLM Watermark Engine Version 1.2.7 Nielsen Watermark Authenticator [SID_TIC]
  /// Version [5.0.0]
  final NielsenNonLinearWatermarkSettings? nielsenNonLinearWatermark;

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
  final List<OutputGroup>? outputGroups;

  /// Contains settings used to acquire and adjust timecode information from
  /// inputs.
  final TimecodeConfig? timecodeConfig;

  /// Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3 tags
  /// in any HLS outputs. To include timed metadata, you must enable it here,
  /// enable it in each output container, and specify tags and timecodes in ID3
  /// insertion (Id3Insertion) objects.
  final TimedMetadataInsertion? timedMetadataInsertion;

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
  factory JobSettings.fromJson(Map<String, dynamic> json) {
    return JobSettings(
      adAvailOffset: json['adAvailOffset'] as int?,
      availBlanking: json['availBlanking'] != null
          ? AvailBlanking.fromJson(
              json['availBlanking'] as Map<String, dynamic>)
          : null,
      esam: json['esam'] != null
          ? EsamSettings.fromJson(json['esam'] as Map<String, dynamic>)
          : null,
      inputs: (json['inputs'] as List?)
          ?.whereNotNull()
          .map((e) => Input.fromJson(e as Map<String, dynamic>))
          .toList(),
      motionImageInserter: json['motionImageInserter'] != null
          ? MotionImageInserter.fromJson(
              json['motionImageInserter'] as Map<String, dynamic>)
          : null,
      nielsenConfiguration: json['nielsenConfiguration'] != null
          ? NielsenConfiguration.fromJson(
              json['nielsenConfiguration'] as Map<String, dynamic>)
          : null,
      nielsenNonLinearWatermark: json['nielsenNonLinearWatermark'] != null
          ? NielsenNonLinearWatermarkSettings.fromJson(
              json['nielsenNonLinearWatermark'] as Map<String, dynamic>)
          : null,
      outputGroups: (json['outputGroups'] as List?)
          ?.whereNotNull()
          .map((e) => OutputGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      timecodeConfig: json['timecodeConfig'] != null
          ? TimecodeConfig.fromJson(
              json['timecodeConfig'] as Map<String, dynamic>)
          : null,
      timedMetadataInsertion: json['timedMetadataInsertion'] != null
          ? TimedMetadataInsertion.fromJson(
              json['timedMetadataInsertion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final adAvailOffset = this.adAvailOffset;
    final availBlanking = this.availBlanking;
    final esam = this.esam;
    final inputs = this.inputs;
    final motionImageInserter = this.motionImageInserter;
    final nielsenConfiguration = this.nielsenConfiguration;
    final nielsenNonLinearWatermark = this.nielsenNonLinearWatermark;
    final outputGroups = this.outputGroups;
    final timecodeConfig = this.timecodeConfig;
    final timedMetadataInsertion = this.timedMetadataInsertion;
    return {
      if (adAvailOffset != null) 'adAvailOffset': adAvailOffset,
      if (availBlanking != null) 'availBlanking': availBlanking,
      if (esam != null) 'esam': esam,
      if (inputs != null) 'inputs': inputs,
      if (motionImageInserter != null)
        'motionImageInserter': motionImageInserter,
      if (nielsenConfiguration != null)
        'nielsenConfiguration': nielsenConfiguration,
      if (nielsenNonLinearWatermark != null)
        'nielsenNonLinearWatermark': nielsenNonLinearWatermark,
      if (outputGroups != null) 'outputGroups': outputGroups,
      if (timecodeConfig != null) 'timecodeConfig': timecodeConfig,
      if (timedMetadataInsertion != null)
        'timedMetadataInsertion': timedMetadataInsertion,
    };
  }
}

/// A job's status can be SUBMITTED, PROGRESSING, COMPLETE, CANCELED, or ERROR.
enum JobStatus {
  submitted,
  progressing,
  complete,
  canceled,
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
  }
}

extension on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return JobStatus.submitted;
      case 'PROGRESSING':
        return JobStatus.progressing;
      case 'COMPLETE':
        return JobStatus.complete;
      case 'CANCELED':
        return JobStatus.canceled;
      case 'ERROR':
        return JobStatus.error;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// A job template is a pre-made set of encoding instructions that you can use
/// to quickly create a job.
class JobTemplate {
  /// A name you create for each job template. Each name must be unique within
  /// your account.
  final String name;

  /// JobTemplateSettings contains all the transcode settings saved in the
  /// template that will be applied to jobs created from it.
  final JobTemplateSettings settings;

  /// Accelerated transcoding can significantly speed up jobs with long, visually
  /// complex content.
  final AccelerationSettings? accelerationSettings;

  /// An identifier for this resource that is unique within all of AWS.
  final String? arn;

  /// An optional category you create to organize your job templates.
  final String? category;

  /// The timestamp in epoch seconds for Job template creation.
  final DateTime? createdAt;

  /// An optional description you create for each job template.
  final String? description;

  /// Optional list of hop destinations.
  final List<HopDestination>? hopDestinations;

  /// The timestamp in epoch seconds when the Job template was last updated.
  final DateTime? lastUpdated;

  /// Relative priority on the job.
  final int? priority;

  /// Optional. The queue that jobs created from this template are assigned to. If
  /// you don't specify this, jobs will go to the default queue.
  final String? queue;

  /// Specify how often MediaConvert sends STATUS_UPDATE events to Amazon
  /// CloudWatch Events. Set the interval, in seconds, between status updates.
  /// MediaConvert sends an update at this interval from the time the service
  /// begins processing your job to the time it completes the transcode or
  /// encounters an error.
  final StatusUpdateInterval? statusUpdateInterval;

  /// A job template can be of two types: system or custom. System or built-in job
  /// templates can't be modified or deleted by the user.
  final Type? type;

  JobTemplate({
    required this.name,
    required this.settings,
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
  factory JobTemplate.fromJson(Map<String, dynamic> json) {
    return JobTemplate(
      name: json['name'] as String,
      settings: JobTemplateSettings.fromJson(
          json['settings'] as Map<String, dynamic>),
      accelerationSettings: json['accelerationSettings'] != null
          ? AccelerationSettings.fromJson(
              json['accelerationSettings'] as Map<String, dynamic>)
          : null,
      arn: json['arn'] as String?,
      category: json['category'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      hopDestinations: (json['hopDestinations'] as List?)
          ?.whereNotNull()
          .map((e) => HopDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      priority: json['priority'] as int?,
      queue: json['queue'] as String?,
      statusUpdateInterval:
          (json['statusUpdateInterval'] as String?)?.toStatusUpdateInterval(),
      type: (json['type'] as String?)?.toType(),
    );
  }
}

/// Optional. When you request a list of job templates, you can choose to list
/// them alphabetically by NAME or chronologically by CREATION_DATE. If you
/// don't specify, the service will list them by name.
enum JobTemplateListBy {
  name,
  creationDate,
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
  }
}

extension on String {
  JobTemplateListBy toJobTemplateListBy() {
    switch (this) {
      case 'NAME':
        return JobTemplateListBy.name;
      case 'CREATION_DATE':
        return JobTemplateListBy.creationDate;
      case 'SYSTEM':
        return JobTemplateListBy.system;
    }
    throw Exception('$this is not known in enum JobTemplateListBy');
  }
}

/// JobTemplateSettings contains all the transcode settings saved in the
/// template that will be applied to jobs created from it.
class JobTemplateSettings {
  /// When specified, this offset (in milliseconds) is added to the input Ad Avail
  /// PTS time.
  final int? adAvailOffset;

  /// Settings for ad avail blanking.  Video can be blanked or overlaid with an
  /// image, and audio muted during SCTE-35 triggered ad avails.
  final AvailBlanking? availBlanking;

  /// Settings for Event Signaling And Messaging (ESAM).
  final EsamSettings? esam;

  /// Use Inputs (inputs) to define the source file used in the transcode job.
  /// There can only be one input in a job template.  Using the API, you can
  /// include multiple inputs when referencing a job template.
  final List<InputTemplate>? inputs;

  /// Overlay motion graphics on top of your video. The motion graphics that you
  /// specify here appear on all outputs in all output groups.
  final MotionImageInserter? motionImageInserter;

  /// Settings for your Nielsen configuration. If you don't do Nielsen measurement
  /// and analytics, ignore these settings. When you enable Nielsen configuration
  /// (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all
  /// outputs in the job. To enable Nielsen configuration programmatically,
  /// include an instance of nielsenConfiguration in your JSON job specification.
  /// Even if you don't include any children of nielsenConfiguration, you still
  /// enable the setting.
  final NielsenConfiguration? nielsenConfiguration;

  /// Ignore these settings unless you are using Nielsen non-linear watermarking.
  /// Specify the values that  MediaConvert uses to generate and place Nielsen
  /// watermarks in your output audio. In addition to  specifying these values,
  /// you also need to set up your cloud TIC server. These settings apply to
  /// every output in your job. The MediaConvert implementation is currently with
  /// the following Nielsen versions: Nielsen Watermark SDK Version 5.2.1 Nielsen
  /// NLM Watermark Engine Version 1.2.7 Nielsen Watermark Authenticator [SID_TIC]
  /// Version [5.0.0]
  final NielsenNonLinearWatermarkSettings? nielsenNonLinearWatermark;

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
  final List<OutputGroup>? outputGroups;

  /// Contains settings used to acquire and adjust timecode information from
  /// inputs.
  final TimecodeConfig? timecodeConfig;

  /// Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3 tags
  /// in any HLS outputs. To include timed metadata, you must enable it here,
  /// enable it in each output container, and specify tags and timecodes in ID3
  /// insertion (Id3Insertion) objects.
  final TimedMetadataInsertion? timedMetadataInsertion;

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
  factory JobTemplateSettings.fromJson(Map<String, dynamic> json) {
    return JobTemplateSettings(
      adAvailOffset: json['adAvailOffset'] as int?,
      availBlanking: json['availBlanking'] != null
          ? AvailBlanking.fromJson(
              json['availBlanking'] as Map<String, dynamic>)
          : null,
      esam: json['esam'] != null
          ? EsamSettings.fromJson(json['esam'] as Map<String, dynamic>)
          : null,
      inputs: (json['inputs'] as List?)
          ?.whereNotNull()
          .map((e) => InputTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
      motionImageInserter: json['motionImageInserter'] != null
          ? MotionImageInserter.fromJson(
              json['motionImageInserter'] as Map<String, dynamic>)
          : null,
      nielsenConfiguration: json['nielsenConfiguration'] != null
          ? NielsenConfiguration.fromJson(
              json['nielsenConfiguration'] as Map<String, dynamic>)
          : null,
      nielsenNonLinearWatermark: json['nielsenNonLinearWatermark'] != null
          ? NielsenNonLinearWatermarkSettings.fromJson(
              json['nielsenNonLinearWatermark'] as Map<String, dynamic>)
          : null,
      outputGroups: (json['outputGroups'] as List?)
          ?.whereNotNull()
          .map((e) => OutputGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      timecodeConfig: json['timecodeConfig'] != null
          ? TimecodeConfig.fromJson(
              json['timecodeConfig'] as Map<String, dynamic>)
          : null,
      timedMetadataInsertion: json['timedMetadataInsertion'] != null
          ? TimedMetadataInsertion.fromJson(
              json['timedMetadataInsertion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final adAvailOffset = this.adAvailOffset;
    final availBlanking = this.availBlanking;
    final esam = this.esam;
    final inputs = this.inputs;
    final motionImageInserter = this.motionImageInserter;
    final nielsenConfiguration = this.nielsenConfiguration;
    final nielsenNonLinearWatermark = this.nielsenNonLinearWatermark;
    final outputGroups = this.outputGroups;
    final timecodeConfig = this.timecodeConfig;
    final timedMetadataInsertion = this.timedMetadataInsertion;
    return {
      if (adAvailOffset != null) 'adAvailOffset': adAvailOffset,
      if (availBlanking != null) 'availBlanking': availBlanking,
      if (esam != null) 'esam': esam,
      if (inputs != null) 'inputs': inputs,
      if (motionImageInserter != null)
        'motionImageInserter': motionImageInserter,
      if (nielsenConfiguration != null)
        'nielsenConfiguration': nielsenConfiguration,
      if (nielsenNonLinearWatermark != null)
        'nielsenNonLinearWatermark': nielsenNonLinearWatermark,
      if (outputGroups != null) 'outputGroups': outputGroups,
      if (timecodeConfig != null) 'timecodeConfig': timecodeConfig,
      if (timedMetadataInsertion != null)
        'timedMetadataInsertion': timedMetadataInsertion,
    };
  }
}

/// Specify the language, using the ISO 639-2 three-letter code listed at
/// https://www.loc.gov/standards/iso639-2/php/code_list.php.
enum LanguageCode {
  eng,
  spa,
  fra,
  deu,
  ger,
  zho,
  ara,
  hin,
  jpn,
  rus,
  por,
  ita,
  urd,
  vie,
  kor,
  pan,
  abk,
  aar,
  afr,
  aka,
  sqi,
  amh,
  arg,
  hye,
  asm,
  ava,
  ave,
  aym,
  aze,
  bam,
  bak,
  eus,
  bel,
  ben,
  bih,
  bis,
  bos,
  bre,
  bul,
  mya,
  cat,
  khm,
  cha,
  che,
  nya,
  chu,
  chv,
  cor,
  cos,
  cre,
  hrv,
  ces,
  dan,
  div,
  nld,
  dzo,
  enm,
  epo,
  est,
  ewe,
  fao,
  fij,
  fin,
  frm,
  ful,
  gla,
  glg,
  lug,
  kat,
  ell,
  grn,
  guj,
  hat,
  hau,
  heb,
  her,
  hmo,
  hun,
  isl,
  ido,
  ibo,
  ind,
  ina,
  ile,
  iku,
  ipk,
  gle,
  jav,
  kal,
  kan,
  kau,
  kas,
  kaz,
  kik,
  kin,
  kir,
  kom,
  kon,
  kua,
  kur,
  lao,
  lat,
  lav,
  lim,
  lin,
  lit,
  lub,
  ltz,
  mkd,
  mlg,
  msa,
  mal,
  mlt,
  glv,
  mri,
  mar,
  mah,
  mon,
  nau,
  nav,
  nde,
  nbl,
  ndo,
  nep,
  sme,
  nor,
  nob,
  nno,
  oci,
  oji,
  ori,
  orm,
  oss,
  pli,
  fas,
  pol,
  pus,
  que,
  qaa,
  ron,
  roh,
  run,
  smo,
  sag,
  san,
  srd,
  srb,
  sna,
  iii,
  snd,
  sin,
  slk,
  slv,
  som,
  sot,
  sun,
  swa,
  ssw,
  swe,
  tgl,
  tah,
  tgk,
  tam,
  tat,
  tel,
  tha,
  bod,
  tir,
  ton,
  tso,
  tsn,
  tur,
  tuk,
  twi,
  uig,
  ukr,
  uzb,
  ven,
  vol,
  wln,
  cym,
  fry,
  wol,
  xho,
  yid,
  yor,
  zha,
  zul,
  orj,
  qpc,
  tng,
}

extension on LanguageCode {
  String toValue() {
    switch (this) {
      case LanguageCode.eng:
        return 'ENG';
      case LanguageCode.spa:
        return 'SPA';
      case LanguageCode.fra:
        return 'FRA';
      case LanguageCode.deu:
        return 'DEU';
      case LanguageCode.ger:
        return 'GER';
      case LanguageCode.zho:
        return 'ZHO';
      case LanguageCode.ara:
        return 'ARA';
      case LanguageCode.hin:
        return 'HIN';
      case LanguageCode.jpn:
        return 'JPN';
      case LanguageCode.rus:
        return 'RUS';
      case LanguageCode.por:
        return 'POR';
      case LanguageCode.ita:
        return 'ITA';
      case LanguageCode.urd:
        return 'URD';
      case LanguageCode.vie:
        return 'VIE';
      case LanguageCode.kor:
        return 'KOR';
      case LanguageCode.pan:
        return 'PAN';
      case LanguageCode.abk:
        return 'ABK';
      case LanguageCode.aar:
        return 'AAR';
      case LanguageCode.afr:
        return 'AFR';
      case LanguageCode.aka:
        return 'AKA';
      case LanguageCode.sqi:
        return 'SQI';
      case LanguageCode.amh:
        return 'AMH';
      case LanguageCode.arg:
        return 'ARG';
      case LanguageCode.hye:
        return 'HYE';
      case LanguageCode.asm:
        return 'ASM';
      case LanguageCode.ava:
        return 'AVA';
      case LanguageCode.ave:
        return 'AVE';
      case LanguageCode.aym:
        return 'AYM';
      case LanguageCode.aze:
        return 'AZE';
      case LanguageCode.bam:
        return 'BAM';
      case LanguageCode.bak:
        return 'BAK';
      case LanguageCode.eus:
        return 'EUS';
      case LanguageCode.bel:
        return 'BEL';
      case LanguageCode.ben:
        return 'BEN';
      case LanguageCode.bih:
        return 'BIH';
      case LanguageCode.bis:
        return 'BIS';
      case LanguageCode.bos:
        return 'BOS';
      case LanguageCode.bre:
        return 'BRE';
      case LanguageCode.bul:
        return 'BUL';
      case LanguageCode.mya:
        return 'MYA';
      case LanguageCode.cat:
        return 'CAT';
      case LanguageCode.khm:
        return 'KHM';
      case LanguageCode.cha:
        return 'CHA';
      case LanguageCode.che:
        return 'CHE';
      case LanguageCode.nya:
        return 'NYA';
      case LanguageCode.chu:
        return 'CHU';
      case LanguageCode.chv:
        return 'CHV';
      case LanguageCode.cor:
        return 'COR';
      case LanguageCode.cos:
        return 'COS';
      case LanguageCode.cre:
        return 'CRE';
      case LanguageCode.hrv:
        return 'HRV';
      case LanguageCode.ces:
        return 'CES';
      case LanguageCode.dan:
        return 'DAN';
      case LanguageCode.div:
        return 'DIV';
      case LanguageCode.nld:
        return 'NLD';
      case LanguageCode.dzo:
        return 'DZO';
      case LanguageCode.enm:
        return 'ENM';
      case LanguageCode.epo:
        return 'EPO';
      case LanguageCode.est:
        return 'EST';
      case LanguageCode.ewe:
        return 'EWE';
      case LanguageCode.fao:
        return 'FAO';
      case LanguageCode.fij:
        return 'FIJ';
      case LanguageCode.fin:
        return 'FIN';
      case LanguageCode.frm:
        return 'FRM';
      case LanguageCode.ful:
        return 'FUL';
      case LanguageCode.gla:
        return 'GLA';
      case LanguageCode.glg:
        return 'GLG';
      case LanguageCode.lug:
        return 'LUG';
      case LanguageCode.kat:
        return 'KAT';
      case LanguageCode.ell:
        return 'ELL';
      case LanguageCode.grn:
        return 'GRN';
      case LanguageCode.guj:
        return 'GUJ';
      case LanguageCode.hat:
        return 'HAT';
      case LanguageCode.hau:
        return 'HAU';
      case LanguageCode.heb:
        return 'HEB';
      case LanguageCode.her:
        return 'HER';
      case LanguageCode.hmo:
        return 'HMO';
      case LanguageCode.hun:
        return 'HUN';
      case LanguageCode.isl:
        return 'ISL';
      case LanguageCode.ido:
        return 'IDO';
      case LanguageCode.ibo:
        return 'IBO';
      case LanguageCode.ind:
        return 'IND';
      case LanguageCode.ina:
        return 'INA';
      case LanguageCode.ile:
        return 'ILE';
      case LanguageCode.iku:
        return 'IKU';
      case LanguageCode.ipk:
        return 'IPK';
      case LanguageCode.gle:
        return 'GLE';
      case LanguageCode.jav:
        return 'JAV';
      case LanguageCode.kal:
        return 'KAL';
      case LanguageCode.kan:
        return 'KAN';
      case LanguageCode.kau:
        return 'KAU';
      case LanguageCode.kas:
        return 'KAS';
      case LanguageCode.kaz:
        return 'KAZ';
      case LanguageCode.kik:
        return 'KIK';
      case LanguageCode.kin:
        return 'KIN';
      case LanguageCode.kir:
        return 'KIR';
      case LanguageCode.kom:
        return 'KOM';
      case LanguageCode.kon:
        return 'KON';
      case LanguageCode.kua:
        return 'KUA';
      case LanguageCode.kur:
        return 'KUR';
      case LanguageCode.lao:
        return 'LAO';
      case LanguageCode.lat:
        return 'LAT';
      case LanguageCode.lav:
        return 'LAV';
      case LanguageCode.lim:
        return 'LIM';
      case LanguageCode.lin:
        return 'LIN';
      case LanguageCode.lit:
        return 'LIT';
      case LanguageCode.lub:
        return 'LUB';
      case LanguageCode.ltz:
        return 'LTZ';
      case LanguageCode.mkd:
        return 'MKD';
      case LanguageCode.mlg:
        return 'MLG';
      case LanguageCode.msa:
        return 'MSA';
      case LanguageCode.mal:
        return 'MAL';
      case LanguageCode.mlt:
        return 'MLT';
      case LanguageCode.glv:
        return 'GLV';
      case LanguageCode.mri:
        return 'MRI';
      case LanguageCode.mar:
        return 'MAR';
      case LanguageCode.mah:
        return 'MAH';
      case LanguageCode.mon:
        return 'MON';
      case LanguageCode.nau:
        return 'NAU';
      case LanguageCode.nav:
        return 'NAV';
      case LanguageCode.nde:
        return 'NDE';
      case LanguageCode.nbl:
        return 'NBL';
      case LanguageCode.ndo:
        return 'NDO';
      case LanguageCode.nep:
        return 'NEP';
      case LanguageCode.sme:
        return 'SME';
      case LanguageCode.nor:
        return 'NOR';
      case LanguageCode.nob:
        return 'NOB';
      case LanguageCode.nno:
        return 'NNO';
      case LanguageCode.oci:
        return 'OCI';
      case LanguageCode.oji:
        return 'OJI';
      case LanguageCode.ori:
        return 'ORI';
      case LanguageCode.orm:
        return 'ORM';
      case LanguageCode.oss:
        return 'OSS';
      case LanguageCode.pli:
        return 'PLI';
      case LanguageCode.fas:
        return 'FAS';
      case LanguageCode.pol:
        return 'POL';
      case LanguageCode.pus:
        return 'PUS';
      case LanguageCode.que:
        return 'QUE';
      case LanguageCode.qaa:
        return 'QAA';
      case LanguageCode.ron:
        return 'RON';
      case LanguageCode.roh:
        return 'ROH';
      case LanguageCode.run:
        return 'RUN';
      case LanguageCode.smo:
        return 'SMO';
      case LanguageCode.sag:
        return 'SAG';
      case LanguageCode.san:
        return 'SAN';
      case LanguageCode.srd:
        return 'SRD';
      case LanguageCode.srb:
        return 'SRB';
      case LanguageCode.sna:
        return 'SNA';
      case LanguageCode.iii:
        return 'III';
      case LanguageCode.snd:
        return 'SND';
      case LanguageCode.sin:
        return 'SIN';
      case LanguageCode.slk:
        return 'SLK';
      case LanguageCode.slv:
        return 'SLV';
      case LanguageCode.som:
        return 'SOM';
      case LanguageCode.sot:
        return 'SOT';
      case LanguageCode.sun:
        return 'SUN';
      case LanguageCode.swa:
        return 'SWA';
      case LanguageCode.ssw:
        return 'SSW';
      case LanguageCode.swe:
        return 'SWE';
      case LanguageCode.tgl:
        return 'TGL';
      case LanguageCode.tah:
        return 'TAH';
      case LanguageCode.tgk:
        return 'TGK';
      case LanguageCode.tam:
        return 'TAM';
      case LanguageCode.tat:
        return 'TAT';
      case LanguageCode.tel:
        return 'TEL';
      case LanguageCode.tha:
        return 'THA';
      case LanguageCode.bod:
        return 'BOD';
      case LanguageCode.tir:
        return 'TIR';
      case LanguageCode.ton:
        return 'TON';
      case LanguageCode.tso:
        return 'TSO';
      case LanguageCode.tsn:
        return 'TSN';
      case LanguageCode.tur:
        return 'TUR';
      case LanguageCode.tuk:
        return 'TUK';
      case LanguageCode.twi:
        return 'TWI';
      case LanguageCode.uig:
        return 'UIG';
      case LanguageCode.ukr:
        return 'UKR';
      case LanguageCode.uzb:
        return 'UZB';
      case LanguageCode.ven:
        return 'VEN';
      case LanguageCode.vol:
        return 'VOL';
      case LanguageCode.wln:
        return 'WLN';
      case LanguageCode.cym:
        return 'CYM';
      case LanguageCode.fry:
        return 'FRY';
      case LanguageCode.wol:
        return 'WOL';
      case LanguageCode.xho:
        return 'XHO';
      case LanguageCode.yid:
        return 'YID';
      case LanguageCode.yor:
        return 'YOR';
      case LanguageCode.zha:
        return 'ZHA';
      case LanguageCode.zul:
        return 'ZUL';
      case LanguageCode.orj:
        return 'ORJ';
      case LanguageCode.qpc:
        return 'QPC';
      case LanguageCode.tng:
        return 'TNG';
    }
  }
}

extension on String {
  LanguageCode toLanguageCode() {
    switch (this) {
      case 'ENG':
        return LanguageCode.eng;
      case 'SPA':
        return LanguageCode.spa;
      case 'FRA':
        return LanguageCode.fra;
      case 'DEU':
        return LanguageCode.deu;
      case 'GER':
        return LanguageCode.ger;
      case 'ZHO':
        return LanguageCode.zho;
      case 'ARA':
        return LanguageCode.ara;
      case 'HIN':
        return LanguageCode.hin;
      case 'JPN':
        return LanguageCode.jpn;
      case 'RUS':
        return LanguageCode.rus;
      case 'POR':
        return LanguageCode.por;
      case 'ITA':
        return LanguageCode.ita;
      case 'URD':
        return LanguageCode.urd;
      case 'VIE':
        return LanguageCode.vie;
      case 'KOR':
        return LanguageCode.kor;
      case 'PAN':
        return LanguageCode.pan;
      case 'ABK':
        return LanguageCode.abk;
      case 'AAR':
        return LanguageCode.aar;
      case 'AFR':
        return LanguageCode.afr;
      case 'AKA':
        return LanguageCode.aka;
      case 'SQI':
        return LanguageCode.sqi;
      case 'AMH':
        return LanguageCode.amh;
      case 'ARG':
        return LanguageCode.arg;
      case 'HYE':
        return LanguageCode.hye;
      case 'ASM':
        return LanguageCode.asm;
      case 'AVA':
        return LanguageCode.ava;
      case 'AVE':
        return LanguageCode.ave;
      case 'AYM':
        return LanguageCode.aym;
      case 'AZE':
        return LanguageCode.aze;
      case 'BAM':
        return LanguageCode.bam;
      case 'BAK':
        return LanguageCode.bak;
      case 'EUS':
        return LanguageCode.eus;
      case 'BEL':
        return LanguageCode.bel;
      case 'BEN':
        return LanguageCode.ben;
      case 'BIH':
        return LanguageCode.bih;
      case 'BIS':
        return LanguageCode.bis;
      case 'BOS':
        return LanguageCode.bos;
      case 'BRE':
        return LanguageCode.bre;
      case 'BUL':
        return LanguageCode.bul;
      case 'MYA':
        return LanguageCode.mya;
      case 'CAT':
        return LanguageCode.cat;
      case 'KHM':
        return LanguageCode.khm;
      case 'CHA':
        return LanguageCode.cha;
      case 'CHE':
        return LanguageCode.che;
      case 'NYA':
        return LanguageCode.nya;
      case 'CHU':
        return LanguageCode.chu;
      case 'CHV':
        return LanguageCode.chv;
      case 'COR':
        return LanguageCode.cor;
      case 'COS':
        return LanguageCode.cos;
      case 'CRE':
        return LanguageCode.cre;
      case 'HRV':
        return LanguageCode.hrv;
      case 'CES':
        return LanguageCode.ces;
      case 'DAN':
        return LanguageCode.dan;
      case 'DIV':
        return LanguageCode.div;
      case 'NLD':
        return LanguageCode.nld;
      case 'DZO':
        return LanguageCode.dzo;
      case 'ENM':
        return LanguageCode.enm;
      case 'EPO':
        return LanguageCode.epo;
      case 'EST':
        return LanguageCode.est;
      case 'EWE':
        return LanguageCode.ewe;
      case 'FAO':
        return LanguageCode.fao;
      case 'FIJ':
        return LanguageCode.fij;
      case 'FIN':
        return LanguageCode.fin;
      case 'FRM':
        return LanguageCode.frm;
      case 'FUL':
        return LanguageCode.ful;
      case 'GLA':
        return LanguageCode.gla;
      case 'GLG':
        return LanguageCode.glg;
      case 'LUG':
        return LanguageCode.lug;
      case 'KAT':
        return LanguageCode.kat;
      case 'ELL':
        return LanguageCode.ell;
      case 'GRN':
        return LanguageCode.grn;
      case 'GUJ':
        return LanguageCode.guj;
      case 'HAT':
        return LanguageCode.hat;
      case 'HAU':
        return LanguageCode.hau;
      case 'HEB':
        return LanguageCode.heb;
      case 'HER':
        return LanguageCode.her;
      case 'HMO':
        return LanguageCode.hmo;
      case 'HUN':
        return LanguageCode.hun;
      case 'ISL':
        return LanguageCode.isl;
      case 'IDO':
        return LanguageCode.ido;
      case 'IBO':
        return LanguageCode.ibo;
      case 'IND':
        return LanguageCode.ind;
      case 'INA':
        return LanguageCode.ina;
      case 'ILE':
        return LanguageCode.ile;
      case 'IKU':
        return LanguageCode.iku;
      case 'IPK':
        return LanguageCode.ipk;
      case 'GLE':
        return LanguageCode.gle;
      case 'JAV':
        return LanguageCode.jav;
      case 'KAL':
        return LanguageCode.kal;
      case 'KAN':
        return LanguageCode.kan;
      case 'KAU':
        return LanguageCode.kau;
      case 'KAS':
        return LanguageCode.kas;
      case 'KAZ':
        return LanguageCode.kaz;
      case 'KIK':
        return LanguageCode.kik;
      case 'KIN':
        return LanguageCode.kin;
      case 'KIR':
        return LanguageCode.kir;
      case 'KOM':
        return LanguageCode.kom;
      case 'KON':
        return LanguageCode.kon;
      case 'KUA':
        return LanguageCode.kua;
      case 'KUR':
        return LanguageCode.kur;
      case 'LAO':
        return LanguageCode.lao;
      case 'LAT':
        return LanguageCode.lat;
      case 'LAV':
        return LanguageCode.lav;
      case 'LIM':
        return LanguageCode.lim;
      case 'LIN':
        return LanguageCode.lin;
      case 'LIT':
        return LanguageCode.lit;
      case 'LUB':
        return LanguageCode.lub;
      case 'LTZ':
        return LanguageCode.ltz;
      case 'MKD':
        return LanguageCode.mkd;
      case 'MLG':
        return LanguageCode.mlg;
      case 'MSA':
        return LanguageCode.msa;
      case 'MAL':
        return LanguageCode.mal;
      case 'MLT':
        return LanguageCode.mlt;
      case 'GLV':
        return LanguageCode.glv;
      case 'MRI':
        return LanguageCode.mri;
      case 'MAR':
        return LanguageCode.mar;
      case 'MAH':
        return LanguageCode.mah;
      case 'MON':
        return LanguageCode.mon;
      case 'NAU':
        return LanguageCode.nau;
      case 'NAV':
        return LanguageCode.nav;
      case 'NDE':
        return LanguageCode.nde;
      case 'NBL':
        return LanguageCode.nbl;
      case 'NDO':
        return LanguageCode.ndo;
      case 'NEP':
        return LanguageCode.nep;
      case 'SME':
        return LanguageCode.sme;
      case 'NOR':
        return LanguageCode.nor;
      case 'NOB':
        return LanguageCode.nob;
      case 'NNO':
        return LanguageCode.nno;
      case 'OCI':
        return LanguageCode.oci;
      case 'OJI':
        return LanguageCode.oji;
      case 'ORI':
        return LanguageCode.ori;
      case 'ORM':
        return LanguageCode.orm;
      case 'OSS':
        return LanguageCode.oss;
      case 'PLI':
        return LanguageCode.pli;
      case 'FAS':
        return LanguageCode.fas;
      case 'POL':
        return LanguageCode.pol;
      case 'PUS':
        return LanguageCode.pus;
      case 'QUE':
        return LanguageCode.que;
      case 'QAA':
        return LanguageCode.qaa;
      case 'RON':
        return LanguageCode.ron;
      case 'ROH':
        return LanguageCode.roh;
      case 'RUN':
        return LanguageCode.run;
      case 'SMO':
        return LanguageCode.smo;
      case 'SAG':
        return LanguageCode.sag;
      case 'SAN':
        return LanguageCode.san;
      case 'SRD':
        return LanguageCode.srd;
      case 'SRB':
        return LanguageCode.srb;
      case 'SNA':
        return LanguageCode.sna;
      case 'III':
        return LanguageCode.iii;
      case 'SND':
        return LanguageCode.snd;
      case 'SIN':
        return LanguageCode.sin;
      case 'SLK':
        return LanguageCode.slk;
      case 'SLV':
        return LanguageCode.slv;
      case 'SOM':
        return LanguageCode.som;
      case 'SOT':
        return LanguageCode.sot;
      case 'SUN':
        return LanguageCode.sun;
      case 'SWA':
        return LanguageCode.swa;
      case 'SSW':
        return LanguageCode.ssw;
      case 'SWE':
        return LanguageCode.swe;
      case 'TGL':
        return LanguageCode.tgl;
      case 'TAH':
        return LanguageCode.tah;
      case 'TGK':
        return LanguageCode.tgk;
      case 'TAM':
        return LanguageCode.tam;
      case 'TAT':
        return LanguageCode.tat;
      case 'TEL':
        return LanguageCode.tel;
      case 'THA':
        return LanguageCode.tha;
      case 'BOD':
        return LanguageCode.bod;
      case 'TIR':
        return LanguageCode.tir;
      case 'TON':
        return LanguageCode.ton;
      case 'TSO':
        return LanguageCode.tso;
      case 'TSN':
        return LanguageCode.tsn;
      case 'TUR':
        return LanguageCode.tur;
      case 'TUK':
        return LanguageCode.tuk;
      case 'TWI':
        return LanguageCode.twi;
      case 'UIG':
        return LanguageCode.uig;
      case 'UKR':
        return LanguageCode.ukr;
      case 'UZB':
        return LanguageCode.uzb;
      case 'VEN':
        return LanguageCode.ven;
      case 'VOL':
        return LanguageCode.vol;
      case 'WLN':
        return LanguageCode.wln;
      case 'CYM':
        return LanguageCode.cym;
      case 'FRY':
        return LanguageCode.fry;
      case 'WOL':
        return LanguageCode.wol;
      case 'XHO':
        return LanguageCode.xho;
      case 'YID':
        return LanguageCode.yid;
      case 'YOR':
        return LanguageCode.yor;
      case 'ZHA':
        return LanguageCode.zha;
      case 'ZUL':
        return LanguageCode.zul;
      case 'ORJ':
        return LanguageCode.orj;
      case 'QPC':
        return LanguageCode.qpc;
      case 'TNG':
        return LanguageCode.tng;
    }
    throw Exception('$this is not known in enum LanguageCode');
  }
}

class ListJobTemplatesResponse {
  /// List of Job templates.
  final List<JobTemplate>? jobTemplates;

  /// Use this string to request the next batch of job templates.
  final String? nextToken;

  ListJobTemplatesResponse({
    this.jobTemplates,
    this.nextToken,
  });
  factory ListJobTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return ListJobTemplatesResponse(
      jobTemplates: (json['jobTemplates'] as List?)
          ?.whereNotNull()
          .map((e) => JobTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListJobsResponse {
  /// List of jobs
  final List<Job>? jobs;

  /// Use this string to request the next batch of jobs.
  final String? nextToken;

  ListJobsResponse({
    this.jobs,
    this.nextToken,
  });
  factory ListJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobsResponse(
      jobs: (json['jobs'] as List?)
          ?.whereNotNull()
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListPresetsResponse {
  /// Use this string to request the next batch of presets.
  final String? nextToken;

  /// List of presets
  final List<Preset>? presets;

  ListPresetsResponse({
    this.nextToken,
    this.presets,
  });
  factory ListPresetsResponse.fromJson(Map<String, dynamic> json) {
    return ListPresetsResponse(
      nextToken: json['nextToken'] as String?,
      presets: (json['presets'] as List?)
          ?.whereNotNull()
          .map((e) => Preset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListQueuesResponse {
  /// Use this string to request the next batch of queues.
  final String? nextToken;

  /// List of queues.
  final List<Queue>? queues;

  ListQueuesResponse({
    this.nextToken,
    this.queues,
  });
  factory ListQueuesResponse.fromJson(Map<String, dynamic> json) {
    return ListQueuesResponse(
      nextToken: json['nextToken'] as String?,
      queues: (json['queues'] as List?)
          ?.whereNotNull()
          .map((e) => Queue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListTagsForResourceResponse {
  /// The Amazon Resource Name (ARN) and tags for an AWS Elemental MediaConvert
  /// resource.
  final ResourceTags? resourceTags;

  ListTagsForResourceResponse({
    this.resourceTags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceTags: json['resourceTags'] != null
          ? ResourceTags.fromJson(json['resourceTags'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Selects between the DVB and ATSC buffer models for Dolby Digital audio.
enum M2tsAudioBufferModel {
  dvb,
  atsc,
}

extension on M2tsAudioBufferModel {
  String toValue() {
    switch (this) {
      case M2tsAudioBufferModel.dvb:
        return 'DVB';
      case M2tsAudioBufferModel.atsc:
        return 'ATSC';
    }
  }
}

extension on String {
  M2tsAudioBufferModel toM2tsAudioBufferModel() {
    switch (this) {
      case 'DVB':
        return M2tsAudioBufferModel.dvb;
      case 'ATSC':
        return M2tsAudioBufferModel.atsc;
    }
    throw Exception('$this is not known in enum M2tsAudioBufferModel');
  }
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
  defaultCodecDuration,
  matchVideoDuration,
}

extension on M2tsAudioDuration {
  String toValue() {
    switch (this) {
      case M2tsAudioDuration.defaultCodecDuration:
        return 'DEFAULT_CODEC_DURATION';
      case M2tsAudioDuration.matchVideoDuration:
        return 'MATCH_VIDEO_DURATION';
    }
  }
}

extension on String {
  M2tsAudioDuration toM2tsAudioDuration() {
    switch (this) {
      case 'DEFAULT_CODEC_DURATION':
        return M2tsAudioDuration.defaultCodecDuration;
      case 'MATCH_VIDEO_DURATION':
        return M2tsAudioDuration.matchVideoDuration;
    }
    throw Exception('$this is not known in enum M2tsAudioDuration');
  }
}

/// Controls what buffer model to use for accurate interleaving. If set to
/// MULTIPLEX, use multiplex  buffer model. If set to NONE, this can lead to
/// lower latency, but low-memory devices may not be able to play back the
/// stream without interruptions.
enum M2tsBufferModel {
  multiplex,
  none,
}

extension on M2tsBufferModel {
  String toValue() {
    switch (this) {
      case M2tsBufferModel.multiplex:
        return 'MULTIPLEX';
      case M2tsBufferModel.none:
        return 'NONE';
    }
  }
}

extension on String {
  M2tsBufferModel toM2tsBufferModel() {
    switch (this) {
      case 'MULTIPLEX':
        return M2tsBufferModel.multiplex;
      case 'NONE':
        return M2tsBufferModel.none;
    }
    throw Exception('$this is not known in enum M2tsBufferModel');
  }
}

/// When set to VIDEO_AND_FIXED_INTERVALS, audio EBP markers will be added to
/// partitions 3 and 4. The interval between these additional markers will be
/// fixed, and will be slightly shorter than the video EBP marker interval. When
/// set to VIDEO_INTERVAL, these additional markers will not be inserted. Only
/// applicable when EBP segmentation markers are is selected
/// (segmentationMarkers is EBP or EBP_LEGACY).
enum M2tsEbpAudioInterval {
  videoAndFixedIntervals,
  videoInterval,
}

extension on M2tsEbpAudioInterval {
  String toValue() {
    switch (this) {
      case M2tsEbpAudioInterval.videoAndFixedIntervals:
        return 'VIDEO_AND_FIXED_INTERVALS';
      case M2tsEbpAudioInterval.videoInterval:
        return 'VIDEO_INTERVAL';
    }
  }
}

extension on String {
  M2tsEbpAudioInterval toM2tsEbpAudioInterval() {
    switch (this) {
      case 'VIDEO_AND_FIXED_INTERVALS':
        return M2tsEbpAudioInterval.videoAndFixedIntervals;
      case 'VIDEO_INTERVAL':
        return M2tsEbpAudioInterval.videoInterval;
    }
    throw Exception('$this is not known in enum M2tsEbpAudioInterval');
  }
}

/// Selects which PIDs to place EBP markers on. They can either be placed only
/// on the video PID, or on both the video PID and all audio PIDs. Only
/// applicable when EBP segmentation markers are is selected
/// (segmentationMarkers is EBP or EBP_LEGACY).
enum M2tsEbpPlacement {
  videoAndAudioPids,
  videoPid,
}

extension on M2tsEbpPlacement {
  String toValue() {
    switch (this) {
      case M2tsEbpPlacement.videoAndAudioPids:
        return 'VIDEO_AND_AUDIO_PIDS';
      case M2tsEbpPlacement.videoPid:
        return 'VIDEO_PID';
    }
  }
}

extension on String {
  M2tsEbpPlacement toM2tsEbpPlacement() {
    switch (this) {
      case 'VIDEO_AND_AUDIO_PIDS':
        return M2tsEbpPlacement.videoAndAudioPids;
      case 'VIDEO_PID':
        return M2tsEbpPlacement.videoPid;
    }
    throw Exception('$this is not known in enum M2tsEbpPlacement');
  }
}

/// Controls whether to include the ES Rate field in the PES header.
enum M2tsEsRateInPes {
  include,
  exclude,
}

extension on M2tsEsRateInPes {
  String toValue() {
    switch (this) {
      case M2tsEsRateInPes.include:
        return 'INCLUDE';
      case M2tsEsRateInPes.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  M2tsEsRateInPes toM2tsEsRateInPes() {
    switch (this) {
      case 'INCLUDE':
        return M2tsEsRateInPes.include;
      case 'EXCLUDE':
        return M2tsEsRateInPes.exclude;
    }
    throw Exception('$this is not known in enum M2tsEsRateInPes');
  }
}

/// Keep the default value (DEFAULT) unless you know that your audio EBP markers
/// are incorrectly appearing before your video EBP markers. To correct this
/// problem, set this value to Force (FORCE).
enum M2tsForceTsVideoEbpOrder {
  force,
  $default,
}

extension on M2tsForceTsVideoEbpOrder {
  String toValue() {
    switch (this) {
      case M2tsForceTsVideoEbpOrder.force:
        return 'FORCE';
      case M2tsForceTsVideoEbpOrder.$default:
        return 'DEFAULT';
    }
  }
}

extension on String {
  M2tsForceTsVideoEbpOrder toM2tsForceTsVideoEbpOrder() {
    switch (this) {
      case 'FORCE':
        return M2tsForceTsVideoEbpOrder.force;
      case 'DEFAULT':
        return M2tsForceTsVideoEbpOrder.$default;
    }
    throw Exception('$this is not known in enum M2tsForceTsVideoEbpOrder');
  }
}

/// If INSERT, Nielsen inaudible tones for media tracking will be detected in
/// the input audio and an equivalent ID3 tag will be inserted in the output.
enum M2tsNielsenId3 {
  insert,
  none,
}

extension on M2tsNielsenId3 {
  String toValue() {
    switch (this) {
      case M2tsNielsenId3.insert:
        return 'INSERT';
      case M2tsNielsenId3.none:
        return 'NONE';
    }
  }
}

extension on String {
  M2tsNielsenId3 toM2tsNielsenId3() {
    switch (this) {
      case 'INSERT':
        return M2tsNielsenId3.insert;
      case 'NONE':
        return M2tsNielsenId3.none;
    }
    throw Exception('$this is not known in enum M2tsNielsenId3');
  }
}

/// When set to PCR_EVERY_PES_PACKET, a Program Clock Reference value is
/// inserted for every Packetized Elementary Stream (PES) header. This is
/// effective only when the PCR PID is the same as the video or audio elementary
/// stream.
enum M2tsPcrControl {
  pcrEveryPesPacket,
  configuredPcrPeriod,
}

extension on M2tsPcrControl {
  String toValue() {
    switch (this) {
      case M2tsPcrControl.pcrEveryPesPacket:
        return 'PCR_EVERY_PES_PACKET';
      case M2tsPcrControl.configuredPcrPeriod:
        return 'CONFIGURED_PCR_PERIOD';
    }
  }
}

extension on String {
  M2tsPcrControl toM2tsPcrControl() {
    switch (this) {
      case 'PCR_EVERY_PES_PACKET':
        return M2tsPcrControl.pcrEveryPesPacket;
      case 'CONFIGURED_PCR_PERIOD':
        return M2tsPcrControl.configuredPcrPeriod;
    }
    throw Exception('$this is not known in enum M2tsPcrControl');
  }
}

/// When set to CBR, inserts null packets into transport stream to fill
/// specified bitrate. When set to VBR, the bitrate setting acts as the maximum
/// bitrate, but the output will not be padded up to that bitrate.
enum M2tsRateMode {
  vbr,
  cbr,
}

extension on M2tsRateMode {
  String toValue() {
    switch (this) {
      case M2tsRateMode.vbr:
        return 'VBR';
      case M2tsRateMode.cbr:
        return 'CBR';
    }
  }
}

extension on String {
  M2tsRateMode toM2tsRateMode() {
    switch (this) {
      case 'VBR':
        return M2tsRateMode.vbr;
      case 'CBR':
        return M2tsRateMode.cbr;
    }
    throw Exception('$this is not known in enum M2tsRateMode');
  }
}

/// Settings for SCTE-35 signals from ESAM. Include this in your job settings to
/// put SCTE-35 markers in your HLS and transport stream outputs at the
/// insertion points that you specify in an ESAM XML document. Provide the
/// document in the setting SCC XML (sccXml).
class M2tsScte35Esam {
  /// Packet Identifier (PID) of the SCTE-35 stream in the transport stream
  /// generated by ESAM.
  final int? scte35EsamPid;

  M2tsScte35Esam({
    this.scte35EsamPid,
  });
  factory M2tsScte35Esam.fromJson(Map<String, dynamic> json) {
    return M2tsScte35Esam(
      scte35EsamPid: json['scte35EsamPid'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final scte35EsamPid = this.scte35EsamPid;
    return {
      if (scte35EsamPid != null) 'scte35EsamPid': scte35EsamPid,
    };
  }
}

/// For SCTE-35 markers from your input-- Choose Passthrough (PASSTHROUGH) if
/// you want SCTE-35 markers that appear in your input to also appear in this
/// output. Choose None (NONE) if you don't want SCTE-35 markers in this output.
/// For SCTE-35 markers from an ESAM XML document-- Choose None (NONE). Also
/// provide the ESAM XML as a string in the setting Signal processing
/// notification XML (sccXml). Also enable ESAM SCTE-35 (include the property
/// scte35Esam).
enum M2tsScte35Source {
  passthrough,
  none,
}

extension on M2tsScte35Source {
  String toValue() {
    switch (this) {
      case M2tsScte35Source.passthrough:
        return 'PASSTHROUGH';
      case M2tsScte35Source.none:
        return 'NONE';
    }
  }
}

extension on String {
  M2tsScte35Source toM2tsScte35Source() {
    switch (this) {
      case 'PASSTHROUGH':
        return M2tsScte35Source.passthrough;
      case 'NONE':
        return M2tsScte35Source.none;
    }
    throw Exception('$this is not known in enum M2tsScte35Source');
  }
}

/// Inserts segmentation markers at each segmentation_time period. rai_segstart
/// sets the Random Access Indicator bit in the adaptation field. rai_adapt sets
/// the RAI bit and adds the current timecode in the private data bytes.
/// psi_segstart inserts PAT and PMT tables at the start of segments. ebp adds
/// Encoder Boundary Point information to the adaptation field as per OpenCable
/// specification OC-SP-EBP-I01-130118. ebp_legacy adds Encoder Boundary Point
/// information to the adaptation field using a legacy proprietary format.
enum M2tsSegmentationMarkers {
  none,
  raiSegstart,
  raiAdapt,
  psiSegstart,
  ebp,
  ebpLegacy,
}

extension on M2tsSegmentationMarkers {
  String toValue() {
    switch (this) {
      case M2tsSegmentationMarkers.none:
        return 'NONE';
      case M2tsSegmentationMarkers.raiSegstart:
        return 'RAI_SEGSTART';
      case M2tsSegmentationMarkers.raiAdapt:
        return 'RAI_ADAPT';
      case M2tsSegmentationMarkers.psiSegstart:
        return 'PSI_SEGSTART';
      case M2tsSegmentationMarkers.ebp:
        return 'EBP';
      case M2tsSegmentationMarkers.ebpLegacy:
        return 'EBP_LEGACY';
    }
  }
}

extension on String {
  M2tsSegmentationMarkers toM2tsSegmentationMarkers() {
    switch (this) {
      case 'NONE':
        return M2tsSegmentationMarkers.none;
      case 'RAI_SEGSTART':
        return M2tsSegmentationMarkers.raiSegstart;
      case 'RAI_ADAPT':
        return M2tsSegmentationMarkers.raiAdapt;
      case 'PSI_SEGSTART':
        return M2tsSegmentationMarkers.psiSegstart;
      case 'EBP':
        return M2tsSegmentationMarkers.ebp;
      case 'EBP_LEGACY':
        return M2tsSegmentationMarkers.ebpLegacy;
    }
    throw Exception('$this is not known in enum M2tsSegmentationMarkers');
  }
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
  maintainCadence,
  resetCadence,
}

extension on M2tsSegmentationStyle {
  String toValue() {
    switch (this) {
      case M2tsSegmentationStyle.maintainCadence:
        return 'MAINTAIN_CADENCE';
      case M2tsSegmentationStyle.resetCadence:
        return 'RESET_CADENCE';
    }
  }
}

extension on String {
  M2tsSegmentationStyle toM2tsSegmentationStyle() {
    switch (this) {
      case 'MAINTAIN_CADENCE':
        return M2tsSegmentationStyle.maintainCadence;
      case 'RESET_CADENCE':
        return M2tsSegmentationStyle.resetCadence;
    }
    throw Exception('$this is not known in enum M2tsSegmentationStyle');
  }
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
class M2tsSettings {
  /// Selects between the DVB and ATSC buffer models for Dolby Digital audio.
  final M2tsAudioBufferModel? audioBufferModel;

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
  final M2tsAudioDuration? audioDuration;

  /// The number of audio frames to insert for each PES packet.
  final int? audioFramesPerPes;

  /// Specify the packet identifiers (PIDs) for any elementary audio streams you
  /// include in this output. Specify multiple PIDs as a JSON array. Default is
  /// the range 482-492.
  final List<int>? audioPids;

  /// Specify the output bitrate of the transport stream in bits per second.
  /// Setting to 0 lets the muxer automatically determine the appropriate bitrate.
  /// Other common values are 3750000, 7500000, and 15000000.
  final int? bitrate;

  /// Controls what buffer model to use for accurate interleaving. If set to
  /// MULTIPLEX, use multiplex  buffer model. If set to NONE, this can lead to
  /// lower latency, but low-memory devices may not be able to play back the
  /// stream without interruptions.
  final M2tsBufferModel? bufferModel;

  /// Inserts DVB Network Information Table (NIT) at the specified table
  /// repetition interval.
  final DvbNitSettings? dvbNitSettings;

  /// Inserts DVB Service Description Table (NIT) at the specified table
  /// repetition interval.
  final DvbSdtSettings? dvbSdtSettings;

  /// Specify the packet identifiers (PIDs) for DVB subtitle data included in this
  /// output. Specify multiple PIDs as a JSON array. Default is the range 460-479.
  final List<int>? dvbSubPids;

  /// Inserts DVB Time and Date Table (TDT) at the specified table repetition
  /// interval.
  final DvbTdtSettings? dvbTdtSettings;

  /// Specify the packet identifier (PID) for DVB teletext data you include in
  /// this output. Default is 499.
  final int? dvbTeletextPid;

  /// When set to VIDEO_AND_FIXED_INTERVALS, audio EBP markers will be added to
  /// partitions 3 and 4. The interval between these additional markers will be
  /// fixed, and will be slightly shorter than the video EBP marker interval. When
  /// set to VIDEO_INTERVAL, these additional markers will not be inserted. Only
  /// applicable when EBP segmentation markers are is selected
  /// (segmentationMarkers is EBP or EBP_LEGACY).
  final M2tsEbpAudioInterval? ebpAudioInterval;

  /// Selects which PIDs to place EBP markers on. They can either be placed only
  /// on the video PID, or on both the video PID and all audio PIDs. Only
  /// applicable when EBP segmentation markers are is selected
  /// (segmentationMarkers is EBP or EBP_LEGACY).
  final M2tsEbpPlacement? ebpPlacement;

  /// Controls whether to include the ES Rate field in the PES header.
  final M2tsEsRateInPes? esRateInPes;

  /// Keep the default value (DEFAULT) unless you know that your audio EBP markers
  /// are incorrectly appearing before your video EBP markers. To correct this
  /// problem, set this value to Force (FORCE).
  final M2tsForceTsVideoEbpOrder? forceTsVideoEbpOrder;

  /// The length, in seconds, of each fragment. Only used with EBP markers.
  final double? fragmentTime;

  /// Specify the maximum time, in milliseconds, between Program Clock References
  /// (PCRs) inserted into the transport stream.
  final int? maxPcrInterval;

  /// When set, enforces that Encoder Boundary Points do not come within the
  /// specified time interval of each other by looking ahead at input video. If
  /// another EBP is going to come in within the specified time interval, the
  /// current EBP is not emitted, and the segment is "stretched" to the next
  /// marker. The lookahead value does not add latency to the system. The Live
  /// Event must be configured elsewhere to create sufficient latency to make the
  /// lookahead accurate.
  final int? minEbpInterval;

  /// If INSERT, Nielsen inaudible tones for media tracking will be detected in
  /// the input audio and an equivalent ID3 tag will be inserted in the output.
  final M2tsNielsenId3? nielsenId3;

  /// Value in bits per second of extra null packets to insert into the transport
  /// stream. This can be used if a downstream encryption system requires periodic
  /// null packets.
  final double? nullPacketBitrate;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int? patInterval;

  /// When set to PCR_EVERY_PES_PACKET, a Program Clock Reference value is
  /// inserted for every Packetized Elementary Stream (PES) header. This is
  /// effective only when the PCR PID is the same as the video or audio elementary
  /// stream.
  final M2tsPcrControl? pcrControl;

  /// Specify the packet identifier (PID) for the program clock reference (PCR) in
  /// this output. If you do not specify a value, the service will use the value
  /// for Video PID (VideoPid).
  final int? pcrPid;

  /// Specify the number of milliseconds between instances of the program map
  /// table (PMT) in the output transport stream.
  final int? pmtInterval;

  /// Specify the packet identifier (PID) for the program map table (PMT) itself.
  /// Default is 480.
  final int? pmtPid;

  /// Specify the packet identifier (PID) of the private metadata stream. Default
  /// is 503.
  final int? privateMetadataPid;

  /// Use Program number (programNumber) to specify the program number used in the
  /// program map table (PMT) for this output. Default is 1. Program numbers and
  /// program map tables are parts of MPEG-2 transport stream containers, used for
  /// organizing data.
  final int? programNumber;

  /// When set to CBR, inserts null packets into transport stream to fill
  /// specified bitrate. When set to VBR, the bitrate setting acts as the maximum
  /// bitrate, but the output will not be padded up to that bitrate.
  final M2tsRateMode? rateMode;

  /// Include this in your job settings to put SCTE-35 markers in your HLS and
  /// transport stream outputs at the insertion points that you specify in an ESAM
  /// XML document. Provide the document in the setting SCC XML (sccXml).
  final M2tsScte35Esam? scte35Esam;

  /// Specify the packet identifier (PID) of the SCTE-35 stream in the transport
  /// stream.
  final int? scte35Pid;

  /// For SCTE-35 markers from your input-- Choose Passthrough (PASSTHROUGH) if
  /// you want SCTE-35 markers that appear in your input to also appear in this
  /// output. Choose None (NONE) if you don't want SCTE-35 markers in this output.
  /// For SCTE-35 markers from an ESAM XML document-- Choose None (NONE). Also
  /// provide the ESAM XML as a string in the setting Signal processing
  /// notification XML (sccXml). Also enable ESAM SCTE-35 (include the property
  /// scte35Esam).
  final M2tsScte35Source? scte35Source;

  /// Inserts segmentation markers at each segmentation_time period. rai_segstart
  /// sets the Random Access Indicator bit in the adaptation field. rai_adapt sets
  /// the RAI bit and adds the current timecode in the private data bytes.
  /// psi_segstart inserts PAT and PMT tables at the start of segments. ebp adds
  /// Encoder Boundary Point information to the adaptation field as per OpenCable
  /// specification OC-SP-EBP-I01-130118. ebp_legacy adds Encoder Boundary Point
  /// information to the adaptation field using a legacy proprietary format.
  final M2tsSegmentationMarkers? segmentationMarkers;

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
  final M2tsSegmentationStyle? segmentationStyle;

  /// Specify the length, in seconds, of each segment. Required unless markers is
  /// set to _none_.
  final double? segmentationTime;

  /// Specify the packet identifier (PID) for timed metadata in this output.
  /// Default is 502.
  final int? timedMetadataPid;

  /// Specify the ID for the transport stream itself in the program map table for
  /// this output. Transport stream IDs and program map tables are parts of MPEG-2
  /// transport stream containers, used for organizing data.
  final int? transportStreamId;

  /// Specify the packet identifier (PID) of the elementary video stream in the
  /// transport stream.
  final int? videoPid;

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
  factory M2tsSettings.fromJson(Map<String, dynamic> json) {
    return M2tsSettings(
      audioBufferModel:
          (json['audioBufferModel'] as String?)?.toM2tsAudioBufferModel(),
      audioDuration: (json['audioDuration'] as String?)?.toM2tsAudioDuration(),
      audioFramesPerPes: json['audioFramesPerPes'] as int?,
      audioPids: (json['audioPids'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      bitrate: json['bitrate'] as int?,
      bufferModel: (json['bufferModel'] as String?)?.toM2tsBufferModel(),
      dvbNitSettings: json['dvbNitSettings'] != null
          ? DvbNitSettings.fromJson(
              json['dvbNitSettings'] as Map<String, dynamic>)
          : null,
      dvbSdtSettings: json['dvbSdtSettings'] != null
          ? DvbSdtSettings.fromJson(
              json['dvbSdtSettings'] as Map<String, dynamic>)
          : null,
      dvbSubPids: (json['dvbSubPids'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      dvbTdtSettings: json['dvbTdtSettings'] != null
          ? DvbTdtSettings.fromJson(
              json['dvbTdtSettings'] as Map<String, dynamic>)
          : null,
      dvbTeletextPid: json['dvbTeletextPid'] as int?,
      ebpAudioInterval:
          (json['ebpAudioInterval'] as String?)?.toM2tsEbpAudioInterval(),
      ebpPlacement: (json['ebpPlacement'] as String?)?.toM2tsEbpPlacement(),
      esRateInPes: (json['esRateInPes'] as String?)?.toM2tsEsRateInPes(),
      forceTsVideoEbpOrder: (json['forceTsVideoEbpOrder'] as String?)
          ?.toM2tsForceTsVideoEbpOrder(),
      fragmentTime: json['fragmentTime'] as double?,
      maxPcrInterval: json['maxPcrInterval'] as int?,
      minEbpInterval: json['minEbpInterval'] as int?,
      nielsenId3: (json['nielsenId3'] as String?)?.toM2tsNielsenId3(),
      nullPacketBitrate: json['nullPacketBitrate'] as double?,
      patInterval: json['patInterval'] as int?,
      pcrControl: (json['pcrControl'] as String?)?.toM2tsPcrControl(),
      pcrPid: json['pcrPid'] as int?,
      pmtInterval: json['pmtInterval'] as int?,
      pmtPid: json['pmtPid'] as int?,
      privateMetadataPid: json['privateMetadataPid'] as int?,
      programNumber: json['programNumber'] as int?,
      rateMode: (json['rateMode'] as String?)?.toM2tsRateMode(),
      scte35Esam: json['scte35Esam'] != null
          ? M2tsScte35Esam.fromJson(json['scte35Esam'] as Map<String, dynamic>)
          : null,
      scte35Pid: json['scte35Pid'] as int?,
      scte35Source: (json['scte35Source'] as String?)?.toM2tsScte35Source(),
      segmentationMarkers:
          (json['segmentationMarkers'] as String?)?.toM2tsSegmentationMarkers(),
      segmentationStyle:
          (json['segmentationStyle'] as String?)?.toM2tsSegmentationStyle(),
      segmentationTime: json['segmentationTime'] as double?,
      timedMetadataPid: json['timedMetadataPid'] as int?,
      transportStreamId: json['transportStreamId'] as int?,
      videoPid: json['videoPid'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioBufferModel = this.audioBufferModel;
    final audioDuration = this.audioDuration;
    final audioFramesPerPes = this.audioFramesPerPes;
    final audioPids = this.audioPids;
    final bitrate = this.bitrate;
    final bufferModel = this.bufferModel;
    final dvbNitSettings = this.dvbNitSettings;
    final dvbSdtSettings = this.dvbSdtSettings;
    final dvbSubPids = this.dvbSubPids;
    final dvbTdtSettings = this.dvbTdtSettings;
    final dvbTeletextPid = this.dvbTeletextPid;
    final ebpAudioInterval = this.ebpAudioInterval;
    final ebpPlacement = this.ebpPlacement;
    final esRateInPes = this.esRateInPes;
    final forceTsVideoEbpOrder = this.forceTsVideoEbpOrder;
    final fragmentTime = this.fragmentTime;
    final maxPcrInterval = this.maxPcrInterval;
    final minEbpInterval = this.minEbpInterval;
    final nielsenId3 = this.nielsenId3;
    final nullPacketBitrate = this.nullPacketBitrate;
    final patInterval = this.patInterval;
    final pcrControl = this.pcrControl;
    final pcrPid = this.pcrPid;
    final pmtInterval = this.pmtInterval;
    final pmtPid = this.pmtPid;
    final privateMetadataPid = this.privateMetadataPid;
    final programNumber = this.programNumber;
    final rateMode = this.rateMode;
    final scte35Esam = this.scte35Esam;
    final scte35Pid = this.scte35Pid;
    final scte35Source = this.scte35Source;
    final segmentationMarkers = this.segmentationMarkers;
    final segmentationStyle = this.segmentationStyle;
    final segmentationTime = this.segmentationTime;
    final timedMetadataPid = this.timedMetadataPid;
    final transportStreamId = this.transportStreamId;
    final videoPid = this.videoPid;
    return {
      if (audioBufferModel != null)
        'audioBufferModel': audioBufferModel.toValue(),
      if (audioDuration != null) 'audioDuration': audioDuration.toValue(),
      if (audioFramesPerPes != null) 'audioFramesPerPes': audioFramesPerPes,
      if (audioPids != null) 'audioPids': audioPids,
      if (bitrate != null) 'bitrate': bitrate,
      if (bufferModel != null) 'bufferModel': bufferModel.toValue(),
      if (dvbNitSettings != null) 'dvbNitSettings': dvbNitSettings,
      if (dvbSdtSettings != null) 'dvbSdtSettings': dvbSdtSettings,
      if (dvbSubPids != null) 'dvbSubPids': dvbSubPids,
      if (dvbTdtSettings != null) 'dvbTdtSettings': dvbTdtSettings,
      if (dvbTeletextPid != null) 'dvbTeletextPid': dvbTeletextPid,
      if (ebpAudioInterval != null)
        'ebpAudioInterval': ebpAudioInterval.toValue(),
      if (ebpPlacement != null) 'ebpPlacement': ebpPlacement.toValue(),
      if (esRateInPes != null) 'esRateInPes': esRateInPes.toValue(),
      if (forceTsVideoEbpOrder != null)
        'forceTsVideoEbpOrder': forceTsVideoEbpOrder.toValue(),
      if (fragmentTime != null) 'fragmentTime': fragmentTime,
      if (maxPcrInterval != null) 'maxPcrInterval': maxPcrInterval,
      if (minEbpInterval != null) 'minEbpInterval': minEbpInterval,
      if (nielsenId3 != null) 'nielsenId3': nielsenId3.toValue(),
      if (nullPacketBitrate != null) 'nullPacketBitrate': nullPacketBitrate,
      if (patInterval != null) 'patInterval': patInterval,
      if (pcrControl != null) 'pcrControl': pcrControl.toValue(),
      if (pcrPid != null) 'pcrPid': pcrPid,
      if (pmtInterval != null) 'pmtInterval': pmtInterval,
      if (pmtPid != null) 'pmtPid': pmtPid,
      if (privateMetadataPid != null) 'privateMetadataPid': privateMetadataPid,
      if (programNumber != null) 'programNumber': programNumber,
      if (rateMode != null) 'rateMode': rateMode.toValue(),
      if (scte35Esam != null) 'scte35Esam': scte35Esam,
      if (scte35Pid != null) 'scte35Pid': scte35Pid,
      if (scte35Source != null) 'scte35Source': scte35Source.toValue(),
      if (segmentationMarkers != null)
        'segmentationMarkers': segmentationMarkers.toValue(),
      if (segmentationStyle != null)
        'segmentationStyle': segmentationStyle.toValue(),
      if (segmentationTime != null) 'segmentationTime': segmentationTime,
      if (timedMetadataPid != null) 'timedMetadataPid': timedMetadataPid,
      if (transportStreamId != null) 'transportStreamId': transportStreamId,
      if (videoPid != null) 'videoPid': videoPid,
    };
  }
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
  defaultCodecDuration,
  matchVideoDuration,
}

extension on M3u8AudioDuration {
  String toValue() {
    switch (this) {
      case M3u8AudioDuration.defaultCodecDuration:
        return 'DEFAULT_CODEC_DURATION';
      case M3u8AudioDuration.matchVideoDuration:
        return 'MATCH_VIDEO_DURATION';
    }
  }
}

extension on String {
  M3u8AudioDuration toM3u8AudioDuration() {
    switch (this) {
      case 'DEFAULT_CODEC_DURATION':
        return M3u8AudioDuration.defaultCodecDuration;
      case 'MATCH_VIDEO_DURATION':
        return M3u8AudioDuration.matchVideoDuration;
    }
    throw Exception('$this is not known in enum M3u8AudioDuration');
  }
}

/// If INSERT, Nielsen inaudible tones for media tracking will be detected in
/// the input audio and an equivalent ID3 tag will be inserted in the output.
enum M3u8NielsenId3 {
  insert,
  none,
}

extension on M3u8NielsenId3 {
  String toValue() {
    switch (this) {
      case M3u8NielsenId3.insert:
        return 'INSERT';
      case M3u8NielsenId3.none:
        return 'NONE';
    }
  }
}

extension on String {
  M3u8NielsenId3 toM3u8NielsenId3() {
    switch (this) {
      case 'INSERT':
        return M3u8NielsenId3.insert;
      case 'NONE':
        return M3u8NielsenId3.none;
    }
    throw Exception('$this is not known in enum M3u8NielsenId3');
  }
}

/// When set to PCR_EVERY_PES_PACKET a Program Clock Reference value is inserted
/// for every Packetized Elementary Stream (PES) header. This parameter is
/// effective only when the PCR PID is the same as the video or audio elementary
/// stream.
enum M3u8PcrControl {
  pcrEveryPesPacket,
  configuredPcrPeriod,
}

extension on M3u8PcrControl {
  String toValue() {
    switch (this) {
      case M3u8PcrControl.pcrEveryPesPacket:
        return 'PCR_EVERY_PES_PACKET';
      case M3u8PcrControl.configuredPcrPeriod:
        return 'CONFIGURED_PCR_PERIOD';
    }
  }
}

extension on String {
  M3u8PcrControl toM3u8PcrControl() {
    switch (this) {
      case 'PCR_EVERY_PES_PACKET':
        return M3u8PcrControl.pcrEveryPesPacket;
      case 'CONFIGURED_PCR_PERIOD':
        return M3u8PcrControl.configuredPcrPeriod;
    }
    throw Exception('$this is not known in enum M3u8PcrControl');
  }
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
  passthrough,
  none,
}

extension on M3u8Scte35Source {
  String toValue() {
    switch (this) {
      case M3u8Scte35Source.passthrough:
        return 'PASSTHROUGH';
      case M3u8Scte35Source.none:
        return 'NONE';
    }
  }
}

extension on String {
  M3u8Scte35Source toM3u8Scte35Source() {
    switch (this) {
      case 'PASSTHROUGH':
        return M3u8Scte35Source.passthrough;
      case 'NONE':
        return M3u8Scte35Source.none;
    }
    throw Exception('$this is not known in enum M3u8Scte35Source');
  }
}

/// Settings for TS segments in HLS
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
  final M3u8AudioDuration? audioDuration;

  /// The number of audio frames to insert for each PES packet.
  final int? audioFramesPerPes;

  /// Packet Identifier (PID) of the elementary audio stream(s) in the transport
  /// stream. Multiple values are accepted, and can be entered in ranges and/or by
  /// comma separation.
  final List<int>? audioPids;

  /// If INSERT, Nielsen inaudible tones for media tracking will be detected in
  /// the input audio and an equivalent ID3 tag will be inserted in the output.
  final M3u8NielsenId3? nielsenId3;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int? patInterval;

  /// When set to PCR_EVERY_PES_PACKET a Program Clock Reference value is inserted
  /// for every Packetized Elementary Stream (PES) header. This parameter is
  /// effective only when the PCR PID is the same as the video or audio elementary
  /// stream.
  final M3u8PcrControl? pcrControl;

  /// Packet Identifier (PID) of the Program Clock Reference (PCR) in the
  /// transport stream. When no value is given, the encoder will assign the same
  /// value as the Video PID.
  final int? pcrPid;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int? pmtInterval;

  /// Packet Identifier (PID) for the Program Map Table (PMT) in the transport
  /// stream.
  final int? pmtPid;

  /// Packet Identifier (PID) of the private metadata stream in the transport
  /// stream.
  final int? privateMetadataPid;

  /// The value of the program number field in the Program Map Table.
  final int? programNumber;

  /// Packet Identifier (PID) of the SCTE-35 stream in the transport stream.
  final int? scte35Pid;

  /// For SCTE-35 markers from your input-- Choose Passthrough (PASSTHROUGH) if
  /// you want SCTE-35 markers that appear in your input to also appear in this
  /// output. Choose None (NONE) if you don't want SCTE-35 markers in this output.
  /// For SCTE-35 markers from an ESAM XML document-- Choose None (NONE) if you
  /// don't want manifest conditioning. Choose Passthrough (PASSTHROUGH) and
  /// choose Ad markers (adMarkers) if you do want manifest conditioning. In both
  /// cases, also provide the ESAM XML as a string in the setting Signal
  /// processing notification XML (sccXml).
  final M3u8Scte35Source? scte35Source;

  /// Applies only to HLS outputs. Use this setting to specify whether the service
  /// inserts the ID3 timed metadata from the input in this output.
  final TimedMetadata? timedMetadata;

  /// Packet Identifier (PID) of the timed metadata stream in the transport
  /// stream.
  final int? timedMetadataPid;

  /// The value of the transport stream ID field in the Program Map Table.
  final int? transportStreamId;

  /// Packet Identifier (PID) of the elementary video stream in the transport
  /// stream.
  final int? videoPid;

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
  factory M3u8Settings.fromJson(Map<String, dynamic> json) {
    return M3u8Settings(
      audioDuration: (json['audioDuration'] as String?)?.toM3u8AudioDuration(),
      audioFramesPerPes: json['audioFramesPerPes'] as int?,
      audioPids: (json['audioPids'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      nielsenId3: (json['nielsenId3'] as String?)?.toM3u8NielsenId3(),
      patInterval: json['patInterval'] as int?,
      pcrControl: (json['pcrControl'] as String?)?.toM3u8PcrControl(),
      pcrPid: json['pcrPid'] as int?,
      pmtInterval: json['pmtInterval'] as int?,
      pmtPid: json['pmtPid'] as int?,
      privateMetadataPid: json['privateMetadataPid'] as int?,
      programNumber: json['programNumber'] as int?,
      scte35Pid: json['scte35Pid'] as int?,
      scte35Source: (json['scte35Source'] as String?)?.toM3u8Scte35Source(),
      timedMetadata: (json['timedMetadata'] as String?)?.toTimedMetadata(),
      timedMetadataPid: json['timedMetadataPid'] as int?,
      transportStreamId: json['transportStreamId'] as int?,
      videoPid: json['videoPid'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioDuration = this.audioDuration;
    final audioFramesPerPes = this.audioFramesPerPes;
    final audioPids = this.audioPids;
    final nielsenId3 = this.nielsenId3;
    final patInterval = this.patInterval;
    final pcrControl = this.pcrControl;
    final pcrPid = this.pcrPid;
    final pmtInterval = this.pmtInterval;
    final pmtPid = this.pmtPid;
    final privateMetadataPid = this.privateMetadataPid;
    final programNumber = this.programNumber;
    final scte35Pid = this.scte35Pid;
    final scte35Source = this.scte35Source;
    final timedMetadata = this.timedMetadata;
    final timedMetadataPid = this.timedMetadataPid;
    final transportStreamId = this.transportStreamId;
    final videoPid = this.videoPid;
    return {
      if (audioDuration != null) 'audioDuration': audioDuration.toValue(),
      if (audioFramesPerPes != null) 'audioFramesPerPes': audioFramesPerPes,
      if (audioPids != null) 'audioPids': audioPids,
      if (nielsenId3 != null) 'nielsenId3': nielsenId3.toValue(),
      if (patInterval != null) 'patInterval': patInterval,
      if (pcrControl != null) 'pcrControl': pcrControl.toValue(),
      if (pcrPid != null) 'pcrPid': pcrPid,
      if (pmtInterval != null) 'pmtInterval': pmtInterval,
      if (pmtPid != null) 'pmtPid': pmtPid,
      if (privateMetadataPid != null) 'privateMetadataPid': privateMetadataPid,
      if (programNumber != null) 'programNumber': programNumber,
      if (scte35Pid != null) 'scte35Pid': scte35Pid,
      if (scte35Source != null) 'scte35Source': scte35Source.toValue(),
      if (timedMetadata != null) 'timedMetadata': timedMetadata.toValue(),
      if (timedMetadataPid != null) 'timedMetadataPid': timedMetadataPid,
      if (transportStreamId != null) 'transportStreamId': transportStreamId,
      if (videoPid != null) 'videoPid': videoPid,
    };
  }
}

/// Overlay motion graphics on top of your video at the time that you specify.
class MotionImageInserter {
  /// If your motion graphic asset is a .mov file, keep this setting unspecified.
  /// If your motion graphic asset is a series of .png files, specify the frame
  /// rate of the overlay in frames per second, as a fraction. For example,
  /// specify 24 fps as 24/1. Make sure that the number of images in your series
  /// matches the frame rate and your intended overlay duration. For example, if
  /// you want a 30-second overlay at 30 fps, you should have 900 .png images.
  /// This overlay frame rate doesn't need to match the frame rate of the
  /// underlying video.
  final MotionImageInsertionFramerate? framerate;

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
  final String? input;

  /// Choose the type of motion graphic asset that you are providing for your
  /// overlay. You can choose either a .mov file or a series of .png files.
  final MotionImageInsertionMode? insertionMode;

  /// Use Offset to specify the placement of your motion graphic overlay on the
  /// video frame. Specify in pixels, from the upper-left corner of the frame. If
  /// you don't specify an offset, the service scales your overlay to the full
  /// size of the frame. Otherwise, the service inserts the overlay at its native
  /// resolution and scales the size up or down with any video scaling.
  final MotionImageInsertionOffset? offset;

  /// Specify whether your motion graphic overlay repeats on a loop or plays only
  /// once.
  final MotionImagePlayback? playback;

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
  final String? startTime;

  MotionImageInserter({
    this.framerate,
    this.input,
    this.insertionMode,
    this.offset,
    this.playback,
    this.startTime,
  });
  factory MotionImageInserter.fromJson(Map<String, dynamic> json) {
    return MotionImageInserter(
      framerate: json['framerate'] != null
          ? MotionImageInsertionFramerate.fromJson(
              json['framerate'] as Map<String, dynamic>)
          : null,
      input: json['input'] as String?,
      insertionMode:
          (json['insertionMode'] as String?)?.toMotionImageInsertionMode(),
      offset: json['offset'] != null
          ? MotionImageInsertionOffset.fromJson(
              json['offset'] as Map<String, dynamic>)
          : null,
      playback: (json['playback'] as String?)?.toMotionImagePlayback(),
      startTime: json['startTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final framerate = this.framerate;
    final input = this.input;
    final insertionMode = this.insertionMode;
    final offset = this.offset;
    final playback = this.playback;
    final startTime = this.startTime;
    return {
      if (framerate != null) 'framerate': framerate,
      if (input != null) 'input': input,
      if (insertionMode != null) 'insertionMode': insertionMode.toValue(),
      if (offset != null) 'offset': offset,
      if (playback != null) 'playback': playback.toValue(),
      if (startTime != null) 'startTime': startTime,
    };
  }
}

/// For motion overlays that don't have a built-in frame rate, specify the frame
/// rate of the overlay in frames per second, as a fraction. For example,
/// specify 24 fps as 24/1. The overlay frame rate doesn't need to match the
/// frame rate of the underlying video.
class MotionImageInsertionFramerate {
  /// The bottom of the fraction that expresses your overlay frame rate. For
  /// example, if your frame rate is 24 fps, set this value to 1.
  final int? framerateDenominator;

  /// The top of the fraction that expresses your overlay frame rate. For example,
  /// if your frame rate is 24 fps, set this value to 24.
  final int? framerateNumerator;

  MotionImageInsertionFramerate({
    this.framerateDenominator,
    this.framerateNumerator,
  });
  factory MotionImageInsertionFramerate.fromJson(Map<String, dynamic> json) {
    return MotionImageInsertionFramerate(
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    return {
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
    };
  }
}

/// Choose the type of motion graphic asset that you are providing for your
/// overlay. You can choose either a .mov file or a series of .png files.
enum MotionImageInsertionMode {
  mov,
  png,
}

extension on MotionImageInsertionMode {
  String toValue() {
    switch (this) {
      case MotionImageInsertionMode.mov:
        return 'MOV';
      case MotionImageInsertionMode.png:
        return 'PNG';
    }
  }
}

extension on String {
  MotionImageInsertionMode toMotionImageInsertionMode() {
    switch (this) {
      case 'MOV':
        return MotionImageInsertionMode.mov;
      case 'PNG':
        return MotionImageInsertionMode.png;
    }
    throw Exception('$this is not known in enum MotionImageInsertionMode');
  }
}

/// Specify the offset between the upper-left corner of the video frame and the
/// top left corner of the overlay.
class MotionImageInsertionOffset {
  /// Set the distance, in pixels, between the overlay and the left edge of the
  /// video frame.
  final int? imageX;

  /// Set the distance, in pixels, between the overlay and the top edge of the
  /// video frame.
  final int? imageY;

  MotionImageInsertionOffset({
    this.imageX,
    this.imageY,
  });
  factory MotionImageInsertionOffset.fromJson(Map<String, dynamic> json) {
    return MotionImageInsertionOffset(
      imageX: json['imageX'] as int?,
      imageY: json['imageY'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageX = this.imageX;
    final imageY = this.imageY;
    return {
      if (imageX != null) 'imageX': imageX,
      if (imageY != null) 'imageY': imageY,
    };
  }
}

/// Specify whether your motion graphic overlay repeats on a loop or plays only
/// once.
enum MotionImagePlayback {
  once,
  repeat,
}

extension on MotionImagePlayback {
  String toValue() {
    switch (this) {
      case MotionImagePlayback.once:
        return 'ONCE';
      case MotionImagePlayback.repeat:
        return 'REPEAT';
    }
  }
}

extension on String {
  MotionImagePlayback toMotionImagePlayback() {
    switch (this) {
      case 'ONCE':
        return MotionImagePlayback.once;
      case 'REPEAT':
        return MotionImagePlayback.repeat;
    }
    throw Exception('$this is not known in enum MotionImagePlayback');
  }
}

/// When enabled, include 'clap' atom if appropriate for the video output
/// settings.
enum MovClapAtom {
  include,
  exclude,
}

extension on MovClapAtom {
  String toValue() {
    switch (this) {
      case MovClapAtom.include:
        return 'INCLUDE';
      case MovClapAtom.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  MovClapAtom toMovClapAtom() {
    switch (this) {
      case 'INCLUDE':
        return MovClapAtom.include;
      case 'EXCLUDE':
        return MovClapAtom.exclude;
    }
    throw Exception('$this is not known in enum MovClapAtom');
  }
}

/// When enabled, file composition times will start at zero, composition times
/// in the 'ctts' (composition time to sample) box for B-frames will be
/// negative, and a 'cslg' (composition shift least greatest) box will be
/// included per 14496-1 amendment 1. This improves compatibility with Apple
/// players and tools.
enum MovCslgAtom {
  include,
  exclude,
}

extension on MovCslgAtom {
  String toValue() {
    switch (this) {
      case MovCslgAtom.include:
        return 'INCLUDE';
      case MovCslgAtom.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  MovCslgAtom toMovCslgAtom() {
    switch (this) {
      case 'INCLUDE':
        return MovCslgAtom.include;
      case 'EXCLUDE':
        return MovCslgAtom.exclude;
    }
    throw Exception('$this is not known in enum MovCslgAtom');
  }
}

/// When set to XDCAM, writes MPEG2 video streams into the QuickTime file using
/// XDCAM fourcc codes. This increases compatibility with Apple editors and
/// players, but may decrease compatibility with other players. Only applicable
/// when the video codec is MPEG2.
enum MovMpeg2FourCCControl {
  xdcam,
  mpeg,
}

extension on MovMpeg2FourCCControl {
  String toValue() {
    switch (this) {
      case MovMpeg2FourCCControl.xdcam:
        return 'XDCAM';
      case MovMpeg2FourCCControl.mpeg:
        return 'MPEG';
    }
  }
}

extension on String {
  MovMpeg2FourCCControl toMovMpeg2FourCCControl() {
    switch (this) {
      case 'XDCAM':
        return MovMpeg2FourCCControl.xdcam;
      case 'MPEG':
        return MovMpeg2FourCCControl.mpeg;
    }
    throw Exception('$this is not known in enum MovMpeg2FourCCControl');
  }
}

/// To make this output compatible with Omenon, keep the default value, OMNEON.
/// Unless you need Omneon compatibility, set this value to NONE. When you keep
/// the default value, OMNEON, MediaConvert increases the length of the edit
/// list atom. This might cause file rejections when a recipient of the output
/// file doesn't expct this extra padding.
enum MovPaddingControl {
  omneon,
  none,
}

extension on MovPaddingControl {
  String toValue() {
    switch (this) {
      case MovPaddingControl.omneon:
        return 'OMNEON';
      case MovPaddingControl.none:
        return 'NONE';
    }
  }
}

extension on String {
  MovPaddingControl toMovPaddingControl() {
    switch (this) {
      case 'OMNEON':
        return MovPaddingControl.omneon;
      case 'NONE':
        return MovPaddingControl.none;
    }
    throw Exception('$this is not known in enum MovPaddingControl');
  }
}

/// Always keep the default value (SELF_CONTAINED) for this setting.
enum MovReference {
  selfContained,
  external,
}

extension on MovReference {
  String toValue() {
    switch (this) {
      case MovReference.selfContained:
        return 'SELF_CONTAINED';
      case MovReference.external:
        return 'EXTERNAL';
    }
  }
}

extension on String {
  MovReference toMovReference() {
    switch (this) {
      case 'SELF_CONTAINED':
        return MovReference.selfContained;
      case 'EXTERNAL':
        return MovReference.external;
    }
    throw Exception('$this is not known in enum MovReference');
  }
}

/// Settings for MOV Container.
class MovSettings {
  /// When enabled, include 'clap' atom if appropriate for the video output
  /// settings.
  final MovClapAtom? clapAtom;

  /// When enabled, file composition times will start at zero, composition times
  /// in the 'ctts' (composition time to sample) box for B-frames will be
  /// negative, and a 'cslg' (composition shift least greatest) box will be
  /// included per 14496-1 amendment 1. This improves compatibility with Apple
  /// players and tools.
  final MovCslgAtom? cslgAtom;

  /// When set to XDCAM, writes MPEG2 video streams into the QuickTime file using
  /// XDCAM fourcc codes. This increases compatibility with Apple editors and
  /// players, but may decrease compatibility with other players. Only applicable
  /// when the video codec is MPEG2.
  final MovMpeg2FourCCControl? mpeg2FourCCControl;

  /// To make this output compatible with Omenon, keep the default value, OMNEON.
  /// Unless you need Omneon compatibility, set this value to NONE. When you keep
  /// the default value, OMNEON, MediaConvert increases the length of the edit
  /// list atom. This might cause file rejections when a recipient of the output
  /// file doesn't expct this extra padding.
  final MovPaddingControl? paddingControl;

  /// Always keep the default value (SELF_CONTAINED) for this setting.
  final MovReference? reference;

  MovSettings({
    this.clapAtom,
    this.cslgAtom,
    this.mpeg2FourCCControl,
    this.paddingControl,
    this.reference,
  });
  factory MovSettings.fromJson(Map<String, dynamic> json) {
    return MovSettings(
      clapAtom: (json['clapAtom'] as String?)?.toMovClapAtom(),
      cslgAtom: (json['cslgAtom'] as String?)?.toMovCslgAtom(),
      mpeg2FourCCControl:
          (json['mpeg2FourCCControl'] as String?)?.toMovMpeg2FourCCControl(),
      paddingControl:
          (json['paddingControl'] as String?)?.toMovPaddingControl(),
      reference: (json['reference'] as String?)?.toMovReference(),
    );
  }

  Map<String, dynamic> toJson() {
    final clapAtom = this.clapAtom;
    final cslgAtom = this.cslgAtom;
    final mpeg2FourCCControl = this.mpeg2FourCCControl;
    final paddingControl = this.paddingControl;
    final reference = this.reference;
    return {
      if (clapAtom != null) 'clapAtom': clapAtom.toValue(),
      if (cslgAtom != null) 'cslgAtom': cslgAtom.toValue(),
      if (mpeg2FourCCControl != null)
        'mpeg2FourCCControl': mpeg2FourCCControl.toValue(),
      if (paddingControl != null) 'paddingControl': paddingControl.toValue(),
      if (reference != null) 'reference': reference.toValue(),
    };
  }
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value MP2.
class Mp2Settings {
  /// Specify the average bitrate in bits per second.
  final int? bitrate;

  /// Set Channels to specify the number of channels in this output audio track.
  /// Choosing Mono in the console will give you 1 output channel; choosing Stereo
  /// will give you 2. In the API, valid values are 1 and 2.
  final int? channels;

  /// Sample rate in hz.
  final int? sampleRate;

  Mp2Settings({
    this.bitrate,
    this.channels,
    this.sampleRate,
  });
  factory Mp2Settings.fromJson(Map<String, dynamic> json) {
    return Mp2Settings(
      bitrate: json['bitrate'] as int?,
      channels: json['channels'] as int?,
      sampleRate: json['sampleRate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bitrate = this.bitrate;
    final channels = this.channels;
    final sampleRate = this.sampleRate;
    return {
      if (bitrate != null) 'bitrate': bitrate,
      if (channels != null) 'channels': channels,
      if (sampleRate != null) 'sampleRate': sampleRate,
    };
  }
}

/// Specify whether the service encodes this MP3 audio output with a constant
/// bitrate (CBR) or a variable bitrate (VBR).
enum Mp3RateControlMode {
  cbr,
  vbr,
}

extension on Mp3RateControlMode {
  String toValue() {
    switch (this) {
      case Mp3RateControlMode.cbr:
        return 'CBR';
      case Mp3RateControlMode.vbr:
        return 'VBR';
    }
  }
}

extension on String {
  Mp3RateControlMode toMp3RateControlMode() {
    switch (this) {
      case 'CBR':
        return Mp3RateControlMode.cbr;
      case 'VBR':
        return Mp3RateControlMode.vbr;
    }
    throw Exception('$this is not known in enum Mp3RateControlMode');
  }
}

/// Required when you set Codec, under AudioDescriptions>CodecSettings, to the
/// value MP3.
class Mp3Settings {
  /// Specify the average bitrate in bits per second.
  final int? bitrate;

  /// Specify the number of channels in this output audio track. Choosing Mono on
  /// the console gives you 1 output channel; choosing Stereo gives you 2. In the
  /// API, valid values are 1 and 2.
  final int? channels;

  /// Specify whether the service encodes this MP3 audio output with a constant
  /// bitrate (CBR) or a variable bitrate (VBR).
  final Mp3RateControlMode? rateControlMode;

  /// Sample rate in hz.
  final int? sampleRate;

  /// Required when you set Bitrate control mode (rateControlMode) to VBR. Specify
  /// the audio quality of this MP3 output from 0 (highest quality) to 9 (lowest
  /// quality).
  final int? vbrQuality;

  Mp3Settings({
    this.bitrate,
    this.channels,
    this.rateControlMode,
    this.sampleRate,
    this.vbrQuality,
  });
  factory Mp3Settings.fromJson(Map<String, dynamic> json) {
    return Mp3Settings(
      bitrate: json['bitrate'] as int?,
      channels: json['channels'] as int?,
      rateControlMode:
          (json['rateControlMode'] as String?)?.toMp3RateControlMode(),
      sampleRate: json['sampleRate'] as int?,
      vbrQuality: json['vbrQuality'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bitrate = this.bitrate;
    final channels = this.channels;
    final rateControlMode = this.rateControlMode;
    final sampleRate = this.sampleRate;
    final vbrQuality = this.vbrQuality;
    return {
      if (bitrate != null) 'bitrate': bitrate,
      if (channels != null) 'channels': channels,
      if (rateControlMode != null) 'rateControlMode': rateControlMode.toValue(),
      if (sampleRate != null) 'sampleRate': sampleRate,
      if (vbrQuality != null) 'vbrQuality': vbrQuality,
    };
  }
}

/// When enabled, file composition times will start at zero, composition times
/// in the 'ctts' (composition time to sample) box for B-frames will be
/// negative, and a 'cslg' (composition shift least greatest) box will be
/// included per 14496-1 amendment 1. This improves compatibility with Apple
/// players and tools.
enum Mp4CslgAtom {
  include,
  exclude,
}

extension on Mp4CslgAtom {
  String toValue() {
    switch (this) {
      case Mp4CslgAtom.include:
        return 'INCLUDE';
      case Mp4CslgAtom.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  Mp4CslgAtom toMp4CslgAtom() {
    switch (this) {
      case 'INCLUDE':
        return Mp4CslgAtom.include;
      case 'EXCLUDE':
        return Mp4CslgAtom.exclude;
    }
    throw Exception('$this is not known in enum Mp4CslgAtom');
  }
}

/// Inserts a free-space box immediately after the moov box.
enum Mp4FreeSpaceBox {
  include,
  exclude,
}

extension on Mp4FreeSpaceBox {
  String toValue() {
    switch (this) {
      case Mp4FreeSpaceBox.include:
        return 'INCLUDE';
      case Mp4FreeSpaceBox.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  Mp4FreeSpaceBox toMp4FreeSpaceBox() {
    switch (this) {
      case 'INCLUDE':
        return Mp4FreeSpaceBox.include;
      case 'EXCLUDE':
        return Mp4FreeSpaceBox.exclude;
    }
    throw Exception('$this is not known in enum Mp4FreeSpaceBox');
  }
}

/// If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the beginning
/// of the archive as required for progressive downloading. Otherwise it is
/// placed normally at the end.
enum Mp4MoovPlacement {
  progressiveDownload,
  normal,
}

extension on Mp4MoovPlacement {
  String toValue() {
    switch (this) {
      case Mp4MoovPlacement.progressiveDownload:
        return 'PROGRESSIVE_DOWNLOAD';
      case Mp4MoovPlacement.normal:
        return 'NORMAL';
    }
  }
}

extension on String {
  Mp4MoovPlacement toMp4MoovPlacement() {
    switch (this) {
      case 'PROGRESSIVE_DOWNLOAD':
        return Mp4MoovPlacement.progressiveDownload;
      case 'NORMAL':
        return Mp4MoovPlacement.normal;
    }
    throw Exception('$this is not known in enum Mp4MoovPlacement');
  }
}

/// Settings for MP4 container. You can create audio-only AAC outputs with this
/// container.
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
  final CmfcAudioDuration? audioDuration;

  /// When enabled, file composition times will start at zero, composition times
  /// in the 'ctts' (composition time to sample) box for B-frames will be
  /// negative, and a 'cslg' (composition shift least greatest) box will be
  /// included per 14496-1 amendment 1. This improves compatibility with Apple
  /// players and tools.
  final Mp4CslgAtom? cslgAtom;

  /// Ignore this setting unless compliance to the CTTS box version specification
  /// matters in your workflow. Specify a value of 1 to set your CTTS box version
  /// to 1 and make your output compliant with the specification. When you specify
  /// a value of 1, you must also set CSLG atom (cslgAtom) to the value INCLUDE.
  /// Keep the default value 0 to set your CTTS box version to 0. This can provide
  /// backward compatibility for some players and packagers.
  final int? cttsVersion;

  /// Inserts a free-space box immediately after the moov box.
  final Mp4FreeSpaceBox? freeSpaceBox;

  /// If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the beginning
  /// of the archive as required for progressive downloading. Otherwise it is
  /// placed normally at the end.
  final Mp4MoovPlacement? moovPlacement;

  /// Overrides the "Major Brand" field in the output file. Usually not necessary
  /// to specify.
  final String? mp4MajorBrand;

  Mp4Settings({
    this.audioDuration,
    this.cslgAtom,
    this.cttsVersion,
    this.freeSpaceBox,
    this.moovPlacement,
    this.mp4MajorBrand,
  });
  factory Mp4Settings.fromJson(Map<String, dynamic> json) {
    return Mp4Settings(
      audioDuration: (json['audioDuration'] as String?)?.toCmfcAudioDuration(),
      cslgAtom: (json['cslgAtom'] as String?)?.toMp4CslgAtom(),
      cttsVersion: json['cttsVersion'] as int?,
      freeSpaceBox: (json['freeSpaceBox'] as String?)?.toMp4FreeSpaceBox(),
      moovPlacement: (json['moovPlacement'] as String?)?.toMp4MoovPlacement(),
      mp4MajorBrand: json['mp4MajorBrand'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioDuration = this.audioDuration;
    final cslgAtom = this.cslgAtom;
    final cttsVersion = this.cttsVersion;
    final freeSpaceBox = this.freeSpaceBox;
    final moovPlacement = this.moovPlacement;
    final mp4MajorBrand = this.mp4MajorBrand;
    return {
      if (audioDuration != null) 'audioDuration': audioDuration.toValue(),
      if (cslgAtom != null) 'cslgAtom': cslgAtom.toValue(),
      if (cttsVersion != null) 'cttsVersion': cttsVersion,
      if (freeSpaceBox != null) 'freeSpaceBox': freeSpaceBox.toValue(),
      if (moovPlacement != null) 'moovPlacement': moovPlacement.toValue(),
      if (mp4MajorBrand != null) 'mp4MajorBrand': mp4MajorBrand,
    };
  }
}

/// Optional. Choose Include (INCLUDE) to have MediaConvert mark up your DASH
/// manifest with <Accessibility> elements for embedded 608 captions. This
/// markup isn't generally required, but some video players require it to
/// discover and play embedded 608 captions. Keep the default value, Exclude
/// (EXCLUDE), to leave these elements out. When you enable this setting, this
/// is the markup that MediaConvert includes in your manifest: <Accessibility
/// schemeIdUri="urn:scte:dash:cc:cea-608:2015" value="CC1=eng"/>
enum MpdAccessibilityCaptionHints {
  include,
  exclude,
}

extension on MpdAccessibilityCaptionHints {
  String toValue() {
    switch (this) {
      case MpdAccessibilityCaptionHints.include:
        return 'INCLUDE';
      case MpdAccessibilityCaptionHints.exclude:
        return 'EXCLUDE';
    }
  }
}

extension on String {
  MpdAccessibilityCaptionHints toMpdAccessibilityCaptionHints() {
    switch (this) {
      case 'INCLUDE':
        return MpdAccessibilityCaptionHints.include;
      case 'EXCLUDE':
        return MpdAccessibilityCaptionHints.exclude;
    }
    throw Exception('$this is not known in enum MpdAccessibilityCaptionHints');
  }
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
  defaultCodecDuration,
  matchVideoDuration,
}

extension on MpdAudioDuration {
  String toValue() {
    switch (this) {
      case MpdAudioDuration.defaultCodecDuration:
        return 'DEFAULT_CODEC_DURATION';
      case MpdAudioDuration.matchVideoDuration:
        return 'MATCH_VIDEO_DURATION';
    }
  }
}

extension on String {
  MpdAudioDuration toMpdAudioDuration() {
    switch (this) {
      case 'DEFAULT_CODEC_DURATION':
        return MpdAudioDuration.defaultCodecDuration;
      case 'MATCH_VIDEO_DURATION':
        return MpdAudioDuration.matchVideoDuration;
    }
    throw Exception('$this is not known in enum MpdAudioDuration');
  }
}

/// Use this setting only in DASH output groups that include sidecar TTML or
/// IMSC captions.  You specify sidecar captions in a separate output from your
/// audio and video. Choose Raw (RAW) for captions in a single XML file in a raw
/// container. Choose Fragmented MPEG-4 (FRAGMENTED_MP4) for captions in XML
/// format contained within fragmented MP4 files. This set of fragmented MP4
/// files is separate from your video and audio fragmented MP4 files.
enum MpdCaptionContainerType {
  raw,
  fragmentedMp4,
}

extension on MpdCaptionContainerType {
  String toValue() {
    switch (this) {
      case MpdCaptionContainerType.raw:
        return 'RAW';
      case MpdCaptionContainerType.fragmentedMp4:
        return 'FRAGMENTED_MP4';
    }
  }
}

extension on String {
  MpdCaptionContainerType toMpdCaptionContainerType() {
    switch (this) {
      case 'RAW':
        return MpdCaptionContainerType.raw;
      case 'FRAGMENTED_MP4':
        return MpdCaptionContainerType.fragmentedMp4;
    }
    throw Exception('$this is not known in enum MpdCaptionContainerType');
  }
}

/// Use this setting only when you specify SCTE-35 markers from ESAM. Choose
/// INSERT to put SCTE-35 markers in this output at the insertion points that
/// you specify in an ESAM XML document. Provide the document in the setting SCC
/// XML (sccXml).
enum MpdScte35Esam {
  insert,
  none,
}

extension on MpdScte35Esam {
  String toValue() {
    switch (this) {
      case MpdScte35Esam.insert:
        return 'INSERT';
      case MpdScte35Esam.none:
        return 'NONE';
    }
  }
}

extension on String {
  MpdScte35Esam toMpdScte35Esam() {
    switch (this) {
      case 'INSERT':
        return MpdScte35Esam.insert;
      case 'NONE':
        return MpdScte35Esam.none;
    }
    throw Exception('$this is not known in enum MpdScte35Esam');
  }
}

/// Ignore this setting unless you have SCTE-35 markers in your input video
/// file. Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that
/// appear in your input to also appear in this output. Choose None (NONE) if
/// you don't want those SCTE-35 markers in this output.
enum MpdScte35Source {
  passthrough,
  none,
}

extension on MpdScte35Source {
  String toValue() {
    switch (this) {
      case MpdScte35Source.passthrough:
        return 'PASSTHROUGH';
      case MpdScte35Source.none:
        return 'NONE';
    }
  }
}

extension on String {
  MpdScte35Source toMpdScte35Source() {
    switch (this) {
      case 'PASSTHROUGH':
        return MpdScte35Source.passthrough;
      case 'NONE':
        return MpdScte35Source.none;
    }
    throw Exception('$this is not known in enum MpdScte35Source');
  }
}

/// Settings for MP4 segments in DASH
class MpdSettings {
  /// Optional. Choose Include (INCLUDE) to have MediaConvert mark up your DASH
  /// manifest with <Accessibility> elements for embedded 608 captions. This
  /// markup isn't generally required, but some video players require it to
  /// discover and play embedded 608 captions. Keep the default value, Exclude
  /// (EXCLUDE), to leave these elements out. When you enable this setting, this
  /// is the markup that MediaConvert includes in your manifest: <Accessibility
  /// schemeIdUri="urn:scte:dash:cc:cea-608:2015" value="CC1=eng"/>
  final MpdAccessibilityCaptionHints? accessibilityCaptionHints;

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
  final MpdAudioDuration? audioDuration;

  /// Use this setting only in DASH output groups that include sidecar TTML or
  /// IMSC captions.  You specify sidecar captions in a separate output from your
  /// audio and video. Choose Raw (RAW) for captions in a single XML file in a raw
  /// container. Choose Fragmented MPEG-4 (FRAGMENTED_MP4) for captions in XML
  /// format contained within fragmented MP4 files. This set of fragmented MP4
  /// files is separate from your video and audio fragmented MP4 files.
  final MpdCaptionContainerType? captionContainerType;

  /// Use this setting only when you specify SCTE-35 markers from ESAM. Choose
  /// INSERT to put SCTE-35 markers in this output at the insertion points that
  /// you specify in an ESAM XML document. Provide the document in the setting SCC
  /// XML (sccXml).
  final MpdScte35Esam? scte35Esam;

  /// Ignore this setting unless you have SCTE-35 markers in your input video
  /// file. Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that
  /// appear in your input to also appear in this output. Choose None (NONE) if
  /// you don't want those SCTE-35 markers in this output.
  final MpdScte35Source? scte35Source;

  MpdSettings({
    this.accessibilityCaptionHints,
    this.audioDuration,
    this.captionContainerType,
    this.scte35Esam,
    this.scte35Source,
  });
  factory MpdSettings.fromJson(Map<String, dynamic> json) {
    return MpdSettings(
      accessibilityCaptionHints: (json['accessibilityCaptionHints'] as String?)
          ?.toMpdAccessibilityCaptionHints(),
      audioDuration: (json['audioDuration'] as String?)?.toMpdAudioDuration(),
      captionContainerType: (json['captionContainerType'] as String?)
          ?.toMpdCaptionContainerType(),
      scte35Esam: (json['scte35Esam'] as String?)?.toMpdScte35Esam(),
      scte35Source: (json['scte35Source'] as String?)?.toMpdScte35Source(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessibilityCaptionHints = this.accessibilityCaptionHints;
    final audioDuration = this.audioDuration;
    final captionContainerType = this.captionContainerType;
    final scte35Esam = this.scte35Esam;
    final scte35Source = this.scte35Source;
    return {
      if (accessibilityCaptionHints != null)
        'accessibilityCaptionHints': accessibilityCaptionHints.toValue(),
      if (audioDuration != null) 'audioDuration': audioDuration.toValue(),
      if (captionContainerType != null)
        'captionContainerType': captionContainerType.toValue(),
      if (scte35Esam != null) 'scte35Esam': scte35Esam.toValue(),
      if (scte35Source != null) 'scte35Source': scte35Source.toValue(),
    };
  }
}

/// Specify the strength of any adaptive quantization filters that you enable.
/// The value that you choose here applies to the following settings: Spatial
/// adaptive quantization (spatialAdaptiveQuantization), and Temporal adaptive
/// quantization (temporalAdaptiveQuantization).
enum Mpeg2AdaptiveQuantization {
  off,
  low,
  medium,
  high,
}

extension on Mpeg2AdaptiveQuantization {
  String toValue() {
    switch (this) {
      case Mpeg2AdaptiveQuantization.off:
        return 'OFF';
      case Mpeg2AdaptiveQuantization.low:
        return 'LOW';
      case Mpeg2AdaptiveQuantization.medium:
        return 'MEDIUM';
      case Mpeg2AdaptiveQuantization.high:
        return 'HIGH';
    }
  }
}

extension on String {
  Mpeg2AdaptiveQuantization toMpeg2AdaptiveQuantization() {
    switch (this) {
      case 'OFF':
        return Mpeg2AdaptiveQuantization.off;
      case 'LOW':
        return Mpeg2AdaptiveQuantization.low;
      case 'MEDIUM':
        return Mpeg2AdaptiveQuantization.medium;
      case 'HIGH':
        return Mpeg2AdaptiveQuantization.high;
    }
    throw Exception('$this is not known in enum Mpeg2AdaptiveQuantization');
  }
}

/// Use Level (Mpeg2CodecLevel) to set the MPEG-2 level for the video output.
enum Mpeg2CodecLevel {
  auto,
  low,
  main,
  high1440,
  high,
}

extension on Mpeg2CodecLevel {
  String toValue() {
    switch (this) {
      case Mpeg2CodecLevel.auto:
        return 'AUTO';
      case Mpeg2CodecLevel.low:
        return 'LOW';
      case Mpeg2CodecLevel.main:
        return 'MAIN';
      case Mpeg2CodecLevel.high1440:
        return 'HIGH1440';
      case Mpeg2CodecLevel.high:
        return 'HIGH';
    }
  }
}

extension on String {
  Mpeg2CodecLevel toMpeg2CodecLevel() {
    switch (this) {
      case 'AUTO':
        return Mpeg2CodecLevel.auto;
      case 'LOW':
        return Mpeg2CodecLevel.low;
      case 'MAIN':
        return Mpeg2CodecLevel.main;
      case 'HIGH1440':
        return Mpeg2CodecLevel.high1440;
      case 'HIGH':
        return Mpeg2CodecLevel.high;
    }
    throw Exception('$this is not known in enum Mpeg2CodecLevel');
  }
}

/// Use Profile (Mpeg2CodecProfile) to set the MPEG-2 profile for the video
/// output.
enum Mpeg2CodecProfile {
  main,
  profile_422,
}

extension on Mpeg2CodecProfile {
  String toValue() {
    switch (this) {
      case Mpeg2CodecProfile.main:
        return 'MAIN';
      case Mpeg2CodecProfile.profile_422:
        return 'PROFILE_422';
    }
  }
}

extension on String {
  Mpeg2CodecProfile toMpeg2CodecProfile() {
    switch (this) {
      case 'MAIN':
        return Mpeg2CodecProfile.main;
      case 'PROFILE_422':
        return Mpeg2CodecProfile.profile_422;
    }
    throw Exception('$this is not known in enum Mpeg2CodecProfile');
  }
}

/// Choose Adaptive to improve subjective video quality for high-motion content.
/// This will cause the service to use fewer B-frames (which infer information
/// based on other frames) for high-motion portions of the video and more
/// B-frames for low-motion portions. The maximum number of B-frames is limited
/// by the value you provide for the setting B frames between reference frames
/// (numberBFramesBetweenReferenceFrames).
enum Mpeg2DynamicSubGop {
  adaptive,
  static,
}

extension on Mpeg2DynamicSubGop {
  String toValue() {
    switch (this) {
      case Mpeg2DynamicSubGop.adaptive:
        return 'ADAPTIVE';
      case Mpeg2DynamicSubGop.static:
        return 'STATIC';
    }
  }
}

extension on String {
  Mpeg2DynamicSubGop toMpeg2DynamicSubGop() {
    switch (this) {
      case 'ADAPTIVE':
        return Mpeg2DynamicSubGop.adaptive;
      case 'STATIC':
        return Mpeg2DynamicSubGop.static;
    }
    throw Exception('$this is not known in enum Mpeg2DynamicSubGop');
  }
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
  initializeFromSource,
  specified,
}

extension on Mpeg2FramerateControl {
  String toValue() {
    switch (this) {
      case Mpeg2FramerateControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case Mpeg2FramerateControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  Mpeg2FramerateControl toMpeg2FramerateControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return Mpeg2FramerateControl.initializeFromSource;
      case 'SPECIFIED':
        return Mpeg2FramerateControl.specified;
    }
    throw Exception('$this is not known in enum Mpeg2FramerateControl');
  }
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
  duplicateDrop,
  interpolate,
  frameformer,
}

extension on Mpeg2FramerateConversionAlgorithm {
  String toValue() {
    switch (this) {
      case Mpeg2FramerateConversionAlgorithm.duplicateDrop:
        return 'DUPLICATE_DROP';
      case Mpeg2FramerateConversionAlgorithm.interpolate:
        return 'INTERPOLATE';
      case Mpeg2FramerateConversionAlgorithm.frameformer:
        return 'FRAMEFORMER';
    }
  }
}

extension on String {
  Mpeg2FramerateConversionAlgorithm toMpeg2FramerateConversionAlgorithm() {
    switch (this) {
      case 'DUPLICATE_DROP':
        return Mpeg2FramerateConversionAlgorithm.duplicateDrop;
      case 'INTERPOLATE':
        return Mpeg2FramerateConversionAlgorithm.interpolate;
      case 'FRAMEFORMER':
        return Mpeg2FramerateConversionAlgorithm.frameformer;
    }
    throw Exception(
        '$this is not known in enum Mpeg2FramerateConversionAlgorithm');
  }
}

/// Indicates if the GOP Size in MPEG2 is specified in frames or seconds. If
/// seconds the system will convert the GOP Size into a frame count at run time.
enum Mpeg2GopSizeUnits {
  frames,
  seconds,
}

extension on Mpeg2GopSizeUnits {
  String toValue() {
    switch (this) {
      case Mpeg2GopSizeUnits.frames:
        return 'FRAMES';
      case Mpeg2GopSizeUnits.seconds:
        return 'SECONDS';
    }
  }
}

extension on String {
  Mpeg2GopSizeUnits toMpeg2GopSizeUnits() {
    switch (this) {
      case 'FRAMES':
        return Mpeg2GopSizeUnits.frames;
      case 'SECONDS':
        return Mpeg2GopSizeUnits.seconds;
    }
    throw Exception('$this is not known in enum Mpeg2GopSizeUnits');
  }
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
  progressive,
  topField,
  bottomField,
  followTopField,
  followBottomField,
}

extension on Mpeg2InterlaceMode {
  String toValue() {
    switch (this) {
      case Mpeg2InterlaceMode.progressive:
        return 'PROGRESSIVE';
      case Mpeg2InterlaceMode.topField:
        return 'TOP_FIELD';
      case Mpeg2InterlaceMode.bottomField:
        return 'BOTTOM_FIELD';
      case Mpeg2InterlaceMode.followTopField:
        return 'FOLLOW_TOP_FIELD';
      case Mpeg2InterlaceMode.followBottomField:
        return 'FOLLOW_BOTTOM_FIELD';
    }
  }
}

extension on String {
  Mpeg2InterlaceMode toMpeg2InterlaceMode() {
    switch (this) {
      case 'PROGRESSIVE':
        return Mpeg2InterlaceMode.progressive;
      case 'TOP_FIELD':
        return Mpeg2InterlaceMode.topField;
      case 'BOTTOM_FIELD':
        return Mpeg2InterlaceMode.bottomField;
      case 'FOLLOW_TOP_FIELD':
        return Mpeg2InterlaceMode.followTopField;
      case 'FOLLOW_BOTTOM_FIELD':
        return Mpeg2InterlaceMode.followBottomField;
    }
    throw Exception('$this is not known in enum Mpeg2InterlaceMode');
  }
}

/// Use Intra DC precision (Mpeg2IntraDcPrecision) to set quantization precision
/// for intra-block DC coefficients. If you choose the value auto, the service
/// will automatically select the precision based on the per-frame compression
/// ratio.
enum Mpeg2IntraDcPrecision {
  auto,
  intraDcPrecision_8,
  intraDcPrecision_9,
  intraDcPrecision_10,
  intraDcPrecision_11,
}

extension on Mpeg2IntraDcPrecision {
  String toValue() {
    switch (this) {
      case Mpeg2IntraDcPrecision.auto:
        return 'AUTO';
      case Mpeg2IntraDcPrecision.intraDcPrecision_8:
        return 'INTRA_DC_PRECISION_8';
      case Mpeg2IntraDcPrecision.intraDcPrecision_9:
        return 'INTRA_DC_PRECISION_9';
      case Mpeg2IntraDcPrecision.intraDcPrecision_10:
        return 'INTRA_DC_PRECISION_10';
      case Mpeg2IntraDcPrecision.intraDcPrecision_11:
        return 'INTRA_DC_PRECISION_11';
    }
  }
}

extension on String {
  Mpeg2IntraDcPrecision toMpeg2IntraDcPrecision() {
    switch (this) {
      case 'AUTO':
        return Mpeg2IntraDcPrecision.auto;
      case 'INTRA_DC_PRECISION_8':
        return Mpeg2IntraDcPrecision.intraDcPrecision_8;
      case 'INTRA_DC_PRECISION_9':
        return Mpeg2IntraDcPrecision.intraDcPrecision_9;
      case 'INTRA_DC_PRECISION_10':
        return Mpeg2IntraDcPrecision.intraDcPrecision_10;
      case 'INTRA_DC_PRECISION_11':
        return Mpeg2IntraDcPrecision.intraDcPrecision_11;
    }
    throw Exception('$this is not known in enum Mpeg2IntraDcPrecision');
  }
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
  initializeFromSource,
  specified,
}

extension on Mpeg2ParControl {
  String toValue() {
    switch (this) {
      case Mpeg2ParControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case Mpeg2ParControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  Mpeg2ParControl toMpeg2ParControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return Mpeg2ParControl.initializeFromSource;
      case 'SPECIFIED':
        return Mpeg2ParControl.specified;
    }
    throw Exception('$this is not known in enum Mpeg2ParControl');
  }
}

/// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
/// want to trade off encoding speed for output video quality. The default
/// behavior is faster, lower quality, single-pass encoding.
enum Mpeg2QualityTuningLevel {
  singlePass,
  multiPass,
}

extension on Mpeg2QualityTuningLevel {
  String toValue() {
    switch (this) {
      case Mpeg2QualityTuningLevel.singlePass:
        return 'SINGLE_PASS';
      case Mpeg2QualityTuningLevel.multiPass:
        return 'MULTI_PASS';
    }
  }
}

extension on String {
  Mpeg2QualityTuningLevel toMpeg2QualityTuningLevel() {
    switch (this) {
      case 'SINGLE_PASS':
        return Mpeg2QualityTuningLevel.singlePass;
      case 'MULTI_PASS':
        return Mpeg2QualityTuningLevel.multiPass;
    }
    throw Exception('$this is not known in enum Mpeg2QualityTuningLevel');
  }
}

/// Use Rate control mode (Mpeg2RateControlMode) to specifiy whether the bitrate
/// is variable (vbr) or constant (cbr).
enum Mpeg2RateControlMode {
  vbr,
  cbr,
}

extension on Mpeg2RateControlMode {
  String toValue() {
    switch (this) {
      case Mpeg2RateControlMode.vbr:
        return 'VBR';
      case Mpeg2RateControlMode.cbr:
        return 'CBR';
    }
  }
}

extension on String {
  Mpeg2RateControlMode toMpeg2RateControlMode() {
    switch (this) {
      case 'VBR':
        return Mpeg2RateControlMode.vbr;
      case 'CBR':
        return Mpeg2RateControlMode.cbr;
    }
    throw Exception('$this is not known in enum Mpeg2RateControlMode');
  }
}

/// Enable this setting to insert I-frames at scene changes that the service
/// automatically detects. This improves video quality and is enabled by
/// default.
enum Mpeg2SceneChangeDetect {
  disabled,
  enabled,
}

extension on Mpeg2SceneChangeDetect {
  String toValue() {
    switch (this) {
      case Mpeg2SceneChangeDetect.disabled:
        return 'DISABLED';
      case Mpeg2SceneChangeDetect.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  Mpeg2SceneChangeDetect toMpeg2SceneChangeDetect() {
    switch (this) {
      case 'DISABLED':
        return Mpeg2SceneChangeDetect.disabled;
      case 'ENABLED':
        return Mpeg2SceneChangeDetect.enabled;
    }
    throw Exception('$this is not known in enum Mpeg2SceneChangeDetect');
  }
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value MPEG2.
class Mpeg2Settings {
  /// Specify the strength of any adaptive quantization filters that you enable.
  /// The value that you choose here applies to the following settings: Spatial
  /// adaptive quantization (spatialAdaptiveQuantization), and Temporal adaptive
  /// quantization (temporalAdaptiveQuantization).
  final Mpeg2AdaptiveQuantization? adaptiveQuantization;

  /// Specify the average bitrate in bits per second. Required for VBR and CBR.
  /// For MS Smooth outputs, bitrates must be unique when rounded down to the
  /// nearest multiple of 1000.
  final int? bitrate;

  /// Use Level (Mpeg2CodecLevel) to set the MPEG-2 level for the video output.
  final Mpeg2CodecLevel? codecLevel;

  /// Use Profile (Mpeg2CodecProfile) to set the MPEG-2 profile for the video
  /// output.
  final Mpeg2CodecProfile? codecProfile;

  /// Choose Adaptive to improve subjective video quality for high-motion content.
  /// This will cause the service to use fewer B-frames (which infer information
  /// based on other frames) for high-motion portions of the video and more
  /// B-frames for low-motion portions. The maximum number of B-frames is limited
  /// by the value you provide for the setting B frames between reference frames
  /// (numberBFramesBetweenReferenceFrames).
  final Mpeg2DynamicSubGop? dynamicSubGop;

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
  final Mpeg2FramerateControl? framerateControl;

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
  final Mpeg2FramerateConversionAlgorithm? framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  final int? framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  final int? framerateNumerator;

  /// Frequency of closed GOPs. In streaming applications, it is recommended that
  /// this be set to 1 so a decoder joining mid-stream will receive an IDR frame
  /// as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  final int? gopClosedCadence;

  /// GOP Length (keyframe interval) in frames or seconds. Must be greater than
  /// zero.
  final double? gopSize;

  /// Indicates if the GOP Size in MPEG2 is specified in frames or seconds. If
  /// seconds the system will convert the GOP Size into a frame count at run time.
  final Mpeg2GopSizeUnits? gopSizeUnits;

  /// Percentage of the buffer that should initially be filled (HRD buffer model).
  final int? hrdBufferInitialFillPercentage;

  /// Size of buffer (HRD buffer model) in bits. For example, enter five megabits
  /// as 5000000.
  final int? hrdBufferSize;

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
  final Mpeg2InterlaceMode? interlaceMode;

  /// Use Intra DC precision (Mpeg2IntraDcPrecision) to set quantization precision
  /// for intra-block DC coefficients. If you choose the value auto, the service
  /// will automatically select the precision based on the per-frame compression
  /// ratio.
  final Mpeg2IntraDcPrecision? intraDcPrecision;

  /// Maximum bitrate in bits/second. For example, enter five megabits per second
  /// as 5000000.
  final int? maxBitrate;

  /// Enforces separation between repeated (cadence) I-frames and I-frames
  /// inserted by Scene Change Detection. If a scene change I-frame is within
  /// I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched
  /// to the scene change I-frame. GOP stretch requires enabling lookahead as well
  /// as setting I-interval. The normal cadence resumes for the next GOP. This
  /// setting is only used when Scene Change Detect is enabled. Note: Maximum GOP
  /// stretch = GOP size + Min-I-interval - 1
  final int? minIInterval;

  /// Number of B-frames between reference frames.
  final int? numberBFramesBetweenReferenceFrames;

  /// Optional. Specify how the service determines the pixel aspect ratio (PAR)
  /// for this output. The default behavior, Follow source
  /// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
  /// output. To specify a different PAR in the console, choose any value other
  /// than Follow source. To specify a different PAR by editing the JSON job
  /// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
  /// you must also specify values for the parNumerator and parDenominator
  /// settings.
  final Mpeg2ParControl? parControl;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parDenominator is 33.
  final int? parDenominator;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parNumerator is 40.
  final int? parNumerator;

  /// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
  /// want to trade off encoding speed for output video quality. The default
  /// behavior is faster, lower quality, single-pass encoding.
  final Mpeg2QualityTuningLevel? qualityTuningLevel;

  /// Use Rate control mode (Mpeg2RateControlMode) to specifiy whether the bitrate
  /// is variable (vbr) or constant (cbr).
  final Mpeg2RateControlMode? rateControlMode;

  /// Enable this setting to insert I-frames at scene changes that the service
  /// automatically detects. This improves video quality and is enabled by
  /// default.
  final Mpeg2SceneChangeDetect? sceneChangeDetect;

  /// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
  /// second (fps). Enable slow PAL to create a 25 fps output. When you enable
  /// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
  /// your audio to keep it synchronized with the video. Note that enabling this
  /// setting will slightly reduce the duration of your video. Required settings:
  /// You must also set Framerate to 25. In your JSON job specification, set
  /// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
  /// (framerateDenominator) to 1.
  final Mpeg2SlowPal? slowPal;

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
  final int? softness;

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
  final Mpeg2SpatialAdaptiveQuantization? spatialAdaptiveQuantization;

  /// Specify whether this output's video uses the D10 syntax. Keep the default
  /// value to  not use the syntax. Related settings: When you choose D10 (D_10)
  /// for your MXF  profile (profile), you must also set this value to to D10
  /// (D_10).
  final Mpeg2Syntax? syntax;

  /// When you do frame rate conversion from 23.976 frames per second (fps) to
  /// 29.97 fps, and your output scan type is interlaced, you can optionally
  /// enable hard or soft telecine to create a smoother picture. Hard telecine
  /// (HARD) produces a 29.97i output. Soft telecine (SOFT) produces an output
  /// with a 23.976 output that signals to the video player device to do the
  /// conversion during play back. When you keep the default value, None (NONE),
  /// MediaConvert does a standard frame rate conversion to 29.97 without doing
  /// anything with the field polarity to create a smoother picture.
  final Mpeg2Telecine? telecine;

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
  final Mpeg2TemporalAdaptiveQuantization? temporalAdaptiveQuantization;

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
  factory Mpeg2Settings.fromJson(Map<String, dynamic> json) {
    return Mpeg2Settings(
      adaptiveQuantization: (json['adaptiveQuantization'] as String?)
          ?.toMpeg2AdaptiveQuantization(),
      bitrate: json['bitrate'] as int?,
      codecLevel: (json['codecLevel'] as String?)?.toMpeg2CodecLevel(),
      codecProfile: (json['codecProfile'] as String?)?.toMpeg2CodecProfile(),
      dynamicSubGop: (json['dynamicSubGop'] as String?)?.toMpeg2DynamicSubGop(),
      framerateControl:
          (json['framerateControl'] as String?)?.toMpeg2FramerateControl(),
      framerateConversionAlgorithm:
          (json['framerateConversionAlgorithm'] as String?)
              ?.toMpeg2FramerateConversionAlgorithm(),
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
      gopClosedCadence: json['gopClosedCadence'] as int?,
      gopSize: json['gopSize'] as double?,
      gopSizeUnits: (json['gopSizeUnits'] as String?)?.toMpeg2GopSizeUnits(),
      hrdBufferInitialFillPercentage:
          json['hrdBufferInitialFillPercentage'] as int?,
      hrdBufferSize: json['hrdBufferSize'] as int?,
      interlaceMode: (json['interlaceMode'] as String?)?.toMpeg2InterlaceMode(),
      intraDcPrecision:
          (json['intraDcPrecision'] as String?)?.toMpeg2IntraDcPrecision(),
      maxBitrate: json['maxBitrate'] as int?,
      minIInterval: json['minIInterval'] as int?,
      numberBFramesBetweenReferenceFrames:
          json['numberBFramesBetweenReferenceFrames'] as int?,
      parControl: (json['parControl'] as String?)?.toMpeg2ParControl(),
      parDenominator: json['parDenominator'] as int?,
      parNumerator: json['parNumerator'] as int?,
      qualityTuningLevel:
          (json['qualityTuningLevel'] as String?)?.toMpeg2QualityTuningLevel(),
      rateControlMode:
          (json['rateControlMode'] as String?)?.toMpeg2RateControlMode(),
      sceneChangeDetect:
          (json['sceneChangeDetect'] as String?)?.toMpeg2SceneChangeDetect(),
      slowPal: (json['slowPal'] as String?)?.toMpeg2SlowPal(),
      softness: json['softness'] as int?,
      spatialAdaptiveQuantization:
          (json['spatialAdaptiveQuantization'] as String?)
              ?.toMpeg2SpatialAdaptiveQuantization(),
      syntax: (json['syntax'] as String?)?.toMpeg2Syntax(),
      telecine: (json['telecine'] as String?)?.toMpeg2Telecine(),
      temporalAdaptiveQuantization:
          (json['temporalAdaptiveQuantization'] as String?)
              ?.toMpeg2TemporalAdaptiveQuantization(),
    );
  }

  Map<String, dynamic> toJson() {
    final adaptiveQuantization = this.adaptiveQuantization;
    final bitrate = this.bitrate;
    final codecLevel = this.codecLevel;
    final codecProfile = this.codecProfile;
    final dynamicSubGop = this.dynamicSubGop;
    final framerateControl = this.framerateControl;
    final framerateConversionAlgorithm = this.framerateConversionAlgorithm;
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final gopClosedCadence = this.gopClosedCadence;
    final gopSize = this.gopSize;
    final gopSizeUnits = this.gopSizeUnits;
    final hrdBufferInitialFillPercentage = this.hrdBufferInitialFillPercentage;
    final hrdBufferSize = this.hrdBufferSize;
    final interlaceMode = this.interlaceMode;
    final intraDcPrecision = this.intraDcPrecision;
    final maxBitrate = this.maxBitrate;
    final minIInterval = this.minIInterval;
    final numberBFramesBetweenReferenceFrames =
        this.numberBFramesBetweenReferenceFrames;
    final parControl = this.parControl;
    final parDenominator = this.parDenominator;
    final parNumerator = this.parNumerator;
    final qualityTuningLevel = this.qualityTuningLevel;
    final rateControlMode = this.rateControlMode;
    final sceneChangeDetect = this.sceneChangeDetect;
    final slowPal = this.slowPal;
    final softness = this.softness;
    final spatialAdaptiveQuantization = this.spatialAdaptiveQuantization;
    final syntax = this.syntax;
    final telecine = this.telecine;
    final temporalAdaptiveQuantization = this.temporalAdaptiveQuantization;
    return {
      if (adaptiveQuantization != null)
        'adaptiveQuantization': adaptiveQuantization.toValue(),
      if (bitrate != null) 'bitrate': bitrate,
      if (codecLevel != null) 'codecLevel': codecLevel.toValue(),
      if (codecProfile != null) 'codecProfile': codecProfile.toValue(),
      if (dynamicSubGop != null) 'dynamicSubGop': dynamicSubGop.toValue(),
      if (framerateControl != null)
        'framerateControl': framerateControl.toValue(),
      if (framerateConversionAlgorithm != null)
        'framerateConversionAlgorithm': framerateConversionAlgorithm.toValue(),
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
      if (gopClosedCadence != null) 'gopClosedCadence': gopClosedCadence,
      if (gopSize != null) 'gopSize': gopSize,
      if (gopSizeUnits != null) 'gopSizeUnits': gopSizeUnits.toValue(),
      if (hrdBufferInitialFillPercentage != null)
        'hrdBufferInitialFillPercentage': hrdBufferInitialFillPercentage,
      if (hrdBufferSize != null) 'hrdBufferSize': hrdBufferSize,
      if (interlaceMode != null) 'interlaceMode': interlaceMode.toValue(),
      if (intraDcPrecision != null)
        'intraDcPrecision': intraDcPrecision.toValue(),
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (minIInterval != null) 'minIInterval': minIInterval,
      if (numberBFramesBetweenReferenceFrames != null)
        'numberBFramesBetweenReferenceFrames':
            numberBFramesBetweenReferenceFrames,
      if (parControl != null) 'parControl': parControl.toValue(),
      if (parDenominator != null) 'parDenominator': parDenominator,
      if (parNumerator != null) 'parNumerator': parNumerator,
      if (qualityTuningLevel != null)
        'qualityTuningLevel': qualityTuningLevel.toValue(),
      if (rateControlMode != null) 'rateControlMode': rateControlMode.toValue(),
      if (sceneChangeDetect != null)
        'sceneChangeDetect': sceneChangeDetect.toValue(),
      if (slowPal != null) 'slowPal': slowPal.toValue(),
      if (softness != null) 'softness': softness,
      if (spatialAdaptiveQuantization != null)
        'spatialAdaptiveQuantization': spatialAdaptiveQuantization.toValue(),
      if (syntax != null) 'syntax': syntax.toValue(),
      if (telecine != null) 'telecine': telecine.toValue(),
      if (temporalAdaptiveQuantization != null)
        'temporalAdaptiveQuantization': temporalAdaptiveQuantization.toValue(),
    };
  }
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
  disabled,
  enabled,
}

extension on Mpeg2SlowPal {
  String toValue() {
    switch (this) {
      case Mpeg2SlowPal.disabled:
        return 'DISABLED';
      case Mpeg2SlowPal.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  Mpeg2SlowPal toMpeg2SlowPal() {
    switch (this) {
      case 'DISABLED':
        return Mpeg2SlowPal.disabled;
      case 'ENABLED':
        return Mpeg2SlowPal.enabled;
    }
    throw Exception('$this is not known in enum Mpeg2SlowPal');
  }
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
  disabled,
  enabled,
}

extension on Mpeg2SpatialAdaptiveQuantization {
  String toValue() {
    switch (this) {
      case Mpeg2SpatialAdaptiveQuantization.disabled:
        return 'DISABLED';
      case Mpeg2SpatialAdaptiveQuantization.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  Mpeg2SpatialAdaptiveQuantization toMpeg2SpatialAdaptiveQuantization() {
    switch (this) {
      case 'DISABLED':
        return Mpeg2SpatialAdaptiveQuantization.disabled;
      case 'ENABLED':
        return Mpeg2SpatialAdaptiveQuantization.enabled;
    }
    throw Exception(
        '$this is not known in enum Mpeg2SpatialAdaptiveQuantization');
  }
}

/// Specify whether this output's video uses the D10 syntax. Keep the default
/// value to  not use the syntax. Related settings: When you choose D10 (D_10)
/// for your MXF  profile (profile), you must also set this value to to D10
/// (D_10).
enum Mpeg2Syntax {
  $default,
  d_10,
}

extension on Mpeg2Syntax {
  String toValue() {
    switch (this) {
      case Mpeg2Syntax.$default:
        return 'DEFAULT';
      case Mpeg2Syntax.d_10:
        return 'D_10';
    }
  }
}

extension on String {
  Mpeg2Syntax toMpeg2Syntax() {
    switch (this) {
      case 'DEFAULT':
        return Mpeg2Syntax.$default;
      case 'D_10':
        return Mpeg2Syntax.d_10;
    }
    throw Exception('$this is not known in enum Mpeg2Syntax');
  }
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
  none,
  soft,
  hard,
}

extension on Mpeg2Telecine {
  String toValue() {
    switch (this) {
      case Mpeg2Telecine.none:
        return 'NONE';
      case Mpeg2Telecine.soft:
        return 'SOFT';
      case Mpeg2Telecine.hard:
        return 'HARD';
    }
  }
}

extension on String {
  Mpeg2Telecine toMpeg2Telecine() {
    switch (this) {
      case 'NONE':
        return Mpeg2Telecine.none;
      case 'SOFT':
        return Mpeg2Telecine.soft;
      case 'HARD':
        return Mpeg2Telecine.hard;
    }
    throw Exception('$this is not known in enum Mpeg2Telecine');
  }
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
  disabled,
  enabled,
}

extension on Mpeg2TemporalAdaptiveQuantization {
  String toValue() {
    switch (this) {
      case Mpeg2TemporalAdaptiveQuantization.disabled:
        return 'DISABLED';
      case Mpeg2TemporalAdaptiveQuantization.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  Mpeg2TemporalAdaptiveQuantization toMpeg2TemporalAdaptiveQuantization() {
    switch (this) {
      case 'DISABLED':
        return Mpeg2TemporalAdaptiveQuantization.disabled;
      case 'ENABLED':
        return Mpeg2TemporalAdaptiveQuantization.enabled;
    }
    throw Exception(
        '$this is not known in enum Mpeg2TemporalAdaptiveQuantization');
  }
}

/// Specify the details for each additional Microsoft Smooth Streaming manifest
/// that you want the service to generate for this output group. Each manifest
/// can reference a different subset of outputs in the group.
class MsSmoothAdditionalManifest {
  /// Specify a name modifier that the service adds to the name of this manifest
  /// to make it different from the file names of the other main manifests in the
  /// output group. For example, say that the default main manifest for your
  /// Microsoft Smooth group is film-name.ismv. If you enter "-no-premium" for
  /// this setting, then the file name the service generates for this top-level
  /// manifest is film-name-no-premium.ismv.
  final String? manifestNameModifier;

  /// Specify the outputs that you want this additional top-level manifest to
  /// reference.
  final List<String>? selectedOutputs;

  MsSmoothAdditionalManifest({
    this.manifestNameModifier,
    this.selectedOutputs,
  });
  factory MsSmoothAdditionalManifest.fromJson(Map<String, dynamic> json) {
    return MsSmoothAdditionalManifest(
      manifestNameModifier: json['manifestNameModifier'] as String?,
      selectedOutputs: (json['selectedOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final manifestNameModifier = this.manifestNameModifier;
    final selectedOutputs = this.selectedOutputs;
    return {
      if (manifestNameModifier != null)
        'manifestNameModifier': manifestNameModifier,
      if (selectedOutputs != null) 'selectedOutputs': selectedOutputs,
    };
  }
}

/// COMBINE_DUPLICATE_STREAMS combines identical audio encoding settings across
/// a Microsoft Smooth output group into a single audio stream.
enum MsSmoothAudioDeduplication {
  combineDuplicateStreams,
  none,
}

extension on MsSmoothAudioDeduplication {
  String toValue() {
    switch (this) {
      case MsSmoothAudioDeduplication.combineDuplicateStreams:
        return 'COMBINE_DUPLICATE_STREAMS';
      case MsSmoothAudioDeduplication.none:
        return 'NONE';
    }
  }
}

extension on String {
  MsSmoothAudioDeduplication toMsSmoothAudioDeduplication() {
    switch (this) {
      case 'COMBINE_DUPLICATE_STREAMS':
        return MsSmoothAudioDeduplication.combineDuplicateStreams;
      case 'NONE':
        return MsSmoothAudioDeduplication.none;
    }
    throw Exception('$this is not known in enum MsSmoothAudioDeduplication');
  }
}

/// If you are using DRM, set DRM System (MsSmoothEncryptionSettings) to specify
/// the value SpekeKeyProvider.
class MsSmoothEncryptionSettings {
  /// If your output group type is HLS, DASH, or Microsoft Smooth, use these
  /// settings when doing DRM encryption with a SPEKE-compliant key provider.  If
  /// your output group type is CMAF, use the SpekeKeyProviderCmaf settings
  /// instead.
  final SpekeKeyProvider? spekeKeyProvider;

  MsSmoothEncryptionSettings({
    this.spekeKeyProvider,
  });
  factory MsSmoothEncryptionSettings.fromJson(Map<String, dynamic> json) {
    return MsSmoothEncryptionSettings(
      spekeKeyProvider: json['spekeKeyProvider'] != null
          ? SpekeKeyProvider.fromJson(
              json['spekeKeyProvider'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final spekeKeyProvider = this.spekeKeyProvider;
    return {
      if (spekeKeyProvider != null) 'spekeKeyProvider': spekeKeyProvider,
    };
  }
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// MS_SMOOTH_GROUP_SETTINGS.
class MsSmoothGroupSettings {
  /// By default, the service creates one .ism Microsoft Smooth Streaming manifest
  /// for each Microsoft Smooth Streaming output group in your job. This default
  /// manifest references every output in the output group. To create additional
  /// manifests that reference a subset of the outputs in the output group,
  /// specify a list of them here.
  final List<MsSmoothAdditionalManifest>? additionalManifests;

  /// COMBINE_DUPLICATE_STREAMS combines identical audio encoding settings across
  /// a Microsoft Smooth output group into a single audio stream.
  final MsSmoothAudioDeduplication? audioDeduplication;

  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do not
  /// specify the base filename in the URI, the service will use the filename of
  /// the input file. If your job has multiple inputs, the service uses the
  /// filename of the first input file.
  final String? destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  final DestinationSettings? destinationSettings;

  /// If you are using DRM, set DRM System (MsSmoothEncryptionSettings) to specify
  /// the value SpekeKeyProvider.
  final MsSmoothEncryptionSettings? encryption;

  /// Use Fragment length (FragmentLength) to specify the mp4 fragment sizes in
  /// seconds. Fragment length must be compatible with GOP size and frame rate.
  final int? fragmentLength;

  /// Use Manifest encoding (MsSmoothManifestEncoding) to specify the encoding
  /// format for the server and client manifest. Valid options are utf8 and utf16.
  final MsSmoothManifestEncoding? manifestEncoding;

  MsSmoothGroupSettings({
    this.additionalManifests,
    this.audioDeduplication,
    this.destination,
    this.destinationSettings,
    this.encryption,
    this.fragmentLength,
    this.manifestEncoding,
  });
  factory MsSmoothGroupSettings.fromJson(Map<String, dynamic> json) {
    return MsSmoothGroupSettings(
      additionalManifests: (json['additionalManifests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MsSmoothAdditionalManifest.fromJson(e as Map<String, dynamic>))
          .toList(),
      audioDeduplication: (json['audioDeduplication'] as String?)
          ?.toMsSmoothAudioDeduplication(),
      destination: json['destination'] as String?,
      destinationSettings: json['destinationSettings'] != null
          ? DestinationSettings.fromJson(
              json['destinationSettings'] as Map<String, dynamic>)
          : null,
      encryption: json['encryption'] != null
          ? MsSmoothEncryptionSettings.fromJson(
              json['encryption'] as Map<String, dynamic>)
          : null,
      fragmentLength: json['fragmentLength'] as int?,
      manifestEncoding:
          (json['manifestEncoding'] as String?)?.toMsSmoothManifestEncoding(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalManifests = this.additionalManifests;
    final audioDeduplication = this.audioDeduplication;
    final destination = this.destination;
    final destinationSettings = this.destinationSettings;
    final encryption = this.encryption;
    final fragmentLength = this.fragmentLength;
    final manifestEncoding = this.manifestEncoding;
    return {
      if (additionalManifests != null)
        'additionalManifests': additionalManifests,
      if (audioDeduplication != null)
        'audioDeduplication': audioDeduplication.toValue(),
      if (destination != null) 'destination': destination,
      if (destinationSettings != null)
        'destinationSettings': destinationSettings,
      if (encryption != null) 'encryption': encryption,
      if (fragmentLength != null) 'fragmentLength': fragmentLength,
      if (manifestEncoding != null)
        'manifestEncoding': manifestEncoding.toValue(),
    };
  }
}

/// Use Manifest encoding (MsSmoothManifestEncoding) to specify the encoding
/// format for the server and client manifest. Valid options are utf8 and utf16.
enum MsSmoothManifestEncoding {
  utf8,
  utf16,
}

extension on MsSmoothManifestEncoding {
  String toValue() {
    switch (this) {
      case MsSmoothManifestEncoding.utf8:
        return 'UTF8';
      case MsSmoothManifestEncoding.utf16:
        return 'UTF16';
    }
  }
}

extension on String {
  MsSmoothManifestEncoding toMsSmoothManifestEncoding() {
    switch (this) {
      case 'UTF8':
        return MsSmoothManifestEncoding.utf8;
      case 'UTF16':
        return MsSmoothManifestEncoding.utf16;
    }
    throw Exception('$this is not known in enum MsSmoothManifestEncoding');
  }
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
  noCopy,
  copyFromVideo,
}

extension on MxfAfdSignaling {
  String toValue() {
    switch (this) {
      case MxfAfdSignaling.noCopy:
        return 'NO_COPY';
      case MxfAfdSignaling.copyFromVideo:
        return 'COPY_FROM_VIDEO';
    }
  }
}

extension on String {
  MxfAfdSignaling toMxfAfdSignaling() {
    switch (this) {
      case 'NO_COPY':
        return MxfAfdSignaling.noCopy;
      case 'COPY_FROM_VIDEO':
        return MxfAfdSignaling.copyFromVideo;
    }
    throw Exception('$this is not known in enum MxfAfdSignaling');
  }
}

/// Specify the MXF profile, also called shim, for this output. When you choose
/// Auto, MediaConvert chooses a profile based on the video codec and
/// resolution. For a list of codecs supported with each MXF profile, see
/// https://docs.aws.amazon.com/mediaconvert/latest/ug/codecs-supported-with-each-mxf-profile.html.
/// For more information about the automatic selection behavior, see
/// https://docs.aws.amazon.com/mediaconvert/latest/ug/default-automatic-selection-of-mxf-profiles.html.
enum MxfProfile {
  d_10,
  xdcam,
  op1a,
}

extension on MxfProfile {
  String toValue() {
    switch (this) {
      case MxfProfile.d_10:
        return 'D_10';
      case MxfProfile.xdcam:
        return 'XDCAM';
      case MxfProfile.op1a:
        return 'OP1A';
    }
  }
}

extension on String {
  MxfProfile toMxfProfile() {
    switch (this) {
      case 'D_10':
        return MxfProfile.d_10;
      case 'XDCAM':
        return MxfProfile.xdcam;
      case 'OP1A':
        return MxfProfile.op1a;
    }
    throw Exception('$this is not known in enum MxfProfile');
  }
}

/// MXF settings
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
  final MxfAfdSignaling? afdSignaling;

  /// Specify the MXF profile, also called shim, for this output. When you choose
  /// Auto, MediaConvert chooses a profile based on the video codec and
  /// resolution. For a list of codecs supported with each MXF profile, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/codecs-supported-with-each-mxf-profile.html.
  /// For more information about the automatic selection behavior, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/default-automatic-selection-of-mxf-profiles.html.
  final MxfProfile? profile;

  MxfSettings({
    this.afdSignaling,
    this.profile,
  });
  factory MxfSettings.fromJson(Map<String, dynamic> json) {
    return MxfSettings(
      afdSignaling: (json['afdSignaling'] as String?)?.toMxfAfdSignaling(),
      profile: (json['profile'] as String?)?.toMxfProfile(),
    );
  }

  Map<String, dynamic> toJson() {
    final afdSignaling = this.afdSignaling;
    final profile = this.profile;
    return {
      if (afdSignaling != null) 'afdSignaling': afdSignaling.toValue(),
      if (profile != null) 'profile': profile.toValue(),
    };
  }
}

/// For forensic video watermarking, MediaConvert supports Nagra NexGuard File
/// Marker watermarking. MediaConvert supports both PreRelease Content (NGPR/G2)
/// and OTT Streaming workflows.
class NexGuardFileMarkerSettings {
  /// Use the base64 license string that Nagra provides you. Enter it directly in
  /// your JSON job specification or in the console. Required when you include
  /// Nagra NexGuard File Marker watermarking (NexGuardWatermarkingSettings) in
  /// your job.
  final String? license;

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
  final int? payload;

  /// Enter one of the watermarking preset strings that Nagra provides you.
  /// Required when you include Nagra NexGuard File Marker watermarking
  /// (NexGuardWatermarkingSettings) in your job.
  final String? preset;

  /// Optional. Ignore this setting unless Nagra support directs you to specify a
  /// value. When you don't specify a value here, the Nagra NexGuard library uses
  /// its default value.
  final WatermarkingStrength? strength;

  NexGuardFileMarkerSettings({
    this.license,
    this.payload,
    this.preset,
    this.strength,
  });
  factory NexGuardFileMarkerSettings.fromJson(Map<String, dynamic> json) {
    return NexGuardFileMarkerSettings(
      license: json['license'] as String?,
      payload: json['payload'] as int?,
      preset: json['preset'] as String?,
      strength: (json['strength'] as String?)?.toWatermarkingStrength(),
    );
  }

  Map<String, dynamic> toJson() {
    final license = this.license;
    final payload = this.payload;
    final preset = this.preset;
    final strength = this.strength;
    return {
      if (license != null) 'license': license,
      if (payload != null) 'payload': payload,
      if (preset != null) 'preset': preset,
      if (strength != null) 'strength': strength.toValue(),
    };
  }
}

/// Choose the type of Nielsen watermarks that you want in your outputs. When
/// you choose NAES 2 and NW (NAES2_AND_NW), you must provide a value for the
/// setting SID (sourceId). When you choose CBET (CBET), you must provide a
/// value for the setting CSID (cbetSourceId). When you choose NAES 2, NW, and
/// CBET (NAES2_AND_NW_AND_CBET), you must provide values for both of these
/// settings.
enum NielsenActiveWatermarkProcessType {
  naes2AndNw,
  cbet,
  naes2AndNwAndCbet,
}

extension on NielsenActiveWatermarkProcessType {
  String toValue() {
    switch (this) {
      case NielsenActiveWatermarkProcessType.naes2AndNw:
        return 'NAES2_AND_NW';
      case NielsenActiveWatermarkProcessType.cbet:
        return 'CBET';
      case NielsenActiveWatermarkProcessType.naes2AndNwAndCbet:
        return 'NAES2_AND_NW_AND_CBET';
    }
  }
}

extension on String {
  NielsenActiveWatermarkProcessType toNielsenActiveWatermarkProcessType() {
    switch (this) {
      case 'NAES2_AND_NW':
        return NielsenActiveWatermarkProcessType.naes2AndNw;
      case 'CBET':
        return NielsenActiveWatermarkProcessType.cbet;
      case 'NAES2_AND_NW_AND_CBET':
        return NielsenActiveWatermarkProcessType.naes2AndNwAndCbet;
    }
    throw Exception(
        '$this is not known in enum NielsenActiveWatermarkProcessType');
  }
}

/// Settings for your Nielsen configuration. If you don't do Nielsen measurement
/// and analytics, ignore these settings. When you enable Nielsen configuration
/// (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all
/// outputs in the job. To enable Nielsen configuration programmatically,
/// include an instance of nielsenConfiguration in your JSON job specification.
/// Even if you don't include any children of nielsenConfiguration, you still
/// enable the setting.
class NielsenConfiguration {
  /// Nielsen has discontinued the use of breakout code functionality. If you must
  /// include this property, set the value to zero.
  final int? breakoutCode;

  /// Use Distributor ID (DistributorID) to specify the distributor ID that is
  /// assigned to your organization by Neilsen.
  final String? distributorId;

  NielsenConfiguration({
    this.breakoutCode,
    this.distributorId,
  });
  factory NielsenConfiguration.fromJson(Map<String, dynamic> json) {
    return NielsenConfiguration(
      breakoutCode: json['breakoutCode'] as int?,
      distributorId: json['distributorId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final breakoutCode = this.breakoutCode;
    final distributorId = this.distributorId;
    return {
      if (breakoutCode != null) 'breakoutCode': breakoutCode,
      if (distributorId != null) 'distributorId': distributorId,
    };
  }
}

/// Ignore these settings unless you are using Nielsen non-linear watermarking.
/// Specify the values that  MediaConvert uses to generate and place Nielsen
/// watermarks in your output audio. In addition to  specifying these values,
/// you also need to set up your cloud TIC server. These settings apply to
/// every output in your job. The MediaConvert implementation is currently with
/// the following Nielsen versions: Nielsen Watermark SDK Version 5.2.1 Nielsen
/// NLM Watermark Engine Version 1.2.7 Nielsen Watermark Authenticator [SID_TIC]
/// Version [5.0.0]
class NielsenNonLinearWatermarkSettings {
  /// Choose the type of Nielsen watermarks that you want in your outputs. When
  /// you choose NAES 2 and NW (NAES2_AND_NW), you must provide a value for the
  /// setting SID (sourceId). When you choose CBET (CBET), you must provide a
  /// value for the setting CSID (cbetSourceId). When you choose NAES 2, NW, and
  /// CBET (NAES2_AND_NW_AND_CBET), you must provide values for both of these
  /// settings.
  final NielsenActiveWatermarkProcessType? activeWatermarkProcess;

  /// Optional. Use this setting when you want the service to include an ADI file
  /// in the Nielsen  metadata .zip file. To provide an ADI file, store it in
  /// Amazon S3 and provide a URL to it  here. The URL should be in the following
  /// format: S3://bucket/path/ADI-file. For more information about the metadata
  /// .zip file, see the setting Metadata destination (metadataDestination).
  final String? adiFilename;

  /// Use the asset ID that you provide to Nielsen to uniquely identify this
  /// asset. Required for all Nielsen non-linear watermarking.
  final String? assetId;

  /// Use the asset name that you provide to Nielsen for this asset. Required for
  /// all Nielsen non-linear watermarking.
  final String? assetName;

  /// Use the CSID that Nielsen provides to you. This CBET source ID should be
  /// unique to your Nielsen account but common to all of your output assets that
  /// have CBET watermarking. Required when you choose a value for the setting
  /// Watermark types (ActiveWatermarkProcess) that includes CBET.
  final String? cbetSourceId;

  /// Optional. If this asset uses an episode ID with Nielsen, provide it here.
  final String? episodeId;

  /// Specify the Amazon S3 location where you want MediaConvert to save your
  /// Nielsen non-linear metadata .zip file. This Amazon S3 bucket must be in the
  /// same Region as the one where you do your MediaConvert transcoding. If you
  /// want to include an ADI file in this .zip file, use the setting ADI file
  /// (adiFilename) to specify it. MediaConvert delivers the Nielsen metadata .zip
  /// files only to your metadata destination Amazon S3 bucket. It doesn't deliver
  /// the .zip files to Nielsen. You are responsible for delivering the metadata
  /// .zip files to Nielsen.
  final String? metadataDestination;

  /// Use the SID that Nielsen provides to you. This source ID should be unique to
  /// your Nielsen account but common to all of your output assets. Required for
  /// all Nielsen non-linear watermarking. This ID should be unique to your
  /// Nielsen account but common to all of your output assets. Required for all
  /// Nielsen non-linear watermarking.
  final int? sourceId;

  /// Required. Specify whether your source content already contains Nielsen
  /// non-linear watermarks. When you set this value to Watermarked (WATERMARKED),
  /// the service fails the job. Nielsen requires that you add non-linear
  /// watermarking to only clean content that doesn't already  have non-linear
  /// Nielsen watermarks.
  final NielsenSourceWatermarkStatusType? sourceWatermarkStatus;

  /// Specify the endpoint for the TIC server that you have deployed and
  /// configured in the AWS Cloud. Required for all Nielsen non-linear
  /// watermarking. MediaConvert can't connect directly to a TIC server. Instead,
  /// you must use API Gateway to provide a RESTful interface between MediaConvert
  /// and a TIC server that you deploy in your AWS account. For more information
  /// on deploying a TIC server in your AWS account and the required API Gateway,
  /// contact Nielsen support.
  final String? ticServerUrl;

  /// To create assets that have the same TIC values in each audio track, keep the
  /// default value Share TICs (SAME_TICS_PER_TRACK). To create assets that have
  /// unique TIC values for each audio track, choose Use unique TICs
  /// (RESERVE_UNIQUE_TICS_PER_TRACK).
  final NielsenUniqueTicPerAudioTrackType? uniqueTicPerAudioTrack;

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
      Map<String, dynamic> json) {
    return NielsenNonLinearWatermarkSettings(
      activeWatermarkProcess: (json['activeWatermarkProcess'] as String?)
          ?.toNielsenActiveWatermarkProcessType(),
      adiFilename: json['adiFilename'] as String?,
      assetId: json['assetId'] as String?,
      assetName: json['assetName'] as String?,
      cbetSourceId: json['cbetSourceId'] as String?,
      episodeId: json['episodeId'] as String?,
      metadataDestination: json['metadataDestination'] as String?,
      sourceId: json['sourceId'] as int?,
      sourceWatermarkStatus: (json['sourceWatermarkStatus'] as String?)
          ?.toNielsenSourceWatermarkStatusType(),
      ticServerUrl: json['ticServerUrl'] as String?,
      uniqueTicPerAudioTrack: (json['uniqueTicPerAudioTrack'] as String?)
          ?.toNielsenUniqueTicPerAudioTrackType(),
    );
  }

  Map<String, dynamic> toJson() {
    final activeWatermarkProcess = this.activeWatermarkProcess;
    final adiFilename = this.adiFilename;
    final assetId = this.assetId;
    final assetName = this.assetName;
    final cbetSourceId = this.cbetSourceId;
    final episodeId = this.episodeId;
    final metadataDestination = this.metadataDestination;
    final sourceId = this.sourceId;
    final sourceWatermarkStatus = this.sourceWatermarkStatus;
    final ticServerUrl = this.ticServerUrl;
    final uniqueTicPerAudioTrack = this.uniqueTicPerAudioTrack;
    return {
      if (activeWatermarkProcess != null)
        'activeWatermarkProcess': activeWatermarkProcess.toValue(),
      if (adiFilename != null) 'adiFilename': adiFilename,
      if (assetId != null) 'assetId': assetId,
      if (assetName != null) 'assetName': assetName,
      if (cbetSourceId != null) 'cbetSourceId': cbetSourceId,
      if (episodeId != null) 'episodeId': episodeId,
      if (metadataDestination != null)
        'metadataDestination': metadataDestination,
      if (sourceId != null) 'sourceId': sourceId,
      if (sourceWatermarkStatus != null)
        'sourceWatermarkStatus': sourceWatermarkStatus.toValue(),
      if (ticServerUrl != null) 'ticServerUrl': ticServerUrl,
      if (uniqueTicPerAudioTrack != null)
        'uniqueTicPerAudioTrack': uniqueTicPerAudioTrack.toValue(),
    };
  }
}

/// Required. Specify whether your source content already contains Nielsen
/// non-linear watermarks. When you set this value to Watermarked (WATERMARKED),
/// the service fails the job. Nielsen requires that you add non-linear
/// watermarking to only clean content that doesn't already  have non-linear
/// Nielsen watermarks.
enum NielsenSourceWatermarkStatusType {
  clean,
  watermarked,
}

extension on NielsenSourceWatermarkStatusType {
  String toValue() {
    switch (this) {
      case NielsenSourceWatermarkStatusType.clean:
        return 'CLEAN';
      case NielsenSourceWatermarkStatusType.watermarked:
        return 'WATERMARKED';
    }
  }
}

extension on String {
  NielsenSourceWatermarkStatusType toNielsenSourceWatermarkStatusType() {
    switch (this) {
      case 'CLEAN':
        return NielsenSourceWatermarkStatusType.clean;
      case 'WATERMARKED':
        return NielsenSourceWatermarkStatusType.watermarked;
    }
    throw Exception(
        '$this is not known in enum NielsenSourceWatermarkStatusType');
  }
}

/// To create assets that have the same TIC values in each audio track, keep the
/// default value Share TICs (SAME_TICS_PER_TRACK). To create assets that have
/// unique TIC values for each audio track, choose Use unique TICs
/// (RESERVE_UNIQUE_TICS_PER_TRACK).
enum NielsenUniqueTicPerAudioTrackType {
  reserveUniqueTicsPerTrack,
  sameTicsPerTrack,
}

extension on NielsenUniqueTicPerAudioTrackType {
  String toValue() {
    switch (this) {
      case NielsenUniqueTicPerAudioTrackType.reserveUniqueTicsPerTrack:
        return 'RESERVE_UNIQUE_TICS_PER_TRACK';
      case NielsenUniqueTicPerAudioTrackType.sameTicsPerTrack:
        return 'SAME_TICS_PER_TRACK';
    }
  }
}

extension on String {
  NielsenUniqueTicPerAudioTrackType toNielsenUniqueTicPerAudioTrackType() {
    switch (this) {
      case 'RESERVE_UNIQUE_TICS_PER_TRACK':
        return NielsenUniqueTicPerAudioTrackType.reserveUniqueTicsPerTrack;
      case 'SAME_TICS_PER_TRACK':
        return NielsenUniqueTicPerAudioTrackType.sameTicsPerTrack;
    }
    throw Exception(
        '$this is not known in enum NielsenUniqueTicPerAudioTrackType');
  }
}

/// Optional. When you set Noise reducer (noiseReducer) to Temporal (TEMPORAL),
/// you can use this setting to apply sharpening. The default behavior, Auto
/// (AUTO), allows the transcoder to determine whether to apply filtering,
/// depending on input type and quality. When you set Noise reducer to Temporal,
/// your output bandwidth is reduced. When Post temporal sharpening is also
/// enabled, that bandwidth reduction is smaller.
enum NoiseFilterPostTemporalSharpening {
  disabled,
  enabled,
  auto,
}

extension on NoiseFilterPostTemporalSharpening {
  String toValue() {
    switch (this) {
      case NoiseFilterPostTemporalSharpening.disabled:
        return 'DISABLED';
      case NoiseFilterPostTemporalSharpening.enabled:
        return 'ENABLED';
      case NoiseFilterPostTemporalSharpening.auto:
        return 'AUTO';
    }
  }
}

extension on String {
  NoiseFilterPostTemporalSharpening toNoiseFilterPostTemporalSharpening() {
    switch (this) {
      case 'DISABLED':
        return NoiseFilterPostTemporalSharpening.disabled;
      case 'ENABLED':
        return NoiseFilterPostTemporalSharpening.enabled;
      case 'AUTO':
        return NoiseFilterPostTemporalSharpening.auto;
    }
    throw Exception(
        '$this is not known in enum NoiseFilterPostTemporalSharpening');
  }
}

/// Enable the Noise reducer (NoiseReducer) feature to remove noise from your
/// video output if necessary. Enable or disable this feature for each output
/// individually. This setting is disabled by default. When you enable Noise
/// reducer (NoiseReducer), you must also select a value for Noise reducer
/// filter (NoiseReducerFilter).
class NoiseReducer {
  /// Use Noise reducer filter (NoiseReducerFilter) to select one of the following
  /// spatial image filtering functions. To use this setting, you must also enable
  /// Noise reducer (NoiseReducer). * Bilateral preserves edges while reducing
  /// noise. * Mean (softest), Gaussian, Lanczos, and Sharpen (sharpest) do
  /// convolution filtering. * Conserve does min/max noise reduction. * Spatial
  /// does frequency-domain filtering based on JND principles. * Temporal
  /// optimizes video quality for complex motion.
  final NoiseReducerFilter? filter;

  /// Settings for a noise reducer filter
  final NoiseReducerFilterSettings? filterSettings;

  /// Noise reducer filter settings for spatial filter.
  final NoiseReducerSpatialFilterSettings? spatialFilterSettings;

  /// Noise reducer filter settings for temporal filter.
  final NoiseReducerTemporalFilterSettings? temporalFilterSettings;

  NoiseReducer({
    this.filter,
    this.filterSettings,
    this.spatialFilterSettings,
    this.temporalFilterSettings,
  });
  factory NoiseReducer.fromJson(Map<String, dynamic> json) {
    return NoiseReducer(
      filter: (json['filter'] as String?)?.toNoiseReducerFilter(),
      filterSettings: json['filterSettings'] != null
          ? NoiseReducerFilterSettings.fromJson(
              json['filterSettings'] as Map<String, dynamic>)
          : null,
      spatialFilterSettings: json['spatialFilterSettings'] != null
          ? NoiseReducerSpatialFilterSettings.fromJson(
              json['spatialFilterSettings'] as Map<String, dynamic>)
          : null,
      temporalFilterSettings: json['temporalFilterSettings'] != null
          ? NoiseReducerTemporalFilterSettings.fromJson(
              json['temporalFilterSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final filterSettings = this.filterSettings;
    final spatialFilterSettings = this.spatialFilterSettings;
    final temporalFilterSettings = this.temporalFilterSettings;
    return {
      if (filter != null) 'filter': filter.toValue(),
      if (filterSettings != null) 'filterSettings': filterSettings,
      if (spatialFilterSettings != null)
        'spatialFilterSettings': spatialFilterSettings,
      if (temporalFilterSettings != null)
        'temporalFilterSettings': temporalFilterSettings,
    };
  }
}

/// Use Noise reducer filter (NoiseReducerFilter) to select one of the following
/// spatial image filtering functions. To use this setting, you must also enable
/// Noise reducer (NoiseReducer). * Bilateral preserves edges while reducing
/// noise. * Mean (softest), Gaussian, Lanczos, and Sharpen (sharpest) do
/// convolution filtering. * Conserve does min/max noise reduction. * Spatial
/// does frequency-domain filtering based on JND principles. * Temporal
/// optimizes video quality for complex motion.
enum NoiseReducerFilter {
  bilateral,
  mean,
  gaussian,
  lanczos,
  sharpen,
  conserve,
  spatial,
  temporal,
}

extension on NoiseReducerFilter {
  String toValue() {
    switch (this) {
      case NoiseReducerFilter.bilateral:
        return 'BILATERAL';
      case NoiseReducerFilter.mean:
        return 'MEAN';
      case NoiseReducerFilter.gaussian:
        return 'GAUSSIAN';
      case NoiseReducerFilter.lanczos:
        return 'LANCZOS';
      case NoiseReducerFilter.sharpen:
        return 'SHARPEN';
      case NoiseReducerFilter.conserve:
        return 'CONSERVE';
      case NoiseReducerFilter.spatial:
        return 'SPATIAL';
      case NoiseReducerFilter.temporal:
        return 'TEMPORAL';
    }
  }
}

extension on String {
  NoiseReducerFilter toNoiseReducerFilter() {
    switch (this) {
      case 'BILATERAL':
        return NoiseReducerFilter.bilateral;
      case 'MEAN':
        return NoiseReducerFilter.mean;
      case 'GAUSSIAN':
        return NoiseReducerFilter.gaussian;
      case 'LANCZOS':
        return NoiseReducerFilter.lanczos;
      case 'SHARPEN':
        return NoiseReducerFilter.sharpen;
      case 'CONSERVE':
        return NoiseReducerFilter.conserve;
      case 'SPATIAL':
        return NoiseReducerFilter.spatial;
      case 'TEMPORAL':
        return NoiseReducerFilter.temporal;
    }
    throw Exception('$this is not known in enum NoiseReducerFilter');
  }
}

/// Settings for a noise reducer filter
class NoiseReducerFilterSettings {
  /// Relative strength of noise reducing filter. Higher values produce stronger
  /// filtering.
  final int? strength;

  NoiseReducerFilterSettings({
    this.strength,
  });
  factory NoiseReducerFilterSettings.fromJson(Map<String, dynamic> json) {
    return NoiseReducerFilterSettings(
      strength: json['strength'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final strength = this.strength;
    return {
      if (strength != null) 'strength': strength,
    };
  }
}

/// Noise reducer filter settings for spatial filter.
class NoiseReducerSpatialFilterSettings {
  /// Specify strength of post noise reduction sharpening filter, with 0 disabling
  /// the filter and 3 enabling it at maximum strength.
  final int? postFilterSharpenStrength;

  /// The speed of the filter, from -2 (lower speed) to 3 (higher speed), with 0
  /// being the nominal value.
  final int? speed;

  /// Relative strength of noise reducing filter. Higher values produce stronger
  /// filtering.
  final int? strength;

  NoiseReducerSpatialFilterSettings({
    this.postFilterSharpenStrength,
    this.speed,
    this.strength,
  });
  factory NoiseReducerSpatialFilterSettings.fromJson(
      Map<String, dynamic> json) {
    return NoiseReducerSpatialFilterSettings(
      postFilterSharpenStrength: json['postFilterSharpenStrength'] as int?,
      speed: json['speed'] as int?,
      strength: json['strength'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final postFilterSharpenStrength = this.postFilterSharpenStrength;
    final speed = this.speed;
    final strength = this.strength;
    return {
      if (postFilterSharpenStrength != null)
        'postFilterSharpenStrength': postFilterSharpenStrength,
      if (speed != null) 'speed': speed,
      if (strength != null) 'strength': strength,
    };
  }
}

/// Noise reducer filter settings for temporal filter.
class NoiseReducerTemporalFilterSettings {
  /// Use Aggressive mode for content that has complex motion. Higher values
  /// produce stronger temporal filtering. This filters highly complex scenes more
  /// aggressively and creates better VQ for low bitrate outputs.
  final int? aggressiveMode;

  /// Optional. When you set Noise reducer (noiseReducer) to Temporal (TEMPORAL),
  /// you can use this setting to apply sharpening. The default behavior, Auto
  /// (AUTO), allows the transcoder to determine whether to apply filtering,
  /// depending on input type and quality. When you set Noise reducer to Temporal,
  /// your output bandwidth is reduced. When Post temporal sharpening is also
  /// enabled, that bandwidth reduction is smaller.
  final NoiseFilterPostTemporalSharpening? postTemporalSharpening;

  /// The speed of the filter (higher number is faster). Low setting reduces bit
  /// rate at the cost of transcode time, high setting improves transcode time at
  /// the cost of bit rate.
  final int? speed;

  /// Specify the strength of the noise reducing filter on this output. Higher
  /// values produce stronger filtering. We recommend the following value ranges,
  /// depending on the result that you want: * 0-2 for complexity reduction with
  /// minimal sharpness loss * 2-8 for complexity reduction with image
  /// preservation * 8-16 for a high level of complexity reduction
  final int? strength;

  NoiseReducerTemporalFilterSettings({
    this.aggressiveMode,
    this.postTemporalSharpening,
    this.speed,
    this.strength,
  });
  factory NoiseReducerTemporalFilterSettings.fromJson(
      Map<String, dynamic> json) {
    return NoiseReducerTemporalFilterSettings(
      aggressiveMode: json['aggressiveMode'] as int?,
      postTemporalSharpening: (json['postTemporalSharpening'] as String?)
          ?.toNoiseFilterPostTemporalSharpening(),
      speed: json['speed'] as int?,
      strength: json['strength'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggressiveMode = this.aggressiveMode;
    final postTemporalSharpening = this.postTemporalSharpening;
    final speed = this.speed;
    final strength = this.strength;
    return {
      if (aggressiveMode != null) 'aggressiveMode': aggressiveMode,
      if (postTemporalSharpening != null)
        'postTemporalSharpening': postTemporalSharpening.toValue(),
      if (speed != null) 'speed': speed,
      if (strength != null) 'strength': strength,
    };
  }
}

/// Required when you set Codec, under AudioDescriptions>CodecSettings, to the
/// value OPUS.
class OpusSettings {
  /// Optional. Specify the average bitrate in bits per second. Valid values are
  /// multiples of 8000, from 32000 through 192000. The default value is 96000,
  /// which we recommend for quality and bandwidth.
  final int? bitrate;

  /// Specify the number of channels in this output audio track. Choosing Mono on
  /// the console gives you 1 output channel; choosing Stereo gives you 2. In the
  /// API, valid values are 1 and 2.
  final int? channels;

  /// Optional. Sample rate in hz. Valid values are 16000, 24000, and 48000. The
  /// default value is 48000.
  final int? sampleRate;

  OpusSettings({
    this.bitrate,
    this.channels,
    this.sampleRate,
  });
  factory OpusSettings.fromJson(Map<String, dynamic> json) {
    return OpusSettings(
      bitrate: json['bitrate'] as int?,
      channels: json['channels'] as int?,
      sampleRate: json['sampleRate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bitrate = this.bitrate;
    final channels = this.channels;
    final sampleRate = this.sampleRate;
    return {
      if (bitrate != null) 'bitrate': bitrate,
      if (channels != null) 'channels': channels,
      if (sampleRate != null) 'sampleRate': sampleRate,
    };
  }
}

/// Optional. When you request lists of resources, you can specify whether they
/// are sorted in ASCENDING or DESCENDING order. Default varies by resource.
enum Order {
  ascending,
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
  }
}

extension on String {
  Order toOrder() {
    switch (this) {
      case 'ASCENDING':
        return Order.ascending;
      case 'DESCENDING':
        return Order.descending;
    }
    throw Exception('$this is not known in enum Order');
  }
}

/// An output object describes the settings for a single output file or stream
/// in an output group.
class Output {
  /// (AudioDescriptions) contains groups of audio encoding settings organized by
  /// audio codec. Include one instance of (AudioDescriptions) per output.
  /// (AudioDescriptions) can contain multiple groups of encoding settings.
  final List<AudioDescription>? audioDescriptions;

  /// (CaptionDescriptions) contains groups of captions settings. For each output
  /// that has captions, include one instance of (CaptionDescriptions).
  /// (CaptionDescriptions) can contain multiple groups of captions settings.
  final List<CaptionDescription>? captionDescriptions;

  /// Container specific settings.
  final ContainerSettings? containerSettings;

  /// Use Extension (Extension) to specify the file extension for outputs in File
  /// output groups. If you do not specify a value, the service will use default
  /// extensions by container type as follows * MPEG-2 transport stream, m2ts *
  /// Quicktime, mov * MXF container, mxf * MPEG-4 container, mp4 * WebM
  /// container, webm * No Container, the service will use codec extensions (e.g.
  /// AAC, H265, H265, AC3)
  final String? extension;

  /// Use Name modifier (NameModifier) to have the service add a string to the end
  /// of each output filename. You specify the base filename as part of your
  /// destination URI. When you create multiple outputs in the same output group,
  /// Name modifier (NameModifier) is required. Name modifier also accepts format
  /// identifiers. For DASH ISO outputs, if you use the format identifiers
  /// $Number$ or $Time$ in one output, you must use them in the same way in all
  /// outputs of the output group.
  final String? nameModifier;

  /// Specific settings for this type of output.
  final OutputSettings? outputSettings;

  /// Use Preset (Preset) to specifiy a preset for your transcoding settings.
  /// Provide the system or custom preset name. You can specify either Preset
  /// (Preset) or Container settings (ContainerSettings), but not both.
  final String? preset;

  /// (VideoDescription) contains a group of video encoding settings. The specific
  /// video settings depend on the video codec that you choose when you specify a
  /// value for Video codec (codec). Include one instance of (VideoDescription)
  /// per output.
  final VideoDescription? videoDescription;

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
  factory Output.fromJson(Map<String, dynamic> json) {
    return Output(
      audioDescriptions: (json['audioDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => AudioDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      captionDescriptions: (json['captionDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => CaptionDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      containerSettings: json['containerSettings'] != null
          ? ContainerSettings.fromJson(
              json['containerSettings'] as Map<String, dynamic>)
          : null,
      extension: json['extension'] as String?,
      nameModifier: json['nameModifier'] as String?,
      outputSettings: json['outputSettings'] != null
          ? OutputSettings.fromJson(
              json['outputSettings'] as Map<String, dynamic>)
          : null,
      preset: json['preset'] as String?,
      videoDescription: json['videoDescription'] != null
          ? VideoDescription.fromJson(
              json['videoDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioDescriptions = this.audioDescriptions;
    final captionDescriptions = this.captionDescriptions;
    final containerSettings = this.containerSettings;
    final extension = this.extension;
    final nameModifier = this.nameModifier;
    final outputSettings = this.outputSettings;
    final preset = this.preset;
    final videoDescription = this.videoDescription;
    return {
      if (audioDescriptions != null) 'audioDescriptions': audioDescriptions,
      if (captionDescriptions != null)
        'captionDescriptions': captionDescriptions,
      if (containerSettings != null) 'containerSettings': containerSettings,
      if (extension != null) 'extension': extension,
      if (nameModifier != null) 'nameModifier': nameModifier,
      if (outputSettings != null) 'outputSettings': outputSettings,
      if (preset != null) 'preset': preset,
      if (videoDescription != null) 'videoDescription': videoDescription,
    };
  }
}

/// OutputChannel mapping settings.
class OutputChannelMapping {
  /// List of input channels
  final List<int>? inputChannels;

  OutputChannelMapping({
    this.inputChannels,
  });
  factory OutputChannelMapping.fromJson(Map<String, dynamic> json) {
    return OutputChannelMapping(
      inputChannels: (json['inputChannels'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final inputChannels = this.inputChannels;
    return {
      if (inputChannels != null) 'inputChannels': inputChannels,
    };
  }
}

/// Details regarding output
class OutputDetail {
  /// Duration in milliseconds
  final int? durationInMs;

  /// Contains details about the output's video stream
  final VideoDetail? videoDetails;

  OutputDetail({
    this.durationInMs,
    this.videoDetails,
  });
  factory OutputDetail.fromJson(Map<String, dynamic> json) {
    return OutputDetail(
      durationInMs: json['durationInMs'] as int?,
      videoDetails: json['videoDetails'] != null
          ? VideoDetail.fromJson(json['videoDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Group of outputs
class OutputGroup {
  /// Use automated encoding to have MediaConvert choose your encoding settings
  /// for you, based on characteristics of your input video.
  final AutomatedEncodingSettings? automatedEncodingSettings;

  /// Use Custom Group Name (CustomName) to specify a name for the output group.
  /// This value is displayed on the console and can make your job settings JSON
  /// more human-readable. It does not affect your outputs. Use up to twelve
  /// characters that are either letters, numbers, spaces, or underscores.
  final String? customName;

  /// Name of the output group
  final String? name;

  /// Output Group settings, including type
  final OutputGroupSettings? outputGroupSettings;

  /// This object holds groups of encoding settings, one group of settings per
  /// output.
  final List<Output>? outputs;

  OutputGroup({
    this.automatedEncodingSettings,
    this.customName,
    this.name,
    this.outputGroupSettings,
    this.outputs,
  });
  factory OutputGroup.fromJson(Map<String, dynamic> json) {
    return OutputGroup(
      automatedEncodingSettings: json['automatedEncodingSettings'] != null
          ? AutomatedEncodingSettings.fromJson(
              json['automatedEncodingSettings'] as Map<String, dynamic>)
          : null,
      customName: json['customName'] as String?,
      name: json['name'] as String?,
      outputGroupSettings: json['outputGroupSettings'] != null
          ? OutputGroupSettings.fromJson(
              json['outputGroupSettings'] as Map<String, dynamic>)
          : null,
      outputs: (json['outputs'] as List?)
          ?.whereNotNull()
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final automatedEncodingSettings = this.automatedEncodingSettings;
    final customName = this.customName;
    final name = this.name;
    final outputGroupSettings = this.outputGroupSettings;
    final outputs = this.outputs;
    return {
      if (automatedEncodingSettings != null)
        'automatedEncodingSettings': automatedEncodingSettings,
      if (customName != null) 'customName': customName,
      if (name != null) 'name': name,
      if (outputGroupSettings != null)
        'outputGroupSettings': outputGroupSettings,
      if (outputs != null) 'outputs': outputs,
    };
  }
}

/// Contains details about the output groups specified in the job settings.
class OutputGroupDetail {
  /// Details about the output
  final List<OutputDetail>? outputDetails;

  OutputGroupDetail({
    this.outputDetails,
  });
  factory OutputGroupDetail.fromJson(Map<String, dynamic> json) {
    return OutputGroupDetail(
      outputDetails: (json['outputDetails'] as List?)
          ?.whereNotNull()
          .map((e) => OutputDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Output Group settings, including type
class OutputGroupSettings {
  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// CMAF_GROUP_SETTINGS. Each output in a CMAF Output Group may only contain a
  /// single video, audio, or caption output.
  final CmafGroupSettings? cmafGroupSettings;

  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// DASH_ISO_GROUP_SETTINGS.
  final DashIsoGroupSettings? dashIsoGroupSettings;

  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// FILE_GROUP_SETTINGS.
  final FileGroupSettings? fileGroupSettings;

  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// HLS_GROUP_SETTINGS.
  final HlsGroupSettings? hlsGroupSettings;

  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// MS_SMOOTH_GROUP_SETTINGS.
  final MsSmoothGroupSettings? msSmoothGroupSettings;

  /// Type of output group (File group, Apple HLS, DASH ISO, Microsoft Smooth
  /// Streaming, CMAF)
  final OutputGroupType? type;

  OutputGroupSettings({
    this.cmafGroupSettings,
    this.dashIsoGroupSettings,
    this.fileGroupSettings,
    this.hlsGroupSettings,
    this.msSmoothGroupSettings,
    this.type,
  });
  factory OutputGroupSettings.fromJson(Map<String, dynamic> json) {
    return OutputGroupSettings(
      cmafGroupSettings: json['cmafGroupSettings'] != null
          ? CmafGroupSettings.fromJson(
              json['cmafGroupSettings'] as Map<String, dynamic>)
          : null,
      dashIsoGroupSettings: json['dashIsoGroupSettings'] != null
          ? DashIsoGroupSettings.fromJson(
              json['dashIsoGroupSettings'] as Map<String, dynamic>)
          : null,
      fileGroupSettings: json['fileGroupSettings'] != null
          ? FileGroupSettings.fromJson(
              json['fileGroupSettings'] as Map<String, dynamic>)
          : null,
      hlsGroupSettings: json['hlsGroupSettings'] != null
          ? HlsGroupSettings.fromJson(
              json['hlsGroupSettings'] as Map<String, dynamic>)
          : null,
      msSmoothGroupSettings: json['msSmoothGroupSettings'] != null
          ? MsSmoothGroupSettings.fromJson(
              json['msSmoothGroupSettings'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.toOutputGroupType(),
    );
  }

  Map<String, dynamic> toJson() {
    final cmafGroupSettings = this.cmafGroupSettings;
    final dashIsoGroupSettings = this.dashIsoGroupSettings;
    final fileGroupSettings = this.fileGroupSettings;
    final hlsGroupSettings = this.hlsGroupSettings;
    final msSmoothGroupSettings = this.msSmoothGroupSettings;
    final type = this.type;
    return {
      if (cmafGroupSettings != null) 'cmafGroupSettings': cmafGroupSettings,
      if (dashIsoGroupSettings != null)
        'dashIsoGroupSettings': dashIsoGroupSettings,
      if (fileGroupSettings != null) 'fileGroupSettings': fileGroupSettings,
      if (hlsGroupSettings != null) 'hlsGroupSettings': hlsGroupSettings,
      if (msSmoothGroupSettings != null)
        'msSmoothGroupSettings': msSmoothGroupSettings,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Type of output group (File group, Apple HLS, DASH ISO, Microsoft Smooth
/// Streaming, CMAF)
enum OutputGroupType {
  hlsGroupSettings,
  dashIsoGroupSettings,
  fileGroupSettings,
  msSmoothGroupSettings,
  cmafGroupSettings,
}

extension on OutputGroupType {
  String toValue() {
    switch (this) {
      case OutputGroupType.hlsGroupSettings:
        return 'HLS_GROUP_SETTINGS';
      case OutputGroupType.dashIsoGroupSettings:
        return 'DASH_ISO_GROUP_SETTINGS';
      case OutputGroupType.fileGroupSettings:
        return 'FILE_GROUP_SETTINGS';
      case OutputGroupType.msSmoothGroupSettings:
        return 'MS_SMOOTH_GROUP_SETTINGS';
      case OutputGroupType.cmafGroupSettings:
        return 'CMAF_GROUP_SETTINGS';
    }
  }
}

extension on String {
  OutputGroupType toOutputGroupType() {
    switch (this) {
      case 'HLS_GROUP_SETTINGS':
        return OutputGroupType.hlsGroupSettings;
      case 'DASH_ISO_GROUP_SETTINGS':
        return OutputGroupType.dashIsoGroupSettings;
      case 'FILE_GROUP_SETTINGS':
        return OutputGroupType.fileGroupSettings;
      case 'MS_SMOOTH_GROUP_SETTINGS':
        return OutputGroupType.msSmoothGroupSettings;
      case 'CMAF_GROUP_SETTINGS':
        return OutputGroupType.cmafGroupSettings;
    }
    throw Exception('$this is not known in enum OutputGroupType');
  }
}

/// Selects method of inserting SDT information into output stream.  "Follow
/// input SDT" copies SDT information from input stream to  output stream.
/// "Follow input SDT if present" copies SDT information from  input stream to
/// output stream if SDT information is present in the input, otherwise it will
/// fall back on the user-defined values. Enter "SDT  Manually" means user will
/// enter the SDT information. "No SDT" means output  stream will not contain
/// SDT information.
enum OutputSdt {
  sdtFollow,
  sdtFollowIfPresent,
  sdtManual,
  sdtNone,
}

extension on OutputSdt {
  String toValue() {
    switch (this) {
      case OutputSdt.sdtFollow:
        return 'SDT_FOLLOW';
      case OutputSdt.sdtFollowIfPresent:
        return 'SDT_FOLLOW_IF_PRESENT';
      case OutputSdt.sdtManual:
        return 'SDT_MANUAL';
      case OutputSdt.sdtNone:
        return 'SDT_NONE';
    }
  }
}

extension on String {
  OutputSdt toOutputSdt() {
    switch (this) {
      case 'SDT_FOLLOW':
        return OutputSdt.sdtFollow;
      case 'SDT_FOLLOW_IF_PRESENT':
        return OutputSdt.sdtFollowIfPresent;
      case 'SDT_MANUAL':
        return OutputSdt.sdtManual;
      case 'SDT_NONE':
        return OutputSdt.sdtNone;
    }
    throw Exception('$this is not known in enum OutputSdt');
  }
}

/// Specific settings for this type of output.
class OutputSettings {
  /// Settings for HLS output groups
  final HlsSettings? hlsSettings;

  OutputSettings({
    this.hlsSettings,
  });
  factory OutputSettings.fromJson(Map<String, dynamic> json) {
    return OutputSettings(
      hlsSettings: json['hlsSettings'] != null
          ? HlsSettings.fromJson(json['hlsSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hlsSettings = this.hlsSettings;
    return {
      if (hlsSettings != null) 'hlsSettings': hlsSettings,
    };
  }
}

/// If you work with a third party video watermarking partner, use the group of
/// settings that correspond with your watermarking partner to include
/// watermarks in your output.
class PartnerWatermarking {
  /// For forensic video watermarking, MediaConvert supports Nagra NexGuard File
  /// Marker watermarking. MediaConvert supports both PreRelease Content (NGPR/G2)
  /// and OTT Streaming workflows.
  final NexGuardFileMarkerSettings? nexguardFileMarkerSettings;

  PartnerWatermarking({
    this.nexguardFileMarkerSettings,
  });
  factory PartnerWatermarking.fromJson(Map<String, dynamic> json) {
    return PartnerWatermarking(
      nexguardFileMarkerSettings: json['nexguardFileMarkerSettings'] != null
          ? NexGuardFileMarkerSettings.fromJson(
              json['nexguardFileMarkerSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nexguardFileMarkerSettings = this.nexguardFileMarkerSettings;
    return {
      if (nexguardFileMarkerSettings != null)
        'nexguardFileMarkerSettings': nexguardFileMarkerSettings,
    };
  }
}

/// A preset is a collection of preconfigured media conversion settings that you
/// want MediaConvert to apply to the output during the conversion process.
class Preset {
  /// A name you create for each preset. Each name must be unique within your
  /// account.
  final String name;

  /// Settings for preset
  final PresetSettings settings;

  /// An identifier for this resource that is unique within all of AWS.
  final String? arn;

  /// An optional category you create to organize your presets.
  final String? category;

  /// The timestamp in epoch seconds for preset creation.
  final DateTime? createdAt;

  /// An optional description you create for each preset.
  final String? description;

  /// The timestamp in epoch seconds when the preset was last updated.
  final DateTime? lastUpdated;

  /// A preset can be of two types: system or custom. System or built-in preset
  /// can't be modified or deleted by the user.
  final Type? type;

  Preset({
    required this.name,
    required this.settings,
    this.arn,
    this.category,
    this.createdAt,
    this.description,
    this.lastUpdated,
    this.type,
  });
  factory Preset.fromJson(Map<String, dynamic> json) {
    return Preset(
      name: json['name'] as String,
      settings:
          PresetSettings.fromJson(json['settings'] as Map<String, dynamic>),
      arn: json['arn'] as String?,
      category: json['category'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      type: (json['type'] as String?)?.toType(),
    );
  }
}

/// Optional. When you request a list of presets, you can choose to list them
/// alphabetically by NAME or chronologically by CREATION_DATE. If you don't
/// specify, the service will list them by name.
enum PresetListBy {
  name,
  creationDate,
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
  }
}

extension on String {
  PresetListBy toPresetListBy() {
    switch (this) {
      case 'NAME':
        return PresetListBy.name;
      case 'CREATION_DATE':
        return PresetListBy.creationDate;
      case 'SYSTEM':
        return PresetListBy.system;
    }
    throw Exception('$this is not known in enum PresetListBy');
  }
}

/// Settings for preset
class PresetSettings {
  /// (AudioDescriptions) contains groups of audio encoding settings organized by
  /// audio codec. Include one instance of (AudioDescriptions) per output.
  /// (AudioDescriptions) can contain multiple groups of encoding settings.
  final List<AudioDescription>? audioDescriptions;

  /// Caption settings for this preset. There can be multiple caption settings in
  /// a single output.
  final List<CaptionDescriptionPreset>? captionDescriptions;

  /// Container specific settings.
  final ContainerSettings? containerSettings;

  /// (VideoDescription) contains a group of video encoding settings. The specific
  /// video settings depend on the video codec that you choose when you specify a
  /// value for Video codec (codec). Include one instance of (VideoDescription)
  /// per output.
  final VideoDescription? videoDescription;

  PresetSettings({
    this.audioDescriptions,
    this.captionDescriptions,
    this.containerSettings,
    this.videoDescription,
  });
  factory PresetSettings.fromJson(Map<String, dynamic> json) {
    return PresetSettings(
      audioDescriptions: (json['audioDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => AudioDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      captionDescriptions: (json['captionDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CaptionDescriptionPreset.fromJson(e as Map<String, dynamic>))
          .toList(),
      containerSettings: json['containerSettings'] != null
          ? ContainerSettings.fromJson(
              json['containerSettings'] as Map<String, dynamic>)
          : null,
      videoDescription: json['videoDescription'] != null
          ? VideoDescription.fromJson(
              json['videoDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioDescriptions = this.audioDescriptions;
    final captionDescriptions = this.captionDescriptions;
    final containerSettings = this.containerSettings;
    final videoDescription = this.videoDescription;
    return {
      if (audioDescriptions != null) 'audioDescriptions': audioDescriptions,
      if (captionDescriptions != null)
        'captionDescriptions': captionDescriptions,
      if (containerSettings != null) 'containerSettings': containerSettings,
      if (videoDescription != null) 'videoDescription': videoDescription,
    };
  }
}

/// Specifies whether the pricing plan for the queue is on-demand or reserved.
/// For on-demand, you pay per minute, billed in increments of .01 minute. For
/// reserved, you pay for the transcoding capacity of the entire queue,
/// regardless of how much or how little you use it. Reserved pricing requires a
/// 12-month commitment.
enum PricingPlan {
  onDemand,
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
  }
}

extension on String {
  PricingPlan toPricingPlan() {
    switch (this) {
      case 'ON_DEMAND':
        return PricingPlan.onDemand;
      case 'RESERVED':
        return PricingPlan.reserved;
    }
    throw Exception('$this is not known in enum PricingPlan');
  }
}

/// Use Profile (ProResCodecProfile) to specifiy the type of Apple ProRes codec
/// to use for this output.
enum ProresCodecProfile {
  appleProres_422,
  appleProres_422Hq,
  appleProres_422Lt,
  appleProres_422Proxy,
}

extension on ProresCodecProfile {
  String toValue() {
    switch (this) {
      case ProresCodecProfile.appleProres_422:
        return 'APPLE_PRORES_422';
      case ProresCodecProfile.appleProres_422Hq:
        return 'APPLE_PRORES_422_HQ';
      case ProresCodecProfile.appleProres_422Lt:
        return 'APPLE_PRORES_422_LT';
      case ProresCodecProfile.appleProres_422Proxy:
        return 'APPLE_PRORES_422_PROXY';
    }
  }
}

extension on String {
  ProresCodecProfile toProresCodecProfile() {
    switch (this) {
      case 'APPLE_PRORES_422':
        return ProresCodecProfile.appleProres_422;
      case 'APPLE_PRORES_422_HQ':
        return ProresCodecProfile.appleProres_422Hq;
      case 'APPLE_PRORES_422_LT':
        return ProresCodecProfile.appleProres_422Lt;
      case 'APPLE_PRORES_422_PROXY':
        return ProresCodecProfile.appleProres_422Proxy;
    }
    throw Exception('$this is not known in enum ProresCodecProfile');
  }
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
  initializeFromSource,
  specified,
}

extension on ProresFramerateControl {
  String toValue() {
    switch (this) {
      case ProresFramerateControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case ProresFramerateControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  ProresFramerateControl toProresFramerateControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return ProresFramerateControl.initializeFromSource;
      case 'SPECIFIED':
        return ProresFramerateControl.specified;
    }
    throw Exception('$this is not known in enum ProresFramerateControl');
  }
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
  duplicateDrop,
  interpolate,
  frameformer,
}

extension on ProresFramerateConversionAlgorithm {
  String toValue() {
    switch (this) {
      case ProresFramerateConversionAlgorithm.duplicateDrop:
        return 'DUPLICATE_DROP';
      case ProresFramerateConversionAlgorithm.interpolate:
        return 'INTERPOLATE';
      case ProresFramerateConversionAlgorithm.frameformer:
        return 'FRAMEFORMER';
    }
  }
}

extension on String {
  ProresFramerateConversionAlgorithm toProresFramerateConversionAlgorithm() {
    switch (this) {
      case 'DUPLICATE_DROP':
        return ProresFramerateConversionAlgorithm.duplicateDrop;
      case 'INTERPOLATE':
        return ProresFramerateConversionAlgorithm.interpolate;
      case 'FRAMEFORMER':
        return ProresFramerateConversionAlgorithm.frameformer;
    }
    throw Exception(
        '$this is not known in enum ProresFramerateConversionAlgorithm');
  }
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
  progressive,
  topField,
  bottomField,
  followTopField,
  followBottomField,
}

extension on ProresInterlaceMode {
  String toValue() {
    switch (this) {
      case ProresInterlaceMode.progressive:
        return 'PROGRESSIVE';
      case ProresInterlaceMode.topField:
        return 'TOP_FIELD';
      case ProresInterlaceMode.bottomField:
        return 'BOTTOM_FIELD';
      case ProresInterlaceMode.followTopField:
        return 'FOLLOW_TOP_FIELD';
      case ProresInterlaceMode.followBottomField:
        return 'FOLLOW_BOTTOM_FIELD';
    }
  }
}

extension on String {
  ProresInterlaceMode toProresInterlaceMode() {
    switch (this) {
      case 'PROGRESSIVE':
        return ProresInterlaceMode.progressive;
      case 'TOP_FIELD':
        return ProresInterlaceMode.topField;
      case 'BOTTOM_FIELD':
        return ProresInterlaceMode.bottomField;
      case 'FOLLOW_TOP_FIELD':
        return ProresInterlaceMode.followTopField;
      case 'FOLLOW_BOTTOM_FIELD':
        return ProresInterlaceMode.followBottomField;
    }
    throw Exception('$this is not known in enum ProresInterlaceMode');
  }
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
  initializeFromSource,
  specified,
}

extension on ProresParControl {
  String toValue() {
    switch (this) {
      case ProresParControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case ProresParControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  ProresParControl toProresParControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return ProresParControl.initializeFromSource;
      case 'SPECIFIED':
        return ProresParControl.specified;
    }
    throw Exception('$this is not known in enum ProresParControl');
  }
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value PRORES.
class ProresSettings {
  /// Use Profile (ProResCodecProfile) to specifiy the type of Apple ProRes codec
  /// to use for this output.
  final ProresCodecProfile? codecProfile;

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
  final ProresFramerateControl? framerateControl;

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
  final ProresFramerateConversionAlgorithm? framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  final int? framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  final int? framerateNumerator;

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
  final ProresInterlaceMode? interlaceMode;

  /// Optional. Specify how the service determines the pixel aspect ratio (PAR)
  /// for this output. The default behavior, Follow source
  /// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
  /// output. To specify a different PAR in the console, choose any value other
  /// than Follow source. To specify a different PAR by editing the JSON job
  /// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
  /// you must also specify values for the parNumerator and parDenominator
  /// settings.
  final ProresParControl? parControl;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parDenominator is 33.
  final int? parDenominator;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parNumerator is 40.
  final int? parNumerator;

  /// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
  /// second (fps). Enable slow PAL to create a 25 fps output. When you enable
  /// slow PAL, MediaConvert relabels the video frames to 25 fps and resamples
  /// your audio to keep it synchronized with the video. Note that enabling this
  /// setting will slightly reduce the duration of your video. Required settings:
  /// You must also set Framerate to 25. In your JSON job specification, set
  /// (framerateControl) to (SPECIFIED), (framerateNumerator) to 25 and
  /// (framerateDenominator) to 1.
  final ProresSlowPal? slowPal;

  /// When you do frame rate conversion from 23.976 frames per second (fps) to
  /// 29.97 fps, and your output scan type is interlaced, you can optionally
  /// enable hard telecine (HARD) to create a smoother picture. When you keep the
  /// default value, None (NONE), MediaConvert does a standard frame rate
  /// conversion to 29.97 without doing anything with the field polarity to create
  /// a smoother picture.
  final ProresTelecine? telecine;

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
  factory ProresSettings.fromJson(Map<String, dynamic> json) {
    return ProresSettings(
      codecProfile: (json['codecProfile'] as String?)?.toProresCodecProfile(),
      framerateControl:
          (json['framerateControl'] as String?)?.toProresFramerateControl(),
      framerateConversionAlgorithm:
          (json['framerateConversionAlgorithm'] as String?)
              ?.toProresFramerateConversionAlgorithm(),
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
      interlaceMode:
          (json['interlaceMode'] as String?)?.toProresInterlaceMode(),
      parControl: (json['parControl'] as String?)?.toProresParControl(),
      parDenominator: json['parDenominator'] as int?,
      parNumerator: json['parNumerator'] as int?,
      slowPal: (json['slowPal'] as String?)?.toProresSlowPal(),
      telecine: (json['telecine'] as String?)?.toProresTelecine(),
    );
  }

  Map<String, dynamic> toJson() {
    final codecProfile = this.codecProfile;
    final framerateControl = this.framerateControl;
    final framerateConversionAlgorithm = this.framerateConversionAlgorithm;
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final interlaceMode = this.interlaceMode;
    final parControl = this.parControl;
    final parDenominator = this.parDenominator;
    final parNumerator = this.parNumerator;
    final slowPal = this.slowPal;
    final telecine = this.telecine;
    return {
      if (codecProfile != null) 'codecProfile': codecProfile.toValue(),
      if (framerateControl != null)
        'framerateControl': framerateControl.toValue(),
      if (framerateConversionAlgorithm != null)
        'framerateConversionAlgorithm': framerateConversionAlgorithm.toValue(),
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
      if (interlaceMode != null) 'interlaceMode': interlaceMode.toValue(),
      if (parControl != null) 'parControl': parControl.toValue(),
      if (parDenominator != null) 'parDenominator': parDenominator,
      if (parNumerator != null) 'parNumerator': parNumerator,
      if (slowPal != null) 'slowPal': slowPal.toValue(),
      if (telecine != null) 'telecine': telecine.toValue(),
    };
  }
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
  disabled,
  enabled,
}

extension on ProresSlowPal {
  String toValue() {
    switch (this) {
      case ProresSlowPal.disabled:
        return 'DISABLED';
      case ProresSlowPal.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  ProresSlowPal toProresSlowPal() {
    switch (this) {
      case 'DISABLED':
        return ProresSlowPal.disabled;
      case 'ENABLED':
        return ProresSlowPal.enabled;
    }
    throw Exception('$this is not known in enum ProresSlowPal');
  }
}

/// When you do frame rate conversion from 23.976 frames per second (fps) to
/// 29.97 fps, and your output scan type is interlaced, you can optionally
/// enable hard telecine (HARD) to create a smoother picture. When you keep the
/// default value, None (NONE), MediaConvert does a standard frame rate
/// conversion to 29.97 without doing anything with the field polarity to create
/// a smoother picture.
enum ProresTelecine {
  none,
  hard,
}

extension on ProresTelecine {
  String toValue() {
    switch (this) {
      case ProresTelecine.none:
        return 'NONE';
      case ProresTelecine.hard:
        return 'HARD';
    }
  }
}

extension on String {
  ProresTelecine toProresTelecine() {
    switch (this) {
      case 'NONE':
        return ProresTelecine.none;
      case 'HARD':
        return ProresTelecine.hard;
    }
    throw Exception('$this is not known in enum ProresTelecine');
  }
}

/// You can use queues to manage the resources that are available to your AWS
/// account for running multiple transcoding jobs at the same time. If you don't
/// specify a queue, the service sends all jobs through the default queue. For
/// more information, see
/// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
class Queue {
  /// A name that you create for each queue. Each name must be unique within your
  /// account.
  final String name;

  /// An identifier for this resource that is unique within all of AWS.
  final String? arn;

  /// The timestamp in epoch seconds for when you created the queue.
  final DateTime? createdAt;

  /// An optional description that you create for each queue.
  final String? description;

  /// The timestamp in epoch seconds for when you most recently updated the queue.
  final DateTime? lastUpdated;

  /// Specifies whether the pricing plan for the queue is on-demand or reserved.
  /// For on-demand, you pay per minute, billed in increments of .01 minute. For
  /// reserved, you pay for the transcoding capacity of the entire queue,
  /// regardless of how much or how little you use it. Reserved pricing requires a
  /// 12-month commitment.
  final PricingPlan? pricingPlan;

  /// The estimated number of jobs with a PROGRESSING status.
  final int? progressingJobsCount;

  /// Details about the pricing plan for your reserved queue. Required for
  /// reserved queues and not applicable to on-demand queues.
  final ReservationPlan? reservationPlan;

  /// Queues can be ACTIVE or PAUSED. If you pause a queue, the service won't
  /// begin processing jobs in that queue. Jobs that are running when you pause
  /// the queue continue to run until they finish or result in an error.
  final QueueStatus? status;

  /// The estimated number of jobs with a SUBMITTED status.
  final int? submittedJobsCount;

  /// Specifies whether this on-demand queue is system or custom. System queues
  /// are built in. You can't modify or delete system queues. You can create and
  /// modify custom queues.
  final Type? type;

  Queue({
    required this.name,
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
  factory Queue.fromJson(Map<String, dynamic> json) {
    return Queue(
      name: json['name'] as String,
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      pricingPlan: (json['pricingPlan'] as String?)?.toPricingPlan(),
      progressingJobsCount: json['progressingJobsCount'] as int?,
      reservationPlan: json['reservationPlan'] != null
          ? ReservationPlan.fromJson(
              json['reservationPlan'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toQueueStatus(),
      submittedJobsCount: json['submittedJobsCount'] as int?,
      type: (json['type'] as String?)?.toType(),
    );
  }
}

/// Optional. When you request a list of queues, you can choose to list them
/// alphabetically by NAME or chronologically by CREATION_DATE. If you don't
/// specify, the service will list them by creation date.
enum QueueListBy {
  name,
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
  }
}

extension on String {
  QueueListBy toQueueListBy() {
    switch (this) {
      case 'NAME':
        return QueueListBy.name;
      case 'CREATION_DATE':
        return QueueListBy.creationDate;
    }
    throw Exception('$this is not known in enum QueueListBy');
  }
}

/// Queues can be ACTIVE or PAUSED. If you pause a queue, jobs in that queue
/// won't begin. Jobs that are running when you pause a queue continue to run
/// until they finish or result in an error.
enum QueueStatus {
  active,
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
  }
}

extension on String {
  QueueStatus toQueueStatus() {
    switch (this) {
      case 'ACTIVE':
        return QueueStatus.active;
      case 'PAUSED':
        return QueueStatus.paused;
    }
    throw Exception('$this is not known in enum QueueStatus');
  }
}

/// Description of the source and destination queues between which the job has
/// moved, along with the timestamp of the move
class QueueTransition {
  /// The queue that the job was on after the transition.
  final String? destinationQueue;

  /// The queue that the job was on before the transition.
  final String? sourceQueue;

  /// The time, in Unix epoch format, that the job moved from the source queue to
  /// the destination queue.
  final DateTime? timestamp;

  QueueTransition({
    this.destinationQueue,
    this.sourceQueue,
    this.timestamp,
  });
  factory QueueTransition.fromJson(Map<String, dynamic> json) {
    return QueueTransition(
      destinationQueue: json['destinationQueue'] as String?,
      sourceQueue: json['sourceQueue'] as String?,
      timestamp: timeStampFromJson(json['timestamp']),
    );
  }
}

/// Use Rectangle to identify a specific area of the video frame.
class Rectangle {
  /// Height of rectangle in pixels. Specify only even numbers.
  final int? height;

  /// Width of rectangle in pixels. Specify only even numbers.
  final int? width;

  /// The distance, in pixels, between the rectangle and the left edge of the
  /// video frame. Specify only even numbers.
  final int? x;

  /// The distance, in pixels, between the rectangle and the top edge of the video
  /// frame. Specify only even numbers.
  final int? y;

  Rectangle({
    this.height,
    this.width,
    this.x,
    this.y,
  });
  factory Rectangle.fromJson(Map<String, dynamic> json) {
    return Rectangle(
      height: json['height'] as int?,
      width: json['width'] as int?,
      x: json['x'] as int?,
      y: json['y'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final height = this.height;
    final width = this.width;
    final x = this.x;
    final y = this.y;
    return {
      if (height != null) 'height': height,
      if (width != null) 'width': width,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
    };
  }
}

/// Use Manual audio remixing (RemixSettings) to adjust audio levels for each
/// audio channel in each output of your job. With audio remixing, you can
/// output more or fewer audio channels than your input audio source provides.
class RemixSettings {
  /// Channel mapping (ChannelMapping) contains the group of fields that hold the
  /// remixing value for each channel. Units are in dB. Acceptable values are
  /// within the range from -60 (mute) through 6. A setting of 0 passes the input
  /// channel unchanged to the output channel (no attenuation or amplification).
  final ChannelMapping? channelMapping;

  /// Specify the number of audio channels from your input that you want to use in
  /// your output. With remixing, you might combine or split the data in these
  /// channels, so the number of channels in your final output might be different.
  final int? channelsIn;

  /// Specify the number of channels in this output after remixing. Valid values:
  /// 1, 2, 4, 6, 8... 64. (1 and even numbers to 64.)
  final int? channelsOut;

  RemixSettings({
    this.channelMapping,
    this.channelsIn,
    this.channelsOut,
  });
  factory RemixSettings.fromJson(Map<String, dynamic> json) {
    return RemixSettings(
      channelMapping: json['channelMapping'] != null
          ? ChannelMapping.fromJson(
              json['channelMapping'] as Map<String, dynamic>)
          : null,
      channelsIn: json['channelsIn'] as int?,
      channelsOut: json['channelsOut'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelMapping = this.channelMapping;
    final channelsIn = this.channelsIn;
    final channelsOut = this.channelsOut;
    return {
      if (channelMapping != null) 'channelMapping': channelMapping,
      if (channelsIn != null) 'channelsIn': channelsIn,
      if (channelsOut != null) 'channelsOut': channelsOut,
    };
  }
}

/// Specifies whether the term of your reserved queue pricing plan is
/// automatically extended (AUTO_RENEW) or expires (EXPIRE) at the end of the
/// term.
enum RenewalType {
  autoRenew,
  expire,
}

extension on RenewalType {
  String toValue() {
    switch (this) {
      case RenewalType.autoRenew:
        return 'AUTO_RENEW';
      case RenewalType.expire:
        return 'EXPIRE';
    }
  }
}

extension on String {
  RenewalType toRenewalType() {
    switch (this) {
      case 'AUTO_RENEW':
        return RenewalType.autoRenew;
      case 'EXPIRE':
        return RenewalType.expire;
    }
    throw Exception('$this is not known in enum RenewalType');
  }
}

/// Details about the pricing plan for your reserved queue. Required for
/// reserved queues and not applicable to on-demand queues.
class ReservationPlan {
  /// The length of the term of your reserved queue pricing plan commitment.
  final Commitment? commitment;

  /// The timestamp in epoch seconds for when the current pricing plan term for
  /// this reserved queue expires.
  final DateTime? expiresAt;

  /// The timestamp in epoch seconds for when you set up the current pricing plan
  /// for this reserved queue.
  final DateTime? purchasedAt;

  /// Specifies whether the term of your reserved queue pricing plan is
  /// automatically extended (AUTO_RENEW) or expires (EXPIRE) at the end of the
  /// term.
  final RenewalType? renewalType;

  /// Specifies the number of reserved transcode slots (RTS) for this queue. The
  /// number of RTS determines how many jobs the queue can process in parallel;
  /// each RTS can process one job at a time. When you increase this number, you
  /// extend your existing commitment with a new 12-month commitment for a larger
  /// number of RTS. The new commitment begins when you purchase the additional
  /// capacity. You can't decrease the number of RTS in your reserved queue.
  final int? reservedSlots;

  /// Specifies whether the pricing plan for your reserved queue is ACTIVE or
  /// EXPIRED.
  final ReservationPlanStatus? status;

  ReservationPlan({
    this.commitment,
    this.expiresAt,
    this.purchasedAt,
    this.renewalType,
    this.reservedSlots,
    this.status,
  });
  factory ReservationPlan.fromJson(Map<String, dynamic> json) {
    return ReservationPlan(
      commitment: (json['commitment'] as String?)?.toCommitment(),
      expiresAt: timeStampFromJson(json['expiresAt']),
      purchasedAt: timeStampFromJson(json['purchasedAt']),
      renewalType: (json['renewalType'] as String?)?.toRenewalType(),
      reservedSlots: json['reservedSlots'] as int?,
      status: (json['status'] as String?)?.toReservationPlanStatus(),
    );
  }
}

/// Details about the pricing plan for your reserved queue. Required for
/// reserved queues and not applicable to on-demand queues.
class ReservationPlanSettings {
  /// The length of the term of your reserved queue pricing plan commitment.
  final Commitment commitment;

  /// Specifies whether the term of your reserved queue pricing plan is
  /// automatically extended (AUTO_RENEW) or expires (EXPIRE) at the end of the
  /// term. When your term is auto renewed, you extend your commitment by 12
  /// months from the auto renew date. You can cancel this commitment.
  final RenewalType renewalType;

  /// Specifies the number of reserved transcode slots (RTS) for this queue. The
  /// number of RTS determines how many jobs the queue can process in parallel;
  /// each RTS can process one job at a time. You can't decrease the number of RTS
  /// in your reserved queue. You can increase the number of RTS by extending your
  /// existing commitment with a new 12-month commitment for the larger number.
  /// The new commitment begins when you purchase the additional capacity. You
  /// can't cancel your commitment or revert to your original commitment after you
  /// increase the capacity.
  final int reservedSlots;

  ReservationPlanSettings({
    required this.commitment,
    required this.renewalType,
    required this.reservedSlots,
  });
  Map<String, dynamic> toJson() {
    final commitment = this.commitment;
    final renewalType = this.renewalType;
    final reservedSlots = this.reservedSlots;
    return {
      'commitment': commitment.toValue(),
      'renewalType': renewalType.toValue(),
      'reservedSlots': reservedSlots,
    };
  }
}

/// Specifies whether the pricing plan for your reserved queue is ACTIVE or
/// EXPIRED.
enum ReservationPlanStatus {
  active,
  expired,
}

extension on ReservationPlanStatus {
  String toValue() {
    switch (this) {
      case ReservationPlanStatus.active:
        return 'ACTIVE';
      case ReservationPlanStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension on String {
  ReservationPlanStatus toReservationPlanStatus() {
    switch (this) {
      case 'ACTIVE':
        return ReservationPlanStatus.active;
      case 'EXPIRED':
        return ReservationPlanStatus.expired;
    }
    throw Exception('$this is not known in enum ReservationPlanStatus');
  }
}

/// The Amazon Resource Name (ARN) and tags for an AWS Elemental MediaConvert
/// resource.
class ResourceTags {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The tags for the resource.
  final Map<String, String>? tags;

  ResourceTags({
    this.arn,
    this.tags,
  });
  factory ResourceTags.fromJson(Map<String, dynamic> json) {
    return ResourceTags(
      arn: json['arn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
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
  none,
  respond,
  passthrough,
}

extension on RespondToAfd {
  String toValue() {
    switch (this) {
      case RespondToAfd.none:
        return 'NONE';
      case RespondToAfd.respond:
        return 'RESPOND';
      case RespondToAfd.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  RespondToAfd toRespondToAfd() {
    switch (this) {
      case 'NONE':
        return RespondToAfd.none;
      case 'RESPOND':
        return RespondToAfd.respond;
      case 'PASSTHROUGH':
        return RespondToAfd.passthrough;
    }
    throw Exception('$this is not known in enum RespondToAfd');
  }
}

/// Optional. Have MediaConvert automatically apply Amazon S3 access control for
/// the outputs in this output group. When you don't use this setting, S3
/// automatically applies the default access control list PRIVATE.
class S3DestinationAccessControl {
  /// Choose an Amazon S3 canned ACL for MediaConvert to apply to this output.
  final S3ObjectCannedAcl? cannedAcl;

  S3DestinationAccessControl({
    this.cannedAcl,
  });
  factory S3DestinationAccessControl.fromJson(Map<String, dynamic> json) {
    return S3DestinationAccessControl(
      cannedAcl: (json['cannedAcl'] as String?)?.toS3ObjectCannedAcl(),
    );
  }

  Map<String, dynamic> toJson() {
    final cannedAcl = this.cannedAcl;
    return {
      if (cannedAcl != null) 'cannedAcl': cannedAcl.toValue(),
    };
  }
}

/// Settings associated with S3 destination
class S3DestinationSettings {
  /// Optional. Have MediaConvert automatically apply Amazon S3 access control for
  /// the outputs in this output group. When you don't use this setting, S3
  /// automatically applies the default access control list PRIVATE.
  final S3DestinationAccessControl? accessControl;

  /// Settings for how your job outputs are encrypted as they are uploaded to
  /// Amazon S3.
  final S3EncryptionSettings? encryption;

  S3DestinationSettings({
    this.accessControl,
    this.encryption,
  });
  factory S3DestinationSettings.fromJson(Map<String, dynamic> json) {
    return S3DestinationSettings(
      accessControl: json['accessControl'] != null
          ? S3DestinationAccessControl.fromJson(
              json['accessControl'] as Map<String, dynamic>)
          : null,
      encryption: json['encryption'] != null
          ? S3EncryptionSettings.fromJson(
              json['encryption'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessControl = this.accessControl;
    final encryption = this.encryption;
    return {
      if (accessControl != null) 'accessControl': accessControl,
      if (encryption != null) 'encryption': encryption,
    };
  }
}

/// Settings for how your job outputs are encrypted as they are uploaded to
/// Amazon S3.
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
  final S3ServerSideEncryptionType? encryptionType;

  /// Optionally, specify the customer master key (CMK) that you want to use to
  /// encrypt the data key that AWS uses to encrypt your output content. Enter the
  /// Amazon Resource Name (ARN) of the CMK. To use this setting, you must also
  /// set Server-side encryption (S3ServerSideEncryptionType) to AWS KMS
  /// (SERVER_SIDE_ENCRYPTION_KMS). If you set Server-side encryption to AWS KMS
  /// but don't specify a CMK here, AWS uses the AWS managed CMK associated with
  /// Amazon S3.
  final String? kmsKeyArn;

  S3EncryptionSettings({
    this.encryptionType,
    this.kmsKeyArn,
  });
  factory S3EncryptionSettings.fromJson(Map<String, dynamic> json) {
    return S3EncryptionSettings(
      encryptionType:
          (json['encryptionType'] as String?)?.toS3ServerSideEncryptionType(),
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionType = this.encryptionType;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      if (encryptionType != null) 'encryptionType': encryptionType.toValue(),
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// Choose an Amazon S3 canned ACL for MediaConvert to apply to this output.
enum S3ObjectCannedAcl {
  publicRead,
  authenticatedRead,
  bucketOwnerRead,
  bucketOwnerFullControl,
}

extension on S3ObjectCannedAcl {
  String toValue() {
    switch (this) {
      case S3ObjectCannedAcl.publicRead:
        return 'PUBLIC_READ';
      case S3ObjectCannedAcl.authenticatedRead:
        return 'AUTHENTICATED_READ';
      case S3ObjectCannedAcl.bucketOwnerRead:
        return 'BUCKET_OWNER_READ';
      case S3ObjectCannedAcl.bucketOwnerFullControl:
        return 'BUCKET_OWNER_FULL_CONTROL';
    }
  }
}

extension on String {
  S3ObjectCannedAcl toS3ObjectCannedAcl() {
    switch (this) {
      case 'PUBLIC_READ':
        return S3ObjectCannedAcl.publicRead;
      case 'AUTHENTICATED_READ':
        return S3ObjectCannedAcl.authenticatedRead;
      case 'BUCKET_OWNER_READ':
        return S3ObjectCannedAcl.bucketOwnerRead;
      case 'BUCKET_OWNER_FULL_CONTROL':
        return S3ObjectCannedAcl.bucketOwnerFullControl;
    }
    throw Exception('$this is not known in enum S3ObjectCannedAcl');
  }
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
  serverSideEncryptionS3,
  serverSideEncryptionKms,
}

extension on S3ServerSideEncryptionType {
  String toValue() {
    switch (this) {
      case S3ServerSideEncryptionType.serverSideEncryptionS3:
        return 'SERVER_SIDE_ENCRYPTION_S3';
      case S3ServerSideEncryptionType.serverSideEncryptionKms:
        return 'SERVER_SIDE_ENCRYPTION_KMS';
    }
  }
}

extension on String {
  S3ServerSideEncryptionType toS3ServerSideEncryptionType() {
    switch (this) {
      case 'SERVER_SIDE_ENCRYPTION_S3':
        return S3ServerSideEncryptionType.serverSideEncryptionS3;
      case 'SERVER_SIDE_ENCRYPTION_KMS':
        return S3ServerSideEncryptionType.serverSideEncryptionKms;
    }
    throw Exception('$this is not known in enum S3ServerSideEncryptionType');
  }
}

/// Specify how the service handles outputs that have a different aspect ratio
/// from the input aspect ratio. Choose Stretch to output (STRETCH_TO_OUTPUT) to
/// have the service stretch your video image to fit. Keep the setting Default
/// (DEFAULT) to have the service letterbox your video instead. This setting
/// overrides any value that you specify for the setting Selection placement
/// (position) in this output.
enum ScalingBehavior {
  $default,
  stretchToOutput,
}

extension on ScalingBehavior {
  String toValue() {
    switch (this) {
      case ScalingBehavior.$default:
        return 'DEFAULT';
      case ScalingBehavior.stretchToOutput:
        return 'STRETCH_TO_OUTPUT';
    }
  }
}

extension on String {
  ScalingBehavior toScalingBehavior() {
    switch (this) {
      case 'DEFAULT':
        return ScalingBehavior.$default;
      case 'STRETCH_TO_OUTPUT':
        return ScalingBehavior.stretchToOutput;
    }
    throw Exception('$this is not known in enum ScalingBehavior');
  }
}

/// Set Framerate (SccDestinationFramerate) to make sure that the captions and
/// the video are synchronized in the output. Specify a frame rate that matches
/// the frame rate of the associated video. If the video frame rate is 29.97,
/// choose 29.97 dropframe (FRAMERATE_29_97_DROPFRAME) only if the video has
/// video_insertion=true and drop_frame_timecode=true; otherwise, choose 29.97
/// non-dropframe (FRAMERATE_29_97_NON_DROPFRAME).
enum SccDestinationFramerate {
  framerate_23_97,
  framerate_24,
  framerate_25,
  framerate_29_97Dropframe,
  framerate_29_97NonDropframe,
}

extension on SccDestinationFramerate {
  String toValue() {
    switch (this) {
      case SccDestinationFramerate.framerate_23_97:
        return 'FRAMERATE_23_97';
      case SccDestinationFramerate.framerate_24:
        return 'FRAMERATE_24';
      case SccDestinationFramerate.framerate_25:
        return 'FRAMERATE_25';
      case SccDestinationFramerate.framerate_29_97Dropframe:
        return 'FRAMERATE_29_97_DROPFRAME';
      case SccDestinationFramerate.framerate_29_97NonDropframe:
        return 'FRAMERATE_29_97_NON_DROPFRAME';
    }
  }
}

extension on String {
  SccDestinationFramerate toSccDestinationFramerate() {
    switch (this) {
      case 'FRAMERATE_23_97':
        return SccDestinationFramerate.framerate_23_97;
      case 'FRAMERATE_24':
        return SccDestinationFramerate.framerate_24;
      case 'FRAMERATE_25':
        return SccDestinationFramerate.framerate_25;
      case 'FRAMERATE_29_97_DROPFRAME':
        return SccDestinationFramerate.framerate_29_97Dropframe;
      case 'FRAMERATE_29_97_NON_DROPFRAME':
        return SccDestinationFramerate.framerate_29_97NonDropframe;
    }
    throw Exception('$this is not known in enum SccDestinationFramerate');
  }
}

/// Settings for SCC caption output.
class SccDestinationSettings {
  /// Set Framerate (SccDestinationFramerate) to make sure that the captions and
  /// the video are synchronized in the output. Specify a frame rate that matches
  /// the frame rate of the associated video. If the video frame rate is 29.97,
  /// choose 29.97 dropframe (FRAMERATE_29_97_DROPFRAME) only if the video has
  /// video_insertion=true and drop_frame_timecode=true; otherwise, choose 29.97
  /// non-dropframe (FRAMERATE_29_97_NON_DROPFRAME).
  final SccDestinationFramerate? framerate;

  SccDestinationSettings({
    this.framerate,
  });
  factory SccDestinationSettings.fromJson(Map<String, dynamic> json) {
    return SccDestinationSettings(
      framerate: (json['framerate'] as String?)?.toSccDestinationFramerate(),
    );
  }

  Map<String, dynamic> toJson() {
    final framerate = this.framerate;
    return {
      if (framerate != null) 'framerate': framerate.toValue(),
    };
  }
}

/// Enable this setting when you run a test job to estimate how many reserved
/// transcoding slots (RTS) you need. When this is enabled, MediaConvert runs
/// your job from an on-demand queue with similar performance to what you will
/// see with one RTS in a reserved queue. This setting is disabled by default.
enum SimulateReservedQueue {
  disabled,
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
  }
}

extension on String {
  SimulateReservedQueue toSimulateReservedQueue() {
    switch (this) {
      case 'DISABLED':
        return SimulateReservedQueue.disabled;
      case 'ENABLED':
        return SimulateReservedQueue.enabled;
    }
    throw Exception('$this is not known in enum SimulateReservedQueue');
  }
}

/// If your output group type is HLS, DASH, or Microsoft Smooth, use these
/// settings when doing DRM encryption with a SPEKE-compliant key provider.  If
/// your output group type is CMAF, use the SpekeKeyProviderCmaf settings
/// instead.
class SpekeKeyProvider {
  /// If you want your key provider to encrypt the content keys that it provides
  /// to MediaConvert, set up a certificate with a master key using AWS
  /// Certificate Manager. Specify the certificate's Amazon Resource Name (ARN)
  /// here.
  final String? certificateArn;

  /// Specify the resource ID that your SPEKE-compliant key provider uses to
  /// identify this content.
  final String? resourceId;

  /// Relates to SPEKE implementation. DRM system identifiers. DASH output groups
  /// support a max of two system ids. Other group types support one system id.
  /// See
  /// https://dashif.org/identifiers/content_protection/ for more details.
  final List<String>? systemIds;

  /// Specify the URL to the key server that your SPEKE-compliant DRM key provider
  /// uses to provide keys for encrypting your content.
  final String? url;

  SpekeKeyProvider({
    this.certificateArn,
    this.resourceId,
    this.systemIds,
    this.url,
  });
  factory SpekeKeyProvider.fromJson(Map<String, dynamic> json) {
    return SpekeKeyProvider(
      certificateArn: json['certificateArn'] as String?,
      resourceId: json['resourceId'] as String?,
      systemIds: (json['systemIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final resourceId = this.resourceId;
    final systemIds = this.systemIds;
    final url = this.url;
    return {
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (resourceId != null) 'resourceId': resourceId,
      if (systemIds != null) 'systemIds': systemIds,
      if (url != null) 'url': url,
    };
  }
}

/// If your output group type is CMAF, use these settings when doing DRM
/// encryption with a SPEKE-compliant key provider. If your output group type is
/// HLS, DASH, or Microsoft Smooth, use the SpekeKeyProvider settings instead.
class SpekeKeyProviderCmaf {
  /// If you want your key provider to encrypt the content keys that it provides
  /// to MediaConvert, set up a certificate with a master key using AWS
  /// Certificate Manager. Specify the certificate's Amazon Resource Name (ARN)
  /// here.
  final String? certificateArn;

  /// Specify the DRM system IDs that you want signaled in the DASH manifest that
  /// MediaConvert creates as part of this CMAF package. The DASH manifest can
  /// currently signal up to three system IDs. For more information, see
  /// https://dashif.org/identifiers/content_protection/.
  final List<String>? dashSignaledSystemIds;

  /// Specify the DRM system ID that you want signaled in the HLS manifest that
  /// MediaConvert creates as part of this CMAF package. The HLS manifest can
  /// currently signal only one system ID. For more information, see
  /// https://dashif.org/identifiers/content_protection/.
  final List<String>? hlsSignaledSystemIds;

  /// Specify the resource ID that your SPEKE-compliant key provider uses to
  /// identify this content.
  final String? resourceId;

  /// Specify the URL to the key server that your SPEKE-compliant DRM key provider
  /// uses to provide keys for encrypting your content.
  final String? url;

  SpekeKeyProviderCmaf({
    this.certificateArn,
    this.dashSignaledSystemIds,
    this.hlsSignaledSystemIds,
    this.resourceId,
    this.url,
  });
  factory SpekeKeyProviderCmaf.fromJson(Map<String, dynamic> json) {
    return SpekeKeyProviderCmaf(
      certificateArn: json['certificateArn'] as String?,
      dashSignaledSystemIds: (json['dashSignaledSystemIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      hlsSignaledSystemIds: (json['hlsSignaledSystemIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      resourceId: json['resourceId'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final dashSignaledSystemIds = this.dashSignaledSystemIds;
    final hlsSignaledSystemIds = this.hlsSignaledSystemIds;
    final resourceId = this.resourceId;
    final url = this.url;
    return {
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (dashSignaledSystemIds != null)
        'dashSignaledSystemIds': dashSignaledSystemIds,
      if (hlsSignaledSystemIds != null)
        'hlsSignaledSystemIds': hlsSignaledSystemIds,
      if (resourceId != null) 'resourceId': resourceId,
      if (url != null) 'url': url,
    };
  }
}

/// Use these settings to set up encryption with a static key provider.
class StaticKeyProvider {
  /// Relates to DRM implementation. Sets the value of the KEYFORMAT attribute.
  /// Must be 'identity' or a reverse DNS string. May be omitted to indicate an
  /// implicit value of 'identity'.
  final String? keyFormat;

  /// Relates to DRM implementation. Either a single positive integer version
  /// value or a slash delimited list of version values (1/2/3).
  final String? keyFormatVersions;

  /// Relates to DRM implementation. Use a 32-character hexidecimal string to
  /// specify Key Value (StaticKeyValue).
  final String? staticKeyValue;

  /// Relates to DRM implementation. The location of the license server used for
  /// protecting content.
  final String? url;

  StaticKeyProvider({
    this.keyFormat,
    this.keyFormatVersions,
    this.staticKeyValue,
    this.url,
  });
  factory StaticKeyProvider.fromJson(Map<String, dynamic> json) {
    return StaticKeyProvider(
      keyFormat: json['keyFormat'] as String?,
      keyFormatVersions: json['keyFormatVersions'] as String?,
      staticKeyValue: json['staticKeyValue'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyFormat = this.keyFormat;
    final keyFormatVersions = this.keyFormatVersions;
    final staticKeyValue = this.staticKeyValue;
    final url = this.url;
    return {
      if (keyFormat != null) 'keyFormat': keyFormat,
      if (keyFormatVersions != null) 'keyFormatVersions': keyFormatVersions,
      if (staticKeyValue != null) 'staticKeyValue': staticKeyValue,
      if (url != null) 'url': url,
    };
  }
}

/// Specify how often MediaConvert sends STATUS_UPDATE events to Amazon
/// CloudWatch Events. Set the interval, in seconds, between status updates.
/// MediaConvert sends an update at this interval from the time the service
/// begins processing your job to the time it completes the transcode or
/// encounters an error.
enum StatusUpdateInterval {
  seconds_10,
  seconds_12,
  seconds_15,
  seconds_20,
  seconds_30,
  seconds_60,
  seconds_120,
  seconds_180,
  seconds_240,
  seconds_300,
  seconds_360,
  seconds_420,
  seconds_480,
  seconds_540,
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
  }
}

extension on String {
  StatusUpdateInterval toStatusUpdateInterval() {
    switch (this) {
      case 'SECONDS_10':
        return StatusUpdateInterval.seconds_10;
      case 'SECONDS_12':
        return StatusUpdateInterval.seconds_12;
      case 'SECONDS_15':
        return StatusUpdateInterval.seconds_15;
      case 'SECONDS_20':
        return StatusUpdateInterval.seconds_20;
      case 'SECONDS_30':
        return StatusUpdateInterval.seconds_30;
      case 'SECONDS_60':
        return StatusUpdateInterval.seconds_60;
      case 'SECONDS_120':
        return StatusUpdateInterval.seconds_120;
      case 'SECONDS_180':
        return StatusUpdateInterval.seconds_180;
      case 'SECONDS_240':
        return StatusUpdateInterval.seconds_240;
      case 'SECONDS_300':
        return StatusUpdateInterval.seconds_300;
      case 'SECONDS_360':
        return StatusUpdateInterval.seconds_360;
      case 'SECONDS_420':
        return StatusUpdateInterval.seconds_420;
      case 'SECONDS_480':
        return StatusUpdateInterval.seconds_480;
      case 'SECONDS_540':
        return StatusUpdateInterval.seconds_540;
      case 'SECONDS_600':
        return StatusUpdateInterval.seconds_600;
    }
    throw Exception('$this is not known in enum StatusUpdateInterval');
  }
}

class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

/// Settings for Teletext caption output
class TeletextDestinationSettings {
  /// Set pageNumber to the Teletext page number for the destination captions for
  /// this output. This value must be a three-digit hexadecimal string; strings
  /// ending in -FF are invalid. If you are passing through the entire set of
  /// Teletext data, do not use this field.
  final String? pageNumber;

  /// Specify the page types for this Teletext page. If you don't specify a value
  /// here, the service sets the page type to the default value Subtitle
  /// (PAGE_TYPE_SUBTITLE). If you pass through the entire set of Teletext data,
  /// don't use this field. When you pass through a set of Teletext pages, your
  /// output has the same page types as your input.
  final List<TeletextPageType>? pageTypes;

  TeletextDestinationSettings({
    this.pageNumber,
    this.pageTypes,
  });
  factory TeletextDestinationSettings.fromJson(Map<String, dynamic> json) {
    return TeletextDestinationSettings(
      pageNumber: json['pageNumber'] as String?,
      pageTypes: (json['pageTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toTeletextPageType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pageNumber = this.pageNumber;
    final pageTypes = this.pageTypes;
    return {
      if (pageNumber != null) 'pageNumber': pageNumber,
      if (pageTypes != null)
        'pageTypes': pageTypes.map((e) => e.toValue()).toList(),
    };
  }
}

/// A page type as defined in the standard ETSI EN 300 468, Table 94
enum TeletextPageType {
  pageTypeInitial,
  pageTypeSubtitle,
  pageTypeAddlInfo,
  pageTypeProgramSchedule,
  pageTypeHearingImpairedSubtitle,
}

extension on TeletextPageType {
  String toValue() {
    switch (this) {
      case TeletextPageType.pageTypeInitial:
        return 'PAGE_TYPE_INITIAL';
      case TeletextPageType.pageTypeSubtitle:
        return 'PAGE_TYPE_SUBTITLE';
      case TeletextPageType.pageTypeAddlInfo:
        return 'PAGE_TYPE_ADDL_INFO';
      case TeletextPageType.pageTypeProgramSchedule:
        return 'PAGE_TYPE_PROGRAM_SCHEDULE';
      case TeletextPageType.pageTypeHearingImpairedSubtitle:
        return 'PAGE_TYPE_HEARING_IMPAIRED_SUBTITLE';
    }
  }
}

extension on String {
  TeletextPageType toTeletextPageType() {
    switch (this) {
      case 'PAGE_TYPE_INITIAL':
        return TeletextPageType.pageTypeInitial;
      case 'PAGE_TYPE_SUBTITLE':
        return TeletextPageType.pageTypeSubtitle;
      case 'PAGE_TYPE_ADDL_INFO':
        return TeletextPageType.pageTypeAddlInfo;
      case 'PAGE_TYPE_PROGRAM_SCHEDULE':
        return TeletextPageType.pageTypeProgramSchedule;
      case 'PAGE_TYPE_HEARING_IMPAIRED_SUBTITLE':
        return TeletextPageType.pageTypeHearingImpairedSubtitle;
    }
    throw Exception('$this is not known in enum TeletextPageType');
  }
}

/// Settings specific to Teletext caption sources, including Page number.
class TeletextSourceSettings {
  /// Use Page Number (PageNumber) to specify the three-digit hexadecimal page
  /// number that will be used for Teletext captions. Do not use this setting if
  /// you are passing through teletext from the input source to output.
  final String? pageNumber;

  TeletextSourceSettings({
    this.pageNumber,
  });
  factory TeletextSourceSettings.fromJson(Map<String, dynamic> json) {
    return TeletextSourceSettings(
      pageNumber: json['pageNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pageNumber = this.pageNumber;
    return {
      if (pageNumber != null) 'pageNumber': pageNumber,
    };
  }
}

/// Timecode burn-in (TimecodeBurnIn)--Burns the output timecode and specified
/// prefix into the output.
class TimecodeBurnin {
  /// Use Font Size (FontSize) to set the font size of any burned-in timecode.
  /// Valid values are 10, 16, 32, 48.
  final int? fontSize;

  /// Use Position (Position) under under Timecode burn-in (TimecodeBurnIn) to
  /// specify the location the burned-in timecode on output video.
  final TimecodeBurninPosition? position;

  /// Use Prefix (Prefix) to place ASCII characters before any burned-in timecode.
  /// For example, a prefix of "EZ-" will result in the timecode "EZ-00:00:00:00".
  /// Provide either the characters themselves or the ASCII code equivalents. The
  /// supported range of characters is 0x20 through 0x7e. This includes letters,
  /// numbers, and all special characters represented on a standard English
  /// keyboard.
  final String? prefix;

  TimecodeBurnin({
    this.fontSize,
    this.position,
    this.prefix,
  });
  factory TimecodeBurnin.fromJson(Map<String, dynamic> json) {
    return TimecodeBurnin(
      fontSize: json['fontSize'] as int?,
      position: (json['position'] as String?)?.toTimecodeBurninPosition(),
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fontSize = this.fontSize;
    final position = this.position;
    final prefix = this.prefix;
    return {
      if (fontSize != null) 'fontSize': fontSize,
      if (position != null) 'position': position.toValue(),
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Use Position (Position) under under Timecode burn-in (TimecodeBurnIn) to
/// specify the location the burned-in timecode on output video.
enum TimecodeBurninPosition {
  topCenter,
  topLeft,
  topRight,
  middleLeft,
  middleCenter,
  middleRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

extension on TimecodeBurninPosition {
  String toValue() {
    switch (this) {
      case TimecodeBurninPosition.topCenter:
        return 'TOP_CENTER';
      case TimecodeBurninPosition.topLeft:
        return 'TOP_LEFT';
      case TimecodeBurninPosition.topRight:
        return 'TOP_RIGHT';
      case TimecodeBurninPosition.middleLeft:
        return 'MIDDLE_LEFT';
      case TimecodeBurninPosition.middleCenter:
        return 'MIDDLE_CENTER';
      case TimecodeBurninPosition.middleRight:
        return 'MIDDLE_RIGHT';
      case TimecodeBurninPosition.bottomLeft:
        return 'BOTTOM_LEFT';
      case TimecodeBurninPosition.bottomCenter:
        return 'BOTTOM_CENTER';
      case TimecodeBurninPosition.bottomRight:
        return 'BOTTOM_RIGHT';
    }
  }
}

extension on String {
  TimecodeBurninPosition toTimecodeBurninPosition() {
    switch (this) {
      case 'TOP_CENTER':
        return TimecodeBurninPosition.topCenter;
      case 'TOP_LEFT':
        return TimecodeBurninPosition.topLeft;
      case 'TOP_RIGHT':
        return TimecodeBurninPosition.topRight;
      case 'MIDDLE_LEFT':
        return TimecodeBurninPosition.middleLeft;
      case 'MIDDLE_CENTER':
        return TimecodeBurninPosition.middleCenter;
      case 'MIDDLE_RIGHT':
        return TimecodeBurninPosition.middleRight;
      case 'BOTTOM_LEFT':
        return TimecodeBurninPosition.bottomLeft;
      case 'BOTTOM_CENTER':
        return TimecodeBurninPosition.bottomCenter;
      case 'BOTTOM_RIGHT':
        return TimecodeBurninPosition.bottomRight;
    }
    throw Exception('$this is not known in enum TimecodeBurninPosition');
  }
}

/// These settings control how the service handles timecodes throughout the job.
/// These settings don't affect input clipping.
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
  final String? anchor;

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
  final TimecodeSource? source;

  /// Only use when you set Source (TimecodeSource) to Specified start
  /// (SPECIFIEDSTART). Use Start timecode (Start) to specify the timecode for the
  /// initial frame. Use 24-hour format with frame number, (HH:MM:SS:FF) or
  /// (HH:MM:SS;FF).
  final String? start;

  /// Only applies to outputs that support program-date-time stamp. Use Timestamp
  /// offset (TimestampOffset) to overwrite the timecode date without affecting
  /// the time and frame number. Provide the new date as a string in the format
  /// "yyyy-mm-dd".  To use Time stamp offset, you must also enable Insert
  /// program-date-time (InsertProgramDateTime) in the output settings. For
  /// example, if the date part of your timecodes is 2002-1-25 and you want to
  /// change it to one year later, set Timestamp offset (TimestampOffset) to
  /// 2003-1-25.
  final String? timestampOffset;

  TimecodeConfig({
    this.anchor,
    this.source,
    this.start,
    this.timestampOffset,
  });
  factory TimecodeConfig.fromJson(Map<String, dynamic> json) {
    return TimecodeConfig(
      anchor: json['anchor'] as String?,
      source: (json['source'] as String?)?.toTimecodeSource(),
      start: json['start'] as String?,
      timestampOffset: json['timestampOffset'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anchor = this.anchor;
    final source = this.source;
    final start = this.start;
    final timestampOffset = this.timestampOffset;
    return {
      if (anchor != null) 'anchor': anchor,
      if (source != null) 'source': source.toValue(),
      if (start != null) 'start': start,
      if (timestampOffset != null) 'timestampOffset': timestampOffset,
    };
  }
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
  embedded,
  zerobased,
  specifiedstart,
}

extension on TimecodeSource {
  String toValue() {
    switch (this) {
      case TimecodeSource.embedded:
        return 'EMBEDDED';
      case TimecodeSource.zerobased:
        return 'ZEROBASED';
      case TimecodeSource.specifiedstart:
        return 'SPECIFIEDSTART';
    }
  }
}

extension on String {
  TimecodeSource toTimecodeSource() {
    switch (this) {
      case 'EMBEDDED':
        return TimecodeSource.embedded;
      case 'ZEROBASED':
        return TimecodeSource.zerobased;
      case 'SPECIFIEDSTART':
        return TimecodeSource.specifiedstart;
    }
    throw Exception('$this is not known in enum TimecodeSource');
  }
}

/// Applies only to HLS outputs. Use this setting to specify whether the service
/// inserts the ID3 timed metadata from the input in this output.
enum TimedMetadata {
  passthrough,
  none,
}

extension on TimedMetadata {
  String toValue() {
    switch (this) {
      case TimedMetadata.passthrough:
        return 'PASSTHROUGH';
      case TimedMetadata.none:
        return 'NONE';
    }
  }
}

extension on String {
  TimedMetadata toTimedMetadata() {
    switch (this) {
      case 'PASSTHROUGH':
        return TimedMetadata.passthrough;
      case 'NONE':
        return TimedMetadata.none;
    }
    throw Exception('$this is not known in enum TimedMetadata');
  }
}

/// Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3 tags
/// in any HLS outputs. To include timed metadata, you must enable it here,
/// enable it in each output container, and specify tags and timecodes in ID3
/// insertion (Id3Insertion) objects.
class TimedMetadataInsertion {
  /// Id3Insertions contains the array of Id3Insertion instances.
  final List<Id3Insertion>? id3Insertions;

  TimedMetadataInsertion({
    this.id3Insertions,
  });
  factory TimedMetadataInsertion.fromJson(Map<String, dynamic> json) {
    return TimedMetadataInsertion(
      id3Insertions: (json['id3Insertions'] as List?)
          ?.whereNotNull()
          .map((e) => Id3Insertion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final id3Insertions = this.id3Insertions;
    return {
      if (id3Insertions != null) 'id3Insertions': id3Insertions,
    };
  }
}

/// Information about when jobs are submitted, started, and finished is
/// specified in Unix epoch format in seconds.
class Timing {
  /// The time, in Unix epoch format, that the transcoding job finished
  final DateTime? finishTime;

  /// The time, in Unix epoch format, that transcoding for the job began.
  final DateTime? startTime;

  /// The time, in Unix epoch format, that you submitted the job.
  final DateTime? submitTime;

  Timing({
    this.finishTime,
    this.startTime,
    this.submitTime,
  });
  factory Timing.fromJson(Map<String, dynamic> json) {
    return Timing(
      finishTime: timeStampFromJson(json['finishTime']),
      startTime: timeStampFromJson(json['startTime']),
      submitTime: timeStampFromJson(json['submitTime']),
    );
  }
}

/// Settings specific to caption sources that are specified by track number.
/// Currently, this is only IMSC captions in an IMF package. If your caption
/// source is IMSC 1.1 in a separate xml file, use FileSourceSettings instead of
/// TrackSourceSettings.
class TrackSourceSettings {
  /// Use this setting to select a single captions track from a source. Track
  /// numbers correspond to the order in the captions source file. For IMF
  /// sources, track numbering is based on the order that the captions appear in
  /// the CPL. For example, use 1 to select the captions asset that is listed
  /// first in the CPL. To include more than one captions track in your job
  /// outputs, create multiple input captions selectors. Specify one track per
  /// selector.
  final int? trackNumber;

  TrackSourceSettings({
    this.trackNumber,
  });
  factory TrackSourceSettings.fromJson(Map<String, dynamic> json) {
    return TrackSourceSettings(
      trackNumber: json['trackNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final trackNumber = this.trackNumber;
    return {
      if (trackNumber != null) 'trackNumber': trackNumber,
    };
  }
}

/// Settings specific to TTML caption outputs, including Pass style information
/// (TtmlStylePassthrough).
class TtmlDestinationSettings {
  /// Pass through style and position information from a TTML-like input source
  /// (TTML, SMPTE-TT) to the TTML output.
  final TtmlStylePassthrough? stylePassthrough;

  TtmlDestinationSettings({
    this.stylePassthrough,
  });
  factory TtmlDestinationSettings.fromJson(Map<String, dynamic> json) {
    return TtmlDestinationSettings(
      stylePassthrough:
          (json['stylePassthrough'] as String?)?.toTtmlStylePassthrough(),
    );
  }

  Map<String, dynamic> toJson() {
    final stylePassthrough = this.stylePassthrough;
    return {
      if (stylePassthrough != null)
        'stylePassthrough': stylePassthrough.toValue(),
    };
  }
}

/// Pass through style and position information from a TTML-like input source
/// (TTML, SMPTE-TT) to the TTML output.
enum TtmlStylePassthrough {
  enabled,
  disabled,
}

extension on TtmlStylePassthrough {
  String toValue() {
    switch (this) {
      case TtmlStylePassthrough.enabled:
        return 'ENABLED';
      case TtmlStylePassthrough.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  TtmlStylePassthrough toTtmlStylePassthrough() {
    switch (this) {
      case 'ENABLED':
        return TtmlStylePassthrough.enabled;
      case 'DISABLED':
        return TtmlStylePassthrough.disabled;
    }
    throw Exception('$this is not known in enum TtmlStylePassthrough');
  }
}

enum Type {
  system,
  custom,
}

extension on Type {
  String toValue() {
    switch (this) {
      case Type.system:
        return 'SYSTEM';
      case Type.custom:
        return 'CUSTOM';
    }
  }
}

extension on String {
  Type toType() {
    switch (this) {
      case 'SYSTEM':
        return Type.system;
      case 'CUSTOM':
        return Type.custom;
    }
    throw Exception('$this is not known in enum Type');
  }
}

class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class UpdateJobTemplateResponse {
  /// A job template is a pre-made set of encoding instructions that you can use
  /// to quickly create a job.
  final JobTemplate? jobTemplate;

  UpdateJobTemplateResponse({
    this.jobTemplate,
  });
  factory UpdateJobTemplateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateJobTemplateResponse(
      jobTemplate: json['jobTemplate'] != null
          ? JobTemplate.fromJson(json['jobTemplate'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UpdatePresetResponse {
  /// A preset is a collection of preconfigured media conversion settings that you
  /// want MediaConvert to apply to the output during the conversion process.
  final Preset? preset;

  UpdatePresetResponse({
    this.preset,
  });
  factory UpdatePresetResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePresetResponse(
      preset: json['preset'] != null
          ? Preset.fromJson(json['preset'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UpdateQueueResponse {
  /// You can use queues to manage the resources that are available to your AWS
  /// account for running multiple transcoding jobs at the same time. If you don't
  /// specify a queue, the service sends all jobs through the default queue. For
  /// more information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
  final Queue? queue;

  UpdateQueueResponse({
    this.queue,
  });
  factory UpdateQueueResponse.fromJson(Map<String, dynamic> json) {
    return UpdateQueueResponse(
      queue: json['queue'] != null
          ? Queue.fromJson(json['queue'] as Map<String, dynamic>)
          : null,
    );
  }
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
  class_145_8bit,
  class_220_8bit,
  class_220_10bit,
}

extension on Vc3Class {
  String toValue() {
    switch (this) {
      case Vc3Class.class_145_8bit:
        return 'CLASS_145_8BIT';
      case Vc3Class.class_220_8bit:
        return 'CLASS_220_8BIT';
      case Vc3Class.class_220_10bit:
        return 'CLASS_220_10BIT';
    }
  }
}

extension on String {
  Vc3Class toVc3Class() {
    switch (this) {
      case 'CLASS_145_8BIT':
        return Vc3Class.class_145_8bit;
      case 'CLASS_220_8BIT':
        return Vc3Class.class_220_8bit;
      case 'CLASS_220_10BIT':
        return Vc3Class.class_220_10bit;
    }
    throw Exception('$this is not known in enum Vc3Class');
  }
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
  initializeFromSource,
  specified,
}

extension on Vc3FramerateControl {
  String toValue() {
    switch (this) {
      case Vc3FramerateControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case Vc3FramerateControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  Vc3FramerateControl toVc3FramerateControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return Vc3FramerateControl.initializeFromSource;
      case 'SPECIFIED':
        return Vc3FramerateControl.specified;
    }
    throw Exception('$this is not known in enum Vc3FramerateControl');
  }
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
  duplicateDrop,
  interpolate,
  frameformer,
}

extension on Vc3FramerateConversionAlgorithm {
  String toValue() {
    switch (this) {
      case Vc3FramerateConversionAlgorithm.duplicateDrop:
        return 'DUPLICATE_DROP';
      case Vc3FramerateConversionAlgorithm.interpolate:
        return 'INTERPOLATE';
      case Vc3FramerateConversionAlgorithm.frameformer:
        return 'FRAMEFORMER';
    }
  }
}

extension on String {
  Vc3FramerateConversionAlgorithm toVc3FramerateConversionAlgorithm() {
    switch (this) {
      case 'DUPLICATE_DROP':
        return Vc3FramerateConversionAlgorithm.duplicateDrop;
      case 'INTERPOLATE':
        return Vc3FramerateConversionAlgorithm.interpolate;
      case 'FRAMEFORMER':
        return Vc3FramerateConversionAlgorithm.frameformer;
    }
    throw Exception(
        '$this is not known in enum Vc3FramerateConversionAlgorithm');
  }
}

/// Optional. Choose the scan line type for this output. If you don't specify a
/// value, MediaConvert will create a progressive output.
enum Vc3InterlaceMode {
  interlaced,
  progressive,
}

extension on Vc3InterlaceMode {
  String toValue() {
    switch (this) {
      case Vc3InterlaceMode.interlaced:
        return 'INTERLACED';
      case Vc3InterlaceMode.progressive:
        return 'PROGRESSIVE';
    }
  }
}

extension on String {
  Vc3InterlaceMode toVc3InterlaceMode() {
    switch (this) {
      case 'INTERLACED':
        return Vc3InterlaceMode.interlaced;
      case 'PROGRESSIVE':
        return Vc3InterlaceMode.progressive;
    }
    throw Exception('$this is not known in enum Vc3InterlaceMode');
  }
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value VC3
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
  final Vc3FramerateControl? framerateControl;

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
  final Vc3FramerateConversionAlgorithm? framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  final int? framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  final int? framerateNumerator;

  /// Optional. Choose the scan line type for this output. If you don't specify a
  /// value, MediaConvert will create a progressive output.
  final Vc3InterlaceMode? interlaceMode;

  /// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
  /// second (fps). Enable slow PAL to create a 25 fps output by relabeling the
  /// video frames and resampling your audio. Note that enabling this setting will
  /// slightly reduce the duration of your video. Related settings: You must also
  /// set Framerate to 25. In your JSON job specification, set (framerateControl)
  /// to (SPECIFIED), (framerateNumerator) to 25 and (framerateDenominator) to 1.
  final Vc3SlowPal? slowPal;

  /// When you do frame rate conversion from 23.976 frames per second (fps) to
  /// 29.97 fps, and your output scan type is interlaced, you can optionally
  /// enable hard telecine (HARD) to create a smoother picture. When you keep the
  /// default value, None (NONE), MediaConvert does a standard frame rate
  /// conversion to 29.97 without doing anything with the field polarity to create
  /// a smoother picture.
  final Vc3Telecine? telecine;

  /// Specify the VC3 class to choose the quality characteristics for this output.
  /// VC3 class, together with the settings Framerate (framerateNumerator and
  /// framerateDenominator) and Resolution (height and width), determine your
  /// output bitrate. For example, say that your video resolution is 1920x1080 and
  /// your framerate is 29.97. Then Class 145 (CLASS_145) gives you an output with
  /// a bitrate of approximately 145 Mbps and Class 220 (CLASS_220) gives you and
  /// output with a bitrate of approximately 220 Mbps. VC3 class also specifies
  /// the color bit depth of your output.
  final Vc3Class? vc3Class;

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
  factory Vc3Settings.fromJson(Map<String, dynamic> json) {
    return Vc3Settings(
      framerateControl:
          (json['framerateControl'] as String?)?.toVc3FramerateControl(),
      framerateConversionAlgorithm:
          (json['framerateConversionAlgorithm'] as String?)
              ?.toVc3FramerateConversionAlgorithm(),
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
      interlaceMode: (json['interlaceMode'] as String?)?.toVc3InterlaceMode(),
      slowPal: (json['slowPal'] as String?)?.toVc3SlowPal(),
      telecine: (json['telecine'] as String?)?.toVc3Telecine(),
      vc3Class: (json['vc3Class'] as String?)?.toVc3Class(),
    );
  }

  Map<String, dynamic> toJson() {
    final framerateControl = this.framerateControl;
    final framerateConversionAlgorithm = this.framerateConversionAlgorithm;
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final interlaceMode = this.interlaceMode;
    final slowPal = this.slowPal;
    final telecine = this.telecine;
    final vc3Class = this.vc3Class;
    return {
      if (framerateControl != null)
        'framerateControl': framerateControl.toValue(),
      if (framerateConversionAlgorithm != null)
        'framerateConversionAlgorithm': framerateConversionAlgorithm.toValue(),
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
      if (interlaceMode != null) 'interlaceMode': interlaceMode.toValue(),
      if (slowPal != null) 'slowPal': slowPal.toValue(),
      if (telecine != null) 'telecine': telecine.toValue(),
      if (vc3Class != null) 'vc3Class': vc3Class.toValue(),
    };
  }
}

/// Ignore this setting unless your input frame rate is 23.976 or 24 frames per
/// second (fps). Enable slow PAL to create a 25 fps output by relabeling the
/// video frames and resampling your audio. Note that enabling this setting will
/// slightly reduce the duration of your video. Related settings: You must also
/// set Framerate to 25. In your JSON job specification, set (framerateControl)
/// to (SPECIFIED), (framerateNumerator) to 25 and (framerateDenominator) to 1.
enum Vc3SlowPal {
  disabled,
  enabled,
}

extension on Vc3SlowPal {
  String toValue() {
    switch (this) {
      case Vc3SlowPal.disabled:
        return 'DISABLED';
      case Vc3SlowPal.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  Vc3SlowPal toVc3SlowPal() {
    switch (this) {
      case 'DISABLED':
        return Vc3SlowPal.disabled;
      case 'ENABLED':
        return Vc3SlowPal.enabled;
    }
    throw Exception('$this is not known in enum Vc3SlowPal');
  }
}

/// When you do frame rate conversion from 23.976 frames per second (fps) to
/// 29.97 fps, and your output scan type is interlaced, you can optionally
/// enable hard telecine (HARD) to create a smoother picture. When you keep the
/// default value, None (NONE), MediaConvert does a standard frame rate
/// conversion to 29.97 without doing anything with the field polarity to create
/// a smoother picture.
enum Vc3Telecine {
  none,
  hard,
}

extension on Vc3Telecine {
  String toValue() {
    switch (this) {
      case Vc3Telecine.none:
        return 'NONE';
      case Vc3Telecine.hard:
        return 'HARD';
    }
  }
}

extension on String {
  Vc3Telecine toVc3Telecine() {
    switch (this) {
      case 'NONE':
        return Vc3Telecine.none;
      case 'HARD':
        return Vc3Telecine.hard;
    }
    throw Exception('$this is not known in enum Vc3Telecine');
  }
}

/// Type of video codec
enum VideoCodec {
  av1,
  avcIntra,
  frameCapture,
  h_264,
  h_265,
  mpeg2,
  prores,
  vc3,
  vp8,
  vp9,
}

extension on VideoCodec {
  String toValue() {
    switch (this) {
      case VideoCodec.av1:
        return 'AV1';
      case VideoCodec.avcIntra:
        return 'AVC_INTRA';
      case VideoCodec.frameCapture:
        return 'FRAME_CAPTURE';
      case VideoCodec.h_264:
        return 'H_264';
      case VideoCodec.h_265:
        return 'H_265';
      case VideoCodec.mpeg2:
        return 'MPEG2';
      case VideoCodec.prores:
        return 'PRORES';
      case VideoCodec.vc3:
        return 'VC3';
      case VideoCodec.vp8:
        return 'VP8';
      case VideoCodec.vp9:
        return 'VP9';
    }
  }
}

extension on String {
  VideoCodec toVideoCodec() {
    switch (this) {
      case 'AV1':
        return VideoCodec.av1;
      case 'AVC_INTRA':
        return VideoCodec.avcIntra;
      case 'FRAME_CAPTURE':
        return VideoCodec.frameCapture;
      case 'H_264':
        return VideoCodec.h_264;
      case 'H_265':
        return VideoCodec.h_265;
      case 'MPEG2':
        return VideoCodec.mpeg2;
      case 'PRORES':
        return VideoCodec.prores;
      case 'VC3':
        return VideoCodec.vc3;
      case 'VP8':
        return VideoCodec.vp8;
      case 'VP9':
        return VideoCodec.vp9;
    }
    throw Exception('$this is not known in enum VideoCodec');
  }
}

/// Video codec settings, (CodecSettings) under (VideoDescription), contains the
/// group of settings related to video encoding. The settings in this group vary
/// depending on the value that you choose for Video codec (Codec). For each
/// codec enum that you choose, define the corresponding settings object. The
/// following lists the codec enum, settings object pairs. * AV1, Av1Settings *
/// AVC_INTRA, AvcIntraSettings * FRAME_CAPTURE, FrameCaptureSettings * H_264,
/// H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES,
/// ProresSettings * VC3, Vc3Settings * VP8, Vp8Settings * VP9, Vp9Settings
class VideoCodecSettings {
  /// Required when you set Codec, under VideoDescription>CodecSettings to the
  /// value AV1.
  final Av1Settings? av1Settings;

  /// Required when you set your output video codec to AVC-Intra. For more
  /// information about the AVC-I settings, see the relevant specification. For
  /// detailed information about SD and HD in AVC-I, see
  /// https://ieeexplore.ieee.org/document/7290936.
  final AvcIntraSettings? avcIntraSettings;

  /// Specifies the video codec. This must be equal to one of the enum values
  /// defined by the object  VideoCodec.
  final VideoCodec? codec;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value FRAME_CAPTURE.
  final FrameCaptureSettings? frameCaptureSettings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value H_264.
  final H264Settings? h264Settings;

  /// Settings for H265 codec
  final H265Settings? h265Settings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value MPEG2.
  final Mpeg2Settings? mpeg2Settings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value PRORES.
  final ProresSettings? proresSettings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value VC3
  final Vc3Settings? vc3Settings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value VP8.
  final Vp8Settings? vp8Settings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value VP9.
  final Vp9Settings? vp9Settings;

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
  factory VideoCodecSettings.fromJson(Map<String, dynamic> json) {
    return VideoCodecSettings(
      av1Settings: json['av1Settings'] != null
          ? Av1Settings.fromJson(json['av1Settings'] as Map<String, dynamic>)
          : null,
      avcIntraSettings: json['avcIntraSettings'] != null
          ? AvcIntraSettings.fromJson(
              json['avcIntraSettings'] as Map<String, dynamic>)
          : null,
      codec: (json['codec'] as String?)?.toVideoCodec(),
      frameCaptureSettings: json['frameCaptureSettings'] != null
          ? FrameCaptureSettings.fromJson(
              json['frameCaptureSettings'] as Map<String, dynamic>)
          : null,
      h264Settings: json['h264Settings'] != null
          ? H264Settings.fromJson(json['h264Settings'] as Map<String, dynamic>)
          : null,
      h265Settings: json['h265Settings'] != null
          ? H265Settings.fromJson(json['h265Settings'] as Map<String, dynamic>)
          : null,
      mpeg2Settings: json['mpeg2Settings'] != null
          ? Mpeg2Settings.fromJson(
              json['mpeg2Settings'] as Map<String, dynamic>)
          : null,
      proresSettings: json['proresSettings'] != null
          ? ProresSettings.fromJson(
              json['proresSettings'] as Map<String, dynamic>)
          : null,
      vc3Settings: json['vc3Settings'] != null
          ? Vc3Settings.fromJson(json['vc3Settings'] as Map<String, dynamic>)
          : null,
      vp8Settings: json['vp8Settings'] != null
          ? Vp8Settings.fromJson(json['vp8Settings'] as Map<String, dynamic>)
          : null,
      vp9Settings: json['vp9Settings'] != null
          ? Vp9Settings.fromJson(json['vp9Settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final av1Settings = this.av1Settings;
    final avcIntraSettings = this.avcIntraSettings;
    final codec = this.codec;
    final frameCaptureSettings = this.frameCaptureSettings;
    final h264Settings = this.h264Settings;
    final h265Settings = this.h265Settings;
    final mpeg2Settings = this.mpeg2Settings;
    final proresSettings = this.proresSettings;
    final vc3Settings = this.vc3Settings;
    final vp8Settings = this.vp8Settings;
    final vp9Settings = this.vp9Settings;
    return {
      if (av1Settings != null) 'av1Settings': av1Settings,
      if (avcIntraSettings != null) 'avcIntraSettings': avcIntraSettings,
      if (codec != null) 'codec': codec.toValue(),
      if (frameCaptureSettings != null)
        'frameCaptureSettings': frameCaptureSettings,
      if (h264Settings != null) 'h264Settings': h264Settings,
      if (h265Settings != null) 'h265Settings': h265Settings,
      if (mpeg2Settings != null) 'mpeg2Settings': mpeg2Settings,
      if (proresSettings != null) 'proresSettings': proresSettings,
      if (vc3Settings != null) 'vc3Settings': vc3Settings,
      if (vp8Settings != null) 'vp8Settings': vp8Settings,
      if (vp9Settings != null) 'vp9Settings': vp9Settings,
    };
  }
}

/// Settings for video outputs
class VideoDescription {
  /// This setting only applies to H.264, H.265, and MPEG2 outputs. Use Insert AFD
  /// signaling (AfdSignaling) to specify whether the service includes AFD values
  /// in the output video data and what those values are. * Choose None to remove
  /// all AFD values from this output. * Choose Fixed to ignore input AFD values
  /// and instead encode the value specified in the job. * Choose Auto to
  /// calculate output AFD values based on the input AFD scaler data.
  final AfdSignaling? afdSignaling;

  /// The anti-alias filter is automatically applied to all outputs. The service
  /// no longer accepts the value DISABLED for AntiAlias. If you specify that in
  /// your job, the service will ignore the setting.
  final AntiAlias? antiAlias;

  /// Video codec settings, (CodecSettings) under (VideoDescription), contains the
  /// group of settings related to video encoding. The settings in this group vary
  /// depending on the value that you choose for Video codec (Codec). For each
  /// codec enum that you choose, define the corresponding settings object. The
  /// following lists the codec enum, settings object pairs. * AV1, Av1Settings *
  /// AVC_INTRA, AvcIntraSettings * FRAME_CAPTURE, FrameCaptureSettings * H_264,
  /// H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES,
  /// ProresSettings * VC3, Vc3Settings * VP8, Vp8Settings * VP9, Vp9Settings
  final VideoCodecSettings? codecSettings;

  /// Choose Insert (INSERT) for this setting to include color metadata in this
  /// output. Choose Ignore (IGNORE) to exclude color metadata from this output.
  /// If you don't specify a value, the service sets this to Insert by default.
  final ColorMetadata? colorMetadata;

  /// Use Cropping selection (crop) to specify the video area that the service
  /// will include in the output video frame.
  final Rectangle? crop;

  /// Applies only to 29.97 fps outputs. When this feature is enabled, the service
  /// will use drop-frame timecode on outputs. If it is not possible to use
  /// drop-frame timecode, the system will fall back to non-drop-frame. This
  /// setting is enabled by default when Timecode insertion (TimecodeInsertion) is
  /// enabled.
  final DropFrameTimecode? dropFrameTimecode;

  /// Applies only if you set AFD Signaling(AfdSignaling) to Fixed (FIXED). Use
  /// Fixed (FixedAfd) to specify a four-bit AFD value which the service will
  /// write on all  frames of this video output.
  final int? fixedAfd;

  /// Use the Height (Height) setting to define the video resolution height for
  /// this output. Specify in pixels. If you don't provide a value here, the
  /// service will use the input height.
  final int? height;

  /// Use Selection placement (position) to define the video area in your output
  /// frame. The area outside of the rectangle that you specify here is black.
  final Rectangle? position;

  /// Use Respond to AFD (RespondToAfd) to specify how the service changes the
  /// video itself in response to AFD values in the input. * Choose Respond to
  /// clip the input video frame according to the AFD value, input display aspect
  /// ratio, and output display aspect ratio. * Choose Passthrough to include the
  /// input AFD values. Do not choose this when AfdSignaling is set to (NONE). A
  /// preferred implementation of this workflow is to set RespondToAfd to (NONE)
  /// and set AfdSignaling to (AUTO). * Choose None to remove all input AFD values
  /// from this output.
  final RespondToAfd? respondToAfd;

  /// Specify how the service handles outputs that have a different aspect ratio
  /// from the input aspect ratio. Choose Stretch to output (STRETCH_TO_OUTPUT) to
  /// have the service stretch your video image to fit. Keep the setting Default
  /// (DEFAULT) to have the service letterbox your video instead. This setting
  /// overrides any value that you specify for the setting Selection placement
  /// (position) in this output.
  final ScalingBehavior? scalingBehavior;

  /// Use Sharpness (Sharpness) setting to specify the strength of anti-aliasing.
  /// This setting changes the width of the anti-alias filter kernel used for
  /// scaling. Sharpness only applies if your output resolution is different from
  /// your input resolution. 0 is the softest setting, 100 the sharpest, and 50
  /// recommended for most content.
  final int? sharpness;

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
  final VideoTimecodeInsertion? timecodeInsertion;

  /// Find additional transcoding features under Preprocessors
  /// (VideoPreprocessors). Enable the features at each output individually. These
  /// features are disabled by default.
  final VideoPreprocessor? videoPreprocessors;

  /// Use Width (Width) to define the video resolution width, in pixels, for this
  /// output. If you don't provide a value here, the service will use the input
  /// width.
  final int? width;

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
  factory VideoDescription.fromJson(Map<String, dynamic> json) {
    return VideoDescription(
      afdSignaling: (json['afdSignaling'] as String?)?.toAfdSignaling(),
      antiAlias: (json['antiAlias'] as String?)?.toAntiAlias(),
      codecSettings: json['codecSettings'] != null
          ? VideoCodecSettings.fromJson(
              json['codecSettings'] as Map<String, dynamic>)
          : null,
      colorMetadata: (json['colorMetadata'] as String?)?.toColorMetadata(),
      crop: json['crop'] != null
          ? Rectangle.fromJson(json['crop'] as Map<String, dynamic>)
          : null,
      dropFrameTimecode:
          (json['dropFrameTimecode'] as String?)?.toDropFrameTimecode(),
      fixedAfd: json['fixedAfd'] as int?,
      height: json['height'] as int?,
      position: json['position'] != null
          ? Rectangle.fromJson(json['position'] as Map<String, dynamic>)
          : null,
      respondToAfd: (json['respondToAfd'] as String?)?.toRespondToAfd(),
      scalingBehavior:
          (json['scalingBehavior'] as String?)?.toScalingBehavior(),
      sharpness: json['sharpness'] as int?,
      timecodeInsertion:
          (json['timecodeInsertion'] as String?)?.toVideoTimecodeInsertion(),
      videoPreprocessors: json['videoPreprocessors'] != null
          ? VideoPreprocessor.fromJson(
              json['videoPreprocessors'] as Map<String, dynamic>)
          : null,
      width: json['width'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final afdSignaling = this.afdSignaling;
    final antiAlias = this.antiAlias;
    final codecSettings = this.codecSettings;
    final colorMetadata = this.colorMetadata;
    final crop = this.crop;
    final dropFrameTimecode = this.dropFrameTimecode;
    final fixedAfd = this.fixedAfd;
    final height = this.height;
    final position = this.position;
    final respondToAfd = this.respondToAfd;
    final scalingBehavior = this.scalingBehavior;
    final sharpness = this.sharpness;
    final timecodeInsertion = this.timecodeInsertion;
    final videoPreprocessors = this.videoPreprocessors;
    final width = this.width;
    return {
      if (afdSignaling != null) 'afdSignaling': afdSignaling.toValue(),
      if (antiAlias != null) 'antiAlias': antiAlias.toValue(),
      if (codecSettings != null) 'codecSettings': codecSettings,
      if (colorMetadata != null) 'colorMetadata': colorMetadata.toValue(),
      if (crop != null) 'crop': crop,
      if (dropFrameTimecode != null)
        'dropFrameTimecode': dropFrameTimecode.toValue(),
      if (fixedAfd != null) 'fixedAfd': fixedAfd,
      if (height != null) 'height': height,
      if (position != null) 'position': position,
      if (respondToAfd != null) 'respondToAfd': respondToAfd.toValue(),
      if (scalingBehavior != null) 'scalingBehavior': scalingBehavior.toValue(),
      if (sharpness != null) 'sharpness': sharpness,
      if (timecodeInsertion != null)
        'timecodeInsertion': timecodeInsertion.toValue(),
      if (videoPreprocessors != null) 'videoPreprocessors': videoPreprocessors,
      if (width != null) 'width': width,
    };
  }
}

/// Contains details about the output's video stream
class VideoDetail {
  /// Height in pixels for the output
  final int? heightInPx;

  /// Width in pixels for the output
  final int? widthInPx;

  VideoDetail({
    this.heightInPx,
    this.widthInPx,
  });
  factory VideoDetail.fromJson(Map<String, dynamic> json) {
    return VideoDetail(
      heightInPx: json['heightInPx'] as int?,
      widthInPx: json['widthInPx'] as int?,
    );
  }
}

/// Find additional transcoding features under Preprocessors
/// (VideoPreprocessors). Enable the features at each output individually. These
/// features are disabled by default.
class VideoPreprocessor {
  /// Enable the Color corrector (ColorCorrector) feature if necessary. Enable or
  /// disable this feature for each output individually. This setting is disabled
  /// by default.
  final ColorCorrector? colorCorrector;

  /// Use Deinterlacer (Deinterlacer) to produce smoother motion and a clearer
  /// picture.
  final Deinterlacer? deinterlacer;

  /// Enable Dolby Vision feature to produce Dolby Vision compatible video output.
  final DolbyVision? dolbyVision;

  /// Enable the Image inserter (ImageInserter) feature to include a graphic
  /// overlay on your video. Enable or disable this feature for each output
  /// individually. This setting is disabled by default.
  final ImageInserter? imageInserter;

  /// Enable the Noise reducer (NoiseReducer) feature to remove noise from your
  /// video output if necessary. Enable or disable this feature for each output
  /// individually. This setting is disabled by default.
  final NoiseReducer? noiseReducer;

  /// If you work with a third party video watermarking partner, use the group of
  /// settings that correspond with your watermarking partner to include
  /// watermarks in your output.
  final PartnerWatermarking? partnerWatermarking;

  /// Timecode burn-in (TimecodeBurnIn)--Burns the output timecode and specified
  /// prefix into the output.
  final TimecodeBurnin? timecodeBurnin;

  VideoPreprocessor({
    this.colorCorrector,
    this.deinterlacer,
    this.dolbyVision,
    this.imageInserter,
    this.noiseReducer,
    this.partnerWatermarking,
    this.timecodeBurnin,
  });
  factory VideoPreprocessor.fromJson(Map<String, dynamic> json) {
    return VideoPreprocessor(
      colorCorrector: json['colorCorrector'] != null
          ? ColorCorrector.fromJson(
              json['colorCorrector'] as Map<String, dynamic>)
          : null,
      deinterlacer: json['deinterlacer'] != null
          ? Deinterlacer.fromJson(json['deinterlacer'] as Map<String, dynamic>)
          : null,
      dolbyVision: json['dolbyVision'] != null
          ? DolbyVision.fromJson(json['dolbyVision'] as Map<String, dynamic>)
          : null,
      imageInserter: json['imageInserter'] != null
          ? ImageInserter.fromJson(
              json['imageInserter'] as Map<String, dynamic>)
          : null,
      noiseReducer: json['noiseReducer'] != null
          ? NoiseReducer.fromJson(json['noiseReducer'] as Map<String, dynamic>)
          : null,
      partnerWatermarking: json['partnerWatermarking'] != null
          ? PartnerWatermarking.fromJson(
              json['partnerWatermarking'] as Map<String, dynamic>)
          : null,
      timecodeBurnin: json['timecodeBurnin'] != null
          ? TimecodeBurnin.fromJson(
              json['timecodeBurnin'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final colorCorrector = this.colorCorrector;
    final deinterlacer = this.deinterlacer;
    final dolbyVision = this.dolbyVision;
    final imageInserter = this.imageInserter;
    final noiseReducer = this.noiseReducer;
    final partnerWatermarking = this.partnerWatermarking;
    final timecodeBurnin = this.timecodeBurnin;
    return {
      if (colorCorrector != null) 'colorCorrector': colorCorrector,
      if (deinterlacer != null) 'deinterlacer': deinterlacer,
      if (dolbyVision != null) 'dolbyVision': dolbyVision,
      if (imageInserter != null) 'imageInserter': imageInserter,
      if (noiseReducer != null) 'noiseReducer': noiseReducer,
      if (partnerWatermarking != null)
        'partnerWatermarking': partnerWatermarking,
      if (timecodeBurnin != null) 'timecodeBurnin': timecodeBurnin,
    };
  }
}

/// Selector for video.
class VideoSelector {
  /// Ignore this setting unless this input is a QuickTime animation with an alpha
  /// channel. Use this setting to create separate Key and Fill outputs. In each
  /// output, specify which part of the input MediaConvert uses. Leave this
  /// setting at the default value DISCARD to delete the alpha channel and
  /// preserve the video. Set it to REMAP_TO_LUMA to delete the video and map the
  /// alpha channel to the luma channel of your outputs.
  final AlphaBehavior? alphaBehavior;

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
  final ColorSpace? colorSpace;

  /// There are two sources for color metadata, the input file and the job input
  /// settings Color space (ColorSpace) and HDR master display information
  /// settings(Hdr10Metadata). The Color space usage setting determines which
  /// takes precedence. Choose Force (FORCE) to use color metadata from the input
  /// job settings. If you don't specify values for those settings, the service
  /// defaults to using metadata from your input. FALLBACK - Choose Fallback
  /// (FALLBACK) to use color metadata from the source when it is present. If
  /// there's no color metadata in your input file, the service defaults to using
  /// values you specify in the input settings.
  final ColorSpaceUsage? colorSpaceUsage;

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
  final Hdr10Metadata? hdr10Metadata;

  /// Use PID (Pid) to select specific video data from an input file. Specify this
  /// value as an integer; the system automatically converts it to the hexidecimal
  /// value. For example, 257 selects PID 0x101. A PID, or packet identifier, is
  /// an identifier for a set of data in an MPEG-2 transport stream container.
  final int? pid;

  /// Selects a specific program from within a multi-program transport stream.
  /// Note that Quad 4K is not currently supported.
  final int? programNumber;

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
  final InputRotate? rotate;

  VideoSelector({
    this.alphaBehavior,
    this.colorSpace,
    this.colorSpaceUsage,
    this.hdr10Metadata,
    this.pid,
    this.programNumber,
    this.rotate,
  });
  factory VideoSelector.fromJson(Map<String, dynamic> json) {
    return VideoSelector(
      alphaBehavior: (json['alphaBehavior'] as String?)?.toAlphaBehavior(),
      colorSpace: (json['colorSpace'] as String?)?.toColorSpace(),
      colorSpaceUsage:
          (json['colorSpaceUsage'] as String?)?.toColorSpaceUsage(),
      hdr10Metadata: json['hdr10Metadata'] != null
          ? Hdr10Metadata.fromJson(
              json['hdr10Metadata'] as Map<String, dynamic>)
          : null,
      pid: json['pid'] as int?,
      programNumber: json['programNumber'] as int?,
      rotate: (json['rotate'] as String?)?.toInputRotate(),
    );
  }

  Map<String, dynamic> toJson() {
    final alphaBehavior = this.alphaBehavior;
    final colorSpace = this.colorSpace;
    final colorSpaceUsage = this.colorSpaceUsage;
    final hdr10Metadata = this.hdr10Metadata;
    final pid = this.pid;
    final programNumber = this.programNumber;
    final rotate = this.rotate;
    return {
      if (alphaBehavior != null) 'alphaBehavior': alphaBehavior.toValue(),
      if (colorSpace != null) 'colorSpace': colorSpace.toValue(),
      if (colorSpaceUsage != null) 'colorSpaceUsage': colorSpaceUsage.toValue(),
      if (hdr10Metadata != null) 'hdr10Metadata': hdr10Metadata,
      if (pid != null) 'pid': pid,
      if (programNumber != null) 'programNumber': programNumber,
      if (rotate != null) 'rotate': rotate.toValue(),
    };
  }
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
  disabled,
  picTimingSei,
}

extension on VideoTimecodeInsertion {
  String toValue() {
    switch (this) {
      case VideoTimecodeInsertion.disabled:
        return 'DISABLED';
      case VideoTimecodeInsertion.picTimingSei:
        return 'PIC_TIMING_SEI';
    }
  }
}

extension on String {
  VideoTimecodeInsertion toVideoTimecodeInsertion() {
    switch (this) {
      case 'DISABLED':
        return VideoTimecodeInsertion.disabled;
      case 'PIC_TIMING_SEI':
        return VideoTimecodeInsertion.picTimingSei;
    }
    throw Exception('$this is not known in enum VideoTimecodeInsertion');
  }
}

/// Required when you set Codec, under AudioDescriptions>CodecSettings, to the
/// value Vorbis.
class VorbisSettings {
  /// Optional. Specify the number of channels in this output audio track.
  /// Choosing Mono on the console gives you 1 output channel; choosing Stereo
  /// gives you 2. In the API, valid values are 1 and 2. The default value is 2.
  final int? channels;

  /// Optional. Specify the audio sample rate in Hz. Valid values are 22050,
  /// 32000, 44100, and 48000. The default value is 48000.
  final int? sampleRate;

  /// Optional. Specify the variable audio quality of this Vorbis output from -1
  /// (lowest quality, ~45 kbit/s) to 10 (highest quality, ~500 kbit/s). The
  /// default value is 4 (~128 kbit/s). Values 5 and 6 are approximately 160 and
  /// 192 kbit/s, respectively.
  final int? vbrQuality;

  VorbisSettings({
    this.channels,
    this.sampleRate,
    this.vbrQuality,
  });
  factory VorbisSettings.fromJson(Map<String, dynamic> json) {
    return VorbisSettings(
      channels: json['channels'] as int?,
      sampleRate: json['sampleRate'] as int?,
      vbrQuality: json['vbrQuality'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final sampleRate = this.sampleRate;
    final vbrQuality = this.vbrQuality;
    return {
      if (channels != null) 'channels': channels,
      if (sampleRate != null) 'sampleRate': sampleRate,
      if (vbrQuality != null) 'vbrQuality': vbrQuality,
    };
  }
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
  initializeFromSource,
  specified,
}

extension on Vp8FramerateControl {
  String toValue() {
    switch (this) {
      case Vp8FramerateControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case Vp8FramerateControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  Vp8FramerateControl toVp8FramerateControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return Vp8FramerateControl.initializeFromSource;
      case 'SPECIFIED':
        return Vp8FramerateControl.specified;
    }
    throw Exception('$this is not known in enum Vp8FramerateControl');
  }
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
  duplicateDrop,
  interpolate,
  frameformer,
}

extension on Vp8FramerateConversionAlgorithm {
  String toValue() {
    switch (this) {
      case Vp8FramerateConversionAlgorithm.duplicateDrop:
        return 'DUPLICATE_DROP';
      case Vp8FramerateConversionAlgorithm.interpolate:
        return 'INTERPOLATE';
      case Vp8FramerateConversionAlgorithm.frameformer:
        return 'FRAMEFORMER';
    }
  }
}

extension on String {
  Vp8FramerateConversionAlgorithm toVp8FramerateConversionAlgorithm() {
    switch (this) {
      case 'DUPLICATE_DROP':
        return Vp8FramerateConversionAlgorithm.duplicateDrop;
      case 'INTERPOLATE':
        return Vp8FramerateConversionAlgorithm.interpolate;
      case 'FRAMEFORMER':
        return Vp8FramerateConversionAlgorithm.frameformer;
    }
    throw Exception(
        '$this is not known in enum Vp8FramerateConversionAlgorithm');
  }
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
  initializeFromSource,
  specified,
}

extension on Vp8ParControl {
  String toValue() {
    switch (this) {
      case Vp8ParControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case Vp8ParControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  Vp8ParControl toVp8ParControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return Vp8ParControl.initializeFromSource;
      case 'SPECIFIED':
        return Vp8ParControl.specified;
    }
    throw Exception('$this is not known in enum Vp8ParControl');
  }
}

/// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
/// want to trade off encoding speed for output video quality. The default
/// behavior is faster, lower quality, multi-pass encoding.
enum Vp8QualityTuningLevel {
  multiPass,
  multiPassHq,
}

extension on Vp8QualityTuningLevel {
  String toValue() {
    switch (this) {
      case Vp8QualityTuningLevel.multiPass:
        return 'MULTI_PASS';
      case Vp8QualityTuningLevel.multiPassHq:
        return 'MULTI_PASS_HQ';
    }
  }
}

extension on String {
  Vp8QualityTuningLevel toVp8QualityTuningLevel() {
    switch (this) {
      case 'MULTI_PASS':
        return Vp8QualityTuningLevel.multiPass;
      case 'MULTI_PASS_HQ':
        return Vp8QualityTuningLevel.multiPassHq;
    }
    throw Exception('$this is not known in enum Vp8QualityTuningLevel');
  }
}

/// With the VP8 codec, you can use only the variable bitrate (VBR) rate control
/// mode.
enum Vp8RateControlMode {
  vbr,
}

extension on Vp8RateControlMode {
  String toValue() {
    switch (this) {
      case Vp8RateControlMode.vbr:
        return 'VBR';
    }
  }
}

extension on String {
  Vp8RateControlMode toVp8RateControlMode() {
    switch (this) {
      case 'VBR':
        return Vp8RateControlMode.vbr;
    }
    throw Exception('$this is not known in enum Vp8RateControlMode');
  }
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value VP8.
class Vp8Settings {
  /// Target bitrate in bits/second. For example, enter five megabits per second
  /// as 5000000.
  final int? bitrate;

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
  final Vp8FramerateControl? framerateControl;

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
  final Vp8FramerateConversionAlgorithm? framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  final int? framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  final int? framerateNumerator;

  /// GOP Length (keyframe interval) in frames. Must be greater than zero.
  final double? gopSize;

  /// Optional. Size of buffer (HRD buffer model) in bits. For example, enter five
  /// megabits as 5000000.
  final int? hrdBufferSize;

  /// Ignore this setting unless you set qualityTuningLevel to MULTI_PASS.
  /// Optional. Specify the maximum bitrate in bits/second. For example, enter
  /// five megabits per second as 5000000. The default behavior uses twice the
  /// target bitrate as the maximum bitrate.
  final int? maxBitrate;

  /// Optional. Specify how the service determines the pixel aspect ratio (PAR)
  /// for this output. The default behavior, Follow source
  /// (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your
  /// output. To specify a different PAR in the console, choose any value other
  /// than Follow source. To specify a different PAR by editing the JSON job
  /// specification, choose SPECIFIED. When you choose SPECIFIED for this setting,
  /// you must also specify values for the parNumerator and parDenominator
  /// settings.
  final Vp8ParControl? parControl;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parDenominator is 33.
  final int? parDenominator;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parNumerator is 40.
  final int? parNumerator;

  /// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
  /// want to trade off encoding speed for output video quality. The default
  /// behavior is faster, lower quality, multi-pass encoding.
  final Vp8QualityTuningLevel? qualityTuningLevel;

  /// With the VP8 codec, you can use only the variable bitrate (VBR) rate control
  /// mode.
  final Vp8RateControlMode? rateControlMode;

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
  factory Vp8Settings.fromJson(Map<String, dynamic> json) {
    return Vp8Settings(
      bitrate: json['bitrate'] as int?,
      framerateControl:
          (json['framerateControl'] as String?)?.toVp8FramerateControl(),
      framerateConversionAlgorithm:
          (json['framerateConversionAlgorithm'] as String?)
              ?.toVp8FramerateConversionAlgorithm(),
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
      gopSize: json['gopSize'] as double?,
      hrdBufferSize: json['hrdBufferSize'] as int?,
      maxBitrate: json['maxBitrate'] as int?,
      parControl: (json['parControl'] as String?)?.toVp8ParControl(),
      parDenominator: json['parDenominator'] as int?,
      parNumerator: json['parNumerator'] as int?,
      qualityTuningLevel:
          (json['qualityTuningLevel'] as String?)?.toVp8QualityTuningLevel(),
      rateControlMode:
          (json['rateControlMode'] as String?)?.toVp8RateControlMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final bitrate = this.bitrate;
    final framerateControl = this.framerateControl;
    final framerateConversionAlgorithm = this.framerateConversionAlgorithm;
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final gopSize = this.gopSize;
    final hrdBufferSize = this.hrdBufferSize;
    final maxBitrate = this.maxBitrate;
    final parControl = this.parControl;
    final parDenominator = this.parDenominator;
    final parNumerator = this.parNumerator;
    final qualityTuningLevel = this.qualityTuningLevel;
    final rateControlMode = this.rateControlMode;
    return {
      if (bitrate != null) 'bitrate': bitrate,
      if (framerateControl != null)
        'framerateControl': framerateControl.toValue(),
      if (framerateConversionAlgorithm != null)
        'framerateConversionAlgorithm': framerateConversionAlgorithm.toValue(),
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
      if (gopSize != null) 'gopSize': gopSize,
      if (hrdBufferSize != null) 'hrdBufferSize': hrdBufferSize,
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (parControl != null) 'parControl': parControl.toValue(),
      if (parDenominator != null) 'parDenominator': parDenominator,
      if (parNumerator != null) 'parNumerator': parNumerator,
      if (qualityTuningLevel != null)
        'qualityTuningLevel': qualityTuningLevel.toValue(),
      if (rateControlMode != null) 'rateControlMode': rateControlMode.toValue(),
    };
  }
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
  initializeFromSource,
  specified,
}

extension on Vp9FramerateControl {
  String toValue() {
    switch (this) {
      case Vp9FramerateControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case Vp9FramerateControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  Vp9FramerateControl toVp9FramerateControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return Vp9FramerateControl.initializeFromSource;
      case 'SPECIFIED':
        return Vp9FramerateControl.specified;
    }
    throw Exception('$this is not known in enum Vp9FramerateControl');
  }
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
  duplicateDrop,
  interpolate,
  frameformer,
}

extension on Vp9FramerateConversionAlgorithm {
  String toValue() {
    switch (this) {
      case Vp9FramerateConversionAlgorithm.duplicateDrop:
        return 'DUPLICATE_DROP';
      case Vp9FramerateConversionAlgorithm.interpolate:
        return 'INTERPOLATE';
      case Vp9FramerateConversionAlgorithm.frameformer:
        return 'FRAMEFORMER';
    }
  }
}

extension on String {
  Vp9FramerateConversionAlgorithm toVp9FramerateConversionAlgorithm() {
    switch (this) {
      case 'DUPLICATE_DROP':
        return Vp9FramerateConversionAlgorithm.duplicateDrop;
      case 'INTERPOLATE':
        return Vp9FramerateConversionAlgorithm.interpolate;
      case 'FRAMEFORMER':
        return Vp9FramerateConversionAlgorithm.frameformer;
    }
    throw Exception(
        '$this is not known in enum Vp9FramerateConversionAlgorithm');
  }
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
  initializeFromSource,
  specified,
}

extension on Vp9ParControl {
  String toValue() {
    switch (this) {
      case Vp9ParControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case Vp9ParControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  Vp9ParControl toVp9ParControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return Vp9ParControl.initializeFromSource;
      case 'SPECIFIED':
        return Vp9ParControl.specified;
    }
    throw Exception('$this is not known in enum Vp9ParControl');
  }
}

/// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
/// want to trade off encoding speed for output video quality. The default
/// behavior is faster, lower quality, multi-pass encoding.
enum Vp9QualityTuningLevel {
  multiPass,
  multiPassHq,
}

extension on Vp9QualityTuningLevel {
  String toValue() {
    switch (this) {
      case Vp9QualityTuningLevel.multiPass:
        return 'MULTI_PASS';
      case Vp9QualityTuningLevel.multiPassHq:
        return 'MULTI_PASS_HQ';
    }
  }
}

extension on String {
  Vp9QualityTuningLevel toVp9QualityTuningLevel() {
    switch (this) {
      case 'MULTI_PASS':
        return Vp9QualityTuningLevel.multiPass;
      case 'MULTI_PASS_HQ':
        return Vp9QualityTuningLevel.multiPassHq;
    }
    throw Exception('$this is not known in enum Vp9QualityTuningLevel');
  }
}

/// With the VP9 codec, you can use only the variable bitrate (VBR) rate control
/// mode.
enum Vp9RateControlMode {
  vbr,
}

extension on Vp9RateControlMode {
  String toValue() {
    switch (this) {
      case Vp9RateControlMode.vbr:
        return 'VBR';
    }
  }
}

extension on String {
  Vp9RateControlMode toVp9RateControlMode() {
    switch (this) {
      case 'VBR':
        return Vp9RateControlMode.vbr;
    }
    throw Exception('$this is not known in enum Vp9RateControlMode');
  }
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value VP9.
class Vp9Settings {
  /// Target bitrate in bits/second. For example, enter five megabits per second
  /// as 5000000.
  final int? bitrate;

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
  final Vp9FramerateControl? framerateControl;

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
  final Vp9FramerateConversionAlgorithm? framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  final int? framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example,  24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator. When you use
  /// the console for transcode jobs that use frame rate conversion, provide the
  /// value as a decimal number for Framerate. In this example, specify 23.976.
  final int? framerateNumerator;

  /// GOP Length (keyframe interval) in frames. Must be greater than zero.
  final double? gopSize;

  /// Size of buffer (HRD buffer model) in bits. For example, enter five megabits
  /// as 5000000.
  final int? hrdBufferSize;

  /// Ignore this setting unless you set qualityTuningLevel to MULTI_PASS.
  /// Optional. Specify the maximum bitrate in bits/second. For example, enter
  /// five megabits per second as 5000000. The default behavior uses twice the
  /// target bitrate as the maximum bitrate.
  final int? maxBitrate;

  /// Optional. Specify how the service determines the pixel aspect ratio for this
  /// output. The default behavior is to use the same pixel aspect ratio as your
  /// input video.
  final Vp9ParControl? parControl;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parDenominator is 33.
  final int? parDenominator;

  /// Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the
  /// console, this corresponds to any value other than Follow source. When you
  /// specify an output pixel aspect ratio (PAR) that is different from your input
  /// video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC
  /// widescreen, you would specify the ratio 40:33. In this example, the value
  /// for parNumerator is 40.
  final int? parNumerator;

  /// Optional. Use Quality tuning level (qualityTuningLevel) to choose how you
  /// want to trade off encoding speed for output video quality. The default
  /// behavior is faster, lower quality, multi-pass encoding.
  final Vp9QualityTuningLevel? qualityTuningLevel;

  /// With the VP9 codec, you can use only the variable bitrate (VBR) rate control
  /// mode.
  final Vp9RateControlMode? rateControlMode;

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
  factory Vp9Settings.fromJson(Map<String, dynamic> json) {
    return Vp9Settings(
      bitrate: json['bitrate'] as int?,
      framerateControl:
          (json['framerateControl'] as String?)?.toVp9FramerateControl(),
      framerateConversionAlgorithm:
          (json['framerateConversionAlgorithm'] as String?)
              ?.toVp9FramerateConversionAlgorithm(),
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
      gopSize: json['gopSize'] as double?,
      hrdBufferSize: json['hrdBufferSize'] as int?,
      maxBitrate: json['maxBitrate'] as int?,
      parControl: (json['parControl'] as String?)?.toVp9ParControl(),
      parDenominator: json['parDenominator'] as int?,
      parNumerator: json['parNumerator'] as int?,
      qualityTuningLevel:
          (json['qualityTuningLevel'] as String?)?.toVp9QualityTuningLevel(),
      rateControlMode:
          (json['rateControlMode'] as String?)?.toVp9RateControlMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final bitrate = this.bitrate;
    final framerateControl = this.framerateControl;
    final framerateConversionAlgorithm = this.framerateConversionAlgorithm;
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final gopSize = this.gopSize;
    final hrdBufferSize = this.hrdBufferSize;
    final maxBitrate = this.maxBitrate;
    final parControl = this.parControl;
    final parDenominator = this.parDenominator;
    final parNumerator = this.parNumerator;
    final qualityTuningLevel = this.qualityTuningLevel;
    final rateControlMode = this.rateControlMode;
    return {
      if (bitrate != null) 'bitrate': bitrate,
      if (framerateControl != null)
        'framerateControl': framerateControl.toValue(),
      if (framerateConversionAlgorithm != null)
        'framerateConversionAlgorithm': framerateConversionAlgorithm.toValue(),
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
      if (gopSize != null) 'gopSize': gopSize,
      if (hrdBufferSize != null) 'hrdBufferSize': hrdBufferSize,
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (parControl != null) 'parControl': parControl.toValue(),
      if (parDenominator != null) 'parDenominator': parDenominator,
      if (parNumerator != null) 'parNumerator': parNumerator,
      if (qualityTuningLevel != null)
        'qualityTuningLevel': qualityTuningLevel.toValue(),
      if (rateControlMode != null) 'rateControlMode': rateControlMode.toValue(),
    };
  }
}

/// Optional. Ignore this setting unless Nagra support directs you to specify a
/// value. When you don't specify a value here, the Nagra NexGuard library uses
/// its default value.
enum WatermarkingStrength {
  lightest,
  lighter,
  $default,
  stronger,
  strongest,
}

extension on WatermarkingStrength {
  String toValue() {
    switch (this) {
      case WatermarkingStrength.lightest:
        return 'LIGHTEST';
      case WatermarkingStrength.lighter:
        return 'LIGHTER';
      case WatermarkingStrength.$default:
        return 'DEFAULT';
      case WatermarkingStrength.stronger:
        return 'STRONGER';
      case WatermarkingStrength.strongest:
        return 'STRONGEST';
    }
  }
}

extension on String {
  WatermarkingStrength toWatermarkingStrength() {
    switch (this) {
      case 'LIGHTEST':
        return WatermarkingStrength.lightest;
      case 'LIGHTER':
        return WatermarkingStrength.lighter;
      case 'DEFAULT':
        return WatermarkingStrength.$default;
      case 'STRONGER':
        return WatermarkingStrength.stronger;
      case 'STRONGEST':
        return WatermarkingStrength.strongest;
    }
    throw Exception('$this is not known in enum WatermarkingStrength');
  }
}

/// The service defaults to using RIFF for WAV outputs. If your output audio is
/// likely to exceed 4 GB in file size, or if you otherwise need the extended
/// support of the RF64 format, set your output WAV file format to RF64.
enum WavFormat {
  riff,
  rf64,
}

extension on WavFormat {
  String toValue() {
    switch (this) {
      case WavFormat.riff:
        return 'RIFF';
      case WavFormat.rf64:
        return 'RF64';
    }
  }
}

extension on String {
  WavFormat toWavFormat() {
    switch (this) {
      case 'RIFF':
        return WavFormat.riff;
      case 'RF64':
        return WavFormat.rf64;
    }
    throw Exception('$this is not known in enum WavFormat');
  }
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value WAV.
class WavSettings {
  /// Specify Bit depth (BitDepth), in bits per sample, to choose the encoding
  /// quality for this audio track.
  final int? bitDepth;

  /// Specify the number of channels in this output audio track. Valid values are
  /// 1 and even numbers up to 64. For example, 1, 2, 4, 6, and so on, up to 64.
  final int? channels;

  /// The service defaults to using RIFF for WAV outputs. If your output audio is
  /// likely to exceed 4 GB in file size, or if you otherwise need the extended
  /// support of the RF64 format, set your output WAV file format to RF64.
  final WavFormat? format;

  /// Sample rate in Hz.
  final int? sampleRate;

  WavSettings({
    this.bitDepth,
    this.channels,
    this.format,
    this.sampleRate,
  });
  factory WavSettings.fromJson(Map<String, dynamic> json) {
    return WavSettings(
      bitDepth: json['bitDepth'] as int?,
      channels: json['channels'] as int?,
      format: (json['format'] as String?)?.toWavFormat(),
      sampleRate: json['sampleRate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bitDepth = this.bitDepth;
    final channels = this.channels;
    final format = this.format;
    final sampleRate = this.sampleRate;
    return {
      if (bitDepth != null) 'bitDepth': bitDepth,
      if (channels != null) 'channels': channels,
      if (format != null) 'format': format.toValue(),
      if (sampleRate != null) 'sampleRate': sampleRate,
    };
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
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
