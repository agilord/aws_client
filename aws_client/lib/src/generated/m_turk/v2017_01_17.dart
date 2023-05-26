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

class MTurk {
  final _s.JsonProtocol _protocol;
  MTurk({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mturk-requester',
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

  /// The <code>AcceptQualificationRequest</code> operation approves a Worker's
  /// request for a Qualification.
  ///
  /// Only the owner of the Qualification type can grant a Qualification request
  /// for that type.
  ///
  /// A successful request for the <code>AcceptQualificationRequest</code>
  /// operation returns with no errors and an empty body.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [qualificationRequestId] :
  /// The ID of the Qualification request, as returned by the
  /// <code>GetQualificationRequests</code> operation.
  ///
  /// Parameter [integerValue] :
  /// The value of the Qualification. You can omit this value if you are using
  /// the presence or absence of the Qualification as the basis for a HIT
  /// requirement.
  Future<void> acceptQualificationRequest({
    required String qualificationRequestId,
    int? integerValue,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'MTurkRequesterServiceV20170117.AcceptQualificationRequest'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QualificationRequestId': qualificationRequestId,
        if (integerValue != null) 'IntegerValue': integerValue,
      },
    );
  }

  /// The <code>ApproveAssignment</code> operation approves the results of a
  /// completed assignment.
  ///
  /// Approving an assignment initiates two payments from the Requester's
  /// Amazon.com account
  ///
  /// <ul>
  /// <li>
  /// The Worker who submitted the results is paid the reward specified in the
  /// HIT.
  /// </li>
  /// <li>
  /// Amazon Mechanical Turk fees are debited.
  /// </li>
  /// </ul>
  /// If the Requester's account does not have adequate funds for these
  /// payments, the call to ApproveAssignment returns an exception, and the
  /// approval is not processed. You can include an optional feedback message
  /// with the approval, which the Worker can see in the Status section of the
  /// web site.
  ///
  /// You can also call this operation for assignments that were previous
  /// rejected and approve them by explicitly overriding the previous rejection.
  /// This only works on rejected assignments that were submitted within the
  /// previous 30 days and only if the assignment's related HIT has not been
  /// deleted.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [assignmentId] :
  /// The ID of the assignment. The assignment must correspond to a HIT created
  /// by the Requester.
  ///
  /// Parameter [overrideRejection] :
  /// A flag indicating that an assignment should be approved even if it was
  /// previously rejected. Defaults to <code>False</code>.
  ///
  /// Parameter [requesterFeedback] :
  /// A message for the Worker, which the Worker can see in the Status section
  /// of the web site.
  Future<void> approveAssignment({
    required String assignmentId,
    bool? overrideRejection,
    String? requesterFeedback,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.ApproveAssignment'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssignmentId': assignmentId,
        if (overrideRejection != null) 'OverrideRejection': overrideRejection,
        if (requesterFeedback != null) 'RequesterFeedback': requesterFeedback,
      },
    );
  }

