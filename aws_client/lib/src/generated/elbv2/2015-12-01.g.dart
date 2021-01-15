// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-12-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ActionToJson(Action instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$ActionTypeEnumEnumMap[instance.type]);
  writeNotNull('AuthenticateCognitoConfig',
      instance.authenticateCognitoConfig?.toJson());
  writeNotNull(
      'AuthenticateOidcConfig', instance.authenticateOidcConfig?.toJson());
  writeNotNull('FixedResponseConfig', instance.fixedResponseConfig?.toJson());
  writeNotNull('ForwardConfig', instance.forwardConfig?.toJson());
  writeNotNull('Order', instance.order);
  writeNotNull('RedirectConfig', instance.redirectConfig?.toJson());
  writeNotNull('TargetGroupArn', instance.targetGroupArn);
  return val;
}

const _$ActionTypeEnumEnumMap = {
  ActionTypeEnum.forward: 'forward',
  ActionTypeEnum.authenticateOidc: 'authenticate-oidc',
  ActionTypeEnum.authenticateCognito: 'authenticate-cognito',
  ActionTypeEnum.redirect: 'redirect',
  ActionTypeEnum.fixedResponse: 'fixed-response',
};

Map<String, dynamic> _$AuthenticateCognitoActionConfigToJson(
    AuthenticateCognitoActionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UserPoolArn', instance.userPoolArn);
  writeNotNull('UserPoolClientId', instance.userPoolClientId);
  writeNotNull('UserPoolDomain', instance.userPoolDomain);
  writeNotNull('AuthenticationRequestExtraParams',
      instance.authenticationRequestExtraParams);
  writeNotNull(
      'OnUnauthenticatedRequest',
      _$AuthenticateCognitoActionConditionalBehaviorEnumEnumMap[
          instance.onUnauthenticatedRequest]);
  writeNotNull('Scope', instance.scope);
  writeNotNull('SessionCookieName', instance.sessionCookieName);
  writeNotNull('SessionTimeout', instance.sessionTimeout);
  return val;
}

const _$AuthenticateCognitoActionConditionalBehaviorEnumEnumMap = {
  AuthenticateCognitoActionConditionalBehaviorEnum.deny: 'deny',
  AuthenticateCognitoActionConditionalBehaviorEnum.allow: 'allow',
  AuthenticateCognitoActionConditionalBehaviorEnum.authenticate: 'authenticate',
};

Map<String, dynamic> _$AuthenticateOidcActionConfigToJson(
    AuthenticateOidcActionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AuthorizationEndpoint', instance.authorizationEndpoint);
  writeNotNull('ClientId', instance.clientId);
  writeNotNull('Issuer', instance.issuer);
  writeNotNull('TokenEndpoint', instance.tokenEndpoint);
  writeNotNull('UserInfoEndpoint', instance.userInfoEndpoint);
  writeNotNull('AuthenticationRequestExtraParams',
      instance.authenticationRequestExtraParams);
  writeNotNull('ClientSecret', instance.clientSecret);
  writeNotNull(
      'OnUnauthenticatedRequest',
      _$AuthenticateOidcActionConditionalBehaviorEnumEnumMap[
          instance.onUnauthenticatedRequest]);
  writeNotNull('Scope', instance.scope);
  writeNotNull('SessionCookieName', instance.sessionCookieName);
  writeNotNull('SessionTimeout', instance.sessionTimeout);
  writeNotNull('UseExistingClientSecret', instance.useExistingClientSecret);
  return val;
}

const _$AuthenticateOidcActionConditionalBehaviorEnumEnumMap = {
  AuthenticateOidcActionConditionalBehaviorEnum.deny: 'deny',
  AuthenticateOidcActionConditionalBehaviorEnum.allow: 'allow',
  AuthenticateOidcActionConditionalBehaviorEnum.authenticate: 'authenticate',
};

