// ignore_for_file: deprecated_member_use_from_same_package
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

/// Compute Optimizer is a service that analyzes the configuration and
/// utilization metrics of your Amazon Web Services compute resources, such as
/// Amazon EC2 instances, Amazon EC2 Auto Scaling groups, Lambda functions,
/// Amazon EBS volumes, and Amazon ECS services on Fargate. It reports whether
/// your resources are optimal, and generates optimization recommendations to
/// reduce the cost and improve the performance of your workloads. Compute
/// Optimizer also provides recent utilization metric data, in addition to
/// projected utilization metric data for the recommendations, which you can use
/// to evaluate which recommendation provides the best price-performance
/// trade-off. The analysis of your usage patterns can help you decide when to
/// move or resize your running resources, and still meet your performance and
/// capacity requirements. For more information about Compute Optimizer,
/// including the required permissions to use the service, see the <a
/// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/">Compute
/// Optimizer User Guide</a>.
class ComputeOptimizer {
  final _s.JsonProtocol _protocol;
  ComputeOptimizer({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'compute-optimizer',
            signingName: 'compute-optimizer',
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

  /// Deletes a recommendation preference, such as enhanced infrastructure
  /// metrics.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html">Activating
  /// enhanced infrastructure metrics</a> in the <i>Compute Optimizer User
  /// Guide</i>.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [recommendationPreferenceNames] :
  /// The name of the recommendation preference to delete.
  ///
  /// Parameter [resourceType] :
  /// The target resource type of the recommendation preference to delete.
  ///
  /// The <code>Ec2Instance</code> option encompasses standalone instances and
  /// instances that are part of Auto Scaling groups. The
  /// <code>AutoScalingGroup</code> option encompasses only instances that are
  /// part of an Auto Scaling group.
  /// <note>
  /// The valid values for this parameter are <code>Ec2Instance</code> and
  /// <code>AutoScalingGroup</code>.
  /// </note>
  ///
  /// Parameter [scope] :
  /// An object that describes the scope of the recommendation preference to
  /// delete.
  ///
  /// You can delete recommendation preferences that are created at the
  /// organization level (for management accounts of an organization only),
  /// account level, and resource level. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html">Activating
  /// enhanced infrastructure metrics</a> in the <i>Compute Optimizer User
  /// Guide</i>.
  Future<void> deleteRecommendationPreferences({
    required List<RecommendationPreferenceName> recommendationPreferenceNames,
    required ResourceType resourceType,
    Scope? scope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.DeleteRecommendationPreferences'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recommendationPreferenceNames':
            recommendationPreferenceNames.map((e) => e.value).toList(),
        'resourceType': resourceType.value,
        if (scope != null) 'scope': scope,
      },
    );
  }

  /// Describes recommendation export jobs created in the last seven days.
  ///
  /// Use the <a>ExportAutoScalingGroupRecommendations</a> or
  /// <a>ExportEC2InstanceRecommendations</a> actions to request an export of
  /// your recommendations. Then use the <a>DescribeRecommendationExportJobs</a>
  /// action to view your export jobs.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that returns a more specific list
  /// of export jobs.
  ///
  /// Parameter [jobIds] :
  /// The identification numbers of the export jobs to return.
  ///
  /// An export job ID is returned when you create an export using the
  /// <a>ExportAutoScalingGroupRecommendations</a> or
  /// <a>ExportEC2InstanceRecommendations</a> actions.
  ///
  /// All export jobs created in the last seven days are returned if this
  /// parameter is omitted.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of export jobs to return with a single request.
  ///
  /// To retrieve the remaining results, make another request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of export jobs.
  Future<DescribeRecommendationExportJobsResponse>
      describeRecommendationExportJobs({
    List<JobFilter>? filters,
    List<String>? jobIds,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.DescribeRecommendationExportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'filters': filters,
        if (jobIds != null) 'jobIds': jobIds,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeRecommendationExportJobsResponse.fromJson(jsonResponse.body);
  }

  /// Exports optimization recommendations for Auto Scaling groups.
  ///
  /// Recommendations are exported in a comma-separated values (.csv) file, and
  /// its metadata in a JavaScript Object Notation (JSON) (.json) file, to an
  /// existing Amazon Simple Storage Service (Amazon S3) bucket that you
  /// specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting
  /// Recommendations</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// You can have only one Auto Scaling group export job in progress per Amazon
  /// Web Services Region.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [s3DestinationConfig] :
  /// An object to specify the destination Amazon Simple Storage Service (Amazon
  /// S3) bucket name and key prefix for the export job.
  ///
  /// You must create the destination Amazon S3 bucket for your recommendations
  /// export before you create the export job. Compute Optimizer does not create
  /// the S3 bucket for you. After you create the S3 bucket, ensure that it has
  /// the required permissions policy to allow Compute Optimizer to write the
  /// export file to it. If you plan to specify an object prefix when you create
  /// the export job, you must include the object prefix in the policy that you
  /// add to the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html">Amazon
  /// S3 Bucket Policy for Compute Optimizer</a> in the <i>Compute Optimizer
  /// User Guide</i>.
  ///
  /// Parameter [accountIds] :
  /// The IDs of the Amazon Web Services accounts for which to export Auto
  /// Scaling group recommendations.
  ///
  /// If your account is the management account of an organization, use this
  /// parameter to specify the member account for which you want to export
  /// recommendations.
  ///
  /// This parameter cannot be specified together with the include member
  /// accounts parameter. The parameters are mutually exclusive.
  ///
  /// Recommendations for member accounts are not included in the export if this
  /// parameter, or the include member accounts parameter, is omitted.
  ///
  /// You can specify multiple account IDs per request.
  ///
  /// Parameter [fieldsToExport] :
  /// The recommendations data to include in the export file. For more
  /// information about the fields that can be exported, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files">Exported
  /// files</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// Parameter [fileFormat] :
  /// The format of the export file.
  ///
  /// The only export file format currently supported is <code>Csv</code>.
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that exports a more specific set
  /// of Auto Scaling group recommendations.
  ///
  /// Parameter [includeMemberAccounts] :
  /// Indicates whether to include recommendations for resources in all member
  /// accounts of the organization if your account is the management account of
  /// an organization.
  ///
  /// The member accounts must also be opted in to Compute Optimizer, and
  /// trusted access for Compute Optimizer must be enabled in the organization
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access">Compute
  /// Optimizer and Amazon Web Services Organizations trusted access</a> in the
  /// <i>Compute Optimizer User Guide</i>.
  ///
  /// Recommendations for member accounts of the organization are not included
  /// in the export file if this parameter is omitted.
  ///
  /// This parameter cannot be specified together with the account IDs
  /// parameter. The parameters are mutually exclusive.
  ///
  /// Recommendations for member accounts are not included in the export if this
  /// parameter, or the account IDs parameter, is omitted.
  ///
  /// Parameter [recommendationPreferences] :
  /// An object to specify the preferences for the Auto Scaling group
  /// recommendations to export.
  Future<ExportAutoScalingGroupRecommendationsResponse>
      exportAutoScalingGroupRecommendations({
    required S3DestinationConfig s3DestinationConfig,
    List<String>? accountIds,
    List<ExportableAutoScalingGroupField>? fieldsToExport,
    FileFormat? fileFormat,
    List<Filter>? filters,
    bool? includeMemberAccounts,
    RecommendationPreferences? recommendationPreferences,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerService.ExportAutoScalingGroupRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        's3DestinationConfig': s3DestinationConfig,
        if (accountIds != null) 'accountIds': accountIds,
        if (fieldsToExport != null)
          'fieldsToExport': fieldsToExport.map((e) => e.value).toList(),
        if (fileFormat != null) 'fileFormat': fileFormat.value,
        if (filters != null) 'filters': filters,
        if (includeMemberAccounts != null)
          'includeMemberAccounts': includeMemberAccounts,
        if (recommendationPreferences != null)
          'recommendationPreferences': recommendationPreferences,
      },
    );

    return ExportAutoScalingGroupRecommendationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Exports optimization recommendations for Amazon EBS volumes.
  ///
  /// Recommendations are exported in a comma-separated values (.csv) file, and
  /// its metadata in a JavaScript Object Notation (JSON) (.json) file, to an
  /// existing Amazon Simple Storage Service (Amazon S3) bucket that you
  /// specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting
  /// Recommendations</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// You can have only one Amazon EBS volume export job in progress per Amazon
  /// Web Services Region.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [accountIds] :
  /// The IDs of the Amazon Web Services accounts for which to export Amazon EBS
  /// volume recommendations.
  ///
  /// If your account is the management account of an organization, use this
  /// parameter to specify the member account for which you want to export
  /// recommendations.
  ///
  /// This parameter cannot be specified together with the include member
  /// accounts parameter. The parameters are mutually exclusive.
  ///
  /// Recommendations for member accounts are not included in the export if this
  /// parameter, or the include member accounts parameter, is omitted.
  ///
  /// You can specify multiple account IDs per request.
  ///
  /// Parameter [fieldsToExport] :
  /// The recommendations data to include in the export file. For more
  /// information about the fields that can be exported, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files">Exported
  /// files</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// Parameter [fileFormat] :
  /// The format of the export file.
  ///
  /// The only export file format currently supported is <code>Csv</code>.
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that exports a more specific set
  /// of Amazon EBS volume recommendations.
  ///
  /// Parameter [includeMemberAccounts] :
  /// Indicates whether to include recommendations for resources in all member
  /// accounts of the organization if your account is the management account of
  /// an organization.
  ///
  /// The member accounts must also be opted in to Compute Optimizer, and
  /// trusted access for Compute Optimizer must be enabled in the organization
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access">Compute
  /// Optimizer and Amazon Web Services Organizations trusted access</a> in the
  /// <i>Compute Optimizer User Guide</i>.
  ///
  /// Recommendations for member accounts of the organization are not included
  /// in the export file if this parameter is omitted.
  ///
  /// This parameter cannot be specified together with the account IDs
  /// parameter. The parameters are mutually exclusive.
  ///
  /// Recommendations for member accounts are not included in the export if this
  /// parameter, or the account IDs parameter, is omitted.
  Future<ExportEBSVolumeRecommendationsResponse>
      exportEBSVolumeRecommendations({
    required S3DestinationConfig s3DestinationConfig,
    List<String>? accountIds,
    List<ExportableVolumeField>? fieldsToExport,
    FileFormat? fileFormat,
    List<EBSFilter>? filters,
    bool? includeMemberAccounts,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.ExportEBSVolumeRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        's3DestinationConfig': s3DestinationConfig,
        if (accountIds != null) 'accountIds': accountIds,
        if (fieldsToExport != null)
          'fieldsToExport': fieldsToExport.map((e) => e.value).toList(),
        if (fileFormat != null) 'fileFormat': fileFormat.value,
        if (filters != null) 'filters': filters,
        if (includeMemberAccounts != null)
          'includeMemberAccounts': includeMemberAccounts,
      },
    );

    return ExportEBSVolumeRecommendationsResponse.fromJson(jsonResponse.body);
  }

  /// Exports optimization recommendations for Amazon EC2 instances.
  ///
  /// Recommendations are exported in a comma-separated values (.csv) file, and
  /// its metadata in a JavaScript Object Notation (JSON) (.json) file, to an
  /// existing Amazon Simple Storage Service (Amazon S3) bucket that you
  /// specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting
  /// Recommendations</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// You can have only one Amazon EC2 instance export job in progress per
  /// Amazon Web Services Region.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [s3DestinationConfig] :
  /// An object to specify the destination Amazon Simple Storage Service (Amazon
  /// S3) bucket name and key prefix for the export job.
  ///
  /// You must create the destination Amazon S3 bucket for your recommendations
  /// export before you create the export job. Compute Optimizer does not create
  /// the S3 bucket for you. After you create the S3 bucket, ensure that it has
  /// the required permissions policy to allow Compute Optimizer to write the
  /// export file to it. If you plan to specify an object prefix when you create
  /// the export job, you must include the object prefix in the policy that you
  /// add to the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html">Amazon
  /// S3 Bucket Policy for Compute Optimizer</a> in the <i>Compute Optimizer
  /// User Guide</i>.
  ///
  /// Parameter [accountIds] :
  /// The IDs of the Amazon Web Services accounts for which to export instance
  /// recommendations.
  ///
  /// If your account is the management account of an organization, use this
  /// parameter to specify the member account for which you want to export
  /// recommendations.
  ///
  /// This parameter cannot be specified together with the include member
  /// accounts parameter. The parameters are mutually exclusive.
  ///
  /// Recommendations for member accounts are not included in the export if this
  /// parameter, or the include member accounts parameter, is omitted.
  ///
  /// You can specify multiple account IDs per request.
  ///
  /// Parameter [fieldsToExport] :
  /// The recommendations data to include in the export file. For more
  /// information about the fields that can be exported, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files">Exported
  /// files</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// Parameter [fileFormat] :
  /// The format of the export file.
  ///
  /// The only export file format currently supported is <code>Csv</code>.
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that exports a more specific set
  /// of instance recommendations.
  ///
  /// Parameter [includeMemberAccounts] :
  /// Indicates whether to include recommendations for resources in all member
  /// accounts of the organization if your account is the management account of
  /// an organization.
  ///
  /// The member accounts must also be opted in to Compute Optimizer, and
  /// trusted access for Compute Optimizer must be enabled in the organization
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access">Compute
  /// Optimizer and Amazon Web Services Organizations trusted access</a> in the
  /// <i>Compute Optimizer User Guide</i>.
  ///
  /// Recommendations for member accounts of the organization are not included
  /// in the export file if this parameter is omitted.
  ///
  /// Recommendations for member accounts are not included in the export if this
  /// parameter, or the account IDs parameter, is omitted.
  ///
  /// Parameter [recommendationPreferences] :
  /// An object to specify the preferences for the Amazon EC2 instance
  /// recommendations to export.
  Future<ExportEC2InstanceRecommendationsResponse>
      exportEC2InstanceRecommendations({
    required S3DestinationConfig s3DestinationConfig,
    List<String>? accountIds,
    List<ExportableInstanceField>? fieldsToExport,
    FileFormat? fileFormat,
    List<Filter>? filters,
    bool? includeMemberAccounts,
    RecommendationPreferences? recommendationPreferences,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.ExportEC2InstanceRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        's3DestinationConfig': s3DestinationConfig,
        if (accountIds != null) 'accountIds': accountIds,
        if (fieldsToExport != null)
          'fieldsToExport': fieldsToExport.map((e) => e.value).toList(),
        if (fileFormat != null) 'fileFormat': fileFormat.value,
        if (filters != null) 'filters': filters,
        if (includeMemberAccounts != null)
          'includeMemberAccounts': includeMemberAccounts,
        if (recommendationPreferences != null)
          'recommendationPreferences': recommendationPreferences,
      },
    );

    return ExportEC2InstanceRecommendationsResponse.fromJson(jsonResponse.body);
  }

  /// Exports optimization recommendations for Amazon ECS services on Fargate.
  ///
  /// Recommendations are exported in a CSV file, and its metadata in a JSON
  /// file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that
  /// you specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting
  /// Recommendations</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// You can only have one Amazon ECS service export job in progress per Amazon
  /// Web Services Region.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [accountIds] :
  /// The Amazon Web Services account IDs for the export Amazon ECS service
  /// recommendations.
  ///
  /// If your account is the management account or the delegated administrator
  /// of an organization, use this parameter to specify the member account you
  /// want to export recommendations to.
  ///
  /// This parameter can't be specified together with the include member
  /// accounts parameter. The parameters are mutually exclusive.
  ///
  /// If this parameter or the include member accounts parameter is omitted, the
  /// recommendations for member accounts aren't included in the export.
  ///
  /// You can specify multiple account IDs per request.
  ///
  /// Parameter [fieldsToExport] :
  /// The recommendations data to include in the export file. For more
  /// information about the fields that can be exported, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files">Exported
  /// files</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// Parameter [fileFormat] :
  /// The format of the export file.
  ///
  /// The CSV file is the only export file format currently supported.
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that exports a more specific set
  /// of Amazon ECS service recommendations.
  ///
  /// Parameter [includeMemberAccounts] :
  /// If your account is the management account or the delegated administrator
  /// of an organization, this parameter indicates whether to include
  /// recommendations for resources in all member accounts of the organization.
  ///
  /// The member accounts must also be opted in to Compute Optimizer, and
  /// trusted access for Compute Optimizer must be enabled in the organization
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access">Compute
  /// Optimizer and Amazon Web Services Organizations trusted access</a> in the
  /// <i>Compute Optimizer User Guide</i>.
  ///
  /// If this parameter is omitted, recommendations for member accounts of the
  /// organization aren't included in the export file.
  ///
  /// If this parameter or the account ID parameter is omitted, recommendations
  /// for member accounts aren't included in the export.
  Future<ExportECSServiceRecommendationsResponse>
      exportECSServiceRecommendations({
    required S3DestinationConfig s3DestinationConfig,
    List<String>? accountIds,
    List<ExportableECSServiceField>? fieldsToExport,
    FileFormat? fileFormat,
    List<ECSServiceRecommendationFilter>? filters,
    bool? includeMemberAccounts,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.ExportECSServiceRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        's3DestinationConfig': s3DestinationConfig,
        if (accountIds != null) 'accountIds': accountIds,
        if (fieldsToExport != null)
          'fieldsToExport': fieldsToExport.map((e) => e.value).toList(),
        if (fileFormat != null) 'fileFormat': fileFormat.value,
        if (filters != null) 'filters': filters,
        if (includeMemberAccounts != null)
          'includeMemberAccounts': includeMemberAccounts,
      },
    );

    return ExportECSServiceRecommendationsResponse.fromJson(jsonResponse.body);
  }

  /// Exports optimization recommendations for Lambda functions.
  ///
  /// Recommendations are exported in a comma-separated values (.csv) file, and
  /// its metadata in a JavaScript Object Notation (JSON) (.json) file, to an
  /// existing Amazon Simple Storage Service (Amazon S3) bucket that you
  /// specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting
  /// Recommendations</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// You can have only one Lambda function export job in progress per Amazon
  /// Web Services Region.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [accountIds] :
  /// The IDs of the Amazon Web Services accounts for which to export Lambda
  /// function recommendations.
  ///
  /// If your account is the management account of an organization, use this
  /// parameter to specify the member account for which you want to export
  /// recommendations.
  ///
  /// This parameter cannot be specified together with the include member
  /// accounts parameter. The parameters are mutually exclusive.
  ///
  /// Recommendations for member accounts are not included in the export if this
  /// parameter, or the include member accounts parameter, is omitted.
  ///
  /// You can specify multiple account IDs per request.
  ///
  /// Parameter [fieldsToExport] :
  /// The recommendations data to include in the export file. For more
  /// information about the fields that can be exported, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files">Exported
  /// files</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// Parameter [fileFormat] :
  /// The format of the export file.
  ///
  /// The only export file format currently supported is <code>Csv</code>.
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that exports a more specific set
  /// of Lambda function recommendations.
  ///
  /// Parameter [includeMemberAccounts] :
  /// Indicates whether to include recommendations for resources in all member
  /// accounts of the organization if your account is the management account of
  /// an organization.
  ///
  /// The member accounts must also be opted in to Compute Optimizer, and
  /// trusted access for Compute Optimizer must be enabled in the organization
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access">Compute
  /// Optimizer and Amazon Web Services Organizations trusted access</a> in the
  /// <i>Compute Optimizer User Guide</i>.
  ///
  /// Recommendations for member accounts of the organization are not included
  /// in the export file if this parameter is omitted.
  ///
  /// This parameter cannot be specified together with the account IDs
  /// parameter. The parameters are mutually exclusive.
  ///
  /// Recommendations for member accounts are not included in the export if this
  /// parameter, or the account IDs parameter, is omitted.
  Future<ExportLambdaFunctionRecommendationsResponse>
      exportLambdaFunctionRecommendations({
    required S3DestinationConfig s3DestinationConfig,
    List<String>? accountIds,
    List<ExportableLambdaFunctionField>? fieldsToExport,
    FileFormat? fileFormat,
    List<LambdaFunctionRecommendationFilter>? filters,
    bool? includeMemberAccounts,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerService.ExportLambdaFunctionRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        's3DestinationConfig': s3DestinationConfig,
        if (accountIds != null) 'accountIds': accountIds,
        if (fieldsToExport != null)
          'fieldsToExport': fieldsToExport.map((e) => e.value).toList(),
        if (fileFormat != null) 'fileFormat': fileFormat.value,
        if (filters != null) 'filters': filters,
        if (includeMemberAccounts != null)
          'includeMemberAccounts': includeMemberAccounts,
      },
    );

    return ExportLambdaFunctionRecommendationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Export optimization recommendations for your licenses.
  ///
  /// Recommendations are exported in a comma-separated values (CSV) file, and
  /// its metadata in a JavaScript Object Notation (JSON) file, to an existing
  /// Amazon Simple Storage Service (Amazon S3) bucket that you specify. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting
  /// Recommendations</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// You can have only one license export job in progress per Amazon Web
  /// Services Region.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [accountIds] :
  /// The IDs of the Amazon Web Services accounts for which to export license
  /// recommendations.
  ///
  /// If your account is the management account of an organization, use this
  /// parameter to specify the member account for which you want to export
  /// recommendations.
  ///
  /// This parameter can't be specified together with the include member
  /// accounts parameter. The parameters are mutually exclusive.
  ///
  /// If this parameter is omitted, recommendations for member accounts aren't
  /// included in the export.
  ///
  /// You can specify multiple account IDs per request.
  ///
  /// Parameter [fieldsToExport] :
  /// The recommendations data to include in the export file. For more
  /// information about the fields that can be exported, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files">Exported
  /// files</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// Parameter [fileFormat] :
  /// The format of the export file.
  ///
  /// A CSV file is the only export format currently supported.
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that exports a more specific set
  /// of license recommendations.
  ///
  /// Parameter [includeMemberAccounts] :
  /// Indicates whether to include recommendations for resources in all member
  /// accounts of the organization if your account is the management account of
  /// an organization.
  ///
  /// The member accounts must also be opted in to Compute Optimizer, and
  /// trusted access for Compute Optimizer must be enabled in the organization
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access">Compute
  /// Optimizer and Amazon Web Services Organizations trusted access</a> in the
  /// <i>Compute Optimizer User Guide</i>.
  ///
  /// If this parameter is omitted, recommendations for member accounts of the
  /// organization aren't included in the export file .
  ///
  /// This parameter cannot be specified together with the account IDs
  /// parameter. The parameters are mutually exclusive.
  Future<ExportLicenseRecommendationsResponse> exportLicenseRecommendations({
    required S3DestinationConfig s3DestinationConfig,
    List<String>? accountIds,
    List<ExportableLicenseField>? fieldsToExport,
    FileFormat? fileFormat,
    List<LicenseRecommendationFilter>? filters,
    bool? includeMemberAccounts,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.ExportLicenseRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        's3DestinationConfig': s3DestinationConfig,
        if (accountIds != null) 'accountIds': accountIds,
        if (fieldsToExport != null)
          'fieldsToExport': fieldsToExport.map((e) => e.value).toList(),
        if (fileFormat != null) 'fileFormat': fileFormat.value,
        if (filters != null) 'filters': filters,
        if (includeMemberAccounts != null)
          'includeMemberAccounts': includeMemberAccounts,
      },
    );

    return ExportLicenseRecommendationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns Auto Scaling group recommendations.
  ///
  /// Compute Optimizer generates recommendations for Amazon EC2 Auto Scaling
  /// groups that meet a specific set of requirements. For more information, see
  /// the <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html">Supported
  /// resources and requirements</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountIds] :
  /// The ID of the Amazon Web Services account for which to return Auto Scaling
  /// group recommendations.
  ///
  /// If your account is the management account of an organization, use this
  /// parameter to specify the member account for which you want to return Auto
  /// Scaling group recommendations.
  ///
  /// Only one account ID can be specified per request.
  ///
  /// Parameter [autoScalingGroupArns] :
  /// The Amazon Resource Name (ARN) of the Auto Scaling groups for which to
  /// return recommendations.
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that returns a more specific list
  /// of Auto Scaling group recommendations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Auto Scaling group recommendations to return with a
  /// single request.
  ///
  /// To retrieve the remaining results, make another request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of Auto Scaling group
  /// recommendations.
  ///
  /// Parameter [recommendationPreferences] :
  /// An object to specify the preferences for the Auto Scaling group
  /// recommendations to return in the response.
  Future<GetAutoScalingGroupRecommendationsResponse>
      getAutoScalingGroupRecommendations({
    List<String>? accountIds,
    List<String>? autoScalingGroupArns,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    RecommendationPreferences? recommendationPreferences,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerService.GetAutoScalingGroupRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountIds != null) 'accountIds': accountIds,
        if (autoScalingGroupArns != null)
          'autoScalingGroupArns': autoScalingGroupArns,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (recommendationPreferences != null)
          'recommendationPreferences': recommendationPreferences,
      },
    );

    return GetAutoScalingGroupRecommendationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns Amazon Elastic Block Store (Amazon EBS) volume recommendations.
  ///
  /// Compute Optimizer generates recommendations for Amazon EBS volumes that
  /// meet a specific set of requirements. For more information, see the <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html">Supported
  /// resources and requirements</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountIds] :
  /// The ID of the Amazon Web Services account for which to return volume
  /// recommendations.
  ///
  /// If your account is the management account of an organization, use this
  /// parameter to specify the member account for which you want to return
  /// volume recommendations.
  ///
  /// Only one account ID can be specified per request.
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that returns a more specific list
  /// of volume recommendations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of volume recommendations to return with a single
  /// request.
  ///
  /// To retrieve the remaining results, make another request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of volume recommendations.
  ///
  /// Parameter [volumeArns] :
  /// The Amazon Resource Name (ARN) of the volumes for which to return
  /// recommendations.
  Future<GetEBSVolumeRecommendationsResponse> getEBSVolumeRecommendations({
    List<String>? accountIds,
    List<EBSFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? volumeArns,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.GetEBSVolumeRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountIds != null) 'accountIds': accountIds,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (volumeArns != null) 'volumeArns': volumeArns,
      },
    );

    return GetEBSVolumeRecommendationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns Amazon EC2 instance recommendations.
  ///
  /// Compute Optimizer generates recommendations for Amazon Elastic Compute
  /// Cloud (Amazon EC2) instances that meet a specific set of requirements. For
  /// more information, see the <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html">Supported
  /// resources and requirements</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountIds] :
  /// The ID of the Amazon Web Services account for which to return instance
  /// recommendations.
  ///
  /// If your account is the management account of an organization, use this
  /// parameter to specify the member account for which you want to return
  /// instance recommendations.
  ///
  /// Only one account ID can be specified per request.
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that returns a more specific list
  /// of instance recommendations.
  ///
  /// Parameter [instanceArns] :
  /// The Amazon Resource Name (ARN) of the instances for which to return
  /// recommendations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of instance recommendations to return with a single
  /// request.
  ///
  /// To retrieve the remaining results, make another request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of instance recommendations.
  ///
  /// Parameter [recommendationPreferences] :
  /// An object to specify the preferences for the Amazon EC2 instance
  /// recommendations to return in the response.
  Future<GetEC2InstanceRecommendationsResponse> getEC2InstanceRecommendations({
    List<String>? accountIds,
    List<Filter>? filters,
    List<String>? instanceArns,
    int? maxResults,
    String? nextToken,
    RecommendationPreferences? recommendationPreferences,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.GetEC2InstanceRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountIds != null) 'accountIds': accountIds,
        if (filters != null) 'filters': filters,
        if (instanceArns != null) 'instanceArns': instanceArns,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (recommendationPreferences != null)
          'recommendationPreferences': recommendationPreferences,
      },
    );

    return GetEC2InstanceRecommendationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the projected utilization metrics of Amazon EC2 instance
  /// recommendations.
  /// <note>
  /// The <code>Cpu</code> and <code>Memory</code> metrics are the only
  /// projected utilization metrics returned when you run this action.
  /// Additionally, the <code>Memory</code> metric is returned only for
  /// resources that have the unified CloudWatch agent installed on them. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent">Enabling
  /// Memory Utilization with the CloudWatch Agent</a>.
  /// </note>
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [endTime] :
  /// The timestamp of the last projected metrics data point to return.
  ///
  /// Parameter [instanceArn] :
  /// The Amazon Resource Name (ARN) of the instances for which to return
  /// recommendation projected metrics.
  ///
  /// Parameter [period] :
  /// The granularity, in seconds, of the projected metrics data points.
  ///
  /// Parameter [startTime] :
  /// The timestamp of the first projected metrics data point to return.
  ///
  /// Parameter [stat] :
  /// The statistic of the projected metrics.
  ///
  /// Parameter [recommendationPreferences] :
  /// An object to specify the preferences for the Amazon EC2 recommendation
  /// projected metrics to return in the response.
  Future<GetEC2RecommendationProjectedMetricsResponse>
      getEC2RecommendationProjectedMetrics({
    required DateTime endTime,
    required String instanceArn,
    required int period,
    required DateTime startTime,
    required MetricStatistic stat,
    RecommendationPreferences? recommendationPreferences,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerService.GetEC2RecommendationProjectedMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endTime': unixTimestampToJson(endTime),
        'instanceArn': instanceArn,
        'period': period,
        'startTime': unixTimestampToJson(startTime),
        'stat': stat.value,
        if (recommendationPreferences != null)
          'recommendationPreferences': recommendationPreferences,
      },
    );

    return GetEC2RecommendationProjectedMetricsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the projected metrics of Amazon ECS service recommendations.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [endTime] :
  /// The timestamp of the last projected metrics data point to return.
  ///
  /// Parameter [period] :
  /// The granularity, in seconds, of the projected metrics data points.
  ///
  /// Parameter [serviceArn] :
  /// The ARN that identifies the Amazon ECS service.
  ///
  /// The following is the format of the ARN:
  ///
  /// <code>arn:aws:ecs:region:aws_account_id:service/cluster-name/service-name</code>
  ///
  /// Parameter [startTime] :
  /// The timestamp of the first projected metrics data point to return.
  ///
  /// Parameter [stat] :
  /// The statistic of the projected metrics.
  Future<GetECSServiceRecommendationProjectedMetricsResponse>
      getECSServiceRecommendationProjectedMetrics({
    required DateTime endTime,
    required int period,
    required String serviceArn,
    required DateTime startTime,
    required MetricStatistic stat,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerService.GetECSServiceRecommendationProjectedMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endTime': unixTimestampToJson(endTime),
        'period': period,
        'serviceArn': serviceArn,
        'startTime': unixTimestampToJson(startTime),
        'stat': stat.value,
      },
    );

    return GetECSServiceRecommendationProjectedMetricsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns Amazon ECS service recommendations.
  ///
  /// Compute Optimizer generates recommendations for Amazon ECS services on
  /// Fargate that meet a specific set of requirements. For more information,
  /// see the <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html">Supported
  /// resources and requirements</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountIds] :
  /// Return the Amazon ECS service recommendations to the specified Amazon Web
  /// Services account IDs.
  ///
  /// If your account is the management account or the delegated administrator
  /// of an organization, use this parameter to return the Amazon ECS service
  /// recommendations to specific member accounts.
  ///
  /// You can only specify one account ID per request.
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that returns a more specific list
  /// of Amazon ECS service recommendations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Amazon ECS service recommendations to return with a
  /// single request.
  ///
  /// To retrieve the remaining results, make another request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of Amazon ECS service
  /// recommendations.
  ///
  /// Parameter [serviceArns] :
  /// The ARN that identifies the Amazon ECS service.
  ///
  /// The following is the format of the ARN:
  ///
  /// <code>arn:aws:ecs:region:aws_account_id:service/cluster-name/service-name</code>
  Future<GetECSServiceRecommendationsResponse> getECSServiceRecommendations({
    List<String>? accountIds,
    List<ECSServiceRecommendationFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? serviceArns,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.GetECSServiceRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountIds != null) 'accountIds': accountIds,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (serviceArns != null) 'serviceArns': serviceArns,
      },
    );

    return GetECSServiceRecommendationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the recommendation preferences that are in effect for a given
  /// resource, such as enhanced infrastructure metrics. Considers all
  /// applicable preferences that you might have set at the resource, account,
  /// and organization level.
  ///
  /// When you create a recommendation preference, you can set its status to
  /// <code>Active</code> or <code>Inactive</code>. Use this action to view the
  /// recommendation preferences that are in effect, or <code>Active</code>.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which to confirm
  /// effective recommendation preferences. Only EC2 instance and Auto Scaling
  /// group ARNs are currently supported.
  Future<GetEffectiveRecommendationPreferencesResponse>
      getEffectiveRecommendationPreferences({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerService.GetEffectiveRecommendationPreferences'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return GetEffectiveRecommendationPreferencesResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the enrollment (opt in) status of an account to the Compute
  /// Optimizer service.
  ///
  /// If the account is the management account of an organization, this action
  /// also confirms the enrollment status of member accounts of the
  /// organization. Use the <a>GetEnrollmentStatusesForOrganization</a> action
  /// to get detailed information about the enrollment status of member accounts
  /// of an organization.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  Future<GetEnrollmentStatusResponse> getEnrollmentStatus() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.GetEnrollmentStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetEnrollmentStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns the Compute Optimizer enrollment (opt-in) status of organization
  /// member accounts, if your account is an organization management account.
  ///
  /// To get the enrollment status of standalone accounts, use the
  /// <a>GetEnrollmentStatus</a> action.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that returns a more specific list
  /// of account enrollment statuses.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of account enrollment statuses to return with a single
  /// request. You can specify up to 100 statuses to return with each request.
  ///
  /// To retrieve the remaining results, make another request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of account enrollment statuses.
  Future<GetEnrollmentStatusesForOrganizationResponse>
      getEnrollmentStatusesForOrganization({
    List<EnrollmentFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerService.GetEnrollmentStatusesForOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetEnrollmentStatusesForOrganizationResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns Lambda function recommendations.
  ///
  /// Compute Optimizer generates recommendations for functions that meet a
  /// specific set of requirements. For more information, see the <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html">Supported
  /// resources and requirements</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [accountIds] :
  /// The ID of the Amazon Web Services account for which to return function
  /// recommendations.
  ///
  /// If your account is the management account of an organization, use this
  /// parameter to specify the member account for which you want to return
  /// function recommendations.
  ///
  /// Only one account ID can be specified per request.
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that returns a more specific list
  /// of function recommendations.
  ///
  /// Parameter [functionArns] :
  /// The Amazon Resource Name (ARN) of the functions for which to return
  /// recommendations.
  ///
  /// You can specify a qualified or unqualified ARN. If you specify an
  /// unqualified ARN without a function version suffix, Compute Optimizer will
  /// return recommendations for the latest (<code>$LATEST</code>) version of
  /// the function. If you specify a qualified ARN with a version suffix,
  /// Compute Optimizer will return recommendations for the specified function
  /// version. For more information about using function versions, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-versions.html#versioning-versions-using">Using
  /// versions</a> in the <i>Lambda Developer Guide</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of function recommendations to return with a single
  /// request.
  ///
  /// To retrieve the remaining results, make another request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of function recommendations.
  Future<GetLambdaFunctionRecommendationsResponse>
      getLambdaFunctionRecommendations({
    List<String>? accountIds,
    List<LambdaFunctionRecommendationFilter>? filters,
    List<String>? functionArns,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.GetLambdaFunctionRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountIds != null) 'accountIds': accountIds,
        if (filters != null) 'filters': filters,
        if (functionArns != null) 'functionArns': functionArns,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetLambdaFunctionRecommendationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns license recommendations for Amazon EC2 instances that run on a
  /// specific license.
  ///
  /// Compute Optimizer generates recommendations for licenses that meet a
  /// specific set of requirements. For more information, see the <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html">Supported
  /// resources and requirements</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountIds] :
  /// The ID of the Amazon Web Services account for which to return license
  /// recommendations.
  ///
  /// If your account is the management account of an organization, use this
  /// parameter to specify the member account for which you want to return
  /// license recommendations.
  ///
  /// Only one account ID can be specified per request.
  ///
  /// Parameter [filters] :
  /// An array of objects to specify a filter that returns a more specific list
  /// of license recommendations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of license recommendations to return with a single
  /// request.
  ///
  /// To retrieve the remaining results, make another request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of license recommendations.
  ///
  /// Parameter [resourceArns] :
  /// The ARN that identifies the Amazon EC2 instance.
  ///
  /// The following is the format of the ARN:
  ///
  /// <code>arn:aws:ec2:region:aws_account_id:instance/instance-id</code>
  Future<GetLicenseRecommendationsResponse> getLicenseRecommendations({
    List<String>? accountIds,
    List<LicenseRecommendationFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? resourceArns,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.GetLicenseRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountIds != null) 'accountIds': accountIds,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (resourceArns != null) 'resourceArns': resourceArns,
      },
    );

    return GetLicenseRecommendationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns existing recommendation preferences, such as enhanced
  /// infrastructure metrics.
  ///
  /// Use the <code>scope</code> parameter to specify which preferences to
  /// return. You can specify to return preferences for an organization, a
  /// specific account ID, or a specific EC2 instance or Auto Scaling group
  /// Amazon Resource Name (ARN).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html">Activating
  /// enhanced infrastructure metrics</a> in the <i>Compute Optimizer User
  /// Guide</i>.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceType] :
  /// The target resource type of the recommendation preference for which to
  /// return preferences.
  ///
  /// The <code>Ec2Instance</code> option encompasses standalone instances and
  /// instances that are part of Auto Scaling groups. The
  /// <code>AutoScalingGroup</code> option encompasses only instances that are
  /// part of an Auto Scaling group.
  /// <note>
  /// The valid values for this parameter are <code>Ec2Instance</code> and
  /// <code>AutoScalingGroup</code>.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommendation preferences to return with a single
  /// request.
  ///
  /// To retrieve the remaining results, make another request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of recommendation preferences.
  ///
  /// Parameter [scope] :
  /// An object that describes the scope of the recommendation preference to
  /// return.
  ///
  /// You can return recommendation preferences that are created at the
  /// organization level (for management accounts of an organization only),
  /// account level, and resource level. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html">Activating
  /// enhanced infrastructure metrics</a> in the <i>Compute Optimizer User
  /// Guide</i>.
  Future<GetRecommendationPreferencesResponse> getRecommendationPreferences({
    required ResourceType resourceType,
    int? maxResults,
    String? nextToken,
    Scope? scope,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.GetRecommendationPreferences'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceType': resourceType.value,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (scope != null) 'scope': scope,
      },
    );

    return GetRecommendationPreferencesResponse.fromJson(jsonResponse.body);
  }

  /// Returns the optimization findings for an account.
  ///
  /// It returns the number of:
  ///
  /// <ul>
  /// <li>
  /// Amazon EC2 instances in an account that are <code>Underprovisioned</code>,
  /// <code>Overprovisioned</code>, or <code>Optimized</code>.
  /// </li>
  /// <li>
  /// Auto Scaling groups in an account that are <code>NotOptimized</code>, or
  /// <code>Optimized</code>.
  /// </li>
  /// <li>
  /// Amazon EBS volumes in an account that are <code>NotOptimized</code>, or
  /// <code>Optimized</code>.
  /// </li>
  /// <li>
  /// Lambda functions in an account that are <code>NotOptimized</code>, or
  /// <code>Optimized</code>.
  /// </li>
  /// <li>
  /// Amazon ECS services in an account that are <code>Underprovisioned</code>,
  /// <code>Overprovisioned</code>, or <code>Optimized</code>.
  /// </li>
  /// </ul>
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountIds] :
  /// The ID of the Amazon Web Services account for which to return
  /// recommendation summaries.
  ///
  /// If your account is the management account of an organization, use this
  /// parameter to specify the member account for which you want to return
  /// recommendation summaries.
  ///
  /// Only one account ID can be specified per request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommendation summaries to return with a single
  /// request.
  ///
  /// To retrieve the remaining results, make another request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to advance to the next page of recommendation summaries.
  Future<GetRecommendationSummariesResponse> getRecommendationSummaries({
    List<String>? accountIds,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.GetRecommendationSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountIds != null) 'accountIds': accountIds,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetRecommendationSummariesResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new recommendation preference or updates an existing
  /// recommendation preference, such as enhanced infrastructure metrics.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html">Activating
  /// enhanced infrastructure metrics</a> in the <i>Compute Optimizer User
  /// Guide</i>.
  ///
  /// May throw [OptInRequiredException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceType] :
  /// The target resource type of the recommendation preference to create.
  ///
  /// The <code>Ec2Instance</code> option encompasses standalone instances and
  /// instances that are part of Auto Scaling groups. The
  /// <code>AutoScalingGroup</code> option encompasses only instances that are
  /// part of an Auto Scaling group.
  /// <note>
  /// The valid values for this parameter are <code>Ec2Instance</code> and
  /// <code>AutoScalingGroup</code>.
  /// </note>
  ///
  /// Parameter [enhancedInfrastructureMetrics] :
  /// The status of the enhanced infrastructure metrics recommendation
  /// preference to create or update.
  ///
  /// Specify the <code>Active</code> status to activate the preference, or
  /// specify <code>Inactive</code> to deactivate the preference.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html">Enhanced
  /// infrastructure metrics</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// Parameter [externalMetricsPreference] :
  /// The provider of the external metrics recommendation preference to create
  /// or update.
  ///
  /// Specify a valid provider in the <code>source</code> field to activate the
  /// preference. To delete this preference, see the
  /// <a>DeleteRecommendationPreferences</a> action.
  ///
  /// This preference can only be set for the <code>Ec2Instance</code> resource
  /// type.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/external-metrics-ingestion.html">External
  /// metrics ingestion</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// Parameter [inferredWorkloadTypes] :
  /// The status of the inferred workload types recommendation preference to
  /// create or update.
  /// <note>
  /// The inferred workload type feature is active by default. To deactivate it,
  /// create a recommendation preference.
  /// </note>
  /// Specify the <code>Inactive</code> status to deactivate the feature, or
  /// specify <code>Active</code> to activate it.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/inferred-workload-types.html">Inferred
  /// workload types</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// Parameter [lookBackPeriod] :
  /// The preference to control the number of days the utilization metrics of
  /// the Amazon Web Services resource are analyzed. When this preference isn't
  /// specified, we use the default value <code>DAYS_14</code>.
  /// <note>
  /// You can only set this preference for the Amazon EC2 instance and Auto
  /// Scaling group resource types.
  /// </note>
  ///
  /// Parameter [preferredResources] :
  /// The preference to control which resource type values are considered when
  /// generating rightsizing recommendations. You can specify this preference as
  /// a combination of include and exclude lists. You must specify either an
  /// <code>includeList</code> or <code>excludeList</code>. If the preference is
  /// an empty set of resource type values, an error occurs.
  /// <note>
  /// You can only set this preference for the Amazon EC2 instance and Auto
  /// Scaling group resource types.
  /// </note>
  ///
  /// Parameter [savingsEstimationMode] :
  /// The status of the savings estimation mode preference to create or update.
  ///
  /// Specify the <code>AfterDiscounts</code> status to activate the preference,
  /// or specify <code>BeforeDiscounts</code> to deactivate the preference.
  ///
  /// Only the account manager or delegated administrator of your organization
  /// can activate this preference.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/savings-estimation-mode.html">
  /// Savings estimation mode</a> in the <i>Compute Optimizer User Guide</i>.
  ///
  /// Parameter [scope] :
  /// An object that describes the scope of the recommendation preference to
  /// create.
  ///
  /// You can create recommendation preferences at the organization level (for
  /// management accounts of an organization only), account level, and resource
  /// level. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html">Activating
  /// enhanced infrastructure metrics</a> in the <i>Compute Optimizer User
  /// Guide</i>.
  /// <note>
  /// You cannot create recommendation preferences for Auto Scaling groups at
  /// the organization and account levels. You can create recommendation
  /// preferences for Auto Scaling groups only at the resource level by
  /// specifying a scope name of <code>ResourceArn</code> and a scope value of
  /// the Auto Scaling group Amazon Resource Name (ARN). This will configure the
  /// preference for all instances that are part of the specified Auto Scaling
  /// group. You also cannot create recommendation preferences at the resource
  /// level for instances that are part of an Auto Scaling group. You can create
  /// recommendation preferences at the resource level only for standalone
  /// instances.
  /// </note>
  ///
  /// Parameter [utilizationPreferences] :
  /// The preference to control the resource’s CPU utilization threshold, CPU
  /// utilization headroom, and memory utilization headroom. When this
  /// preference isn't specified, we use the following default values.
  ///
  /// CPU utilization:
  ///
  /// <ul>
  /// <li>
  /// <code>P99_5</code> for threshold
  /// </li>
  /// <li>
  /// <code>PERCENT_20</code> for headroom
  /// </li>
  /// </ul>
  /// Memory utilization:
  ///
  /// <ul>
  /// <li>
  /// <code>PERCENT_20</code> for headroom
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// You can only set CPU and memory utilization preferences for the Amazon EC2
  /// instance resource type.
  /// </li>
  /// <li>
  /// The threshold setting isn’t available for memory utilization.
  /// </li>
  /// </ul> </note>
  Future<void> putRecommendationPreferences({
    required ResourceType resourceType,
    EnhancedInfrastructureMetrics? enhancedInfrastructureMetrics,
    ExternalMetricsPreference? externalMetricsPreference,
    InferredWorkloadTypesPreference? inferredWorkloadTypes,
    LookBackPeriodPreference? lookBackPeriod,
    List<PreferredResource>? preferredResources,
    SavingsEstimationMode? savingsEstimationMode,
    Scope? scope,
    List<UtilizationPreference>? utilizationPreferences,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.PutRecommendationPreferences'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceType': resourceType.value,
        if (enhancedInfrastructureMetrics != null)
          'enhancedInfrastructureMetrics': enhancedInfrastructureMetrics.value,
        if (externalMetricsPreference != null)
          'externalMetricsPreference': externalMetricsPreference,
        if (inferredWorkloadTypes != null)
          'inferredWorkloadTypes': inferredWorkloadTypes.value,
        if (lookBackPeriod != null) 'lookBackPeriod': lookBackPeriod.value,
        if (preferredResources != null)
          'preferredResources': preferredResources,
        if (savingsEstimationMode != null)
          'savingsEstimationMode': savingsEstimationMode.value,
        if (scope != null) 'scope': scope,
        if (utilizationPreferences != null)
          'utilizationPreferences': utilizationPreferences,
      },
    );
  }

  /// Updates the enrollment (opt in and opt out) status of an account to the
  /// Compute Optimizer service.
  ///
  /// If the account is a management account of an organization, this action can
  /// also be used to enroll member accounts of the organization.
  ///
  /// You must have the appropriate permissions to opt in to Compute Optimizer,
  /// to view its recommendations, and to opt out. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html">Controlling
  /// access with Amazon Web Services Identity and Access Management</a> in the
  /// <i>Compute Optimizer User Guide</i>.
  ///
  /// When you opt in, Compute Optimizer automatically creates a service-linked
  /// role in your account to access its data. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/using-service-linked-roles.html">Using
  /// Service-Linked Roles for Compute Optimizer</a> in the <i>Compute Optimizer
  /// User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingAuthenticationToken].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [status] :
  /// The new enrollment status of the account.
  ///
  /// The following status options are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Active</code> - Opts in your account to the Compute Optimizer
  /// service. Compute Optimizer begins analyzing the configuration and
  /// utilization metrics of your Amazon Web Services resources after you opt
  /// in. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html">Metrics
  /// analyzed by Compute Optimizer</a> in the <i>Compute Optimizer User
  /// Guide</i>.
  /// </li>
  /// <li>
  /// <code>Inactive</code> - Opts out your account from the Compute Optimizer
  /// service. Your account's recommendations and related metrics data will be
  /// deleted from Compute Optimizer after you opt out.
  /// </li>
  /// </ul> <note>
  /// The <code>Pending</code> and <code>Failed</code> options cannot be used to
  /// update the enrollment status of an account. They are returned in the
  /// response of a request to update the enrollment status of an account.
  /// </note>
  ///
  /// Parameter [includeMemberAccounts] :
  /// Indicates whether to enroll member accounts of the organization if the
  /// account is the management account of an organization.
  Future<UpdateEnrollmentStatusResponse> updateEnrollmentStatus({
    required Status status,
    bool? includeMemberAccounts,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerService.UpdateEnrollmentStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'status': status.value,
        if (includeMemberAccounts != null)
          'includeMemberAccounts': includeMemberAccounts,
      },
    );

    return UpdateEnrollmentStatusResponse.fromJson(jsonResponse.body);
  }
}