  /// The <code>AssociateQualificationWithWorker</code> operation gives a Worker
  /// a Qualification. <code>AssociateQualificationWithWorker</code> does not
  /// require that the Worker submit a Qualification request. It gives the
  /// Qualification directly to the Worker.
  ///
  /// You can only assign a Qualification of a Qualification type that you
  /// created (using the <code>CreateQualificationType</code> operation).
  /// <note>
  /// Note: <code>AssociateQualificationWithWorker</code> does not affect any
  /// pending Qualification requests for the Qualification by the Worker. If you
  /// assign a Qualification to a Worker, then later grant a Qualification
  /// request made by the Worker, the granting of the request may modify the
  /// Qualification score. To resolve a pending Qualification request without
  /// affecting the Qualification the Worker already has, reject the request
  /// with the <code>RejectQualificationRequest</code> operation.
  /// </note>
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [qualificationTypeId] :
  /// The ID of the Qualification type to use for the assigned Qualification.
  ///
  /// Parameter [workerId] :
  /// The ID of the Worker to whom the Qualification is being assigned. Worker
  /// IDs are included with submitted HIT assignments and Qualification
  /// requests.
  ///
  /// Parameter [integerValue] :
  /// The value of the Qualification to assign.
  ///
  /// Parameter [sendNotification] :
  /// Specifies whether to send a notification email message to the Worker
  /// saying that the qualification was assigned to the Worker. Note: this is
  /// true by default.
  Future<void> associateQualificationWithWorker({
    required String qualificationTypeId,
    required String workerId,
    int? integerValue,
    bool? sendNotification,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'MTurkRequesterServiceV20170117.AssociateQualificationWithWorker'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QualificationTypeId': qualificationTypeId,
        'WorkerId': workerId,
        if (integerValue != null) 'IntegerValue': integerValue,
        if (sendNotification != null) 'SendNotification': sendNotification,
      },
    );
  }

  /// The <code>CreateAdditionalAssignmentsForHIT</code> operation increases the
  /// maximum number of assignments of an existing HIT.
  ///
  /// To extend the maximum number of assignments, specify the number of
  /// additional assignments.
  /// <note>
  /// <ul>
  /// <li>
  /// HITs created with fewer than 10 assignments cannot be extended to have 10
  /// or more assignments. Attempting to add assignments in a way that brings
  /// the total number of assignments for a HIT from fewer than 10 assignments
  /// to 10 or more assignments will result in an
  /// <code>AWS.MechanicalTurk.InvalidMaximumAssignmentsIncrease</code>
  /// exception.
  /// </li>
  /// <li>
  /// HITs that were created before July 22, 2015 cannot be extended. Attempting
  /// to extend HITs that were created before July 22, 2015 will result in an
  /// <code>AWS.MechanicalTurk.HITTooOldForExtension</code> exception.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [hITId] :
  /// The ID of the HIT to extend.
  ///
  /// Parameter [numberOfAdditionalAssignments] :
  /// The number of additional assignments to request for this HIT.
  ///
  /// Parameter [uniqueRequestToken] :
  /// A unique identifier for this request, which allows you to retry the call
  /// on error without extending the HIT multiple times. This is useful in cases
  /// such as network timeouts where it is unclear whether or not the call
  /// succeeded on the server. If the extend HIT already exists in the system
  /// from a previous call using the same <code>UniqueRequestToken</code>,
  /// subsequent calls will return an error with a message containing the
  /// request ID.
  Future<void> createAdditionalAssignmentsForHIT({
    required String hITId,
    required int numberOfAdditionalAssignments,
    String? uniqueRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'MTurkRequesterServiceV20170117.CreateAdditionalAssignmentsForHIT'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HITId': hITId,
        'NumberOfAdditionalAssignments': numberOfAdditionalAssignments,
        if (uniqueRequestToken != null)
          'UniqueRequestToken': uniqueRequestToken,
      },
    );
  }

  /// The <code>CreateHIT</code> operation creates a new Human Intelligence Task
  /// (HIT). The new HIT is made available for Workers to find and accept on the
  /// Amazon Mechanical Turk website.
  ///
  /// This operation allows you to specify a new HIT by passing in values for
  /// the properties of the HIT, such as its title, reward amount and number of
  /// assignments. When you pass these values to <code>CreateHIT</code>, a new
  /// HIT is created for you, with a new <code>HITTypeID</code>. The HITTypeID
  /// can be used to create additional HITs in the future without needing to
  /// specify common parameters such as the title, description and reward amount
  /// each time.
  ///
  /// An alternative way to create HITs is to first generate a HITTypeID using
  /// the <code>CreateHITType</code> operation and then call the
  /// <code>CreateHITWithHITType</code> operation. This is the recommended best
  /// practice for Requesters who are creating large numbers of HITs.
  ///
  /// CreateHIT also supports several ways to provide question data: by
  /// providing a value for the <code>Question</code> parameter that fully
  /// specifies the contents of the HIT, or by providing a
  /// <code>HitLayoutId</code> and associated <code>HitLayoutParameters</code>.
  /// <note>
  /// If a HIT is created with 10 or more maximum assignments, there is an
  /// additional fee. For more information, see <a
  /// href="https://requester.mturk.com/pricing">Amazon Mechanical Turk
  /// Pricing</a>.
  /// </note>
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [assignmentDurationInSeconds] :
  /// The amount of time, in seconds, that a Worker has to complete the HIT
  /// after accepting it. If a Worker does not complete the assignment within
  /// the specified duration, the assignment is considered abandoned. If the HIT
  /// is still active (that is, its lifetime has not elapsed), the assignment
  /// becomes available for other users to find and accept.
  ///
  /// Parameter [description] :
  /// A general description of the HIT. A description includes detailed
  /// information about the kind of task the HIT contains. On the Amazon
  /// Mechanical Turk web site, the HIT description appears in the expanded view
  /// of search results, and in the HIT and assignment screens. A good
  /// description gives the user enough information to evaluate the HIT before
  /// accepting it.
  ///
  /// Parameter [lifetimeInSeconds] :
  /// An amount of time, in seconds, after which the HIT is no longer available
  /// for users to accept. After the lifetime of the HIT elapses, the HIT no
  /// longer appears in HIT searches, even if not all of the assignments for the
  /// HIT have been accepted.
  ///
  /// Parameter [reward] :
  /// The amount of money the Requester will pay a Worker for successfully
  /// completing the HIT.
  ///
  /// Parameter [title] :
  /// The title of the HIT. A title should be short and descriptive about the
  /// kind of task the HIT contains. On the Amazon Mechanical Turk web site, the
  /// HIT title appears in search results, and everywhere the HIT is mentioned.
  ///
  /// Parameter [assignmentReviewPolicy] :
  /// The Assignment-level Review Policy applies to the assignments under the
  /// HIT. You can specify for Mechanical Turk to take various actions based on
  /// the policy.
  ///
  /// Parameter [autoApprovalDelayInSeconds] :
  /// The number of seconds after an assignment for the HIT has been submitted,
  /// after which the assignment is considered Approved automatically unless the
  /// Requester explicitly rejects it.
  ///
  /// Parameter [hITLayoutId] :
  /// The HITLayoutId allows you to use a pre-existing HIT design with
  /// placeholder values and create an additional HIT by providing those values
  /// as HITLayoutParameters.
  ///
  /// Constraints: Either a Question parameter or a HITLayoutId parameter must
  /// be provided.
  ///
  /// Parameter [hITLayoutParameters] :
  /// If the HITLayoutId is provided, any placeholder values must be filled in
  /// with values using the HITLayoutParameter structure. For more information,
  /// see HITLayout.
  ///
  /// Parameter [hITReviewPolicy] :
  /// The HIT-level Review Policy applies to the HIT. You can specify for
  /// Mechanical Turk to take various actions based on the policy.
  ///
  /// Parameter [keywords] :
  /// One or more words or phrases that describe the HIT, separated by commas.
  /// These words are used in searches to find HITs.
  ///
  /// Parameter [maxAssignments] :
  /// The number of times the HIT can be accepted and completed before the HIT
  /// becomes unavailable.
  ///
  /// Parameter [qualificationRequirements] :
  /// Conditions that a Worker's Qualifications must meet in order to accept the
  /// HIT. A HIT can have between zero and ten Qualification requirements. All
  /// requirements must be met in order for a Worker to accept the HIT.
  /// Additionally, other actions can be restricted using the
  /// <code>ActionsGuarded</code> field on each
  /// <code>QualificationRequirement</code> structure.
  ///
  /// Parameter [question] :
  /// The data the person completing the HIT uses to produce the results.
  ///
  /// Constraints: Must be a QuestionForm data structure, an ExternalQuestion
  /// data structure, or an HTMLQuestion data structure. The XML question data
  /// must not be larger than 64 kilobytes (65,535 bytes) in size, including
  /// whitespace.
  ///
  /// Either a Question parameter or a HITLayoutId parameter must be provided.
  ///
  /// Parameter [requesterAnnotation] :
  /// An arbitrary data field. The RequesterAnnotation parameter lets your
  /// application attach arbitrary data to the HIT for tracking purposes. For
  /// example, this parameter could be an identifier internal to the Requester's
  /// application that corresponds with the HIT.
  ///
  /// The RequesterAnnotation parameter for a HIT is only visible to the
  /// Requester who created the HIT. It is not shown to the Worker, or any other
  /// Requester.
  ///
  /// The RequesterAnnotation parameter may be different for each HIT you
  /// submit. It does not affect how your HITs are grouped.
  ///
  /// Parameter [uniqueRequestToken] :
  /// A unique identifier for this request which allows you to retry the call on
  /// error without creating duplicate HITs. This is useful in cases such as
  /// network timeouts where it is unclear whether or not the call succeeded on
  /// the server. If the HIT already exists in the system from a previous call
  /// using the same UniqueRequestToken, subsequent calls will return a
  /// AWS.MechanicalTurk.HitAlreadyExists error with a message containing the
  /// HITId.
  /// <note>
  /// Note: It is your responsibility to ensure uniqueness of the token. The
  /// unique token expires after 24 hours. Subsequent calls using the same
  /// UniqueRequestToken made after the 24 hour limit could create duplicate
  /// HITs.
  /// </note>
  Future<CreateHITResponse> createHIT({
    required int assignmentDurationInSeconds,
    required String description,
    required int lifetimeInSeconds,
    required String reward,
    required String title,
    ReviewPolicy? assignmentReviewPolicy,
    int? autoApprovalDelayInSeconds,
    String? hITLayoutId,
    List<HITLayoutParameter>? hITLayoutParameters,
    ReviewPolicy? hITReviewPolicy,
    String? keywords,
    int? maxAssignments,
    List<QualificationRequirement>? qualificationRequirements,
    String? question,
    String? requesterAnnotation,
    String? uniqueRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.CreateHIT'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssignmentDurationInSeconds': assignmentDurationInSeconds,
        'Description': description,
        'LifetimeInSeconds': lifetimeInSeconds,
        'Reward': reward,
        'Title': title,
        if (assignmentReviewPolicy != null)
          'AssignmentReviewPolicy': assignmentReviewPolicy,
        if (autoApprovalDelayInSeconds != null)
          'AutoApprovalDelayInSeconds': autoApprovalDelayInSeconds,
        if (hITLayoutId != null) 'HITLayoutId': hITLayoutId,
        if (hITLayoutParameters != null)
          'HITLayoutParameters': hITLayoutParameters,
        if (hITReviewPolicy != null) 'HITReviewPolicy': hITReviewPolicy,
        if (keywords != null) 'Keywords': keywords,
        if (maxAssignments != null) 'MaxAssignments': maxAssignments,
        if (qualificationRequirements != null)
          'QualificationRequirements': qualificationRequirements,
        if (question != null) 'Question': question,
        if (requesterAnnotation != null)
          'RequesterAnnotation': requesterAnnotation,
        if (uniqueRequestToken != null)
          'UniqueRequestToken': uniqueRequestToken,
      },
    );

    return CreateHITResponse.fromJson(jsonResponse.body);
  }

  /// The <code>CreateHITType</code> operation creates a new HIT type. This
  /// operation allows you to define a standard set of HIT properties to use
  /// when creating HITs. If you register a HIT type with values that match an
  /// existing HIT type, the HIT type ID of the existing type will be returned.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [assignmentDurationInSeconds] :
  /// The amount of time, in seconds, that a Worker has to complete the HIT
  /// after accepting it. If a Worker does not complete the assignment within
  /// the specified duration, the assignment is considered abandoned. If the HIT
  /// is still active (that is, its lifetime has not elapsed), the assignment
  /// becomes available for other users to find and accept.
  ///
  /// Parameter [description] :
  /// A general description of the HIT. A description includes detailed
  /// information about the kind of task the HIT contains. On the Amazon
  /// Mechanical Turk web site, the HIT description appears in the expanded view
  /// of search results, and in the HIT and assignment screens. A good
  /// description gives the user enough information to evaluate the HIT before
  /// accepting it.
  ///
  /// Parameter [reward] :
  /// The amount of money the Requester will pay a Worker for successfully
  /// completing the HIT.
  ///
  /// Parameter [title] :
  /// The title of the HIT. A title should be short and descriptive about the
  /// kind of task the HIT contains. On the Amazon Mechanical Turk web site, the
  /// HIT title appears in search results, and everywhere the HIT is mentioned.
  ///
  /// Parameter [autoApprovalDelayInSeconds] :
  /// The number of seconds after an assignment for the HIT has been submitted,
  /// after which the assignment is considered Approved automatically unless the
  /// Requester explicitly rejects it.
  ///
  /// Parameter [keywords] :
  /// One or more words or phrases that describe the HIT, separated by commas.
  /// These words are used in searches to find HITs.
  ///
  /// Parameter [qualificationRequirements] :
  /// Conditions that a Worker's Qualifications must meet in order to accept the
  /// HIT. A HIT can have between zero and ten Qualification requirements. All
  /// requirements must be met in order for a Worker to accept the HIT.
  /// Additionally, other actions can be restricted using the
  /// <code>ActionsGuarded</code> field on each
  /// <code>QualificationRequirement</code> structure.
  Future<CreateHITTypeResponse> createHITType({
    required int assignmentDurationInSeconds,
    required String description,
    required String reward,
    required String title,
    int? autoApprovalDelayInSeconds,
    String? keywords,
    List<QualificationRequirement>? qualificationRequirements,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.CreateHITType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssignmentDurationInSeconds': assignmentDurationInSeconds,
        'Description': description,
        'Reward': reward,
        'Title': title,
        if (autoApprovalDelayInSeconds != null)
          'AutoApprovalDelayInSeconds': autoApprovalDelayInSeconds,
        if (keywords != null) 'Keywords': keywords,
        if (qualificationRequirements != null)
          'QualificationRequirements': qualificationRequirements,
      },
    );

    return CreateHITTypeResponse.fromJson(jsonResponse.body);
  }

  /// The <code>CreateHITWithHITType</code> operation creates a new Human
  /// Intelligence Task (HIT) using an existing HITTypeID generated by the
  /// <code>CreateHITType</code> operation.
  ///
  /// This is an alternative way to create HITs from the <code>CreateHIT</code>
  /// operation. This is the recommended best practice for Requesters who are
  /// creating large numbers of HITs.
  ///
  /// CreateHITWithHITType also supports several ways to provide question data:
  /// by providing a value for the <code>Question</code> parameter that fully
  /// specifies the contents of the HIT, or by providing a
  /// <code>HitLayoutId</code> and associated <code>HitLayoutParameters</code>.
  /// <note>
  /// If a HIT is created with 10 or more maximum assignments, there is an
  /// additional fee. For more information, see <a
  /// href="https://requester.mturk.com/pricing">Amazon Mechanical Turk
  /// Pricing</a>.
  /// </note>
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [hITTypeId] :
  /// The HIT type ID you want to create this HIT with.
  ///
  /// Parameter [lifetimeInSeconds] :
  /// An amount of time, in seconds, after which the HIT is no longer available
  /// for users to accept. After the lifetime of the HIT elapses, the HIT no
  /// longer appears in HIT searches, even if not all of the assignments for the
  /// HIT have been accepted.
  ///
  /// Parameter [assignmentReviewPolicy] :
  /// The Assignment-level Review Policy applies to the assignments under the
  /// HIT. You can specify for Mechanical Turk to take various actions based on
  /// the policy.
  ///
  /// Parameter [hITLayoutId] :
  /// The HITLayoutId allows you to use a pre-existing HIT design with
  /// placeholder values and create an additional HIT by providing those values
  /// as HITLayoutParameters.
  ///
  /// Constraints: Either a Question parameter or a HITLayoutId parameter must
  /// be provided.
  ///
  /// Parameter [hITLayoutParameters] :
  /// If the HITLayoutId is provided, any placeholder values must be filled in
  /// with values using the HITLayoutParameter structure. For more information,
  /// see HITLayout.
  ///
  /// Parameter [hITReviewPolicy] :
  /// The HIT-level Review Policy applies to the HIT. You can specify for
  /// Mechanical Turk to take various actions based on the policy.
  ///
  /// Parameter [maxAssignments] :
  /// The number of times the HIT can be accepted and completed before the HIT
  /// becomes unavailable.
  ///
  /// Parameter [question] :
  /// The data the person completing the HIT uses to produce the results.
  ///
  /// Constraints: Must be a QuestionForm data structure, an ExternalQuestion
  /// data structure, or an HTMLQuestion data structure. The XML question data
  /// must not be larger than 64 kilobytes (65,535 bytes) in size, including
  /// whitespace.
  ///
  /// Either a Question parameter or a HITLayoutId parameter must be provided.
  ///
  /// Parameter [requesterAnnotation] :
  /// An arbitrary data field. The RequesterAnnotation parameter lets your
  /// application attach arbitrary data to the HIT for tracking purposes. For
  /// example, this parameter could be an identifier internal to the Requester's
  /// application that corresponds with the HIT.
  ///
  /// The RequesterAnnotation parameter for a HIT is only visible to the
  /// Requester who created the HIT. It is not shown to the Worker, or any other
  /// Requester.
  ///
  /// The RequesterAnnotation parameter may be different for each HIT you
  /// submit. It does not affect how your HITs are grouped.
  ///
  /// Parameter [uniqueRequestToken] :
  /// A unique identifier for this request which allows you to retry the call on
  /// error without creating duplicate HITs. This is useful in cases such as
  /// network timeouts where it is unclear whether or not the call succeeded on
  /// the server. If the HIT already exists in the system from a previous call
  /// using the same UniqueRequestToken, subsequent calls will return a
  /// AWS.MechanicalTurk.HitAlreadyExists error with a message containing the
  /// HITId.
  /// <note>
  /// Note: It is your responsibility to ensure uniqueness of the token. The
  /// unique token expires after 24 hours. Subsequent calls using the same
  /// UniqueRequestToken made after the 24 hour limit could create duplicate
  /// HITs.
  /// </note>
  Future<CreateHITWithHITTypeResponse> createHITWithHITType({
    required String hITTypeId,
    required int lifetimeInSeconds,
    ReviewPolicy? assignmentReviewPolicy,
    String? hITLayoutId,
    List<HITLayoutParameter>? hITLayoutParameters,
    ReviewPolicy? hITReviewPolicy,
    int? maxAssignments,
    String? question,
    String? requesterAnnotation,
    String? uniqueRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.CreateHITWithHITType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HITTypeId': hITTypeId,
        'LifetimeInSeconds': lifetimeInSeconds,
        if (assignmentReviewPolicy != null)
          'AssignmentReviewPolicy': assignmentReviewPolicy,
        if (hITLayoutId != null) 'HITLayoutId': hITLayoutId,
        if (hITLayoutParameters != null)
          'HITLayoutParameters': hITLayoutParameters,
        if (hITReviewPolicy != null) 'HITReviewPolicy': hITReviewPolicy,
        if (maxAssignments != null) 'MaxAssignments': maxAssignments,
        if (question != null) 'Question': question,
        if (requesterAnnotation != null)
          'RequesterAnnotation': requesterAnnotation,
        if (uniqueRequestToken != null)
          'UniqueRequestToken': uniqueRequestToken,
      },
    );

    return CreateHITWithHITTypeResponse.fromJson(jsonResponse.body);
  }

  /// The <code>CreateQualificationType</code> operation creates a new
  /// Qualification type, which is represented by a
  /// <code>QualificationType</code> data structure.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [description] :
  /// A long description for the Qualification type. On the Amazon Mechanical
  /// Turk website, the long description is displayed when a Worker examines a
  /// Qualification type.
  ///
  /// Parameter [name] :
  /// The name you give to the Qualification type. The type name is used to
  /// represent the Qualification to Workers, and to find the type using a
  /// Qualification type search. It must be unique across all of your
  /// Qualification types.
  ///
  /// Parameter [qualificationTypeStatus] :
  /// The initial status of the Qualification type.
  ///
  /// Constraints: Valid values are: Active | Inactive
  ///
  /// Parameter [answerKey] :
  /// The answers to the Qualification test specified in the Test parameter, in
  /// the form of an AnswerKey data structure.
  ///
  /// Constraints: Must not be longer than 65535 bytes.
  ///
  /// Constraints: None. If not specified, you must process Qualification
  /// requests manually.
  ///
  /// Parameter [autoGranted] :
  /// Specifies whether requests for the Qualification type are granted
  /// immediately, without prompting the Worker with a Qualification test.
  ///
  /// Constraints: If the Test parameter is specified, this parameter cannot be
  /// true.
  ///
  /// Parameter [autoGrantedValue] :
  /// The Qualification value to use for automatically granted Qualifications.
  /// This parameter is used only if the AutoGranted parameter is true.
  ///
  /// Parameter [keywords] :
  /// One or more words or phrases that describe the Qualification type,
  /// separated by commas. The keywords of a type make the type easier to find
  /// during a search.
  ///
  /// Parameter [retryDelayInSeconds] :
  /// The number of seconds that a Worker must wait after requesting a
  /// Qualification of the Qualification type before the worker can retry the
  /// Qualification request.
  ///
  /// Constraints: None. If not specified, retries are disabled and Workers can
  /// request a Qualification of this type only once, even if the Worker has not
  /// been granted the Qualification. It is not possible to disable retries for
  /// a Qualification type after it has been created with retries enabled. If
  /// you want to disable retries, you must delete existing retry-enabled
  /// Qualification type and then create a new Qualification type with retries
  /// disabled.
  ///
  /// Parameter [test] :
  /// The questions for the Qualification test a Worker must answer correctly to
  /// obtain a Qualification of this type. If this parameter is specified,
  /// <code>TestDurationInSeconds</code> must also be specified.
  ///
  /// Constraints: Must not be longer than 65535 bytes. Must be a QuestionForm
  /// data structure. This parameter cannot be specified if AutoGranted is true.
  ///
  /// Constraints: None. If not specified, the Worker may request the
  /// Qualification without answering any questions.
  ///
  /// Parameter [testDurationInSeconds] :
  /// The number of seconds the Worker has to complete the Qualification test,
  /// starting from the time the Worker requests the Qualification.
  Future<CreateQualificationTypeResponse> createQualificationType({
    required String description,
    required String name,
    required QualificationTypeStatus qualificationTypeStatus,
    String? answerKey,
    bool? autoGranted,
    int? autoGrantedValue,
    String? keywords,
    int? retryDelayInSeconds,
    String? test,
    int? testDurationInSeconds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.CreateQualificationType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Description': description,
        'Name': name,
        'QualificationTypeStatus': qualificationTypeStatus.toValue(),
        if (answerKey != null) 'AnswerKey': answerKey,
        if (autoGranted != null) 'AutoGranted': autoGranted,
        if (autoGrantedValue != null) 'AutoGrantedValue': autoGrantedValue,
        if (keywords != null) 'Keywords': keywords,
        if (retryDelayInSeconds != null)
          'RetryDelayInSeconds': retryDelayInSeconds,
        if (test != null) 'Test': test,
        if (testDurationInSeconds != null)
          'TestDurationInSeconds': testDurationInSeconds,
      },
    );

    return CreateQualificationTypeResponse.fromJson(jsonResponse.body);
  }

  /// The <code>CreateWorkerBlock</code> operation allows you to prevent a
  /// Worker from working on your HITs. For example, you can block a Worker who
  /// is producing poor quality work. You can block up to 100,000 Workers.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [reason] :
  /// A message explaining the reason for blocking the Worker. This parameter
  /// enables you to keep track of your Workers. The Worker does not see this
  /// message.
  ///
  /// Parameter [workerId] :
  /// The ID of the Worker to block.
  Future<void> createWorkerBlock({
    required String reason,
    required String workerId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.CreateWorkerBlock'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Reason': reason,
        'WorkerId': workerId,
      },
    );
  }

  /// The <code>DeleteHIT</code> operation is used to delete HIT that is no
  /// longer needed. Only the Requester who created the HIT can delete it.
  ///
  /// You can only dispose of HITs that are in the <code>Reviewable</code>
  /// state, with all of their submitted assignments already either approved or
  /// rejected. If you call the DeleteHIT operation on a HIT that is not in the
  /// <code>Reviewable</code> state (for example, that has not expired, or still
  /// has active assignments), or on a HIT that is Reviewable but without all of
  /// its submitted assignments already approved or rejected, the service will
  /// return an error.
  /// <note>
  /// <ul>
  /// <li>
  /// HITs are automatically disposed of after 120 days.
  /// </li>
  /// <li>
  /// After you dispose of a HIT, you can no longer approve the HIT's rejected
  /// assignments.
  /// </li>
  /// <li>
  /// Disposed HITs are not returned in results for the ListHITs operation.
  /// </li>
  /// <li>
  /// Disposing HITs can improve the performance of operations such as
  /// ListReviewableHITs and ListHITs.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [hITId] :
  /// The ID of the HIT to be deleted.
  Future<void> deleteHIT({
    required String hITId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.DeleteHIT'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HITId': hITId,
      },
    );
  }

  /// The <code>DeleteQualificationType</code> deletes a Qualification type and
  /// deletes any HIT types that are associated with the Qualification type.
  ///
  /// This operation does not revoke Qualifications already assigned to Workers
  /// because the Qualifications might be needed for active HITs. If there are
  /// any pending requests for the Qualification type, Amazon Mechanical Turk
  /// rejects those requests. After you delete a Qualification type, you can no
  /// longer use it to create HITs or HIT types.
  /// <note>
  /// DeleteQualificationType must wait for all the HITs that use the deleted
  /// Qualification type to be deleted before completing. It may take up to 48
  /// hours before DeleteQualificationType completes and the unique name of the
  /// Qualification type is available for reuse with CreateQualificationType.
  /// </note>
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [qualificationTypeId] :
  /// The ID of the QualificationType to dispose.
  Future<void> deleteQualificationType({
    required String qualificationTypeId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.DeleteQualificationType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QualificationTypeId': qualificationTypeId,
      },
    );
  }

  /// The <code>DeleteWorkerBlock</code> operation allows you to reinstate a
  /// blocked Worker to work on your HITs. This operation reverses the effects
  /// of the CreateWorkerBlock operation. You need the Worker ID to use this
  /// operation. If the Worker ID is missing or invalid, this operation fails
  /// and returns the message “WorkerId is invalid.” If the specified Worker is
  /// not blocked, this operation returns successfully.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [workerId] :
  /// The ID of the Worker to unblock.
  ///
  /// Parameter [reason] :
  /// A message that explains the reason for unblocking the Worker. The Worker
  /// does not see this message.
  Future<void> deleteWorkerBlock({
    required String workerId,
    String? reason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.DeleteWorkerBlock'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkerId': workerId,
        if (reason != null) 'Reason': reason,
      },
    );
  }

  /// The <code>DisassociateQualificationFromWorker</code> revokes a previously
  /// granted Qualification from a user.
  ///
  /// You can provide a text message explaining why the Qualification was
  /// revoked. The user who had the Qualification can see this message.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [qualificationTypeId] :
  /// The ID of the Qualification type of the Qualification to be revoked.
  ///
  /// Parameter [workerId] :
  /// The ID of the Worker who possesses the Qualification to be revoked.
  ///
  /// Parameter [reason] :
  /// A text message that explains why the Qualification was revoked. The user
  /// who had the Qualification sees this message.
  Future<void> disassociateQualificationFromWorker({
    required String qualificationTypeId,
    required String workerId,
    String? reason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'MTurkRequesterServiceV20170117.DisassociateQualificationFromWorker'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QualificationTypeId': qualificationTypeId,
        'WorkerId': workerId,
        if (reason != null) 'Reason': reason,
      },
    );
  }

  /// The <code>GetAccountBalance</code> operation retrieves the Prepaid HITs
  /// balance in your Amazon Mechanical Turk account if you are a Prepaid
  /// Requester. Alternatively, this operation will retrieve the remaining
  /// available AWS Billing usage if you have enabled AWS Billing. Note: If you
  /// have enabled AWS Billing and still have a remaining Prepaid HITs balance,
  /// this balance can be viewed on the My Account page in the Requester
  /// console.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  Future<GetAccountBalanceResponse> getAccountBalance() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.GetAccountBalance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetAccountBalanceResponse.fromJson(jsonResponse.body);
  }

  /// The <code>GetAssignment</code> operation retrieves the details of the
  /// specified Assignment.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [assignmentId] :
  /// The ID of the Assignment to be retrieved.
  Future<GetAssignmentResponse> getAssignment({
    required String assignmentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.GetAssignment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssignmentId': assignmentId,
      },
    );

    return GetAssignmentResponse.fromJson(jsonResponse.body);
  }

  /// The <code>GetFileUploadURL</code> operation generates and returns a
  /// temporary URL. You use the temporary URL to retrieve a file uploaded by a
  /// Worker as an answer to a FileUploadAnswer question for a HIT. The
  /// temporary URL is generated the instant the GetFileUploadURL operation is
  /// called, and is valid for 60 seconds. You can get a temporary file upload
  /// URL any time until the HIT is disposed. After the HIT is disposed, any
  /// uploaded files are deleted, and cannot be retrieved. Pending Deprecation
  /// on December 12, 2017. The Answer Specification structure will no longer
  /// support the <code>FileUploadAnswer</code> element to be used for the
  /// QuestionForm data structure. Instead, we recommend that Requesters who
  /// want to create HITs asking Workers to upload files to use Amazon S3.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [assignmentId] :
  /// The ID of the assignment that contains the question with a
  /// FileUploadAnswer.
  ///
  /// Parameter [questionIdentifier] :
  /// The identifier of the question with a FileUploadAnswer, as specified in
  /// the QuestionForm of the HIT.
  Future<GetFileUploadURLResponse> getFileUploadURL({
    required String assignmentId,
    required String questionIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.GetFileUploadURL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssignmentId': assignmentId,
        'QuestionIdentifier': questionIdentifier,
      },
    );

    return GetFileUploadURLResponse.fromJson(jsonResponse.body);
  }

  /// The <code>GetHIT</code> operation retrieves the details of the specified
  /// HIT.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [hITId] :
  /// The ID of the HIT to be retrieved.
  Future<GetHITResponse> getHIT({
    required String hITId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.GetHIT'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HITId': hITId,
      },
    );

    return GetHITResponse.fromJson(jsonResponse.body);
  }

  /// The <code>GetQualificationScore</code> operation returns the value of a
  /// Worker's Qualification for a given Qualification type.
  ///
  /// To get a Worker's Qualification, you must know the Worker's ID. The
  /// Worker's ID is included in the assignment data returned by the
  /// <code>ListAssignmentsForHIT</code> operation.
  ///
  /// Only the owner of a Qualification type can query the value of a Worker's
  /// Qualification of that type.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [qualificationTypeId] :
  /// The ID of the QualificationType.
  ///
  /// Parameter [workerId] :
  /// The ID of the Worker whose Qualification is being updated.
  Future<GetQualificationScoreResponse> getQualificationScore({
    required String qualificationTypeId,
    required String workerId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.GetQualificationScore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QualificationTypeId': qualificationTypeId,
        'WorkerId': workerId,
      },
    );

    return GetQualificationScoreResponse.fromJson(jsonResponse.body);
  }

  /// The <code>GetQualificationType</code>operation retrieves information about
  /// a Qualification type using its ID.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [qualificationTypeId] :
  /// The ID of the QualificationType.
  Future<GetQualificationTypeResponse> getQualificationType({
    required String qualificationTypeId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.GetQualificationType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QualificationTypeId': qualificationTypeId,
      },
    );

    return GetQualificationTypeResponse.fromJson(jsonResponse.body);
  }

  /// The <code>ListAssignmentsForHIT</code> operation retrieves completed
  /// assignments for a HIT. You can use this operation to retrieve the results
  /// for a HIT.
  ///
  /// You can get assignments for a HIT at any time, even if the HIT is not yet
  /// Reviewable. If a HIT requested multiple assignments, and has received some
  /// results but has not yet become Reviewable, you can still retrieve the
  /// partial results with this operation.
  ///
  /// Use the AssignmentStatus parameter to control which set of assignments for
  /// a HIT are returned. The ListAssignmentsForHIT operation can return
  /// submitted assignments awaiting approval, or it can return assignments that
  /// have already been approved or rejected. You can set
  /// AssignmentStatus=Approved,Rejected to get assignments that have already
  /// been approved and rejected together in one result set.
  ///
  /// Only the Requester who created the HIT can retrieve the assignments for
  /// that HIT.
  ///
  /// Results are sorted and divided into numbered pages and the operation
  /// returns a single page of results. You can use the parameters of the
  /// operation to control sorting and pagination.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [hITId] :
  /// The ID of the HIT.
  ///
  /// Parameter [assignmentStatuses] :
  /// The status of the assignments to return: Submitted | Approved | Rejected
  ///
  /// Parameter [nextToken] :
  /// Pagination token
  Future<ListAssignmentsForHITResponse> listAssignmentsForHIT({
    required String hITId,
    List<AssignmentStatus>? assignmentStatuses,
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
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.ListAssignmentsForHIT'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HITId': hITId,
        if (assignmentStatuses != null)
          'AssignmentStatuses':
              assignmentStatuses.map((e) => e.toValue()).toList(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAssignmentsForHITResponse.fromJson(jsonResponse.body);
  }

  /// The <code>ListBonusPayments</code> operation retrieves the amounts of
  /// bonuses you have paid to Workers for a given HIT or assignment.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [assignmentId] :
  /// The ID of the assignment associated with the bonus payments to retrieve.
  /// If specified, only bonus payments for the given assignment are returned.
  /// Either the HITId parameter or the AssignmentId parameter must be specified
  ///
  /// Parameter [hITId] :
  /// The ID of the HIT associated with the bonus payments to retrieve. If not
  /// specified, all bonus payments for all assignments for the given HIT are
  /// returned. Either the HITId parameter or the AssignmentId parameter must be
  /// specified
  ///
  /// Parameter [nextToken] :
  /// Pagination token
  Future<ListBonusPaymentsResponse> listBonusPayments({
    String? assignmentId,
    String? hITId,
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
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.ListBonusPayments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (assignmentId != null) 'AssignmentId': assignmentId,
        if (hITId != null) 'HITId': hITId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListBonusPaymentsResponse.fromJson(jsonResponse.body);
  }

  /// The <code>ListHITs</code> operation returns all of a Requester's HITs. The
  /// operation returns HITs of any status, except for HITs that have been
  /// deleted of with the DeleteHIT operation or that have been auto-deleted.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [nextToken] :
  /// Pagination token
  Future<ListHITsResponse> listHITs({
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
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.ListHITs'
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

    return ListHITsResponse.fromJson(jsonResponse.body);
  }

  /// The <code>ListHITsForQualificationType</code> operation returns the HITs
  /// that use the given Qualification type for a Qualification requirement. The
  /// operation returns HITs of any status, except for HITs that have been
  /// deleted with the <code>DeleteHIT</code> operation or that have been
  /// auto-deleted.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [qualificationTypeId] :
  /// The ID of the Qualification type to use when querying HITs.
  ///
  /// Parameter [maxResults] :
  /// Limit the number of results returned.
  ///
  /// Parameter [nextToken] :
  /// Pagination Token
  Future<ListHITsForQualificationTypeResponse> listHITsForQualificationType({
    required String qualificationTypeId,
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
      'X-Amz-Target':
          'MTurkRequesterServiceV20170117.ListHITsForQualificationType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QualificationTypeId': qualificationTypeId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListHITsForQualificationTypeResponse.fromJson(jsonResponse.body);
  }

  /// The <code>ListQualificationRequests</code> operation retrieves requests
  /// for Qualifications of a particular Qualification type. The owner of the
  /// Qualification type calls this operation to poll for pending requests, and
  /// accepts them using the AcceptQualification operation.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [qualificationTypeId] :
  /// The ID of the QualificationType.
  Future<ListQualificationRequestsResponse> listQualificationRequests({
    int? maxResults,
    String? nextToken,
    String? qualificationTypeId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.ListQualificationRequests'
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
        if (qualificationTypeId != null)
          'QualificationTypeId': qualificationTypeId,
      },
    );

    return ListQualificationRequestsResponse.fromJson(jsonResponse.body);
  }

  /// The <code>ListQualificationTypes</code> operation returns a list of
  /// Qualification types, filtered by an optional search term.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [mustBeRequestable] :
  /// Specifies that only Qualification types that a user can request through
  /// the Amazon Mechanical Turk web site, such as by taking a Qualification
  /// test, are returned as results of the search. Some Qualification types,
  /// such as those assigned automatically by the system, cannot be requested
  /// directly by users. If false, all Qualification types, including those
  /// managed by the system, are considered. Valid values are True | False.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [mustBeOwnedByCaller] :
  /// Specifies that only Qualification types that the Requester created are
  /// returned. If false, the operation returns all Qualification types.
  ///
  /// Parameter [query] :
  /// A text query against all of the searchable attributes of Qualification
  /// types.
  Future<ListQualificationTypesResponse> listQualificationTypes({
    required bool mustBeRequestable,
    int? maxResults,
    bool? mustBeOwnedByCaller,
    String? nextToken,
    String? query,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.ListQualificationTypes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MustBeRequestable': mustBeRequestable,
        if (maxResults != null) 'MaxResults': maxResults,
        if (mustBeOwnedByCaller != null)
          'MustBeOwnedByCaller': mustBeOwnedByCaller,
        if (nextToken != null) 'NextToken': nextToken,
        if (query != null) 'Query': query,
      },
    );

    return ListQualificationTypesResponse.fromJson(jsonResponse.body);
  }

  /// The <code>ListReviewPolicyResultsForHIT</code> operation retrieves the
  /// computed results and the actions taken in the course of executing your
  /// Review Policies for a given HIT. For information about how to specify
  /// Review Policies when you call CreateHIT, see Review Policies. The
  /// ListReviewPolicyResultsForHIT operation can return results for both
  /// Assignment-level and HIT-level review results.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [hITId] :
  /// The unique identifier of the HIT to retrieve review results for.
  ///
  /// Parameter [maxResults] :
  /// Limit the number of results returned.
  ///
  /// Parameter [nextToken] :
  /// Pagination token
  ///
  /// Parameter [policyLevels] :
  /// The Policy Level(s) to retrieve review results for - HIT or Assignment. If
  /// omitted, the default behavior is to retrieve all data for both policy
  /// levels. For a list of all the described policies, see Review Policies.
  ///
  /// Parameter [retrieveActions] :
  /// Specify if the operation should retrieve a list of the actions taken
  /// executing the Review Policies and their outcomes.
  ///
  /// Parameter [retrieveResults] :
  /// Specify if the operation should retrieve a list of the results computed by
  /// the Review Policies.
  Future<ListReviewPolicyResultsForHITResponse> listReviewPolicyResultsForHIT({
    required String hITId,
    int? maxResults,
    String? nextToken,
    List<ReviewPolicyLevel>? policyLevels,
    bool? retrieveActions,
    bool? retrieveResults,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'MTurkRequesterServiceV20170117.ListReviewPolicyResultsForHIT'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HITId': hITId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (policyLevels != null)
          'PolicyLevels': policyLevels.map((e) => e.toValue()).toList(),
        if (retrieveActions != null) 'RetrieveActions': retrieveActions,
        if (retrieveResults != null) 'RetrieveResults': retrieveResults,
      },
    );

    return ListReviewPolicyResultsForHITResponse.fromJson(jsonResponse.body);
  }

  /// The <code>ListReviewableHITs</code> operation retrieves the HITs with
  /// Status equal to Reviewable or Status equal to Reviewing that belong to the
  /// Requester calling the operation.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [hITTypeId] :
  /// The ID of the HIT type of the HITs to consider for the query. If not
  /// specified, all HITs for the Reviewer are considered
  ///
  /// Parameter [maxResults] :
  /// Limit the number of results returned.
  ///
  /// Parameter [nextToken] :
  /// Pagination Token
  ///
  /// Parameter [status] :
  /// Can be either <code>Reviewable</code> or <code>Reviewing</code>.
  /// Reviewable is the default value.
  Future<ListReviewableHITsResponse> listReviewableHITs({
    String? hITTypeId,
    int? maxResults,
    String? nextToken,
    ReviewableHITStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.ListReviewableHITs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (hITTypeId != null) 'HITTypeId': hITTypeId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListReviewableHITsResponse.fromJson(jsonResponse.body);
  }

  /// The <code>ListWorkersBlocks</code> operation retrieves a list of Workers
  /// who are blocked from working on your HITs.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [nextToken] :
  /// Pagination token
  Future<ListWorkerBlocksResponse> listWorkerBlocks({
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
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.ListWorkerBlocks'
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

    return ListWorkerBlocksResponse.fromJson(jsonResponse.body);
  }

  /// The <code>ListWorkersWithQualificationType</code> operation returns all of
  /// the Workers that have been associated with a given Qualification type.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [qualificationTypeId] :
  /// The ID of the Qualification type of the Qualifications to return.
  ///
  /// Parameter [maxResults] :
  /// Limit the number of results returned.
  ///
  /// Parameter [nextToken] :
  /// Pagination Token
  ///
  /// Parameter [status] :
  /// The status of the Qualifications to return. Can be <code>Granted |
  /// Revoked</code>.
  Future<ListWorkersWithQualificationTypeResponse>
      listWorkersWithQualificationType({
    required String qualificationTypeId,
    int? maxResults,
    String? nextToken,
    QualificationStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'MTurkRequesterServiceV20170117.ListWorkersWithQualificationType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QualificationTypeId': qualificationTypeId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListWorkersWithQualificationTypeResponse.fromJson(jsonResponse.body);
  }

  /// The <code>NotifyWorkers</code> operation sends an email to one or more
  /// Workers that you specify with the Worker ID. You can specify up to 100
  /// Worker IDs to send the same message with a single call to the
  /// NotifyWorkers operation. The NotifyWorkers operation will send a
  /// notification email to a Worker only if you have previously approved or
  /// rejected work from the Worker.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [messageText] :
  /// The text of the email message to send. Can include up to 4,096 characters
  ///
  /// Parameter [subject] :
  /// The subject line of the email message to send. Can include up to 200
  /// characters.
  ///
  /// Parameter [workerIds] :
  /// A list of Worker IDs you wish to notify. You can notify upto 100 Workers
  /// at a time.
  Future<NotifyWorkersResponse> notifyWorkers({
    required String messageText,
    required String subject,
    required List<String> workerIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.NotifyWorkers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MessageText': messageText,
        'Subject': subject,
        'WorkerIds': workerIds,
      },
    );

    return NotifyWorkersResponse.fromJson(jsonResponse.body);
  }

  /// The <code>RejectAssignment</code> operation rejects the results of a
  /// completed assignment.
  ///
  /// You can include an optional feedback message with the rejection, which the
  /// Worker can see in the Status section of the web site. When you include a
  /// feedback message with the rejection, it helps the Worker understand why
  /// the assignment was rejected, and can improve the quality of the results
  /// the Worker submits in the future.
  ///
  /// Only the Requester who created the HIT can reject an assignment for the
  /// HIT.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [assignmentId] :
  /// The ID of the assignment. The assignment must correspond to a HIT created
  /// by the Requester.
  ///
  /// Parameter [requesterFeedback] :
  /// A message for the Worker, which the Worker can see in the Status section
  /// of the web site.
  Future<void> rejectAssignment({
    required String assignmentId,
    required String requesterFeedback,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.RejectAssignment'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssignmentId': assignmentId,
        'RequesterFeedback': requesterFeedback,
      },
    );
  }

  /// The <code>RejectQualificationRequest</code> operation rejects a user's
  /// request for a Qualification.
  ///
  /// You can provide a text message explaining why the request was rejected.
  /// The Worker who made the request can see this message.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [qualificationRequestId] :
  /// The ID of the Qualification request, as returned by the
  /// <code>ListQualificationRequests</code> operation.
  ///
  /// Parameter [reason] :
  /// A text message explaining why the request was rejected, to be shown to the
  /// Worker who made the request.
  Future<void> rejectQualificationRequest({
    required String qualificationRequestId,
    String? reason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'MTurkRequesterServiceV20170117.RejectQualificationRequest'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QualificationRequestId': qualificationRequestId,
        if (reason != null) 'Reason': reason,
      },
    );
  }

  /// The <code>SendBonus</code> operation issues a payment of money from your
  /// account to a Worker. This payment happens separately from the reward you
  /// pay to the Worker when you approve the Worker's assignment. The SendBonus
  /// operation requires the Worker's ID and the assignment ID as parameters to
  /// initiate payment of the bonus. You must include a message that explains
  /// the reason for the bonus payment, as the Worker may not be expecting the
  /// payment. Amazon Mechanical Turk collects a fee for bonus payments, similar
  /// to the HIT listing fee. This operation fails if your account does not have
  /// enough funds to pay for both the bonus and the fees.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [assignmentId] :
  /// The ID of the assignment for which this bonus is paid.
  ///
  /// Parameter [bonusAmount] :
  /// The Bonus amount is a US Dollar amount specified using a string (for
  /// example, "5" represents $5.00 USD and "101.42" represents $101.42 USD). Do
  /// not include currency symbols or currency codes.
  ///
  /// Parameter [reason] :
  /// A message that explains the reason for the bonus payment. The Worker
  /// receiving the bonus can see this message.
  ///
  /// Parameter [workerId] :
  /// The ID of the Worker being paid the bonus.
  ///
  /// Parameter [uniqueRequestToken] :
  /// A unique identifier for this request, which allows you to retry the call
  /// on error without granting multiple bonuses. This is useful in cases such
  /// as network timeouts where it is unclear whether or not the call succeeded
  /// on the server. If the bonus already exists in the system from a previous
  /// call using the same UniqueRequestToken, subsequent calls will return an
  /// error with a message containing the request ID.
  Future<void> sendBonus({
    required String assignmentId,
    required String bonusAmount,
    required String reason,
    required String workerId,
    String? uniqueRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.SendBonus'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssignmentId': assignmentId,
        'BonusAmount': bonusAmount,
        'Reason': reason,
        'WorkerId': workerId,
        if (uniqueRequestToken != null)
          'UniqueRequestToken': uniqueRequestToken,
      },
    );
  }

  /// The <code>SendTestEventNotification</code> operation causes Amazon
  /// Mechanical Turk to send a notification message as if a HIT event occurred,
  /// according to the provided notification specification. This allows you to
  /// test notifications without setting up notifications for a real HIT type
  /// and trying to trigger them using the website. When you call this
  /// operation, the service attempts to send the test notification immediately.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [notification] :
  /// The notification specification to test. This value is identical to the
  /// value you would provide to the UpdateNotificationSettings operation when
  /// you establish the notification specification for a HIT type.
  ///
  /// Parameter [testEventType] :
  /// The event to simulate to test the notification specification. This event
  /// is included in the test message even if the notification specification
  /// does not include the event type. The notification specification does not
  /// filter out the test event.
  Future<void> sendTestEventNotification({
    required NotificationSpecification notification,
    required EventType testEventType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.SendTestEventNotification'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Notification': notification,
        'TestEventType': testEventType.toValue(),
      },
    );
  }

  /// The <code>UpdateExpirationForHIT</code> operation allows you update the
  /// expiration time of a HIT. If you update it to a time in the past, the HIT
  /// will be immediately expired.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [expireAt] :
  /// The date and time at which you want the HIT to expire
  ///
  /// Parameter [hITId] :
  /// The HIT to update.
  Future<void> updateExpirationForHIT({
    required DateTime expireAt,
    required String hITId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.UpdateExpirationForHIT'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExpireAt': unixTimestampToJson(expireAt),
        'HITId': hITId,
      },
    );
  }

  /// The <code>UpdateHITReviewStatus</code> operation updates the status of a
  /// HIT. If the status is Reviewable, this operation can update the status to
  /// Reviewing, or it can revert a Reviewing HIT back to the Reviewable status.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [hITId] :
  /// The ID of the HIT to update.
  ///
  /// Parameter [revert] :
  /// Specifies how to update the HIT status. Default is <code>False</code>.
  ///
  /// <ul>
  /// <li>
  /// Setting this to false will only transition a HIT from
  /// <code>Reviewable</code> to <code>Reviewing</code>
  /// </li>
  /// <li>
  /// Setting this to true will only transition a HIT from
  /// <code>Reviewing</code> to <code>Reviewable</code>
  /// </li>
  /// </ul>
  Future<void> updateHITReviewStatus({
    required String hITId,
    bool? revert,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.UpdateHITReviewStatus'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HITId': hITId,
        if (revert != null) 'Revert': revert,
      },
    );
  }

  /// The <code>UpdateHITTypeOfHIT</code> operation allows you to change the
  /// HITType properties of a HIT. This operation disassociates the HIT from its
  /// old HITType properties and associates it with the new HITType properties.
  /// The HIT takes on the properties of the new HITType in place of the old
  /// ones.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [hITId] :
  /// The HIT to update.
  ///
  /// Parameter [hITTypeId] :
  /// The ID of the new HIT type.
  Future<void> updateHITTypeOfHIT({
    required String hITId,
    required String hITTypeId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.UpdateHITTypeOfHIT'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HITId': hITId,
        'HITTypeId': hITTypeId,
      },
    );
  }

  /// The <code>UpdateNotificationSettings</code> operation creates, updates,
  /// disables or re-enables notifications for a HIT type. If you call the
  /// UpdateNotificationSettings operation for a HIT type that already has a
  /// notification specification, the operation replaces the old specification
  /// with a new one. You can call the UpdateNotificationSettings operation to
  /// enable or disable notifications for the HIT type, without having to modify
  /// the notification specification itself by providing updates to the Active
  /// status without specifying a new notification specification. To change the
  /// Active status of a HIT type's notifications, the HIT type must already
  /// have a notification specification, or one must be provided in the same
  /// call to <code>UpdateNotificationSettings</code>.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [hITTypeId] :
  /// The ID of the HIT type whose notification specification is being updated.
  ///
  /// Parameter [active] :
  /// Specifies whether notifications are sent for HITs of this HIT type,
  /// according to the notification specification. You must specify either the
  /// Notification parameter or the Active parameter for the call to
  /// UpdateNotificationSettings to succeed.
  ///
  /// Parameter [notification] :
  /// The notification specification for the HIT type.
  Future<void> updateNotificationSettings({
    required String hITTypeId,
    bool? active,
    NotificationSpecification? notification,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'MTurkRequesterServiceV20170117.UpdateNotificationSettings'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HITTypeId': hITTypeId,
        if (active != null) 'Active': active,
        if (notification != null) 'Notification': notification,
      },
    );
  }

  /// The <code>UpdateQualificationType</code> operation modifies the attributes
  /// of an existing Qualification type, which is represented by a
  /// QualificationType data structure. Only the owner of a Qualification type
  /// can modify its attributes.
  ///
  /// Most attributes of a Qualification type can be changed after the type has
  /// been created. However, the Name and Keywords fields cannot be modified.
  /// The RetryDelayInSeconds parameter can be modified or added to change the
  /// delay or to enable retries, but RetryDelayInSeconds cannot be used to
  /// disable retries.
  ///
  /// You can use this operation to update the test for a Qualification type.
  /// The test is updated based on the values specified for the Test,
  /// TestDurationInSeconds and AnswerKey parameters. All three parameters
  /// specify the updated test. If you are updating the test for a type, you
  /// must specify the Test and TestDurationInSeconds parameters. The AnswerKey
  /// parameter is optional; omitting it specifies that the updated test does
  /// not have an answer key.
  ///
  /// If you omit the Test parameter, the test for the Qualification type is
  /// unchanged. There is no way to remove a test from a Qualification type that
  /// has one. If the type already has a test, you cannot update it to be
  /// AutoGranted. If the Qualification type does not have a test and one is
  /// provided by an update, the type will henceforth have a test.
  ///
  /// If you want to update the test duration or answer key for an existing test
  /// without changing the questions, you must specify a Test parameter with the
  /// original questions, along with the updated values.
  ///
  /// If you provide an updated Test but no AnswerKey, the new test will not
  /// have an answer key. Requests for such Qualifications must be granted
  /// manually.
  ///
  /// You can also update the AutoGranted and AutoGrantedValue attributes of the
  /// Qualification type.
  ///
  /// May throw [ServiceFault].
  /// May throw [RequestError].
  ///
  /// Parameter [qualificationTypeId] :
  /// The ID of the Qualification type to update.
  ///
  /// Parameter [answerKey] :
  /// The answers to the Qualification test specified in the Test parameter, in
  /// the form of an AnswerKey data structure.
  ///
  /// Parameter [autoGranted] :
  /// Specifies whether requests for the Qualification type are granted
  /// immediately, without prompting the Worker with a Qualification test.
  ///
  /// Constraints: If the Test parameter is specified, this parameter cannot be
  /// true.
  ///
  /// Parameter [autoGrantedValue] :
  /// The Qualification value to use for automatically granted Qualifications.
  /// This parameter is used only if the AutoGranted parameter is true.
  ///
  /// Parameter [description] :
  /// The new description of the Qualification type.
  ///
  /// Parameter [qualificationTypeStatus] :
  /// The new status of the Qualification type - Active | Inactive
  ///
  /// Parameter [retryDelayInSeconds] :
  /// The amount of time, in seconds, that Workers must wait after requesting a
  /// Qualification of the specified Qualification type before they can retry
  /// the Qualification request. It is not possible to disable retries for a
  /// Qualification type after it has been created with retries enabled. If you
  /// want to disable retries, you must dispose of the existing retry-enabled
  /// Qualification type using DisposeQualificationType and then create a new
  /// Qualification type with retries disabled using CreateQualificationType.
  ///
  /// Parameter [test] :
  /// The questions for the Qualification test a Worker must answer correctly to
  /// obtain a Qualification of this type. If this parameter is specified,
  /// <code>TestDurationInSeconds</code> must also be specified.
  ///
  /// Constraints: Must not be longer than 65535 bytes. Must be a QuestionForm
  /// data structure. This parameter cannot be specified if AutoGranted is true.
  ///
  /// Constraints: None. If not specified, the Worker may request the
  /// Qualification without answering any questions.
  ///
  /// Parameter [testDurationInSeconds] :
  /// The number of seconds the Worker has to complete the Qualification test,
  /// starting from the time the Worker requests the Qualification.
  Future<UpdateQualificationTypeResponse> updateQualificationType({
    required String qualificationTypeId,
    String? answerKey,
    bool? autoGranted,
    int? autoGrantedValue,
    String? description,
    QualificationTypeStatus? qualificationTypeStatus,
    int? retryDelayInSeconds,
    String? test,
    int? testDurationInSeconds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MTurkRequesterServiceV20170117.UpdateQualificationType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QualificationTypeId': qualificationTypeId,
        if (answerKey != null) 'AnswerKey': answerKey,
        if (autoGranted != null) 'AutoGranted': autoGranted,
        if (autoGrantedValue != null) 'AutoGrantedValue': autoGrantedValue,
        if (description != null) 'Description': description,
        if (qualificationTypeStatus != null)
          'QualificationTypeStatus': qualificationTypeStatus.toValue(),
        if (retryDelayInSeconds != null)
          'RetryDelayInSeconds': retryDelayInSeconds,
        if (test != null) 'Test': test,
        if (testDurationInSeconds != null)
          'TestDurationInSeconds': testDurationInSeconds,
      },
    );

    return UpdateQualificationTypeResponse.fromJson(jsonResponse.body);
  }
}