Map<String, dynamic> _$CertificateToJson(Certificate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CertificateArn', instance.certificateArn);
  writeNotNull('IsDefault', instance.isDefault);
  return val;
}

Map<String, dynamic> _$FixedResponseActionConfigToJson(
    FixedResponseActionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StatusCode', instance.statusCode);
  writeNotNull('ContentType', instance.contentType);
  writeNotNull('MessageBody', instance.messageBody);
  return val;
}

Map<String, dynamic> _$ForwardActionConfigToJson(ForwardActionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetGroupStickinessConfig',
      instance.targetGroupStickinessConfig?.toJson());
  writeNotNull(
      'TargetGroups', instance.targetGroups?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$HostHeaderConditionConfigToJson(
    HostHeaderConditionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$HttpHeaderConditionConfigToJson(
    HttpHeaderConditionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HttpHeaderName', instance.httpHeaderName);
  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$HttpRequestMethodConditionConfigToJson(
    HttpRequestMethodConditionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$LoadBalancerAttributeToJson(
    LoadBalancerAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$MatcherToJson(Matcher instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GrpcCode', instance.grpcCode);
  writeNotNull('HttpCode', instance.httpCode);
  return val;
}

Map<String, dynamic> _$PathPatternConditionConfigToJson(
    PathPatternConditionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$QueryStringConditionConfigToJson(
    QueryStringConditionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Values', instance.values?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$QueryStringKeyValuePairToJson(
    QueryStringKeyValuePair instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$RedirectActionConfigToJson(
    RedirectActionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'StatusCode', _$RedirectActionStatusCodeEnumEnumMap[instance.statusCode]);
  writeNotNull('Host', instance.host);
  writeNotNull('Path', instance.path);
  writeNotNull('Port', instance.port);
  writeNotNull('Protocol', instance.protocol);
  writeNotNull('Query', instance.query);
  return val;
}

const _$RedirectActionStatusCodeEnumEnumMap = {
  RedirectActionStatusCodeEnum.http_301: 'HTTP_301',
  RedirectActionStatusCodeEnum.http_302: 'HTTP_302',
};

Map<String, dynamic> _$RuleConditionToJson(RuleCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Field', instance.field);
  writeNotNull('HostHeaderConfig', instance.hostHeaderConfig?.toJson());
  writeNotNull('HttpHeaderConfig', instance.httpHeaderConfig?.toJson());
  writeNotNull(
      'HttpRequestMethodConfig', instance.httpRequestMethodConfig?.toJson());
  writeNotNull('PathPatternConfig', instance.pathPatternConfig?.toJson());
  writeNotNull('QueryStringConfig', instance.queryStringConfig?.toJson());
  writeNotNull('SourceIpConfig', instance.sourceIpConfig?.toJson());
  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$RulePriorityPairToJson(RulePriorityPair instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Priority', instance.priority);
  writeNotNull('RuleArn', instance.ruleArn);
  return val;
}

Map<String, dynamic> _$SourceIpConditionConfigToJson(
    SourceIpConditionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$SubnetMappingToJson(SubnetMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllocationId', instance.allocationId);
  writeNotNull('IPv6Address', instance.iPv6Address);
  writeNotNull('PrivateIPv4Address', instance.privateIPv4Address);
  writeNotNull('SubnetId', instance.subnetId);
  return val;
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$TargetDescriptionToJson(TargetDescription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AvailabilityZone', instance.availabilityZone);
  writeNotNull('Port', instance.port);
  return val;
}

Map<String, dynamic> _$TargetGroupAttributeToJson(
    TargetGroupAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$TargetGroupStickinessConfigToJson(
    TargetGroupStickinessConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DurationSeconds', instance.durationSeconds);
  writeNotNull('Enabled', instance.enabled);
  return val;
}

Map<String, dynamic> _$TargetGroupTupleToJson(TargetGroupTuple instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetGroupArn', instance.targetGroupArn);
  writeNotNull('Weight', instance.weight);
  return val;
}
