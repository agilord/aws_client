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

/// Amazon Route 53 is a highly available and scalable Domain Name System (DNS)
/// web service.
///
/// You can use Route 53 to:
///
/// <ul>
/// <li>
/// Register domain names.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/welcome-domain-registration.html">How
/// domain registration works</a>.
/// </li>
/// <li>
/// Route internet traffic to the resources for your domain
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/welcome-dns-service.html">How
/// internet traffic is routed to your website or web application</a>.
/// </li>
/// <li>
/// Check the health of your resources.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/welcome-health-checks.html">How
/// Route 53 checks the health of your resources</a>.
/// </li>
/// </ul>
class Route53 {
  final _s.RestXmlProtocol _protocol;
  Route53({
    String? region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'route53',
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

  /// Activates a key-signing key (KSK) so that it can be used for signing by
  /// DNSSEC. This operation changes the KSK status to <code>ACTIVE</code>.
  ///
  /// May throw [ConcurrentModification].
  /// May throw [NoSuchKeySigningKey].
  /// May throw [InvalidKeySigningKeyStatus].
  /// May throw [InvalidSigningStatus].
  /// May throw [InvalidKMSArn].
  /// May throw [InvalidInput].
  ///
  /// Parameter [hostedZoneId] :
  /// A unique string used to identify a hosted zone.
  ///
  /// Parameter [name] :
  /// A string used to identify a key-signing key (KSK). <code>Name</code> can
  /// include numbers, letters, and underscores (_). <code>Name</code> must be
  /// unique for each key-signing key in the same hosted zone.
  Future<ActivateKeySigningKeyResponse> activateKeySigningKey({
    required String hostedZoneId,
    required String name,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/keysigningkey/${Uri.encodeComponent(hostedZoneId)}/${Uri.encodeComponent(name)}/activate',
      exceptionFnMap: _exceptionFns,
    );
    return ActivateKeySigningKeyResponse.fromXml($result.body);
  }

  /// Associates an Amazon VPC with a private hosted zone.
  /// <important>
  /// To perform the association, the VPC and the private hosted zone must
  /// already exist. You can't convert a public hosted zone into a private
  /// hosted zone.
  /// </important> <note>
  /// If you want to associate a VPC that was created by using one Amazon Web
  /// Services account with a private hosted zone that was created by using a
  /// different account, the Amazon Web Services account that created the
  /// private hosted zone must first submit a
  /// <code>CreateVPCAssociationAuthorization</code> request. Then the account
  /// that created the VPC must submit an
  /// <code>AssociateVPCWithHostedZone</code> request.
  /// </note> <note>
  /// When granting access, the hosted zone and the Amazon VPC must belong to
  /// the same partition. A partition is a group of Amazon Web Services Regions.
  /// Each Amazon Web Services account is scoped to one partition.
  ///
  /// The following are the supported partitions:
  ///
  /// <ul>
  /// <li>
  /// <code>aws</code> - Amazon Web Services Regions
  /// </li>
  /// <li>
  /// <code>aws-cn</code> - China Regions
  /// </li>
  /// <li>
  /// <code>aws-us-gov</code> - Amazon Web Services GovCloud (US) Region
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Access
  /// Management</a> in the <i>Amazon Web Services General Reference</i>.
  /// </note>
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidVPCId].
  /// May throw [InvalidInput].
  /// May throw [PublicZoneVPCAssociation].
  /// May throw [ConflictingDomainExists].
  /// May throw [LimitsExceeded].
  /// May throw [PriorRequestNotComplete].
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the private hosted zone that you want to associate an Amazon VPC
  /// with.
  ///
  /// Note that you can't associate a VPC with a hosted zone that doesn't have
  /// an existing VPC association.
  ///
  /// Parameter [vpc] :
  /// A complex type that contains information about the VPC that you want to
  /// associate with a private hosted zone.
  ///
  /// Parameter [comment] :
  /// <i>Optional:</i> A comment about the association request.
  Future<AssociateVPCWithHostedZoneResponse> associateVPCWithHostedZone({
    required String hostedZoneId,
    required VPC vpc,
    String? comment,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/hostedzone/${Uri.encodeComponent(hostedZoneId)}/associatevpc',
      payload: AssociateVPCWithHostedZoneRequest(
              hostedZoneId: hostedZoneId, vpc: vpc, comment: comment)
          .toXml(
        'AssociateVPCWithHostedZoneRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return AssociateVPCWithHostedZoneResponse.fromXml($result.body);
  }

  /// Creates, changes, or deletes CIDR blocks within a collection. Contains
  /// authoritative IP information mapping blocks to one or multiple locations.
  ///
  /// A change request can update multiple locations in a collection at a time,
  /// which is helpful if you want to move one or more CIDR blocks from one
  /// location to another in one transaction, without downtime.
  ///
  /// <b>Limits</b>
  ///
  /// The max number of CIDR blocks included in the request is 1000. As a
  /// result, big updates require multiple API calls.
  ///
  /// <b> PUT and DELETE_IF_EXISTS</b>
  ///
  /// Use <code>ChangeCidrCollection</code> to perform the following actions:
  ///
  /// <ul>
  /// <li>
  /// <code>PUT</code>: Create a CIDR block within the specified collection.
  /// </li>
  /// <li>
  /// <code> DELETE_IF_EXISTS</code>: Delete an existing CIDR block from the
  /// collection.
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchCidrCollectionException].
  /// May throw [CidrCollectionVersionMismatchException].
  /// May throw [InvalidInput].
  /// May throw [CidrBlockInUseException].
  /// May throw [LimitsExceeded].
  /// May throw [ConcurrentModification].
  ///
  /// Parameter [changes] :
  /// Information about changes to a CIDR collection.
  ///
  /// Parameter [id] :
  /// The UUID of the CIDR collection to update.
  ///
  /// Parameter [collectionVersion] :
  /// A sequential counter that Amazon Route 53 sets to 1 when you create a
  /// collection and increments it by 1 each time you update the collection.
  ///
  /// We recommend that you use <code>ListCidrCollection</code> to get the
  /// current value of <code>CollectionVersion</code> for the collection that
  /// you want to update, and then include that value with the change request.
  /// This prevents Route 53 from overwriting an intervening update:
  ///
  /// <ul>
  /// <li>
  /// If the value in the request matches the value of
  /// <code>CollectionVersion</code> in the collection, Route 53 updates the
  /// collection.
  /// </li>
  /// <li>
  /// If the value of <code>CollectionVersion</code> in the collection is
  /// greater than the value in the request, the collection was changed after
  /// you got the version number. Route 53 does not update the collection, and
  /// it returns a <code>CidrCollectionVersionMismatch</code> error.
  /// </li>
  /// </ul>
  Future<ChangeCidrCollectionResponse> changeCidrCollection({
    required List<CidrCollectionChange> changes,
    required String id,
    int? collectionVersion,
  }) async {
    _s.validateNumRange(
      'collectionVersion',
      collectionVersion,
      1,
      1152921504606846976,
    );
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/2013-04-01/cidrcollection/${Uri.encodeComponent(id)}',
      payload: ChangeCidrCollectionRequest(
              changes: changes, id: id, collectionVersion: collectionVersion)
          .toXml(
        'ChangeCidrCollectionRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return ChangeCidrCollectionResponse.fromXml($result.body);
  }

  /// Creates, changes, or deletes a resource record set, which contains
  /// authoritative DNS information for a specified domain name or subdomain
  /// name. For example, you can use <code>ChangeResourceRecordSets</code> to
  /// create a resource record set that routes traffic for test.example.com to a
  /// web server that has an IP address of 192.0.2.44.
  ///
  /// <b>Deleting Resource Record Sets</b>
  ///
  /// To delete a resource record set, you must specify all the same values that
  /// you specified when you created it.
  ///
  /// <b>Change Batches and Transactional Changes</b>
  ///
  /// The request body must include a document with a
  /// <code>ChangeResourceRecordSetsRequest</code> element. The request body
  /// contains a list of change items, known as a change batch. Change batches
  /// are considered transactional changes. Route 53 validates the changes in
  /// the request and then either makes all or none of the changes in the change
  /// batch request. This ensures that DNS routing isn't adversely affected by
  /// partial changes to the resource record sets in a hosted zone.
  ///
  /// For example, suppose a change batch request contains two changes: it
  /// deletes the <code>CNAME</code> resource record set for www.example.com and
  /// creates an alias resource record set for www.example.com. If validation
  /// for both records succeeds, Route 53 deletes the first resource record set
  /// and creates the second resource record set in a single operation. If
  /// validation for either the <code>DELETE</code> or the <code>CREATE</code>
  /// action fails, then the request is canceled, and the original
  /// <code>CNAME</code> record continues to exist.
  /// <note>
  /// If you try to delete the same resource record set more than once in a
  /// single change batch, Route 53 returns an <code>InvalidChangeBatch</code>
  /// error.
  /// </note>
  /// <b>Traffic Flow</b>
  ///
  /// To create resource record sets for complex routing configurations, use
  /// either the traffic flow visual editor in the Route 53 console or the API
  /// actions for traffic policies and traffic policy instances. Save the
  /// configuration as a traffic policy, then associate the traffic policy with
  /// one or more domain names (such as example.com) or subdomain names (such as
  /// www.example.com), in the same hosted zone or in multiple hosted zones. You
  /// can roll back the updates if the new configuration isn't performing as
  /// expected. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/traffic-flow.html">Using
  /// Traffic Flow to Route DNS Traffic</a> in the <i>Amazon Route 53 Developer
  /// Guide</i>.
  ///
  /// <b>Create, Delete, and Upsert</b>
  ///
  /// Use <code>ChangeResourceRecordsSetsRequest</code> to perform the following
  /// actions:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE</code>: Creates a resource record set that has the specified
  /// values.
  /// </li>
  /// <li>
  /// <code>DELETE</code>: Deletes an existing resource record set that has the
  /// specified values.
  /// </li>
  /// <li>
  /// <code>UPSERT</code>: If a resource set doesn't exist, Route 53 creates it.
  /// If a resource set exists Route 53 updates it with the values in the
  /// request.
  /// </li>
  /// </ul>
  /// <b>Syntaxes for Creating, Updating, and Deleting Resource Record Sets</b>
  ///
  /// The syntax for a request depends on the type of resource record set that
  /// you want to create, delete, or update, such as weighted, alias, or
  /// failover. The XML elements in your request must appear in the order listed
  /// in the syntax.
  ///
  /// For an example for each type of resource record set, see "Examples."
  ///
  /// Don't refer to the syntax in the "Parameter Syntax" section, which
  /// includes all of the elements for every kind of resource record set that
  /// you can create, delete, or update by using
  /// <code>ChangeResourceRecordSets</code>.
  ///
  /// <b>Change Propagation to Route 53 DNS Servers</b>
  ///
  /// When you submit a <code>ChangeResourceRecordSets</code> request, Route 53
  /// propagates your changes to all of the Route 53 authoritative DNS servers
  /// managing the hosted zone. While your changes are propagating,
  /// <code>GetChange</code> returns a status of <code>PENDING</code>. When
  /// propagation is complete, <code>GetChange</code> returns a status of
  /// <code>INSYNC</code>. Changes generally propagate to all Route 53 name
  /// servers managing the hosted zone within 60 seconds. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetChange.html">GetChange</a>.
  ///
  /// <b>Limits on ChangeResourceRecordSets Requests</b>
  ///
  /// For information about the limits on a
  /// <code>ChangeResourceRecordSets</code> request, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html">Limits</a>
  /// in the <i>Amazon Route 53 Developer Guide</i>.
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [NoSuchHealthCheck].
  /// May throw [InvalidChangeBatch].
  /// May throw [InvalidInput].
  /// May throw [PriorRequestNotComplete].
  ///
  /// Parameter [changeBatch] :
  /// A complex type that contains an optional comment and the
  /// <code>Changes</code> element.
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the hosted zone that contains the resource record sets that you
  /// want to change.
  Future<ChangeResourceRecordSetsResponse> changeResourceRecordSets({
    required ChangeBatch changeBatch,
    required String hostedZoneId,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/hostedzone/${Uri.encodeComponent(hostedZoneId)}/rrset/',
      payload: ChangeResourceRecordSetsRequest(
              changeBatch: changeBatch, hostedZoneId: hostedZoneId)
          .toXml(
        'ChangeResourceRecordSetsRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return ChangeResourceRecordSetsResponse.fromXml($result.body);
  }

  /// Adds, edits, or deletes tags for a health check or a hosted zone.
  ///
  /// For information about using tags for cost allocation, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the <i>Billing and Cost Management User
  /// Guide</i>.
  ///
  /// May throw [InvalidInput].
  /// May throw [NoSuchHealthCheck].
  /// May throw [NoSuchHostedZone].
  /// May throw [PriorRequestNotComplete].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource for which you want to add, change, or delete tags.
  ///
  /// Parameter [resourceType] :
  /// The type of the resource.
  ///
  /// <ul>
  /// <li>
  /// The resource type for health checks is <code>healthcheck</code>.
  /// </li>
  /// <li>
  /// The resource type for hosted zones is <code>hostedzone</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [addTags] :
  /// A complex type that contains a list of the tags that you want to add to
  /// the specified health check or hosted zone and/or the tags that you want to
  /// edit <code>Value</code> for.
  ///
  /// You can add a maximum of 10 tags to a health check or a hosted zone.
  ///
  /// Parameter [removeTagKeys] :
  /// A complex type that contains a list of the tags that you want to delete
  /// from the specified health check or hosted zone. You can specify up to 10
  /// keys.
  Future<void> changeTagsForResource({
    required String resourceId,
    required TagResourceType resourceType,
    List<Tag>? addTags,
    List<String>? removeTagKeys,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/tags/${Uri.encodeComponent(resourceType.toValue())}/${Uri.encodeComponent(resourceId)}',
      payload: ChangeTagsForResourceRequest(
              resourceId: resourceId,
              resourceType: resourceType,
              addTags: addTags,
              removeTagKeys: removeTagKeys)
          .toXml(
        'ChangeTagsForResourceRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a CIDR collection in the current Amazon Web Services account.
  ///
  /// May throw [LimitsExceeded].
  /// May throw [InvalidInput].
  /// May throw [CidrCollectionAlreadyExistsException].
  /// May throw [ConcurrentModification].
  ///
  /// Parameter [callerReference] :
  /// A client-specific token that allows requests to be securely retried so
  /// that the intended outcome will only occur once, retries receive a similar
  /// response, and there are no additional edge cases to handle.
  ///
  /// Parameter [name] :
  /// A unique identifier for the account that can be used to reference the
  /// collection from other API calls.
  Future<CreateCidrCollectionResponse> createCidrCollection({
    required String callerReference,
    required String name,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2013-04-01/cidrcollection',
      payload: CreateCidrCollectionRequest(
              callerReference: callerReference, name: name)
          .toXml(
        'CreateCidrCollectionRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateCidrCollectionResponse(
      collection:
          _s.extractXmlChild($elem, 'Collection')?.let(CidrCollection.fromXml),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Creates a new health check.
  ///
  /// For information about adding health checks to resource record sets, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ResourceRecordSet.html#Route53-Type-ResourceRecordSet-HealthCheckId">HealthCheckId</a>
  /// in <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ChangeResourceRecordSets.html">ChangeResourceRecordSets</a>.
  ///
  /// <b>ELB Load Balancers</b>
  ///
  /// If you're registering EC2 instances with an Elastic Load Balancing (ELB)
  /// load balancer, do not create Amazon Route 53 health checks for the EC2
  /// instances. When you register an EC2 instance with a load balancer, you
  /// configure settings for an ELB health check, which performs a similar
  /// function to a Route 53 health check.
  ///
  /// <b>Private Hosted Zones</b>
  ///
  /// You can associate health checks with failover resource record sets in a
  /// private hosted zone. Note the following:
  ///
  /// <ul>
  /// <li>
  /// Route 53 health checkers are outside the VPC. To check the health of an
  /// endpoint within a VPC by IP address, you must assign a public IP address
  /// to the instance in the VPC.
  /// </li>
  /// <li>
  /// You can configure a health checker to check the health of an external
  /// resource that the instance relies on, such as a database server.
  /// </li>
  /// <li>
  /// You can create a CloudWatch metric, associate an alarm with the metric,
  /// and then create a health check that is based on the state of the alarm.
  /// For example, you might create a CloudWatch metric that checks the status
  /// of the Amazon EC2 <code>StatusCheckFailed</code> metric, add an alarm to
  /// the metric, and then create a health check that is based on the state of
  /// the alarm. For information about creating CloudWatch metrics and alarms by
  /// using the CloudWatch console, see the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/WhatIsCloudWatch.html">Amazon
  /// CloudWatch User Guide</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [TooManyHealthChecks].
  /// May throw [HealthCheckAlreadyExists].
  /// May throw [InvalidInput].
  ///
  /// Parameter [callerReference] :
  /// A unique string that identifies the request and that allows you to retry a
  /// failed <code>CreateHealthCheck</code> request without the risk of creating
  /// two identical health checks:
  ///
  /// <ul>
  /// <li>
  /// If you send a <code>CreateHealthCheck</code> request with the same
  /// <code>CallerReference</code> and settings as a previous request, and if
  /// the health check doesn't exist, Amazon Route 53 creates the health check.
  /// If the health check does exist, Route 53 returns the settings for the
  /// existing health check.
  /// </li>
  /// <li>
  /// If you send a <code>CreateHealthCheck</code> request with the same
  /// <code>CallerReference</code> as a deleted health check, regardless of the
  /// settings, Route 53 returns a <code>HealthCheckAlreadyExists</code> error.
  /// </li>
  /// <li>
  /// If you send a <code>CreateHealthCheck</code> request with the same
  /// <code>CallerReference</code> as an existing health check but with
  /// different settings, Route 53 returns a
  /// <code>HealthCheckAlreadyExists</code> error.
  /// </li>
  /// <li>
  /// If you send a <code>CreateHealthCheck</code> request with a unique
  /// <code>CallerReference</code> but settings identical to an existing health
  /// check, Route 53 creates the health check.
  /// </li>
  /// </ul>
  /// Route 53 does not store the <code>CallerReference</code> for a deleted
  /// health check indefinitely. The <code>CallerReference</code> for a deleted
  /// health check will be deleted after a number of days.
  ///
  /// Parameter [healthCheckConfig] :
  /// A complex type that contains settings for a new health check.
  Future<CreateHealthCheckResponse> createHealthCheck({
    required String callerReference,
    required HealthCheckConfig healthCheckConfig,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2013-04-01/healthcheck',
      payload: CreateHealthCheckRequest(
              callerReference: callerReference,
              healthCheckConfig: healthCheckConfig)
          .toXml(
        'CreateHealthCheckRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateHealthCheckResponse(
      healthCheck:
          HealthCheck.fromXml(_s.extractXmlChild($elem, 'HealthCheck')!),
      location: _s.extractHeaderStringValue($result.headers, 'Location')!,
    );
  }

  /// Creates a new public or private hosted zone. You create records in a
  /// public hosted zone to define how you want to route traffic on the internet
  /// for a domain, such as example.com, and its subdomains (apex.example.com,
  /// acme.example.com). You create records in a private hosted zone to define
  /// how you want to route traffic for a domain and its subdomains within one
  /// or more Amazon Virtual Private Clouds (Amazon VPCs).
  /// <important>
  /// You can't convert a public hosted zone to a private hosted zone or vice
  /// versa. Instead, you must create a new hosted zone with the same name and
  /// create new resource record sets.
  /// </important>
  /// For more information about charges for hosted zones, see <a
  /// href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.
  ///
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// You can't create a hosted zone for a top-level domain (TLD) such as .com.
  /// </li>
  /// <li>
  /// For public hosted zones, Route 53 automatically creates a default SOA
  /// record and four NS records for the zone. For more information about SOA
  /// and NS records, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/SOA-NSrecords.html">NS
  /// and SOA Records that Route 53 Creates for a Hosted Zone</a> in the
  /// <i>Amazon Route 53 Developer Guide</i>.
  ///
  /// If you want to use the same name servers for multiple public hosted zones,
  /// you can optionally associate a reusable delegation set with the hosted
  /// zone. See the <code>DelegationSetId</code> element.
  /// </li>
  /// <li>
  /// If your domain is registered with a registrar other than Route 53, you
  /// must update the name servers with your registrar to make Route 53 the DNS
  /// service for the domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/MigratingDNS.html">Migrating
  /// DNS Service for an Existing Domain to Amazon Route 53</a> in the <i>Amazon
  /// Route 53 Developer Guide</i>.
  /// </li>
  /// </ul>
  /// When you submit a <code>CreateHostedZone</code> request, the initial
  /// status of the hosted zone is <code>PENDING</code>. For public hosted
  /// zones, this means that the NS and SOA records are not yet available on all
  /// Route 53 DNS servers. When the NS and SOA records are available, the
  /// status of the zone changes to <code>INSYNC</code>.
  ///
  /// The <code>CreateHostedZone</code> request requires the caller to have an
  /// <code>ec2:DescribeVpcs</code> permission.
  /// <note>
  /// When creating private hosted zones, the Amazon VPC must belong to the same
  /// partition where the hosted zone is created. A partition is a group of
  /// Amazon Web Services Regions. Each Amazon Web Services account is scoped to
  /// one partition.
  ///
  /// The following are the supported partitions:
  ///
  /// <ul>
  /// <li>
  /// <code>aws</code> - Amazon Web Services Regions
  /// </li>
  /// <li>
  /// <code>aws-cn</code> - China Regions
  /// </li>
  /// <li>
  /// <code>aws-us-gov</code> - Amazon Web Services GovCloud (US) Region
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Access
  /// Management</a> in the <i>Amazon Web Services General Reference</i>.
  /// </note>
  ///
  /// May throw [InvalidDomainName].
  /// May throw [HostedZoneAlreadyExists].
  /// May throw [TooManyHostedZones].
  /// May throw [InvalidVPCId].
  /// May throw [InvalidInput].
  /// May throw [DelegationSetNotAvailable].
  /// May throw [ConflictingDomainExists].
  /// May throw [NoSuchDelegationSet].
  /// May throw [DelegationSetNotReusable].
  ///
  /// Parameter [callerReference] :
  /// A unique string that identifies the request and that allows failed
  /// <code>CreateHostedZone</code> requests to be retried without the risk of
  /// executing the operation twice. You must use a unique
  /// <code>CallerReference</code> string every time you submit a
  /// <code>CreateHostedZone</code> request. <code>CallerReference</code> can be
  /// any unique string, for example, a date/time stamp.
  ///
  /// Parameter [name] :
  /// The name of the domain. Specify a fully qualified domain name, for
  /// example, <i>www.example.com</i>. The trailing dot is optional; Amazon
  /// Route 53 assumes that the domain name is fully qualified. This means that
  /// Route 53 treats <i>www.example.com</i> (without a trailing dot) and
  /// <i>www.example.com.</i> (with a trailing dot) as identical.
  ///
  /// If you're creating a public hosted zone, this is the name you have
  /// registered with your DNS registrar. If your domain name is registered with
  /// a registrar other than Route 53, change the name servers for your domain
  /// to the set of <code>NameServers</code> that <code>CreateHostedZone</code>
  /// returns in <code>DelegationSet</code>.
  ///
  /// Parameter [delegationSetId] :
  /// If you want to associate a reusable delegation set with this hosted zone,
  /// the ID that Amazon Route 53 assigned to the reusable delegation set when
  /// you created it. For more information about reusable delegation sets, see
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateReusableDelegationSet.html">CreateReusableDelegationSet</a>.
  ///
  /// If you are using a reusable delegation set to create a public hosted zone
  /// for a subdomain, make sure that the parent hosted zone doesn't use one or
  /// more of the same name servers. If you have overlapping nameservers, the
  /// operation will cause a <code>ConflictingDomainsExist</code> error.
  ///
  /// Parameter [hostedZoneConfig] :
  /// (Optional) A complex type that contains the following optional values:
  ///
  /// <ul>
  /// <li>
  /// For public and private hosted zones, an optional comment
  /// </li>
  /// <li>
  /// For private hosted zones, an optional <code>PrivateZone</code> element
  /// </li>
  /// </ul>
  /// If you don't specify a comment or the <code>PrivateZone</code> element,
  /// omit <code>HostedZoneConfig</code> and the other elements.
  ///
  /// Parameter [vpc] :
  /// (Private hosted zones only) A complex type that contains information about
  /// the Amazon VPC that you're associating with this hosted zone.
  ///
  /// You can specify only one Amazon VPC when you create a private hosted zone.
  /// If you are associating a VPC with a hosted zone with this request, the
  /// paramaters <code>VPCId</code> and <code>VPCRegion</code> are also
  /// required.
  ///
  /// To associate additional Amazon VPCs with the hosted zone, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_AssociateVPCWithHostedZone.html">AssociateVPCWithHostedZone</a>
  /// after you create a hosted zone.
  Future<CreateHostedZoneResponse> createHostedZone({
    required String callerReference,
    required String name,
    String? delegationSetId,
    HostedZoneConfig? hostedZoneConfig,
    VPC? vpc,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2013-04-01/hostedzone',
      payload: CreateHostedZoneRequest(
              callerReference: callerReference,
              name: name,
              delegationSetId: delegationSetId,
              hostedZoneConfig: hostedZoneConfig,
              vpc: vpc)
          .toXml(
        'CreateHostedZoneRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateHostedZoneResponse(
      changeInfo: ChangeInfo.fromXml(_s.extractXmlChild($elem, 'ChangeInfo')!),
      delegationSet:
          DelegationSet.fromXml(_s.extractXmlChild($elem, 'DelegationSet')!),
      hostedZone: HostedZone.fromXml(_s.extractXmlChild($elem, 'HostedZone')!),
      vpc: _s.extractXmlChild($elem, 'VPC')?.let(VPC.fromXml),
      location: _s.extractHeaderStringValue($result.headers, 'Location')!,
    );
  }

  /// Creates a new key-signing key (KSK) associated with a hosted zone. You can
  /// only have two KSKs per hosted zone.
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidArgument].
  /// May throw [InvalidInput].
  /// May throw [InvalidKMSArn].
  /// May throw [InvalidKeySigningKeyStatus].
  /// May throw [InvalidSigningStatus].
  /// May throw [InvalidKeySigningKeyName].
  /// May throw [KeySigningKeyAlreadyExists].
  /// May throw [TooManyKeySigningKeys].
  /// May throw [ConcurrentModification].
  ///
  /// Parameter [callerReference] :
  /// A unique string that identifies the request.
  ///
  /// Parameter [hostedZoneId] :
  /// The unique string (ID) used to identify a hosted zone.
  ///
  /// Parameter [keyManagementServiceArn] :
  /// The Amazon resource name (ARN) for a customer managed key in Key
  /// Management Service (KMS). The <code>KeyManagementServiceArn</code> must be
  /// unique for each key-signing key (KSK) in a single hosted zone. To see an
  /// example of <code>KeyManagementServiceArn</code> that grants the correct
  /// permissions for DNSSEC, scroll down to <b>Example</b>.
  ///
  /// You must configure the customer managed customer managed key as follows:
  /// <dl> <dt>Status</dt> <dd>
  /// Enabled
  /// </dd> <dt>Key spec</dt> <dd>
  /// ECC_NIST_P256
  /// </dd> <dt>Key usage</dt> <dd>
  /// Sign and verify
  /// </dd> <dt>Key policy</dt> <dd>
  /// The key policy must give permission for the following actions:
  ///
  /// <ul>
  /// <li>
  /// DescribeKey
  /// </li>
  /// <li>
  /// GetPublicKey
  /// </li>
  /// <li>
  /// Sign
  /// </li>
  /// </ul>
  /// The key policy must also include the Amazon Route 53 service in the
  /// principal for your account. Specify the following:
  ///
  /// <ul>
  /// <li>
  /// <code>"Service": "dnssec-route53.amazonaws.com"</code>
  /// </li>
  /// </ul> </dd> </dl>
  /// For more information about working with a customer managed key in KMS, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html">Key
  /// Management Service concepts</a>.
  ///
  /// Parameter [name] :
  /// A string used to identify a key-signing key (KSK). <code>Name</code> can
  /// include numbers, letters, and underscores (_). <code>Name</code> must be
  /// unique for each key-signing key in the same hosted zone.
  ///
  /// Parameter [status] :
  /// A string specifying the initial status of the key-signing key (KSK). You
  /// can set the value to <code>ACTIVE</code> or <code>INACTIVE</code>.
  Future<CreateKeySigningKeyResponse> createKeySigningKey({
    required String callerReference,
    required String hostedZoneId,
    required String keyManagementServiceArn,
    required String name,
    required String status,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2013-04-01/keysigningkey',
      payload: CreateKeySigningKeyRequest(
              callerReference: callerReference,
              hostedZoneId: hostedZoneId,
              keyManagementServiceArn: keyManagementServiceArn,
              name: name,
              status: status)
          .toXml(
        'CreateKeySigningKeyRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateKeySigningKeyResponse(
      changeInfo: ChangeInfo.fromXml(_s.extractXmlChild($elem, 'ChangeInfo')!),
      keySigningKey:
          KeySigningKey.fromXml(_s.extractXmlChild($elem, 'KeySigningKey')!),
      location: _s.extractHeaderStringValue($result.headers, 'Location')!,
    );
  }

  /// Creates a configuration for DNS query logging. After you create a query
  /// logging configuration, Amazon Route 53 begins to publish log data to an
  /// Amazon CloudWatch Logs log group.
  ///
  /// DNS query logs contain information about the queries that Route 53
  /// receives for a specified public hosted zone, such as the following:
  ///
  /// <ul>
  /// <li>
  /// Route 53 edge location that responded to the DNS query
  /// </li>
  /// <li>
  /// Domain or subdomain that was requested
  /// </li>
  /// <li>
  /// DNS record type, such as A or AAAA
  /// </li>
  /// <li>
  /// DNS response code, such as <code>NoError</code> or <code>ServFail</code>
  /// </li>
  /// </ul> <dl> <dt>Log Group and Resource Policy</dt> <dd>
  /// Before you create a query logging configuration, perform the following
  /// operations.
  /// <note>
  /// If you create a query logging configuration using the Route 53 console,
  /// Route 53 performs these operations automatically.
  /// </note> <ol>
  /// <li>
  /// Create a CloudWatch Logs log group, and make note of the ARN, which you
  /// specify when you create a query logging configuration. Note the following:
  ///
  /// <ul>
  /// <li>
  /// You must create the log group in the us-east-1 region.
  /// </li>
  /// <li>
  /// You must use the same Amazon Web Services account to create the log group
  /// and the hosted zone that you want to configure query logging for.
  /// </li>
  /// <li>
  /// When you create log groups for query logging, we recommend that you use a
  /// consistent prefix, for example:
  ///
  /// <code>/aws/route53/<i>hosted zone name</i> </code>
  ///
  /// In the next step, you'll create a resource policy, which controls access
  /// to one or more log groups and the associated Amazon Web Services
  /// resources, such as Route 53 hosted zones. There's a limit on the number of
  /// resource policies that you can create, so we recommend that you use a
  /// consistent prefix so you can use the same resource policy for all the log
  /// groups that you create for query logging.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Create a CloudWatch Logs resource policy, and give it the permissions that
  /// Route 53 needs to create log streams and to send query logs to log
  /// streams. For the value of <code>Resource</code>, specify the ARN for the
  /// log group that you created in the previous step. To use the same resource
  /// policy for all the CloudWatch Logs log groups that you created for query
  /// logging configurations, replace the hosted zone name with <code>*</code>,
  /// for example:
  ///
  /// <code>arn:aws:logs:us-east-1:123412341234:log-group:/aws/route53/*</code>
  ///
  /// To avoid the confused deputy problem, a security issue where an entity
  /// without a permission for an action can coerce a more-privileged entity to
  /// perform it, you can optionally limit the permissions that a service has to
  /// a resource in a resource-based policy by supplying the following values:
  ///
  /// <ul>
  /// <li>
  /// For <code>aws:SourceArn</code>, supply the hosted zone ARN used in
  /// creating the query logging configuration. For example,
  /// <code>aws:SourceArn: arn:aws:route53:::hostedzone/hosted zone ID</code>.
  /// </li>
  /// <li>
  /// For <code>aws:SourceAccount</code>, supply the account ID for the account
  /// that creates the query logging configuration. For example,
  /// <code>aws:SourceAccount:111111111111</code>.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/confused-deputy.html">The
  /// confused deputy problem</a> in the <i>Amazon Web Services IAM User
  /// Guide</i>.
  /// <note>
  /// You can't use the CloudWatch console to create or edit a resource policy.
  /// You must use the CloudWatch API, one of the Amazon Web Services SDKs, or
  /// the CLI.
  /// </note> </li> </ol> </dd> <dt>Log Streams and Edge Locations</dt> <dd>
  /// When Route 53 finishes creating the configuration for DNS query logging,
  /// it does the following:
  ///
  /// <ul>
  /// <li>
  /// Creates a log stream for an edge location the first time that the edge
  /// location responds to DNS queries for the specified hosted zone. That log
  /// stream is used to log all queries that Route 53 responds to for that edge
  /// location.
  /// </li>
  /// <li>
  /// Begins to send query logs to the applicable log stream.
  /// </li>
  /// </ul>
  /// The name of each log stream is in the following format:
  ///
  /// <code> <i>hosted zone ID</i>/<i>edge location code</i> </code>
  ///
  /// The edge location code is a three-letter code and an arbitrarily assigned
  /// number, for example, DFW3. The three-letter code typically corresponds
  /// with the International Air Transport Association airport code for an
  /// airport near the edge location. (These abbreviations might change in the
  /// future.) For a list of edge locations, see "The Route 53 Global Network"
  /// on the <a href="http://aws.amazon.com/route53/details/">Route 53 Product
  /// Details</a> page.
  /// </dd> <dt>Queries That Are Logged</dt> <dd>
  /// Query logs contain only the queries that DNS resolvers forward to Route
  /// 53. If a DNS resolver has already cached the response to a query (such as
  /// the IP address for a load balancer for example.com), the resolver will
  /// continue to return the cached response. It doesn't forward another query
  /// to Route 53 until the TTL for the corresponding resource record set
  /// expires. Depending on how many DNS queries are submitted for a resource
  /// record set, and depending on the TTL for that resource record set, query
  /// logs might contain information about only one query out of every several
  /// thousand queries that are submitted to DNS. For more information about how
  /// DNS works, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/welcome-dns-service.html">Routing
  /// Internet Traffic to Your Website or Web Application</a> in the <i>Amazon
  /// Route 53 Developer Guide</i>.
  /// </dd> <dt>Log File Format</dt> <dd>
  /// For a list of the values in each query log and the format of each value,
  /// see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html">Logging
  /// DNS Queries</a> in the <i>Amazon Route 53 Developer Guide</i>.
  /// </dd> <dt>Pricing</dt> <dd>
  /// For information about charges for query logs, see <a
  /// href="http://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch
  /// Pricing</a>.
  /// </dd> <dt>How to Stop Logging</dt> <dd>
  /// If you want Route 53 to stop sending query logs to CloudWatch Logs, delete
  /// the query logging configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_DeleteQueryLoggingConfig.html">DeleteQueryLoggingConfig</a>.
  /// </dd> </dl>
  ///
  /// May throw [ConcurrentModification].
  /// May throw [NoSuchHostedZone].
  /// May throw [NoSuchCloudWatchLogsLogGroup].
  /// May throw [InvalidInput].
  /// May throw [QueryLoggingConfigAlreadyExists].
  /// May throw [InsufficientCloudWatchLogsResourcePolicy].
  ///
  /// Parameter [cloudWatchLogsLogGroupArn] :
  /// The Amazon Resource Name (ARN) for the log group that you want to Amazon
  /// Route 53 to send query logs to. This is the format of the ARN:
  ///
  /// arn:aws:logs:<i>region</i>:<i>account-id</i>:log-group:<i>log_group_name</i>
  ///
  /// To get the ARN for a log group, you can use the CloudWatch console, the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeLogGroups.html">DescribeLogGroups</a>
  /// API action, the <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/logs/describe-log-groups.html">describe-log-groups</a>
  /// command, or the applicable command in one of the Amazon Web Services SDKs.
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the hosted zone that you want to log queries for. You can log
  /// queries only for public hosted zones.
  Future<CreateQueryLoggingConfigResponse> createQueryLoggingConfig({
    required String cloudWatchLogsLogGroupArn,
    required String hostedZoneId,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2013-04-01/queryloggingconfig',
      payload: CreateQueryLoggingConfigRequest(
              cloudWatchLogsLogGroupArn: cloudWatchLogsLogGroupArn,
              hostedZoneId: hostedZoneId)
          .toXml(
        'CreateQueryLoggingConfigRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateQueryLoggingConfigResponse(
      queryLoggingConfig: QueryLoggingConfig.fromXml(
          _s.extractXmlChild($elem, 'QueryLoggingConfig')!),
      location: _s.extractHeaderStringValue($result.headers, 'Location')!,
    );
  }

  /// Creates a delegation set (a group of four name servers) that can be reused
  /// by multiple hosted zones that were created by the same Amazon Web Services
  /// account.
  ///
  /// You can also create a reusable delegation set that uses the four name
  /// servers that are associated with an existing hosted zone. Specify the
  /// hosted zone ID in the <code>CreateReusableDelegationSet</code> request.
  /// <note>
  /// You can't associate a reusable delegation set with a private hosted zone.
  /// </note>
  /// For information about using a reusable delegation set to configure white
  /// label name servers, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/white-label-name-servers.html">Configuring
  /// White Label Name Servers</a>.
  ///
  /// The process for migrating existing hosted zones to use a reusable
  /// delegation set is comparable to the process for configuring white label
  /// name servers. You need to perform the following steps:
  /// <ol>
  /// <li>
  /// Create a reusable delegation set.
  /// </li>
  /// <li>
  /// Recreate hosted zones, and reduce the TTL to 60 seconds or less.
  /// </li>
  /// <li>
  /// Recreate resource record sets in the new hosted zones.
  /// </li>
  /// <li>
  /// Change the registrar's name servers to use the name servers for the new
  /// hosted zones.
  /// </li>
  /// <li>
  /// Monitor traffic for the website or application.
  /// </li>
  /// <li>
  /// Change TTLs back to their original values.
  /// </li> </ol>
  /// If you want to migrate existing hosted zones to use a reusable delegation
  /// set, the existing hosted zones can't use any of the name servers that are
  /// assigned to the reusable delegation set. If one or more hosted zones do
  /// use one or more name servers that are assigned to the reusable delegation
  /// set, you can do one of the following:
  ///
  /// <ul>
  /// <li>
  /// For small numbers of hosted zones—up to a few hundred—it's relatively easy
  /// to create reusable delegation sets until you get one that has four name
  /// servers that don't overlap with any of the name servers in your hosted
  /// zones.
  /// </li>
  /// <li>
  /// For larger numbers of hosted zones, the easiest solution is to use more
  /// than one reusable delegation set.
  /// </li>
  /// <li>
  /// For larger numbers of hosted zones, you can also migrate hosted zones that
  /// have overlapping name servers to hosted zones that don't have overlapping
  /// name servers, then migrate the hosted zones again to use the reusable
  /// delegation set.
  /// </li>
  /// </ul>
  ///
  /// May throw [DelegationSetAlreadyCreated].
  /// May throw [LimitsExceeded].
  /// May throw [HostedZoneNotFound].
  /// May throw [InvalidArgument].
  /// May throw [InvalidInput].
  /// May throw [DelegationSetNotAvailable].
  /// May throw [DelegationSetAlreadyReusable].
  ///
  /// Parameter [callerReference] :
  /// A unique string that identifies the request, and that allows you to retry
  /// failed <code>CreateReusableDelegationSet</code> requests without the risk
  /// of executing the operation twice. You must use a unique
  /// <code>CallerReference</code> string every time you submit a
  /// <code>CreateReusableDelegationSet</code> request.
  /// <code>CallerReference</code> can be any unique string, for example a
  /// date/time stamp.
  ///
  /// Parameter [hostedZoneId] :
  /// If you want to mark the delegation set for an existing hosted zone as
  /// reusable, the ID for that hosted zone.
  Future<CreateReusableDelegationSetResponse> createReusableDelegationSet({
    required String callerReference,
    String? hostedZoneId,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2013-04-01/delegationset',
      payload: CreateReusableDelegationSetRequest(
              callerReference: callerReference, hostedZoneId: hostedZoneId)
          .toXml(
        'CreateReusableDelegationSetRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateReusableDelegationSetResponse(
      delegationSet:
          DelegationSet.fromXml(_s.extractXmlChild($elem, 'DelegationSet')!),
      location: _s.extractHeaderStringValue($result.headers, 'Location')!,
    );
  }

  /// Creates a traffic policy, which you use to create multiple DNS resource
  /// record sets for one domain name (such as example.com) or one subdomain
  /// name (such as www.example.com).
  ///
  /// May throw [InvalidInput].
  /// May throw [TooManyTrafficPolicies].
  /// May throw [TrafficPolicyAlreadyExists].
  /// May throw [InvalidTrafficPolicyDocument].
  ///
  /// Parameter [document] :
  /// The definition of this traffic policy in JSON format. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/api-policies-traffic-policy-document-format.html">Traffic
  /// Policy Document Format</a>.
  ///
  /// Parameter [name] :
  /// The name of the traffic policy.
  ///
  /// Parameter [comment] :
  /// (Optional) Any comments that you want to include about the traffic policy.
  Future<CreateTrafficPolicyResponse> createTrafficPolicy({
    required String document,
    required String name,
    String? comment,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2013-04-01/trafficpolicy',
      payload: CreateTrafficPolicyRequest(
              document: document, name: name, comment: comment)
          .toXml(
        'CreateTrafficPolicyRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateTrafficPolicyResponse(
      trafficPolicy:
          TrafficPolicy.fromXml(_s.extractXmlChild($elem, 'TrafficPolicy')!),
      location: _s.extractHeaderStringValue($result.headers, 'Location')!,
    );
  }

  /// Creates resource record sets in a specified hosted zone based on the
  /// settings in a specified traffic policy version. In addition,
  /// <code>CreateTrafficPolicyInstance</code> associates the resource record
  /// sets with a specified domain name (such as example.com) or subdomain name
  /// (such as www.example.com). Amazon Route 53 responds to DNS queries for the
  /// domain or subdomain name by using the resource record sets that
  /// <code>CreateTrafficPolicyInstance</code> created.
  /// <note>
  /// After you submit an <code>CreateTrafficPolicyInstance</code> request,
  /// there's a brief delay while Amazon Route 53 creates the resource record
  /// sets that are specified in the traffic policy definition. Use
  /// <code>GetTrafficPolicyInstance</code> with the <code>id</code> of new
  /// traffic policy instance to confirm that the
  /// <code>CreateTrafficPolicyInstance</code> request completed successfully.
  /// For more information, see the <code>State</code> response element.
  /// </note>
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidInput].
  /// May throw [TooManyTrafficPolicyInstances].
  /// May throw [NoSuchTrafficPolicy].
  /// May throw [TrafficPolicyInstanceAlreadyExists].
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the hosted zone that you want Amazon Route 53 to create resource
  /// record sets in by using the configuration in a traffic policy.
  ///
  /// Parameter [name] :
  /// The domain name (such as example.com) or subdomain name (such as
  /// www.example.com) for which Amazon Route 53 responds to DNS queries by
  /// using the resource record sets that Route 53 creates for this traffic
  /// policy instance.
  ///
  /// Parameter [ttl] :
  /// (Optional) The TTL that you want Amazon Route 53 to assign to all of the
  /// resource record sets that it creates in the specified hosted zone.
  ///
  /// Parameter [trafficPolicyId] :
  /// The ID of the traffic policy that you want to use to create resource
  /// record sets in the specified hosted zone.
  ///
  /// Parameter [trafficPolicyVersion] :
  /// The version of the traffic policy that you want to use to create resource
  /// record sets in the specified hosted zone.
  Future<CreateTrafficPolicyInstanceResponse> createTrafficPolicyInstance({
    required String hostedZoneId,
    required String name,
    required int ttl,
    required String trafficPolicyId,
    required int trafficPolicyVersion,
  }) async {
    _s.validateNumRange(
      'ttl',
      ttl,
      0,
      2147483647,
      isRequired: true,
    );
    _s.validateNumRange(
      'trafficPolicyVersion',
      trafficPolicyVersion,
      1,
      1000,
      isRequired: true,
    );
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2013-04-01/trafficpolicyinstance',
      payload: CreateTrafficPolicyInstanceRequest(
              hostedZoneId: hostedZoneId,
              name: name,
              ttl: ttl,
              trafficPolicyId: trafficPolicyId,
              trafficPolicyVersion: trafficPolicyVersion)
          .toXml(
        'CreateTrafficPolicyInstanceRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateTrafficPolicyInstanceResponse(
      trafficPolicyInstance: TrafficPolicyInstance.fromXml(
          _s.extractXmlChild($elem, 'TrafficPolicyInstance')!),
      location: _s.extractHeaderStringValue($result.headers, 'Location')!,
    );
  }

  /// Creates a new version of an existing traffic policy. When you create a new
  /// version of a traffic policy, you specify the ID of the traffic policy that
  /// you want to update and a JSON-formatted document that describes the new
  /// version. You use traffic policies to create multiple DNS resource record
  /// sets for one domain name (such as example.com) or one subdomain name (such
  /// as www.example.com). You can create a maximum of 1000 versions of a
  /// traffic policy. If you reach the limit and need to create another version,
  /// you'll need to start a new traffic policy.
  ///
  /// May throw [NoSuchTrafficPolicy].
  /// May throw [InvalidInput].
  /// May throw [TooManyTrafficPolicyVersionsForCurrentPolicy].
  /// May throw [ConcurrentModification].
  /// May throw [InvalidTrafficPolicyDocument].
  ///
  /// Parameter [document] :
  /// The definition of this version of the traffic policy, in JSON format. You
  /// specified the JSON in the <code>CreateTrafficPolicyVersion</code> request.
  /// For more information about the JSON format, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateTrafficPolicy.html">CreateTrafficPolicy</a>.
  ///
  /// Parameter [id] :
  /// The ID of the traffic policy for which you want to create a new version.
  ///
  /// Parameter [comment] :
  /// The comment that you specified in the
  /// <code>CreateTrafficPolicyVersion</code> request, if any.
  Future<CreateTrafficPolicyVersionResponse> createTrafficPolicyVersion({
    required String document,
    required String id,
    String? comment,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2013-04-01/trafficpolicy/${Uri.encodeComponent(id)}',
      payload: CreateTrafficPolicyVersionRequest(
              document: document, id: id, comment: comment)
          .toXml(
        'CreateTrafficPolicyVersionRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateTrafficPolicyVersionResponse(
      trafficPolicy:
          TrafficPolicy.fromXml(_s.extractXmlChild($elem, 'TrafficPolicy')!),
      location: _s.extractHeaderStringValue($result.headers, 'Location')!,
    );
  }

  /// Authorizes the Amazon Web Services account that created a specified VPC to
  /// submit an <code>AssociateVPCWithHostedZone</code> request to associate the
  /// VPC with a specified hosted zone that was created by a different account.
  /// To submit a <code>CreateVPCAssociationAuthorization</code> request, you
  /// must use the account that created the hosted zone. After you authorize the
  /// association, use the account that created the VPC to submit an
  /// <code>AssociateVPCWithHostedZone</code> request.
  /// <note>
  /// If you want to associate multiple VPCs that you created by using one
  /// account with a hosted zone that you created by using a different account,
  /// you must submit one authorization request for each VPC.
  /// </note>
  ///
  /// May throw [ConcurrentModification].
  /// May throw [TooManyVPCAssociationAuthorizations].
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidVPCId].
  /// May throw [InvalidInput].
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the private hosted zone that you want to authorize associating a
  /// VPC with.
  ///
  /// Parameter [vpc] :
  /// A complex type that contains the VPC ID and region for the VPC that you
  /// want to authorize associating with your hosted zone.
  Future<CreateVPCAssociationAuthorizationResponse>
      createVPCAssociationAuthorization({
    required String hostedZoneId,
    required VPC vpc,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/hostedzone/${Uri.encodeComponent(hostedZoneId)}/authorizevpcassociation',
      payload: CreateVPCAssociationAuthorizationRequest(
              hostedZoneId: hostedZoneId, vpc: vpc)
          .toXml(
        'CreateVPCAssociationAuthorizationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return CreateVPCAssociationAuthorizationResponse.fromXml($result.body);
  }

  /// Deactivates a key-signing key (KSK) so that it will not be used for
  /// signing by DNSSEC. This operation changes the KSK status to
  /// <code>INACTIVE</code>.
  ///
  /// May throw [ConcurrentModification].
  /// May throw [NoSuchKeySigningKey].
  /// May throw [InvalidKeySigningKeyStatus].
  /// May throw [InvalidSigningStatus].
  /// May throw [KeySigningKeyInUse].
  /// May throw [KeySigningKeyInParentDSRecord].
  /// May throw [InvalidInput].
  ///
  /// Parameter [hostedZoneId] :
  /// A unique string used to identify a hosted zone.
  ///
  /// Parameter [name] :
  /// A string used to identify a key-signing key (KSK).
  Future<DeactivateKeySigningKeyResponse> deactivateKeySigningKey({
    required String hostedZoneId,
    required String name,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/keysigningkey/${Uri.encodeComponent(hostedZoneId)}/${Uri.encodeComponent(name)}/deactivate',
      exceptionFnMap: _exceptionFns,
    );
    return DeactivateKeySigningKeyResponse.fromXml($result.body);
  }

  /// Deletes a CIDR collection in the current Amazon Web Services account. The
  /// collection must be empty before it can be deleted.
  ///
  /// May throw [NoSuchCidrCollectionException].
  /// May throw [CidrCollectionInUseException].
  /// May throw [InvalidInput].
  /// May throw [ConcurrentModification].
  ///
  /// Parameter [id] :
  /// The UUID of the collection to delete.
  Future<void> deleteCidrCollection({
    required String id,
  }) async {
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/2013-04-01/cidrcollection/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a health check.
  /// <important>
  /// Amazon Route 53 does not prevent you from deleting a health check even if
  /// the health check is associated with one or more resource record sets. If
  /// you delete a health check and you don't update the associated resource
  /// record sets, the future status of the health check can't be predicted and
  /// may change. This will affect the routing of DNS queries for your DNS
  /// failover configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/health-checks-creating-deleting.html#health-checks-deleting.html">Replacing
  /// and Deleting Health Checks</a> in the <i>Amazon Route 53 Developer
  /// Guide</i>.
  /// </important>
  /// If you're using Cloud Map and you configured Cloud Map to create a Route
  /// 53 health check when you register an instance, you can't use the Route 53
  /// <code>DeleteHealthCheck</code> command to delete the health check. The
  /// health check is deleted automatically when you deregister the instance;
  /// there can be a delay of several hours before the health check is deleted
  /// from Route 53.
  ///
  /// May throw [NoSuchHealthCheck].
  /// May throw [HealthCheckInUse].
  /// May throw [InvalidInput].
  ///
  /// Parameter [healthCheckId] :
  /// The ID of the health check that you want to delete.
  Future<void> deleteHealthCheck({
    required String healthCheckId,
  }) async {
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/2013-04-01/healthcheck/${Uri.encodeComponent(healthCheckId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a hosted zone.
  ///
  /// If the hosted zone was created by another service, such as Cloud Map, see
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DeleteHostedZone.html#delete-public-hosted-zone-created-by-another-service">Deleting
  /// Public Hosted Zones That Were Created by Another Service</a> in the
  /// <i>Amazon Route 53 Developer Guide</i> for information about how to delete
  /// it. (The process is the same for public and private hosted zones that were
  /// created by another service.)
  ///
  /// If you want to keep your domain registration but you want to stop routing
  /// internet traffic to your website or web application, we recommend that you
  /// delete resource record sets in the hosted zone instead of deleting the
  /// hosted zone.
  /// <important>
  /// If you delete a hosted zone, you can't undelete it. You must create a new
  /// hosted zone and update the name servers for your domain registration,
  /// which can require up to 48 hours to take effect. (If you delegated
  /// responsibility for a subdomain to a hosted zone and you delete the child
  /// hosted zone, you must update the name servers in the parent hosted zone.)
  /// In addition, if you delete a hosted zone, someone could hijack the domain
  /// and route traffic to their own resources using your domain name.
  /// </important>
  /// If you want to avoid the monthly charge for the hosted zone, you can
  /// transfer DNS service for the domain to a free DNS service. When you
  /// transfer DNS service, you have to update the name servers for the domain
  /// registration. If the domain is registered with Route 53, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_UpdateDomainNameservers.html">UpdateDomainNameservers</a>
  /// for information about how to replace Route 53 name servers with name
  /// servers for the new DNS service. If the domain is registered with another
  /// registrar, use the method provided by the registrar to update name servers
  /// for the domain registration. For more information, perform an internet
  /// search on "free DNS service."
  ///
  /// You can delete a hosted zone only if it contains only the default SOA
  /// record and NS resource record sets. If the hosted zone contains other
  /// resource record sets, you must delete them before you can delete the
  /// hosted zone. If you try to delete a hosted zone that contains other
  /// resource record sets, the request fails, and Route 53 returns a
  /// <code>HostedZoneNotEmpty</code> error. For information about deleting
  /// records from your hosted zone, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ChangeResourceRecordSets.html">ChangeResourceRecordSets</a>.
  ///
  /// To verify that the hosted zone has been deleted, do one of the following:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>GetHostedZone</code> action to request information about the
  /// hosted zone.
  /// </li>
  /// <li>
  /// Use the <code>ListHostedZones</code> action to get a list of the hosted
  /// zones associated with the current Amazon Web Services account.
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [HostedZoneNotEmpty].
  /// May throw [PriorRequestNotComplete].
  /// May throw [InvalidInput].
  /// May throw [InvalidDomainName].
  ///
  /// Parameter [id] :
  /// The ID of the hosted zone you want to delete.
  Future<DeleteHostedZoneResponse> deleteHostedZone({
    required String id,
  }) async {
    final $result = await _protocol.send(
      method: 'DELETE',
      requestUri: '/2013-04-01/hostedzone/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteHostedZoneResponse.fromXml($result.body);
  }

  /// Deletes a key-signing key (KSK). Before you can delete a KSK, you must
  /// deactivate it. The KSK must be deactivated before you can delete it
  /// regardless of whether the hosted zone is enabled for DNSSEC signing.
  ///
  /// You can use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_DeactivateKeySigningKey.html">DeactivateKeySigningKey</a>
  /// to deactivate the key before you delete it.
  ///
  /// Use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetDNSSEC.html">GetDNSSEC</a>
  /// to verify that the KSK is in an <code>INACTIVE</code> status.
  ///
  /// May throw [ConcurrentModification].
  /// May throw [NoSuchKeySigningKey].
  /// May throw [InvalidKeySigningKeyStatus].
  /// May throw [InvalidSigningStatus].
  /// May throw [InvalidKMSArn].
  /// May throw [InvalidInput].
  ///
  /// Parameter [hostedZoneId] :
  /// A unique string used to identify a hosted zone.
  ///
  /// Parameter [name] :
  /// A string used to identify a key-signing key (KSK).
  Future<DeleteKeySigningKeyResponse> deleteKeySigningKey({
    required String hostedZoneId,
    required String name,
  }) async {
    final $result = await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/2013-04-01/keysigningkey/${Uri.encodeComponent(hostedZoneId)}/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteKeySigningKeyResponse.fromXml($result.body);
  }

  /// Deletes a configuration for DNS query logging. If you delete a
  /// configuration, Amazon Route 53 stops sending query logs to CloudWatch
  /// Logs. Route 53 doesn't delete any logs that are already in CloudWatch
  /// Logs.
  ///
  /// For more information about DNS query logs, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateQueryLoggingConfig.html">CreateQueryLoggingConfig</a>.
  ///
  /// May throw [ConcurrentModification].
  /// May throw [NoSuchQueryLoggingConfig].
  /// May throw [InvalidInput].
  ///
  /// Parameter [id] :
  /// The ID of the configuration that you want to delete.
  Future<void> deleteQueryLoggingConfig({
    required String id,
  }) async {
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/2013-04-01/queryloggingconfig/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a reusable delegation set.
  /// <important>
  /// You can delete a reusable delegation set only if it isn't associated with
  /// any hosted zones.
  /// </important>
  /// To verify that the reusable delegation set is not associated with any
  /// hosted zones, submit a <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetReusableDelegationSet.html">GetReusableDelegationSet</a>
  /// request and specify the ID of the reusable delegation set that you want to
  /// delete.
  ///
  /// May throw [NoSuchDelegationSet].
  /// May throw [DelegationSetInUse].
  /// May throw [DelegationSetNotReusable].
  /// May throw [InvalidInput].
  ///
  /// Parameter [id] :
  /// The ID of the reusable delegation set that you want to delete.
  Future<void> deleteReusableDelegationSet({
    required String id,
  }) async {
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/2013-04-01/delegationset/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a traffic policy.
  ///
  /// When you delete a traffic policy, Route 53 sets a flag on the policy to
  /// indicate that it has been deleted. However, Route 53 never fully deletes
  /// the traffic policy. Note the following:
  ///
  /// <ul>
  /// <li>
  /// Deleted traffic policies aren't listed if you run <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListTrafficPolicies.html">ListTrafficPolicies</a>.
  /// </li>
  /// <li>
  /// There's no way to get a list of deleted policies.
  /// </li>
  /// <li>
  /// If you retain the ID of the policy, you can get information about the
  /// policy, including the traffic policy document, by running <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetTrafficPolicy.html">GetTrafficPolicy</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchTrafficPolicy].
  /// May throw [InvalidInput].
  /// May throw [TrafficPolicyInUse].
  /// May throw [ConcurrentModification].
  ///
  /// Parameter [id] :
  /// The ID of the traffic policy that you want to delete.
  ///
  /// Parameter [version] :
  /// The version number of the traffic policy that you want to delete.
  Future<void> deleteTrafficPolicy({
    required String id,
    required int version,
  }) async {
    _s.validateNumRange(
      'version',
      version,
      1,
      1000,
      isRequired: true,
    );
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/2013-04-01/trafficpolicy/${Uri.encodeComponent(id)}/${Uri.encodeComponent(version.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a traffic policy instance and all of the resource record sets that
  /// Amazon Route 53 created when you created the instance.
  /// <note>
  /// In the Route 53 console, traffic policy instances are known as policy
  /// records.
  /// </note>
  ///
  /// May throw [NoSuchTrafficPolicyInstance].
  /// May throw [InvalidInput].
  /// May throw [PriorRequestNotComplete].
  ///
  /// Parameter [id] :
  /// The ID of the traffic policy instance that you want to delete.
  /// <important>
  /// When you delete a traffic policy instance, Amazon Route 53 also deletes
  /// all of the resource record sets that were created when you created the
  /// traffic policy instance.
  /// </important>
  Future<void> deleteTrafficPolicyInstance({
    required String id,
  }) async {
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/2013-04-01/trafficpolicyinstance/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes authorization to submit an <code>AssociateVPCWithHostedZone</code>
  /// request to associate a specified VPC with a hosted zone that was created
  /// by a different account. You must use the account that created the hosted
  /// zone to submit a <code>DeleteVPCAssociationAuthorization</code> request.
  /// <important>
  /// Sending this request only prevents the Amazon Web Services account that
  /// created the VPC from associating the VPC with the Amazon Route 53 hosted
  /// zone in the future. If the VPC is already associated with the hosted zone,
  /// <code>DeleteVPCAssociationAuthorization</code> won't disassociate the VPC
  /// from the hosted zone. If you want to delete an existing association, use
  /// <code>DisassociateVPCFromHostedZone</code>.
  /// </important>
  ///
  /// May throw [ConcurrentModification].
  /// May throw [VPCAssociationAuthorizationNotFound].
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidVPCId].
  /// May throw [InvalidInput].
  ///
  /// Parameter [hostedZoneId] :
  /// When removing authorization to associate a VPC that was created by one
  /// Amazon Web Services account with a hosted zone that was created with a
  /// different Amazon Web Services account, the ID of the hosted zone.
  ///
  /// Parameter [vpc] :
  /// When removing authorization to associate a VPC that was created by one
  /// Amazon Web Services account with a hosted zone that was created with a
  /// different Amazon Web Services account, a complex type that includes the ID
  /// and region of the VPC.
  Future<void> deleteVPCAssociationAuthorization({
    required String hostedZoneId,
    required VPC vpc,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/hostedzone/${Uri.encodeComponent(hostedZoneId)}/deauthorizevpcassociation',
      payload: DeleteVPCAssociationAuthorizationRequest(
              hostedZoneId: hostedZoneId, vpc: vpc)
          .toXml(
        'DeleteVPCAssociationAuthorizationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disables DNSSEC signing in a specific hosted zone. This action does not
  /// deactivate any key-signing keys (KSKs) that are active in the hosted zone.
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidArgument].
  /// May throw [ConcurrentModification].
  /// May throw [KeySigningKeyInParentDSRecord].
  /// May throw [DNSSECNotFound].
  /// May throw [InvalidKeySigningKeyStatus].
  /// May throw [InvalidKMSArn].
  /// May throw [InvalidInput].
  ///
  /// Parameter [hostedZoneId] :
  /// A unique string used to identify a hosted zone.
  Future<DisableHostedZoneDNSSECResponse> disableHostedZoneDNSSEC({
    required String hostedZoneId,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/hostedzone/${Uri.encodeComponent(hostedZoneId)}/disable-dnssec',
      exceptionFnMap: _exceptionFns,
    );
    return DisableHostedZoneDNSSECResponse.fromXml($result.body);
  }

  /// Disassociates an Amazon Virtual Private Cloud (Amazon VPC) from an Amazon
  /// Route 53 private hosted zone. Note the following:
  ///
  /// <ul>
  /// <li>
  /// You can't disassociate the last Amazon VPC from a private hosted zone.
  /// </li>
  /// <li>
  /// You can't convert a private hosted zone into a public hosted zone.
  /// </li>
  /// <li>
  /// You can submit a <code>DisassociateVPCFromHostedZone</code> request using
  /// either the account that created the hosted zone or the account that
  /// created the Amazon VPC.
  /// </li>
  /// <li>
  /// Some services, such as Cloud Map and Amazon Elastic File System (Amazon
  /// EFS) automatically create hosted zones and associate VPCs with the hosted
  /// zones. A service can create a hosted zone using your account or using its
  /// own account. You can disassociate a VPC from a hosted zone only if the
  /// service created the hosted zone using your account.
  ///
  /// When you run <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListHostedZonesByVPC.html">DisassociateVPCFromHostedZone</a>,
  /// if the hosted zone has a value for <code>OwningAccount</code>, you can use
  /// <code>DisassociateVPCFromHostedZone</code>. If the hosted zone has a value
  /// for <code>OwningService</code>, you can't use
  /// <code>DisassociateVPCFromHostedZone</code>.
  /// </li>
  /// </ul> <note>
  /// When revoking access, the hosted zone and the Amazon VPC must belong to
  /// the same partition. A partition is a group of Amazon Web Services Regions.
  /// Each Amazon Web Services account is scoped to one partition.
  ///
  /// The following are the supported partitions:
  ///
  /// <ul>
  /// <li>
  /// <code>aws</code> - Amazon Web Services Regions
  /// </li>
  /// <li>
  /// <code>aws-cn</code> - China Regions
  /// </li>
  /// <li>
  /// <code>aws-us-gov</code> - Amazon Web Services GovCloud (US) Region
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Access
  /// Management</a> in the <i>Amazon Web Services General Reference</i>.
  /// </note>
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidVPCId].
  /// May throw [VPCAssociationNotFound].
  /// May throw [LastVPCAssociation].
  /// May throw [InvalidInput].
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the private hosted zone that you want to disassociate a VPC
  /// from.
  ///
  /// Parameter [vpc] :
  /// A complex type that contains information about the VPC that you're
  /// disassociating from the specified hosted zone.
  ///
  /// Parameter [comment] :
  /// <i>Optional:</i> A comment about the disassociation request.
  Future<DisassociateVPCFromHostedZoneResponse> disassociateVPCFromHostedZone({
    required String hostedZoneId,
    required VPC vpc,
    String? comment,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/hostedzone/${Uri.encodeComponent(hostedZoneId)}/disassociatevpc',
      payload: DisassociateVPCFromHostedZoneRequest(
              hostedZoneId: hostedZoneId, vpc: vpc, comment: comment)
          .toXml(
        'DisassociateVPCFromHostedZoneRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateVPCFromHostedZoneResponse.fromXml($result.body);
  }

  /// Enables DNSSEC signing in a specific hosted zone.
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidArgument].
  /// May throw [ConcurrentModification].
  /// May throw [KeySigningKeyWithActiveStatusNotFound].
  /// May throw [InvalidKMSArn].
  /// May throw [HostedZonePartiallyDelegated].
  /// May throw [DNSSECNotFound].
  /// May throw [InvalidKeySigningKeyStatus].
  /// May throw [InvalidInput].
  ///
  /// Parameter [hostedZoneId] :
  /// A unique string used to identify a hosted zone.
  Future<EnableHostedZoneDNSSECResponse> enableHostedZoneDNSSEC({
    required String hostedZoneId,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/hostedzone/${Uri.encodeComponent(hostedZoneId)}/enable-dnssec',
      exceptionFnMap: _exceptionFns,
    );
    return EnableHostedZoneDNSSECResponse.fromXml($result.body);
  }

  /// Gets the specified limit for the current account, for example, the maximum
  /// number of health checks that you can create using the account.
  ///
  /// For the default limit, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html">Limits</a>
  /// in the <i>Amazon Route 53 Developer Guide</i>. To request a higher limit,
  /// <a
  /// href="https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&amp;limitType=service-code-route53">open
  /// a case</a>.
  /// <note>
  /// You can also view account limits in Amazon Web Services Trusted Advisor.
  /// Sign in to the Amazon Web Services Management Console and open the Trusted
  /// Advisor console at <a
  /// href="https://console.aws.amazon.com/trustedadvisor">https://console.aws.amazon.com/trustedadvisor/</a>.
  /// Then choose <b>Service limits</b> in the navigation pane.
  /// </note>
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [type] :
  /// The limit that you want to get. Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>MAX_HEALTH_CHECKS_BY_OWNER</b>: The maximum number of health checks
  /// that you can create using the current account.
  /// </li>
  /// <li>
  /// <b>MAX_HOSTED_ZONES_BY_OWNER</b>: The maximum number of hosted zones that
  /// you can create using the current account.
  /// </li>
  /// <li>
  /// <b>MAX_REUSABLE_DELEGATION_SETS_BY_OWNER</b>: The maximum number of
  /// reusable delegation sets that you can create using the current account.
  /// </li>
  /// <li>
  /// <b>MAX_TRAFFIC_POLICIES_BY_OWNER</b>: The maximum number of traffic
  /// policies that you can create using the current account.
  /// </li>
  /// <li>
  /// <b>MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER</b>: The maximum number of
  /// traffic policy instances that you can create using the current account.
  /// (Traffic policy instances are referred to as traffic flow policy records
  /// in the Amazon Route 53 console.)
  /// </li>
  /// </ul>
  Future<GetAccountLimitResponse> getAccountLimit({
    required AccountLimitType type,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/accountlimit/${Uri.encodeComponent(type.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountLimitResponse.fromXml($result.body);
  }

  /// Returns the current status of a change batch request. The status is one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> indicates that the changes in this request have not
  /// propagated to all Amazon Route 53 DNS servers managing the hosted zone.
  /// This is the initial status of all change batch requests.
  /// </li>
  /// <li>
  /// <code>INSYNC</code> indicates that the changes have propagated to all
  /// Route 53 DNS servers managing the hosted zone.
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchChange].
  /// May throw [InvalidInput].
  ///
  /// Parameter [id] :
  /// The ID of the change batch request. The value that you specify here is the
  /// value that <code>ChangeResourceRecordSets</code> returned in the
  /// <code>Id</code> element when you submitted the request.
  Future<GetChangeResponse> getChange({
    required String id,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/change/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetChangeResponse.fromXml($result.body);
  }

  /// Route 53 does not perform authorization for this API because it retrieves
  /// information that is already available to the public.
  /// <important>
  /// <code>GetCheckerIpRanges</code> still works, but we recommend that you
  /// download ip-ranges.json, which includes IP address ranges for all Amazon
  /// Web Services services. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/route-53-ip-addresses.html">IP
  /// Address Ranges of Amazon Route 53 Servers</a> in the <i>Amazon Route 53
  /// Developer Guide</i>.
  /// </important>
  Future<GetCheckerIpRangesResponse> getCheckerIpRanges() async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/checkeripranges',
      exceptionFnMap: _exceptionFns,
    );
    return GetCheckerIpRangesResponse.fromXml($result.body);
  }

  /// Returns information about DNSSEC for a specific hosted zone, including the
  /// key-signing keys (KSKs) in the hosted zone.
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidArgument].
  /// May throw [InvalidInput].
  ///
  /// Parameter [hostedZoneId] :
  /// A unique string used to identify a hosted zone.
  Future<GetDNSSECResponse> getDNSSEC({
    required String hostedZoneId,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/hostedzone/${Uri.encodeComponent(hostedZoneId)}/dnssec',
      exceptionFnMap: _exceptionFns,
    );
    return GetDNSSECResponse.fromXml($result.body);
  }

  /// Gets information about whether a specified geographic location is
  /// supported for Amazon Route 53 geolocation resource record sets.
  ///
  /// Route 53 does not perform authorization for this API because it retrieves
  /// information that is already available to the public.
  ///
  /// Use the following syntax to determine whether a continent is supported for
  /// geolocation:
  ///
  /// <code>GET /2013-04-01/geolocation?continentcode=<i>two-letter abbreviation
  /// for a continent</i> </code>
  ///
  /// Use the following syntax to determine whether a country is supported for
  /// geolocation:
  ///
  /// <code>GET /2013-04-01/geolocation?countrycode=<i>two-character country
  /// code</i> </code>
  ///
  /// Use the following syntax to determine whether a subdivision of a country
  /// is supported for geolocation:
  ///
  /// <code>GET /2013-04-01/geolocation?countrycode=<i>two-character country
  /// code</i>&amp;subdivisioncode=<i>subdivision code</i> </code>
  ///
  /// May throw [NoSuchGeoLocation].
  /// May throw [InvalidInput].
  ///
  /// Parameter [continentCode] :
  /// For geolocation resource record sets, a two-letter abbreviation that
  /// identifies a continent. Amazon Route 53 supports the following continent
  /// codes:
  ///
  /// <ul>
  /// <li>
  /// <b>AF</b>: Africa
  /// </li>
  /// <li>
  /// <b>AN</b>: Antarctica
  /// </li>
  /// <li>
  /// <b>AS</b>: Asia
  /// </li>
  /// <li>
  /// <b>EU</b>: Europe
  /// </li>
  /// <li>
  /// <b>OC</b>: Oceania
  /// </li>
  /// <li>
  /// <b>NA</b>: North America
  /// </li>
  /// <li>
  /// <b>SA</b>: South America
  /// </li>
  /// </ul>
  ///
  /// Parameter [countryCode] :
  /// Amazon Route 53 uses the two-letter country codes that are specified in <a
  /// href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO standard
  /// 3166-1 alpha-2</a>.
  ///
  /// Route 53 also supports the country code <b>UA</b> for Ukraine.
  ///
  /// Parameter [subdivisionCode] :
  /// The code for the subdivision, such as a particular state within the United
  /// States. For a list of US state abbreviations, see <a
  /// href="https://pe.usps.com/text/pub28/28apb.htm">Appendix B: Two–Letter
  /// State and Possession Abbreviations</a> on the United States Postal Service
  /// website. For a list of all supported subdivision codes, use the <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListGeoLocations.html">ListGeoLocations</a>
  /// API.
  Future<GetGeoLocationResponse> getGeoLocation({
    String? continentCode,
    String? countryCode,
    String? subdivisionCode,
  }) async {
    final $query = <String, List<String>>{
      if (continentCode != null) 'continentcode': [continentCode],
      if (countryCode != null) 'countrycode': [countryCode],
      if (subdivisionCode != null) 'subdivisioncode': [subdivisionCode],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/geolocation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetGeoLocationResponse.fromXml($result.body);
  }

  /// Gets information about a specified health check.
  ///
  /// May throw [NoSuchHealthCheck].
  /// May throw [InvalidInput].
  /// May throw [IncompatibleVersion].
  ///
  /// Parameter [healthCheckId] :
  /// The identifier that Amazon Route 53 assigned to the health check when you
  /// created it. When you add or update a resource record set, you use this
  /// value to specify which health check to use. The value can be up to 64
  /// characters long.
  Future<GetHealthCheckResponse> getHealthCheck({
    required String healthCheckId,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/healthcheck/${Uri.encodeComponent(healthCheckId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetHealthCheckResponse.fromXml($result.body);
  }

  /// Retrieves the number of health checks that are associated with the current
  /// Amazon Web Services account.
  Future<GetHealthCheckCountResponse> getHealthCheckCount() async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/healthcheckcount',
      exceptionFnMap: _exceptionFns,
    );
    return GetHealthCheckCountResponse.fromXml($result.body);
  }

  /// Gets the reason that a specified health check failed most recently.
  ///
  /// May throw [NoSuchHealthCheck].
  /// May throw [InvalidInput].
  ///
  /// Parameter [healthCheckId] :
  /// The ID for the health check for which you want the last failure reason.
  /// When you created the health check, <code>CreateHealthCheck</code> returned
  /// the ID in the response, in the <code>HealthCheckId</code> element.
  /// <note>
  /// If you want to get the last failure reason for a calculated health check,
  /// you must use the Amazon Route 53 console or the CloudWatch console. You
  /// can't use <code>GetHealthCheckLastFailureReason</code> for a calculated
  /// health check.
  /// </note>
  Future<GetHealthCheckLastFailureReasonResponse>
      getHealthCheckLastFailureReason({
    required String healthCheckId,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/healthcheck/${Uri.encodeComponent(healthCheckId)}/lastfailurereason',
      exceptionFnMap: _exceptionFns,
    );
    return GetHealthCheckLastFailureReasonResponse.fromXml($result.body);
  }

  /// Gets status of a specified health check.
  /// <important>
  /// This API is intended for use during development to diagnose behavior. It
  /// doesn’t support production use-cases with high query rates that require
  /// immediate and actionable responses.
  /// </important>
  ///
  /// May throw [NoSuchHealthCheck].
  /// May throw [InvalidInput].
  ///
  /// Parameter [healthCheckId] :
  /// The ID for the health check that you want the current status for. When you
  /// created the health check, <code>CreateHealthCheck</code> returned the ID
  /// in the response, in the <code>HealthCheckId</code> element.
  /// <note>
  /// If you want to check the status of a calculated health check, you must use
  /// the Amazon Route 53 console or the CloudWatch console. You can't use
  /// <code>GetHealthCheckStatus</code> to get the status of a calculated health
  /// check.
  /// </note>
  Future<GetHealthCheckStatusResponse> getHealthCheckStatus({
    required String healthCheckId,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/healthcheck/${Uri.encodeComponent(healthCheckId)}/status',
      exceptionFnMap: _exceptionFns,
    );
    return GetHealthCheckStatusResponse.fromXml($result.body);
  }

  /// Gets information about a specified hosted zone including the four name
  /// servers assigned to the hosted zone.
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidInput].
  ///
  /// Parameter [id] :
  /// The ID of the hosted zone that you want to get information about.
  Future<GetHostedZoneResponse> getHostedZone({
    required String id,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/hostedzone/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetHostedZoneResponse.fromXml($result.body);
  }

  /// Retrieves the number of hosted zones that are associated with the current
  /// Amazon Web Services account.
  ///
  /// May throw [InvalidInput].
  Future<GetHostedZoneCountResponse> getHostedZoneCount() async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/hostedzonecount',
      exceptionFnMap: _exceptionFns,
    );
    return GetHostedZoneCountResponse.fromXml($result.body);
  }

  /// Gets the specified limit for a specified hosted zone, for example, the
  /// maximum number of records that you can create in the hosted zone.
  ///
  /// For the default limit, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html">Limits</a>
  /// in the <i>Amazon Route 53 Developer Guide</i>. To request a higher limit,
  /// <a
  /// href="https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&amp;limitType=service-code-route53">open
  /// a case</a>.
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidInput].
  /// May throw [HostedZoneNotPrivate].
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the hosted zone that you want to get a limit for.
  ///
  /// Parameter [type] :
  /// The limit that you want to get. Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>MAX_RRSETS_BY_ZONE</b>: The maximum number of records that you can
  /// create in the specified hosted zone.
  /// </li>
  /// <li>
  /// <b>MAX_VPCS_ASSOCIATED_BY_ZONE</b>: The maximum number of Amazon VPCs that
  /// you can associate with the specified private hosted zone.
  /// </li>
  /// </ul>
  Future<GetHostedZoneLimitResponse> getHostedZoneLimit({
    required String hostedZoneId,
    required HostedZoneLimitType type,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/hostedzonelimit/${Uri.encodeComponent(hostedZoneId)}/${Uri.encodeComponent(type.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetHostedZoneLimitResponse.fromXml($result.body);
  }

  /// Gets information about a specified configuration for DNS query logging.
  ///
  /// For more information about DNS query logs, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateQueryLoggingConfig.html">CreateQueryLoggingConfig</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html">Logging
  /// DNS Queries</a>.
  ///
  /// May throw [NoSuchQueryLoggingConfig].
  /// May throw [InvalidInput].
  ///
  /// Parameter [id] :
  /// The ID of the configuration for DNS query logging that you want to get
  /// information about.
  Future<GetQueryLoggingConfigResponse> getQueryLoggingConfig({
    required String id,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/queryloggingconfig/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueryLoggingConfigResponse.fromXml($result.body);
  }

  /// Retrieves information about a specified reusable delegation set, including
  /// the four name servers that are assigned to the delegation set.
  ///
  /// May throw [NoSuchDelegationSet].
  /// May throw [DelegationSetNotReusable].
  /// May throw [InvalidInput].
  ///
  /// Parameter [id] :
  /// The ID of the reusable delegation set that you want to get a list of name
  /// servers for.
  Future<GetReusableDelegationSetResponse> getReusableDelegationSet({
    required String id,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/delegationset/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetReusableDelegationSetResponse.fromXml($result.body);
  }

  /// Gets the maximum number of hosted zones that you can associate with the
  /// specified reusable delegation set.
  ///
  /// For the default limit, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html">Limits</a>
  /// in the <i>Amazon Route 53 Developer Guide</i>. To request a higher limit,
  /// <a
  /// href="https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&amp;limitType=service-code-route53">open
  /// a case</a>.
  ///
  /// May throw [InvalidInput].
  /// May throw [NoSuchDelegationSet].
  ///
  /// Parameter [delegationSetId] :
  /// The ID of the delegation set that you want to get the limit for.
  ///
  /// Parameter [type] :
  /// Specify <code>MAX_ZONES_BY_REUSABLE_DELEGATION_SET</code> to get the
  /// maximum number of hosted zones that you can associate with the specified
  /// reusable delegation set.
  Future<GetReusableDelegationSetLimitResponse> getReusableDelegationSetLimit({
    required String delegationSetId,
    required ReusableDelegationSetLimitType type,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/reusabledelegationsetlimit/${Uri.encodeComponent(delegationSetId)}/${Uri.encodeComponent(type.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetReusableDelegationSetLimitResponse.fromXml($result.body);
  }

  /// Gets information about a specific traffic policy version.
  ///
  /// For information about how of deleting a traffic policy affects the
  /// response from <code>GetTrafficPolicy</code>, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_DeleteTrafficPolicy.html">DeleteTrafficPolicy</a>.
  ///
  /// May throw [NoSuchTrafficPolicy].
  /// May throw [InvalidInput].
  ///
  /// Parameter [id] :
  /// The ID of the traffic policy that you want to get information about.
  ///
  /// Parameter [version] :
  /// The version number of the traffic policy that you want to get information
  /// about.
  Future<GetTrafficPolicyResponse> getTrafficPolicy({
    required String id,
    required int version,
  }) async {
    _s.validateNumRange(
      'version',
      version,
      1,
      1000,
      isRequired: true,
    );
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/trafficpolicy/${Uri.encodeComponent(id)}/${Uri.encodeComponent(version.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTrafficPolicyResponse.fromXml($result.body);
  }

  /// Gets information about a specified traffic policy instance.
  /// <note>
  /// Use <code>GetTrafficPolicyInstance</code> with the <code>id</code> of new
  /// traffic policy instance to confirm that the
  /// <code>CreateTrafficPolicyInstance</code> or an
  /// <code>UpdateTrafficPolicyInstance</code> request completed successfully.
  /// For more information, see the <code>State</code> response element.
  /// </note> <note>
  /// In the Route 53 console, traffic policy instances are known as policy
  /// records.
  /// </note>
  ///
  /// May throw [NoSuchTrafficPolicyInstance].
  /// May throw [InvalidInput].
  ///
  /// Parameter [id] :
  /// The ID of the traffic policy instance that you want to get information
  /// about.
  Future<GetTrafficPolicyInstanceResponse> getTrafficPolicyInstance({
    required String id,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/trafficpolicyinstance/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTrafficPolicyInstanceResponse.fromXml($result.body);
  }

  /// Gets the number of traffic policy instances that are associated with the
  /// current Amazon Web Services account.
  Future<GetTrafficPolicyInstanceCountResponse>
      getTrafficPolicyInstanceCount() async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/trafficpolicyinstancecount',
      exceptionFnMap: _exceptionFns,
    );
    return GetTrafficPolicyInstanceCountResponse.fromXml($result.body);
  }

  /// Returns a paginated list of location objects and their CIDR blocks.
  ///
  /// May throw [NoSuchCidrCollectionException].
  /// May throw [NoSuchCidrLocationException].
  /// May throw [InvalidInput].
  ///
  /// Parameter [collectionId] :
  /// The UUID of the CIDR collection.
  ///
  /// Parameter [locationName] :
  /// The name of the CIDR collection location.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results you want returned.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token to indicate where the service is to begin
  /// enumerating results.
  Future<ListCidrBlocksResponse> listCidrBlocks({
    required String collectionId,
    String? locationName,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (locationName != null) 'location': [locationName],
      if (maxResults != null) 'maxresults': [maxResults],
      if (nextToken != null) 'nexttoken': [nextToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/cidrcollection/${Uri.encodeComponent(collectionId)}/cidrblocks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCidrBlocksResponse.fromXml($result.body);
  }

  /// Returns a paginated list of CIDR collections in the Amazon Web Services
  /// account (metadata only).
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of CIDR collections to return in the response.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token to indicate where the service is to begin
  /// enumerating results.
  ///
  /// If no value is provided, the listing of results starts from the beginning.
  Future<ListCidrCollectionsResponse> listCidrCollections({
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxresults': [maxResults],
      if (nextToken != null) 'nexttoken': [nextToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/cidrcollection',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCidrCollectionsResponse.fromXml($result.body);
  }

  /// Returns a paginated list of CIDR locations for the given collection
  /// (metadata only, does not include CIDR blocks).
  ///
  /// May throw [NoSuchCidrCollectionException].
  /// May throw [InvalidInput].
  ///
  /// Parameter [collectionId] :
  /// The CIDR collection ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of CIDR collection locations to return in the response.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token to indicate where the service is to begin
  /// enumerating results.
  ///
  /// If no value is provided, the listing of results starts from the beginning.
  Future<ListCidrLocationsResponse> listCidrLocations({
    required String collectionId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxresults': [maxResults],
      if (nextToken != null) 'nexttoken': [nextToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/cidrcollection/${Uri.encodeComponent(collectionId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCidrLocationsResponse.fromXml($result.body);
  }

  /// Retrieves a list of supported geographic locations.
  ///
  /// Countries are listed first, and continents are listed last. If Amazon
  /// Route 53 supports subdivisions for a country (for example, states or
  /// provinces), the subdivisions for that country are listed in alphabetical
  /// order immediately after the corresponding country.
  ///
  /// Route 53 does not perform authorization for this API because it retrieves
  /// information that is already available to the public.
  ///
  /// For a list of supported geolocation codes, see the <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_GeoLocation.html">GeoLocation</a>
  /// data type.
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [maxItems] :
  /// (Optional) The maximum number of geolocations to be included in the
  /// response body for this request. If more than <code>maxitems</code>
  /// geolocations remain to be listed, then the value of the
  /// <code>IsTruncated</code> element in the response is <code>true</code>.
  ///
  /// Parameter [startContinentCode] :
  /// The code for the continent with which you want to start listing locations
  /// that Amazon Route 53 supports for geolocation. If Route 53 has already
  /// returned a page or more of results, if <code>IsTruncated</code> is true,
  /// and if <code>NextContinentCode</code> from the previous response has a
  /// value, enter that value in <code>startcontinentcode</code> to return the
  /// next page of results.
  ///
  /// Include <code>startcontinentcode</code> only if you want to list
  /// continents. Don't include <code>startcontinentcode</code> when you're
  /// listing countries or countries with their subdivisions.
  ///
  /// Parameter [startCountryCode] :
  /// The code for the country with which you want to start listing locations
  /// that Amazon Route 53 supports for geolocation. If Route 53 has already
  /// returned a page or more of results, if <code>IsTruncated</code> is
  /// <code>true</code>, and if <code>NextCountryCode</code> from the previous
  /// response has a value, enter that value in <code>startcountrycode</code> to
  /// return the next page of results.
  ///
  /// Parameter [startSubdivisionCode] :
  /// The code for the state of the United States with which you want to start
  /// listing locations that Amazon Route 53 supports for geolocation. If Route
  /// 53 has already returned a page or more of results, if
  /// <code>IsTruncated</code> is <code>true</code>, and if
  /// <code>NextSubdivisionCode</code> from the previous response has a value,
  /// enter that value in <code>startsubdivisioncode</code> to return the next
  /// page of results.
  ///
  /// To list subdivisions (U.S. states), you must include both
  /// <code>startcountrycode</code> and <code>startsubdivisioncode</code>.
  Future<ListGeoLocationsResponse> listGeoLocations({
    String? maxItems,
    String? startContinentCode,
    String? startCountryCode,
    String? startSubdivisionCode,
  }) async {
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxitems': [maxItems],
      if (startContinentCode != null)
        'startcontinentcode': [startContinentCode],
      if (startCountryCode != null) 'startcountrycode': [startCountryCode],
      if (startSubdivisionCode != null)
        'startsubdivisioncode': [startSubdivisionCode],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/geolocations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGeoLocationsResponse.fromXml($result.body);
  }

  /// Retrieve a list of the health checks that are associated with the current
  /// Amazon Web Services account.
  ///
  /// May throw [InvalidInput].
  /// May throw [IncompatibleVersion].
  ///
  /// Parameter [marker] :
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>true</code>, you have more health checks. To get another group,
  /// submit another <code>ListHealthChecks</code> request.
  ///
  /// For the value of <code>marker</code>, specify the value of
  /// <code>NextMarker</code> from the previous response, which is the ID of the
  /// first health check that Amazon Route 53 will return if you submit another
  /// request.
  ///
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>false</code>, there are no more health checks to get.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of health checks that you want
  /// <code>ListHealthChecks</code> to return in response to the current
  /// request. Amazon Route 53 returns a maximum of 1000 items. If you set
  /// <code>MaxItems</code> to a value greater than 1000, Route 53 returns only
  /// the first 1000 health checks.
  Future<ListHealthChecksResponse> listHealthChecks({
    String? marker,
    String? maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'marker': [marker],
      if (maxItems != null) 'maxitems': [maxItems],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/healthcheck',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListHealthChecksResponse.fromXml($result.body);
  }

  /// Retrieves a list of the public and private hosted zones that are
  /// associated with the current Amazon Web Services account. The response
  /// includes a <code>HostedZones</code> child element for each hosted zone.
  ///
  /// Amazon Route 53 returns a maximum of 100 items in each response. If you
  /// have a lot of hosted zones, you can use the <code>maxitems</code>
  /// parameter to list them in groups of up to 100.
  ///
  /// May throw [InvalidInput].
  /// May throw [NoSuchDelegationSet].
  /// May throw [DelegationSetNotReusable].
  ///
  /// Parameter [delegationSetId] :
  /// If you're using reusable delegation sets and you want to list all of the
  /// hosted zones that are associated with a reusable delegation set, specify
  /// the ID of that reusable delegation set.
  ///
  /// Parameter [hostedZoneType] :
  /// (Optional) Specifies if the hosted zone is private.
  ///
  /// Parameter [marker] :
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>true</code>, you have more hosted zones. To get more hosted zones,
  /// submit another <code>ListHostedZones</code> request.
  ///
  /// For the value of <code>marker</code>, specify the value of
  /// <code>NextMarker</code> from the previous response, which is the ID of the
  /// first hosted zone that Amazon Route 53 will return if you submit another
  /// request.
  ///
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>false</code>, there are no more hosted zones to get.
  ///
  /// Parameter [maxItems] :
  /// (Optional) The maximum number of hosted zones that you want Amazon Route
  /// 53 to return. If you have more than <code>maxitems</code> hosted zones,
  /// the value of <code>IsTruncated</code> in the response is
  /// <code>true</code>, and the value of <code>NextMarker</code> is the hosted
  /// zone ID of the first hosted zone that Route 53 will return if you submit
  /// another request.
  Future<ListHostedZonesResponse> listHostedZones({
    String? delegationSetId,
    HostedZoneType? hostedZoneType,
    String? marker,
    String? maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (delegationSetId != null) 'delegationsetid': [delegationSetId],
      if (hostedZoneType != null) 'hostedzonetype': [hostedZoneType.toValue()],
      if (marker != null) 'marker': [marker],
      if (maxItems != null) 'maxitems': [maxItems],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/hostedzone',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListHostedZonesResponse.fromXml($result.body);
  }

  /// Retrieves a list of your hosted zones in lexicographic order. The response
  /// includes a <code>HostedZones</code> child element for each hosted zone
  /// created by the current Amazon Web Services account.
  ///
  /// <code>ListHostedZonesByName</code> sorts hosted zones by name with the
  /// labels reversed. For example:
  ///
  /// <code>com.example.www.</code>
  ///
  /// Note the trailing dot, which can change the sort order in some
  /// circumstances.
  ///
  /// If the domain name includes escape characters or Punycode,
  /// <code>ListHostedZonesByName</code> alphabetizes the domain name using the
  /// escaped or Punycoded value, which is the format that Amazon Route 53 saves
  /// in its database. For example, to create a hosted zone for exämple.com, you
  /// specify ex\344mple.com for the domain name.
  /// <code>ListHostedZonesByName</code> alphabetizes it as:
  ///
  /// <code>com.ex\344mple.</code>
  ///
  /// The labels are reversed and alphabetized using the escaped value. For more
  /// information about valid domain name formats, including internationalized
  /// domain names, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html">DNS
  /// Domain Name Format</a> in the <i>Amazon Route 53 Developer Guide</i>.
  ///
  /// Route 53 returns up to 100 items in each response. If you have a lot of
  /// hosted zones, use the <code>MaxItems</code> parameter to list them in
  /// groups of up to 100. The response includes values that help navigate from
  /// one group of <code>MaxItems</code> hosted zones to the next:
  ///
  /// <ul>
  /// <li>
  /// The <code>DNSName</code> and <code>HostedZoneId</code> elements in the
  /// response contain the values, if any, specified for the
  /// <code>dnsname</code> and <code>hostedzoneid</code> parameters in the
  /// request that produced the current response.
  /// </li>
  /// <li>
  /// The <code>MaxItems</code> element in the response contains the value, if
  /// any, that you specified for the <code>maxitems</code> parameter in the
  /// request that produced the current response.
  /// </li>
  /// <li>
  /// If the value of <code>IsTruncated</code> in the response is true, there
  /// are more hosted zones associated with the current Amazon Web Services
  /// account.
  ///
  /// If <code>IsTruncated</code> is false, this response includes the last
  /// hosted zone that is associated with the current account. The
  /// <code>NextDNSName</code> element and <code>NextHostedZoneId</code>
  /// elements are omitted from the response.
  /// </li>
  /// <li>
  /// The <code>NextDNSName</code> and <code>NextHostedZoneId</code> elements in
  /// the response contain the domain name and the hosted zone ID of the next
  /// hosted zone that is associated with the current Amazon Web Services
  /// account. If you want to list more hosted zones, make another call to
  /// <code>ListHostedZonesByName</code>, and specify the value of
  /// <code>NextDNSName</code> and <code>NextHostedZoneId</code> in the
  /// <code>dnsname</code> and <code>hostedzoneid</code> parameters,
  /// respectively.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInput].
  /// May throw [InvalidDomainName].
  ///
  /// Parameter [dNSName] :
  /// (Optional) For your first request to <code>ListHostedZonesByName</code>,
  /// include the <code>dnsname</code> parameter only if you want to specify the
  /// name of the first hosted zone in the response. If you don't include the
  /// <code>dnsname</code> parameter, Amazon Route 53 returns all of the hosted
  /// zones that were created by the current Amazon Web Services account, in
  /// ASCII order. For subsequent requests, include both <code>dnsname</code>
  /// and <code>hostedzoneid</code> parameters. For <code>dnsname</code>,
  /// specify the value of <code>NextDNSName</code> from the previous response.
  ///
  /// Parameter [hostedZoneId] :
  /// (Optional) For your first request to <code>ListHostedZonesByName</code>,
  /// do not include the <code>hostedzoneid</code> parameter.
  ///
  /// If you have more hosted zones than the value of <code>maxitems</code>,
  /// <code>ListHostedZonesByName</code> returns only the first
  /// <code>maxitems</code> hosted zones. To get the next group of
  /// <code>maxitems</code> hosted zones, submit another request to
  /// <code>ListHostedZonesByName</code> and include both <code>dnsname</code>
  /// and <code>hostedzoneid</code> parameters. For the value of
  /// <code>hostedzoneid</code>, specify the value of the
  /// <code>NextHostedZoneId</code> element from the previous response.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of hosted zones to be included in the response body for
  /// this request. If you have more than <code>maxitems</code> hosted zones,
  /// then the value of the <code>IsTruncated</code> element in the response is
  /// true, and the values of <code>NextDNSName</code> and
  /// <code>NextHostedZoneId</code> specify the first hosted zone in the next
  /// group of <code>maxitems</code> hosted zones.
  Future<ListHostedZonesByNameResponse> listHostedZonesByName({
    String? dNSName,
    String? hostedZoneId,
    String? maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (dNSName != null) 'dnsname': [dNSName],
      if (hostedZoneId != null) 'hostedzoneid': [hostedZoneId],
      if (maxItems != null) 'maxitems': [maxItems],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/hostedzonesbyname',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListHostedZonesByNameResponse.fromXml($result.body);
  }

  /// Lists all the private hosted zones that a specified VPC is associated
  /// with, regardless of which Amazon Web Services account or Amazon Web
  /// Services service owns the hosted zones. The <code>HostedZoneOwner</code>
  /// structure in the response contains one of the following values:
  ///
  /// <ul>
  /// <li>
  /// An <code>OwningAccount</code> element, which contains the account number
  /// of either the current Amazon Web Services account or another Amazon Web
  /// Services account. Some services, such as Cloud Map, create hosted zones
  /// using the current account.
  /// </li>
  /// <li>
  /// An <code>OwningService</code> element, which identifies the Amazon Web
  /// Services service that created and owns the hosted zone. For example, if a
  /// hosted zone was created by Amazon Elastic File System (Amazon EFS), the
  /// value of <code>Owner</code> is <code>efs.amazonaws.com</code>.
  /// </li>
  /// </ul> <note>
  /// When listing private hosted zones, the hosted zone and the Amazon VPC must
  /// belong to the same partition where the hosted zones were created. A
  /// partition is a group of Amazon Web Services Regions. Each Amazon Web
  /// Services account is scoped to one partition.
  ///
  /// The following are the supported partitions:
  ///
  /// <ul>
  /// <li>
  /// <code>aws</code> - Amazon Web Services Regions
  /// </li>
  /// <li>
  /// <code>aws-cn</code> - China Regions
  /// </li>
  /// <li>
  /// <code>aws-us-gov</code> - Amazon Web Services GovCloud (US) Region
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Access
  /// Management</a> in the <i>Amazon Web Services General Reference</i>.
  /// </note>
  ///
  /// May throw [InvalidInput].
  /// May throw [InvalidPaginationToken].
  ///
  /// Parameter [vPCId] :
  /// The ID of the Amazon VPC that you want to list hosted zones for.
  ///
  /// Parameter [vPCRegion] :
  /// For the Amazon VPC that you specified for <code>VPCId</code>, the Amazon
  /// Web Services Region that you created the VPC in.
  ///
  /// Parameter [maxItems] :
  /// (Optional) The maximum number of hosted zones that you want Amazon Route
  /// 53 to return. If the specified VPC is associated with more than
  /// <code>MaxItems</code> hosted zones, the response includes a
  /// <code>NextToken</code> element. <code>NextToken</code> contains an
  /// encrypted token that identifies the first hosted zone that Route 53 will
  /// return if you submit another request.
  ///
  /// Parameter [nextToken] :
  /// If the previous response included a <code>NextToken</code> element, the
  /// specified VPC is associated with more hosted zones. To get more hosted
  /// zones, submit another <code>ListHostedZonesByVPC</code> request.
  ///
  /// For the value of <code>NextToken</code>, specify the value of
  /// <code>NextToken</code> from the previous response.
  ///
  /// If the previous response didn't include a <code>NextToken</code> element,
  /// there are no more hosted zones to get.
  Future<ListHostedZonesByVPCResponse> listHostedZonesByVPC({
    required String vPCId,
    required VPCRegion vPCRegion,
    String? maxItems,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      'vpcid': [vPCId],
      'vpcregion': [vPCRegion.toValue()],
      if (maxItems != null) 'maxitems': [maxItems],
      if (nextToken != null) 'nexttoken': [nextToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/hostedzonesbyvpc',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListHostedZonesByVPCResponse.fromXml($result.body);
  }

  /// Lists the configurations for DNS query logging that are associated with
  /// the current Amazon Web Services account or the configuration that is
  /// associated with a specified hosted zone.
  ///
  /// For more information about DNS query logs, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateQueryLoggingConfig.html">CreateQueryLoggingConfig</a>.
  /// Additional information, including the format of DNS query logs, appears in
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html">Logging
  /// DNS Queries</a> in the <i>Amazon Route 53 Developer Guide</i>.
  ///
  /// May throw [InvalidInput].
  /// May throw [InvalidPaginationToken].
  /// May throw [NoSuchHostedZone].
  ///
  /// Parameter [hostedZoneId] :
  /// (Optional) If you want to list the query logging configuration that is
  /// associated with a hosted zone, specify the ID in
  /// <code>HostedZoneId</code>.
  ///
  /// If you don't specify a hosted zone ID,
  /// <code>ListQueryLoggingConfigs</code> returns all of the configurations
  /// that are associated with the current Amazon Web Services account.
  ///
  /// Parameter [maxResults] :
  /// (Optional) The maximum number of query logging configurations that you
  /// want Amazon Route 53 to return in response to the current request. If the
  /// current Amazon Web Services account has more than <code>MaxResults</code>
  /// configurations, use the value of <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListQueryLoggingConfigs.html#API_ListQueryLoggingConfigs_RequestSyntax">NextToken</a>
  /// in the response to get the next page of results.
  ///
  /// If you don't specify a value for <code>MaxResults</code>, Route 53 returns
  /// up to 100 configurations.
  ///
  /// Parameter [nextToken] :
  /// (Optional) If the current Amazon Web Services account has more than
  /// <code>MaxResults</code> query logging configurations, use
  /// <code>NextToken</code> to get the second and subsequent pages of results.
  ///
  /// For the first <code>ListQueryLoggingConfigs</code> request, omit this
  /// value.
  ///
  /// For the second and subsequent requests, get the value of
  /// <code>NextToken</code> from the previous response and specify that value
  /// for <code>NextToken</code> in the request.
  Future<ListQueryLoggingConfigsResponse> listQueryLoggingConfigs({
    String? hostedZoneId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (hostedZoneId != null) 'hostedzoneid': [hostedZoneId],
      if (maxResults != null) 'maxresults': [maxResults],
      if (nextToken != null) 'nexttoken': [nextToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/queryloggingconfig',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueryLoggingConfigsResponse.fromXml($result.body);
  }

  /// Lists the resource record sets in a specified hosted zone.
  ///
  /// <code>ListResourceRecordSets</code> returns up to 300 resource record sets
  /// at a time in ASCII order, beginning at a position specified by the
  /// <code>name</code> and <code>type</code> elements.
  ///
  /// <b>Sort order</b>
  ///
  /// <code>ListResourceRecordSets</code> sorts results first by DNS name with
  /// the labels reversed, for example:
  ///
  /// <code>com.example.www.</code>
  ///
  /// Note the trailing dot, which can change the sort order when the record
  /// name contains characters that appear before <code>.</code> (decimal 46) in
  /// the ASCII table. These characters include the following: <code>! " # $ %
  /// &amp; ' ( ) * + , -</code>
  ///
  /// When multiple records have the same DNS name,
  /// <code>ListResourceRecordSets</code> sorts results by the record type.
  ///
  /// <b>Specifying where to start listing records</b>
  ///
  /// You can use the name and type elements to specify the resource record set
  /// that the list begins with:
  /// <dl> <dt>If you do not specify Name or Type</dt> <dd>
  /// The results begin with the first resource record set that the hosted zone
  /// contains.
  /// </dd> <dt>If you specify Name but not Type</dt> <dd>
  /// The results begin with the first resource record set in the list whose
  /// name is greater than or equal to <code>Name</code>.
  /// </dd> <dt>If you specify Type but not Name</dt> <dd>
  /// Amazon Route 53 returns the <code>InvalidInput</code> error.
  /// </dd> <dt>If you specify both Name and Type</dt> <dd>
  /// The results begin with the first resource record set in the list whose
  /// name is greater than or equal to <code>Name</code>, and whose type is
  /// greater than or equal to <code>Type</code>.
  /// </dd> </dl>
  /// <b>Resource record sets that are PENDING</b>
  ///
  /// This action returns the most current version of the records. This includes
  /// records that are <code>PENDING</code>, and that are not yet available on
  /// all Route 53 DNS servers.
  ///
  /// <b>Changing resource record sets</b>
  ///
  /// To ensure that you get an accurate listing of the resource record sets for
  /// a hosted zone at a point in time, do not submit a
  /// <code>ChangeResourceRecordSets</code> request while you're paging through
  /// the results of a <code>ListResourceRecordSets</code> request. If you do,
  /// some pages may display results without the latest changes while other
  /// pages display results with the latest changes.
  ///
  /// <b>Displaying the next page of results</b>
  ///
  /// If a <code>ListResourceRecordSets</code> command returns more than one
  /// page of results, the value of <code>IsTruncated</code> is
  /// <code>true</code>. To display the next page of results, get the values of
  /// <code>NextRecordName</code>, <code>NextRecordType</code>, and
  /// <code>NextRecordIdentifier</code> (if any) from the response. Then submit
  /// another <code>ListResourceRecordSets</code> request, and specify those
  /// values for <code>StartRecordName</code>, <code>StartRecordType</code>, and
  /// <code>StartRecordIdentifier</code>.
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidInput].
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the hosted zone that contains the resource record sets that you
  /// want to list.
  ///
  /// Parameter [maxItems] :
  /// (Optional) The maximum number of resource records sets to include in the
  /// response body for this request. If the response includes more than
  /// <code>maxitems</code> resource record sets, the value of the
  /// <code>IsTruncated</code> element in the response is <code>true</code>, and
  /// the values of the <code>NextRecordName</code> and
  /// <code>NextRecordType</code> elements in the response identify the first
  /// resource record set in the next group of <code>maxitems</code> resource
  /// record sets.
  ///
  /// Parameter [startRecordIdentifier] :
  /// <i>Resource record sets that have a routing policy other than simple:</i>
  /// If results were truncated for a given DNS name and type, specify the value
  /// of <code>NextRecordIdentifier</code> from the previous response to get the
  /// next resource record set that has the current DNS name and type.
  ///
  /// Parameter [startRecordName] :
  /// The first name in the lexicographic ordering of resource record sets that
  /// you want to list. If the specified record name doesn't exist, the results
  /// begin with the first resource record set that has a name greater than the
  /// value of <code>name</code>.
  ///
  /// Parameter [startRecordType] :
  /// The type of resource record set to begin the record listing from.
  ///
  /// Valid values for basic resource record sets: <code>A</code> |
  /// <code>AAAA</code> | <code>CAA</code> | <code>CNAME</code> |
  /// <code>MX</code> | <code>NAPTR</code> | <code>NS</code> | <code>PTR</code>
  /// | <code>SOA</code> | <code>SPF</code> | <code>SRV</code> |
  /// <code>TXT</code>
  ///
  /// Values for weighted, latency, geolocation, and failover resource record
  /// sets: <code>A</code> | <code>AAAA</code> | <code>CAA</code> |
  /// <code>CNAME</code> | <code>MX</code> | <code>NAPTR</code> |
  /// <code>PTR</code> | <code>SPF</code> | <code>SRV</code> | <code>TXT</code>
  ///
  /// Values for alias resource record sets:
  ///
  /// <ul>
  /// <li>
  /// <b>API Gateway custom regional API or edge-optimized API</b>: A
  /// </li>
  /// <li>
  /// <b>CloudFront distribution</b>: A or AAAA
  /// </li>
  /// <li>
  /// <b>Elastic Beanstalk environment that has a regionalized subdomain</b>: A
  /// </li>
  /// <li>
  /// <b>Elastic Load Balancing load balancer</b>: A | AAAA
  /// </li>
  /// <li>
  /// <b>S3 bucket</b>: A
  /// </li>
  /// <li>
  /// <b>VPC interface VPC endpoint</b>: A
  /// </li>
  /// <li>
  /// <b>Another resource record set in this hosted zone:</b> The type of the
  /// resource record set that the alias references.
  /// </li>
  /// </ul>
  /// Constraint: Specifying <code>type</code> without specifying
  /// <code>name</code> returns an <code>InvalidInput</code> error.
  Future<ListResourceRecordSetsResponse> listResourceRecordSets({
    required String hostedZoneId,
    String? maxItems,
    String? startRecordIdentifier,
    String? startRecordName,
    RRType? startRecordType,
  }) async {
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxitems': [maxItems],
      if (startRecordIdentifier != null) 'identifier': [startRecordIdentifier],
      if (startRecordName != null) 'name': [startRecordName],
      if (startRecordType != null) 'type': [startRecordType.toValue()],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/hostedzone/${Uri.encodeComponent(hostedZoneId)}/rrset',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceRecordSetsResponse.fromXml($result.body);
  }

  /// Retrieves a list of the reusable delegation sets that are associated with
  /// the current Amazon Web Services account.
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [marker] :
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>true</code>, you have more reusable delegation sets. To get another
  /// group, submit another <code>ListReusableDelegationSets</code> request.
  ///
  /// For the value of <code>marker</code>, specify the value of
  /// <code>NextMarker</code> from the previous response, which is the ID of the
  /// first reusable delegation set that Amazon Route 53 will return if you
  /// submit another request.
  ///
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>false</code>, there are no more reusable delegation sets to get.
  ///
  /// Parameter [maxItems] :
  /// The number of reusable delegation sets that you want Amazon Route 53 to
  /// return in the response to this request. If you specify a value greater
  /// than 100, Route 53 returns only the first 100 reusable delegation sets.
  Future<ListReusableDelegationSetsResponse> listReusableDelegationSets({
    String? marker,
    String? maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'marker': [marker],
      if (maxItems != null) 'maxitems': [maxItems],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/delegationset',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReusableDelegationSetsResponse.fromXml($result.body);
  }

  /// Lists tags for one health check or hosted zone.
  ///
  /// For information about using tags for cost allocation, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the <i>Billing and Cost Management User
  /// Guide</i>.
  ///
  /// May throw [InvalidInput].
  /// May throw [NoSuchHealthCheck].
  /// May throw [NoSuchHostedZone].
  /// May throw [PriorRequestNotComplete].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource for which you want to retrieve tags.
  ///
  /// Parameter [resourceType] :
  /// The type of the resource.
  ///
  /// <ul>
  /// <li>
  /// The resource type for health checks is <code>healthcheck</code>.
  /// </li>
  /// <li>
  /// The resource type for hosted zones is <code>hostedzone</code>.
  /// </li>
  /// </ul>
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceId,
    required TagResourceType resourceType,
  }) async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/tags/${Uri.encodeComponent(resourceType.toValue())}/${Uri.encodeComponent(resourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromXml($result.body);
  }

  /// Lists tags for up to 10 health checks or hosted zones.
  ///
  /// For information about using tags for cost allocation, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the <i>Billing and Cost Management User
  /// Guide</i>.
  ///
  /// May throw [InvalidInput].
  /// May throw [NoSuchHealthCheck].
  /// May throw [NoSuchHostedZone].
  /// May throw [PriorRequestNotComplete].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceIds] :
  /// A complex type that contains the ResourceId element for each resource for
  /// which you want to get a list of tags.
  ///
  /// Parameter [resourceType] :
  /// The type of the resources.
  ///
  /// <ul>
  /// <li>
  /// The resource type for health checks is <code>healthcheck</code>.
  /// </li>
  /// <li>
  /// The resource type for hosted zones is <code>hostedzone</code>.
  /// </li>
  /// </ul>
  Future<ListTagsForResourcesResponse> listTagsForResources({
    required List<String> resourceIds,
    required TagResourceType resourceType,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/tags/${Uri.encodeComponent(resourceType.toValue())}',
      payload: ListTagsForResourcesRequest(
              resourceIds: resourceIds, resourceType: resourceType)
          .toXml(
        'ListTagsForResourcesRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourcesResponse.fromXml($result.body);
  }

  /// Gets information about the latest version for every traffic policy that is
  /// associated with the current Amazon Web Services account. Policies are
  /// listed in the order that they were created in.
  ///
  /// For information about how of deleting a traffic policy affects the
  /// response from <code>ListTrafficPolicies</code>, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_DeleteTrafficPolicy.html">DeleteTrafficPolicy</a>.
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [maxItems] :
  /// (Optional) The maximum number of traffic policies that you want Amazon
  /// Route 53 to return in response to this request. If you have more than
  /// <code>MaxItems</code> traffic policies, the value of
  /// <code>IsTruncated</code> in the response is <code>true</code>, and the
  /// value of <code>TrafficPolicyIdMarker</code> is the ID of the first traffic
  /// policy that Route 53 will return if you submit another request.
  ///
  /// Parameter [trafficPolicyIdMarker] :
  /// (Conditional) For your first request to <code>ListTrafficPolicies</code>,
  /// don't include the <code>TrafficPolicyIdMarker</code> parameter.
  ///
  /// If you have more traffic policies than the value of <code>MaxItems</code>,
  /// <code>ListTrafficPolicies</code> returns only the first
  /// <code>MaxItems</code> traffic policies. To get the next group of policies,
  /// submit another request to <code>ListTrafficPolicies</code>. For the value
  /// of <code>TrafficPolicyIdMarker</code>, specify the value of
  /// <code>TrafficPolicyIdMarker</code> that was returned in the previous
  /// response.
  Future<ListTrafficPoliciesResponse> listTrafficPolicies({
    String? maxItems,
    String? trafficPolicyIdMarker,
  }) async {
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxitems': [maxItems],
      if (trafficPolicyIdMarker != null)
        'trafficpolicyid': [trafficPolicyIdMarker],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/trafficpolicies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTrafficPoliciesResponse.fromXml($result.body);
  }

  /// Gets information about the traffic policy instances that you created by
  /// using the current Amazon Web Services account.
  /// <note>
  /// After you submit an <code>UpdateTrafficPolicyInstance</code> request,
  /// there's a brief delay while Amazon Route 53 creates the resource record
  /// sets that are specified in the traffic policy definition. For more
  /// information, see the <code>State</code> response element.
  /// </note>
  /// Route 53 returns a maximum of 100 items in each response. If you have a
  /// lot of traffic policy instances, you can use the <code>MaxItems</code>
  /// parameter to list them in groups of up to 100.
  ///
  /// May throw [InvalidInput].
  /// May throw [NoSuchTrafficPolicyInstance].
  ///
  /// Parameter [hostedZoneIdMarker] :
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>true</code>, you have more traffic policy instances. To get more
  /// traffic policy instances, submit another
  /// <code>ListTrafficPolicyInstances</code> request. For the value of
  /// <code>HostedZoneId</code>, specify the value of
  /// <code>HostedZoneIdMarker</code> from the previous response, which is the
  /// hosted zone ID of the first traffic policy instance in the next group of
  /// traffic policy instances.
  ///
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>false</code>, there are no more traffic policy instances to get.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of traffic policy instances that you want Amazon Route
  /// 53 to return in response to a <code>ListTrafficPolicyInstances</code>
  /// request. If you have more than <code>MaxItems</code> traffic policy
  /// instances, the value of the <code>IsTruncated</code> element in the
  /// response is <code>true</code>, and the values of
  /// <code>HostedZoneIdMarker</code>,
  /// <code>TrafficPolicyInstanceNameMarker</code>, and
  /// <code>TrafficPolicyInstanceTypeMarker</code> represent the first traffic
  /// policy instance in the next group of <code>MaxItems</code> traffic policy
  /// instances.
  ///
  /// Parameter [trafficPolicyInstanceNameMarker] :
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>true</code>, you have more traffic policy instances. To get more
  /// traffic policy instances, submit another
  /// <code>ListTrafficPolicyInstances</code> request. For the value of
  /// <code>trafficpolicyinstancename</code>, specify the value of
  /// <code>TrafficPolicyInstanceNameMarker</code> from the previous response,
  /// which is the name of the first traffic policy instance in the next group
  /// of traffic policy instances.
  ///
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>false</code>, there are no more traffic policy instances to get.
  ///
  /// Parameter [trafficPolicyInstanceTypeMarker] :
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>true</code>, you have more traffic policy instances. To get more
  /// traffic policy instances, submit another
  /// <code>ListTrafficPolicyInstances</code> request. For the value of
  /// <code>trafficpolicyinstancetype</code>, specify the value of
  /// <code>TrafficPolicyInstanceTypeMarker</code> from the previous response,
  /// which is the type of the first traffic policy instance in the next group
  /// of traffic policy instances.
  ///
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>false</code>, there are no more traffic policy instances to get.
  Future<ListTrafficPolicyInstancesResponse> listTrafficPolicyInstances({
    String? hostedZoneIdMarker,
    String? maxItems,
    String? trafficPolicyInstanceNameMarker,
    RRType? trafficPolicyInstanceTypeMarker,
  }) async {
    final $query = <String, List<String>>{
      if (hostedZoneIdMarker != null) 'hostedzoneid': [hostedZoneIdMarker],
      if (maxItems != null) 'maxitems': [maxItems],
      if (trafficPolicyInstanceNameMarker != null)
        'trafficpolicyinstancename': [trafficPolicyInstanceNameMarker],
      if (trafficPolicyInstanceTypeMarker != null)
        'trafficpolicyinstancetype': [
          trafficPolicyInstanceTypeMarker.toValue()
        ],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/trafficpolicyinstances',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTrafficPolicyInstancesResponse.fromXml($result.body);
  }

  /// Gets information about the traffic policy instances that you created in a
  /// specified hosted zone.
  /// <note>
  /// After you submit a <code>CreateTrafficPolicyInstance</code> or an
  /// <code>UpdateTrafficPolicyInstance</code> request, there's a brief delay
  /// while Amazon Route 53 creates the resource record sets that are specified
  /// in the traffic policy definition. For more information, see the
  /// <code>State</code> response element.
  /// </note>
  /// Route 53 returns a maximum of 100 items in each response. If you have a
  /// lot of traffic policy instances, you can use the <code>MaxItems</code>
  /// parameter to list them in groups of up to 100.
  ///
  /// May throw [InvalidInput].
  /// May throw [NoSuchTrafficPolicyInstance].
  /// May throw [NoSuchHostedZone].
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the hosted zone that you want to list traffic policy instances
  /// for.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of traffic policy instances to be included in the
  /// response body for this request. If you have more than
  /// <code>MaxItems</code> traffic policy instances, the value of the
  /// <code>IsTruncated</code> element in the response is <code>true</code>, and
  /// the values of <code>HostedZoneIdMarker</code>,
  /// <code>TrafficPolicyInstanceNameMarker</code>, and
  /// <code>TrafficPolicyInstanceTypeMarker</code> represent the first traffic
  /// policy instance that Amazon Route 53 will return if you submit another
  /// request.
  ///
  /// Parameter [trafficPolicyInstanceNameMarker] :
  /// If the value of <code>IsTruncated</code> in the previous response is true,
  /// you have more traffic policy instances. To get more traffic policy
  /// instances, submit another <code>ListTrafficPolicyInstances</code> request.
  /// For the value of <code>trafficpolicyinstancename</code>, specify the value
  /// of <code>TrafficPolicyInstanceNameMarker</code> from the previous
  /// response, which is the name of the first traffic policy instance in the
  /// next group of traffic policy instances.
  ///
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>false</code>, there are no more traffic policy instances to get.
  ///
  /// Parameter [trafficPolicyInstanceTypeMarker] :
  /// If the value of <code>IsTruncated</code> in the previous response is true,
  /// you have more traffic policy instances. To get more traffic policy
  /// instances, submit another <code>ListTrafficPolicyInstances</code> request.
  /// For the value of <code>trafficpolicyinstancetype</code>, specify the value
  /// of <code>TrafficPolicyInstanceTypeMarker</code> from the previous
  /// response, which is the type of the first traffic policy instance in the
  /// next group of traffic policy instances.
  ///
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>false</code>, there are no more traffic policy instances to get.
  Future<ListTrafficPolicyInstancesByHostedZoneResponse>
      listTrafficPolicyInstancesByHostedZone({
    required String hostedZoneId,
    String? maxItems,
    String? trafficPolicyInstanceNameMarker,
    RRType? trafficPolicyInstanceTypeMarker,
  }) async {
    final $query = <String, List<String>>{
      'id': [hostedZoneId],
      if (maxItems != null) 'maxitems': [maxItems],
      if (trafficPolicyInstanceNameMarker != null)
        'trafficpolicyinstancename': [trafficPolicyInstanceNameMarker],
      if (trafficPolicyInstanceTypeMarker != null)
        'trafficpolicyinstancetype': [
          trafficPolicyInstanceTypeMarker.toValue()
        ],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/trafficpolicyinstances/hostedzone',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTrafficPolicyInstancesByHostedZoneResponse.fromXml($result.body);
  }

  /// Gets information about the traffic policy instances that you created by
  /// using a specify traffic policy version.
  /// <note>
  /// After you submit a <code>CreateTrafficPolicyInstance</code> or an
  /// <code>UpdateTrafficPolicyInstance</code> request, there's a brief delay
  /// while Amazon Route 53 creates the resource record sets that are specified
  /// in the traffic policy definition. For more information, see the
  /// <code>State</code> response element.
  /// </note>
  /// Route 53 returns a maximum of 100 items in each response. If you have a
  /// lot of traffic policy instances, you can use the <code>MaxItems</code>
  /// parameter to list them in groups of up to 100.
  ///
  /// May throw [InvalidInput].
  /// May throw [NoSuchTrafficPolicyInstance].
  /// May throw [NoSuchTrafficPolicy].
  ///
  /// Parameter [trafficPolicyId] :
  /// The ID of the traffic policy for which you want to list traffic policy
  /// instances.
  ///
  /// Parameter [trafficPolicyVersion] :
  /// The version of the traffic policy for which you want to list traffic
  /// policy instances. The version must be associated with the traffic policy
  /// that is specified by <code>TrafficPolicyId</code>.
  ///
  /// Parameter [hostedZoneIdMarker] :
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>true</code>, you have more traffic policy instances. To get more
  /// traffic policy instances, submit another
  /// <code>ListTrafficPolicyInstancesByPolicy</code> request.
  ///
  /// For the value of <code>hostedzoneid</code>, specify the value of
  /// <code>HostedZoneIdMarker</code> from the previous response, which is the
  /// hosted zone ID of the first traffic policy instance that Amazon Route 53
  /// will return if you submit another request.
  ///
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>false</code>, there are no more traffic policy instances to get.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of traffic policy instances to be included in the
  /// response body for this request. If you have more than
  /// <code>MaxItems</code> traffic policy instances, the value of the
  /// <code>IsTruncated</code> element in the response is <code>true</code>, and
  /// the values of <code>HostedZoneIdMarker</code>,
  /// <code>TrafficPolicyInstanceNameMarker</code>, and
  /// <code>TrafficPolicyInstanceTypeMarker</code> represent the first traffic
  /// policy instance that Amazon Route 53 will return if you submit another
  /// request.
  ///
  /// Parameter [trafficPolicyInstanceNameMarker] :
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>true</code>, you have more traffic policy instances. To get more
  /// traffic policy instances, submit another
  /// <code>ListTrafficPolicyInstancesByPolicy</code> request.
  ///
  /// For the value of <code>trafficpolicyinstancename</code>, specify the value
  /// of <code>TrafficPolicyInstanceNameMarker</code> from the previous
  /// response, which is the name of the first traffic policy instance that
  /// Amazon Route 53 will return if you submit another request.
  ///
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>false</code>, there are no more traffic policy instances to get.
  ///
  /// Parameter [trafficPolicyInstanceTypeMarker] :
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>true</code>, you have more traffic policy instances. To get more
  /// traffic policy instances, submit another
  /// <code>ListTrafficPolicyInstancesByPolicy</code> request.
  ///
  /// For the value of <code>trafficpolicyinstancetype</code>, specify the value
  /// of <code>TrafficPolicyInstanceTypeMarker</code> from the previous
  /// response, which is the name of the first traffic policy instance that
  /// Amazon Route 53 will return if you submit another request.
  ///
  /// If the value of <code>IsTruncated</code> in the previous response was
  /// <code>false</code>, there are no more traffic policy instances to get.
  Future<ListTrafficPolicyInstancesByPolicyResponse>
      listTrafficPolicyInstancesByPolicy({
    required String trafficPolicyId,
    required int trafficPolicyVersion,
    String? hostedZoneIdMarker,
    String? maxItems,
    String? trafficPolicyInstanceNameMarker,
    RRType? trafficPolicyInstanceTypeMarker,
  }) async {
    _s.validateNumRange(
      'trafficPolicyVersion',
      trafficPolicyVersion,
      1,
      1000,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'id': [trafficPolicyId],
      'version': [trafficPolicyVersion.toString()],
      if (hostedZoneIdMarker != null) 'hostedzoneid': [hostedZoneIdMarker],
      if (maxItems != null) 'maxitems': [maxItems],
      if (trafficPolicyInstanceNameMarker != null)
        'trafficpolicyinstancename': [trafficPolicyInstanceNameMarker],
      if (trafficPolicyInstanceTypeMarker != null)
        'trafficpolicyinstancetype': [
          trafficPolicyInstanceTypeMarker.toValue()
        ],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/trafficpolicyinstances/trafficpolicy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTrafficPolicyInstancesByPolicyResponse.fromXml($result.body);
  }

  /// Gets information about all of the versions for a specified traffic policy.
  ///
  /// Traffic policy versions are listed in numerical order by
  /// <code>VersionNumber</code>.
  ///
  /// May throw [InvalidInput].
  /// May throw [NoSuchTrafficPolicy].
  ///
  /// Parameter [id] :
  /// Specify the value of <code>Id</code> of the traffic policy for which you
  /// want to list all versions.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of traffic policy versions that you want Amazon Route
  /// 53 to include in the response body for this request. If the specified
  /// traffic policy has more than <code>MaxItems</code> versions, the value of
  /// <code>IsTruncated</code> in the response is <code>true</code>, and the
  /// value of the <code>TrafficPolicyVersionMarker</code> element is the ID of
  /// the first version that Route 53 will return if you submit another request.
  ///
  /// Parameter [trafficPolicyVersionMarker] :
  /// For your first request to <code>ListTrafficPolicyVersions</code>, don't
  /// include the <code>TrafficPolicyVersionMarker</code> parameter.
  ///
  /// If you have more traffic policy versions than the value of
  /// <code>MaxItems</code>, <code>ListTrafficPolicyVersions</code> returns only
  /// the first group of <code>MaxItems</code> versions. To get more traffic
  /// policy versions, submit another <code>ListTrafficPolicyVersions</code>
  /// request. For the value of <code>TrafficPolicyVersionMarker</code>, specify
  /// the value of <code>TrafficPolicyVersionMarker</code> in the previous
  /// response.
  Future<ListTrafficPolicyVersionsResponse> listTrafficPolicyVersions({
    required String id,
    String? maxItems,
    String? trafficPolicyVersionMarker,
  }) async {
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxitems': [maxItems],
      if (trafficPolicyVersionMarker != null)
        'trafficpolicyversion': [trafficPolicyVersionMarker],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/trafficpolicies/${Uri.encodeComponent(id)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTrafficPolicyVersionsResponse.fromXml($result.body);
  }

  /// Gets a list of the VPCs that were created by other accounts and that can
  /// be associated with a specified hosted zone because you've submitted one or
  /// more <code>CreateVPCAssociationAuthorization</code> requests.
  ///
  /// The response includes a <code>VPCs</code> element with a <code>VPC</code>
  /// child element for each VPC that can be associated with the hosted zone.
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidInput].
  /// May throw [InvalidPaginationToken].
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the hosted zone for which you want a list of VPCs that can be
  /// associated with the hosted zone.
  ///
  /// Parameter [maxResults] :
  /// <i>Optional</i>: An integer that specifies the maximum number of VPCs that
  /// you want Amazon Route 53 to return. If you don't specify a value for
  /// <code>MaxResults</code>, Route 53 returns up to 50 VPCs per page.
  ///
  /// Parameter [nextToken] :
  /// <i>Optional</i>: If a response includes a <code>NextToken</code> element,
  /// there are more VPCs that can be associated with the specified hosted zone.
  /// To get the next page of results, submit another request, and include the
  /// value of <code>NextToken</code> from the response in the
  /// <code>nexttoken</code> parameter in another
  /// <code>ListVPCAssociationAuthorizations</code> request.
  Future<ListVPCAssociationAuthorizationsResponse>
      listVPCAssociationAuthorizations({
    required String hostedZoneId,
    String? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxresults': [maxResults],
      if (nextToken != null) 'nexttoken': [nextToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/2013-04-01/hostedzone/${Uri.encodeComponent(hostedZoneId)}/authorizevpcassociation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVPCAssociationAuthorizationsResponse.fromXml($result.body);
  }

  /// Gets the value that Amazon Route 53 returns in response to a DNS request
  /// for a specified record name and type. You can optionally specify the IP
  /// address of a DNS resolver, an EDNS0 client subnet IP address, and a subnet
  /// mask.
  ///
  /// This call only supports querying public hosted zones.
  /// <note>
  /// The <code>TestDnsAnswer </code> returns information similar to what you
  /// would expect from the answer section of the <code>dig</code> command.
  /// Therefore, if you query for the name servers of a subdomain that point to
  /// the parent name servers, those will not be returned.
  /// </note>
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidInput].
  ///
  /// Parameter [hostedZoneId] :
  /// The ID of the hosted zone that you want Amazon Route 53 to simulate a
  /// query for.
  ///
  /// Parameter [recordName] :
  /// The name of the resource record set that you want Amazon Route 53 to
  /// simulate a query for.
  ///
  /// Parameter [recordType] :
  /// The type of the resource record set.
  ///
  /// Parameter [eDNS0ClientSubnetIP] :
  /// If the resolver that you specified for resolverip supports EDNS0, specify
  /// the IPv4 or IPv6 address of a client in the applicable location, for
  /// example, <code>192.0.2.44</code> or
  /// <code>2001:db8:85a3::8a2e:370:7334</code>.
  ///
  /// Parameter [eDNS0ClientSubnetMask] :
  /// If you specify an IP address for <code>edns0clientsubnetip</code>, you can
  /// optionally specify the number of bits of the IP address that you want the
  /// checking tool to include in the DNS query. For example, if you specify
  /// <code>192.0.2.44</code> for <code>edns0clientsubnetip</code> and
  /// <code>24</code> for <code>edns0clientsubnetmask</code>, the checking tool
  /// will simulate a request from 192.0.2.0/24. The default value is 24 bits
  /// for IPv4 addresses and 64 bits for IPv6 addresses.
  ///
  /// The range of valid values depends on whether
  /// <code>edns0clientsubnetip</code> is an IPv4 or an IPv6 address:
  ///
  /// <ul>
  /// <li>
  /// <b>IPv4</b>: Specify a value between 0 and 32
  /// </li>
  /// <li>
  /// <b>IPv6</b>: Specify a value between 0 and 128
  /// </li>
  /// </ul>
  ///
  /// Parameter [resolverIP] :
  /// If you want to simulate a request from a specific DNS resolver, specify
  /// the IP address for that resolver. If you omit this value,
  /// <code>TestDnsAnswer</code> uses the IP address of a DNS resolver in the
  /// Amazon Web Services US East (N. Virginia) Region (<code>us-east-1</code>).
  Future<TestDNSAnswerResponse> testDNSAnswer({
    required String hostedZoneId,
    required String recordName,
    required RRType recordType,
    String? eDNS0ClientSubnetIP,
    String? eDNS0ClientSubnetMask,
    String? resolverIP,
  }) async {
    final $query = <String, List<String>>{
      'hostedzoneid': [hostedZoneId],
      'recordname': [recordName],
      'recordtype': [recordType.toValue()],
      if (eDNS0ClientSubnetIP != null)
        'edns0clientsubnetip': [eDNS0ClientSubnetIP],
      if (eDNS0ClientSubnetMask != null)
        'edns0clientsubnetmask': [eDNS0ClientSubnetMask],
      if (resolverIP != null) 'resolverip': [resolverIP],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/2013-04-01/testdnsanswer',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return TestDNSAnswerResponse.fromXml($result.body);
  }

  /// Updates an existing health check. Note that some values can't be updated.
  ///
  /// For more information about updating health checks, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/health-checks-creating-deleting.html">Creating,
  /// Updating, and Deleting Health Checks</a> in the <i>Amazon Route 53
  /// Developer Guide</i>.
  ///
  /// May throw [NoSuchHealthCheck].
  /// May throw [InvalidInput].
  /// May throw [HealthCheckVersionMismatch].
  ///
  /// Parameter [healthCheckId] :
  /// The ID for the health check for which you want detailed information. When
  /// you created the health check, <code>CreateHealthCheck</code> returned the
  /// ID in the response, in the <code>HealthCheckId</code> element.
  ///
  /// Parameter [alarmIdentifier] :
  /// A complex type that identifies the CloudWatch alarm that you want Amazon
  /// Route 53 health checkers to use to determine whether the specified health
  /// check is healthy.
  ///
  /// Parameter [childHealthChecks] :
  /// A complex type that contains one <code>ChildHealthCheck</code> element for
  /// each health check that you want to associate with a
  /// <code>CALCULATED</code> health check.
  ///
  /// Parameter [disabled] :
  /// Stops Route 53 from performing health checks. When you disable a health
  /// check, here's what happens:
  ///
  /// <ul>
  /// <li>
  /// <b>Health checks that check the health of endpoints:</b> Route 53 stops
  /// submitting requests to your application, server, or other resource.
  /// </li>
  /// <li>
  /// <b>Calculated health checks:</b> Route 53 stops aggregating the status of
  /// the referenced health checks.
  /// </li>
  /// <li>
  /// <b>Health checks that monitor CloudWatch alarms:</b> Route 53 stops
  /// monitoring the corresponding CloudWatch metrics.
  /// </li>
  /// </ul>
  /// After you disable a health check, Route 53 considers the status of the
  /// health check to always be healthy. If you configured DNS failover, Route
  /// 53 continues to route traffic to the corresponding resources. If you want
  /// to stop routing traffic to a resource, change the value of <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-Inverted">Inverted</a>.
  ///
  /// Charges for a health check still apply when the health check is disabled.
  /// For more information, see <a
  /// href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.
  ///
  /// Parameter [enableSNI] :
  /// Specify whether you want Amazon Route 53 to send the value of
  /// <code>FullyQualifiedDomainName</code> to the endpoint in the
  /// <code>client_hello</code> message during <code>TLS</code> negotiation.
  /// This allows the endpoint to respond to <code>HTTPS</code> health check
  /// requests with the applicable SSL/TLS certificate.
  ///
  /// Some endpoints require that HTTPS requests include the host name in the
  /// <code>client_hello</code> message. If you don't enable SNI, the status of
  /// the health check will be SSL alert <code>handshake_failure</code>. A
  /// health check can also have that status for other reasons. If SNI is
  /// enabled and you're still getting the error, check the SSL/TLS
  /// configuration on your endpoint and confirm that your certificate is valid.
  ///
  /// The SSL/TLS certificate on your endpoint includes a domain name in the
  /// <code>Common Name</code> field and possibly several more in the
  /// <code>Subject Alternative Names</code> field. One of the domain names in
  /// the certificate should match the value that you specify for
  /// <code>FullyQualifiedDomainName</code>. If the endpoint responds to the
  /// <code>client_hello</code> message with a certificate that does not include
  /// the domain name that you specified in
  /// <code>FullyQualifiedDomainName</code>, a health checker will retry the
  /// handshake. In the second attempt, the health checker will omit
  /// <code>FullyQualifiedDomainName</code> from the <code>client_hello</code>
  /// message.
  ///
  /// Parameter [failureThreshold] :
  /// The number of consecutive health checks that an endpoint must pass or fail
  /// for Amazon Route 53 to change the current status of the endpoint from
  /// unhealthy to healthy or vice versa. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html">How
  /// Amazon Route 53 Determines Whether an Endpoint Is Healthy</a> in the
  /// <i>Amazon Route 53 Developer Guide</i>.
  ///
  /// If you don't specify a value for <code>FailureThreshold</code>, the
  /// default value is three health checks.
  ///
  /// Parameter [fullyQualifiedDomainName] :
  /// Amazon Route 53 behavior depends on whether you specify a value for
  /// <code>IPAddress</code>.
  /// <note>
  /// If a health check already has a value for <code>IPAddress</code>, you can
  /// change the value. However, you can't update an existing health check to
  /// add or remove the value of <code>IPAddress</code>.
  /// </note>
  /// <b>If you specify a value for</b> <code>IPAddress</code>:
  ///
  /// Route 53 sends health check requests to the specified IPv4 or IPv6 address
  /// and passes the value of <code>FullyQualifiedDomainName</code> in the
  /// <code>Host</code> header for all health checks except TCP health checks.
  /// This is typically the fully qualified DNS name of the endpoint on which
  /// you want Route 53 to perform health checks.
  ///
  /// When Route 53 checks the health of an endpoint, here is how it constructs
  /// the <code>Host</code> header:
  ///
  /// <ul>
  /// <li>
  /// If you specify a value of <code>80</code> for <code>Port</code> and
  /// <code>HTTP</code> or <code>HTTP_STR_MATCH</code> for <code>Type</code>,
  /// Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the
  /// endpoint in the <code>Host</code> header.
  /// </li>
  /// <li>
  /// If you specify a value of <code>443</code> for <code>Port</code> and
  /// <code>HTTPS</code> or <code>HTTPS_STR_MATCH</code> for <code>Type</code>,
  /// Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the
  /// endpoint in the <code>Host</code> header.
  /// </li>
  /// <li>
  /// If you specify another value for <code>Port</code> and any value except
  /// <code>TCP</code> for <code>Type</code>, Route 53 passes <i>
  /// <code>FullyQualifiedDomainName</code>:<code>Port</code> </i> to the
  /// endpoint in the <code>Host</code> header.
  /// </li>
  /// </ul>
  /// If you don't specify a value for <code>FullyQualifiedDomainName</code>,
  /// Route 53 substitutes the value of <code>IPAddress</code> in the
  /// <code>Host</code> header in each of the above cases.
  ///
  /// <b>If you don't specify a value for</b> <code>IPAddress</code>:
  ///
  /// If you don't specify a value for <code>IPAddress</code>, Route 53 sends a
  /// DNS request to the domain that you specify in
  /// <code>FullyQualifiedDomainName</code> at the interval you specify in
  /// <code>RequestInterval</code>. Using an IPv4 address that is returned by
  /// DNS, Route 53 then checks the health of the endpoint.
  ///
  /// If you don't specify a value for <code>IPAddress</code>, you can’t update
  /// the health check to remove the <code>FullyQualifiedDomainName</code>; if
  /// you don’t specify a value for <code>IPAddress</code> on creation, a
  /// <code>FullyQualifiedDomainName</code> is required.
  /// <note>
  /// If you don't specify a value for <code>IPAddress</code>, Route 53 uses
  /// only IPv4 to send health checks to the endpoint. If there's no resource
  /// record set with a type of A for the name that you specify for
  /// <code>FullyQualifiedDomainName</code>, the health check fails with a "DNS
  /// resolution failed" error.
  /// </note>
  /// If you want to check the health of weighted, latency, or failover resource
  /// record sets and you choose to specify the endpoint only by
  /// <code>FullyQualifiedDomainName</code>, we recommend that you create a
  /// separate health check for each endpoint. For example, create a health
  /// check for each HTTP server that is serving content for www.example.com.
  /// For the value of <code>FullyQualifiedDomainName</code>, specify the domain
  /// name of the server (such as <code>us-east-2-www.example.com</code>), not
  /// the name of the resource record sets (www.example.com).
  /// <important>
  /// In this configuration, if the value of
  /// <code>FullyQualifiedDomainName</code> matches the name of the resource
  /// record sets and you then associate the health check with those resource
  /// record sets, health check results will be unpredictable.
  /// </important>
  /// In addition, if the value of <code>Type</code> is <code>HTTP</code>,
  /// <code>HTTPS</code>, <code>HTTP_STR_MATCH</code>, or
  /// <code>HTTPS_STR_MATCH</code>, Route 53 passes the value of
  /// <code>FullyQualifiedDomainName</code> in the <code>Host</code> header, as
  /// it does when you specify a value for <code>IPAddress</code>. If the value
  /// of <code>Type</code> is <code>TCP</code>, Route 53 doesn't pass a
  /// <code>Host</code> header.
  ///
  /// Parameter [healthCheckVersion] :
  /// A sequential counter that Amazon Route 53 sets to <code>1</code> when you
  /// create a health check and increments by 1 each time you update settings
  /// for the health check.
  ///
  /// We recommend that you use <code>GetHealthCheck</code> or
  /// <code>ListHealthChecks</code> to get the current value of
  /// <code>HealthCheckVersion</code> for the health check that you want to
  /// update, and that you include that value in your
  /// <code>UpdateHealthCheck</code> request. This prevents Route 53 from
  /// overwriting an intervening update:
  ///
  /// <ul>
  /// <li>
  /// If the value in the <code>UpdateHealthCheck</code> request matches the
  /// value of <code>HealthCheckVersion</code> in the health check, Route 53
  /// updates the health check with the new settings.
  /// </li>
  /// <li>
  /// If the value of <code>HealthCheckVersion</code> in the health check is
  /// greater, the health check was changed after you got the version number.
  /// Route 53 does not update the health check, and it returns a
  /// <code>HealthCheckVersionMismatch</code> error.
  /// </li>
  /// </ul>
  ///
  /// Parameter [healthThreshold] :
  /// The number of child health checks that are associated with a
  /// <code>CALCULATED</code> health that Amazon Route 53 must consider healthy
  /// for the <code>CALCULATED</code> health check to be considered healthy. To
  /// specify the child health checks that you want to associate with a
  /// <code>CALCULATED</code> health check, use the
  /// <code>ChildHealthChecks</code> and <code>ChildHealthCheck</code> elements.
  ///
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// If you specify a number greater than the number of child health checks,
  /// Route 53 always considers this health check to be unhealthy.
  /// </li>
  /// <li>
  /// If you specify <code>0</code>, Route 53 always considers this health check
  /// to be healthy.
  /// </li>
  /// </ul>
  ///
  /// Parameter [iPAddress] :
  /// The IPv4 or IPv6 IP address for the endpoint that you want Amazon Route 53
  /// to perform health checks on. If you don't specify a value for
  /// <code>IPAddress</code>, Route 53 sends a DNS request to resolve the domain
  /// name that you specify in <code>FullyQualifiedDomainName</code> at the
  /// interval that you specify in <code>RequestInterval</code>. Using an IP
  /// address that is returned by DNS, Route 53 then checks the health of the
  /// endpoint.
  ///
  /// Use one of the following formats for the value of <code>IPAddress</code>:
  ///
  /// <ul>
  /// <li>
  /// <b>IPv4 address</b>: four values between 0 and 255, separated by periods
  /// (.), for example, <code>192.0.2.44</code>.
  /// </li>
  /// <li>
  /// <b>IPv6 address</b>: eight groups of four hexadecimal values, separated by
  /// colons (:), for example,
  /// <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>. You can also shorten
  /// IPv6 addresses as described in RFC 5952, for example,
  /// <code>2001:db8:85a3::abcd:1:2345</code>.
  /// </li>
  /// </ul>
  /// If the endpoint is an EC2 instance, we recommend that you create an
  /// Elastic IP address, associate it with your EC2 instance, and specify the
  /// Elastic IP address for <code>IPAddress</code>. This ensures that the IP
  /// address of your instance never changes. For more information, see the
  /// applicable documentation:
  ///
  /// <ul>
  /// <li>
  /// Linux: <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic
  /// IP Addresses (EIP)</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i>
  /// </li>
  /// <li>
  /// Windows: <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/elastic-ip-addresses-eip.html">Elastic
  /// IP Addresses (EIP)</a> in the <i>Amazon EC2 User Guide for Windows
  /// Instances</i>
  /// </li>
  /// </ul> <note>
  /// If a health check already has a value for <code>IPAddress</code>, you can
  /// change the value. However, you can't update an existing health check to
  /// add or remove the value of <code>IPAddress</code>.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-FullyQualifiedDomainName">FullyQualifiedDomainName</a>.
  ///
  /// Constraints: Route 53 can't check the health of endpoints for which the IP
  /// address is in local, private, non-routable, or multicast ranges. For more
  /// information about IP addresses for which you can't create health checks,
  /// see the following documents:
  ///
  /// <ul>
  /// <li>
  /// <a href="https://tools.ietf.org/html/rfc5735">RFC 5735, Special Use IPv4
  /// Addresses</a>
  /// </li>
  /// <li>
  /// <a href="https://tools.ietf.org/html/rfc6598">RFC 6598, IANA-Reserved IPv4
  /// Prefix for Shared Address Space</a>
  /// </li>
  /// <li>
  /// <a href="https://tools.ietf.org/html/rfc5156">RFC 5156, Special-Use IPv6
  /// Addresses</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [insufficientDataHealthStatus] :
  /// When CloudWatch has insufficient data about the metric to determine the
  /// alarm state, the status that you want Amazon Route 53 to assign to the
  /// health check:
  ///
  /// <ul>
  /// <li>
  /// <code>Healthy</code>: Route 53 considers the health check to be healthy.
  /// </li>
  /// <li>
  /// <code>Unhealthy</code>: Route 53 considers the health check to be
  /// unhealthy.
  /// </li>
  /// <li>
  /// <code>LastKnownStatus</code>: By default, Route 53 uses the status of the
  /// health check from the last time CloudWatch had sufficient data to
  /// determine the alarm state. For new health checks that have no last known
  /// status, the status for the health check is healthy.
  /// </li>
  /// </ul>
  ///
  /// Parameter [inverted] :
  /// Specify whether you want Amazon Route 53 to invert the status of a health
  /// check, for example, to consider a health check unhealthy when it otherwise
  /// would be considered healthy.
  ///
  /// Parameter [port] :
  /// The port on the endpoint that you want Amazon Route 53 to perform health
  /// checks on.
  /// <note>
  /// Don't specify a value for <code>Port</code> when you specify a value for
  /// <code>Type</code> of <code>CLOUDWATCH_METRIC</code> or
  /// <code>CALCULATED</code>.
  /// </note>
  ///
  /// Parameter [regions] :
  /// A complex type that contains one <code>Region</code> element for each
  /// region that you want Amazon Route 53 health checkers to check the
  /// specified endpoint from.
  ///
  /// Parameter [resetElements] :
  /// A complex type that contains one <code>ResettableElementName</code>
  /// element for each element that you want to reset to the default value.
  /// Valid values for <code>ResettableElementName</code> include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ChildHealthChecks</code>: Amazon Route 53 resets <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-ChildHealthChecks">ChildHealthChecks</a>
  /// to null.
  /// </li>
  /// <li>
  /// <code>FullyQualifiedDomainName</code>: Route 53 resets <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-FullyQualifiedDomainName">FullyQualifiedDomainName</a>.
  /// to null.
  /// </li>
  /// <li>
  /// <code>Regions</code>: Route 53 resets the <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-Regions">Regions</a>
  /// list to the default set of regions.
  /// </li>
  /// <li>
  /// <code>ResourcePath</code>: Route 53 resets <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-ResourcePath">ResourcePath</a>
  /// to null.
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourcePath] :
  /// The path that you want Amazon Route 53 to request when performing health
  /// checks. The path can be any value for which your endpoint will return an
  /// HTTP status code of 2xx or 3xx when the endpoint is healthy, for example
  /// the file /docs/route53-health-check.html. You can also include query
  /// string parameters, for example,
  /// <code>/welcome.html?language=jp&amp;login=y</code>.
  ///
  /// Specify this value only if you want to change it.
  ///
  /// Parameter [searchString] :
  /// If the value of <code>Type</code> is <code>HTTP_STR_MATCH</code> or
  /// <code>HTTPS_STR_MATCH</code>, the string that you want Amazon Route 53 to
  /// search for in the response body from the specified resource. If the string
  /// appears in the response body, Route 53 considers the resource healthy.
  /// (You can't change the value of <code>Type</code> when you update a health
  /// check.)
  Future<UpdateHealthCheckResponse> updateHealthCheck({
    required String healthCheckId,
    AlarmIdentifier? alarmIdentifier,
    List<String>? childHealthChecks,
    bool? disabled,
    bool? enableSNI,
    int? failureThreshold,
    String? fullyQualifiedDomainName,
    int? healthCheckVersion,
    int? healthThreshold,
    String? iPAddress,
    InsufficientDataHealthStatus? insufficientDataHealthStatus,
    bool? inverted,
    int? port,
    List<HealthCheckRegion>? regions,
    List<ResettableElementName>? resetElements,
    String? resourcePath,
    String? searchString,
  }) async {
    _s.validateNumRange(
      'failureThreshold',
      failureThreshold,
      1,
      10,
    );
    _s.validateNumRange(
      'healthCheckVersion',
      healthCheckVersion,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'healthThreshold',
      healthThreshold,
      0,
      256,
    );
    _s.validateNumRange(
      'port',
      port,
      1,
      65535,
    );
    final $result = await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/healthcheck/${Uri.encodeComponent(healthCheckId)}',
      payload: UpdateHealthCheckRequest(
              healthCheckId: healthCheckId,
              alarmIdentifier: alarmIdentifier,
              childHealthChecks: childHealthChecks,
              disabled: disabled,
              enableSNI: enableSNI,
              failureThreshold: failureThreshold,
              fullyQualifiedDomainName: fullyQualifiedDomainName,
              healthCheckVersion: healthCheckVersion,
              healthThreshold: healthThreshold,
              iPAddress: iPAddress,
              insufficientDataHealthStatus: insufficientDataHealthStatus,
              inverted: inverted,
              port: port,
              regions: regions,
              resetElements: resetElements,
              resourcePath: resourcePath,
              searchString: searchString)
          .toXml(
        'UpdateHealthCheckRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return UpdateHealthCheckResponse.fromXml($result.body);
  }

  /// Updates the comment for a specified hosted zone.
  ///
  /// May throw [NoSuchHostedZone].
  /// May throw [InvalidInput].
  /// May throw [PriorRequestNotComplete].
  ///
  /// Parameter [id] :
  /// The ID for the hosted zone that you want to update the comment for.
  ///
  /// Parameter [comment] :
  /// The new comment for the hosted zone. If you don't specify a value for
  /// <code>Comment</code>, Amazon Route 53 deletes the existing value of the
  /// <code>Comment</code> element, if any.
  Future<UpdateHostedZoneCommentResponse> updateHostedZoneComment({
    required String id,
    String? comment,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/2013-04-01/hostedzone/${Uri.encodeComponent(id)}',
      payload: UpdateHostedZoneCommentRequest(id: id, comment: comment).toXml(
        'UpdateHostedZoneCommentRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return UpdateHostedZoneCommentResponse.fromXml($result.body);
  }

  /// Updates the comment for a specified traffic policy version.
  ///
  /// May throw [InvalidInput].
  /// May throw [NoSuchTrafficPolicy].
  /// May throw [ConcurrentModification].
  ///
  /// Parameter [comment] :
  /// The new comment for the specified traffic policy and version.
  ///
  /// Parameter [id] :
  /// The value of <code>Id</code> for the traffic policy that you want to
  /// update the comment for.
  ///
  /// Parameter [version] :
  /// The value of <code>Version</code> for the traffic policy that you want to
  /// update the comment for.
  Future<UpdateTrafficPolicyCommentResponse> updateTrafficPolicyComment({
    required String comment,
    required String id,
    required int version,
  }) async {
    _s.validateNumRange(
      'version',
      version,
      1,
      1000,
      isRequired: true,
    );
    final $result = await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/trafficpolicy/${Uri.encodeComponent(id)}/${Uri.encodeComponent(version.toString())}',
      payload: UpdateTrafficPolicyCommentRequest(
              comment: comment, id: id, version: version)
          .toXml(
        'UpdateTrafficPolicyCommentRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTrafficPolicyCommentResponse.fromXml($result.body);
  }

  /// <note>
  /// After you submit a <code>UpdateTrafficPolicyInstance</code> request,
  /// there's a brief delay while Route 53 creates the resource record sets that
  /// are specified in the traffic policy definition. Use
  /// <code>GetTrafficPolicyInstance</code> with the <code>id</code> of updated
  /// traffic policy instance confirm that the
  /// <code>UpdateTrafficPolicyInstance</code> request completed successfully.
  /// For more information, see the <code>State</code> response element.
  /// </note>
  /// Updates the resource record sets in a specified hosted zone that were
  /// created based on the settings in a specified traffic policy version.
  ///
  /// When you update a traffic policy instance, Amazon Route 53 continues to
  /// respond to DNS queries for the root resource record set name (such as
  /// example.com) while it replaces one group of resource record sets with
  /// another. Route 53 performs the following operations:
  /// <ol>
  /// <li>
  /// Route 53 creates a new group of resource record sets based on the
  /// specified traffic policy. This is true regardless of how significant the
  /// differences are between the existing resource record sets and the new
  /// resource record sets.
  /// </li>
  /// <li>
  /// When all of the new resource record sets have been created, Route 53
  /// starts to respond to DNS queries for the root resource record set name
  /// (such as example.com) by using the new resource record sets.
  /// </li>
  /// <li>
  /// Route 53 deletes the old group of resource record sets that are associated
  /// with the root resource record set name.
  /// </li> </ol>
  ///
  /// May throw [InvalidInput].
  /// May throw [NoSuchTrafficPolicy].
  /// May throw [NoSuchTrafficPolicyInstance].
  /// May throw [PriorRequestNotComplete].
  /// May throw [ConflictingTypes].
  ///
  /// Parameter [id] :
  /// The ID of the traffic policy instance that you want to update.
  ///
  /// Parameter [ttl] :
  /// The TTL that you want Amazon Route 53 to assign to all of the updated
  /// resource record sets.
  ///
  /// Parameter [trafficPolicyId] :
  /// The ID of the traffic policy that you want Amazon Route 53 to use to
  /// update resource record sets for the specified traffic policy instance.
  ///
  /// Parameter [trafficPolicyVersion] :
  /// The version of the traffic policy that you want Amazon Route 53 to use to
  /// update resource record sets for the specified traffic policy instance.
  Future<UpdateTrafficPolicyInstanceResponse> updateTrafficPolicyInstance({
    required String id,
    required int ttl,
    required String trafficPolicyId,
    required int trafficPolicyVersion,
  }) async {
    _s.validateNumRange(
      'ttl',
      ttl,
      0,
      2147483647,
      isRequired: true,
    );
    _s.validateNumRange(
      'trafficPolicyVersion',
      trafficPolicyVersion,
      1,
      1000,
      isRequired: true,
    );
    final $result = await _protocol.send(
      method: 'POST',
      requestUri:
          '/2013-04-01/trafficpolicyinstance/${Uri.encodeComponent(id)}',
      payload: UpdateTrafficPolicyInstanceRequest(
              id: id,
              ttl: ttl,
              trafficPolicyId: trafficPolicyId,
              trafficPolicyVersion: trafficPolicyVersion)
          .toXml(
        'UpdateTrafficPolicyInstanceRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'https://route53.amazonaws.com/doc/2013-04-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTrafficPolicyInstanceResponse.fromXml($result.body);
  }
}

/// A complex type that contains the type of limit that you specified in the
/// request and the current value for that limit.
class AccountLimit {
  /// The limit that you requested. Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>MAX_HEALTH_CHECKS_BY_OWNER</b>: The maximum number of health checks that
  /// you can create using the current account.
  /// </li>
  /// <li>
  /// <b>MAX_HOSTED_ZONES_BY_OWNER</b>: The maximum number of hosted zones that
  /// you can create using the current account.
  /// </li>
  /// <li>
  /// <b>MAX_REUSABLE_DELEGATION_SETS_BY_OWNER</b>: The maximum number of reusable
  /// delegation sets that you can create using the current account.
  /// </li>
  /// <li>
  /// <b>MAX_TRAFFIC_POLICIES_BY_OWNER</b>: The maximum number of traffic policies
  /// that you can create using the current account.
  /// </li>
  /// <li>
  /// <b>MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER</b>: The maximum number of traffic
  /// policy instances that you can create using the current account. (Traffic
  /// policy instances are referred to as traffic flow policy records in the
  /// Amazon Route 53 console.)
  /// </li>
  /// </ul>
  final AccountLimitType type;

  /// The current value for the limit that is specified by <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_AccountLimit.html#Route53-Type-AccountLimit-Type">Type</a>.
  final int value;

  AccountLimit({
    required this.type,
    required this.value,
  });
  factory AccountLimit.fromXml(_s.XmlElement elem) {
    return AccountLimit(
      type: _s.extractXmlStringValue(elem, 'Type')!.toAccountLimitType(),
      value: _s.extractXmlIntValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.toValue(),
      'Value': value,
    };
  }
}

enum AccountLimitType {
  maxHealthChecksByOwner,
  maxHostedZonesByOwner,
  maxTrafficPolicyInstancesByOwner,
  maxReusableDelegationSetsByOwner,
  maxTrafficPoliciesByOwner,
}

extension AccountLimitTypeValueExtension on AccountLimitType {
  String toValue() {
    switch (this) {
      case AccountLimitType.maxHealthChecksByOwner:
        return 'MAX_HEALTH_CHECKS_BY_OWNER';
      case AccountLimitType.maxHostedZonesByOwner:
        return 'MAX_HOSTED_ZONES_BY_OWNER';
      case AccountLimitType.maxTrafficPolicyInstancesByOwner:
        return 'MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER';
      case AccountLimitType.maxReusableDelegationSetsByOwner:
        return 'MAX_REUSABLE_DELEGATION_SETS_BY_OWNER';
      case AccountLimitType.maxTrafficPoliciesByOwner:
        return 'MAX_TRAFFIC_POLICIES_BY_OWNER';
    }
  }
}

extension AccountLimitTypeFromString on String {
  AccountLimitType toAccountLimitType() {
    switch (this) {
      case 'MAX_HEALTH_CHECKS_BY_OWNER':
        return AccountLimitType.maxHealthChecksByOwner;
      case 'MAX_HOSTED_ZONES_BY_OWNER':
        return AccountLimitType.maxHostedZonesByOwner;
      case 'MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER':
        return AccountLimitType.maxTrafficPolicyInstancesByOwner;
      case 'MAX_REUSABLE_DELEGATION_SETS_BY_OWNER':
        return AccountLimitType.maxReusableDelegationSetsByOwner;
      case 'MAX_TRAFFIC_POLICIES_BY_OWNER':
        return AccountLimitType.maxTrafficPoliciesByOwner;
    }
    throw Exception('$this is not known in enum AccountLimitType');
  }
}

class ActivateKeySigningKeyResponse {
  final ChangeInfo changeInfo;

  ActivateKeySigningKeyResponse({
    required this.changeInfo,
  });
  factory ActivateKeySigningKeyResponse.fromXml(_s.XmlElement elem) {
    return ActivateKeySigningKeyResponse(
      changeInfo: ChangeInfo.fromXml(_s.extractXmlChild(elem, 'ChangeInfo')!),
    );
  }

  Map<String, dynamic> toJson() {
    final changeInfo = this.changeInfo;
    return {
      'ChangeInfo': changeInfo,
    };
  }
}

/// A complex type that identifies the CloudWatch alarm that you want Amazon
/// Route 53 health checkers to use to determine whether the specified health
/// check is healthy.
class AlarmIdentifier {
  /// The name of the CloudWatch alarm that you want Amazon Route 53 health
  /// checkers to use to determine whether this health check is healthy.
  /// <note>
  /// Route 53 supports CloudWatch alarms with the following features:
  ///
  /// <ul>
  /// <li>
  /// Standard-resolution metrics. High-resolution metrics aren't supported. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/publishingMetrics.html#high-resolution-metrics">High-Resolution
  /// Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.
  /// </li>
  /// <li>
  /// Statistics: Average, Minimum, Maximum, Sum, and SampleCount. Extended
  /// statistics aren't supported.
  /// </li>
  /// </ul> </note>
  final String name;

  /// For the CloudWatch alarm that you want Route 53 health checkers to use to
  /// determine whether this health check is healthy, the region that the alarm
  /// was created in.
  ///
  /// For the current list of CloudWatch regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/cw_region.html">Amazon
  /// CloudWatch endpoints and quotas</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final CloudWatchRegion region;

  AlarmIdentifier({
    required this.name,
    required this.region,
  });
  factory AlarmIdentifier.fromXml(_s.XmlElement elem) {
    return AlarmIdentifier(
      name: _s.extractXmlStringValue(elem, 'Name')!,
      region: _s.extractXmlStringValue(elem, 'Region')!.toCloudWatchRegion(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final region = this.region;
    return {
      'Name': name,
      'Region': region.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final name = this.name;
    final region = this.region;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Region', region.toValue()),
      _s.encodeXmlStringValue('Name', name),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// <i>Alias resource record sets only:</i> Information about the Amazon Web
/// Services resource, such as a CloudFront distribution or an Amazon S3 bucket,
/// that you want to route traffic to.
///
/// When creating resource record sets for a private hosted zone, note the
/// following:
///
/// <ul>
/// <li>
/// For information about creating failover resource record sets in a private
/// hosted zone, see <a
/// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-private-hosted-zones.html">Configuring
/// Failover in a Private Hosted Zone</a>.
/// </li>
/// </ul>
class AliasTarget {
  /// <i>Alias resource record sets only:</i> The value that you specify depends
  /// on where you want to route queries:
  /// <dl> <dt>Amazon API Gateway custom regional APIs and edge-optimized
  /// APIs</dt> <dd>
  /// Specify the applicable domain name for your API. You can get the applicable
  /// value using the CLI command <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-domain-names.html">get-domain-names</a>:
  ///
  /// <ul>
  /// <li>
  /// For regional APIs, specify the value of <code>regionalDomainName</code>.
  /// </li>
  /// <li>
  /// For edge-optimized APIs, specify the value of
  /// <code>distributionDomainName</code>. This is the name of the associated
  /// CloudFront distribution, such as <code>da1b2c3d4e5.cloudfront.net</code>.
  /// </li>
  /// </ul> <note>
  /// The name of the record that you're creating must match a custom domain name
  /// for your API, such as <code>api.example.com</code>.
  /// </note> </dd> <dt>Amazon Virtual Private Cloud interface VPC endpoint</dt>
  /// <dd>
  /// Enter the API endpoint for the interface endpoint, such as
  /// <code>vpce-123456789abcdef01-example-us-east-1a.elasticloadbalancing.us-east-1.vpce.amazonaws.com</code>.
  /// For edge-optimized APIs, this is the domain name for the corresponding
  /// CloudFront distribution. You can get the value of <code>DnsName</code> using
  /// the CLI command <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-vpc-endpoints.html">describe-vpc-endpoints</a>.
  /// </dd> <dt>CloudFront distribution</dt> <dd>
  /// Specify the domain name that CloudFront assigned when you created your
  /// distribution.
  ///
  /// Your CloudFront distribution must include an alternate domain name that
  /// matches the name of the resource record set. For example, if the name of the
  /// resource record set is <i>acme.example.com</i>, your CloudFront distribution
  /// must include <i>acme.example.com</i> as one of the alternate domain names.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/CNAMEs.html">Using
  /// Alternate Domain Names (CNAMEs)</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  ///
  /// You can't create a resource record set in a private hosted zone to route
  /// traffic to a CloudFront distribution.
  /// <note>
  /// For failover alias records, you can't specify a CloudFront distribution for
  /// both the primary and secondary records. A distribution must include an
  /// alternate domain name that matches the name of the record. However, the
  /// primary and secondary records have the same name, and you can't include the
  /// same alternate domain name in more than one distribution.
  /// </note> </dd> <dt>Elastic Beanstalk environment</dt> <dd>
  /// If the domain name for your Elastic Beanstalk environment includes the
  /// region that you deployed the environment in, you can create an alias record
  /// that routes traffic to the environment. For example, the domain name
  /// <code>my-environment.<i>us-west-2</i>.elasticbeanstalk.com</code> is a
  /// regionalized domain name.
  /// <important>
  /// For environments that were created before early 2016, the domain name
  /// doesn't include the region. To route traffic to these environments, you must
  /// create a CNAME record instead of an alias record. Note that you can't create
  /// a CNAME record for the root domain name. For example, if your domain name is
  /// example.com, you can create a record that routes traffic for
  /// acme.example.com to your Elastic Beanstalk environment, but you can't create
  /// a record that routes traffic for example.com to your Elastic Beanstalk
  /// environment.
  /// </important>
  /// For Elastic Beanstalk environments that have regionalized subdomains,
  /// specify the <code>CNAME</code> attribute for the environment. You can use
  /// the following methods to get the value of the CNAME attribute:
  ///
  /// <ul>
  /// <li>
  /// <i>Amazon Web Services Management Console</i>: For information about how to
  /// get the value by using the console, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/customdomains.html">Using
  /// Custom Domains with Elastic Beanstalk</a> in the <i>Elastic Beanstalk
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// <i>Elastic Beanstalk API</i>: Use the <code>DescribeEnvironments</code>
  /// action to get the value of the <code>CNAME</code> attribute. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/api/API_DescribeEnvironments.html">DescribeEnvironments</a>
  /// in the <i>Elastic Beanstalk API Reference</i>.
  /// </li>
  /// <li>
  /// <i>CLI</i>: Use the <code>describe-environments</code> command to get the
  /// value of the <code>CNAME</code> attribute. For more information, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/elasticbeanstalk/describe-environments.html">describe-environments</a>
  /// in the <i>CLI Command Reference</i>.
  /// </li>
  /// </ul> </dd> <dt>ELB load balancer</dt> <dd>
  /// Specify the DNS name that is associated with the load balancer. Get the DNS
  /// name by using the Amazon Web Services Management Console, the ELB API, or
  /// the CLI.
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon Web Services Management Console</b>: Go to the EC2 page, choose
  /// <b>Load Balancers</b> in the navigation pane, choose the load balancer,
  /// choose the <b>Description</b> tab, and get the value of the <b>DNS name</b>
  /// field.
  ///
  /// If you're routing traffic to a Classic Load Balancer, get the value that
  /// begins with <b>dualstack</b>. If you're routing traffic to another type of
  /// load balancer, get the value that applies to the record type, A or AAAA.
  /// </li>
  /// <li>
  /// <b>Elastic Load Balancing API</b>: Use <code>DescribeLoadBalancers</code> to
  /// get the value of <code>DNSName</code>. For more information, see the
  /// applicable guide:
  ///
  /// <ul>
  /// <li>
  /// Classic Load Balancers: <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/2012-06-01/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a>
  /// </li>
  /// <li>
  /// Application and Network Load Balancers: <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>CLI</b>: Use <code>describe-load-balancers</code> to get the value of
  /// <code>DNSName</code>. For more information, see the applicable guide:
  ///
  /// <ul>
  /// <li>
  /// Classic Load Balancers: <a
  /// href="http://docs.aws.amazon.com/cli/latest/reference/elb/describe-load-balancers.html">describe-load-balancers</a>
  /// </li>
  /// <li>
  /// Application and Network Load Balancers: <a
  /// href="http://docs.aws.amazon.com/cli/latest/reference/elbv2/describe-load-balancers.html">describe-load-balancers</a>
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>Global Accelerator accelerator</dt> <dd>
  /// Specify the DNS name for your accelerator:
  ///
  /// <ul>
  /// <li>
  /// <b>Global Accelerator API:</b> To get the DNS name, use <a
  /// href="https://docs.aws.amazon.com/global-accelerator/latest/api/API_DescribeAccelerator.html">DescribeAccelerator</a>.
  /// </li>
  /// <li>
  /// <b>CLI:</b> To get the DNS name, use <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/globalaccelerator/describe-accelerator.html">describe-accelerator</a>.
  /// </li>
  /// </ul> </dd> <dt>Amazon S3 bucket that is configured as a static website</dt>
  /// <dd>
  /// Specify the domain name of the Amazon S3 website endpoint that you created
  /// the bucket in, for example, <code>s3-website.us-east-2.amazonaws.com</code>.
  /// For more information about valid values, see the table <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/s3.html#s3_website_region_endpoints">Amazon
  /// S3 Website Endpoints</a> in the <i>Amazon Web Services General
  /// Reference</i>. For more information about using S3 buckets for websites, see
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/getting-started.html">Getting
  /// Started with Amazon Route 53</a> in the <i>Amazon Route 53 Developer
  /// Guide.</i>
  /// </dd> <dt>Another Route 53 resource record set</dt> <dd>
  /// Specify the value of the <code>Name</code> element for a resource record set
  /// in the current hosted zone.
  /// <note>
  /// If you're creating an alias record that has the same name as the hosted zone
  /// (known as the zone apex), you can't specify the domain name for a record for
  /// which the value of <code>Type</code> is <code>CNAME</code>. This is because
  /// the alias record must have the same type as the record that you're routing
  /// traffic to, and creating a CNAME record for the zone apex isn't supported
  /// even for an alias record.
  /// </note> </dd> </dl>
  final String dNSName;

  /// <i>Applies only to alias, failover alias, geolocation alias, latency alias,
  /// and weighted alias resource record sets:</i> When
  /// <code>EvaluateTargetHealth</code> is <code>true</code>, an alias resource
  /// record set inherits the health of the referenced Amazon Web Services
  /// resource, such as an ELB load balancer or another resource record set in the
  /// hosted zone.
  ///
  /// Note the following:
  /// <dl> <dt>CloudFront distributions</dt> <dd>
  /// You can't set <code>EvaluateTargetHealth</code> to <code>true</code> when
  /// the alias target is a CloudFront distribution.
  /// </dd> <dt>Elastic Beanstalk environments that have regionalized
  /// subdomains</dt> <dd>
  /// If you specify an Elastic Beanstalk environment in <code>DNSName</code> and
  /// the environment contains an ELB load balancer, Elastic Load Balancing routes
  /// queries only to the healthy Amazon EC2 instances that are registered with
  /// the load balancer. (An environment automatically contains an ELB load
  /// balancer if it includes more than one Amazon EC2 instance.) If you set
  /// <code>EvaluateTargetHealth</code> to <code>true</code> and either no Amazon
  /// EC2 instances are healthy or the load balancer itself is unhealthy, Route 53
  /// routes queries to other available resources that are healthy, if any.
  ///
  /// If the environment contains a single Amazon EC2 instance, there are no
  /// special requirements.
  /// </dd> <dt>ELB load balancers</dt> <dd>
  /// Health checking behavior depends on the type of load balancer:
  ///
  /// <ul>
  /// <li>
  /// <b>Classic Load Balancers</b>: If you specify an ELB Classic Load Balancer
  /// in <code>DNSName</code>, Elastic Load Balancing routes queries only to the
  /// healthy Amazon EC2 instances that are registered with the load balancer. If
  /// you set <code>EvaluateTargetHealth</code> to <code>true</code> and either no
  /// EC2 instances are healthy or the load balancer itself is unhealthy, Route 53
  /// routes queries to other resources.
  /// </li>
  /// <li>
  /// <b>Application and Network Load Balancers</b>: If you specify an ELB
  /// Application or Network Load Balancer and you set
  /// <code>EvaluateTargetHealth</code> to <code>true</code>, Route 53 routes
  /// queries to the load balancer based on the health of the target groups that
  /// are associated with the load balancer:
  ///
  /// <ul>
  /// <li>
  /// For an Application or Network Load Balancer to be considered healthy, every
  /// target group that contains targets must contain at least one healthy target.
  /// If any target group contains only unhealthy targets, the load balancer is
  /// considered unhealthy, and Route 53 routes queries to other resources.
  /// </li>
  /// <li>
  /// A target group that has no registered targets is considered unhealthy.
  /// </li>
  /// </ul> </li>
  /// </ul> <note>
  /// When you create a load balancer, you configure settings for Elastic Load
  /// Balancing health checks; they're not Route 53 health checks, but they
  /// perform a similar function. Do not create Route 53 health checks for the EC2
  /// instances that you register with an ELB load balancer.
  /// </note> </dd> <dt>S3 buckets</dt> <dd>
  /// There are no special requirements for setting
  /// <code>EvaluateTargetHealth</code> to <code>true</code> when the alias target
  /// is an S3 bucket.
  /// </dd> <dt>Other records in the same hosted zone</dt> <dd>
  /// If the Amazon Web Services resource that you specify in <code>DNSName</code>
  /// is a record or a group of records (for example, a group of weighted records)
  /// but is not another alias record, we recommend that you associate a health
  /// check with all of the records in the alias target. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-complex-configs.html#dns-failover-complex-configs-hc-omitting">What
  /// Happens When You Omit Health Checks?</a> in the <i>Amazon Route 53 Developer
  /// Guide</i>.
  /// </dd> </dl>
  /// For more information and examples, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover.html">Amazon
  /// Route 53 Health Checks and DNS Failover</a> in the <i>Amazon Route 53
  /// Developer Guide</i>.
  final bool evaluateTargetHealth;

  /// <i>Alias resource records sets only</i>: The value used depends on where you
  /// want to route traffic:
  /// <dl> <dt>Amazon API Gateway custom regional APIs and edge-optimized
  /// APIs</dt> <dd>
  /// Specify the hosted zone ID for your API. You can get the applicable value
  /// using the CLI command <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-domain-names.html">get-domain-names</a>:
  ///
  /// <ul>
  /// <li>
  /// For regional APIs, specify the value of <code>regionalHostedZoneId</code>.
  /// </li>
  /// <li>
  /// For edge-optimized APIs, specify the value of
  /// <code>distributionHostedZoneId</code>.
  /// </li>
  /// </ul> </dd> <dt>Amazon Virtual Private Cloud interface VPC endpoint</dt>
  /// <dd>
  /// Specify the hosted zone ID for your interface endpoint. You can get the
  /// value of <code>HostedZoneId</code> using the CLI command <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-vpc-endpoints.html">describe-vpc-endpoints</a>.
  /// </dd> <dt>CloudFront distribution</dt> <dd>
  /// Specify <code>Z2FDTNDATAQYW2</code>.
  /// <note>
  /// Alias resource record sets for CloudFront can't be created in a private
  /// zone.
  /// </note> </dd> <dt>Elastic Beanstalk environment</dt> <dd>
  /// Specify the hosted zone ID for the region that you created the environment
  /// in. The environment must have a regionalized subdomain. For a list of
  /// regions and the corresponding hosted zone IDs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/elasticbeanstalk.html">Elastic
  /// Beanstalk endpoints and quotas</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  /// </dd> <dt>ELB load balancer</dt> <dd>
  /// Specify the value of the hosted zone ID for the load balancer. Use the
  /// following methods to get the hosted zone ID:
  ///
  /// <ul>
  /// <li>
  /// <a href="https://docs.aws.amazon.com/general/latest/gr/elb.html">Elastic
  /// Load Balancing endpoints and quotas</a> topic in the <i>Amazon Web Services
  /// General Reference</i>: Use the value that corresponds with the region that
  /// you created your load balancer in. Note that there are separate columns for
  /// Application and Classic Load Balancers and for Network Load Balancers.
  /// </li>
  /// <li>
  /// <b>Amazon Web Services Management Console</b>: Go to the Amazon EC2 page,
  /// choose <b>Load Balancers</b> in the navigation pane, select the load
  /// balancer, and get the value of the <b>Hosted zone</b> field on the
  /// <b>Description</b> tab.
  /// </li>
  /// <li>
  /// <b>Elastic Load Balancing API</b>: Use <code>DescribeLoadBalancers</code> to
  /// get the applicable value. For more information, see the applicable guide:
  ///
  /// <ul>
  /// <li>
  /// Classic Load Balancers: Use <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/2012-06-01/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a>
  /// to get the value of <code>CanonicalHostedZoneNameId</code>.
  /// </li>
  /// <li>
  /// Application and Network Load Balancers: Use <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a>
  /// to get the value of <code>CanonicalHostedZoneId</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>CLI</b>: Use <code>describe-load-balancers</code> to get the applicable
  /// value. For more information, see the applicable guide:
  ///
  /// <ul>
  /// <li>
  /// Classic Load Balancers: Use <a
  /// href="http://docs.aws.amazon.com/cli/latest/reference/elb/describe-load-balancers.html">describe-load-balancers</a>
  /// to get the value of <code>CanonicalHostedZoneNameId</code>.
  /// </li>
  /// <li>
  /// Application and Network Load Balancers: Use <a
  /// href="http://docs.aws.amazon.com/cli/latest/reference/elbv2/describe-load-balancers.html">describe-load-balancers</a>
  /// to get the value of <code>CanonicalHostedZoneId</code>.
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>Global Accelerator accelerator</dt> <dd>
  /// Specify <code>Z2BJ6XQ5FK7U4H</code>.
  /// </dd> <dt>An Amazon S3 bucket configured as a static website</dt> <dd>
  /// Specify the hosted zone ID for the region that you created the bucket in.
  /// For more information about valid values, see the table <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/s3.html#s3_website_region_endpoints">Amazon
  /// S3 Website Endpoints</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  /// </dd> <dt>Another Route 53 resource record set in your hosted zone</dt> <dd>
  /// Specify the hosted zone ID of your hosted zone. (An alias resource record
  /// set can't reference a resource record set in a different hosted zone.)
  /// </dd> </dl>
  final String hostedZoneId;

  AliasTarget({
    required this.dNSName,
    required this.evaluateTargetHealth,
    required this.hostedZoneId,
  });
  factory AliasTarget.fromXml(_s.XmlElement elem) {
    return AliasTarget(
      dNSName: _s.extractXmlStringValue(elem, 'DNSName')!,
      evaluateTargetHealth:
          _s.extractXmlBoolValue(elem, 'EvaluateTargetHealth')!,
      hostedZoneId: _s.extractXmlStringValue(elem, 'HostedZoneId')!,
    );
  }

  Map<String, dynamic> toJson() {
    final dNSName = this.dNSName;
    final evaluateTargetHealth = this.evaluateTargetHealth;
    final hostedZoneId = this.hostedZoneId;
    return {
      'DNSName': dNSName,
      'EvaluateTargetHealth': evaluateTargetHealth,
      'HostedZoneId': hostedZoneId,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final dNSName = this.dNSName;
    final evaluateTargetHealth = this.evaluateTargetHealth;
    final hostedZoneId = this.hostedZoneId;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('HostedZoneId', hostedZoneId),
      _s.encodeXmlStringValue('DNSName', dNSName),
      _s.encodeXmlBoolValue('EvaluateTargetHealth', evaluateTargetHealth),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains information about the request to associate a
/// VPC with a private hosted zone.
class AssociateVPCWithHostedZoneRequest {
  /// The ID of the private hosted zone that you want to associate an Amazon VPC
  /// with.
  ///
  /// Note that you can't associate a VPC with a hosted zone that doesn't have an
  /// existing VPC association.
  final String hostedZoneId;

  /// A complex type that contains information about the VPC that you want to
  /// associate with a private hosted zone.
  final VPC vpc;

  /// <i>Optional:</i> A comment about the association request.
  final String? comment;

  AssociateVPCWithHostedZoneRequest({
    required this.hostedZoneId,
    required this.vpc,
    this.comment,
  });

  Map<String, dynamic> toJson() {
    final hostedZoneId = this.hostedZoneId;
    final vpc = this.vpc;
    final comment = this.comment;
    return {
      'VPC': vpc,
      if (comment != null) 'Comment': comment,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final hostedZoneId = this.hostedZoneId;
    final vpc = this.vpc;
    final comment = this.comment;
    final $children = <_s.XmlNode>[
      vpc.toXml('VPC'),
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the response information for the
/// <code>AssociateVPCWithHostedZone</code> request.
class AssociateVPCWithHostedZoneResponse {
  /// A complex type that describes the changes made to your hosted zone.
  final ChangeInfo changeInfo;

  AssociateVPCWithHostedZoneResponse({
    required this.changeInfo,
  });
  factory AssociateVPCWithHostedZoneResponse.fromXml(_s.XmlElement elem) {
    return AssociateVPCWithHostedZoneResponse(
      changeInfo: ChangeInfo.fromXml(_s.extractXmlChild(elem, 'ChangeInfo')!),
    );
  }

  Map<String, dynamic> toJson() {
    final changeInfo = this.changeInfo;
    return {
      'ChangeInfo': changeInfo,
    };
  }
}

/// The information for each resource record set that you want to change.
class Change {
  /// The action to perform:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE</code>: Creates a resource record set that has the specified
  /// values.
  /// </li>
  /// <li>
  /// <code>DELETE</code>: Deletes a existing resource record set.
  /// <important>
  /// To delete the resource record set that is associated with a traffic policy
  /// instance, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_DeleteTrafficPolicyInstance.html">DeleteTrafficPolicyInstance</a>.
  /// Amazon Route 53 will delete the resource record set automatically. If you
  /// delete the resource record set by using
  /// <code>ChangeResourceRecordSets</code>, Route 53 doesn't automatically delete
  /// the traffic policy instance, and you'll continue to be charged for it even
  /// though it's no longer in use.
  /// </important> </li>
  /// <li>
  /// <code>UPSERT</code>: If a resource record set doesn't already exist, Route
  /// 53 creates it. If a resource record set does exist, Route 53 updates it with
  /// the values in the request.
  /// </li>
  /// </ul>
  final ChangeAction action;

  /// Information about the resource record set to create, delete, or update.
  final ResourceRecordSet resourceRecordSet;

  Change({
    required this.action,
    required this.resourceRecordSet,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final resourceRecordSet = this.resourceRecordSet;
    return {
      'Action': action.toValue(),
      'ResourceRecordSet': resourceRecordSet,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final action = this.action;
    final resourceRecordSet = this.resourceRecordSet;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Action', action.toValue()),
      resourceRecordSet.toXml('ResourceRecordSet'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum ChangeAction {
  create,
  delete,
  upsert,
}

extension ChangeActionValueExtension on ChangeAction {
  String toValue() {
    switch (this) {
      case ChangeAction.create:
        return 'CREATE';
      case ChangeAction.delete:
        return 'DELETE';
      case ChangeAction.upsert:
        return 'UPSERT';
    }
  }
}

extension ChangeActionFromString on String {
  ChangeAction toChangeAction() {
    switch (this) {
      case 'CREATE':
        return ChangeAction.create;
      case 'DELETE':
        return ChangeAction.delete;
      case 'UPSERT':
        return ChangeAction.upsert;
    }
    throw Exception('$this is not known in enum ChangeAction');
  }
}

/// The information for a change request.
class ChangeBatch {
  /// Information about the changes to make to the record sets.
  final List<Change> changes;

  /// <i>Optional:</i> Any comments you want to include about a change batch
  /// request.
  final String? comment;

  ChangeBatch({
    required this.changes,
    this.comment,
  });

  Map<String, dynamic> toJson() {
    final changes = this.changes;
    final comment = this.comment;
    return {
      'Changes': changes,
      if (comment != null) 'Comment': comment,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final changes = this.changes;
    final comment = this.comment;
    final $children = <_s.XmlNode>[
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
      _s.XmlElement(
          _s.XmlName('Changes'), [], changes.map((e) => e.toXml('Change'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class ChangeCidrCollectionRequest {
  /// Information about changes to a CIDR collection.
  final List<CidrCollectionChange> changes;

  /// The UUID of the CIDR collection to update.
  final String id;

  /// A sequential counter that Amazon Route 53 sets to 1 when you create a
  /// collection and increments it by 1 each time you update the collection.
  ///
  /// We recommend that you use <code>ListCidrCollection</code> to get the current
  /// value of <code>CollectionVersion</code> for the collection that you want to
  /// update, and then include that value with the change request. This prevents
  /// Route 53 from overwriting an intervening update:
  ///
  /// <ul>
  /// <li>
  /// If the value in the request matches the value of
  /// <code>CollectionVersion</code> in the collection, Route 53 updates the
  /// collection.
  /// </li>
  /// <li>
  /// If the value of <code>CollectionVersion</code> in the collection is greater
  /// than the value in the request, the collection was changed after you got the
  /// version number. Route 53 does not update the collection, and it returns a
  /// <code>CidrCollectionVersionMismatch</code> error.
  /// </li>
  /// </ul>
  final int? collectionVersion;

  ChangeCidrCollectionRequest({
    required this.changes,
    required this.id,
    this.collectionVersion,
  });

  Map<String, dynamic> toJson() {
    final changes = this.changes;
    final id = this.id;
    final collectionVersion = this.collectionVersion;
    return {
      'Changes': changes,
      if (collectionVersion != null) 'CollectionVersion': collectionVersion,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final changes = this.changes;
    final id = this.id;
    final collectionVersion = this.collectionVersion;
    final $children = <_s.XmlNode>[
      if (collectionVersion != null)
        _s.encodeXmlIntValue('CollectionVersion', collectionVersion),
      _s.XmlElement(
          _s.XmlName('Changes'), [], changes.map((e) => e.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class ChangeCidrCollectionResponse {
  /// The ID that is returned by <code>ChangeCidrCollection</code>. You can use it
  /// as input to <code>GetChange</code> to see if a CIDR collection change has
  /// propagated or not.
  final String id;

  ChangeCidrCollectionResponse({
    required this.id,
  });
  factory ChangeCidrCollectionResponse.fromXml(_s.XmlElement elem) {
    return ChangeCidrCollectionResponse(
      id: _s.extractXmlStringValue(elem, 'Id')!,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'Id': id,
    };
  }
}

/// A complex type that describes change information about changes made to your
/// hosted zone.
class ChangeInfo {
  /// This element contains an ID that you use when performing a <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetChange.html">GetChange</a>
  /// action to get detailed information about the change.
  final String id;

  /// The current state of the request. <code>PENDING</code> indicates that this
  /// request has not yet been applied to all Amazon Route 53 DNS servers.
  final ChangeStatus status;

  /// The date and time that the change request was submitted in <a
  /// href="https://en.wikipedia.org/wiki/ISO_8601">ISO 8601 format</a> and
  /// Coordinated Universal Time (UTC). For example, the value
  /// <code>2017-03-27T17:48:16.751Z</code> represents March 27, 2017 at
  /// 17:48:16.751 UTC.
  final DateTime submittedAt;

  /// A comment you can provide.
  final String? comment;

  ChangeInfo({
    required this.id,
    required this.status,
    required this.submittedAt,
    this.comment,
  });
  factory ChangeInfo.fromXml(_s.XmlElement elem) {
    return ChangeInfo(
      id: _s.extractXmlStringValue(elem, 'Id')!,
      status: _s.extractXmlStringValue(elem, 'Status')!.toChangeStatus(),
      submittedAt: _s.extractXmlDateTimeValue(elem, 'SubmittedAt')!,
      comment: _s.extractXmlStringValue(elem, 'Comment'),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final status = this.status;
    final submittedAt = this.submittedAt;
    final comment = this.comment;
    return {
      'Id': id,
      'Status': status.toValue(),
      'SubmittedAt': iso8601ToJson(submittedAt),
      if (comment != null) 'Comment': comment,
    };
  }
}

/// A complex type that contains change information for the resource record set.
class ChangeResourceRecordSetsRequest {
  /// A complex type that contains an optional comment and the
  /// <code>Changes</code> element.
  final ChangeBatch changeBatch;

  /// The ID of the hosted zone that contains the resource record sets that you
  /// want to change.
  final String hostedZoneId;

  ChangeResourceRecordSetsRequest({
    required this.changeBatch,
    required this.hostedZoneId,
  });

  Map<String, dynamic> toJson() {
    final changeBatch = this.changeBatch;
    final hostedZoneId = this.hostedZoneId;
    return {
      'ChangeBatch': changeBatch,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final changeBatch = this.changeBatch;
    final hostedZoneId = this.hostedZoneId;
    final $children = <_s.XmlNode>[
      changeBatch.toXml('ChangeBatch'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type containing the response for the request.
class ChangeResourceRecordSetsResponse {
  /// A complex type that contains information about changes made to your hosted
  /// zone.
  ///
  /// This element contains an ID that you use when performing a <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetChange.html">GetChange</a>
  /// action to get detailed information about the change.
  final ChangeInfo changeInfo;

  ChangeResourceRecordSetsResponse({
    required this.changeInfo,
  });
  factory ChangeResourceRecordSetsResponse.fromXml(_s.XmlElement elem) {
    return ChangeResourceRecordSetsResponse(
      changeInfo: ChangeInfo.fromXml(_s.extractXmlChild(elem, 'ChangeInfo')!),
    );
  }

  Map<String, dynamic> toJson() {
    final changeInfo = this.changeInfo;
    return {
      'ChangeInfo': changeInfo,
    };
  }
}

enum ChangeStatus {
  pending,
  insync,
}

extension ChangeStatusValueExtension on ChangeStatus {
  String toValue() {
    switch (this) {
      case ChangeStatus.pending:
        return 'PENDING';
      case ChangeStatus.insync:
        return 'INSYNC';
    }
  }
}

extension ChangeStatusFromString on String {
  ChangeStatus toChangeStatus() {
    switch (this) {
      case 'PENDING':
        return ChangeStatus.pending;
      case 'INSYNC':
        return ChangeStatus.insync;
    }
    throw Exception('$this is not known in enum ChangeStatus');
  }
}

/// A complex type that contains information about the tags that you want to
/// add, edit, or delete.
class ChangeTagsForResourceRequest {
  /// The ID of the resource for which you want to add, change, or delete tags.
  final String resourceId;

  /// The type of the resource.
  ///
  /// <ul>
  /// <li>
  /// The resource type for health checks is <code>healthcheck</code>.
  /// </li>
  /// <li>
  /// The resource type for hosted zones is <code>hostedzone</code>.
  /// </li>
  /// </ul>
  final TagResourceType resourceType;

  /// A complex type that contains a list of the tags that you want to add to the
  /// specified health check or hosted zone and/or the tags that you want to edit
  /// <code>Value</code> for.
  ///
  /// You can add a maximum of 10 tags to a health check or a hosted zone.
  final List<Tag>? addTags;

  /// A complex type that contains a list of the tags that you want to delete from
  /// the specified health check or hosted zone. You can specify up to 10 keys.
  final List<String>? removeTagKeys;

  ChangeTagsForResourceRequest({
    required this.resourceId,
    required this.resourceType,
    this.addTags,
    this.removeTagKeys,
  });

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final addTags = this.addTags;
    final removeTagKeys = this.removeTagKeys;
    return {
      if (addTags != null) 'AddTags': addTags,
      if (removeTagKeys != null) 'RemoveTagKeys': removeTagKeys,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final addTags = this.addTags;
    final removeTagKeys = this.removeTagKeys;
    final $children = <_s.XmlNode>[
      if (addTags != null)
        _s.XmlElement(
            _s.XmlName('AddTags'), [], addTags.map((e) => e.toXml('Tag'))),
      if (removeTagKeys != null)
        _s.XmlElement(_s.XmlName('RemoveTagKeys'), [],
            removeTagKeys.map((e) => _s.encodeXmlStringValue('Key', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// Empty response for the request.
class ChangeTagsForResourceResponse {
  ChangeTagsForResourceResponse();
  factory ChangeTagsForResourceResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return ChangeTagsForResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A complex type that lists the CIDR blocks.
class CidrBlockSummary {
  /// Value for the CIDR block.
  final String? cidrBlock;

  /// The location name of the CIDR block.
  final String? locationName;

  CidrBlockSummary({
    this.cidrBlock,
    this.locationName,
  });
  factory CidrBlockSummary.fromXml(_s.XmlElement elem) {
    return CidrBlockSummary(
      cidrBlock: _s.extractXmlStringValue(elem, 'CidrBlock'),
      locationName: _s.extractXmlStringValue(elem, 'LocationName'),
    );
  }

  Map<String, dynamic> toJson() {
    final cidrBlock = this.cidrBlock;
    final locationName = this.locationName;
    return {
      if (cidrBlock != null) 'CidrBlock': cidrBlock,
      if (locationName != null) 'LocationName': locationName,
    };
  }
}

/// A complex type that identifies a CIDR collection.
class CidrCollection {
  /// The ARN of the collection. Can be used to reference the collection in IAM
  /// policy or in another Amazon Web Services account.
  final String? arn;

  /// The unique ID of the CIDR collection.
  final String? id;

  /// The name of a CIDR collection.
  final String? name;

  /// A sequential counter that Route 53 sets to 1 when you create a CIDR
  /// collection and increments by 1 each time you update settings for the CIDR
  /// collection.
  final int? version;

  CidrCollection({
    this.arn,
    this.id,
    this.name,
    this.version,
  });
  factory CidrCollection.fromXml(_s.XmlElement elem) {
    return CidrCollection(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      version: _s.extractXmlIntValue(elem, 'Version'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

/// A complex type that contains information about the CIDR collection change.
class CidrCollectionChange {
  /// CIDR collection change action.
  final CidrCollectionChangeAction action;

  /// List of CIDR blocks.
  final List<String> cidrList;

  /// Name of the location that is associated with the CIDR collection.
  final String locationName;

  CidrCollectionChange({
    required this.action,
    required this.cidrList,
    required this.locationName,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final cidrList = this.cidrList;
    final locationName = this.locationName;
    return {
      'Action': action.toValue(),
      'CidrList': cidrList,
      'LocationName': locationName,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final action = this.action;
    final cidrList = this.cidrList;
    final locationName = this.locationName;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('LocationName', locationName),
      _s.encodeXmlStringValue('Action', action.toValue()),
      _s.XmlElement(_s.XmlName('CidrList'), [],
          cidrList.map((e) => _s.encodeXmlStringValue('Cidr', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum CidrCollectionChangeAction {
  put,
  deleteIfExists,
}

extension CidrCollectionChangeActionValueExtension
    on CidrCollectionChangeAction {
  String toValue() {
    switch (this) {
      case CidrCollectionChangeAction.put:
        return 'PUT';
      case CidrCollectionChangeAction.deleteIfExists:
        return 'DELETE_IF_EXISTS';
    }
  }
}

extension CidrCollectionChangeActionFromString on String {
  CidrCollectionChangeAction toCidrCollectionChangeAction() {
    switch (this) {
      case 'PUT':
        return CidrCollectionChangeAction.put;
      case 'DELETE_IF_EXISTS':
        return CidrCollectionChangeAction.deleteIfExists;
    }
    throw Exception('$this is not known in enum CidrCollectionChangeAction');
  }
}

/// The object that is specified in resource record set object when you are
/// linking a resource record set to a CIDR location.
///
/// A <code>LocationName</code> with an asterisk “*” can be used to create a
/// default CIDR record. <code>CollectionId</code> is still required for default
/// record.
class CidrRoutingConfig {
  /// The CIDR collection ID.
  final String collectionId;

  /// The CIDR collection location name.
  final String locationName;

  CidrRoutingConfig({
    required this.collectionId,
    required this.locationName,
  });
  factory CidrRoutingConfig.fromXml(_s.XmlElement elem) {
    return CidrRoutingConfig(
      collectionId: _s.extractXmlStringValue(elem, 'CollectionId')!,
      locationName: _s.extractXmlStringValue(elem, 'LocationName')!,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionId = this.collectionId;
    final locationName = this.locationName;
    return {
      'CollectionId': collectionId,
      'LocationName': locationName,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final collectionId = this.collectionId;
    final locationName = this.locationName;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('CollectionId', collectionId),
      _s.encodeXmlStringValue('LocationName', locationName),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains information about the CloudWatch alarm that
/// Amazon Route 53 is monitoring for this health check.
class CloudWatchAlarmConfiguration {
  /// For the metric that the CloudWatch alarm is associated with, the arithmetic
  /// operation that is used for the comparison.
  final ComparisonOperator comparisonOperator;

  /// For the metric that the CloudWatch alarm is associated with, the number of
  /// periods that the metric is compared to the threshold.
  final int evaluationPeriods;

  /// The name of the CloudWatch metric that the alarm is associated with.
  final String metricName;

  /// The namespace of the metric that the alarm is associated with. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html">Amazon
  /// CloudWatch Namespaces, Dimensions, and Metrics Reference</a> in the
  /// <i>Amazon CloudWatch User Guide</i>.
  final String namespace;

  /// For the metric that the CloudWatch alarm is associated with, the duration of
  /// one evaluation period in seconds.
  final int period;

  /// For the metric that the CloudWatch alarm is associated with, the statistic
  /// that is applied to the metric.
  final Statistic statistic;

  /// For the metric that the CloudWatch alarm is associated with, the value the
  /// metric is compared with.
  final double threshold;

  /// For the metric that the CloudWatch alarm is associated with, a complex type
  /// that contains information about the dimensions for the metric. For
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html">Amazon
  /// CloudWatch Namespaces, Dimensions, and Metrics Reference</a> in the
  /// <i>Amazon CloudWatch User Guide</i>.
  final List<Dimension>? dimensions;

  CloudWatchAlarmConfiguration({
    required this.comparisonOperator,
    required this.evaluationPeriods,
    required this.metricName,
    required this.namespace,
    required this.period,
    required this.statistic,
    required this.threshold,
    this.dimensions,
  });
  factory CloudWatchAlarmConfiguration.fromXml(_s.XmlElement elem) {
    return CloudWatchAlarmConfiguration(
      comparisonOperator: _s
          .extractXmlStringValue(elem, 'ComparisonOperator')!
          .toComparisonOperator(),
      evaluationPeriods: _s.extractXmlIntValue(elem, 'EvaluationPeriods')!,
      metricName: _s.extractXmlStringValue(elem, 'MetricName')!,
      namespace: _s.extractXmlStringValue(elem, 'Namespace')!,
      period: _s.extractXmlIntValue(elem, 'Period')!,
      statistic: _s.extractXmlStringValue(elem, 'Statistic')!.toStatistic(),
      threshold: _s.extractXmlDoubleValue(elem, 'Threshold')!,
      dimensions: _s.extractXmlChild(elem, 'Dimensions')?.let((elem) =>
          elem.findElements('Dimension').map(Dimension.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final evaluationPeriods = this.evaluationPeriods;
    final metricName = this.metricName;
    final namespace = this.namespace;
    final period = this.period;
    final statistic = this.statistic;
    final threshold = this.threshold;
    final dimensions = this.dimensions;
    return {
      'ComparisonOperator': comparisonOperator.toValue(),
      'EvaluationPeriods': evaluationPeriods,
      'MetricName': metricName,
      'Namespace': namespace,
      'Period': period,
      'Statistic': statistic.toValue(),
      'Threshold': threshold,
      if (dimensions != null) 'Dimensions': dimensions,
    };
  }
}

enum CloudWatchRegion {
  usEast_1,
  usEast_2,
  usWest_1,
  usWest_2,
  caCentral_1,
  euCentral_1,
  euCentral_2,
  euWest_1,
  euWest_2,
  euWest_3,
  apEast_1,
  meSouth_1,
  meCentral_1,
  apSouth_1,
  apSouth_2,
  apSoutheast_1,
  apSoutheast_2,
  apSoutheast_3,
  apNortheast_1,
  apNortheast_2,
  apNortheast_3,
  euNorth_1,
  saEast_1,
  cnNorthwest_1,
  cnNorth_1,
  afSouth_1,
  euSouth_1,
  euSouth_2,
  usGovWest_1,
  usGovEast_1,
  usIsoEast_1,
  usIsoWest_1,
  usIsobEast_1,
  apSoutheast_4,
  ilCentral_1,
  caWest_1,
}

extension CloudWatchRegionValueExtension on CloudWatchRegion {
  String toValue() {
    switch (this) {
      case CloudWatchRegion.usEast_1:
        return 'us-east-1';
      case CloudWatchRegion.usEast_2:
        return 'us-east-2';
      case CloudWatchRegion.usWest_1:
        return 'us-west-1';
      case CloudWatchRegion.usWest_2:
        return 'us-west-2';
      case CloudWatchRegion.caCentral_1:
        return 'ca-central-1';
      case CloudWatchRegion.euCentral_1:
        return 'eu-central-1';
      case CloudWatchRegion.euCentral_2:
        return 'eu-central-2';
      case CloudWatchRegion.euWest_1:
        return 'eu-west-1';
      case CloudWatchRegion.euWest_2:
        return 'eu-west-2';
      case CloudWatchRegion.euWest_3:
        return 'eu-west-3';
      case CloudWatchRegion.apEast_1:
        return 'ap-east-1';
      case CloudWatchRegion.meSouth_1:
        return 'me-south-1';
      case CloudWatchRegion.meCentral_1:
        return 'me-central-1';
      case CloudWatchRegion.apSouth_1:
        return 'ap-south-1';
      case CloudWatchRegion.apSouth_2:
        return 'ap-south-2';
      case CloudWatchRegion.apSoutheast_1:
        return 'ap-southeast-1';
      case CloudWatchRegion.apSoutheast_2:
        return 'ap-southeast-2';
      case CloudWatchRegion.apSoutheast_3:
        return 'ap-southeast-3';
      case CloudWatchRegion.apNortheast_1:
        return 'ap-northeast-1';
      case CloudWatchRegion.apNortheast_2:
        return 'ap-northeast-2';
      case CloudWatchRegion.apNortheast_3:
        return 'ap-northeast-3';
      case CloudWatchRegion.euNorth_1:
        return 'eu-north-1';
      case CloudWatchRegion.saEast_1:
        return 'sa-east-1';
      case CloudWatchRegion.cnNorthwest_1:
        return 'cn-northwest-1';
      case CloudWatchRegion.cnNorth_1:
        return 'cn-north-1';
      case CloudWatchRegion.afSouth_1:
        return 'af-south-1';
      case CloudWatchRegion.euSouth_1:
        return 'eu-south-1';
      case CloudWatchRegion.euSouth_2:
        return 'eu-south-2';
      case CloudWatchRegion.usGovWest_1:
        return 'us-gov-west-1';
      case CloudWatchRegion.usGovEast_1:
        return 'us-gov-east-1';
      case CloudWatchRegion.usIsoEast_1:
        return 'us-iso-east-1';
      case CloudWatchRegion.usIsoWest_1:
        return 'us-iso-west-1';
      case CloudWatchRegion.usIsobEast_1:
        return 'us-isob-east-1';
      case CloudWatchRegion.apSoutheast_4:
        return 'ap-southeast-4';
      case CloudWatchRegion.ilCentral_1:
        return 'il-central-1';
      case CloudWatchRegion.caWest_1:
        return 'ca-west-1';
    }
  }
}

extension CloudWatchRegionFromString on String {
  CloudWatchRegion toCloudWatchRegion() {
    switch (this) {
      case 'us-east-1':
        return CloudWatchRegion.usEast_1;
      case 'us-east-2':
        return CloudWatchRegion.usEast_2;
      case 'us-west-1':
        return CloudWatchRegion.usWest_1;
      case 'us-west-2':
        return CloudWatchRegion.usWest_2;
      case 'ca-central-1':
        return CloudWatchRegion.caCentral_1;
      case 'eu-central-1':
        return CloudWatchRegion.euCentral_1;
      case 'eu-central-2':
        return CloudWatchRegion.euCentral_2;
      case 'eu-west-1':
        return CloudWatchRegion.euWest_1;
      case 'eu-west-2':
        return CloudWatchRegion.euWest_2;
      case 'eu-west-3':
        return CloudWatchRegion.euWest_3;
      case 'ap-east-1':
        return CloudWatchRegion.apEast_1;
      case 'me-south-1':
        return CloudWatchRegion.meSouth_1;
      case 'me-central-1':
        return CloudWatchRegion.meCentral_1;
      case 'ap-south-1':
        return CloudWatchRegion.apSouth_1;
      case 'ap-south-2':
        return CloudWatchRegion.apSouth_2;
      case 'ap-southeast-1':
        return CloudWatchRegion.apSoutheast_1;
      case 'ap-southeast-2':
        return CloudWatchRegion.apSoutheast_2;
      case 'ap-southeast-3':
        return CloudWatchRegion.apSoutheast_3;
      case 'ap-northeast-1':
        return CloudWatchRegion.apNortheast_1;
      case 'ap-northeast-2':
        return CloudWatchRegion.apNortheast_2;
      case 'ap-northeast-3':
        return CloudWatchRegion.apNortheast_3;
      case 'eu-north-1':
        return CloudWatchRegion.euNorth_1;
      case 'sa-east-1':
        return CloudWatchRegion.saEast_1;
      case 'cn-northwest-1':
        return CloudWatchRegion.cnNorthwest_1;
      case 'cn-north-1':
        return CloudWatchRegion.cnNorth_1;
      case 'af-south-1':
        return CloudWatchRegion.afSouth_1;
      case 'eu-south-1':
        return CloudWatchRegion.euSouth_1;
      case 'eu-south-2':
        return CloudWatchRegion.euSouth_2;
      case 'us-gov-west-1':
        return CloudWatchRegion.usGovWest_1;
      case 'us-gov-east-1':
        return CloudWatchRegion.usGovEast_1;
      case 'us-iso-east-1':
        return CloudWatchRegion.usIsoEast_1;
      case 'us-iso-west-1':
        return CloudWatchRegion.usIsoWest_1;
      case 'us-isob-east-1':
        return CloudWatchRegion.usIsobEast_1;
      case 'ap-southeast-4':
        return CloudWatchRegion.apSoutheast_4;
      case 'il-central-1':
        return CloudWatchRegion.ilCentral_1;
      case 'ca-west-1':
        return CloudWatchRegion.caWest_1;
    }
    throw Exception('$this is not known in enum CloudWatchRegion');
  }
}

/// A complex type that is an entry in an <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CidrCollection.html">CidrCollection</a>
/// array.
class CollectionSummary {
  /// The ARN of the collection summary. Can be used to reference the collection
  /// in IAM policy or cross-account.
  final String? arn;

  /// Unique ID for the CIDR collection.
  final String? id;

  /// The name of a CIDR collection.
  final String? name;

  /// A sequential counter that Route 53 sets to 1 when you create a CIDR
  /// collection and increments by 1 each time you update settings for the CIDR
  /// collection.
  final int? version;

  CollectionSummary({
    this.arn,
    this.id,
    this.name,
    this.version,
  });
  factory CollectionSummary.fromXml(_s.XmlElement elem) {
    return CollectionSummary(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      version: _s.extractXmlIntValue(elem, 'Version'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

enum ComparisonOperator {
  greaterThanOrEqualToThreshold,
  greaterThanThreshold,
  lessThanThreshold,
  lessThanOrEqualToThreshold,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.greaterThanOrEqualToThreshold:
        return 'GreaterThanOrEqualToThreshold';
      case ComparisonOperator.greaterThanThreshold:
        return 'GreaterThanThreshold';
      case ComparisonOperator.lessThanThreshold:
        return 'LessThanThreshold';
      case ComparisonOperator.lessThanOrEqualToThreshold:
        return 'LessThanOrEqualToThreshold';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'GreaterThanOrEqualToThreshold':
        return ComparisonOperator.greaterThanOrEqualToThreshold;
      case 'GreaterThanThreshold':
        return ComparisonOperator.greaterThanThreshold;
      case 'LessThanThreshold':
        return ComparisonOperator.lessThanThreshold;
      case 'LessThanOrEqualToThreshold':
        return ComparisonOperator.lessThanOrEqualToThreshold;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

/// A complex type that lists the coordinates for a geoproximity resource
/// record.
class Coordinates {
  /// Specifies a coordinate of the north–south position of a geographic point on
  /// the surface of the Earth (-90 - 90).
  final String latitude;

  /// Specifies a coordinate of the east–west position of a geographic point on
  /// the surface of the Earth (-180 - 180).
  final String longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });
  factory Coordinates.fromXml(_s.XmlElement elem) {
    return Coordinates(
      latitude: _s.extractXmlStringValue(elem, 'Latitude')!,
      longitude: _s.extractXmlStringValue(elem, 'Longitude')!,
    );
  }

  Map<String, dynamic> toJson() {
    final latitude = this.latitude;
    final longitude = this.longitude;
    return {
      'Latitude': latitude,
      'Longitude': longitude,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final latitude = this.latitude;
    final longitude = this.longitude;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Latitude', latitude),
      _s.encodeXmlStringValue('Longitude', longitude),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class CreateCidrCollectionRequest {
  /// A client-specific token that allows requests to be securely retried so that
  /// the intended outcome will only occur once, retries receive a similar
  /// response, and there are no additional edge cases to handle.
  final String callerReference;

  /// A unique identifier for the account that can be used to reference the
  /// collection from other API calls.
  final String name;

  CreateCidrCollectionRequest({
    required this.callerReference,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final callerReference = this.callerReference;
    final name = this.name;
    return {
      'CallerReference': callerReference,
      'Name': name,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final callerReference = this.callerReference;
    final name = this.name;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Name', name),
      _s.encodeXmlStringValue('CallerReference', callerReference),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class CreateCidrCollectionResponse {
  /// A complex type that contains information about the CIDR collection.
  final CidrCollection? collection;

  /// A unique URL that represents the location for the CIDR collection.
  final String? location;

  CreateCidrCollectionResponse({
    this.collection,
    this.location,
  });

  Map<String, dynamic> toJson() {
    final collection = this.collection;
    final location = this.location;
    return {
      if (collection != null) 'Collection': collection,
    };
  }
}

/// A complex type that contains the health check request information.
class CreateHealthCheckRequest {
  /// A unique string that identifies the request and that allows you to retry a
  /// failed <code>CreateHealthCheck</code> request without the risk of creating
  /// two identical health checks:
  ///
  /// <ul>
  /// <li>
  /// If you send a <code>CreateHealthCheck</code> request with the same
  /// <code>CallerReference</code> and settings as a previous request, and if the
  /// health check doesn't exist, Amazon Route 53 creates the health check. If the
  /// health check does exist, Route 53 returns the settings for the existing
  /// health check.
  /// </li>
  /// <li>
  /// If you send a <code>CreateHealthCheck</code> request with the same
  /// <code>CallerReference</code> as a deleted health check, regardless of the
  /// settings, Route 53 returns a <code>HealthCheckAlreadyExists</code> error.
  /// </li>
  /// <li>
  /// If you send a <code>CreateHealthCheck</code> request with the same
  /// <code>CallerReference</code> as an existing health check but with different
  /// settings, Route 53 returns a <code>HealthCheckAlreadyExists</code> error.
  /// </li>
  /// <li>
  /// If you send a <code>CreateHealthCheck</code> request with a unique
  /// <code>CallerReference</code> but settings identical to an existing health
  /// check, Route 53 creates the health check.
  /// </li>
  /// </ul>
  /// Route 53 does not store the <code>CallerReference</code> for a deleted
  /// health check indefinitely. The <code>CallerReference</code> for a deleted
  /// health check will be deleted after a number of days.
  final String callerReference;

  /// A complex type that contains settings for a new health check.
  final HealthCheckConfig healthCheckConfig;

  CreateHealthCheckRequest({
    required this.callerReference,
    required this.healthCheckConfig,
  });

  Map<String, dynamic> toJson() {
    final callerReference = this.callerReference;
    final healthCheckConfig = this.healthCheckConfig;
    return {
      'CallerReference': callerReference,
      'HealthCheckConfig': healthCheckConfig,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final callerReference = this.callerReference;
    final healthCheckConfig = this.healthCheckConfig;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('CallerReference', callerReference),
      healthCheckConfig.toXml('HealthCheckConfig'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type containing the response information for the new health check.
class CreateHealthCheckResponse {
  /// A complex type that contains identifying information about the health check.
  final HealthCheck healthCheck;

  /// The unique URL representing the new health check.
  final String location;

  CreateHealthCheckResponse({
    required this.healthCheck,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    final healthCheck = this.healthCheck;
    final location = this.location;
    return {
      'HealthCheck': healthCheck,
    };
  }
}

/// A complex type that contains information about the request to create a
/// public or private hosted zone.
class CreateHostedZoneRequest {
  /// A unique string that identifies the request and that allows failed
  /// <code>CreateHostedZone</code> requests to be retried without the risk of
  /// executing the operation twice. You must use a unique
  /// <code>CallerReference</code> string every time you submit a
  /// <code>CreateHostedZone</code> request. <code>CallerReference</code> can be
  /// any unique string, for example, a date/time stamp.
  final String callerReference;

  /// The name of the domain. Specify a fully qualified domain name, for example,
  /// <i>www.example.com</i>. The trailing dot is optional; Amazon Route 53
  /// assumes that the domain name is fully qualified. This means that Route 53
  /// treats <i>www.example.com</i> (without a trailing dot) and
  /// <i>www.example.com.</i> (with a trailing dot) as identical.
  ///
  /// If you're creating a public hosted zone, this is the name you have
  /// registered with your DNS registrar. If your domain name is registered with a
  /// registrar other than Route 53, change the name servers for your domain to
  /// the set of <code>NameServers</code> that <code>CreateHostedZone</code>
  /// returns in <code>DelegationSet</code>.
  final String name;

  /// If you want to associate a reusable delegation set with this hosted zone,
  /// the ID that Amazon Route 53 assigned to the reusable delegation set when you
  /// created it. For more information about reusable delegation sets, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateReusableDelegationSet.html">CreateReusableDelegationSet</a>.
  ///
  /// If you are using a reusable delegation set to create a public hosted zone
  /// for a subdomain, make sure that the parent hosted zone doesn't use one or
  /// more of the same name servers. If you have overlapping nameservers, the
  /// operation will cause a <code>ConflictingDomainsExist</code> error.
  final String? delegationSetId;

  /// (Optional) A complex type that contains the following optional values:
  ///
  /// <ul>
  /// <li>
  /// For public and private hosted zones, an optional comment
  /// </li>
  /// <li>
  /// For private hosted zones, an optional <code>PrivateZone</code> element
  /// </li>
  /// </ul>
  /// If you don't specify a comment or the <code>PrivateZone</code> element, omit
  /// <code>HostedZoneConfig</code> and the other elements.
  final HostedZoneConfig? hostedZoneConfig;

  /// (Private hosted zones only) A complex type that contains information about
  /// the Amazon VPC that you're associating with this hosted zone.
  ///
  /// You can specify only one Amazon VPC when you create a private hosted zone.
  /// If you are associating a VPC with a hosted zone with this request, the
  /// paramaters <code>VPCId</code> and <code>VPCRegion</code> are also required.
  ///
  /// To associate additional Amazon VPCs with the hosted zone, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_AssociateVPCWithHostedZone.html">AssociateVPCWithHostedZone</a>
  /// after you create a hosted zone.
  final VPC? vpc;

  CreateHostedZoneRequest({
    required this.callerReference,
    required this.name,
    this.delegationSetId,
    this.hostedZoneConfig,
    this.vpc,
  });

  Map<String, dynamic> toJson() {
    final callerReference = this.callerReference;
    final name = this.name;
    final delegationSetId = this.delegationSetId;
    final hostedZoneConfig = this.hostedZoneConfig;
    final vpc = this.vpc;
    return {
      'CallerReference': callerReference,
      'Name': name,
      if (delegationSetId != null) 'DelegationSetId': delegationSetId,
      if (hostedZoneConfig != null) 'HostedZoneConfig': hostedZoneConfig,
      if (vpc != null) 'VPC': vpc,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final callerReference = this.callerReference;
    final name = this.name;
    final delegationSetId = this.delegationSetId;
    final hostedZoneConfig = this.hostedZoneConfig;
    final vpc = this.vpc;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Name', name),
      if (vpc != null) vpc.toXml('VPC'),
      _s.encodeXmlStringValue('CallerReference', callerReference),
      if (hostedZoneConfig != null) hostedZoneConfig.toXml('HostedZoneConfig'),
      if (delegationSetId != null)
        _s.encodeXmlStringValue('DelegationSetId', delegationSetId),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type containing the response information for the hosted zone.
class CreateHostedZoneResponse {
  /// A complex type that contains information about the
  /// <code>CreateHostedZone</code> request.
  final ChangeInfo changeInfo;

  /// A complex type that describes the name servers for this hosted zone.
  final DelegationSet delegationSet;

  /// A complex type that contains general information about the hosted zone.
  final HostedZone hostedZone;

  /// The unique URL representing the new hosted zone.
  final String location;

  /// A complex type that contains information about an Amazon VPC that you
  /// associated with this hosted zone.
  final VPC? vpc;

  CreateHostedZoneResponse({
    required this.changeInfo,
    required this.delegationSet,
    required this.hostedZone,
    required this.location,
    this.vpc,
  });

  Map<String, dynamic> toJson() {
    final changeInfo = this.changeInfo;
    final delegationSet = this.delegationSet;
    final hostedZone = this.hostedZone;
    final location = this.location;
    final vpc = this.vpc;
    return {
      'ChangeInfo': changeInfo,
      'DelegationSet': delegationSet,
      'HostedZone': hostedZone,
      if (vpc != null) 'VPC': vpc,
    };
  }
}

class CreateKeySigningKeyRequest {
  /// A unique string that identifies the request.
  final String callerReference;

  /// The unique string (ID) used to identify a hosted zone.
  final String hostedZoneId;

  /// The Amazon resource name (ARN) for a customer managed key in Key Management
  /// Service (KMS). The <code>KeyManagementServiceArn</code> must be unique for
  /// each key-signing key (KSK) in a single hosted zone. To see an example of
  /// <code>KeyManagementServiceArn</code> that grants the correct permissions for
  /// DNSSEC, scroll down to <b>Example</b>.
  ///
  /// You must configure the customer managed customer managed key as follows:
  /// <dl> <dt>Status</dt> <dd>
  /// Enabled
  /// </dd> <dt>Key spec</dt> <dd>
  /// ECC_NIST_P256
  /// </dd> <dt>Key usage</dt> <dd>
  /// Sign and verify
  /// </dd> <dt>Key policy</dt> <dd>
  /// The key policy must give permission for the following actions:
  ///
  /// <ul>
  /// <li>
  /// DescribeKey
  /// </li>
  /// <li>
  /// GetPublicKey
  /// </li>
  /// <li>
  /// Sign
  /// </li>
  /// </ul>
  /// The key policy must also include the Amazon Route 53 service in the
  /// principal for your account. Specify the following:
  ///
  /// <ul>
  /// <li>
  /// <code>"Service": "dnssec-route53.amazonaws.com"</code>
  /// </li>
  /// </ul> </dd> </dl>
  /// For more information about working with a customer managed key in KMS, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html">Key
  /// Management Service concepts</a>.
  final String keyManagementServiceArn;

  /// A string used to identify a key-signing key (KSK). <code>Name</code> can
  /// include numbers, letters, and underscores (_). <code>Name</code> must be
  /// unique for each key-signing key in the same hosted zone.
  final String name;

  /// A string specifying the initial status of the key-signing key (KSK). You can
  /// set the value to <code>ACTIVE</code> or <code>INACTIVE</code>.
  final String status;

  CreateKeySigningKeyRequest({
    required this.callerReference,
    required this.hostedZoneId,
    required this.keyManagementServiceArn,
    required this.name,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    final callerReference = this.callerReference;
    final hostedZoneId = this.hostedZoneId;
    final keyManagementServiceArn = this.keyManagementServiceArn;
    final name = this.name;
    final status = this.status;
    return {
      'CallerReference': callerReference,
      'HostedZoneId': hostedZoneId,
      'KeyManagementServiceArn': keyManagementServiceArn,
      'Name': name,
      'Status': status,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final callerReference = this.callerReference;
    final hostedZoneId = this.hostedZoneId;
    final keyManagementServiceArn = this.keyManagementServiceArn;
    final name = this.name;
    final status = this.status;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('CallerReference', callerReference),
      _s.encodeXmlStringValue('HostedZoneId', hostedZoneId),
      _s.encodeXmlStringValue(
          'KeyManagementServiceArn', keyManagementServiceArn),
      _s.encodeXmlStringValue('Name', name),
      _s.encodeXmlStringValue('Status', status),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class CreateKeySigningKeyResponse {
  final ChangeInfo changeInfo;

  /// The key-signing key (KSK) that the request creates.
  final KeySigningKey keySigningKey;

  /// The unique URL representing the new key-signing key (KSK).
  final String location;

  CreateKeySigningKeyResponse({
    required this.changeInfo,
    required this.keySigningKey,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    final changeInfo = this.changeInfo;
    final keySigningKey = this.keySigningKey;
    final location = this.location;
    return {
      'ChangeInfo': changeInfo,
      'KeySigningKey': keySigningKey,
    };
  }
}

class CreateQueryLoggingConfigRequest {
  /// The Amazon Resource Name (ARN) for the log group that you want to Amazon
  /// Route 53 to send query logs to. This is the format of the ARN:
  ///
  /// arn:aws:logs:<i>region</i>:<i>account-id</i>:log-group:<i>log_group_name</i>
  ///
  /// To get the ARN for a log group, you can use the CloudWatch console, the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeLogGroups.html">DescribeLogGroups</a>
  /// API action, the <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/logs/describe-log-groups.html">describe-log-groups</a>
  /// command, or the applicable command in one of the Amazon Web Services SDKs.
  final String cloudWatchLogsLogGroupArn;

  /// The ID of the hosted zone that you want to log queries for. You can log
  /// queries only for public hosted zones.
  final String hostedZoneId;

  CreateQueryLoggingConfigRequest({
    required this.cloudWatchLogsLogGroupArn,
    required this.hostedZoneId,
  });

  Map<String, dynamic> toJson() {
    final cloudWatchLogsLogGroupArn = this.cloudWatchLogsLogGroupArn;
    final hostedZoneId = this.hostedZoneId;
    return {
      'CloudWatchLogsLogGroupArn': cloudWatchLogsLogGroupArn,
      'HostedZoneId': hostedZoneId,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final cloudWatchLogsLogGroupArn = this.cloudWatchLogsLogGroupArn;
    final hostedZoneId = this.hostedZoneId;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('HostedZoneId', hostedZoneId),
      _s.encodeXmlStringValue(
          'CloudWatchLogsLogGroupArn', cloudWatchLogsLogGroupArn),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class CreateQueryLoggingConfigResponse {
  /// The unique URL representing the new query logging configuration.
  final String location;

  /// A complex type that contains the ID for a query logging configuration, the
  /// ID of the hosted zone that you want to log queries for, and the ARN for the
  /// log group that you want Amazon Route 53 to send query logs to.
  final QueryLoggingConfig queryLoggingConfig;

  CreateQueryLoggingConfigResponse({
    required this.location,
    required this.queryLoggingConfig,
  });

  Map<String, dynamic> toJson() {
    final location = this.location;
    final queryLoggingConfig = this.queryLoggingConfig;
    return {
      'QueryLoggingConfig': queryLoggingConfig,
    };
  }
}

class CreateReusableDelegationSetRequest {
  /// A unique string that identifies the request, and that allows you to retry
  /// failed <code>CreateReusableDelegationSet</code> requests without the risk of
  /// executing the operation twice. You must use a unique
  /// <code>CallerReference</code> string every time you submit a
  /// <code>CreateReusableDelegationSet</code> request.
  /// <code>CallerReference</code> can be any unique string, for example a
  /// date/time stamp.
  final String callerReference;

  /// If you want to mark the delegation set for an existing hosted zone as
  /// reusable, the ID for that hosted zone.
  final String? hostedZoneId;

  CreateReusableDelegationSetRequest({
    required this.callerReference,
    this.hostedZoneId,
  });

  Map<String, dynamic> toJson() {
    final callerReference = this.callerReference;
    final hostedZoneId = this.hostedZoneId;
    return {
      'CallerReference': callerReference,
      if (hostedZoneId != null) 'HostedZoneId': hostedZoneId,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final callerReference = this.callerReference;
    final hostedZoneId = this.hostedZoneId;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('CallerReference', callerReference),
      if (hostedZoneId != null)
        _s.encodeXmlStringValue('HostedZoneId', hostedZoneId),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class CreateReusableDelegationSetResponse {
  /// A complex type that contains name server information.
  final DelegationSet delegationSet;

  /// The unique URL representing the new reusable delegation set.
  final String location;

  CreateReusableDelegationSetResponse({
    required this.delegationSet,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    final delegationSet = this.delegationSet;
    final location = this.location;
    return {
      'DelegationSet': delegationSet,
    };
  }
}

/// A complex type that contains information about the resource record sets that
/// you want to create based on a specified traffic policy.
class CreateTrafficPolicyInstanceRequest {
  /// The ID of the hosted zone that you want Amazon Route 53 to create resource
  /// record sets in by using the configuration in a traffic policy.
  final String hostedZoneId;

  /// The domain name (such as example.com) or subdomain name (such as
  /// www.example.com) for which Amazon Route 53 responds to DNS queries by using
  /// the resource record sets that Route 53 creates for this traffic policy
  /// instance.
  final String name;

  /// (Optional) The TTL that you want Amazon Route 53 to assign to all of the
  /// resource record sets that it creates in the specified hosted zone.
  final int ttl;

  /// The ID of the traffic policy that you want to use to create resource record
  /// sets in the specified hosted zone.
  final String trafficPolicyId;

  /// The version of the traffic policy that you want to use to create resource
  /// record sets in the specified hosted zone.
  final int trafficPolicyVersion;

  CreateTrafficPolicyInstanceRequest({
    required this.hostedZoneId,
    required this.name,
    required this.ttl,
    required this.trafficPolicyId,
    required this.trafficPolicyVersion,
  });

  Map<String, dynamic> toJson() {
    final hostedZoneId = this.hostedZoneId;
    final name = this.name;
    final ttl = this.ttl;
    final trafficPolicyId = this.trafficPolicyId;
    final trafficPolicyVersion = this.trafficPolicyVersion;
    return {
      'HostedZoneId': hostedZoneId,
      'Name': name,
      'TTL': ttl,
      'TrafficPolicyId': trafficPolicyId,
      'TrafficPolicyVersion': trafficPolicyVersion,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final hostedZoneId = this.hostedZoneId;
    final name = this.name;
    final ttl = this.ttl;
    final trafficPolicyId = this.trafficPolicyId;
    final trafficPolicyVersion = this.trafficPolicyVersion;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('HostedZoneId', hostedZoneId),
      _s.encodeXmlStringValue('Name', name),
      _s.encodeXmlIntValue('TTL', ttl),
      _s.encodeXmlStringValue('TrafficPolicyId', trafficPolicyId),
      _s.encodeXmlIntValue('TrafficPolicyVersion', trafficPolicyVersion),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the response information for the
/// <code>CreateTrafficPolicyInstance</code> request.
class CreateTrafficPolicyInstanceResponse {
  /// A unique URL that represents a new traffic policy instance.
  final String location;

  /// A complex type that contains settings for the new traffic policy instance.
  final TrafficPolicyInstance trafficPolicyInstance;

  CreateTrafficPolicyInstanceResponse({
    required this.location,
    required this.trafficPolicyInstance,
  });

  Map<String, dynamic> toJson() {
    final location = this.location;
    final trafficPolicyInstance = this.trafficPolicyInstance;
    return {
      'TrafficPolicyInstance': trafficPolicyInstance,
    };
  }
}

/// A complex type that contains information about the traffic policy that you
/// want to create.
class CreateTrafficPolicyRequest {
  /// The definition of this traffic policy in JSON format. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/api-policies-traffic-policy-document-format.html">Traffic
  /// Policy Document Format</a>.
  final String document;

  /// The name of the traffic policy.
  final String name;

  /// (Optional) Any comments that you want to include about the traffic policy.
  final String? comment;

  CreateTrafficPolicyRequest({
    required this.document,
    required this.name,
    this.comment,
  });

  Map<String, dynamic> toJson() {
    final document = this.document;
    final name = this.name;
    final comment = this.comment;
    return {
      'Document': document,
      'Name': name,
      if (comment != null) 'Comment': comment,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final document = this.document;
    final name = this.name;
    final comment = this.comment;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Name', name),
      _s.encodeXmlStringValue('Document', document),
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the response information for the
/// <code>CreateTrafficPolicy</code> request.
class CreateTrafficPolicyResponse {
  /// A unique URL that represents a new traffic policy.
  final String location;

  /// A complex type that contains settings for the new traffic policy.
  final TrafficPolicy trafficPolicy;

  CreateTrafficPolicyResponse({
    required this.location,
    required this.trafficPolicy,
  });

  Map<String, dynamic> toJson() {
    final location = this.location;
    final trafficPolicy = this.trafficPolicy;
    return {
      'TrafficPolicy': trafficPolicy,
    };
  }
}

/// A complex type that contains information about the traffic policy that you
/// want to create a new version for.
class CreateTrafficPolicyVersionRequest {
  /// The definition of this version of the traffic policy, in JSON format. You
  /// specified the JSON in the <code>CreateTrafficPolicyVersion</code> request.
  /// For more information about the JSON format, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateTrafficPolicy.html">CreateTrafficPolicy</a>.
  final String document;

  /// The ID of the traffic policy for which you want to create a new version.
  final String id;

  /// The comment that you specified in the
  /// <code>CreateTrafficPolicyVersion</code> request, if any.
  final String? comment;

  CreateTrafficPolicyVersionRequest({
    required this.document,
    required this.id,
    this.comment,
  });

  Map<String, dynamic> toJson() {
    final document = this.document;
    final id = this.id;
    final comment = this.comment;
    return {
      'Document': document,
      if (comment != null) 'Comment': comment,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final document = this.document;
    final id = this.id;
    final comment = this.comment;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Document', document),
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the response information for the
/// <code>CreateTrafficPolicyVersion</code> request.
class CreateTrafficPolicyVersionResponse {
  /// A unique URL that represents a new traffic policy version.
  final String location;

  /// A complex type that contains settings for the new version of the traffic
  /// policy.
  final TrafficPolicy trafficPolicy;

  CreateTrafficPolicyVersionResponse({
    required this.location,
    required this.trafficPolicy,
  });

  Map<String, dynamic> toJson() {
    final location = this.location;
    final trafficPolicy = this.trafficPolicy;
    return {
      'TrafficPolicy': trafficPolicy,
    };
  }
}

/// A complex type that contains information about the request to authorize
/// associating a VPC with your private hosted zone. Authorization is only
/// required when a private hosted zone and a VPC were created by using
/// different accounts.
class CreateVPCAssociationAuthorizationRequest {
  /// The ID of the private hosted zone that you want to authorize associating a
  /// VPC with.
  final String hostedZoneId;

  /// A complex type that contains the VPC ID and region for the VPC that you want
  /// to authorize associating with your hosted zone.
  final VPC vpc;

  CreateVPCAssociationAuthorizationRequest({
    required this.hostedZoneId,
    required this.vpc,
  });

  Map<String, dynamic> toJson() {
    final hostedZoneId = this.hostedZoneId;
    final vpc = this.vpc;
    return {
      'VPC': vpc,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final hostedZoneId = this.hostedZoneId;
    final vpc = this.vpc;
    final $children = <_s.XmlNode>[
      vpc.toXml('VPC'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the response information from a
/// <code>CreateVPCAssociationAuthorization</code> request.
class CreateVPCAssociationAuthorizationResponse {
  /// The ID of the hosted zone that you authorized associating a VPC with.
  final String hostedZoneId;

  /// The VPC that you authorized associating with a hosted zone.
  final VPC vpc;

  CreateVPCAssociationAuthorizationResponse({
    required this.hostedZoneId,
    required this.vpc,
  });
  factory CreateVPCAssociationAuthorizationResponse.fromXml(
      _s.XmlElement elem) {
    return CreateVPCAssociationAuthorizationResponse(
      hostedZoneId: _s.extractXmlStringValue(elem, 'HostedZoneId')!,
      vpc: VPC.fromXml(_s.extractXmlChild(elem, 'VPC')!),
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZoneId = this.hostedZoneId;
    final vpc = this.vpc;
    return {
      'HostedZoneId': hostedZoneId,
      'VPC': vpc,
    };
  }
}

/// A string representing the status of DNSSEC signing.
class DNSSECStatus {
  /// A string that represents the current hosted zone signing status.
  ///
  /// Status can have one of the following values:
  /// <dl> <dt>SIGNING</dt> <dd>
  /// DNSSEC signing is enabled for the hosted zone.
  /// </dd> <dt>NOT_SIGNING</dt> <dd>
  /// DNSSEC signing is not enabled for the hosted zone.
  /// </dd> <dt>DELETING</dt> <dd>
  /// DNSSEC signing is in the process of being removed for the hosted zone.
  /// </dd> <dt>ACTION_NEEDED</dt> <dd>
  /// There is a problem with signing in the hosted zone that requires you to take
  /// action to resolve. For example, the customer managed key might have been
  /// deleted, or the permissions for the customer managed key might have been
  /// changed.
  /// </dd> <dt>INTERNAL_FAILURE</dt> <dd>
  /// There was an error during a request. Before you can continue to work with
  /// DNSSEC signing, including with key-signing keys (KSKs), you must correct the
  /// problem by enabling or disabling DNSSEC signing for the hosted zone.
  /// </dd> </dl>
  final String? serveSignature;

  /// The status message provided for the following DNSSEC signing status:
  /// <code>INTERNAL_FAILURE</code>. The status message includes information about
  /// what the problem might be and steps that you can take to correct the issue.
  final String? statusMessage;

  DNSSECStatus({
    this.serveSignature,
    this.statusMessage,
  });
  factory DNSSECStatus.fromXml(_s.XmlElement elem) {
    return DNSSECStatus(
      serveSignature: _s.extractXmlStringValue(elem, 'ServeSignature'),
      statusMessage: _s.extractXmlStringValue(elem, 'StatusMessage'),
    );
  }

  Map<String, dynamic> toJson() {
    final serveSignature = this.serveSignature;
    final statusMessage = this.statusMessage;
    return {
      if (serveSignature != null) 'ServeSignature': serveSignature,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class DeactivateKeySigningKeyResponse {
  final ChangeInfo changeInfo;

  DeactivateKeySigningKeyResponse({
    required this.changeInfo,
  });
  factory DeactivateKeySigningKeyResponse.fromXml(_s.XmlElement elem) {
    return DeactivateKeySigningKeyResponse(
      changeInfo: ChangeInfo.fromXml(_s.extractXmlChild(elem, 'ChangeInfo')!),
    );
  }

  Map<String, dynamic> toJson() {
    final changeInfo = this.changeInfo;
    return {
      'ChangeInfo': changeInfo,
    };
  }
}

/// A complex type that lists the name servers in a delegation set, as well as
/// the <code>CallerReference</code> and the <code>ID</code> for the delegation
/// set.
class DelegationSet {
  /// A complex type that contains a list of the authoritative name servers for a
  /// hosted zone or for a reusable delegation set.
  final List<String> nameServers;

  /// The value that you specified for <code>CallerReference</code> when you
  /// created the reusable delegation set.
  final String? callerReference;

  /// The ID that Amazon Route 53 assigns to a reusable delegation set.
  final String? id;

  DelegationSet({
    required this.nameServers,
    this.callerReference,
    this.id,
  });
  factory DelegationSet.fromXml(_s.XmlElement elem) {
    return DelegationSet(
      nameServers: _s.extractXmlStringListValues(
          _s.extractXmlChild(elem, 'NameServers')!, 'NameServer'),
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference'),
      id: _s.extractXmlStringValue(elem, 'Id'),
    );
  }

  Map<String, dynamic> toJson() {
    final nameServers = this.nameServers;
    final callerReference = this.callerReference;
    final id = this.id;
    return {
      'NameServers': nameServers,
      if (callerReference != null) 'CallerReference': callerReference,
      if (id != null) 'Id': id,
    };
  }
}

class DeleteCidrCollectionResponse {
  DeleteCidrCollectionResponse();
  factory DeleteCidrCollectionResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteCidrCollectionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element.
class DeleteHealthCheckResponse {
  DeleteHealthCheckResponse();
  factory DeleteHealthCheckResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteHealthCheckResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A complex type that contains the response to a <code>DeleteHostedZone</code>
/// request.
class DeleteHostedZoneResponse {
  /// A complex type that contains the ID, the status, and the date and time of a
  /// request to delete a hosted zone.
  final ChangeInfo changeInfo;

  DeleteHostedZoneResponse({
    required this.changeInfo,
  });
  factory DeleteHostedZoneResponse.fromXml(_s.XmlElement elem) {
    return DeleteHostedZoneResponse(
      changeInfo: ChangeInfo.fromXml(_s.extractXmlChild(elem, 'ChangeInfo')!),
    );
  }

  Map<String, dynamic> toJson() {
    final changeInfo = this.changeInfo;
    return {
      'ChangeInfo': changeInfo,
    };
  }
}

class DeleteKeySigningKeyResponse {
  final ChangeInfo changeInfo;

  DeleteKeySigningKeyResponse({
    required this.changeInfo,
  });
  factory DeleteKeySigningKeyResponse.fromXml(_s.XmlElement elem) {
    return DeleteKeySigningKeyResponse(
      changeInfo: ChangeInfo.fromXml(_s.extractXmlChild(elem, 'ChangeInfo')!),
    );
  }

  Map<String, dynamic> toJson() {
    final changeInfo = this.changeInfo;
    return {
      'ChangeInfo': changeInfo,
    };
  }
}

class DeleteQueryLoggingConfigResponse {
  DeleteQueryLoggingConfigResponse();
  factory DeleteQueryLoggingConfigResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteQueryLoggingConfigResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element.
class DeleteReusableDelegationSetResponse {
  DeleteReusableDelegationSetResponse();
  factory DeleteReusableDelegationSetResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteReusableDelegationSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element.
class DeleteTrafficPolicyInstanceResponse {
  DeleteTrafficPolicyInstanceResponse();
  factory DeleteTrafficPolicyInstanceResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteTrafficPolicyInstanceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty element.
class DeleteTrafficPolicyResponse {
  DeleteTrafficPolicyResponse();
  factory DeleteTrafficPolicyResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteTrafficPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A complex type that contains information about the request to remove
/// authorization to associate a VPC that was created by one Amazon Web Services
/// account with a hosted zone that was created with a different Amazon Web
/// Services account.
class DeleteVPCAssociationAuthorizationRequest {
  /// When removing authorization to associate a VPC that was created by one
  /// Amazon Web Services account with a hosted zone that was created with a
  /// different Amazon Web Services account, the ID of the hosted zone.
  final String hostedZoneId;

  /// When removing authorization to associate a VPC that was created by one
  /// Amazon Web Services account with a hosted zone that was created with a
  /// different Amazon Web Services account, a complex type that includes the ID
  /// and region of the VPC.
  final VPC vpc;

  DeleteVPCAssociationAuthorizationRequest({
    required this.hostedZoneId,
    required this.vpc,
  });

  Map<String, dynamic> toJson() {
    final hostedZoneId = this.hostedZoneId;
    final vpc = this.vpc;
    return {
      'VPC': vpc,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final hostedZoneId = this.hostedZoneId;
    final vpc = this.vpc;
    final $children = <_s.XmlNode>[
      vpc.toXml('VPC'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// Empty response for the request.
class DeleteVPCAssociationAuthorizationResponse {
  DeleteVPCAssociationAuthorizationResponse();
  factory DeleteVPCAssociationAuthorizationResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteVPCAssociationAuthorizationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// For the metric that the CloudWatch alarm is associated with, a complex type
/// that contains information about one dimension.
class Dimension {
  /// For the metric that the CloudWatch alarm is associated with, the name of one
  /// dimension.
  final String name;

  /// For the metric that the CloudWatch alarm is associated with, the value of
  /// one dimension.
  final String value;

  Dimension({
    required this.name,
    required this.value,
  });
  factory Dimension.fromXml(_s.XmlElement elem) {
    return Dimension(
      name: _s.extractXmlStringValue(elem, 'Name')!,
      value: _s.extractXmlStringValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

class DisableHostedZoneDNSSECResponse {
  final ChangeInfo changeInfo;

  DisableHostedZoneDNSSECResponse({
    required this.changeInfo,
  });
  factory DisableHostedZoneDNSSECResponse.fromXml(_s.XmlElement elem) {
    return DisableHostedZoneDNSSECResponse(
      changeInfo: ChangeInfo.fromXml(_s.extractXmlChild(elem, 'ChangeInfo')!),
    );
  }

  Map<String, dynamic> toJson() {
    final changeInfo = this.changeInfo;
    return {
      'ChangeInfo': changeInfo,
    };
  }
}

/// A complex type that contains information about the VPC that you want to
/// disassociate from a specified private hosted zone.
class DisassociateVPCFromHostedZoneRequest {
  /// The ID of the private hosted zone that you want to disassociate a VPC from.
  final String hostedZoneId;

  /// A complex type that contains information about the VPC that you're
  /// disassociating from the specified hosted zone.
  final VPC vpc;

  /// <i>Optional:</i> A comment about the disassociation request.
  final String? comment;

  DisassociateVPCFromHostedZoneRequest({
    required this.hostedZoneId,
    required this.vpc,
    this.comment,
  });

  Map<String, dynamic> toJson() {
    final hostedZoneId = this.hostedZoneId;
    final vpc = this.vpc;
    final comment = this.comment;
    return {
      'VPC': vpc,
      if (comment != null) 'Comment': comment,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final hostedZoneId = this.hostedZoneId;
    final vpc = this.vpc;
    final comment = this.comment;
    final $children = <_s.XmlNode>[
      vpc.toXml('VPC'),
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the response information for the disassociate
/// request.
class DisassociateVPCFromHostedZoneResponse {
  /// A complex type that describes the changes made to the specified private
  /// hosted zone.
  final ChangeInfo changeInfo;

  DisassociateVPCFromHostedZoneResponse({
    required this.changeInfo,
  });
  factory DisassociateVPCFromHostedZoneResponse.fromXml(_s.XmlElement elem) {
    return DisassociateVPCFromHostedZoneResponse(
      changeInfo: ChangeInfo.fromXml(_s.extractXmlChild(elem, 'ChangeInfo')!),
    );
  }

  Map<String, dynamic> toJson() {
    final changeInfo = this.changeInfo;
    return {
      'ChangeInfo': changeInfo,
    };
  }
}

class EnableHostedZoneDNSSECResponse {
  final ChangeInfo changeInfo;

  EnableHostedZoneDNSSECResponse({
    required this.changeInfo,
  });
  factory EnableHostedZoneDNSSECResponse.fromXml(_s.XmlElement elem) {
    return EnableHostedZoneDNSSECResponse(
      changeInfo: ChangeInfo.fromXml(_s.extractXmlChild(elem, 'ChangeInfo')!),
    );
  }

  Map<String, dynamic> toJson() {
    final changeInfo = this.changeInfo;
    return {
      'ChangeInfo': changeInfo,
    };
  }
}

/// A complex type that contains information about a geographic location.
class GeoLocation {
  /// The two-letter code for the continent.
  ///
  /// Amazon Route 53 supports the following continent codes:
  ///
  /// <ul>
  /// <li>
  /// <b>AF</b>: Africa
  /// </li>
  /// <li>
  /// <b>AN</b>: Antarctica
  /// </li>
  /// <li>
  /// <b>AS</b>: Asia
  /// </li>
  /// <li>
  /// <b>EU</b>: Europe
  /// </li>
  /// <li>
  /// <b>OC</b>: Oceania
  /// </li>
  /// <li>
  /// <b>NA</b>: North America
  /// </li>
  /// <li>
  /// <b>SA</b>: South America
  /// </li>
  /// </ul>
  /// Constraint: Specifying <code>ContinentCode</code> with either
  /// <code>CountryCode</code> or <code>SubdivisionCode</code> returns an
  /// <code>InvalidInput</code> error.
  final String? continentCode;

  /// For geolocation resource record sets, the two-letter code for a country.
  ///
  /// Amazon Route 53 uses the two-letter country codes that are specified in <a
  /// href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO standard 3166-1
  /// alpha-2</a>.
  ///
  /// Route 53 also supports the country code <b>UA</b> for Ukraine.
  final String? countryCode;

  /// For geolocation resource record sets, the two-letter code for a state of the
  /// United States. Route 53 doesn't support any other values for
  /// <code>SubdivisionCode</code>. For a list of state abbreviations, see <a
  /// href="https://pe.usps.com/text/pub28/28apb.htm">Appendix B: Two–Letter State
  /// and Possession Abbreviations</a> on the United States Postal Service
  /// website.
  ///
  /// If you specify <code>subdivisioncode</code>, you must also specify
  /// <code>US</code> for <code>CountryCode</code>.
  final String? subdivisionCode;

  GeoLocation({
    this.continentCode,
    this.countryCode,
    this.subdivisionCode,
  });
  factory GeoLocation.fromXml(_s.XmlElement elem) {
    return GeoLocation(
      continentCode: _s.extractXmlStringValue(elem, 'ContinentCode'),
      countryCode: _s.extractXmlStringValue(elem, 'CountryCode'),
      subdivisionCode: _s.extractXmlStringValue(elem, 'SubdivisionCode'),
    );
  }

  Map<String, dynamic> toJson() {
    final continentCode = this.continentCode;
    final countryCode = this.countryCode;
    final subdivisionCode = this.subdivisionCode;
    return {
      if (continentCode != null) 'ContinentCode': continentCode,
      if (countryCode != null) 'CountryCode': countryCode,
      if (subdivisionCode != null) 'SubdivisionCode': subdivisionCode,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final continentCode = this.continentCode;
    final countryCode = this.countryCode;
    final subdivisionCode = this.subdivisionCode;
    final $children = <_s.XmlNode>[
      if (continentCode != null)
        _s.encodeXmlStringValue('ContinentCode', continentCode),
      if (countryCode != null)
        _s.encodeXmlStringValue('CountryCode', countryCode),
      if (subdivisionCode != null)
        _s.encodeXmlStringValue('SubdivisionCode', subdivisionCode),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the codes and full continent, country, and
/// subdivision names for the specified <code>geolocation</code> code.
class GeoLocationDetails {
  /// The two-letter code for the continent.
  final String? continentCode;

  /// The full name of the continent.
  final String? continentName;

  /// The two-letter code for the country.
  final String? countryCode;

  /// The name of the country.
  final String? countryName;

  /// The code for the subdivision, such as a particular state within the United
  /// States. For a list of US state abbreviations, see <a
  /// href="https://pe.usps.com/text/pub28/28apb.htm">Appendix B: Two–Letter State
  /// and Possession Abbreviations</a> on the United States Postal Service
  /// website. For a list of all supported subdivision codes, use the <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListGeoLocations.html">ListGeoLocations</a>
  /// API.
  final String? subdivisionCode;

  /// The full name of the subdivision. Route 53 currently supports only states in
  /// the United States.
  final String? subdivisionName;

  GeoLocationDetails({
    this.continentCode,
    this.continentName,
    this.countryCode,
    this.countryName,
    this.subdivisionCode,
    this.subdivisionName,
  });
  factory GeoLocationDetails.fromXml(_s.XmlElement elem) {
    return GeoLocationDetails(
      continentCode: _s.extractXmlStringValue(elem, 'ContinentCode'),
      continentName: _s.extractXmlStringValue(elem, 'ContinentName'),
      countryCode: _s.extractXmlStringValue(elem, 'CountryCode'),
      countryName: _s.extractXmlStringValue(elem, 'CountryName'),
      subdivisionCode: _s.extractXmlStringValue(elem, 'SubdivisionCode'),
      subdivisionName: _s.extractXmlStringValue(elem, 'SubdivisionName'),
    );
  }

  Map<String, dynamic> toJson() {
    final continentCode = this.continentCode;
    final continentName = this.continentName;
    final countryCode = this.countryCode;
    final countryName = this.countryName;
    final subdivisionCode = this.subdivisionCode;
    final subdivisionName = this.subdivisionName;
    return {
      if (continentCode != null) 'ContinentCode': continentCode,
      if (continentName != null) 'ContinentName': continentName,
      if (countryCode != null) 'CountryCode': countryCode,
      if (countryName != null) 'CountryName': countryName,
      if (subdivisionCode != null) 'SubdivisionCode': subdivisionCode,
      if (subdivisionName != null) 'SubdivisionName': subdivisionName,
    };
  }
}

/// (Resource record sets only): A complex type that lets you specify where your
/// resources are located. Only one of <code>LocalZoneGroup</code>,
/// <code>Coordinates</code>, or <code>Amazon Web ServicesRegion</code> is
/// allowed per request at a time.
///
/// For more information about geoproximity routing, see <a
/// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy-geoproximity.html">Geoproximity
/// routing</a> in the <i>Amazon Route 53 Developer Guide</i>.
class GeoProximityLocation {
  /// The Amazon Web Services Region the resource you are directing DNS traffic
  /// to, is in.
  final String? awsRegion;

  /// The bias increases or decreases the size of the geographic region from which
  /// Route 53 routes traffic to a resource.
  ///
  /// To use <code>Bias</code> to change the size of the geographic region,
  /// specify the applicable value for the bias:
  ///
  /// <ul>
  /// <li>
  /// To expand the size of the geographic region from which Route 53 routes
  /// traffic to a resource, specify a positive integer from 1 to 99 for the bias.
  /// Route 53 shrinks the size of adjacent regions.
  /// </li>
  /// <li>
  /// To shrink the size of the geographic region from which Route 53 routes
  /// traffic to a resource, specify a negative bias of -1 to -99. Route 53
  /// expands the size of adjacent regions.
  /// </li>
  /// </ul>
  final int? bias;

  /// Contains the longitude and latitude for a geographic region.
  final Coordinates? coordinates;

  /// Specifies an Amazon Web Services Local Zone Group.
  ///
  /// A local Zone Group is usually the Local Zone code without the ending
  /// character. For example, if the Local Zone is <code>us-east-1-bue-1a</code>
  /// the Local Zone Group is <code>us-east-1-bue-1</code>.
  ///
  /// You can identify the Local Zones Group for a specific Local Zone by using
  /// the <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-availability-zones.html">describe-availability-zones</a>
  /// CLI command:
  ///
  /// This command returns: <code>"GroupName": "us-west-2-den-1"</code>,
  /// specifying that the Local Zone <code>us-west-2-den-1a</code> belongs to the
  /// Local Zone Group <code>us-west-2-den-1</code>.
  final String? localZoneGroup;

  GeoProximityLocation({
    this.awsRegion,
    this.bias,
    this.coordinates,
    this.localZoneGroup,
  });
  factory GeoProximityLocation.fromXml(_s.XmlElement elem) {
    return GeoProximityLocation(
      awsRegion: _s.extractXmlStringValue(elem, 'AWSRegion'),
      bias: _s.extractXmlIntValue(elem, 'Bias'),
      coordinates:
          _s.extractXmlChild(elem, 'Coordinates')?.let(Coordinates.fromXml),
      localZoneGroup: _s.extractXmlStringValue(elem, 'LocalZoneGroup'),
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final bias = this.bias;
    final coordinates = this.coordinates;
    final localZoneGroup = this.localZoneGroup;
    return {
      if (awsRegion != null) 'AWSRegion': awsRegion,
      if (bias != null) 'Bias': bias,
      if (coordinates != null) 'Coordinates': coordinates,
      if (localZoneGroup != null) 'LocalZoneGroup': localZoneGroup,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final awsRegion = this.awsRegion;
    final bias = this.bias;
    final coordinates = this.coordinates;
    final localZoneGroup = this.localZoneGroup;
    final $children = <_s.XmlNode>[
      if (awsRegion != null) _s.encodeXmlStringValue('AWSRegion', awsRegion),
      if (localZoneGroup != null)
        _s.encodeXmlStringValue('LocalZoneGroup', localZoneGroup),
      if (coordinates != null) coordinates.toXml('Coordinates'),
      if (bias != null) _s.encodeXmlIntValue('Bias', bias),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the requested limit.
class GetAccountLimitResponse {
  /// The current number of entities that you have created of the specified type.
  /// For example, if you specified <code>MAX_HEALTH_CHECKS_BY_OWNER</code> for
  /// the value of <code>Type</code> in the request, the value of
  /// <code>Count</code> is the current number of health checks that you have
  /// created using the current account.
  final int count;

  /// The current setting for the specified limit. For example, if you specified
  /// <code>MAX_HEALTH_CHECKS_BY_OWNER</code> for the value of <code>Type</code>
  /// in the request, the value of <code>Limit</code> is the maximum number of
  /// health checks that you can create using the current account.
  final AccountLimit limit;

  GetAccountLimitResponse({
    required this.count,
    required this.limit,
  });
  factory GetAccountLimitResponse.fromXml(_s.XmlElement elem) {
    return GetAccountLimitResponse(
      count: _s.extractXmlIntValue(elem, 'Count')!,
      limit: AccountLimit.fromXml(_s.extractXmlChild(elem, 'Limit')!),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final limit = this.limit;
    return {
      'Count': count,
      'Limit': limit,
    };
  }
}

/// A complex type that contains the <code>ChangeInfo</code> element.
class GetChangeResponse {
  /// A complex type that contains information about the specified change batch.
  final ChangeInfo changeInfo;

  GetChangeResponse({
    required this.changeInfo,
  });
  factory GetChangeResponse.fromXml(_s.XmlElement elem) {
    return GetChangeResponse(
      changeInfo: ChangeInfo.fromXml(_s.extractXmlChild(elem, 'ChangeInfo')!),
    );
  }

  Map<String, dynamic> toJson() {
    final changeInfo = this.changeInfo;
    return {
      'ChangeInfo': changeInfo,
    };
  }
}

/// A complex type that contains the <code>CheckerIpRanges</code> element.
class GetCheckerIpRangesResponse {
  /// A complex type that contains sorted list of IP ranges in CIDR format for
  /// Amazon Route 53 health checkers.
  final List<String> checkerIpRanges;

  GetCheckerIpRangesResponse({
    required this.checkerIpRanges,
  });
  factory GetCheckerIpRangesResponse.fromXml(_s.XmlElement elem) {
    return GetCheckerIpRangesResponse(
      checkerIpRanges: _s.extractXmlStringListValues(
          _s.extractXmlChild(elem, 'CheckerIpRanges')!, 'member'),
    );
  }

  Map<String, dynamic> toJson() {
    final checkerIpRanges = this.checkerIpRanges;
    return {
      'CheckerIpRanges': checkerIpRanges,
    };
  }
}

class GetDNSSECResponse {
  /// The key-signing keys (KSKs) in your account.
  final List<KeySigningKey> keySigningKeys;

  /// A string representing the status of DNSSEC.
  final DNSSECStatus status;

  GetDNSSECResponse({
    required this.keySigningKeys,
    required this.status,
  });
  factory GetDNSSECResponse.fromXml(_s.XmlElement elem) {
    return GetDNSSECResponse(
      keySigningKeys: _s
          .extractXmlChild(elem, 'KeySigningKeys')!
          .findElements('member')
          .map(KeySigningKey.fromXml)
          .toList(),
      status: DNSSECStatus.fromXml(_s.extractXmlChild(elem, 'Status')!),
    );
  }

  Map<String, dynamic> toJson() {
    final keySigningKeys = this.keySigningKeys;
    final status = this.status;
    return {
      'KeySigningKeys': keySigningKeys,
      'Status': status,
    };
  }
}

/// A complex type that contains the response information for the specified
/// geolocation code.
class GetGeoLocationResponse {
  /// A complex type that contains the codes and full continent, country, and
  /// subdivision names for the specified geolocation code.
  final GeoLocationDetails geoLocationDetails;

  GetGeoLocationResponse({
    required this.geoLocationDetails,
  });
  factory GetGeoLocationResponse.fromXml(_s.XmlElement elem) {
    return GetGeoLocationResponse(
      geoLocationDetails: GeoLocationDetails.fromXml(
          _s.extractXmlChild(elem, 'GeoLocationDetails')!),
    );
  }

  Map<String, dynamic> toJson() {
    final geoLocationDetails = this.geoLocationDetails;
    return {
      'GeoLocationDetails': geoLocationDetails,
    };
  }
}

/// A complex type that contains the response to a
/// <code>GetHealthCheckCount</code> request.
class GetHealthCheckCountResponse {
  /// The number of health checks associated with the current Amazon Web Services
  /// account.
  final int healthCheckCount;

  GetHealthCheckCountResponse({
    required this.healthCheckCount,
  });
  factory GetHealthCheckCountResponse.fromXml(_s.XmlElement elem) {
    return GetHealthCheckCountResponse(
      healthCheckCount: _s.extractXmlIntValue(elem, 'HealthCheckCount')!,
    );
  }

  Map<String, dynamic> toJson() {
    final healthCheckCount = this.healthCheckCount;
    return {
      'HealthCheckCount': healthCheckCount,
    };
  }
}

/// A complex type that contains the response to a
/// <code>GetHealthCheckLastFailureReason</code> request.
class GetHealthCheckLastFailureReasonResponse {
  /// A list that contains one <code>Observation</code> element for each Amazon
  /// Route 53 health checker that is reporting a last failure reason.
  final List<HealthCheckObservation> healthCheckObservations;

  GetHealthCheckLastFailureReasonResponse({
    required this.healthCheckObservations,
  });
  factory GetHealthCheckLastFailureReasonResponse.fromXml(_s.XmlElement elem) {
    return GetHealthCheckLastFailureReasonResponse(
      healthCheckObservations: _s
          .extractXmlChild(elem, 'HealthCheckObservations')!
          .findElements('HealthCheckObservation')
          .map(HealthCheckObservation.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final healthCheckObservations = this.healthCheckObservations;
    return {
      'HealthCheckObservations': healthCheckObservations,
    };
  }
}

/// A complex type that contains the response to a <code>GetHealthCheck</code>
/// request.
class GetHealthCheckResponse {
  /// A complex type that contains information about one health check that is
  /// associated with the current Amazon Web Services account.
  final HealthCheck healthCheck;

  GetHealthCheckResponse({
    required this.healthCheck,
  });
  factory GetHealthCheckResponse.fromXml(_s.XmlElement elem) {
    return GetHealthCheckResponse(
      healthCheck:
          HealthCheck.fromXml(_s.extractXmlChild(elem, 'HealthCheck')!),
    );
  }

  Map<String, dynamic> toJson() {
    final healthCheck = this.healthCheck;
    return {
      'HealthCheck': healthCheck,
    };
  }
}

/// A complex type that contains the response to a <code>GetHealthCheck</code>
/// request.
class GetHealthCheckStatusResponse {
  /// A list that contains one <code>HealthCheckObservation</code> element for
  /// each Amazon Route 53 health checker that is reporting a status about the
  /// health check endpoint.
  final List<HealthCheckObservation> healthCheckObservations;

  GetHealthCheckStatusResponse({
    required this.healthCheckObservations,
  });
  factory GetHealthCheckStatusResponse.fromXml(_s.XmlElement elem) {
    return GetHealthCheckStatusResponse(
      healthCheckObservations: _s
          .extractXmlChild(elem, 'HealthCheckObservations')!
          .findElements('HealthCheckObservation')
          .map(HealthCheckObservation.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final healthCheckObservations = this.healthCheckObservations;
    return {
      'HealthCheckObservations': healthCheckObservations,
    };
  }
}

/// A complex type that contains the response to a
/// <code>GetHostedZoneCount</code> request.
class GetHostedZoneCountResponse {
  /// The total number of public and private hosted zones that are associated with
  /// the current Amazon Web Services account.
  final int hostedZoneCount;

  GetHostedZoneCountResponse({
    required this.hostedZoneCount,
  });
  factory GetHostedZoneCountResponse.fromXml(_s.XmlElement elem) {
    return GetHostedZoneCountResponse(
      hostedZoneCount: _s.extractXmlIntValue(elem, 'HostedZoneCount')!,
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZoneCount = this.hostedZoneCount;
    return {
      'HostedZoneCount': hostedZoneCount,
    };
  }
}

/// A complex type that contains the requested limit.
class GetHostedZoneLimitResponse {
  /// The current number of entities that you have created of the specified type.
  /// For example, if you specified <code>MAX_RRSETS_BY_ZONE</code> for the value
  /// of <code>Type</code> in the request, the value of <code>Count</code> is the
  /// current number of records that you have created in the specified hosted
  /// zone.
  final int count;

  /// The current setting for the specified limit. For example, if you specified
  /// <code>MAX_RRSETS_BY_ZONE</code> for the value of <code>Type</code> in the
  /// request, the value of <code>Limit</code> is the maximum number of records
  /// that you can create in the specified hosted zone.
  final HostedZoneLimit limit;

  GetHostedZoneLimitResponse({
    required this.count,
    required this.limit,
  });
  factory GetHostedZoneLimitResponse.fromXml(_s.XmlElement elem) {
    return GetHostedZoneLimitResponse(
      count: _s.extractXmlIntValue(elem, 'Count')!,
      limit: HostedZoneLimit.fromXml(_s.extractXmlChild(elem, 'Limit')!),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final limit = this.limit;
    return {
      'Count': count,
      'Limit': limit,
    };
  }
}

/// A complex type that contain the response to a <code>GetHostedZone</code>
/// request.
class GetHostedZoneResponse {
  /// A complex type that contains general information about the specified hosted
  /// zone.
  final HostedZone hostedZone;

  /// A complex type that lists the Amazon Route 53 name servers for the specified
  /// hosted zone.
  final DelegationSet? delegationSet;

  /// A complex type that contains information about the VPCs that are associated
  /// with the specified hosted zone.
  final List<VPC>? vPCs;

  GetHostedZoneResponse({
    required this.hostedZone,
    this.delegationSet,
    this.vPCs,
  });
  factory GetHostedZoneResponse.fromXml(_s.XmlElement elem) {
    return GetHostedZoneResponse(
      hostedZone: HostedZone.fromXml(_s.extractXmlChild(elem, 'HostedZone')!),
      delegationSet:
          _s.extractXmlChild(elem, 'DelegationSet')?.let(DelegationSet.fromXml),
      vPCs: _s
          .extractXmlChild(elem, 'VPCs')
          ?.let((elem) => elem.findElements('VPC').map(VPC.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZone = this.hostedZone;
    final delegationSet = this.delegationSet;
    final vPCs = this.vPCs;
    return {
      'HostedZone': hostedZone,
      if (delegationSet != null) 'DelegationSet': delegationSet,
      if (vPCs != null) 'VPCs': vPCs,
    };
  }
}

class GetQueryLoggingConfigResponse {
  /// A complex type that contains information about the query logging
  /// configuration that you specified in a <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetQueryLoggingConfig.html">GetQueryLoggingConfig</a>
  /// request.
  final QueryLoggingConfig queryLoggingConfig;

  GetQueryLoggingConfigResponse({
    required this.queryLoggingConfig,
  });
  factory GetQueryLoggingConfigResponse.fromXml(_s.XmlElement elem) {
    return GetQueryLoggingConfigResponse(
      queryLoggingConfig: QueryLoggingConfig.fromXml(
          _s.extractXmlChild(elem, 'QueryLoggingConfig')!),
    );
  }

  Map<String, dynamic> toJson() {
    final queryLoggingConfig = this.queryLoggingConfig;
    return {
      'QueryLoggingConfig': queryLoggingConfig,
    };
  }
}

/// A complex type that contains the requested limit.
class GetReusableDelegationSetLimitResponse {
  /// The current number of hosted zones that you can associate with the specified
  /// reusable delegation set.
  final int count;

  /// The current setting for the limit on hosted zones that you can associate
  /// with the specified reusable delegation set.
  final ReusableDelegationSetLimit limit;

  GetReusableDelegationSetLimitResponse({
    required this.count,
    required this.limit,
  });
  factory GetReusableDelegationSetLimitResponse.fromXml(_s.XmlElement elem) {
    return GetReusableDelegationSetLimitResponse(
      count: _s.extractXmlIntValue(elem, 'Count')!,
      limit: ReusableDelegationSetLimit.fromXml(
          _s.extractXmlChild(elem, 'Limit')!),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final limit = this.limit;
    return {
      'Count': count,
      'Limit': limit,
    };
  }
}

/// A complex type that contains the response to the
/// <code>GetReusableDelegationSet</code> request.
class GetReusableDelegationSetResponse {
  /// A complex type that contains information about the reusable delegation set.
  final DelegationSet delegationSet;

  GetReusableDelegationSetResponse({
    required this.delegationSet,
  });
  factory GetReusableDelegationSetResponse.fromXml(_s.XmlElement elem) {
    return GetReusableDelegationSetResponse(
      delegationSet:
          DelegationSet.fromXml(_s.extractXmlChild(elem, 'DelegationSet')!),
    );
  }

  Map<String, dynamic> toJson() {
    final delegationSet = this.delegationSet;
    return {
      'DelegationSet': delegationSet,
    };
  }
}

/// A complex type that contains information about the resource record sets that
/// Amazon Route 53 created based on a specified traffic policy.
class GetTrafficPolicyInstanceCountResponse {
  /// The number of traffic policy instances that are associated with the current
  /// Amazon Web Services account.
  final int trafficPolicyInstanceCount;

  GetTrafficPolicyInstanceCountResponse({
    required this.trafficPolicyInstanceCount,
  });
  factory GetTrafficPolicyInstanceCountResponse.fromXml(_s.XmlElement elem) {
    return GetTrafficPolicyInstanceCountResponse(
      trafficPolicyInstanceCount:
          _s.extractXmlIntValue(elem, 'TrafficPolicyInstanceCount')!,
    );
  }

  Map<String, dynamic> toJson() {
    final trafficPolicyInstanceCount = this.trafficPolicyInstanceCount;
    return {
      'TrafficPolicyInstanceCount': trafficPolicyInstanceCount,
    };
  }
}

/// A complex type that contains information about the resource record sets that
/// Amazon Route 53 created based on a specified traffic policy.
class GetTrafficPolicyInstanceResponse {
  /// A complex type that contains settings for the traffic policy instance.
  final TrafficPolicyInstance trafficPolicyInstance;

  GetTrafficPolicyInstanceResponse({
    required this.trafficPolicyInstance,
  });
  factory GetTrafficPolicyInstanceResponse.fromXml(_s.XmlElement elem) {
    return GetTrafficPolicyInstanceResponse(
      trafficPolicyInstance: TrafficPolicyInstance.fromXml(
          _s.extractXmlChild(elem, 'TrafficPolicyInstance')!),
    );
  }

  Map<String, dynamic> toJson() {
    final trafficPolicyInstance = this.trafficPolicyInstance;
    return {
      'TrafficPolicyInstance': trafficPolicyInstance,
    };
  }
}

/// A complex type that contains the response information for the request.
class GetTrafficPolicyResponse {
  /// A complex type that contains settings for the specified traffic policy.
  final TrafficPolicy trafficPolicy;

  GetTrafficPolicyResponse({
    required this.trafficPolicy,
  });
  factory GetTrafficPolicyResponse.fromXml(_s.XmlElement elem) {
    return GetTrafficPolicyResponse(
      trafficPolicy:
          TrafficPolicy.fromXml(_s.extractXmlChild(elem, 'TrafficPolicy')!),
    );
  }

  Map<String, dynamic> toJson() {
    final trafficPolicy = this.trafficPolicy;
    return {
      'TrafficPolicy': trafficPolicy,
    };
  }
}

/// A complex type that contains information about one health check that is
/// associated with the current Amazon Web Services account.
class HealthCheck {
  /// A unique string that you specified when you created the health check.
  final String callerReference;

  /// A complex type that contains detailed information about one health check.
  final HealthCheckConfig healthCheckConfig;

  /// The version of the health check. You can optionally pass this value in a
  /// call to <code>UpdateHealthCheck</code> to prevent overwriting another change
  /// to the health check.
  final int healthCheckVersion;

  /// The identifier that Amazon Route 53 assigned to the health check when you
  /// created it. When you add or update a resource record set, you use this value
  /// to specify which health check to use. The value can be up to 64 characters
  /// long.
  final String id;

  /// A complex type that contains information about the CloudWatch alarm that
  /// Amazon Route 53 is monitoring for this health check.
  final CloudWatchAlarmConfiguration? cloudWatchAlarmConfiguration;

  /// If the health check was created by another service, the service that created
  /// the health check. When a health check is created by another service, you
  /// can't edit or delete it using Amazon Route 53.
  final LinkedService? linkedService;

  HealthCheck({
    required this.callerReference,
    required this.healthCheckConfig,
    required this.healthCheckVersion,
    required this.id,
    this.cloudWatchAlarmConfiguration,
    this.linkedService,
  });
  factory HealthCheck.fromXml(_s.XmlElement elem) {
    return HealthCheck(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference')!,
      healthCheckConfig: HealthCheckConfig.fromXml(
          _s.extractXmlChild(elem, 'HealthCheckConfig')!),
      healthCheckVersion: _s.extractXmlIntValue(elem, 'HealthCheckVersion')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      cloudWatchAlarmConfiguration: _s
          .extractXmlChild(elem, 'CloudWatchAlarmConfiguration')
          ?.let(CloudWatchAlarmConfiguration.fromXml),
      linkedService:
          _s.extractXmlChild(elem, 'LinkedService')?.let(LinkedService.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final callerReference = this.callerReference;
    final healthCheckConfig = this.healthCheckConfig;
    final healthCheckVersion = this.healthCheckVersion;
    final id = this.id;
    final cloudWatchAlarmConfiguration = this.cloudWatchAlarmConfiguration;
    final linkedService = this.linkedService;
    return {
      'CallerReference': callerReference,
      'HealthCheckConfig': healthCheckConfig,
      'HealthCheckVersion': healthCheckVersion,
      'Id': id,
      if (cloudWatchAlarmConfiguration != null)
        'CloudWatchAlarmConfiguration': cloudWatchAlarmConfiguration,
      if (linkedService != null) 'LinkedService': linkedService,
    };
  }
}

/// A complex type that contains information about the health check.
class HealthCheckConfig {
  /// The type of health check that you want to create, which indicates how Amazon
  /// Route 53 determines whether an endpoint is healthy.
  /// <important>
  /// You can't change the value of <code>Type</code> after you create a health
  /// check.
  /// </important>
  /// You can create the following types of health checks:
  ///
  /// <ul>
  /// <li>
  /// <b>HTTP</b>: Route 53 tries to establish a TCP connection. If successful,
  /// Route 53 submits an HTTP request and waits for an HTTP status code of 200 or
  /// greater and less than 400.
  /// </li>
  /// <li>
  /// <b>HTTPS</b>: Route 53 tries to establish a TCP connection. If successful,
  /// Route 53 submits an HTTPS request and waits for an HTTP status code of 200
  /// or greater and less than 400.
  /// <important>
  /// If you specify <code>HTTPS</code> for the value of <code>Type</code>, the
  /// endpoint must support TLS v1.0 or later.
  /// </important> </li>
  /// <li>
  /// <b>HTTP_STR_MATCH</b>: Route 53 tries to establish a TCP connection. If
  /// successful, Route 53 submits an HTTP request and searches the first 5,120
  /// bytes of the response body for the string that you specify in
  /// <code>SearchString</code>.
  /// </li>
  /// <li>
  /// <b>HTTPS_STR_MATCH</b>: Route 53 tries to establish a TCP connection. If
  /// successful, Route 53 submits an <code>HTTPS</code> request and searches the
  /// first 5,120 bytes of the response body for the string that you specify in
  /// <code>SearchString</code>.
  /// </li>
  /// <li>
  /// <b>TCP</b>: Route 53 tries to establish a TCP connection.
  /// </li>
  /// <li>
  /// <b>CLOUDWATCH_METRIC</b>: The health check is associated with a CloudWatch
  /// alarm. If the state of the alarm is <code>OK</code>, the health check is
  /// considered healthy. If the state is <code>ALARM</code>, the health check is
  /// considered unhealthy. If CloudWatch doesn't have sufficient data to
  /// determine whether the state is <code>OK</code> or <code>ALARM</code>, the
  /// health check status depends on the setting for
  /// <code>InsufficientDataHealthStatus</code>: <code>Healthy</code>,
  /// <code>Unhealthy</code>, or <code>LastKnownStatus</code>.
  /// </li>
  /// <li>
  /// <b>CALCULATED</b>: For health checks that monitor the status of other health
  /// checks, Route 53 adds up the number of health checks that Route 53 health
  /// checkers consider to be healthy and compares that number with the value of
  /// <code>HealthThreshold</code>.
  /// </li>
  /// <li>
  /// <b>RECOVERY_CONTROL</b>: The health check is associated with a Route53
  /// Application Recovery Controller routing control. If the routing control
  /// state is <code>ON</code>, the health check is considered healthy. If the
  /// state is <code>OFF</code>, the health check is considered unhealthy.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html">How
  /// Route 53 Determines Whether an Endpoint Is Healthy</a> in the <i>Amazon
  /// Route 53 Developer Guide</i>.
  final HealthCheckType type;

  /// A complex type that identifies the CloudWatch alarm that you want Amazon
  /// Route 53 health checkers to use to determine whether the specified health
  /// check is healthy.
  final AlarmIdentifier? alarmIdentifier;

  /// (CALCULATED Health Checks Only) A complex type that contains one
  /// <code>ChildHealthCheck</code> element for each health check that you want to
  /// associate with a <code>CALCULATED</code> health check.
  final List<String>? childHealthChecks;

  /// Stops Route 53 from performing health checks. When you disable a health
  /// check, here's what happens:
  ///
  /// <ul>
  /// <li>
  /// <b>Health checks that check the health of endpoints:</b> Route 53 stops
  /// submitting requests to your application, server, or other resource.
  /// </li>
  /// <li>
  /// <b>Calculated health checks:</b> Route 53 stops aggregating the status of
  /// the referenced health checks.
  /// </li>
  /// <li>
  /// <b>Health checks that monitor CloudWatch alarms:</b> Route 53 stops
  /// monitoring the corresponding CloudWatch metrics.
  /// </li>
  /// </ul>
  /// After you disable a health check, Route 53 considers the status of the
  /// health check to always be healthy. If you configured DNS failover, Route 53
  /// continues to route traffic to the corresponding resources. If you want to
  /// stop routing traffic to a resource, change the value of <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-Inverted">Inverted</a>.
  ///
  /// Charges for a health check still apply when the health check is disabled.
  /// For more information, see <a
  /// href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.
  final bool? disabled;

  /// Specify whether you want Amazon Route 53 to send the value of
  /// <code>FullyQualifiedDomainName</code> to the endpoint in the
  /// <code>client_hello</code> message during TLS negotiation. This allows the
  /// endpoint to respond to <code>HTTPS</code> health check requests with the
  /// applicable SSL/TLS certificate.
  ///
  /// Some endpoints require that <code>HTTPS</code> requests include the host
  /// name in the <code>client_hello</code> message. If you don't enable SNI, the
  /// status of the health check will be <code>SSL alert handshake_failure</code>.
  /// A health check can also have that status for other reasons. If SNI is
  /// enabled and you're still getting the error, check the SSL/TLS configuration
  /// on your endpoint and confirm that your certificate is valid.
  ///
  /// The SSL/TLS certificate on your endpoint includes a domain name in the
  /// <code>Common Name</code> field and possibly several more in the
  /// <code>Subject Alternative Names</code> field. One of the domain names in the
  /// certificate should match the value that you specify for
  /// <code>FullyQualifiedDomainName</code>. If the endpoint responds to the
  /// <code>client_hello</code> message with a certificate that does not include
  /// the domain name that you specified in <code>FullyQualifiedDomainName</code>,
  /// a health checker will retry the handshake. In the second attempt, the health
  /// checker will omit <code>FullyQualifiedDomainName</code> from the
  /// <code>client_hello</code> message.
  final bool? enableSNI;

  /// The number of consecutive health checks that an endpoint must pass or fail
  /// for Amazon Route 53 to change the current status of the endpoint from
  /// unhealthy to healthy or vice versa. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html">How
  /// Amazon Route 53 Determines Whether an Endpoint Is Healthy</a> in the
  /// <i>Amazon Route 53 Developer Guide</i>.
  ///
  /// If you don't specify a value for <code>FailureThreshold</code>, the default
  /// value is three health checks.
  final int? failureThreshold;

  /// Amazon Route 53 behavior depends on whether you specify a value for
  /// <code>IPAddress</code>.
  ///
  /// <b>If you specify a value for</b> <code>IPAddress</code>:
  ///
  /// Amazon Route 53 sends health check requests to the specified IPv4 or IPv6
  /// address and passes the value of <code>FullyQualifiedDomainName</code> in the
  /// <code>Host</code> header for all health checks except TCP health checks.
  /// This is typically the fully qualified DNS name of the endpoint on which you
  /// want Route 53 to perform health checks.
  ///
  /// When Route 53 checks the health of an endpoint, here is how it constructs
  /// the <code>Host</code> header:
  ///
  /// <ul>
  /// <li>
  /// If you specify a value of <code>80</code> for <code>Port</code> and
  /// <code>HTTP</code> or <code>HTTP_STR_MATCH</code> for <code>Type</code>,
  /// Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the
  /// endpoint in the Host header.
  /// </li>
  /// <li>
  /// If you specify a value of <code>443</code> for <code>Port</code> and
  /// <code>HTTPS</code> or <code>HTTPS_STR_MATCH</code> for <code>Type</code>,
  /// Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the
  /// endpoint in the <code>Host</code> header.
  /// </li>
  /// <li>
  /// If you specify another value for <code>Port</code> and any value except
  /// <code>TCP</code> for <code>Type</code>, Route 53 passes
  /// <code>FullyQualifiedDomainName:Port</code> to the endpoint in the
  /// <code>Host</code> header.
  /// </li>
  /// </ul>
  /// If you don't specify a value for <code>FullyQualifiedDomainName</code>,
  /// Route 53 substitutes the value of <code>IPAddress</code> in the
  /// <code>Host</code> header in each of the preceding cases.
  ///
  /// <b>If you don't specify a value for</b> <code>IPAddress</code>:
  ///
  /// Route 53 sends a DNS request to the domain that you specify for
  /// <code>FullyQualifiedDomainName</code> at the interval that you specify for
  /// <code>RequestInterval</code>. Using an IPv4 address that DNS returns, Route
  /// 53 then checks the health of the endpoint.
  /// <note>
  /// If you don't specify a value for <code>IPAddress</code>, Route 53 uses only
  /// IPv4 to send health checks to the endpoint. If there's no resource record
  /// set with a type of A for the name that you specify for
  /// <code>FullyQualifiedDomainName</code>, the health check fails with a "DNS
  /// resolution failed" error.
  /// </note>
  /// If you want to check the health of weighted, latency, or failover resource
  /// record sets and you choose to specify the endpoint only by
  /// <code>FullyQualifiedDomainName</code>, we recommend that you create a
  /// separate health check for each endpoint. For example, create a health check
  /// for each HTTP server that is serving content for www.example.com. For the
  /// value of <code>FullyQualifiedDomainName</code>, specify the domain name of
  /// the server (such as us-east-2-www.example.com), not the name of the resource
  /// record sets (www.example.com).
  /// <important>
  /// In this configuration, if you create a health check for which the value of
  /// <code>FullyQualifiedDomainName</code> matches the name of the resource
  /// record sets and you then associate the health check with those resource
  /// record sets, health check results will be unpredictable.
  /// </important>
  /// In addition, if the value that you specify for <code>Type</code> is
  /// <code>HTTP</code>, <code>HTTPS</code>, <code>HTTP_STR_MATCH</code>, or
  /// <code>HTTPS_STR_MATCH</code>, Route 53 passes the value of
  /// <code>FullyQualifiedDomainName</code> in the <code>Host</code> header, as it
  /// does when you specify a value for <code>IPAddress</code>. If the value of
  /// <code>Type</code> is <code>TCP</code>, Route 53 doesn't pass a
  /// <code>Host</code> header.
  final String? fullyQualifiedDomainName;

  /// The number of child health checks that are associated with a
  /// <code>CALCULATED</code> health check that Amazon Route 53 must consider
  /// healthy for the <code>CALCULATED</code> health check to be considered
  /// healthy. To specify the child health checks that you want to associate with
  /// a <code>CALCULATED</code> health check, use the <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-ChildHealthChecks">ChildHealthChecks</a>
  /// element.
  ///
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// If you specify a number greater than the number of child health checks,
  /// Route 53 always considers this health check to be unhealthy.
  /// </li>
  /// <li>
  /// If you specify <code>0</code>, Route 53 always considers this health check
  /// to be healthy.
  /// </li>
  /// </ul>
  final int? healthThreshold;

  /// The IPv4 or IPv6 IP address of the endpoint that you want Amazon Route 53 to
  /// perform health checks on. If you don't specify a value for
  /// <code>IPAddress</code>, Route 53 sends a DNS request to resolve the domain
  /// name that you specify in <code>FullyQualifiedDomainName</code> at the
  /// interval that you specify in <code>RequestInterval</code>. Using an IP
  /// address returned by DNS, Route 53 then checks the health of the endpoint.
  ///
  /// Use one of the following formats for the value of <code>IPAddress</code>:
  ///
  /// <ul>
  /// <li>
  /// <b>IPv4 address</b>: four values between 0 and 255, separated by periods
  /// (.), for example, <code>192.0.2.44</code>.
  /// </li>
  /// <li>
  /// <b>IPv6 address</b>: eight groups of four hexadecimal values, separated by
  /// colons (:), for example,
  /// <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>. You can also shorten
  /// IPv6 addresses as described in RFC 5952, for example,
  /// <code>2001:db8:85a3::abcd:1:2345</code>.
  /// </li>
  /// </ul>
  /// If the endpoint is an EC2 instance, we recommend that you create an Elastic
  /// IP address, associate it with your EC2 instance, and specify the Elastic IP
  /// address for <code>IPAddress</code>. This ensures that the IP address of your
  /// instance will never change.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-FullyQualifiedDomainName">FullyQualifiedDomainName</a>.
  ///
  /// Constraints: Route 53 can't check the health of endpoints for which the IP
  /// address is in local, private, non-routable, or multicast ranges. For more
  /// information about IP addresses for which you can't create health checks, see
  /// the following documents:
  ///
  /// <ul>
  /// <li>
  /// <a href="https://tools.ietf.org/html/rfc5735">RFC 5735, Special Use IPv4
  /// Addresses</a>
  /// </li>
  /// <li>
  /// <a href="https://tools.ietf.org/html/rfc6598">RFC 6598, IANA-Reserved IPv4
  /// Prefix for Shared Address Space</a>
  /// </li>
  /// <li>
  /// <a href="https://tools.ietf.org/html/rfc5156">RFC 5156, Special-Use IPv6
  /// Addresses</a>
  /// </li>
  /// </ul>
  /// When the value of <code>Type</code> is <code>CALCULATED</code> or
  /// <code>CLOUDWATCH_METRIC</code>, omit <code>IPAddress</code>.
  final String? iPAddress;

  /// When CloudWatch has insufficient data about the metric to determine the
  /// alarm state, the status that you want Amazon Route 53 to assign to the
  /// health check:
  ///
  /// <ul>
  /// <li>
  /// <code>Healthy</code>: Route 53 considers the health check to be healthy.
  /// </li>
  /// <li>
  /// <code>Unhealthy</code>: Route 53 considers the health check to be unhealthy.
  /// </li>
  /// <li>
  /// <code>LastKnownStatus</code>: Route 53 uses the status of the health check
  /// from the last time that CloudWatch had sufficient data to determine the
  /// alarm state. For new health checks that have no last known status, the
  /// default status for the health check is healthy.
  /// </li>
  /// </ul>
  final InsufficientDataHealthStatus? insufficientDataHealthStatus;

  /// Specify whether you want Amazon Route 53 to invert the status of a health
  /// check, for example, to consider a health check unhealthy when it otherwise
  /// would be considered healthy.
  final bool? inverted;

  /// Specify whether you want Amazon Route 53 to measure the latency between
  /// health checkers in multiple Amazon Web Services regions and your endpoint,
  /// and to display CloudWatch latency graphs on the <b>Health Checks</b> page in
  /// the Route 53 console.
  /// <important>
  /// You can't change the value of <code>MeasureLatency</code> after you create a
  /// health check.
  /// </important>
  final bool? measureLatency;

  /// The port on the endpoint that you want Amazon Route 53 to perform health
  /// checks on.
  /// <note>
  /// Don't specify a value for <code>Port</code> when you specify a value for
  /// <code>Type</code> of <code>CLOUDWATCH_METRIC</code> or
  /// <code>CALCULATED</code>.
  /// </note>
  final int? port;

  /// A complex type that contains one <code>Region</code> element for each region
  /// from which you want Amazon Route 53 health checkers to check the specified
  /// endpoint.
  ///
  /// If you don't specify any regions, Route 53 health checkers automatically
  /// performs checks from all of the regions that are listed under <b>Valid
  /// Values</b>.
  ///
  /// If you update a health check to remove a region that has been performing
  /// health checks, Route 53 will briefly continue to perform checks from that
  /// region to ensure that some health checkers are always checking the endpoint
  /// (for example, if you replace three regions with four different regions).
  final List<HealthCheckRegion>? regions;

  /// The number of seconds between the time that Amazon Route 53 gets a response
  /// from your endpoint and the time that it sends the next health check request.
  /// Each Route 53 health checker makes requests at this interval.
  /// <important>
  /// You can't change the value of <code>RequestInterval</code> after you create
  /// a health check.
  /// </important>
  /// If you don't specify a value for <code>RequestInterval</code>, the default
  /// value is <code>30</code> seconds.
  final int? requestInterval;

  /// The path, if any, that you want Amazon Route 53 to request when performing
  /// health checks. The path can be any value for which your endpoint will return
  /// an HTTP status code of 2xx or 3xx when the endpoint is healthy, for example,
  /// the file /docs/route53-health-check.html. You can also include query string
  /// parameters, for example, <code>/welcome.html?language=jp&amp;login=y</code>.
  final String? resourcePath;

  /// The Amazon Resource Name (ARN) for the Route 53 Application Recovery
  /// Controller routing control.
  ///
  /// For more information about Route 53 Application Recovery Controller, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/what-is-route-53-recovery.html">Route
  /// 53 Application Recovery Controller Developer Guide.</a>.
  final String? routingControlArn;

  /// If the value of Type is <code>HTTP_STR_MATCH</code> or
  /// <code>HTTPS_STR_MATCH</code>, the string that you want Amazon Route 53 to
  /// search for in the response body from the specified resource. If the string
  /// appears in the response body, Route 53 considers the resource healthy.
  ///
  /// Route 53 considers case when searching for <code>SearchString</code> in the
  /// response body.
  final String? searchString;

  HealthCheckConfig({
    required this.type,
    this.alarmIdentifier,
    this.childHealthChecks,
    this.disabled,
    this.enableSNI,
    this.failureThreshold,
    this.fullyQualifiedDomainName,
    this.healthThreshold,
    this.iPAddress,
    this.insufficientDataHealthStatus,
    this.inverted,
    this.measureLatency,
    this.port,
    this.regions,
    this.requestInterval,
    this.resourcePath,
    this.routingControlArn,
    this.searchString,
  });
  factory HealthCheckConfig.fromXml(_s.XmlElement elem) {
    return HealthCheckConfig(
      type: _s.extractXmlStringValue(elem, 'Type')!.toHealthCheckType(),
      alarmIdentifier: _s
          .extractXmlChild(elem, 'AlarmIdentifier')
          ?.let(AlarmIdentifier.fromXml),
      childHealthChecks: _s.extractXmlChild(elem, 'ChildHealthChecks')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'ChildHealthCheck')),
      disabled: _s.extractXmlBoolValue(elem, 'Disabled'),
      enableSNI: _s.extractXmlBoolValue(elem, 'EnableSNI'),
      failureThreshold: _s.extractXmlIntValue(elem, 'FailureThreshold'),
      fullyQualifiedDomainName:
          _s.extractXmlStringValue(elem, 'FullyQualifiedDomainName'),
      healthThreshold: _s.extractXmlIntValue(elem, 'HealthThreshold'),
      iPAddress: _s.extractXmlStringValue(elem, 'IPAddress'),
      insufficientDataHealthStatus: _s
          .extractXmlStringValue(elem, 'InsufficientDataHealthStatus')
          ?.toInsufficientDataHealthStatus(),
      inverted: _s.extractXmlBoolValue(elem, 'Inverted'),
      measureLatency: _s.extractXmlBoolValue(elem, 'MeasureLatency'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      regions: _s.extractXmlChild(elem, 'Regions')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'Region')
          .map((s) => s.toHealthCheckRegion())
          .toList()),
      requestInterval: _s.extractXmlIntValue(elem, 'RequestInterval'),
      resourcePath: _s.extractXmlStringValue(elem, 'ResourcePath'),
      routingControlArn: _s.extractXmlStringValue(elem, 'RoutingControlArn'),
      searchString: _s.extractXmlStringValue(elem, 'SearchString'),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final alarmIdentifier = this.alarmIdentifier;
    final childHealthChecks = this.childHealthChecks;
    final disabled = this.disabled;
    final enableSNI = this.enableSNI;
    final failureThreshold = this.failureThreshold;
    final fullyQualifiedDomainName = this.fullyQualifiedDomainName;
    final healthThreshold = this.healthThreshold;
    final iPAddress = this.iPAddress;
    final insufficientDataHealthStatus = this.insufficientDataHealthStatus;
    final inverted = this.inverted;
    final measureLatency = this.measureLatency;
    final port = this.port;
    final regions = this.regions;
    final requestInterval = this.requestInterval;
    final resourcePath = this.resourcePath;
    final routingControlArn = this.routingControlArn;
    final searchString = this.searchString;
    return {
      'Type': type.toValue(),
      if (alarmIdentifier != null) 'AlarmIdentifier': alarmIdentifier,
      if (childHealthChecks != null) 'ChildHealthChecks': childHealthChecks,
      if (disabled != null) 'Disabled': disabled,
      if (enableSNI != null) 'EnableSNI': enableSNI,
      if (failureThreshold != null) 'FailureThreshold': failureThreshold,
      if (fullyQualifiedDomainName != null)
        'FullyQualifiedDomainName': fullyQualifiedDomainName,
      if (healthThreshold != null) 'HealthThreshold': healthThreshold,
      if (iPAddress != null) 'IPAddress': iPAddress,
      if (insufficientDataHealthStatus != null)
        'InsufficientDataHealthStatus': insufficientDataHealthStatus.toValue(),
      if (inverted != null) 'Inverted': inverted,
      if (measureLatency != null) 'MeasureLatency': measureLatency,
      if (port != null) 'Port': port,
      if (regions != null) 'Regions': regions.map((e) => e.toValue()).toList(),
      if (requestInterval != null) 'RequestInterval': requestInterval,
      if (resourcePath != null) 'ResourcePath': resourcePath,
      if (routingControlArn != null) 'RoutingControlArn': routingControlArn,
      if (searchString != null) 'SearchString': searchString,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final type = this.type;
    final alarmIdentifier = this.alarmIdentifier;
    final childHealthChecks = this.childHealthChecks;
    final disabled = this.disabled;
    final enableSNI = this.enableSNI;
    final failureThreshold = this.failureThreshold;
    final fullyQualifiedDomainName = this.fullyQualifiedDomainName;
    final healthThreshold = this.healthThreshold;
    final iPAddress = this.iPAddress;
    final insufficientDataHealthStatus = this.insufficientDataHealthStatus;
    final inverted = this.inverted;
    final measureLatency = this.measureLatency;
    final port = this.port;
    final regions = this.regions;
    final requestInterval = this.requestInterval;
    final resourcePath = this.resourcePath;
    final routingControlArn = this.routingControlArn;
    final searchString = this.searchString;
    final $children = <_s.XmlNode>[
      if (iPAddress != null) _s.encodeXmlStringValue('IPAddress', iPAddress),
      if (port != null) _s.encodeXmlIntValue('Port', port),
      _s.encodeXmlStringValue('Type', type.toValue()),
      if (resourcePath != null)
        _s.encodeXmlStringValue('ResourcePath', resourcePath),
      if (fullyQualifiedDomainName != null)
        _s.encodeXmlStringValue(
            'FullyQualifiedDomainName', fullyQualifiedDomainName),
      if (searchString != null)
        _s.encodeXmlStringValue('SearchString', searchString),
      if (requestInterval != null)
        _s.encodeXmlIntValue('RequestInterval', requestInterval),
      if (failureThreshold != null)
        _s.encodeXmlIntValue('FailureThreshold', failureThreshold),
      if (measureLatency != null)
        _s.encodeXmlBoolValue('MeasureLatency', measureLatency),
      if (inverted != null) _s.encodeXmlBoolValue('Inverted', inverted),
      if (disabled != null) _s.encodeXmlBoolValue('Disabled', disabled),
      if (healthThreshold != null)
        _s.encodeXmlIntValue('HealthThreshold', healthThreshold),
      if (childHealthChecks != null)
        _s.XmlElement(
            _s.XmlName('ChildHealthChecks'),
            [],
            childHealthChecks
                .map((e) => _s.encodeXmlStringValue('ChildHealthCheck', e))),
      if (enableSNI != null) _s.encodeXmlBoolValue('EnableSNI', enableSNI),
      if (regions != null)
        _s.XmlElement(_s.XmlName('Regions'), [],
            regions.map((e) => _s.encodeXmlStringValue('Region', e.toValue()))),
      if (alarmIdentifier != null) alarmIdentifier.toXml('AlarmIdentifier'),
      if (insufficientDataHealthStatus != null)
        _s.encodeXmlStringValue('InsufficientDataHealthStatus',
            insufficientDataHealthStatus.toValue()),
      if (routingControlArn != null)
        _s.encodeXmlStringValue('RoutingControlArn', routingControlArn),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the last failure reason as reported by one
/// Amazon Route 53 health checker.
class HealthCheckObservation {
  /// The IP address of the Amazon Route 53 health checker that provided the
  /// failure reason in <code>StatusReport</code>.
  final String? iPAddress;

  /// The region of the Amazon Route 53 health checker that provided the status in
  /// <code>StatusReport</code>.
  final HealthCheckRegion? region;

  /// A complex type that contains the last failure reason as reported by one
  /// Amazon Route 53 health checker and the time of the failed health check.
  final StatusReport? statusReport;

  HealthCheckObservation({
    this.iPAddress,
    this.region,
    this.statusReport,
  });
  factory HealthCheckObservation.fromXml(_s.XmlElement elem) {
    return HealthCheckObservation(
      iPAddress: _s.extractXmlStringValue(elem, 'IPAddress'),
      region: _s.extractXmlStringValue(elem, 'Region')?.toHealthCheckRegion(),
      statusReport:
          _s.extractXmlChild(elem, 'StatusReport')?.let(StatusReport.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final iPAddress = this.iPAddress;
    final region = this.region;
    final statusReport = this.statusReport;
    return {
      if (iPAddress != null) 'IPAddress': iPAddress,
      if (region != null) 'Region': region.toValue(),
      if (statusReport != null) 'StatusReport': statusReport,
    };
  }
}

enum HealthCheckRegion {
  usEast_1,
  usWest_1,
  usWest_2,
  euWest_1,
  apSoutheast_1,
  apSoutheast_2,
  apNortheast_1,
  saEast_1,
}

extension HealthCheckRegionValueExtension on HealthCheckRegion {
  String toValue() {
    switch (this) {
      case HealthCheckRegion.usEast_1:
        return 'us-east-1';
      case HealthCheckRegion.usWest_1:
        return 'us-west-1';
      case HealthCheckRegion.usWest_2:
        return 'us-west-2';
      case HealthCheckRegion.euWest_1:
        return 'eu-west-1';
      case HealthCheckRegion.apSoutheast_1:
        return 'ap-southeast-1';
      case HealthCheckRegion.apSoutheast_2:
        return 'ap-southeast-2';
      case HealthCheckRegion.apNortheast_1:
        return 'ap-northeast-1';
      case HealthCheckRegion.saEast_1:
        return 'sa-east-1';
    }
  }
}

extension HealthCheckRegionFromString on String {
  HealthCheckRegion toHealthCheckRegion() {
    switch (this) {
      case 'us-east-1':
        return HealthCheckRegion.usEast_1;
      case 'us-west-1':
        return HealthCheckRegion.usWest_1;
      case 'us-west-2':
        return HealthCheckRegion.usWest_2;
      case 'eu-west-1':
        return HealthCheckRegion.euWest_1;
      case 'ap-southeast-1':
        return HealthCheckRegion.apSoutheast_1;
      case 'ap-southeast-2':
        return HealthCheckRegion.apSoutheast_2;
      case 'ap-northeast-1':
        return HealthCheckRegion.apNortheast_1;
      case 'sa-east-1':
        return HealthCheckRegion.saEast_1;
    }
    throw Exception('$this is not known in enum HealthCheckRegion');
  }
}

enum HealthCheckType {
  http,
  https,
  httpStrMatch,
  httpsStrMatch,
  tcp,
  calculated,
  cloudwatchMetric,
  recoveryControl,
}

extension HealthCheckTypeValueExtension on HealthCheckType {
  String toValue() {
    switch (this) {
      case HealthCheckType.http:
        return 'HTTP';
      case HealthCheckType.https:
        return 'HTTPS';
      case HealthCheckType.httpStrMatch:
        return 'HTTP_STR_MATCH';
      case HealthCheckType.httpsStrMatch:
        return 'HTTPS_STR_MATCH';
      case HealthCheckType.tcp:
        return 'TCP';
      case HealthCheckType.calculated:
        return 'CALCULATED';
      case HealthCheckType.cloudwatchMetric:
        return 'CLOUDWATCH_METRIC';
      case HealthCheckType.recoveryControl:
        return 'RECOVERY_CONTROL';
    }
  }
}

extension HealthCheckTypeFromString on String {
  HealthCheckType toHealthCheckType() {
    switch (this) {
      case 'HTTP':
        return HealthCheckType.http;
      case 'HTTPS':
        return HealthCheckType.https;
      case 'HTTP_STR_MATCH':
        return HealthCheckType.httpStrMatch;
      case 'HTTPS_STR_MATCH':
        return HealthCheckType.httpsStrMatch;
      case 'TCP':
        return HealthCheckType.tcp;
      case 'CALCULATED':
        return HealthCheckType.calculated;
      case 'CLOUDWATCH_METRIC':
        return HealthCheckType.cloudwatchMetric;
      case 'RECOVERY_CONTROL':
        return HealthCheckType.recoveryControl;
    }
    throw Exception('$this is not known in enum HealthCheckType');
  }
}

/// A complex type that contains general information about the hosted zone.
class HostedZone {
  /// The value that you specified for <code>CallerReference</code> when you
  /// created the hosted zone.
  final String callerReference;

  /// The ID that Amazon Route 53 assigned to the hosted zone when you created it.
  final String id;

  /// The name of the domain. For public hosted zones, this is the name that you
  /// have registered with your DNS registrar.
  ///
  /// For information about how to specify characters other than <code>a-z</code>,
  /// <code>0-9</code>, and <code>-</code> (hyphen) and how to specify
  /// internationalized domain names, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateHostedZone.html">CreateHostedZone</a>.
  final String name;

  /// A complex type that includes the <code>Comment</code> and
  /// <code>PrivateZone</code> elements. If you omitted the
  /// <code>HostedZoneConfig</code> and <code>Comment</code> elements from the
  /// request, the <code>Config</code> and <code>Comment</code> elements don't
  /// appear in the response.
  final HostedZoneConfig? config;

  /// If the hosted zone was created by another service, the service that created
  /// the hosted zone. When a hosted zone is created by another service, you can't
  /// edit or delete it using Route 53.
  final LinkedService? linkedService;

  /// The number of resource record sets in the hosted zone.
  final int? resourceRecordSetCount;

  HostedZone({
    required this.callerReference,
    required this.id,
    required this.name,
    this.config,
    this.linkedService,
    this.resourceRecordSetCount,
  });
  factory HostedZone.fromXml(_s.XmlElement elem) {
    return HostedZone(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      name: _s.extractXmlStringValue(elem, 'Name')!,
      config: _s.extractXmlChild(elem, 'Config')?.let(HostedZoneConfig.fromXml),
      linkedService:
          _s.extractXmlChild(elem, 'LinkedService')?.let(LinkedService.fromXml),
      resourceRecordSetCount:
          _s.extractXmlIntValue(elem, 'ResourceRecordSetCount'),
    );
  }

  Map<String, dynamic> toJson() {
    final callerReference = this.callerReference;
    final id = this.id;
    final name = this.name;
    final config = this.config;
    final linkedService = this.linkedService;
    final resourceRecordSetCount = this.resourceRecordSetCount;
    return {
      'CallerReference': callerReference,
      'Id': id,
      'Name': name,
      if (config != null) 'Config': config,
      if (linkedService != null) 'LinkedService': linkedService,
      if (resourceRecordSetCount != null)
        'ResourceRecordSetCount': resourceRecordSetCount,
    };
  }
}

/// A complex type that contains an optional comment about your hosted zone. If
/// you don't want to specify a comment, omit both the
/// <code>HostedZoneConfig</code> and <code>Comment</code> elements.
class HostedZoneConfig {
  /// Any comments that you want to include about the hosted zone.
  final String? comment;

  /// A value that indicates whether this is a private hosted zone.
  final bool? privateZone;

  HostedZoneConfig({
    this.comment,
    this.privateZone,
  });
  factory HostedZoneConfig.fromXml(_s.XmlElement elem) {
    return HostedZoneConfig(
      comment: _s.extractXmlStringValue(elem, 'Comment'),
      privateZone: _s.extractXmlBoolValue(elem, 'PrivateZone'),
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final privateZone = this.privateZone;
    return {
      if (comment != null) 'Comment': comment,
      if (privateZone != null) 'PrivateZone': privateZone,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final comment = this.comment;
    final privateZone = this.privateZone;
    final $children = <_s.XmlNode>[
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
      if (privateZone != null)
        _s.encodeXmlBoolValue('PrivateZone', privateZone),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the type of limit that you specified in the
/// request and the current value for that limit.
class HostedZoneLimit {
  /// The limit that you requested. Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <b>MAX_RRSETS_BY_ZONE</b>: The maximum number of records that you can create
  /// in the specified hosted zone.
  /// </li>
  /// <li>
  /// <b>MAX_VPCS_ASSOCIATED_BY_ZONE</b>: The maximum number of Amazon VPCs that
  /// you can associate with the specified private hosted zone.
  /// </li>
  /// </ul>
  final HostedZoneLimitType type;

  /// The current value for the limit that is specified by <code>Type</code>.
  final int value;

  HostedZoneLimit({
    required this.type,
    required this.value,
  });
  factory HostedZoneLimit.fromXml(_s.XmlElement elem) {
    return HostedZoneLimit(
      type: _s.extractXmlStringValue(elem, 'Type')!.toHostedZoneLimitType(),
      value: _s.extractXmlIntValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.toValue(),
      'Value': value,
    };
  }
}

enum HostedZoneLimitType {
  maxRrsetsByZone,
  maxVpcsAssociatedByZone,
}

extension HostedZoneLimitTypeValueExtension on HostedZoneLimitType {
  String toValue() {
    switch (this) {
      case HostedZoneLimitType.maxRrsetsByZone:
        return 'MAX_RRSETS_BY_ZONE';
      case HostedZoneLimitType.maxVpcsAssociatedByZone:
        return 'MAX_VPCS_ASSOCIATED_BY_ZONE';
    }
  }
}

extension HostedZoneLimitTypeFromString on String {
  HostedZoneLimitType toHostedZoneLimitType() {
    switch (this) {
      case 'MAX_RRSETS_BY_ZONE':
        return HostedZoneLimitType.maxRrsetsByZone;
      case 'MAX_VPCS_ASSOCIATED_BY_ZONE':
        return HostedZoneLimitType.maxVpcsAssociatedByZone;
    }
    throw Exception('$this is not known in enum HostedZoneLimitType');
  }
}

/// A complex type that identifies a hosted zone that a specified Amazon VPC is
/// associated with and the owner of the hosted zone. If there is a value for
/// <code>OwningAccount</code>, there is no value for
/// <code>OwningService</code>, and vice versa.
class HostedZoneOwner {
  /// If the hosted zone was created by an Amazon Web Services account, or was
  /// created by an Amazon Web Services service that creates hosted zones using
  /// the current account, <code>OwningAccount</code> contains the account ID of
  /// that account. For example, when you use Cloud Map to create a hosted zone,
  /// Cloud Map creates the hosted zone using the current Amazon Web Services
  /// account.
  final String? owningAccount;

  /// If an Amazon Web Services service uses its own account to create a hosted
  /// zone and associate the specified VPC with that hosted zone,
  /// <code>OwningService</code> contains an abbreviation that identifies the
  /// service. For example, if Amazon Elastic File System (Amazon EFS) created a
  /// hosted zone and associated a VPC with the hosted zone, the value of
  /// <code>OwningService</code> is <code>efs.amazonaws.com</code>.
  final String? owningService;

  HostedZoneOwner({
    this.owningAccount,
    this.owningService,
  });
  factory HostedZoneOwner.fromXml(_s.XmlElement elem) {
    return HostedZoneOwner(
      owningAccount: _s.extractXmlStringValue(elem, 'OwningAccount'),
      owningService: _s.extractXmlStringValue(elem, 'OwningService'),
    );
  }

  Map<String, dynamic> toJson() {
    final owningAccount = this.owningAccount;
    final owningService = this.owningService;
    return {
      if (owningAccount != null) 'OwningAccount': owningAccount,
      if (owningService != null) 'OwningService': owningService,
    };
  }
}

/// In the response to a <code>ListHostedZonesByVPC</code> request, the
/// <code>HostedZoneSummaries</code> element contains one
/// <code>HostedZoneSummary</code> element for each hosted zone that the
/// specified Amazon VPC is associated with. Each <code>HostedZoneSummary</code>
/// element contains the hosted zone name and ID, and information about who owns
/// the hosted zone.
class HostedZoneSummary {
  /// The Route 53 hosted zone ID of a private hosted zone that the specified VPC
  /// is associated with.
  final String hostedZoneId;

  /// The name of the private hosted zone, such as <code>example.com</code>.
  final String name;

  /// The owner of a private hosted zone that the specified VPC is associated
  /// with. The owner can be either an Amazon Web Services account or an Amazon
  /// Web Services service.
  final HostedZoneOwner owner;

  HostedZoneSummary({
    required this.hostedZoneId,
    required this.name,
    required this.owner,
  });
  factory HostedZoneSummary.fromXml(_s.XmlElement elem) {
    return HostedZoneSummary(
      hostedZoneId: _s.extractXmlStringValue(elem, 'HostedZoneId')!,
      name: _s.extractXmlStringValue(elem, 'Name')!,
      owner: HostedZoneOwner.fromXml(_s.extractXmlChild(elem, 'Owner')!),
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZoneId = this.hostedZoneId;
    final name = this.name;
    final owner = this.owner;
    return {
      'HostedZoneId': hostedZoneId,
      'Name': name,
      'Owner': owner,
    };
  }
}

enum HostedZoneType {
  privateHostedZone,
}

extension HostedZoneTypeValueExtension on HostedZoneType {
  String toValue() {
    switch (this) {
      case HostedZoneType.privateHostedZone:
        return 'PrivateHostedZone';
    }
  }
}

extension HostedZoneTypeFromString on String {
  HostedZoneType toHostedZoneType() {
    switch (this) {
      case 'PrivateHostedZone':
        return HostedZoneType.privateHostedZone;
    }
    throw Exception('$this is not known in enum HostedZoneType');
  }
}

enum InsufficientDataHealthStatus {
  healthy,
  unhealthy,
  lastKnownStatus,
}

extension InsufficientDataHealthStatusValueExtension
    on InsufficientDataHealthStatus {
  String toValue() {
    switch (this) {
      case InsufficientDataHealthStatus.healthy:
        return 'Healthy';
      case InsufficientDataHealthStatus.unhealthy:
        return 'Unhealthy';
      case InsufficientDataHealthStatus.lastKnownStatus:
        return 'LastKnownStatus';
    }
  }
}

extension InsufficientDataHealthStatusFromString on String {
  InsufficientDataHealthStatus toInsufficientDataHealthStatus() {
    switch (this) {
      case 'Healthy':
        return InsufficientDataHealthStatus.healthy;
      case 'Unhealthy':
        return InsufficientDataHealthStatus.unhealthy;
      case 'LastKnownStatus':
        return InsufficientDataHealthStatus.lastKnownStatus;
    }
    throw Exception('$this is not known in enum InsufficientDataHealthStatus');
  }
}

/// A key-signing key (KSK) is a complex type that represents a public/private
/// key pair. The private key is used to generate a digital signature for the
/// zone signing key (ZSK). The public key is stored in the DNS and is used to
/// authenticate the ZSK. A KSK is always associated with a hosted zone; it
/// cannot exist by itself.
class KeySigningKey {
  /// The date when the key-signing key (KSK) was created.
  final DateTime? createdDate;

  /// A string that represents a DNSKEY record.
  final String? dNSKEYRecord;

  /// A string that represents a delegation signer (DS) record.
  final String? dSRecord;

  /// A string used to represent the delegation signer digest algorithm. This
  /// value must follow the guidelines provided by <a
  /// href="https://tools.ietf.org/html/rfc8624#section-3.3">RFC-8624 Section
  /// 3.3</a>.
  final String? digestAlgorithmMnemonic;

  /// An integer used to represent the delegation signer digest algorithm. This
  /// value must follow the guidelines provided by <a
  /// href="https://tools.ietf.org/html/rfc8624#section-3.3">RFC-8624 Section
  /// 3.3</a>.
  final int? digestAlgorithmType;

  /// A cryptographic digest of a DNSKEY resource record (RR). DNSKEY records are
  /// used to publish the public key that resolvers can use to verify DNSSEC
  /// signatures that are used to secure certain kinds of information provided by
  /// the DNS system.
  final String? digestValue;

  /// An integer that specifies how the key is used. For key-signing key (KSK),
  /// this value is always 257.
  final int? flag;

  /// An integer used to identify the DNSSEC record for the domain name. The
  /// process used to calculate the value is described in <a
  /// href="https://tools.ietf.org/rfc/rfc4034.txt">RFC-4034 Appendix B</a>.
  final int? keyTag;

  /// The Amazon resource name (ARN) used to identify the customer managed key in
  /// Key Management Service (KMS). The <code>KmsArn</code> must be unique for
  /// each key-signing key (KSK) in a single hosted zone.
  ///
  /// You must configure the customer managed key as follows:
  /// <dl> <dt>Status</dt> <dd>
  /// Enabled
  /// </dd> <dt>Key spec</dt> <dd>
  /// ECC_NIST_P256
  /// </dd> <dt>Key usage</dt> <dd>
  /// Sign and verify
  /// </dd> <dt>Key policy</dt> <dd>
  /// The key policy must give permission for the following actions:
  ///
  /// <ul>
  /// <li>
  /// DescribeKey
  /// </li>
  /// <li>
  /// GetPublicKey
  /// </li>
  /// <li>
  /// Sign
  /// </li>
  /// </ul>
  /// The key policy must also include the Amazon Route 53 service in the
  /// principal for your account. Specify the following:
  ///
  /// <ul>
  /// <li>
  /// <code>"Service": "dnssec-route53.amazonaws.com"</code>
  /// </li>
  /// </ul> </dd> </dl>
  /// For more information about working with the customer managed key in KMS, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html">Key
  /// Management Service concepts</a>.
  final String? kmsArn;

  /// The last time that the key-signing key (KSK) was changed.
  final DateTime? lastModifiedDate;

  /// A string used to identify a key-signing key (KSK). <code>Name</code> can
  /// include numbers, letters, and underscores (_). <code>Name</code> must be
  /// unique for each key-signing key in the same hosted zone.
  final String? name;

  /// The public key, represented as a Base64 encoding, as required by <a
  /// href="https://tools.ietf.org/rfc/rfc4034.txt"> RFC-4034 Page 5</a>.
  final String? publicKey;

  /// A string used to represent the signing algorithm. This value must follow the
  /// guidelines provided by <a
  /// href="https://tools.ietf.org/html/rfc8624#section-3.1">RFC-8624 Section
  /// 3.1</a>.
  final String? signingAlgorithmMnemonic;

  /// An integer used to represent the signing algorithm. This value must follow
  /// the guidelines provided by <a
  /// href="https://tools.ietf.org/html/rfc8624#section-3.1">RFC-8624 Section
  /// 3.1</a>.
  final int? signingAlgorithmType;

  /// A string that represents the current key-signing key (KSK) status.
  ///
  /// Status can have one of the following values:
  /// <dl> <dt>ACTIVE</dt> <dd>
  /// The KSK is being used for signing.
  /// </dd> <dt>INACTIVE</dt> <dd>
  /// The KSK is not being used for signing.
  /// </dd> <dt>DELETING</dt> <dd>
  /// The KSK is in the process of being deleted.
  /// </dd> <dt>ACTION_NEEDED</dt> <dd>
  /// There is a problem with the KSK that requires you to take action to resolve.
  /// For example, the customer managed key might have been deleted, or the
  /// permissions for the customer managed key might have been changed.
  /// </dd> <dt>INTERNAL_FAILURE</dt> <dd>
  /// There was an error during a request. Before you can continue to work with
  /// DNSSEC signing, including actions that involve this KSK, you must correct
  /// the problem. For example, you may need to activate or deactivate the KSK.
  /// </dd> </dl>
  final String? status;

  /// The status message provided for the following key-signing key (KSK)
  /// statuses: <code>ACTION_NEEDED</code> or <code>INTERNAL_FAILURE</code>. The
  /// status message includes information about what the problem might be and
  /// steps that you can take to correct the issue.
  final String? statusMessage;

  KeySigningKey({
    this.createdDate,
    this.dNSKEYRecord,
    this.dSRecord,
    this.digestAlgorithmMnemonic,
    this.digestAlgorithmType,
    this.digestValue,
    this.flag,
    this.keyTag,
    this.kmsArn,
    this.lastModifiedDate,
    this.name,
    this.publicKey,
    this.signingAlgorithmMnemonic,
    this.signingAlgorithmType,
    this.status,
    this.statusMessage,
  });
  factory KeySigningKey.fromXml(_s.XmlElement elem) {
    return KeySigningKey(
      createdDate: _s.extractXmlDateTimeValue(elem, 'CreatedDate'),
      dNSKEYRecord: _s.extractXmlStringValue(elem, 'DNSKEYRecord'),
      dSRecord: _s.extractXmlStringValue(elem, 'DSRecord'),
      digestAlgorithmMnemonic:
          _s.extractXmlStringValue(elem, 'DigestAlgorithmMnemonic'),
      digestAlgorithmType: _s.extractXmlIntValue(elem, 'DigestAlgorithmType'),
      digestValue: _s.extractXmlStringValue(elem, 'DigestValue'),
      flag: _s.extractXmlIntValue(elem, 'Flag'),
      keyTag: _s.extractXmlIntValue(elem, 'KeyTag'),
      kmsArn: _s.extractXmlStringValue(elem, 'KmsArn'),
      lastModifiedDate: _s.extractXmlDateTimeValue(elem, 'LastModifiedDate'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      publicKey: _s.extractXmlStringValue(elem, 'PublicKey'),
      signingAlgorithmMnemonic:
          _s.extractXmlStringValue(elem, 'SigningAlgorithmMnemonic'),
      signingAlgorithmType: _s.extractXmlIntValue(elem, 'SigningAlgorithmType'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      statusMessage: _s.extractXmlStringValue(elem, 'StatusMessage'),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final dNSKEYRecord = this.dNSKEYRecord;
    final dSRecord = this.dSRecord;
    final digestAlgorithmMnemonic = this.digestAlgorithmMnemonic;
    final digestAlgorithmType = this.digestAlgorithmType;
    final digestValue = this.digestValue;
    final flag = this.flag;
    final keyTag = this.keyTag;
    final kmsArn = this.kmsArn;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final publicKey = this.publicKey;
    final signingAlgorithmMnemonic = this.signingAlgorithmMnemonic;
    final signingAlgorithmType = this.signingAlgorithmType;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (createdDate != null) 'CreatedDate': iso8601ToJson(createdDate),
      if (dNSKEYRecord != null) 'DNSKEYRecord': dNSKEYRecord,
      if (dSRecord != null) 'DSRecord': dSRecord,
      if (digestAlgorithmMnemonic != null)
        'DigestAlgorithmMnemonic': digestAlgorithmMnemonic,
      if (digestAlgorithmType != null)
        'DigestAlgorithmType': digestAlgorithmType,
      if (digestValue != null) 'DigestValue': digestValue,
      if (flag != null) 'Flag': flag,
      if (keyTag != null) 'KeyTag': keyTag,
      if (kmsArn != null) 'KmsArn': kmsArn,
      if (lastModifiedDate != null)
        'LastModifiedDate': iso8601ToJson(lastModifiedDate),
      if (name != null) 'Name': name,
      if (publicKey != null) 'PublicKey': publicKey,
      if (signingAlgorithmMnemonic != null)
        'SigningAlgorithmMnemonic': signingAlgorithmMnemonic,
      if (signingAlgorithmType != null)
        'SigningAlgorithmType': signingAlgorithmType,
      if (status != null) 'Status': status,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// If a health check or hosted zone was created by another service,
/// <code>LinkedService</code> is a complex type that describes the service that
/// created the resource. When a resource is created by another service, you
/// can't edit or delete it using Amazon Route 53.
class LinkedService {
  /// If the health check or hosted zone was created by another service, an
  /// optional description that can be provided by the other service. When a
  /// resource is created by another service, you can't edit or delete it using
  /// Amazon Route 53.
  final String? description;

  /// If the health check or hosted zone was created by another service, the
  /// service that created the resource. When a resource is created by another
  /// service, you can't edit or delete it using Amazon Route 53.
  final String? servicePrincipal;

  LinkedService({
    this.description,
    this.servicePrincipal,
  });
  factory LinkedService.fromXml(_s.XmlElement elem) {
    return LinkedService(
      description: _s.extractXmlStringValue(elem, 'Description'),
      servicePrincipal: _s.extractXmlStringValue(elem, 'ServicePrincipal'),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final servicePrincipal = this.servicePrincipal;
    return {
      if (description != null) 'Description': description,
      if (servicePrincipal != null) 'ServicePrincipal': servicePrincipal,
    };
  }
}

class ListCidrBlocksResponse {
  /// A complex type that contains information about the CIDR blocks.
  final List<CidrBlockSummary>? cidrBlocks;

  /// An opaque pagination token to indicate where the service is to begin
  /// enumerating results.
  ///
  /// If no value is provided, the listing of results starts from the beginning.
  final String? nextToken;

  ListCidrBlocksResponse({
    this.cidrBlocks,
    this.nextToken,
  });
  factory ListCidrBlocksResponse.fromXml(_s.XmlElement elem) {
    return ListCidrBlocksResponse(
      cidrBlocks: _s.extractXmlChild(elem, 'CidrBlocks')?.let((elem) =>
          elem.findElements('member').map(CidrBlockSummary.fromXml).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final cidrBlocks = this.cidrBlocks;
    final nextToken = this.nextToken;
    return {
      if (cidrBlocks != null) 'CidrBlocks': cidrBlocks,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCidrCollectionsResponse {
  /// A complex type with information about the CIDR collection.
  final List<CollectionSummary>? cidrCollections;

  /// An opaque pagination token to indicate where the service is to begin
  /// enumerating results.
  ///
  /// If no value is provided, the listing of results starts from the beginning.
  final String? nextToken;

  ListCidrCollectionsResponse({
    this.cidrCollections,
    this.nextToken,
  });
  factory ListCidrCollectionsResponse.fromXml(_s.XmlElement elem) {
    return ListCidrCollectionsResponse(
      cidrCollections: _s.extractXmlChild(elem, 'CidrCollections')?.let(
          (elem) => elem
              .findElements('member')
              .map(CollectionSummary.fromXml)
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final cidrCollections = this.cidrCollections;
    final nextToken = this.nextToken;
    return {
      if (cidrCollections != null) 'CidrCollections': cidrCollections,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCidrLocationsResponse {
  /// A complex type that contains information about the list of CIDR locations.
  final List<LocationSummary>? cidrLocations;

  /// An opaque pagination token to indicate where the service is to begin
  /// enumerating results.
  ///
  /// If no value is provided, the listing of results starts from the beginning.
  final String? nextToken;

  ListCidrLocationsResponse({
    this.cidrLocations,
    this.nextToken,
  });
  factory ListCidrLocationsResponse.fromXml(_s.XmlElement elem) {
    return ListCidrLocationsResponse(
      cidrLocations: _s.extractXmlChild(elem, 'CidrLocations')?.let((elem) =>
          elem.findElements('member').map(LocationSummary.fromXml).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final cidrLocations = this.cidrLocations;
    final nextToken = this.nextToken;
    return {
      if (cidrLocations != null) 'CidrLocations': cidrLocations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A complex type containing the response information for the request.
class ListGeoLocationsResponse {
  /// A complex type that contains one <code>GeoLocationDetails</code> element for
  /// each location that Amazon Route 53 supports for geolocation.
  final List<GeoLocationDetails> geoLocationDetailsList;

  /// A value that indicates whether more locations remain to be listed after the
  /// last location in this response. If so, the value of <code>IsTruncated</code>
  /// is <code>true</code>. To get more values, submit another request and include
  /// the values of <code>NextContinentCode</code>, <code>NextCountryCode</code>,
  /// and <code>NextSubdivisionCode</code> in the <code>startcontinentcode</code>,
  /// <code>startcountrycode</code>, and <code>startsubdivisioncode</code>, as
  /// applicable.
  final bool isTruncated;

  /// The value that you specified for <code>MaxItems</code> in the request.
  final String maxItems;

  /// If <code>IsTruncated</code> is <code>true</code>, you can make a follow-up
  /// request to display more locations. Enter the value of
  /// <code>NextContinentCode</code> in the <code>startcontinentcode</code>
  /// parameter in another <code>ListGeoLocations</code> request.
  final String? nextContinentCode;

  /// If <code>IsTruncated</code> is <code>true</code>, you can make a follow-up
  /// request to display more locations. Enter the value of
  /// <code>NextCountryCode</code> in the <code>startcountrycode</code> parameter
  /// in another <code>ListGeoLocations</code> request.
  final String? nextCountryCode;

  /// If <code>IsTruncated</code> is <code>true</code>, you can make a follow-up
  /// request to display more locations. Enter the value of
  /// <code>NextSubdivisionCode</code> in the <code>startsubdivisioncode</code>
  /// parameter in another <code>ListGeoLocations</code> request.
  final String? nextSubdivisionCode;

  ListGeoLocationsResponse({
    required this.geoLocationDetailsList,
    required this.isTruncated,
    required this.maxItems,
    this.nextContinentCode,
    this.nextCountryCode,
    this.nextSubdivisionCode,
  });
  factory ListGeoLocationsResponse.fromXml(_s.XmlElement elem) {
    return ListGeoLocationsResponse(
      geoLocationDetailsList: _s
          .extractXmlChild(elem, 'GeoLocationDetailsList')!
          .findElements('GeoLocationDetails')
          .map(GeoLocationDetails.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      maxItems: _s.extractXmlStringValue(elem, 'MaxItems')!,
      nextContinentCode: _s.extractXmlStringValue(elem, 'NextContinentCode'),
      nextCountryCode: _s.extractXmlStringValue(elem, 'NextCountryCode'),
      nextSubdivisionCode:
          _s.extractXmlStringValue(elem, 'NextSubdivisionCode'),
    );
  }

  Map<String, dynamic> toJson() {
    final geoLocationDetailsList = this.geoLocationDetailsList;
    final isTruncated = this.isTruncated;
    final maxItems = this.maxItems;
    final nextContinentCode = this.nextContinentCode;
    final nextCountryCode = this.nextCountryCode;
    final nextSubdivisionCode = this.nextSubdivisionCode;
    return {
      'GeoLocationDetailsList': geoLocationDetailsList,
      'IsTruncated': isTruncated,
      'MaxItems': maxItems,
      if (nextContinentCode != null) 'NextContinentCode': nextContinentCode,
      if (nextCountryCode != null) 'NextCountryCode': nextCountryCode,
      if (nextSubdivisionCode != null)
        'NextSubdivisionCode': nextSubdivisionCode,
    };
  }
}

/// A complex type that contains the response to a <code>ListHealthChecks</code>
/// request.
class ListHealthChecksResponse {
  /// A complex type that contains one <code>HealthCheck</code> element for each
  /// health check that is associated with the current Amazon Web Services
  /// account.
  final List<HealthCheck> healthChecks;

  /// A flag that indicates whether there are more health checks to be listed. If
  /// the response was truncated, you can get the next group of health checks by
  /// submitting another <code>ListHealthChecks</code> request and specifying the
  /// value of <code>NextMarker</code> in the <code>marker</code> parameter.
  final bool isTruncated;

  /// For the second and subsequent calls to <code>ListHealthChecks</code>,
  /// <code>Marker</code> is the value that you specified for the
  /// <code>marker</code> parameter in the previous request.
  final String marker;

  /// The value that you specified for the <code>maxitems</code> parameter in the
  /// call to <code>ListHealthChecks</code> that produced the current response.
  final String maxItems;

  /// If <code>IsTruncated</code> is <code>true</code>, the value of
  /// <code>NextMarker</code> identifies the first health check that Amazon Route
  /// 53 returns if you submit another <code>ListHealthChecks</code> request and
  /// specify the value of <code>NextMarker</code> in the <code>marker</code>
  /// parameter.
  final String? nextMarker;

  ListHealthChecksResponse({
    required this.healthChecks,
    required this.isTruncated,
    required this.marker,
    required this.maxItems,
    this.nextMarker,
  });
  factory ListHealthChecksResponse.fromXml(_s.XmlElement elem) {
    return ListHealthChecksResponse(
      healthChecks: _s
          .extractXmlChild(elem, 'HealthChecks')!
          .findElements('HealthCheck')
          .map(HealthCheck.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      marker: _s.extractXmlStringValue(elem, 'Marker')!,
      maxItems: _s.extractXmlStringValue(elem, 'MaxItems')!,
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final healthChecks = this.healthChecks;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    final maxItems = this.maxItems;
    final nextMarker = this.nextMarker;
    return {
      'HealthChecks': healthChecks,
      'IsTruncated': isTruncated,
      'Marker': marker,
      'MaxItems': maxItems,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// A complex type that contains the response information for the request.
class ListHostedZonesByNameResponse {
  /// A complex type that contains general information about the hosted zone.
  final List<HostedZone> hostedZones;

  /// A flag that indicates whether there are more hosted zones to be listed. If
  /// the response was truncated, you can get the next group of
  /// <code>maxitems</code> hosted zones by calling
  /// <code>ListHostedZonesByName</code> again and specifying the values of
  /// <code>NextDNSName</code> and <code>NextHostedZoneId</code> elements in the
  /// <code>dnsname</code> and <code>hostedzoneid</code> parameters.
  final bool isTruncated;

  /// The value that you specified for the <code>maxitems</code> parameter in the
  /// call to <code>ListHostedZonesByName</code> that produced the current
  /// response.
  final String maxItems;

  /// For the second and subsequent calls to <code>ListHostedZonesByName</code>,
  /// <code>DNSName</code> is the value that you specified for the
  /// <code>dnsname</code> parameter in the request that produced the current
  /// response.
  final String? dNSName;

  /// The ID that Amazon Route 53 assigned to the hosted zone when you created it.
  final String? hostedZoneId;

  /// If <code>IsTruncated</code> is true, the value of <code>NextDNSName</code>
  /// is the name of the first hosted zone in the next group of
  /// <code>maxitems</code> hosted zones. Call <code>ListHostedZonesByName</code>
  /// again and specify the value of <code>NextDNSName</code> and
  /// <code>NextHostedZoneId</code> in the <code>dnsname</code> and
  /// <code>hostedzoneid</code> parameters, respectively.
  ///
  /// This element is present only if <code>IsTruncated</code> is
  /// <code>true</code>.
  final String? nextDNSName;

  /// If <code>IsTruncated</code> is <code>true</code>, the value of
  /// <code>NextHostedZoneId</code> identifies the first hosted zone in the next
  /// group of <code>maxitems</code> hosted zones. Call
  /// <code>ListHostedZonesByName</code> again and specify the value of
  /// <code>NextDNSName</code> and <code>NextHostedZoneId</code> in the
  /// <code>dnsname</code> and <code>hostedzoneid</code> parameters, respectively.
  ///
  /// This element is present only if <code>IsTruncated</code> is
  /// <code>true</code>.
  final String? nextHostedZoneId;

  ListHostedZonesByNameResponse({
    required this.hostedZones,
    required this.isTruncated,
    required this.maxItems,
    this.dNSName,
    this.hostedZoneId,
    this.nextDNSName,
    this.nextHostedZoneId,
  });
  factory ListHostedZonesByNameResponse.fromXml(_s.XmlElement elem) {
    return ListHostedZonesByNameResponse(
      hostedZones: _s
          .extractXmlChild(elem, 'HostedZones')!
          .findElements('HostedZone')
          .map(HostedZone.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      maxItems: _s.extractXmlStringValue(elem, 'MaxItems')!,
      dNSName: _s.extractXmlStringValue(elem, 'DNSName'),
      hostedZoneId: _s.extractXmlStringValue(elem, 'HostedZoneId'),
      nextDNSName: _s.extractXmlStringValue(elem, 'NextDNSName'),
      nextHostedZoneId: _s.extractXmlStringValue(elem, 'NextHostedZoneId'),
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZones = this.hostedZones;
    final isTruncated = this.isTruncated;
    final maxItems = this.maxItems;
    final dNSName = this.dNSName;
    final hostedZoneId = this.hostedZoneId;
    final nextDNSName = this.nextDNSName;
    final nextHostedZoneId = this.nextHostedZoneId;
    return {
      'HostedZones': hostedZones,
      'IsTruncated': isTruncated,
      'MaxItems': maxItems,
      if (dNSName != null) 'DNSName': dNSName,
      if (hostedZoneId != null) 'HostedZoneId': hostedZoneId,
      if (nextDNSName != null) 'NextDNSName': nextDNSName,
      if (nextHostedZoneId != null) 'NextHostedZoneId': nextHostedZoneId,
    };
  }
}

class ListHostedZonesByVPCResponse {
  /// A list that contains one <code>HostedZoneSummary</code> element for each
  /// hosted zone that the specified Amazon VPC is associated with. Each
  /// <code>HostedZoneSummary</code> element contains the hosted zone name and ID,
  /// and information about who owns the hosted zone.
  final List<HostedZoneSummary> hostedZoneSummaries;

  /// The value that you specified for <code>MaxItems</code> in the most recent
  /// <code>ListHostedZonesByVPC</code> request.
  final String maxItems;

  /// The value that you will use for <code>NextToken</code> in the next
  /// <code>ListHostedZonesByVPC</code> request.
  final String? nextToken;

  ListHostedZonesByVPCResponse({
    required this.hostedZoneSummaries,
    required this.maxItems,
    this.nextToken,
  });
  factory ListHostedZonesByVPCResponse.fromXml(_s.XmlElement elem) {
    return ListHostedZonesByVPCResponse(
      hostedZoneSummaries: _s
          .extractXmlChild(elem, 'HostedZoneSummaries')!
          .findElements('HostedZoneSummary')
          .map(HostedZoneSummary.fromXml)
          .toList(),
      maxItems: _s.extractXmlStringValue(elem, 'MaxItems')!,
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZoneSummaries = this.hostedZoneSummaries;
    final maxItems = this.maxItems;
    final nextToken = this.nextToken;
    return {
      'HostedZoneSummaries': hostedZoneSummaries,
      'MaxItems': maxItems,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListHostedZonesResponse {
  /// A complex type that contains general information about the hosted zone.
  final List<HostedZone> hostedZones;

  /// A flag indicating whether there are more hosted zones to be listed. If the
  /// response was truncated, you can get more hosted zones by submitting another
  /// <code>ListHostedZones</code> request and specifying the value of
  /// <code>NextMarker</code> in the <code>marker</code> parameter.
  final bool isTruncated;

  /// For the second and subsequent calls to <code>ListHostedZones</code>,
  /// <code>Marker</code> is the value that you specified for the
  /// <code>marker</code> parameter in the request that produced the current
  /// response.
  final String marker;

  /// The value that you specified for the <code>maxitems</code> parameter in the
  /// call to <code>ListHostedZones</code> that produced the current response.
  final String maxItems;

  /// If <code>IsTruncated</code> is <code>true</code>, the value of
  /// <code>NextMarker</code> identifies the first hosted zone in the next group
  /// of hosted zones. Submit another <code>ListHostedZones</code> request, and
  /// specify the value of <code>NextMarker</code> from the response in the
  /// <code>marker</code> parameter.
  ///
  /// This element is present only if <code>IsTruncated</code> is
  /// <code>true</code>.
  final String? nextMarker;

  ListHostedZonesResponse({
    required this.hostedZones,
    required this.isTruncated,
    required this.marker,
    required this.maxItems,
    this.nextMarker,
  });
  factory ListHostedZonesResponse.fromXml(_s.XmlElement elem) {
    return ListHostedZonesResponse(
      hostedZones: _s
          .extractXmlChild(elem, 'HostedZones')!
          .findElements('HostedZone')
          .map(HostedZone.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      marker: _s.extractXmlStringValue(elem, 'Marker')!,
      maxItems: _s.extractXmlStringValue(elem, 'MaxItems')!,
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZones = this.hostedZones;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    final maxItems = this.maxItems;
    final nextMarker = this.nextMarker;
    return {
      'HostedZones': hostedZones,
      'IsTruncated': isTruncated,
      'Marker': marker,
      'MaxItems': maxItems,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListQueryLoggingConfigsResponse {
  /// An array that contains one <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_QueryLoggingConfig.html">QueryLoggingConfig</a>
  /// element for each configuration for DNS query logging that is associated with
  /// the current Amazon Web Services account.
  final List<QueryLoggingConfig> queryLoggingConfigs;

  /// If a response includes the last of the query logging configurations that are
  /// associated with the current Amazon Web Services account,
  /// <code>NextToken</code> doesn't appear in the response.
  ///
  /// If a response doesn't include the last of the configurations, you can get
  /// more configurations by submitting another <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListQueryLoggingConfigs.html">ListQueryLoggingConfigs</a>
  /// request. Get the value of <code>NextToken</code> that Amazon Route 53
  /// returned in the previous response and include it in <code>NextToken</code>
  /// in the next request.
  final String? nextToken;

  ListQueryLoggingConfigsResponse({
    required this.queryLoggingConfigs,
    this.nextToken,
  });
  factory ListQueryLoggingConfigsResponse.fromXml(_s.XmlElement elem) {
    return ListQueryLoggingConfigsResponse(
      queryLoggingConfigs: _s
          .extractXmlChild(elem, 'QueryLoggingConfigs')!
          .findElements('QueryLoggingConfig')
          .map(QueryLoggingConfig.fromXml)
          .toList(),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final queryLoggingConfigs = this.queryLoggingConfigs;
    final nextToken = this.nextToken;
    return {
      'QueryLoggingConfigs': queryLoggingConfigs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A complex type that contains list information for the resource record set.
class ListResourceRecordSetsResponse {
  /// A flag that indicates whether more resource record sets remain to be listed.
  /// If your results were truncated, you can make a follow-up pagination request
  /// by using the <code>NextRecordName</code> element.
  final bool isTruncated;

  /// The maximum number of records you requested.
  final String maxItems;

  /// Information about multiple resource record sets.
  final List<ResourceRecordSet> resourceRecordSets;

  /// <i>Resource record sets that have a routing policy other than simple:</i> If
  /// results were truncated for a given DNS name and type, the value of
  /// <code>SetIdentifier</code> for the next resource record set that has the
  /// current DNS name and type.
  ///
  /// For information about routing policies, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html">Choosing
  /// a Routing Policy</a> in the <i>Amazon Route 53 Developer Guide</i>.
  final String? nextRecordIdentifier;

  /// If the results were truncated, the name of the next record in the list.
  ///
  /// This element is present only if <code>IsTruncated</code> is true.
  final String? nextRecordName;

  /// If the results were truncated, the type of the next record in the list.
  ///
  /// This element is present only if <code>IsTruncated</code> is true.
  final RRType? nextRecordType;

  ListResourceRecordSetsResponse({
    required this.isTruncated,
    required this.maxItems,
    required this.resourceRecordSets,
    this.nextRecordIdentifier,
    this.nextRecordName,
    this.nextRecordType,
  });
  factory ListResourceRecordSetsResponse.fromXml(_s.XmlElement elem) {
    return ListResourceRecordSetsResponse(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      maxItems: _s.extractXmlStringValue(elem, 'MaxItems')!,
      resourceRecordSets: _s
          .extractXmlChild(elem, 'ResourceRecordSets')!
          .findElements('ResourceRecordSet')
          .map(ResourceRecordSet.fromXml)
          .toList(),
      nextRecordIdentifier:
          _s.extractXmlStringValue(elem, 'NextRecordIdentifier'),
      nextRecordName: _s.extractXmlStringValue(elem, 'NextRecordName'),
      nextRecordType:
          _s.extractXmlStringValue(elem, 'NextRecordType')?.toRRType(),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final maxItems = this.maxItems;
    final resourceRecordSets = this.resourceRecordSets;
    final nextRecordIdentifier = this.nextRecordIdentifier;
    final nextRecordName = this.nextRecordName;
    final nextRecordType = this.nextRecordType;
    return {
      'IsTruncated': isTruncated,
      'MaxItems': maxItems,
      'ResourceRecordSets': resourceRecordSets,
      if (nextRecordIdentifier != null)
        'NextRecordIdentifier': nextRecordIdentifier,
      if (nextRecordName != null) 'NextRecordName': nextRecordName,
      if (nextRecordType != null) 'NextRecordType': nextRecordType.toValue(),
    };
  }
}

/// A complex type that contains information about the reusable delegation sets
/// that are associated with the current Amazon Web Services account.
class ListReusableDelegationSetsResponse {
  /// A complex type that contains one <code>DelegationSet</code> element for each
  /// reusable delegation set that was created by the current Amazon Web Services
  /// account.
  final List<DelegationSet> delegationSets;

  /// A flag that indicates whether there are more reusable delegation sets to be
  /// listed.
  final bool isTruncated;

  /// For the second and subsequent calls to
  /// <code>ListReusableDelegationSets</code>, <code>Marker</code> is the value
  /// that you specified for the <code>marker</code> parameter in the request that
  /// produced the current response.
  final String marker;

  /// The value that you specified for the <code>maxitems</code> parameter in the
  /// call to <code>ListReusableDelegationSets</code> that produced the current
  /// response.
  final String maxItems;

  /// If <code>IsTruncated</code> is <code>true</code>, the value of
  /// <code>NextMarker</code> identifies the next reusable delegation set that
  /// Amazon Route 53 will return if you submit another
  /// <code>ListReusableDelegationSets</code> request and specify the value of
  /// <code>NextMarker</code> in the <code>marker</code> parameter.
  final String? nextMarker;

  ListReusableDelegationSetsResponse({
    required this.delegationSets,
    required this.isTruncated,
    required this.marker,
    required this.maxItems,
    this.nextMarker,
  });
  factory ListReusableDelegationSetsResponse.fromXml(_s.XmlElement elem) {
    return ListReusableDelegationSetsResponse(
      delegationSets: _s
          .extractXmlChild(elem, 'DelegationSets')!
          .findElements('DelegationSet')
          .map(DelegationSet.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      marker: _s.extractXmlStringValue(elem, 'Marker')!,
      maxItems: _s.extractXmlStringValue(elem, 'MaxItems')!,
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final delegationSets = this.delegationSets;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    final maxItems = this.maxItems;
    final nextMarker = this.nextMarker;
    return {
      'DelegationSets': delegationSets,
      'IsTruncated': isTruncated,
      'Marker': marker,
      'MaxItems': maxItems,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// A complex type that contains information about the health checks or hosted
/// zones for which you want to list tags.
class ListTagsForResourceResponse {
  /// A <code>ResourceTagSet</code> containing tags associated with the specified
  /// resource.
  final ResourceTagSet resourceTagSet;

  ListTagsForResourceResponse({
    required this.resourceTagSet,
  });
  factory ListTagsForResourceResponse.fromXml(_s.XmlElement elem) {
    return ListTagsForResourceResponse(
      resourceTagSet:
          ResourceTagSet.fromXml(_s.extractXmlChild(elem, 'ResourceTagSet')!),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTagSet = this.resourceTagSet;
    return {
      'ResourceTagSet': resourceTagSet,
    };
  }
}

/// A complex type that contains information about the health checks or hosted
/// zones for which you want to list tags.
class ListTagsForResourcesRequest {
  /// A complex type that contains the ResourceId element for each resource for
  /// which you want to get a list of tags.
  final List<String> resourceIds;

  /// The type of the resources.
  ///
  /// <ul>
  /// <li>
  /// The resource type for health checks is <code>healthcheck</code>.
  /// </li>
  /// <li>
  /// The resource type for hosted zones is <code>hostedzone</code>.
  /// </li>
  /// </ul>
  final TagResourceType resourceType;

  ListTagsForResourcesRequest({
    required this.resourceIds,
    required this.resourceType,
  });

  Map<String, dynamic> toJson() {
    final resourceIds = this.resourceIds;
    final resourceType = this.resourceType;
    return {
      'ResourceIds': resourceIds,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final resourceIds = this.resourceIds;
    final resourceType = this.resourceType;
    final $children = <_s.XmlNode>[
      _s.XmlElement(_s.XmlName('ResourceIds'), [],
          resourceIds.map((e) => _s.encodeXmlStringValue('ResourceId', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type containing tags for the specified resources.
class ListTagsForResourcesResponse {
  /// A list of <code>ResourceTagSet</code>s containing tags associated with the
  /// specified resources.
  final List<ResourceTagSet> resourceTagSets;

  ListTagsForResourcesResponse({
    required this.resourceTagSets,
  });
  factory ListTagsForResourcesResponse.fromXml(_s.XmlElement elem) {
    return ListTagsForResourcesResponse(
      resourceTagSets: _s
          .extractXmlChild(elem, 'ResourceTagSets')!
          .findElements('ResourceTagSet')
          .map(ResourceTagSet.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTagSets = this.resourceTagSets;
    return {
      'ResourceTagSets': resourceTagSets,
    };
  }
}

/// A complex type that contains the response information for the request.
class ListTrafficPoliciesResponse {
  /// A flag that indicates whether there are more traffic policies to be listed.
  /// If the response was truncated, you can get the next group of traffic
  /// policies by submitting another <code>ListTrafficPolicies</code> request and
  /// specifying the value of <code>TrafficPolicyIdMarker</code> in the
  /// <code>TrafficPolicyIdMarker</code> request parameter.
  final bool isTruncated;

  /// The value that you specified for the <code>MaxItems</code> parameter in the
  /// <code>ListTrafficPolicies</code> request that produced the current response.
  final String maxItems;

  /// If the value of <code>IsTruncated</code> is <code>true</code>,
  /// <code>TrafficPolicyIdMarker</code> is the ID of the first traffic policy in
  /// the next group of <code>MaxItems</code> traffic policies.
  final String trafficPolicyIdMarker;

  /// A list that contains one <code>TrafficPolicySummary</code> element for each
  /// traffic policy that was created by the current Amazon Web Services account.
  final List<TrafficPolicySummary> trafficPolicySummaries;

  ListTrafficPoliciesResponse({
    required this.isTruncated,
    required this.maxItems,
    required this.trafficPolicyIdMarker,
    required this.trafficPolicySummaries,
  });
  factory ListTrafficPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListTrafficPoliciesResponse(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      maxItems: _s.extractXmlStringValue(elem, 'MaxItems')!,
      trafficPolicyIdMarker:
          _s.extractXmlStringValue(elem, 'TrafficPolicyIdMarker')!,
      trafficPolicySummaries: _s
          .extractXmlChild(elem, 'TrafficPolicySummaries')!
          .findElements('TrafficPolicySummary')
          .map(TrafficPolicySummary.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final maxItems = this.maxItems;
    final trafficPolicyIdMarker = this.trafficPolicyIdMarker;
    final trafficPolicySummaries = this.trafficPolicySummaries;
    return {
      'IsTruncated': isTruncated,
      'MaxItems': maxItems,
      'TrafficPolicyIdMarker': trafficPolicyIdMarker,
      'TrafficPolicySummaries': trafficPolicySummaries,
    };
  }
}

/// A complex type that contains the response information for the request.
class ListTrafficPolicyInstancesByHostedZoneResponse {
  /// A flag that indicates whether there are more traffic policy instances to be
  /// listed. If the response was truncated, you can get the next group of traffic
  /// policy instances by submitting another
  /// <code>ListTrafficPolicyInstancesByHostedZone</code> request and specifying
  /// the values of <code>HostedZoneIdMarker</code>,
  /// <code>TrafficPolicyInstanceNameMarker</code>, and
  /// <code>TrafficPolicyInstanceTypeMarker</code> in the corresponding request
  /// parameters.
  final bool isTruncated;

  /// The value that you specified for the <code>MaxItems</code> parameter in the
  /// <code>ListTrafficPolicyInstancesByHostedZone</code> request that produced
  /// the current response.
  final String maxItems;

  /// A list that contains one <code>TrafficPolicyInstance</code> element for each
  /// traffic policy instance that matches the elements in the request.
  final List<TrafficPolicyInstance> trafficPolicyInstances;

  /// If <code>IsTruncated</code> is <code>true</code>,
  /// <code>TrafficPolicyInstanceNameMarker</code> is the name of the first
  /// traffic policy instance in the next group of traffic policy instances.
  final String? trafficPolicyInstanceNameMarker;

  /// If <code>IsTruncated</code> is true,
  /// <code>TrafficPolicyInstanceTypeMarker</code> is the DNS type of the resource
  /// record sets that are associated with the first traffic policy instance in
  /// the next group of traffic policy instances.
  final RRType? trafficPolicyInstanceTypeMarker;

  ListTrafficPolicyInstancesByHostedZoneResponse({
    required this.isTruncated,
    required this.maxItems,
    required this.trafficPolicyInstances,
    this.trafficPolicyInstanceNameMarker,
    this.trafficPolicyInstanceTypeMarker,
  });
  factory ListTrafficPolicyInstancesByHostedZoneResponse.fromXml(
      _s.XmlElement elem) {
    return ListTrafficPolicyInstancesByHostedZoneResponse(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      maxItems: _s.extractXmlStringValue(elem, 'MaxItems')!,
      trafficPolicyInstances: _s
          .extractXmlChild(elem, 'TrafficPolicyInstances')!
          .findElements('TrafficPolicyInstance')
          .map(TrafficPolicyInstance.fromXml)
          .toList(),
      trafficPolicyInstanceNameMarker:
          _s.extractXmlStringValue(elem, 'TrafficPolicyInstanceNameMarker'),
      trafficPolicyInstanceTypeMarker: _s
          .extractXmlStringValue(elem, 'TrafficPolicyInstanceTypeMarker')
          ?.toRRType(),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final maxItems = this.maxItems;
    final trafficPolicyInstances = this.trafficPolicyInstances;
    final trafficPolicyInstanceNameMarker =
        this.trafficPolicyInstanceNameMarker;
    final trafficPolicyInstanceTypeMarker =
        this.trafficPolicyInstanceTypeMarker;
    return {
      'IsTruncated': isTruncated,
      'MaxItems': maxItems,
      'TrafficPolicyInstances': trafficPolicyInstances,
      if (trafficPolicyInstanceNameMarker != null)
        'TrafficPolicyInstanceNameMarker': trafficPolicyInstanceNameMarker,
      if (trafficPolicyInstanceTypeMarker != null)
        'TrafficPolicyInstanceTypeMarker':
            trafficPolicyInstanceTypeMarker.toValue(),
    };
  }
}

/// A complex type that contains the response information for the request.
class ListTrafficPolicyInstancesByPolicyResponse {
  /// A flag that indicates whether there are more traffic policy instances to be
  /// listed. If the response was truncated, you can get the next group of traffic
  /// policy instances by calling <code>ListTrafficPolicyInstancesByPolicy</code>
  /// again and specifying the values of the <code>HostedZoneIdMarker</code>,
  /// <code>TrafficPolicyInstanceNameMarker</code>, and
  /// <code>TrafficPolicyInstanceTypeMarker</code> elements in the corresponding
  /// request parameters.
  final bool isTruncated;

  /// The value that you specified for the <code>MaxItems</code> parameter in the
  /// call to <code>ListTrafficPolicyInstancesByPolicy</code> that produced the
  /// current response.
  final String maxItems;

  /// A list that contains one <code>TrafficPolicyInstance</code> element for each
  /// traffic policy instance that matches the elements in the request.
  final List<TrafficPolicyInstance> trafficPolicyInstances;

  /// If <code>IsTruncated</code> is <code>true</code>,
  /// <code>HostedZoneIdMarker</code> is the ID of the hosted zone of the first
  /// traffic policy instance in the next group of traffic policy instances.
  final String? hostedZoneIdMarker;

  /// If <code>IsTruncated</code> is <code>true</code>,
  /// <code>TrafficPolicyInstanceNameMarker</code> is the name of the first
  /// traffic policy instance in the next group of <code>MaxItems</code> traffic
  /// policy instances.
  final String? trafficPolicyInstanceNameMarker;

  /// If <code>IsTruncated</code> is <code>true</code>,
  /// <code>TrafficPolicyInstanceTypeMarker</code> is the DNS type of the resource
  /// record sets that are associated with the first traffic policy instance in
  /// the next group of <code>MaxItems</code> traffic policy instances.
  final RRType? trafficPolicyInstanceTypeMarker;

  ListTrafficPolicyInstancesByPolicyResponse({
    required this.isTruncated,
    required this.maxItems,
    required this.trafficPolicyInstances,
    this.hostedZoneIdMarker,
    this.trafficPolicyInstanceNameMarker,
    this.trafficPolicyInstanceTypeMarker,
  });
  factory ListTrafficPolicyInstancesByPolicyResponse.fromXml(
      _s.XmlElement elem) {
    return ListTrafficPolicyInstancesByPolicyResponse(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      maxItems: _s.extractXmlStringValue(elem, 'MaxItems')!,
      trafficPolicyInstances: _s
          .extractXmlChild(elem, 'TrafficPolicyInstances')!
          .findElements('TrafficPolicyInstance')
          .map(TrafficPolicyInstance.fromXml)
          .toList(),
      hostedZoneIdMarker: _s.extractXmlStringValue(elem, 'HostedZoneIdMarker'),
      trafficPolicyInstanceNameMarker:
          _s.extractXmlStringValue(elem, 'TrafficPolicyInstanceNameMarker'),
      trafficPolicyInstanceTypeMarker: _s
          .extractXmlStringValue(elem, 'TrafficPolicyInstanceTypeMarker')
          ?.toRRType(),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final maxItems = this.maxItems;
    final trafficPolicyInstances = this.trafficPolicyInstances;
    final hostedZoneIdMarker = this.hostedZoneIdMarker;
    final trafficPolicyInstanceNameMarker =
        this.trafficPolicyInstanceNameMarker;
    final trafficPolicyInstanceTypeMarker =
        this.trafficPolicyInstanceTypeMarker;
    return {
      'IsTruncated': isTruncated,
      'MaxItems': maxItems,
      'TrafficPolicyInstances': trafficPolicyInstances,
      if (hostedZoneIdMarker != null) 'HostedZoneIdMarker': hostedZoneIdMarker,
      if (trafficPolicyInstanceNameMarker != null)
        'TrafficPolicyInstanceNameMarker': trafficPolicyInstanceNameMarker,
      if (trafficPolicyInstanceTypeMarker != null)
        'TrafficPolicyInstanceTypeMarker':
            trafficPolicyInstanceTypeMarker.toValue(),
    };
  }
}

/// A complex type that contains the response information for the request.
class ListTrafficPolicyInstancesResponse {
  /// A flag that indicates whether there are more traffic policy instances to be
  /// listed. If the response was truncated, you can get more traffic policy
  /// instances by calling <code>ListTrafficPolicyInstances</code> again and
  /// specifying the values of the <code>HostedZoneIdMarker</code>,
  /// <code>TrafficPolicyInstanceNameMarker</code>, and
  /// <code>TrafficPolicyInstanceTypeMarker</code> in the corresponding request
  /// parameters.
  final bool isTruncated;

  /// The value that you specified for the <code>MaxItems</code> parameter in the
  /// call to <code>ListTrafficPolicyInstances</code> that produced the current
  /// response.
  final String maxItems;

  /// A list that contains one <code>TrafficPolicyInstance</code> element for each
  /// traffic policy instance that matches the elements in the request.
  final List<TrafficPolicyInstance> trafficPolicyInstances;

  /// If <code>IsTruncated</code> is <code>true</code>,
  /// <code>HostedZoneIdMarker</code> is the ID of the hosted zone of the first
  /// traffic policy instance that Route 53 will return if you submit another
  /// <code>ListTrafficPolicyInstances</code> request.
  final String? hostedZoneIdMarker;

  /// If <code>IsTruncated</code> is <code>true</code>,
  /// <code>TrafficPolicyInstanceNameMarker</code> is the name of the first
  /// traffic policy instance that Route 53 will return if you submit another
  /// <code>ListTrafficPolicyInstances</code> request.
  final String? trafficPolicyInstanceNameMarker;

  /// If <code>IsTruncated</code> is <code>true</code>,
  /// <code>TrafficPolicyInstanceTypeMarker</code> is the DNS type of the resource
  /// record sets that are associated with the first traffic policy instance that
  /// Amazon Route 53 will return if you submit another
  /// <code>ListTrafficPolicyInstances</code> request.
  final RRType? trafficPolicyInstanceTypeMarker;

  ListTrafficPolicyInstancesResponse({
    required this.isTruncated,
    required this.maxItems,
    required this.trafficPolicyInstances,
    this.hostedZoneIdMarker,
    this.trafficPolicyInstanceNameMarker,
    this.trafficPolicyInstanceTypeMarker,
  });
  factory ListTrafficPolicyInstancesResponse.fromXml(_s.XmlElement elem) {
    return ListTrafficPolicyInstancesResponse(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      maxItems: _s.extractXmlStringValue(elem, 'MaxItems')!,
      trafficPolicyInstances: _s
          .extractXmlChild(elem, 'TrafficPolicyInstances')!
          .findElements('TrafficPolicyInstance')
          .map(TrafficPolicyInstance.fromXml)
          .toList(),
      hostedZoneIdMarker: _s.extractXmlStringValue(elem, 'HostedZoneIdMarker'),
      trafficPolicyInstanceNameMarker:
          _s.extractXmlStringValue(elem, 'TrafficPolicyInstanceNameMarker'),
      trafficPolicyInstanceTypeMarker: _s
          .extractXmlStringValue(elem, 'TrafficPolicyInstanceTypeMarker')
          ?.toRRType(),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final maxItems = this.maxItems;
    final trafficPolicyInstances = this.trafficPolicyInstances;
    final hostedZoneIdMarker = this.hostedZoneIdMarker;
    final trafficPolicyInstanceNameMarker =
        this.trafficPolicyInstanceNameMarker;
    final trafficPolicyInstanceTypeMarker =
        this.trafficPolicyInstanceTypeMarker;
    return {
      'IsTruncated': isTruncated,
      'MaxItems': maxItems,
      'TrafficPolicyInstances': trafficPolicyInstances,
      if (hostedZoneIdMarker != null) 'HostedZoneIdMarker': hostedZoneIdMarker,
      if (trafficPolicyInstanceNameMarker != null)
        'TrafficPolicyInstanceNameMarker': trafficPolicyInstanceNameMarker,
      if (trafficPolicyInstanceTypeMarker != null)
        'TrafficPolicyInstanceTypeMarker':
            trafficPolicyInstanceTypeMarker.toValue(),
    };
  }
}

/// A complex type that contains the response information for the request.
class ListTrafficPolicyVersionsResponse {
  /// A flag that indicates whether there are more traffic policies to be listed.
  /// If the response was truncated, you can get the next group of traffic
  /// policies by submitting another <code>ListTrafficPolicyVersions</code>
  /// request and specifying the value of <code>NextMarker</code> in the
  /// <code>marker</code> parameter.
  final bool isTruncated;

  /// The value that you specified for the <code>maxitems</code> parameter in the
  /// <code>ListTrafficPolicyVersions</code> request that produced the current
  /// response.
  final String maxItems;

  /// A list that contains one <code>TrafficPolicy</code> element for each traffic
  /// policy version that is associated with the specified traffic policy.
  final List<TrafficPolicy> trafficPolicies;

  /// If <code>IsTruncated</code> is <code>true</code>, the value of
  /// <code>TrafficPolicyVersionMarker</code> identifies the first traffic policy
  /// that Amazon Route 53 will return if you submit another request. Call
  /// <code>ListTrafficPolicyVersions</code> again and specify the value of
  /// <code>TrafficPolicyVersionMarker</code> in the
  /// <code>TrafficPolicyVersionMarker</code> request parameter.
  ///
  /// This element is present only if <code>IsTruncated</code> is
  /// <code>true</code>.
  final String trafficPolicyVersionMarker;

  ListTrafficPolicyVersionsResponse({
    required this.isTruncated,
    required this.maxItems,
    required this.trafficPolicies,
    required this.trafficPolicyVersionMarker,
  });
  factory ListTrafficPolicyVersionsResponse.fromXml(_s.XmlElement elem) {
    return ListTrafficPolicyVersionsResponse(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      maxItems: _s.extractXmlStringValue(elem, 'MaxItems')!,
      trafficPolicies: _s
          .extractXmlChild(elem, 'TrafficPolicies')!
          .findElements('TrafficPolicy')
          .map(TrafficPolicy.fromXml)
          .toList(),
      trafficPolicyVersionMarker:
          _s.extractXmlStringValue(elem, 'TrafficPolicyVersionMarker')!,
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final maxItems = this.maxItems;
    final trafficPolicies = this.trafficPolicies;
    final trafficPolicyVersionMarker = this.trafficPolicyVersionMarker;
    return {
      'IsTruncated': isTruncated,
      'MaxItems': maxItems,
      'TrafficPolicies': trafficPolicies,
      'TrafficPolicyVersionMarker': trafficPolicyVersionMarker,
    };
  }
}

/// A complex type that contains the response information for the request.
class ListVPCAssociationAuthorizationsResponse {
  /// The ID of the hosted zone that you can associate the listed VPCs with.
  final String hostedZoneId;

  /// The list of VPCs that are authorized to be associated with the specified
  /// hosted zone.
  final List<VPC> vPCs;

  /// When the response includes a <code>NextToken</code> element, there are more
  /// VPCs that can be associated with the specified hosted zone. To get the next
  /// page of VPCs, submit another <code>ListVPCAssociationAuthorizations</code>
  /// request, and include the value of the <code>NextToken</code> element from
  /// the response in the <code>nexttoken</code> request parameter.
  final String? nextToken;

  ListVPCAssociationAuthorizationsResponse({
    required this.hostedZoneId,
    required this.vPCs,
    this.nextToken,
  });
  factory ListVPCAssociationAuthorizationsResponse.fromXml(_s.XmlElement elem) {
    return ListVPCAssociationAuthorizationsResponse(
      hostedZoneId: _s.extractXmlStringValue(elem, 'HostedZoneId')!,
      vPCs: _s
          .extractXmlChild(elem, 'VPCs')!
          .findElements('VPC')
          .map(VPC.fromXml)
          .toList(),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZoneId = this.hostedZoneId;
    final vPCs = this.vPCs;
    final nextToken = this.nextToken;
    return {
      'HostedZoneId': hostedZoneId,
      'VPCs': vPCs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A complex type that contains information about the CIDR location.
class LocationSummary {
  /// A string that specifies a location name.
  final String? locationName;

  LocationSummary({
    this.locationName,
  });
  factory LocationSummary.fromXml(_s.XmlElement elem) {
    return LocationSummary(
      locationName: _s.extractXmlStringValue(elem, 'LocationName'),
    );
  }

  Map<String, dynamic> toJson() {
    final locationName = this.locationName;
    return {
      if (locationName != null) 'LocationName': locationName,
    };
  }
}

/// A complex type that contains information about a configuration for DNS query
/// logging.
class QueryLoggingConfig {
  /// The Amazon Resource Name (ARN) of the CloudWatch Logs log group that Amazon
  /// Route 53 is publishing logs to.
  final String cloudWatchLogsLogGroupArn;

  /// The ID of the hosted zone that CloudWatch Logs is logging queries for.
  final String hostedZoneId;

  /// The ID for a configuration for DNS query logging.
  final String id;

  QueryLoggingConfig({
    required this.cloudWatchLogsLogGroupArn,
    required this.hostedZoneId,
    required this.id,
  });
  factory QueryLoggingConfig.fromXml(_s.XmlElement elem) {
    return QueryLoggingConfig(
      cloudWatchLogsLogGroupArn:
          _s.extractXmlStringValue(elem, 'CloudWatchLogsLogGroupArn')!,
      hostedZoneId: _s.extractXmlStringValue(elem, 'HostedZoneId')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsLogGroupArn = this.cloudWatchLogsLogGroupArn;
    final hostedZoneId = this.hostedZoneId;
    final id = this.id;
    return {
      'CloudWatchLogsLogGroupArn': cloudWatchLogsLogGroupArn,
      'HostedZoneId': hostedZoneId,
      'Id': id,
    };
  }
}

enum RRType {
  soa,
  a,
  txt,
  ns,
  cname,
  mx,
  naptr,
  ptr,
  srv,
  spf,
  aaaa,
  caa,
  ds,
}

extension RRTypeValueExtension on RRType {
  String toValue() {
    switch (this) {
      case RRType.soa:
        return 'SOA';
      case RRType.a:
        return 'A';
      case RRType.txt:
        return 'TXT';
      case RRType.ns:
        return 'NS';
      case RRType.cname:
        return 'CNAME';
      case RRType.mx:
        return 'MX';
      case RRType.naptr:
        return 'NAPTR';
      case RRType.ptr:
        return 'PTR';
      case RRType.srv:
        return 'SRV';
      case RRType.spf:
        return 'SPF';
      case RRType.aaaa:
        return 'AAAA';
      case RRType.caa:
        return 'CAA';
      case RRType.ds:
        return 'DS';
    }
  }
}

extension RRTypeFromString on String {
  RRType toRRType() {
    switch (this) {
      case 'SOA':
        return RRType.soa;
      case 'A':
        return RRType.a;
      case 'TXT':
        return RRType.txt;
      case 'NS':
        return RRType.ns;
      case 'CNAME':
        return RRType.cname;
      case 'MX':
        return RRType.mx;
      case 'NAPTR':
        return RRType.naptr;
      case 'PTR':
        return RRType.ptr;
      case 'SRV':
        return RRType.srv;
      case 'SPF':
        return RRType.spf;
      case 'AAAA':
        return RRType.aaaa;
      case 'CAA':
        return RRType.caa;
      case 'DS':
        return RRType.ds;
    }
    throw Exception('$this is not known in enum RRType');
  }
}

enum ResettableElementName {
  fullyQualifiedDomainName,
  regions,
  resourcePath,
  childHealthChecks,
}

extension ResettableElementNameValueExtension on ResettableElementName {
  String toValue() {
    switch (this) {
      case ResettableElementName.fullyQualifiedDomainName:
        return 'FullyQualifiedDomainName';
      case ResettableElementName.regions:
        return 'Regions';
      case ResettableElementName.resourcePath:
        return 'ResourcePath';
      case ResettableElementName.childHealthChecks:
        return 'ChildHealthChecks';
    }
  }
}

extension ResettableElementNameFromString on String {
  ResettableElementName toResettableElementName() {
    switch (this) {
      case 'FullyQualifiedDomainName':
        return ResettableElementName.fullyQualifiedDomainName;
      case 'Regions':
        return ResettableElementName.regions;
      case 'ResourcePath':
        return ResettableElementName.resourcePath;
      case 'ChildHealthChecks':
        return ResettableElementName.childHealthChecks;
    }
    throw Exception('$this is not known in enum ResettableElementName');
  }
}

/// Information specific to the resource record.
/// <note>
/// If you're creating an alias resource record set, omit
/// <code>ResourceRecord</code>.
/// </note>
class ResourceRecord {
  /// The current or new DNS record value, not to exceed 4,000 characters. In the
  /// case of a <code>DELETE</code> action, if the current value does not match
  /// the actual value, an error is returned. For descriptions about how to format
  /// <code>Value</code> for different record types, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/ResourceRecordTypes.html">Supported
  /// DNS Resource Record Types</a> in the <i>Amazon Route 53 Developer Guide</i>.
  ///
  /// You can specify more than one value for all record types except
  /// <code>CNAME</code> and <code>SOA</code>.
  /// <note>
  /// If you're creating an alias resource record set, omit <code>Value</code>.
  /// </note>
  final String value;

  ResourceRecord({
    required this.value,
  });
  factory ResourceRecord.fromXml(_s.XmlElement elem) {
    return ResourceRecord(
      value: _s.extractXmlStringValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'Value': value,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final value = this.value;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Value', value),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// Information about the resource record set to create or delete.
class ResourceRecordSet {
  /// For <code>ChangeResourceRecordSets</code> requests, the name of the record
  /// that you want to create, update, or delete. For
  /// <code>ListResourceRecordSets</code> responses, the name of a record in the
  /// specified hosted zone.
  ///
  /// <b>ChangeResourceRecordSets Only</b>
  ///
  /// Enter a fully qualified domain name, for example,
  /// <code>www.example.com</code>. You can optionally include a trailing dot. If
  /// you omit the trailing dot, Amazon Route 53 assumes that the domain name that
  /// you specify is fully qualified. This means that Route 53 treats
  /// <code>www.example.com</code> (without a trailing dot) and
  /// <code>www.example.com.</code> (with a trailing dot) as identical.
  ///
  /// For information about how to specify characters other than <code>a-z</code>,
  /// <code>0-9</code>, and <code>-</code> (hyphen) and how to specify
  /// internationalized domain names, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html">DNS
  /// Domain Name Format</a> in the <i>Amazon Route 53 Developer Guide</i>.
  ///
  /// You can use the asterisk (*) wildcard to replace the leftmost label in a
  /// domain name, for example, <code>*.example.com</code>. Note the following:
  ///
  /// <ul>
  /// <li>
  /// The * must replace the entire label. For example, you can't specify
  /// <code>*prod.example.com</code> or <code>prod*.example.com</code>.
  /// </li>
  /// <li>
  /// The * can't replace any of the middle labels, for example,
  /// marketing.*.example.com.
  /// </li>
  /// <li>
  /// If you include * in any position other than the leftmost label in a domain
  /// name, DNS treats it as an * character (ASCII 42), not as a wildcard.
  /// <important>
  /// You can't use the * wildcard for resource records sets that have a type of
  /// NS.
  /// </important> </li>
  /// </ul>
  final String name;

  /// The DNS record type. For information about different record types and how
  /// data is encoded for them, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/ResourceRecordTypes.html">Supported
  /// DNS Resource Record Types</a> in the <i>Amazon Route 53 Developer Guide</i>.
  ///
  /// Valid values for basic resource record sets: <code>A</code> |
  /// <code>AAAA</code> | <code>CAA</code> | <code>CNAME</code> | <code>DS</code>
  /// |<code>MX</code> | <code>NAPTR</code> | <code>NS</code> | <code>PTR</code> |
  /// <code>SOA</code> | <code>SPF</code> | <code>SRV</code> | <code>TXT</code>
  ///
  /// Values for weighted, latency, geolocation, and failover resource record
  /// sets: <code>A</code> | <code>AAAA</code> | <code>CAA</code> |
  /// <code>CNAME</code> | <code>MX</code> | <code>NAPTR</code> | <code>PTR</code>
  /// | <code>SPF</code> | <code>SRV</code> | <code>TXT</code>. When creating a
  /// group of weighted, latency, geolocation, or failover resource record sets,
  /// specify the same value for all of the resource record sets in the group.
  ///
  /// Valid values for multivalue answer resource record sets: <code>A</code> |
  /// <code>AAAA</code> | <code>MX</code> | <code>NAPTR</code> | <code>PTR</code>
  /// | <code>SPF</code> | <code>SRV</code> | <code>TXT</code>
  /// <note>
  /// SPF records were formerly used to verify the identity of the sender of email
  /// messages. However, we no longer recommend that you create resource record
  /// sets for which the value of <code>Type</code> is <code>SPF</code>. RFC 7208,
  /// <i>Sender Policy Framework (SPF) for Authorizing Use of Domains in Email,
  /// Version 1</i>, has been updated to say, "...[I]ts existence and mechanism
  /// defined in [RFC4408] have led to some interoperability issues. Accordingly,
  /// its use is no longer appropriate for SPF version 1; implementations are not
  /// to use it." In RFC 7208, see section 14.1, <a
  /// href="http://tools.ietf.org/html/rfc7208#section-14.1">The SPF DNS Record
  /// Type</a>.
  /// </note>
  /// Values for alias resource record sets:
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon API Gateway custom regional APIs and edge-optimized APIs:</b>
  /// <code>A</code>
  /// </li>
  /// <li>
  /// <b>CloudFront distributions:</b> <code>A</code>
  ///
  /// If IPv6 is enabled for the distribution, create two resource record sets to
  /// route traffic to your distribution, one with a value of <code>A</code> and
  /// one with a value of <code>AAAA</code>.
  /// </li>
  /// <li>
  /// <b>Amazon API Gateway environment that has a regionalized subdomain</b>:
  /// <code>A</code>
  /// </li>
  /// <li>
  /// <b>ELB load balancers:</b> <code>A</code> | <code>AAAA</code>
  /// </li>
  /// <li>
  /// <b>Amazon S3 buckets:</b> <code>A</code>
  /// </li>
  /// <li>
  /// <b>Amazon Virtual Private Cloud interface VPC endpoints</b> <code>A</code>
  /// </li>
  /// <li>
  /// <b>Another resource record set in this hosted zone:</b> Specify the type of
  /// the resource record set that you're creating the alias for. All values are
  /// supported except <code>NS</code> and <code>SOA</code>.
  /// <note>
  /// If you're creating an alias record that has the same name as the hosted zone
  /// (known as the zone apex), you can't route traffic to a record for which the
  /// value of <code>Type</code> is <code>CNAME</code>. This is because the alias
  /// record must have the same type as the record you're routing traffic to, and
  /// creating a CNAME record for the zone apex isn't supported even for an alias
  /// record.
  /// </note> </li>
  /// </ul>
  final RRType type;

  /// <i>Alias resource record sets only:</i> Information about the Amazon Web
  /// Services resource, such as a CloudFront distribution or an Amazon S3 bucket,
  /// that you want to route traffic to.
  ///
  /// If you're creating resource records sets for a private hosted zone, note the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// You can't create an alias resource record set in a private hosted zone to
  /// route traffic to a CloudFront distribution.
  /// </li>
  /// <li>
  /// For information about creating failover resource record sets in a private
  /// hosted zone, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-private-hosted-zones.html">Configuring
  /// Failover in a Private Hosted Zone</a> in the <i>Amazon Route 53 Developer
  /// Guide</i>.
  /// </li>
  /// </ul>
  final AliasTarget? aliasTarget;
  final CidrRoutingConfig? cidrRoutingConfig;

  /// <i>Failover resource record sets only:</i> To configure failover, you add
  /// the <code>Failover</code> element to two resource record sets. For one
  /// resource record set, you specify <code>PRIMARY</code> as the value for
  /// <code>Failover</code>; for the other resource record set, you specify
  /// <code>SECONDARY</code>. In addition, you include the
  /// <code>HealthCheckId</code> element and specify the health check that you
  /// want Amazon Route 53 to perform for each resource record set.
  ///
  /// Except where noted, the following failover behaviors assume that you have
  /// included the <code>HealthCheckId</code> element in both resource record
  /// sets:
  ///
  /// <ul>
  /// <li>
  /// When the primary resource record set is healthy, Route 53 responds to DNS
  /// queries with the applicable value from the primary resource record set
  /// regardless of the health of the secondary resource record set.
  /// </li>
  /// <li>
  /// When the primary resource record set is unhealthy and the secondary resource
  /// record set is healthy, Route 53 responds to DNS queries with the applicable
  /// value from the secondary resource record set.
  /// </li>
  /// <li>
  /// When the secondary resource record set is unhealthy, Route 53 responds to
  /// DNS queries with the applicable value from the primary resource record set
  /// regardless of the health of the primary resource record set.
  /// </li>
  /// <li>
  /// If you omit the <code>HealthCheckId</code> element for the secondary
  /// resource record set, and if the primary resource record set is unhealthy,
  /// Route 53 always responds to DNS queries with the applicable value from the
  /// secondary resource record set. This is true regardless of the health of the
  /// associated endpoint.
  /// </li>
  /// </ul>
  /// You can't create non-failover resource record sets that have the same values
  /// for the <code>Name</code> and <code>Type</code> elements as failover
  /// resource record sets.
  ///
  /// For failover alias resource record sets, you must also include the
  /// <code>EvaluateTargetHealth</code> element and set the value to true.
  ///
  /// For more information about configuring failover for Route 53, see the
  /// following topics in the <i>Amazon Route 53 Developer Guide</i>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover.html">Route
  /// 53 Health Checks and DNS Failover</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-private-hosted-zones.html">Configuring
  /// Failover in a Private Hosted Zone</a>
  /// </li>
  /// </ul>
  final ResourceRecordSetFailover? failover;

  /// <i>Geolocation resource record sets only:</i> A complex type that lets you
  /// control how Amazon Route 53 responds to DNS queries based on the geographic
  /// origin of the query. For example, if you want all queries from Africa to be
  /// routed to a web server with an IP address of <code>192.0.2.111</code>,
  /// create a resource record set with a <code>Type</code> of <code>A</code> and
  /// a <code>ContinentCode</code> of <code>AF</code>.
  ///
  /// If you create separate resource record sets for overlapping geographic
  /// regions (for example, one resource record set for a continent and one for a
  /// country on the same continent), priority goes to the smallest geographic
  /// region. This allows you to route most queries for a continent to one
  /// resource and to route queries for a country on that continent to a different
  /// resource.
  ///
  /// You can't create two geolocation resource record sets that specify the same
  /// geographic location.
  ///
  /// The value <code>*</code> in the <code>CountryCode</code> element matches all
  /// geographic locations that aren't specified in other geolocation resource
  /// record sets that have the same values for the <code>Name</code> and
  /// <code>Type</code> elements.
  /// <important>
  /// Geolocation works by mapping IP addresses to locations. However, some IP
  /// addresses aren't mapped to geographic locations, so even if you create
  /// geolocation resource record sets that cover all seven continents, Route 53
  /// will receive some DNS queries from locations that it can't identify. We
  /// recommend that you create a resource record set for which the value of
  /// <code>CountryCode</code> is <code>*</code>. Two groups of queries are routed
  /// to the resource that you specify in this record: queries that come from
  /// locations for which you haven't created geolocation resource record sets and
  /// queries from IP addresses that aren't mapped to a location. If you don't
  /// create a <code>*</code> resource record set, Route 53 returns a "no answer"
  /// response for queries from those locations.
  /// </important>
  /// You can't create non-geolocation resource record sets that have the same
  /// values for the <code>Name</code> and <code>Type</code> elements as
  /// geolocation resource record sets.
  final GeoLocation? geoLocation;

  /// <i> GeoproximityLocation resource record sets only:</i> A complex type that
  /// lets you control how Route 53 responds to DNS queries based on the
  /// geographic origin of the query and your resources.
  final GeoProximityLocation? geoProximityLocation;

  /// If you want Amazon Route 53 to return this resource record set in response
  /// to a DNS query only when the status of a health check is healthy, include
  /// the <code>HealthCheckId</code> element and specify the ID of the applicable
  /// health check.
  ///
  /// Route 53 determines whether a resource record set is healthy based on one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// By periodically sending a request to the endpoint that is specified in the
  /// health check
  /// </li>
  /// <li>
  /// By aggregating the status of a specified group of health checks (calculated
  /// health checks)
  /// </li>
  /// <li>
  /// By determining the current state of a CloudWatch alarm (CloudWatch metric
  /// health checks)
  /// </li>
  /// </ul> <important>
  /// Route 53 doesn't check the health of the endpoint that is specified in the
  /// resource record set, for example, the endpoint specified by the IP address
  /// in the <code>Value</code> element. When you add a <code>HealthCheckId</code>
  /// element to a resource record set, Route 53 checks the health of the endpoint
  /// that you specified in the health check.
  /// </important>
  /// For more information, see the following topics in the <i>Amazon Route 53
  /// Developer Guide</i>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html">How
  /// Amazon Route 53 Determines Whether an Endpoint Is Healthy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover.html">Route
  /// 53 Health Checks and DNS Failover</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-private-hosted-zones.html">Configuring
  /// Failover in a Private Hosted Zone</a>
  /// </li>
  /// </ul>
  /// <b>When to Specify HealthCheckId</b>
  ///
  /// Specifying a value for <code>HealthCheckId</code> is useful only when Route
  /// 53 is choosing between two or more resource record sets to respond to a DNS
  /// query, and you want Route 53 to base the choice in part on the status of a
  /// health check. Configuring health checks makes sense only in the following
  /// configurations:
  ///
  /// <ul>
  /// <li>
  /// <b>Non-alias resource record sets</b>: You're checking the health of a group
  /// of non-alias resource record sets that have the same routing policy, name,
  /// and type (such as multiple weighted records named www.example.com with a
  /// type of A) and you specify health check IDs for all the resource record
  /// sets.
  ///
  /// If the health check status for a resource record set is healthy, Route 53
  /// includes the record among the records that it responds to DNS queries with.
  ///
  /// If the health check status for a resource record set is unhealthy, Route 53
  /// stops responding to DNS queries using the value for that resource record
  /// set.
  ///
  /// If the health check status for all resource record sets in the group is
  /// unhealthy, Route 53 considers all resource record sets in the group healthy
  /// and responds to DNS queries accordingly.
  /// </li>
  /// <li>
  /// <b>Alias resource record sets</b>: You specify the following settings:
  ///
  /// <ul>
  /// <li>
  /// You set <code>EvaluateTargetHealth</code> to true for an alias resource
  /// record set in a group of resource record sets that have the same routing
  /// policy, name, and type (such as multiple weighted records named
  /// www.example.com with a type of A).
  /// </li>
  /// <li>
  /// You configure the alias resource record set to route traffic to a non-alias
  /// resource record set in the same hosted zone.
  /// </li>
  /// <li>
  /// You specify a health check ID for the non-alias resource record set.
  /// </li>
  /// </ul>
  /// If the health check status is healthy, Route 53 considers the alias resource
  /// record set to be healthy and includes the alias record among the records
  /// that it responds to DNS queries with.
  ///
  /// If the health check status is unhealthy, Route 53 stops responding to DNS
  /// queries using the alias resource record set.
  /// <note>
  /// The alias resource record set can also route traffic to a <i>group</i> of
  /// non-alias resource record sets that have the same routing policy, name, and
  /// type. In that configuration, associate health checks with all of the
  /// resource record sets in the group of non-alias resource record sets.
  /// </note> </li>
  /// </ul>
  /// <b>Geolocation Routing</b>
  ///
  /// For geolocation resource record sets, if an endpoint is unhealthy, Route 53
  /// looks for a resource record set for the larger, associated geographic
  /// region. For example, suppose you have resource record sets for a state in
  /// the United States, for the entire United States, for North America, and a
  /// resource record set that has <code>*</code> for <code>CountryCode</code> is
  /// <code>*</code>, which applies to all locations. If the endpoint for the
  /// state resource record set is unhealthy, Route 53 checks for healthy resource
  /// record sets in the following order until it finds a resource record set for
  /// which the endpoint is healthy:
  ///
  /// <ul>
  /// <li>
  /// The United States
  /// </li>
  /// <li>
  /// North America
  /// </li>
  /// <li>
  /// The default resource record set
  /// </li>
  /// </ul>
  /// <b>Specifying the Health Check Endpoint by Domain Name</b>
  ///
  /// If your health checks specify the endpoint only by domain name, we recommend
  /// that you create a separate health check for each endpoint. For example,
  /// create a health check for each <code>HTTP</code> server that is serving
  /// content for <code>www.example.com</code>. For the value of
  /// <code>FullyQualifiedDomainName</code>, specify the domain name of the server
  /// (such as <code>us-east-2-www.example.com</code>), not the name of the
  /// resource record sets (<code>www.example.com</code>).
  /// <important>
  /// Health check results will be unpredictable if you do the following:
  ///
  /// <ul>
  /// <li>
  /// Create a health check that has the same value for
  /// <code>FullyQualifiedDomainName</code> as the name of a resource record set.
  /// </li>
  /// <li>
  /// Associate that health check with the resource record set.
  /// </li>
  /// </ul> </important>
  final String? healthCheckId;

  /// <i>Multivalue answer resource record sets only</i>: To route traffic
  /// approximately randomly to multiple resources, such as web servers, create
  /// one multivalue answer record for each resource and specify <code>true</code>
  /// for <code>MultiValueAnswer</code>. Note the following:
  ///
  /// <ul>
  /// <li>
  /// If you associate a health check with a multivalue answer resource record
  /// set, Amazon Route 53 responds to DNS queries with the corresponding IP
  /// address only when the health check is healthy.
  /// </li>
  /// <li>
  /// If you don't associate a health check with a multivalue answer record, Route
  /// 53 always considers the record to be healthy.
  /// </li>
  /// <li>
  /// Route 53 responds to DNS queries with up to eight healthy records; if you
  /// have eight or fewer healthy records, Route 53 responds to all DNS queries
  /// with all the healthy records.
  /// </li>
  /// <li>
  /// If you have more than eight healthy records, Route 53 responds to different
  /// DNS resolvers with different combinations of healthy records.
  /// </li>
  /// <li>
  /// When all records are unhealthy, Route 53 responds to DNS queries with up to
  /// eight unhealthy records.
  /// </li>
  /// <li>
  /// If a resource becomes unavailable after a resolver caches a response, client
  /// software typically tries another of the IP addresses in the response.
  /// </li>
  /// </ul>
  /// You can't create multivalue answer alias records.
  final bool? multiValueAnswer;

  /// <i>Latency-based resource record sets only:</i> The Amazon EC2 Region where
  /// you created the resource that this resource record set refers to. The
  /// resource typically is an Amazon Web Services resource, such as an EC2
  /// instance or an ELB load balancer, and is referred to by an IP address or a
  /// DNS domain name, depending on the record type.
  ///
  /// When Amazon Route 53 receives a DNS query for a domain name and type for
  /// which you have created latency resource record sets, Route 53 selects the
  /// latency resource record set that has the lowest latency between the end user
  /// and the associated Amazon EC2 Region. Route 53 then returns the value that
  /// is associated with the selected resource record set.
  ///
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// You can only specify one <code>ResourceRecord</code> per latency resource
  /// record set.
  /// </li>
  /// <li>
  /// You can only create one latency resource record set for each Amazon EC2
  /// Region.
  /// </li>
  /// <li>
  /// You aren't required to create latency resource record sets for all Amazon
  /// EC2 Regions. Route 53 will choose the region with the best latency from
  /// among the regions that you create latency resource record sets for.
  /// </li>
  /// <li>
  /// You can't create non-latency resource record sets that have the same values
  /// for the <code>Name</code> and <code>Type</code> elements as latency resource
  /// record sets.
  /// </li>
  /// </ul>
  final ResourceRecordSetRegion? region;

  /// Information about the resource records to act upon.
  /// <note>
  /// If you're creating an alias resource record set, omit
  /// <code>ResourceRecords</code>.
  /// </note>
  final List<ResourceRecord>? resourceRecords;

  /// <i>Resource record sets that have a routing policy other than simple:</i> An
  /// identifier that differentiates among multiple resource record sets that have
  /// the same combination of name and type, such as multiple weighted resource
  /// record sets named acme.example.com that have a type of A. In a group of
  /// resource record sets that have the same name and type, the value of
  /// <code>SetIdentifier</code> must be unique for each resource record set.
  ///
  /// For information about routing policies, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html">Choosing
  /// a Routing Policy</a> in the <i>Amazon Route 53 Developer Guide</i>.
  final String? setIdentifier;

  /// The resource record cache time to live (TTL), in seconds. Note the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// If you're creating or updating an alias resource record set, omit
  /// <code>TTL</code>. Amazon Route 53 uses the value of <code>TTL</code> for the
  /// alias target.
  /// </li>
  /// <li>
  /// If you're associating this resource record set with a health check (if
  /// you're adding a <code>HealthCheckId</code> element), we recommend that you
  /// specify a <code>TTL</code> of 60 seconds or less so clients respond quickly
  /// to changes in health status.
  /// </li>
  /// <li>
  /// All of the resource record sets in a group of weighted resource record sets
  /// must have the same value for <code>TTL</code>.
  /// </li>
  /// <li>
  /// If a group of weighted resource record sets includes one or more weighted
  /// alias resource record sets for which the alias target is an ELB load
  /// balancer, we recommend that you specify a <code>TTL</code> of 60 seconds for
  /// all of the non-alias weighted resource record sets that have the same name
  /// and type. Values other than 60 seconds (the TTL for load balancers) will
  /// change the effect of the values that you specify for <code>Weight</code>.
  /// </li>
  /// </ul>
  final int? ttl;

  /// When you create a traffic policy instance, Amazon Route 53 automatically
  /// creates a resource record set. <code>TrafficPolicyInstanceId</code> is the
  /// ID of the traffic policy instance that Route 53 created this resource record
  /// set for.
  /// <important>
  /// To delete the resource record set that is associated with a traffic policy
  /// instance, use <code>DeleteTrafficPolicyInstance</code>. Route 53 will delete
  /// the resource record set automatically. If you delete the resource record set
  /// by using <code>ChangeResourceRecordSets</code>, Route 53 doesn't
  /// automatically delete the traffic policy instance, and you'll continue to be
  /// charged for it even though it's no longer in use.
  /// </important>
  final String? trafficPolicyInstanceId;

  /// <i>Weighted resource record sets only:</i> Among resource record sets that
  /// have the same combination of DNS name and type, a value that determines the
  /// proportion of DNS queries that Amazon Route 53 responds to using the current
  /// resource record set. Route 53 calculates the sum of the weights for the
  /// resource record sets that have the same combination of DNS name and type.
  /// Route 53 then responds to queries based on the ratio of a resource's weight
  /// to the total. Note the following:
  ///
  /// <ul>
  /// <li>
  /// You must specify a value for the <code>Weight</code> element for every
  /// weighted resource record set.
  /// </li>
  /// <li>
  /// You can only specify one <code>ResourceRecord</code> per weighted resource
  /// record set.
  /// </li>
  /// <li>
  /// You can't create latency, failover, or geolocation resource record sets that
  /// have the same values for the <code>Name</code> and <code>Type</code>
  /// elements as weighted resource record sets.
  /// </li>
  /// <li>
  /// You can create a maximum of 100 weighted resource record sets that have the
  /// same values for the <code>Name</code> and <code>Type</code> elements.
  /// </li>
  /// <li>
  /// For weighted (but not weighted alias) resource record sets, if you set
  /// <code>Weight</code> to <code>0</code> for a resource record set, Route 53
  /// never responds to queries with the applicable value for that resource record
  /// set. However, if you set <code>Weight</code> to <code>0</code> for all
  /// resource record sets that have the same combination of DNS name and type,
  /// traffic is routed to all resources with equal probability.
  ///
  /// The effect of setting <code>Weight</code> to <code>0</code> is different
  /// when you associate health checks with weighted resource record sets. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-configuring-options.html">Options
  /// for Configuring Route 53 Active-Active and Active-Passive Failover</a> in
  /// the <i>Amazon Route 53 Developer Guide</i>.
  /// </li>
  /// </ul>
  final int? weight;

  ResourceRecordSet({
    required this.name,
    required this.type,
    this.aliasTarget,
    this.cidrRoutingConfig,
    this.failover,
    this.geoLocation,
    this.geoProximityLocation,
    this.healthCheckId,
    this.multiValueAnswer,
    this.region,
    this.resourceRecords,
    this.setIdentifier,
    this.ttl,
    this.trafficPolicyInstanceId,
    this.weight,
  });
  factory ResourceRecordSet.fromXml(_s.XmlElement elem) {
    return ResourceRecordSet(
      name: _s.extractXmlStringValue(elem, 'Name')!,
      type: _s.extractXmlStringValue(elem, 'Type')!.toRRType(),
      aliasTarget:
          _s.extractXmlChild(elem, 'AliasTarget')?.let(AliasTarget.fromXml),
      cidrRoutingConfig: _s
          .extractXmlChild(elem, 'CidrRoutingConfig')
          ?.let(CidrRoutingConfig.fromXml),
      failover: _s
          .extractXmlStringValue(elem, 'Failover')
          ?.toResourceRecordSetFailover(),
      geoLocation:
          _s.extractXmlChild(elem, 'GeoLocation')?.let(GeoLocation.fromXml),
      geoProximityLocation: _s
          .extractXmlChild(elem, 'GeoProximityLocation')
          ?.let(GeoProximityLocation.fromXml),
      healthCheckId: _s.extractXmlStringValue(elem, 'HealthCheckId'),
      multiValueAnswer: _s.extractXmlBoolValue(elem, 'MultiValueAnswer'),
      region:
          _s.extractXmlStringValue(elem, 'Region')?.toResourceRecordSetRegion(),
      resourceRecords: _s.extractXmlChild(elem, 'ResourceRecords')?.let(
          (elem) => elem
              .findElements('ResourceRecord')
              .map(ResourceRecord.fromXml)
              .toList()),
      setIdentifier: _s.extractXmlStringValue(elem, 'SetIdentifier'),
      ttl: _s.extractXmlIntValue(elem, 'TTL'),
      trafficPolicyInstanceId:
          _s.extractXmlStringValue(elem, 'TrafficPolicyInstanceId'),
      weight: _s.extractXmlIntValue(elem, 'Weight'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final aliasTarget = this.aliasTarget;
    final cidrRoutingConfig = this.cidrRoutingConfig;
    final failover = this.failover;
    final geoLocation = this.geoLocation;
    final geoProximityLocation = this.geoProximityLocation;
    final healthCheckId = this.healthCheckId;
    final multiValueAnswer = this.multiValueAnswer;
    final region = this.region;
    final resourceRecords = this.resourceRecords;
    final setIdentifier = this.setIdentifier;
    final ttl = this.ttl;
    final trafficPolicyInstanceId = this.trafficPolicyInstanceId;
    final weight = this.weight;
    return {
      'Name': name,
      'Type': type.toValue(),
      if (aliasTarget != null) 'AliasTarget': aliasTarget,
      if (cidrRoutingConfig != null) 'CidrRoutingConfig': cidrRoutingConfig,
      if (failover != null) 'Failover': failover.toValue(),
      if (geoLocation != null) 'GeoLocation': geoLocation,
      if (geoProximityLocation != null)
        'GeoProximityLocation': geoProximityLocation,
      if (healthCheckId != null) 'HealthCheckId': healthCheckId,
      if (multiValueAnswer != null) 'MultiValueAnswer': multiValueAnswer,
      if (region != null) 'Region': region.toValue(),
      if (resourceRecords != null) 'ResourceRecords': resourceRecords,
      if (setIdentifier != null) 'SetIdentifier': setIdentifier,
      if (ttl != null) 'TTL': ttl,
      if (trafficPolicyInstanceId != null)
        'TrafficPolicyInstanceId': trafficPolicyInstanceId,
      if (weight != null) 'Weight': weight,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final name = this.name;
    final type = this.type;
    final aliasTarget = this.aliasTarget;
    final cidrRoutingConfig = this.cidrRoutingConfig;
    final failover = this.failover;
    final geoLocation = this.geoLocation;
    final geoProximityLocation = this.geoProximityLocation;
    final healthCheckId = this.healthCheckId;
    final multiValueAnswer = this.multiValueAnswer;
    final region = this.region;
    final resourceRecords = this.resourceRecords;
    final setIdentifier = this.setIdentifier;
    final ttl = this.ttl;
    final trafficPolicyInstanceId = this.trafficPolicyInstanceId;
    final weight = this.weight;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Name', name),
      _s.encodeXmlStringValue('Type', type.toValue()),
      if (setIdentifier != null)
        _s.encodeXmlStringValue('SetIdentifier', setIdentifier),
      if (weight != null) _s.encodeXmlIntValue('Weight', weight),
      if (region != null) _s.encodeXmlStringValue('Region', region.toValue()),
      if (geoLocation != null) geoLocation.toXml('GeoLocation'),
      if (failover != null)
        _s.encodeXmlStringValue('Failover', failover.toValue()),
      if (multiValueAnswer != null)
        _s.encodeXmlBoolValue('MultiValueAnswer', multiValueAnswer),
      if (ttl != null) _s.encodeXmlIntValue('TTL', ttl),
      if (resourceRecords != null)
        _s.XmlElement(_s.XmlName('ResourceRecords'), [],
            resourceRecords.map((e) => e.toXml('ResourceRecord'))),
      if (aliasTarget != null) aliasTarget.toXml('AliasTarget'),
      if (healthCheckId != null)
        _s.encodeXmlStringValue('HealthCheckId', healthCheckId),
      if (trafficPolicyInstanceId != null)
        _s.encodeXmlStringValue(
            'TrafficPolicyInstanceId', trafficPolicyInstanceId),
      if (cidrRoutingConfig != null)
        cidrRoutingConfig.toXml('CidrRoutingConfig'),
      if (geoProximityLocation != null)
        geoProximityLocation.toXml('GeoProximityLocation'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum ResourceRecordSetFailover {
  primary,
  secondary,
}

extension ResourceRecordSetFailoverValueExtension on ResourceRecordSetFailover {
  String toValue() {
    switch (this) {
      case ResourceRecordSetFailover.primary:
        return 'PRIMARY';
      case ResourceRecordSetFailover.secondary:
        return 'SECONDARY';
    }
  }
}

extension ResourceRecordSetFailoverFromString on String {
  ResourceRecordSetFailover toResourceRecordSetFailover() {
    switch (this) {
      case 'PRIMARY':
        return ResourceRecordSetFailover.primary;
      case 'SECONDARY':
        return ResourceRecordSetFailover.secondary;
    }
    throw Exception('$this is not known in enum ResourceRecordSetFailover');
  }
}

enum ResourceRecordSetRegion {
  usEast_1,
  usEast_2,
  usWest_1,
  usWest_2,
  caCentral_1,
  euWest_1,
  euWest_2,
  euWest_3,
  euCentral_1,
  euCentral_2,
  apSoutheast_1,
  apSoutheast_2,
  apSoutheast_3,
  apNortheast_1,
  apNortheast_2,
  apNortheast_3,
  euNorth_1,
  saEast_1,
  cnNorth_1,
  cnNorthwest_1,
  apEast_1,
  meSouth_1,
  meCentral_1,
  apSouth_1,
  apSouth_2,
  afSouth_1,
  euSouth_1,
  euSouth_2,
  apSoutheast_4,
  ilCentral_1,
  caWest_1,
}

extension ResourceRecordSetRegionValueExtension on ResourceRecordSetRegion {
  String toValue() {
    switch (this) {
      case ResourceRecordSetRegion.usEast_1:
        return 'us-east-1';
      case ResourceRecordSetRegion.usEast_2:
        return 'us-east-2';
      case ResourceRecordSetRegion.usWest_1:
        return 'us-west-1';
      case ResourceRecordSetRegion.usWest_2:
        return 'us-west-2';
      case ResourceRecordSetRegion.caCentral_1:
        return 'ca-central-1';
      case ResourceRecordSetRegion.euWest_1:
        return 'eu-west-1';
      case ResourceRecordSetRegion.euWest_2:
        return 'eu-west-2';
      case ResourceRecordSetRegion.euWest_3:
        return 'eu-west-3';
      case ResourceRecordSetRegion.euCentral_1:
        return 'eu-central-1';
      case ResourceRecordSetRegion.euCentral_2:
        return 'eu-central-2';
      case ResourceRecordSetRegion.apSoutheast_1:
        return 'ap-southeast-1';
      case ResourceRecordSetRegion.apSoutheast_2:
        return 'ap-southeast-2';
      case ResourceRecordSetRegion.apSoutheast_3:
        return 'ap-southeast-3';
      case ResourceRecordSetRegion.apNortheast_1:
        return 'ap-northeast-1';
      case ResourceRecordSetRegion.apNortheast_2:
        return 'ap-northeast-2';
      case ResourceRecordSetRegion.apNortheast_3:
        return 'ap-northeast-3';
      case ResourceRecordSetRegion.euNorth_1:
        return 'eu-north-1';
      case ResourceRecordSetRegion.saEast_1:
        return 'sa-east-1';
      case ResourceRecordSetRegion.cnNorth_1:
        return 'cn-north-1';
      case ResourceRecordSetRegion.cnNorthwest_1:
        return 'cn-northwest-1';
      case ResourceRecordSetRegion.apEast_1:
        return 'ap-east-1';
      case ResourceRecordSetRegion.meSouth_1:
        return 'me-south-1';
      case ResourceRecordSetRegion.meCentral_1:
        return 'me-central-1';
      case ResourceRecordSetRegion.apSouth_1:
        return 'ap-south-1';
      case ResourceRecordSetRegion.apSouth_2:
        return 'ap-south-2';
      case ResourceRecordSetRegion.afSouth_1:
        return 'af-south-1';
      case ResourceRecordSetRegion.euSouth_1:
        return 'eu-south-1';
      case ResourceRecordSetRegion.euSouth_2:
        return 'eu-south-2';
      case ResourceRecordSetRegion.apSoutheast_4:
        return 'ap-southeast-4';
      case ResourceRecordSetRegion.ilCentral_1:
        return 'il-central-1';
      case ResourceRecordSetRegion.caWest_1:
        return 'ca-west-1';
    }
  }
}

extension ResourceRecordSetRegionFromString on String {
  ResourceRecordSetRegion toResourceRecordSetRegion() {
    switch (this) {
      case 'us-east-1':
        return ResourceRecordSetRegion.usEast_1;
      case 'us-east-2':
        return ResourceRecordSetRegion.usEast_2;
      case 'us-west-1':
        return ResourceRecordSetRegion.usWest_1;
      case 'us-west-2':
        return ResourceRecordSetRegion.usWest_2;
      case 'ca-central-1':
        return ResourceRecordSetRegion.caCentral_1;
      case 'eu-west-1':
        return ResourceRecordSetRegion.euWest_1;
      case 'eu-west-2':
        return ResourceRecordSetRegion.euWest_2;
      case 'eu-west-3':
        return ResourceRecordSetRegion.euWest_3;
      case 'eu-central-1':
        return ResourceRecordSetRegion.euCentral_1;
      case 'eu-central-2':
        return ResourceRecordSetRegion.euCentral_2;
      case 'ap-southeast-1':
        return ResourceRecordSetRegion.apSoutheast_1;
      case 'ap-southeast-2':
        return ResourceRecordSetRegion.apSoutheast_2;
      case 'ap-southeast-3':
        return ResourceRecordSetRegion.apSoutheast_3;
      case 'ap-northeast-1':
        return ResourceRecordSetRegion.apNortheast_1;
      case 'ap-northeast-2':
        return ResourceRecordSetRegion.apNortheast_2;
      case 'ap-northeast-3':
        return ResourceRecordSetRegion.apNortheast_3;
      case 'eu-north-1':
        return ResourceRecordSetRegion.euNorth_1;
      case 'sa-east-1':
        return ResourceRecordSetRegion.saEast_1;
      case 'cn-north-1':
        return ResourceRecordSetRegion.cnNorth_1;
      case 'cn-northwest-1':
        return ResourceRecordSetRegion.cnNorthwest_1;
      case 'ap-east-1':
        return ResourceRecordSetRegion.apEast_1;
      case 'me-south-1':
        return ResourceRecordSetRegion.meSouth_1;
      case 'me-central-1':
        return ResourceRecordSetRegion.meCentral_1;
      case 'ap-south-1':
        return ResourceRecordSetRegion.apSouth_1;
      case 'ap-south-2':
        return ResourceRecordSetRegion.apSouth_2;
      case 'af-south-1':
        return ResourceRecordSetRegion.afSouth_1;
      case 'eu-south-1':
        return ResourceRecordSetRegion.euSouth_1;
      case 'eu-south-2':
        return ResourceRecordSetRegion.euSouth_2;
      case 'ap-southeast-4':
        return ResourceRecordSetRegion.apSoutheast_4;
      case 'il-central-1':
        return ResourceRecordSetRegion.ilCentral_1;
      case 'ca-west-1':
        return ResourceRecordSetRegion.caWest_1;
    }
    throw Exception('$this is not known in enum ResourceRecordSetRegion');
  }
}

/// A complex type containing a resource and its associated tags.
class ResourceTagSet {
  /// The ID for the specified resource.
  final String? resourceId;

  /// The type of the resource.
  ///
  /// <ul>
  /// <li>
  /// The resource type for health checks is <code>healthcheck</code>.
  /// </li>
  /// <li>
  /// The resource type for hosted zones is <code>hostedzone</code>.
  /// </li>
  /// </ul>
  final TagResourceType? resourceType;

  /// The tags associated with the specified resource.
  final List<Tag>? tags;

  ResourceTagSet({
    this.resourceId,
    this.resourceType,
    this.tags,
  });
  factory ResourceTagSet.fromXml(_s.XmlElement elem) {
    return ResourceTagSet(
      resourceId: _s.extractXmlStringValue(elem, 'ResourceId'),
      resourceType:
          _s.extractXmlStringValue(elem, 'ResourceType')?.toTagResourceType(),
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final tags = this.tags;
    return {
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A complex type that contains the type of limit that you specified in the
/// request and the current value for that limit.
class ReusableDelegationSetLimit {
  /// The limit that you requested:
  /// <code>MAX_ZONES_BY_REUSABLE_DELEGATION_SET</code>, the maximum number of
  /// hosted zones that you can associate with the specified reusable delegation
  /// set.
  final ReusableDelegationSetLimitType type;

  /// The current value for the <code>MAX_ZONES_BY_REUSABLE_DELEGATION_SET</code>
  /// limit.
  final int value;

  ReusableDelegationSetLimit({
    required this.type,
    required this.value,
  });
  factory ReusableDelegationSetLimit.fromXml(_s.XmlElement elem) {
    return ReusableDelegationSetLimit(
      type: _s
          .extractXmlStringValue(elem, 'Type')!
          .toReusableDelegationSetLimitType(),
      value: _s.extractXmlIntValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.toValue(),
      'Value': value,
    };
  }
}

enum ReusableDelegationSetLimitType {
  maxZonesByReusableDelegationSet,
}

extension ReusableDelegationSetLimitTypeValueExtension
    on ReusableDelegationSetLimitType {
  String toValue() {
    switch (this) {
      case ReusableDelegationSetLimitType.maxZonesByReusableDelegationSet:
        return 'MAX_ZONES_BY_REUSABLE_DELEGATION_SET';
    }
  }
}

extension ReusableDelegationSetLimitTypeFromString on String {
  ReusableDelegationSetLimitType toReusableDelegationSetLimitType() {
    switch (this) {
      case 'MAX_ZONES_BY_REUSABLE_DELEGATION_SET':
        return ReusableDelegationSetLimitType.maxZonesByReusableDelegationSet;
    }
    throw Exception(
        '$this is not known in enum ReusableDelegationSetLimitType');
  }
}

enum Statistic {
  average,
  sum,
  sampleCount,
  maximum,
  minimum,
}

extension StatisticValueExtension on Statistic {
  String toValue() {
    switch (this) {
      case Statistic.average:
        return 'Average';
      case Statistic.sum:
        return 'Sum';
      case Statistic.sampleCount:
        return 'SampleCount';
      case Statistic.maximum:
        return 'Maximum';
      case Statistic.minimum:
        return 'Minimum';
    }
  }
}

extension StatisticFromString on String {
  Statistic toStatistic() {
    switch (this) {
      case 'Average':
        return Statistic.average;
      case 'Sum':
        return Statistic.sum;
      case 'SampleCount':
        return Statistic.sampleCount;
      case 'Maximum':
        return Statistic.maximum;
      case 'Minimum':
        return Statistic.minimum;
    }
    throw Exception('$this is not known in enum Statistic');
  }
}

/// A complex type that contains the status that one Amazon Route 53 health
/// checker reports and the time of the health check.
class StatusReport {
  /// The date and time that the health checker performed the health check in <a
  /// href="https://en.wikipedia.org/wiki/ISO_8601">ISO 8601 format</a> and
  /// Coordinated Universal Time (UTC). For example, the value
  /// <code>2017-03-27T17:48:16.751Z</code> represents March 27, 2017 at
  /// 17:48:16.751 UTC.
  final DateTime? checkedTime;

  /// A description of the status of the health check endpoint as reported by one
  /// of the Amazon Route 53 health checkers.
  final String? status;

  StatusReport({
    this.checkedTime,
    this.status,
  });
  factory StatusReport.fromXml(_s.XmlElement elem) {
    return StatusReport(
      checkedTime: _s.extractXmlDateTimeValue(elem, 'CheckedTime'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final checkedTime = this.checkedTime;
    final status = this.status;
    return {
      if (checkedTime != null) 'CheckedTime': iso8601ToJson(checkedTime),
      if (status != null) 'Status': status,
    };
  }
}

/// A complex type that contains information about a tag that you want to add or
/// edit for the specified health check or hosted zone.
class Tag {
  /// The value of <code>Key</code> depends on the operation that you want to
  /// perform:
  ///
  /// <ul>
  /// <li>
  /// <b>Add a tag to a health check or hosted zone</b>: <code>Key</code> is the
  /// name that you want to give the new tag.
  /// </li>
  /// <li>
  /// <b>Edit a tag</b>: <code>Key</code> is the name of the tag that you want to
  /// change the <code>Value</code> for.
  /// </li>
  /// <li>
  /// <b> Delete a key</b>: <code>Key</code> is the name of the tag you want to
  /// remove.
  /// </li>
  /// <li>
  /// <b>Give a name to a health check</b>: Edit the default <code>Name</code>
  /// tag. In the Amazon Route 53 console, the list of your health checks includes
  /// a <b>Name</b> column that lets you see the name that you've given to each
  /// health check.
  /// </li>
  /// </ul>
  final String? key;

  /// The value of <code>Value</code> depends on the operation that you want to
  /// perform:
  ///
  /// <ul>
  /// <li>
  /// <b>Add a tag to a health check or hosted zone</b>: <code>Value</code> is the
  /// value that you want to give the new tag.
  /// </li>
  /// <li>
  /// <b>Edit a tag</b>: <code>Value</code> is the new value that you want to
  /// assign the tag.
  /// </li>
  /// </ul>
  final String? value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final key = this.key;
    final value = this.value;
    final $children = <_s.XmlNode>[
      if (key != null) _s.encodeXmlStringValue('Key', key),
      if (value != null) _s.encodeXmlStringValue('Value', value),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum TagResourceType {
  healthcheck,
  hostedzone,
}

extension TagResourceTypeValueExtension on TagResourceType {
  String toValue() {
    switch (this) {
      case TagResourceType.healthcheck:
        return 'healthcheck';
      case TagResourceType.hostedzone:
        return 'hostedzone';
    }
  }
}

extension TagResourceTypeFromString on String {
  TagResourceType toTagResourceType() {
    switch (this) {
      case 'healthcheck':
        return TagResourceType.healthcheck;
      case 'hostedzone':
        return TagResourceType.hostedzone;
    }
    throw Exception('$this is not known in enum TagResourceType');
  }
}

/// A complex type that contains the response to a <code>TestDNSAnswer</code>
/// request.
class TestDNSAnswerResponse {
  /// The Amazon Route 53 name server used to respond to the request.
  final String nameserver;

  /// The protocol that Amazon Route 53 used to respond to the request, either
  /// <code>UDP</code> or <code>TCP</code>.
  final String protocol;

  /// A list that contains values that Amazon Route 53 returned for this resource
  /// record set.
  final List<String> recordData;

  /// The name of the resource record set that you submitted a request for.
  final String recordName;

  /// The type of the resource record set that you submitted a request for.
  final RRType recordType;

  /// A code that indicates whether the request is valid or not. The most common
  /// response code is <code>NOERROR</code>, meaning that the request is valid. If
  /// the response is not valid, Amazon Route 53 returns a response code that
  /// describes the error. For a list of possible response codes, see <a
  /// href="http://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml#dns-parameters-6">DNS
  /// RCODES</a> on the IANA website.
  final String responseCode;

  TestDNSAnswerResponse({
    required this.nameserver,
    required this.protocol,
    required this.recordData,
    required this.recordName,
    required this.recordType,
    required this.responseCode,
  });
  factory TestDNSAnswerResponse.fromXml(_s.XmlElement elem) {
    return TestDNSAnswerResponse(
      nameserver: _s.extractXmlStringValue(elem, 'Nameserver')!,
      protocol: _s.extractXmlStringValue(elem, 'Protocol')!,
      recordData: _s.extractXmlStringListValues(
          _s.extractXmlChild(elem, 'RecordData')!, 'RecordDataEntry'),
      recordName: _s.extractXmlStringValue(elem, 'RecordName')!,
      recordType: _s.extractXmlStringValue(elem, 'RecordType')!.toRRType(),
      responseCode: _s.extractXmlStringValue(elem, 'ResponseCode')!,
    );
  }

  Map<String, dynamic> toJson() {
    final nameserver = this.nameserver;
    final protocol = this.protocol;
    final recordData = this.recordData;
    final recordName = this.recordName;
    final recordType = this.recordType;
    final responseCode = this.responseCode;
    return {
      'Nameserver': nameserver,
      'Protocol': protocol,
      'RecordData': recordData,
      'RecordName': recordName,
      'RecordType': recordType.toValue(),
      'ResponseCode': responseCode,
    };
  }
}

/// A complex type that contains settings for a traffic policy.
class TrafficPolicy {
  /// The definition of a traffic policy in JSON format. You specify the JSON
  /// document to use for a new traffic policy in the
  /// <code>CreateTrafficPolicy</code> request. For more information about the
  /// JSON format, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/api-policies-traffic-policy-document-format.html">Traffic
  /// Policy Document Format</a>.
  final String document;

  /// The ID that Amazon Route 53 assigned to a traffic policy when you created
  /// it.
  final String id;

  /// The name that you specified when you created the traffic policy.
  final String name;

  /// The DNS type of the resource record sets that Amazon Route 53 creates when
  /// you use a traffic policy to create a traffic policy instance.
  final RRType type;

  /// The version number that Amazon Route 53 assigns to a traffic policy. For a
  /// new traffic policy, the value of <code>Version</code> is always 1.
  final int version;

  /// The comment that you specify in the <code>CreateTrafficPolicy</code>
  /// request, if any.
  final String? comment;

  TrafficPolicy({
    required this.document,
    required this.id,
    required this.name,
    required this.type,
    required this.version,
    this.comment,
  });
  factory TrafficPolicy.fromXml(_s.XmlElement elem) {
    return TrafficPolicy(
      document: _s.extractXmlStringValue(elem, 'Document')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      name: _s.extractXmlStringValue(elem, 'Name')!,
      type: _s.extractXmlStringValue(elem, 'Type')!.toRRType(),
      version: _s.extractXmlIntValue(elem, 'Version')!,
      comment: _s.extractXmlStringValue(elem, 'Comment'),
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    final id = this.id;
    final name = this.name;
    final type = this.type;
    final version = this.version;
    final comment = this.comment;
    return {
      'Document': document,
      'Id': id,
      'Name': name,
      'Type': type.toValue(),
      'Version': version,
      if (comment != null) 'Comment': comment,
    };
  }
}

/// A complex type that contains settings for the new traffic policy instance.
class TrafficPolicyInstance {
  /// The ID of the hosted zone that Amazon Route 53 created resource record sets
  /// in.
  final String hostedZoneId;

  /// The ID that Amazon Route 53 assigned to the new traffic policy instance.
  final String id;

  /// If <code>State</code> is <code>Failed</code>, an explanation of the reason
  /// for the failure. If <code>State</code> is another value,
  /// <code>Message</code> is empty.
  final String message;

  /// The DNS name, such as www.example.com, for which Amazon Route 53 responds to
  /// queries by using the resource record sets that are associated with this
  /// traffic policy instance.
  final String name;

  /// The value of <code>State</code> is one of the following values:
  /// <dl> <dt>Applied</dt> <dd>
  /// Amazon Route 53 has finished creating resource record sets, and changes have
  /// propagated to all Route 53 edge locations.
  /// </dd> <dt>Creating</dt> <dd>
  /// Route 53 is creating the resource record sets. Use
  /// <code>GetTrafficPolicyInstance</code> to confirm that the
  /// <code>CreateTrafficPolicyInstance</code> request completed successfully.
  /// </dd> <dt>Failed</dt> <dd>
  /// Route 53 wasn't able to create or update the resource record sets. When the
  /// value of <code>State</code> is <code>Failed</code>, see <code>Message</code>
  /// for an explanation of what caused the request to fail.
  /// </dd> </dl>
  final String state;

  /// The TTL that Amazon Route 53 assigned to all of the resource record sets
  /// that it created in the specified hosted zone.
  final int ttl;

  /// The ID of the traffic policy that Amazon Route 53 used to create resource
  /// record sets in the specified hosted zone.
  final String trafficPolicyId;

  /// The DNS type that Amazon Route 53 assigned to all of the resource record
  /// sets that it created for this traffic policy instance.
  final RRType trafficPolicyType;

  /// The version of the traffic policy that Amazon Route 53 used to create
  /// resource record sets in the specified hosted zone.
  final int trafficPolicyVersion;

  TrafficPolicyInstance({
    required this.hostedZoneId,
    required this.id,
    required this.message,
    required this.name,
    required this.state,
    required this.ttl,
    required this.trafficPolicyId,
    required this.trafficPolicyType,
    required this.trafficPolicyVersion,
  });
  factory TrafficPolicyInstance.fromXml(_s.XmlElement elem) {
    return TrafficPolicyInstance(
      hostedZoneId: _s.extractXmlStringValue(elem, 'HostedZoneId')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      message: _s.extractXmlStringValue(elem, 'Message')!,
      name: _s.extractXmlStringValue(elem, 'Name')!,
      state: _s.extractXmlStringValue(elem, 'State')!,
      ttl: _s.extractXmlIntValue(elem, 'TTL')!,
      trafficPolicyId: _s.extractXmlStringValue(elem, 'TrafficPolicyId')!,
      trafficPolicyType:
          _s.extractXmlStringValue(elem, 'TrafficPolicyType')!.toRRType(),
      trafficPolicyVersion:
          _s.extractXmlIntValue(elem, 'TrafficPolicyVersion')!,
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZoneId = this.hostedZoneId;
    final id = this.id;
    final message = this.message;
    final name = this.name;
    final state = this.state;
    final ttl = this.ttl;
    final trafficPolicyId = this.trafficPolicyId;
    final trafficPolicyType = this.trafficPolicyType;
    final trafficPolicyVersion = this.trafficPolicyVersion;
    return {
      'HostedZoneId': hostedZoneId,
      'Id': id,
      'Message': message,
      'Name': name,
      'State': state,
      'TTL': ttl,
      'TrafficPolicyId': trafficPolicyId,
      'TrafficPolicyType': trafficPolicyType.toValue(),
      'TrafficPolicyVersion': trafficPolicyVersion,
    };
  }
}

/// A complex type that contains information about the latest version of one
/// traffic policy that is associated with the current Amazon Web Services
/// account.
class TrafficPolicySummary {
  /// The ID that Amazon Route 53 assigned to the traffic policy when you created
  /// it.
  final String id;

  /// The version number of the latest version of the traffic policy.
  final int latestVersion;

  /// The name that you specified for the traffic policy when you created it.
  final String name;

  /// The number of traffic policies that are associated with the current Amazon
  /// Web Services account.
  final int trafficPolicyCount;

  /// The DNS type of the resource record sets that Amazon Route 53 creates when
  /// you use a traffic policy to create a traffic policy instance.
  final RRType type;

  TrafficPolicySummary({
    required this.id,
    required this.latestVersion,
    required this.name,
    required this.trafficPolicyCount,
    required this.type,
  });
  factory TrafficPolicySummary.fromXml(_s.XmlElement elem) {
    return TrafficPolicySummary(
      id: _s.extractXmlStringValue(elem, 'Id')!,
      latestVersion: _s.extractXmlIntValue(elem, 'LatestVersion')!,
      name: _s.extractXmlStringValue(elem, 'Name')!,
      trafficPolicyCount: _s.extractXmlIntValue(elem, 'TrafficPolicyCount')!,
      type: _s.extractXmlStringValue(elem, 'Type')!.toRRType(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final latestVersion = this.latestVersion;
    final name = this.name;
    final trafficPolicyCount = this.trafficPolicyCount;
    final type = this.type;
    return {
      'Id': id,
      'LatestVersion': latestVersion,
      'Name': name,
      'TrafficPolicyCount': trafficPolicyCount,
      'Type': type.toValue(),
    };
  }
}

/// A complex type that contains information about a request to update a health
/// check.
class UpdateHealthCheckRequest {
  /// The ID for the health check for which you want detailed information. When
  /// you created the health check, <code>CreateHealthCheck</code> returned the ID
  /// in the response, in the <code>HealthCheckId</code> element.
  final String healthCheckId;

  /// A complex type that identifies the CloudWatch alarm that you want Amazon
  /// Route 53 health checkers to use to determine whether the specified health
  /// check is healthy.
  final AlarmIdentifier? alarmIdentifier;

  /// A complex type that contains one <code>ChildHealthCheck</code> element for
  /// each health check that you want to associate with a <code>CALCULATED</code>
  /// health check.
  final List<String>? childHealthChecks;

  /// Stops Route 53 from performing health checks. When you disable a health
  /// check, here's what happens:
  ///
  /// <ul>
  /// <li>
  /// <b>Health checks that check the health of endpoints:</b> Route 53 stops
  /// submitting requests to your application, server, or other resource.
  /// </li>
  /// <li>
  /// <b>Calculated health checks:</b> Route 53 stops aggregating the status of
  /// the referenced health checks.
  /// </li>
  /// <li>
  /// <b>Health checks that monitor CloudWatch alarms:</b> Route 53 stops
  /// monitoring the corresponding CloudWatch metrics.
  /// </li>
  /// </ul>
  /// After you disable a health check, Route 53 considers the status of the
  /// health check to always be healthy. If you configured DNS failover, Route 53
  /// continues to route traffic to the corresponding resources. If you want to
  /// stop routing traffic to a resource, change the value of <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-Inverted">Inverted</a>.
  ///
  /// Charges for a health check still apply when the health check is disabled.
  /// For more information, see <a
  /// href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.
  final bool? disabled;

  /// Specify whether you want Amazon Route 53 to send the value of
  /// <code>FullyQualifiedDomainName</code> to the endpoint in the
  /// <code>client_hello</code> message during <code>TLS</code> negotiation. This
  /// allows the endpoint to respond to <code>HTTPS</code> health check requests
  /// with the applicable SSL/TLS certificate.
  ///
  /// Some endpoints require that HTTPS requests include the host name in the
  /// <code>client_hello</code> message. If you don't enable SNI, the status of
  /// the health check will be SSL alert <code>handshake_failure</code>. A health
  /// check can also have that status for other reasons. If SNI is enabled and
  /// you're still getting the error, check the SSL/TLS configuration on your
  /// endpoint and confirm that your certificate is valid.
  ///
  /// The SSL/TLS certificate on your endpoint includes a domain name in the
  /// <code>Common Name</code> field and possibly several more in the
  /// <code>Subject Alternative Names</code> field. One of the domain names in the
  /// certificate should match the value that you specify for
  /// <code>FullyQualifiedDomainName</code>. If the endpoint responds to the
  /// <code>client_hello</code> message with a certificate that does not include
  /// the domain name that you specified in <code>FullyQualifiedDomainName</code>,
  /// a health checker will retry the handshake. In the second attempt, the health
  /// checker will omit <code>FullyQualifiedDomainName</code> from the
  /// <code>client_hello</code> message.
  final bool? enableSNI;

  /// The number of consecutive health checks that an endpoint must pass or fail
  /// for Amazon Route 53 to change the current status of the endpoint from
  /// unhealthy to healthy or vice versa. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html">How
  /// Amazon Route 53 Determines Whether an Endpoint Is Healthy</a> in the
  /// <i>Amazon Route 53 Developer Guide</i>.
  ///
  /// If you don't specify a value for <code>FailureThreshold</code>, the default
  /// value is three health checks.
  final int? failureThreshold;

  /// Amazon Route 53 behavior depends on whether you specify a value for
  /// <code>IPAddress</code>.
  /// <note>
  /// If a health check already has a value for <code>IPAddress</code>, you can
  /// change the value. However, you can't update an existing health check to add
  /// or remove the value of <code>IPAddress</code>.
  /// </note>
  /// <b>If you specify a value for</b> <code>IPAddress</code>:
  ///
  /// Route 53 sends health check requests to the specified IPv4 or IPv6 address
  /// and passes the value of <code>FullyQualifiedDomainName</code> in the
  /// <code>Host</code> header for all health checks except TCP health checks.
  /// This is typically the fully qualified DNS name of the endpoint on which you
  /// want Route 53 to perform health checks.
  ///
  /// When Route 53 checks the health of an endpoint, here is how it constructs
  /// the <code>Host</code> header:
  ///
  /// <ul>
  /// <li>
  /// If you specify a value of <code>80</code> for <code>Port</code> and
  /// <code>HTTP</code> or <code>HTTP_STR_MATCH</code> for <code>Type</code>,
  /// Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the
  /// endpoint in the <code>Host</code> header.
  /// </li>
  /// <li>
  /// If you specify a value of <code>443</code> for <code>Port</code> and
  /// <code>HTTPS</code> or <code>HTTPS_STR_MATCH</code> for <code>Type</code>,
  /// Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the
  /// endpoint in the <code>Host</code> header.
  /// </li>
  /// <li>
  /// If you specify another value for <code>Port</code> and any value except
  /// <code>TCP</code> for <code>Type</code>, Route 53 passes <i>
  /// <code>FullyQualifiedDomainName</code>:<code>Port</code> </i> to the endpoint
  /// in the <code>Host</code> header.
  /// </li>
  /// </ul>
  /// If you don't specify a value for <code>FullyQualifiedDomainName</code>,
  /// Route 53 substitutes the value of <code>IPAddress</code> in the
  /// <code>Host</code> header in each of the above cases.
  ///
  /// <b>If you don't specify a value for</b> <code>IPAddress</code>:
  ///
  /// If you don't specify a value for <code>IPAddress</code>, Route 53 sends a
  /// DNS request to the domain that you specify in
  /// <code>FullyQualifiedDomainName</code> at the interval you specify in
  /// <code>RequestInterval</code>. Using an IPv4 address that is returned by DNS,
  /// Route 53 then checks the health of the endpoint.
  ///
  /// If you don't specify a value for <code>IPAddress</code>, you can’t update
  /// the health check to remove the <code>FullyQualifiedDomainName</code>; if you
  /// don’t specify a value for <code>IPAddress</code> on creation, a
  /// <code>FullyQualifiedDomainName</code> is required.
  /// <note>
  /// If you don't specify a value for <code>IPAddress</code>, Route 53 uses only
  /// IPv4 to send health checks to the endpoint. If there's no resource record
  /// set with a type of A for the name that you specify for
  /// <code>FullyQualifiedDomainName</code>, the health check fails with a "DNS
  /// resolution failed" error.
  /// </note>
  /// If you want to check the health of weighted, latency, or failover resource
  /// record sets and you choose to specify the endpoint only by
  /// <code>FullyQualifiedDomainName</code>, we recommend that you create a
  /// separate health check for each endpoint. For example, create a health check
  /// for each HTTP server that is serving content for www.example.com. For the
  /// value of <code>FullyQualifiedDomainName</code>, specify the domain name of
  /// the server (such as <code>us-east-2-www.example.com</code>), not the name of
  /// the resource record sets (www.example.com).
  /// <important>
  /// In this configuration, if the value of <code>FullyQualifiedDomainName</code>
  /// matches the name of the resource record sets and you then associate the
  /// health check with those resource record sets, health check results will be
  /// unpredictable.
  /// </important>
  /// In addition, if the value of <code>Type</code> is <code>HTTP</code>,
  /// <code>HTTPS</code>, <code>HTTP_STR_MATCH</code>, or
  /// <code>HTTPS_STR_MATCH</code>, Route 53 passes the value of
  /// <code>FullyQualifiedDomainName</code> in the <code>Host</code> header, as it
  /// does when you specify a value for <code>IPAddress</code>. If the value of
  /// <code>Type</code> is <code>TCP</code>, Route 53 doesn't pass a
  /// <code>Host</code> header.
  final String? fullyQualifiedDomainName;

  /// A sequential counter that Amazon Route 53 sets to <code>1</code> when you
  /// create a health check and increments by 1 each time you update settings for
  /// the health check.
  ///
  /// We recommend that you use <code>GetHealthCheck</code> or
  /// <code>ListHealthChecks</code> to get the current value of
  /// <code>HealthCheckVersion</code> for the health check that you want to
  /// update, and that you include that value in your
  /// <code>UpdateHealthCheck</code> request. This prevents Route 53 from
  /// overwriting an intervening update:
  ///
  /// <ul>
  /// <li>
  /// If the value in the <code>UpdateHealthCheck</code> request matches the value
  /// of <code>HealthCheckVersion</code> in the health check, Route 53 updates the
  /// health check with the new settings.
  /// </li>
  /// <li>
  /// If the value of <code>HealthCheckVersion</code> in the health check is
  /// greater, the health check was changed after you got the version number.
  /// Route 53 does not update the health check, and it returns a
  /// <code>HealthCheckVersionMismatch</code> error.
  /// </li>
  /// </ul>
  final int? healthCheckVersion;

  /// The number of child health checks that are associated with a
  /// <code>CALCULATED</code> health that Amazon Route 53 must consider healthy
  /// for the <code>CALCULATED</code> health check to be considered healthy. To
  /// specify the child health checks that you want to associate with a
  /// <code>CALCULATED</code> health check, use the <code>ChildHealthChecks</code>
  /// and <code>ChildHealthCheck</code> elements.
  ///
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// If you specify a number greater than the number of child health checks,
  /// Route 53 always considers this health check to be unhealthy.
  /// </li>
  /// <li>
  /// If you specify <code>0</code>, Route 53 always considers this health check
  /// to be healthy.
  /// </li>
  /// </ul>
  final int? healthThreshold;

  /// The IPv4 or IPv6 IP address for the endpoint that you want Amazon Route 53
  /// to perform health checks on. If you don't specify a value for
  /// <code>IPAddress</code>, Route 53 sends a DNS request to resolve the domain
  /// name that you specify in <code>FullyQualifiedDomainName</code> at the
  /// interval that you specify in <code>RequestInterval</code>. Using an IP
  /// address that is returned by DNS, Route 53 then checks the health of the
  /// endpoint.
  ///
  /// Use one of the following formats for the value of <code>IPAddress</code>:
  ///
  /// <ul>
  /// <li>
  /// <b>IPv4 address</b>: four values between 0 and 255, separated by periods
  /// (.), for example, <code>192.0.2.44</code>.
  /// </li>
  /// <li>
  /// <b>IPv6 address</b>: eight groups of four hexadecimal values, separated by
  /// colons (:), for example,
  /// <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>. You can also shorten
  /// IPv6 addresses as described in RFC 5952, for example,
  /// <code>2001:db8:85a3::abcd:1:2345</code>.
  /// </li>
  /// </ul>
  /// If the endpoint is an EC2 instance, we recommend that you create an Elastic
  /// IP address, associate it with your EC2 instance, and specify the Elastic IP
  /// address for <code>IPAddress</code>. This ensures that the IP address of your
  /// instance never changes. For more information, see the applicable
  /// documentation:
  ///
  /// <ul>
  /// <li>
  /// Linux: <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic
  /// IP Addresses (EIP)</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i>
  /// </li>
  /// <li>
  /// Windows: <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/elastic-ip-addresses-eip.html">Elastic
  /// IP Addresses (EIP)</a> in the <i>Amazon EC2 User Guide for Windows
  /// Instances</i>
  /// </li>
  /// </ul> <note>
  /// If a health check already has a value for <code>IPAddress</code>, you can
  /// change the value. However, you can't update an existing health check to add
  /// or remove the value of <code>IPAddress</code>.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-FullyQualifiedDomainName">FullyQualifiedDomainName</a>.
  ///
  /// Constraints: Route 53 can't check the health of endpoints for which the IP
  /// address is in local, private, non-routable, or multicast ranges. For more
  /// information about IP addresses for which you can't create health checks, see
  /// the following documents:
  ///
  /// <ul>
  /// <li>
  /// <a href="https://tools.ietf.org/html/rfc5735">RFC 5735, Special Use IPv4
  /// Addresses</a>
  /// </li>
  /// <li>
  /// <a href="https://tools.ietf.org/html/rfc6598">RFC 6598, IANA-Reserved IPv4
  /// Prefix for Shared Address Space</a>
  /// </li>
  /// <li>
  /// <a href="https://tools.ietf.org/html/rfc5156">RFC 5156, Special-Use IPv6
  /// Addresses</a>
  /// </li>
  /// </ul>
  final String? iPAddress;

  /// When CloudWatch has insufficient data about the metric to determine the
  /// alarm state, the status that you want Amazon Route 53 to assign to the
  /// health check:
  ///
  /// <ul>
  /// <li>
  /// <code>Healthy</code>: Route 53 considers the health check to be healthy.
  /// </li>
  /// <li>
  /// <code>Unhealthy</code>: Route 53 considers the health check to be unhealthy.
  /// </li>
  /// <li>
  /// <code>LastKnownStatus</code>: By default, Route 53 uses the status of the
  /// health check from the last time CloudWatch had sufficient data to determine
  /// the alarm state. For new health checks that have no last known status, the
  /// status for the health check is healthy.
  /// </li>
  /// </ul>
  final InsufficientDataHealthStatus? insufficientDataHealthStatus;

  /// Specify whether you want Amazon Route 53 to invert the status of a health
  /// check, for example, to consider a health check unhealthy when it otherwise
  /// would be considered healthy.
  final bool? inverted;

  /// The port on the endpoint that you want Amazon Route 53 to perform health
  /// checks on.
  /// <note>
  /// Don't specify a value for <code>Port</code> when you specify a value for
  /// <code>Type</code> of <code>CLOUDWATCH_METRIC</code> or
  /// <code>CALCULATED</code>.
  /// </note>
  final int? port;

  /// A complex type that contains one <code>Region</code> element for each region
  /// that you want Amazon Route 53 health checkers to check the specified
  /// endpoint from.
  final List<HealthCheckRegion>? regions;

  /// A complex type that contains one <code>ResettableElementName</code> element
  /// for each element that you want to reset to the default value. Valid values
  /// for <code>ResettableElementName</code> include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ChildHealthChecks</code>: Amazon Route 53 resets <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-ChildHealthChecks">ChildHealthChecks</a>
  /// to null.
  /// </li>
  /// <li>
  /// <code>FullyQualifiedDomainName</code>: Route 53 resets <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-FullyQualifiedDomainName">FullyQualifiedDomainName</a>.
  /// to null.
  /// </li>
  /// <li>
  /// <code>Regions</code>: Route 53 resets the <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-Regions">Regions</a>
  /// list to the default set of regions.
  /// </li>
  /// <li>
  /// <code>ResourcePath</code>: Route 53 resets <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-ResourcePath">ResourcePath</a>
  /// to null.
  /// </li>
  /// </ul>
  final List<ResettableElementName>? resetElements;

  /// The path that you want Amazon Route 53 to request when performing health
  /// checks. The path can be any value for which your endpoint will return an
  /// HTTP status code of 2xx or 3xx when the endpoint is healthy, for example the
  /// file /docs/route53-health-check.html. You can also include query string
  /// parameters, for example, <code>/welcome.html?language=jp&amp;login=y</code>.
  ///
  /// Specify this value only if you want to change it.
  final String? resourcePath;

  /// If the value of <code>Type</code> is <code>HTTP_STR_MATCH</code> or
  /// <code>HTTPS_STR_MATCH</code>, the string that you want Amazon Route 53 to
  /// search for in the response body from the specified resource. If the string
  /// appears in the response body, Route 53 considers the resource healthy. (You
  /// can't change the value of <code>Type</code> when you update a health check.)
  final String? searchString;

  UpdateHealthCheckRequest({
    required this.healthCheckId,
    this.alarmIdentifier,
    this.childHealthChecks,
    this.disabled,
    this.enableSNI,
    this.failureThreshold,
    this.fullyQualifiedDomainName,
    this.healthCheckVersion,
    this.healthThreshold,
    this.iPAddress,
    this.insufficientDataHealthStatus,
    this.inverted,
    this.port,
    this.regions,
    this.resetElements,
    this.resourcePath,
    this.searchString,
  });

  Map<String, dynamic> toJson() {
    final healthCheckId = this.healthCheckId;
    final alarmIdentifier = this.alarmIdentifier;
    final childHealthChecks = this.childHealthChecks;
    final disabled = this.disabled;
    final enableSNI = this.enableSNI;
    final failureThreshold = this.failureThreshold;
    final fullyQualifiedDomainName = this.fullyQualifiedDomainName;
    final healthCheckVersion = this.healthCheckVersion;
    final healthThreshold = this.healthThreshold;
    final iPAddress = this.iPAddress;
    final insufficientDataHealthStatus = this.insufficientDataHealthStatus;
    final inverted = this.inverted;
    final port = this.port;
    final regions = this.regions;
    final resetElements = this.resetElements;
    final resourcePath = this.resourcePath;
    final searchString = this.searchString;
    return {
      if (alarmIdentifier != null) 'AlarmIdentifier': alarmIdentifier,
      if (childHealthChecks != null) 'ChildHealthChecks': childHealthChecks,
      if (disabled != null) 'Disabled': disabled,
      if (enableSNI != null) 'EnableSNI': enableSNI,
      if (failureThreshold != null) 'FailureThreshold': failureThreshold,
      if (fullyQualifiedDomainName != null)
        'FullyQualifiedDomainName': fullyQualifiedDomainName,
      if (healthCheckVersion != null) 'HealthCheckVersion': healthCheckVersion,
      if (healthThreshold != null) 'HealthThreshold': healthThreshold,
      if (iPAddress != null) 'IPAddress': iPAddress,
      if (insufficientDataHealthStatus != null)
        'InsufficientDataHealthStatus': insufficientDataHealthStatus.toValue(),
      if (inverted != null) 'Inverted': inverted,
      if (port != null) 'Port': port,
      if (regions != null) 'Regions': regions.map((e) => e.toValue()).toList(),
      if (resetElements != null)
        'ResetElements': resetElements.map((e) => e.toValue()).toList(),
      if (resourcePath != null) 'ResourcePath': resourcePath,
      if (searchString != null) 'SearchString': searchString,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final healthCheckId = this.healthCheckId;
    final alarmIdentifier = this.alarmIdentifier;
    final childHealthChecks = this.childHealthChecks;
    final disabled = this.disabled;
    final enableSNI = this.enableSNI;
    final failureThreshold = this.failureThreshold;
    final fullyQualifiedDomainName = this.fullyQualifiedDomainName;
    final healthCheckVersion = this.healthCheckVersion;
    final healthThreshold = this.healthThreshold;
    final iPAddress = this.iPAddress;
    final insufficientDataHealthStatus = this.insufficientDataHealthStatus;
    final inverted = this.inverted;
    final port = this.port;
    final regions = this.regions;
    final resetElements = this.resetElements;
    final resourcePath = this.resourcePath;
    final searchString = this.searchString;
    final $children = <_s.XmlNode>[
      if (healthCheckVersion != null)
        _s.encodeXmlIntValue('HealthCheckVersion', healthCheckVersion),
      if (iPAddress != null) _s.encodeXmlStringValue('IPAddress', iPAddress),
      if (port != null) _s.encodeXmlIntValue('Port', port),
      if (resourcePath != null)
        _s.encodeXmlStringValue('ResourcePath', resourcePath),
      if (fullyQualifiedDomainName != null)
        _s.encodeXmlStringValue(
            'FullyQualifiedDomainName', fullyQualifiedDomainName),
      if (searchString != null)
        _s.encodeXmlStringValue('SearchString', searchString),
      if (failureThreshold != null)
        _s.encodeXmlIntValue('FailureThreshold', failureThreshold),
      if (inverted != null) _s.encodeXmlBoolValue('Inverted', inverted),
      if (disabled != null) _s.encodeXmlBoolValue('Disabled', disabled),
      if (healthThreshold != null)
        _s.encodeXmlIntValue('HealthThreshold', healthThreshold),
      if (childHealthChecks != null)
        _s.XmlElement(
            _s.XmlName('ChildHealthChecks'),
            [],
            childHealthChecks
                .map((e) => _s.encodeXmlStringValue('ChildHealthCheck', e))),
      if (enableSNI != null) _s.encodeXmlBoolValue('EnableSNI', enableSNI),
      if (regions != null)
        _s.XmlElement(_s.XmlName('Regions'), [],
            regions.map((e) => _s.encodeXmlStringValue('Region', e.toValue()))),
      if (alarmIdentifier != null) alarmIdentifier.toXml('AlarmIdentifier'),
      if (insufficientDataHealthStatus != null)
        _s.encodeXmlStringValue('InsufficientDataHealthStatus',
            insufficientDataHealthStatus.toValue()),
      if (resetElements != null)
        _s.XmlElement(
            _s.XmlName('ResetElements'),
            [],
            resetElements.map((e) =>
                _s.encodeXmlStringValue('ResettableElementName', e.toValue()))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the response to the
/// <code>UpdateHealthCheck</code> request.
class UpdateHealthCheckResponse {
  /// A complex type that contains the response to an
  /// <code>UpdateHealthCheck</code> request.
  final HealthCheck healthCheck;

  UpdateHealthCheckResponse({
    required this.healthCheck,
  });
  factory UpdateHealthCheckResponse.fromXml(_s.XmlElement elem) {
    return UpdateHealthCheckResponse(
      healthCheck:
          HealthCheck.fromXml(_s.extractXmlChild(elem, 'HealthCheck')!),
    );
  }

  Map<String, dynamic> toJson() {
    final healthCheck = this.healthCheck;
    return {
      'HealthCheck': healthCheck,
    };
  }
}

/// A request to update the comment for a hosted zone.
class UpdateHostedZoneCommentRequest {
  /// The ID for the hosted zone that you want to update the comment for.
  final String id;

  /// The new comment for the hosted zone. If you don't specify a value for
  /// <code>Comment</code>, Amazon Route 53 deletes the existing value of the
  /// <code>Comment</code> element, if any.
  final String? comment;

  UpdateHostedZoneCommentRequest({
    required this.id,
    this.comment,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final comment = this.comment;
    return {
      if (comment != null) 'Comment': comment,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final id = this.id;
    final comment = this.comment;
    final $children = <_s.XmlNode>[
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the response to the
/// <code>UpdateHostedZoneComment</code> request.
class UpdateHostedZoneCommentResponse {
  /// A complex type that contains the response to the
  /// <code>UpdateHostedZoneComment</code> request.
  final HostedZone hostedZone;

  UpdateHostedZoneCommentResponse({
    required this.hostedZone,
  });
  factory UpdateHostedZoneCommentResponse.fromXml(_s.XmlElement elem) {
    return UpdateHostedZoneCommentResponse(
      hostedZone: HostedZone.fromXml(_s.extractXmlChild(elem, 'HostedZone')!),
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZone = this.hostedZone;
    return {
      'HostedZone': hostedZone,
    };
  }
}

/// A complex type that contains information about the traffic policy that you
/// want to update the comment for.
class UpdateTrafficPolicyCommentRequest {
  /// The new comment for the specified traffic policy and version.
  final String comment;

  /// The value of <code>Id</code> for the traffic policy that you want to update
  /// the comment for.
  final String id;

  /// The value of <code>Version</code> for the traffic policy that you want to
  /// update the comment for.
  final int version;

  UpdateTrafficPolicyCommentRequest({
    required this.comment,
    required this.id,
    required this.version,
  });

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final id = this.id;
    final version = this.version;
    return {
      'Comment': comment,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final comment = this.comment;
    final id = this.id;
    final version = this.version;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Comment', comment),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the response information for the traffic
/// policy.
class UpdateTrafficPolicyCommentResponse {
  /// A complex type that contains settings for the specified traffic policy.
  final TrafficPolicy trafficPolicy;

  UpdateTrafficPolicyCommentResponse({
    required this.trafficPolicy,
  });
  factory UpdateTrafficPolicyCommentResponse.fromXml(_s.XmlElement elem) {
    return UpdateTrafficPolicyCommentResponse(
      trafficPolicy:
          TrafficPolicy.fromXml(_s.extractXmlChild(elem, 'TrafficPolicy')!),
    );
  }

  Map<String, dynamic> toJson() {
    final trafficPolicy = this.trafficPolicy;
    return {
      'TrafficPolicy': trafficPolicy,
    };
  }
}

/// A complex type that contains information about the resource record sets that
/// you want to update based on a specified traffic policy instance.
class UpdateTrafficPolicyInstanceRequest {
  /// The ID of the traffic policy instance that you want to update.
  final String id;

  /// The TTL that you want Amazon Route 53 to assign to all of the updated
  /// resource record sets.
  final int ttl;

  /// The ID of the traffic policy that you want Amazon Route 53 to use to update
  /// resource record sets for the specified traffic policy instance.
  final String trafficPolicyId;

  /// The version of the traffic policy that you want Amazon Route 53 to use to
  /// update resource record sets for the specified traffic policy instance.
  final int trafficPolicyVersion;

  UpdateTrafficPolicyInstanceRequest({
    required this.id,
    required this.ttl,
    required this.trafficPolicyId,
    required this.trafficPolicyVersion,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final ttl = this.ttl;
    final trafficPolicyId = this.trafficPolicyId;
    final trafficPolicyVersion = this.trafficPolicyVersion;
    return {
      'TTL': ttl,
      'TrafficPolicyId': trafficPolicyId,
      'TrafficPolicyVersion': trafficPolicyVersion,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final id = this.id;
    final ttl = this.ttl;
    final trafficPolicyId = this.trafficPolicyId;
    final trafficPolicyVersion = this.trafficPolicyVersion;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('TTL', ttl),
      _s.encodeXmlStringValue('TrafficPolicyId', trafficPolicyId),
      _s.encodeXmlIntValue('TrafficPolicyVersion', trafficPolicyVersion),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains information about the resource record sets that
/// Amazon Route 53 created based on a specified traffic policy.
class UpdateTrafficPolicyInstanceResponse {
  /// A complex type that contains settings for the updated traffic policy
  /// instance.
  final TrafficPolicyInstance trafficPolicyInstance;

  UpdateTrafficPolicyInstanceResponse({
    required this.trafficPolicyInstance,
  });
  factory UpdateTrafficPolicyInstanceResponse.fromXml(_s.XmlElement elem) {
    return UpdateTrafficPolicyInstanceResponse(
      trafficPolicyInstance: TrafficPolicyInstance.fromXml(
          _s.extractXmlChild(elem, 'TrafficPolicyInstance')!),
    );
  }

  Map<String, dynamic> toJson() {
    final trafficPolicyInstance = this.trafficPolicyInstance;
    return {
      'TrafficPolicyInstance': trafficPolicyInstance,
    };
  }
}

/// (Private hosted zones only) A complex type that contains information about
/// an Amazon VPC.
///
/// If you associate a private hosted zone with an Amazon VPC when you make a <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateHostedZone.html">CreateHostedZone</a>
/// request, the following parameters are also required.
class VPC {
  final String? vPCId;

  /// (Private hosted zones only) The region that an Amazon VPC was created in.
  final VPCRegion? vPCRegion;

  VPC({
    this.vPCId,
    this.vPCRegion,
  });
  factory VPC.fromXml(_s.XmlElement elem) {
    return VPC(
      vPCId: _s.extractXmlStringValue(elem, 'VPCId'),
      vPCRegion: _s.extractXmlStringValue(elem, 'VPCRegion')?.toVPCRegion(),
    );
  }

  Map<String, dynamic> toJson() {
    final vPCId = this.vPCId;
    final vPCRegion = this.vPCRegion;
    return {
      if (vPCId != null) 'VPCId': vPCId,
      if (vPCRegion != null) 'VPCRegion': vPCRegion.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final vPCId = this.vPCId;
    final vPCRegion = this.vPCRegion;
    final $children = <_s.XmlNode>[
      if (vPCRegion != null)
        _s.encodeXmlStringValue('VPCRegion', vPCRegion.toValue()),
      if (vPCId != null) _s.encodeXmlStringValue('VPCId', vPCId),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum VPCRegion {
  usEast_1,
  usEast_2,
  usWest_1,
  usWest_2,
  euWest_1,
  euWest_2,
  euWest_3,
  euCentral_1,
  euCentral_2,
  apEast_1,
  meSouth_1,
  usGovWest_1,
  usGovEast_1,
  usIsoEast_1,
  usIsoWest_1,
  usIsobEast_1,
  meCentral_1,
  apSoutheast_1,
  apSoutheast_2,
  apSoutheast_3,
  apSouth_1,
  apSouth_2,
  apNortheast_1,
  apNortheast_2,
  apNortheast_3,
  euNorth_1,
  saEast_1,
  caCentral_1,
  cnNorth_1,
  afSouth_1,
  euSouth_1,
  euSouth_2,
  apSoutheast_4,
  ilCentral_1,
  caWest_1,
}

extension VPCRegionValueExtension on VPCRegion {
  String toValue() {
    switch (this) {
      case VPCRegion.usEast_1:
        return 'us-east-1';
      case VPCRegion.usEast_2:
        return 'us-east-2';
      case VPCRegion.usWest_1:
        return 'us-west-1';
      case VPCRegion.usWest_2:
        return 'us-west-2';
      case VPCRegion.euWest_1:
        return 'eu-west-1';
      case VPCRegion.euWest_2:
        return 'eu-west-2';
      case VPCRegion.euWest_3:
        return 'eu-west-3';
      case VPCRegion.euCentral_1:
        return 'eu-central-1';
      case VPCRegion.euCentral_2:
        return 'eu-central-2';
      case VPCRegion.apEast_1:
        return 'ap-east-1';
      case VPCRegion.meSouth_1:
        return 'me-south-1';
      case VPCRegion.usGovWest_1:
        return 'us-gov-west-1';
      case VPCRegion.usGovEast_1:
        return 'us-gov-east-1';
      case VPCRegion.usIsoEast_1:
        return 'us-iso-east-1';
      case VPCRegion.usIsoWest_1:
        return 'us-iso-west-1';
      case VPCRegion.usIsobEast_1:
        return 'us-isob-east-1';
      case VPCRegion.meCentral_1:
        return 'me-central-1';
      case VPCRegion.apSoutheast_1:
        return 'ap-southeast-1';
      case VPCRegion.apSoutheast_2:
        return 'ap-southeast-2';
      case VPCRegion.apSoutheast_3:
        return 'ap-southeast-3';
      case VPCRegion.apSouth_1:
        return 'ap-south-1';
      case VPCRegion.apSouth_2:
        return 'ap-south-2';
      case VPCRegion.apNortheast_1:
        return 'ap-northeast-1';
      case VPCRegion.apNortheast_2:
        return 'ap-northeast-2';
      case VPCRegion.apNortheast_3:
        return 'ap-northeast-3';
      case VPCRegion.euNorth_1:
        return 'eu-north-1';
      case VPCRegion.saEast_1:
        return 'sa-east-1';
      case VPCRegion.caCentral_1:
        return 'ca-central-1';
      case VPCRegion.cnNorth_1:
        return 'cn-north-1';
      case VPCRegion.afSouth_1:
        return 'af-south-1';
      case VPCRegion.euSouth_1:
        return 'eu-south-1';
      case VPCRegion.euSouth_2:
        return 'eu-south-2';
      case VPCRegion.apSoutheast_4:
        return 'ap-southeast-4';
      case VPCRegion.ilCentral_1:
        return 'il-central-1';
      case VPCRegion.caWest_1:
        return 'ca-west-1';
    }
  }
}

extension VPCRegionFromString on String {
  VPCRegion toVPCRegion() {
    switch (this) {
      case 'us-east-1':
        return VPCRegion.usEast_1;
      case 'us-east-2':
        return VPCRegion.usEast_2;
      case 'us-west-1':
        return VPCRegion.usWest_1;
      case 'us-west-2':
        return VPCRegion.usWest_2;
      case 'eu-west-1':
        return VPCRegion.euWest_1;
      case 'eu-west-2':
        return VPCRegion.euWest_2;
      case 'eu-west-3':
        return VPCRegion.euWest_3;
      case 'eu-central-1':
        return VPCRegion.euCentral_1;
      case 'eu-central-2':
        return VPCRegion.euCentral_2;
      case 'ap-east-1':
        return VPCRegion.apEast_1;
      case 'me-south-1':
        return VPCRegion.meSouth_1;
      case 'us-gov-west-1':
        return VPCRegion.usGovWest_1;
      case 'us-gov-east-1':
        return VPCRegion.usGovEast_1;
      case 'us-iso-east-1':
        return VPCRegion.usIsoEast_1;
      case 'us-iso-west-1':
        return VPCRegion.usIsoWest_1;
      case 'us-isob-east-1':
        return VPCRegion.usIsobEast_1;
      case 'me-central-1':
        return VPCRegion.meCentral_1;
      case 'ap-southeast-1':
        return VPCRegion.apSoutheast_1;
      case 'ap-southeast-2':
        return VPCRegion.apSoutheast_2;
      case 'ap-southeast-3':
        return VPCRegion.apSoutheast_3;
      case 'ap-south-1':
        return VPCRegion.apSouth_1;
      case 'ap-south-2':
        return VPCRegion.apSouth_2;
      case 'ap-northeast-1':
        return VPCRegion.apNortheast_1;
      case 'ap-northeast-2':
        return VPCRegion.apNortheast_2;
      case 'ap-northeast-3':
        return VPCRegion.apNortheast_3;
      case 'eu-north-1':
        return VPCRegion.euNorth_1;
      case 'sa-east-1':
        return VPCRegion.saEast_1;
      case 'ca-central-1':
        return VPCRegion.caCentral_1;
      case 'cn-north-1':
        return VPCRegion.cnNorth_1;
      case 'af-south-1':
        return VPCRegion.afSouth_1;
      case 'eu-south-1':
        return VPCRegion.euSouth_1;
      case 'eu-south-2':
        return VPCRegion.euSouth_2;
      case 'ap-southeast-4':
        return VPCRegion.apSoutheast_4;
      case 'il-central-1':
        return VPCRegion.ilCentral_1;
      case 'ca-west-1':
        return VPCRegion.caWest_1;
    }
    throw Exception('$this is not known in enum VPCRegion');
  }
}

class CidrBlockInUseException extends _s.GenericAwsException {
  CidrBlockInUseException({String? type, String? message})
      : super(type: type, code: 'CidrBlockInUseException', message: message);
}

class CidrCollectionAlreadyExistsException extends _s.GenericAwsException {
  CidrCollectionAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'CidrCollectionAlreadyExistsException',
            message: message);
}

class CidrCollectionInUseException extends _s.GenericAwsException {
  CidrCollectionInUseException({String? type, String? message})
      : super(
            type: type, code: 'CidrCollectionInUseException', message: message);
}

class CidrCollectionVersionMismatchException extends _s.GenericAwsException {
  CidrCollectionVersionMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'CidrCollectionVersionMismatchException',
            message: message);
}

class ConcurrentModification extends _s.GenericAwsException {
  ConcurrentModification({String? type, String? message})
      : super(type: type, code: 'ConcurrentModification', message: message);
}

class ConflictingDomainExists extends _s.GenericAwsException {
  ConflictingDomainExists({String? type, String? message})
      : super(type: type, code: 'ConflictingDomainExists', message: message);
}

class ConflictingTypes extends _s.GenericAwsException {
  ConflictingTypes({String? type, String? message})
      : super(type: type, code: 'ConflictingTypes', message: message);
}

class DNSSECNotFound extends _s.GenericAwsException {
  DNSSECNotFound({String? type, String? message})
      : super(type: type, code: 'DNSSECNotFound', message: message);
}

class DelegationSetAlreadyCreated extends _s.GenericAwsException {
  DelegationSetAlreadyCreated({String? type, String? message})
      : super(
            type: type, code: 'DelegationSetAlreadyCreated', message: message);
}

class DelegationSetAlreadyReusable extends _s.GenericAwsException {
  DelegationSetAlreadyReusable({String? type, String? message})
      : super(
            type: type, code: 'DelegationSetAlreadyReusable', message: message);
}

class DelegationSetInUse extends _s.GenericAwsException {
  DelegationSetInUse({String? type, String? message})
      : super(type: type, code: 'DelegationSetInUse', message: message);
}

class DelegationSetNotAvailable extends _s.GenericAwsException {
  DelegationSetNotAvailable({String? type, String? message})
      : super(type: type, code: 'DelegationSetNotAvailable', message: message);
}

class DelegationSetNotReusable extends _s.GenericAwsException {
  DelegationSetNotReusable({String? type, String? message})
      : super(type: type, code: 'DelegationSetNotReusable', message: message);
}

class HealthCheckAlreadyExists extends _s.GenericAwsException {
  HealthCheckAlreadyExists({String? type, String? message})
      : super(type: type, code: 'HealthCheckAlreadyExists', message: message);
}

class HealthCheckInUse extends _s.GenericAwsException {
  HealthCheckInUse({String? type, String? message})
      : super(type: type, code: 'HealthCheckInUse', message: message);
}

class HealthCheckVersionMismatch extends _s.GenericAwsException {
  HealthCheckVersionMismatch({String? type, String? message})
      : super(type: type, code: 'HealthCheckVersionMismatch', message: message);
}

class HostedZoneAlreadyExists extends _s.GenericAwsException {
  HostedZoneAlreadyExists({String? type, String? message})
      : super(type: type, code: 'HostedZoneAlreadyExists', message: message);
}

class HostedZoneNotEmpty extends _s.GenericAwsException {
  HostedZoneNotEmpty({String? type, String? message})
      : super(type: type, code: 'HostedZoneNotEmpty', message: message);
}

class HostedZoneNotFound extends _s.GenericAwsException {
  HostedZoneNotFound({String? type, String? message})
      : super(type: type, code: 'HostedZoneNotFound', message: message);
}

class HostedZoneNotPrivate extends _s.GenericAwsException {
  HostedZoneNotPrivate({String? type, String? message})
      : super(type: type, code: 'HostedZoneNotPrivate', message: message);
}

class HostedZonePartiallyDelegated extends _s.GenericAwsException {
  HostedZonePartiallyDelegated({String? type, String? message})
      : super(
            type: type, code: 'HostedZonePartiallyDelegated', message: message);
}

class IncompatibleVersion extends _s.GenericAwsException {
  IncompatibleVersion({String? type, String? message})
      : super(type: type, code: 'IncompatibleVersion', message: message);
}

class InsufficientCloudWatchLogsResourcePolicy extends _s.GenericAwsException {
  InsufficientCloudWatchLogsResourcePolicy({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientCloudWatchLogsResourcePolicy',
            message: message);
}

class InvalidArgument extends _s.GenericAwsException {
  InvalidArgument({String? type, String? message})
      : super(type: type, code: 'InvalidArgument', message: message);
}

class InvalidChangeBatch extends _s.GenericAwsException {
  InvalidChangeBatch({String? type, String? message})
      : super(type: type, code: 'InvalidChangeBatch', message: message);
}

class InvalidDomainName extends _s.GenericAwsException {
  InvalidDomainName({String? type, String? message})
      : super(type: type, code: 'InvalidDomainName', message: message);
}

class InvalidInput extends _s.GenericAwsException {
  InvalidInput({String? type, String? message})
      : super(type: type, code: 'InvalidInput', message: message);
}

class InvalidKMSArn extends _s.GenericAwsException {
  InvalidKMSArn({String? type, String? message})
      : super(type: type, code: 'InvalidKMSArn', message: message);
}

class InvalidKeySigningKeyName extends _s.GenericAwsException {
  InvalidKeySigningKeyName({String? type, String? message})
      : super(type: type, code: 'InvalidKeySigningKeyName', message: message);
}

class InvalidKeySigningKeyStatus extends _s.GenericAwsException {
  InvalidKeySigningKeyStatus({String? type, String? message})
      : super(type: type, code: 'InvalidKeySigningKeyStatus', message: message);
}

class InvalidPaginationToken extends _s.GenericAwsException {
  InvalidPaginationToken({String? type, String? message})
      : super(type: type, code: 'InvalidPaginationToken', message: message);
}

class InvalidSigningStatus extends _s.GenericAwsException {
  InvalidSigningStatus({String? type, String? message})
      : super(type: type, code: 'InvalidSigningStatus', message: message);
}

class InvalidTrafficPolicyDocument extends _s.GenericAwsException {
  InvalidTrafficPolicyDocument({String? type, String? message})
      : super(
            type: type, code: 'InvalidTrafficPolicyDocument', message: message);
}

class InvalidVPCId extends _s.GenericAwsException {
  InvalidVPCId({String? type, String? message})
      : super(type: type, code: 'InvalidVPCId', message: message);
}

class KeySigningKeyAlreadyExists extends _s.GenericAwsException {
  KeySigningKeyAlreadyExists({String? type, String? message})
      : super(type: type, code: 'KeySigningKeyAlreadyExists', message: message);
}

class KeySigningKeyInParentDSRecord extends _s.GenericAwsException {
  KeySigningKeyInParentDSRecord({String? type, String? message})
      : super(
            type: type,
            code: 'KeySigningKeyInParentDSRecord',
            message: message);
}

class KeySigningKeyInUse extends _s.GenericAwsException {
  KeySigningKeyInUse({String? type, String? message})
      : super(type: type, code: 'KeySigningKeyInUse', message: message);
}

class KeySigningKeyWithActiveStatusNotFound extends _s.GenericAwsException {
  KeySigningKeyWithActiveStatusNotFound({String? type, String? message})
      : super(
            type: type,
            code: 'KeySigningKeyWithActiveStatusNotFound',
            message: message);
}

class LastVPCAssociation extends _s.GenericAwsException {
  LastVPCAssociation({String? type, String? message})
      : super(type: type, code: 'LastVPCAssociation', message: message);
}

class LimitsExceeded extends _s.GenericAwsException {
  LimitsExceeded({String? type, String? message})
      : super(type: type, code: 'LimitsExceeded', message: message);
}

class NoSuchChange extends _s.GenericAwsException {
  NoSuchChange({String? type, String? message})
      : super(type: type, code: 'NoSuchChange', message: message);
}

class NoSuchCidrCollectionException extends _s.GenericAwsException {
  NoSuchCidrCollectionException({String? type, String? message})
      : super(
            type: type,
            code: 'NoSuchCidrCollectionException',
            message: message);
}

class NoSuchCidrLocationException extends _s.GenericAwsException {
  NoSuchCidrLocationException({String? type, String? message})
      : super(
            type: type, code: 'NoSuchCidrLocationException', message: message);
}

class NoSuchCloudWatchLogsLogGroup extends _s.GenericAwsException {
  NoSuchCloudWatchLogsLogGroup({String? type, String? message})
      : super(
            type: type, code: 'NoSuchCloudWatchLogsLogGroup', message: message);
}

class NoSuchDelegationSet extends _s.GenericAwsException {
  NoSuchDelegationSet({String? type, String? message})
      : super(type: type, code: 'NoSuchDelegationSet', message: message);
}

class NoSuchGeoLocation extends _s.GenericAwsException {
  NoSuchGeoLocation({String? type, String? message})
      : super(type: type, code: 'NoSuchGeoLocation', message: message);
}

class NoSuchHealthCheck extends _s.GenericAwsException {
  NoSuchHealthCheck({String? type, String? message})
      : super(type: type, code: 'NoSuchHealthCheck', message: message);
}

class NoSuchHostedZone extends _s.GenericAwsException {
  NoSuchHostedZone({String? type, String? message})
      : super(type: type, code: 'NoSuchHostedZone', message: message);
}

class NoSuchKeySigningKey extends _s.GenericAwsException {
  NoSuchKeySigningKey({String? type, String? message})
      : super(type: type, code: 'NoSuchKeySigningKey', message: message);
}

class NoSuchQueryLoggingConfig extends _s.GenericAwsException {
  NoSuchQueryLoggingConfig({String? type, String? message})
      : super(type: type, code: 'NoSuchQueryLoggingConfig', message: message);
}

class NoSuchTrafficPolicy extends _s.GenericAwsException {
  NoSuchTrafficPolicy({String? type, String? message})
      : super(type: type, code: 'NoSuchTrafficPolicy', message: message);
}

class NoSuchTrafficPolicyInstance extends _s.GenericAwsException {
  NoSuchTrafficPolicyInstance({String? type, String? message})
      : super(
            type: type, code: 'NoSuchTrafficPolicyInstance', message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String? type, String? message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

class PriorRequestNotComplete extends _s.GenericAwsException {
  PriorRequestNotComplete({String? type, String? message})
      : super(type: type, code: 'PriorRequestNotComplete', message: message);
}

class PublicZoneVPCAssociation extends _s.GenericAwsException {
  PublicZoneVPCAssociation({String? type, String? message})
      : super(type: type, code: 'PublicZoneVPCAssociation', message: message);
}

class QueryLoggingConfigAlreadyExists extends _s.GenericAwsException {
  QueryLoggingConfigAlreadyExists({String? type, String? message})
      : super(
            type: type,
            code: 'QueryLoggingConfigAlreadyExists',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyHealthChecks extends _s.GenericAwsException {
  TooManyHealthChecks({String? type, String? message})
      : super(type: type, code: 'TooManyHealthChecks', message: message);
}

class TooManyHostedZones extends _s.GenericAwsException {
  TooManyHostedZones({String? type, String? message})
      : super(type: type, code: 'TooManyHostedZones', message: message);
}

class TooManyKeySigningKeys extends _s.GenericAwsException {
  TooManyKeySigningKeys({String? type, String? message})
      : super(type: type, code: 'TooManyKeySigningKeys', message: message);
}

class TooManyTrafficPolicies extends _s.GenericAwsException {
  TooManyTrafficPolicies({String? type, String? message})
      : super(type: type, code: 'TooManyTrafficPolicies', message: message);
}

class TooManyTrafficPolicyInstances extends _s.GenericAwsException {
  TooManyTrafficPolicyInstances({String? type, String? message})
      : super(
            type: type,
            code: 'TooManyTrafficPolicyInstances',
            message: message);
}

class TooManyTrafficPolicyVersionsForCurrentPolicy
    extends _s.GenericAwsException {
  TooManyTrafficPolicyVersionsForCurrentPolicy({String? type, String? message})
      : super(
            type: type,
            code: 'TooManyTrafficPolicyVersionsForCurrentPolicy',
            message: message);
}

class TooManyVPCAssociationAuthorizations extends _s.GenericAwsException {
  TooManyVPCAssociationAuthorizations({String? type, String? message})
      : super(
            type: type,
            code: 'TooManyVPCAssociationAuthorizations',
            message: message);
}

class TrafficPolicyAlreadyExists extends _s.GenericAwsException {
  TrafficPolicyAlreadyExists({String? type, String? message})
      : super(type: type, code: 'TrafficPolicyAlreadyExists', message: message);
}

class TrafficPolicyInUse extends _s.GenericAwsException {
  TrafficPolicyInUse({String? type, String? message})
      : super(type: type, code: 'TrafficPolicyInUse', message: message);
}

class TrafficPolicyInstanceAlreadyExists extends _s.GenericAwsException {
  TrafficPolicyInstanceAlreadyExists({String? type, String? message})
      : super(
            type: type,
            code: 'TrafficPolicyInstanceAlreadyExists',
            message: message);
}

class VPCAssociationAuthorizationNotFound extends _s.GenericAwsException {
  VPCAssociationAuthorizationNotFound({String? type, String? message})
      : super(
            type: type,
            code: 'VPCAssociationAuthorizationNotFound',
            message: message);
}

class VPCAssociationNotFound extends _s.GenericAwsException {
  VPCAssociationNotFound({String? type, String? message})
      : super(type: type, code: 'VPCAssociationNotFound', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CidrBlockInUseException': (type, message) =>
      CidrBlockInUseException(type: type, message: message),
  'CidrCollectionAlreadyExistsException': (type, message) =>
      CidrCollectionAlreadyExistsException(type: type, message: message),
  'CidrCollectionInUseException': (type, message) =>
      CidrCollectionInUseException(type: type, message: message),
  'CidrCollectionVersionMismatchException': (type, message) =>
      CidrCollectionVersionMismatchException(type: type, message: message),
  'ConcurrentModification': (type, message) =>
      ConcurrentModification(type: type, message: message),
  'ConflictingDomainExists': (type, message) =>
      ConflictingDomainExists(type: type, message: message),
  'ConflictingTypes': (type, message) =>
      ConflictingTypes(type: type, message: message),
  'DNSSECNotFound': (type, message) =>
      DNSSECNotFound(type: type, message: message),
  'DelegationSetAlreadyCreated': (type, message) =>
      DelegationSetAlreadyCreated(type: type, message: message),
  'DelegationSetAlreadyReusable': (type, message) =>
      DelegationSetAlreadyReusable(type: type, message: message),
  'DelegationSetInUse': (type, message) =>
      DelegationSetInUse(type: type, message: message),
  'DelegationSetNotAvailable': (type, message) =>
      DelegationSetNotAvailable(type: type, message: message),
  'DelegationSetNotReusable': (type, message) =>
      DelegationSetNotReusable(type: type, message: message),
  'HealthCheckAlreadyExists': (type, message) =>
      HealthCheckAlreadyExists(type: type, message: message),
  'HealthCheckInUse': (type, message) =>
      HealthCheckInUse(type: type, message: message),
  'HealthCheckVersionMismatch': (type, message) =>
      HealthCheckVersionMismatch(type: type, message: message),
  'HostedZoneAlreadyExists': (type, message) =>
      HostedZoneAlreadyExists(type: type, message: message),
  'HostedZoneNotEmpty': (type, message) =>
      HostedZoneNotEmpty(type: type, message: message),
  'HostedZoneNotFound': (type, message) =>
      HostedZoneNotFound(type: type, message: message),
  'HostedZoneNotPrivate': (type, message) =>
      HostedZoneNotPrivate(type: type, message: message),
  'HostedZonePartiallyDelegated': (type, message) =>
      HostedZonePartiallyDelegated(type: type, message: message),
  'IncompatibleVersion': (type, message) =>
      IncompatibleVersion(type: type, message: message),
  'InsufficientCloudWatchLogsResourcePolicy': (type, message) =>
      InsufficientCloudWatchLogsResourcePolicy(type: type, message: message),
  'InvalidArgument': (type, message) =>
      InvalidArgument(type: type, message: message),
  'InvalidChangeBatch': (type, message) =>
      InvalidChangeBatch(type: type, message: message),
  'InvalidDomainName': (type, message) =>
      InvalidDomainName(type: type, message: message),
  'InvalidInput': (type, message) => InvalidInput(type: type, message: message),
  'InvalidKMSArn': (type, message) =>
      InvalidKMSArn(type: type, message: message),
  'InvalidKeySigningKeyName': (type, message) =>
      InvalidKeySigningKeyName(type: type, message: message),
  'InvalidKeySigningKeyStatus': (type, message) =>
      InvalidKeySigningKeyStatus(type: type, message: message),
  'InvalidPaginationToken': (type, message) =>
      InvalidPaginationToken(type: type, message: message),
  'InvalidSigningStatus': (type, message) =>
      InvalidSigningStatus(type: type, message: message),
  'InvalidTrafficPolicyDocument': (type, message) =>
      InvalidTrafficPolicyDocument(type: type, message: message),
  'InvalidVPCId': (type, message) => InvalidVPCId(type: type, message: message),
  'KeySigningKeyAlreadyExists': (type, message) =>
      KeySigningKeyAlreadyExists(type: type, message: message),
  'KeySigningKeyInParentDSRecord': (type, message) =>
      KeySigningKeyInParentDSRecord(type: type, message: message),
  'KeySigningKeyInUse': (type, message) =>
      KeySigningKeyInUse(type: type, message: message),
  'KeySigningKeyWithActiveStatusNotFound': (type, message) =>
      KeySigningKeyWithActiveStatusNotFound(type: type, message: message),
  'LastVPCAssociation': (type, message) =>
      LastVPCAssociation(type: type, message: message),
  'LimitsExceeded': (type, message) =>
      LimitsExceeded(type: type, message: message),
  'NoSuchChange': (type, message) => NoSuchChange(type: type, message: message),
  'NoSuchCidrCollectionException': (type, message) =>
      NoSuchCidrCollectionException(type: type, message: message),
  'NoSuchCidrLocationException': (type, message) =>
      NoSuchCidrLocationException(type: type, message: message),
  'NoSuchCloudWatchLogsLogGroup': (type, message) =>
      NoSuchCloudWatchLogsLogGroup(type: type, message: message),
  'NoSuchDelegationSet': (type, message) =>
      NoSuchDelegationSet(type: type, message: message),
  'NoSuchGeoLocation': (type, message) =>
      NoSuchGeoLocation(type: type, message: message),
  'NoSuchHealthCheck': (type, message) =>
      NoSuchHealthCheck(type: type, message: message),
  'NoSuchHostedZone': (type, message) =>
      NoSuchHostedZone(type: type, message: message),
  'NoSuchKeySigningKey': (type, message) =>
      NoSuchKeySigningKey(type: type, message: message),
  'NoSuchQueryLoggingConfig': (type, message) =>
      NoSuchQueryLoggingConfig(type: type, message: message),
  'NoSuchTrafficPolicy': (type, message) =>
      NoSuchTrafficPolicy(type: type, message: message),
  'NoSuchTrafficPolicyInstance': (type, message) =>
      NoSuchTrafficPolicyInstance(type: type, message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(type: type, message: message),
  'PriorRequestNotComplete': (type, message) =>
      PriorRequestNotComplete(type: type, message: message),
  'PublicZoneVPCAssociation': (type, message) =>
      PublicZoneVPCAssociation(type: type, message: message),
  'QueryLoggingConfigAlreadyExists': (type, message) =>
      QueryLoggingConfigAlreadyExists(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyHealthChecks': (type, message) =>
      TooManyHealthChecks(type: type, message: message),
  'TooManyHostedZones': (type, message) =>
      TooManyHostedZones(type: type, message: message),
  'TooManyKeySigningKeys': (type, message) =>
      TooManyKeySigningKeys(type: type, message: message),
  'TooManyTrafficPolicies': (type, message) =>
      TooManyTrafficPolicies(type: type, message: message),
  'TooManyTrafficPolicyInstances': (type, message) =>
      TooManyTrafficPolicyInstances(type: type, message: message),
  'TooManyTrafficPolicyVersionsForCurrentPolicy': (type, message) =>
      TooManyTrafficPolicyVersionsForCurrentPolicy(
          type: type, message: message),
  'TooManyVPCAssociationAuthorizations': (type, message) =>
      TooManyVPCAssociationAuthorizations(type: type, message: message),
  'TrafficPolicyAlreadyExists': (type, message) =>
      TrafficPolicyAlreadyExists(type: type, message: message),
  'TrafficPolicyInUse': (type, message) =>
      TrafficPolicyInUse(type: type, message: message),
  'TrafficPolicyInstanceAlreadyExists': (type, message) =>
      TrafficPolicyInstanceAlreadyExists(type: type, message: message),
  'VPCAssociationAuthorizationNotFound': (type, message) =>
      VPCAssociationAuthorizationNotFound(type: type, message: message),
  'VPCAssociationNotFound': (type, message) =>
      VPCAssociationNotFound(type: type, message: message),
};