class AcceptQualificationRequestResponse {
  AcceptQualificationRequestResponse();

  factory AcceptQualificationRequestResponse.fromJson(Map<String, dynamic> _) {
    return AcceptQualificationRequestResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ApproveAssignmentResponse {
  ApproveAssignmentResponse();

  factory ApproveAssignmentResponse.fromJson(Map<String, dynamic> _) {
    return ApproveAssignmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The Assignment data structure represents a single assignment of a HIT to a
/// Worker. The assignment tracks the Worker's efforts to complete the HIT, and
/// contains the results for later retrieval.
class Assignment {
  /// The date and time the Worker accepted the assignment.
  final DateTime? acceptTime;

  /// The Worker's answers submitted for the HIT contained in a
  /// QuestionFormAnswers document, if the Worker provides an answer. If the
  /// Worker does not provide any answers, Answer may contain a
  /// QuestionFormAnswers document, or Answer may be empty.
  final String? answer;

  /// If the Worker has submitted results and the Requester has approved the
  /// results, ApprovalTime is the date and time the Requester approved the
  /// results. This value is omitted from the assignment if the Requester has not
  /// yet approved the results.
  final DateTime? approvalTime;

  /// A unique identifier for the assignment.
  final String? assignmentId;

  /// The status of the assignment.
  final AssignmentStatus? assignmentStatus;

  /// If results have been submitted, AutoApprovalTime is the date and time the
  /// results of the assignment results are considered Approved automatically if
  /// they have not already been explicitly approved or rejected by the Requester.
  /// This value is derived from the auto-approval delay specified by the
  /// Requester in the HIT. This value is omitted from the assignment if the
  /// Worker has not yet submitted results.
  final DateTime? autoApprovalTime;

  /// The date and time of the deadline for the assignment. This value is derived
  /// from the deadline specification for the HIT and the date and time the Worker
  /// accepted the HIT.
  final DateTime? deadline;

  /// The ID of the HIT.
  final String? hITId;

  /// If the Worker has submitted results and the Requester has rejected the
  /// results, RejectionTime is the date and time the Requester rejected the
  /// results.
  final DateTime? rejectionTime;

  /// The feedback string included with the call to the ApproveAssignment
  /// operation or the RejectAssignment operation, if the Requester approved or
  /// rejected the assignment and specified feedback.
  final String? requesterFeedback;

  /// If the Worker has submitted results, SubmitTime is the date and time the
  /// assignment was submitted. This value is omitted from the assignment if the
  /// Worker has not yet submitted results.
  final DateTime? submitTime;

  /// The ID of the Worker who accepted the HIT.
  final String? workerId;

  Assignment({
    this.acceptTime,
    this.answer,
    this.approvalTime,
    this.assignmentId,
    this.assignmentStatus,
    this.autoApprovalTime,
    this.deadline,
    this.hITId,
    this.rejectionTime,
    this.requesterFeedback,
    this.submitTime,
    this.workerId,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      acceptTime: timeStampFromJson(json['AcceptTime']),
      answer: json['Answer'] as String?,
      approvalTime: timeStampFromJson(json['ApprovalTime']),
      assignmentId: json['AssignmentId'] as String?,
      assignmentStatus:
          (json['AssignmentStatus'] as String?)?.toAssignmentStatus(),
      autoApprovalTime: timeStampFromJson(json['AutoApprovalTime']),
      deadline: timeStampFromJson(json['Deadline']),
      hITId: json['HITId'] as String?,
      rejectionTime: timeStampFromJson(json['RejectionTime']),
      requesterFeedback: json['RequesterFeedback'] as String?,
      submitTime: timeStampFromJson(json['SubmitTime']),
      workerId: json['WorkerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptTime = this.acceptTime;
    final answer = this.answer;
    final approvalTime = this.approvalTime;
    final assignmentId = this.assignmentId;
    final assignmentStatus = this.assignmentStatus;
    final autoApprovalTime = this.autoApprovalTime;
    final deadline = this.deadline;
    final hITId = this.hITId;
    final rejectionTime = this.rejectionTime;
    final requesterFeedback = this.requesterFeedback;
    final submitTime = this.submitTime;
    final workerId = this.workerId;
    return {
      if (acceptTime != null) 'AcceptTime': unixTimestampToJson(acceptTime),
      if (answer != null) 'Answer': answer,
      if (approvalTime != null)
        'ApprovalTime': unixTimestampToJson(approvalTime),
      if (assignmentId != null) 'AssignmentId': assignmentId,
      if (assignmentStatus != null)
        'AssignmentStatus': assignmentStatus.toValue(),
      if (autoApprovalTime != null)
        'AutoApprovalTime': unixTimestampToJson(autoApprovalTime),
      if (deadline != null) 'Deadline': unixTimestampToJson(deadline),
      if (hITId != null) 'HITId': hITId,
      if (rejectionTime != null)
        'RejectionTime': unixTimestampToJson(rejectionTime),
      if (requesterFeedback != null) 'RequesterFeedback': requesterFeedback,
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
      if (workerId != null) 'WorkerId': workerId,
    };
  }
}

enum AssignmentStatus {
  submitted,
  approved,
  rejected,
}

extension AssignmentStatusValueExtension on AssignmentStatus {
  String toValue() {
    switch (this) {
      case AssignmentStatus.submitted:
        return 'Submitted';
      case AssignmentStatus.approved:
        return 'Approved';
      case AssignmentStatus.rejected:
        return 'Rejected';
    }
  }
}

extension AssignmentStatusFromString on String {
  AssignmentStatus toAssignmentStatus() {
    switch (this) {
      case 'Submitted':
        return AssignmentStatus.submitted;
      case 'Approved':
        return AssignmentStatus.approved;
      case 'Rejected':
        return AssignmentStatus.rejected;
    }
    throw Exception('$this is not known in enum AssignmentStatus');
  }
}

class AssociateQualificationWithWorkerResponse {
  AssociateQualificationWithWorkerResponse();

  factory AssociateQualificationWithWorkerResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateQualificationWithWorkerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An object representing a Bonus payment paid to a Worker.
class BonusPayment {
  /// The ID of the assignment associated with this bonus payment.
  final String? assignmentId;
  final String? bonusAmount;

  /// The date and time of when the bonus was granted.
  final DateTime? grantTime;

  /// The Reason text given when the bonus was granted, if any.
  final String? reason;

  /// The ID of the Worker to whom the bonus was paid.
  final String? workerId;

  BonusPayment({
    this.assignmentId,
    this.bonusAmount,
    this.grantTime,
    this.reason,
    this.workerId,
  });

  factory BonusPayment.fromJson(Map<String, dynamic> json) {
    return BonusPayment(
      assignmentId: json['AssignmentId'] as String?,
      bonusAmount: json['BonusAmount'] as String?,
      grantTime: timeStampFromJson(json['GrantTime']),
      reason: json['Reason'] as String?,
      workerId: json['WorkerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assignmentId = this.assignmentId;
    final bonusAmount = this.bonusAmount;
    final grantTime = this.grantTime;
    final reason = this.reason;
    final workerId = this.workerId;
    return {
      if (assignmentId != null) 'AssignmentId': assignmentId,
      if (bonusAmount != null) 'BonusAmount': bonusAmount,
      if (grantTime != null) 'GrantTime': unixTimestampToJson(grantTime),
      if (reason != null) 'Reason': reason,
      if (workerId != null) 'WorkerId': workerId,
    };
  }
}

enum Comparator {
  lessThan,
  lessThanOrEqualTo,
  greaterThan,
  greaterThanOrEqualTo,
  equalTo,
  notEqualTo,
  exists,
  doesNotExist,
  $in,
  notIn,
}

extension ComparatorValueExtension on Comparator {
  String toValue() {
    switch (this) {
      case Comparator.lessThan:
        return 'LessThan';
      case Comparator.lessThanOrEqualTo:
        return 'LessThanOrEqualTo';
      case Comparator.greaterThan:
        return 'GreaterThan';
      case Comparator.greaterThanOrEqualTo:
        return 'GreaterThanOrEqualTo';
      case Comparator.equalTo:
        return 'EqualTo';
      case Comparator.notEqualTo:
        return 'NotEqualTo';
      case Comparator.exists:
        return 'Exists';
      case Comparator.doesNotExist:
        return 'DoesNotExist';
      case Comparator.$in:
        return 'In';
      case Comparator.notIn:
        return 'NotIn';
    }
  }
}

extension ComparatorFromString on String {
  Comparator toComparator() {
    switch (this) {
      case 'LessThan':
        return Comparator.lessThan;
      case 'LessThanOrEqualTo':
        return Comparator.lessThanOrEqualTo;
      case 'GreaterThan':
        return Comparator.greaterThan;
      case 'GreaterThanOrEqualTo':
        return Comparator.greaterThanOrEqualTo;
      case 'EqualTo':
        return Comparator.equalTo;
      case 'NotEqualTo':
        return Comparator.notEqualTo;
      case 'Exists':
        return Comparator.exists;
      case 'DoesNotExist':
        return Comparator.doesNotExist;
      case 'In':
        return Comparator.$in;
      case 'NotIn':
        return Comparator.notIn;
    }
    throw Exception('$this is not known in enum Comparator');
  }
}

class CreateAdditionalAssignmentsForHITResponse {
  CreateAdditionalAssignmentsForHITResponse();

  factory CreateAdditionalAssignmentsForHITResponse.fromJson(
      Map<String, dynamic> _) {
    return CreateAdditionalAssignmentsForHITResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateHITResponse {
  /// Contains the newly created HIT data. For a description of the HIT data
  /// structure as it appears in responses, see the HIT Data Structure
  /// documentation.
  final HIT? hit;

  CreateHITResponse({
    this.hit,
  });

  factory CreateHITResponse.fromJson(Map<String, dynamic> json) {
    return CreateHITResponse(
      hit: json['HIT'] != null
          ? HIT.fromJson(json['HIT'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hit = this.hit;
    return {
      if (hit != null) 'HIT': hit,
    };
  }
}

class CreateHITTypeResponse {
  /// The ID of the newly registered HIT type.
  final String? hITTypeId;

  CreateHITTypeResponse({
    this.hITTypeId,
  });

  factory CreateHITTypeResponse.fromJson(Map<String, dynamic> json) {
    return CreateHITTypeResponse(
      hITTypeId: json['HITTypeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hITTypeId = this.hITTypeId;
    return {
      if (hITTypeId != null) 'HITTypeId': hITTypeId,
    };
  }
}

class CreateHITWithHITTypeResponse {
  /// Contains the newly created HIT data. For a description of the HIT data
  /// structure as it appears in responses, see the HIT Data Structure
  /// documentation.
  final HIT? hit;

  CreateHITWithHITTypeResponse({
    this.hit,
  });

  factory CreateHITWithHITTypeResponse.fromJson(Map<String, dynamic> json) {
    return CreateHITWithHITTypeResponse(
      hit: json['HIT'] != null
          ? HIT.fromJson(json['HIT'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hit = this.hit;
    return {
      if (hit != null) 'HIT': hit,
    };
  }
}

class CreateQualificationTypeResponse {
  /// The created Qualification type, returned as a QualificationType data
  /// structure.
  final QualificationType? qualificationType;

  CreateQualificationTypeResponse({
    this.qualificationType,
  });

  factory CreateQualificationTypeResponse.fromJson(Map<String, dynamic> json) {
    return CreateQualificationTypeResponse(
      qualificationType: json['QualificationType'] != null
          ? QualificationType.fromJson(
              json['QualificationType'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final qualificationType = this.qualificationType;
    return {
      if (qualificationType != null) 'QualificationType': qualificationType,
    };
  }
}

class CreateWorkerBlockResponse {
  CreateWorkerBlockResponse();

  factory CreateWorkerBlockResponse.fromJson(Map<String, dynamic> _) {
    return CreateWorkerBlockResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteHITResponse {
  DeleteHITResponse();

  factory DeleteHITResponse.fromJson(Map<String, dynamic> _) {
    return DeleteHITResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteQualificationTypeResponse {
  DeleteQualificationTypeResponse();

  factory DeleteQualificationTypeResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQualificationTypeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWorkerBlockResponse {
  DeleteWorkerBlockResponse();

  factory DeleteWorkerBlockResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorkerBlockResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateQualificationFromWorkerResponse {
  DisassociateQualificationFromWorkerResponse();

  factory DisassociateQualificationFromWorkerResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateQualificationFromWorkerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum EventType {
  assignmentAccepted,
  assignmentAbandoned,
  assignmentReturned,
  assignmentSubmitted,
  assignmentRejected,
  assignmentApproved,
  hITCreated,
  hITExpired,
  hITReviewable,
  hITExtended,
  hITDisposed,
  ping,
}

extension EventTypeValueExtension on EventType {
  String toValue() {
    switch (this) {
      case EventType.assignmentAccepted:
        return 'AssignmentAccepted';
      case EventType.assignmentAbandoned:
        return 'AssignmentAbandoned';
      case EventType.assignmentReturned:
        return 'AssignmentReturned';
      case EventType.assignmentSubmitted:
        return 'AssignmentSubmitted';
      case EventType.assignmentRejected:
        return 'AssignmentRejected';
      case EventType.assignmentApproved:
        return 'AssignmentApproved';
      case EventType.hITCreated:
        return 'HITCreated';
      case EventType.hITExpired:
        return 'HITExpired';
      case EventType.hITReviewable:
        return 'HITReviewable';
      case EventType.hITExtended:
        return 'HITExtended';
      case EventType.hITDisposed:
        return 'HITDisposed';
      case EventType.ping:
        return 'Ping';
    }
  }
}

extension EventTypeFromString on String {
  EventType toEventType() {
    switch (this) {
      case 'AssignmentAccepted':
        return EventType.assignmentAccepted;
      case 'AssignmentAbandoned':
        return EventType.assignmentAbandoned;
      case 'AssignmentReturned':
        return EventType.assignmentReturned;
      case 'AssignmentSubmitted':
        return EventType.assignmentSubmitted;
      case 'AssignmentRejected':
        return EventType.assignmentRejected;
      case 'AssignmentApproved':
        return EventType.assignmentApproved;
      case 'HITCreated':
        return EventType.hITCreated;
      case 'HITExpired':
        return EventType.hITExpired;
      case 'HITReviewable':
        return EventType.hITReviewable;
      case 'HITExtended':
        return EventType.hITExtended;
      case 'HITDisposed':
        return EventType.hITDisposed;
      case 'Ping':
        return EventType.ping;
    }
    throw Exception('$this is not known in enum EventType');
  }
}

class GetAccountBalanceResponse {
  final String? availableBalance;
  final String? onHoldBalance;

  GetAccountBalanceResponse({
    this.availableBalance,
    this.onHoldBalance,
  });

  factory GetAccountBalanceResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountBalanceResponse(
      availableBalance: json['AvailableBalance'] as String?,
      onHoldBalance: json['OnHoldBalance'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availableBalance = this.availableBalance;
    final onHoldBalance = this.onHoldBalance;
    return {
      if (availableBalance != null) 'AvailableBalance': availableBalance,
      if (onHoldBalance != null) 'OnHoldBalance': onHoldBalance,
    };
  }
}

class GetAssignmentResponse {
  /// The assignment. The response includes one Assignment element.
  final Assignment? assignment;

  /// The HIT associated with this assignment. The response includes one HIT
  /// element.
  final HIT? hit;

  GetAssignmentResponse({
    this.assignment,
    this.hit,
  });

  factory GetAssignmentResponse.fromJson(Map<String, dynamic> json) {
    return GetAssignmentResponse(
      assignment: json['Assignment'] != null
          ? Assignment.fromJson(json['Assignment'] as Map<String, dynamic>)
          : null,
      hit: json['HIT'] != null
          ? HIT.fromJson(json['HIT'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assignment = this.assignment;
    final hit = this.hit;
    return {
      if (assignment != null) 'Assignment': assignment,
      if (hit != null) 'HIT': hit,
    };
  }
}

class GetFileUploadURLResponse {
  /// A temporary URL for the file that the Worker uploaded for the answer.
  final String? fileUploadURL;

  GetFileUploadURLResponse({
    this.fileUploadURL,
  });

  factory GetFileUploadURLResponse.fromJson(Map<String, dynamic> json) {
    return GetFileUploadURLResponse(
      fileUploadURL: json['FileUploadURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileUploadURL = this.fileUploadURL;
    return {
      if (fileUploadURL != null) 'FileUploadURL': fileUploadURL,
    };
  }
}

class GetHITResponse {
  /// Contains the requested HIT data.
  final HIT? hit;

  GetHITResponse({
    this.hit,
  });

  factory GetHITResponse.fromJson(Map<String, dynamic> json) {
    return GetHITResponse(
      hit: json['HIT'] != null
          ? HIT.fromJson(json['HIT'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hit = this.hit;
    return {
      if (hit != null) 'HIT': hit,
    };
  }
}

class GetQualificationScoreResponse {
  /// The Qualification data structure of the Qualification assigned to a user,
  /// including the Qualification type and the value (score).
  final Qualification? qualification;

  GetQualificationScoreResponse({
    this.qualification,
  });

  factory GetQualificationScoreResponse.fromJson(Map<String, dynamic> json) {
    return GetQualificationScoreResponse(
      qualification: json['Qualification'] != null
          ? Qualification.fromJson(
              json['Qualification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final qualification = this.qualification;
    return {
      if (qualification != null) 'Qualification': qualification,
    };
  }
}

class GetQualificationTypeResponse {
  /// The returned Qualification Type
  final QualificationType? qualificationType;

  GetQualificationTypeResponse({
    this.qualificationType,
  });

  factory GetQualificationTypeResponse.fromJson(Map<String, dynamic> json) {
    return GetQualificationTypeResponse(
      qualificationType: json['QualificationType'] != null
          ? QualificationType.fromJson(
              json['QualificationType'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final qualificationType = this.qualificationType;
    return {
      if (qualificationType != null) 'QualificationType': qualificationType,
    };
  }
}

/// The HIT data structure represents a single HIT, including all the
/// information necessary for a Worker to accept and complete the HIT.
class HIT {
  /// The length of time, in seconds, that a Worker has to complete the HIT after
  /// accepting it.
  final int? assignmentDurationInSeconds;

  /// The amount of time, in seconds, after the Worker submits an assignment for
  /// the HIT that the results are automatically approved by Amazon Mechanical
  /// Turk. This is the amount of time the Requester has to reject an assignment
  /// submitted by a Worker before the assignment is auto-approved and the Worker
  /// is paid.
  final int? autoApprovalDelayInSeconds;

  /// The date and time the HIT was created.
  final DateTime? creationTime;

  /// A general description of the HIT.
  final String? description;

  /// The date and time the HIT expires.
  final DateTime? expiration;

  /// The ID of the HIT Group of this HIT.
  final String? hITGroupId;

  /// A unique identifier for the HIT.
  final String? hITId;

  /// The ID of the HIT Layout of this HIT.
  final String? hITLayoutId;

  /// Indicates the review status of the HIT. Valid Values are NotReviewed |
  /// MarkedForReview | ReviewedAppropriate | ReviewedInappropriate.
  final HITReviewStatus? hITReviewStatus;

  /// The status of the HIT and its assignments. Valid Values are Assignable |
  /// Unassignable | Reviewable | Reviewing | Disposed.
  final HITStatus? hITStatus;

  /// The ID of the HIT type of this HIT
  final String? hITTypeId;

  /// One or more words or phrases that describe the HIT, separated by commas.
  /// Search terms similar to the keywords of a HIT are more likely to have the
  /// HIT in the search results.
  final String? keywords;

  /// The number of times the HIT can be accepted and completed before the HIT
  /// becomes unavailable.
  final int? maxAssignments;

  /// The number of assignments for this HIT that are available for Workers to
  /// accept.
  final int? numberOfAssignmentsAvailable;

  /// The number of assignments for this HIT that have been approved or rejected.
  final int? numberOfAssignmentsCompleted;

  /// The number of assignments for this HIT that are being previewed or have been
  /// accepted by Workers, but have not yet been submitted, returned, or
  /// abandoned.
  final int? numberOfAssignmentsPending;

  /// Conditions that a Worker's Qualifications must meet in order to accept the
  /// HIT. A HIT can have between zero and ten Qualification requirements. All
  /// requirements must be met in order for a Worker to accept the HIT.
  /// Additionally, other actions can be restricted using the
  /// <code>ActionsGuarded</code> field on each
  /// <code>QualificationRequirement</code> structure.
  final List<QualificationRequirement>? qualificationRequirements;

  /// The data the Worker completing the HIT uses produce the results. This is
  /// either either a QuestionForm, HTMLQuestion or an ExternalQuestion data
  /// structure.
  final String? question;

  /// An arbitrary data field the Requester who created the HIT can use. This
  /// field is visible only to the creator of the HIT.
  final String? requesterAnnotation;
  final String? reward;

  /// The title of the HIT.
  final String? title;

  HIT({
    this.assignmentDurationInSeconds,
    this.autoApprovalDelayInSeconds,
    this.creationTime,
    this.description,
    this.expiration,
    this.hITGroupId,
    this.hITId,
    this.hITLayoutId,
    this.hITReviewStatus,
    this.hITStatus,
    this.hITTypeId,
    this.keywords,
    this.maxAssignments,
    this.numberOfAssignmentsAvailable,
    this.numberOfAssignmentsCompleted,
    this.numberOfAssignmentsPending,
    this.qualificationRequirements,
    this.question,
    this.requesterAnnotation,
    this.reward,
    this.title,
  });

  factory HIT.fromJson(Map<String, dynamic> json) {
    return HIT(
      assignmentDurationInSeconds: json['AssignmentDurationInSeconds'] as int?,
      autoApprovalDelayInSeconds: json['AutoApprovalDelayInSeconds'] as int?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      expiration: timeStampFromJson(json['Expiration']),
      hITGroupId: json['HITGroupId'] as String?,
      hITId: json['HITId'] as String?,
      hITLayoutId: json['HITLayoutId'] as String?,
      hITReviewStatus:
          (json['HITReviewStatus'] as String?)?.toHITReviewStatus(),
      hITStatus: (json['HITStatus'] as String?)?.toHITStatus(),
      hITTypeId: json['HITTypeId'] as String?,
      keywords: json['Keywords'] as String?,
      maxAssignments: json['MaxAssignments'] as int?,
      numberOfAssignmentsAvailable:
          json['NumberOfAssignmentsAvailable'] as int?,
      numberOfAssignmentsCompleted:
          json['NumberOfAssignmentsCompleted'] as int?,
      numberOfAssignmentsPending: json['NumberOfAssignmentsPending'] as int?,
      qualificationRequirements: (json['QualificationRequirements'] as List?)
          ?.whereNotNull()
          .map((e) =>
              QualificationRequirement.fromJson(e as Map<String, dynamic>))
          .toList(),
      question: json['Question'] as String?,
      requesterAnnotation: json['RequesterAnnotation'] as String?,
      reward: json['Reward'] as String?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assignmentDurationInSeconds = this.assignmentDurationInSeconds;
    final autoApprovalDelayInSeconds = this.autoApprovalDelayInSeconds;
    final creationTime = this.creationTime;
    final description = this.description;
    final expiration = this.expiration;
    final hITGroupId = this.hITGroupId;
    final hITId = this.hITId;
    final hITLayoutId = this.hITLayoutId;
    final hITReviewStatus = this.hITReviewStatus;
    final hITStatus = this.hITStatus;
    final hITTypeId = this.hITTypeId;
    final keywords = this.keywords;
    final maxAssignments = this.maxAssignments;
    final numberOfAssignmentsAvailable = this.numberOfAssignmentsAvailable;
    final numberOfAssignmentsCompleted = this.numberOfAssignmentsCompleted;
    final numberOfAssignmentsPending = this.numberOfAssignmentsPending;
    final qualificationRequirements = this.qualificationRequirements;
    final question = this.question;
    final requesterAnnotation = this.requesterAnnotation;
    final reward = this.reward;
    final title = this.title;
    return {
      if (assignmentDurationInSeconds != null)
        'AssignmentDurationInSeconds': assignmentDurationInSeconds,
      if (autoApprovalDelayInSeconds != null)
        'AutoApprovalDelayInSeconds': autoApprovalDelayInSeconds,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (expiration != null) 'Expiration': unixTimestampToJson(expiration),
      if (hITGroupId != null) 'HITGroupId': hITGroupId,
      if (hITId != null) 'HITId': hITId,
      if (hITLayoutId != null) 'HITLayoutId': hITLayoutId,
      if (hITReviewStatus != null) 'HITReviewStatus': hITReviewStatus.toValue(),
      if (hITStatus != null) 'HITStatus': hITStatus.toValue(),
      if (hITTypeId != null) 'HITTypeId': hITTypeId,
      if (keywords != null) 'Keywords': keywords,
      if (maxAssignments != null) 'MaxAssignments': maxAssignments,
      if (numberOfAssignmentsAvailable != null)
        'NumberOfAssignmentsAvailable': numberOfAssignmentsAvailable,
      if (numberOfAssignmentsCompleted != null)
        'NumberOfAssignmentsCompleted': numberOfAssignmentsCompleted,
      if (numberOfAssignmentsPending != null)
        'NumberOfAssignmentsPending': numberOfAssignmentsPending,
      if (qualificationRequirements != null)
        'QualificationRequirements': qualificationRequirements,
      if (question != null) 'Question': question,
      if (requesterAnnotation != null)
        'RequesterAnnotation': requesterAnnotation,
      if (reward != null) 'Reward': reward,
      if (title != null) 'Title': title,
    };
  }
}

enum HITAccessActions {
  accept,
  previewAndAccept,
  discoverPreviewAndAccept,
}

extension HITAccessActionsValueExtension on HITAccessActions {
  String toValue() {
    switch (this) {
      case HITAccessActions.accept:
        return 'Accept';
      case HITAccessActions.previewAndAccept:
        return 'PreviewAndAccept';
      case HITAccessActions.discoverPreviewAndAccept:
        return 'DiscoverPreviewAndAccept';
    }
  }
}

extension HITAccessActionsFromString on String {
  HITAccessActions toHITAccessActions() {
    switch (this) {
      case 'Accept':
        return HITAccessActions.accept;
      case 'PreviewAndAccept':
        return HITAccessActions.previewAndAccept;
      case 'DiscoverPreviewAndAccept':
        return HITAccessActions.discoverPreviewAndAccept;
    }
    throw Exception('$this is not known in enum HITAccessActions');
  }
}

/// The HITLayoutParameter data structure defines parameter values used with a
/// HITLayout. A HITLayout is a reusable Amazon Mechanical Turk project template
/// used to provide Human Intelligence Task (HIT) question data for CreateHIT.
class HITLayoutParameter {
  /// The name of the parameter in the HITLayout.
  final String name;

  /// The value substituted for the parameter referenced in the HITLayout.
  final String value;

  HITLayoutParameter({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

enum HITReviewStatus {
  notReviewed,
  markedForReview,
  reviewedAppropriate,
  reviewedInappropriate,
}

extension HITReviewStatusValueExtension on HITReviewStatus {
  String toValue() {
    switch (this) {
      case HITReviewStatus.notReviewed:
        return 'NotReviewed';
      case HITReviewStatus.markedForReview:
        return 'MarkedForReview';
      case HITReviewStatus.reviewedAppropriate:
        return 'ReviewedAppropriate';
      case HITReviewStatus.reviewedInappropriate:
        return 'ReviewedInappropriate';
    }
  }
}

extension HITReviewStatusFromString on String {
  HITReviewStatus toHITReviewStatus() {
    switch (this) {
      case 'NotReviewed':
        return HITReviewStatus.notReviewed;
      case 'MarkedForReview':
        return HITReviewStatus.markedForReview;
      case 'ReviewedAppropriate':
        return HITReviewStatus.reviewedAppropriate;
      case 'ReviewedInappropriate':
        return HITReviewStatus.reviewedInappropriate;
    }
    throw Exception('$this is not known in enum HITReviewStatus');
  }
}

enum HITStatus {
  assignable,
  unassignable,
  reviewable,
  reviewing,
  disposed,
}

extension HITStatusValueExtension on HITStatus {
  String toValue() {
    switch (this) {
      case HITStatus.assignable:
        return 'Assignable';
      case HITStatus.unassignable:
        return 'Unassignable';
      case HITStatus.reviewable:
        return 'Reviewable';
      case HITStatus.reviewing:
        return 'Reviewing';
      case HITStatus.disposed:
        return 'Disposed';
    }
  }
}

extension HITStatusFromString on String {
  HITStatus toHITStatus() {
    switch (this) {
      case 'Assignable':
        return HITStatus.assignable;
      case 'Unassignable':
        return HITStatus.unassignable;
      case 'Reviewable':
        return HITStatus.reviewable;
      case 'Reviewing':
        return HITStatus.reviewing;
      case 'Disposed':
        return HITStatus.disposed;
    }
    throw Exception('$this is not known in enum HITStatus');
  }
}

class ListAssignmentsForHITResponse {
  /// The collection of Assignment data structures returned by this call.
  final List<Assignment>? assignments;
  final String? nextToken;

  /// The number of assignments on the page in the filtered results list,
  /// equivalent to the number of assignments returned by this call.
  final int? numResults;

  ListAssignmentsForHITResponse({
    this.assignments,
    this.nextToken,
    this.numResults,
  });

  factory ListAssignmentsForHITResponse.fromJson(Map<String, dynamic> json) {
    return ListAssignmentsForHITResponse(
      assignments: (json['Assignments'] as List?)
          ?.whereNotNull()
          .map((e) => Assignment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      numResults: json['NumResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final assignments = this.assignments;
    final nextToken = this.nextToken;
    final numResults = this.numResults;
    return {
      if (assignments != null) 'Assignments': assignments,
      if (nextToken != null) 'NextToken': nextToken,
      if (numResults != null) 'NumResults': numResults,
    };
  }
}

class ListBonusPaymentsResponse {
  /// A successful request to the ListBonusPayments operation returns a list of
  /// BonusPayment objects.
  final List<BonusPayment>? bonusPayments;
  final String? nextToken;

  /// The number of bonus payments on this page in the filtered results list,
  /// equivalent to the number of bonus payments being returned by this call.
  final int? numResults;

  ListBonusPaymentsResponse({
    this.bonusPayments,
    this.nextToken,
    this.numResults,
  });

  factory ListBonusPaymentsResponse.fromJson(Map<String, dynamic> json) {
    return ListBonusPaymentsResponse(
      bonusPayments: (json['BonusPayments'] as List?)
          ?.whereNotNull()
          .map((e) => BonusPayment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      numResults: json['NumResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bonusPayments = this.bonusPayments;
    final nextToken = this.nextToken;
    final numResults = this.numResults;
    return {
      if (bonusPayments != null) 'BonusPayments': bonusPayments,
      if (nextToken != null) 'NextToken': nextToken,
      if (numResults != null) 'NumResults': numResults,
    };
  }
}

class ListHITsForQualificationTypeResponse {
  /// The list of HIT elements returned by the query.
  final List<HIT>? hITs;
  final String? nextToken;

  /// The number of HITs on this page in the filtered results list, equivalent to
  /// the number of HITs being returned by this call.
  final int? numResults;

  ListHITsForQualificationTypeResponse({
    this.hITs,
    this.nextToken,
    this.numResults,
  });

  factory ListHITsForQualificationTypeResponse.fromJson(
      Map<String, dynamic> json) {
    return ListHITsForQualificationTypeResponse(
      hITs: (json['HITs'] as List?)
          ?.whereNotNull()
          .map((e) => HIT.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      numResults: json['NumResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final hITs = this.hITs;
    final nextToken = this.nextToken;
    final numResults = this.numResults;
    return {
      if (hITs != null) 'HITs': hITs,
      if (nextToken != null) 'NextToken': nextToken,
      if (numResults != null) 'NumResults': numResults,
    };
  }
}

class ListHITsResponse {
  /// The list of HIT elements returned by the query.
  final List<HIT>? hITs;
  final String? nextToken;

  /// The number of HITs on this page in the filtered results list, equivalent to
  /// the number of HITs being returned by this call.
  final int? numResults;

  ListHITsResponse({
    this.hITs,
    this.nextToken,
    this.numResults,
  });

  factory ListHITsResponse.fromJson(Map<String, dynamic> json) {
    return ListHITsResponse(
      hITs: (json['HITs'] as List?)
          ?.whereNotNull()
          .map((e) => HIT.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      numResults: json['NumResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final hITs = this.hITs;
    final nextToken = this.nextToken;
    final numResults = this.numResults;
    return {
      if (hITs != null) 'HITs': hITs,
      if (nextToken != null) 'NextToken': nextToken,
      if (numResults != null) 'NumResults': numResults,
    };
  }
}

class ListQualificationRequestsResponse {
  final String? nextToken;

  /// The number of Qualification requests on this page in the filtered results
  /// list, equivalent to the number of Qualification requests being returned by
  /// this call.
  final int? numResults;

  /// The Qualification request. The response includes one QualificationRequest
  /// element for each Qualification request returned by the query.
  final List<QualificationRequest>? qualificationRequests;

  ListQualificationRequestsResponse({
    this.nextToken,
    this.numResults,
    this.qualificationRequests,
  });

  factory ListQualificationRequestsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListQualificationRequestsResponse(
      nextToken: json['NextToken'] as String?,
      numResults: json['NumResults'] as int?,
      qualificationRequests: (json['QualificationRequests'] as List?)
          ?.whereNotNull()
          .map((e) => QualificationRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final numResults = this.numResults;
    final qualificationRequests = this.qualificationRequests;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (numResults != null) 'NumResults': numResults,
      if (qualificationRequests != null)
        'QualificationRequests': qualificationRequests,
    };
  }
}

class ListQualificationTypesResponse {
  final String? nextToken;

  /// The number of Qualification types on this page in the filtered results list,
  /// equivalent to the number of types this operation returns.
  final int? numResults;

  /// The list of QualificationType elements returned by the query.
  final List<QualificationType>? qualificationTypes;

  ListQualificationTypesResponse({
    this.nextToken,
    this.numResults,
    this.qualificationTypes,
  });

  factory ListQualificationTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListQualificationTypesResponse(
      nextToken: json['NextToken'] as String?,
      numResults: json['NumResults'] as int?,
      qualificationTypes: (json['QualificationTypes'] as List?)
          ?.whereNotNull()
          .map((e) => QualificationType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final numResults = this.numResults;
    final qualificationTypes = this.qualificationTypes;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (numResults != null) 'NumResults': numResults,
      if (qualificationTypes != null) 'QualificationTypes': qualificationTypes,
    };
  }
}

class ListReviewPolicyResultsForHITResponse {
  /// The name of the Assignment-level Review Policy. This contains only the
  /// PolicyName element.
  final ReviewPolicy? assignmentReviewPolicy;

  /// Contains both ReviewResult and ReviewAction elements for an Assignment.
  final ReviewReport? assignmentReviewReport;

  /// The HITId of the HIT for which results have been returned.
  final String? hITId;

  /// The name of the HIT-level Review Policy. This contains only the PolicyName
  /// element.
  final ReviewPolicy? hITReviewPolicy;

  /// Contains both ReviewResult and ReviewAction elements for a particular HIT.
  final ReviewReport? hITReviewReport;
  final String? nextToken;

  ListReviewPolicyResultsForHITResponse({
    this.assignmentReviewPolicy,
    this.assignmentReviewReport,
    this.hITId,
    this.hITReviewPolicy,
    this.hITReviewReport,
    this.nextToken,
  });

  factory ListReviewPolicyResultsForHITResponse.fromJson(
      Map<String, dynamic> json) {
    return ListReviewPolicyResultsForHITResponse(
      assignmentReviewPolicy: json['AssignmentReviewPolicy'] != null
          ? ReviewPolicy.fromJson(
              json['AssignmentReviewPolicy'] as Map<String, dynamic>)
          : null,
      assignmentReviewReport: json['AssignmentReviewReport'] != null
          ? ReviewReport.fromJson(
              json['AssignmentReviewReport'] as Map<String, dynamic>)
          : null,
      hITId: json['HITId'] as String?,
      hITReviewPolicy: json['HITReviewPolicy'] != null
          ? ReviewPolicy.fromJson(
              json['HITReviewPolicy'] as Map<String, dynamic>)
          : null,
      hITReviewReport: json['HITReviewReport'] != null
          ? ReviewReport.fromJson(
              json['HITReviewReport'] as Map<String, dynamic>)
          : null,
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assignmentReviewPolicy = this.assignmentReviewPolicy;
    final assignmentReviewReport = this.assignmentReviewReport;
    final hITId = this.hITId;
    final hITReviewPolicy = this.hITReviewPolicy;
    final hITReviewReport = this.hITReviewReport;
    final nextToken = this.nextToken;
    return {
      if (assignmentReviewPolicy != null)
        'AssignmentReviewPolicy': assignmentReviewPolicy,
      if (assignmentReviewReport != null)
        'AssignmentReviewReport': assignmentReviewReport,
      if (hITId != null) 'HITId': hITId,
      if (hITReviewPolicy != null) 'HITReviewPolicy': hITReviewPolicy,
      if (hITReviewReport != null) 'HITReviewReport': hITReviewReport,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListReviewableHITsResponse {
  /// The list of HIT elements returned by the query.
  final List<HIT>? hITs;
  final String? nextToken;

  /// The number of HITs on this page in the filtered results list, equivalent to
  /// the number of HITs being returned by this call.
  final int? numResults;

  ListReviewableHITsResponse({
    this.hITs,
    this.nextToken,
    this.numResults,
  });

  factory ListReviewableHITsResponse.fromJson(Map<String, dynamic> json) {
    return ListReviewableHITsResponse(
      hITs: (json['HITs'] as List?)
          ?.whereNotNull()
          .map((e) => HIT.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      numResults: json['NumResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final hITs = this.hITs;
    final nextToken = this.nextToken;
    final numResults = this.numResults;
    return {
      if (hITs != null) 'HITs': hITs,
      if (nextToken != null) 'NextToken': nextToken,
      if (numResults != null) 'NumResults': numResults,
    };
  }
}

class ListWorkerBlocksResponse {
  final String? nextToken;

  /// The number of assignments on the page in the filtered results list,
  /// equivalent to the number of assignments returned by this call.
  final int? numResults;

  /// The list of WorkerBlocks, containing the collection of Worker IDs and
  /// reasons for blocking.
  final List<WorkerBlock>? workerBlocks;

  ListWorkerBlocksResponse({
    this.nextToken,
    this.numResults,
    this.workerBlocks,
  });

  factory ListWorkerBlocksResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkerBlocksResponse(
      nextToken: json['NextToken'] as String?,
      numResults: json['NumResults'] as int?,
      workerBlocks: (json['WorkerBlocks'] as List?)
          ?.whereNotNull()
          .map((e) => WorkerBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final numResults = this.numResults;
    final workerBlocks = this.workerBlocks;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (numResults != null) 'NumResults': numResults,
      if (workerBlocks != null) 'WorkerBlocks': workerBlocks,
    };
  }
}

class ListWorkersWithQualificationTypeResponse {
  final String? nextToken;

  /// The number of Qualifications on this page in the filtered results list,
  /// equivalent to the number of Qualifications being returned by this call.
  final int? numResults;

  /// The list of Qualification elements returned by this call.
  final List<Qualification>? qualifications;

  ListWorkersWithQualificationTypeResponse({
    this.nextToken,
    this.numResults,
    this.qualifications,
  });

  factory ListWorkersWithQualificationTypeResponse.fromJson(
      Map<String, dynamic> json) {
    return ListWorkersWithQualificationTypeResponse(
      nextToken: json['NextToken'] as String?,
      numResults: json['NumResults'] as int?,
      qualifications: (json['Qualifications'] as List?)
          ?.whereNotNull()
          .map((e) => Qualification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final numResults = this.numResults;
    final qualifications = this.qualifications;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (numResults != null) 'NumResults': numResults,
      if (qualifications != null) 'Qualifications': qualifications,
    };
  }
}

/// The Locale data structure represents a geographical region or location.
class Locale {
  /// The country of the locale. Must be a valid ISO 3166 country code. For
  /// example, the code US refers to the United States of America.
  final String country;

  /// The state or subdivision of the locale. A valid ISO 3166-2 subdivision code.
  /// For example, the code WA refers to the state of Washington.
  final String? subdivision;

  Locale({
    required this.country,
    this.subdivision,
  });

  factory Locale.fromJson(Map<String, dynamic> json) {
    return Locale(
      country: json['Country'] as String,
      subdivision: json['Subdivision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final country = this.country;
    final subdivision = this.subdivision;
    return {
      'Country': country,
      if (subdivision != null) 'Subdivision': subdivision,
    };
  }
}

/// The NotificationSpecification data structure describes a HIT event
/// notification for a HIT type.
class NotificationSpecification {
  /// The target for notification messages. The Destination’s format is determined
  /// by the specified Transport:
  ///
  /// <ul>
  /// <li>
  /// When Transport is Email, the Destination is your email address.
  /// </li>
  /// <li>
  /// When Transport is SQS, the Destination is your queue URL.
  /// </li>
  /// <li>
  /// When Transport is SNS, the Destination is the ARN of your topic.
  /// </li>
  /// </ul>
  final String destination;

  /// The list of events that should cause notifications to be sent. Valid Values:
  /// AssignmentAccepted | AssignmentAbandoned | AssignmentReturned |
  /// AssignmentSubmitted | AssignmentRejected | AssignmentApproved | HITCreated |
  /// HITExtended | HITDisposed | HITReviewable | HITExpired | Ping. The Ping
  /// event is only valid for the SendTestEventNotification operation.
  final List<EventType> eventTypes;

  /// The method Amazon Mechanical Turk uses to send the notification. Valid
  /// Values: Email | SQS | SNS.
  final NotificationTransport transport;

  /// The version of the Notification API to use. Valid value is 2006-05-05.
  final String version;

  NotificationSpecification({
    required this.destination,
    required this.eventTypes,
    required this.transport,
    required this.version,
  });

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final eventTypes = this.eventTypes;
    final transport = this.transport;
    final version = this.version;
    return {
      'Destination': destination,
      'EventTypes': eventTypes.map((e) => e.toValue()).toList(),
      'Transport': transport.toValue(),
      'Version': version,
    };
  }
}

enum NotificationTransport {
  email,
  sqs,
  sns,
}

extension NotificationTransportValueExtension on NotificationTransport {
  String toValue() {
    switch (this) {
      case NotificationTransport.email:
        return 'Email';
      case NotificationTransport.sqs:
        return 'SQS';
      case NotificationTransport.sns:
        return 'SNS';
    }
  }
}

extension NotificationTransportFromString on String {
  NotificationTransport toNotificationTransport() {
    switch (this) {
      case 'Email':
        return NotificationTransport.email;
      case 'SQS':
        return NotificationTransport.sqs;
      case 'SNS':
        return NotificationTransport.sns;
    }
    throw Exception('$this is not known in enum NotificationTransport');
  }
}

enum NotifyWorkersFailureCode {
  softFailure,
  hardFailure,
}

extension NotifyWorkersFailureCodeValueExtension on NotifyWorkersFailureCode {
  String toValue() {
    switch (this) {
      case NotifyWorkersFailureCode.softFailure:
        return 'SoftFailure';
      case NotifyWorkersFailureCode.hardFailure:
        return 'HardFailure';
    }
  }
}

extension NotifyWorkersFailureCodeFromString on String {
  NotifyWorkersFailureCode toNotifyWorkersFailureCode() {
    switch (this) {
      case 'SoftFailure':
        return NotifyWorkersFailureCode.softFailure;
      case 'HardFailure':
        return NotifyWorkersFailureCode.hardFailure;
    }
    throw Exception('$this is not known in enum NotifyWorkersFailureCode');
  }
}

/// When MTurk encounters an issue with notifying the Workers you specified, it
/// returns back this object with failure details.
class NotifyWorkersFailureStatus {
  /// Encoded value for the failure type.
  final NotifyWorkersFailureCode? notifyWorkersFailureCode;

  /// A message detailing the reason the Worker could not be notified.
  final String? notifyWorkersFailureMessage;

  /// The ID of the Worker.
  final String? workerId;

  NotifyWorkersFailureStatus({
    this.notifyWorkersFailureCode,
    this.notifyWorkersFailureMessage,
    this.workerId,
  });

  factory NotifyWorkersFailureStatus.fromJson(Map<String, dynamic> json) {
    return NotifyWorkersFailureStatus(
      notifyWorkersFailureCode: (json['NotifyWorkersFailureCode'] as String?)
          ?.toNotifyWorkersFailureCode(),
      notifyWorkersFailureMessage:
          json['NotifyWorkersFailureMessage'] as String?,
      workerId: json['WorkerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final notifyWorkersFailureCode = this.notifyWorkersFailureCode;
    final notifyWorkersFailureMessage = this.notifyWorkersFailureMessage;
    final workerId = this.workerId;
    return {
      if (notifyWorkersFailureCode != null)
        'NotifyWorkersFailureCode': notifyWorkersFailureCode.toValue(),
      if (notifyWorkersFailureMessage != null)
        'NotifyWorkersFailureMessage': notifyWorkersFailureMessage,
      if (workerId != null) 'WorkerId': workerId,
    };
  }
}

class NotifyWorkersResponse {
  /// When MTurk sends notifications to the list of Workers, it returns back any
  /// failures it encounters in this list of NotifyWorkersFailureStatus objects.
  final List<NotifyWorkersFailureStatus>? notifyWorkersFailureStatuses;

  NotifyWorkersResponse({
    this.notifyWorkersFailureStatuses,
  });

  factory NotifyWorkersResponse.fromJson(Map<String, dynamic> json) {
    return NotifyWorkersResponse(
      notifyWorkersFailureStatuses: (json['NotifyWorkersFailureStatuses']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              NotifyWorkersFailureStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final notifyWorkersFailureStatuses = this.notifyWorkersFailureStatuses;
    return {
      if (notifyWorkersFailureStatuses != null)
        'NotifyWorkersFailureStatuses': notifyWorkersFailureStatuses,
    };
  }
}

/// This data structure is the data type for the AnswerKey parameter of the
/// ScoreMyKnownAnswers/2011-09-01 Review Policy.
class ParameterMapEntry {
  /// The QuestionID from the HIT that is used to identify which question requires
  /// Mechanical Turk to score as part of the ScoreMyKnownAnswers/2011-09-01
  /// Review Policy.
  final String? key;

  /// The list of answers to the question specified in the MapEntry Key element.
  /// The Worker must match all values in order for the answer to be scored
  /// correctly.
  final List<String>? values;

  ParameterMapEntry({
    this.key,
    this.values,
  });

  factory ParameterMapEntry.fromJson(Map<String, dynamic> json) {
    return ParameterMapEntry(
      key: json['Key'] as String?,
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      if (key != null) 'Key': key,
      if (values != null) 'Values': values,
    };
  }
}

/// Name of the parameter from the Review policy.
class PolicyParameter {
  /// Name of the parameter from the list of Review Polices.
  final String? key;

  /// List of ParameterMapEntry objects.
  final List<ParameterMapEntry>? mapEntries;

  /// The list of values of the Parameter
  final List<String>? values;

  PolicyParameter({
    this.key,
    this.mapEntries,
    this.values,
  });

  factory PolicyParameter.fromJson(Map<String, dynamic> json) {
    return PolicyParameter(
      key: json['Key'] as String?,
      mapEntries: (json['MapEntries'] as List?)
          ?.whereNotNull()
          .map((e) => ParameterMapEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final mapEntries = this.mapEntries;
    final values = this.values;
    return {
      if (key != null) 'Key': key,
      if (mapEntries != null) 'MapEntries': mapEntries,
      if (values != null) 'Values': values,
    };
  }
}

/// The Qualification data structure represents a Qualification assigned to a
/// user, including the Qualification type and the value (score).
class Qualification {
  /// The date and time the Qualification was granted to the Worker. If the
  /// Worker's Qualification was revoked, and then re-granted based on a new
  /// Qualification request, GrantTime is the date and time of the last call to
  /// the AcceptQualificationRequest operation.
  final DateTime? grantTime;

  /// The value (score) of the Qualification, if the Qualification has an integer
  /// value.
  final int? integerValue;
  final Locale? localeValue;

  /// The ID of the Qualification type for the Qualification.
  final String? qualificationTypeId;

  /// The status of the Qualification. Valid values are Granted | Revoked.
  final QualificationStatus? status;

  /// The ID of the Worker who possesses the Qualification.
  final String? workerId;

  Qualification({
    this.grantTime,
    this.integerValue,
    this.localeValue,
    this.qualificationTypeId,
    this.status,
    this.workerId,
  });

  factory Qualification.fromJson(Map<String, dynamic> json) {
    return Qualification(
      grantTime: timeStampFromJson(json['GrantTime']),
      integerValue: json['IntegerValue'] as int?,
      localeValue: json['LocaleValue'] != null
          ? Locale.fromJson(json['LocaleValue'] as Map<String, dynamic>)
          : null,
      qualificationTypeId: json['QualificationTypeId'] as String?,
      status: (json['Status'] as String?)?.toQualificationStatus(),
      workerId: json['WorkerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grantTime = this.grantTime;
    final integerValue = this.integerValue;
    final localeValue = this.localeValue;
    final qualificationTypeId = this.qualificationTypeId;
    final status = this.status;
    final workerId = this.workerId;
    return {
      if (grantTime != null) 'GrantTime': unixTimestampToJson(grantTime),
      if (integerValue != null) 'IntegerValue': integerValue,
      if (localeValue != null) 'LocaleValue': localeValue,
      if (qualificationTypeId != null)
        'QualificationTypeId': qualificationTypeId,
      if (status != null) 'Status': status.toValue(),
      if (workerId != null) 'WorkerId': workerId,
    };
  }
}

/// The QualificationRequest data structure represents a request a Worker has
/// made for a Qualification.
class QualificationRequest {
  /// The Worker's answers for the Qualification type's test contained in a
  /// QuestionFormAnswers document, if the type has a test and the Worker has
  /// submitted answers. If the Worker does not provide any answers, Answer may be
  /// empty.
  final String? answer;

  /// The ID of the Qualification request, a unique identifier generated when the
  /// request was submitted.
  final String? qualificationRequestId;

  /// The ID of the Qualification type the Worker is requesting, as returned by
  /// the CreateQualificationType operation.
  final String? qualificationTypeId;

  /// The date and time the Qualification request had a status of Submitted. This
  /// is either the time the Worker submitted answers for a Qualification test, or
  /// the time the Worker requested the Qualification if the Qualification type
  /// does not have a test.
  final DateTime? submitTime;

  /// The contents of the Qualification test that was presented to the Worker, if
  /// the type has a test and the Worker has submitted answers. This value is
  /// identical to the QuestionForm associated with the Qualification type at the
  /// time the Worker requests the Qualification.
  final String? test;

  /// The ID of the Worker requesting the Qualification.
  final String? workerId;

  QualificationRequest({
    this.answer,
    this.qualificationRequestId,
    this.qualificationTypeId,
    this.submitTime,
    this.test,
    this.workerId,
  });

  factory QualificationRequest.fromJson(Map<String, dynamic> json) {
    return QualificationRequest(
      answer: json['Answer'] as String?,
      qualificationRequestId: json['QualificationRequestId'] as String?,
      qualificationTypeId: json['QualificationTypeId'] as String?,
      submitTime: timeStampFromJson(json['SubmitTime']),
      test: json['Test'] as String?,
      workerId: json['WorkerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final answer = this.answer;
    final qualificationRequestId = this.qualificationRequestId;
    final qualificationTypeId = this.qualificationTypeId;
    final submitTime = this.submitTime;
    final test = this.test;
    final workerId = this.workerId;
    return {
      if (answer != null) 'Answer': answer,
      if (qualificationRequestId != null)
        'QualificationRequestId': qualificationRequestId,
      if (qualificationTypeId != null)
        'QualificationTypeId': qualificationTypeId,
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
      if (test != null) 'Test': test,
      if (workerId != null) 'WorkerId': workerId,
    };
  }
}

/// The QualificationRequirement data structure describes a Qualification that a
/// Worker must have before the Worker is allowed to accept a HIT. A requirement
/// may optionally state that a Worker must have the Qualification in order to
/// preview the HIT, or see the HIT in search results.
class QualificationRequirement {
  /// The kind of comparison to make against a Qualification's value. You can
  /// compare a Qualification's value to an IntegerValue to see if it is LessThan,
  /// LessThanOrEqualTo, GreaterThan, GreaterThanOrEqualTo, EqualTo, or NotEqualTo
  /// the IntegerValue. You can compare it to a LocaleValue to see if it is
  /// EqualTo, or NotEqualTo the LocaleValue. You can check to see if the value is
  /// In or NotIn a set of IntegerValue or LocaleValue values. Lastly, a
  /// Qualification requirement can also test if a Qualification Exists or
  /// DoesNotExist in the user's profile, regardless of its value.
  final Comparator comparator;

  /// The ID of the Qualification type for the requirement.
  final String qualificationTypeId;

  /// Setting this attribute prevents Workers whose Qualifications do not meet
  /// this QualificationRequirement from taking the specified action. Valid
  /// arguments include "Accept" (Worker cannot accept the HIT, but can preview
  /// the HIT and see it in their search results), "PreviewAndAccept" (Worker
  /// cannot accept or preview the HIT, but can see the HIT in their search
  /// results), and "DiscoverPreviewAndAccept" (Worker cannot accept, preview, or
  /// see the HIT in their search results). It's possible for you to create a HIT
  /// with multiple QualificationRequirements (which can have different values for
  /// the ActionGuarded attribute). In this case, the Worker is only permitted to
  /// perform an action when they have met all QualificationRequirements guarding
  /// the action. The actions in the order of least restrictive to most
  /// restrictive are Discover, Preview and Accept. For example, if a Worker meets
  /// all QualificationRequirements that are set to DiscoverPreviewAndAccept, but
  /// do not meet all requirements that are set with PreviewAndAccept, then the
  /// Worker will be able to Discover, i.e. see the HIT in their search result,
  /// but will not be able to Preview or Accept the HIT. ActionsGuarded should not
  /// be used in combination with the <code>RequiredToPreview</code> field.
  final HITAccessActions? actionsGuarded;

  /// The integer value to compare against the Qualification's value. IntegerValue
  /// must not be present if Comparator is Exists or DoesNotExist. IntegerValue
  /// can only be used if the Qualification type has an integer value; it cannot
  /// be used with the Worker_Locale QualificationType ID. When performing a set
  /// comparison by using the In or the NotIn comparator, you can use up to 15
  /// IntegerValue elements in a QualificationRequirement data structure.
  final List<int>? integerValues;

  /// The locale value to compare against the Qualification's value. The local
  /// value must be a valid ISO 3166 country code or supports ISO 3166-2
  /// subdivisions. LocaleValue can only be used with a Worker_Locale
  /// QualificationType ID. LocaleValue can only be used with the EqualTo,
  /// NotEqualTo, In, and NotIn comparators. You must only use a single
  /// LocaleValue element when using the EqualTo or NotEqualTo comparators. When
  /// performing a set comparison by using the In or the NotIn comparator, you can
  /// use up to 30 LocaleValue elements in a QualificationRequirement data
  /// structure.
  final List<Locale>? localeValues;

  /// DEPRECATED: Use the <code>ActionsGuarded</code> field instead. If
  /// RequiredToPreview is true, the question data for the HIT will not be shown
  /// when a Worker whose Qualifications do not meet this requirement tries to
  /// preview the HIT. That is, a Worker's Qualifications must meet all of the
  /// requirements for which RequiredToPreview is true in order to preview the
  /// HIT. If a Worker meets all of the requirements where RequiredToPreview is
  /// true (or if there are no such requirements), but does not meet all of the
  /// requirements for the HIT, the Worker will be allowed to preview the HIT's
  /// question data, but will not be allowed to accept and complete the HIT. The
  /// default is false. This should not be used in combination with the
  /// <code>ActionsGuarded</code> field.
  final bool? requiredToPreview;

  QualificationRequirement({
    required this.comparator,
    required this.qualificationTypeId,
    this.actionsGuarded,
    this.integerValues,
    this.localeValues,
    this.requiredToPreview,
  });

  factory QualificationRequirement.fromJson(Map<String, dynamic> json) {
    return QualificationRequirement(
      comparator: (json['Comparator'] as String).toComparator(),
      qualificationTypeId: json['QualificationTypeId'] as String,
      actionsGuarded: (json['ActionsGuarded'] as String?)?.toHITAccessActions(),
      integerValues: (json['IntegerValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      localeValues: (json['LocaleValues'] as List?)
          ?.whereNotNull()
          .map((e) => Locale.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiredToPreview: json['RequiredToPreview'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparator = this.comparator;
    final qualificationTypeId = this.qualificationTypeId;
    final actionsGuarded = this.actionsGuarded;
    final integerValues = this.integerValues;
    final localeValues = this.localeValues;
    final requiredToPreview = this.requiredToPreview;
    return {
      'Comparator': comparator.toValue(),
      'QualificationTypeId': qualificationTypeId,
      if (actionsGuarded != null) 'ActionsGuarded': actionsGuarded.toValue(),
      if (integerValues != null) 'IntegerValues': integerValues,
      if (localeValues != null) 'LocaleValues': localeValues,
      if (requiredToPreview != null) 'RequiredToPreview': requiredToPreview,
    };
  }
}

enum QualificationStatus {
  granted,
  revoked,
}

extension QualificationStatusValueExtension on QualificationStatus {
  String toValue() {
    switch (this) {
      case QualificationStatus.granted:
        return 'Granted';
      case QualificationStatus.revoked:
        return 'Revoked';
    }
  }
}

extension QualificationStatusFromString on String {
  QualificationStatus toQualificationStatus() {
    switch (this) {
      case 'Granted':
        return QualificationStatus.granted;
      case 'Revoked':
        return QualificationStatus.revoked;
    }
    throw Exception('$this is not known in enum QualificationStatus');
  }
}

/// The QualificationType data structure represents a Qualification type, a
/// description of a property of a Worker that must match the requirements of a
/// HIT for the Worker to be able to accept the HIT. The type also describes how
/// a Worker can obtain a Qualification of that type, such as through a
/// Qualification test.
class QualificationType {
  /// The answers to the Qualification test specified in the Test parameter.
  final String? answerKey;

  /// Specifies that requests for the Qualification type are granted immediately,
  /// without prompting the Worker with a Qualification test. Valid values are
  /// True | False.
  final bool? autoGranted;

  /// The Qualification integer value to use for automatically granted
  /// Qualifications, if AutoGranted is true. This is 1 by default.
  final int? autoGrantedValue;

  /// The date and time the Qualification type was created.
  final DateTime? creationTime;

  /// A long description for the Qualification type.
  final String? description;

  /// Specifies whether the Qualification type is one that a user can request
  /// through the Amazon Mechanical Turk web site, such as by taking a
  /// Qualification test. This value is False for Qualifications assigned
  /// automatically by the system. Valid values are True | False.
  final bool? isRequestable;

  /// One or more words or phrases that describe theQualification type, separated
  /// by commas. The Keywords make the type easier to find using a search.
  final String? keywords;

  /// The name of the Qualification type. The type name is used to identify the
  /// type, and to find the type using a Qualification type search.
  final String? name;

  /// A unique identifier for the Qualification type. A Qualification type is
  /// given a Qualification type ID when you call the CreateQualificationType
  /// operation.
  final String? qualificationTypeId;

  /// The status of the Qualification type. A Qualification type's status
  /// determines if users can apply to receive a Qualification of this type, and
  /// if HITs can be created with requirements based on this type. Valid values
  /// are Active | Inactive.
  final QualificationTypeStatus? qualificationTypeStatus;

  /// The amount of time, in seconds, Workers must wait after taking the
  /// Qualification test before they can take it again. Workers can take a
  /// Qualification test multiple times if they were not granted the Qualification
  /// from a previous attempt, or if the test offers a gradient score and they
  /// want a better score. If not specified, retries are disabled and Workers can
  /// request a Qualification only once.
  final int? retryDelayInSeconds;

  /// The questions for a Qualification test associated with this Qualification
  /// type that a user can take to obtain a Qualification of this type. This
  /// parameter must be specified if AnswerKey is present. A Qualification type
  /// cannot have both a specified Test parameter and an AutoGranted value of
  /// true.
  final String? test;

  /// The amount of time, in seconds, given to a Worker to complete the
  /// Qualification test, beginning from the time the Worker requests the
  /// Qualification.
  final int? testDurationInSeconds;

  QualificationType({
    this.answerKey,
    this.autoGranted,
    this.autoGrantedValue,
    this.creationTime,
    this.description,
    this.isRequestable,
    this.keywords,
    this.name,
    this.qualificationTypeId,
    this.qualificationTypeStatus,
    this.retryDelayInSeconds,
    this.test,
    this.testDurationInSeconds,
  });

  factory QualificationType.fromJson(Map<String, dynamic> json) {
    return QualificationType(
      answerKey: json['AnswerKey'] as String?,
      autoGranted: json['AutoGranted'] as bool?,
      autoGrantedValue: json['AutoGrantedValue'] as int?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      isRequestable: json['IsRequestable'] as bool?,
      keywords: json['Keywords'] as String?,
      name: json['Name'] as String?,
      qualificationTypeId: json['QualificationTypeId'] as String?,
      qualificationTypeStatus: (json['QualificationTypeStatus'] as String?)
          ?.toQualificationTypeStatus(),
      retryDelayInSeconds: json['RetryDelayInSeconds'] as int?,
      test: json['Test'] as String?,
      testDurationInSeconds: json['TestDurationInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final answerKey = this.answerKey;
    final autoGranted = this.autoGranted;
    final autoGrantedValue = this.autoGrantedValue;
    final creationTime = this.creationTime;
    final description = this.description;
    final isRequestable = this.isRequestable;
    final keywords = this.keywords;
    final name = this.name;
    final qualificationTypeId = this.qualificationTypeId;
    final qualificationTypeStatus = this.qualificationTypeStatus;
    final retryDelayInSeconds = this.retryDelayInSeconds;
    final test = this.test;
    final testDurationInSeconds = this.testDurationInSeconds;
    return {
      if (answerKey != null) 'AnswerKey': answerKey,
      if (autoGranted != null) 'AutoGranted': autoGranted,
      if (autoGrantedValue != null) 'AutoGrantedValue': autoGrantedValue,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (isRequestable != null) 'IsRequestable': isRequestable,
      if (keywords != null) 'Keywords': keywords,
      if (name != null) 'Name': name,
      if (qualificationTypeId != null)
        'QualificationTypeId': qualificationTypeId,
      if (qualificationTypeStatus != null)
        'QualificationTypeStatus': qualificationTypeStatus.toValue(),
      if (retryDelayInSeconds != null)
        'RetryDelayInSeconds': retryDelayInSeconds,
      if (test != null) 'Test': test,
      if (testDurationInSeconds != null)
        'TestDurationInSeconds': testDurationInSeconds,
    };
  }
}

enum QualificationTypeStatus {
  active,
  inactive,
}

extension QualificationTypeStatusValueExtension on QualificationTypeStatus {
  String toValue() {
    switch (this) {
      case QualificationTypeStatus.active:
        return 'Active';
      case QualificationTypeStatus.inactive:
        return 'Inactive';
    }
  }
}

extension QualificationTypeStatusFromString on String {
  QualificationTypeStatus toQualificationTypeStatus() {
    switch (this) {
      case 'Active':
        return QualificationTypeStatus.active;
      case 'Inactive':
        return QualificationTypeStatus.inactive;
    }
    throw Exception('$this is not known in enum QualificationTypeStatus');
  }
}

class RejectAssignmentResponse {
  RejectAssignmentResponse();

  factory RejectAssignmentResponse.fromJson(Map<String, dynamic> _) {
    return RejectAssignmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RejectQualificationRequestResponse {
  RejectQualificationRequestResponse();

  factory RejectQualificationRequestResponse.fromJson(Map<String, dynamic> _) {
    return RejectQualificationRequestResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Both the AssignmentReviewReport and the HITReviewReport elements contains
/// the ReviewActionDetail data structure. This structure is returned multiple
/// times for each action specified in the Review Policy.
class ReviewActionDetail {
  /// The unique identifier for the action.
  final String? actionId;

  /// The nature of the action itself. The Review Policy is responsible for
  /// examining the HIT and Assignments, emitting results, and deciding which
  /// other actions will be necessary.
  final String? actionName;

  /// The date when the action was completed.
  final DateTime? completeTime;

  /// Present only when the Results have a FAILED Status.
  final String? errorCode;

  /// A description of the outcome of the review.
  final String? result;

  /// The current disposition of the action: INTENDED, SUCCEEDED, FAILED, or
  /// CANCELLED.
  final ReviewActionStatus? status;

  /// The specific HITId or AssignmentID targeted by the action.
  final String? targetId;

  /// The type of object in TargetId.
  final String? targetType;

  ReviewActionDetail({
    this.actionId,
    this.actionName,
    this.completeTime,
    this.errorCode,
    this.result,
    this.status,
    this.targetId,
    this.targetType,
  });

  factory ReviewActionDetail.fromJson(Map<String, dynamic> json) {
    return ReviewActionDetail(
      actionId: json['ActionId'] as String?,
      actionName: json['ActionName'] as String?,
      completeTime: timeStampFromJson(json['CompleteTime']),
      errorCode: json['ErrorCode'] as String?,
      result: json['Result'] as String?,
      status: (json['Status'] as String?)?.toReviewActionStatus(),
      targetId: json['TargetId'] as String?,
      targetType: json['TargetType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionId = this.actionId;
    final actionName = this.actionName;
    final completeTime = this.completeTime;
    final errorCode = this.errorCode;
    final result = this.result;
    final status = this.status;
    final targetId = this.targetId;
    final targetType = this.targetType;
    return {
      if (actionId != null) 'ActionId': actionId,
      if (actionName != null) 'ActionName': actionName,
      if (completeTime != null)
        'CompleteTime': unixTimestampToJson(completeTime),
      if (errorCode != null) 'ErrorCode': errorCode,
      if (result != null) 'Result': result,
      if (status != null) 'Status': status.toValue(),
      if (targetId != null) 'TargetId': targetId,
      if (targetType != null) 'TargetType': targetType,
    };
  }
}

enum ReviewActionStatus {
  intended,
  succeeded,
  failed,
  cancelled,
}

extension ReviewActionStatusValueExtension on ReviewActionStatus {
  String toValue() {
    switch (this) {
      case ReviewActionStatus.intended:
        return 'Intended';
      case ReviewActionStatus.succeeded:
        return 'Succeeded';
      case ReviewActionStatus.failed:
        return 'Failed';
      case ReviewActionStatus.cancelled:
        return 'Cancelled';
    }
  }
}

extension ReviewActionStatusFromString on String {
  ReviewActionStatus toReviewActionStatus() {
    switch (this) {
      case 'Intended':
        return ReviewActionStatus.intended;
      case 'Succeeded':
        return ReviewActionStatus.succeeded;
      case 'Failed':
        return ReviewActionStatus.failed;
      case 'Cancelled':
        return ReviewActionStatus.cancelled;
    }
    throw Exception('$this is not known in enum ReviewActionStatus');
  }
}

/// HIT Review Policy data structures represent HIT review policies, which you
/// specify when you create a HIT.
class ReviewPolicy {
  /// Name of a Review Policy: SimplePlurality/2011-09-01 or
  /// ScoreMyKnownAnswers/2011-09-01
  final String policyName;

  /// Name of the parameter from the Review policy.
  final List<PolicyParameter>? parameters;

  ReviewPolicy({
    required this.policyName,
    this.parameters,
  });

  factory ReviewPolicy.fromJson(Map<String, dynamic> json) {
    return ReviewPolicy(
      policyName: json['PolicyName'] as String,
      parameters: (json['Parameters'] as List?)
          ?.whereNotNull()
          .map((e) => PolicyParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    final parameters = this.parameters;
    return {
      'PolicyName': policyName,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

enum ReviewPolicyLevel {
  assignment,
  hit,
}

extension ReviewPolicyLevelValueExtension on ReviewPolicyLevel {
  String toValue() {
    switch (this) {
      case ReviewPolicyLevel.assignment:
        return 'Assignment';
      case ReviewPolicyLevel.hit:
        return 'HIT';
    }
  }
}

extension ReviewPolicyLevelFromString on String {
  ReviewPolicyLevel toReviewPolicyLevel() {
    switch (this) {
      case 'Assignment':
        return ReviewPolicyLevel.assignment;
      case 'HIT':
        return ReviewPolicyLevel.hit;
    }
    throw Exception('$this is not known in enum ReviewPolicyLevel');
  }
}

/// Contains both ReviewResult and ReviewAction elements for a particular HIT.
class ReviewReport {
  /// A list of ReviewAction objects for each action specified in the Review
  /// Policy.
  final List<ReviewActionDetail>? reviewActions;

  /// A list of ReviewResults objects for each action specified in the Review
  /// Policy.
  final List<ReviewResultDetail>? reviewResults;

  ReviewReport({
    this.reviewActions,
    this.reviewResults,
  });

  factory ReviewReport.fromJson(Map<String, dynamic> json) {
    return ReviewReport(
      reviewActions: (json['ReviewActions'] as List?)
          ?.whereNotNull()
          .map((e) => ReviewActionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewResults: (json['ReviewResults'] as List?)
          ?.whereNotNull()
          .map((e) => ReviewResultDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final reviewActions = this.reviewActions;
    final reviewResults = this.reviewResults;
    return {
      if (reviewActions != null) 'ReviewActions': reviewActions,
      if (reviewResults != null) 'ReviewResults': reviewResults,
    };
  }
}

/// This data structure is returned multiple times for each result specified in
/// the Review Policy.
class ReviewResultDetail {
  /// A unique identifier of the Review action result.
  final String? actionId;

  /// Key identifies the particular piece of reviewed information.
  final String? key;

  /// Specifies the QuestionId the result is describing. Depending on whether the
  /// TargetType is a HIT or Assignment this results could specify multiple
  /// values. If TargetType is HIT and QuestionId is absent, then the result
  /// describes results of the HIT, including the HIT agreement score. If
  /// ObjectType is Assignment and QuestionId is absent, then the result describes
  /// the Worker's performance on the HIT.
  final String? questionId;

  /// The HITID or AssignmentId about which this result was taken. Note that
  /// HIT-level Review Policies will often emit results about both the HIT itself
  /// and its Assignments, while Assignment-level review policies generally only
  /// emit results about the Assignment itself.
  final String? subjectId;

  /// The type of the object from the SubjectId field.
  final String? subjectType;

  /// The values of Key provided by the review policies you have selected.
  final String? value;

  ReviewResultDetail({
    this.actionId,
    this.key,
    this.questionId,
    this.subjectId,
    this.subjectType,
    this.value,
  });

  factory ReviewResultDetail.fromJson(Map<String, dynamic> json) {
    return ReviewResultDetail(
      actionId: json['ActionId'] as String?,
      key: json['Key'] as String?,
      questionId: json['QuestionId'] as String?,
      subjectId: json['SubjectId'] as String?,
      subjectType: json['SubjectType'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionId = this.actionId;
    final key = this.key;
    final questionId = this.questionId;
    final subjectId = this.subjectId;
    final subjectType = this.subjectType;
    final value = this.value;
    return {
      if (actionId != null) 'ActionId': actionId,
      if (key != null) 'Key': key,
      if (questionId != null) 'QuestionId': questionId,
      if (subjectId != null) 'SubjectId': subjectId,
      if (subjectType != null) 'SubjectType': subjectType,
      if (value != null) 'Value': value,
    };
  }
}

enum ReviewableHITStatus {
  reviewable,
  reviewing,
}

extension ReviewableHITStatusValueExtension on ReviewableHITStatus {
  String toValue() {
    switch (this) {
      case ReviewableHITStatus.reviewable:
        return 'Reviewable';
      case ReviewableHITStatus.reviewing:
        return 'Reviewing';
    }
  }
}

extension ReviewableHITStatusFromString on String {
  ReviewableHITStatus toReviewableHITStatus() {
    switch (this) {
      case 'Reviewable':
        return ReviewableHITStatus.reviewable;
      case 'Reviewing':
        return ReviewableHITStatus.reviewing;
    }
    throw Exception('$this is not known in enum ReviewableHITStatus');
  }
}

class SendBonusResponse {
  SendBonusResponse();

  factory SendBonusResponse.fromJson(Map<String, dynamic> _) {
    return SendBonusResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class SendTestEventNotificationResponse {
  SendTestEventNotificationResponse();

  factory SendTestEventNotificationResponse.fromJson(Map<String, dynamic> _) {
    return SendTestEventNotificationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateExpirationForHITResponse {
  UpdateExpirationForHITResponse();

  factory UpdateExpirationForHITResponse.fromJson(Map<String, dynamic> _) {
    return UpdateExpirationForHITResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateHITReviewStatusResponse {
  UpdateHITReviewStatusResponse();

  factory UpdateHITReviewStatusResponse.fromJson(Map<String, dynamic> _) {
    return UpdateHITReviewStatusResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateHITTypeOfHITResponse {
  UpdateHITTypeOfHITResponse();

  factory UpdateHITTypeOfHITResponse.fromJson(Map<String, dynamic> _) {
    return UpdateHITTypeOfHITResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateNotificationSettingsResponse {
  UpdateNotificationSettingsResponse();

  factory UpdateNotificationSettingsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateNotificationSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateQualificationTypeResponse {
  /// Contains a QualificationType data structure.
  final QualificationType? qualificationType;

  UpdateQualificationTypeResponse({
    this.qualificationType,
  });

  factory UpdateQualificationTypeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateQualificationTypeResponse(
      qualificationType: json['QualificationType'] != null
          ? QualificationType.fromJson(
              json['QualificationType'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final qualificationType = this.qualificationType;
    return {
      if (qualificationType != null) 'QualificationType': qualificationType,
    };
  }
}

/// The WorkerBlock data structure represents a Worker who has been blocked. It
/// has two elements: the WorkerId and the Reason for the block.
class WorkerBlock {
  /// A message explaining the reason the Worker was blocked.
  final String? reason;

  /// The ID of the Worker who accepted the HIT.
  final String? workerId;

  WorkerBlock({
    this.reason,
    this.workerId,
  });

  factory WorkerBlock.fromJson(Map<String, dynamic> json) {
    return WorkerBlock(
      reason: json['Reason'] as String?,
      workerId: json['WorkerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final workerId = this.workerId;
    return {
      if (reason != null) 'Reason': reason,
      if (workerId != null) 'WorkerId': workerId,
    };
  }
}

class RequestError extends _s.GenericAwsException {
  RequestError({String? type, String? message})
      : super(type: type, code: 'RequestError', message: message);
}

class ServiceFault extends _s.GenericAwsException {
  ServiceFault({String? type, String? message})
      : super(type: type, code: 'ServiceFault', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'RequestError': (type, message) => RequestError(type: type, message: message),
  'ServiceFault': (type, message) => ServiceFault(type: type, message: message),
};