/// Describes the enrollment status of an organization's member accounts in
/// Compute Optimizer.
class AccountEnrollmentStatus {
  /// The Amazon Web Services account ID.
  final String? accountId;

  /// The Unix epoch timestamp, in seconds, of when the account enrollment status
  /// was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The account enrollment status.
  final Status? status;

  /// The reason for the account enrollment status.
  ///
  /// For example, an account might show a status of <code>Pending</code> because
  /// member accounts of an organization require more time to be enrolled in the
  /// service.
  final String? statusReason;

  AccountEnrollmentStatus({
    this.accountId,
    this.lastUpdatedTimestamp,
    this.status,
    this.statusReason,
  });

  factory AccountEnrollmentStatus.fromJson(Map<String, dynamic> json) {
    return AccountEnrollmentStatus(
      accountId: json['accountId'] as String?,
      lastUpdatedTimestamp: timeStampFromJson(json['lastUpdatedTimestamp']),
      status: (json['status'] as String?)?.let(Status.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }
}

enum AutoScalingConfiguration {
  targetTrackingScalingCpu('TargetTrackingScalingCpu'),
  targetTrackingScalingMemory('TargetTrackingScalingMemory'),
  ;

  final String value;

  const AutoScalingConfiguration(this.value);

  static AutoScalingConfiguration fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AutoScalingConfiguration'));
}

/// Describes the configuration of an Auto Scaling group.
class AutoScalingGroupConfiguration {
  /// The desired capacity, or number of instances, for the Auto Scaling group.
  final int? desiredCapacity;

  /// The instance type for the Auto Scaling group.
  final String? instanceType;

  /// The maximum size, or maximum number of instances, for the Auto Scaling
  /// group.
  final int? maxSize;

  /// The minimum size, or minimum number of instances, for the Auto Scaling
  /// group.
  final int? minSize;

  AutoScalingGroupConfiguration({
    this.desiredCapacity,
    this.instanceType,
    this.maxSize,
    this.minSize,
  });

  factory AutoScalingGroupConfiguration.fromJson(Map<String, dynamic> json) {
    return AutoScalingGroupConfiguration(
      desiredCapacity: json['desiredCapacity'] as int?,
      instanceType: json['instanceType'] as String?,
      maxSize: json['maxSize'] as int?,
      minSize: json['minSize'] as int?,
    );
  }
}

/// An object that describes the estimated monthly savings possible by adopting
/// Compute Optimizer’s Auto Scaling group recommendations. This is based on the
/// Savings Plans and Reserved Instances discounts.
class AutoScalingGroupEstimatedMonthlySavings {
  /// The currency of the estimated monthly savings.
  final Currency? currency;

  /// The value of the estimated monthly savings.
  final double? value;

  AutoScalingGroupEstimatedMonthlySavings({
    this.currency,
    this.value,
  });

  factory AutoScalingGroupEstimatedMonthlySavings.fromJson(
      Map<String, dynamic> json) {
    return AutoScalingGroupEstimatedMonthlySavings(
      currency: (json['currency'] as String?)?.let(Currency.fromString),
      value: json['value'] as double?,
    );
  }
}

/// Describes an Auto Scaling group recommendation.
class AutoScalingGroupRecommendation {
  /// The Amazon Web Services account ID of the Auto Scaling group.
  final String? accountId;

  /// The Amazon Resource Name (ARN) of the Auto Scaling group.
  final String? autoScalingGroupArn;

  /// The name of the Auto Scaling group.
  final String? autoScalingGroupName;

  /// An array of objects that describe the current configuration of the Auto
  /// Scaling group.
  final AutoScalingGroupConfiguration? currentConfiguration;

  /// Describes the GPU accelerator settings for the current instance type of the
  /// Auto Scaling group.
  final GpuInfo? currentInstanceGpuInfo;

  /// The risk of the current Auto Scaling group not meeting the performance needs
  /// of its workloads. The higher the risk, the more likely the current Auto
  /// Scaling group configuration has insufficient capacity and cannot meet
  /// workload requirements.
  final CurrentPerformanceRisk? currentPerformanceRisk;

  /// An object that describes the effective recommendation preferences for the
  /// Auto Scaling group.
  final EffectiveRecommendationPreferences? effectiveRecommendationPreferences;

  /// The finding classification of the Auto Scaling group.
  ///
  /// Findings for Auto Scaling groups include:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>NotOptimized</code> </b>—An Auto Scaling group is considered not
  /// optimized when Compute Optimizer identifies a recommendation that can
  /// provide better performance for your workload.
  /// </li>
  /// <li>
  /// <b> <code>Optimized</code> </b>—An Auto Scaling group is considered
  /// optimized when Compute Optimizer determines that the group is correctly
  /// provisioned to run your workload based on the chosen instance type. For
  /// optimized resources, Compute Optimizer might recommend a new generation
  /// instance type.
  /// </li>
  /// </ul>
  final Finding? finding;

  /// The applications that might be running on the instances in the Auto Scaling
  /// group as inferred by Compute Optimizer.
  ///
  /// Compute Optimizer can infer if one of the following applications might be
  /// running on the instances:
  ///
  /// <ul>
  /// <li>
  /// <code>AmazonEmr</code> - Infers that Amazon EMR might be running on the
  /// instances.
  /// </li>
  /// <li>
  /// <code>ApacheCassandra</code> - Infers that Apache Cassandra might be running
  /// on the instances.
  /// </li>
  /// <li>
  /// <code>ApacheHadoop</code> - Infers that Apache Hadoop might be running on
  /// the instances.
  /// </li>
  /// <li>
  /// <code>Memcached</code> - Infers that Memcached might be running on the
  /// instances.
  /// </li>
  /// <li>
  /// <code>NGINX</code> - Infers that NGINX might be running on the instances.
  /// </li>
  /// <li>
  /// <code>PostgreSql</code> - Infers that PostgreSQL might be running on the
  /// instances.
  /// </li>
  /// <li>
  /// <code>Redis</code> - Infers that Redis might be running on the instances.
  /// </li>
  /// <li>
  /// <code>Kafka</code> - Infers that Kafka might be running on the instance.
  /// </li>
  /// <li>
  /// <code>SQLServer</code> - Infers that SQLServer might be running on the
  /// instance.
  /// </li>
  /// </ul>
  final List<InferredWorkloadType>? inferredWorkloadTypes;

  /// The timestamp of when the Auto Scaling group recommendation was last
  /// generated.
  final DateTime? lastRefreshTimestamp;

  /// The number of days for which utilization metrics were analyzed for the Auto
  /// Scaling group.
  final double? lookBackPeriodInDays;

  /// An array of objects that describe the recommendation options for the Auto
  /// Scaling group.
  final List<AutoScalingGroupRecommendationOption>? recommendationOptions;

  /// An array of objects that describe the utilization metrics of the Auto
  /// Scaling group.
  final List<UtilizationMetric>? utilizationMetrics;

  AutoScalingGroupRecommendation({
    this.accountId,
    this.autoScalingGroupArn,
    this.autoScalingGroupName,
    this.currentConfiguration,
    this.currentInstanceGpuInfo,
    this.currentPerformanceRisk,
    this.effectiveRecommendationPreferences,
    this.finding,
    this.inferredWorkloadTypes,
    this.lastRefreshTimestamp,
    this.lookBackPeriodInDays,
    this.recommendationOptions,
    this.utilizationMetrics,
  });

  factory AutoScalingGroupRecommendation.fromJson(Map<String, dynamic> json) {
    return AutoScalingGroupRecommendation(
      accountId: json['accountId'] as String?,
      autoScalingGroupArn: json['autoScalingGroupArn'] as String?,
      autoScalingGroupName: json['autoScalingGroupName'] as String?,
      currentConfiguration: json['currentConfiguration'] != null
          ? AutoScalingGroupConfiguration.fromJson(
              json['currentConfiguration'] as Map<String, dynamic>)
          : null,
      currentInstanceGpuInfo: json['currentInstanceGpuInfo'] != null
          ? GpuInfo.fromJson(
              json['currentInstanceGpuInfo'] as Map<String, dynamic>)
          : null,
      currentPerformanceRisk: (json['currentPerformanceRisk'] as String?)
          ?.let(CurrentPerformanceRisk.fromString),
      effectiveRecommendationPreferences:
          json['effectiveRecommendationPreferences'] != null
              ? EffectiveRecommendationPreferences.fromJson(
                  json['effectiveRecommendationPreferences']
                      as Map<String, dynamic>)
              : null,
      finding: (json['finding'] as String?)?.let(Finding.fromString),
      inferredWorkloadTypes: (json['inferredWorkloadTypes'] as List?)
          ?.nonNulls
          .map((e) => InferredWorkloadType.fromString((e as String)))
          .toList(),
      lastRefreshTimestamp: timeStampFromJson(json['lastRefreshTimestamp']),
      lookBackPeriodInDays: json['lookBackPeriodInDays'] as double?,
      recommendationOptions: (json['recommendationOptions'] as List?)
          ?.nonNulls
          .map((e) => AutoScalingGroupRecommendationOption.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      utilizationMetrics: (json['utilizationMetrics'] as List?)
          ?.nonNulls
          .map((e) => UtilizationMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Describes a recommendation option for an Auto Scaling group.
class AutoScalingGroupRecommendationOption {
  /// An array of objects that describe an Auto Scaling group configuration.
  final AutoScalingGroupConfiguration? configuration;

  /// Describes the GPU accelerator settings for the recommended instance type of
  /// the Auto Scaling group.
  final GpuInfo? instanceGpuInfo;

  /// The level of effort required to migrate from the current instance type to
  /// the recommended instance type.
  ///
  /// For example, the migration effort is <code>Low</code> if Amazon EMR is the
  /// inferred workload type and an Amazon Web Services Graviton instance type is
  /// recommended. The migration effort is <code>Medium</code> if a workload type
  /// couldn't be inferred but an Amazon Web Services Graviton instance type is
  /// recommended. The migration effort is <code>VeryLow</code> if both the
  /// current and recommended instance types are of the same CPU architecture.
  final MigrationEffort? migrationEffort;

  /// The performance risk of the Auto Scaling group configuration recommendation.
  ///
  /// Performance risk indicates the likelihood of the recommended instance type
  /// not meeting the resource needs of your workload. Compute Optimizer
  /// calculates an individual performance risk score for each specification of
  /// the recommended instance, including CPU, memory, EBS throughput, EBS IOPS,
  /// disk throughput, disk IOPS, network throughput, and network PPS. The
  /// performance risk of the recommended instance is calculated as the maximum
  /// performance risk score across the analyzed resource specifications.
  ///
  /// The value ranges from <code>0</code> - <code>4</code>, with <code>0</code>
  /// meaning that the recommended resource is predicted to always provide enough
  /// hardware capability. The higher the performance risk is, the more likely you
  /// should validate whether the recommendation will meet the performance
  /// requirements of your workload before migrating your resource.
  final double? performanceRisk;

  /// An array of objects that describe the projected utilization metrics of the
  /// Auto Scaling group recommendation option.
  /// <note>
  /// The <code>Cpu</code> and <code>Memory</code> metrics are the only projected
  /// utilization metrics returned. Additionally, the <code>Memory</code> metric
  /// is returned only for resources that have the unified CloudWatch agent
  /// installed on them. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent">Enabling
  /// Memory Utilization with the CloudWatch Agent</a>.
  /// </note>
  final List<UtilizationMetric>? projectedUtilizationMetrics;

  /// The rank of the Auto Scaling group recommendation option.
  ///
  /// The top recommendation option is ranked as <code>1</code>.
  final int? rank;

  /// An object that describes the savings opportunity for the Auto Scaling group
  /// recommendation option. Savings opportunity includes the estimated monthly
  /// savings amount and percentage.
  final SavingsOpportunity? savingsOpportunity;

  /// An object that describes the savings opportunity for the Auto Scaling group
  /// recommendation option that includes Savings Plans and Reserved Instances
  /// discounts. Savings opportunity includes the estimated monthly savings and
  /// percentage.
  final AutoScalingGroupSavingsOpportunityAfterDiscounts?
      savingsOpportunityAfterDiscounts;

  AutoScalingGroupRecommendationOption({
    this.configuration,
    this.instanceGpuInfo,
    this.migrationEffort,
    this.performanceRisk,
    this.projectedUtilizationMetrics,
    this.rank,
    this.savingsOpportunity,
    this.savingsOpportunityAfterDiscounts,
  });

  factory AutoScalingGroupRecommendationOption.fromJson(
      Map<String, dynamic> json) {
    return AutoScalingGroupRecommendationOption(
      configuration: json['configuration'] != null
          ? AutoScalingGroupConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      instanceGpuInfo: json['instanceGpuInfo'] != null
          ? GpuInfo.fromJson(json['instanceGpuInfo'] as Map<String, dynamic>)
          : null,
      migrationEffort:
          (json['migrationEffort'] as String?)?.let(MigrationEffort.fromString),
      performanceRisk: json['performanceRisk'] as double?,
      projectedUtilizationMetrics:
          (json['projectedUtilizationMetrics'] as List?)
              ?.nonNulls
              .map((e) => UtilizationMetric.fromJson(e as Map<String, dynamic>))
              .toList(),
      rank: json['rank'] as int?,
      savingsOpportunity: json['savingsOpportunity'] != null
          ? SavingsOpportunity.fromJson(
              json['savingsOpportunity'] as Map<String, dynamic>)
          : null,
      savingsOpportunityAfterDiscounts:
          json['savingsOpportunityAfterDiscounts'] != null
              ? AutoScalingGroupSavingsOpportunityAfterDiscounts.fromJson(
                  json['savingsOpportunityAfterDiscounts']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

/// Describes the savings opportunity for Auto Scaling group recommendations
/// after applying the Savings Plans and Reserved Instances discounts.
///
/// Savings opportunity represents the estimated monthly savings you can achieve
/// by implementing Compute Optimizer recommendations.
class AutoScalingGroupSavingsOpportunityAfterDiscounts {
  /// An object that describes the estimated monthly savings possible by adopting
  /// Compute Optimizer’s Auto Scaling group recommendations. This is based on the
  /// Savings Plans and Reserved Instances pricing discounts.
  final AutoScalingGroupEstimatedMonthlySavings? estimatedMonthlySavings;

  /// The estimated monthly savings possible as a percentage of monthly cost after
  /// applying the Savings Plans and Reserved Instances discounts. This saving can
  /// be achieved by adopting Compute Optimizer’s Auto Scaling group
  /// recommendations.
  final double? savingsOpportunityPercentage;

  AutoScalingGroupSavingsOpportunityAfterDiscounts({
    this.estimatedMonthlySavings,
    this.savingsOpportunityPercentage,
  });

  factory AutoScalingGroupSavingsOpportunityAfterDiscounts.fromJson(
      Map<String, dynamic> json) {
    return AutoScalingGroupSavingsOpportunityAfterDiscounts(
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? AutoScalingGroupEstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
      savingsOpportunityPercentage:
          json['savingsOpportunityPercentage'] as double?,
    );
  }
}

/// Describes the container configurations within the tasks of your Amazon ECS
/// service.
class ContainerConfiguration {
  /// The name of the container.
  final String? containerName;

  /// The number of CPU units reserved for the container.
  final int? cpu;

  /// The memory size configurations for the container.
  final MemorySizeConfiguration? memorySizeConfiguration;

  ContainerConfiguration({
    this.containerName,
    this.cpu,
    this.memorySizeConfiguration,
  });

  factory ContainerConfiguration.fromJson(Map<String, dynamic> json) {
    return ContainerConfiguration(
      containerName: json['containerName'] as String?,
      cpu: json['cpu'] as int?,
      memorySizeConfiguration: json['memorySizeConfiguration'] != null
          ? MemorySizeConfiguration.fromJson(
              json['memorySizeConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The CPU and memory recommendations for a container within the tasks of your
/// Amazon ECS service.
class ContainerRecommendation {
  /// The name of the container.
  final String? containerName;

  /// The recommended number of CPU units reserved for the container.
  final int? cpu;

  /// The recommended memory size configurations for the container.
  final MemorySizeConfiguration? memorySizeConfiguration;

  ContainerRecommendation({
    this.containerName,
    this.cpu,
    this.memorySizeConfiguration,
  });

  factory ContainerRecommendation.fromJson(Map<String, dynamic> json) {
    return ContainerRecommendation(
      containerName: json['containerName'] as String?,
      cpu: json['cpu'] as int?,
      memorySizeConfiguration: json['memorySizeConfiguration'] != null
          ? MemorySizeConfiguration.fromJson(
              json['memorySizeConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum CpuVendorArchitecture {
  awsArm64('AWS_ARM64'),
  current('CURRENT'),
  ;

  final String value;

  const CpuVendorArchitecture(this.value);

  static CpuVendorArchitecture fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum CpuVendorArchitecture'));
}

enum Currency {
  usd('USD'),
  cny('CNY'),
  ;

  final String value;

  const Currency(this.value);

  static Currency fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum Currency'));
}

enum CurrentPerformanceRisk {
  veryLow('VeryLow'),
  low('Low'),
  medium('Medium'),
  high('High'),
  ;

  final String value;

  const CurrentPerformanceRisk(this.value);

  static CurrentPerformanceRisk fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum CurrentPerformanceRisk'));
}

/// Describes the performance risk ratings for a given resource type.
///
/// Resources with a <code>high</code> or <code>medium</code> rating are at risk
/// of not meeting the performance needs of their workloads, while resources
/// with a <code>low</code> rating are performing well in their workloads.
class CurrentPerformanceRiskRatings {
  /// A count of the applicable resource types with a high performance risk
  /// rating.
  final int? high;

  /// A count of the applicable resource types with a low performance risk rating.
  final int? low;

  /// A count of the applicable resource types with a medium performance risk
  /// rating.
  final int? medium;

  /// A count of the applicable resource types with a very low performance risk
  /// rating.
  final int? veryLow;

  CurrentPerformanceRiskRatings({
    this.high,
    this.low,
    this.medium,
    this.veryLow,
  });

  factory CurrentPerformanceRiskRatings.fromJson(Map<String, dynamic> json) {
    return CurrentPerformanceRiskRatings(
      high: json['high'] as int?,
      low: json['low'] as int?,
      medium: json['medium'] as int?,
      veryLow: json['veryLow'] as int?,
    );
  }
}

enum CustomizableMetricHeadroom {
  percent_30('PERCENT_30'),
  percent_20('PERCENT_20'),
  percent_10('PERCENT_10'),
  percent_0('PERCENT_0'),
  ;

  final String value;

  const CustomizableMetricHeadroom(this.value);

  static CustomizableMetricHeadroom fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum CustomizableMetricHeadroom'));
}

enum CustomizableMetricName {
  cpuUtilization('CpuUtilization'),
  memoryUtilization('MemoryUtilization'),
  ;

  final String value;

  const CustomizableMetricName(this.value);

  static CustomizableMetricName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum CustomizableMetricName'));
}

/// Defines the various metric parameters that can be customized, such as
/// threshold and headroom.
class CustomizableMetricParameters {
  /// The headroom value in percentage used for the specified metric parameter.
  ///
  /// The following lists the valid values for CPU and memory utilization.
  ///
  /// <ul>
  /// <li>
  /// CPU utilization: <code>PERCENT_30 | PERCENT_20 | PERCENT_0</code>
  /// </li>
  /// <li>
  /// Memory utilization: <code>PERCENT_30 | PERCENT_20 | PERCENT_10</code>
  /// </li>
  /// </ul>
  final CustomizableMetricHeadroom? headroom;

  /// The threshold value used for the specified metric parameter.
  /// <note>
  /// You can only specify the threshold value for CPU utilization.
  /// </note>
  final CustomizableMetricThreshold? threshold;

  CustomizableMetricParameters({
    this.headroom,
    this.threshold,
  });

  factory CustomizableMetricParameters.fromJson(Map<String, dynamic> json) {
    return CustomizableMetricParameters(
      headroom: (json['headroom'] as String?)
          ?.let(CustomizableMetricHeadroom.fromString),
      threshold: (json['threshold'] as String?)
          ?.let(CustomizableMetricThreshold.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final headroom = this.headroom;
    final threshold = this.threshold;
    return {
      if (headroom != null) 'headroom': headroom.value,
      if (threshold != null) 'threshold': threshold.value,
    };
  }
}

enum CustomizableMetricThreshold {
  p90('P90'),
  p95('P95'),
  p99_5('P99_5'),
  ;

  final String value;

  const CustomizableMetricThreshold(this.value);

  static CustomizableMetricThreshold fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum CustomizableMetricThreshold'));
}

class DeleteRecommendationPreferencesResponse {
  DeleteRecommendationPreferencesResponse();

  factory DeleteRecommendationPreferencesResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteRecommendationPreferencesResponse();
  }
}

class DescribeRecommendationExportJobsResponse {
  /// The token to use to advance to the next page of export jobs.
  ///
  /// This value is null when there are no more pages of export jobs to return.
  final String? nextToken;

  /// An array of objects that describe recommendation export jobs.
  final List<RecommendationExportJob>? recommendationExportJobs;

  DescribeRecommendationExportJobsResponse({
    this.nextToken,
    this.recommendationExportJobs,
  });

  factory DescribeRecommendationExportJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRecommendationExportJobsResponse(
      nextToken: json['nextToken'] as String?,
      recommendationExportJobs: (json['recommendationExportJobs'] as List?)
          ?.nonNulls
          .map((e) =>
              RecommendationExportJob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Describes the effective recommendation preferences for Amazon EBS volumes.
class EBSEffectiveRecommendationPreferences {
  /// Describes the savings estimation mode preference applied for calculating
  /// savings opportunity for Amazon EBS volumes.
  final EBSSavingsEstimationMode? savingsEstimationMode;

  EBSEffectiveRecommendationPreferences({
    this.savingsEstimationMode,
  });

  factory EBSEffectiveRecommendationPreferences.fromJson(
      Map<String, dynamic> json) {
    return EBSEffectiveRecommendationPreferences(
      savingsEstimationMode: json['savingsEstimationMode'] != null
          ? EBSSavingsEstimationMode.fromJson(
              json['savingsEstimationMode'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// An object that describes the estimated monthly savings possible by adopting
/// Compute Optimizer’s Amazon EBS volume recommendations. This includes any
/// applicable discounts.
class EBSEstimatedMonthlySavings {
  /// The currency of the estimated monthly savings.
  final Currency? currency;

  /// The value of the estimated monthly savings.
  final double? value;

  EBSEstimatedMonthlySavings({
    this.currency,
    this.value,
  });

  factory EBSEstimatedMonthlySavings.fromJson(Map<String, dynamic> json) {
    return EBSEstimatedMonthlySavings(
      currency: (json['currency'] as String?)?.let(Currency.fromString),
      value: json['value'] as double?,
    );
  }
}

/// Describes a filter that returns a more specific list of Amazon Elastic Block
/// Store (Amazon EBS) volume recommendations. Use this filter with the
/// <a>GetEBSVolumeRecommendations</a> action.
///
/// You can use <code>LambdaFunctionRecommendationFilter</code> with the
/// <a>GetLambdaFunctionRecommendations</a> action, <code>JobFilter</code> with
/// the <a>DescribeRecommendationExportJobs</a> action, and <code>Filter</code>
/// with the <a>GetAutoScalingGroupRecommendations</a> and
/// <a>GetEC2InstanceRecommendations</a> actions.
class EBSFilter {
  /// The name of the filter.
  ///
  /// Specify <code>Finding</code> to return recommendations with a specific
  /// finding classification (for example, <code>NotOptimized</code>).
  ///
  /// You can filter your Amazon EBS volume recommendations by
  /// <code>tag:key</code> and <code>tag-key</code> tags.
  ///
  /// A <code>tag:key</code> is a key and value combination of a tag assigned to
  /// your Amazon EBS volume recommendations. Use the tag key in the filter name
  /// and the tag value as the filter value. For example, to find all Amazon EBS
  /// volume recommendations that have a tag with the key of <code>Owner</code>
  /// and the value of <code>TeamA</code>, specify <code>tag:Owner</code> for the
  /// filter name and <code>TeamA</code> for the filter value.
  ///
  /// A <code>tag-key</code> is the key of a tag assigned to your Amazon EBS
  /// volume recommendations. Use this filter to find all of your Amazon EBS
  /// volume recommendations that have a tag with a specific key. This doesn’t
  /// consider the tag value. For example, you can find your Amazon EBS volume
  /// recommendations with a tag key value of <code>Owner</code> or without any
  /// tag keys assigned.
  final EBSFilterName? name;

  /// The value of the filter.
  ///
  /// The valid values are <code>Optimized</code>, or <code>NotOptimized</code>.
  final List<String>? values;

  EBSFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

enum EBSFilterName {
  finding('Finding'),
  ;

  final String value;

  const EBSFilterName(this.value);

  static EBSFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EBSFilterName'));
}

enum EBSFinding {
  optimized('Optimized'),
  notOptimized('NotOptimized'),
  ;

  final String value;

  const EBSFinding(this.value);

  static EBSFinding fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum EBSFinding'));
}

enum EBSMetricName {
  volumeReadOpsPerSecond('VolumeReadOpsPerSecond'),
  volumeWriteOpsPerSecond('VolumeWriteOpsPerSecond'),
  volumeReadBytesPerSecond('VolumeReadBytesPerSecond'),
  volumeWriteBytesPerSecond('VolumeWriteBytesPerSecond'),
  ;

  final String value;

  const EBSMetricName(this.value);

  static EBSMetricName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EBSMetricName'));
}

/// Describes the savings estimation mode used for calculating savings
/// opportunity for Amazon EBS volumes.
class EBSSavingsEstimationMode {
  /// Describes the source for calculating the savings opportunity for Amazon EBS
  /// volumes.
  final EBSSavingsEstimationModeSource? source;

  EBSSavingsEstimationMode({
    this.source,
  });

  factory EBSSavingsEstimationMode.fromJson(Map<String, dynamic> json) {
    return EBSSavingsEstimationMode(
      source: (json['source'] as String?)
          ?.let(EBSSavingsEstimationModeSource.fromString),
    );
  }
}

enum EBSSavingsEstimationModeSource {
  publicPricing('PublicPricing'),
  costExplorerRightsizing('CostExplorerRightsizing'),
  costOptimizationHub('CostOptimizationHub'),
  ;

  final String value;

  const EBSSavingsEstimationModeSource(this.value);

  static EBSSavingsEstimationModeSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum EBSSavingsEstimationModeSource'));
}

/// Describes the savings opportunity for Amazon EBS volume recommendations
/// after applying specific discounts.
class EBSSavingsOpportunityAfterDiscounts {
  /// The estimated monthly savings possible as a percentage of monthly cost by
  /// adopting Compute Optimizer’s Amazon EBS volume recommendations. This saving
  /// includes any applicable discounts.
  final EBSEstimatedMonthlySavings? estimatedMonthlySavings;

  /// The estimated monthly savings possible as a percentage of monthly cost after
  /// applying the specific discounts. This saving can be achieved by adopting
  /// Compute Optimizer’s Amazon EBS volume recommendations.
  final double? savingsOpportunityPercentage;

  EBSSavingsOpportunityAfterDiscounts({
    this.estimatedMonthlySavings,
    this.savingsOpportunityPercentage,
  });

  factory EBSSavingsOpportunityAfterDiscounts.fromJson(
      Map<String, dynamic> json) {
    return EBSSavingsOpportunityAfterDiscounts(
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? EBSEstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
      savingsOpportunityPercentage:
          json['savingsOpportunityPercentage'] as double?,
    );
  }
}

/// Describes a utilization metric of an Amazon Elastic Block Store (Amazon EBS)
/// volume.
///
/// Compare the utilization metric data of your resource against its projected
/// utilization metric data to determine the performance difference between your
/// current resource and the recommended option.
class EBSUtilizationMetric {
  /// The name of the utilization metric.
  ///
  /// The following utilization metrics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>VolumeReadOpsPerSecond</code> - The completed read operations per
  /// second from the volume in a specified period of time.
  ///
  /// Unit: Count
  /// </li>
  /// <li>
  /// <code>VolumeWriteOpsPerSecond</code> - The completed write operations per
  /// second to the volume in a specified period of time.
  ///
  /// Unit: Count
  /// </li>
  /// <li>
  /// <code>VolumeReadBytesPerSecond</code> - The bytes read per second from the
  /// volume in a specified period of time.
  ///
  /// Unit: Bytes
  /// </li>
  /// <li>
  /// <code>VolumeWriteBytesPerSecond</code> - The bytes written to the volume in
  /// a specified period of time.
  ///
  /// Unit: Bytes
  /// </li>
  /// </ul>
  final EBSMetricName? name;

  /// The statistic of the utilization metric.
  ///
  /// The Compute Optimizer API, Command Line Interface (CLI), and SDKs return
  /// utilization metrics using only the <code>Maximum</code> statistic, which is
  /// the highest value observed during the specified period.
  ///
  /// The Compute Optimizer console displays graphs for some utilization metrics
  /// using the <code>Average</code> statistic, which is the value of
  /// <code>Sum</code> / <code>SampleCount</code> during the specified period. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html">Viewing
  /// resource recommendations</a> in the <i>Compute Optimizer User Guide</i>. You
  /// can also get averaged utilization metric data for your resources using
  /// Amazon CloudWatch. For more information, see the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html">Amazon
  /// CloudWatch User Guide</a>.
  final MetricStatistic? statistic;

  /// The value of the utilization metric.
  final double? value;

  EBSUtilizationMetric({
    this.name,
    this.statistic,
    this.value,
  });

  factory EBSUtilizationMetric.fromJson(Map<String, dynamic> json) {
    return EBSUtilizationMetric(
      name: (json['name'] as String?)?.let(EBSMetricName.fromString),
      statistic:
          (json['statistic'] as String?)?.let(MetricStatistic.fromString),
      value: json['value'] as double?,
    );
  }
}

/// Describes the effective recommendation preferences for Amazon ECS services.
class ECSEffectiveRecommendationPreferences {
  /// Describes the savings estimation mode preference applied for calculating
  /// savings opportunity for Amazon ECS services.
  final ECSSavingsEstimationMode? savingsEstimationMode;

  ECSEffectiveRecommendationPreferences({
    this.savingsEstimationMode,
  });

  factory ECSEffectiveRecommendationPreferences.fromJson(
      Map<String, dynamic> json) {
    return ECSEffectiveRecommendationPreferences(
      savingsEstimationMode: json['savingsEstimationMode'] != null
          ? ECSSavingsEstimationMode.fromJson(
              json['savingsEstimationMode'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Describes the estimated monthly savings possible for Amazon ECS services by
/// adopting Compute Optimizer recommendations. This is based on Amazon ECS
/// service pricing after applying Savings Plans discounts.
class ECSEstimatedMonthlySavings {
  /// The currency of the estimated monthly savings.
  final Currency? currency;

  /// The value of the estimated monthly savings for Amazon ECS services.
  final double? value;

  ECSEstimatedMonthlySavings({
    this.currency,
    this.value,
  });

  factory ECSEstimatedMonthlySavings.fromJson(Map<String, dynamic> json) {
    return ECSEstimatedMonthlySavings(
      currency: (json['currency'] as String?)?.let(Currency.fromString),
      value: json['value'] as double?,
    );
  }
}

/// Describes the savings estimation mode used for calculating savings
/// opportunity for Amazon ECS services.
class ECSSavingsEstimationMode {
  /// Describes the source for calculating the savings opportunity for Amazon ECS
  /// services.
  final ECSSavingsEstimationModeSource? source;

  ECSSavingsEstimationMode({
    this.source,
  });

  factory ECSSavingsEstimationMode.fromJson(Map<String, dynamic> json) {
    return ECSSavingsEstimationMode(
      source: (json['source'] as String?)
          ?.let(ECSSavingsEstimationModeSource.fromString),
    );
  }
}

enum ECSSavingsEstimationModeSource {
  publicPricing('PublicPricing'),
  costExplorerRightsizing('CostExplorerRightsizing'),
  costOptimizationHub('CostOptimizationHub'),
  ;

  final String value;

  const ECSSavingsEstimationModeSource(this.value);

  static ECSSavingsEstimationModeSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ECSSavingsEstimationModeSource'));
}

/// Describes the savings opportunity for Amazon ECS service recommendations
/// after applying Savings Plans discounts.
///
/// Savings opportunity represents the estimated monthly savings after applying
/// Savings Plans discounts. You can achieve this by implementing a given
/// Compute Optimizer recommendation.
class ECSSavingsOpportunityAfterDiscounts {
  /// The estimated monthly savings possible by adopting Compute Optimizer’s
  /// Amazon ECS service recommendations. This includes any applicable Savings
  /// Plans discounts.
  final ECSEstimatedMonthlySavings? estimatedMonthlySavings;

  /// The estimated monthly savings possible as a percentage of monthly cost by
  /// adopting Compute Optimizer’s Amazon ECS service recommendations. This
  /// includes any applicable Savings Plans discounts.
  final double? savingsOpportunityPercentage;

  ECSSavingsOpportunityAfterDiscounts({
    this.estimatedMonthlySavings,
    this.savingsOpportunityPercentage,
  });

  factory ECSSavingsOpportunityAfterDiscounts.fromJson(
      Map<String, dynamic> json) {
    return ECSSavingsOpportunityAfterDiscounts(
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? ECSEstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
      savingsOpportunityPercentage:
          json['savingsOpportunityPercentage'] as double?,
    );
  }
}

enum ECSServiceLaunchType {
  ec2('EC2'),
  fargate('Fargate'),
  ;

  final String value;

  const ECSServiceLaunchType(this.value);

  static ECSServiceLaunchType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ECSServiceLaunchType'));
}

enum ECSServiceMetricName {
  cpu('Cpu'),
  memory('Memory'),
  ;

  final String value;

  const ECSServiceMetricName(this.value);

  static ECSServiceMetricName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ECSServiceMetricName'));
}

enum ECSServiceMetricStatistic {
  maximum('Maximum'),
  average('Average'),
  ;

  final String value;

  const ECSServiceMetricStatistic(this.value);

  static ECSServiceMetricStatistic fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ECSServiceMetricStatistic'));
}

/// Describes the projected metrics of an Amazon ECS service recommendation
/// option.
///
/// To determine the performance difference between your current Amazon ECS
/// service and the recommended option, compare the metric data of your service
/// against its projected metric data.
class ECSServiceProjectedMetric {
  /// The lower bound values for the projected metric.
  final List<double>? lowerBoundValues;

  /// The name of the projected metric.
  ///
  /// The following metrics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Cpu</code> — The percentage of allocated compute units that are
  /// currently in use on the service tasks.
  /// </li>
  /// <li>
  /// <code>Memory</code> — The percentage of memory that's currently in use on
  /// the service tasks.
  /// </li>
  /// </ul>
  final ECSServiceMetricName? name;

  /// The timestamps of the projected metric.
  final List<DateTime>? timestamps;

  /// The upper bound values for the projected metric.
  final List<double>? upperBoundValues;

  ECSServiceProjectedMetric({
    this.lowerBoundValues,
    this.name,
    this.timestamps,
    this.upperBoundValues,
  });

  factory ECSServiceProjectedMetric.fromJson(Map<String, dynamic> json) {
    return ECSServiceProjectedMetric(
      lowerBoundValues: (json['lowerBoundValues'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      name: (json['name'] as String?)?.let(ECSServiceMetricName.fromString),
      timestamps: (json['timestamps'] as List?)
          ?.nonNulls
          .map(nonNullableTimeStampFromJson)
          .toList(),
      upperBoundValues: (json['upperBoundValues'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
    );
  }
}

/// Describes the projected utilization metrics of an Amazon ECS service
/// recommendation option.
///
/// To determine the performance difference between your current Amazon ECS
/// service and the recommended option, compare the utilization metric data of
/// your service against its projected utilization metric data.
class ECSServiceProjectedUtilizationMetric {
  /// The lower bound values for the projected utilization metrics.
  final double? lowerBoundValue;

  /// The name of the projected utilization metric.
  ///
  /// The following utilization metrics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Cpu</code> — The percentage of allocated compute units that are
  /// currently in use on the service tasks.
  /// </li>
  /// <li>
  /// <code>Memory</code> — The percentage of memory that's currently in use on
  /// the service tasks.
  /// </li>
  /// </ul>
  final ECSServiceMetricName? name;

  /// The statistic of the projected utilization metric.
  ///
  /// The Compute Optimizer API, Command Line Interface (CLI), and SDKs return
  /// utilization metrics using only the <code>Maximum</code> statistic, which is
  /// the highest value observed during the specified period.
  ///
  /// The Compute Optimizer console displays graphs for some utilization metrics
  /// using the <code>Average</code> statistic, which is the value of
  /// <code>Sum</code> / <code>SampleCount</code> during the specified period. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html">Viewing
  /// resource recommendations</a> in the <i>Compute Optimizer User Guide</i>. You
  /// can also get averaged utilization metric data for your resources using
  /// Amazon CloudWatch. For more information, see the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html">Amazon
  /// CloudWatch User Guide</a>.
  final ECSServiceMetricStatistic? statistic;

  /// The upper bound values for the projected utilization metrics.
  final double? upperBoundValue;

  ECSServiceProjectedUtilizationMetric({
    this.lowerBoundValue,
    this.name,
    this.statistic,
    this.upperBoundValue,
  });

  factory ECSServiceProjectedUtilizationMetric.fromJson(
      Map<String, dynamic> json) {
    return ECSServiceProjectedUtilizationMetric(
      lowerBoundValue: json['lowerBoundValue'] as double?,
      name: (json['name'] as String?)?.let(ECSServiceMetricName.fromString),
      statistic: (json['statistic'] as String?)
          ?.let(ECSServiceMetricStatistic.fromString),
      upperBoundValue: json['upperBoundValue'] as double?,
    );
  }
}

/// Describes an Amazon ECS service recommendation.
class ECSServiceRecommendation {
  /// The Amazon Web Services account ID of the Amazon ECS service.
  final String? accountId;

  /// The risk of the current Amazon ECS service not meeting the performance needs
  /// of its workloads. The higher the risk, the more likely the current service
  /// can't meet the performance requirements of its workload.
  final CurrentPerformanceRisk? currentPerformanceRisk;

  /// The configuration of the current Amazon ECS service.
  final ServiceConfiguration? currentServiceConfiguration;

  /// Describes the effective recommendation preferences for Amazon ECS services.
  final ECSEffectiveRecommendationPreferences?
      effectiveRecommendationPreferences;

  /// The finding classification of an Amazon ECS service.
  ///
  /// Findings for Amazon ECS services include:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>Underprovisioned</code> </b> — When Compute Optimizer detects that
  /// there’s not enough memory or CPU, an Amazon ECS service is considered
  /// under-provisioned. An under-provisioned service might result in poor
  /// application performance.
  /// </li>
  /// <li>
  /// <b> <code>Overprovisioned</code> </b> — When Compute Optimizer detects that
  /// there’s excessive memory or CPU, an Amazon ECS service is considered
  /// over-provisioned. An over-provisioned service might result in additional
  /// infrastructure costs.
  /// </li>
  /// <li>
  /// <b> <code>Optimized</code> </b> — When both the CPU and memory of your
  /// Amazon ECS service meet the performance requirements of your workload, the
  /// service is considered optimized.
  /// </li>
  /// </ul>
  final ECSServiceRecommendationFinding? finding;

  /// The reason for the finding classification of an Amazon ECS service.
  ///
  /// Finding reason codes for Amazon ECS services include:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>CPUUnderprovisioned</code> </b> — The service CPU configuration
  /// can be sized up to enhance the performance of your workload. This is
  /// identified by analyzing the <code>CPUUtilization</code> metric of the
  /// current service during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>CPUOverprovisioned</code> </b> — The service CPU configuration can
  /// be sized down while still meeting the performance requirements of your
  /// workload. This is identified by analyzing the <code>CPUUtilization</code>
  /// metric of the current service during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>MemoryUnderprovisioned</code> </b> — The service memory
  /// configuration can be sized up to enhance the performance of your workload.
  /// This is identified by analyzing the <code>MemoryUtilization</code> metric of
  /// the current service during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>MemoryOverprovisioned</code> </b> — The service memory
  /// configuration can be sized down while still meeting the performance
  /// requirements of your workload. This is identified by analyzing the
  /// <code>MemoryUtilization</code> metric of the current service during the
  /// look-back period.
  /// </li>
  /// </ul>
  final List<ECSServiceRecommendationFindingReasonCode>? findingReasonCodes;

  /// The timestamp of when the Amazon ECS service recommendation was last
  /// generated.
  final DateTime? lastRefreshTimestamp;

  /// The launch type the Amazon ECS service is using.
  /// <note>
  /// Compute Optimizer only supports the Fargate launch type.
  /// </note>
  final ECSServiceLaunchType? launchType;

  /// The number of days the Amazon ECS service utilization metrics were analyzed.
  final double? lookbackPeriodInDays;

  /// The Amazon Resource Name (ARN) of the current Amazon ECS service.
  ///
  /// The following is the format of the ARN:
  ///
  /// <code>arn:aws:ecs:region:aws_account_id:service/cluster-name/service-name</code>
  final String? serviceArn;

  /// An array of objects that describe the recommendation options for the Amazon
  /// ECS service.
  final List<ECSServiceRecommendationOption>? serviceRecommendationOptions;

  /// A list of tags assigned to your Amazon ECS service recommendations.
  final List<Tag>? tags;

  /// An array of objects that describe the utilization metrics of the Amazon ECS
  /// service.
  final List<ECSServiceUtilizationMetric>? utilizationMetrics;

  ECSServiceRecommendation({
    this.accountId,
    this.currentPerformanceRisk,
    this.currentServiceConfiguration,
    this.effectiveRecommendationPreferences,
    this.finding,
    this.findingReasonCodes,
    this.lastRefreshTimestamp,
    this.launchType,
    this.lookbackPeriodInDays,
    this.serviceArn,
    this.serviceRecommendationOptions,
    this.tags,
    this.utilizationMetrics,
  });

  factory ECSServiceRecommendation.fromJson(Map<String, dynamic> json) {
    return ECSServiceRecommendation(
      accountId: json['accountId'] as String?,
      currentPerformanceRisk: (json['currentPerformanceRisk'] as String?)
          ?.let(CurrentPerformanceRisk.fromString),
      currentServiceConfiguration: json['currentServiceConfiguration'] != null
          ? ServiceConfiguration.fromJson(
              json['currentServiceConfiguration'] as Map<String, dynamic>)
          : null,
      effectiveRecommendationPreferences:
          json['effectiveRecommendationPreferences'] != null
              ? ECSEffectiveRecommendationPreferences.fromJson(
                  json['effectiveRecommendationPreferences']
                      as Map<String, dynamic>)
              : null,
      finding: (json['finding'] as String?)
          ?.let(ECSServiceRecommendationFinding.fromString),
      findingReasonCodes: (json['findingReasonCodes'] as List?)
          ?.nonNulls
          .map((e) => ECSServiceRecommendationFindingReasonCode.fromString(
              (e as String)))
          .toList(),
      lastRefreshTimestamp: timeStampFromJson(json['lastRefreshTimestamp']),
      launchType:
          (json['launchType'] as String?)?.let(ECSServiceLaunchType.fromString),
      lookbackPeriodInDays: json['lookbackPeriodInDays'] as double?,
      serviceArn: json['serviceArn'] as String?,
      serviceRecommendationOptions:
          (json['serviceRecommendationOptions'] as List?)
              ?.nonNulls
              .map((e) => ECSServiceRecommendationOption.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      utilizationMetrics: (json['utilizationMetrics'] as List?)
          ?.nonNulls
          .map((e) =>
              ECSServiceUtilizationMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Describes a filter that returns a more specific list of Amazon ECS service
/// recommendations. Use this filter with the
/// <a>GetECSServiceRecommendations</a> action.
class ECSServiceRecommendationFilter {
  /// The name of the filter.
  ///
  /// Specify <code>Finding</code> to return recommendations with a specific
  /// finding classification.
  ///
  /// Specify <code>FindingReasonCode</code> to return recommendations with a
  /// specific finding reason code.
  ///
  /// You can filter your Amazon ECS service recommendations by
  /// <code>tag:key</code> and <code>tag-key</code> tags.
  ///
  /// A <code>tag:key</code> is a key and value combination of a tag assigned to
  /// your Amazon ECS service recommendations. Use the tag key in the filter name
  /// and the tag value as the filter value. For example, to find all Amazon ECS
  /// service recommendations that have a tag with the key of <code>Owner</code>
  /// and the value of <code>TeamA</code>, specify <code>tag:Owner</code> for the
  /// filter name and <code>TeamA</code> for the filter value.
  ///
  /// A <code>tag-key</code> is the key of a tag assigned to your Amazon ECS
  /// service recommendations. Use this filter to find all of your Amazon ECS
  /// service recommendations that have a tag with a specific key. This doesn’t
  /// consider the tag value. For example, you can find your Amazon ECS service
  /// recommendations with a tag key value of <code>Owner</code> or without any
  /// tag keys assigned.
  final ECSServiceRecommendationFilterName? name;

  /// The value of the filter.
  ///
  /// The valid values for this parameter are as follows:
  ///
  /// <ul>
  /// <li>
  /// If you specify the <code>name</code> parameter as <code>Finding</code>,
  /// specify <code>Optimized</code>, <code>NotOptimized</code>, or
  /// <code>Unavailable</code>.
  /// </li>
  /// <li>
  /// If you specify the <code>name</code> parameter as
  /// <code>FindingReasonCode</code>, specify <code>CPUUnderprovisioned</code>,
  /// <code>CPUOverprovisioned</code>, <code>MemoryUnderprovisioned</code>, or
  /// <code>MemoryOverprovisioned</code>.
  /// </li>
  /// </ul>
  final List<String>? values;

  ECSServiceRecommendationFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

enum ECSServiceRecommendationFilterName {
  finding('Finding'),
  findingReasonCode('FindingReasonCode'),
  ;

  final String value;

  const ECSServiceRecommendationFilterName(this.value);

  static ECSServiceRecommendationFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ECSServiceRecommendationFilterName'));
}

enum ECSServiceRecommendationFinding {
  optimized('Optimized'),
  underprovisioned('Underprovisioned'),
  overprovisioned('Overprovisioned'),
  ;

  final String value;

  const ECSServiceRecommendationFinding(this.value);

  static ECSServiceRecommendationFinding fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ECSServiceRecommendationFinding'));
}

enum ECSServiceRecommendationFindingReasonCode {
  memoryOverprovisioned('MemoryOverprovisioned'),
  memoryUnderprovisioned('MemoryUnderprovisioned'),
  cPUOverprovisioned('CPUOverprovisioned'),
  cPUUnderprovisioned('CPUUnderprovisioned'),
  ;

  final String value;

  const ECSServiceRecommendationFindingReasonCode(this.value);

  static ECSServiceRecommendationFindingReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ECSServiceRecommendationFindingReasonCode'));
}

/// Describes the recommendation options for an Amazon ECS service.
class ECSServiceRecommendationOption {
  /// The CPU and memory size recommendations for the containers within the task
  /// of your Amazon ECS service.
  final List<ContainerRecommendation>? containerRecommendations;

  /// The CPU size of the Amazon ECS service recommendation option.
  final int? cpu;

  /// The memory size of the Amazon ECS service recommendation option.
  final int? memory;

  /// An array of objects that describe the projected utilization metrics of the
  /// Amazon ECS service recommendation option.
  final List<ECSServiceProjectedUtilizationMetric>? projectedUtilizationMetrics;
  final SavingsOpportunity? savingsOpportunity;

  /// Describes the savings opportunity for Amazon ECS service recommendations or
  /// for the recommendation option.
  ///
  /// Savings opportunity represents the estimated monthly savings after applying
  /// Savings Plans discounts. You can achieve this by implementing a given
  /// Compute Optimizer recommendation.
  final ECSSavingsOpportunityAfterDiscounts? savingsOpportunityAfterDiscounts;

  ECSServiceRecommendationOption({
    this.containerRecommendations,
    this.cpu,
    this.memory,
    this.projectedUtilizationMetrics,
    this.savingsOpportunity,
    this.savingsOpportunityAfterDiscounts,
  });

  factory ECSServiceRecommendationOption.fromJson(Map<String, dynamic> json) {
    return ECSServiceRecommendationOption(
      containerRecommendations: (json['containerRecommendations'] as List?)
          ?.nonNulls
          .map((e) =>
              ContainerRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      cpu: json['cpu'] as int?,
      memory: json['memory'] as int?,
      projectedUtilizationMetrics:
          (json['projectedUtilizationMetrics'] as List?)
              ?.nonNulls
              .map((e) => ECSServiceProjectedUtilizationMetric.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      savingsOpportunity: json['savingsOpportunity'] != null
          ? SavingsOpportunity.fromJson(
              json['savingsOpportunity'] as Map<String, dynamic>)
          : null,
      savingsOpportunityAfterDiscounts:
          json['savingsOpportunityAfterDiscounts'] != null
              ? ECSSavingsOpportunityAfterDiscounts.fromJson(
                  json['savingsOpportunityAfterDiscounts']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

/// Describes the projected metrics of an Amazon ECS service recommendation
/// option.
///
/// To determine the performance difference between your current Amazon ECS
/// service and the recommended option, compare the metric data of your service
/// against its projected metric data.
class ECSServiceRecommendedOptionProjectedMetric {
  /// An array of objects that describe the projected metric.
  final List<ECSServiceProjectedMetric>? projectedMetrics;

  /// The recommended CPU size for the Amazon ECS service.
  final int? recommendedCpuUnits;

  /// The recommended memory size for the Amazon ECS service.
  final int? recommendedMemorySize;

  ECSServiceRecommendedOptionProjectedMetric({
    this.projectedMetrics,
    this.recommendedCpuUnits,
    this.recommendedMemorySize,
  });

  factory ECSServiceRecommendedOptionProjectedMetric.fromJson(
      Map<String, dynamic> json) {
    return ECSServiceRecommendedOptionProjectedMetric(
      projectedMetrics: (json['projectedMetrics'] as List?)
          ?.nonNulls
          .map((e) =>
              ECSServiceProjectedMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendedCpuUnits: json['recommendedCpuUnits'] as int?,
      recommendedMemorySize: json['recommendedMemorySize'] as int?,
    );
  }
}

/// Describes the utilization metric of an Amazon ECS service.
///
/// To determine the performance difference between your current Amazon ECS
/// service and the recommended option, compare the utilization metric data of
/// your service against its projected utilization metric data.
class ECSServiceUtilizationMetric {
  /// The name of the utilization metric.
  ///
  /// The following utilization metrics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Cpu</code> — The amount of CPU capacity that's used in the service.
  /// </li>
  /// <li>
  /// <code>Memory</code> — The amount of memory that's used in the service.
  /// </li>
  /// </ul>
  final ECSServiceMetricName? name;

  /// The statistic of the utilization metric.
  ///
  /// The Compute Optimizer API, Command Line Interface (CLI), and SDKs return
  /// utilization metrics using only the <code>Maximum</code> statistic, which is
  /// the highest value observed during the specified period.
  ///
  /// The Compute Optimizer console displays graphs for some utilization metrics
  /// using the <code>Average</code> statistic, which is the value of
  /// <code>Sum</code> / <code>SampleCount</code> during the specified period. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html">Viewing
  /// resource recommendations</a> in the <i>Compute Optimizer User Guide</i>. You
  /// can also get averaged utilization metric data for your resources using
  /// Amazon CloudWatch. For more information, see the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html">Amazon
  /// CloudWatch User Guide</a>.
  final ECSServiceMetricStatistic? statistic;

  /// The value of the utilization metric.
  final double? value;

  ECSServiceUtilizationMetric({
    this.name,
    this.statistic,
    this.value,
  });

  factory ECSServiceUtilizationMetric.fromJson(Map<String, dynamic> json) {
    return ECSServiceUtilizationMetric(
      name: (json['name'] as String?)?.let(ECSServiceMetricName.fromString),
      statistic: (json['statistic'] as String?)
          ?.let(ECSServiceMetricStatistic.fromString),
      value: json['value'] as double?,
    );
  }
}

/// Describes the effective preferred resources that Compute Optimizer considers
/// as rightsizing recommendation candidates.
/// <note>
/// Compute Optimizer only supports Amazon EC2 instance types.
/// </note>
class EffectivePreferredResource {
  /// The expanded version of your preferred resource's include list.
  final List<String>? effectiveIncludeList;

  /// The list of preferred resources values that you want excluded from
  /// rightsizing recommendation candidates.
  final List<String>? excludeList;

  /// The list of preferred resource values that you want considered as
  /// rightsizing recommendation candidates.
  final List<String>? includeList;

  /// The name of the preferred resource list.
  final PreferredResourceName? name;

  EffectivePreferredResource({
    this.effectiveIncludeList,
    this.excludeList,
    this.includeList,
    this.name,
  });

  factory EffectivePreferredResource.fromJson(Map<String, dynamic> json) {
    return EffectivePreferredResource(
      effectiveIncludeList: (json['effectiveIncludeList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      excludeList: (json['excludeList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      includeList: (json['includeList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      name: (json['name'] as String?)?.let(PreferredResourceName.fromString),
    );
  }
}

/// Describes the effective recommendation preferences for a resource.
class EffectiveRecommendationPreferences {
  /// Describes the CPU vendor and architecture for an instance or Auto Scaling
  /// group recommendations.
  ///
  /// For example, when you specify <code>AWS_ARM64</code> with:
  ///
  /// <ul>
  /// <li>
  /// A <a>GetEC2InstanceRecommendations</a> or
  /// <a>GetAutoScalingGroupRecommendations</a> request, Compute Optimizer returns
  /// recommendations that consist of Graviton2 instance types only.
  /// </li>
  /// <li>
  /// A <a>GetEC2RecommendationProjectedMetrics</a> request, Compute Optimizer
  /// returns projected utilization metrics for Graviton2 instance type
  /// recommendations only.
  /// </li>
  /// <li>
  /// A <a>ExportEC2InstanceRecommendations</a> or
  /// <a>ExportAutoScalingGroupRecommendations</a> request, Compute Optimizer
  /// exports recommendations that consist of Graviton2 instance types only.
  /// </li>
  /// </ul>
  final List<CpuVendorArchitecture>? cpuVendorArchitectures;

  /// Describes the activation status of the enhanced infrastructure metrics
  /// preference.
  ///
  /// A status of <code>Active</code> confirms that the preference is applied in
  /// the latest recommendation refresh, and a status of <code>Inactive</code>
  /// confirms that it's not yet applied to recommendations.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html">Enhanced
  /// infrastructure metrics</a> in the <i>Compute Optimizer User Guide</i>.
  final EnhancedInfrastructureMetrics? enhancedInfrastructureMetrics;

  /// An object that describes the external metrics recommendation preference.
  ///
  /// If the preference is applied in the latest recommendation refresh, an object
  /// with a valid <code>source</code> value appears in the response. If the
  /// preference isn't applied to the recommendations already, then this object
  /// doesn't appear in the response.
  final ExternalMetricsPreference? externalMetricsPreference;

  /// Describes the activation status of the inferred workload types preference.
  ///
  /// A status of <code>Active</code> confirms that the preference is applied in
  /// the latest recommendation refresh. A status of <code>Inactive</code>
  /// confirms that it's not yet applied to recommendations.
  final InferredWorkloadTypesPreference? inferredWorkloadTypes;

  /// The number of days the utilization metrics of the Amazon Web Services
  /// resource are analyzed.
  final LookBackPeriodPreference? lookBackPeriod;

  /// The resource type values that are considered as candidates when generating
  /// rightsizing recommendations.
  final List<EffectivePreferredResource>? preferredResources;

  /// Describes the savings estimation mode applied for calculating savings
  /// opportunity for a resource.
  final InstanceSavingsEstimationMode? savingsEstimationMode;

  /// The resource’s CPU and memory utilization preferences, such as threshold and
  /// headroom, that are used to generate rightsizing recommendations.
  /// <note>
  /// This preference is only available for the Amazon EC2 instance resource type.
  /// </note>
  final List<UtilizationPreference>? utilizationPreferences;

  EffectiveRecommendationPreferences({
    this.cpuVendorArchitectures,
    this.enhancedInfrastructureMetrics,
    this.externalMetricsPreference,
    this.inferredWorkloadTypes,
    this.lookBackPeriod,
    this.preferredResources,
    this.savingsEstimationMode,
    this.utilizationPreferences,
  });

  factory EffectiveRecommendationPreferences.fromJson(
      Map<String, dynamic> json) {
    return EffectiveRecommendationPreferences(
      cpuVendorArchitectures: (json['cpuVendorArchitectures'] as List?)
          ?.nonNulls
          .map((e) => CpuVendorArchitecture.fromString((e as String)))
          .toList(),
      enhancedInfrastructureMetrics:
          (json['enhancedInfrastructureMetrics'] as String?)
              ?.let(EnhancedInfrastructureMetrics.fromString),
      externalMetricsPreference: json['externalMetricsPreference'] != null
          ? ExternalMetricsPreference.fromJson(
              json['externalMetricsPreference'] as Map<String, dynamic>)
          : null,
      inferredWorkloadTypes: (json['inferredWorkloadTypes'] as String?)
          ?.let(InferredWorkloadTypesPreference.fromString),
      lookBackPeriod: (json['lookBackPeriod'] as String?)
          ?.let(LookBackPeriodPreference.fromString),
      preferredResources: (json['preferredResources'] as List?)
          ?.nonNulls
          .map((e) =>
              EffectivePreferredResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      savingsEstimationMode: json['savingsEstimationMode'] != null
          ? InstanceSavingsEstimationMode.fromJson(
              json['savingsEstimationMode'] as Map<String, dynamic>)
          : null,
      utilizationPreferences: (json['utilizationPreferences'] as List?)
          ?.nonNulls
          .map((e) => UtilizationPreference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum EnhancedInfrastructureMetrics {
  active('Active'),
  inactive('Inactive'),
  ;

  final String value;

  const EnhancedInfrastructureMetrics(this.value);

  static EnhancedInfrastructureMetrics fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum EnhancedInfrastructureMetrics'));
}

/// Describes a filter that returns a more specific list of account enrollment
/// statuses. Use this filter with the
/// <a>GetEnrollmentStatusesForOrganization</a> action.
class EnrollmentFilter {
  /// The name of the filter.
  ///
  /// Specify <code>Status</code> to return accounts with a specific enrollment
  /// status (for example, <code>Active</code>).
  final EnrollmentFilterName? name;

  /// The value of the filter.
  ///
  /// The valid values are <code>Active</code>, <code>Inactive</code>,
  /// <code>Pending</code>, and <code>Failed</code>.
  final List<String>? values;

  EnrollmentFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

enum EnrollmentFilterName {
  status('Status'),
  ;

  final String value;

  const EnrollmentFilterName(this.value);

  static EnrollmentFilterName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum EnrollmentFilterName'));
}

/// Describes the estimated monthly savings amount possible, based on On-Demand
/// instance pricing, by adopting Compute Optimizer recommendations for a given
/// resource.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/view-ec2-recommendations.html#ec2-savings-calculation">Estimated
/// monthly savings and savings opportunities</a> in the <i>Compute Optimizer
/// User Guide</i>.
class EstimatedMonthlySavings {
  /// The currency of the estimated monthly savings.
  final Currency? currency;

  /// The value of the estimated monthly savings.
  final double? value;

  EstimatedMonthlySavings({
    this.currency,
    this.value,
  });

  factory EstimatedMonthlySavings.fromJson(Map<String, dynamic> json) {
    return EstimatedMonthlySavings(
      currency: (json['currency'] as String?)?.let(Currency.fromString),
      value: json['value'] as double?,
    );
  }
}

class ExportAutoScalingGroupRecommendationsResponse {
  /// The identification number of the export job.
  ///
  /// Use the <a>DescribeRecommendationExportJobs</a> action, and specify the job
  /// ID to view the status of an export job.
  final String? jobId;

  /// An object that describes the destination Amazon S3 bucket of a
  /// recommendations export file.
  final S3Destination? s3Destination;

  ExportAutoScalingGroupRecommendationsResponse({
    this.jobId,
    this.s3Destination,
  });

  factory ExportAutoScalingGroupRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ExportAutoScalingGroupRecommendationsResponse(
      jobId: json['jobId'] as String?,
      s3Destination: json['s3Destination'] != null
          ? S3Destination.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Describes the destination of the recommendations export and metadata files.
class ExportDestination {
  /// An object that describes the destination Amazon Simple Storage Service
  /// (Amazon S3) bucket name and object keys of a recommendations export file,
  /// and its associated metadata file.
  final S3Destination? s3;

  ExportDestination({
    this.s3,
  });

  factory ExportDestination.fromJson(Map<String, dynamic> json) {
    return ExportDestination(
      s3: json['s3'] != null
          ? S3Destination.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }
}

class ExportEBSVolumeRecommendationsResponse {
  /// The identification number of the export job.
  ///
  /// Use the <a>DescribeRecommendationExportJobs</a> action, and specify the job
  /// ID to view the status of an export job.
  final String? jobId;
  final S3Destination? s3Destination;

  ExportEBSVolumeRecommendationsResponse({
    this.jobId,
    this.s3Destination,
  });

  factory ExportEBSVolumeRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ExportEBSVolumeRecommendationsResponse(
      jobId: json['jobId'] as String?,
      s3Destination: json['s3Destination'] != null
          ? S3Destination.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
    );
  }
}

class ExportEC2InstanceRecommendationsResponse {
  /// The identification number of the export job.
  ///
  /// Use the <a>DescribeRecommendationExportJobs</a> action, and specify the job
  /// ID to view the status of an export job.
  final String? jobId;

  /// An object that describes the destination Amazon S3 bucket of a
  /// recommendations export file.
  final S3Destination? s3Destination;

  ExportEC2InstanceRecommendationsResponse({
    this.jobId,
    this.s3Destination,
  });

  factory ExportEC2InstanceRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ExportEC2InstanceRecommendationsResponse(
      jobId: json['jobId'] as String?,
      s3Destination: json['s3Destination'] != null
          ? S3Destination.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
    );
  }
}

class ExportECSServiceRecommendationsResponse {
  /// The identification number of the export job.
  ///
  /// To view the status of an export job, use the
  /// <a>DescribeRecommendationExportJobs</a> action and specify the job ID.
  final String? jobId;
  final S3Destination? s3Destination;

  ExportECSServiceRecommendationsResponse({
    this.jobId,
    this.s3Destination,
  });

  factory ExportECSServiceRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ExportECSServiceRecommendationsResponse(
      jobId: json['jobId'] as String?,
      s3Destination: json['s3Destination'] != null
          ? S3Destination.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
    );
  }
}

class ExportLambdaFunctionRecommendationsResponse {
  /// The identification number of the export job.
  ///
  /// Use the <a>DescribeRecommendationExportJobs</a> action, and specify the job
  /// ID to view the status of an export job.
  final String? jobId;
  final S3Destination? s3Destination;

  ExportLambdaFunctionRecommendationsResponse({
    this.jobId,
    this.s3Destination,
  });

  factory ExportLambdaFunctionRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ExportLambdaFunctionRecommendationsResponse(
      jobId: json['jobId'] as String?,
      s3Destination: json['s3Destination'] != null
          ? S3Destination.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
    );
  }
}

class ExportLicenseRecommendationsResponse {
  /// The identification number of the export job.
  ///
  /// To view the status of an export job, use the
  /// <a>DescribeRecommendationExportJobs</a> action and specify the job ID.
  final String? jobId;
  final S3Destination? s3Destination;

  ExportLicenseRecommendationsResponse({
    this.jobId,
    this.s3Destination,
  });

  factory ExportLicenseRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ExportLicenseRecommendationsResponse(
      jobId: json['jobId'] as String?,
      s3Destination: json['s3Destination'] != null
          ? S3Destination.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum ExportableAutoScalingGroupField {
  accountId('AccountId'),
  autoScalingGroupArn('AutoScalingGroupArn'),
  autoScalingGroupName('AutoScalingGroupName'),
  finding('Finding'),
  utilizationMetricsCpuMaximum('UtilizationMetricsCpuMaximum'),
  utilizationMetricsMemoryMaximum('UtilizationMetricsMemoryMaximum'),
  utilizationMetricsEbsReadOpsPerSecondMaximum(
      'UtilizationMetricsEbsReadOpsPerSecondMaximum'),
  utilizationMetricsEbsWriteOpsPerSecondMaximum(
      'UtilizationMetricsEbsWriteOpsPerSecondMaximum'),
  utilizationMetricsEbsReadBytesPerSecondMaximum(
      'UtilizationMetricsEbsReadBytesPerSecondMaximum'),
  utilizationMetricsEbsWriteBytesPerSecondMaximum(
      'UtilizationMetricsEbsWriteBytesPerSecondMaximum'),
  utilizationMetricsDiskReadOpsPerSecondMaximum(
      'UtilizationMetricsDiskReadOpsPerSecondMaximum'),
  utilizationMetricsDiskWriteOpsPerSecondMaximum(
      'UtilizationMetricsDiskWriteOpsPerSecondMaximum'),
  utilizationMetricsDiskReadBytesPerSecondMaximum(
      'UtilizationMetricsDiskReadBytesPerSecondMaximum'),
  utilizationMetricsDiskWriteBytesPerSecondMaximum(
      'UtilizationMetricsDiskWriteBytesPerSecondMaximum'),
  utilizationMetricsNetworkInBytesPerSecondMaximum(
      'UtilizationMetricsNetworkInBytesPerSecondMaximum'),
  utilizationMetricsNetworkOutBytesPerSecondMaximum(
      'UtilizationMetricsNetworkOutBytesPerSecondMaximum'),
  utilizationMetricsNetworkPacketsInPerSecondMaximum(
      'UtilizationMetricsNetworkPacketsInPerSecondMaximum'),
  utilizationMetricsNetworkPacketsOutPerSecondMaximum(
      'UtilizationMetricsNetworkPacketsOutPerSecondMaximum'),
  lookbackPeriodInDays('LookbackPeriodInDays'),
  currentConfigurationInstanceType('CurrentConfigurationInstanceType'),
  currentConfigurationDesiredCapacity('CurrentConfigurationDesiredCapacity'),
  currentConfigurationMinSize('CurrentConfigurationMinSize'),
  currentConfigurationMaxSize('CurrentConfigurationMaxSize'),
  currentOnDemandPrice('CurrentOnDemandPrice'),
  currentStandardOneYearNoUpfrontReservedPrice(
      'CurrentStandardOneYearNoUpfrontReservedPrice'),
  currentStandardThreeYearNoUpfrontReservedPrice(
      'CurrentStandardThreeYearNoUpfrontReservedPrice'),
  currentVCpus('CurrentVCpus'),
  currentMemory('CurrentMemory'),
  currentStorage('CurrentStorage'),
  currentNetwork('CurrentNetwork'),
  recommendationOptionsConfigurationInstanceType(
      'RecommendationOptionsConfigurationInstanceType'),
  recommendationOptionsConfigurationDesiredCapacity(
      'RecommendationOptionsConfigurationDesiredCapacity'),
  recommendationOptionsConfigurationMinSize(
      'RecommendationOptionsConfigurationMinSize'),
  recommendationOptionsConfigurationMaxSize(
      'RecommendationOptionsConfigurationMaxSize'),
  recommendationOptionsProjectedUtilizationMetricsCpuMaximum(
      'RecommendationOptionsProjectedUtilizationMetricsCpuMaximum'),
  recommendationOptionsProjectedUtilizationMetricsMemoryMaximum(
      'RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum'),
  recommendationOptionsPerformanceRisk('RecommendationOptionsPerformanceRisk'),
  recommendationOptionsOnDemandPrice('RecommendationOptionsOnDemandPrice'),
  recommendationOptionsStandardOneYearNoUpfrontReservedPrice(
      'RecommendationOptionsStandardOneYearNoUpfrontReservedPrice'),
  recommendationOptionsStandardThreeYearNoUpfrontReservedPrice(
      'RecommendationOptionsStandardThreeYearNoUpfrontReservedPrice'),
  recommendationOptionsVcpus('RecommendationOptionsVcpus'),
  recommendationOptionsMemory('RecommendationOptionsMemory'),
  recommendationOptionsStorage('RecommendationOptionsStorage'),
  recommendationOptionsNetwork('RecommendationOptionsNetwork'),
  lastRefreshTimestamp('LastRefreshTimestamp'),
  currentPerformanceRisk('CurrentPerformanceRisk'),
  recommendationOptionsSavingsOpportunityPercentage(
      'RecommendationOptionsSavingsOpportunityPercentage'),
  recommendationOptionsEstimatedMonthlySavingsCurrency(
      'RecommendationOptionsEstimatedMonthlySavingsCurrency'),
  recommendationOptionsEstimatedMonthlySavingsValue(
      'RecommendationOptionsEstimatedMonthlySavingsValue'),
  effectiveRecommendationPreferencesCpuVendorArchitectures(
      'EffectiveRecommendationPreferencesCpuVendorArchitectures'),
  effectiveRecommendationPreferencesEnhancedInfrastructureMetrics(
      'EffectiveRecommendationPreferencesEnhancedInfrastructureMetrics'),
  effectiveRecommendationPreferencesInferredWorkloadTypes(
      'EffectiveRecommendationPreferencesInferredWorkloadTypes'),
  inferredWorkloadTypes('InferredWorkloadTypes'),
  recommendationOptionsMigrationEffort('RecommendationOptionsMigrationEffort'),
  currentInstanceGpuInfo('CurrentInstanceGpuInfo'),
  recommendationOptionsInstanceGpuInfo('RecommendationOptionsInstanceGpuInfo'),
  utilizationMetricsGpuPercentageMaximum(
      'UtilizationMetricsGpuPercentageMaximum'),
  utilizationMetricsGpuMemoryPercentageMaximum(
      'UtilizationMetricsGpuMemoryPercentageMaximum'),
  recommendationOptionsProjectedUtilizationMetricsGpuPercentageMaximum(
      'RecommendationOptionsProjectedUtilizationMetricsGpuPercentageMaximum'),
  recommendationOptionsProjectedUtilizationMetricsGpuMemoryPercentageMaximum(
      'RecommendationOptionsProjectedUtilizationMetricsGpuMemoryPercentageMaximum'),
  effectiveRecommendationPreferencesSavingsEstimationMode(
      'EffectiveRecommendationPreferencesSavingsEstimationMode'),
  recommendationOptionsSavingsOpportunityAfterDiscountsPercentage(
      'RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage'),
  recommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts(
      'RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts'),
  recommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts(
      'RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts'),
  effectiveRecommendationPreferencesPreferredResources(
      'EffectiveRecommendationPreferencesPreferredResources'),
  effectiveRecommendationPreferencesLookBackPeriod(
      'EffectiveRecommendationPreferencesLookBackPeriod'),
  ;

  final String value;

  const ExportableAutoScalingGroupField(this.value);

  static ExportableAutoScalingGroupField fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ExportableAutoScalingGroupField'));
}

enum ExportableECSServiceField {
  accountId('AccountId'),
  serviceArn('ServiceArn'),
  lookbackPeriodInDays('LookbackPeriodInDays'),
  lastRefreshTimestamp('LastRefreshTimestamp'),
  launchType('LaunchType'),
  currentPerformanceRisk('CurrentPerformanceRisk'),
  currentServiceConfigurationMemory('CurrentServiceConfigurationMemory'),
  currentServiceConfigurationCpu('CurrentServiceConfigurationCpu'),
  currentServiceConfigurationTaskDefinitionArn(
      'CurrentServiceConfigurationTaskDefinitionArn'),
  currentServiceConfigurationAutoScalingConfiguration(
      'CurrentServiceConfigurationAutoScalingConfiguration'),
  currentServiceContainerConfigurations(
      'CurrentServiceContainerConfigurations'),
  utilizationMetricsCpuMaximum('UtilizationMetricsCpuMaximum'),
  utilizationMetricsMemoryMaximum('UtilizationMetricsMemoryMaximum'),
  finding('Finding'),
  findingReasonCodes('FindingReasonCodes'),
  recommendationOptionsMemory('RecommendationOptionsMemory'),
  recommendationOptionsCpu('RecommendationOptionsCpu'),
  recommendationOptionsSavingsOpportunityPercentage(
      'RecommendationOptionsSavingsOpportunityPercentage'),
  recommendationOptionsEstimatedMonthlySavingsCurrency(
      'RecommendationOptionsEstimatedMonthlySavingsCurrency'),
  recommendationOptionsEstimatedMonthlySavingsValue(
      'RecommendationOptionsEstimatedMonthlySavingsValue'),
  recommendationOptionsContainerRecommendations(
      'RecommendationOptionsContainerRecommendations'),
  recommendationOptionsProjectedUtilizationMetricsCpuMaximum(
      'RecommendationOptionsProjectedUtilizationMetricsCpuMaximum'),
  recommendationOptionsProjectedUtilizationMetricsMemoryMaximum(
      'RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum'),
  tags('Tags'),
  effectiveRecommendationPreferencesSavingsEstimationMode(
      'EffectiveRecommendationPreferencesSavingsEstimationMode'),
  recommendationOptionsSavingsOpportunityAfterDiscountsPercentage(
      'RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage'),
  recommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts(
      'RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts'),
  recommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts(
      'RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts'),
  ;

  final String value;

  const ExportableECSServiceField(this.value);

  static ExportableECSServiceField fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ExportableECSServiceField'));
}

enum ExportableInstanceField {
  accountId('AccountId'),
  instanceArn('InstanceArn'),
  instanceName('InstanceName'),
  finding('Finding'),
  findingReasonCodes('FindingReasonCodes'),
  lookbackPeriodInDays('LookbackPeriodInDays'),
  currentInstanceType('CurrentInstanceType'),
  utilizationMetricsCpuMaximum('UtilizationMetricsCpuMaximum'),
  utilizationMetricsMemoryMaximum('UtilizationMetricsMemoryMaximum'),
  utilizationMetricsEbsReadOpsPerSecondMaximum(
      'UtilizationMetricsEbsReadOpsPerSecondMaximum'),
  utilizationMetricsEbsWriteOpsPerSecondMaximum(
      'UtilizationMetricsEbsWriteOpsPerSecondMaximum'),
  utilizationMetricsEbsReadBytesPerSecondMaximum(
      'UtilizationMetricsEbsReadBytesPerSecondMaximum'),
  utilizationMetricsEbsWriteBytesPerSecondMaximum(
      'UtilizationMetricsEbsWriteBytesPerSecondMaximum'),
  utilizationMetricsDiskReadOpsPerSecondMaximum(
      'UtilizationMetricsDiskReadOpsPerSecondMaximum'),
  utilizationMetricsDiskWriteOpsPerSecondMaximum(
      'UtilizationMetricsDiskWriteOpsPerSecondMaximum'),
  utilizationMetricsDiskReadBytesPerSecondMaximum(
      'UtilizationMetricsDiskReadBytesPerSecondMaximum'),
  utilizationMetricsDiskWriteBytesPerSecondMaximum(
      'UtilizationMetricsDiskWriteBytesPerSecondMaximum'),
  utilizationMetricsNetworkInBytesPerSecondMaximum(
      'UtilizationMetricsNetworkInBytesPerSecondMaximum'),
  utilizationMetricsNetworkOutBytesPerSecondMaximum(
      'UtilizationMetricsNetworkOutBytesPerSecondMaximum'),
  utilizationMetricsNetworkPacketsInPerSecondMaximum(
      'UtilizationMetricsNetworkPacketsInPerSecondMaximum'),
  utilizationMetricsNetworkPacketsOutPerSecondMaximum(
      'UtilizationMetricsNetworkPacketsOutPerSecondMaximum'),
  currentOnDemandPrice('CurrentOnDemandPrice'),
  currentStandardOneYearNoUpfrontReservedPrice(
      'CurrentStandardOneYearNoUpfrontReservedPrice'),
  currentStandardThreeYearNoUpfrontReservedPrice(
      'CurrentStandardThreeYearNoUpfrontReservedPrice'),
  currentVCpus('CurrentVCpus'),
  currentMemory('CurrentMemory'),
  currentStorage('CurrentStorage'),
  currentNetwork('CurrentNetwork'),
  recommendationOptionsInstanceType('RecommendationOptionsInstanceType'),
  recommendationOptionsProjectedUtilizationMetricsCpuMaximum(
      'RecommendationOptionsProjectedUtilizationMetricsCpuMaximum'),
  recommendationOptionsProjectedUtilizationMetricsMemoryMaximum(
      'RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum'),
  recommendationOptionsPlatformDifferences(
      'RecommendationOptionsPlatformDifferences'),
  recommendationOptionsPerformanceRisk('RecommendationOptionsPerformanceRisk'),
  recommendationOptionsVcpus('RecommendationOptionsVcpus'),
  recommendationOptionsMemory('RecommendationOptionsMemory'),
  recommendationOptionsStorage('RecommendationOptionsStorage'),
  recommendationOptionsNetwork('RecommendationOptionsNetwork'),
  recommendationOptionsOnDemandPrice('RecommendationOptionsOnDemandPrice'),
  recommendationOptionsStandardOneYearNoUpfrontReservedPrice(
      'RecommendationOptionsStandardOneYearNoUpfrontReservedPrice'),
  recommendationOptionsStandardThreeYearNoUpfrontReservedPrice(
      'RecommendationOptionsStandardThreeYearNoUpfrontReservedPrice'),
  recommendationsSourcesRecommendationSourceArn(
      'RecommendationsSourcesRecommendationSourceArn'),
  recommendationsSourcesRecommendationSourceType(
      'RecommendationsSourcesRecommendationSourceType'),
  lastRefreshTimestamp('LastRefreshTimestamp'),
  currentPerformanceRisk('CurrentPerformanceRisk'),
  recommendationOptionsSavingsOpportunityPercentage(
      'RecommendationOptionsSavingsOpportunityPercentage'),
  recommendationOptionsEstimatedMonthlySavingsCurrency(
      'RecommendationOptionsEstimatedMonthlySavingsCurrency'),
  recommendationOptionsEstimatedMonthlySavingsValue(
      'RecommendationOptionsEstimatedMonthlySavingsValue'),
  effectiveRecommendationPreferencesCpuVendorArchitectures(
      'EffectiveRecommendationPreferencesCpuVendorArchitectures'),
  effectiveRecommendationPreferencesEnhancedInfrastructureMetrics(
      'EffectiveRecommendationPreferencesEnhancedInfrastructureMetrics'),
  effectiveRecommendationPreferencesInferredWorkloadTypes(
      'EffectiveRecommendationPreferencesInferredWorkloadTypes'),
  inferredWorkloadTypes('InferredWorkloadTypes'),
  recommendationOptionsMigrationEffort('RecommendationOptionsMigrationEffort'),
  effectiveRecommendationPreferencesExternalMetricsSource(
      'EffectiveRecommendationPreferencesExternalMetricsSource'),
  instanceState('InstanceState'),
  tags('Tags'),
  externalMetricStatusCode('ExternalMetricStatusCode'),
  externalMetricStatusReason('ExternalMetricStatusReason'),
  currentInstanceGpuInfo('CurrentInstanceGpuInfo'),
  recommendationOptionsInstanceGpuInfo('RecommendationOptionsInstanceGpuInfo'),
  utilizationMetricsGpuPercentageMaximum(
      'UtilizationMetricsGpuPercentageMaximum'),
  utilizationMetricsGpuMemoryPercentageMaximum(
      'UtilizationMetricsGpuMemoryPercentageMaximum'),
  recommendationOptionsProjectedUtilizationMetricsGpuPercentageMaximum(
      'RecommendationOptionsProjectedUtilizationMetricsGpuPercentageMaximum'),
  recommendationOptionsProjectedUtilizationMetricsGpuMemoryPercentageMaximum(
      'RecommendationOptionsProjectedUtilizationMetricsGpuMemoryPercentageMaximum'),
  idle('Idle'),
  effectiveRecommendationPreferencesPreferredResources(
      'EffectiveRecommendationPreferencesPreferredResources'),
  effectiveRecommendationPreferencesLookBackPeriod(
      'EffectiveRecommendationPreferencesLookBackPeriod'),
  effectiveRecommendationPreferencesUtilizationPreferences(
      'EffectiveRecommendationPreferencesUtilizationPreferences'),
  effectiveRecommendationPreferencesSavingsEstimationMode(
      'EffectiveRecommendationPreferencesSavingsEstimationMode'),
  recommendationOptionsSavingsOpportunityAfterDiscountsPercentage(
      'RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage'),
  recommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts(
      'RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts'),
  recommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts(
      'RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts'),
  ;

  final String value;

  const ExportableInstanceField(this.value);

  static ExportableInstanceField fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ExportableInstanceField'));
}

enum ExportableLambdaFunctionField {
  accountId('AccountId'),
  functionArn('FunctionArn'),
  functionVersion('FunctionVersion'),
  finding('Finding'),
  findingReasonCodes('FindingReasonCodes'),
  numberOfInvocations('NumberOfInvocations'),
  utilizationMetricsDurationMaximum('UtilizationMetricsDurationMaximum'),
  utilizationMetricsDurationAverage('UtilizationMetricsDurationAverage'),
  utilizationMetricsMemoryMaximum('UtilizationMetricsMemoryMaximum'),
  utilizationMetricsMemoryAverage('UtilizationMetricsMemoryAverage'),
  lookbackPeriodInDays('LookbackPeriodInDays'),
  currentConfigurationMemorySize('CurrentConfigurationMemorySize'),
  currentConfigurationTimeout('CurrentConfigurationTimeout'),
  currentCostTotal('CurrentCostTotal'),
  currentCostAverage('CurrentCostAverage'),
  recommendationOptionsConfigurationMemorySize(
      'RecommendationOptionsConfigurationMemorySize'),
  recommendationOptionsCostLow('RecommendationOptionsCostLow'),
  recommendationOptionsCostHigh('RecommendationOptionsCostHigh'),
  recommendationOptionsProjectedUtilizationMetricsDurationLowerBound(
      'RecommendationOptionsProjectedUtilizationMetricsDurationLowerBound'),
  recommendationOptionsProjectedUtilizationMetricsDurationUpperBound(
      'RecommendationOptionsProjectedUtilizationMetricsDurationUpperBound'),
  recommendationOptionsProjectedUtilizationMetricsDurationExpected(
      'RecommendationOptionsProjectedUtilizationMetricsDurationExpected'),
  lastRefreshTimestamp('LastRefreshTimestamp'),
  currentPerformanceRisk('CurrentPerformanceRisk'),
  recommendationOptionsSavingsOpportunityPercentage(
      'RecommendationOptionsSavingsOpportunityPercentage'),
  recommendationOptionsEstimatedMonthlySavingsCurrency(
      'RecommendationOptionsEstimatedMonthlySavingsCurrency'),
  recommendationOptionsEstimatedMonthlySavingsValue(
      'RecommendationOptionsEstimatedMonthlySavingsValue'),
  tags('Tags'),
  effectiveRecommendationPreferencesSavingsEstimationMode(
      'EffectiveRecommendationPreferencesSavingsEstimationMode'),
  recommendationOptionsSavingsOpportunityAfterDiscountsPercentage(
      'RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage'),
  recommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts(
      'RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts'),
  recommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts(
      'RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts'),
  ;

  final String value;

  const ExportableLambdaFunctionField(this.value);

  static ExportableLambdaFunctionField fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ExportableLambdaFunctionField'));
}

enum ExportableLicenseField {
  accountId('AccountId'),
  resourceArn('ResourceArn'),
  lookbackPeriodInDays('LookbackPeriodInDays'),
  lastRefreshTimestamp('LastRefreshTimestamp'),
  finding('Finding'),
  findingReasonCodes('FindingReasonCodes'),
  currentLicenseConfigurationNumberOfCores(
      'CurrentLicenseConfigurationNumberOfCores'),
  currentLicenseConfigurationInstanceType(
      'CurrentLicenseConfigurationInstanceType'),
  currentLicenseConfigurationOperatingSystem(
      'CurrentLicenseConfigurationOperatingSystem'),
  currentLicenseConfigurationLicenseName(
      'CurrentLicenseConfigurationLicenseName'),
  currentLicenseConfigurationLicenseEdition(
      'CurrentLicenseConfigurationLicenseEdition'),
  currentLicenseConfigurationLicenseModel(
      'CurrentLicenseConfigurationLicenseModel'),
  currentLicenseConfigurationLicenseVersion(
      'CurrentLicenseConfigurationLicenseVersion'),
  currentLicenseConfigurationMetricsSource(
      'CurrentLicenseConfigurationMetricsSource'),
  recommendationOptionsOperatingSystem('RecommendationOptionsOperatingSystem'),
  recommendationOptionsLicenseEdition('RecommendationOptionsLicenseEdition'),
  recommendationOptionsLicenseModel('RecommendationOptionsLicenseModel'),
  recommendationOptionsSavingsOpportunityPercentage(
      'RecommendationOptionsSavingsOpportunityPercentage'),
  recommendationOptionsEstimatedMonthlySavingsCurrency(
      'RecommendationOptionsEstimatedMonthlySavingsCurrency'),
  recommendationOptionsEstimatedMonthlySavingsValue(
      'RecommendationOptionsEstimatedMonthlySavingsValue'),
  tags('Tags'),
  ;

  final String value;

  const ExportableLicenseField(this.value);

  static ExportableLicenseField fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ExportableLicenseField'));
}

enum ExportableVolumeField {
  accountId('AccountId'),
  volumeArn('VolumeArn'),
  finding('Finding'),
  utilizationMetricsVolumeReadOpsPerSecondMaximum(
      'UtilizationMetricsVolumeReadOpsPerSecondMaximum'),
  utilizationMetricsVolumeWriteOpsPerSecondMaximum(
      'UtilizationMetricsVolumeWriteOpsPerSecondMaximum'),
  utilizationMetricsVolumeReadBytesPerSecondMaximum(
      'UtilizationMetricsVolumeReadBytesPerSecondMaximum'),
  utilizationMetricsVolumeWriteBytesPerSecondMaximum(
      'UtilizationMetricsVolumeWriteBytesPerSecondMaximum'),
  lookbackPeriodInDays('LookbackPeriodInDays'),
  currentConfigurationVolumeType('CurrentConfigurationVolumeType'),
  currentConfigurationVolumeBaselineIOPS(
      'CurrentConfigurationVolumeBaselineIOPS'),
  currentConfigurationVolumeBaselineThroughput(
      'CurrentConfigurationVolumeBaselineThroughput'),
  currentConfigurationVolumeBurstIOPS('CurrentConfigurationVolumeBurstIOPS'),
  currentConfigurationVolumeBurstThroughput(
      'CurrentConfigurationVolumeBurstThroughput'),
  currentConfigurationVolumeSize('CurrentConfigurationVolumeSize'),
  currentMonthlyPrice('CurrentMonthlyPrice'),
  recommendationOptionsConfigurationVolumeType(
      'RecommendationOptionsConfigurationVolumeType'),
  recommendationOptionsConfigurationVolumeBaselineIOPS(
      'RecommendationOptionsConfigurationVolumeBaselineIOPS'),
  recommendationOptionsConfigurationVolumeBaselineThroughput(
      'RecommendationOptionsConfigurationVolumeBaselineThroughput'),
  recommendationOptionsConfigurationVolumeBurstIOPS(
      'RecommendationOptionsConfigurationVolumeBurstIOPS'),
  recommendationOptionsConfigurationVolumeBurstThroughput(
      'RecommendationOptionsConfigurationVolumeBurstThroughput'),
  recommendationOptionsConfigurationVolumeSize(
      'RecommendationOptionsConfigurationVolumeSize'),
  recommendationOptionsMonthlyPrice('RecommendationOptionsMonthlyPrice'),
  recommendationOptionsPerformanceRisk('RecommendationOptionsPerformanceRisk'),
  lastRefreshTimestamp('LastRefreshTimestamp'),
  currentPerformanceRisk('CurrentPerformanceRisk'),
  recommendationOptionsSavingsOpportunityPercentage(
      'RecommendationOptionsSavingsOpportunityPercentage'),
  recommendationOptionsEstimatedMonthlySavingsCurrency(
      'RecommendationOptionsEstimatedMonthlySavingsCurrency'),
  recommendationOptionsEstimatedMonthlySavingsValue(
      'RecommendationOptionsEstimatedMonthlySavingsValue'),
  rootVolume('RootVolume'),
  tags('Tags'),
  currentConfigurationRootVolume('CurrentConfigurationRootVolume'),
  effectiveRecommendationPreferencesSavingsEstimationMode(
      'EffectiveRecommendationPreferencesSavingsEstimationMode'),
  recommendationOptionsSavingsOpportunityAfterDiscountsPercentage(
      'RecommendationOptionsSavingsOpportunityAfterDiscountsPercentage'),
  recommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts(
      'RecommendationOptionsEstimatedMonthlySavingsCurrencyAfterDiscounts'),
  recommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts(
      'RecommendationOptionsEstimatedMonthlySavingsValueAfterDiscounts'),
  ;

  final String value;

  const ExportableVolumeField(this.value);

  static ExportableVolumeField fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ExportableVolumeField'));
}

/// Describes Compute Optimizer's integration status with your chosen external
/// metric provider. For example, Datadog.
class ExternalMetricStatus {
  /// The status code for Compute Optimizer's integration with an external metrics
  /// provider.
  final ExternalMetricStatusCode? statusCode;

  /// The reason for Compute Optimizer's integration status with your external
  /// metric provider.
  final String? statusReason;

  ExternalMetricStatus({
    this.statusCode,
    this.statusReason,
  });

  factory ExternalMetricStatus.fromJson(Map<String, dynamic> json) {
    return ExternalMetricStatus(
      statusCode: (json['statusCode'] as String?)
          ?.let(ExternalMetricStatusCode.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }
}

enum ExternalMetricStatusCode {
  noExternalMetricSet('NO_EXTERNAL_METRIC_SET'),
  integrationSuccess('INTEGRATION_SUCCESS'),
  datadogIntegrationError('DATADOG_INTEGRATION_ERROR'),
  dynatraceIntegrationError('DYNATRACE_INTEGRATION_ERROR'),
  newrelicIntegrationError('NEWRELIC_INTEGRATION_ERROR'),
  instanaIntegrationError('INSTANA_INTEGRATION_ERROR'),
  insufficientDatadogMetrics('INSUFFICIENT_DATADOG_METRICS'),
  insufficientDynatraceMetrics('INSUFFICIENT_DYNATRACE_METRICS'),
  insufficientNewrelicMetrics('INSUFFICIENT_NEWRELIC_METRICS'),
  insufficientInstanaMetrics('INSUFFICIENT_INSTANA_METRICS'),
  ;

  final String value;

  const ExternalMetricStatusCode(this.value);

  static ExternalMetricStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ExternalMetricStatusCode'));
}

/// Describes the external metrics preferences for EC2 rightsizing
/// recommendations.
class ExternalMetricsPreference {
  /// Contains the source options for external metrics preferences.
  final ExternalMetricsSource? source;

  ExternalMetricsPreference({
    this.source,
  });

  factory ExternalMetricsPreference.fromJson(Map<String, dynamic> json) {
    return ExternalMetricsPreference(
      source:
          (json['source'] as String?)?.let(ExternalMetricsSource.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    return {
      if (source != null) 'source': source.value,
    };
  }
}

enum ExternalMetricsSource {
  datadog('Datadog'),
  dynatrace('Dynatrace'),
  newRelic('NewRelic'),
  instana('Instana'),
  ;

  final String value;

  const ExternalMetricsSource(this.value);

  static ExternalMetricsSource fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ExternalMetricsSource'));
}

enum FileFormat {
  csv('Csv'),
  ;

  final String value;

  const FileFormat(this.value);

  static FileFormat fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum FileFormat'));
}

/// Describes a filter that returns a more specific list of recommendations. Use
/// this filter with the <a>GetAutoScalingGroupRecommendations</a> and
/// <a>GetEC2InstanceRecommendations</a> actions.
///
/// You can use <code>EBSFilter</code> with the
/// <a>GetEBSVolumeRecommendations</a> action,
/// <code>LambdaFunctionRecommendationFilter</code> with the
/// <a>GetLambdaFunctionRecommendations</a> action, and <code>JobFilter</code>
/// with the <a>DescribeRecommendationExportJobs</a> action.
class Filter {
  /// The name of the filter.
  ///
  /// Specify <code>Finding</code> to return recommendations with a specific
  /// finding classification. For example, <code>Underprovisioned</code>.
  ///
  /// Specify <code>RecommendationSourceType</code> to return recommendations of a
  /// specific resource type. For example, <code>Ec2Instance</code>.
  ///
  /// Specify <code>FindingReasonCodes</code> to return recommendations with a
  /// specific finding reason code. For example, <code>CPUUnderprovisioned</code>.
  ///
  /// Specify <code>InferredWorkloadTypes</code> to return recommendations of a
  /// specific inferred workload. For example, <code>Redis</code>.
  ///
  /// You can filter your EC2 instance recommendations by <code>tag:key</code> and
  /// <code>tag-key</code> tags.
  ///
  /// A <code>tag:key</code> is a key and value combination of a tag assigned to
  /// your recommendations. Use the tag key in the filter name and the tag value
  /// as the filter value. For example, to find all recommendations that have a
  /// tag with the key of <code>Owner</code> and the value of <code>TeamA</code>,
  /// specify <code>tag:Owner</code> for the filter name and <code>TeamA</code>
  /// for the filter value.
  ///
  /// A <code>tag-key</code> is the key of a tag assigned to your recommendations.
  /// Use this filter to find all of your recommendations that have a tag with a
  /// specific key. This doesn’t consider the tag value. For example, you can find
  /// your recommendations with a tag key value of <code>Owner</code> or without
  /// any tag keys assigned.
  final FilterName? name;

  /// The value of the filter.
  ///
  /// The valid values for this parameter are as follows, depending on what you
  /// specify for the <code>name</code> parameter and the resource type that you
  /// wish to filter results for:
  ///
  /// <ul>
  /// <li>
  /// Specify <code>Optimized</code> or <code>NotOptimized</code> if you specify
  /// the <code>name</code> parameter as <code>Finding</code> and you want to
  /// filter results for Auto Scaling groups.
  /// </li>
  /// <li>
  /// Specify <code>Underprovisioned</code>, <code>Overprovisioned</code>, or
  /// <code>Optimized</code> if you specify the <code>name</code> parameter as
  /// <code>Finding</code> and you want to filter results for EC2 instances.
  /// </li>
  /// <li>
  /// Specify <code>Ec2Instance</code> or <code>AutoScalingGroup</code> if you
  /// specify the <code>name</code> parameter as
  /// <code>RecommendationSourceType</code>.
  /// </li>
  /// <li>
  /// Specify one of the following options if you specify the <code>name</code>
  /// parameter as <code>FindingReasonCodes</code>:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>CPUOverprovisioned</code> </b> — The instance’s CPU configuration
  /// can be sized down while still meeting the performance requirements of your
  /// workload.
  /// </li>
  /// <li>
  /// <b> <code>CPUUnderprovisioned</code> </b> — The instance’s CPU configuration
  /// doesn't meet the performance requirements of your workload and there is an
  /// alternative instance type that provides better CPU performance.
  /// </li>
  /// <li>
  /// <b> <code>MemoryOverprovisioned</code> </b> — The instance’s memory
  /// configuration can be sized down while still meeting the performance
  /// requirements of your workload.
  /// </li>
  /// <li>
  /// <b> <code>MemoryUnderprovisioned</code> </b> — The instance’s memory
  /// configuration doesn't meet the performance requirements of your workload and
  /// there is an alternative instance type that provides better memory
  /// performance.
  /// </li>
  /// <li>
  /// <b> <code>EBSThroughputOverprovisioned</code> </b> — The instance’s EBS
  /// throughput configuration can be sized down while still meeting the
  /// performance requirements of your workload.
  /// </li>
  /// <li>
  /// <b> <code>EBSThroughputUnderprovisioned</code> </b> — The instance’s EBS
  /// throughput configuration doesn't meet the performance requirements of your
  /// workload and there is an alternative instance type that provides better EBS
  /// throughput performance.
  /// </li>
  /// <li>
  /// <b> <code>EBSIOPSOverprovisioned</code> </b> — The instance’s EBS IOPS
  /// configuration can be sized down while still meeting the performance
  /// requirements of your workload.
  /// </li>
  /// <li>
  /// <b> <code>EBSIOPSUnderprovisioned</code> </b> — The instance’s EBS IOPS
  /// configuration doesn't meet the performance requirements of your workload and
  /// there is an alternative instance type that provides better EBS IOPS
  /// performance.
  /// </li>
  /// <li>
  /// <b> <code>NetworkBandwidthOverprovisioned</code> </b> — The instance’s
  /// network bandwidth configuration can be sized down while still meeting the
  /// performance requirements of your workload.
  /// </li>
  /// <li>
  /// <b> <code>NetworkBandwidthUnderprovisioned</code> </b> — The instance’s
  /// network bandwidth configuration doesn't meet the performance requirements of
  /// your workload and there is an alternative instance type that provides better
  /// network bandwidth performance. This finding reason happens when the
  /// <code>NetworkIn</code> or <code>NetworkOut</code> performance of an instance
  /// is impacted.
  /// </li>
  /// <li>
  /// <b> <code>NetworkPPSOverprovisioned</code> </b> — The instance’s network PPS
  /// (packets per second) configuration can be sized down while still meeting the
  /// performance requirements of your workload.
  /// </li>
  /// <li>
  /// <b> <code>NetworkPPSUnderprovisioned</code> </b> — The instance’s network
  /// PPS (packets per second) configuration doesn't meet the performance
  /// requirements of your workload and there is an alternative instance type that
  /// provides better network PPS performance.
  /// </li>
  /// <li>
  /// <b> <code>DiskIOPSOverprovisioned</code> </b> — The instance’s disk IOPS
  /// configuration can be sized down while still meeting the performance
  /// requirements of your workload.
  /// </li>
  /// <li>
  /// <b> <code>DiskIOPSUnderprovisioned</code> </b> — The instance’s disk IOPS
  /// configuration doesn't meet the performance requirements of your workload and
  /// there is an alternative instance type that provides better disk IOPS
  /// performance.
  /// </li>
  /// <li>
  /// <b> <code>DiskThroughputOverprovisioned</code> </b> — The instance’s disk
  /// throughput configuration can be sized down while still meeting the
  /// performance requirements of your workload.
  /// </li>
  /// <li>
  /// <b> <code>DiskThroughputUnderprovisioned</code> </b> — The instance’s disk
  /// throughput configuration doesn't meet the performance requirements of your
  /// workload and there is an alternative instance type that provides better disk
  /// throughput performance.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final List<String>? values;

  Filter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

enum FilterName {
  finding('Finding'),
  findingReasonCodes('FindingReasonCodes'),
  recommendationSourceType('RecommendationSourceType'),
  inferredWorkloadTypes('InferredWorkloadTypes'),
  ;

  final String value;

  const FilterName(this.value);

  static FilterName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum FilterName'));
}

enum Finding {
  underprovisioned('Underprovisioned'),
  overprovisioned('Overprovisioned'),
  optimized('Optimized'),
  notOptimized('NotOptimized'),
  ;

  final String value;

  const Finding(this.value);

  static Finding fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Finding'));
}

enum FindingReasonCode {
  memoryOverprovisioned('MemoryOverprovisioned'),
  memoryUnderprovisioned('MemoryUnderprovisioned'),
  ;

  final String value;

  const FindingReasonCode(this.value);

  static FindingReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum FindingReasonCode'));
}

class GetAutoScalingGroupRecommendationsResponse {
  /// An array of objects that describe Auto Scaling group recommendations.
  final List<AutoScalingGroupRecommendation>? autoScalingGroupRecommendations;

  /// An array of objects that describe errors of the request.
  ///
  /// For example, an error is returned if you request recommendations for an
  /// unsupported Auto Scaling group.
  final List<GetRecommendationError>? errors;

  /// The token to use to advance to the next page of Auto Scaling group
  /// recommendations.
  ///
  /// This value is null when there are no more pages of Auto Scaling group
  /// recommendations to return.
  final String? nextToken;

  GetAutoScalingGroupRecommendationsResponse({
    this.autoScalingGroupRecommendations,
    this.errors,
    this.nextToken,
  });

  factory GetAutoScalingGroupRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAutoScalingGroupRecommendationsResponse(
      autoScalingGroupRecommendations:
          (json['autoScalingGroupRecommendations'] as List?)
              ?.nonNulls
              .map((e) => AutoScalingGroupRecommendation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map(
              (e) => GetRecommendationError.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class GetEBSVolumeRecommendationsResponse {
  /// An array of objects that describe errors of the request.
  ///
  /// For example, an error is returned if you request recommendations for an
  /// unsupported volume.
  final List<GetRecommendationError>? errors;

  /// The token to use to advance to the next page of volume recommendations.
  ///
  /// This value is null when there are no more pages of volume recommendations to
  /// return.
  final String? nextToken;

  /// An array of objects that describe volume recommendations.
  final List<VolumeRecommendation>? volumeRecommendations;

  GetEBSVolumeRecommendationsResponse({
    this.errors,
    this.nextToken,
    this.volumeRecommendations,
  });

  factory GetEBSVolumeRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEBSVolumeRecommendationsResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map(
              (e) => GetRecommendationError.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      volumeRecommendations: (json['volumeRecommendations'] as List?)
          ?.nonNulls
          .map((e) => VolumeRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetEC2InstanceRecommendationsResponse {
  /// An array of objects that describe errors of the request.
  ///
  /// For example, an error is returned if you request recommendations for an
  /// instance of an unsupported instance family.
  final List<GetRecommendationError>? errors;

  /// An array of objects that describe instance recommendations.
  final List<InstanceRecommendation>? instanceRecommendations;

  /// The token to use to advance to the next page of instance recommendations.
  ///
  /// This value is null when there are no more pages of instance recommendations
  /// to return.
  final String? nextToken;

  GetEC2InstanceRecommendationsResponse({
    this.errors,
    this.instanceRecommendations,
    this.nextToken,
  });

  factory GetEC2InstanceRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEC2InstanceRecommendationsResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map(
              (e) => GetRecommendationError.fromJson(e as Map<String, dynamic>))
          .toList(),
      instanceRecommendations: (json['instanceRecommendations'] as List?)
          ?.nonNulls
          .map(
              (e) => InstanceRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class GetEC2RecommendationProjectedMetricsResponse {
  /// An array of objects that describes projected metrics.
  final List<RecommendedOptionProjectedMetric>?
      recommendedOptionProjectedMetrics;

  GetEC2RecommendationProjectedMetricsResponse({
    this.recommendedOptionProjectedMetrics,
  });

  factory GetEC2RecommendationProjectedMetricsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEC2RecommendationProjectedMetricsResponse(
      recommendedOptionProjectedMetrics:
          (json['recommendedOptionProjectedMetrics'] as List?)
              ?.nonNulls
              .map((e) => RecommendedOptionProjectedMetric.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class GetECSServiceRecommendationProjectedMetricsResponse {
  /// An array of objects that describes the projected metrics.
  final List<ECSServiceRecommendedOptionProjectedMetric>?
      recommendedOptionProjectedMetrics;

  GetECSServiceRecommendationProjectedMetricsResponse({
    this.recommendedOptionProjectedMetrics,
  });

  factory GetECSServiceRecommendationProjectedMetricsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetECSServiceRecommendationProjectedMetricsResponse(
      recommendedOptionProjectedMetrics:
          (json['recommendedOptionProjectedMetrics'] as List?)
              ?.nonNulls
              .map((e) => ECSServiceRecommendedOptionProjectedMetric.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class GetECSServiceRecommendationsResponse {
  /// An array of objects that describe the Amazon ECS service recommendations.
  final List<ECSServiceRecommendation>? ecsServiceRecommendations;

  /// An array of objects that describe errors of the request.
  final List<GetRecommendationError>? errors;

  /// The token to advance to the next page of Amazon ECS service recommendations.
  final String? nextToken;

  GetECSServiceRecommendationsResponse({
    this.ecsServiceRecommendations,
    this.errors,
    this.nextToken,
  });

  factory GetECSServiceRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetECSServiceRecommendationsResponse(
      ecsServiceRecommendations: (json['ecsServiceRecommendations'] as List?)
          ?.nonNulls
          .map((e) =>
              ECSServiceRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map(
              (e) => GetRecommendationError.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class GetEffectiveRecommendationPreferencesResponse {
  /// The status of the enhanced infrastructure metrics recommendation preference.
  /// Considers all applicable preferences that you might have set at the
  /// resource, account, and organization level.
  ///
  /// A status of <code>Active</code> confirms that the preference is applied in
  /// the latest recommendation refresh, and a status of <code>Inactive</code>
  /// confirms that it's not yet applied to recommendations.
  ///
  /// To validate whether the preference is applied to your last generated set of
  /// recommendations, review the <code>effectiveRecommendationPreferences</code>
  /// value in the response of the <a>GetAutoScalingGroupRecommendations</a> and
  /// <a>GetEC2InstanceRecommendations</a> actions.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html">Enhanced
  /// infrastructure metrics</a> in the <i>Compute Optimizer User Guide</i>.
  final EnhancedInfrastructureMetrics? enhancedInfrastructureMetrics;

  /// The provider of the external metrics recommendation preference. Considers
  /// all applicable preferences that you might have set at the account and
  /// organization level.
  ///
  /// If the preference is applied in the latest recommendation refresh, an object
  /// with a valid <code>source</code> value appears in the response. If the
  /// preference isn't applied to the recommendations already, then this object
  /// doesn't appear in the response.
  ///
  /// To validate whether the preference is applied to your last generated set of
  /// recommendations, review the <code>effectiveRecommendationPreferences</code>
  /// value in the response of the <a>GetEC2InstanceRecommendations</a> actions.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/external-metrics-ingestion.html">Enhanced
  /// infrastructure metrics</a> in the <i>Compute Optimizer User Guide</i>.
  final ExternalMetricsPreference? externalMetricsPreference;

  /// The number of days the utilization metrics of the Amazon Web Services
  /// resource are analyzed.
  ///
  /// To validate that the preference is applied to your last generated set of
  /// recommendations, review the <code>effectiveRecommendationPreferences</code>
  /// value in the response of the GetAutoScalingGroupRecommendations or
  /// GetEC2InstanceRecommendations actions.
  final LookBackPeriodPreference? lookBackPeriod;

  /// The resource type values that are considered as candidates when generating
  /// rightsizing recommendations. This object resolves any wildcard expressions
  /// and returns the effective list of candidate resource type values. It also
  /// considers all applicable preferences that you set at the resource, account,
  /// and organization level.
  ///
  /// To validate that the preference is applied to your last generated set of
  /// recommendations, review the <code>effectiveRecommendationPreferences</code>
  /// value in the response of the GetAutoScalingGroupRecommendations or
  /// GetEC2InstanceRecommendations actions.
  final List<EffectivePreferredResource>? preferredResources;

  /// The resource’s CPU and memory utilization preferences, such as threshold and
  /// headroom, that were used to generate rightsizing recommendations. It
  /// considers all applicable preferences that you set at the resource, account,
  /// and organization level.
  ///
  /// To validate that the preference is applied to your last generated set of
  /// recommendations, review the <code>effectiveRecommendationPreferences</code>
  /// value in the response of the GetAutoScalingGroupRecommendations or
  /// GetEC2InstanceRecommendations actions.
  final List<UtilizationPreference>? utilizationPreferences;

  GetEffectiveRecommendationPreferencesResponse({
    this.enhancedInfrastructureMetrics,
    this.externalMetricsPreference,
    this.lookBackPeriod,
    this.preferredResources,
    this.utilizationPreferences,
  });

  factory GetEffectiveRecommendationPreferencesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEffectiveRecommendationPreferencesResponse(
      enhancedInfrastructureMetrics:
          (json['enhancedInfrastructureMetrics'] as String?)
              ?.let(EnhancedInfrastructureMetrics.fromString),
      externalMetricsPreference: json['externalMetricsPreference'] != null
          ? ExternalMetricsPreference.fromJson(
              json['externalMetricsPreference'] as Map<String, dynamic>)
          : null,
      lookBackPeriod: (json['lookBackPeriod'] as String?)
          ?.let(LookBackPeriodPreference.fromString),
      preferredResources: (json['preferredResources'] as List?)
          ?.nonNulls
          .map((e) =>
              EffectivePreferredResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      utilizationPreferences: (json['utilizationPreferences'] as List?)
          ?.nonNulls
          .map((e) => UtilizationPreference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetEnrollmentStatusResponse {
  /// The Unix epoch timestamp, in seconds, of when the account enrollment status
  /// was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// Confirms the enrollment status of member accounts of the organization, if
  /// the account is a management account of an organization.
  final bool? memberAccountsEnrolled;

  /// The count of organization member accounts that are opted in to the service,
  /// if your account is an organization management account.
  final int? numberOfMemberAccountsOptedIn;

  /// The enrollment status of the account.
  final Status? status;

  /// The reason for the enrollment status of the account.
  ///
  /// For example, an account might show a status of <code>Pending</code> because
  /// member accounts of an organization require more time to be enrolled in the
  /// service.
  final String? statusReason;

  GetEnrollmentStatusResponse({
    this.lastUpdatedTimestamp,
    this.memberAccountsEnrolled,
    this.numberOfMemberAccountsOptedIn,
    this.status,
    this.statusReason,
  });

  factory GetEnrollmentStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetEnrollmentStatusResponse(
      lastUpdatedTimestamp: timeStampFromJson(json['lastUpdatedTimestamp']),
      memberAccountsEnrolled: json['memberAccountsEnrolled'] as bool?,
      numberOfMemberAccountsOptedIn:
          json['numberOfMemberAccountsOptedIn'] as int?,
      status: (json['status'] as String?)?.let(Status.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }
}

class GetEnrollmentStatusesForOrganizationResponse {
  /// An array of objects that describe the enrollment statuses of organization
  /// member accounts.
  final List<AccountEnrollmentStatus>? accountEnrollmentStatuses;

  /// The token to use to advance to the next page of account enrollment statuses.
  ///
  /// This value is null when there are no more pages of account enrollment
  /// statuses to return.
  final String? nextToken;

  GetEnrollmentStatusesForOrganizationResponse({
    this.accountEnrollmentStatuses,
    this.nextToken,
  });

  factory GetEnrollmentStatusesForOrganizationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEnrollmentStatusesForOrganizationResponse(
      accountEnrollmentStatuses: (json['accountEnrollmentStatuses'] as List?)
          ?.nonNulls
          .map((e) =>
              AccountEnrollmentStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class GetLambdaFunctionRecommendationsResponse {
  /// An array of objects that describe function recommendations.
  final List<LambdaFunctionRecommendation>? lambdaFunctionRecommendations;

  /// The token to use to advance to the next page of function recommendations.
  ///
  /// This value is null when there are no more pages of function recommendations
  /// to return.
  final String? nextToken;

  GetLambdaFunctionRecommendationsResponse({
    this.lambdaFunctionRecommendations,
    this.nextToken,
  });

  factory GetLambdaFunctionRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetLambdaFunctionRecommendationsResponse(
      lambdaFunctionRecommendations: (json['lambdaFunctionRecommendations']
              as List?)
          ?.nonNulls
          .map((e) =>
              LambdaFunctionRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class GetLicenseRecommendationsResponse {
  /// An array of objects that describe errors of the request.
  final List<GetRecommendationError>? errors;

  /// An array of objects that describe license recommendations.
  final List<LicenseRecommendation>? licenseRecommendations;

  /// The token to use to advance to the next page of license recommendations.
  final String? nextToken;

  GetLicenseRecommendationsResponse({
    this.errors,
    this.licenseRecommendations,
    this.nextToken,
  });

  factory GetLicenseRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetLicenseRecommendationsResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map(
              (e) => GetRecommendationError.fromJson(e as Map<String, dynamic>))
          .toList(),
      licenseRecommendations: (json['licenseRecommendations'] as List?)
          ?.nonNulls
          .map((e) => LicenseRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

/// Describes an error experienced when getting recommendations.
///
/// For example, an error is returned if you request recommendations for an
/// unsupported Auto Scaling group, or if you request recommendations for an
/// instance of an unsupported instance family.
class GetRecommendationError {
  /// The error code.
  final String? code;

  /// The ID of the error.
  final String? identifier;

  /// The message, or reason, for the error.
  final String? message;

  GetRecommendationError({
    this.code,
    this.identifier,
    this.message,
  });

  factory GetRecommendationError.fromJson(Map<String, dynamic> json) {
    return GetRecommendationError(
      code: json['code'] as String?,
      identifier: json['identifier'] as String?,
      message: json['message'] as String?,
    );
  }
}

class GetRecommendationPreferencesResponse {
  /// The token to use to advance to the next page of recommendation preferences.
  ///
  /// This value is null when there are no more pages of recommendation
  /// preferences to return.
  final String? nextToken;

  /// An array of objects that describe recommendation preferences.
  final List<RecommendationPreferencesDetail>? recommendationPreferencesDetails;

  GetRecommendationPreferencesResponse({
    this.nextToken,
    this.recommendationPreferencesDetails,
  });

  factory GetRecommendationPreferencesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRecommendationPreferencesResponse(
      nextToken: json['nextToken'] as String?,
      recommendationPreferencesDetails:
          (json['recommendationPreferencesDetails'] as List?)
              ?.nonNulls
              .map((e) => RecommendationPreferencesDetail.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class GetRecommendationSummariesResponse {
  /// The token to use to advance to the next page of recommendation summaries.
  ///
  /// This value is null when there are no more pages of recommendation summaries
  /// to return.
  final String? nextToken;

  /// An array of objects that summarize a recommendation.
  final List<RecommendationSummary>? recommendationSummaries;

  GetRecommendationSummariesResponse({
    this.nextToken,
    this.recommendationSummaries,
  });

  factory GetRecommendationSummariesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRecommendationSummariesResponse(
      nextToken: json['nextToken'] as String?,
      recommendationSummaries: (json['recommendationSummaries'] as List?)
          ?.nonNulls
          .map((e) => RecommendationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Describes the GPU accelerators for the instance type.
class Gpu {
  /// The number of GPUs for the instance type.
  final int? gpuCount;

  /// The total size of the memory for the GPU accelerators for the instance type,
  /// in MiB.
  final int? gpuMemorySizeInMiB;

  Gpu({
    this.gpuCount,
    this.gpuMemorySizeInMiB,
  });

  factory Gpu.fromJson(Map<String, dynamic> json) {
    return Gpu(
      gpuCount: json['gpuCount'] as int?,
      gpuMemorySizeInMiB: json['gpuMemorySizeInMiB'] as int?,
    );
  }
}

/// Describes the GPU accelerator settings for the instance type.
class GpuInfo {
  /// Describes the GPU accelerators for the instance type.
  final List<Gpu>? gpus;

  GpuInfo({
    this.gpus,
  });

  factory GpuInfo.fromJson(Map<String, dynamic> json) {
    return GpuInfo(
      gpus: (json['gpus'] as List?)
          ?.nonNulls
          .map((e) => Gpu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The estimated monthly savings after you adjust the configurations of your
/// instances running on the inferred workload types to the recommended
/// configurations. If the <code>inferredWorkloadTypes</code> list contains
/// multiple entries, then the savings are the sum of the monthly savings from
/// instances that run the exact combination of the inferred workload types.
class InferredWorkloadSaving {
  /// An object that describes the estimated monthly savings amount possible by
  /// adopting Compute Optimizer recommendations for a given resource. This is
  /// based on the On-Demand instance pricing.
  final EstimatedMonthlySavings? estimatedMonthlySavings;

  /// The applications that might be running on the instance as inferred by
  /// Compute Optimizer.
  ///
  /// Compute Optimizer can infer if one of the following applications might be
  /// running on the instance:
  ///
  /// <ul>
  /// <li>
  /// <code>AmazonEmr</code> - Infers that Amazon EMR might be running on the
  /// instance.
  /// </li>
  /// <li>
  /// <code>ApacheCassandra</code> - Infers that Apache Cassandra might be running
  /// on the instance.
  /// </li>
  /// <li>
  /// <code>ApacheHadoop</code> - Infers that Apache Hadoop might be running on
  /// the instance.
  /// </li>
  /// <li>
  /// <code>Memcached</code> - Infers that Memcached might be running on the
  /// instance.
  /// </li>
  /// <li>
  /// <code>NGINX</code> - Infers that NGINX might be running on the instance.
  /// </li>
  /// <li>
  /// <code>PostgreSql</code> - Infers that PostgreSQL might be running on the
  /// instance.
  /// </li>
  /// <li>
  /// <code>Redis</code> - Infers that Redis might be running on the instance.
  /// </li>
  /// <li>
  /// <code>Kafka</code> - Infers that Kafka might be running on the instance.
  /// </li>
  /// <li>
  /// <code>SQLServer</code> - Infers that SQLServer might be running on the
  /// instance.
  /// </li>
  /// </ul>
  final List<InferredWorkloadType>? inferredWorkloadTypes;

  InferredWorkloadSaving({
    this.estimatedMonthlySavings,
    this.inferredWorkloadTypes,
  });

  factory InferredWorkloadSaving.fromJson(Map<String, dynamic> json) {
    return InferredWorkloadSaving(
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? EstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
      inferredWorkloadTypes: (json['inferredWorkloadTypes'] as List?)
          ?.nonNulls
          .map((e) => InferredWorkloadType.fromString((e as String)))
          .toList(),
    );
  }
}

enum InferredWorkloadType {
  amazonEmr('AmazonEmr'),
  apacheCassandra('ApacheCassandra'),
  apacheHadoop('ApacheHadoop'),
  memcached('Memcached'),
  nginx('Nginx'),
  postgreSql('PostgreSql'),
  redis('Redis'),
  kafka('Kafka'),
  sQLServer('SQLServer'),
  ;

  final String value;

  const InferredWorkloadType(this.value);

  static InferredWorkloadType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum InferredWorkloadType'));
}

enum InferredWorkloadTypesPreference {
  active('Active'),
  inactive('Inactive'),
  ;

  final String value;

  const InferredWorkloadTypesPreference(this.value);

  static InferredWorkloadTypesPreference fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum InferredWorkloadTypesPreference'));
}

/// An object that describes the estimated monthly savings possible by adopting
/// Compute Optimizer’s Amazon EC2 instance recommendations. This is based on
/// the Savings Plans and Reserved Instances pricing discounts.
class InstanceEstimatedMonthlySavings {
  /// The currency of the estimated monthly savings.
  final Currency? currency;

  /// The value of the estimated monthly savings.
  final double? value;

  InstanceEstimatedMonthlySavings({
    this.currency,
    this.value,
  });

  factory InstanceEstimatedMonthlySavings.fromJson(Map<String, dynamic> json) {
    return InstanceEstimatedMonthlySavings(
      currency: (json['currency'] as String?)?.let(Currency.fromString),
      value: json['value'] as double?,
    );
  }
}

enum InstanceIdle {
  $true('True'),
  $false('False'),
  ;

  final String value;

  const InstanceIdle(this.value);

  static InstanceIdle fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum InstanceIdle'));
}

/// Describes an Amazon EC2 instance recommendation.
class InstanceRecommendation {
  /// The Amazon Web Services account ID of the instance.
  final String? accountId;

  /// Describes the GPU accelerator settings for the current instance type.
  final GpuInfo? currentInstanceGpuInfo;

  /// The instance type of the current instance.
  final String? currentInstanceType;

  /// The risk of the current instance not meeting the performance needs of its
  /// workloads. The higher the risk, the more likely the current instance cannot
  /// meet the performance requirements of its workload.
  final CurrentPerformanceRisk? currentPerformanceRisk;

  /// An object that describes the effective recommendation preferences for the
  /// instance.
  final EffectiveRecommendationPreferences? effectiveRecommendationPreferences;

  /// An object that describes Compute Optimizer's integration status with your
  /// external metrics provider.
  final ExternalMetricStatus? externalMetricStatus;

  /// The finding classification of the instance.
  ///
  /// Findings for instances include:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>Underprovisioned</code> </b>—An instance is considered
  /// under-provisioned when at least one specification of your instance, such as
  /// CPU, memory, or network, does not meet the performance requirements of your
  /// workload. Under-provisioned instances may lead to poor application
  /// performance.
  /// </li>
  /// <li>
  /// <b> <code>Overprovisioned</code> </b>—An instance is considered
  /// over-provisioned when at least one specification of your instance, such as
  /// CPU, memory, or network, can be sized down while still meeting the
  /// performance requirements of your workload, and no specification is
  /// under-provisioned. Over-provisioned instances may lead to unnecessary
  /// infrastructure cost.
  /// </li>
  /// <li>
  /// <b> <code>Optimized</code> </b>—An instance is considered optimized when all
  /// specifications of your instance, such as CPU, memory, and network, meet the
  /// performance requirements of your workload and is not over provisioned. For
  /// optimized resources, Compute Optimizer might recommend a new generation
  /// instance type.
  /// </li>
  /// </ul>
  final Finding? finding;

  /// The reason for the finding classification of the instance.
  ///
  /// Finding reason codes for instances include:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>CPUOverprovisioned</code> </b> — The instance’s CPU configuration
  /// can be sized down while still meeting the performance requirements of your
  /// workload. This is identified by analyzing the <code>CPUUtilization</code>
  /// metric of the current instance during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>CPUUnderprovisioned</code> </b> — The instance’s CPU configuration
  /// doesn't meet the performance requirements of your workload and there is an
  /// alternative instance type that provides better CPU performance. This is
  /// identified by analyzing the <code>CPUUtilization</code> metric of the
  /// current instance during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>MemoryOverprovisioned</code> </b> — The instance’s memory
  /// configuration can be sized down while still meeting the performance
  /// requirements of your workload. This is identified by analyzing the memory
  /// utilization metric of the current instance during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>MemoryUnderprovisioned</code> </b> — The instance’s memory
  /// configuration doesn't meet the performance requirements of your workload and
  /// there is an alternative instance type that provides better memory
  /// performance. This is identified by analyzing the memory utilization metric
  /// of the current instance during the look-back period.
  /// <note>
  /// Memory utilization is analyzed only for resources that have the unified
  /// CloudWatch agent installed on them. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent">Enabling
  /// memory utilization with the Amazon CloudWatch Agent</a> in the <i>Compute
  /// Optimizer User Guide</i>. On Linux instances, Compute Optimizer analyses the
  /// <code>mem_used_percent</code> metric in the <code>CWAgent</code> namespace,
  /// or the legacy <code>MemoryUtilization</code> metric in the
  /// <code>System/Linux</code> namespace. On Windows instances, Compute Optimizer
  /// analyses the <code>Memory % Committed Bytes In Use</code> metric in the
  /// <code>CWAgent</code> namespace.
  /// </note> </li>
  /// <li>
  /// <b> <code>EBSThroughputOverprovisioned</code> </b> — The instance’s EBS
  /// throughput configuration can be sized down while still meeting the
  /// performance requirements of your workload. This is identified by analyzing
  /// the <code>VolumeReadBytes</code> and <code>VolumeWriteBytes</code> metrics
  /// of EBS volumes attached to the current instance during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>EBSThroughputUnderprovisioned</code> </b> — The instance’s EBS
  /// throughput configuration doesn't meet the performance requirements of your
  /// workload and there is an alternative instance type that provides better EBS
  /// throughput performance. This is identified by analyzing the
  /// <code>VolumeReadBytes</code> and <code>VolumeWriteBytes</code> metrics of
  /// EBS volumes attached to the current instance during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>EBSIOPSOverprovisioned</code> </b> — The instance’s EBS IOPS
  /// configuration can be sized down while still meeting the performance
  /// requirements of your workload. This is identified by analyzing the
  /// <code>VolumeReadOps</code> and <code>VolumeWriteOps</code> metric of EBS
  /// volumes attached to the current instance during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>EBSIOPSUnderprovisioned</code> </b> — The instance’s EBS IOPS
  /// configuration doesn't meet the performance requirements of your workload and
  /// there is an alternative instance type that provides better EBS IOPS
  /// performance. This is identified by analyzing the <code>VolumeReadOps</code>
  /// and <code>VolumeWriteOps</code> metric of EBS volumes attached to the
  /// current instance during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>NetworkBandwidthOverprovisioned</code> </b> — The instance’s
  /// network bandwidth configuration can be sized down while still meeting the
  /// performance requirements of your workload. This is identified by analyzing
  /// the <code>NetworkIn</code> and <code>NetworkOut</code> metrics of the
  /// current instance during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>NetworkBandwidthUnderprovisioned</code> </b> — The instance’s
  /// network bandwidth configuration doesn't meet the performance requirements of
  /// your workload and there is an alternative instance type that provides better
  /// network bandwidth performance. This is identified by analyzing the
  /// <code>NetworkIn</code> and <code>NetworkOut</code> metrics of the current
  /// instance during the look-back period. This finding reason happens when the
  /// <code>NetworkIn</code> or <code>NetworkOut</code> performance of an instance
  /// is impacted.
  /// </li>
  /// <li>
  /// <b> <code>NetworkPPSOverprovisioned</code> </b> — The instance’s network PPS
  /// (packets per second) configuration can be sized down while still meeting the
  /// performance requirements of your workload. This is identified by analyzing
  /// the <code>NetworkPacketsIn</code> and <code>NetworkPacketsIn</code> metrics
  /// of the current instance during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>NetworkPPSUnderprovisioned</code> </b> — The instance’s network
  /// PPS (packets per second) configuration doesn't meet the performance
  /// requirements of your workload and there is an alternative instance type that
  /// provides better network PPS performance. This is identified by analyzing the
  /// <code>NetworkPacketsIn</code> and <code>NetworkPacketsIn</code> metrics of
  /// the current instance during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>DiskIOPSOverprovisioned</code> </b> — The instance’s disk IOPS
  /// configuration can be sized down while still meeting the performance
  /// requirements of your workload. This is identified by analyzing the
  /// <code>DiskReadOps</code> and <code>DiskWriteOps</code> metrics of the
  /// current instance during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>DiskIOPSUnderprovisioned</code> </b> — The instance’s disk IOPS
  /// configuration doesn't meet the performance requirements of your workload and
  /// there is an alternative instance type that provides better disk IOPS
  /// performance. This is identified by analyzing the <code>DiskReadOps</code>
  /// and <code>DiskWriteOps</code> metrics of the current instance during the
  /// look-back period.
  /// </li>
  /// <li>
  /// <b> <code>DiskThroughputOverprovisioned</code> </b> — The instance’s disk
  /// throughput configuration can be sized down while still meeting the
  /// performance requirements of your workload. This is identified by analyzing
  /// the <code>DiskReadBytes</code> and <code>DiskWriteBytes</code> metrics of
  /// the current instance during the look-back period.
  /// </li>
  /// <li>
  /// <b> <code>DiskThroughputUnderprovisioned</code> </b> — The instance’s disk
  /// throughput configuration doesn't meet the performance requirements of your
  /// workload and there is an alternative instance type that provides better disk
  /// throughput performance. This is identified by analyzing the
  /// <code>DiskReadBytes</code> and <code>DiskWriteBytes</code> metrics of the
  /// current instance during the look-back period.
  /// </li>
  /// </ul> <note>
  /// For more information about instance metrics, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html">List
  /// the available CloudWatch metrics for your instances</a> in the <i>Amazon
  /// Elastic Compute Cloud User Guide</i>. For more information about EBS volume
  /// metrics, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cloudwatch_ebs.html">Amazon
  /// CloudWatch metrics for Amazon EBS</a> in the <i>Amazon Elastic Compute Cloud
  /// User Guide</i>.
  /// </note>
  final List<InstanceRecommendationFindingReasonCode>? findingReasonCodes;

  /// Describes if an Amazon EC2 instance is idle.
  final InstanceIdle? idle;

  /// The applications that might be running on the instance as inferred by
  /// Compute Optimizer.
  ///
  /// Compute Optimizer can infer if one of the following applications might be
  /// running on the instance:
  ///
  /// <ul>
  /// <li>
  /// <code>AmazonEmr</code> - Infers that Amazon EMR might be running on the
  /// instance.
  /// </li>
  /// <li>
  /// <code>ApacheCassandra</code> - Infers that Apache Cassandra might be running
  /// on the instance.
  /// </li>
  /// <li>
  /// <code>ApacheHadoop</code> - Infers that Apache Hadoop might be running on
  /// the instance.
  /// </li>
  /// <li>
  /// <code>Memcached</code> - Infers that Memcached might be running on the
  /// instance.
  /// </li>
  /// <li>
  /// <code>NGINX</code> - Infers that NGINX might be running on the instance.
  /// </li>
  /// <li>
  /// <code>PostgreSql</code> - Infers that PostgreSQL might be running on the
  /// instance.
  /// </li>
  /// <li>
  /// <code>Redis</code> - Infers that Redis might be running on the instance.
  /// </li>
  /// <li>
  /// <code>Kafka</code> - Infers that Kafka might be running on the instance.
  /// </li>
  /// <li>
  /// <code>SQLServer</code> - Infers that SQLServer might be running on the
  /// instance.
  /// </li>
  /// </ul>
  final List<InferredWorkloadType>? inferredWorkloadTypes;

  /// The Amazon Resource Name (ARN) of the current instance.
  final String? instanceArn;

  /// The name of the current instance.
  final String? instanceName;

  /// The state of the instance when the recommendation was generated.
  final InstanceState? instanceState;

  /// The timestamp of when the instance recommendation was last generated.
  final DateTime? lastRefreshTimestamp;

  /// The number of days for which utilization metrics were analyzed for the
  /// instance.
  final double? lookBackPeriodInDays;

  /// An array of objects that describe the recommendation options for the
  /// instance.
  final List<InstanceRecommendationOption>? recommendationOptions;

  /// An array of objects that describe the source resource of the recommendation.
  final List<RecommendationSource>? recommendationSources;

  /// A list of tags assigned to your Amazon EC2 instance recommendations.
  final List<Tag>? tags;

  /// An array of objects that describe the utilization metrics of the instance.
  final List<UtilizationMetric>? utilizationMetrics;

  InstanceRecommendation({
    this.accountId,
    this.currentInstanceGpuInfo,
    this.currentInstanceType,
    this.currentPerformanceRisk,
    this.effectiveRecommendationPreferences,
    this.externalMetricStatus,
    this.finding,
    this.findingReasonCodes,
    this.idle,
    this.inferredWorkloadTypes,
    this.instanceArn,
    this.instanceName,
    this.instanceState,
    this.lastRefreshTimestamp,
    this.lookBackPeriodInDays,
    this.recommendationOptions,
    this.recommendationSources,
    this.tags,
    this.utilizationMetrics,
  });

  factory InstanceRecommendation.fromJson(Map<String, dynamic> json) {
    return InstanceRecommendation(
      accountId: json['accountId'] as String?,
      currentInstanceGpuInfo: json['currentInstanceGpuInfo'] != null
          ? GpuInfo.fromJson(
              json['currentInstanceGpuInfo'] as Map<String, dynamic>)
          : null,
      currentInstanceType: json['currentInstanceType'] as String?,
      currentPerformanceRisk: (json['currentPerformanceRisk'] as String?)
          ?.let(CurrentPerformanceRisk.fromString),
      effectiveRecommendationPreferences:
          json['effectiveRecommendationPreferences'] != null
              ? EffectiveRecommendationPreferences.fromJson(
                  json['effectiveRecommendationPreferences']
                      as Map<String, dynamic>)
              : null,
      externalMetricStatus: json['externalMetricStatus'] != null
          ? ExternalMetricStatus.fromJson(
              json['externalMetricStatus'] as Map<String, dynamic>)
          : null,
      finding: (json['finding'] as String?)?.let(Finding.fromString),
      findingReasonCodes: (json['findingReasonCodes'] as List?)
          ?.nonNulls
          .map((e) =>
              InstanceRecommendationFindingReasonCode.fromString((e as String)))
          .toList(),
      idle: (json['idle'] as String?)?.let(InstanceIdle.fromString),
      inferredWorkloadTypes: (json['inferredWorkloadTypes'] as List?)
          ?.nonNulls
          .map((e) => InferredWorkloadType.fromString((e as String)))
          .toList(),
      instanceArn: json['instanceArn'] as String?,
      instanceName: json['instanceName'] as String?,
      instanceState:
          (json['instanceState'] as String?)?.let(InstanceState.fromString),
      lastRefreshTimestamp: timeStampFromJson(json['lastRefreshTimestamp']),
      lookBackPeriodInDays: json['lookBackPeriodInDays'] as double?,
      recommendationOptions: (json['recommendationOptions'] as List?)
          ?.nonNulls
          .map((e) =>
              InstanceRecommendationOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendationSources: (json['recommendationSources'] as List?)
          ?.nonNulls
          .map((e) => RecommendationSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      utilizationMetrics: (json['utilizationMetrics'] as List?)
          ?.nonNulls
          .map((e) => UtilizationMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum InstanceRecommendationFindingReasonCode {
  cPUOverprovisioned('CPUOverprovisioned'),
  cPUUnderprovisioned('CPUUnderprovisioned'),
  memoryOverprovisioned('MemoryOverprovisioned'),
  memoryUnderprovisioned('MemoryUnderprovisioned'),
  eBSThroughputOverprovisioned('EBSThroughputOverprovisioned'),
  eBSThroughputUnderprovisioned('EBSThroughputUnderprovisioned'),
  eBSIOPSOverprovisioned('EBSIOPSOverprovisioned'),
  eBSIOPSUnderprovisioned('EBSIOPSUnderprovisioned'),
  networkBandwidthOverprovisioned('NetworkBandwidthOverprovisioned'),
  networkBandwidthUnderprovisioned('NetworkBandwidthUnderprovisioned'),
  networkPPSOverprovisioned('NetworkPPSOverprovisioned'),
  networkPPSUnderprovisioned('NetworkPPSUnderprovisioned'),
  diskIOPSOverprovisioned('DiskIOPSOverprovisioned'),
  diskIOPSUnderprovisioned('DiskIOPSUnderprovisioned'),
  diskThroughputOverprovisioned('DiskThroughputOverprovisioned'),
  diskThroughputUnderprovisioned('DiskThroughputUnderprovisioned'),
  gPUUnderprovisioned('GPUUnderprovisioned'),
  gPUOverprovisioned('GPUOverprovisioned'),
  gPUMemoryUnderprovisioned('GPUMemoryUnderprovisioned'),
  gPUMemoryOverprovisioned('GPUMemoryOverprovisioned'),
  ;

  final String value;

  const InstanceRecommendationFindingReasonCode(this.value);

  static InstanceRecommendationFindingReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum InstanceRecommendationFindingReasonCode'));
}

/// Describes a recommendation option for an Amazon EC2 instance.
class InstanceRecommendationOption {
  /// Describes the GPU accelerator settings for the recommended instance type.
  final GpuInfo? instanceGpuInfo;

  /// The instance type of the instance recommendation.
  final String? instanceType;

  /// The level of effort required to migrate from the current instance type to
  /// the recommended instance type.
  ///
  /// For example, the migration effort is <code>Low</code> if Amazon EMR is the
  /// inferred workload type and an Amazon Web Services Graviton instance type is
  /// recommended. The migration effort is <code>Medium</code> if a workload type
  /// couldn't be inferred but an Amazon Web Services Graviton instance type is
  /// recommended. The migration effort is <code>VeryLow</code> if both the
  /// current and recommended instance types are of the same CPU architecture.
  final MigrationEffort? migrationEffort;

  /// The performance risk of the instance recommendation option.
  ///
  /// Performance risk indicates the likelihood of the recommended instance type
  /// not meeting the resource needs of your workload. Compute Optimizer
  /// calculates an individual performance risk score for each specification of
  /// the recommended instance, including CPU, memory, EBS throughput, EBS IOPS,
  /// disk throughput, disk IOPS, network throughput, and network PPS. The
  /// performance risk of the recommended instance is calculated as the maximum
  /// performance risk score across the analyzed resource specifications.
  ///
  /// The value ranges from <code>0</code> - <code>4</code>, with <code>0</code>
  /// meaning that the recommended resource is predicted to always provide enough
  /// hardware capability. The higher the performance risk is, the more likely you
  /// should validate whether the recommendation will meet the performance
  /// requirements of your workload before migrating your resource.
  final double? performanceRisk;

  /// Describes the configuration differences between the current instance and the
  /// recommended instance type. You should consider the configuration differences
  /// before migrating your workloads from the current instance to the recommended
  /// instance type. The <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-resize.html">Change
  /// the instance type guide for Linux</a> and <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-resize.html">Change
  /// the instance type guide for Windows</a> provide general guidance for getting
  /// started with an instance migration.
  ///
  /// Platform differences include:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>Hypervisor</code> </b> — The hypervisor of the recommended
  /// instance type is different than that of the current instance. For example,
  /// the recommended instance type uses a Nitro hypervisor and the current
  /// instance uses a Xen hypervisor. The differences that you should consider
  /// between these hypervisors are covered in the <a
  /// href="http://aws.amazon.com/ec2/faqs/#Nitro_Hypervisor">Nitro Hypervisor</a>
  /// section of the Amazon EC2 frequently asked questions. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#ec2-nitro-instances">Instances
  /// built on the Nitro System</a> in the <i>Amazon EC2 User Guide for Linux</i>,
  /// or <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#ec2-nitro-instances">Instances
  /// built on the Nitro System</a> in the <i>Amazon EC2 User Guide for
  /// Windows</i>.
  /// </li>
  /// <li>
  /// <b> <code>NetworkInterface</code> </b> — The network interface of the
  /// recommended instance type is different than that of the current instance.
  /// For example, the recommended instance type supports enhanced networking and
  /// the current instance might not. To enable enhanced networking for the
  /// recommended instance type, you must install the Elastic Network Adapter
  /// (ENA) driver or the Intel 82599 Virtual Function driver. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage">Networking
  /// and storage features</a> and <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html">Enhanced
  /// networking on Linux</a> in the <i>Amazon EC2 User Guide for Linux</i>, or <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage">Networking
  /// and storage features</a> and <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/enhanced-networking.html">Enhanced
  /// networking on Windows</a> in the <i>Amazon EC2 User Guide for Windows</i>.
  /// </li>
  /// <li>
  /// <b> <code>StorageInterface</code> </b> — The storage interface of the
  /// recommended instance type is different than that of the current instance.
  /// For example, the recommended instance type uses an NVMe storage interface
  /// and the current instance does not. To access NVMe volumes for the
  /// recommended instance type, you will need to install or upgrade the NVMe
  /// driver. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage">Networking
  /// and storage features</a> and <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nvme-ebs-volumes.html">Amazon
  /// EBS and NVMe on Linux instances</a> in the <i>Amazon EC2 User Guide for
  /// Linux</i>, or <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage">Networking
  /// and storage features</a> and <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/nvme-ebs-volumes.html">Amazon
  /// EBS and NVMe on Windows instances</a> in the <i>Amazon EC2 User Guide for
  /// Windows</i>.
  /// </li>
  /// <li>
  /// <b> <code>InstanceStoreAvailability</code> </b> — The recommended instance
  /// type does not support instance store volumes and the current instance does.
  /// Before migrating, you might need to back up the data on your instance store
  /// volumes if you want to preserve them. For more information, see <a
  /// href="https://aws.amazon.com/premiumsupport/knowledge-center/back-up-instance-store-ebs/">How
  /// do I back up an instance store volume on my Amazon EC2 instance to Amazon
  /// EBS?</a> in the <i>Amazon Web Services Premium Support Knowledge Base</i>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage">Networking
  /// and storage features</a> and <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html">Amazon
  /// EC2 instance store</a> in the <i>Amazon EC2 User Guide for Linux</i>, or see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage">Networking
  /// and storage features</a> and <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/InstanceStorage.html">Amazon
  /// EC2 instance store</a> in the <i>Amazon EC2 User Guide for Windows</i>.
  /// </li>
  /// <li>
  /// <b> <code>VirtualizationType</code> </b> — The recommended instance type
  /// uses the hardware virtual machine (HVM) virtualization type and the current
  /// instance uses the paravirtual (PV) virtualization type. For more information
  /// about the differences between these virtualization types, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/virtualization_types.html">Linux
  /// AMI virtualization types</a> in the <i>Amazon EC2 User Guide for Linux</i>,
  /// or <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/windows-ami-version-history.html#virtualization-types">Windows
  /// AMI virtualization types</a> in the <i>Amazon EC2 User Guide for
  /// Windows</i>.
  /// </li>
  /// <li>
  /// <b> <code>Architecture</code> </b> — The CPU architecture between the
  /// recommended instance type and the current instance is different. For
  /// example, the recommended instance type might use an Arm CPU architecture and
  /// the current instance type might use a different one, such as x86. Before
  /// migrating, you should consider recompiling the software on your instance for
  /// the new architecture. Alternatively, you might switch to an Amazon Machine
  /// Image (AMI) that supports the new architecture. For more information about
  /// the CPU architecture for each instance type, see <a
  /// href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 Instance
  /// Types</a>.
  /// </li>
  /// </ul>
  final List<PlatformDifference>? platformDifferences;

  /// An array of objects that describe the projected utilization metrics of the
  /// instance recommendation option.
  /// <note>
  /// The <code>Cpu</code> and <code>Memory</code> metrics are the only projected
  /// utilization metrics returned. Additionally, the <code>Memory</code> metric
  /// is returned only for resources that have the unified CloudWatch agent
  /// installed on them. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent">Enabling
  /// Memory Utilization with the CloudWatch Agent</a>.
  /// </note>
  final List<UtilizationMetric>? projectedUtilizationMetrics;

  /// The rank of the instance recommendation option.
  ///
  /// The top recommendation option is ranked as <code>1</code>.
  final int? rank;

  /// An object that describes the savings opportunity for the instance
  /// recommendation option. Savings opportunity includes the estimated monthly
  /// savings amount and percentage.
  final SavingsOpportunity? savingsOpportunity;

  /// An object that describes the savings opportunity for the instance
  /// recommendation option that includes Savings Plans and Reserved Instances
  /// discounts. Savings opportunity includes the estimated monthly savings and
  /// percentage.
  final InstanceSavingsOpportunityAfterDiscounts?
      savingsOpportunityAfterDiscounts;

  InstanceRecommendationOption({
    this.instanceGpuInfo,
    this.instanceType,
    this.migrationEffort,
    this.performanceRisk,
    this.platformDifferences,
    this.projectedUtilizationMetrics,
    this.rank,
    this.savingsOpportunity,
    this.savingsOpportunityAfterDiscounts,
  });

  factory InstanceRecommendationOption.fromJson(Map<String, dynamic> json) {
    return InstanceRecommendationOption(
      instanceGpuInfo: json['instanceGpuInfo'] != null
          ? GpuInfo.fromJson(json['instanceGpuInfo'] as Map<String, dynamic>)
          : null,
      instanceType: json['instanceType'] as String?,
      migrationEffort:
          (json['migrationEffort'] as String?)?.let(MigrationEffort.fromString),
      performanceRisk: json['performanceRisk'] as double?,
      platformDifferences: (json['platformDifferences'] as List?)
          ?.nonNulls
          .map((e) => PlatformDifference.fromString((e as String)))
          .toList(),
      projectedUtilizationMetrics:
          (json['projectedUtilizationMetrics'] as List?)
              ?.nonNulls
              .map((e) => UtilizationMetric.fromJson(e as Map<String, dynamic>))
              .toList(),
      rank: json['rank'] as int?,
      savingsOpportunity: json['savingsOpportunity'] != null
          ? SavingsOpportunity.fromJson(
              json['savingsOpportunity'] as Map<String, dynamic>)
          : null,
      savingsOpportunityAfterDiscounts:
          json['savingsOpportunityAfterDiscounts'] != null
              ? InstanceSavingsOpportunityAfterDiscounts.fromJson(
                  json['savingsOpportunityAfterDiscounts']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

/// Describes the savings estimation mode used for calculating savings
/// opportunity for Amazon EC2 instances.
class InstanceSavingsEstimationMode {
  /// Describes the source for calculating the savings opportunity for Amazon EC2
  /// instances.
  final InstanceSavingsEstimationModeSource? source;

  InstanceSavingsEstimationMode({
    this.source,
  });

  factory InstanceSavingsEstimationMode.fromJson(Map<String, dynamic> json) {
    return InstanceSavingsEstimationMode(
      source: (json['source'] as String?)
          ?.let(InstanceSavingsEstimationModeSource.fromString),
    );
  }
}

enum InstanceSavingsEstimationModeSource {
  publicPricing('PublicPricing'),
  costExplorerRightsizing('CostExplorerRightsizing'),
  costOptimizationHub('CostOptimizationHub'),
  ;

  final String value;

  const InstanceSavingsEstimationModeSource(this.value);

  static InstanceSavingsEstimationModeSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum InstanceSavingsEstimationModeSource'));
}

/// Describes the savings opportunity for instance recommendations after
/// applying the Savings Plans and Reserved Instances discounts.
///
/// Savings opportunity after discounts represents the estimated monthly savings
/// you can achieve by implementing Compute Optimizer recommendations.
class InstanceSavingsOpportunityAfterDiscounts {
  /// An object that describes the estimated monthly savings possible by adopting
  /// Compute Optimizer’s Amazon EC2 instance recommendations. This is based on
  /// pricing after applying the Savings Plans and Reserved Instances discounts.
  final InstanceEstimatedMonthlySavings? estimatedMonthlySavings;

  /// The estimated monthly savings possible as a percentage of monthly cost after
  /// applying the Savings Plans and Reserved Instances discounts. This saving can
  /// be achieved by adopting Compute Optimizer’s EC2 instance recommendations.
  final double? savingsOpportunityPercentage;

  InstanceSavingsOpportunityAfterDiscounts({
    this.estimatedMonthlySavings,
    this.savingsOpportunityPercentage,
  });

  factory InstanceSavingsOpportunityAfterDiscounts.fromJson(
      Map<String, dynamic> json) {
    return InstanceSavingsOpportunityAfterDiscounts(
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? InstanceEstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
      savingsOpportunityPercentage:
          json['savingsOpportunityPercentage'] as double?,
    );
  }
}

enum InstanceState {
  pending('pending'),
  running('running'),
  shuttingDown('shutting-down'),
  terminated('terminated'),
  stopping('stopping'),
  stopped('stopped'),
  ;

  final String value;

  const InstanceState(this.value);

  static InstanceState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum InstanceState'));
}

/// Describes a filter that returns a more specific list of recommendation
/// export jobs. Use this filter with the
/// <a>DescribeRecommendationExportJobs</a> action.
///
/// You can use <code>EBSFilter</code> with the
/// <a>GetEBSVolumeRecommendations</a> action,
/// <code>LambdaFunctionRecommendationFilter</code> with the
/// <a>GetLambdaFunctionRecommendations</a> action, and <code>Filter</code> with
/// the <a>GetAutoScalingGroupRecommendations</a> and
/// <a>GetEC2InstanceRecommendations</a> actions.
class JobFilter {
  /// The name of the filter.
  ///
  /// Specify <code>ResourceType</code> to return export jobs of a specific
  /// resource type (for example, <code>Ec2Instance</code>).
  ///
  /// Specify <code>JobStatus</code> to return export jobs with a specific status
  /// (e.g, <code>Complete</code>).
  final JobFilterName? name;

  /// The value of the filter.
  ///
  /// The valid values for this parameter are as follows, depending on what you
  /// specify for the <code>name</code> parameter:
  ///
  /// <ul>
  /// <li>
  /// Specify <code>Ec2Instance</code> or <code>AutoScalingGroup</code> if you
  /// specify the <code>name</code> parameter as <code>ResourceType</code>. There
  /// is no filter for EBS volumes because volume recommendations cannot be
  /// exported at this time.
  /// </li>
  /// <li>
  /// Specify <code>Queued</code>, <code>InProgress</code>, <code>Complete</code>,
  /// or <code>Failed</code> if you specify the <code>name</code> parameter as
  /// <code>JobStatus</code>.
  /// </li>
  /// </ul>
  final List<String>? values;

  JobFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

enum JobFilterName {
  resourceType('ResourceType'),
  jobStatus('JobStatus'),
  ;

  final String value;

  const JobFilterName(this.value);

  static JobFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum JobFilterName'));
}

enum JobStatus {
  queued('Queued'),
  inProgress('InProgress'),
  complete('Complete'),
  failed('Failed'),
  ;

  final String value;

  const JobStatus(this.value);

  static JobStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum JobStatus'));
}

/// Describes the effective recommendation preferences for Lambda functions.
class LambdaEffectiveRecommendationPreferences {
  /// Describes the savings estimation mode applied for calculating savings
  /// opportunity for Lambda functions.
  final LambdaSavingsEstimationMode? savingsEstimationMode;

  LambdaEffectiveRecommendationPreferences({
    this.savingsEstimationMode,
  });

  factory LambdaEffectiveRecommendationPreferences.fromJson(
      Map<String, dynamic> json) {
    return LambdaEffectiveRecommendationPreferences(
      savingsEstimationMode: json['savingsEstimationMode'] != null
          ? LambdaSavingsEstimationMode.fromJson(
              json['savingsEstimationMode'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Describes the estimated monthly savings possible for Lambda functions by
/// adopting Compute Optimizer recommendations. This is based on Lambda
/// functions pricing after applying Savings Plans discounts.
class LambdaEstimatedMonthlySavings {
  /// The currency of the estimated monthly savings.
  final Currency? currency;

  /// The value of the estimated monthly savings.
  final double? value;

  LambdaEstimatedMonthlySavings({
    this.currency,
    this.value,
  });

  factory LambdaEstimatedMonthlySavings.fromJson(Map<String, dynamic> json) {
    return LambdaEstimatedMonthlySavings(
      currency: (json['currency'] as String?)?.let(Currency.fromString),
      value: json['value'] as double?,
    );
  }
}

enum LambdaFunctionMemoryMetricName {
  duration('Duration'),
  ;

  final String value;

  const LambdaFunctionMemoryMetricName(this.value);

  static LambdaFunctionMemoryMetricName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum LambdaFunctionMemoryMetricName'));
}

enum LambdaFunctionMemoryMetricStatistic {
  lowerBound('LowerBound'),
  upperBound('UpperBound'),
  expected('Expected'),
  ;

  final String value;

  const LambdaFunctionMemoryMetricStatistic(this.value);

  static LambdaFunctionMemoryMetricStatistic fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum LambdaFunctionMemoryMetricStatistic'));
}

/// Describes a projected utilization metric of an Lambda function
/// recommendation option.
class LambdaFunctionMemoryProjectedMetric {
  /// The name of the projected utilization metric.
  final LambdaFunctionMemoryMetricName? name;

  /// The statistic of the projected utilization metric.
  final LambdaFunctionMemoryMetricStatistic? statistic;

  /// The values of the projected utilization metrics.
  final double? value;

  LambdaFunctionMemoryProjectedMetric({
    this.name,
    this.statistic,
    this.value,
  });

  factory LambdaFunctionMemoryProjectedMetric.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionMemoryProjectedMetric(
      name: (json['name'] as String?)
          ?.let(LambdaFunctionMemoryMetricName.fromString),
      statistic: (json['statistic'] as String?)
          ?.let(LambdaFunctionMemoryMetricStatistic.fromString),
      value: json['value'] as double?,
    );
  }
}

/// Describes a recommendation option for an Lambda function.
class LambdaFunctionMemoryRecommendationOption {
  /// The memory size, in MB, of the function recommendation option.
  final int? memorySize;

  /// An array of objects that describe the projected utilization metrics of the
  /// function recommendation option.
  final List<LambdaFunctionMemoryProjectedMetric>? projectedUtilizationMetrics;

  /// The rank of the function recommendation option.
  ///
  /// The top recommendation option is ranked as <code>1</code>.
  final int? rank;

  /// An object that describes the savings opportunity for the Lambda function
  /// recommendation option. Savings opportunity includes the estimated monthly
  /// savings amount and percentage.
  final SavingsOpportunity? savingsOpportunity;

  /// An object that describes the savings opportunity for the Lambda
  /// recommendation option which includes Saving Plans discounts. Savings
  /// opportunity includes the estimated monthly savings and percentage.
  final LambdaSavingsOpportunityAfterDiscounts?
      savingsOpportunityAfterDiscounts;

  LambdaFunctionMemoryRecommendationOption({
    this.memorySize,
    this.projectedUtilizationMetrics,
    this.rank,
    this.savingsOpportunity,
    this.savingsOpportunityAfterDiscounts,
  });

  factory LambdaFunctionMemoryRecommendationOption.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionMemoryRecommendationOption(
      memorySize: json['memorySize'] as int?,
      projectedUtilizationMetrics:
          (json['projectedUtilizationMetrics'] as List?)
              ?.nonNulls
              .map((e) => LambdaFunctionMemoryProjectedMetric.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      rank: json['rank'] as int?,
      savingsOpportunity: json['savingsOpportunity'] != null
          ? SavingsOpportunity.fromJson(
              json['savingsOpportunity'] as Map<String, dynamic>)
          : null,
      savingsOpportunityAfterDiscounts:
          json['savingsOpportunityAfterDiscounts'] != null
              ? LambdaSavingsOpportunityAfterDiscounts.fromJson(
                  json['savingsOpportunityAfterDiscounts']
                      as Map<String, dynamic>)
              : null,
    );
  }
}

enum LambdaFunctionMetricName {
  duration('Duration'),
  memory('Memory'),
  ;

  final String value;

  const LambdaFunctionMetricName(this.value);

  static LambdaFunctionMetricName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum LambdaFunctionMetricName'));
}

enum LambdaFunctionMetricStatistic {
  maximum('Maximum'),
  average('Average'),
  ;

  final String value;

  const LambdaFunctionMetricStatistic(this.value);

  static LambdaFunctionMetricStatistic fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum LambdaFunctionMetricStatistic'));
}

/// Describes an Lambda function recommendation.
class LambdaFunctionRecommendation {
  /// The Amazon Web Services account ID of the function.
  final String? accountId;

  /// The amount of memory, in MB, that's allocated to the current function.
  final int? currentMemorySize;

  /// The risk of the current Lambda function not meeting the performance needs of
  /// its workloads. The higher the risk, the more likely the current Lambda
  /// function requires more memory.
  final CurrentPerformanceRisk? currentPerformanceRisk;

  /// Describes the effective recommendation preferences for Lambda functions.
  final LambdaEffectiveRecommendationPreferences?
      effectiveRecommendationPreferences;

  /// The finding classification of the function.
  ///
  /// Findings for functions include:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>Optimized</code> </b> — The function is correctly provisioned to
  /// run your workload based on its current configuration and its utilization
  /// history. This finding classification does not include finding reason codes.
  /// </li>
  /// <li>
  /// <b> <code>NotOptimized</code> </b> — The function is performing at a higher
  /// level (over-provisioned) or at a lower level (under-provisioned) than
  /// required for your workload because its current configuration is not optimal.
  /// Over-provisioned resources might lead to unnecessary infrastructure cost,
  /// and under-provisioned resources might lead to poor application performance.
  /// This finding classification can include the
  /// <code>MemoryUnderprovisioned</code> and <code>MemoryUnderprovisioned</code>
  /// finding reason codes.
  /// </li>
  /// <li>
  /// <b> <code>Unavailable</code> </b> — Compute Optimizer was unable to generate
  /// a recommendation for the function. This could be because the function has
  /// not accumulated sufficient metric data, or the function does not qualify for
  /// a recommendation. This finding classification can include the
  /// <code>InsufficientData</code> and <code>Inconclusive</code> finding reason
  /// codes.
  /// <note>
  /// Functions with a finding of unavailable are not returned unless you specify
  /// the <code>filter</code> parameter with a value of <code>Unavailable</code>
  /// in your <code>GetLambdaFunctionRecommendations</code> request.
  /// </note> </li>
  /// </ul>
  final LambdaFunctionRecommendationFinding? finding;

  /// The reason for the finding classification of the function.
  /// <note>
  /// Functions that have a finding classification of <code>Optimized</code> don't
  /// have a finding reason code.
  /// </note>
  /// Finding reason codes for functions include:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>MemoryOverprovisioned</code> </b> — The function is
  /// over-provisioned when its memory configuration can be sized down while still
  /// meeting the performance requirements of your workload. An over-provisioned
  /// function might lead to unnecessary infrastructure cost. This finding reason
  /// code is part of the <code>NotOptimized</code> finding classification.
  /// </li>
  /// <li>
  /// <b> <code>MemoryUnderprovisioned</code> </b> — The function is
  /// under-provisioned when its memory configuration doesn't meet the performance
  /// requirements of the workload. An under-provisioned function might lead to
  /// poor application performance. This finding reason code is part of the
  /// <code>NotOptimized</code> finding classification.
  /// </li>
  /// <li>
  /// <b> <code>InsufficientData</code> </b> — The function does not have
  /// sufficient metric data for Compute Optimizer to generate a recommendation.
  /// For more information, see the <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html">Supported
  /// resources and requirements</a> in the <i>Compute Optimizer User Guide</i>.
  /// This finding reason code is part of the <code>Unavailable</code> finding
  /// classification.
  /// </li>
  /// <li>
  /// <b> <code>Inconclusive</code> </b> — The function does not qualify for a
  /// recommendation because Compute Optimizer cannot generate a recommendation
  /// with a high degree of confidence. This finding reason code is part of the
  /// <code>Unavailable</code> finding classification.
  /// </li>
  /// </ul>
  final List<LambdaFunctionRecommendationFindingReasonCode>? findingReasonCodes;

  /// The Amazon Resource Name (ARN) of the current function.
  final String? functionArn;

  /// The version number of the current function.
  final String? functionVersion;

  /// The timestamp of when the function recommendation was last generated.
  final DateTime? lastRefreshTimestamp;

  /// The number of days for which utilization metrics were analyzed for the
  /// function.
  final double? lookbackPeriodInDays;

  /// An array of objects that describe the memory configuration recommendation
  /// options for the function.
  final List<LambdaFunctionMemoryRecommendationOption>?
      memorySizeRecommendationOptions;

  /// The number of times your function code was applied during the look-back
  /// period.
  final int? numberOfInvocations;

  /// A list of tags assigned to your Lambda function recommendations.
  final List<Tag>? tags;

  /// An array of objects that describe the utilization metrics of the function.
  final List<LambdaFunctionUtilizationMetric>? utilizationMetrics;

  LambdaFunctionRecommendation({
    this.accountId,
    this.currentMemorySize,
    this.currentPerformanceRisk,
    this.effectiveRecommendationPreferences,
    this.finding,
    this.findingReasonCodes,
    this.functionArn,
    this.functionVersion,
    this.lastRefreshTimestamp,
    this.lookbackPeriodInDays,
    this.memorySizeRecommendationOptions,
    this.numberOfInvocations,
    this.tags,
    this.utilizationMetrics,
  });

  factory LambdaFunctionRecommendation.fromJson(Map<String, dynamic> json) {
    return LambdaFunctionRecommendation(
      accountId: json['accountId'] as String?,
      currentMemorySize: json['currentMemorySize'] as int?,
      currentPerformanceRisk: (json['currentPerformanceRisk'] as String?)
          ?.let(CurrentPerformanceRisk.fromString),
      effectiveRecommendationPreferences:
          json['effectiveRecommendationPreferences'] != null
              ? LambdaEffectiveRecommendationPreferences.fromJson(
                  json['effectiveRecommendationPreferences']
                      as Map<String, dynamic>)
              : null,
      finding: (json['finding'] as String?)
          ?.let(LambdaFunctionRecommendationFinding.fromString),
      findingReasonCodes: (json['findingReasonCodes'] as List?)
          ?.nonNulls
          .map((e) => LambdaFunctionRecommendationFindingReasonCode.fromString(
              (e as String)))
          .toList(),
      functionArn: json['functionArn'] as String?,
      functionVersion: json['functionVersion'] as String?,
      lastRefreshTimestamp: timeStampFromJson(json['lastRefreshTimestamp']),
      lookbackPeriodInDays: json['lookbackPeriodInDays'] as double?,
      memorySizeRecommendationOptions:
          (json['memorySizeRecommendationOptions'] as List?)
              ?.nonNulls
              .map((e) => LambdaFunctionMemoryRecommendationOption.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      numberOfInvocations: json['numberOfInvocations'] as int?,
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      utilizationMetrics: (json['utilizationMetrics'] as List?)
          ?.nonNulls
          .map((e) => LambdaFunctionUtilizationMetric.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Describes a filter that returns a more specific list of Lambda function
/// recommendations. Use this filter with the
/// <a>GetLambdaFunctionRecommendations</a> action.
///
/// You can use <code>EBSFilter</code> with the
/// <a>GetEBSVolumeRecommendations</a> action, <code>JobFilter</code> with the
/// <a>DescribeRecommendationExportJobs</a> action, and <code>Filter</code> with
/// the <a>GetAutoScalingGroupRecommendations</a> and
/// <a>GetEC2InstanceRecommendations</a> actions.
class LambdaFunctionRecommendationFilter {
  /// The name of the filter.
  ///
  /// Specify <code>Finding</code> to return recommendations with a specific
  /// finding classification (for example, <code>NotOptimized</code>).
  ///
  /// Specify <code>FindingReasonCode</code> to return recommendations with a
  /// specific finding reason code (for example,
  /// <code>MemoryUnderprovisioned</code>).
  ///
  /// You can filter your Lambda function recommendations by <code>tag:key</code>
  /// and <code>tag-key</code> tags.
  ///
  /// A <code>tag:key</code> is a key and value combination of a tag assigned to
  /// your Lambda function recommendations. Use the tag key in the filter name and
  /// the tag value as the filter value. For example, to find all Lambda function
  /// recommendations that have a tag with the key of <code>Owner</code> and the
  /// value of <code>TeamA</code>, specify <code>tag:Owner</code> for the filter
  /// name and <code>TeamA</code> for the filter value.
  ///
  /// A <code>tag-key</code> is the key of a tag assigned to your Lambda function
  /// recommendations. Use this filter to find all of your Lambda function
  /// recommendations that have a tag with a specific key. This doesn’t consider
  /// the tag value. For example, you can find your Lambda function
  /// recommendations with a tag key value of <code>Owner</code> or without any
  /// tag keys assigned.
  final LambdaFunctionRecommendationFilterName? name;

  /// The value of the filter.
  ///
  /// The valid values for this parameter are as follows, depending on what you
  /// specify for the <code>name</code> parameter:
  ///
  /// <ul>
  /// <li>
  /// Specify <code>Optimized</code>, <code>NotOptimized</code>, or
  /// <code>Unavailable</code> if you specify the <code>name</code> parameter as
  /// <code>Finding</code>.
  /// </li>
  /// <li>
  /// Specify <code>MemoryOverprovisioned</code>,
  /// <code>MemoryUnderprovisioned</code>, <code>InsufficientData</code>, or
  /// <code>Inconclusive</code> if you specify the <code>name</code> parameter as
  /// <code>FindingReasonCode</code>.
  /// </li>
  /// </ul>
  final List<String>? values;

  LambdaFunctionRecommendationFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

enum LambdaFunctionRecommendationFilterName {
  finding('Finding'),
  findingReasonCode('FindingReasonCode'),
  ;

  final String value;

  const LambdaFunctionRecommendationFilterName(this.value);

  static LambdaFunctionRecommendationFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum LambdaFunctionRecommendationFilterName'));
}

enum LambdaFunctionRecommendationFinding {
  optimized('Optimized'),
  notOptimized('NotOptimized'),
  unavailable('Unavailable'),
  ;

  final String value;

  const LambdaFunctionRecommendationFinding(this.value);

  static LambdaFunctionRecommendationFinding fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum LambdaFunctionRecommendationFinding'));
}

enum LambdaFunctionRecommendationFindingReasonCode {
  memoryOverprovisioned('MemoryOverprovisioned'),
  memoryUnderprovisioned('MemoryUnderprovisioned'),
  insufficientData('InsufficientData'),
  inconclusive('Inconclusive'),
  ;

  final String value;

  const LambdaFunctionRecommendationFindingReasonCode(this.value);

  static LambdaFunctionRecommendationFindingReasonCode fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum LambdaFunctionRecommendationFindingReasonCode'));
}

/// Describes a utilization metric of an Lambda function.
class LambdaFunctionUtilizationMetric {
  /// The name of the utilization metric.
  ///
  /// The following utilization metrics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Duration</code> - The amount of time that your function code spends
  /// processing an event.
  /// </li>
  /// <li>
  /// <code>Memory</code> - The amount of memory used per invocation.
  /// </li>
  /// </ul>
  final LambdaFunctionMetricName? name;

  /// The statistic of the utilization metric.
  ///
  /// The Compute Optimizer API, Command Line Interface (CLI), and SDKs return
  /// utilization metrics using only the <code>Maximum</code> statistic, which is
  /// the highest value observed during the specified period.
  ///
  /// The Compute Optimizer console displays graphs for some utilization metrics
  /// using the <code>Average</code> statistic, which is the value of
  /// <code>Sum</code> / <code>SampleCount</code> during the specified period. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html">Viewing
  /// resource recommendations</a> in the <i>Compute Optimizer User Guide</i>. You
  /// can also get averaged utilization metric data for your resources using
  /// Amazon CloudWatch. For more information, see the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html">Amazon
  /// CloudWatch User Guide</a>.
  final LambdaFunctionMetricStatistic? statistic;

  /// The value of the utilization metric.
  final double? value;

  LambdaFunctionUtilizationMetric({
    this.name,
    this.statistic,
    this.value,
  });

  factory LambdaFunctionUtilizationMetric.fromJson(Map<String, dynamic> json) {
    return LambdaFunctionUtilizationMetric(
      name: (json['name'] as String?)?.let(LambdaFunctionMetricName.fromString),
      statistic: (json['statistic'] as String?)
          ?.let(LambdaFunctionMetricStatistic.fromString),
      value: json['value'] as double?,
    );
  }
}

/// Describes the savings estimation used for calculating savings opportunity
/// for Lambda functions.
class LambdaSavingsEstimationMode {
  /// Describes the source for calculation of savings opportunity for Lambda
  /// functions.
  final LambdaSavingsEstimationModeSource? source;

  LambdaSavingsEstimationMode({
    this.source,
  });

  factory LambdaSavingsEstimationMode.fromJson(Map<String, dynamic> json) {
    return LambdaSavingsEstimationMode(
      source: (json['source'] as String?)
          ?.let(LambdaSavingsEstimationModeSource.fromString),
    );
  }
}

enum LambdaSavingsEstimationModeSource {
  publicPricing('PublicPricing'),
  costExplorerRightsizing('CostExplorerRightsizing'),
  costOptimizationHub('CostOptimizationHub'),
  ;

  final String value;

  const LambdaSavingsEstimationModeSource(this.value);

  static LambdaSavingsEstimationModeSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum LambdaSavingsEstimationModeSource'));
}

/// Describes the savings opportunity for Lambda functions recommendations after
/// applying Savings Plans discounts.
///
/// Savings opportunity represents the estimated monthly savings after applying
/// Savings Plans discounts. You can achieve this by implementing a given
/// Compute Optimizer recommendation.
class LambdaSavingsOpportunityAfterDiscounts {
  /// The estimated monthly savings possible by adopting Compute Optimizer’s
  /// Lambda function recommendations. This includes any applicable Savings Plans
  /// discounts.
  final LambdaEstimatedMonthlySavings? estimatedMonthlySavings;

  /// The estimated monthly savings possible as a percentage of monthly cost by
  /// adopting Compute Optimizer’s Lambda function recommendations. This includes
  /// any applicable Savings Plans discounts.
  final double? savingsOpportunityPercentage;

  LambdaSavingsOpportunityAfterDiscounts({
    this.estimatedMonthlySavings,
    this.savingsOpportunityPercentage,
  });

  factory LambdaSavingsOpportunityAfterDiscounts.fromJson(
      Map<String, dynamic> json) {
    return LambdaSavingsOpportunityAfterDiscounts(
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? LambdaEstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
      savingsOpportunityPercentage:
          json['savingsOpportunityPercentage'] as double?,
    );
  }
}

/// Describes the configuration of a license for an Amazon EC2 instance.
class LicenseConfiguration {
  /// The instance type used in the license.
  final String? instanceType;

  /// The edition of the license for the application that runs on the instance.
  final LicenseEdition? licenseEdition;

  /// The license type associated with the instance.
  final LicenseModel? licenseModel;

  /// The name of the license for the application that runs on the instance.
  final LicenseName? licenseName;

  /// The version of the license for the application that runs on the instance.
  final String? licenseVersion;

  /// The list of metric sources required to generate recommendations for
  /// commercial software licenses.
  final List<MetricSource>? metricsSource;

  /// The current number of cores associated with the instance.
  final int? numberOfCores;

  /// The operating system of the instance.
  final String? operatingSystem;

  LicenseConfiguration({
    this.instanceType,
    this.licenseEdition,
    this.licenseModel,
    this.licenseName,
    this.licenseVersion,
    this.metricsSource,
    this.numberOfCores,
    this.operatingSystem,
  });

  factory LicenseConfiguration.fromJson(Map<String, dynamic> json) {
    return LicenseConfiguration(
      instanceType: json['instanceType'] as String?,
      licenseEdition:
          (json['licenseEdition'] as String?)?.let(LicenseEdition.fromString),
      licenseModel:
          (json['licenseModel'] as String?)?.let(LicenseModel.fromString),
      licenseName:
          (json['licenseName'] as String?)?.let(LicenseName.fromString),
      licenseVersion: json['licenseVersion'] as String?,
      metricsSource: (json['metricsSource'] as List?)
          ?.nonNulls
          .map((e) => MetricSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfCores: json['numberOfCores'] as int?,
      operatingSystem: json['operatingSystem'] as String?,
    );
  }
}

enum LicenseEdition {
  enterprise('Enterprise'),
  standard('Standard'),
  free('Free'),
  noLicenseEditionFound('NoLicenseEditionFound'),
  ;

  final String value;

  const LicenseEdition(this.value);

  static LicenseEdition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LicenseEdition'));
}

enum LicenseFinding {
  insufficientMetrics('InsufficientMetrics'),
  optimized('Optimized'),
  notOptimized('NotOptimized'),
  ;

  final String value;

  const LicenseFinding(this.value);

  static LicenseFinding fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LicenseFinding'));
}

enum LicenseFindingReasonCode {
  invalidCloudWatchApplicationInsightsSetup(
      'InvalidCloudWatchApplicationInsightsSetup'),
  cloudWatchApplicationInsightsError('CloudWatchApplicationInsightsError'),
  licenseOverprovisioned('LicenseOverprovisioned'),
  optimized('Optimized'),
  ;

  final String value;

  const LicenseFindingReasonCode(this.value);

  static LicenseFindingReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum LicenseFindingReasonCode'));
}

enum LicenseModel {
  licenseIncluded('LicenseIncluded'),
  bringYourOwnLicense('BringYourOwnLicense'),
  ;

  final String value;

  const LicenseModel(this.value);

  static LicenseModel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LicenseModel'));
}

enum LicenseName {
  sQLServer('SQLServer'),
  ;

  final String value;

  const LicenseName(this.value);

  static LicenseName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum LicenseName'));
}

/// Describes a license recommendation for an EC2 instance.
class LicenseRecommendation {
  /// The Amazon Web Services account ID of the license.
  final String? accountId;

  /// An object that describes the current configuration of an instance that runs
  /// on a license.
  final LicenseConfiguration? currentLicenseConfiguration;

  /// The finding classification for an instance that runs on a license.
  ///
  /// Findings include:
  ///
  /// <ul>
  /// <li>
  /// <code>InsufficentMetrics</code> — When Compute Optimizer detects that your
  /// CloudWatch Application Insights isn't enabled or is enabled with
  /// insufficient permissions.
  /// </li>
  /// <li>
  /// <code>NotOptimized</code> — When Compute Optimizer detects that your EC2
  /// infrastructure isn't using any of the SQL server license features you're
  /// paying for, a license is considered not optimized.
  /// </li>
  /// <li>
  /// <code>Optimized</code> — When Compute Optimizer detects that all
  /// specifications of your license meet the performance requirements of your
  /// workload.
  /// </li>
  /// </ul>
  final LicenseFinding? finding;

  /// The reason for the finding classification for an instance that runs on a
  /// license.
  ///
  /// Finding reason codes include:
  ///
  /// <ul>
  /// <li>
  /// <code>Optimized</code> — All specifications of your license meet the
  /// performance requirements of your workload.
  /// </li>
  /// <li>
  /// <code>LicenseOverprovisioned</code> — A license is considered
  /// over-provisioned when your license can be downgraded while still meeting the
  /// performance requirements of your workload.
  /// </li>
  /// <li>
  /// <code>InvalidCloudwatchApplicationInsights</code> — CloudWatch Application
  /// Insights isn't configured properly.
  /// </li>
  /// <li>
  /// <code>CloudwatchApplicationInsightsError</code> — There is a CloudWatch
  /// Application Insights error.
  /// </li>
  /// </ul>
  final List<LicenseFindingReasonCode>? findingReasonCodes;

  /// The timestamp of when the license recommendation was last generated.
  final DateTime? lastRefreshTimestamp;

  /// An array of objects that describe the license recommendation options.
  final List<LicenseRecommendationOption>? licenseRecommendationOptions;

  /// The number of days for which utilization metrics were analyzed for an
  /// instance that runs on a license.
  final double? lookbackPeriodInDays;

  /// The ARN that identifies the Amazon EC2 instance.
  final String? resourceArn;

  /// A list of tags assigned to an EC2 instance.
  final List<Tag>? tags;

  LicenseRecommendation({
    this.accountId,
    this.currentLicenseConfiguration,
    this.finding,
    this.findingReasonCodes,
    this.lastRefreshTimestamp,
    this.licenseRecommendationOptions,
    this.lookbackPeriodInDays,
    this.resourceArn,
    this.tags,
  });

  factory LicenseRecommendation.fromJson(Map<String, dynamic> json) {
    return LicenseRecommendation(
      accountId: json['accountId'] as String?,
      currentLicenseConfiguration: json['currentLicenseConfiguration'] != null
          ? LicenseConfiguration.fromJson(
              json['currentLicenseConfiguration'] as Map<String, dynamic>)
          : null,
      finding: (json['finding'] as String?)?.let(LicenseFinding.fromString),
      findingReasonCodes: (json['findingReasonCodes'] as List?)
          ?.nonNulls
          .map((e) => LicenseFindingReasonCode.fromString((e as String)))
          .toList(),
      lastRefreshTimestamp: timeStampFromJson(json['lastRefreshTimestamp']),
      licenseRecommendationOptions: (json['licenseRecommendationOptions']
              as List?)
          ?.nonNulls
          .map((e) =>
              LicenseRecommendationOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      lookbackPeriodInDays: json['lookbackPeriodInDays'] as double?,
      resourceArn: json['resourceArn'] as String?,
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Describes a filter that returns a more specific list of license
/// recommendations. Use this filter with the
/// <code>GetLicenseRecommendation</code> action.
class LicenseRecommendationFilter {
  /// The name of the filter.
  ///
  /// Specify <code>Finding</code> to return recommendations with a specific
  /// finding classification.
  ///
  /// Specify <code>FindingReasonCode</code> to return recommendations with a
  /// specific finding reason code.
  ///
  /// You can filter your license recommendations by <code>tag:key</code> and
  /// <code>tag-key</code> tags.
  ///
  /// A <code>tag:key</code> is a key and value combination of a tag assigned to
  /// your license recommendations. Use the tag key in the filter name and the tag
  /// value as the filter value. For example, to find all license recommendations
  /// that have a tag with the key of <code>Owner</code> and the value of
  /// <code>TeamA</code>, specify <code>tag:Owner</code> for the filter name and
  /// <code>TeamA</code> for the filter value.
  ///
  /// A <code>tag-key</code> is the key of a tag assigned to your license
  /// recommendations. Use this filter to find all of your license recommendations
  /// that have a tag with a specific key. This doesn’t consider the tag value.
  /// For example, you can find your license recommendations with a tag key value
  /// of <code>Owner</code> or without any tag keys assigned.
  final LicenseRecommendationFilterName? name;

  /// The value of the filter.
  ///
  /// The valid values for this parameter are as follows, depending on what you
  /// specify for the <code>name</code> parameter:
  ///
  /// <ul>
  /// <li>
  /// If you specify the <code>name</code> parameter as <code>Finding</code>, then
  /// specify <code>Optimized</code>, <code>NotOptimized</code>, or
  /// <code>InsufficentMetrics</code>.
  /// </li>
  /// <li>
  /// If you specify the <code>name</code> parameter as
  /// <code>FindingReasonCode</code>, then specify <code>Optimized</code>,
  /// <code>LicenseOverprovisioned</code>,
  /// <code>InvalidCloudwatchApplicationInsights</code>, or
  /// <code>CloudwatchApplicationInsightsError</code>.
  /// </li>
  /// </ul>
  final List<String>? values;

  LicenseRecommendationFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

enum LicenseRecommendationFilterName {
  finding('Finding'),
  findingReasonCode('FindingReasonCode'),
  licenseName('LicenseName'),
  ;

  final String value;

  const LicenseRecommendationFilterName(this.value);

  static LicenseRecommendationFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum LicenseRecommendationFilterName'));
}

/// Describes the recommendation options for licenses.
class LicenseRecommendationOption {
  /// The recommended edition of the license for the application that runs on the
  /// instance.
  final LicenseEdition? licenseEdition;

  /// The recommended license type associated with the instance.
  final LicenseModel? licenseModel;

  /// The operating system of a license recommendation option.
  final String? operatingSystem;

  /// The rank of the license recommendation option.
  ///
  /// The top recommendation option is ranked as <code>1</code>.
  final int? rank;
  final SavingsOpportunity? savingsOpportunity;

  LicenseRecommendationOption({
    this.licenseEdition,
    this.licenseModel,
    this.operatingSystem,
    this.rank,
    this.savingsOpportunity,
  });

  factory LicenseRecommendationOption.fromJson(Map<String, dynamic> json) {
    return LicenseRecommendationOption(
      licenseEdition:
          (json['licenseEdition'] as String?)?.let(LicenseEdition.fromString),
      licenseModel:
          (json['licenseModel'] as String?)?.let(LicenseModel.fromString),
      operatingSystem: json['operatingSystem'] as String?,
      rank: json['rank'] as int?,
      savingsOpportunity: json['savingsOpportunity'] != null
          ? SavingsOpportunity.fromJson(
              json['savingsOpportunity'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum LookBackPeriodPreference {
  days_14('DAYS_14'),
  days_32('DAYS_32'),
  days_93('DAYS_93'),
  ;

  final String value;

  const LookBackPeriodPreference(this.value);

  static LookBackPeriodPreference fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum LookBackPeriodPreference'));
}

/// The memory size configurations of a container.
class MemorySizeConfiguration {
  /// The amount of memory in the container.
  final int? memory;

  /// The limit of memory reserve for the container.
  final int? memoryReservation;

  MemorySizeConfiguration({
    this.memory,
    this.memoryReservation,
  });

  factory MemorySizeConfiguration.fromJson(Map<String, dynamic> json) {
    return MemorySizeConfiguration(
      memory: json['memory'] as int?,
      memoryReservation: json['memoryReservation'] as int?,
    );
  }
}

enum MetricName {
  cpu('Cpu'),
  memory('Memory'),
  ebsReadOpsPerSecond('EBS_READ_OPS_PER_SECOND'),
  ebsWriteOpsPerSecond('EBS_WRITE_OPS_PER_SECOND'),
  ebsReadBytesPerSecond('EBS_READ_BYTES_PER_SECOND'),
  ebsWriteBytesPerSecond('EBS_WRITE_BYTES_PER_SECOND'),
  diskReadOpsPerSecond('DISK_READ_OPS_PER_SECOND'),
  diskWriteOpsPerSecond('DISK_WRITE_OPS_PER_SECOND'),
  diskReadBytesPerSecond('DISK_READ_BYTES_PER_SECOND'),
  diskWriteBytesPerSecond('DISK_WRITE_BYTES_PER_SECOND'),
  networkInBytesPerSecond('NETWORK_IN_BYTES_PER_SECOND'),
  networkOutBytesPerSecond('NETWORK_OUT_BYTES_PER_SECOND'),
  networkPacketsInPerSecond('NETWORK_PACKETS_IN_PER_SECOND'),
  networkPacketsOutPerSecond('NETWORK_PACKETS_OUT_PER_SECOND'),
  gpuPercentage('GPU_PERCENTAGE'),
  gpuMemoryPercentage('GPU_MEMORY_PERCENTAGE'),
  ;

  final String value;

  const MetricName(this.value);

  static MetricName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum MetricName'));
}

/// The list of metric sources required to generate recommendations for
/// commercial software licenses.
class MetricSource {
  /// The name of the metric source provider.
  final MetricSourceProvider? provider;

  /// The ARN of the metric source provider.
  final String? providerArn;

  MetricSource({
    this.provider,
    this.providerArn,
  });

  factory MetricSource.fromJson(Map<String, dynamic> json) {
    return MetricSource(
      provider:
          (json['provider'] as String?)?.let(MetricSourceProvider.fromString),
      providerArn: json['providerArn'] as String?,
    );
  }
}

enum MetricSourceProvider {
  cloudWatchApplicationInsights('CloudWatchApplicationInsights'),
  ;

  final String value;

  const MetricSourceProvider(this.value);

  static MetricSourceProvider fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum MetricSourceProvider'));
}

enum MetricStatistic {
  maximum('Maximum'),
  average('Average'),
  ;

  final String value;

  const MetricStatistic(this.value);

  static MetricStatistic fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum MetricStatistic'));
}

enum MigrationEffort {
  veryLow('VeryLow'),
  low('Low'),
  medium('Medium'),
  high('High'),
  ;

  final String value;

  const MigrationEffort(this.value);

  static MigrationEffort fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum MigrationEffort'));
}

enum PlatformDifference {
  hypervisor('Hypervisor'),
  networkInterface('NetworkInterface'),
  storageInterface('StorageInterface'),
  instanceStoreAvailability('InstanceStoreAvailability'),
  virtualizationType('VirtualizationType'),
  architecture('Architecture'),
  ;

  final String value;

  const PlatformDifference(this.value);

  static PlatformDifference fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PlatformDifference'));
}

/// The preference to control which resource type values are considered when
/// generating rightsizing recommendations. You can specify this preference as a
/// combination of include and exclude lists. You must specify either an
/// <code>includeList</code> or <code>excludeList</code>. If the preference is
/// an empty set of resource type values, an error occurs. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/rightsizing-preferences.html">
/// Rightsizing recommendation preferences</a> in the <i>Compute Optimizer User
/// Guide</i>.
/// <note>
/// <ul>
/// <li>
/// This preference is only available for the Amazon EC2 instance and Auto
/// Scaling group resource types.
/// </li>
/// <li>
/// Compute Optimizer only supports the customization of
/// <code>Ec2InstanceTypes</code>.
/// </li>
/// </ul> </note>
class PreferredResource {
  /// The preferred resource type values to exclude from the recommendation
  /// candidates. If this isn’t specified, all supported resources are included by
  /// default. You can specify up to 1000 values in this list.
  final List<String>? excludeList;

  /// The preferred resource type values to include in the recommendation
  /// candidates. You can specify the exact resource type value, such as m5.large,
  /// or use wild card expressions, such as m5. If this isn’t specified, all
  /// supported resources are included by default. You can specify up to 1000
  /// values in this list.
  final List<String>? includeList;

  /// The type of preferred resource to customize.
  /// <note>
  /// Compute Optimizer only supports the customization of
  /// <code>Ec2InstanceTypes</code>.
  /// </note>
  final PreferredResourceName? name;

  PreferredResource({
    this.excludeList,
    this.includeList,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final excludeList = this.excludeList;
    final includeList = this.includeList;
    final name = this.name;
    return {
      if (excludeList != null) 'excludeList': excludeList,
      if (includeList != null) 'includeList': includeList,
      if (name != null) 'name': name.value,
    };
  }
}

enum PreferredResourceName {
  ec2InstanceTypes('Ec2InstanceTypes'),
  ;

  final String value;

  const PreferredResourceName(this.value);

  static PreferredResourceName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PreferredResourceName'));
}

/// Describes a projected utilization metric of a recommendation option, such as
/// an Amazon EC2 instance. This represents the projected utilization of a
/// recommendation option had you used that resource during the analyzed period.
///
/// Compare the utilization metric data of your resource against its projected
/// utilization metric data to determine the performance difference between your
/// current resource and the recommended option.
/// <note>
/// The <code>Cpu</code>, <code>Memory</code>, <code>GPU</code>, and
/// <code>GPU_MEMORY</code> metrics are the only projected utilization metrics
/// returned when you run the <a>GetEC2RecommendationProjectedMetrics</a>
/// action. Additionally, these metrics are only returned for resources with the
/// unified CloudWatch agent installed on them. For more information, see <a
/// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent">Enabling
/// Memory Utilization with the CloudWatch Agent</a> and <a
/// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#nvidia-cw-agent">Enabling
/// NVIDIA GPU utilization with the CloudWatch Agent</a>.
/// </note>
class ProjectedMetric {
  /// The name of the projected utilization metric.
  ///
  /// The following projected utilization metrics are returned:
  ///
  /// <ul>
  /// <li>
  /// <code>Cpu</code> - The projected percentage of allocated EC2 compute units
  /// that would be in use on the recommendation option had you used that resource
  /// during the analyzed period. This metric identifies the processing power
  /// required to run an application on the recommendation option.
  ///
  /// Depending on the instance type, tools in your operating system can show a
  /// lower percentage than CloudWatch when the instance is not allocated a full
  /// processor core.
  /// </li>
  /// <li>
  /// <code>Memory</code> - The percentage of memory that would be in use on the
  /// recommendation option had you used that resource during the analyzed period.
  /// This metric identifies the amount of memory required to run an application
  /// on the recommendation option.
  ///
  /// Units: Percent
  /// <note>
  /// The <code>Memory</code> metric is only returned for resources with the
  /// unified CloudWatch agent installed on them. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent">Enabling
  /// Memory Utilization with the CloudWatch Agent</a>.
  /// </note> </li>
  /// <li>
  /// <code>GPU</code> - The projected percentage of allocated GPUs if you adjust
  /// your configurations to Compute Optimizer's recommendation option.
  /// </li>
  /// <li>
  /// <code>GPU_MEMORY</code> - The projected percentage of total GPU memory if
  /// you adjust your configurations to Compute Optimizer's recommendation option.
  /// <note>
  /// The <code>GPU</code> and <code>GPU_MEMORY</code> metrics are only returned
  /// for resources with the unified CloudWatch Agent installed on them. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#nvidia-cw-agent">Enabling
  /// NVIDIA GPU utilization with the CloudWatch Agent</a>.
  /// </note> </li>
  /// </ul>
  final MetricName? name;

  /// The timestamps of the projected utilization metric.
  final List<DateTime>? timestamps;

  /// The values of the projected utilization metrics.
  final List<double>? values;

  ProjectedMetric({
    this.name,
    this.timestamps,
    this.values,
  });

  factory ProjectedMetric.fromJson(Map<String, dynamic> json) {
    return ProjectedMetric(
      name: (json['name'] as String?)?.let(MetricName.fromString),
      timestamps: (json['timestamps'] as List?)
          ?.nonNulls
          .map(nonNullableTimeStampFromJson)
          .toList(),
      values:
          (json['values'] as List?)?.nonNulls.map((e) => e as double).toList(),
    );
  }
}

class PutRecommendationPreferencesResponse {
  PutRecommendationPreferencesResponse();

  factory PutRecommendationPreferencesResponse.fromJson(
      Map<String, dynamic> _) {
    return PutRecommendationPreferencesResponse();
  }
}

/// A summary of a finding reason code.
class ReasonCodeSummary {
  /// The name of the finding reason code.
  final FindingReasonCode? name;

  /// The value of the finding reason code summary.
  final double? value;

  ReasonCodeSummary({
    this.name,
    this.value,
  });

  factory ReasonCodeSummary.fromJson(Map<String, dynamic> json) {
    return ReasonCodeSummary(
      name: (json['name'] as String?)?.let(FindingReasonCode.fromString),
      value: json['value'] as double?,
    );
  }
}

/// Describes a recommendation export job.
///
/// Use the <a>DescribeRecommendationExportJobs</a> action to view your
/// recommendation export jobs.
///
/// Use the <a>ExportAutoScalingGroupRecommendations</a> or
/// <a>ExportEC2InstanceRecommendations</a> actions to request an export of your
/// recommendations.
class RecommendationExportJob {
  /// The timestamp of when the export job was created.
  final DateTime? creationTimestamp;

  /// An object that describes the destination of the export file.
  final ExportDestination? destination;

  /// The reason for an export job failure.
  final String? failureReason;

  /// The identification number of the export job.
  final String? jobId;

  /// The timestamp of when the export job was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The resource type of the exported recommendations.
  final ResourceType? resourceType;

  /// The status of the export job.
  final JobStatus? status;

  RecommendationExportJob({
    this.creationTimestamp,
    this.destination,
    this.failureReason,
    this.jobId,
    this.lastUpdatedTimestamp,
    this.resourceType,
    this.status,
  });

  factory RecommendationExportJob.fromJson(Map<String, dynamic> json) {
    return RecommendationExportJob(
      creationTimestamp: timeStampFromJson(json['creationTimestamp']),
      destination: json['destination'] != null
          ? ExportDestination.fromJson(
              json['destination'] as Map<String, dynamic>)
          : null,
      failureReason: json['failureReason'] as String?,
      jobId: json['jobId'] as String?,
      lastUpdatedTimestamp: timeStampFromJson(json['lastUpdatedTimestamp']),
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
      status: (json['status'] as String?)?.let(JobStatus.fromString),
    );
  }
}

enum RecommendationPreferenceName {
  enhancedInfrastructureMetrics('EnhancedInfrastructureMetrics'),
  inferredWorkloadTypes('InferredWorkloadTypes'),
  externalMetricsPreference('ExternalMetricsPreference'),
  lookBackPeriodPreference('LookBackPeriodPreference'),
  preferredResources('PreferredResources'),
  utilizationPreferences('UtilizationPreferences'),
  ;

  final String value;

  const RecommendationPreferenceName(this.value);

  static RecommendationPreferenceName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RecommendationPreferenceName'));
}

/// Describes the recommendation preferences to return in the response of a
/// <a>GetAutoScalingGroupRecommendations</a>,
/// <a>GetEC2InstanceRecommendations</a>, and
/// <a>GetEC2RecommendationProjectedMetrics</a> request.
class RecommendationPreferences {
  /// Specifies the CPU vendor and architecture for Amazon EC2 instance and Auto
  /// Scaling group recommendations.
  ///
  /// For example, when you specify <code>AWS_ARM64</code> with:
  ///
  /// <ul>
  /// <li>
  /// A <a>GetEC2InstanceRecommendations</a> or
  /// <a>GetAutoScalingGroupRecommendations</a> request, Compute Optimizer returns
  /// recommendations that consist of Graviton2 instance types only.
  /// </li>
  /// <li>
  /// A <a>GetEC2RecommendationProjectedMetrics</a> request, Compute Optimizer
  /// returns projected utilization metrics for Graviton2 instance type
  /// recommendations only.
  /// </li>
  /// <li>
  /// A <a>ExportEC2InstanceRecommendations</a> or
  /// <a>ExportAutoScalingGroupRecommendations</a> request, Compute Optimizer
  /// exports recommendations that consist of Graviton2 instance types only.
  /// </li>
  /// </ul>
  final List<CpuVendorArchitecture>? cpuVendorArchitectures;

  RecommendationPreferences({
    this.cpuVendorArchitectures,
  });

  Map<String, dynamic> toJson() {
    final cpuVendorArchitectures = this.cpuVendorArchitectures;
    return {
      if (cpuVendorArchitectures != null)
        'cpuVendorArchitectures':
            cpuVendorArchitectures.map((e) => e.value).toList(),
    };
  }
}

/// Describes a recommendation preference.
class RecommendationPreferencesDetail {
  /// The status of the enhanced infrastructure metrics recommendation preference.
  ///
  /// When the recommendations page is refreshed, a status of <code>Active</code>
  /// confirms that the preference is applied to the recommendations, and a status
  /// of <code>Inactive</code> confirms that the preference isn't yet applied to
  /// recommendations.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html">Enhanced
  /// infrastructure metrics</a> in the <i>Compute Optimizer User Guide</i>.
  final EnhancedInfrastructureMetrics? enhancedInfrastructureMetrics;

  /// An object that describes the external metrics recommendation preference.
  ///
  /// If the preference is applied in the latest recommendation refresh, an object
  /// with a valid <code>source</code> value appears in the response. If the
  /// preference isn't applied to the recommendations already, then this object
  /// doesn't appear in the response.
  final ExternalMetricsPreference? externalMetricsPreference;

  /// The status of the inferred workload types recommendation preference.
  ///
  /// When the recommendations page is refreshed, a status of <code>Active</code>
  /// confirms that the preference is applied to the recommendations, and a status
  /// of <code>Inactive</code> confirms that the preference isn't yet applied to
  /// recommendations.
  final InferredWorkloadTypesPreference? inferredWorkloadTypes;

  /// The preference to control the number of days the utilization metrics of the
  /// Amazon Web Services resource are analyzed. If the preference isn’t set, this
  /// object is null.
  final LookBackPeriodPreference? lookBackPeriod;

  /// The preference to control which resource type values are considered when
  /// generating rightsizing recommendations. This object resolves any wildcard
  /// expressions and returns the effective list of candidate resource type
  /// values. If the preference isn’t set, this object is null.
  final List<EffectivePreferredResource>? preferredResources;

  /// The target resource type of the recommendation preference to create.
  ///
  /// The <code>Ec2Instance</code> option encompasses standalone instances and
  /// instances that are part of Auto Scaling groups. The
  /// <code>AutoScalingGroup</code> option encompasses only instances that are
  /// part of an Auto Scaling group.
  final ResourceType? resourceType;

  /// Describes the savings estimation mode used for calculating savings
  /// opportunity.
  ///
  /// Only the account manager or delegated administrator of your organization can
  /// activate this preference.
  final SavingsEstimationMode? savingsEstimationMode;

  /// An object that describes the scope of the recommendation preference.
  ///
  /// Recommendation preferences can be created at the organization level (for
  /// management accounts of an organization only), account level, and resource
  /// level. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html">Activating
  /// enhanced infrastructure metrics</a> in the <i>Compute Optimizer User
  /// Guide</i>.
  final Scope? scope;

  /// The preference to control the resource’s CPU utilization threshold, CPU
  /// utilization headroom, and memory utilization headroom. If the preference
  /// isn’t set, this object is null.
  /// <note>
  /// This preference is only available for the Amazon EC2 instance resource type.
  /// </note>
  final List<UtilizationPreference>? utilizationPreferences;

  RecommendationPreferencesDetail({
    this.enhancedInfrastructureMetrics,
    this.externalMetricsPreference,
    this.inferredWorkloadTypes,
    this.lookBackPeriod,
    this.preferredResources,
    this.resourceType,
    this.savingsEstimationMode,
    this.scope,
    this.utilizationPreferences,
  });

  factory RecommendationPreferencesDetail.fromJson(Map<String, dynamic> json) {
    return RecommendationPreferencesDetail(
      enhancedInfrastructureMetrics:
          (json['enhancedInfrastructureMetrics'] as String?)
              ?.let(EnhancedInfrastructureMetrics.fromString),
      externalMetricsPreference: json['externalMetricsPreference'] != null
          ? ExternalMetricsPreference.fromJson(
              json['externalMetricsPreference'] as Map<String, dynamic>)
          : null,
      inferredWorkloadTypes: (json['inferredWorkloadTypes'] as String?)
          ?.let(InferredWorkloadTypesPreference.fromString),
      lookBackPeriod: (json['lookBackPeriod'] as String?)
          ?.let(LookBackPeriodPreference.fromString),
      preferredResources: (json['preferredResources'] as List?)
          ?.nonNulls
          .map((e) =>
              EffectivePreferredResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
      savingsEstimationMode: (json['savingsEstimationMode'] as String?)
          ?.let(SavingsEstimationMode.fromString),
      scope: json['scope'] != null
          ? Scope.fromJson(json['scope'] as Map<String, dynamic>)
          : null,
      utilizationPreferences: (json['utilizationPreferences'] as List?)
          ?.nonNulls
          .map((e) => UtilizationPreference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Describes the source of a recommendation, such as an Amazon EC2 instance or
/// Auto Scaling group.
class RecommendationSource {
  /// The Amazon Resource Name (ARN) of the recommendation source.
  final String? recommendationSourceArn;

  /// The resource type of the recommendation source.
  final RecommendationSourceType? recommendationSourceType;

  RecommendationSource({
    this.recommendationSourceArn,
    this.recommendationSourceType,
  });

  factory RecommendationSource.fromJson(Map<String, dynamic> json) {
    return RecommendationSource(
      recommendationSourceArn: json['recommendationSourceArn'] as String?,
      recommendationSourceType: (json['recommendationSourceType'] as String?)
          ?.let(RecommendationSourceType.fromString),
    );
  }
}

enum RecommendationSourceType {
  ec2Instance('Ec2Instance'),
  autoScalingGroup('AutoScalingGroup'),
  ebsVolume('EbsVolume'),
  lambdaFunction('LambdaFunction'),
  ecsService('EcsService'),
  license('License'),
  ;

  final String value;

  const RecommendationSourceType(this.value);

  static RecommendationSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RecommendationSourceType'));
}

/// A summary of a recommendation.
class RecommendationSummary {
  /// The Amazon Web Services account ID of the recommendation summary.
  final String? accountId;

  /// An object that describes the performance risk ratings for a given resource
  /// type.
  final CurrentPerformanceRiskRatings? currentPerformanceRiskRatings;

  /// An array of objects that describes the estimated monthly saving amounts for
  /// the instances running on the specified <code>inferredWorkloadTypes</code>.
  /// The array contains the top five savings opportunites for the instances that
  /// run inferred workload types.
  final List<InferredWorkloadSaving>? inferredWorkloadSavings;

  /// The resource type that the recommendation summary applies to.
  final RecommendationSourceType? recommendationResourceType;

  /// An object that describes the savings opportunity for a given resource type.
  /// Savings opportunity includes the estimated monthly savings amount and
  /// percentage.
  final SavingsOpportunity? savingsOpportunity;

  /// An array of objects that describe a recommendation summary.
  final List<Summary>? summaries;

  RecommendationSummary({
    this.accountId,
    this.currentPerformanceRiskRatings,
    this.inferredWorkloadSavings,
    this.recommendationResourceType,
    this.savingsOpportunity,
    this.summaries,
  });

  factory RecommendationSummary.fromJson(Map<String, dynamic> json) {
    return RecommendationSummary(
      accountId: json['accountId'] as String?,
      currentPerformanceRiskRatings:
          json['currentPerformanceRiskRatings'] != null
              ? CurrentPerformanceRiskRatings.fromJson(
                  json['currentPerformanceRiskRatings'] as Map<String, dynamic>)
              : null,
      inferredWorkloadSavings: (json['inferredWorkloadSavings'] as List?)
          ?.nonNulls
          .map(
              (e) => InferredWorkloadSaving.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendationResourceType:
          (json['recommendationResourceType'] as String?)
              ?.let(RecommendationSourceType.fromString),
      savingsOpportunity: json['savingsOpportunity'] != null
          ? SavingsOpportunity.fromJson(
              json['savingsOpportunity'] as Map<String, dynamic>)
          : null,
      summaries: (json['summaries'] as List?)
          ?.nonNulls
          .map((e) => Summary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Describes a projected utilization metric of a recommendation option.
/// <note>
/// The <code>Cpu</code> and <code>Memory</code> metrics are the only projected
/// utilization metrics returned when you run the
/// <a>GetEC2RecommendationProjectedMetrics</a> action. Additionally, the
/// <code>Memory</code> metric is returned only for resources that have the
/// unified CloudWatch agent installed on them. For more information, see <a
/// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent">Enabling
/// Memory Utilization with the CloudWatch Agent</a>.
/// </note>
class RecommendedOptionProjectedMetric {
  /// An array of objects that describe a projected utilization metric.
  final List<ProjectedMetric>? projectedMetrics;

  /// The rank of the recommendation option projected metric.
  ///
  /// The top recommendation option is ranked as <code>1</code>.
  ///
  /// The projected metric rank correlates to the recommendation option rank. For
  /// example, the projected metric ranked as <code>1</code> is related to the
  /// recommendation option that is also ranked as <code>1</code> in the same
  /// response.
  final int? rank;

  /// The recommended instance type.
  final String? recommendedInstanceType;

  RecommendedOptionProjectedMetric({
    this.projectedMetrics,
    this.rank,
    this.recommendedInstanceType,
  });

  factory RecommendedOptionProjectedMetric.fromJson(Map<String, dynamic> json) {
    return RecommendedOptionProjectedMetric(
      projectedMetrics: (json['projectedMetrics'] as List?)
          ?.nonNulls
          .map((e) => ProjectedMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      rank: json['rank'] as int?,
      recommendedInstanceType: json['recommendedInstanceType'] as String?,
    );
  }
}

enum ResourceType {
  ec2Instance('Ec2Instance'),
  autoScalingGroup('AutoScalingGroup'),
  ebsVolume('EbsVolume'),
  lambdaFunction('LambdaFunction'),
  notApplicable('NotApplicable'),
  ecsService('EcsService'),
  license('License'),
  ;

  final String value;

  const ResourceType(this.value);

  static ResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ResourceType'));
}

/// Describes the destination Amazon Simple Storage Service (Amazon S3) bucket
/// name and object keys of a recommendations export file, and its associated
/// metadata file.
class S3Destination {
  /// The name of the Amazon S3 bucket used as the destination of an export file.
  final String? bucket;

  /// The Amazon S3 bucket key of an export file.
  ///
  /// The key uniquely identifies the object, or export file, in the S3 bucket.
  final String? key;

  /// The Amazon S3 bucket key of a metadata file.
  ///
  /// The key uniquely identifies the object, or metadata file, in the S3 bucket.
  final String? metadataKey;

  S3Destination({
    this.bucket,
    this.key,
    this.metadataKey,
  });

  factory S3Destination.fromJson(Map<String, dynamic> json) {
    return S3Destination(
      bucket: json['bucket'] as String?,
      key: json['key'] as String?,
      metadataKey: json['metadataKey'] as String?,
    );
  }
}

/// Describes the destination Amazon Simple Storage Service (Amazon S3) bucket
/// name and key prefix for a recommendations export job.
///
/// You must create the destination Amazon S3 bucket for your recommendations
/// export before you create the export job. Compute Optimizer does not create
/// the S3 bucket for you. After you create the S3 bucket, ensure that it has
/// the required permission policy to allow Compute Optimizer to write the
/// export file to it. If you plan to specify an object prefix when you create
/// the export job, you must include the object prefix in the policy that you
/// add to the S3 bucket. For more information, see <a
/// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html">Amazon
/// S3 Bucket Policy for Compute Optimizer</a> in the <i>Compute Optimizer User
/// Guide</i>.
class S3DestinationConfig {
  /// The name of the Amazon S3 bucket to use as the destination for an export
  /// job.
  final String? bucket;

  /// The Amazon S3 bucket prefix for an export job.
  final String? keyPrefix;

  S3DestinationConfig({
    this.bucket,
    this.keyPrefix,
  });

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPrefix = this.keyPrefix;
    return {
      if (bucket != null) 'bucket': bucket,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

enum SavingsEstimationMode {
  afterDiscounts('AfterDiscounts'),
  beforeDiscounts('BeforeDiscounts'),
  ;

  final String value;

  const SavingsEstimationMode(this.value);

  static SavingsEstimationMode fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum SavingsEstimationMode'));
}

/// Describes the savings opportunity for recommendations of a given resource
/// type or for the recommendation option of an individual resource.
///
/// Savings opportunity represents the estimated monthly savings you can achieve
/// by implementing a given Compute Optimizer recommendation.
/// <important>
/// Savings opportunity data requires that you opt in to Cost Explorer, as well
/// as activate <b>Receive Amazon EC2 resource recommendations</b> in the Cost
/// Explorer preferences page. That creates a connection between Cost Explorer
/// and Compute Optimizer. With this connection, Cost Explorer generates savings
/// estimates considering the price of existing resources, the price of
/// recommended resources, and historical usage data. Estimated monthly savings
/// reflects the projected dollar savings associated with each of the
/// recommendations generated. For more information, see <a
/// href="https://docs.aws.amazon.com/cost-management/latest/userguide/ce-enable.html">Enabling
/// Cost Explorer</a> and <a
/// href="https://docs.aws.amazon.com/cost-management/latest/userguide/ce-rightsizing.html">Optimizing
/// your cost with Rightsizing Recommendations</a> in the <i>Cost Management
/// User Guide</i>.
/// </important>
class SavingsOpportunity {
  /// An object that describes the estimated monthly savings amount possible by
  /// adopting Compute Optimizer recommendations for a given resource. This is
  /// based on the On-Demand instance pricing..
  final EstimatedMonthlySavings? estimatedMonthlySavings;

  /// The estimated monthly savings possible as a percentage of monthly cost by
  /// adopting Compute Optimizer recommendations for a given resource.
  final double? savingsOpportunityPercentage;

  SavingsOpportunity({
    this.estimatedMonthlySavings,
    this.savingsOpportunityPercentage,
  });

  factory SavingsOpportunity.fromJson(Map<String, dynamic> json) {
    return SavingsOpportunity(
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? EstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
      savingsOpportunityPercentage:
          json['savingsOpportunityPercentage'] as double?,
    );
  }
}

/// Describes the scope of a recommendation preference.
///
/// Recommendation preferences can be created at the organization level (for
/// management accounts of an organization only), account level, and resource
/// level. For more information, see <a
/// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html">Activating
/// enhanced infrastructure metrics</a> in the <i>Compute Optimizer User
/// Guide</i>.
/// <note>
/// You cannot create recommendation preferences for Auto Scaling groups at the
/// organization and account levels. You can create recommendation preferences
/// for Auto Scaling groups only at the resource level by specifying a scope
/// name of <code>ResourceArn</code> and a scope value of the Auto Scaling group
/// Amazon Resource Name (ARN). This will configure the preference for all
/// instances that are part of the specified Auto Scaling group. You also cannot
/// create recommendation preferences at the resource level for instances that
/// are part of an Auto Scaling group. You can create recommendation preferences
/// at the resource level only for standalone instances.
/// </note>
class Scope {
  /// The name of the scope.
  ///
  /// The following scopes are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>Organization</code> - Specifies that the recommendation preference
  /// applies at the organization level, for all member accounts of an
  /// organization.
  /// </li>
  /// <li>
  /// <code>AccountId</code> - Specifies that the recommendation preference
  /// applies at the account level, for all resources of a given resource type in
  /// an account.
  /// </li>
  /// <li>
  /// <code>ResourceArn</code> - Specifies that the recommendation preference
  /// applies at the individual resource level.
  /// </li>
  /// </ul>
  final ScopeName? name;

  /// The value of the scope.
  ///
  /// If you specified the <code>name</code> of the scope as:
  ///
  /// <ul>
  /// <li>
  /// <code>Organization</code> - The <code>value</code> must be
  /// <code>ALL_ACCOUNTS</code>.
  /// </li>
  /// <li>
  /// <code>AccountId</code> - The <code>value</code> must be a 12-digit Amazon
  /// Web Services account ID.
  /// </li>
  /// <li>
  /// <code>ResourceArn</code> - The <code>value</code> must be the Amazon
  /// Resource Name (ARN) of an EC2 instance or an Auto Scaling group.
  /// </li>
  /// </ul>
  /// Only EC2 instance and Auto Scaling group ARNs are currently supported.
  final String? value;

  Scope({
    this.name,
    this.value,
  });

  factory Scope.fromJson(Map<String, dynamic> json) {
    return Scope(
      name: (json['name'] as String?)?.let(ScopeName.fromString),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name.value,
      if (value != null) 'value': value,
    };
  }
}

enum ScopeName {
  organization('Organization'),
  accountId('AccountId'),
  resourceArn('ResourceArn'),
  ;

  final String value;

  const ScopeName(this.value);

  static ScopeName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ScopeName'));
}

/// The Amazon ECS service configurations used for recommendations.
class ServiceConfiguration {
  /// Describes the Auto Scaling configuration methods for an Amazon ECS service.
  /// This affects the generated recommendations. For example, if Auto Scaling is
  /// configured on a service’s CPU, then Compute Optimizer doesn’t generate CPU
  /// size recommendations.
  ///
  /// The Auto Scaling configuration methods include:
  ///
  /// <ul>
  /// <li>
  /// <code>TARGET_TRACKING_SCALING_CPU</code> — If the Amazon ECS service is
  /// configured to use target scaling on CPU, Compute Optimizer doesn't generate
  /// CPU recommendations.
  /// </li>
  /// <li>
  /// <code>TARGET_TRACKING_SCALING_MEMORY</code> — If the Amazon ECS service is
  /// configured to use target scaling on memory, Compute Optimizer doesn't
  /// generate memory recommendations.
  /// </li>
  /// </ul>
  /// For more information about step scaling and target scaling, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">
  /// Step scaling policies for Application Auto Scaling</a> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">
  /// Target tracking scaling policies for Application Auto Scaling</a> in the
  /// <i>Application Auto Scaling User Guide</i>.
  final AutoScalingConfiguration? autoScalingConfiguration;

  /// The container configurations within a task of an Amazon ECS service.
  final List<ContainerConfiguration>? containerConfigurations;

  /// The number of CPU units used by the tasks in the Amazon ECS service.
  final int? cpu;

  /// The amount of memory used by the tasks in the Amazon ECS service.
  final int? memory;

  /// The task definition ARN used by the tasks in the Amazon ECS service.
  final String? taskDefinitionArn;

  ServiceConfiguration({
    this.autoScalingConfiguration,
    this.containerConfigurations,
    this.cpu,
    this.memory,
    this.taskDefinitionArn,
  });

  factory ServiceConfiguration.fromJson(Map<String, dynamic> json) {
    return ServiceConfiguration(
      autoScalingConfiguration: (json['autoScalingConfiguration'] as String?)
          ?.let(AutoScalingConfiguration.fromString),
      containerConfigurations: (json['containerConfigurations'] as List?)
          ?.nonNulls
          .map(
              (e) => ContainerConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      cpu: json['cpu'] as int?,
      memory: json['memory'] as int?,
      taskDefinitionArn: json['taskDefinitionArn'] as String?,
    );
  }
}

enum Status {
  active('Active'),
  inactive('Inactive'),
  pending('Pending'),
  failed('Failed'),
  ;

  final String value;

  const Status(this.value);

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Status'));
}

/// The summary of a recommendation.
class Summary {
  /// The finding classification of the recommendation.
  final Finding? name;

  /// An array of objects that summarize a finding reason code.
  final List<ReasonCodeSummary>? reasonCodeSummaries;

  /// The value of the recommendation summary.
  final double? value;

  Summary({
    this.name,
    this.reasonCodeSummaries,
    this.value,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      name: (json['name'] as String?)?.let(Finding.fromString),
      reasonCodeSummaries: (json['reasonCodeSummaries'] as List?)
          ?.nonNulls
          .map((e) => ReasonCodeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      value: json['value'] as double?,
    );
  }
}

/// A list of tag key and value pairs that you define.
class Tag {
  /// One part of a key-value pair that makes up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String? key;

  /// One part of a key-value pair that make up a tag. A value acts as a
  /// descriptor within a tag category (key). The value can be empty or null.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }
}

class UpdateEnrollmentStatusResponse {
  /// The enrollment status of the account.
  final Status? status;

  /// The reason for the enrollment status of the account. For example, an account
  /// might show a status of <code>Pending</code> because member accounts of an
  /// organization require more time to be enrolled in the service.
  final String? statusReason;

  UpdateEnrollmentStatusResponse({
    this.status,
    this.statusReason,
  });

  factory UpdateEnrollmentStatusResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEnrollmentStatusResponse(
      status: (json['status'] as String?)?.let(Status.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }
}

/// Describes a utilization metric of a resource, such as an Amazon EC2
/// instance.
///
/// Compare the utilization metric data of your resource against its projected
/// utilization metric data to determine the performance difference between your
/// current resource and the recommended option.
class UtilizationMetric {
  /// The name of the utilization metric.
  ///
  /// The following utilization metrics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Cpu</code> - The percentage of allocated EC2 compute units that are
  /// currently in use on the instance. This metric identifies the processing
  /// power required to run an application on the instance.
  ///
  /// Depending on the instance type, tools in your operating system can show a
  /// lower percentage than CloudWatch when the instance is not allocated a full
  /// processor core.
  ///
  /// Units: Percent
  /// </li>
  /// <li>
  /// <code>Memory</code> - The percentage of memory that is currently in use on
  /// the instance. This metric identifies the amount of memory required to run an
  /// application on the instance.
  ///
  /// Units: Percent
  /// <note>
  /// The <code>Memory</code> metric is returned only for resources that have the
  /// unified CloudWatch agent installed on them. For more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent">Enabling
  /// Memory Utilization with the CloudWatch Agent</a>.
  /// </note> </li>
  /// <li>
  /// <code>GPU</code> - The percentage of allocated GPUs that currently run on
  /// the instance.
  /// </li>
  /// <li>
  /// <code>GPU_MEMORY</code> - The percentage of total GPU memory that currently
  /// runs on the instance.
  /// <note>
  /// The <code>GPU</code> and <code>GPU_MEMORY</code> metrics are only returned
  /// for resources with the unified CloudWatch Agent installed on them. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#nvidia-cw-agent">Enabling
  /// NVIDIA GPU utilization with the CloudWatch Agent</a>.
  /// </note> </li>
  /// <li>
  /// <code>EBS_READ_OPS_PER_SECOND</code> - The completed read operations from
  /// all EBS volumes attached to the instance in a specified period of time.
  ///
  /// Unit: Count
  /// </li>
  /// <li>
  /// <code>EBS_WRITE_OPS_PER_SECOND</code> - The completed write operations to
  /// all EBS volumes attached to the instance in a specified period of time.
  ///
  /// Unit: Count
  /// </li>
  /// <li>
  /// <code>EBS_READ_BYTES_PER_SECOND</code> - The bytes read from all EBS volumes
  /// attached to the instance in a specified period of time.
  ///
  /// Unit: Bytes
  /// </li>
  /// <li>
  /// <code>EBS_WRITE_BYTES_PER_SECOND</code> - The bytes written to all EBS
  /// volumes attached to the instance in a specified period of time.
  ///
  /// Unit: Bytes
  /// </li>
  /// <li>
  /// <code>DISK_READ_OPS_PER_SECOND</code> - The completed read operations from
  /// all instance store volumes available to the instance in a specified period
  /// of time.
  ///
  /// If there are no instance store volumes, either the value is <code>0</code>
  /// or the metric is not reported.
  /// </li>
  /// <li>
  /// <code>DISK_WRITE_OPS_PER_SECOND</code> - The completed write operations from
  /// all instance store volumes available to the instance in a specified period
  /// of time.
  ///
  /// If there are no instance store volumes, either the value is <code>0</code>
  /// or the metric is not reported.
  /// </li>
  /// <li>
  /// <code>DISK_READ_BYTES_PER_SECOND</code> - The bytes read from all instance
  /// store volumes available to the instance. This metric is used to determine
  /// the volume of the data the application reads from the disk of the instance.
  /// This can be used to determine the speed of the application.
  ///
  /// If there are no instance store volumes, either the value is <code>0</code>
  /// or the metric is not reported.
  /// </li>
  /// <li>
  /// <code>DISK_WRITE_BYTES_PER_SECOND</code> - The bytes written to all instance
  /// store volumes available to the instance. This metric is used to determine
  /// the volume of the data the application writes onto the disk of the instance.
  /// This can be used to determine the speed of the application.
  ///
  /// If there are no instance store volumes, either the value is <code>0</code>
  /// or the metric is not reported.
  /// </li>
  /// <li>
  /// <code>NETWORK_IN_BYTES_PER_SECOND</code> - The number of bytes received by
  /// the instance on all network interfaces. This metric identifies the volume of
  /// incoming network traffic to a single instance.
  /// </li>
  /// <li>
  /// <code>NETWORK_OUT_BYTES_PER_SECOND</code> - The number of bytes sent out by
  /// the instance on all network interfaces. This metric identifies the volume of
  /// outgoing network traffic from a single instance.
  /// </li>
  /// <li>
  /// <code>NETWORK_PACKETS_IN_PER_SECOND</code> - The number of packets received
  /// by the instance on all network interfaces. This metric identifies the volume
  /// of incoming traffic in terms of the number of packets on a single instance.
  /// </li>
  /// <li>
  /// <code>NETWORK_PACKETS_OUT_PER_SECOND</code> - The number of packets sent out
  /// by the instance on all network interfaces. This metric identifies the volume
  /// of outgoing traffic in terms of the number of packets on a single instance.
  /// </li>
  /// </ul>
  final MetricName? name;

  /// The statistic of the utilization metric.
  ///
  /// The Compute Optimizer API, Command Line Interface (CLI), and SDKs return
  /// utilization metrics using only the <code>Maximum</code> statistic, which is
  /// the highest value observed during the specified period.
  ///
  /// The Compute Optimizer console displays graphs for some utilization metrics
  /// using the <code>Average</code> statistic, which is the value of
  /// <code>Sum</code> / <code>SampleCount</code> during the specified period. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html">Viewing
  /// resource recommendations</a> in the <i>Compute Optimizer User Guide</i>. You
  /// can also get averaged utilization metric data for your resources using
  /// Amazon CloudWatch. For more information, see the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html">Amazon
  /// CloudWatch User Guide</a>.
  final MetricStatistic? statistic;

  /// The value of the utilization metric.
  final double? value;

  UtilizationMetric({
    this.name,
    this.statistic,
    this.value,
  });

  factory UtilizationMetric.fromJson(Map<String, dynamic> json) {
    return UtilizationMetric(
      name: (json['name'] as String?)?.let(MetricName.fromString),
      statistic:
          (json['statistic'] as String?)?.let(MetricStatistic.fromString),
      value: json['value'] as double?,
    );
  }
}

/// The preference to control the resource’s CPU utilization thresholds -
/// threshold and headroom.
/// <note>
/// This preference is only available for the Amazon EC2 instance resource type.
/// </note>
class UtilizationPreference {
  /// The name of the resource utilization metric name to customize.
  final CustomizableMetricName? metricName;

  /// The parameters to set when customizing the resource utilization thresholds.
  final CustomizableMetricParameters? metricParameters;

  UtilizationPreference({
    this.metricName,
    this.metricParameters,
  });

  factory UtilizationPreference.fromJson(Map<String, dynamic> json) {
    return UtilizationPreference(
      metricName: (json['metricName'] as String?)
          ?.let(CustomizableMetricName.fromString),
      metricParameters: json['metricParameters'] != null
          ? CustomizableMetricParameters.fromJson(
              json['metricParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final metricParameters = this.metricParameters;
    return {
      if (metricName != null) 'metricName': metricName.value,
      if (metricParameters != null) 'metricParameters': metricParameters,
    };
  }
}

/// Describes the configuration of an Amazon Elastic Block Store (Amazon EBS)
/// volume.
class VolumeConfiguration {
  /// Contains the image used to boot the instance during launch.
  final bool? rootVolume;

  /// The baseline IOPS of the volume.
  final int? volumeBaselineIOPS;

  /// The baseline throughput of the volume.
  final int? volumeBaselineThroughput;

  /// The burst IOPS of the volume.
  final int? volumeBurstIOPS;

  /// The burst throughput of the volume.
  final int? volumeBurstThroughput;

  /// The size of the volume, in GiB.
  final int? volumeSize;

  /// The volume type.
  ///
  /// This can be <code>gp2</code> for General Purpose SSD, <code>io1</code> or
  /// <code>io2</code> for Provisioned IOPS SSD, <code>st1</code> for Throughput
  /// Optimized HDD, <code>sc1</code> for Cold HDD, or <code>standard</code> for
  /// Magnetic volumes.
  final String? volumeType;

  VolumeConfiguration({
    this.rootVolume,
    this.volumeBaselineIOPS,
    this.volumeBaselineThroughput,
    this.volumeBurstIOPS,
    this.volumeBurstThroughput,
    this.volumeSize,
    this.volumeType,
  });

  factory VolumeConfiguration.fromJson(Map<String, dynamic> json) {
    return VolumeConfiguration(
      rootVolume: json['rootVolume'] as bool?,
      volumeBaselineIOPS: json['volumeBaselineIOPS'] as int?,
      volumeBaselineThroughput: json['volumeBaselineThroughput'] as int?,
      volumeBurstIOPS: json['volumeBurstIOPS'] as int?,
      volumeBurstThroughput: json['volumeBurstThroughput'] as int?,
      volumeSize: json['volumeSize'] as int?,
      volumeType: json['volumeType'] as String?,
    );
  }
}

/// Describes an Amazon Elastic Block Store (Amazon EBS) volume recommendation.
class VolumeRecommendation {
  /// The Amazon Web Services account ID of the volume.
  final String? accountId;

  /// An array of objects that describe the current configuration of the volume.
  final VolumeConfiguration? currentConfiguration;

  /// The risk of the current EBS volume not meeting the performance needs of its
  /// workloads. The higher the risk, the more likely the current EBS volume
  /// doesn't have sufficient capacity.
  final CurrentPerformanceRisk? currentPerformanceRisk;

  /// Describes the effective recommendation preferences for Amazon EBS volume.
  final EBSEffectiveRecommendationPreferences?
      effectiveRecommendationPreferences;

  /// The finding classification of the volume.
  ///
  /// Findings for volumes include:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>NotOptimized</code> </b>—A volume is considered not optimized when
  /// Compute Optimizer identifies a recommendation that can provide better
  /// performance for your workload.
  /// </li>
  /// <li>
  /// <b> <code>Optimized</code> </b>—An volume is considered optimized when
  /// Compute Optimizer determines that the volume is correctly provisioned to run
  /// your workload based on the chosen volume type. For optimized resources,
  /// Compute Optimizer might recommend a new generation volume type.
  /// </li>
  /// </ul>
  final EBSFinding? finding;

  /// The timestamp of when the volume recommendation was last generated.
  final DateTime? lastRefreshTimestamp;

  /// The number of days for which utilization metrics were analyzed for the
  /// volume.
  final double? lookBackPeriodInDays;

  /// A list of tags assigned to your Amazon EBS volume recommendations.
  final List<Tag>? tags;

  /// An array of objects that describe the utilization metrics of the volume.
  final List<EBSUtilizationMetric>? utilizationMetrics;

  /// The Amazon Resource Name (ARN) of the current volume.
  final String? volumeArn;

  /// An array of objects that describe the recommendation options for the volume.
  final List<VolumeRecommendationOption>? volumeRecommendationOptions;

  VolumeRecommendation({
    this.accountId,
    this.currentConfiguration,
    this.currentPerformanceRisk,
    this.effectiveRecommendationPreferences,
    this.finding,
    this.lastRefreshTimestamp,
    this.lookBackPeriodInDays,
    this.tags,
    this.utilizationMetrics,
    this.volumeArn,
    this.volumeRecommendationOptions,
  });

  factory VolumeRecommendation.fromJson(Map<String, dynamic> json) {
    return VolumeRecommendation(
      accountId: json['accountId'] as String?,
      currentConfiguration: json['currentConfiguration'] != null
          ? VolumeConfiguration.fromJson(
              json['currentConfiguration'] as Map<String, dynamic>)
          : null,
      currentPerformanceRisk: (json['currentPerformanceRisk'] as String?)
          ?.let(CurrentPerformanceRisk.fromString),
      effectiveRecommendationPreferences:
          json['effectiveRecommendationPreferences'] != null
              ? EBSEffectiveRecommendationPreferences.fromJson(
                  json['effectiveRecommendationPreferences']
                      as Map<String, dynamic>)
              : null,
      finding: (json['finding'] as String?)?.let(EBSFinding.fromString),
      lastRefreshTimestamp: timeStampFromJson(json['lastRefreshTimestamp']),
      lookBackPeriodInDays: json['lookBackPeriodInDays'] as double?,
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      utilizationMetrics: (json['utilizationMetrics'] as List?)
          ?.nonNulls
          .map((e) => EBSUtilizationMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumeArn: json['volumeArn'] as String?,
      volumeRecommendationOptions: (json['volumeRecommendationOptions']
              as List?)
          ?.nonNulls
          .map((e) =>
              VolumeRecommendationOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Describes a recommendation option for an Amazon Elastic Block Store (Amazon
/// EBS) instance.
class VolumeRecommendationOption {
  /// An array of objects that describe a volume configuration.
  final VolumeConfiguration? configuration;

  /// The performance risk of the volume recommendation option.
  ///
  /// Performance risk is the likelihood of the recommended volume type meeting
  /// the performance requirement of your workload.
  ///
  /// The value ranges from <code>0</code> - <code>4</code>, with <code>0</code>
  /// meaning that the recommended resource is predicted to always provide enough
  /// hardware capability. The higher the performance risk is, the more likely you
  /// should validate whether the recommendation will meet the performance
  /// requirements of your workload before migrating your resource.
  final double? performanceRisk;

  /// The rank of the volume recommendation option.
  ///
  /// The top recommendation option is ranked as <code>1</code>.
  final int? rank;

  /// An object that describes the savings opportunity for the EBS volume
  /// recommendation option. Savings opportunity includes the estimated monthly
  /// savings amount and percentage.
  final SavingsOpportunity? savingsOpportunity;

  /// An object that describes the savings opportunity for the Amazon EBS volume
  /// recommendation option with specific discounts. Savings opportunity includes
  /// the estimated monthly savings and percentage.
  final EBSSavingsOpportunityAfterDiscounts? savingsOpportunityAfterDiscounts;

  VolumeRecommendationOption({
    this.configuration,
    this.performanceRisk,
    this.rank,
    this.savingsOpportunity,
    this.savingsOpportunityAfterDiscounts,
  });

  factory VolumeRecommendationOption.fromJson(Map<String, dynamic> json) {
    return VolumeRecommendationOption(
      configuration: json['configuration'] != null
          ? VolumeConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      performanceRisk: json['performanceRisk'] as double?,
      rank: json['rank'] as int?,
      savingsOpportunity: json['savingsOpportunity'] != null
          ? SavingsOpportunity.fromJson(
              json['savingsOpportunity'] as Map<String, dynamic>)
          : null,
      savingsOpportunityAfterDiscounts:
          json['savingsOpportunityAfterDiscounts'] != null
              ? EBSSavingsOpportunityAfterDiscounts.fromJson(
                  json['savingsOpportunityAfterDiscounts']
                      as Map<String, dynamic>)
              : null,
    );
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

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MissingAuthenticationToken extends _s.GenericAwsException {
  MissingAuthenticationToken({String? type, String? message})
      : super(type: type, code: 'MissingAuthenticationToken', message: message);
}

class OptInRequiredException extends _s.GenericAwsException {
  OptInRequiredException({String? type, String? message})
      : super(type: type, code: 'OptInRequiredException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MissingAuthenticationToken': (type, message) =>
      MissingAuthenticationToken(type: type, message: message),
  'OptInRequiredException': (type, message) =>
      OptInRequiredException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
