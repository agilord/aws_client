// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-07-29.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEventIntegrationResponse _$CreateEventIntegrationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEventIntegrationResponse(
    eventIntegrationArn: json['EventIntegrationArn'] as String,
  );
}

DeleteEventIntegrationResponse _$DeleteEventIntegrationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEventIntegrationResponse();
}

EventFilter _$EventFilterFromJson(Map<String, dynamic> json) {
  return EventFilter(
    source: json['Source'] as String,
  );
}

Map<String, dynamic> _$EventFilterToJson(EventFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Source', instance.source);
  return val;
}

EventIntegration _$EventIntegrationFromJson(Map<String, dynamic> json) {
  return EventIntegration(
    description: json['Description'] as String,
    eventBridgeBus: json['EventBridgeBus'] as String,
    eventFilter: json['EventFilter'] == null
        ? null
        : EventFilter.fromJson(json['EventFilter'] as Map<String, dynamic>),
    eventIntegrationArn: json['EventIntegrationArn'] as String,
    name: json['Name'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

EventIntegrationAssociation _$EventIntegrationAssociationFromJson(
    Map<String, dynamic> json) {
  return EventIntegrationAssociation(
    clientAssociationMetadata:
        (json['ClientAssociationMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    clientId: json['ClientId'] as String,
    eventBridgeRuleName: json['EventBridgeRuleName'] as String,
    eventIntegrationAssociationArn:
        json['EventIntegrationAssociationArn'] as String,
    eventIntegrationAssociationId:
        json['EventIntegrationAssociationId'] as String,
    eventIntegrationName: json['EventIntegrationName'] as String,
  );
}

GetEventIntegrationResponse _$GetEventIntegrationResponseFromJson(
    Map<String, dynamic> json) {
  return GetEventIntegrationResponse(
    description: json['Description'] as String,
    eventBridgeBus: json['EventBridgeBus'] as String,
    eventFilter: json['EventFilter'] == null
        ? null
        : EventFilter.fromJson(json['EventFilter'] as Map<String, dynamic>),
    eventIntegrationArn: json['EventIntegrationArn'] as String,
    name: json['Name'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListEventIntegrationAssociationsResponse
    _$ListEventIntegrationAssociationsResponseFromJson(
        Map<String, dynamic> json) {
  return ListEventIntegrationAssociationsResponse(
    eventIntegrationAssociations: (json['EventIntegrationAssociations'] as List)
        ?.map((e) => e == null
            ? null
            : EventIntegrationAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListEventIntegrationsResponse _$ListEventIntegrationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListEventIntegrationsResponse(
    eventIntegrations: (json['EventIntegrations'] as List)
        ?.map((e) => e == null
            ? null
            : EventIntegration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateEventIntegrationResponse _$UpdateEventIntegrationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateEventIntegrationResponse();
}
