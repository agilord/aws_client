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

/// You can use Amazon CloudWatch Evidently to safely validate new features by
/// serving them to a specified percentage of your users while you roll out the
/// feature. You can monitor the performance of the new feature to help you
/// decide when to ramp up traffic to your users. This helps you reduce risk and
/// identify unintended consequences before you fully launch the feature.
///
/// You can also conduct A/B experiments to make feature design decisions based
/// on evidence and data. An experiment can test as many as five variations at
/// once. Evidently collects experiment data and analyzes it using statistical
/// methods. It also provides clear recommendations about which variations
/// perform better. You can test both user-facing features and backend features.
class CloudWatchEvidently {
  final _s.RestJsonProtocol _protocol;
  CloudWatchEvidently({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'evidently',
            signingName: 'evidently',
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

  /// This operation assigns feature variation to user sessions. For each user
  /// session, you pass in an <code>entityID</code> that represents the user.
  /// Evidently then checks the evaluation rules and assigns the variation.
  ///
  /// The first rules that are evaluated are the override rules. If the user's
  /// <code>entityID</code> matches an override rule, the user is served the
  /// variation specified by that rule.
  ///
  /// Next, if there is a launch of the feature, the user might be assigned to a
  /// variation in the launch. The chance of this depends on the percentage of
  /// users that are allocated to that launch. If the user is enrolled in the
  /// launch, the variation they are served depends on the allocation of the
  /// various feature variations used for the launch.
  ///
  /// If the user is not assigned to a launch, and there is an ongoing
  /// experiment for this feature, the user might be assigned to a variation in
  /// the experiment. The chance of this depends on the percentage of users that
  /// are allocated to that experiment. If the user is enrolled in the
  /// experiment, the variation they are served depends on the allocation of the
  /// various feature variations used for the experiment.
  ///
  /// If the user is not assigned to a launch or experiment, they are served the
  /// default variation.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the feature being evaluated.
  ///
  /// Parameter [requests] :
  /// An array of structures, where each structure assigns a feature variation
  /// to one user session.
  Future<BatchEvaluateFeatureResponse> batchEvaluateFeature({
    required String project,
    required List<EvaluationRequest> requests,
  }) async {
    final $payload = <String, dynamic>{
      'requests': requests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/projects/${Uri.encodeComponent(project)}/evaluations',
      exceptionFnMap: _exceptionFns,
    );
    return BatchEvaluateFeatureResponse.fromJson(response);
  }

  /// Creates an Evidently <i>experiment</i>. Before you create an experiment,
  /// you must create the feature to use for the experiment.
  ///
  /// An experiment helps you make feature design decisions based on evidence
  /// and data. An experiment can test as many as five variations at once.
  /// Evidently collects experiment data and analyzes it by statistical methods,
  /// and provides clear recommendations about which variations perform better.
  ///
  /// You can optionally specify a <code>segment</code> to have the experiment
  /// consider only certain audience types in the experiment, such as using only
  /// user sessions from a certain location or who use a certain internet
  /// browser.
  ///
  /// Don't use this operation to update an existing experiment. Instead, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_UpdateExperiment.html">UpdateExperiment</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [metricGoals] :
  /// An array of structures that defines the metrics used for the experiment,
  /// and whether a higher or lower value for each metric is the goal.
  ///
  /// Parameter [name] :
  /// A name for the new experiment.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that you want to create the new experiment
  /// in.
  ///
  /// Parameter [treatments] :
  /// An array of structures that describe the configuration of each feature
  /// variation used in the experiment.
  ///
  /// Parameter [description] :
  /// An optional description of the experiment.
  ///
  /// Parameter [onlineAbConfig] :
  /// A structure that contains the configuration of which variation to use as
  /// the "control" version. tThe "control" version is used for comparison with
  /// other variations. This structure also specifies how much experiment
  /// traffic is allocated to each variation.
  ///
  /// Parameter [randomizationSalt] :
  /// When Evidently assigns a particular user session to an experiment, it must
  /// use a randomization ID to determine which variation the user session is
  /// served. This randomization ID is a combination of the entity ID and
  /// <code>randomizationSalt</code>. If you omit
  /// <code>randomizationSalt</code>, Evidently uses the experiment name as the
  /// <code>randomizationSalt</code>.
  ///
  /// Parameter [samplingRate] :
  /// The portion of the available audience that you want to allocate to this
  /// experiment, in thousandths of a percent. The available audience is the
  /// total audience minus the audience that you have allocated to overrides or
  /// current launches of this feature.
  ///
  /// This is represented in thousandths of a percent. For example, specify
  /// 10,000 to allocate 10% of the available audience.
  ///
  /// Parameter [segment] :
  /// Specifies an audience <i>segment</i> to use in the experiment. When a
  /// segment is used in an experiment, only user sessions that match the
  /// segment pattern are used in the experiment.
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags (key-value pairs) to the experiment.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can associate as many as 50 tags with an experiment.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
  Future<CreateExperimentResponse> createExperiment({
    required List<MetricGoalConfig> metricGoals,
    required String name,
    required String project,
    required List<TreatmentConfig> treatments,
    String? description,
    OnlineAbConfig? onlineAbConfig,
    String? randomizationSalt,
    int? samplingRate,
    String? segment,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'samplingRate',
      samplingRate,
      0,
      100000,
    );
    final $payload = <String, dynamic>{
      'metricGoals': metricGoals,
      'name': name,
      'treatments': treatments,
      if (description != null) 'description': description,
      if (onlineAbConfig != null) 'onlineAbConfig': onlineAbConfig,
      if (randomizationSalt != null) 'randomizationSalt': randomizationSalt,
      if (samplingRate != null) 'samplingRate': samplingRate,
      if (segment != null) 'segment': segment,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/projects/${Uri.encodeComponent(project)}/experiments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateExperimentResponse.fromJson(response);
  }

  /// Creates an Evidently <i>feature</i> that you want to launch or test. You
  /// can define up to five variations of a feature, and use these variations in
  /// your launches and experiments. A feature must be created in a project. For
  /// information about creating a project, see <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_CreateProject.html">CreateProject</a>.
  ///
  /// Don't use this operation to update an existing feature. Instead, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_UpdateFeature.html">UpdateFeature</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name for the new feature.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that is to contain the new feature.
  ///
  /// Parameter [variations] :
  /// An array of structures that contain the configuration of the feature's
  /// different variations.
  ///
  /// Parameter [defaultVariation] :
  /// The name of the variation to use as the default variation. The default
  /// variation is served to users who are not allocated to any ongoing launches
  /// or experiments of this feature.
  ///
  /// This variation must also be listed in the <code>variations</code>
  /// structure.
  ///
  /// If you omit <code>defaultVariation</code>, the first variation listed in
  /// the <code>variations</code> structure is used as the default variation.
  ///
  /// Parameter [description] :
  /// An optional description of the feature.
  ///
  /// Parameter [entityOverrides] :
  /// Specify users that should always be served a specific variation of a
  /// feature. Each user is specified by a key-value pair . For each key,
  /// specify a user by entering their user ID, account ID, or some other
  /// identifier. For the value, specify the name of the variation that they are
  /// to be served.
  ///
  /// This parameter is limited to 2500 overrides or a total of 40KB. The 40KB
  /// limit includes an overhead of 6 bytes per override.
  ///
  /// Parameter [evaluationStrategy] :
  /// Specify <code>ALL_RULES</code> to activate the traffic allocation
  /// specified by any ongoing launches or experiments. Specify
  /// <code>DEFAULT_VARIATION</code> to serve the default variation to all users
  /// instead.
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags (key-value pairs) to the feature.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can associate as many as 50 tags with a feature.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
  Future<CreateFeatureResponse> createFeature({
    required String name,
    required String project,
    required List<VariationConfig> variations,
    String? defaultVariation,
    String? description,
    Map<String, String>? entityOverrides,
    FeatureEvaluationStrategy? evaluationStrategy,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'variations': variations,
      if (defaultVariation != null) 'defaultVariation': defaultVariation,
      if (description != null) 'description': description,
      if (entityOverrides != null) 'entityOverrides': entityOverrides,
      if (evaluationStrategy != null)
        'evaluationStrategy': evaluationStrategy.toValue(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/projects/${Uri.encodeComponent(project)}/features',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFeatureResponse.fromJson(response);
  }

  /// Creates a <i>launch</i> of a given feature. Before you create a launch,
  /// you must create the feature to use for the launch.
  ///
  /// You can use a launch to safely validate new features by serving them to a
  /// specified percentage of your users while you roll out the feature. You can
  /// monitor the performance of the new feature to help you decide when to ramp
  /// up traffic to more users. This helps you reduce risk and identify
  /// unintended consequences before you fully launch the feature.
  ///
  /// Don't use this operation to update an existing launch. Instead, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_UpdateLaunch.html">UpdateLaunch</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [groups] :
  /// An array of structures that contains the feature and variations that are
  /// to be used for the launch.
  ///
  /// Parameter [name] :
  /// The name for the new launch.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that you want to create the launch in.
  ///
  /// Parameter [description] :
  /// An optional description for the launch.
  ///
  /// Parameter [metricMonitors] :
  /// An array of structures that define the metrics that will be used to
  /// monitor the launch performance.
  ///
  /// Parameter [randomizationSalt] :
  /// When Evidently assigns a particular user session to a launch, it must use
  /// a randomization ID to determine which variation the user session is
  /// served. This randomization ID is a combination of the entity ID and
  /// <code>randomizationSalt</code>. If you omit
  /// <code>randomizationSalt</code>, Evidently uses the launch name as the
  /// <code>randomizationSalt</code>.
  ///
  /// Parameter [scheduledSplitsConfig] :
  /// An array of structures that define the traffic allocation percentages
  /// among the feature variations during each step of the launch.
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags (key-value pairs) to the launch.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can associate as many as 50 tags with a launch.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
  Future<CreateLaunchResponse> createLaunch({
    required List<LaunchGroupConfig> groups,
    required String name,
    required String project,
    String? description,
    List<MetricMonitorConfig>? metricMonitors,
    String? randomizationSalt,
    ScheduledSplitsLaunchConfig? scheduledSplitsConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'groups': groups,
      'name': name,
      if (description != null) 'description': description,
      if (metricMonitors != null) 'metricMonitors': metricMonitors,
      if (randomizationSalt != null) 'randomizationSalt': randomizationSalt,
      if (scheduledSplitsConfig != null)
        'scheduledSplitsConfig': scheduledSplitsConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/projects/${Uri.encodeComponent(project)}/launches',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLaunchResponse.fromJson(response);
  }

  /// Creates a project, which is the logical object in Evidently that can
  /// contain features, launches, and experiments. Use projects to group similar
  /// features together.
  ///
  /// To update an existing project, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_UpdateProject.html">UpdateProject</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name for the project.
  ///
  /// Parameter [appConfigResource] :
  /// Use this parameter if the project will use <i>client-side evaluation
  /// powered by AppConfig</i>. Client-side evaluation allows your application
  /// to assign variations to user sessions locally instead of by calling the <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_EvaluateFeature.html">EvaluateFeature</a>
  /// operation. This mitigates the latency and availability risks that come
  /// with an API call. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Evidently-client-side-evaluation.html">
  /// Client-side evaluation - powered by AppConfig.</a>
  ///
  /// This parameter is a structure that contains information about the
  /// AppConfig application and environment that will be used as for client-side
  /// evaluation.
  ///
  /// To create a project that uses client-side evaluation, you must have the
  /// <code>evidently:ExportProjectAsConfiguration</code> permission.
  ///
  /// Parameter [dataDelivery] :
  /// A structure that contains information about where Evidently is to store
  /// evaluation events for longer term storage, if you choose to do so. If you
  /// choose not to store these events, Evidently deletes them after using them
  /// to produce metrics and other experiment results that you can view.
  ///
  /// Parameter [description] :
  /// An optional description of the project.
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags (key-value pairs) to the project.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can associate as many as 50 tags with a project.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
  Future<CreateProjectResponse> createProject({
    required String name,
    ProjectAppConfigResourceConfig? appConfigResource,
    ProjectDataDeliveryConfig? dataDelivery,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (appConfigResource != null) 'appConfigResource': appConfigResource,
      if (dataDelivery != null) 'dataDelivery': dataDelivery,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/projects',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProjectResponse.fromJson(response);
  }

  /// Use this operation to define a <i>segment</i> of your audience. A segment
  /// is a portion of your audience that share one or more characteristics.
  /// Examples could be Chrome browser users, users in Europe, or Firefox
  /// browser users in Europe who also fit other criteria that your application
  /// collects, such as age.
  ///
  /// Using a segment in an experiment limits that experiment to evaluate only
  /// the users who match the segment criteria. Using one or more segments in a
  /// launch allows you to define different traffic splits for the different
  /// audience segments.
  ///
  /// For more information about segment pattern syntax, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Evidently-segments.html#CloudWatch-Evidently-segments-syntax.html">
  /// Segment rule pattern syntax</a>.
  ///
  /// The pattern that you define for a segment is matched against the value of
  /// <code>evaluationContext</code>, which is passed into Evidently in the <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_EvaluateFeature.html">EvaluateFeature</a>
  /// operation, when Evidently assigns a feature variation to a user.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// A name for the segment.
  ///
  /// Parameter [pattern] :
  /// The pattern to use for the segment. For more information about pattern
  /// syntax, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Evidently-segments.html#CloudWatch-Evidently-segments-syntax.html">
  /// Segment rule pattern syntax</a>.
  ///
  /// Parameter [description] :
  /// An optional description for this segment.
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags (key-value pairs) to the segment.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can associate as many as 50 tags with a segment.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
  Future<CreateSegmentResponse> createSegment({
    required String name,
    required Object pattern,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'pattern': jsonEncode(pattern),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/segments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSegmentResponse.fromJson(response);
  }

  /// Deletes an Evidently experiment. The feature used for the experiment is
  /// not deleted.
  ///
  /// To stop an experiment without deleting it, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_StopExperiment.html">StopExperiment</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [experiment] :
  /// The name of the experiment to delete.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the experiment to delete.
  Future<void> deleteExperiment({
    required String experiment,
    required String project,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/experiments/${Uri.encodeComponent(experiment)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Evidently feature.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [feature] :
  /// The name of the feature to delete.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the feature to delete.
  Future<void> deleteFeature({
    required String feature,
    required String project,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/features/${Uri.encodeComponent(feature)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Evidently launch. The feature used for the launch is not
  /// deleted.
  ///
  /// To stop a launch without deleting it, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_StopLaunch.html">StopLaunch</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [launch] :
  /// The name of the launch to delete.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the launch to delete.
  Future<void> deleteLaunch({
    required String launch,
    required String project,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/launches/${Uri.encodeComponent(launch)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Evidently project. Before you can delete a project, you must
  /// delete all the features that the project contains. To delete a feature,
  /// use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_DeleteFeature.html">DeleteFeature</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [project] :
  /// The name or ARN of the project to delete.
  Future<void> deleteProject({
    required String project,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/projects/${Uri.encodeComponent(project)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a segment. You can't delete a segment that is being used in a
  /// launch or experiment, even if that launch or experiment is not currently
  /// running.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [segment] :
  /// Specifies the segment to delete.
  Future<void> deleteSegment({
    required String segment,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/segments/${Uri.encodeComponent(segment)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation assigns a feature variation to one given user session. You
  /// pass in an <code>entityID</code> that represents the user. Evidently then
  /// checks the evaluation rules and assigns the variation.
  ///
  /// The first rules that are evaluated are the override rules. If the user's
  /// <code>entityID</code> matches an override rule, the user is served the
  /// variation specified by that rule.
  ///
  /// If there is a current launch with this feature that uses segment
  /// overrides, and if the user session's <code>evaluationContext</code>
  /// matches a segment rule defined in a segment override, the configuration in
  /// the segment overrides is used. For more information about segments, see <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_CreateSegment.html">CreateSegment</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Evidently-segments.html">Use
  /// segments to focus your audience</a>.
  ///
  /// If there is a launch with no segment overrides, the user might be assigned
  /// to a variation in the launch. The chance of this depends on the percentage
  /// of users that are allocated to that launch. If the user is enrolled in the
  /// launch, the variation they are served depends on the allocation of the
  /// various feature variations used for the launch.
  ///
  /// If the user is not assigned to a launch, and there is an ongoing
  /// experiment for this feature, the user might be assigned to a variation in
  /// the experiment. The chance of this depends on the percentage of users that
  /// are allocated to that experiment.
  ///
  /// If the experiment uses a segment, then only user sessions with
  /// <code>evaluationContext</code> values that match the segment rule are used
  /// in the experiment.
  ///
  /// If the user is enrolled in the experiment, the variation they are served
  /// depends on the allocation of the various feature variations used for the
  /// experiment.
  ///
  /// If the user is not assigned to a launch or experiment, they are served the
  /// default variation.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [entityId] :
  /// An internal ID that represents a unique user of the application. This
  /// <code>entityID</code> is checked against any override rules assigned for
  /// this feature.
  ///
  /// Parameter [feature] :
  /// The name of the feature being evaluated.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains this feature.
  ///
  /// Parameter [evaluationContext] :
  /// A JSON object of attributes that you can optionally pass in as part of the
  /// evaluation event sent to Evidently from the user session. Evidently can
  /// use this value to match user sessions with defined audience segments. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Evidently-segments.html">Use
  /// segments to focus your audience</a>.
  ///
  /// If you include this parameter, the value must be a JSON object. A JSON
  /// array is not supported.
  Future<EvaluateFeatureResponse> evaluateFeature({
    required String entityId,
    required String feature,
    required String project,
    Object? evaluationContext,
  }) async {
    final $payload = <String, dynamic>{
      'entityId': entityId,
      if (evaluationContext != null)
        'evaluationContext': jsonEncode(evaluationContext),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/evaluations/${Uri.encodeComponent(feature)}',
      exceptionFnMap: _exceptionFns,
    );
    return EvaluateFeatureResponse.fromJson(response);
  }

  /// Returns the details about one experiment. You must already know the
  /// experiment name. To retrieve a list of experiments in your account, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_ListExperiments.html">ListExperiments</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [experiment] :
  /// The name of the experiment that you want to see the details of.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the experiment.
  Future<GetExperimentResponse> getExperiment({
    required String experiment,
    required String project,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/experiments/${Uri.encodeComponent(experiment)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetExperimentResponse.fromJson(response);
  }

  /// Retrieves the results of a running or completed experiment. No results are
  /// available until there have been 100 events for each variation and at least
  /// 10 minutes have passed since the start of the experiment. To increase the
  /// statistical power, Evidently performs an additional offline p-value
  /// analysis at the end of the experiment. Offline p-value analysis can detect
  /// statistical significance in some cases where the anytime p-values used
  /// during the experiment do not find statistical significance.
  ///
  /// Experiment results are available up to 63 days after the start of the
  /// experiment. They are not available after that because of CloudWatch data
  /// retention policies.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [experiment] :
  /// The name of the experiment to retrieve the results of.
  ///
  /// Parameter [metricNames] :
  /// The names of the experiment metrics that you want to see the results of.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the experiment that you want
  /// to see the results of.
  ///
  /// Parameter [treatmentNames] :
  /// The names of the experiment treatments that you want to see the results
  /// for.
  ///
  /// Parameter [baseStat] :
  /// The statistic used to calculate experiment results. Currently the only
  /// valid value is <code>mean</code>, which uses the mean of the collected
  /// values as the statistic.
  ///
  /// Parameter [endTime] :
  /// The date and time that the experiment ended, if it is completed. This must
  /// be no longer than 30 days after the experiment start time.
  ///
  /// Parameter [period] :
  /// In seconds, the amount of time to aggregate results together.
  ///
  /// Parameter [reportNames] :
  /// The names of the report types that you want to see. Currently,
  /// <code>BayesianInference</code> is the only valid value.
  ///
  /// Parameter [resultStats] :
  /// The statistics that you want to see in the returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>PValue</code> specifies to use p-values for the results. A p-value
  /// is used in hypothesis testing to measure how often you are willing to make
  /// a mistake in rejecting the null hypothesis. A general practice is to
  /// reject the null hypothesis and declare that the results are statistically
  /// significant when the p-value is less than 0.05.
  /// </li>
  /// <li>
  /// <code>ConfidenceInterval</code> specifies a confidence interval for the
  /// results. The confidence interval represents the range of values for the
  /// chosen metric that is likely to contain the true difference between the
  /// <code>baseStat</code> of a variation and the baseline. Evidently returns
  /// the 95% confidence interval.
  /// </li>
  /// <li>
  /// <code>TreatmentEffect</code> is the difference in the statistic specified
  /// by the <code>baseStat</code> parameter between each variation and the
  /// default variation.
  /// </li>
  /// <li>
  /// <code>BaseStat</code> returns the statistical values collected for the
  /// metric for each variation. The statistic uses the same statistic specified
  /// in the <code>baseStat</code> parameter. Therefore, if
  /// <code>baseStat</code> is <code>mean</code>, this returns the mean of the
  /// values collected for each variation.
  /// </li>
  /// </ul>
  ///
  /// Parameter [startTime] :
  /// The date and time that the experiment started.
  Future<GetExperimentResultsResponse> getExperimentResults({
    required String experiment,
    required List<String> metricNames,
    required String project,
    required List<String> treatmentNames,
    ExperimentBaseStat? baseStat,
    DateTime? endTime,
    int? period,
    List<ExperimentReportName>? reportNames,
    List<ExperimentResultRequestType>? resultStats,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'period',
      period,
      300,
      90000,
    );
    final $payload = <String, dynamic>{
      'metricNames': metricNames,
      'treatmentNames': treatmentNames,
      if (baseStat != null) 'baseStat': baseStat.toValue(),
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (period != null) 'period': period,
      if (reportNames != null)
        'reportNames': reportNames.map((e) => e.toValue()).toList(),
      if (resultStats != null)
        'resultStats': resultStats.map((e) => e.toValue()).toList(),
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/experiments/${Uri.encodeComponent(experiment)}/results',
      exceptionFnMap: _exceptionFns,
    );
    return GetExperimentResultsResponse.fromJson(response);
  }

  /// Returns the details about one feature. You must already know the feature
  /// name. To retrieve a list of features in your account, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_ListFeatures.html">ListFeatures</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [feature] :
  /// The name of the feature that you want to retrieve information for.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the feature.
  Future<GetFeatureResponse> getFeature({
    required String feature,
    required String project,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/features/${Uri.encodeComponent(feature)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFeatureResponse.fromJson(response);
  }

  /// Returns the details about one launch. You must already know the launch
  /// name. To retrieve a list of launches in your account, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_ListLaunches.html">ListLaunches</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [launch] :
  /// The name of the launch that you want to see the details of.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the launch.
  Future<GetLaunchResponse> getLaunch({
    required String launch,
    required String project,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/launches/${Uri.encodeComponent(launch)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLaunchResponse.fromJson(response);
  }

  /// Returns the details about one launch. You must already know the project
  /// name. To retrieve a list of projects in your account, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_ListProjects.html">ListProjects</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that you want to see the details of.
  Future<GetProjectResponse> getProject({
    required String project,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects/${Uri.encodeComponent(project)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProjectResponse.fromJson(response);
  }

  /// Returns information about the specified segment. Specify the segment you
  /// want to view by specifying its ARN.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [segment] :
  /// The ARN of the segment to return information for.
  Future<GetSegmentResponse> getSegment({
    required String segment,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/segments/${Uri.encodeComponent(segment)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSegmentResponse.fromJson(response);
  }

  /// Returns configuration details about all the experiments in the specified
  /// project.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [project] :
  /// The name or ARN of the project to return the experiment list from.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response.
  ///
  /// Parameter [nextToken] :
  /// The token to use when requesting the next set of results. You received
  /// this token from a previous <code>ListExperiments</code> operation.
  ///
  /// Parameter [status] :
  /// Use this optional parameter to limit the returned results to only the
  /// experiments with the status that you specify here.
  Future<ListExperimentsResponse> listExperiments({
    required String project,
    int? maxResults,
    String? nextToken,
    ExperimentStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects/${Uri.encodeComponent(project)}/experiments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListExperimentsResponse.fromJson(response);
  }

  /// Returns configuration details about all the features in the specified
  /// project.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [project] :
  /// The name or ARN of the project to return the feature list from.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response.
  ///
  /// Parameter [nextToken] :
  /// The token to use when requesting the next set of results. You received
  /// this token from a previous <code>ListFeatures</code> operation.
  Future<ListFeaturesResponse> listFeatures({
    required String project,
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects/${Uri.encodeComponent(project)}/features',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFeaturesResponse.fromJson(response);
  }

  /// Returns configuration details about all the launches in the specified
  /// project.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [project] :
  /// The name or ARN of the project to return the launch list from.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response.
  ///
  /// Parameter [nextToken] :
  /// The token to use when requesting the next set of results. You received
  /// this token from a previous <code>ListLaunches</code> operation.
  ///
  /// Parameter [status] :
  /// Use this optional parameter to limit the returned results to only the
  /// launches with the status that you specify here.
  Future<ListLaunchesResponse> listLaunches({
    required String project,
    int? maxResults,
    String? nextToken,
    LaunchStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects/${Uri.encodeComponent(project)}/launches',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLaunchesResponse.fromJson(response);
  }

  /// Returns configuration details about all the projects in the current Region
  /// in your account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response.
  ///
  /// Parameter [nextToken] :
  /// The token to use when requesting the next set of results. You received
  /// this token from a previous <code>ListProjects</code> operation.
  Future<ListProjectsResponse> listProjects({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProjectsResponse.fromJson(response);
  }

  /// Use this operation to find which experiments or launches are using a
  /// specified segment.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [segment] :
  /// The ARN of the segment that you want to view information for.
  ///
  /// Parameter [type] :
  /// Specifies whether to return information about launches or experiments that
  /// use this segment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If you omit
  /// this, the default of 50 is used.
  ///
  /// Parameter [nextToken] :
  /// The token to use when requesting the next set of results. You received
  /// this token from a previous <code>ListSegmentReferences</code> operation.
  Future<ListSegmentReferencesResponse> listSegmentReferences({
    required String segment,
    required SegmentReferenceResourceType type,
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
      'type': [type.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/segments/${Uri.encodeComponent(segment)}/references',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSegmentReferencesResponse.fromJson(response);
  }

  /// Returns a list of audience segments that you have created in your account
  /// in this Region.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If you omit
  /// this, the default of 50 is used.
  ///
  /// Parameter [nextToken] :
  /// The token to use when requesting the next set of results. You received
  /// this token from a previous <code>ListSegments</code> operation.
  Future<ListSegmentsResponse> listSegments({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/segments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSegmentsResponse.fromJson(response);
  }

  /// Displays the tags associated with an Evidently resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that you want to see the tags of.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Sends performance events to Evidently. These events can be used to
  /// evaluate a launch or an experiment.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [events] :
  /// An array of event structures that contain the performance data that is
  /// being sent to Evidently.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project to write the events to.
  Future<PutProjectEventsResponse> putProjectEvents({
    required List<Event> events,
    required String project,
  }) async {
    final $payload = <String, dynamic>{
      'events': events,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/events/projects/${Uri.encodeComponent(project)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutProjectEventsResponse.fromJson(response);
  }

  /// Starts an existing experiment. To create an experiment, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_CreateExperiment.html">CreateExperiment</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analysisCompleteTime] :
  /// The date and time to end the experiment. This must be no more than 30 days
  /// after the experiment starts.
  ///
  /// Parameter [experiment] :
  /// The name of the experiment to start.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the experiment to start.
  Future<StartExperimentResponse> startExperiment({
    required DateTime analysisCompleteTime,
    required String experiment,
    required String project,
  }) async {
    final $payload = <String, dynamic>{
      'analysisCompleteTime': unixTimestampToJson(analysisCompleteTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/experiments/${Uri.encodeComponent(experiment)}/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartExperimentResponse.fromJson(response);
  }

  /// Starts an existing launch. To create a launch, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_CreateLaunch.html">CreateLaunch</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [launch] :
  /// The name of the launch to start.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the launch to start.
  Future<StartLaunchResponse> startLaunch({
    required String launch,
    required String project,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/launches/${Uri.encodeComponent(launch)}/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartLaunchResponse.fromJson(response);
  }

  /// Stops an experiment that is currently running. If you stop an experiment,
  /// you can't resume it or restart it.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [experiment] :
  /// The name of the experiment to stop.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the experiment to stop.
  ///
  /// Parameter [desiredState] :
  /// Specify whether the experiment is to be considered <code>COMPLETED</code>
  /// or <code>CANCELLED</code> after it stops.
  ///
  /// Parameter [reason] :
  /// A string that describes why you are stopping the experiment.
  Future<StopExperimentResponse> stopExperiment({
    required String experiment,
    required String project,
    ExperimentStopDesiredState? desiredState,
    String? reason,
  }) async {
    final $payload = <String, dynamic>{
      if (desiredState != null) 'desiredState': desiredState.toValue(),
      if (reason != null) 'reason': reason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/experiments/${Uri.encodeComponent(experiment)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return StopExperimentResponse.fromJson(response);
  }

  /// Stops a launch that is currently running. After you stop a launch, you
  /// will not be able to resume it or restart it. Also, it will not be
  /// evaluated as a rule for traffic allocation, and the traffic that was
  /// allocated to the launch will instead be available to the feature's
  /// experiment, if there is one. Otherwise, all traffic will be served the
  /// default variation after the launch is stopped.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [launch] :
  /// The name of the launch to stop.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the launch that you want to
  /// stop.
  ///
  /// Parameter [desiredState] :
  /// Specify whether to consider the launch as <code>COMPLETED</code> or
  /// <code>CANCELLED</code> after it stops.
  ///
  /// Parameter [reason] :
  /// A string that describes why you are stopping the launch.
  Future<StopLaunchResponse> stopLaunch({
    required String launch,
    required String project,
    LaunchStopDesiredState? desiredState,
    String? reason,
  }) async {
    final $payload = <String, dynamic>{
      if (desiredState != null) 'desiredState': desiredState.toValue(),
      if (reason != null) 'reason': reason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/launches/${Uri.encodeComponent(launch)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return StopLaunchResponse.fromJson(response);
  }

  /// Assigns one or more tags (key-value pairs) to the specified CloudWatch
  /// Evidently resource. Projects, features, launches, and experiments can be
  /// tagged.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can use the <code>TagResource</code> action with a resource that
  /// already has tags. If you specify a new tag key for the resource, this tag
  /// is appended to the list of tags associated with the alarm. If you specify
  /// a tag key that is already associated with the resource, the new tag value
  /// that you specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a resource.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch Evidently resource that you're adding tags to.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the resource.
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

  /// Use this operation to test a rules pattern that you plan to use to create
  /// an audience segment. For more information about segments, see <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_CreateSegment.html">CreateSegment</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [pattern] :
  /// The pattern to test.
  ///
  /// Parameter [payload] :
  /// A sample <code>evaluationContext</code> JSON block to test against the
  /// specified pattern.
  Future<TestSegmentPatternResponse> testSegmentPattern({
    required Object pattern,
    required Object payload,
  }) async {
    final $payload = <String, dynamic>{
      'pattern': jsonEncode(pattern),
      'payload': jsonEncode(payload),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/test-segment-pattern',
      exceptionFnMap: _exceptionFns,
    );
    return TestSegmentPatternResponse.fromJson(response);
  }

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch Evidently resource that you're removing tags
  /// from.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
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

  /// Updates an Evidently experiment.
  ///
  /// Don't use this operation to update an experiment's tag. Instead, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_TagResource.html">TagResource</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [experiment] :
  /// The name of the experiment to update.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the experiment that you want
  /// to update.
  ///
  /// Parameter [description] :
  /// An optional description of the experiment.
  ///
  /// Parameter [metricGoals] :
  /// An array of structures that defines the metrics used for the experiment,
  /// and whether a higher or lower value for each metric is the goal.
  ///
  /// Parameter [onlineAbConfig] :
  /// A structure that contains the configuration of which variation o use as
  /// the "control" version. The "control" version is used for comparison with
  /// other variations. This structure also specifies how much experiment
  /// traffic is allocated to each variation.
  ///
  /// Parameter [randomizationSalt] :
  /// When Evidently assigns a particular user session to an experiment, it must
  /// use a randomization ID to determine which variation the user session is
  /// served. This randomization ID is a combination of the entity ID and
  /// <code>randomizationSalt</code>. If you omit
  /// <code>randomizationSalt</code>, Evidently uses the experiment name as the
  /// <code>randomizationSalt</code>.
  ///
  /// Parameter [removeSegment] :
  /// Removes a segment from being used in an experiment. You can't use this
  /// parameter if the experiment is currently running.
  ///
  /// Parameter [samplingRate] :
  /// The portion of the available audience that you want to allocate to this
  /// experiment, in thousandths of a percent. The available audience is the
  /// total audience minus the audience that you have allocated to overrides or
  /// current launches of this feature.
  ///
  /// This is represented in thousandths of a percent. For example, specify
  /// 20,000 to allocate 20% of the available audience.
  ///
  /// Parameter [segment] :
  /// Adds an audience <i>segment</i> to an experiment. When a segment is used
  /// in an experiment, only user sessions that match the segment pattern are
  /// used in the experiment. You can't use this parameter if the experiment is
  /// currently running.
  ///
  /// Parameter [treatments] :
  /// An array of structures that define the variations being tested in the
  /// experiment.
  Future<UpdateExperimentResponse> updateExperiment({
    required String experiment,
    required String project,
    String? description,
    List<MetricGoalConfig>? metricGoals,
    OnlineAbConfig? onlineAbConfig,
    String? randomizationSalt,
    bool? removeSegment,
    int? samplingRate,
    String? segment,
    List<TreatmentConfig>? treatments,
  }) async {
    _s.validateNumRange(
      'samplingRate',
      samplingRate,
      0,
      100000,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (metricGoals != null) 'metricGoals': metricGoals,
      if (onlineAbConfig != null) 'onlineAbConfig': onlineAbConfig,
      if (randomizationSalt != null) 'randomizationSalt': randomizationSalt,
      if (removeSegment != null) 'removeSegment': removeSegment,
      if (samplingRate != null) 'samplingRate': samplingRate,
      if (segment != null) 'segment': segment,
      if (treatments != null) 'treatments': treatments,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/experiments/${Uri.encodeComponent(experiment)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateExperimentResponse.fromJson(response);
  }

  /// Updates an existing feature.
  ///
  /// You can't use this operation to update the tags of an existing feature.
  /// Instead, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_TagResource.html">TagResource</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [feature] :
  /// The name of the feature to be updated.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the feature to be updated.
  ///
  /// Parameter [addOrUpdateVariations] :
  /// To update variation configurations for this feature, or add new ones,
  /// specify this structure. In this array, include any variations that you
  /// want to add or update. If the array includes a variation name that already
  /// exists for this feature, it is updated. If it includes a new variation
  /// name, it is added as a new variation.
  ///
  /// Parameter [defaultVariation] :
  /// The name of the variation to use as the default variation. The default
  /// variation is served to users who are not allocated to any ongoing launches
  /// or experiments of this feature.
  ///
  /// Parameter [description] :
  /// An optional description of the feature.
  ///
  /// Parameter [entityOverrides] :
  /// Specified users that should always be served a specific variation of a
  /// feature. Each user is specified by a key-value pair . For each key,
  /// specify a user by entering their user ID, account ID, or some other
  /// identifier. For the value, specify the name of the variation that they are
  /// to be served.
  ///
  /// This parameter is limited to 2500 overrides or a total of 40KB. The 40KB
  /// limit includes an overhead of 6 bytes per override.
  ///
  /// Parameter [evaluationStrategy] :
  /// Specify <code>ALL_RULES</code> to activate the traffic allocation
  /// specified by any ongoing launches or experiments. Specify
  /// <code>DEFAULT_VARIATION</code> to serve the default variation to all users
  /// instead.
  ///
  /// Parameter [removeVariations] :
  /// Removes a variation from the feature. If the variation you specify doesn't
  /// exist, then this makes no change and does not report an error.
  ///
  /// This operation fails if you try to remove a variation that is part of an
  /// ongoing launch or experiment.
  Future<UpdateFeatureResponse> updateFeature({
    required String feature,
    required String project,
    List<VariationConfig>? addOrUpdateVariations,
    String? defaultVariation,
    String? description,
    Map<String, String>? entityOverrides,
    FeatureEvaluationStrategy? evaluationStrategy,
    List<String>? removeVariations,
  }) async {
    final $payload = <String, dynamic>{
      if (addOrUpdateVariations != null)
        'addOrUpdateVariations': addOrUpdateVariations,
      if (defaultVariation != null) 'defaultVariation': defaultVariation,
      if (description != null) 'description': description,
      if (entityOverrides != null) 'entityOverrides': entityOverrides,
      if (evaluationStrategy != null)
        'evaluationStrategy': evaluationStrategy.toValue(),
      if (removeVariations != null) 'removeVariations': removeVariations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/features/${Uri.encodeComponent(feature)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFeatureResponse.fromJson(response);
  }

  /// Updates a launch of a given feature.
  ///
  /// Don't use this operation to update the tags of an existing launch.
  /// Instead, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_TagResource.html">TagResource</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [launch] :
  /// The name of the launch that is to be updated.
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that contains the launch that you want to
  /// update.
  ///
  /// Parameter [description] :
  /// An optional description for the launch.
  ///
  /// Parameter [groups] :
  /// An array of structures that contains the feature and variations that are
  /// to be used for the launch.
  ///
  /// Parameter [metricMonitors] :
  /// An array of structures that define the metrics that will be used to
  /// monitor the launch performance.
  ///
  /// Parameter [randomizationSalt] :
  /// When Evidently assigns a particular user session to a launch, it must use
  /// a randomization ID to determine which variation the user session is
  /// served. This randomization ID is a combination of the entity ID and
  /// <code>randomizationSalt</code>. If you omit
  /// <code>randomizationSalt</code>, Evidently uses the launch name as the
  /// <code>randomizationSalt</code>.
  ///
  /// Parameter [scheduledSplitsConfig] :
  /// An array of structures that define the traffic allocation percentages
  /// among the feature variations during each step of the launch.
  Future<UpdateLaunchResponse> updateLaunch({
    required String launch,
    required String project,
    String? description,
    List<LaunchGroupConfig>? groups,
    List<MetricMonitorConfig>? metricMonitors,
    String? randomizationSalt,
    ScheduledSplitsLaunchConfig? scheduledSplitsConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (groups != null) 'groups': groups,
      if (metricMonitors != null) 'metricMonitors': metricMonitors,
      if (randomizationSalt != null) 'randomizationSalt': randomizationSalt,
      if (scheduledSplitsConfig != null)
        'scheduledSplitsConfig': scheduledSplitsConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/projects/${Uri.encodeComponent(project)}/launches/${Uri.encodeComponent(launch)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLaunchResponse.fromJson(response);
  }

  /// Updates the description of an existing project.
  ///
  /// To create a new project, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_CreateProject.html">CreateProject</a>.
  ///
  /// Don't use this operation to update the data storage options of a project.
  /// Instead, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_UpdateProjectDataDelivery.html">UpdateProjectDataDelivery</a>.
  ///
  /// Don't use this operation to update the tags of a project. Instead, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_TagResource.html">TagResource</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [project] :
  /// The name or ARN of the project to update.
  ///
  /// Parameter [appConfigResource] :
  /// Use this parameter if the project will use client-side evaluation powered
  /// by AppConfig. Client-side evaluation allows your application to assign
  /// variations to user sessions locally instead of by calling the <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_EvaluateFeature.html">EvaluateFeature</a>
  /// operation. This mitigates the latency and availability risks that come
  /// with an API call. allows you to
  ///
  /// This parameter is a structure that contains information about the
  /// AppConfig application that will be used for client-side evaluation.
  ///
  /// Parameter [description] :
  /// An optional description of the project.
  Future<UpdateProjectResponse> updateProject({
    required String project,
    ProjectAppConfigResourceConfig? appConfigResource,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (appConfigResource != null) 'appConfigResource': appConfigResource,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/projects/${Uri.encodeComponent(project)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProjectResponse.fromJson(response);
  }

  /// Updates the data storage options for this project. If you store evaluation
  /// events, you an keep them and analyze them on your own. If you choose not
  /// to store evaluation events, Evidently deletes them after using them to
  /// produce metrics and other experiment results that you can view.
  ///
  /// You can't specify both <code>cloudWatchLogs</code> and
  /// <code>s3Destination</code> in the same operation.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [project] :
  /// The name or ARN of the project that you want to modify the data storage
  /// options for.
  ///
  /// Parameter [cloudWatchLogs] :
  /// A structure containing the CloudWatch Logs log group where you want to
  /// store evaluation events.
  ///
  /// Parameter [s3Destination] :
  /// A structure containing the S3 bucket name and bucket prefix where you want
  /// to store evaluation events.
  Future<UpdateProjectDataDeliveryResponse> updateProjectDataDelivery({
    required String project,
    CloudWatchLogsDestinationConfig? cloudWatchLogs,
    S3DestinationConfig? s3Destination,
  }) async {
    final $payload = <String, dynamic>{
      if (cloudWatchLogs != null) 'cloudWatchLogs': cloudWatchLogs,
      if (s3Destination != null) 's3Destination': s3Destination,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/projects/${Uri.encodeComponent(project)}/data-delivery',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProjectDataDeliveryResponse.fromJson(response);
  }
}

class BatchEvaluateFeatureResponse {
  /// An array of structures, where each structure displays the results of one
  /// feature evaluation assignment to one user session.
  final List<EvaluationResult>? results;

  BatchEvaluateFeatureResponse({
    this.results,
  });

  factory BatchEvaluateFeatureResponse.fromJson(Map<String, dynamic> json) {
    return BatchEvaluateFeatureResponse(
      results: (json['results'] as List?)
          ?.whereNotNull()
          .map((e) => EvaluationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    return {
      if (results != null) 'results': results,
    };
  }
}

enum ChangeDirectionEnum {
  increase,
  decrease,
}

extension ChangeDirectionEnumValueExtension on ChangeDirectionEnum {
  String toValue() {
    switch (this) {
      case ChangeDirectionEnum.increase:
        return 'INCREASE';
      case ChangeDirectionEnum.decrease:
        return 'DECREASE';
    }
  }
}

extension ChangeDirectionEnumFromString on String {
  ChangeDirectionEnum toChangeDirectionEnum() {
    switch (this) {
      case 'INCREASE':
        return ChangeDirectionEnum.increase;
      case 'DECREASE':
        return ChangeDirectionEnum.decrease;
    }
    throw Exception('$this is not known in enum ChangeDirectionEnum');
  }
}

/// A structure containing the CloudWatch Logs log group where the project
/// stores evaluation events.
class CloudWatchLogsDestination {
  /// The name of the log group where the project stores evaluation events.
  final String? logGroup;

  CloudWatchLogsDestination({
    this.logGroup,
  });

  factory CloudWatchLogsDestination.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogsDestination(
      logGroup: json['logGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroup = this.logGroup;
    return {
      if (logGroup != null) 'logGroup': logGroup,
    };
  }
}

/// A structure containing the CloudWatch Logs log group where the project
/// stores evaluation events.
class CloudWatchLogsDestinationConfig {
  /// The name of the log group where the project stores evaluation events.
  final String? logGroup;

  CloudWatchLogsDestinationConfig({
    this.logGroup,
  });

  Map<String, dynamic> toJson() {
    final logGroup = this.logGroup;
    return {
      if (logGroup != null) 'logGroup': logGroup,
    };
  }
}

class CreateExperimentResponse {
  /// A structure containing the configuration details of the experiment that you
  /// created.
  final Experiment experiment;

  CreateExperimentResponse({
    required this.experiment,
  });

  factory CreateExperimentResponse.fromJson(Map<String, dynamic> json) {
    return CreateExperimentResponse(
      experiment:
          Experiment.fromJson(json['experiment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final experiment = this.experiment;
    return {
      'experiment': experiment,
    };
  }
}

class CreateFeatureResponse {
  /// A structure that contains information about the new feature.
  final Feature? feature;

  CreateFeatureResponse({
    this.feature,
  });

  factory CreateFeatureResponse.fromJson(Map<String, dynamic> json) {
    return CreateFeatureResponse(
      feature: json['feature'] != null
          ? Feature.fromJson(json['feature'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final feature = this.feature;
    return {
      if (feature != null) 'feature': feature,
    };
  }
}

class CreateLaunchResponse {
  /// A structure that contains the configuration of the launch that was created.
  final Launch launch;

  CreateLaunchResponse({
    required this.launch,
  });

  factory CreateLaunchResponse.fromJson(Map<String, dynamic> json) {
    return CreateLaunchResponse(
      launch: Launch.fromJson(json['launch'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final launch = this.launch;
    return {
      'launch': launch,
    };
  }
}

class CreateProjectResponse {
  /// A structure that contains information about the created project.
  final Project project;

  CreateProjectResponse({
    required this.project,
  });

  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) {
    return CreateProjectResponse(
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      'project': project,
    };
  }
}

class CreateSegmentResponse {
  /// A structure that contains the complete information about the segment that
  /// was just created.
  final Segment segment;

  CreateSegmentResponse({
    required this.segment,
  });

  factory CreateSegmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateSegmentResponse(
      segment: Segment.fromJson(json['segment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final segment = this.segment;
    return {
      'segment': segment,
    };
  }
}

class DeleteExperimentResponse {
  DeleteExperimentResponse();

  factory DeleteExperimentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteExperimentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFeatureResponse {
  DeleteFeatureResponse();

  factory DeleteFeatureResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFeatureResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLaunchResponse {
  DeleteLaunchResponse();

  factory DeleteLaunchResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLaunchResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteProjectResponse {
  DeleteProjectResponse();

  factory DeleteProjectResponse.fromJson(Map<String, dynamic> _) {
    return DeleteProjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSegmentResponse {
  DeleteSegmentResponse();

  factory DeleteSegmentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSegmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class EvaluateFeatureResponse {
  /// If this user was assigned to a launch or experiment, this field lists the
  /// launch or experiment name.
  final Object? details;

  /// Specifies the reason that the user session was assigned this variation.
  /// Possible values include <code>DEFAULT</code>, meaning the user was served
  /// the default variation; <code>LAUNCH_RULE_MATCH</code>, if the user session
  /// was enrolled in a launch; <code>EXPERIMENT_RULE_MATCH</code>, if the user
  /// session was enrolled in an experiment; or
  /// <code>ENTITY_OVERRIDES_MATCH</code>, if the user's <code>entityId</code>
  /// matches an override rule.
  final String? reason;

  /// The value assigned to this variation to differentiate it from the other
  /// variations of this feature.
  final VariableValue? value;

  /// The name of the variation that was served to the user session.
  final String? variation;

  EvaluateFeatureResponse({
    this.details,
    this.reason,
    this.value,
    this.variation,
  });

  factory EvaluateFeatureResponse.fromJson(Map<String, dynamic> json) {
    return EvaluateFeatureResponse(
      details: json['details'] == null
          ? null
          : jsonDecode(json['details'] as String),
      reason: json['reason'] as String?,
      value: json['value'] != null
          ? VariableValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
      variation: json['variation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final reason = this.reason;
    final value = this.value;
    final variation = this.variation;
    return {
      if (details != null) 'details': jsonEncode(details),
      if (reason != null) 'reason': reason,
      if (value != null) 'value': value,
      if (variation != null) 'variation': variation,
    };
  }
}

/// This structure assigns a feature variation to one user session.
class EvaluationRequest {
  /// An internal ID that represents a unique user session of the application.
  /// This <code>entityID</code> is checked against any override rules assigned
  /// for this feature.
  final String entityId;

  /// The name of the feature being evaluated.
  final String feature;

  /// A JSON block of attributes that you can optionally pass in. This JSON block
  /// is included in the evaluation events sent to Evidently from the user
  /// session.
  final Object? evaluationContext;

  EvaluationRequest({
    required this.entityId,
    required this.feature,
    this.evaluationContext,
  });

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final feature = this.feature;
    final evaluationContext = this.evaluationContext;
    return {
      'entityId': entityId,
      'feature': feature,
      if (evaluationContext != null)
        'evaluationContext': jsonEncode(evaluationContext),
    };
  }
}

/// This structure displays the results of one feature evaluation assignment to
/// one user session.
class EvaluationResult {
  /// An internal ID that represents a unique user session of the application.
  final String entityId;

  /// The name of the feature being evaluated.
  final String feature;

  /// If this user was assigned to a launch or experiment, this field lists the
  /// launch or experiment name.
  final Object? details;

  /// The name or ARN of the project that contains the feature being evaluated.
  final String? project;

  /// Specifies the reason that the user session was assigned this variation.
  /// Possible values include <code>DEFAULT</code>, meaning the user was served
  /// the default variation; <code>LAUNCH_RULE_MATCH</code>, if the user session
  /// was enrolled in a launch; or <code>EXPERIMENT_RULE_MATCH</code>, if the user
  /// session was enrolled in an experiment.
  final String? reason;

  /// The value assigned to this variation to differentiate it from the other
  /// variations of this feature.
  final VariableValue? value;

  /// The name of the variation that was served to the user session.
  final String? variation;

  EvaluationResult({
    required this.entityId,
    required this.feature,
    this.details,
    this.project,
    this.reason,
    this.value,
    this.variation,
  });

  factory EvaluationResult.fromJson(Map<String, dynamic> json) {
    return EvaluationResult(
      entityId: json['entityId'] as String,
      feature: json['feature'] as String,
      details: json['details'] == null
          ? null
          : jsonDecode(json['details'] as String),
      project: json['project'] as String?,
      reason: json['reason'] as String?,
      value: json['value'] != null
          ? VariableValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
      variation: json['variation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final feature = this.feature;
    final details = this.details;
    final project = this.project;
    final reason = this.reason;
    final value = this.value;
    final variation = this.variation;
    return {
      'entityId': entityId,
      'feature': feature,
      if (details != null) 'details': jsonEncode(details),
      if (project != null) 'project': project,
      if (reason != null) 'reason': reason,
      if (value != null) 'value': value,
      if (variation != null) 'variation': variation,
    };
  }
}

/// A structure that contains the information about an evaluation rule for this
/// feature, if it is used in a launch or experiment.
class EvaluationRule {
  /// This value is <code>aws.evidently.splits</code> if this is an evaluation
  /// rule for a launch, and it is <code>aws.evidently.onlineab</code> if this is
  /// an evaluation rule for an experiment.
  final String type;

  /// The name of the experiment or launch.
  final String? name;

  EvaluationRule({
    required this.type,
    this.name,
  });

  factory EvaluationRule.fromJson(Map<String, dynamic> json) {
    return EvaluationRule(
      type: json['type'] as String,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final name = this.name;
    return {
      'type': type,
      if (name != null) 'name': name,
    };
  }
}

/// A structure that contains the information about one evaluation event or
/// custom event sent to Evidently. This is a JSON payload. If this event
/// specifies a pre-defined event type, the payload must follow the defined
/// event schema.
class Event {
  /// The event data.
  final Object data;

  /// The timestamp of the event.
  final DateTime timestamp;

  /// <code>aws.evidently.evaluation</code> specifies an evaluation event, which
  /// determines which feature variation that a user sees.
  /// <code>aws.evidently.custom</code> specifies a custom event, which generates
  /// metrics from user actions such as clicks and checkouts.
  final EventType type;

  Event({
    required this.data,
    required this.timestamp,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    final timestamp = this.timestamp;
    final type = this.type;
    return {
      'data': jsonEncode(data),
      'timestamp': unixTimestampToJson(timestamp),
      'type': type.toValue(),
    };
  }
}

enum EventType {
  awsEvidentlyEvaluation,
  awsEvidentlyCustom,
}

extension EventTypeValueExtension on EventType {
  String toValue() {
    switch (this) {
      case EventType.awsEvidentlyEvaluation:
        return 'aws.evidently.evaluation';
      case EventType.awsEvidentlyCustom:
        return 'aws.evidently.custom';
    }
  }
}

extension EventTypeFromString on String {
  EventType toEventType() {
    switch (this) {
      case 'aws.evidently.evaluation':
        return EventType.awsEvidentlyEvaluation;
      case 'aws.evidently.custom':
        return EventType.awsEvidentlyCustom;
    }
    throw Exception('$this is not known in enum EventType');
  }
}

/// A structure containing the configuration details of an experiment.
class Experiment {
  /// The ARN of the experiment.
  final String arn;

  /// The date and time that the experiment is first created.
  final DateTime createdTime;

  /// The date and time that the experiment was most recently updated.
  final DateTime lastUpdatedTime;

  /// The name of the experiment.
  final String name;

  /// The current state of the experiment.
  final ExperimentStatus status;

  /// The type of this experiment. Currently, this value must be
  /// <code>aws.experiment.onlineab</code>.
  final ExperimentType type;

  /// A description of the experiment.
  final String? description;

  /// A structure that contains the date and time that the experiment started and
  /// ended.
  final ExperimentExecution? execution;

  /// An array of structures that defines the metrics used for the experiment, and
  /// whether a higher or lower value for each metric is the goal.
  final List<MetricGoal>? metricGoals;

  /// A structure that contains the configuration of which variation to use as the
  /// "control" version. The "control" version is used for comparison with other
  /// variations. This structure also specifies how much experiment traffic is
  /// allocated to each variation.
  final OnlineAbDefinition? onlineAbDefinition;

  /// The name or ARN of the project that contains this experiment.
  final String? project;

  /// This value is used when Evidently assigns a particular user session to the
  /// experiment. It helps create a randomization ID to determine which variation
  /// the user session is served. This randomization ID is a combination of the
  /// entity ID and <code>randomizationSalt</code>.
  final String? randomizationSalt;

  /// In thousandths of a percent, the amount of the available audience that is
  /// allocated to this experiment. The available audience is the total audience
  /// minus the audience that you have allocated to overrides or current launches
  /// of this feature.
  ///
  /// This is represented in thousandths of a percent, so a value of 10,000 is 10%
  /// of the available audience.
  final int? samplingRate;

  /// A structure that contains the time and date that Evidently completed the
  /// analysis of the experiment.
  final ExperimentSchedule? schedule;

  /// The audience segment being used for the experiment, if a segment is being
  /// used.
  final String? segment;

  /// If the experiment was stopped, this is the string that was entered by the
  /// person who stopped the experiment, to explain why it was stopped.
  final String? statusReason;

  /// The list of tag keys and values associated with this experiment.
  final Map<String, String>? tags;

  /// An array of structures that describe the configuration of each feature
  /// variation used in the experiment.
  final List<Treatment>? treatments;

  Experiment({
    required this.arn,
    required this.createdTime,
    required this.lastUpdatedTime,
    required this.name,
    required this.status,
    required this.type,
    this.description,
    this.execution,
    this.metricGoals,
    this.onlineAbDefinition,
    this.project,
    this.randomizationSalt,
    this.samplingRate,
    this.schedule,
    this.segment,
    this.statusReason,
    this.tags,
    this.treatments,
  });

  factory Experiment.fromJson(Map<String, dynamic> json) {
    return Experiment(
      arn: json['arn'] as String,
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toExperimentStatus(),
      type: (json['type'] as String).toExperimentType(),
      description: json['description'] as String?,
      execution: json['execution'] != null
          ? ExperimentExecution.fromJson(
              json['execution'] as Map<String, dynamic>)
          : null,
      metricGoals: (json['metricGoals'] as List?)
          ?.whereNotNull()
          .map((e) => MetricGoal.fromJson(e as Map<String, dynamic>))
          .toList(),
      onlineAbDefinition: json['onlineAbDefinition'] != null
          ? OnlineAbDefinition.fromJson(
              json['onlineAbDefinition'] as Map<String, dynamic>)
          : null,
      project: json['project'] as String?,
      randomizationSalt: json['randomizationSalt'] as String?,
      samplingRate: json['samplingRate'] as int?,
      schedule: json['schedule'] != null
          ? ExperimentSchedule.fromJson(
              json['schedule'] as Map<String, dynamic>)
          : null,
      segment: json['segment'] as String?,
      statusReason: json['statusReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      treatments: (json['treatments'] as List?)
          ?.whereNotNull()
          .map((e) => Treatment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final description = this.description;
    final execution = this.execution;
    final metricGoals = this.metricGoals;
    final onlineAbDefinition = this.onlineAbDefinition;
    final project = this.project;
    final randomizationSalt = this.randomizationSalt;
    final samplingRate = this.samplingRate;
    final schedule = this.schedule;
    final segment = this.segment;
    final statusReason = this.statusReason;
    final tags = this.tags;
    final treatments = this.treatments;
    return {
      'arn': arn,
      'createdTime': unixTimestampToJson(createdTime),
      'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      'name': name,
      'status': status.toValue(),
      'type': type.toValue(),
      if (description != null) 'description': description,
      if (execution != null) 'execution': execution,
      if (metricGoals != null) 'metricGoals': metricGoals,
      if (onlineAbDefinition != null) 'onlineAbDefinition': onlineAbDefinition,
      if (project != null) 'project': project,
      if (randomizationSalt != null) 'randomizationSalt': randomizationSalt,
      if (samplingRate != null) 'samplingRate': samplingRate,
      if (schedule != null) 'schedule': schedule,
      if (segment != null) 'segment': segment,
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
      if (treatments != null) 'treatments': treatments,
    };
  }
}

enum ExperimentBaseStat {
  mean,
}

extension ExperimentBaseStatValueExtension on ExperimentBaseStat {
  String toValue() {
    switch (this) {
      case ExperimentBaseStat.mean:
        return 'Mean';
    }
  }
}

extension ExperimentBaseStatFromString on String {
  ExperimentBaseStat toExperimentBaseStat() {
    switch (this) {
      case 'Mean':
        return ExperimentBaseStat.mean;
    }
    throw Exception('$this is not known in enum ExperimentBaseStat');
  }
}

/// This structure contains the date and time that the experiment started and
/// ended.
class ExperimentExecution {
  /// The date and time that the experiment ended.
  final DateTime? endedTime;

  /// The date and time that the experiment started.
  final DateTime? startedTime;

  ExperimentExecution({
    this.endedTime,
    this.startedTime,
  });

  factory ExperimentExecution.fromJson(Map<String, dynamic> json) {
    return ExperimentExecution(
      endedTime: timeStampFromJson(json['endedTime']),
      startedTime: timeStampFromJson(json['startedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endedTime = this.endedTime;
    final startedTime = this.startedTime;
    return {
      if (endedTime != null) 'endedTime': unixTimestampToJson(endedTime),
      if (startedTime != null) 'startedTime': unixTimestampToJson(startedTime),
    };
  }
}

/// A structure that contains results of an experiment.
class ExperimentReport {
  /// The content of the report.
  final Object? content;

  /// The name of the metric that is analyzed in this experiment report.
  final String? metricName;

  /// The type of analysis used for this report.
  final ExperimentReportName? reportName;

  /// The name of the variation that this report pertains to.
  final String? treatmentName;

  ExperimentReport({
    this.content,
    this.metricName,
    this.reportName,
    this.treatmentName,
  });

  factory ExperimentReport.fromJson(Map<String, dynamic> json) {
    return ExperimentReport(
      content: json['content'] == null
          ? null
          : jsonDecode(json['content'] as String),
      metricName: json['metricName'] as String?,
      reportName: (json['reportName'] as String?)?.toExperimentReportName(),
      treatmentName: json['treatmentName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final metricName = this.metricName;
    final reportName = this.reportName;
    final treatmentName = this.treatmentName;
    return {
      if (content != null) 'content': jsonEncode(content),
      if (metricName != null) 'metricName': metricName,
      if (reportName != null) 'reportName': reportName.toValue(),
      if (treatmentName != null) 'treatmentName': treatmentName,
    };
  }
}

enum ExperimentReportName {
  bayesianInference,
}

extension ExperimentReportNameValueExtension on ExperimentReportName {
  String toValue() {
    switch (this) {
      case ExperimentReportName.bayesianInference:
        return 'BayesianInference';
    }
  }
}

extension ExperimentReportNameFromString on String {
  ExperimentReportName toExperimentReportName() {
    switch (this) {
      case 'BayesianInference':
        return ExperimentReportName.bayesianInference;
    }
    throw Exception('$this is not known in enum ExperimentReportName');
  }
}

enum ExperimentResultRequestType {
  baseStat,
  treatmentEffect,
  confidenceInterval,
  pValue,
}

extension ExperimentResultRequestTypeValueExtension
    on ExperimentResultRequestType {
  String toValue() {
    switch (this) {
      case ExperimentResultRequestType.baseStat:
        return 'BaseStat';
      case ExperimentResultRequestType.treatmentEffect:
        return 'TreatmentEffect';
      case ExperimentResultRequestType.confidenceInterval:
        return 'ConfidenceInterval';
      case ExperimentResultRequestType.pValue:
        return 'PValue';
    }
  }
}

extension ExperimentResultRequestTypeFromString on String {
  ExperimentResultRequestType toExperimentResultRequestType() {
    switch (this) {
      case 'BaseStat':
        return ExperimentResultRequestType.baseStat;
      case 'TreatmentEffect':
        return ExperimentResultRequestType.treatmentEffect;
      case 'ConfidenceInterval':
        return ExperimentResultRequestType.confidenceInterval;
      case 'PValue':
        return ExperimentResultRequestType.pValue;
    }
    throw Exception('$this is not known in enum ExperimentResultRequestType');
  }
}

enum ExperimentResultResponseType {
  mean,
  treatmentEffect,
  confidenceIntervalUpperBound,
  confidenceIntervalLowerBound,
  pValue,
}

extension ExperimentResultResponseTypeValueExtension
    on ExperimentResultResponseType {
  String toValue() {
    switch (this) {
      case ExperimentResultResponseType.mean:
        return 'Mean';
      case ExperimentResultResponseType.treatmentEffect:
        return 'TreatmentEffect';
      case ExperimentResultResponseType.confidenceIntervalUpperBound:
        return 'ConfidenceIntervalUpperBound';
      case ExperimentResultResponseType.confidenceIntervalLowerBound:
        return 'ConfidenceIntervalLowerBound';
      case ExperimentResultResponseType.pValue:
        return 'PValue';
    }
  }
}

extension ExperimentResultResponseTypeFromString on String {
  ExperimentResultResponseType toExperimentResultResponseType() {
    switch (this) {
      case 'Mean':
        return ExperimentResultResponseType.mean;
      case 'TreatmentEffect':
        return ExperimentResultResponseType.treatmentEffect;
      case 'ConfidenceIntervalUpperBound':
        return ExperimentResultResponseType.confidenceIntervalUpperBound;
      case 'ConfidenceIntervalLowerBound':
        return ExperimentResultResponseType.confidenceIntervalLowerBound;
      case 'PValue':
        return ExperimentResultResponseType.pValue;
    }
    throw Exception('$this is not known in enum ExperimentResultResponseType');
  }
}

/// A structure that contains experiment results for one metric that is
/// monitored in the experiment.
class ExperimentResultsData {
  /// The name of the metric.
  final String? metricName;

  /// The experiment statistic that these results pertain to.
  final ExperimentResultResponseType? resultStat;

  /// The treatment, or variation, that returned the <code>values</code> in this
  /// structure.
  final String? treatmentName;

  /// The values for the <code>metricName</code> that were recorded in the
  /// experiment.
  final List<double>? values;

  ExperimentResultsData({
    this.metricName,
    this.resultStat,
    this.treatmentName,
    this.values,
  });

  factory ExperimentResultsData.fromJson(Map<String, dynamic> json) {
    return ExperimentResultsData(
      metricName: json['metricName'] as String?,
      resultStat:
          (json['resultStat'] as String?)?.toExperimentResultResponseType(),
      treatmentName: json['treatmentName'] as String?,
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final resultStat = this.resultStat;
    final treatmentName = this.treatmentName;
    final values = this.values;
    return {
      if (metricName != null) 'metricName': metricName,
      if (resultStat != null) 'resultStat': resultStat.toValue(),
      if (treatmentName != null) 'treatmentName': treatmentName,
      if (values != null) 'values': values,
    };
  }
}

/// This structure contains the time and date that Evidently completed the
/// analysis of the experiment.
class ExperimentSchedule {
  /// The time and date that Evidently completed the analysis of the experiment.
  final DateTime? analysisCompleteTime;

  ExperimentSchedule({
    this.analysisCompleteTime,
  });

  factory ExperimentSchedule.fromJson(Map<String, dynamic> json) {
    return ExperimentSchedule(
      analysisCompleteTime: timeStampFromJson(json['analysisCompleteTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisCompleteTime = this.analysisCompleteTime;
    return {
      if (analysisCompleteTime != null)
        'analysisCompleteTime': unixTimestampToJson(analysisCompleteTime),
    };
  }
}

enum ExperimentStatus {
  created,
  updating,
  running,
  completed,
  cancelled,
}

extension ExperimentStatusValueExtension on ExperimentStatus {
  String toValue() {
    switch (this) {
      case ExperimentStatus.created:
        return 'CREATED';
      case ExperimentStatus.updating:
        return 'UPDATING';
      case ExperimentStatus.running:
        return 'RUNNING';
      case ExperimentStatus.completed:
        return 'COMPLETED';
      case ExperimentStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension ExperimentStatusFromString on String {
  ExperimentStatus toExperimentStatus() {
    switch (this) {
      case 'CREATED':
        return ExperimentStatus.created;
      case 'UPDATING':
        return ExperimentStatus.updating;
      case 'RUNNING':
        return ExperimentStatus.running;
      case 'COMPLETED':
        return ExperimentStatus.completed;
      case 'CANCELLED':
        return ExperimentStatus.cancelled;
    }
    throw Exception('$this is not known in enum ExperimentStatus');
  }
}

enum ExperimentStopDesiredState {
  completed,
  cancelled,
}

extension ExperimentStopDesiredStateValueExtension
    on ExperimentStopDesiredState {
  String toValue() {
    switch (this) {
      case ExperimentStopDesiredState.completed:
        return 'COMPLETED';
      case ExperimentStopDesiredState.cancelled:
        return 'CANCELLED';
    }
  }
}

extension ExperimentStopDesiredStateFromString on String {
  ExperimentStopDesiredState toExperimentStopDesiredState() {
    switch (this) {
      case 'COMPLETED':
        return ExperimentStopDesiredState.completed;
      case 'CANCELLED':
        return ExperimentStopDesiredState.cancelled;
    }
    throw Exception('$this is not known in enum ExperimentStopDesiredState');
  }
}

enum ExperimentType {
  awsEvidentlyOnlineab,
}

extension ExperimentTypeValueExtension on ExperimentType {
  String toValue() {
    switch (this) {
      case ExperimentType.awsEvidentlyOnlineab:
        return 'aws.evidently.onlineab';
    }
  }
}

extension ExperimentTypeFromString on String {
  ExperimentType toExperimentType() {
    switch (this) {
      case 'aws.evidently.onlineab':
        return ExperimentType.awsEvidentlyOnlineab;
    }
    throw Exception('$this is not known in enum ExperimentType');
  }
}

/// This structure contains information about one Evidently feature in your
/// account.
class Feature {
  /// The ARN of the feature.
  final String arn;

  /// The date and time that the feature is created.
  final DateTime createdTime;

  /// If this value is <code>ALL_RULES</code>, the traffic allocation specified by
  /// any ongoing launches or experiments is being used. If this is
  /// <code>DEFAULT_VARIATION</code>, the default variation is being served to all
  /// users.
  final FeatureEvaluationStrategy evaluationStrategy;

  /// The date and time that the feature was most recently updated.
  final DateTime lastUpdatedTime;

  /// The name of the feature.
  final String name;

  /// The current state of the feature.
  final FeatureStatus status;

  /// Defines the type of value used to define the different feature variations.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Evidently-variationtypes.html">Variation
  /// types</a>
  final VariationValueType valueType;

  /// An array of structures that contain the configuration of the feature's
  /// different variations.
  final List<Variation> variations;

  /// The name of the variation that is used as the default variation. The default
  /// variation is served to users who are not allocated to any ongoing launches
  /// or experiments of this feature.
  ///
  /// This variation must also be listed in the <code>variations</code> structure.
  ///
  /// If you omit <code>defaultVariation</code>, the first variation listed in the
  /// <code>variations</code> structure is used as the default variation.
  final String? defaultVariation;

  /// The description of the feature.
  final String? description;

  /// A set of key-value pairs that specify users who should always be served a
  /// specific variation of a feature. Each key specifies a user using their user
  /// ID, account ID, or some other identifier. The value specifies the name of
  /// the variation that the user is to be served.
  ///
  /// For the override to be successful, the value of the key must match the
  /// <code>entityId</code> used in the <a
  /// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_EvaluateFeature.html">EvaluateFeature</a>
  /// operation.
  final Map<String, String>? entityOverrides;

  /// An array of structures that define the evaluation rules for the feature.
  final List<EvaluationRule>? evaluationRules;

  /// The name or ARN of the project that contains the feature.
  final String? project;

  /// The list of tag keys and values associated with this feature.
  final Map<String, String>? tags;

  Feature({
    required this.arn,
    required this.createdTime,
    required this.evaluationStrategy,
    required this.lastUpdatedTime,
    required this.name,
    required this.status,
    required this.valueType,
    required this.variations,
    this.defaultVariation,
    this.description,
    this.entityOverrides,
    this.evaluationRules,
    this.project,
    this.tags,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      arn: json['arn'] as String,
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      evaluationStrategy:
          (json['evaluationStrategy'] as String).toFeatureEvaluationStrategy(),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toFeatureStatus(),
      valueType: (json['valueType'] as String).toVariationValueType(),
      variations: (json['variations'] as List)
          .whereNotNull()
          .map((e) => Variation.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultVariation: json['defaultVariation'] as String?,
      description: json['description'] as String?,
      entityOverrides: (json['entityOverrides'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      evaluationRules: (json['evaluationRules'] as List?)
          ?.whereNotNull()
          .map((e) => EvaluationRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      project: json['project'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final evaluationStrategy = this.evaluationStrategy;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final status = this.status;
    final valueType = this.valueType;
    final variations = this.variations;
    final defaultVariation = this.defaultVariation;
    final description = this.description;
    final entityOverrides = this.entityOverrides;
    final evaluationRules = this.evaluationRules;
    final project = this.project;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdTime': unixTimestampToJson(createdTime),
      'evaluationStrategy': evaluationStrategy.toValue(),
      'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      'name': name,
      'status': status.toValue(),
      'valueType': valueType.toValue(),
      'variations': variations,
      if (defaultVariation != null) 'defaultVariation': defaultVariation,
      if (description != null) 'description': description,
      if (entityOverrides != null) 'entityOverrides': entityOverrides,
      if (evaluationRules != null) 'evaluationRules': evaluationRules,
      if (project != null) 'project': project,
      if (tags != null) 'tags': tags,
    };
  }
}

enum FeatureEvaluationStrategy {
  allRules,
  defaultVariation,
}

extension FeatureEvaluationStrategyValueExtension on FeatureEvaluationStrategy {
  String toValue() {
    switch (this) {
      case FeatureEvaluationStrategy.allRules:
        return 'ALL_RULES';
      case FeatureEvaluationStrategy.defaultVariation:
        return 'DEFAULT_VARIATION';
    }
  }
}

extension FeatureEvaluationStrategyFromString on String {
  FeatureEvaluationStrategy toFeatureEvaluationStrategy() {
    switch (this) {
      case 'ALL_RULES':
        return FeatureEvaluationStrategy.allRules;
      case 'DEFAULT_VARIATION':
        return FeatureEvaluationStrategy.defaultVariation;
    }
    throw Exception('$this is not known in enum FeatureEvaluationStrategy');
  }
}

enum FeatureStatus {
  available,
  updating,
}

extension FeatureStatusValueExtension on FeatureStatus {
  String toValue() {
    switch (this) {
      case FeatureStatus.available:
        return 'AVAILABLE';
      case FeatureStatus.updating:
        return 'UPDATING';
    }
  }
}

extension FeatureStatusFromString on String {
  FeatureStatus toFeatureStatus() {
    switch (this) {
      case 'AVAILABLE':
        return FeatureStatus.available;
      case 'UPDATING':
        return FeatureStatus.updating;
    }
    throw Exception('$this is not known in enum FeatureStatus');
  }
}

/// This structure contains information about one Evidently feature in your
/// account.
class FeatureSummary {
  /// The ARN of the feature.
  final String arn;

  /// The date and time that the feature is created.
  final DateTime createdTime;

  /// If this value is <code>ALL_RULES</code>, the traffic allocation specified by
  /// any ongoing launches or experiments is being used. If this is
  /// <code>DEFAULT_VARIATION</code>, the default variation is being served to all
  /// users.
  final FeatureEvaluationStrategy evaluationStrategy;

  /// The date and time that the feature was most recently updated.
  final DateTime lastUpdatedTime;

  /// The name of the feature.
  final String name;

  /// The current state of the feature.
  final FeatureStatus status;

  /// The name of the variation that is used as the default variation. The default
  /// variation is served to users who are not allocated to any ongoing launches
  /// or experiments of this feature.
  final String? defaultVariation;

  /// An array of structures that define
  final List<EvaluationRule>? evaluationRules;

  /// The name or ARN of the project that contains the feature.
  final String? project;

  /// The list of tag keys and values associated with this feature.
  final Map<String, String>? tags;

  FeatureSummary({
    required this.arn,
    required this.createdTime,
    required this.evaluationStrategy,
    required this.lastUpdatedTime,
    required this.name,
    required this.status,
    this.defaultVariation,
    this.evaluationRules,
    this.project,
    this.tags,
  });

  factory FeatureSummary.fromJson(Map<String, dynamic> json) {
    return FeatureSummary(
      arn: json['arn'] as String,
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      evaluationStrategy:
          (json['evaluationStrategy'] as String).toFeatureEvaluationStrategy(),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toFeatureStatus(),
      defaultVariation: json['defaultVariation'] as String?,
      evaluationRules: (json['evaluationRules'] as List?)
          ?.whereNotNull()
          .map((e) => EvaluationRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      project: json['project'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final evaluationStrategy = this.evaluationStrategy;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final status = this.status;
    final defaultVariation = this.defaultVariation;
    final evaluationRules = this.evaluationRules;
    final project = this.project;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdTime': unixTimestampToJson(createdTime),
      'evaluationStrategy': evaluationStrategy.toValue(),
      'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      'name': name,
      'status': status.toValue(),
      if (defaultVariation != null) 'defaultVariation': defaultVariation,
      if (evaluationRules != null) 'evaluationRules': evaluationRules,
      if (project != null) 'project': project,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetExperimentResponse {
  /// A structure containing the configuration details of the experiment.
  final Experiment? experiment;

  GetExperimentResponse({
    this.experiment,
  });

  factory GetExperimentResponse.fromJson(Map<String, dynamic> json) {
    return GetExperimentResponse(
      experiment: json['experiment'] != null
          ? Experiment.fromJson(json['experiment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final experiment = this.experiment;
    return {
      if (experiment != null) 'experiment': experiment,
    };
  }
}

class GetExperimentResultsResponse {
  /// If the experiment doesn't yet have enough events to provide valid results,
  /// this field is returned with the message <code>Not enough events to generate
  /// results</code>. If there are enough events to provide valid results, this
  /// field is not returned.
  final String? details;

  /// An array of structures that include the reports that you requested.
  final List<ExperimentReport>? reports;

  /// An array of structures that include experiment results including metric
  /// names and values.
  final List<ExperimentResultsData>? resultsData;

  /// The timestamps of each result returned.
  final List<DateTime>? timestamps;

  GetExperimentResultsResponse({
    this.details,
    this.reports,
    this.resultsData,
    this.timestamps,
  });

  factory GetExperimentResultsResponse.fromJson(Map<String, dynamic> json) {
    return GetExperimentResultsResponse(
      details: json['details'] as String?,
      reports: (json['reports'] as List?)
          ?.whereNotNull()
          .map((e) => ExperimentReport.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultsData: (json['resultsData'] as List?)
          ?.whereNotNull()
          .map((e) => ExperimentResultsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamps: (json['timestamps'] as List?)
          ?.whereNotNull()
          .map(nonNullableTimeStampFromJson)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final reports = this.reports;
    final resultsData = this.resultsData;
    final timestamps = this.timestamps;
    return {
      if (details != null) 'details': details,
      if (reports != null) 'reports': reports,
      if (resultsData != null) 'resultsData': resultsData,
      if (timestamps != null)
        'timestamps': timestamps.map(unixTimestampToJson).toList(),
    };
  }
}

class GetFeatureResponse {
  /// A structure containing the configuration details of the feature.
  final Feature feature;

  GetFeatureResponse({
    required this.feature,
  });

  factory GetFeatureResponse.fromJson(Map<String, dynamic> json) {
    return GetFeatureResponse(
      feature: Feature.fromJson(json['feature'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final feature = this.feature;
    return {
      'feature': feature,
    };
  }
}

class GetLaunchResponse {
  /// A structure containing the configuration details of the launch.
  final Launch? launch;

  GetLaunchResponse({
    this.launch,
  });

  factory GetLaunchResponse.fromJson(Map<String, dynamic> json) {
    return GetLaunchResponse(
      launch: json['launch'] != null
          ? Launch.fromJson(json['launch'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final launch = this.launch;
    return {
      if (launch != null) 'launch': launch,
    };
  }
}

class GetProjectResponse {
  /// A structure containing the configuration details of the project.
  final Project project;

  GetProjectResponse({
    required this.project,
  });

  factory GetProjectResponse.fromJson(Map<String, dynamic> json) {
    return GetProjectResponse(
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      'project': project,
    };
  }
}

class GetSegmentResponse {
  /// A structure that contains the complete information about the segment.
  final Segment segment;

  GetSegmentResponse({
    required this.segment,
  });

  factory GetSegmentResponse.fromJson(Map<String, dynamic> json) {
    return GetSegmentResponse(
      segment: Segment.fromJson(json['segment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final segment = this.segment;
    return {
      'segment': segment,
    };
  }
}

/// This structure contains the configuration details of one Evidently launch.
class Launch {
  /// The ARN of the launch.
  final String arn;

  /// The date and time that the launch is created.
  final DateTime createdTime;

  /// The date and time that the launch was most recently updated.
  final DateTime lastUpdatedTime;

  /// The name of the launch.
  final String name;

  /// The current state of the launch.
  final LaunchStatus status;

  /// The type of launch.
  final LaunchType type;

  /// The description of the launch.
  final String? description;

  /// A structure that contains information about the start and end times of the
  /// launch.
  final LaunchExecution? execution;

  /// An array of structures that define the feature variations that are being
  /// used in the launch.
  final List<LaunchGroup>? groups;

  /// An array of structures that define the metrics that are being used to
  /// monitor the launch performance.
  final List<MetricMonitor>? metricMonitors;

  /// The name or ARN of the project that contains the launch.
  final String? project;

  /// This value is used when Evidently assigns a particular user session to the
  /// launch, to help create a randomization ID to determine which variation the
  /// user session is served. This randomization ID is a combination of the entity
  /// ID and <code>randomizationSalt</code>.
  final String? randomizationSalt;

  /// An array of structures that define the traffic allocation percentages among
  /// the feature variations during each step of the launch.
  final ScheduledSplitsLaunchDefinition? scheduledSplitsDefinition;

  /// If the launch was stopped, this is the string that was entered by the person
  /// who stopped the launch, to explain why it was stopped.
  final String? statusReason;

  /// The list of tag keys and values associated with this launch.
  final Map<String, String>? tags;

  Launch({
    required this.arn,
    required this.createdTime,
    required this.lastUpdatedTime,
    required this.name,
    required this.status,
    required this.type,
    this.description,
    this.execution,
    this.groups,
    this.metricMonitors,
    this.project,
    this.randomizationSalt,
    this.scheduledSplitsDefinition,
    this.statusReason,
    this.tags,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      arn: json['arn'] as String,
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toLaunchStatus(),
      type: (json['type'] as String).toLaunchType(),
      description: json['description'] as String?,
      execution: json['execution'] != null
          ? LaunchExecution.fromJson(json['execution'] as Map<String, dynamic>)
          : null,
      groups: (json['groups'] as List?)
          ?.whereNotNull()
          .map((e) => LaunchGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricMonitors: (json['metricMonitors'] as List?)
          ?.whereNotNull()
          .map((e) => MetricMonitor.fromJson(e as Map<String, dynamic>))
          .toList(),
      project: json['project'] as String?,
      randomizationSalt: json['randomizationSalt'] as String?,
      scheduledSplitsDefinition: json['scheduledSplitsDefinition'] != null
          ? ScheduledSplitsLaunchDefinition.fromJson(
              json['scheduledSplitsDefinition'] as Map<String, dynamic>)
          : null,
      statusReason: json['statusReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final description = this.description;
    final execution = this.execution;
    final groups = this.groups;
    final metricMonitors = this.metricMonitors;
    final project = this.project;
    final randomizationSalt = this.randomizationSalt;
    final scheduledSplitsDefinition = this.scheduledSplitsDefinition;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdTime': unixTimestampToJson(createdTime),
      'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      'name': name,
      'status': status.toValue(),
      'type': type.toValue(),
      if (description != null) 'description': description,
      if (execution != null) 'execution': execution,
      if (groups != null) 'groups': groups,
      if (metricMonitors != null) 'metricMonitors': metricMonitors,
      if (project != null) 'project': project,
      if (randomizationSalt != null) 'randomizationSalt': randomizationSalt,
      if (scheduledSplitsDefinition != null)
        'scheduledSplitsDefinition': scheduledSplitsDefinition,
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
    };
  }
}

/// This structure contains information about the start and end times of the
/// launch.
class LaunchExecution {
  /// The date and time that the launch ended.
  final DateTime? endedTime;

  /// The date and time that the launch started.
  final DateTime? startedTime;

  LaunchExecution({
    this.endedTime,
    this.startedTime,
  });

  factory LaunchExecution.fromJson(Map<String, dynamic> json) {
    return LaunchExecution(
      endedTime: timeStampFromJson(json['endedTime']),
      startedTime: timeStampFromJson(json['startedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endedTime = this.endedTime;
    final startedTime = this.startedTime;
    return {
      if (endedTime != null) 'endedTime': unixTimestampToJson(endedTime),
      if (startedTime != null) 'startedTime': unixTimestampToJson(startedTime),
    };
  }
}

/// A structure that defines one launch group in a launch. A launch group is a
/// variation of the feature that you are including in the launch.
class LaunchGroup {
  /// The feature variation for this launch group. This is a key-value pair.
  final Map<String, String> featureVariations;

  /// The name of the launch group.
  final String name;

  /// A description of the launch group.
  final String? description;

  LaunchGroup({
    required this.featureVariations,
    required this.name,
    this.description,
  });

  factory LaunchGroup.fromJson(Map<String, dynamic> json) {
    return LaunchGroup(
      featureVariations: (json['featureVariations'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      name: json['name'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final featureVariations = this.featureVariations;
    final name = this.name;
    final description = this.description;
    return {
      'featureVariations': featureVariations,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// A structure that defines one launch group in a launch. A launch group is a
/// variation of the feature that you are including in the launch.
class LaunchGroupConfig {
  /// The feature that this launch is using.
  final String feature;

  /// A name for this launch group.
  final String name;

  /// The feature variation to use for this launch group.
  final String variation;

  /// A description of the launch group.
  final String? description;

  LaunchGroupConfig({
    required this.feature,
    required this.name,
    required this.variation,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final feature = this.feature;
    final name = this.name;
    final variation = this.variation;
    final description = this.description;
    return {
      'feature': feature,
      'name': name,
      'variation': variation,
      if (description != null) 'description': description,
    };
  }
}

enum LaunchStatus {
  created,
  updating,
  running,
  completed,
  cancelled,
}

extension LaunchStatusValueExtension on LaunchStatus {
  String toValue() {
    switch (this) {
      case LaunchStatus.created:
        return 'CREATED';
      case LaunchStatus.updating:
        return 'UPDATING';
      case LaunchStatus.running:
        return 'RUNNING';
      case LaunchStatus.completed:
        return 'COMPLETED';
      case LaunchStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension LaunchStatusFromString on String {
  LaunchStatus toLaunchStatus() {
    switch (this) {
      case 'CREATED':
        return LaunchStatus.created;
      case 'UPDATING':
        return LaunchStatus.updating;
      case 'RUNNING':
        return LaunchStatus.running;
      case 'COMPLETED':
        return LaunchStatus.completed;
      case 'CANCELLED':
        return LaunchStatus.cancelled;
    }
    throw Exception('$this is not known in enum LaunchStatus');
  }
}

enum LaunchStopDesiredState {
  completed,
  cancelled,
}

extension LaunchStopDesiredStateValueExtension on LaunchStopDesiredState {
  String toValue() {
    switch (this) {
      case LaunchStopDesiredState.completed:
        return 'COMPLETED';
      case LaunchStopDesiredState.cancelled:
        return 'CANCELLED';
    }
  }
}

extension LaunchStopDesiredStateFromString on String {
  LaunchStopDesiredState toLaunchStopDesiredState() {
    switch (this) {
      case 'COMPLETED':
        return LaunchStopDesiredState.completed;
      case 'CANCELLED':
        return LaunchStopDesiredState.cancelled;
    }
    throw Exception('$this is not known in enum LaunchStopDesiredState');
  }
}

enum LaunchType {
  awsEvidentlySplits,
}

extension LaunchTypeValueExtension on LaunchType {
  String toValue() {
    switch (this) {
      case LaunchType.awsEvidentlySplits:
        return 'aws.evidently.splits';
    }
  }
}

extension LaunchTypeFromString on String {
  LaunchType toLaunchType() {
    switch (this) {
      case 'aws.evidently.splits':
        return LaunchType.awsEvidentlySplits;
    }
    throw Exception('$this is not known in enum LaunchType');
  }
}

class ListExperimentsResponse {
  /// An array of structures that contain the configuration details of the
  /// experiments in the specified project.
  final List<Experiment>? experiments;

  /// The token to use in a subsequent <code>ListExperiments</code> operation to
  /// return the next set of results.
  final String? nextToken;

  ListExperimentsResponse({
    this.experiments,
    this.nextToken,
  });

  factory ListExperimentsResponse.fromJson(Map<String, dynamic> json) {
    return ListExperimentsResponse(
      experiments: (json['experiments'] as List?)
          ?.whereNotNull()
          .map((e) => Experiment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final experiments = this.experiments;
    final nextToken = this.nextToken;
    return {
      if (experiments != null) 'experiments': experiments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFeaturesResponse {
  /// An array of structures that contain the configuration details of the
  /// features in the specified project.
  final List<FeatureSummary>? features;

  /// The token to use in a subsequent <code>ListFeatures</code> operation to
  /// return the next set of results.
  final String? nextToken;

  ListFeaturesResponse({
    this.features,
    this.nextToken,
  });

  factory ListFeaturesResponse.fromJson(Map<String, dynamic> json) {
    return ListFeaturesResponse(
      features: (json['features'] as List?)
          ?.whereNotNull()
          .map((e) => FeatureSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final features = this.features;
    final nextToken = this.nextToken;
    return {
      if (features != null) 'features': features,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListLaunchesResponse {
  /// An array of structures that contain the configuration details of the
  /// launches in the specified project.
  final List<Launch>? launches;

  /// The token to use in a subsequent <code>ListLaunches</code> operation to
  /// return the next set of results.
  final String? nextToken;

  ListLaunchesResponse({
    this.launches,
    this.nextToken,
  });

  factory ListLaunchesResponse.fromJson(Map<String, dynamic> json) {
    return ListLaunchesResponse(
      launches: (json['launches'] as List?)
          ?.whereNotNull()
          .map((e) => Launch.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final launches = this.launches;
    final nextToken = this.nextToken;
    return {
      if (launches != null) 'launches': launches,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListProjectsResponse {
  /// The token to use in a subsequent <code>ListProjects</code> operation to
  /// return the next set of results.
  final String? nextToken;

  /// An array of structures that contain the configuration details of the
  /// projects in the Region.
  final List<ProjectSummary>? projects;

  ListProjectsResponse({
    this.nextToken,
    this.projects,
  });

  factory ListProjectsResponse.fromJson(Map<String, dynamic> json) {
    return ListProjectsResponse(
      nextToken: json['nextToken'] as String?,
      projects: (json['projects'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final projects = this.projects;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (projects != null) 'projects': projects,
    };
  }
}

class ListSegmentReferencesResponse {
  /// The token to use in a subsequent <code>ListSegmentReferences</code>
  /// operation to return the next set of results.
  final String? nextToken;

  /// An array of structures, where each structure contains information about one
  /// experiment or launch that uses this segment.
  final List<RefResource>? referencedBy;

  ListSegmentReferencesResponse({
    this.nextToken,
    this.referencedBy,
  });

  factory ListSegmentReferencesResponse.fromJson(Map<String, dynamic> json) {
    return ListSegmentReferencesResponse(
      nextToken: json['nextToken'] as String?,
      referencedBy: (json['referencedBy'] as List?)
          ?.whereNotNull()
          .map((e) => RefResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final referencedBy = this.referencedBy;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (referencedBy != null) 'referencedBy': referencedBy,
    };
  }
}

class ListSegmentsResponse {
  /// The token to use in a subsequent <code>ListSegments</code> operation to
  /// return the next set of results.
  final String? nextToken;

  /// An array of structures that contain information about the segments in this
  /// Region.
  final List<Segment>? segments;

  ListSegmentsResponse({
    this.nextToken,
    this.segments,
  });

  factory ListSegmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListSegmentsResponse(
      nextToken: json['nextToken'] as String?,
      segments: (json['segments'] as List?)
          ?.whereNotNull()
          .map((e) => Segment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final segments = this.segments;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (segments != null) 'segments': segments,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tag keys and values associated with the resource you specified.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// This structure defines a metric that is being used to evaluate the
/// variations during a launch or experiment.
class MetricDefinition {
  /// The entity, such as a user or session, that does an action that causes a
  /// metric value to be recorded.
  final String? entityIdKey;

  /// The EventBridge event pattern that defines how the metric is recorded.
  ///
  /// For more information about EventBridge event patterns, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-patterns.html">Amazon
  /// EventBridge event patterns</a>.
  final Object? eventPattern;

  /// The name of the metric.
  final String? name;

  /// The label for the units that the metric is measuring.
  final String? unitLabel;

  /// The value that is tracked to produce the metric.
  final String? valueKey;

  MetricDefinition({
    this.entityIdKey,
    this.eventPattern,
    this.name,
    this.unitLabel,
    this.valueKey,
  });

  factory MetricDefinition.fromJson(Map<String, dynamic> json) {
    return MetricDefinition(
      entityIdKey: json['entityIdKey'] as String?,
      eventPattern: json['eventPattern'] == null
          ? null
          : jsonDecode(json['eventPattern'] as String),
      name: json['name'] as String?,
      unitLabel: json['unitLabel'] as String?,
      valueKey: json['valueKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entityIdKey = this.entityIdKey;
    final eventPattern = this.eventPattern;
    final name = this.name;
    final unitLabel = this.unitLabel;
    final valueKey = this.valueKey;
    return {
      if (entityIdKey != null) 'entityIdKey': entityIdKey,
      if (eventPattern != null) 'eventPattern': jsonEncode(eventPattern),
      if (name != null) 'name': name,
      if (unitLabel != null) 'unitLabel': unitLabel,
      if (valueKey != null) 'valueKey': valueKey,
    };
  }
}

/// This structure defines a metric that you want to use to evaluate the
/// variations during a launch or experiment.
class MetricDefinitionConfig {
  /// The entity, such as a user or session, that does an action that causes a
  /// metric value to be recorded. An example is <code>userDetails.userID</code>.
  final String entityIdKey;

  /// A name for the metric.
  final String name;

  /// The value that is tracked to produce the metric.
  final String valueKey;

  /// The EventBridge event pattern that defines how the metric is recorded.
  ///
  /// For more information about EventBridge event patterns, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-patterns.html">Amazon
  /// EventBridge event patterns</a>.
  final Object? eventPattern;

  /// A label for the units that the metric is measuring.
  final String? unitLabel;

  MetricDefinitionConfig({
    required this.entityIdKey,
    required this.name,
    required this.valueKey,
    this.eventPattern,
    this.unitLabel,
  });

  Map<String, dynamic> toJson() {
    final entityIdKey = this.entityIdKey;
    final name = this.name;
    final valueKey = this.valueKey;
    final eventPattern = this.eventPattern;
    final unitLabel = this.unitLabel;
    return {
      'entityIdKey': entityIdKey,
      'name': name,
      'valueKey': valueKey,
      if (eventPattern != null) 'eventPattern': jsonEncode(eventPattern),
      if (unitLabel != null) 'unitLabel': unitLabel,
    };
  }
}

/// A structure that tells Evidently whether higher or lower values are desired
/// for a metric that is used in an experiment.
class MetricGoal {
  /// A structure that contains details about the metric.
  final MetricDefinition metricDefinition;

  /// <code>INCREASE</code> means that a variation with a higher number for this
  /// metric is performing better.
  ///
  /// <code>DECREASE</code> means that a variation with a lower number for this
  /// metric is performing better.
  final ChangeDirectionEnum? desiredChange;

  MetricGoal({
    required this.metricDefinition,
    this.desiredChange,
  });

  factory MetricGoal.fromJson(Map<String, dynamic> json) {
    return MetricGoal(
      metricDefinition: MetricDefinition.fromJson(
          json['metricDefinition'] as Map<String, dynamic>),
      desiredChange:
          (json['desiredChange'] as String?)?.toChangeDirectionEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final metricDefinition = this.metricDefinition;
    final desiredChange = this.desiredChange;
    return {
      'metricDefinition': metricDefinition,
      if (desiredChange != null) 'desiredChange': desiredChange.toValue(),
    };
  }
}

/// Use this structure to tell Evidently whether higher or lower values are
/// desired for a metric that is used in an experiment.
class MetricGoalConfig {
  /// A structure that contains details about the metric.
  final MetricDefinitionConfig metricDefinition;

  /// <code>INCREASE</code> means that a variation with a higher number for this
  /// metric is performing better.
  ///
  /// <code>DECREASE</code> means that a variation with a lower number for this
  /// metric is performing better.
  final ChangeDirectionEnum? desiredChange;

  MetricGoalConfig({
    required this.metricDefinition,
    this.desiredChange,
  });

  Map<String, dynamic> toJson() {
    final metricDefinition = this.metricDefinition;
    final desiredChange = this.desiredChange;
    return {
      'metricDefinition': metricDefinition,
      if (desiredChange != null) 'desiredChange': desiredChange.toValue(),
    };
  }
}

/// A structure that defines a metric to be used to monitor performance of the
/// variations during a launch.
class MetricMonitor {
  /// A structure that defines the metric.
  final MetricDefinition metricDefinition;

  MetricMonitor({
    required this.metricDefinition,
  });

  factory MetricMonitor.fromJson(Map<String, dynamic> json) {
    return MetricMonitor(
      metricDefinition: MetricDefinition.fromJson(
          json['metricDefinition'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final metricDefinition = this.metricDefinition;
    return {
      'metricDefinition': metricDefinition,
    };
  }
}

/// A structure that defines a metric to be used to monitor performance of the
/// variations during a launch.
class MetricMonitorConfig {
  /// A structure that defines the metric.
  final MetricDefinitionConfig metricDefinition;

  MetricMonitorConfig({
    required this.metricDefinition,
  });

  Map<String, dynamic> toJson() {
    final metricDefinition = this.metricDefinition;
    return {
      'metricDefinition': metricDefinition,
    };
  }
}

/// A structure that contains the configuration of which variation to use as the
/// "control" version. The "control" version is used for comparison with other
/// variations. This structure also specifies how much experiment traffic is
/// allocated to each variation.
class OnlineAbConfig {
  /// The name of the variation that is to be the default variation that the other
  /// variations are compared to.
  final String? controlTreatmentName;

  /// A set of key-value pairs. The keys are variation names, and the values are
  /// the portion of experiment traffic to be assigned to that variation. Specify
  /// the traffic portion in thousandths of a percent, so 20,000 for a variation
  /// would allocate 20% of the experiment traffic to that variation.
  final Map<String, int>? treatmentWeights;

  OnlineAbConfig({
    this.controlTreatmentName,
    this.treatmentWeights,
  });

  Map<String, dynamic> toJson() {
    final controlTreatmentName = this.controlTreatmentName;
    final treatmentWeights = this.treatmentWeights;
    return {
      if (controlTreatmentName != null)
        'controlTreatmentName': controlTreatmentName,
      if (treatmentWeights != null) 'treatmentWeights': treatmentWeights,
    };
  }
}

/// A structure that contains the configuration of which variation to use as the
/// "control" version. The "control" version is used for comparison with other
/// variations. This structure also specifies how much experiment traffic is
/// allocated to each variation.
class OnlineAbDefinition {
  /// The name of the variation that is the default variation that the other
  /// variations are compared to.
  final String? controlTreatmentName;

  /// A set of key-value pairs. The keys are variation names, and the values are
  /// the portion of experiment traffic to be assigned to that variation. The
  /// traffic portion is specified in thousandths of a percent, so 20,000 for a
  /// variation would allocate 20% of the experiment traffic to that variation.
  final Map<String, int>? treatmentWeights;

  OnlineAbDefinition({
    this.controlTreatmentName,
    this.treatmentWeights,
  });

  factory OnlineAbDefinition.fromJson(Map<String, dynamic> json) {
    return OnlineAbDefinition(
      controlTreatmentName: json['controlTreatmentName'] as String?,
      treatmentWeights: (json['treatmentWeights'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final controlTreatmentName = this.controlTreatmentName;
    final treatmentWeights = this.treatmentWeights;
    return {
      if (controlTreatmentName != null)
        'controlTreatmentName': controlTreatmentName,
      if (treatmentWeights != null) 'treatmentWeights': treatmentWeights,
    };
  }
}

/// This structure defines a project, which is the logical object in Evidently
/// that can contain features, launches, and experiments. Use projects to group
/// similar features together.
class Project {
  /// The name or ARN of the project.
  final String arn;

  /// The date and time that the project is created.
  final DateTime createdTime;

  /// The date and time that the project was most recently updated.
  final DateTime lastUpdatedTime;

  /// The name of the project.
  final String name;

  /// The current state of the project.
  final ProjectStatus status;

  /// The number of ongoing experiments currently in the project.
  final int? activeExperimentCount;

  /// The number of ongoing launches currently in the project.
  final int? activeLaunchCount;

  /// This structure defines the configuration of how your application integrates
  /// with AppConfig to run client-side evaluation.
  final ProjectAppConfigResource? appConfigResource;

  /// A structure that contains information about where Evidently is to store
  /// evaluation events for longer term storage.
  final ProjectDataDelivery? dataDelivery;

  /// The user-entered description of the project.
  final String? description;

  /// The number of experiments currently in the project. This includes all
  /// experiments that have been created and not deleted, whether they are ongoing
  /// or not.
  final int? experimentCount;

  /// The number of features currently in the project.
  final int? featureCount;

  /// The number of launches currently in the project. This includes all launches
  /// that have been created and not deleted, whether they are ongoing or not.
  final int? launchCount;

  /// The list of tag keys and values associated with this project.
  final Map<String, String>? tags;

  Project({
    required this.arn,
    required this.createdTime,
    required this.lastUpdatedTime,
    required this.name,
    required this.status,
    this.activeExperimentCount,
    this.activeLaunchCount,
    this.appConfigResource,
    this.dataDelivery,
    this.description,
    this.experimentCount,
    this.featureCount,
    this.launchCount,
    this.tags,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      arn: json['arn'] as String,
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toProjectStatus(),
      activeExperimentCount: json['activeExperimentCount'] as int?,
      activeLaunchCount: json['activeLaunchCount'] as int?,
      appConfigResource: json['appConfigResource'] != null
          ? ProjectAppConfigResource.fromJson(
              json['appConfigResource'] as Map<String, dynamic>)
          : null,
      dataDelivery: json['dataDelivery'] != null
          ? ProjectDataDelivery.fromJson(
              json['dataDelivery'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      experimentCount: json['experimentCount'] as int?,
      featureCount: json['featureCount'] as int?,
      launchCount: json['launchCount'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final status = this.status;
    final activeExperimentCount = this.activeExperimentCount;
    final activeLaunchCount = this.activeLaunchCount;
    final appConfigResource = this.appConfigResource;
    final dataDelivery = this.dataDelivery;
    final description = this.description;
    final experimentCount = this.experimentCount;
    final featureCount = this.featureCount;
    final launchCount = this.launchCount;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdTime': unixTimestampToJson(createdTime),
      'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      'name': name,
      'status': status.toValue(),
      if (activeExperimentCount != null)
        'activeExperimentCount': activeExperimentCount,
      if (activeLaunchCount != null) 'activeLaunchCount': activeLaunchCount,
      if (appConfigResource != null) 'appConfigResource': appConfigResource,
      if (dataDelivery != null) 'dataDelivery': dataDelivery,
      if (description != null) 'description': description,
      if (experimentCount != null) 'experimentCount': experimentCount,
      if (featureCount != null) 'featureCount': featureCount,
      if (launchCount != null) 'launchCount': launchCount,
      if (tags != null) 'tags': tags,
    };
  }
}

/// This is a structure that defines the configuration of how your application
/// integrates with AppConfig to run client-side evaluation.
class ProjectAppConfigResource {
  /// The ID of the AppConfig application to use for client-side evaluation.
  final String applicationId;

  /// The ID of the AppConfig profile to use for client-side evaluation.
  final String configurationProfileId;

  /// The ID of the AppConfig environment to use for client-side evaluation. This
  /// must be an environment that is within the application that you specify for
  /// <code>applicationId</code>.
  final String environmentId;

  ProjectAppConfigResource({
    required this.applicationId,
    required this.configurationProfileId,
    required this.environmentId,
  });

  factory ProjectAppConfigResource.fromJson(Map<String, dynamic> json) {
    return ProjectAppConfigResource(
      applicationId: json['applicationId'] as String,
      configurationProfileId: json['configurationProfileId'] as String,
      environmentId: json['environmentId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final configurationProfileId = this.configurationProfileId;
    final environmentId = this.environmentId;
    return {
      'applicationId': applicationId,
      'configurationProfileId': configurationProfileId,
      'environmentId': environmentId,
    };
  }
}

/// Use this parameter to configure client-side evaluation for your project.
/// Client-side evaluation allows your application to assign variations to user
/// sessions locally instead of by calling the <a
/// href="https://docs.aws.amazon.com/cloudwatchevidently/latest/APIReference/API_EvaluateFeature.html">EvaluateFeature</a>
/// operation to assign the variations. This mitigates the latency and
/// availability risks that come with an API call.
///
/// <code>ProjectAppConfigResource</code> is a structure that defines the
/// configuration of how your application integrates with AppConfig to run
/// client-side evaluation.
class ProjectAppConfigResourceConfig {
  /// The ID of the AppConfig application to use for client-side evaluation.
  final String? applicationId;

  /// The ID of the AppConfig environment to use for client-side evaluation. This
  /// must be an environment that is within the application that you specify for
  /// <code>applicationId</code>.
  final String? environmentId;

  ProjectAppConfigResourceConfig({
    this.applicationId,
    this.environmentId,
  });

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final environmentId = this.environmentId;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (environmentId != null) 'environmentId': environmentId,
    };
  }
}

/// A structure that contains information about where Evidently is to store
/// evaluation events for longer term storage.
class ProjectDataDelivery {
  /// If the project stores evaluation events in CloudWatch Logs, this structure
  /// stores the log group name.
  final CloudWatchLogsDestination? cloudWatchLogs;

  /// If the project stores evaluation events in an Amazon S3 bucket, this
  /// structure stores the bucket name and bucket prefix.
  final S3Destination? s3Destination;

  ProjectDataDelivery({
    this.cloudWatchLogs,
    this.s3Destination,
  });

  factory ProjectDataDelivery.fromJson(Map<String, dynamic> json) {
    return ProjectDataDelivery(
      cloudWatchLogs: json['cloudWatchLogs'] != null
          ? CloudWatchLogsDestination.fromJson(
              json['cloudWatchLogs'] as Map<String, dynamic>)
          : null,
      s3Destination: json['s3Destination'] != null
          ? S3Destination.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogs = this.cloudWatchLogs;
    final s3Destination = this.s3Destination;
    return {
      if (cloudWatchLogs != null) 'cloudWatchLogs': cloudWatchLogs,
      if (s3Destination != null) 's3Destination': s3Destination,
    };
  }
}

/// A structure that contains information about where Evidently is to store
/// evaluation events for longer term storage.
class ProjectDataDeliveryConfig {
  /// If the project stores evaluation events in CloudWatch Logs, this structure
  /// stores the log group name.
  final CloudWatchLogsDestinationConfig? cloudWatchLogs;

  /// If the project stores evaluation events in an Amazon S3 bucket, this
  /// structure stores the bucket name and bucket prefix.
  final S3DestinationConfig? s3Destination;

  ProjectDataDeliveryConfig({
    this.cloudWatchLogs,
    this.s3Destination,
  });

  Map<String, dynamic> toJson() {
    final cloudWatchLogs = this.cloudWatchLogs;
    final s3Destination = this.s3Destination;
    return {
      if (cloudWatchLogs != null) 'cloudWatchLogs': cloudWatchLogs,
      if (s3Destination != null) 's3Destination': s3Destination,
    };
  }
}

enum ProjectStatus {
  available,
  updating,
}

extension ProjectStatusValueExtension on ProjectStatus {
  String toValue() {
    switch (this) {
      case ProjectStatus.available:
        return 'AVAILABLE';
      case ProjectStatus.updating:
        return 'UPDATING';
    }
  }
}

extension ProjectStatusFromString on String {
  ProjectStatus toProjectStatus() {
    switch (this) {
      case 'AVAILABLE':
        return ProjectStatus.available;
      case 'UPDATING':
        return ProjectStatus.updating;
    }
    throw Exception('$this is not known in enum ProjectStatus');
  }
}

/// A structure that contains configuration information about an Evidently
/// project.
class ProjectSummary {
  /// The name or ARN of the project.
  final String arn;

  /// The date and time that the project is created.
  final DateTime createdTime;

  /// The date and time that the project was most recently updated.
  final DateTime lastUpdatedTime;

  /// The name of the project.
  final String name;

  /// The current state of the project.
  final ProjectStatus status;

  /// The number of experiments currently in the project.
  final int? activeExperimentCount;

  /// The number of ongoing launches currently in the project.
  final int? activeLaunchCount;

  /// The description of the project.
  final String? description;

  /// The number of experiments currently in the project.
  final int? experimentCount;

  /// The number of features currently in the project.
  final int? featureCount;

  /// The number of launches currently in the project, including launches that are
  /// ongoing, completed, and not started yet.
  final int? launchCount;

  /// The list of tag keys and values associated with this project.
  final Map<String, String>? tags;

  ProjectSummary({
    required this.arn,
    required this.createdTime,
    required this.lastUpdatedTime,
    required this.name,
    required this.status,
    this.activeExperimentCount,
    this.activeLaunchCount,
    this.description,
    this.experimentCount,
    this.featureCount,
    this.launchCount,
    this.tags,
  });

  factory ProjectSummary.fromJson(Map<String, dynamic> json) {
    return ProjectSummary(
      arn: json['arn'] as String,
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toProjectStatus(),
      activeExperimentCount: json['activeExperimentCount'] as int?,
      activeLaunchCount: json['activeLaunchCount'] as int?,
      description: json['description'] as String?,
      experimentCount: json['experimentCount'] as int?,
      featureCount: json['featureCount'] as int?,
      launchCount: json['launchCount'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final status = this.status;
    final activeExperimentCount = this.activeExperimentCount;
    final activeLaunchCount = this.activeLaunchCount;
    final description = this.description;
    final experimentCount = this.experimentCount;
    final featureCount = this.featureCount;
    final launchCount = this.launchCount;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdTime': unixTimestampToJson(createdTime),
      'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      'name': name,
      'status': status.toValue(),
      if (activeExperimentCount != null)
        'activeExperimentCount': activeExperimentCount,
      if (activeLaunchCount != null) 'activeLaunchCount': activeLaunchCount,
      if (description != null) 'description': description,
      if (experimentCount != null) 'experimentCount': experimentCount,
      if (featureCount != null) 'featureCount': featureCount,
      if (launchCount != null) 'launchCount': launchCount,
      if (tags != null) 'tags': tags,
    };
  }
}

class PutProjectEventsResponse {
  /// A structure that contains Evidently's response to the sent events, including
  /// an event ID and error codes, if any.
  final List<PutProjectEventsResultEntry>? eventResults;

  /// The number of events in the operation that could not be used by Evidently.
  final int? failedEventCount;

  PutProjectEventsResponse({
    this.eventResults,
    this.failedEventCount,
  });

  factory PutProjectEventsResponse.fromJson(Map<String, dynamic> json) {
    return PutProjectEventsResponse(
      eventResults: (json['eventResults'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PutProjectEventsResultEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedEventCount: json['failedEventCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventResults = this.eventResults;
    final failedEventCount = this.failedEventCount;
    return {
      if (eventResults != null) 'eventResults': eventResults,
      if (failedEventCount != null) 'failedEventCount': failedEventCount,
    };
  }
}

/// A structure that contains Evidently's response to the sent events, including
/// an event ID and error codes, if any.
class PutProjectEventsResultEntry {
  /// If the <code>PutProjectEvents</code> operation has an error, the error code
  /// is returned here.
  final String? errorCode;

  /// If the <code>PutProjectEvents</code> operation has an error, the error
  /// message is returned here.
  final String? errorMessage;

  /// A unique ID assigned to this <code>PutProjectEvents</code> operation.
  final String? eventId;

  PutProjectEventsResultEntry({
    this.errorCode,
    this.errorMessage,
    this.eventId,
  });

  factory PutProjectEventsResultEntry.fromJson(Map<String, dynamic> json) {
    return PutProjectEventsResultEntry(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      eventId: json['eventId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final eventId = this.eventId;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (eventId != null) 'eventId': eventId,
    };
  }
}

/// A structure that contains information about one experiment or launch that
/// uses the specified segment.
class RefResource {
  /// The name of the experiment or launch.
  final String name;

  /// Specifies whether the resource that this structure contains information
  /// about is an experiment or a launch.
  final String type;

  /// The ARN of the experiment or launch.
  final String? arn;

  /// The day and time that this experiment or launch ended.
  final String? endTime;

  /// The day and time that this experiment or launch was most recently updated.
  final String? lastUpdatedOn;

  /// The day and time that this experiment or launch started.
  final String? startTime;

  /// The status of the experiment or launch.
  final String? status;

  RefResource({
    required this.name,
    required this.type,
    this.arn,
    this.endTime,
    this.lastUpdatedOn,
    this.startTime,
    this.status,
  });

  factory RefResource.fromJson(Map<String, dynamic> json) {
    return RefResource(
      name: json['name'] as String,
      type: json['type'] as String,
      arn: json['arn'] as String?,
      endTime: json['endTime'] as String?,
      lastUpdatedOn: json['lastUpdatedOn'] as String?,
      startTime: json['startTime'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final arn = this.arn;
    final endTime = this.endTime;
    final lastUpdatedOn = this.lastUpdatedOn;
    final startTime = this.startTime;
    final status = this.status;
    return {
      'name': name,
      'type': type,
      if (arn != null) 'arn': arn,
      if (endTime != null) 'endTime': endTime,
      if (lastUpdatedOn != null) 'lastUpdatedOn': lastUpdatedOn,
      if (startTime != null) 'startTime': startTime,
      if (status != null) 'status': status,
    };
  }
}

/// If the project stores evaluation events in an Amazon S3 bucket, this
/// structure stores the bucket name and bucket prefix.
class S3Destination {
  /// The name of the bucket in which Evidently stores evaluation events.
  final String? bucket;

  /// The bucket prefix in which Evidently stores evaluation events.
  final String? prefix;

  S3Destination({
    this.bucket,
    this.prefix,
  });

  factory S3Destination.fromJson(Map<String, dynamic> json) {
    return S3Destination(
      bucket: json['bucket'] as String?,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      if (bucket != null) 'bucket': bucket,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// If the project stores evaluation events in an Amazon S3 bucket, this
/// structure stores the bucket name and bucket prefix.
class S3DestinationConfig {
  /// The name of the bucket in which Evidently stores evaluation events.
  final String? bucket;

  /// The bucket prefix in which Evidently stores evaluation events.
  final String? prefix;

  S3DestinationConfig({
    this.bucket,
    this.prefix,
  });

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      if (bucket != null) 'bucket': bucket,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// This structure defines the traffic allocation percentages among the feature
/// variations during one step of a launch, and the start time of that step.
class ScheduledSplit {
  /// The date and time that this step of the launch starts.
  final DateTime startTime;

  /// The traffic allocation percentages among the feature variations during one
  /// step of a launch. This is a set of key-value pairs. The keys are variation
  /// names. The values represent the percentage of traffic to allocate to that
  /// variation during this step.
  ///
  /// The values is expressed in thousandths of a percent, so assigning a weight
  /// of 50000 assigns 50% of traffic to that variation.
  ///
  /// If the sum of the weights for all the variations in a segment override does
  /// not add up to 100,000, then the remaining traffic that matches this segment
  /// is not assigned by this segment override, and instead moves on to the next
  /// segment override or the default traffic split.
  final Map<String, int>? groupWeights;

  /// Use this parameter to specify different traffic splits for one or more
  /// audience <i>segments</i>. A segment is a portion of your audience that share
  /// one or more characteristics. Examples could be Chrome browser users, users
  /// in Europe, or Firefox browser users in Europe who also fit other criteria
  /// that your application collects, such as age.
  ///
  /// This parameter is an array of up to six segment override objects. Each of
  /// these objects specifies a segment that you have already created, and defines
  /// the traffic split for that segment.
  final List<SegmentOverride>? segmentOverrides;

  ScheduledSplit({
    required this.startTime,
    this.groupWeights,
    this.segmentOverrides,
  });

  factory ScheduledSplit.fromJson(Map<String, dynamic> json) {
    return ScheduledSplit(
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      groupWeights: (json['groupWeights'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
      segmentOverrides: (json['segmentOverrides'] as List?)
          ?.whereNotNull()
          .map((e) => SegmentOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final startTime = this.startTime;
    final groupWeights = this.groupWeights;
    final segmentOverrides = this.segmentOverrides;
    return {
      'startTime': unixTimestampToJson(startTime),
      if (groupWeights != null) 'groupWeights': groupWeights,
      if (segmentOverrides != null) 'segmentOverrides': segmentOverrides,
    };
  }
}

/// This structure defines the traffic allocation percentages among the feature
/// variations during one step of a launch, and the start time of that step.
class ScheduledSplitConfig {
  /// The traffic allocation percentages among the feature variations during one
  /// step of a launch. This is a set of key-value pairs. The keys are variation
  /// names. The values represent the percentage of traffic to allocate to that
  /// variation during this step.
  ///
  /// The values is expressed in thousandths of a percent, so assigning a weight
  /// of 50000 assigns 50% of traffic to that variation.
  ///
  /// If the sum of the weights for all the variations in a segment override does
  /// not add up to 100,000, then the remaining traffic that matches this segment
  /// is not assigned by this segment override, and instead moves on to the next
  /// segment override or the default traffic split.
  final Map<String, int> groupWeights;

  /// The date and time that this step of the launch starts.
  final DateTime startTime;

  /// Use this parameter to specify different traffic splits for one or more
  /// audience <i>segments</i>. A segment is a portion of your audience that share
  /// one or more characteristics. Examples could be Chrome browser users, users
  /// in Europe, or Firefox browser users in Europe who also fit other criteria
  /// that your application collects, such as age.
  ///
  /// This parameter is an array of up to six segment override objects. Each of
  /// these objects specifies a segment that you have already created, and defines
  /// the traffic split for that segment.
  final List<SegmentOverride>? segmentOverrides;

  ScheduledSplitConfig({
    required this.groupWeights,
    required this.startTime,
    this.segmentOverrides,
  });

  Map<String, dynamic> toJson() {
    final groupWeights = this.groupWeights;
    final startTime = this.startTime;
    final segmentOverrides = this.segmentOverrides;
    return {
      'groupWeights': groupWeights,
      'startTime': unixTimestampToJson(startTime),
      if (segmentOverrides != null) 'segmentOverrides': segmentOverrides,
    };
  }
}

/// An array of structures that define the traffic allocation percentages among
/// the feature variations during each step of a launch. This also defines the
/// start time of each step.
class ScheduledSplitsLaunchConfig {
  /// An array of structures that define the traffic allocation percentages among
  /// the feature variations during each step of the launch. This also defines the
  /// start time of each step.
  final List<ScheduledSplitConfig> steps;

  ScheduledSplitsLaunchConfig({
    required this.steps,
  });

  Map<String, dynamic> toJson() {
    final steps = this.steps;
    return {
      'steps': steps,
    };
  }
}

/// An array of structures that define the traffic allocation percentages among
/// the feature variations during each step of a launch. This also defines the
/// start time of each step.
class ScheduledSplitsLaunchDefinition {
  /// An array of structures that define the traffic allocation percentages among
  /// the feature variations during each step of the launch. This also defines the
  /// start time of each step.
  final List<ScheduledSplit>? steps;

  ScheduledSplitsLaunchDefinition({
    this.steps,
  });

  factory ScheduledSplitsLaunchDefinition.fromJson(Map<String, dynamic> json) {
    return ScheduledSplitsLaunchDefinition(
      steps: (json['steps'] as List?)
          ?.whereNotNull()
          .map((e) => ScheduledSplit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final steps = this.steps;
    return {
      if (steps != null) 'steps': steps,
    };
  }
}

/// This structure contains information about one audience <i>segment</i>. You
/// can use segments in your experiments and launches to narrow the user
/// sessions used for experiment or launch to only the user sessions that match
/// one or more criteria.
class Segment {
  /// The ARN of the segment.
  final String arn;

  /// The date and time that this segment was created.
  final DateTime createdTime;

  /// The date and time that this segment was most recently updated.
  final DateTime lastUpdatedTime;

  /// The name of the segment.
  final String name;

  /// The pattern that defines the attributes to use to evalute whether a user
  /// session will be in the segment. For more information about the pattern
  /// syntax, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Evidently-segments.html">Segment
  /// rule pattern syntax</a>.
  final Object pattern;

  /// The customer-created description for this segment.
  final String? description;

  /// The number of experiments that this segment is used in. This count includes
  /// all current experiments, not just those that are currently running.
  final int? experimentCount;

  /// The number of launches that this segment is used in. This count includes all
  /// current launches, not just those that are currently running.
  final int? launchCount;

  /// The list of tag keys and values associated with this launch.
  final Map<String, String>? tags;

  Segment({
    required this.arn,
    required this.createdTime,
    required this.lastUpdatedTime,
    required this.name,
    required this.pattern,
    this.description,
    this.experimentCount,
    this.launchCount,
    this.tags,
  });

  factory Segment.fromJson(Map<String, dynamic> json) {
    return Segment(
      arn: json['arn'] as String,
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['lastUpdatedTime'] as Object),
      name: json['name'] as String,
      pattern: jsonDecode(json['pattern'] as String) as Object,
      description: json['description'] as String?,
      experimentCount: json['experimentCount'] as int?,
      launchCount: json['launchCount'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final pattern = this.pattern;
    final description = this.description;
    final experimentCount = this.experimentCount;
    final launchCount = this.launchCount;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdTime': unixTimestampToJson(createdTime),
      'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      'name': name,
      'pattern': jsonEncode(pattern),
      if (description != null) 'description': description,
      if (experimentCount != null) 'experimentCount': experimentCount,
      if (launchCount != null) 'launchCount': launchCount,
      if (tags != null) 'tags': tags,
    };
  }
}

/// This structure specifies a segment that you have already created, and
/// defines the traffic split for that segment to be used in a launch.
class SegmentOverride {
  /// A number indicating the order to use to evaluate segment overrides, if there
  /// are more than one. Segment overrides with lower numbers are evaluated first.
  final int evaluationOrder;

  /// The ARN of the segment to use.
  final String segment;

  /// The traffic allocation percentages among the feature variations to assign to
  /// this segment. This is a set of key-value pairs. The keys are variation
  /// names. The values represent the amount of traffic to allocate to that
  /// variation for this segment. This is expressed in thousandths of a percent,
  /// so a weight of 50000 represents 50% of traffic.
  final Map<String, int> weights;

  SegmentOverride({
    required this.evaluationOrder,
    required this.segment,
    required this.weights,
  });

  factory SegmentOverride.fromJson(Map<String, dynamic> json) {
    return SegmentOverride(
      evaluationOrder: json['evaluationOrder'] as int,
      segment: json['segment'] as String,
      weights: (json['weights'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationOrder = this.evaluationOrder;
    final segment = this.segment;
    final weights = this.weights;
    return {
      'evaluationOrder': evaluationOrder,
      'segment': segment,
      'weights': weights,
    };
  }
}

enum SegmentReferenceResourceType {
  experiment,
  launch,
}

extension SegmentReferenceResourceTypeValueExtension
    on SegmentReferenceResourceType {
  String toValue() {
    switch (this) {
      case SegmentReferenceResourceType.experiment:
        return 'EXPERIMENT';
      case SegmentReferenceResourceType.launch:
        return 'LAUNCH';
    }
  }
}

extension SegmentReferenceResourceTypeFromString on String {
  SegmentReferenceResourceType toSegmentReferenceResourceType() {
    switch (this) {
      case 'EXPERIMENT':
        return SegmentReferenceResourceType.experiment;
      case 'LAUNCH':
        return SegmentReferenceResourceType.launch;
    }
    throw Exception('$this is not known in enum SegmentReferenceResourceType');
  }
}

class StartExperimentResponse {
  /// A timestamp that indicates when the experiment started.
  final DateTime? startedTime;

  StartExperimentResponse({
    this.startedTime,
  });

  factory StartExperimentResponse.fromJson(Map<String, dynamic> json) {
    return StartExperimentResponse(
      startedTime: timeStampFromJson(json['startedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final startedTime = this.startedTime;
    return {
      if (startedTime != null) 'startedTime': unixTimestampToJson(startedTime),
    };
  }
}

class StartLaunchResponse {
  /// A structure that contains information about the launch that was started.
  final Launch launch;

  StartLaunchResponse({
    required this.launch,
  });

  factory StartLaunchResponse.fromJson(Map<String, dynamic> json) {
    return StartLaunchResponse(
      launch: Launch.fromJson(json['launch'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final launch = this.launch;
    return {
      'launch': launch,
    };
  }
}

class StopExperimentResponse {
  /// The date and time that the experiment stopped.
  final DateTime? endedTime;

  StopExperimentResponse({
    this.endedTime,
  });

  factory StopExperimentResponse.fromJson(Map<String, dynamic> json) {
    return StopExperimentResponse(
      endedTime: timeStampFromJson(json['endedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endedTime = this.endedTime;
    return {
      if (endedTime != null) 'endedTime': unixTimestampToJson(endedTime),
    };
  }
}

class StopLaunchResponse {
  /// The date and time that the launch stopped.
  final DateTime? endedTime;

  StopLaunchResponse({
    this.endedTime,
  });

  factory StopLaunchResponse.fromJson(Map<String, dynamic> json) {
    return StopLaunchResponse(
      endedTime: timeStampFromJson(json['endedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endedTime = this.endedTime;
    return {
      if (endedTime != null) 'endedTime': unixTimestampToJson(endedTime),
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

class TestSegmentPatternResponse {
  /// Returns <code>true</code> if the pattern matches the payload.
  final bool match;

  TestSegmentPatternResponse({
    required this.match,
  });

  factory TestSegmentPatternResponse.fromJson(Map<String, dynamic> json) {
    return TestSegmentPatternResponse(
      match: json['match'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final match = this.match;
    return {
      'match': match,
    };
  }
}

/// A structure that defines one treatment in an experiment. A treatment is a
/// variation of the feature that you are including in the experiment.
class Treatment {
  /// The name of this treatment.
  final String name;

  /// The description of the treatment.
  final String? description;

  /// The feature variation used for this treatment. This is a key-value pair. The
  /// key is the feature name, and the value is the variation name.
  final Map<String, String>? featureVariations;

  Treatment({
    required this.name,
    this.description,
    this.featureVariations,
  });

  factory Treatment.fromJson(Map<String, dynamic> json) {
    return Treatment(
      name: json['name'] as String,
      description: json['description'] as String?,
      featureVariations: (json['featureVariations'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final description = this.description;
    final featureVariations = this.featureVariations;
    return {
      'name': name,
      if (description != null) 'description': description,
      if (featureVariations != null) 'featureVariations': featureVariations,
    };
  }
}

/// A structure that defines one treatment in an experiment. A treatment is a
/// variation of the feature that you are including in the experiment.
class TreatmentConfig {
  /// The feature that this experiment is testing.
  final String feature;

  /// A name for this treatment.
  final String name;

  /// The name of the variation to use as this treatment in the experiment.
  final String variation;

  /// A description for this treatment.
  final String? description;

  TreatmentConfig({
    required this.feature,
    required this.name,
    required this.variation,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final feature = this.feature;
    final name = this.name;
    final variation = this.variation;
    final description = this.description;
    return {
      'feature': feature,
      'name': name,
      'variation': variation,
      if (description != null) 'description': description,
    };
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

class UpdateExperimentResponse {
  /// A structure containing the configuration details of the experiment that was
  /// updated.
  final Experiment experiment;

  UpdateExperimentResponse({
    required this.experiment,
  });

  factory UpdateExperimentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateExperimentResponse(
      experiment:
          Experiment.fromJson(json['experiment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final experiment = this.experiment;
    return {
      'experiment': experiment,
    };
  }
}

class UpdateFeatureResponse {
  /// A structure that contains information about the updated feature.
  final Feature feature;

  UpdateFeatureResponse({
    required this.feature,
  });

  factory UpdateFeatureResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFeatureResponse(
      feature: Feature.fromJson(json['feature'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final feature = this.feature;
    return {
      'feature': feature,
    };
  }
}

class UpdateLaunchResponse {
  /// A structure that contains the new configuration of the launch that was
  /// updated.
  final Launch launch;

  UpdateLaunchResponse({
    required this.launch,
  });

  factory UpdateLaunchResponse.fromJson(Map<String, dynamic> json) {
    return UpdateLaunchResponse(
      launch: Launch.fromJson(json['launch'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final launch = this.launch;
    return {
      'launch': launch,
    };
  }
}

class UpdateProjectDataDeliveryResponse {
  /// A structure containing details about the project that you updated.
  final Project project;

  UpdateProjectDataDeliveryResponse({
    required this.project,
  });

  factory UpdateProjectDataDeliveryResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateProjectDataDeliveryResponse(
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      'project': project,
    };
  }
}

class UpdateProjectResponse {
  /// A structure containing information about the updated project.
  final Project project;

  UpdateProjectResponse({
    required this.project,
  });

  factory UpdateProjectResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProjectResponse(
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      'project': project,
    };
  }
}

/// The value assigned to a feature variation. This structure must contain
/// exactly one field. It can be <code>boolValue</code>,
/// <code>doubleValue</code>, <code>longValue</code>, or
/// <code>stringValue</code>.
class VariableValue {
  /// If this feature uses the Boolean variation type, this field contains the
  /// Boolean value of this variation.
  final bool? boolValue;

  /// If this feature uses the double integer variation type, this field contains
  /// the double integer value of this variation.
  final double? doubleValue;

  /// If this feature uses the long variation type, this field contains the long
  /// value of this variation.
  final int? longValue;

  /// If this feature uses the string variation type, this field contains the
  /// string value of this variation.
  final String? stringValue;

  VariableValue({
    this.boolValue,
    this.doubleValue,
    this.longValue,
    this.stringValue,
  });

  factory VariableValue.fromJson(Map<String, dynamic> json) {
    return VariableValue(
      boolValue: json['boolValue'] as bool?,
      doubleValue: json['doubleValue'] as double?,
      longValue: json['longValue'] as int?,
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final boolValue = this.boolValue;
    final doubleValue = this.doubleValue;
    final longValue = this.longValue;
    final stringValue = this.stringValue;
    return {
      if (boolValue != null) 'boolValue': boolValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (longValue != null) 'longValue': longValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

/// This structure contains the name and variation value of one variation of a
/// feature.
class Variation {
  /// The name of the variation.
  final String? name;

  /// The value assigned to this variation.
  final VariableValue? value;

  Variation({
    this.name,
    this.value,
  });

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      name: json['name'] as String?,
      value: json['value'] != null
          ? VariableValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// This structure contains the name and variation value of one variation of a
/// feature.
class VariationConfig {
  /// The name of the variation.
  final String name;

  /// The value assigned to this variation.
  final VariableValue value;

  VariationConfig({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

enum VariationValueType {
  string,
  long,
  double,
  boolean,
}

extension VariationValueTypeValueExtension on VariationValueType {
  String toValue() {
    switch (this) {
      case VariationValueType.string:
        return 'STRING';
      case VariationValueType.long:
        return 'LONG';
      case VariationValueType.double:
        return 'DOUBLE';
      case VariationValueType.boolean:
        return 'BOOLEAN';
    }
  }
}

extension VariationValueTypeFromString on String {
  VariationValueType toVariationValueType() {
    switch (this) {
      case 'STRING':
        return VariationValueType.string;
      case 'LONG':
        return VariationValueType.long;
      case 'DOUBLE':
        return VariationValueType.double;
      case 'BOOLEAN':
        return VariationValueType.boolean;
    }
    throw Exception('$this is not known in enum VariationValueType');
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

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
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
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
