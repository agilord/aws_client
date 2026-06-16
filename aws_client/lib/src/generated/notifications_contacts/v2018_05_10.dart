// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// AWS User Notifications Contacts is a service that allows you to create and
/// manage email contacts for AWS User Notifications. The AWS User Notifications
/// Contacts API Reference provides descriptions, API request parameters, and
/// the JSON response for all email contact related API actions.
class NotificationsContacts {
  final _s.RestJsonProtocol _protocol;
  NotificationsContacts({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'notifications-contacts',
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

  /// Lists all of the tags associated with the Amazon Resource Name (ARN) that
  /// you specify. The resource can be a user, server, or role.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN you specified to list the tags of.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Attaches a key-value pair to a resource, as identified by its Amazon
  /// Resource Name (ARN). Taggable resources in AWS User Notifications Contacts
  /// include email contacts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the configuration.
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to the configuration.
  Future<void> tagResource({
    required String arn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Detaches a key-value pair from a resource, as identified by its Amazon
  /// Resource Name (ARN). Taggable resources in AWS User Notifications Contacts
  /// include email contacts..
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The value of the resource that will have the tag removed. An Amazon
  /// Resource Name (ARN) is an identifier for a specific AWS resource, such as
  /// a server, user, or role.
  ///
  /// Parameter [tagKeys] :
  /// Specifies a list of tag keys that you want to remove from the specified
  /// resources.
  Future<void> untagResource({
    required String arn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(arn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an email contact for the provided email address.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [emailAddress] :
  /// The email address this email contact points to. The activation email and
  /// any subscribed emails are sent here.
  /// <note>
  /// This email address can't receive emails until it's activated.
  /// </note>
  ///
  /// Parameter [name] :
  /// The name of the email contact.
  ///
  /// Parameter [tags] :
  /// A map of tags assigned to a resource. A tag is a string-to-string map of
  /// key-value pairs.
  Future<CreateEmailContactResponse> createEmailContact({
    required String emailAddress,
    required String name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'emailAddress': emailAddress,
      'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2022-09-19/emailcontacts',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEmailContactResponse.fromJson(response);
  }

  /// Returns an email contact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the email contact to get.
  Future<GetEmailContactResponse> getEmailContact({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/emailcontacts/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEmailContactResponse.fromJson(response);
  }

  /// Deletes an email contact.
  /// <note>
  /// Deleting an email contact removes it from all associated notification
  /// configurations.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<void> deleteEmailContact({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/emailcontacts/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all email contacts created under the Account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by MaxResults.
  Future<ListEmailContactsResponse> listEmailContacts({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/emailcontacts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEmailContactsResponse.fromJson(response);
  }

  /// Activates an email contact using an activation code. This code is in the
  /// activation email sent to the email address associated with this email
  /// contact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [code] :
  /// The activation code for this email contact.
  ///
  /// An email contact has a maximum of five activation attempts. Activation
  /// codes expire after 12 hours and are generated by the <a
  /// href="https://docs.aws.amazon.com/notificationscontacts/latest/APIReference/API_SendActivationCode.html">SendActivationCode</a>
  /// API action.
  Future<void> activateEmailContact({
    required String arn,
    required String code,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/emailcontacts/${Uri.encodeComponent(arn)}/activate/${Uri.encodeComponent(code)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sends an activation email to the email address associated with the
  /// specified email contact.
  /// <note>
  /// It might take a few minutes for the activation email to arrive. If it
  /// doesn't arrive, check in your spam folder or try sending another
  /// activation email.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<void> sendActivationCode({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/2022-10-31/emailcontacts/${Uri.encodeComponent(arn)}/activate/send',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class ListTagsForResourceResponse {
  /// Key-value pairs that are assigned to a resource, usually for the purpose of
  /// grouping and searching for items. Tags are metadata that you define.
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class CreateEmailContactResponse {
  /// The Amazon Resource Name (ARN) of the resource.
  final String arn;

  CreateEmailContactResponse({
    required this.arn,
  });

  factory CreateEmailContactResponse.fromJson(Map<String, dynamic> json) {
    return CreateEmailContactResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

class GetEmailContactResponse {
  /// The email contact for the provided email address.
  final EmailContact emailContact;

  GetEmailContactResponse({
    required this.emailContact,
  });

  factory GetEmailContactResponse.fromJson(Map<String, dynamic> json) {
    return GetEmailContactResponse(
      emailContact: EmailContact.fromJson(
          (json['emailContact'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final emailContact = this.emailContact;
    return {
      'emailContact': emailContact,
    };
  }
}

class DeleteEmailContactResponse {
  DeleteEmailContactResponse();

  factory DeleteEmailContactResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEmailContactResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListEmailContactsResponse {
  /// A list of email contacts.
  final List<EmailContact> emailContacts;

  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified, the
  /// response includes only results beyond the token, up to the value specified
  /// by MaxResults.
  final String? nextToken;

  ListEmailContactsResponse({
    required this.emailContacts,
    this.nextToken,
  });

  factory ListEmailContactsResponse.fromJson(Map<String, dynamic> json) {
    return ListEmailContactsResponse(
      emailContacts: ((json['emailContacts'] as List?) ?? const [])
          .nonNulls
          .map((e) => EmailContact.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final emailContacts = this.emailContacts;
    final nextToken = this.nextToken;
    return {
      'emailContacts': emailContacts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ActivateEmailContactResponse {
  ActivateEmailContactResponse();

  factory ActivateEmailContactResponse.fromJson(Map<String, dynamic> _) {
    return ActivateEmailContactResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class SendActivationCodeResponse {
  SendActivationCodeResponse();

  factory SendActivationCodeResponse.fromJson(Map<String, dynamic> _) {
    return SendActivationCodeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An email contact.
class EmailContact {
  /// The email address this email contact points to. The activation email and any
  /// subscribed emails are sent here.
  final String address;

  /// The Amazon Resource Name (ARN) of the email contact.
  final String arn;

  /// The creation time of the resource.
  final DateTime creationTime;

  /// The name of the email contact.
  final String name;

  /// The status of the email contact. Only activated email contacts receive
  /// emails.
  final EmailContactStatus status;

  /// The time the resource was last updated.
  final DateTime updateTime;

  EmailContact({
    required this.address,
    required this.arn,
    required this.creationTime,
    required this.name,
    required this.status,
    required this.updateTime,
  });

  factory EmailContact.fromJson(Map<String, dynamic> json) {
    return EmailContact(
      address: (json['address'] as String?) ?? '',
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: EmailContactStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final name = this.name;
    final status = this.status;
    final updateTime = this.updateTime;
    return {
      'address': address,
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'name': name,
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
    };
  }
}

class EmailContactStatus {
  static const inactive = EmailContactStatus._('inactive');
  static const active = EmailContactStatus._('active');

  final String value;

  const EmailContactStatus._(this.value);

  static const values = [inactive, active];

  static EmailContactStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EmailContactStatus._(value));

  @override
  bool operator ==(other) =>
      other is EmailContactStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
