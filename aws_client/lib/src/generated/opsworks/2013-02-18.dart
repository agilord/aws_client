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

part '2013-02-18.g.dart';

/// Welcome to the <i>AWS OpsWorks Stacks API Reference</i>. This guide provides
/// descriptions, syntax, and usage examples for AWS OpsWorks Stacks actions and
/// data types, including common parameters and error codes.
class OpsWorks {
  final _s.JsonProtocol _protocol;
  OpsWorks({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'opsworks',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Assign a registered instance to a layer.
  ///
  /// <ul>
  /// <li>
  /// You can assign registered on-premises instances to any layer type.
  /// </li>
  /// <li>
  /// You can assign registered Amazon EC2 instances only to custom layers.
  /// </li>
  /// <li>
  /// You cannot use this action with instances that were created with AWS
  /// OpsWorks Stacks.
  /// </li>
  /// </ul>
  /// <b>Required Permissions</b>: To use this action, an AWS Identity and
  /// Access Management (IAM) user must have a Manage permissions level for the
  /// stack or an attached policy that explicitly grants permissions. For more
  /// information on user permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  ///
  /// Parameter [layerIds] :
  /// The layer ID, which must correspond to a custom layer. You cannot assign a
  /// registered instance to a built-in layer.
  Future<void> assignInstance({
    @_s.required String instanceId,
    @_s.required List<String> layerIds,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(layerIds, 'layerIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.AssignInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        'LayerIds': layerIds,
      },
    );
  }

  /// Assigns one of the stack's registered Amazon EBS volumes to a specified
  /// instance. The volume must first be registered with the stack by calling
  /// <a>RegisterVolume</a>. After you register the volume, you must call
  /// <a>UpdateVolume</a> to specify a mount point before calling
  /// <code>AssignVolume</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html">Resource
  /// Management</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [volumeId] :
  /// The volume ID.
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  Future<void> assignVolume({
    @_s.required String volumeId,
    String instanceId,
  }) async {
    ArgumentError.checkNotNull(volumeId, 'volumeId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.AssignVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeId': volumeId,
        if (instanceId != null) 'InstanceId': instanceId,
      },
    );
  }

  /// Associates one of the stack's registered Elastic IP addresses with a
  /// specified instance. The address must first be registered with the stack by
  /// calling <a>RegisterElasticIp</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html">Resource
  /// Management</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [elasticIp] :
  /// The Elastic IP address.
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  Future<void> associateElasticIp({
    @_s.required String elasticIp,
    String instanceId,
  }) async {
    ArgumentError.checkNotNull(elasticIp, 'elasticIp');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.AssociateElasticIp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ElasticIp': elasticIp,
        if (instanceId != null) 'InstanceId': instanceId,
      },
    );
  }

  /// Attaches an Elastic Load Balancing load balancer to a specified layer. AWS
  /// OpsWorks Stacks does not support Application Load Balancer. You can only
  /// use Classic Load Balancer with AWS OpsWorks Stacks. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/layers-elb.html">Elastic
  /// Load Balancing</a>.
  /// <note>
  /// You must create the Elastic Load Balancing instance separately, by using
  /// the Elastic Load Balancing console, API, or CLI. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/Welcome.html">
  /// Elastic Load Balancing Developer Guide</a>.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [elasticLoadBalancerName] :
  /// The Elastic Load Balancing instance's name.
  ///
  /// Parameter [layerId] :
  /// The ID of the layer to which the Elastic Load Balancing instance is to be
  /// attached.
  Future<void> attachElasticLoadBalancer({
    @_s.required String elasticLoadBalancerName,
    @_s.required String layerId,
  }) async {
    ArgumentError.checkNotNull(
        elasticLoadBalancerName, 'elasticLoadBalancerName');
    ArgumentError.checkNotNull(layerId, 'layerId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.AttachElasticLoadBalancer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ElasticLoadBalancerName': elasticLoadBalancerName,
        'LayerId': layerId,
      },
    );
  }

  /// Creates a clone of a specified stack. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-cloning.html">Clone
  /// a Stack</a>. By default, all parameters are set to the values used by the
  /// parent stack.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [serviceRoleArn] :
  /// The stack AWS Identity and Access Management (IAM) role, which allows AWS
  /// OpsWorks Stacks to work with AWS resources on your behalf. You must set
  /// this parameter to the Amazon Resource Name (ARN) for an existing IAM role.
  /// If you create a stack by using the AWS OpsWorks Stacks console, it creates
  /// the role for you. You can obtain an existing stack's IAM ARN
  /// programmatically by calling <a>DescribePermissions</a>. For more
  /// information about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  /// <note>
  /// You must set this parameter to a valid service role ARN or the action will
  /// fail; there is no default value. You can specify the source stack's
  /// service role ARN, if you prefer, but you must do so explicitly.
  /// </note>
  ///
  /// Parameter [sourceStackId] :
  /// The source stack ID.
  ///
  /// Parameter [agentVersion] :
  /// The default AWS OpsWorks Stacks agent version. You have the following
  /// options:
  ///
  /// <ul>
  /// <li>
  /// Auto-update - Set this parameter to <code>LATEST</code>. AWS OpsWorks
  /// Stacks automatically installs new agent versions on the stack's instances
  /// as soon as they are available.
  /// </li>
  /// <li>
  /// Fixed version - Set this parameter to your preferred agent version. To
  /// update the agent version, you must edit the stack configuration and
  /// specify a new version. AWS OpsWorks Stacks then automatically installs
  /// that version on the stack's instances.
  /// </li>
  /// </ul>
  /// The default setting is <code>LATEST</code>. To specify an agent version,
  /// you must use the complete version number, not the abbreviated number shown
  /// on the console. For a list of available agent version numbers, call
  /// <a>DescribeAgentVersions</a>. AgentVersion cannot be set to Chef 12.2.
  /// <note>
  /// You can also specify an agent version when you create or update an
  /// instance, which overrides the stack's default setting.
  /// </note>
  ///
  /// Parameter [attributes] :
  /// A list of stack attributes and values as key/value pairs to be added to
  /// the cloned stack.
  ///
  /// Parameter [chefConfiguration] :
  /// A <code>ChefConfiguration</code> object that specifies whether to enable
  /// Berkshelf and the Berkshelf version on Chef 11.10 stacks. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html">Create
  /// a New Stack</a>.
  ///
  /// Parameter [cloneAppIds] :
  /// A list of source stack app IDs to be included in the cloned stack.
  ///
  /// Parameter [clonePermissions] :
  /// Whether to clone the source stack's permissions.
  ///
  /// Parameter [configurationManager] :
  /// The configuration manager. When you clone a stack we recommend that you
  /// use the configuration manager to specify the Chef version: 12, 11.10, or
  /// 11.4 for Linux stacks, or 12.2 for Windows stacks. The default value for
  /// Linux stacks is currently 12.
  ///
  /// Parameter [customCookbooksSource] :
  /// Contains the information required to retrieve an app or cookbook from a
  /// repository. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html">Adding
  /// Apps</a> or <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html">Cookbooks
  /// and Recipes</a>.
  ///
  /// Parameter [customJson] :
  /// A string that contains user-defined, custom JSON. It is used to override
  /// the corresponding default stack configuration JSON values. The string
  /// should be in the following format:
  ///
  /// <code>"{\"key1\": \"value1\", \"key2\": \"value2\",...}"</code>
  ///
  /// For more information about custom JSON, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html">Use
  /// Custom JSON to Modify the Stack Configuration Attributes</a>
  ///
  /// Parameter [defaultAvailabilityZone] :
  /// The cloned stack's default Availability Zone, which must be in the
  /// specified region. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions
  /// and Endpoints</a>. If you also specify a value for
  /// <code>DefaultSubnetId</code>, the subnet must be in the same zone. For
  /// more information, see the <code>VpcId</code> parameter description.
  ///
  /// Parameter [defaultInstanceProfileArn] :
  /// The Amazon Resource Name (ARN) of an IAM profile that is the default
  /// profile for all of the stack's EC2 instances. For more information about
  /// IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  ///
  /// Parameter [defaultOs] :
  /// The stack's operating system, which must be set to one of the following.
  ///
  /// <ul>
  /// <li>
  /// A supported Linux operating system: An Amazon Linux version, such as
  /// <code>Amazon Linux 2018.03</code>, <code>Amazon Linux 2017.09</code>,
  /// <code>Amazon Linux 2017.03</code>, <code>Amazon Linux 2016.09</code>,
  /// <code>Amazon Linux 2016.03</code>, <code>Amazon Linux 2015.09</code>, or
  /// <code>Amazon Linux 2015.03</code>.
  /// </li>
  /// <li>
  /// A supported Ubuntu operating system, such as <code>Ubuntu 16.04
  /// LTS</code>, <code>Ubuntu 14.04 LTS</code>, or <code>Ubuntu 12.04
  /// LTS</code>.
  /// </li>
  /// <li>
  /// <code>CentOS Linux 7</code>
  /// </li>
  /// <li>
  /// <code>Red Hat Enterprise Linux 7</code>
  /// </li>
  /// <li>
  /// <code>Microsoft Windows Server 2012 R2 Base</code>, <code>Microsoft
  /// Windows Server 2012 R2 with SQL Server Express</code>, <code>Microsoft
  /// Windows Server 2012 R2 with SQL Server Standard</code>, or <code>Microsoft
  /// Windows Server 2012 R2 with SQL Server Web</code>.
  /// </li>
  /// <li>
  /// A custom AMI: <code>Custom</code>. You specify the custom AMI you want to
  /// use when you create instances. For more information about how to use
  /// custom AMIs with OpsWorks, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html">Using
  /// Custom AMIs</a>.
  /// </li>
  /// </ul>
  /// The default option is the parent stack's operating system. For more
  /// information about supported operating systems, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html">AWS
  /// OpsWorks Stacks Operating Systems</a>.
  /// <note>
  /// You can specify a different Linux operating system for the cloned stack,
  /// but you cannot change from Linux to Windows or Windows to Linux.
  /// </note>
  ///
  /// Parameter [defaultRootDeviceType] :
  /// The default root device type. This value is used by default for all
  /// instances in the cloned stack, but you can override it when you create an
  /// instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device">Storage
  /// for the Root Device</a>.
  ///
  /// Parameter [defaultSshKeyName] :
  /// A default Amazon EC2 key pair name. The default value is none. If you
  /// specify a key pair name, AWS OpsWorks installs the public key on the
  /// instance and you can use the private key with an SSH client to log in to
  /// the instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-ssh.html">
  /// Using SSH to Communicate with an Instance</a> and <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/security-ssh-access.html">
  /// Managing SSH Access</a>. You can override this setting by specifying a
  /// different key pair, or no key pair, when you <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-add.html">
  /// create an instance</a>.
  ///
  /// Parameter [defaultSubnetId] :
  /// The stack's default VPC subnet ID. This parameter is required if you
  /// specify a value for the <code>VpcId</code> parameter. All instances are
  /// launched into this subnet unless you specify otherwise when you create the
  /// instance. If you also specify a value for
  /// <code>DefaultAvailabilityZone</code>, the subnet must be in that zone. For
  /// information on default values and when this parameter is required, see the
  /// <code>VpcId</code> parameter description.
  ///
  /// Parameter [hostnameTheme] :
  /// The stack's host name theme, with spaces are replaced by underscores. The
  /// theme is used to generate host names for the stack's instances. By
  /// default, <code>HostnameTheme</code> is set to
  /// <code>Layer_Dependent</code>, which creates host names by appending
  /// integers to the layer's short name. The other themes are:
  ///
  /// <ul>
  /// <li>
  /// <code>Baked_Goods</code>
  /// </li>
  /// <li>
  /// <code>Clouds</code>
  /// </li>
  /// <li>
  /// <code>Europe_Cities</code>
  /// </li>
  /// <li>
  /// <code>Fruits</code>
  /// </li>
  /// <li>
  /// <code>Greek_Deities_and_Titans</code>
  /// </li>
  /// <li>
  /// <code>Legendary_creatures_from_Japan</code>
  /// </li>
  /// <li>
  /// <code>Planets_and_Moons</code>
  /// </li>
  /// <li>
  /// <code>Roman_Deities</code>
  /// </li>
  /// <li>
  /// <code>Scottish_Islands</code>
  /// </li>
  /// <li>
  /// <code>US_Cities</code>
  /// </li>
  /// <li>
  /// <code>Wild_Cats</code>
  /// </li>
  /// </ul>
  /// To obtain a generated host name, call <code>GetHostNameSuggestion</code>,
  /// which returns a host name based on the current theme.
  ///
  /// Parameter [name] :
  /// The cloned stack name.
  ///
  /// Parameter [region] :
  /// The cloned stack AWS region, such as "ap-northeast-2". For more
  /// information about AWS regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions
  /// and Endpoints</a>.
  ///
  /// Parameter [useCustomCookbooks] :
  /// Whether to use custom cookbooks.
  ///
  /// Parameter [useOpsworksSecurityGroups] :
  /// Whether to associate the AWS OpsWorks Stacks built-in security groups with
  /// the stack's layers.
  ///
  /// AWS OpsWorks Stacks provides a standard set of built-in security groups,
  /// one for each layer, which are associated with layers by default. With
  /// <code>UseOpsworksSecurityGroups</code> you can instead provide your own
  /// custom security groups. <code>UseOpsworksSecurityGroups</code> has the
  /// following settings:
  ///
  /// <ul>
  /// <li>
  /// True - AWS OpsWorks Stacks automatically associates the appropriate
  /// built-in security group with each layer (default setting). You can
  /// associate additional security groups with a layer after you create it but
  /// you cannot delete the built-in security group.
  /// </li>
  /// <li>
  /// False - AWS OpsWorks Stacks does not associate built-in security groups
  /// with layers. You must create appropriate Amazon Elastic Compute Cloud
  /// (Amazon EC2) security groups and associate a security group with each
  /// layer that you create. However, you can still manually associate a
  /// built-in security group with a layer on creation; custom security groups
  /// are required only for those layers that need custom settings.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html">Create
  /// a New Stack</a>.
  ///
  /// Parameter [vpcId] :
  /// The ID of the VPC that the cloned stack is to be launched into. It must be
  /// in the specified region. All instances are launched into this VPC, and you
  /// cannot change the ID later.
  ///
  /// <ul>
  /// <li>
  /// If your account supports EC2 Classic, the default value is no VPC.
  /// </li>
  /// <li>
  /// If your account does not support EC2 Classic, the default value is the
  /// default VPC for the specified region.
  /// </li>
  /// </ul>
  /// If the VPC ID corresponds to a default VPC and you have specified either
  /// the <code>DefaultAvailabilityZone</code> or the
  /// <code>DefaultSubnetId</code> parameter only, AWS OpsWorks Stacks infers
  /// the value of the other parameter. If you specify neither parameter, AWS
  /// OpsWorks Stacks sets these parameters to the first valid Availability Zone
  /// for the specified region and the corresponding default VPC subnet ID,
  /// respectively.
  ///
  /// If you specify a nondefault VPC ID, note the following:
  ///
  /// <ul>
  /// <li>
  /// It must belong to a VPC in your account that is in the specified region.
  /// </li>
  /// <li>
  /// You must specify a value for <code>DefaultSubnetId</code>.
  /// </li>
  /// </ul>
  /// For more information about how to use AWS OpsWorks Stacks with a VPC, see
  /// <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-vpc.html">Running
  /// a Stack in a VPC</a>. For more information about default VPC and EC2
  /// Classic, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported
  /// Platforms</a>.
  Future<CloneStackResult> cloneStack({
    @_s.required String serviceRoleArn,
    @_s.required String sourceStackId,
    String agentVersion,
    Map<StackAttributesKeys, String> attributes,
    ChefConfiguration chefConfiguration,
    List<String> cloneAppIds,
    bool clonePermissions,
    StackConfigurationManager configurationManager,
    Source customCookbooksSource,
    String customJson,
    String defaultAvailabilityZone,
    String defaultInstanceProfileArn,
    String defaultOs,
    RootDeviceType defaultRootDeviceType,
    String defaultSshKeyName,
    String defaultSubnetId,
    String hostnameTheme,
    String name,
    String region,
    bool useCustomCookbooks,
    bool useOpsworksSecurityGroups,
    String vpcId,
  }) async {
    ArgumentError.checkNotNull(serviceRoleArn, 'serviceRoleArn');
    ArgumentError.checkNotNull(sourceStackId, 'sourceStackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.CloneStack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceRoleArn': serviceRoleArn,
        'SourceStackId': sourceStackId,
        if (agentVersion != null) 'AgentVersion': agentVersion,
        if (attributes != null)
          'Attributes': attributes.map((k, e) => MapEntry(k.toValue(), e)),
        if (chefConfiguration != null) 'ChefConfiguration': chefConfiguration,
        if (cloneAppIds != null) 'CloneAppIds': cloneAppIds,
        if (clonePermissions != null) 'ClonePermissions': clonePermissions,
        if (configurationManager != null)
          'ConfigurationManager': configurationManager,
        if (customCookbooksSource != null)
          'CustomCookbooksSource': customCookbooksSource,
        if (customJson != null) 'CustomJson': customJson,
        if (defaultAvailabilityZone != null)
          'DefaultAvailabilityZone': defaultAvailabilityZone,
        if (defaultInstanceProfileArn != null)
          'DefaultInstanceProfileArn': defaultInstanceProfileArn,
        if (defaultOs != null) 'DefaultOs': defaultOs,
        if (defaultRootDeviceType != null)
          'DefaultRootDeviceType': defaultRootDeviceType.toValue(),
        if (defaultSshKeyName != null) 'DefaultSshKeyName': defaultSshKeyName,
        if (defaultSubnetId != null) 'DefaultSubnetId': defaultSubnetId,
        if (hostnameTheme != null) 'HostnameTheme': hostnameTheme,
        if (name != null) 'Name': name,
        if (region != null) 'Region': region,
        if (useCustomCookbooks != null)
          'UseCustomCookbooks': useCustomCookbooks,
        if (useOpsworksSecurityGroups != null)
          'UseOpsworksSecurityGroups': useOpsworksSecurityGroups,
        if (vpcId != null) 'VpcId': vpcId,
      },
    );

    return CloneStackResult.fromJson(jsonResponse.body);
  }

  /// Creates an app for a specified stack. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html">Creating
  /// Apps</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The app name.
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  ///
  /// Parameter [type] :
  /// The app type. Each supported type is associated with a particular layer.
  /// For example, PHP applications are associated with a PHP layer. AWS
  /// OpsWorks Stacks deploys an application to those instances that are members
  /// of the corresponding layer. If your app isn't one of the standard types,
  /// or you prefer to implement your own Deploy recipes, specify
  /// <code>other</code>.
  ///
  /// Parameter [appSource] :
  /// A <code>Source</code> object that specifies the app repository.
  ///
  /// Parameter [attributes] :
  /// One or more user-defined key/value pairs to be added to the stack
  /// attributes.
  ///
  /// Parameter [dataSources] :
  /// The app's data source.
  ///
  /// Parameter [description] :
  /// A description of the app.
  ///
  /// Parameter [domains] :
  /// The app virtual host settings, with multiple domains separated by commas.
  /// For example: <code>'www.example.com, example.com'</code>
  ///
  /// Parameter [enableSsl] :
  /// Whether to enable SSL for the app.
  ///
  /// Parameter [environment] :
  /// An array of <code>EnvironmentVariable</code> objects that specify
  /// environment variables to be associated with the app. After you deploy the
  /// app, these variables are defined on the associated app server instance.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html#workingapps-creating-environment">
  /// Environment Variables</a>.
  ///
  /// There is no specific limit on the number of environment variables.
  /// However, the size of the associated data structure - which includes the
  /// variables' names, values, and protected flag values - cannot exceed 20 KB.
  /// This limit should accommodate most if not all use cases. Exceeding it will
  /// cause an exception with the message, "Environment: is too large (maximum
  /// is 20KB)."
  /// <note>
  /// If you have specified one or more environment variables, you cannot modify
  /// the stack's Chef version.
  /// </note>
  ///
  /// Parameter [shortname] :
  /// The app's short name.
  ///
  /// Parameter [sslConfiguration] :
  /// An <code>SslConfiguration</code> object with the SSL configuration.
  Future<CreateAppResult> createApp({
    @_s.required String name,
    @_s.required String stackId,
    @_s.required AppType type,
    Source appSource,
    Map<AppAttributesKeys, String> attributes,
    List<DataSource> dataSources,
    String description,
    List<String> domains,
    bool enableSsl,
    List<EnvironmentVariable> environment,
    String shortname,
    SslConfiguration sslConfiguration,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(stackId, 'stackId');
    ArgumentError.checkNotNull(type, 'type');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.CreateApp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'StackId': stackId,
        'Type': type?.toValue() ?? '',
        if (appSource != null) 'AppSource': appSource,
        if (attributes != null)
          'Attributes': attributes.map((k, e) => MapEntry(k.toValue(), e)),
        if (dataSources != null) 'DataSources': dataSources,
        if (description != null) 'Description': description,
        if (domains != null) 'Domains': domains,
        if (enableSsl != null) 'EnableSsl': enableSsl,
        if (environment != null) 'Environment': environment,
        if (shortname != null) 'Shortname': shortname,
        if (sslConfiguration != null) 'SslConfiguration': sslConfiguration,
      },
    );

    return CreateAppResult.fromJson(jsonResponse.body);
  }

  /// Runs deployment or stack commands. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-deploying.html">Deploying
  /// Apps</a> and <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-commands.html">Run
  /// Stack Commands</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Deploy or Manage permissions level for the stack, or an attached policy
  /// that explicitly grants permissions. For more information on user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [command] :
  /// A <code>DeploymentCommand</code> object that specifies the deployment
  /// command and any associated arguments.
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  ///
  /// Parameter [appId] :
  /// The app ID. This parameter is required for app deployments, but not for
  /// other deployment commands.
  ///
  /// Parameter [comment] :
  /// A user-defined comment.
  ///
  /// Parameter [customJson] :
  /// A string that contains user-defined, custom JSON. You can use this
  /// parameter to override some corresponding default stack configuration JSON
  /// values. The string should be in the following format:
  ///
  /// <code>"{\"key1\": \"value1\", \"key2\": \"value2\",...}"</code>
  ///
  /// For more information about custom JSON, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html">Use
  /// Custom JSON to Modify the Stack Configuration Attributes</a> and <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-json-override.html">Overriding
  /// Attributes With Custom JSON</a>.
  ///
  /// Parameter [instanceIds] :
  /// The instance IDs for the deployment targets.
  ///
  /// Parameter [layerIds] :
  /// The layer IDs for the deployment targets.
  Future<CreateDeploymentResult> createDeployment({
    @_s.required DeploymentCommand command,
    @_s.required String stackId,
    String appId,
    String comment,
    String customJson,
    List<String> instanceIds,
    List<String> layerIds,
  }) async {
    ArgumentError.checkNotNull(command, 'command');
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.CreateDeployment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Command': command,
        'StackId': stackId,
        if (appId != null) 'AppId': appId,
        if (comment != null) 'Comment': comment,
        if (customJson != null) 'CustomJson': customJson,
        if (instanceIds != null) 'InstanceIds': instanceIds,
        if (layerIds != null) 'LayerIds': layerIds,
      },
    );

    return CreateDeploymentResult.fromJson(jsonResponse.body);
  }

  /// Creates an instance in a specified stack. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-add.html">Adding
  /// an Instance to a Layer</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceType] :
  /// The instance type, such as <code>t2.micro</code>. For a list of supported
  /// instance types, open the stack in the console, choose <b>Instances</b>,
  /// and choose <b>+ Instance</b>. The <b>Size</b> list contains the currently
  /// supported types. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance
  /// Families and Types</a>. The parameter values that you use to specify the
  /// various types are in the <b>API Name</b> column of the <b>Available
  /// Instance Types</b> table.
  ///
  /// Parameter [layerIds] :
  /// An array that contains the instance's layer IDs.
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  ///
  /// Parameter [agentVersion] :
  /// The default AWS OpsWorks Stacks agent version. You have the following
  /// options:
  ///
  /// <ul>
  /// <li>
  /// <code>INHERIT</code> - Use the stack's default agent version setting.
  /// </li>
  /// <li>
  /// <i>version_number</i> - Use the specified agent version. This value
  /// overrides the stack's default setting. To update the agent version, edit
  /// the instance configuration and specify a new version. AWS OpsWorks Stacks
  /// then automatically installs that version on the instance.
  /// </li>
  /// </ul>
  /// The default setting is <code>INHERIT</code>. To specify an agent version,
  /// you must use the complete version number, not the abbreviated number shown
  /// on the console. For a list of available agent version numbers, call
  /// <a>DescribeAgentVersions</a>. AgentVersion cannot be set to Chef 12.2.
  ///
  /// Parameter [amiId] :
  /// A custom AMI ID to be used to create the instance. The AMI should be based
  /// on one of the supported operating systems. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html">Using
  /// Custom AMIs</a>.
  /// <note>
  /// If you specify a custom AMI, you must set <code>Os</code> to
  /// <code>Custom</code>.
  /// </note>
  ///
  /// Parameter [architecture] :
  /// The instance architecture. The default option is <code>x86_64</code>.
  /// Instance types do not necessarily support both architectures. For a list
  /// of the architectures that are supported by the different instance types,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance
  /// Families and Types</a>.
  ///
  /// Parameter [autoScalingType] :
  /// For load-based or time-based instances, the type. Windows stacks can use
  /// only time-based instances.
  ///
  /// Parameter [availabilityZone] :
  /// The instance Availability Zone. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions
  /// and Endpoints</a>.
  ///
  /// Parameter [blockDeviceMappings] :
  /// An array of <code>BlockDeviceMapping</code> objects that specify the
  /// instance's block devices. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html">Block
  /// Device Mapping</a>. Note that block device mappings are not supported for
  /// custom AMIs.
  ///
  /// Parameter [ebsOptimized] :
  /// Whether to create an Amazon EBS-optimized instance.
  ///
  /// Parameter [hostname] :
  /// The instance host name.
  ///
  /// Parameter [installUpdatesOnBoot] :
  /// Whether to install operating system and package updates when the instance
  /// boots. The default value is <code>true</code>. To control when updates are
  /// installed, set this value to <code>false</code>. You must then update your
  /// instances manually by using <a>CreateDeployment</a> to run the
  /// <code>update_dependencies</code> stack command or by manually running
  /// <code>yum</code> (Amazon Linux) or <code>apt-get</code> (Ubuntu) on the
  /// instances.
  /// <note>
  /// We strongly recommend using the default value of <code>true</code> to
  /// ensure that your instances have the latest security updates.
  /// </note>
  ///
  /// Parameter [os] :
  /// The instance's operating system, which must be set to one of the
  /// following.
  ///
  /// <ul>
  /// <li>
  /// A supported Linux operating system: An Amazon Linux version, such as
  /// <code>Amazon Linux 2018.03</code>, <code>Amazon Linux 2017.09</code>,
  /// <code>Amazon Linux 2017.03</code>, <code>Amazon Linux 2016.09</code>,
  /// <code>Amazon Linux 2016.03</code>, <code>Amazon Linux 2015.09</code>, or
  /// <code>Amazon Linux 2015.03</code>.
  /// </li>
  /// <li>
  /// A supported Ubuntu operating system, such as <code>Ubuntu 16.04
  /// LTS</code>, <code>Ubuntu 14.04 LTS</code>, or <code>Ubuntu 12.04
  /// LTS</code>.
  /// </li>
  /// <li>
  /// <code>CentOS Linux 7</code>
  /// </li>
  /// <li>
  /// <code>Red Hat Enterprise Linux 7</code>
  /// </li>
  /// <li>
  /// A supported Windows operating system, such as <code>Microsoft Windows
  /// Server 2012 R2 Base</code>, <code>Microsoft Windows Server 2012 R2 with
  /// SQL Server Express</code>, <code>Microsoft Windows Server 2012 R2 with SQL
  /// Server Standard</code>, or <code>Microsoft Windows Server 2012 R2 with SQL
  /// Server Web</code>.
  /// </li>
  /// <li>
  /// A custom AMI: <code>Custom</code>.
  /// </li>
  /// </ul>
  /// For more information about the supported operating systems, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html">AWS
  /// OpsWorks Stacks Operating Systems</a>.
  ///
  /// The default option is the current Amazon Linux version. If you set this
  /// parameter to <code>Custom</code>, you must use the <a>CreateInstance</a>
  /// action's AmiId parameter to specify the custom AMI that you want to use.
  /// Block device mappings are not supported if the value is
  /// <code>Custom</code>. For more information about supported operating
  /// systems, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html">Operating
  /// Systems</a>For more information about how to use custom AMIs with AWS
  /// OpsWorks Stacks, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html">Using
  /// Custom AMIs</a>.
  ///
  /// Parameter [rootDeviceType] :
  /// The instance root device type. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device">Storage
  /// for the Root Device</a>.
  ///
  /// Parameter [sshKeyName] :
  /// The instance's Amazon EC2 key-pair name.
  ///
  /// Parameter [subnetId] :
  /// The ID of the instance's subnet. If the stack is running in a VPC, you can
  /// use this parameter to override the stack's default subnet ID value and
  /// direct AWS OpsWorks Stacks to launch the instance in a different subnet.
  ///
  /// Parameter [tenancy] :
  /// The instance's tenancy option. The default option is no tenancy, or if the
  /// instance is running in a VPC, inherit tenancy settings from the VPC. The
  /// following are valid values for this parameter: <code>dedicated</code>,
  /// <code>default</code>, or <code>host</code>. Because there are costs
  /// associated with changes in tenancy options, we recommend that you research
  /// tenancy options before choosing them for your instances. For more
  /// information about dedicated hosts, see <a
  /// href="http://aws.amazon.com/ec2/dedicated-hosts/">Dedicated Hosts
  /// Overview</a> and <a
  /// href="http://aws.amazon.com/ec2/dedicated-hosts/">Amazon EC2 Dedicated
  /// Hosts</a>. For more information about dedicated instances, see <a
  /// href="https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/dedicated-instance.html">Dedicated
  /// Instances</a> and <a
  /// href="http://aws.amazon.com/ec2/purchasing-options/dedicated-instances/">Amazon
  /// EC2 Dedicated Instances</a>.
  ///
  /// Parameter [virtualizationType] :
  /// The instance's virtualization type, <code>paravirtual</code> or
  /// <code>hvm</code>.
  Future<CreateInstanceResult> createInstance({
    @_s.required String instanceType,
    @_s.required List<String> layerIds,
    @_s.required String stackId,
    String agentVersion,
    String amiId,
    Architecture architecture,
    AutoScalingType autoScalingType,
    String availabilityZone,
    List<BlockDeviceMapping> blockDeviceMappings,
    bool ebsOptimized,
    String hostname,
    bool installUpdatesOnBoot,
    String os,
    RootDeviceType rootDeviceType,
    String sshKeyName,
    String subnetId,
    String tenancy,
    String virtualizationType,
  }) async {
    ArgumentError.checkNotNull(instanceType, 'instanceType');
    ArgumentError.checkNotNull(layerIds, 'layerIds');
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.CreateInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceType': instanceType,
        'LayerIds': layerIds,
        'StackId': stackId,
        if (agentVersion != null) 'AgentVersion': agentVersion,
        if (amiId != null) 'AmiId': amiId,
        if (architecture != null) 'Architecture': architecture.toValue(),
        if (autoScalingType != null)
          'AutoScalingType': autoScalingType.toValue(),
        if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
        if (blockDeviceMappings != null)
          'BlockDeviceMappings': blockDeviceMappings,
        if (ebsOptimized != null) 'EbsOptimized': ebsOptimized,
        if (hostname != null) 'Hostname': hostname,
        if (installUpdatesOnBoot != null)
          'InstallUpdatesOnBoot': installUpdatesOnBoot,
        if (os != null) 'Os': os,
        if (rootDeviceType != null) 'RootDeviceType': rootDeviceType.toValue(),
        if (sshKeyName != null) 'SshKeyName': sshKeyName,
        if (subnetId != null) 'SubnetId': subnetId,
        if (tenancy != null) 'Tenancy': tenancy,
        if (virtualizationType != null)
          'VirtualizationType': virtualizationType,
      },
    );

    return CreateInstanceResult.fromJson(jsonResponse.body);
  }

  /// Creates a layer. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-create.html">How
  /// to Create a Layer</a>.
  /// <note>
  /// You should use <b>CreateLayer</b> for noncustom layer types such as PHP
  /// App Server only if the stack does not have an existing layer of that type.
  /// A stack can have at most one instance of each noncustom layer; if you
  /// attempt to create a second instance, <b>CreateLayer</b> fails. A stack can
  /// have an arbitrary number of custom layers, so you can call
  /// <b>CreateLayer</b> as many times as you like for that layer type.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The layer name, which is used by the console.
  ///
  /// Parameter [shortname] :
  /// For custom layers only, use this parameter to specify the layer's short
  /// name, which is used internally by AWS OpsWorks Stacks and by Chef recipes.
  /// The short name is also used as the name for the directory where your app
  /// files are installed. It can have a maximum of 200 characters, which are
  /// limited to the alphanumeric characters, '-', '_', and '.'.
  ///
  /// The built-in layers' short names are defined by AWS OpsWorks Stacks. For
  /// more information, see the <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/layers.html">Layer
  /// Reference</a>.
  ///
  /// Parameter [stackId] :
  /// The layer stack ID.
  ///
  /// Parameter [type] :
  /// The layer type. A stack cannot have more than one built-in layer of the
  /// same type. It can have any number of custom layers. Built-in layers are
  /// not available in Chef 12 stacks.
  ///
  /// Parameter [attributes] :
  /// One or more user-defined key-value pairs to be added to the stack
  /// attributes.
  ///
  /// To create a cluster layer, set the <code>EcsClusterArn</code> attribute to
  /// the cluster's ARN.
  ///
  /// Parameter [autoAssignElasticIps] :
  /// Whether to automatically assign an <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic
  /// IP address</a> to the layer's instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html">How
  /// to Edit a Layer</a>.
  ///
  /// Parameter [autoAssignPublicIps] :
  /// For stacks that are running in a VPC, whether to automatically assign a
  /// public IP address to the layer's instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html">How
  /// to Edit a Layer</a>.
  ///
  /// Parameter [cloudWatchLogsConfiguration] :
  /// Specifies CloudWatch Logs configuration options for the layer. For more
  /// information, see <a>CloudWatchLogsLogStream</a>.
  ///
  /// Parameter [customInstanceProfileArn] :
  /// The ARN of an IAM profile to be used for the layer's EC2 instances. For
  /// more information about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  ///
  /// Parameter [customJson] :
  /// A JSON-formatted string containing custom stack configuration and
  /// deployment attributes to be installed on the layer's instances. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-json-override.html">
  /// Using Custom JSON</a>. This feature is supported as of version 1.7.42 of
  /// the AWS CLI.
  ///
  /// Parameter [customRecipes] :
  /// A <code>LayerCustomRecipes</code> object that specifies the layer custom
  /// recipes.
  ///
  /// Parameter [customSecurityGroupIds] :
  /// An array containing the layer custom security group IDs.
  ///
  /// Parameter [enableAutoHealing] :
  /// Whether to disable auto healing for the layer.
  ///
  /// Parameter [installUpdatesOnBoot] :
  /// Whether to install operating system and package updates when the instance
  /// boots. The default value is <code>true</code>. To control when updates are
  /// installed, set this value to <code>false</code>. You must then update your
  /// instances manually by using <a>CreateDeployment</a> to run the
  /// <code>update_dependencies</code> stack command or by manually running
  /// <code>yum</code> (Amazon Linux) or <code>apt-get</code> (Ubuntu) on the
  /// instances.
  /// <note>
  /// To ensure that your instances have the latest security updates, we
  /// strongly recommend using the default value of <code>true</code>.
  /// </note>
  ///
  /// Parameter [lifecycleEventConfiguration] :
  /// A <code>LifeCycleEventConfiguration</code> object that you can use to
  /// configure the Shutdown event to specify an execution timeout and enable or
  /// disable Elastic Load Balancer connection draining.
  ///
  /// Parameter [packages] :
  /// An array of <code>Package</code> objects that describes the layer
  /// packages.
  ///
  /// Parameter [useEbsOptimizedInstances] :
  /// Whether to use Amazon EBS-optimized instances.
  ///
  /// Parameter [volumeConfigurations] :
  /// A <code>VolumeConfigurations</code> object that describes the layer's
  /// Amazon EBS volumes.
  Future<CreateLayerResult> createLayer({
    @_s.required String name,
    @_s.required String shortname,
    @_s.required String stackId,
    @_s.required LayerType type,
    Map<LayerAttributesKeys, String> attributes,
    bool autoAssignElasticIps,
    bool autoAssignPublicIps,
    CloudWatchLogsConfiguration cloudWatchLogsConfiguration,
    String customInstanceProfileArn,
    String customJson,
    Recipes customRecipes,
    List<String> customSecurityGroupIds,
    bool enableAutoHealing,
    bool installUpdatesOnBoot,
    LifecycleEventConfiguration lifecycleEventConfiguration,
    List<String> packages,
    bool useEbsOptimizedInstances,
    List<VolumeConfiguration> volumeConfigurations,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(shortname, 'shortname');
    ArgumentError.checkNotNull(stackId, 'stackId');
    ArgumentError.checkNotNull(type, 'type');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.CreateLayer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Shortname': shortname,
        'StackId': stackId,
        'Type': type?.toValue() ?? '',
        if (attributes != null)
          'Attributes': attributes.map((k, e) => MapEntry(k.toValue(), e)),
        if (autoAssignElasticIps != null)
          'AutoAssignElasticIps': autoAssignElasticIps,
        if (autoAssignPublicIps != null)
          'AutoAssignPublicIps': autoAssignPublicIps,
        if (cloudWatchLogsConfiguration != null)
          'CloudWatchLogsConfiguration': cloudWatchLogsConfiguration,
        if (customInstanceProfileArn != null)
          'CustomInstanceProfileArn': customInstanceProfileArn,
        if (customJson != null) 'CustomJson': customJson,
        if (customRecipes != null) 'CustomRecipes': customRecipes,
        if (customSecurityGroupIds != null)
          'CustomSecurityGroupIds': customSecurityGroupIds,
        if (enableAutoHealing != null) 'EnableAutoHealing': enableAutoHealing,
        if (installUpdatesOnBoot != null)
          'InstallUpdatesOnBoot': installUpdatesOnBoot,
        if (lifecycleEventConfiguration != null)
          'LifecycleEventConfiguration': lifecycleEventConfiguration,
        if (packages != null) 'Packages': packages,
        if (useEbsOptimizedInstances != null)
          'UseEbsOptimizedInstances': useEbsOptimizedInstances,
        if (volumeConfigurations != null)
          'VolumeConfigurations': volumeConfigurations,
      },
    );

    return CreateLayerResult.fromJson(jsonResponse.body);
  }

  /// Creates a new stack. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-edit.html">Create
  /// a New Stack</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [defaultInstanceProfileArn] :
  /// The Amazon Resource Name (ARN) of an IAM profile that is the default
  /// profile for all of the stack's EC2 instances. For more information about
  /// IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  ///
  /// Parameter [name] :
  /// The stack name.
  ///
  /// Parameter [region] :
  /// The stack's AWS region, such as <code>ap-south-1</code>. For more
  /// information about Amazon regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions
  /// and Endpoints</a>.
  /// <note>
  /// In the AWS CLI, this API maps to the <code>--stack-region</code>
  /// parameter. If the <code>--stack-region</code> parameter and the AWS CLI
  /// common parameter <code>--region</code> are set to the same value, the
  /// stack uses a <i>regional</i> endpoint. If the <code>--stack-region</code>
  /// parameter is not set, but the AWS CLI <code>--region</code> parameter is,
  /// this also results in a stack with a <i>regional</i> endpoint. However, if
  /// the <code>--region</code> parameter is set to <code>us-east-1</code>, and
  /// the <code>--stack-region</code> parameter is set to one of the following,
  /// then the stack uses a legacy or <i>classic</i> region: <code>us-west-1,
  /// us-west-2, sa-east-1, eu-central-1, eu-west-1, ap-northeast-1,
  /// ap-southeast-1, ap-southeast-2</code>. In this case, the actual API
  /// endpoint of the stack is in <code>us-east-1</code>. Only the preceding
  /// regions are supported as classic regions in the <code>us-east-1</code> API
  /// endpoint. Because it is a best practice to choose the regional endpoint
  /// that is closest to where you manage AWS, we recommend that you use
  /// regional endpoints for new stacks. The AWS CLI common
  /// <code>--region</code> parameter always specifies a regional API endpoint;
  /// it cannot be used to specify a classic AWS OpsWorks Stacks region.
  /// </note>
  ///
  /// Parameter [serviceRoleArn] :
  /// The stack's AWS Identity and Access Management (IAM) role, which allows
  /// AWS OpsWorks Stacks to work with AWS resources on your behalf. You must
  /// set this parameter to the Amazon Resource Name (ARN) for an existing IAM
  /// role. For more information about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  ///
  /// Parameter [agentVersion] :
  /// The default AWS OpsWorks Stacks agent version. You have the following
  /// options:
  ///
  /// <ul>
  /// <li>
  /// Auto-update - Set this parameter to <code>LATEST</code>. AWS OpsWorks
  /// Stacks automatically installs new agent versions on the stack's instances
  /// as soon as they are available.
  /// </li>
  /// <li>
  /// Fixed version - Set this parameter to your preferred agent version. To
  /// update the agent version, you must edit the stack configuration and
  /// specify a new version. AWS OpsWorks Stacks then automatically installs
  /// that version on the stack's instances.
  /// </li>
  /// </ul>
  /// The default setting is the most recent release of the agent. To specify an
  /// agent version, you must use the complete version number, not the
  /// abbreviated number shown on the console. For a list of available agent
  /// version numbers, call <a>DescribeAgentVersions</a>. AgentVersion cannot be
  /// set to Chef 12.2.
  /// <note>
  /// You can also specify an agent version when you create or update an
  /// instance, which overrides the stack's default setting.
  /// </note>
  ///
  /// Parameter [attributes] :
  /// One or more user-defined key-value pairs to be added to the stack
  /// attributes.
  ///
  /// Parameter [chefConfiguration] :
  /// A <code>ChefConfiguration</code> object that specifies whether to enable
  /// Berkshelf and the Berkshelf version on Chef 11.10 stacks. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html">Create
  /// a New Stack</a>.
  ///
  /// Parameter [configurationManager] :
  /// The configuration manager. When you create a stack we recommend that you
  /// use the configuration manager to specify the Chef version: 12, 11.10, or
  /// 11.4 for Linux stacks, or 12.2 for Windows stacks. The default value for
  /// Linux stacks is currently 12.
  ///
  /// Parameter [customCookbooksSource] :
  /// Contains the information required to retrieve an app or cookbook from a
  /// repository. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html">Adding
  /// Apps</a> or <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html">Cookbooks
  /// and Recipes</a>.
  ///
  /// Parameter [customJson] :
  /// A string that contains user-defined, custom JSON. It can be used to
  /// override the corresponding default stack configuration attribute values or
  /// to pass data to recipes. The string should be in the following format:
  ///
  /// <code>"{\"key1\": \"value1\", \"key2\": \"value2\",...}"</code>
  ///
  /// For more information about custom JSON, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html">Use
  /// Custom JSON to Modify the Stack Configuration Attributes</a>.
  ///
  /// Parameter [defaultAvailabilityZone] :
  /// The stack's default Availability Zone, which must be in the specified
  /// region. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions
  /// and Endpoints</a>. If you also specify a value for
  /// <code>DefaultSubnetId</code>, the subnet must be in the same zone. For
  /// more information, see the <code>VpcId</code> parameter description.
  ///
  /// Parameter [defaultOs] :
  /// The stack's default operating system, which is installed on every instance
  /// unless you specify a different operating system when you create the
  /// instance. You can specify one of the following.
  ///
  /// <ul>
  /// <li>
  /// A supported Linux operating system: An Amazon Linux version, such as
  /// <code>Amazon Linux 2018.03</code>, <code>Amazon Linux 2017.09</code>,
  /// <code>Amazon Linux 2017.03</code>, <code>Amazon Linux 2016.09</code>,
  /// <code>Amazon Linux 2016.03</code>, <code>Amazon Linux 2015.09</code>, or
  /// <code>Amazon Linux 2015.03</code>.
  /// </li>
  /// <li>
  /// A supported Ubuntu operating system, such as <code>Ubuntu 16.04
  /// LTS</code>, <code>Ubuntu 14.04 LTS</code>, or <code>Ubuntu 12.04
  /// LTS</code>.
  /// </li>
  /// <li>
  /// <code>CentOS Linux 7</code>
  /// </li>
  /// <li>
  /// <code>Red Hat Enterprise Linux 7</code>
  /// </li>
  /// <li>
  /// A supported Windows operating system, such as <code>Microsoft Windows
  /// Server 2012 R2 Base</code>, <code>Microsoft Windows Server 2012 R2 with
  /// SQL Server Express</code>, <code>Microsoft Windows Server 2012 R2 with SQL
  /// Server Standard</code>, or <code>Microsoft Windows Server 2012 R2 with SQL
  /// Server Web</code>.
  /// </li>
  /// <li>
  /// A custom AMI: <code>Custom</code>. You specify the custom AMI you want to
  /// use when you create instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html">
  /// Using Custom AMIs</a>.
  /// </li>
  /// </ul>
  /// The default option is the current Amazon Linux version. For more
  /// information about supported operating systems, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html">AWS
  /// OpsWorks Stacks Operating Systems</a>.
  ///
  /// Parameter [defaultRootDeviceType] :
  /// The default root device type. This value is the default for all instances
  /// in the stack, but you can override it when you create an instance. The
  /// default option is <code>instance-store</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device">Storage
  /// for the Root Device</a>.
  ///
  /// Parameter [defaultSshKeyName] :
  /// A default Amazon EC2 key pair name. The default value is none. If you
  /// specify a key pair name, AWS OpsWorks installs the public key on the
  /// instance and you can use the private key with an SSH client to log in to
  /// the instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-ssh.html">
  /// Using SSH to Communicate with an Instance</a> and <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/security-ssh-access.html">
  /// Managing SSH Access</a>. You can override this setting by specifying a
  /// different key pair, or no key pair, when you <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-add.html">
  /// create an instance</a>.
  ///
  /// Parameter [defaultSubnetId] :
  /// The stack's default VPC subnet ID. This parameter is required if you
  /// specify a value for the <code>VpcId</code> parameter. All instances are
  /// launched into this subnet unless you specify otherwise when you create the
  /// instance. If you also specify a value for
  /// <code>DefaultAvailabilityZone</code>, the subnet must be in that zone. For
  /// information on default values and when this parameter is required, see the
  /// <code>VpcId</code> parameter description.
  ///
  /// Parameter [hostnameTheme] :
  /// The stack's host name theme, with spaces replaced by underscores. The
  /// theme is used to generate host names for the stack's instances. By
  /// default, <code>HostnameTheme</code> is set to
  /// <code>Layer_Dependent</code>, which creates host names by appending
  /// integers to the layer's short name. The other themes are:
  ///
  /// <ul>
  /// <li>
  /// <code>Baked_Goods</code>
  /// </li>
  /// <li>
  /// <code>Clouds</code>
  /// </li>
  /// <li>
  /// <code>Europe_Cities</code>
  /// </li>
  /// <li>
  /// <code>Fruits</code>
  /// </li>
  /// <li>
  /// <code>Greek_Deities_and_Titans</code>
  /// </li>
  /// <li>
  /// <code>Legendary_creatures_from_Japan</code>
  /// </li>
  /// <li>
  /// <code>Planets_and_Moons</code>
  /// </li>
  /// <li>
  /// <code>Roman_Deities</code>
  /// </li>
  /// <li>
  /// <code>Scottish_Islands</code>
  /// </li>
  /// <li>
  /// <code>US_Cities</code>
  /// </li>
  /// <li>
  /// <code>Wild_Cats</code>
  /// </li>
  /// </ul>
  /// To obtain a generated host name, call <code>GetHostNameSuggestion</code>,
  /// which returns a host name based on the current theme.
  ///
  /// Parameter [useCustomCookbooks] :
  /// Whether the stack uses custom cookbooks.
  ///
  /// Parameter [useOpsworksSecurityGroups] :
  /// Whether to associate the AWS OpsWorks Stacks built-in security groups with
  /// the stack's layers.
  ///
  /// AWS OpsWorks Stacks provides a standard set of built-in security groups,
  /// one for each layer, which are associated with layers by default. With
  /// <code>UseOpsworksSecurityGroups</code> you can instead provide your own
  /// custom security groups. <code>UseOpsworksSecurityGroups</code> has the
  /// following settings:
  ///
  /// <ul>
  /// <li>
  /// True - AWS OpsWorks Stacks automatically associates the appropriate
  /// built-in security group with each layer (default setting). You can
  /// associate additional security groups with a layer after you create it, but
  /// you cannot delete the built-in security group.
  /// </li>
  /// <li>
  /// False - AWS OpsWorks Stacks does not associate built-in security groups
  /// with layers. You must create appropriate EC2 security groups and associate
  /// a security group with each layer that you create. However, you can still
  /// manually associate a built-in security group with a layer on creation;
  /// custom security groups are required only for those layers that need custom
  /// settings.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html">Create
  /// a New Stack</a>.
  ///
  /// Parameter [vpcId] :
  /// The ID of the VPC that the stack is to be launched into. The VPC must be
  /// in the stack's region. All instances are launched into this VPC. You
  /// cannot change the ID later.
  ///
  /// <ul>
  /// <li>
  /// If your account supports EC2-Classic, the default value is <code>no
  /// VPC</code>.
  /// </li>
  /// <li>
  /// If your account does not support EC2-Classic, the default value is the
  /// default VPC for the specified region.
  /// </li>
  /// </ul>
  /// If the VPC ID corresponds to a default VPC and you have specified either
  /// the <code>DefaultAvailabilityZone</code> or the
  /// <code>DefaultSubnetId</code> parameter only, AWS OpsWorks Stacks infers
  /// the value of the other parameter. If you specify neither parameter, AWS
  /// OpsWorks Stacks sets these parameters to the first valid Availability Zone
  /// for the specified region and the corresponding default VPC subnet ID,
  /// respectively.
  ///
  /// If you specify a nondefault VPC ID, note the following:
  ///
  /// <ul>
  /// <li>
  /// It must belong to a VPC in your account that is in the specified region.
  /// </li>
  /// <li>
  /// You must specify a value for <code>DefaultSubnetId</code>.
  /// </li>
  /// </ul>
  /// For more information about how to use AWS OpsWorks Stacks with a VPC, see
  /// <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-vpc.html">Running
  /// a Stack in a VPC</a>. For more information about default VPC and
  /// EC2-Classic, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported
  /// Platforms</a>.
  Future<CreateStackResult> createStack({
    @_s.required String defaultInstanceProfileArn,
    @_s.required String name,
    @_s.required String region,
    @_s.required String serviceRoleArn,
    String agentVersion,
    Map<StackAttributesKeys, String> attributes,
    ChefConfiguration chefConfiguration,
    StackConfigurationManager configurationManager,
    Source customCookbooksSource,
    String customJson,
    String defaultAvailabilityZone,
    String defaultOs,
    RootDeviceType defaultRootDeviceType,
    String defaultSshKeyName,
    String defaultSubnetId,
    String hostnameTheme,
    bool useCustomCookbooks,
    bool useOpsworksSecurityGroups,
    String vpcId,
  }) async {
    ArgumentError.checkNotNull(
        defaultInstanceProfileArn, 'defaultInstanceProfileArn');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(region, 'region');
    ArgumentError.checkNotNull(serviceRoleArn, 'serviceRoleArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.CreateStack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DefaultInstanceProfileArn': defaultInstanceProfileArn,
        'Name': name,
        'Region': region,
        'ServiceRoleArn': serviceRoleArn,
        if (agentVersion != null) 'AgentVersion': agentVersion,
        if (attributes != null)
          'Attributes': attributes.map((k, e) => MapEntry(k.toValue(), e)),
        if (chefConfiguration != null) 'ChefConfiguration': chefConfiguration,
        if (configurationManager != null)
          'ConfigurationManager': configurationManager,
        if (customCookbooksSource != null)
          'CustomCookbooksSource': customCookbooksSource,
        if (customJson != null) 'CustomJson': customJson,
        if (defaultAvailabilityZone != null)
          'DefaultAvailabilityZone': defaultAvailabilityZone,
        if (defaultOs != null) 'DefaultOs': defaultOs,
        if (defaultRootDeviceType != null)
          'DefaultRootDeviceType': defaultRootDeviceType.toValue(),
        if (defaultSshKeyName != null) 'DefaultSshKeyName': defaultSshKeyName,
        if (defaultSubnetId != null) 'DefaultSubnetId': defaultSubnetId,
        if (hostnameTheme != null) 'HostnameTheme': hostnameTheme,
        if (useCustomCookbooks != null)
          'UseCustomCookbooks': useCustomCookbooks,
        if (useOpsworksSecurityGroups != null)
          'UseOpsworksSecurityGroups': useOpsworksSecurityGroups,
        if (vpcId != null) 'VpcId': vpcId,
      },
    );

    return CreateStackResult.fromJson(jsonResponse.body);
  }

  /// Creates a new user profile.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [iamUserArn] :
  /// The user's IAM ARN; this can also be a federated user's ARN.
  ///
  /// Parameter [allowSelfManagement] :
  /// Whether users can specify their own SSH public key through the My Settings
  /// page. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/security-settingsshkey.html">Setting
  /// an IAM User's Public SSH Key</a>.
  ///
  /// Parameter [sshPublicKey] :
  /// The user's public SSH key.
  ///
  /// Parameter [sshUsername] :
  /// The user's SSH user name. The allowable characters are [a-z], [A-Z],
  /// [0-9], '-', and '_'. If the specified name includes other punctuation
  /// marks, AWS OpsWorks Stacks removes them. For example, <code>my.name</code>
  /// will be changed to <code>myname</code>. If you do not specify an SSH user
  /// name, AWS OpsWorks Stacks generates one from the IAM user name.
  Future<CreateUserProfileResult> createUserProfile({
    @_s.required String iamUserArn,
    bool allowSelfManagement,
    String sshPublicKey,
    String sshUsername,
  }) async {
    ArgumentError.checkNotNull(iamUserArn, 'iamUserArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.CreateUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IamUserArn': iamUserArn,
        if (allowSelfManagement != null)
          'AllowSelfManagement': allowSelfManagement,
        if (sshPublicKey != null) 'SshPublicKey': sshPublicKey,
        if (sshUsername != null) 'SshUsername': sshUsername,
      },
    );

    return CreateUserProfileResult.fromJson(jsonResponse.body);
  }

  /// Deletes a specified app.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  Future<void> deleteApp({
    @_s.required String appId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeleteApp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AppId': appId,
      },
    );
  }

  /// Deletes a specified instance, which terminates the associated Amazon EC2
  /// instance. You must stop an instance before you can delete it.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-delete.html">Deleting
  /// Instances</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  ///
  /// Parameter [deleteElasticIp] :
  /// Whether to delete the instance Elastic IP address.
  ///
  /// Parameter [deleteVolumes] :
  /// Whether to delete the instance's Amazon EBS volumes.
  Future<void> deleteInstance({
    @_s.required String instanceId,
    bool deleteElasticIp,
    bool deleteVolumes,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeleteInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        if (deleteElasticIp != null) 'DeleteElasticIp': deleteElasticIp,
        if (deleteVolumes != null) 'DeleteVolumes': deleteVolumes,
      },
    );
  }

  /// Deletes a specified layer. You must first stop and then delete all
  /// associated instances or unassign registered instances. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-delete.html">How
  /// to Delete a Layer</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [layerId] :
  /// The layer ID.
  Future<void> deleteLayer({
    @_s.required String layerId,
  }) async {
    ArgumentError.checkNotNull(layerId, 'layerId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeleteLayer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LayerId': layerId,
      },
    );
  }

  /// Deletes a specified stack. You must first delete all instances, layers,
  /// and apps or deregister registered instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-shutting.html">Shut
  /// Down a Stack</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  Future<void> deleteStack({
    @_s.required String stackId,
  }) async {
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeleteStack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StackId': stackId,
      },
    );
  }

  /// Deletes a user profile.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [iamUserArn] :
  /// The user's IAM ARN. This can also be a federated user's ARN.
  Future<void> deleteUserProfile({
    @_s.required String iamUserArn,
  }) async {
    ArgumentError.checkNotNull(iamUserArn, 'iamUserArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeleteUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IamUserArn': iamUserArn,
      },
    );
  }

  /// Deregisters a specified Amazon ECS cluster from a stack. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-ecscluster.html#workinglayers-ecscluster-delete">
  /// Resource Management</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [ecsClusterArn] :
  /// The cluster's Amazon Resource Number (ARN).
  Future<void> deregisterEcsCluster({
    @_s.required String ecsClusterArn,
  }) async {
    ArgumentError.checkNotNull(ecsClusterArn, 'ecsClusterArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeregisterEcsCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EcsClusterArn': ecsClusterArn,
      },
    );
  }

  /// Deregisters a specified Elastic IP address. The address can then be
  /// registered by another stack. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html">Resource
  /// Management</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [elasticIp] :
  /// The Elastic IP address.
  Future<void> deregisterElasticIp({
    @_s.required String elasticIp,
  }) async {
    ArgumentError.checkNotNull(elasticIp, 'elasticIp');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeregisterElasticIp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ElasticIp': elasticIp,
      },
    );
  }

  /// Deregister a registered Amazon EC2 or on-premises instance. This action
  /// removes the instance from the stack and returns it to your control. This
  /// action cannot be used with instances that were created with AWS OpsWorks
  /// Stacks.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  Future<void> deregisterInstance({
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeregisterInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
      },
    );
  }

  /// Deregisters an Amazon RDS instance.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [rdsDbInstanceArn] :
  /// The Amazon RDS instance's ARN.
  Future<void> deregisterRdsDbInstance({
    @_s.required String rdsDbInstanceArn,
  }) async {
    ArgumentError.checkNotNull(rdsDbInstanceArn, 'rdsDbInstanceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeregisterRdsDbInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RdsDbInstanceArn': rdsDbInstanceArn,
      },
    );
  }

  /// Deregisters an Amazon EBS volume. The volume can then be registered by
  /// another stack. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html">Resource
  /// Management</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [volumeId] :
  /// The AWS OpsWorks Stacks volume ID, which is the GUID that AWS OpsWorks
  /// Stacks assigned to the instance when you registered the volume with the
  /// stack, not the Amazon EC2 volume ID.
  Future<void> deregisterVolume({
    @_s.required String volumeId,
  }) async {
    ArgumentError.checkNotNull(volumeId, 'volumeId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeregisterVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeId': volumeId,
      },
    );
  }

  /// Describes the available AWS OpsWorks Stacks agent versions. You must
  /// specify a stack ID or a configuration manager.
  /// <code>DescribeAgentVersions</code> returns a list of available agent
  /// versions for the specified stack or configuration manager.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configurationManager] :
  /// The configuration manager.
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  Future<DescribeAgentVersionsResult> describeAgentVersions({
    StackConfigurationManager configurationManager,
    String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeAgentVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (configurationManager != null)
          'ConfigurationManager': configurationManager,
        if (stackId != null) 'StackId': stackId,
      },
    );

    return DescribeAgentVersionsResult.fromJson(jsonResponse.body);
  }

  /// Requests a description of a specified set of apps.
  /// <note>
  /// This call accepts only one resource-identifying parameter.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appIds] :
  /// An array of app IDs for the apps to be described. If you use this
  /// parameter, <code>DescribeApps</code> returns a description of the
  /// specified apps. Otherwise, it returns a description of every app.
  ///
  /// Parameter [stackId] :
  /// The app stack ID. If you use this parameter, <code>DescribeApps</code>
  /// returns a description of the apps in the specified stack.
  Future<DescribeAppsResult> describeApps({
    List<String> appIds,
    String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeApps'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appIds != null) 'AppIds': appIds,
        if (stackId != null) 'StackId': stackId,
      },
    );

    return DescribeAppsResult.fromJson(jsonResponse.body);
  }

  /// Describes the results of specified commands.
  /// <note>
  /// This call accepts only one resource-identifying parameter.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [commandIds] :
  /// An array of command IDs. If you include this parameter,
  /// <code>DescribeCommands</code> returns a description of the specified
  /// commands. Otherwise, it returns a description of every command.
  ///
  /// Parameter [deploymentId] :
  /// The deployment ID. If you include this parameter,
  /// <code>DescribeCommands</code> returns a description of the commands
  /// associated with the specified deployment.
  ///
  /// Parameter [instanceId] :
  /// The instance ID. If you include this parameter,
  /// <code>DescribeCommands</code> returns a description of the commands
  /// associated with the specified instance.
  Future<DescribeCommandsResult> describeCommands({
    List<String> commandIds,
    String deploymentId,
    String instanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeCommands'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (commandIds != null) 'CommandIds': commandIds,
        if (deploymentId != null) 'DeploymentId': deploymentId,
        if (instanceId != null) 'InstanceId': instanceId,
      },
    );

    return DescribeCommandsResult.fromJson(jsonResponse.body);
  }

  /// Requests a description of a specified set of deployments.
  /// <note>
  /// This call accepts only one resource-identifying parameter.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appId] :
  /// The app ID. If you include this parameter, the command returns a
  /// description of the commands associated with the specified app.
  ///
  /// Parameter [deploymentIds] :
  /// An array of deployment IDs to be described. If you include this parameter,
  /// the command returns a description of the specified deployments. Otherwise,
  /// it returns a description of every deployment.
  ///
  /// Parameter [stackId] :
  /// The stack ID. If you include this parameter, the command returns a
  /// description of the commands associated with the specified stack.
  Future<DescribeDeploymentsResult> describeDeployments({
    String appId,
    List<String> deploymentIds,
    String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeDeployments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'AppId': appId,
        if (deploymentIds != null) 'DeploymentIds': deploymentIds,
        if (stackId != null) 'StackId': stackId,
      },
    );

    return DescribeDeploymentsResult.fromJson(jsonResponse.body);
  }

  /// Describes Amazon ECS clusters that are registered with a stack. If you
  /// specify only a stack ID, you can use the <code>MaxResults</code> and
  /// <code>NextToken</code> parameters to paginate the response. However, AWS
  /// OpsWorks Stacks currently supports only one cluster per layer, so the
  /// result set has a maximum of one element.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack or an attached
  /// policy that explicitly grants permission. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// This call accepts only one resource-identifying parameter.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [ecsClusterArns] :
  /// A list of ARNs, one for each cluster to be described.
  ///
  /// Parameter [maxResults] :
  /// To receive a paginated response, use this parameter to specify the maximum
  /// number of results to be returned with a single call. If the number of
  /// available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's<code>NextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>DescribeEcsClusters</code> again and assign that token to the
  /// request object's <code>NextToken</code> parameter. If there are no
  /// remaining results, the previous response object's <code>NextToken</code>
  /// parameter is set to <code>null</code>.
  ///
  /// Parameter [stackId] :
  /// A stack ID. <code>DescribeEcsClusters</code> returns a description of the
  /// cluster that is registered with the stack.
  Future<DescribeEcsClustersResult> describeEcsClusters({
    List<String> ecsClusterArns,
    int maxResults,
    String nextToken,
    String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeEcsClusters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (ecsClusterArns != null) 'EcsClusterArns': ecsClusterArns,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (stackId != null) 'StackId': stackId,
      },
    );

    return DescribeEcsClustersResult.fromJson(jsonResponse.body);
  }

  /// Describes <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic
  /// IP addresses</a>.
  /// <note>
  /// This call accepts only one resource-identifying parameter.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID. If you include this parameter,
  /// <code>DescribeElasticIps</code> returns a description of the Elastic IP
  /// addresses associated with the specified instance.
  ///
  /// Parameter [ips] :
  /// An array of Elastic IP addresses to be described. If you include this
  /// parameter, <code>DescribeElasticIps</code> returns a description of the
  /// specified Elastic IP addresses. Otherwise, it returns a description of
  /// every Elastic IP address.
  ///
  /// Parameter [stackId] :
  /// A stack ID. If you include this parameter, <code>DescribeElasticIps</code>
  /// returns a description of the Elastic IP addresses that are registered with
  /// the specified stack.
  Future<DescribeElasticIpsResult> describeElasticIps({
    String instanceId,
    List<String> ips,
    String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeElasticIps'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (instanceId != null) 'InstanceId': instanceId,
        if (ips != null) 'Ips': ips,
        if (stackId != null) 'StackId': stackId,
      },
    );

    return DescribeElasticIpsResult.fromJson(jsonResponse.body);
  }

  /// Describes a stack's Elastic Load Balancing instances.
  /// <note>
  /// This call accepts only one resource-identifying parameter.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [layerIds] :
  /// A list of layer IDs. The action describes the Elastic Load Balancing
  /// instances for the specified layers.
  ///
  /// Parameter [stackId] :
  /// A stack ID. The action describes the stack's Elastic Load Balancing
  /// instances.
  Future<DescribeElasticLoadBalancersResult> describeElasticLoadBalancers({
    List<String> layerIds,
    String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeElasticLoadBalancers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (layerIds != null) 'LayerIds': layerIds,
        if (stackId != null) 'StackId': stackId,
      },
    );

    return DescribeElasticLoadBalancersResult.fromJson(jsonResponse.body);
  }

  /// Requests a description of a set of instances.
  /// <note>
  /// This call accepts only one resource-identifying parameter.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceIds] :
  /// An array of instance IDs to be described. If you use this parameter,
  /// <code>DescribeInstances</code> returns a description of the specified
  /// instances. Otherwise, it returns a description of every instance.
  ///
  /// Parameter [layerId] :
  /// A layer ID. If you use this parameter, <code>DescribeInstances</code>
  /// returns descriptions of the instances associated with the specified layer.
  ///
  /// Parameter [stackId] :
  /// A stack ID. If you use this parameter, <code>DescribeInstances</code>
  /// returns descriptions of the instances associated with the specified stack.
  Future<DescribeInstancesResult> describeInstances({
    List<String> instanceIds,
    String layerId,
    String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (instanceIds != null) 'InstanceIds': instanceIds,
        if (layerId != null) 'LayerId': layerId,
        if (stackId != null) 'StackId': stackId,
      },
    );

    return DescribeInstancesResult.fromJson(jsonResponse.body);
  }

  /// Requests a description of one or more layers in a specified stack.
  /// <note>
  /// This call accepts only one resource-identifying parameter.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [layerIds] :
  /// An array of layer IDs that specify the layers to be described. If you omit
  /// this parameter, <code>DescribeLayers</code> returns a description of every
  /// layer in the specified stack.
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  Future<DescribeLayersResult> describeLayers({
    List<String> layerIds,
    String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeLayers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (layerIds != null) 'LayerIds': layerIds,
        if (stackId != null) 'StackId': stackId,
      },
    );

    return DescribeLayersResult.fromJson(jsonResponse.body);
  }

  /// Describes load-based auto scaling configurations for specified layers.
  /// <note>
  /// You must specify at least one of the parameters.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [layerIds] :
  /// An array of layer IDs.
  Future<DescribeLoadBasedAutoScalingResult> describeLoadBasedAutoScaling({
    @_s.required List<String> layerIds,
  }) async {
    ArgumentError.checkNotNull(layerIds, 'layerIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeLoadBasedAutoScaling'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LayerIds': layerIds,
      },
    );

    return DescribeLoadBasedAutoScalingResult.fromJson(jsonResponse.body);
  }

  /// Describes a user's SSH information.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have
  /// self-management enabled or an attached policy that explicitly grants
  /// permissions. For more information about user permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  Future<DescribeMyUserProfileResult> describeMyUserProfile() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeMyUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeMyUserProfileResult.fromJson(jsonResponse.body);
  }

  /// Describes the operating systems that are supported by AWS OpsWorks Stacks.
  Future<DescribeOperatingSystemsResponse> describeOperatingSystems() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeOperatingSystems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeOperatingSystemsResponse.fromJson(jsonResponse.body);
  }

  /// Describes the permissions for a specified stack.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [iamUserArn] :
  /// The user's IAM ARN. This can also be a federated user's ARN. For more
  /// information about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  Future<DescribePermissionsResult> describePermissions({
    String iamUserArn,
    String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribePermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (iamUserArn != null) 'IamUserArn': iamUserArn,
        if (stackId != null) 'StackId': stackId,
      },
    );

    return DescribePermissionsResult.fromJson(jsonResponse.body);
  }

  /// Describe an instance's RAID arrays.
  /// <note>
  /// This call accepts only one resource-identifying parameter.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID. If you use this parameter,
  /// <code>DescribeRaidArrays</code> returns descriptions of the RAID arrays
  /// associated with the specified instance.
  ///
  /// Parameter [raidArrayIds] :
  /// An array of RAID array IDs. If you use this parameter,
  /// <code>DescribeRaidArrays</code> returns descriptions of the specified
  /// arrays. Otherwise, it returns a description of every array.
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  Future<DescribeRaidArraysResult> describeRaidArrays({
    String instanceId,
    List<String> raidArrayIds,
    String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeRaidArrays'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (instanceId != null) 'InstanceId': instanceId,
        if (raidArrayIds != null) 'RaidArrayIds': raidArrayIds,
        if (stackId != null) 'StackId': stackId,
      },
    );

    return DescribeRaidArraysResult.fromJson(jsonResponse.body);
  }

  /// Describes Amazon RDS instances.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// This call accepts only one resource-identifying parameter.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [stackId] :
  /// The ID of the stack with which the instances are registered. The operation
  /// returns descriptions of all registered Amazon RDS instances.
  ///
  /// Parameter [rdsDbInstanceArns] :
  /// An array containing the ARNs of the instances to be described.
  Future<DescribeRdsDbInstancesResult> describeRdsDbInstances({
    @_s.required String stackId,
    List<String> rdsDbInstanceArns,
  }) async {
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeRdsDbInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StackId': stackId,
        if (rdsDbInstanceArns != null) 'RdsDbInstanceArns': rdsDbInstanceArns,
      },
    );

    return DescribeRdsDbInstancesResult.fromJson(jsonResponse.body);
  }

  /// Describes AWS OpsWorks Stacks service errors.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// This call accepts only one resource-identifying parameter.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID. If you use this parameter,
  /// <code>DescribeServiceErrors</code> returns descriptions of the errors
  /// associated with the specified instance.
  ///
  /// Parameter [serviceErrorIds] :
  /// An array of service error IDs. If you use this parameter,
  /// <code>DescribeServiceErrors</code> returns descriptions of the specified
  /// errors. Otherwise, it returns a description of every error.
  ///
  /// Parameter [stackId] :
  /// The stack ID. If you use this parameter,
  /// <code>DescribeServiceErrors</code> returns descriptions of the errors
  /// associated with the specified stack.
  Future<DescribeServiceErrorsResult> describeServiceErrors({
    String instanceId,
    List<String> serviceErrorIds,
    String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeServiceErrors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (instanceId != null) 'InstanceId': instanceId,
        if (serviceErrorIds != null) 'ServiceErrorIds': serviceErrorIds,
        if (stackId != null) 'StackId': stackId,
      },
    );

    return DescribeServiceErrorsResult.fromJson(jsonResponse.body);
  }

  /// Requests a description of a stack's provisioning parameters.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  Future<DescribeStackProvisioningParametersResult>
      describeStackProvisioningParameters({
    @_s.required String stackId,
  }) async {
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeStackProvisioningParameters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StackId': stackId,
      },
    );

    return DescribeStackProvisioningParametersResult.fromJson(
        jsonResponse.body);
  }

  /// Describes the number of layers and apps in a specified stack, and the
  /// number of instances in each state, such as <code>running_setup</code> or
  /// <code>online</code>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  Future<DescribeStackSummaryResult> describeStackSummary({
    @_s.required String stackId,
  }) async {
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeStackSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StackId': stackId,
      },
    );

    return DescribeStackSummaryResult.fromJson(jsonResponse.body);
  }

  /// Requests a description of one or more stacks.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [stackIds] :
  /// An array of stack IDs that specify the stacks to be described. If you omit
  /// this parameter, <code>DescribeStacks</code> returns a description of every
  /// stack.
  Future<DescribeStacksResult> describeStacks({
    List<String> stackIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeStacks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (stackIds != null) 'StackIds': stackIds,
      },
    );

    return DescribeStacksResult.fromJson(jsonResponse.body);
  }

  /// Describes time-based auto scaling configurations for specified instances.
  /// <note>
  /// You must specify at least one of the parameters.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceIds] :
  /// An array of instance IDs.
  Future<DescribeTimeBasedAutoScalingResult> describeTimeBasedAutoScaling({
    @_s.required List<String> instanceIds,
  }) async {
    ArgumentError.checkNotNull(instanceIds, 'instanceIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeTimeBasedAutoScaling'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceIds': instanceIds,
      },
    );

    return DescribeTimeBasedAutoScalingResult.fromJson(jsonResponse.body);
  }

  /// Describe specified users.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [iamUserArns] :
  /// An array of IAM or federated user ARNs that identify the users to be
  /// described.
  Future<DescribeUserProfilesResult> describeUserProfiles({
    List<String> iamUserArns,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeUserProfiles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (iamUserArns != null) 'IamUserArns': iamUserArns,
      },
    );

    return DescribeUserProfilesResult.fromJson(jsonResponse.body);
  }

  /// Describes an instance's Amazon EBS volumes.
  /// <note>
  /// This call accepts only one resource-identifying parameter.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Show, Deploy, or Manage permissions level for the stack, or an attached
  /// policy that explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID. If you use this parameter, <code>DescribeVolumes</code>
  /// returns descriptions of the volumes associated with the specified
  /// instance.
  ///
  /// Parameter [raidArrayId] :
  /// The RAID array ID. If you use this parameter, <code>DescribeVolumes</code>
  /// returns descriptions of the volumes associated with the specified RAID
  /// array.
  ///
  /// Parameter [stackId] :
  /// A stack ID. The action describes the stack's registered Amazon EBS
  /// volumes.
  ///
  /// Parameter [volumeIds] :
  /// Am array of volume IDs. If you use this parameter,
  /// <code>DescribeVolumes</code> returns descriptions of the specified
  /// volumes. Otherwise, it returns a description of every volume.
  Future<DescribeVolumesResult> describeVolumes({
    String instanceId,
    String raidArrayId,
    String stackId,
    List<String> volumeIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DescribeVolumes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (instanceId != null) 'InstanceId': instanceId,
        if (raidArrayId != null) 'RaidArrayId': raidArrayId,
        if (stackId != null) 'StackId': stackId,
        if (volumeIds != null) 'VolumeIds': volumeIds,
      },
    );

    return DescribeVolumesResult.fromJson(jsonResponse.body);
  }

  /// Detaches a specified Elastic Load Balancing instance from its layer.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [elasticLoadBalancerName] :
  /// The Elastic Load Balancing instance's name.
  ///
  /// Parameter [layerId] :
  /// The ID of the layer that the Elastic Load Balancing instance is attached
  /// to.
  Future<void> detachElasticLoadBalancer({
    @_s.required String elasticLoadBalancerName,
    @_s.required String layerId,
  }) async {
    ArgumentError.checkNotNull(
        elasticLoadBalancerName, 'elasticLoadBalancerName');
    ArgumentError.checkNotNull(layerId, 'layerId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DetachElasticLoadBalancer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ElasticLoadBalancerName': elasticLoadBalancerName,
        'LayerId': layerId,
      },
    );
  }

  /// Disassociates an Elastic IP address from its instance. The address remains
  /// registered with the stack. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html">Resource
  /// Management</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [elasticIp] :
  /// The Elastic IP address.
  Future<void> disassociateElasticIp({
    @_s.required String elasticIp,
  }) async {
    ArgumentError.checkNotNull(elasticIp, 'elasticIp');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DisassociateElasticIp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ElasticIp': elasticIp,
      },
    );
  }

  /// Gets a generated host name for the specified layer, based on the current
  /// host name theme.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [layerId] :
  /// The layer ID.
  Future<GetHostnameSuggestionResult> getHostnameSuggestion({
    @_s.required String layerId,
  }) async {
    ArgumentError.checkNotNull(layerId, 'layerId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.GetHostnameSuggestion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LayerId': layerId,
      },
    );

    return GetHostnameSuggestionResult.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This action can be used only with Windows stacks.
  /// </note>
  /// Grants RDP access to a Windows instance for a specified time period.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance's AWS OpsWorks Stacks ID.
  ///
  /// Parameter [validForInMinutes] :
  /// The length of time (in minutes) that the grant is valid. When the grant
  /// expires at the end of this period, the user will no longer be able to use
  /// the credentials to log in. If the user is logged in at the time, he or she
  /// automatically will be logged out.
  Future<GrantAccessResult> grantAccess({
    @_s.required String instanceId,
    int validForInMinutes,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'validForInMinutes',
      validForInMinutes,
      60,
      1440,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.GrantAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        if (validForInMinutes != null) 'ValidForInMinutes': validForInMinutes,
      },
    );

    return GrantAccessResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of tags that are applied to the specified stack or layer.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The stack or layer's Amazon Resource Number (ARN).
  ///
  /// Parameter [maxResults] :
  /// Do not use. A validation exception occurs if you add a
  /// <code>MaxResults</code> parameter to a <code>ListTagsRequest</code> call.
  ///
  /// Parameter [nextToken] :
  /// Do not use. A validation exception occurs if you add a
  /// <code>NextToken</code> parameter to a <code>ListTagsRequest</code> call.
  Future<ListTagsResult> listTags({
    @_s.required String resourceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.ListTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsResult.fromJson(jsonResponse.body);
  }

  /// Reboots a specified instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html">Starting,
  /// Stopping, and Rebooting Instances</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  Future<void> rebootInstance({
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.RebootInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
      },
    );
  }

  /// Registers a specified Amazon ECS cluster with a stack. You can register
  /// only one cluster with a stack. A cluster can be registered with only one
  /// stack. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-ecscluster.html">
  /// Resource Management</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">
  /// Managing User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [ecsClusterArn] :
  /// The cluster's ARN.
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  Future<RegisterEcsClusterResult> registerEcsCluster({
    @_s.required String ecsClusterArn,
    @_s.required String stackId,
  }) async {
    ArgumentError.checkNotNull(ecsClusterArn, 'ecsClusterArn');
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.RegisterEcsCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EcsClusterArn': ecsClusterArn,
        'StackId': stackId,
      },
    );

    return RegisterEcsClusterResult.fromJson(jsonResponse.body);
  }

  /// Registers an Elastic IP address with a specified stack. An address can be
  /// registered with only one stack at a time. If the address is already
  /// registered, you must first deregister it by calling
  /// <a>DeregisterElasticIp</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html">Resource
  /// Management</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [elasticIp] :
  /// The Elastic IP address.
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  Future<RegisterElasticIpResult> registerElasticIp({
    @_s.required String elasticIp,
    @_s.required String stackId,
  }) async {
    ArgumentError.checkNotNull(elasticIp, 'elasticIp');
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.RegisterElasticIp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ElasticIp': elasticIp,
        'StackId': stackId,
      },
    );

    return RegisterElasticIpResult.fromJson(jsonResponse.body);
  }

  /// Registers instances that were created outside of AWS OpsWorks Stacks with
  /// a specified stack.
  /// <note>
  /// We do not recommend using this action to register instances. The complete
  /// registration operation includes two tasks: installing the AWS OpsWorks
  /// Stacks agent on the instance, and registering the instance with the stack.
  /// <code>RegisterInstance</code> handles only the second step. You should
  /// instead use the AWS CLI <code>register</code> command, which performs the
  /// entire registration operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/registered-instances-register.html">
  /// Registering an Instance with an AWS OpsWorks Stacks Stack</a>.
  /// </note>
  /// Registered instances have the same requirements as instances that are
  /// created by using the <a>CreateInstance</a> API. For example, registered
  /// instances must be running a supported Linux-based operating system, and
  /// they must have a supported instance type. For more information about
  /// requirements for instances that you want to register, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/registered-instances-register-registering-preparer.html">
  /// Preparing the Instance</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [stackId] :
  /// The ID of the stack that the instance is to be registered with.
  ///
  /// Parameter [hostname] :
  /// The instance's hostname.
  ///
  /// Parameter [instanceIdentity] :
  /// An InstanceIdentity object that contains the instance's identity.
  ///
  /// Parameter [privateIp] :
  /// The instance's private IP address.
  ///
  /// Parameter [publicIp] :
  /// The instance's public IP address.
  ///
  /// Parameter [rsaPublicKey] :
  /// The instances public RSA key. This key is used to encrypt communication
  /// between the instance and the service.
  ///
  /// Parameter [rsaPublicKeyFingerprint] :
  /// The instances public RSA key fingerprint.
  Future<RegisterInstanceResult> registerInstance({
    @_s.required String stackId,
    String hostname,
    InstanceIdentity instanceIdentity,
    String privateIp,
    String publicIp,
    String rsaPublicKey,
    String rsaPublicKeyFingerprint,
  }) async {
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.RegisterInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StackId': stackId,
        if (hostname != null) 'Hostname': hostname,
        if (instanceIdentity != null) 'InstanceIdentity': instanceIdentity,
        if (privateIp != null) 'PrivateIp': privateIp,
        if (publicIp != null) 'PublicIp': publicIp,
        if (rsaPublicKey != null) 'RsaPublicKey': rsaPublicKey,
        if (rsaPublicKeyFingerprint != null)
          'RsaPublicKeyFingerprint': rsaPublicKeyFingerprint,
      },
    );

    return RegisterInstanceResult.fromJson(jsonResponse.body);
  }

  /// Registers an Amazon RDS instance with a stack.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [dbPassword] :
  /// The database password.
  ///
  /// Parameter [dbUser] :
  /// The database's master user name.
  ///
  /// Parameter [rdsDbInstanceArn] :
  /// The Amazon RDS instance's ARN.
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  Future<void> registerRdsDbInstance({
    @_s.required String dbPassword,
    @_s.required String dbUser,
    @_s.required String rdsDbInstanceArn,
    @_s.required String stackId,
  }) async {
    ArgumentError.checkNotNull(dbPassword, 'dbPassword');
    ArgumentError.checkNotNull(dbUser, 'dbUser');
    ArgumentError.checkNotNull(rdsDbInstanceArn, 'rdsDbInstanceArn');
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.RegisterRdsDbInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DbPassword': dbPassword,
        'DbUser': dbUser,
        'RdsDbInstanceArn': rdsDbInstanceArn,
        'StackId': stackId,
      },
    );
  }

  /// Registers an Amazon EBS volume with a specified stack. A volume can be
  /// registered with only one stack at a time. If the volume is already
  /// registered, you must first deregister it by calling
  /// <a>DeregisterVolume</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html">Resource
  /// Management</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  ///
  /// Parameter [ec2VolumeId] :
  /// The Amazon EBS volume ID.
  Future<RegisterVolumeResult> registerVolume({
    @_s.required String stackId,
    String ec2VolumeId,
  }) async {
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.RegisterVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StackId': stackId,
        if (ec2VolumeId != null) 'Ec2VolumeId': ec2VolumeId,
      },
    );

    return RegisterVolumeResult.fromJson(jsonResponse.body);
  }

  /// Specify the load-based auto scaling configuration for a specified layer.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-autoscaling.html">Managing
  /// Load with Time-based and Load-based Instances</a>.
  /// <note>
  /// To use load-based auto scaling, you must create a set of load-based auto
  /// scaling instances. Load-based auto scaling operates only on the instances
  /// from that set, so you must ensure that you have created enough instances
  /// to handle the maximum anticipated load.
  /// </note>
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [layerId] :
  /// The layer ID.
  ///
  /// Parameter [downScaling] :
  /// An <code>AutoScalingThresholds</code> object with the downscaling
  /// threshold configuration. If the load falls below these thresholds for a
  /// specified amount of time, AWS OpsWorks Stacks stops a specified number of
  /// instances.
  ///
  /// Parameter [enable] :
  /// Enables load-based auto scaling for the layer.
  ///
  /// Parameter [upScaling] :
  /// An <code>AutoScalingThresholds</code> object with the upscaling threshold
  /// configuration. If the load exceeds these thresholds for a specified amount
  /// of time, AWS OpsWorks Stacks starts a specified number of instances.
  Future<void> setLoadBasedAutoScaling({
    @_s.required String layerId,
    AutoScalingThresholds downScaling,
    bool enable,
    AutoScalingThresholds upScaling,
  }) async {
    ArgumentError.checkNotNull(layerId, 'layerId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.SetLoadBasedAutoScaling'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LayerId': layerId,
        if (downScaling != null) 'DownScaling': downScaling,
        if (enable != null) 'Enable': enable,
        if (upScaling != null) 'UpScaling': upScaling,
      },
    );
  }

  /// Specifies a user's permissions. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingsecurity.html">Security
  /// and Permissions</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [iamUserArn] :
  /// The user's IAM ARN. This can also be a federated user's ARN.
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  ///
  /// Parameter [allowSsh] :
  /// The user is allowed to use SSH to communicate with the instance.
  ///
  /// Parameter [allowSudo] :
  /// The user is allowed to use <b>sudo</b> to elevate privileges.
  ///
  /// Parameter [level] :
  /// The user's permission level, which must be set to one of the following
  /// strings. You cannot set your own permissions level.
  ///
  /// <ul>
  /// <li>
  /// <code>deny</code>
  /// </li>
  /// <li>
  /// <code>show</code>
  /// </li>
  /// <li>
  /// <code>deploy</code>
  /// </li>
  /// <li>
  /// <code>manage</code>
  /// </li>
  /// <li>
  /// <code>iam_only</code>
  /// </li>
  /// </ul>
  /// For more information about the permissions associated with these levels,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  Future<void> setPermission({
    @_s.required String iamUserArn,
    @_s.required String stackId,
    bool allowSsh,
    bool allowSudo,
    String level,
  }) async {
    ArgumentError.checkNotNull(iamUserArn, 'iamUserArn');
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.SetPermission'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IamUserArn': iamUserArn,
        'StackId': stackId,
        if (allowSsh != null) 'AllowSsh': allowSsh,
        if (allowSudo != null) 'AllowSudo': allowSudo,
        if (level != null) 'Level': level,
      },
    );
  }

  /// Specify the time-based auto scaling configuration for a specified
  /// instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-autoscaling.html">Managing
  /// Load with Time-based and Load-based Instances</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  ///
  /// Parameter [autoScalingSchedule] :
  /// An <code>AutoScalingSchedule</code> with the instance schedule.
  Future<void> setTimeBasedAutoScaling({
    @_s.required String instanceId,
    WeeklyAutoScalingSchedule autoScalingSchedule,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.SetTimeBasedAutoScaling'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        if (autoScalingSchedule != null)
          'AutoScalingSchedule': autoScalingSchedule,
      },
    );
  }

  /// Starts a specified instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html">Starting,
  /// Stopping, and Rebooting Instances</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  Future<void> startInstance({
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.StartInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
      },
    );
  }

  /// Starts a stack's instances.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  Future<void> startStack({
    @_s.required String stackId,
  }) async {
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.StartStack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StackId': stackId,
      },
    );
  }

  /// Stops a specified instance. When you stop a standard instance, the data
  /// disappears and must be reinstalled when you restart the instance. You can
  /// stop an Amazon EBS-backed instance without losing data. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html">Starting,
  /// Stopping, and Rebooting Instances</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  ///
  /// Parameter [force] :
  /// Specifies whether to force an instance to stop. If the instance's root
  /// device type is <code>ebs</code>, or EBS-backed, adding the
  /// <code>Force</code> parameter to the <code>StopInstances</code> API call
  /// disassociates the AWS OpsWorks Stacks instance from EC2, and forces
  /// deletion of <i>only</i> the OpsWorks Stacks instance. You must also delete
  /// the formerly-associated instance in EC2 after troubleshooting and
  /// replacing the AWS OpsWorks Stacks instance with a new one.
  Future<void> stopInstance({
    @_s.required String instanceId,
    bool force,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.StopInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        if (force != null) 'Force': force,
      },
    );
  }

  /// Stops a specified stack.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  Future<void> stopStack({
    @_s.required String stackId,
  }) async {
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.StopStack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StackId': stackId,
      },
    );
  }

  /// Apply cost-allocation tags to a specified stack or layer in AWS OpsWorks
  /// Stacks. For more information about how tagging works, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/tagging.html">Tags</a>
  /// in the AWS OpsWorks User Guide.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The stack or layer's Amazon Resource Number (ARN).
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to a stack
  /// or layer.
  ///
  /// <ul>
  /// <li>
  /// The key cannot be empty.
  /// </li>
  /// <li>
  /// The key can be a maximum of 127 characters, and can contain only Unicode
  /// letters, numbers, or separators, or the following special characters:
  /// <code>+ - = . _ : /</code>
  /// </li>
  /// <li>
  /// The value can be a maximum 255 characters, and contain only Unicode
  /// letters, numbers, or separators, or the following special characters:
  /// <code>+ - = . _ : /</code>
  /// </li>
  /// <li>
  /// Leading and trailing white spaces are trimmed from both the key and value.
  /// </li>
  /// <li>
  /// A maximum of 40 tags is allowed for any resource.
  /// </li>
  /// </ul>
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Unassigns a registered instance from all layers that are using the
  /// instance. The instance remains in the stack as an unassigned instance, and
  /// can be assigned to another layer as needed. You cannot use this action
  /// with instances that were created with AWS OpsWorks Stacks.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack or an attached policy that
  /// explicitly grants permissions. For more information about user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  Future<void> unassignInstance({
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UnassignInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
      },
    );
  }

  /// Unassigns an assigned Amazon EBS volume. The volume remains registered
  /// with the stack. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html">Resource
  /// Management</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [volumeId] :
  /// The volume ID.
  Future<void> unassignVolume({
    @_s.required String volumeId,
  }) async {
    ArgumentError.checkNotNull(volumeId, 'volumeId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UnassignVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeId': volumeId,
      },
    );
  }

  /// Removes tags from a specified stack or layer.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The stack or layer's Amazon Resource Number (ARN).
  ///
  /// Parameter [tagKeys] :
  /// A list of the keys of tags to be removed from a stack or layer.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates a specified app.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Deploy or Manage permissions level for the stack, or an attached policy
  /// that explicitly grants permissions. For more information on user
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [appSource] :
  /// A <code>Source</code> object that specifies the app repository.
  ///
  /// Parameter [attributes] :
  /// One or more user-defined key/value pairs to be added to the stack
  /// attributes.
  ///
  /// Parameter [dataSources] :
  /// The app's data sources.
  ///
  /// Parameter [description] :
  /// A description of the app.
  ///
  /// Parameter [domains] :
  /// The app's virtual host settings, with multiple domains separated by
  /// commas. For example: <code>'www.example.com, example.com'</code>
  ///
  /// Parameter [enableSsl] :
  /// Whether SSL is enabled for the app.
  ///
  /// Parameter [environment] :
  /// An array of <code>EnvironmentVariable</code> objects that specify
  /// environment variables to be associated with the app. After you deploy the
  /// app, these variables are defined on the associated app server
  /// instances.For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html#workingapps-creating-environment">
  /// Environment Variables</a>.
  ///
  /// There is no specific limit on the number of environment variables.
  /// However, the size of the associated data structure - which includes the
  /// variables' names, values, and protected flag values - cannot exceed 20 KB.
  /// This limit should accommodate most if not all use cases. Exceeding it will
  /// cause an exception with the message, "Environment: is too large (maximum
  /// is 20 KB)."
  /// <note>
  /// If you have specified one or more environment variables, you cannot modify
  /// the stack's Chef version.
  /// </note>
  ///
  /// Parameter [name] :
  /// The app name.
  ///
  /// Parameter [sslConfiguration] :
  /// An <code>SslConfiguration</code> object with the SSL configuration.
  ///
  /// Parameter [type] :
  /// The app type.
  Future<void> updateApp({
    @_s.required String appId,
    Source appSource,
    Map<AppAttributesKeys, String> attributes,
    List<DataSource> dataSources,
    String description,
    List<String> domains,
    bool enableSsl,
    List<EnvironmentVariable> environment,
    String name,
    SslConfiguration sslConfiguration,
    AppType type,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateApp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AppId': appId,
        if (appSource != null) 'AppSource': appSource,
        if (attributes != null)
          'Attributes': attributes.map((k, e) => MapEntry(k.toValue(), e)),
        if (dataSources != null) 'DataSources': dataSources,
        if (description != null) 'Description': description,
        if (domains != null) 'Domains': domains,
        if (enableSsl != null) 'EnableSsl': enableSsl,
        if (environment != null) 'Environment': environment,
        if (name != null) 'Name': name,
        if (sslConfiguration != null) 'SslConfiguration': sslConfiguration,
        if (type != null) 'Type': type.toValue(),
      },
    );
  }

  /// Updates a registered Elastic IP address's name. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html">Resource
  /// Management</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [elasticIp] :
  /// The IP address for which you want to update the name.
  ///
  /// Parameter [name] :
  /// The new name.
  Future<void> updateElasticIp({
    @_s.required String elasticIp,
    String name,
  }) async {
    ArgumentError.checkNotNull(elasticIp, 'elasticIp');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateElasticIp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ElasticIp': elasticIp,
        if (name != null) 'Name': name,
      },
    );
  }

  /// Updates a specified instance.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [instanceId] :
  /// The instance ID.
  ///
  /// Parameter [agentVersion] :
  /// The default AWS OpsWorks Stacks agent version. You have the following
  /// options:
  ///
  /// <ul>
  /// <li>
  /// <code>INHERIT</code> - Use the stack's default agent version setting.
  /// </li>
  /// <li>
  /// <i>version_number</i> - Use the specified agent version. This value
  /// overrides the stack's default setting. To update the agent version, you
  /// must edit the instance configuration and specify a new version. AWS
  /// OpsWorks Stacks then automatically installs that version on the instance.
  /// </li>
  /// </ul>
  /// The default setting is <code>INHERIT</code>. To specify an agent version,
  /// you must use the complete version number, not the abbreviated number shown
  /// on the console. For a list of available agent version numbers, call
  /// <a>DescribeAgentVersions</a>.
  ///
  /// AgentVersion cannot be set to Chef 12.2.
  ///
  /// Parameter [amiId] :
  /// The ID of the AMI that was used to create the instance. The value of this
  /// parameter must be the same AMI ID that the instance is already using. You
  /// cannot apply a new AMI to an instance by running UpdateInstance.
  /// UpdateInstance does not work on instances that are using custom AMIs.
  ///
  /// Parameter [architecture] :
  /// The instance architecture. Instance types do not necessarily support both
  /// architectures. For a list of the architectures that are supported by the
  /// different instance types, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance
  /// Families and Types</a>.
  ///
  /// Parameter [autoScalingType] :
  /// For load-based or time-based instances, the type. Windows stacks can use
  /// only time-based instances.
  ///
  /// Parameter [ebsOptimized] :
  /// This property cannot be updated.
  ///
  /// Parameter [hostname] :
  /// The instance host name.
  ///
  /// Parameter [installUpdatesOnBoot] :
  /// Whether to install operating system and package updates when the instance
  /// boots. The default value is <code>true</code>. To control when updates are
  /// installed, set this value to <code>false</code>. You must then update your
  /// instances manually by using <a>CreateDeployment</a> to run the
  /// <code>update_dependencies</code> stack command or by manually running
  /// <code>yum</code> (Amazon Linux) or <code>apt-get</code> (Ubuntu) on the
  /// instances.
  /// <note>
  /// We strongly recommend using the default value of <code>true</code>, to
  /// ensure that your instances have the latest security updates.
  /// </note>
  ///
  /// Parameter [instanceType] :
  /// The instance type, such as <code>t2.micro</code>. For a list of supported
  /// instance types, open the stack in the console, choose <b>Instances</b>,
  /// and choose <b>+ Instance</b>. The <b>Size</b> list contains the currently
  /// supported types. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance
  /// Families and Types</a>. The parameter values that you use to specify the
  /// various types are in the <b>API Name</b> column of the <b>Available
  /// Instance Types</b> table.
  ///
  /// Parameter [layerIds] :
  /// The instance's layer IDs.
  ///
  /// Parameter [os] :
  /// The instance's operating system, which must be set to one of the
  /// following. You cannot update an instance that is using a custom AMI.
  ///
  /// <ul>
  /// <li>
  /// A supported Linux operating system: An Amazon Linux version, such as
  /// <code>Amazon Linux 2018.03</code>, <code>Amazon Linux 2017.09</code>,
  /// <code>Amazon Linux 2017.03</code>, <code>Amazon Linux 2016.09</code>,
  /// <code>Amazon Linux 2016.03</code>, <code>Amazon Linux 2015.09</code>, or
  /// <code>Amazon Linux 2015.03</code>.
  /// </li>
  /// <li>
  /// A supported Ubuntu operating system, such as <code>Ubuntu 16.04
  /// LTS</code>, <code>Ubuntu 14.04 LTS</code>, or <code>Ubuntu 12.04
  /// LTS</code>.
  /// </li>
  /// <li>
  /// <code>CentOS Linux 7</code>
  /// </li>
  /// <li>
  /// <code>Red Hat Enterprise Linux 7</code>
  /// </li>
  /// <li>
  /// A supported Windows operating system, such as <code>Microsoft Windows
  /// Server 2012 R2 Base</code>, <code>Microsoft Windows Server 2012 R2 with
  /// SQL Server Express</code>, <code>Microsoft Windows Server 2012 R2 with SQL
  /// Server Standard</code>, or <code>Microsoft Windows Server 2012 R2 with SQL
  /// Server Web</code>.
  /// </li>
  /// </ul>
  /// For more information about supported operating systems, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html">AWS
  /// OpsWorks Stacks Operating Systems</a>.
  ///
  /// The default option is the current Amazon Linux version. If you set this
  /// parameter to <code>Custom</code>, you must use the AmiId parameter to
  /// specify the custom AMI that you want to use. For more information about
  /// supported operating systems, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html">Operating
  /// Systems</a>. For more information about how to use custom AMIs with
  /// OpsWorks, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html">Using
  /// Custom AMIs</a>.
  /// <note>
  /// You can specify a different Linux operating system for the updated stack,
  /// but you cannot change from Linux to Windows or Windows to Linux.
  /// </note>
  ///
  /// Parameter [sshKeyName] :
  /// The instance's Amazon EC2 key name.
  Future<void> updateInstance({
    @_s.required String instanceId,
    String agentVersion,
    String amiId,
    Architecture architecture,
    AutoScalingType autoScalingType,
    bool ebsOptimized,
    String hostname,
    bool installUpdatesOnBoot,
    String instanceType,
    List<String> layerIds,
    String os,
    String sshKeyName,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceId': instanceId,
        if (agentVersion != null) 'AgentVersion': agentVersion,
        if (amiId != null) 'AmiId': amiId,
        if (architecture != null) 'Architecture': architecture.toValue(),
        if (autoScalingType != null)
          'AutoScalingType': autoScalingType.toValue(),
        if (ebsOptimized != null) 'EbsOptimized': ebsOptimized,
        if (hostname != null) 'Hostname': hostname,
        if (installUpdatesOnBoot != null)
          'InstallUpdatesOnBoot': installUpdatesOnBoot,
        if (instanceType != null) 'InstanceType': instanceType,
        if (layerIds != null) 'LayerIds': layerIds,
        if (os != null) 'Os': os,
        if (sshKeyName != null) 'SshKeyName': sshKeyName,
      },
    );
  }

  /// Updates a specified layer.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [layerId] :
  /// The layer ID.
  ///
  /// Parameter [attributes] :
  /// One or more user-defined key/value pairs to be added to the stack
  /// attributes.
  ///
  /// Parameter [autoAssignElasticIps] :
  /// Whether to automatically assign an <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic
  /// IP address</a> to the layer's instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html">How
  /// to Edit a Layer</a>.
  ///
  /// Parameter [autoAssignPublicIps] :
  /// For stacks that are running in a VPC, whether to automatically assign a
  /// public IP address to the layer's instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html">How
  /// to Edit a Layer</a>.
  ///
  /// Parameter [cloudWatchLogsConfiguration] :
  /// Specifies CloudWatch Logs configuration options for the layer. For more
  /// information, see <a>CloudWatchLogsLogStream</a>.
  ///
  /// Parameter [customInstanceProfileArn] :
  /// The ARN of an IAM profile to be used for all of the layer's EC2 instances.
  /// For more information about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  ///
  /// Parameter [customJson] :
  /// A JSON-formatted string containing custom stack configuration and
  /// deployment attributes to be installed on the layer's instances. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-json-override.html">
  /// Using Custom JSON</a>.
  ///
  /// Parameter [customRecipes] :
  /// A <code>LayerCustomRecipes</code> object that specifies the layer's custom
  /// recipes.
  ///
  /// Parameter [customSecurityGroupIds] :
  /// An array containing the layer's custom security group IDs.
  ///
  /// Parameter [enableAutoHealing] :
  /// Whether to disable auto healing for the layer.
  ///
  /// Parameter [installUpdatesOnBoot] :
  /// Whether to install operating system and package updates when the instance
  /// boots. The default value is <code>true</code>. To control when updates are
  /// installed, set this value to <code>false</code>. You must then update your
  /// instances manually by using <a>CreateDeployment</a> to run the
  /// <code>update_dependencies</code> stack command or manually running
  /// <code>yum</code> (Amazon Linux) or <code>apt-get</code> (Ubuntu) on the
  /// instances.
  /// <note>
  /// We strongly recommend using the default value of <code>true</code>, to
  /// ensure that your instances have the latest security updates.
  /// </note>
  ///
  /// Parameter [lifecycleEventConfiguration] :
  /// <p/>
  ///
  /// Parameter [name] :
  /// The layer name, which is used by the console.
  ///
  /// Parameter [packages] :
  /// An array of <code>Package</code> objects that describe the layer's
  /// packages.
  ///
  /// Parameter [shortname] :
  /// For custom layers only, use this parameter to specify the layer's short
  /// name, which is used internally by AWS OpsWorks Stacks and by Chef. The
  /// short name is also used as the name for the directory where your app files
  /// are installed. It can have a maximum of 200 characters and must be in the
  /// following format: /\A[a-z0-9\-\_\.]+\Z/.
  ///
  /// The built-in layers' short names are defined by AWS OpsWorks Stacks. For
  /// more information, see the <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/layers.html">Layer
  /// Reference</a>
  ///
  /// Parameter [useEbsOptimizedInstances] :
  /// Whether to use Amazon EBS-optimized instances.
  ///
  /// Parameter [volumeConfigurations] :
  /// A <code>VolumeConfigurations</code> object that describes the layer's
  /// Amazon EBS volumes.
  Future<void> updateLayer({
    @_s.required String layerId,
    Map<LayerAttributesKeys, String> attributes,
    bool autoAssignElasticIps,
    bool autoAssignPublicIps,
    CloudWatchLogsConfiguration cloudWatchLogsConfiguration,
    String customInstanceProfileArn,
    String customJson,
    Recipes customRecipes,
    List<String> customSecurityGroupIds,
    bool enableAutoHealing,
    bool installUpdatesOnBoot,
    LifecycleEventConfiguration lifecycleEventConfiguration,
    String name,
    List<String> packages,
    String shortname,
    bool useEbsOptimizedInstances,
    List<VolumeConfiguration> volumeConfigurations,
  }) async {
    ArgumentError.checkNotNull(layerId, 'layerId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateLayer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LayerId': layerId,
        if (attributes != null)
          'Attributes': attributes.map((k, e) => MapEntry(k.toValue(), e)),
        if (autoAssignElasticIps != null)
          'AutoAssignElasticIps': autoAssignElasticIps,
        if (autoAssignPublicIps != null)
          'AutoAssignPublicIps': autoAssignPublicIps,
        if (cloudWatchLogsConfiguration != null)
          'CloudWatchLogsConfiguration': cloudWatchLogsConfiguration,
        if (customInstanceProfileArn != null)
          'CustomInstanceProfileArn': customInstanceProfileArn,
        if (customJson != null) 'CustomJson': customJson,
        if (customRecipes != null) 'CustomRecipes': customRecipes,
        if (customSecurityGroupIds != null)
          'CustomSecurityGroupIds': customSecurityGroupIds,
        if (enableAutoHealing != null) 'EnableAutoHealing': enableAutoHealing,
        if (installUpdatesOnBoot != null)
          'InstallUpdatesOnBoot': installUpdatesOnBoot,
        if (lifecycleEventConfiguration != null)
          'LifecycleEventConfiguration': lifecycleEventConfiguration,
        if (name != null) 'Name': name,
        if (packages != null) 'Packages': packages,
        if (shortname != null) 'Shortname': shortname,
        if (useEbsOptimizedInstances != null)
          'UseEbsOptimizedInstances': useEbsOptimizedInstances,
        if (volumeConfigurations != null)
          'VolumeConfigurations': volumeConfigurations,
      },
    );
  }

  /// Updates a user's SSH public key.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have
  /// self-management enabled or an attached policy that explicitly grants
  /// permissions. For more information about user permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [sshPublicKey] :
  /// The user's SSH public key.
  Future<void> updateMyUserProfile({
    String sshPublicKey,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateMyUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (sshPublicKey != null) 'SshPublicKey': sshPublicKey,
      },
    );
  }

  /// Updates an Amazon RDS instance.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [rdsDbInstanceArn] :
  /// The Amazon RDS instance's ARN.
  ///
  /// Parameter [dbPassword] :
  /// The database password.
  ///
  /// Parameter [dbUser] :
  /// The master user name.
  Future<void> updateRdsDbInstance({
    @_s.required String rdsDbInstanceArn,
    String dbPassword,
    String dbUser,
  }) async {
    ArgumentError.checkNotNull(rdsDbInstanceArn, 'rdsDbInstanceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateRdsDbInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RdsDbInstanceArn': rdsDbInstanceArn,
        if (dbPassword != null) 'DbPassword': dbPassword,
        if (dbUser != null) 'DbUser': dbUser,
      },
    );
  }

  /// Updates a specified stack.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [stackId] :
  /// The stack ID.
  ///
  /// Parameter [agentVersion] :
  /// The default AWS OpsWorks Stacks agent version. You have the following
  /// options:
  ///
  /// <ul>
  /// <li>
  /// Auto-update - Set this parameter to <code>LATEST</code>. AWS OpsWorks
  /// Stacks automatically installs new agent versions on the stack's instances
  /// as soon as they are available.
  /// </li>
  /// <li>
  /// Fixed version - Set this parameter to your preferred agent version. To
  /// update the agent version, you must edit the stack configuration and
  /// specify a new version. AWS OpsWorks Stacks then automatically installs
  /// that version on the stack's instances.
  /// </li>
  /// </ul>
  /// The default setting is <code>LATEST</code>. To specify an agent version,
  /// you must use the complete version number, not the abbreviated number shown
  /// on the console. For a list of available agent version numbers, call
  /// <a>DescribeAgentVersions</a>. AgentVersion cannot be set to Chef 12.2.
  /// <note>
  /// You can also specify an agent version when you create or update an
  /// instance, which overrides the stack's default setting.
  /// </note>
  ///
  /// Parameter [attributes] :
  /// One or more user-defined key-value pairs to be added to the stack
  /// attributes.
  ///
  /// Parameter [chefConfiguration] :
  /// A <code>ChefConfiguration</code> object that specifies whether to enable
  /// Berkshelf and the Berkshelf version on Chef 11.10 stacks. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html">Create
  /// a New Stack</a>.
  ///
  /// Parameter [configurationManager] :
  /// The configuration manager. When you update a stack, we recommend that you
  /// use the configuration manager to specify the Chef version: 12, 11.10, or
  /// 11.4 for Linux stacks, or 12.2 for Windows stacks. The default value for
  /// Linux stacks is currently 12.
  ///
  /// Parameter [customCookbooksSource] :
  /// Contains the information required to retrieve an app or cookbook from a
  /// repository. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html">Adding
  /// Apps</a> or <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html">Cookbooks
  /// and Recipes</a>.
  ///
  /// Parameter [customJson] :
  /// A string that contains user-defined, custom JSON. It can be used to
  /// override the corresponding default stack configuration JSON values or to
  /// pass data to recipes. The string should be in the following format:
  ///
  /// <code>"{\"key1\": \"value1\", \"key2\": \"value2\",...}"</code>
  ///
  /// For more information about custom JSON, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html">Use
  /// Custom JSON to Modify the Stack Configuration Attributes</a>.
  ///
  /// Parameter [defaultAvailabilityZone] :
  /// The stack's default Availability Zone, which must be in the stack's
  /// region. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions
  /// and Endpoints</a>. If you also specify a value for
  /// <code>DefaultSubnetId</code>, the subnet must be in the same zone. For
  /// more information, see <a>CreateStack</a>.
  ///
  /// Parameter [defaultInstanceProfileArn] :
  /// The ARN of an IAM profile that is the default profile for all of the
  /// stack's EC2 instances. For more information about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  ///
  /// Parameter [defaultOs] :
  /// The stack's operating system, which must be set to one of the following:
  ///
  /// <ul>
  /// <li>
  /// A supported Linux operating system: An Amazon Linux version, such as
  /// <code>Amazon Linux 2018.03</code>, <code>Amazon Linux 2017.09</code>,
  /// <code>Amazon Linux 2017.03</code>, <code>Amazon Linux 2016.09</code>,
  /// <code>Amazon Linux 2016.03</code>, <code>Amazon Linux 2015.09</code>, or
  /// <code>Amazon Linux 2015.03</code>.
  /// </li>
  /// <li>
  /// A supported Ubuntu operating system, such as <code>Ubuntu 16.04
  /// LTS</code>, <code>Ubuntu 14.04 LTS</code>, or <code>Ubuntu 12.04
  /// LTS</code>.
  /// </li>
  /// <li>
  /// <code>CentOS Linux 7</code>
  /// </li>
  /// <li>
  /// <code>Red Hat Enterprise Linux 7</code>
  /// </li>
  /// <li>
  /// A supported Windows operating system, such as <code>Microsoft Windows
  /// Server 2012 R2 Base</code>, <code>Microsoft Windows Server 2012 R2 with
  /// SQL Server Express</code>, <code>Microsoft Windows Server 2012 R2 with SQL
  /// Server Standard</code>, or <code>Microsoft Windows Server 2012 R2 with SQL
  /// Server Web</code>.
  /// </li>
  /// <li>
  /// A custom AMI: <code>Custom</code>. You specify the custom AMI you want to
  /// use when you create instances. For more information about how to use
  /// custom AMIs with OpsWorks, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html">Using
  /// Custom AMIs</a>.
  /// </li>
  /// </ul>
  /// The default option is the stack's current operating system. For more
  /// information about supported operating systems, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html">AWS
  /// OpsWorks Stacks Operating Systems</a>.
  ///
  /// Parameter [defaultRootDeviceType] :
  /// The default root device type. This value is used by default for all
  /// instances in the stack, but you can override it when you create an
  /// instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device">Storage
  /// for the Root Device</a>.
  ///
  /// Parameter [defaultSshKeyName] :
  /// A default Amazon EC2 key-pair name. The default value is
  /// <code>none</code>. If you specify a key-pair name, AWS OpsWorks Stacks
  /// installs the public key on the instance and you can use the private key
  /// with an SSH client to log in to the instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-ssh.html">
  /// Using SSH to Communicate with an Instance</a> and <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/security-ssh-access.html">
  /// Managing SSH Access</a>. You can override this setting by specifying a
  /// different key pair, or no key pair, when you <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-add.html">
  /// create an instance</a>.
  ///
  /// Parameter [defaultSubnetId] :
  /// The stack's default VPC subnet ID. This parameter is required if you
  /// specify a value for the <code>VpcId</code> parameter. All instances are
  /// launched into this subnet unless you specify otherwise when you create the
  /// instance. If you also specify a value for
  /// <code>DefaultAvailabilityZone</code>, the subnet must be in that zone. For
  /// information on default values and when this parameter is required, see the
  /// <code>VpcId</code> parameter description.
  ///
  /// Parameter [hostnameTheme] :
  /// The stack's new host name theme, with spaces replaced by underscores. The
  /// theme is used to generate host names for the stack's instances. By
  /// default, <code>HostnameTheme</code> is set to
  /// <code>Layer_Dependent</code>, which creates host names by appending
  /// integers to the layer's short name. The other themes are:
  ///
  /// <ul>
  /// <li>
  /// <code>Baked_Goods</code>
  /// </li>
  /// <li>
  /// <code>Clouds</code>
  /// </li>
  /// <li>
  /// <code>Europe_Cities</code>
  /// </li>
  /// <li>
  /// <code>Fruits</code>
  /// </li>
  /// <li>
  /// <code>Greek_Deities_and_Titans</code>
  /// </li>
  /// <li>
  /// <code>Legendary_creatures_from_Japan</code>
  /// </li>
  /// <li>
  /// <code>Planets_and_Moons</code>
  /// </li>
  /// <li>
  /// <code>Roman_Deities</code>
  /// </li>
  /// <li>
  /// <code>Scottish_Islands</code>
  /// </li>
  /// <li>
  /// <code>US_Cities</code>
  /// </li>
  /// <li>
  /// <code>Wild_Cats</code>
  /// </li>
  /// </ul>
  /// To obtain a generated host name, call <code>GetHostNameSuggestion</code>,
  /// which returns a host name based on the current theme.
  ///
  /// Parameter [name] :
  /// The stack's new name.
  ///
  /// Parameter [serviceRoleArn] :
  /// Do not use this parameter. You cannot update a stack's service role.
  ///
  /// Parameter [useCustomCookbooks] :
  /// Whether the stack uses custom cookbooks.
  ///
  /// Parameter [useOpsworksSecurityGroups] :
  /// Whether to associate the AWS OpsWorks Stacks built-in security groups with
  /// the stack's layers.
  ///
  /// AWS OpsWorks Stacks provides a standard set of built-in security groups,
  /// one for each layer, which are associated with layers by default.
  /// <code>UseOpsworksSecurityGroups</code> allows you to provide your own
  /// custom security groups instead of using the built-in groups.
  /// <code>UseOpsworksSecurityGroups</code> has the following settings:
  ///
  /// <ul>
  /// <li>
  /// True - AWS OpsWorks Stacks automatically associates the appropriate
  /// built-in security group with each layer (default setting). You can
  /// associate additional security groups with a layer after you create it, but
  /// you cannot delete the built-in security group.
  /// </li>
  /// <li>
  /// False - AWS OpsWorks Stacks does not associate built-in security groups
  /// with layers. You must create appropriate EC2 security groups and associate
  /// a security group with each layer that you create. However, you can still
  /// manually associate a built-in security group with a layer on. Custom
  /// security groups are required only for those layers that need custom
  /// settings.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html">Create
  /// a New Stack</a>.
  Future<void> updateStack({
    @_s.required String stackId,
    String agentVersion,
    Map<StackAttributesKeys, String> attributes,
    ChefConfiguration chefConfiguration,
    StackConfigurationManager configurationManager,
    Source customCookbooksSource,
    String customJson,
    String defaultAvailabilityZone,
    String defaultInstanceProfileArn,
    String defaultOs,
    RootDeviceType defaultRootDeviceType,
    String defaultSshKeyName,
    String defaultSubnetId,
    String hostnameTheme,
    String name,
    String serviceRoleArn,
    bool useCustomCookbooks,
    bool useOpsworksSecurityGroups,
  }) async {
    ArgumentError.checkNotNull(stackId, 'stackId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateStack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StackId': stackId,
        if (agentVersion != null) 'AgentVersion': agentVersion,
        if (attributes != null)
          'Attributes': attributes.map((k, e) => MapEntry(k.toValue(), e)),
        if (chefConfiguration != null) 'ChefConfiguration': chefConfiguration,
        if (configurationManager != null)
          'ConfigurationManager': configurationManager,
        if (customCookbooksSource != null)
          'CustomCookbooksSource': customCookbooksSource,
        if (customJson != null) 'CustomJson': customJson,
        if (defaultAvailabilityZone != null)
          'DefaultAvailabilityZone': defaultAvailabilityZone,
        if (defaultInstanceProfileArn != null)
          'DefaultInstanceProfileArn': defaultInstanceProfileArn,
        if (defaultOs != null) 'DefaultOs': defaultOs,
        if (defaultRootDeviceType != null)
          'DefaultRootDeviceType': defaultRootDeviceType.toValue(),
        if (defaultSshKeyName != null) 'DefaultSshKeyName': defaultSshKeyName,
        if (defaultSubnetId != null) 'DefaultSubnetId': defaultSubnetId,
        if (hostnameTheme != null) 'HostnameTheme': hostnameTheme,
        if (name != null) 'Name': name,
        if (serviceRoleArn != null) 'ServiceRoleArn': serviceRoleArn,
        if (useCustomCookbooks != null)
          'UseCustomCookbooks': useCustomCookbooks,
        if (useOpsworksSecurityGroups != null)
          'UseOpsworksSecurityGroups': useOpsworksSecurityGroups,
      },
    );
  }

  /// Updates a specified user profile.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have an
  /// attached policy that explicitly grants permissions. For more information
  /// about user permissions, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [iamUserArn] :
  /// The user IAM ARN. This can also be a federated user's ARN.
  ///
  /// Parameter [allowSelfManagement] :
  /// Whether users can specify their own SSH public key through the My Settings
  /// page. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/security-settingsshkey.html">Managing
  /// User Permissions</a>.
  ///
  /// Parameter [sshPublicKey] :
  /// The user's new SSH public key.
  ///
  /// Parameter [sshUsername] :
  /// The user's SSH user name. The allowable characters are [a-z], [A-Z],
  /// [0-9], '-', and '_'. If the specified name includes other punctuation
  /// marks, AWS OpsWorks Stacks removes them. For example, <code>my.name</code>
  /// will be changed to <code>myname</code>. If you do not specify an SSH user
  /// name, AWS OpsWorks Stacks generates one from the IAM user name.
  Future<void> updateUserProfile({
    @_s.required String iamUserArn,
    bool allowSelfManagement,
    String sshPublicKey,
    String sshUsername,
  }) async {
    ArgumentError.checkNotNull(iamUserArn, 'iamUserArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IamUserArn': iamUserArn,
        if (allowSelfManagement != null)
          'AllowSelfManagement': allowSelfManagement,
        if (sshPublicKey != null) 'SshPublicKey': sshPublicKey,
        if (sshUsername != null) 'SshUsername': sshUsername,
      },
    );
  }

  /// Updates an Amazon EBS volume's name or mount point. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html">Resource
  /// Management</a>.
  ///
  /// <b>Required Permissions</b>: To use this action, an IAM user must have a
  /// Manage permissions level for the stack, or an attached policy that
  /// explicitly grants permissions. For more information on user permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [volumeId] :
  /// The volume ID.
  ///
  /// Parameter [mountPoint] :
  /// The new mount point.
  ///
  /// Parameter [name] :
  /// The new name.
  Future<void> updateVolume({
    @_s.required String volumeId,
    String mountPoint,
    String name,
  }) async {
    ArgumentError.checkNotNull(volumeId, 'volumeId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeId': volumeId,
        if (mountPoint != null) 'MountPoint': mountPoint,
        if (name != null) 'Name': name,
      },
    );
  }
}

/// Describes an agent version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AgentVersion {
  /// The configuration manager.
  @_s.JsonKey(name: 'ConfigurationManager')
  final StackConfigurationManager configurationManager;

  /// The agent version.
  @_s.JsonKey(name: 'Version')
  final String version;

  AgentVersion({
    this.configurationManager,
    this.version,
  });
  factory AgentVersion.fromJson(Map<String, dynamic> json) =>
      _$AgentVersionFromJson(json);
}

/// A description of the app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class App {
  /// The app ID.
  @_s.JsonKey(name: 'AppId')
  final String appId;

  /// A <code>Source</code> object that describes the app repository.
  @_s.JsonKey(name: 'AppSource')
  final Source appSource;

  /// The stack attributes.
  @_s.JsonKey(name: 'Attributes')
  final Map<AppAttributesKeys, String> attributes;

  /// When the app was created.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// The app's data sources.
  @_s.JsonKey(name: 'DataSources')
  final List<DataSource> dataSources;

  /// A description of the app.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The app vhost settings with multiple domains separated by commas. For
  /// example: <code>'www.example.com, example.com'</code>
  @_s.JsonKey(name: 'Domains')
  final List<String> domains;

  /// Whether to enable SSL for the app.
  @_s.JsonKey(name: 'EnableSsl')
  final bool enableSsl;

  /// An array of <code>EnvironmentVariable</code> objects that specify
  /// environment variables to be associated with the app. After you deploy the
  /// app, these variables are defined on the associated app server instances. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html#workingapps-creating-environment">
  /// Environment Variables</a>.
  /// <note>
  /// There is no specific limit on the number of environment variables. However,
  /// the size of the associated data structure - which includes the variable
  /// names, values, and protected flag values - cannot exceed 20 KB. This limit
  /// should accommodate most if not all use cases, but if you do exceed it, you
  /// will cause an exception (API) with an "Environment: is too large (maximum is
  /// 20 KB)" message.
  /// </note>
  @_s.JsonKey(name: 'Environment')
  final List<EnvironmentVariable> environment;

  /// The app name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The app's short name.
  @_s.JsonKey(name: 'Shortname')
  final String shortname;

  /// An <code>SslConfiguration</code> object with the SSL configuration.
  @_s.JsonKey(name: 'SslConfiguration')
  final SslConfiguration sslConfiguration;

  /// The app stack ID.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  /// The app type.
  @_s.JsonKey(name: 'Type')
  final AppType type;

  App({
    this.appId,
    this.appSource,
    this.attributes,
    this.createdAt,
    this.dataSources,
    this.description,
    this.domains,
    this.enableSsl,
    this.environment,
    this.name,
    this.shortname,
    this.sslConfiguration,
    this.stackId,
    this.type,
  });
  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
}

enum AppAttributesKeys {
  @_s.JsonValue('DocumentRoot')
  documentRoot,
  @_s.JsonValue('RailsEnv')
  railsEnv,
  @_s.JsonValue('AutoBundleOnDeploy')
  autoBundleOnDeploy,
  @_s.JsonValue('AwsFlowRubySettings')
  awsFlowRubySettings,
}

extension on AppAttributesKeys {
  String toValue() {
    switch (this) {
      case AppAttributesKeys.documentRoot:
        return 'DocumentRoot';
      case AppAttributesKeys.railsEnv:
        return 'RailsEnv';
      case AppAttributesKeys.autoBundleOnDeploy:
        return 'AutoBundleOnDeploy';
      case AppAttributesKeys.awsFlowRubySettings:
        return 'AwsFlowRubySettings';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum AppType {
  @_s.JsonValue('aws-flow-ruby')
  awsFlowRuby,
  @_s.JsonValue('java')
  java,
  @_s.JsonValue('rails')
  rails,
  @_s.JsonValue('php')
  php,
  @_s.JsonValue('nodejs')
  nodejs,
  @_s.JsonValue('static')
  static,
  @_s.JsonValue('other')
  other,
}

extension on AppType {
  String toValue() {
    switch (this) {
      case AppType.awsFlowRuby:
        return 'aws-flow-ruby';
      case AppType.java:
        return 'java';
      case AppType.rails:
        return 'rails';
      case AppType.php:
        return 'php';
      case AppType.nodejs:
        return 'nodejs';
      case AppType.static:
        return 'static';
      case AppType.other:
        return 'other';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum Architecture {
  @_s.JsonValue('x86_64')
  x86_64,
  @_s.JsonValue('i386')
  i386,
}

extension on Architecture {
  String toValue() {
    switch (this) {
      case Architecture.x86_64:
        return 'x86_64';
      case Architecture.i386:
        return 'i386';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a load-based auto scaling upscaling or downscaling threshold
/// configuration, which specifies when AWS OpsWorks Stacks starts or stops
/// load-based instances.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoScalingThresholds {
  /// Custom Cloudwatch auto scaling alarms, to be used as thresholds. This
  /// parameter takes a list of up to five alarm names, which are case sensitive
  /// and must be in the same region as the stack.
  /// <note>
  /// To use custom alarms, you must update your service role to allow
  /// <code>cloudwatch:DescribeAlarms</code>. You can either have AWS OpsWorks
  /// Stacks update the role for you when you first use this feature or you can
  /// edit the role manually. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-servicerole.html">Allowing
  /// AWS OpsWorks Stacks to Act on Your Behalf</a>.
  /// </note>
  @_s.JsonKey(name: 'Alarms')
  final List<String> alarms;

  /// The CPU utilization threshold, as a percent of the available CPU. A value of
  /// -1 disables the threshold.
  @_s.JsonKey(name: 'CpuThreshold')
  final double cpuThreshold;

  /// The amount of time (in minutes) after a scaling event occurs that AWS
  /// OpsWorks Stacks should ignore metrics and suppress additional scaling
  /// events. For example, AWS OpsWorks Stacks adds new instances following an
  /// upscaling event but the instances won't start reducing the load until they
  /// have been booted and configured. There is no point in raising additional
  /// scaling events during that operation, which typically takes several minutes.
  /// <code>IgnoreMetricsTime</code> allows you to direct AWS OpsWorks Stacks to
  /// suppress scaling events long enough to get the new instances online.
  @_s.JsonKey(name: 'IgnoreMetricsTime')
  final int ignoreMetricsTime;

  /// The number of instances to add or remove when the load exceeds a threshold.
  @_s.JsonKey(name: 'InstanceCount')
  final int instanceCount;

  /// The load threshold. A value of -1 disables the threshold. For more
  /// information about how load is computed, see <a
  /// href="http://en.wikipedia.org/wiki/Load_%28computing%29">Load
  /// (computing)</a>.
  @_s.JsonKey(name: 'LoadThreshold')
  final double loadThreshold;

  /// The memory utilization threshold, as a percent of the available memory. A
  /// value of -1 disables the threshold.
  @_s.JsonKey(name: 'MemoryThreshold')
  final double memoryThreshold;

  /// The amount of time, in minutes, that the load must exceed a threshold before
  /// more instances are added or removed.
  @_s.JsonKey(name: 'ThresholdsWaitTime')
  final int thresholdsWaitTime;

  AutoScalingThresholds({
    this.alarms,
    this.cpuThreshold,
    this.ignoreMetricsTime,
    this.instanceCount,
    this.loadThreshold,
    this.memoryThreshold,
    this.thresholdsWaitTime,
  });
  factory AutoScalingThresholds.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingThresholdsFromJson(json);

  Map<String, dynamic> toJson() => _$AutoScalingThresholdsToJson(this);
}

enum AutoScalingType {
  @_s.JsonValue('load')
  load,
  @_s.JsonValue('timer')
  timer,
}

extension on AutoScalingType {
  String toValue() {
    switch (this) {
      case AutoScalingType.load:
        return 'load';
      case AutoScalingType.timer:
        return 'timer';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a block device mapping. This data type maps directly to the Amazon
/// EC2 <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_BlockDeviceMapping.html">BlockDeviceMapping</a>
/// data type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BlockDeviceMapping {
  /// The device name that is exposed to the instance, such as
  /// <code>/dev/sdh</code>. For the root device, you can use the explicit device
  /// name or you can set this parameter to <code>ROOT_DEVICE</code> and AWS
  /// OpsWorks Stacks will provide the correct device name.
  @_s.JsonKey(name: 'DeviceName')
  final String deviceName;

  /// An <code>EBSBlockDevice</code> that defines how to configure an Amazon EBS
  /// volume when the instance is launched.
  @_s.JsonKey(name: 'Ebs')
  final EbsBlockDevice ebs;

  /// Suppresses the specified device included in the AMI's block device mapping.
  @_s.JsonKey(name: 'NoDevice')
  final String noDevice;

  /// The virtual device name. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_BlockDeviceMapping.html">BlockDeviceMapping</a>.
  @_s.JsonKey(name: 'VirtualName')
  final String virtualName;

  BlockDeviceMapping({
    this.deviceName,
    this.ebs,
    this.noDevice,
    this.virtualName,
  });
  factory BlockDeviceMapping.fromJson(Map<String, dynamic> json) =>
      _$BlockDeviceMappingFromJson(json);

  Map<String, dynamic> toJson() => _$BlockDeviceMappingToJson(this);
}

/// Describes the Chef configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ChefConfiguration {
  /// The Berkshelf version.
  @_s.JsonKey(name: 'BerkshelfVersion')
  final String berkshelfVersion;

  /// Whether to enable Berkshelf.
  @_s.JsonKey(name: 'ManageBerkshelf')
  final bool manageBerkshelf;

  ChefConfiguration({
    this.berkshelfVersion,
    this.manageBerkshelf,
  });
  factory ChefConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ChefConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ChefConfigurationToJson(this);
}

/// Contains the response to a <code>CloneStack</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloneStackResult {
  /// The cloned stack ID.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  CloneStackResult({
    this.stackId,
  });
  factory CloneStackResult.fromJson(Map<String, dynamic> json) =>
      _$CloneStackResultFromJson(json);
}

/// Describes the Amazon CloudWatch logs configuration for a layer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudWatchLogsConfiguration {
  /// Whether CloudWatch Logs is enabled for a layer.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// A list of configuration options for CloudWatch Logs.
  @_s.JsonKey(name: 'LogStreams')
  final List<CloudWatchLogsLogStream> logStreams;

  CloudWatchLogsConfiguration({
    this.enabled,
    this.logStreams,
  });
  factory CloudWatchLogsConfiguration.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchLogsConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$CloudWatchLogsConfigurationToJson(this);
}

/// Specifies the encoding of the log file so that the file can be read
/// correctly. The default is <code>utf_8</code>. Encodings supported by Python
/// <code>codecs.decode()</code> can be used here.
enum CloudWatchLogsEncoding {
  @_s.JsonValue('ascii')
  ascii,
  @_s.JsonValue('big5')
  big5,
  @_s.JsonValue('big5hkscs')
  big5hkscs,
  @_s.JsonValue('cp037')
  cp037,
  @_s.JsonValue('cp424')
  cp424,
  @_s.JsonValue('cp437')
  cp437,
  @_s.JsonValue('cp500')
  cp500,
  @_s.JsonValue('cp720')
  cp720,
  @_s.JsonValue('cp737')
  cp737,
  @_s.JsonValue('cp775')
  cp775,
  @_s.JsonValue('cp850')
  cp850,
  @_s.JsonValue('cp852')
  cp852,
  @_s.JsonValue('cp855')
  cp855,
  @_s.JsonValue('cp856')
  cp856,
  @_s.JsonValue('cp857')
  cp857,
  @_s.JsonValue('cp858')
  cp858,
  @_s.JsonValue('cp860')
  cp860,
  @_s.JsonValue('cp861')
  cp861,
  @_s.JsonValue('cp862')
  cp862,
  @_s.JsonValue('cp863')
  cp863,
  @_s.JsonValue('cp864')
  cp864,
  @_s.JsonValue('cp865')
  cp865,
  @_s.JsonValue('cp866')
  cp866,
  @_s.JsonValue('cp869')
  cp869,
  @_s.JsonValue('cp874')
  cp874,
  @_s.JsonValue('cp875')
  cp875,
  @_s.JsonValue('cp932')
  cp932,
  @_s.JsonValue('cp949')
  cp949,
  @_s.JsonValue('cp950')
  cp950,
  @_s.JsonValue('cp1006')
  cp1006,
  @_s.JsonValue('cp1026')
  cp1026,
  @_s.JsonValue('cp1140')
  cp1140,
  @_s.JsonValue('cp1250')
  cp1250,
  @_s.JsonValue('cp1251')
  cp1251,
  @_s.JsonValue('cp1252')
  cp1252,
  @_s.JsonValue('cp1253')
  cp1253,
  @_s.JsonValue('cp1254')
  cp1254,
  @_s.JsonValue('cp1255')
  cp1255,
  @_s.JsonValue('cp1256')
  cp1256,
  @_s.JsonValue('cp1257')
  cp1257,
  @_s.JsonValue('cp1258')
  cp1258,
  @_s.JsonValue('euc_jp')
  eucJp,
  @_s.JsonValue('euc_jis_2004')
  eucJis_2004,
  @_s.JsonValue('euc_jisx0213')
  eucJisx0213,
  @_s.JsonValue('euc_kr')
  eucKr,
  @_s.JsonValue('gb2312')
  gb2312,
  @_s.JsonValue('gbk')
  gbk,
  @_s.JsonValue('gb18030')
  gb18030,
  @_s.JsonValue('hz')
  hz,
  @_s.JsonValue('iso2022_jp')
  iso2022Jp,
  @_s.JsonValue('iso2022_jp_1')
  iso2022Jp_1,
  @_s.JsonValue('iso2022_jp_2')
  iso2022Jp_2,
  @_s.JsonValue('iso2022_jp_2004')
  iso2022Jp_2004,
  @_s.JsonValue('iso2022_jp_3')
  iso2022Jp_3,
  @_s.JsonValue('iso2022_jp_ext')
  iso2022JpExt,
  @_s.JsonValue('iso2022_kr')
  iso2022Kr,
  @_s.JsonValue('latin_1')
  latin_1,
  @_s.JsonValue('iso8859_2')
  iso8859_2,
  @_s.JsonValue('iso8859_3')
  iso8859_3,
  @_s.JsonValue('iso8859_4')
  iso8859_4,
  @_s.JsonValue('iso8859_5')
  iso8859_5,
  @_s.JsonValue('iso8859_6')
  iso8859_6,
  @_s.JsonValue('iso8859_7')
  iso8859_7,
  @_s.JsonValue('iso8859_8')
  iso8859_8,
  @_s.JsonValue('iso8859_9')
  iso8859_9,
  @_s.JsonValue('iso8859_10')
  iso8859_10,
  @_s.JsonValue('iso8859_13')
  iso8859_13,
  @_s.JsonValue('iso8859_14')
  iso8859_14,
  @_s.JsonValue('iso8859_15')
  iso8859_15,
  @_s.JsonValue('iso8859_16')
  iso8859_16,
  @_s.JsonValue('johab')
  johab,
  @_s.JsonValue('koi8_r')
  koi8R,
  @_s.JsonValue('koi8_u')
  koi8U,
  @_s.JsonValue('mac_cyrillic')
  macCyrillic,
  @_s.JsonValue('mac_greek')
  macGreek,
  @_s.JsonValue('mac_iceland')
  macIceland,
  @_s.JsonValue('mac_latin2')
  macLatin2,
  @_s.JsonValue('mac_roman')
  macRoman,
  @_s.JsonValue('mac_turkish')
  macTurkish,
  @_s.JsonValue('ptcp154')
  ptcp154,
  @_s.JsonValue('shift_jis')
  shiftJis,
  @_s.JsonValue('shift_jis_2004')
  shiftJis_2004,
  @_s.JsonValue('shift_jisx0213')
  shiftJisx0213,
  @_s.JsonValue('utf_32')
  utf_32,
  @_s.JsonValue('utf_32_be')
  utf_32Be,
  @_s.JsonValue('utf_32_le')
  utf_32Le,
  @_s.JsonValue('utf_16')
  utf_16,
  @_s.JsonValue('utf_16_be')
  utf_16Be,
  @_s.JsonValue('utf_16_le')
  utf_16Le,
  @_s.JsonValue('utf_7')
  utf_7,
  @_s.JsonValue('utf_8')
  utf_8,
  @_s.JsonValue('utf_8_sig')
  utf_8Sig,
}

/// Specifies where to start to read data (start_of_file or end_of_file). The
/// default is start_of_file. It's only used if there is no state persisted for
/// that log stream.
enum CloudWatchLogsInitialPosition {
  @_s.JsonValue('start_of_file')
  startOfFile,
  @_s.JsonValue('end_of_file')
  endOfFile,
}

/// Describes the Amazon CloudWatch logs configuration for a layer. For detailed
/// information about members of this data type, see the <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AgentReference.html">CloudWatch
/// Logs Agent Reference</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudWatchLogsLogStream {
  /// Specifies the max number of log events in a batch, up to 10000. The default
  /// value is 1000.
  @_s.JsonKey(name: 'BatchCount')
  final int batchCount;

  /// Specifies the maximum size of log events in a batch, in bytes, up to 1048576
  /// bytes. The default value is 32768 bytes. This size is calculated as the sum
  /// of all event messages in UTF-8, plus 26 bytes for each log event.
  @_s.JsonKey(name: 'BatchSize')
  final int batchSize;

  /// Specifies the time duration for the batching of log events. The minimum
  /// value is 5000ms and default value is 5000ms.
  @_s.JsonKey(name: 'BufferDuration')
  final int bufferDuration;

  /// Specifies how the time stamp is extracted from logs. For more information,
  /// see the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AgentReference.html">CloudWatch
  /// Logs Agent Reference</a>.
  @_s.JsonKey(name: 'DatetimeFormat')
  final String datetimeFormat;

  /// Specifies the encoding of the log file so that the file can be read
  /// correctly. The default is <code>utf_8</code>. Encodings supported by Python
  /// <code>codecs.decode()</code> can be used here.
  @_s.JsonKey(name: 'Encoding')
  final CloudWatchLogsEncoding encoding;

  /// Specifies log files that you want to push to CloudWatch Logs.
  ///
  /// <code>File</code> can point to a specific file or multiple files (by using
  /// wild card characters such as <code>/var/log/system.log*</code>). Only the
  /// latest file is pushed to CloudWatch Logs, based on file modification time.
  /// We recommend that you use wild card characters to specify a series of files
  /// of the same type, such as <code>access_log.2014-06-01-01</code>,
  /// <code>access_log.2014-06-01-02</code>, and so on by using a pattern like
  /// <code>access_log.*</code>. Don't use a wildcard to match multiple file
  /// types, such as <code>access_log_80</code> and <code>access_log_443</code>.
  /// To specify multiple, different file types, add another log stream entry to
  /// the configuration file, so that each log file type is stored in a different
  /// log group.
  ///
  /// Zipped files are not supported.
  @_s.JsonKey(name: 'File')
  final String file;

  /// Specifies the range of lines for identifying a file. The valid values are
  /// one number, or two dash-delimited numbers, such as '1', '2-5'. The default
  /// value is '1', meaning the first line is used to calculate the fingerprint.
  /// Fingerprint lines are not sent to CloudWatch Logs unless all specified lines
  /// are available.
  @_s.JsonKey(name: 'FileFingerprintLines')
  final String fileFingerprintLines;

  /// Specifies where to start to read data (start_of_file or end_of_file). The
  /// default is start_of_file. This setting is only used if there is no state
  /// persisted for that log stream.
  @_s.JsonKey(name: 'InitialPosition')
  final CloudWatchLogsInitialPosition initialPosition;

  /// Specifies the destination log group. A log group is created automatically if
  /// it doesn't already exist. Log group names can be between 1 and 512
  /// characters long. Allowed characters include a-z, A-Z, 0-9, '_' (underscore),
  /// '-' (hyphen), '/' (forward slash), and '.' (period).
  @_s.JsonKey(name: 'LogGroupName')
  final String logGroupName;

  /// Specifies the pattern for identifying the start of a log message.
  @_s.JsonKey(name: 'MultiLineStartPattern')
  final String multiLineStartPattern;

  /// Specifies the time zone of log event time stamps.
  @_s.JsonKey(name: 'TimeZone')
  final CloudWatchLogsTimeZone timeZone;

  CloudWatchLogsLogStream({
    this.batchCount,
    this.batchSize,
    this.bufferDuration,
    this.datetimeFormat,
    this.encoding,
    this.file,
    this.fileFingerprintLines,
    this.initialPosition,
    this.logGroupName,
    this.multiLineStartPattern,
    this.timeZone,
  });
  factory CloudWatchLogsLogStream.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchLogsLogStreamFromJson(json);

  Map<String, dynamic> toJson() => _$CloudWatchLogsLogStreamToJson(this);
}

/// The preferred time zone for logs streamed to CloudWatch Logs. Valid values
/// are <code>LOCAL</code> and <code>UTC</code>, for Coordinated Universal Time.
enum CloudWatchLogsTimeZone {
  @_s.JsonValue('LOCAL')
  local,
  @_s.JsonValue('UTC')
  utc,
}

/// Describes a command.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Command {
  /// Date and time when the command was acknowledged.
  @_s.JsonKey(name: 'AcknowledgedAt')
  final String acknowledgedAt;

  /// The command ID.
  @_s.JsonKey(name: 'CommandId')
  final String commandId;

  /// Date when the command completed.
  @_s.JsonKey(name: 'CompletedAt')
  final String completedAt;

  /// Date and time when the command was run.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// The command deployment ID.
  @_s.JsonKey(name: 'DeploymentId')
  final String deploymentId;

  /// The command exit code.
  @_s.JsonKey(name: 'ExitCode')
  final int exitCode;

  /// The ID of the instance where the command was executed.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The URL of the command log.
  @_s.JsonKey(name: 'LogUrl')
  final String logUrl;

  /// The command status:
  ///
  /// <ul>
  /// <li>
  /// failed
  /// </li>
  /// <li>
  /// successful
  /// </li>
  /// <li>
  /// skipped
  /// </li>
  /// <li>
  /// pending
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The command type:
  ///
  /// <ul>
  /// <li>
  /// <code>configure</code>
  /// </li>
  /// <li>
  /// <code>deploy</code>
  /// </li>
  /// <li>
  /// <code>execute_recipes</code>
  /// </li>
  /// <li>
  /// <code>install_dependencies</code>
  /// </li>
  /// <li>
  /// <code>restart</code>
  /// </li>
  /// <li>
  /// <code>rollback</code>
  /// </li>
  /// <li>
  /// <code>setup</code>
  /// </li>
  /// <li>
  /// <code>start</code>
  /// </li>
  /// <li>
  /// <code>stop</code>
  /// </li>
  /// <li>
  /// <code>undeploy</code>
  /// </li>
  /// <li>
  /// <code>update_custom_cookbooks</code>
  /// </li>
  /// <li>
  /// <code>update_dependencies</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final String type;

  Command({
    this.acknowledgedAt,
    this.commandId,
    this.completedAt,
    this.createdAt,
    this.deploymentId,
    this.exitCode,
    this.instanceId,
    this.logUrl,
    this.status,
    this.type,
  });
  factory Command.fromJson(Map<String, dynamic> json) =>
      _$CommandFromJson(json);
}

/// Contains the response to a <code>CreateApp</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAppResult {
  /// The app ID.
  @_s.JsonKey(name: 'AppId')
  final String appId;

  CreateAppResult({
    this.appId,
  });
  factory CreateAppResult.fromJson(Map<String, dynamic> json) =>
      _$CreateAppResultFromJson(json);
}

/// Contains the response to a <code>CreateDeployment</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeploymentResult {
  /// The deployment ID, which can be used with other requests to identify the
  /// deployment.
  @_s.JsonKey(name: 'DeploymentId')
  final String deploymentId;

  CreateDeploymentResult({
    this.deploymentId,
  });
  factory CreateDeploymentResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDeploymentResultFromJson(json);
}

/// Contains the response to a <code>CreateInstance</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInstanceResult {
  /// The instance ID.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  CreateInstanceResult({
    this.instanceId,
  });
  factory CreateInstanceResult.fromJson(Map<String, dynamic> json) =>
      _$CreateInstanceResultFromJson(json);
}

/// Contains the response to a <code>CreateLayer</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLayerResult {
  /// The layer ID.
  @_s.JsonKey(name: 'LayerId')
  final String layerId;

  CreateLayerResult({
    this.layerId,
  });
  factory CreateLayerResult.fromJson(Map<String, dynamic> json) =>
      _$CreateLayerResultFromJson(json);
}

/// Contains the response to a <code>CreateStack</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateStackResult {
  /// The stack ID, which is an opaque string that you use to identify the stack
  /// when performing actions such as <code>DescribeStacks</code>.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  CreateStackResult({
    this.stackId,
  });
  factory CreateStackResult.fromJson(Map<String, dynamic> json) =>
      _$CreateStackResultFromJson(json);
}

/// Contains the response to a <code>CreateUserProfile</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserProfileResult {
  /// The user's IAM ARN.
  @_s.JsonKey(name: 'IamUserArn')
  final String iamUserArn;

  CreateUserProfileResult({
    this.iamUserArn,
  });
  factory CreateUserProfileResult.fromJson(Map<String, dynamic> json) =>
      _$CreateUserProfileResultFromJson(json);
}

/// Describes an app's data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataSource {
  /// The data source's ARN.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The database name.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The data source's type, <code>AutoSelectOpsworksMysqlInstance</code>,
  /// <code>OpsworksMysqlInstance</code>, <code>RdsDbInstance</code>, or
  /// <code>None</code>.
  @_s.JsonKey(name: 'Type')
  final String type;

  DataSource({
    this.arn,
    this.databaseName,
    this.type,
  });
  factory DataSource.fromJson(Map<String, dynamic> json) =>
      _$DataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceToJson(this);
}

/// Describes a deployment of a stack or app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Deployment {
  /// The app ID.
  @_s.JsonKey(name: 'AppId')
  final String appId;

  /// Used to specify a stack or deployment command.
  @_s.JsonKey(name: 'Command')
  final DeploymentCommand command;

  /// A user-defined comment.
  @_s.JsonKey(name: 'Comment')
  final String comment;

  /// Date when the deployment completed.
  @_s.JsonKey(name: 'CompletedAt')
  final String completedAt;

  /// Date when the deployment was created.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// A string that contains user-defined custom JSON. It can be used to override
  /// the corresponding default stack configuration attribute values for stack or
  /// to pass data to recipes. The string should be in the following format:
  ///
  /// <code>"{\"key1\": \"value1\", \"key2\": \"value2\",...}"</code>
  ///
  /// For more information on custom JSON, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html">Use
  /// Custom JSON to Modify the Stack Configuration Attributes</a>.
  @_s.JsonKey(name: 'CustomJson')
  final String customJson;

  /// The deployment ID.
  @_s.JsonKey(name: 'DeploymentId')
  final String deploymentId;

  /// The deployment duration.
  @_s.JsonKey(name: 'Duration')
  final int duration;

  /// The user's IAM ARN.
  @_s.JsonKey(name: 'IamUserArn')
  final String iamUserArn;

  /// The IDs of the target instances.
  @_s.JsonKey(name: 'InstanceIds')
  final List<String> instanceIds;

  /// The stack ID.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  /// The deployment status:
  ///
  /// <ul>
  /// <li>
  /// running
  /// </li>
  /// <li>
  /// successful
  /// </li>
  /// <li>
  /// failed
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final String status;

  Deployment({
    this.appId,
    this.command,
    this.comment,
    this.completedAt,
    this.createdAt,
    this.customJson,
    this.deploymentId,
    this.duration,
    this.iamUserArn,
    this.instanceIds,
    this.stackId,
    this.status,
  });
  factory Deployment.fromJson(Map<String, dynamic> json) =>
      _$DeploymentFromJson(json);
}

/// Used to specify a stack or deployment command.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeploymentCommand {
  /// Specifies the operation. You can specify only one command.
  ///
  /// For stacks, the following commands are available:
  ///
  /// <ul>
  /// <li>
  /// <code>execute_recipes</code>: Execute one or more recipes. To specify the
  /// recipes, set an <code>Args</code> parameter named <code>recipes</code> to
  /// the list of recipes to be executed. For example, to execute
  /// <code>phpapp::appsetup</code>, set <code>Args</code> to
  /// <code>{"recipes":["phpapp::appsetup"]}</code>.
  /// </li>
  /// <li>
  /// <code>install_dependencies</code>: Install the stack's dependencies.
  /// </li>
  /// <li>
  /// <code>update_custom_cookbooks</code>: Update the stack's custom cookbooks.
  /// </li>
  /// <li>
  /// <code>update_dependencies</code>: Update the stack's dependencies.
  /// </li>
  /// </ul> <note>
  /// The update_dependencies and install_dependencies commands are supported only
  /// for Linux instances. You can run the commands successfully on Windows
  /// instances, but they do nothing.
  /// </note>
  /// For apps, the following commands are available:
  ///
  /// <ul>
  /// <li>
  /// <code>deploy</code>: Deploy an app. Ruby on Rails apps have an optional
  /// <code>Args</code> parameter named <code>migrate</code>. Set
  /// <code>Args</code> to {"migrate":["true"]} to migrate the database. The
  /// default setting is {"migrate":["false"]}.
  /// </li>
  /// <li>
  /// <code>rollback</code> Roll the app back to the previous version. When you
  /// update an app, AWS OpsWorks Stacks stores the previous version, up to a
  /// maximum of five versions. You can use this command to roll an app back as
  /// many as four versions.
  /// </li>
  /// <li>
  /// <code>start</code>: Start the app's web or application server.
  /// </li>
  /// <li>
  /// <code>stop</code>: Stop the app's web or application server.
  /// </li>
  /// <li>
  /// <code>restart</code>: Restart the app's web or application server.
  /// </li>
  /// <li>
  /// <code>undeploy</code>: Undeploy the app.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Name')
  final DeploymentCommandName name;

  /// The arguments of those commands that take arguments. It should be set to a
  /// JSON object with the following format:
  ///
  /// <code>{"arg_name1" : ["value1", "value2", ...], "arg_name2" : ["value1",
  /// "value2", ...], ...}</code>
  ///
  /// The <code>update_dependencies</code> command takes two arguments:
  ///
  /// <ul>
  /// <li>
  /// <code>upgrade_os_to</code> - Specifies the desired Amazon Linux version for
  /// instances whose OS you want to upgrade, such as <code>Amazon Linux
  /// 2016.09</code>. You must also set the <code>allow_reboot</code> argument to
  /// true.
  /// </li>
  /// <li>
  /// <code>allow_reboot</code> - Specifies whether to allow AWS OpsWorks Stacks
  /// to reboot the instances if necessary, after installing the updates. This
  /// argument can be set to either <code>true</code> or <code>false</code>. The
  /// default value is <code>false</code>.
  /// </li>
  /// </ul>
  /// For example, to upgrade an instance to Amazon Linux 2016.09, set
  /// <code>Args</code> to the following.
  ///
  /// <code> { "upgrade_os_to":["Amazon Linux 2016.09"], "allow_reboot":["true"] }
  /// </code>
  @_s.JsonKey(name: 'Args')
  final Map<String, List<String>> args;

  DeploymentCommand({
    @_s.required this.name,
    this.args,
  });
  factory DeploymentCommand.fromJson(Map<String, dynamic> json) =>
      _$DeploymentCommandFromJson(json);

  Map<String, dynamic> toJson() => _$DeploymentCommandToJson(this);
}

enum DeploymentCommandName {
  @_s.JsonValue('install_dependencies')
  installDependencies,
  @_s.JsonValue('update_dependencies')
  updateDependencies,
  @_s.JsonValue('update_custom_cookbooks')
  updateCustomCookbooks,
  @_s.JsonValue('execute_recipes')
  executeRecipes,
  @_s.JsonValue('configure')
  configure,
  @_s.JsonValue('setup')
  setup,
  @_s.JsonValue('deploy')
  deploy,
  @_s.JsonValue('rollback')
  rollback,
  @_s.JsonValue('start')
  start,
  @_s.JsonValue('stop')
  stop,
  @_s.JsonValue('restart')
  restart,
  @_s.JsonValue('undeploy')
  undeploy,
}

/// Contains the response to a <code>DescribeAgentVersions</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAgentVersionsResult {
  /// The agent versions for the specified stack or configuration manager. Note
  /// that this value is the complete version number, not the abbreviated number
  /// used by the console.
  @_s.JsonKey(name: 'AgentVersions')
  final List<AgentVersion> agentVersions;

  DescribeAgentVersionsResult({
    this.agentVersions,
  });
  factory DescribeAgentVersionsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeAgentVersionsResultFromJson(json);
}

/// Contains the response to a <code>DescribeApps</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAppsResult {
  /// An array of <code>App</code> objects that describe the specified apps.
  @_s.JsonKey(name: 'Apps')
  final List<App> apps;

  DescribeAppsResult({
    this.apps,
  });
  factory DescribeAppsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeAppsResultFromJson(json);
}

/// Contains the response to a <code>DescribeCommands</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCommandsResult {
  /// An array of <code>Command</code> objects that describe each of the specified
  /// commands.
  @_s.JsonKey(name: 'Commands')
  final List<Command> commands;

  DescribeCommandsResult({
    this.commands,
  });
  factory DescribeCommandsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeCommandsResultFromJson(json);
}

/// Contains the response to a <code>DescribeDeployments</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDeploymentsResult {
  /// An array of <code>Deployment</code> objects that describe the deployments.
  @_s.JsonKey(name: 'Deployments')
  final List<Deployment> deployments;

  DescribeDeploymentsResult({
    this.deployments,
  });
  factory DescribeDeploymentsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeDeploymentsResultFromJson(json);
}

/// Contains the response to a <code>DescribeEcsClusters</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEcsClustersResult {
  /// A list of <code>EcsCluster</code> objects containing the cluster
  /// descriptions.
  @_s.JsonKey(name: 'EcsClusters')
  final List<EcsCluster> ecsClusters;

  /// If a paginated request does not return all of the remaining results, this
  /// parameter is set to a token that you can assign to the request object's
  /// <code>NextToken</code> parameter to retrieve the next set of results. If the
  /// previous paginated request returned all of the remaining results, this
  /// parameter is set to <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeEcsClustersResult({
    this.ecsClusters,
    this.nextToken,
  });
  factory DescribeEcsClustersResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeEcsClustersResultFromJson(json);
}

/// Contains the response to a <code>DescribeElasticIps</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeElasticIpsResult {
  /// An <code>ElasticIps</code> object that describes the specified Elastic IP
  /// addresses.
  @_s.JsonKey(name: 'ElasticIps')
  final List<ElasticIp> elasticIps;

  DescribeElasticIpsResult({
    this.elasticIps,
  });
  factory DescribeElasticIpsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeElasticIpsResultFromJson(json);
}

/// Contains the response to a <code>DescribeElasticLoadBalancers</code>
/// request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeElasticLoadBalancersResult {
  /// A list of <code>ElasticLoadBalancer</code> objects that describe the
  /// specified Elastic Load Balancing instances.
  @_s.JsonKey(name: 'ElasticLoadBalancers')
  final List<ElasticLoadBalancer> elasticLoadBalancers;

  DescribeElasticLoadBalancersResult({
    this.elasticLoadBalancers,
  });
  factory DescribeElasticLoadBalancersResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeElasticLoadBalancersResultFromJson(json);
}

/// Contains the response to a <code>DescribeInstances</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInstancesResult {
  /// An array of <code>Instance</code> objects that describe the instances.
  @_s.JsonKey(name: 'Instances')
  final List<Instance> instances;

  DescribeInstancesResult({
    this.instances,
  });
  factory DescribeInstancesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeInstancesResultFromJson(json);
}

/// Contains the response to a <code>DescribeLayers</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLayersResult {
  /// An array of <code>Layer</code> objects that describe the layers.
  @_s.JsonKey(name: 'Layers')
  final List<Layer> layers;

  DescribeLayersResult({
    this.layers,
  });
  factory DescribeLayersResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeLayersResultFromJson(json);
}

/// Contains the response to a <code>DescribeLoadBasedAutoScaling</code>
/// request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLoadBasedAutoScalingResult {
  /// An array of <code>LoadBasedAutoScalingConfiguration</code> objects that
  /// describe each layer's configuration.
  @_s.JsonKey(name: 'LoadBasedAutoScalingConfigurations')
  final List<LoadBasedAutoScalingConfiguration>
      loadBasedAutoScalingConfigurations;

  DescribeLoadBasedAutoScalingResult({
    this.loadBasedAutoScalingConfigurations,
  });
  factory DescribeLoadBasedAutoScalingResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeLoadBasedAutoScalingResultFromJson(json);
}

/// Contains the response to a <code>DescribeMyUserProfile</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMyUserProfileResult {
  /// A <code>UserProfile</code> object that describes the user's SSH information.
  @_s.JsonKey(name: 'UserProfile')
  final SelfUserProfile userProfile;

  DescribeMyUserProfileResult({
    this.userProfile,
  });
  factory DescribeMyUserProfileResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeMyUserProfileResultFromJson(json);
}

/// The response to a <code>DescribeOperatingSystems</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOperatingSystemsResponse {
  /// Contains information in response to a <code>DescribeOperatingSystems</code>
  /// request.
  @_s.JsonKey(name: 'OperatingSystems')
  final List<OperatingSystem> operatingSystems;

  DescribeOperatingSystemsResponse({
    this.operatingSystems,
  });
  factory DescribeOperatingSystemsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeOperatingSystemsResponseFromJson(json);
}

/// Contains the response to a <code>DescribePermissions</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePermissionsResult {
  /// An array of <code>Permission</code> objects that describe the stack
  /// permissions.
  ///
  /// <ul>
  /// <li>
  /// If the request object contains only a stack ID, the array contains a
  /// <code>Permission</code> object with permissions for each of the stack IAM
  /// ARNs.
  /// </li>
  /// <li>
  /// If the request object contains only an IAM ARN, the array contains a
  /// <code>Permission</code> object with permissions for each of the user's stack
  /// IDs.
  /// </li>
  /// <li>
  /// If the request contains a stack ID and an IAM ARN, the array contains a
  /// single <code>Permission</code> object with permissions for the specified
  /// stack and IAM ARN.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Permissions')
  final List<Permission> permissions;

  DescribePermissionsResult({
    this.permissions,
  });
  factory DescribePermissionsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribePermissionsResultFromJson(json);
}

/// Contains the response to a <code>DescribeRaidArrays</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRaidArraysResult {
  /// A <code>RaidArrays</code> object that describes the specified RAID arrays.
  @_s.JsonKey(name: 'RaidArrays')
  final List<RaidArray> raidArrays;

  DescribeRaidArraysResult({
    this.raidArrays,
  });
  factory DescribeRaidArraysResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeRaidArraysResultFromJson(json);
}

/// Contains the response to a <code>DescribeRdsDbInstances</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRdsDbInstancesResult {
  /// An a array of <code>RdsDbInstance</code> objects that describe the
  /// instances.
  @_s.JsonKey(name: 'RdsDbInstances')
  final List<RdsDbInstance> rdsDbInstances;

  DescribeRdsDbInstancesResult({
    this.rdsDbInstances,
  });
  factory DescribeRdsDbInstancesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeRdsDbInstancesResultFromJson(json);
}

/// Contains the response to a <code>DescribeServiceErrors</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeServiceErrorsResult {
  /// An array of <code>ServiceError</code> objects that describe the specified
  /// service errors.
  @_s.JsonKey(name: 'ServiceErrors')
  final List<ServiceError> serviceErrors;

  DescribeServiceErrorsResult({
    this.serviceErrors,
  });
  factory DescribeServiceErrorsResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeServiceErrorsResultFromJson(json);
}

/// Contains the response to a <code>DescribeStackProvisioningParameters</code>
/// request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStackProvisioningParametersResult {
  /// The AWS OpsWorks Stacks agent installer's URL.
  @_s.JsonKey(name: 'AgentInstallerUrl')
  final String agentInstallerUrl;

  /// An embedded object that contains the provisioning parameters.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  DescribeStackProvisioningParametersResult({
    this.agentInstallerUrl,
    this.parameters,
  });
  factory DescribeStackProvisioningParametersResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeStackProvisioningParametersResultFromJson(json);
}

/// Contains the response to a <code>DescribeStackSummary</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStackSummaryResult {
  /// A <code>StackSummary</code> object that contains the results.
  @_s.JsonKey(name: 'StackSummary')
  final StackSummary stackSummary;

  DescribeStackSummaryResult({
    this.stackSummary,
  });
  factory DescribeStackSummaryResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeStackSummaryResultFromJson(json);
}

/// Contains the response to a <code>DescribeStacks</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStacksResult {
  /// An array of <code>Stack</code> objects that describe the stacks.
  @_s.JsonKey(name: 'Stacks')
  final List<Stack> stacks;

  DescribeStacksResult({
    this.stacks,
  });
  factory DescribeStacksResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeStacksResultFromJson(json);
}

/// Contains the response to a <code>DescribeTimeBasedAutoScaling</code>
/// request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTimeBasedAutoScalingResult {
  /// An array of <code>TimeBasedAutoScalingConfiguration</code> objects that
  /// describe the configuration for the specified instances.
  @_s.JsonKey(name: 'TimeBasedAutoScalingConfigurations')
  final List<TimeBasedAutoScalingConfiguration>
      timeBasedAutoScalingConfigurations;

  DescribeTimeBasedAutoScalingResult({
    this.timeBasedAutoScalingConfigurations,
  });
  factory DescribeTimeBasedAutoScalingResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeTimeBasedAutoScalingResultFromJson(json);
}

/// Contains the response to a <code>DescribeUserProfiles</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserProfilesResult {
  /// A <code>Users</code> object that describes the specified users.
  @_s.JsonKey(name: 'UserProfiles')
  final List<UserProfile> userProfiles;

  DescribeUserProfilesResult({
    this.userProfiles,
  });
  factory DescribeUserProfilesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserProfilesResultFromJson(json);
}

/// Contains the response to a <code>DescribeVolumes</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeVolumesResult {
  /// An array of volume IDs.
  @_s.JsonKey(name: 'Volumes')
  final List<Volume> volumes;

  DescribeVolumesResult({
    this.volumes,
  });
  factory DescribeVolumesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeVolumesResultFromJson(json);
}

/// Describes an Amazon EBS volume. This data type maps directly to the Amazon
/// EC2 <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_EbsBlockDevice.html">EbsBlockDevice</a>
/// data type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EbsBlockDevice {
  /// Whether the volume is deleted on instance termination.
  @_s.JsonKey(name: 'DeleteOnTermination')
  final bool deleteOnTermination;

  /// The number of I/O operations per second (IOPS) that the volume supports. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_EbsBlockDevice.html">EbsBlockDevice</a>.
  @_s.JsonKey(name: 'Iops')
  final int iops;

  /// The snapshot ID.
  @_s.JsonKey(name: 'SnapshotId')
  final String snapshotId;

  /// The volume size, in GiB. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_EbsBlockDevice.html">EbsBlockDevice</a>.
  @_s.JsonKey(name: 'VolumeSize')
  final int volumeSize;

  /// The volume type. <code>gp2</code> for General Purpose (SSD) volumes,
  /// <code>io1</code> for Provisioned IOPS (SSD) volumes, <code>st1</code> for
  /// Throughput Optimized hard disk drives (HDD), <code>sc1</code> for Cold
  /// HDD,and <code>standard</code> for Magnetic volumes.
  ///
  /// If you specify the <code>io1</code> volume type, you must also specify a
  /// value for the <code>Iops</code> attribute. The maximum ratio of provisioned
  /// IOPS to requested volume size (in GiB) is 50:1. AWS uses the default volume
  /// size (in GiB) specified in the AMI attributes to set IOPS to 50 x (volume
  /// size).
  @_s.JsonKey(name: 'VolumeType')
  final VolumeType volumeType;

  EbsBlockDevice({
    this.deleteOnTermination,
    this.iops,
    this.snapshotId,
    this.volumeSize,
    this.volumeType,
  });
  factory EbsBlockDevice.fromJson(Map<String, dynamic> json) =>
      _$EbsBlockDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$EbsBlockDeviceToJson(this);
}

/// Describes a registered Amazon ECS cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EcsCluster {
  /// The cluster's ARN.
  @_s.JsonKey(name: 'EcsClusterArn')
  final String ecsClusterArn;

  /// The cluster name.
  @_s.JsonKey(name: 'EcsClusterName')
  final String ecsClusterName;

  /// The time and date that the cluster was registered with the stack.
  @_s.JsonKey(name: 'RegisteredAt')
  final String registeredAt;

  /// The stack ID.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  EcsCluster({
    this.ecsClusterArn,
    this.ecsClusterName,
    this.registeredAt,
    this.stackId,
  });
  factory EcsCluster.fromJson(Map<String, dynamic> json) =>
      _$EcsClusterFromJson(json);
}

/// Describes an Elastic IP address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ElasticIp {
  /// The domain.
  @_s.JsonKey(name: 'Domain')
  final String domain;

  /// The ID of the instance that the address is attached to.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The IP address.
  @_s.JsonKey(name: 'Ip')
  final String ip;

  /// The name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The AWS region. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  @_s.JsonKey(name: 'Region')
  final String region;

  ElasticIp({
    this.domain,
    this.instanceId,
    this.ip,
    this.name,
    this.region,
  });
  factory ElasticIp.fromJson(Map<String, dynamic> json) =>
      _$ElasticIpFromJson(json);
}

/// Describes an Elastic Load Balancing instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ElasticLoadBalancer {
  /// A list of Availability Zones.
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<String> availabilityZones;

  /// The instance's public DNS name.
  @_s.JsonKey(name: 'DnsName')
  final String dnsName;

  /// A list of the EC2 instances that the Elastic Load Balancing instance is
  /// managing traffic for.
  @_s.JsonKey(name: 'Ec2InstanceIds')
  final List<String> ec2InstanceIds;

  /// The Elastic Load Balancing instance's name.
  @_s.JsonKey(name: 'ElasticLoadBalancerName')
  final String elasticLoadBalancerName;

  /// The ID of the layer that the instance is attached to.
  @_s.JsonKey(name: 'LayerId')
  final String layerId;

  /// The instance's AWS region.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// The ID of the stack that the instance is associated with.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  /// A list of subnet IDs, if the stack is running in a VPC.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The VPC ID.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  ElasticLoadBalancer({
    this.availabilityZones,
    this.dnsName,
    this.ec2InstanceIds,
    this.elasticLoadBalancerName,
    this.layerId,
    this.region,
    this.stackId,
    this.subnetIds,
    this.vpcId,
  });
  factory ElasticLoadBalancer.fromJson(Map<String, dynamic> json) =>
      _$ElasticLoadBalancerFromJson(json);
}

/// Represents an app's environment variable.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EnvironmentVariable {
  /// (Required) The environment variable's name, which can consist of up to 64
  /// characters and must be specified. The name can contain upper- and lowercase
  /// letters, numbers, and underscores (_), but it must start with a letter or
  /// underscore.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// (Optional) The environment variable's value, which can be left empty. If you
  /// specify a value, it can contain up to 256 characters, which must all be
  /// printable.
  @_s.JsonKey(name: 'Value')
  final String value;

  /// (Optional) Whether the variable's value will be returned by the
  /// <a>DescribeApps</a> action. To conceal an environment variable's value, set
  /// <code>Secure</code> to <code>true</code>. <code>DescribeApps</code> then
  /// returns <code>*****FILTERED*****</code> instead of the actual value. The
  /// default value for <code>Secure</code> is <code>false</code>.
  @_s.JsonKey(name: 'Secure')
  final bool secure;

  EnvironmentVariable({
    @_s.required this.key,
    @_s.required this.value,
    this.secure,
  });
  factory EnvironmentVariable.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentVariableFromJson(json);

  Map<String, dynamic> toJson() => _$EnvironmentVariableToJson(this);
}

/// Contains the response to a <code>GetHostnameSuggestion</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetHostnameSuggestionResult {
  /// The generated host name.
  @_s.JsonKey(name: 'Hostname')
  final String hostname;

  /// The layer ID.
  @_s.JsonKey(name: 'LayerId')
  final String layerId;

  GetHostnameSuggestionResult({
    this.hostname,
    this.layerId,
  });
  factory GetHostnameSuggestionResult.fromJson(Map<String, dynamic> json) =>
      _$GetHostnameSuggestionResultFromJson(json);
}

/// Contains the response to a <code>GrantAccess</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GrantAccessResult {
  /// A <code>TemporaryCredential</code> object that contains the data needed to
  /// log in to the instance by RDP clients, such as the Microsoft Remote Desktop
  /// Connection.
  @_s.JsonKey(name: 'TemporaryCredential')
  final TemporaryCredential temporaryCredential;

  GrantAccessResult({
    this.temporaryCredential,
  });
  factory GrantAccessResult.fromJson(Map<String, dynamic> json) =>
      _$GrantAccessResultFromJson(json);
}

/// Describes an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Instance {
  /// The agent version. This parameter is set to <code>INHERIT</code> if the
  /// instance inherits the default stack setting or to a a version number for a
  /// fixed agent version.
  @_s.JsonKey(name: 'AgentVersion')
  final String agentVersion;

  /// A custom AMI ID to be used to create the instance. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html">Instances</a>
  @_s.JsonKey(name: 'AmiId')
  final String amiId;

  /// The instance architecture: "i386" or "x86_64".
  @_s.JsonKey(name: 'Architecture')
  final Architecture architecture;

  /// The instance's Amazon Resource Number (ARN).
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// For load-based or time-based instances, the type.
  @_s.JsonKey(name: 'AutoScalingType')
  final AutoScalingType autoScalingType;

  /// The instance Availability Zone. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// An array of <code>BlockDeviceMapping</code> objects that specify the
  /// instance's block device mappings.
  @_s.JsonKey(name: 'BlockDeviceMappings')
  final List<BlockDeviceMapping> blockDeviceMappings;

  /// The time that the instance was created.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// Whether this is an Amazon EBS-optimized instance.
  @_s.JsonKey(name: 'EbsOptimized')
  final bool ebsOptimized;

  /// The ID of the associated Amazon EC2 instance.
  @_s.JsonKey(name: 'Ec2InstanceId')
  final String ec2InstanceId;

  /// For container instances, the Amazon ECS cluster's ARN.
  @_s.JsonKey(name: 'EcsClusterArn')
  final String ecsClusterArn;

  /// For container instances, the instance's ARN.
  @_s.JsonKey(name: 'EcsContainerInstanceArn')
  final String ecsContainerInstanceArn;

  /// The instance <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic
  /// IP address </a>.
  @_s.JsonKey(name: 'ElasticIp')
  final String elasticIp;

  /// The instance host name.
  @_s.JsonKey(name: 'Hostname')
  final String hostname;

  /// For registered instances, the infrastructure class: <code>ec2</code> or
  /// <code>on-premises</code>.
  @_s.JsonKey(name: 'InfrastructureClass')
  final String infrastructureClass;

  /// Whether to install operating system and package updates when the instance
  /// boots. The default value is <code>true</code>. If this value is set to
  /// <code>false</code>, you must then update your instances manually by using
  /// <a>CreateDeployment</a> to run the <code>update_dependencies</code> stack
  /// command or by manually running <code>yum</code> (Amazon Linux) or
  /// <code>apt-get</code> (Ubuntu) on the instances.
  /// <note>
  /// We strongly recommend using the default value of <code>true</code>, to
  /// ensure that your instances have the latest security updates.
  /// </note>
  @_s.JsonKey(name: 'InstallUpdatesOnBoot')
  final bool installUpdatesOnBoot;

  /// The instance ID.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The ARN of the instance's IAM profile. For more information about IAM ARNs,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  @_s.JsonKey(name: 'InstanceProfileArn')
  final String instanceProfileArn;

  /// The instance type, such as <code>t2.micro</code>.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// The ID of the last service error. For more information, call
  /// <a>DescribeServiceErrors</a>.
  @_s.JsonKey(name: 'LastServiceErrorId')
  final String lastServiceErrorId;

  /// An array containing the instance layer IDs.
  @_s.JsonKey(name: 'LayerIds')
  final List<String> layerIds;

  /// The instance's operating system.
  @_s.JsonKey(name: 'Os')
  final String os;

  /// The instance's platform.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The instance's private DNS name.
  @_s.JsonKey(name: 'PrivateDns')
  final String privateDns;

  /// The instance's private IP address.
  @_s.JsonKey(name: 'PrivateIp')
  final String privateIp;

  /// The instance public DNS name.
  @_s.JsonKey(name: 'PublicDns')
  final String publicDns;

  /// The instance public IP address.
  @_s.JsonKey(name: 'PublicIp')
  final String publicIp;

  /// For registered instances, who performed the registration.
  @_s.JsonKey(name: 'RegisteredBy')
  final String registeredBy;

  /// The instance's reported AWS OpsWorks Stacks agent version.
  @_s.JsonKey(name: 'ReportedAgentVersion')
  final String reportedAgentVersion;

  /// For registered instances, the reported operating system.
  @_s.JsonKey(name: 'ReportedOs')
  final ReportedOs reportedOs;

  /// The instance's root device type. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device">Storage
  /// for the Root Device</a>.
  @_s.JsonKey(name: 'RootDeviceType')
  final RootDeviceType rootDeviceType;

  /// The root device volume ID.
  @_s.JsonKey(name: 'RootDeviceVolumeId')
  final String rootDeviceVolumeId;

  /// An array containing the instance security group IDs.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The SSH key's Deep Security Agent (DSA) fingerprint.
  @_s.JsonKey(name: 'SshHostDsaKeyFingerprint')
  final String sshHostDsaKeyFingerprint;

  /// The SSH key's RSA fingerprint.
  @_s.JsonKey(name: 'SshHostRsaKeyFingerprint')
  final String sshHostRsaKeyFingerprint;

  /// The instance's Amazon EC2 key-pair name.
  @_s.JsonKey(name: 'SshKeyName')
  final String sshKeyName;

  /// The stack ID.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  /// The instance status:
  ///
  /// <ul>
  /// <li>
  /// <code>booting</code>
  /// </li>
  /// <li>
  /// <code>connection_lost</code>
  /// </li>
  /// <li>
  /// <code>online</code>
  /// </li>
  /// <li>
  /// <code>pending</code>
  /// </li>
  /// <li>
  /// <code>rebooting</code>
  /// </li>
  /// <li>
  /// <code>requested</code>
  /// </li>
  /// <li>
  /// <code>running_setup</code>
  /// </li>
  /// <li>
  /// <code>setup_failed</code>
  /// </li>
  /// <li>
  /// <code>shutting_down</code>
  /// </li>
  /// <li>
  /// <code>start_failed</code>
  /// </li>
  /// <li>
  /// <code>stop_failed</code>
  /// </li>
  /// <li>
  /// <code>stopped</code>
  /// </li>
  /// <li>
  /// <code>stopping</code>
  /// </li>
  /// <li>
  /// <code>terminated</code>
  /// </li>
  /// <li>
  /// <code>terminating</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The instance's subnet ID; applicable only if the stack is running in a VPC.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// The instance's tenancy option, such as <code>dedicated</code> or
  /// <code>host</code>.
  @_s.JsonKey(name: 'Tenancy')
  final String tenancy;

  /// The instance's virtualization type: <code>paravirtual</code> or
  /// <code>hvm</code>.
  @_s.JsonKey(name: 'VirtualizationType')
  final VirtualizationType virtualizationType;

  Instance({
    this.agentVersion,
    this.amiId,
    this.architecture,
    this.arn,
    this.autoScalingType,
    this.availabilityZone,
    this.blockDeviceMappings,
    this.createdAt,
    this.ebsOptimized,
    this.ec2InstanceId,
    this.ecsClusterArn,
    this.ecsContainerInstanceArn,
    this.elasticIp,
    this.hostname,
    this.infrastructureClass,
    this.installUpdatesOnBoot,
    this.instanceId,
    this.instanceProfileArn,
    this.instanceType,
    this.lastServiceErrorId,
    this.layerIds,
    this.os,
    this.platform,
    this.privateDns,
    this.privateIp,
    this.publicDns,
    this.publicIp,
    this.registeredBy,
    this.reportedAgentVersion,
    this.reportedOs,
    this.rootDeviceType,
    this.rootDeviceVolumeId,
    this.securityGroupIds,
    this.sshHostDsaKeyFingerprint,
    this.sshHostRsaKeyFingerprint,
    this.sshKeyName,
    this.stackId,
    this.status,
    this.subnetId,
    this.tenancy,
    this.virtualizationType,
  });
  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
}

/// Contains a description of an Amazon EC2 instance from the Amazon EC2
/// metadata service. For more information, see <a
/// href="https://docs.aws.amazon.com/sdkfornet/latest/apidocs/Index.html">Instance
/// Metadata and User Data</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstanceIdentity {
  /// A JSON document that contains the metadata.
  @_s.JsonKey(name: 'Document')
  final String document;

  /// A signature that can be used to verify the document's accuracy and
  /// authenticity.
  @_s.JsonKey(name: 'Signature')
  final String signature;

  InstanceIdentity({
    this.document,
    this.signature,
  });
  Map<String, dynamic> toJson() => _$InstanceIdentityToJson(this);
}

/// Describes how many instances a stack has for each status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstancesCount {
  /// The number of instances in the Assigning state.
  @_s.JsonKey(name: 'Assigning')
  final int assigning;

  /// The number of instances with <code>booting</code> status.
  @_s.JsonKey(name: 'Booting')
  final int booting;

  /// The number of instances with <code>connection_lost</code> status.
  @_s.JsonKey(name: 'ConnectionLost')
  final int connectionLost;

  /// The number of instances in the Deregistering state.
  @_s.JsonKey(name: 'Deregistering')
  final int deregistering;

  /// The number of instances with <code>online</code> status.
  @_s.JsonKey(name: 'Online')
  final int online;

  /// The number of instances with <code>pending</code> status.
  @_s.JsonKey(name: 'Pending')
  final int pending;

  /// The number of instances with <code>rebooting</code> status.
  @_s.JsonKey(name: 'Rebooting')
  final int rebooting;

  /// The number of instances in the Registered state.
  @_s.JsonKey(name: 'Registered')
  final int registered;

  /// The number of instances in the Registering state.
  @_s.JsonKey(name: 'Registering')
  final int registering;

  /// The number of instances with <code>requested</code> status.
  @_s.JsonKey(name: 'Requested')
  final int requested;

  /// The number of instances with <code>running_setup</code> status.
  @_s.JsonKey(name: 'RunningSetup')
  final int runningSetup;

  /// The number of instances with <code>setup_failed</code> status.
  @_s.JsonKey(name: 'SetupFailed')
  final int setupFailed;

  /// The number of instances with <code>shutting_down</code> status.
  @_s.JsonKey(name: 'ShuttingDown')
  final int shuttingDown;

  /// The number of instances with <code>start_failed</code> status.
  @_s.JsonKey(name: 'StartFailed')
  final int startFailed;

  /// The number of instances with <code>stop_failed</code> status.
  @_s.JsonKey(name: 'StopFailed')
  final int stopFailed;

  /// The number of instances with <code>stopped</code> status.
  @_s.JsonKey(name: 'Stopped')
  final int stopped;

  /// The number of instances with <code>stopping</code> status.
  @_s.JsonKey(name: 'Stopping')
  final int stopping;

  /// The number of instances with <code>terminated</code> status.
  @_s.JsonKey(name: 'Terminated')
  final int terminated;

  /// The number of instances with <code>terminating</code> status.
  @_s.JsonKey(name: 'Terminating')
  final int terminating;

  /// The number of instances in the Unassigning state.
  @_s.JsonKey(name: 'Unassigning')
  final int unassigning;

  InstancesCount({
    this.assigning,
    this.booting,
    this.connectionLost,
    this.deregistering,
    this.online,
    this.pending,
    this.rebooting,
    this.registered,
    this.registering,
    this.requested,
    this.runningSetup,
    this.setupFailed,
    this.shuttingDown,
    this.startFailed,
    this.stopFailed,
    this.stopped,
    this.stopping,
    this.terminated,
    this.terminating,
    this.unassigning,
  });
  factory InstancesCount.fromJson(Map<String, dynamic> json) =>
      _$InstancesCountFromJson(json);
}

/// Describes a layer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Layer {
  /// The Amazon Resource Number (ARN) of a layer.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The layer attributes.
  ///
  /// For the <code>HaproxyStatsPassword</code>, <code>MysqlRootPassword</code>,
  /// and <code>GangliaPassword</code> attributes, AWS OpsWorks Stacks returns
  /// <code>*****FILTERED*****</code> instead of the actual value
  ///
  /// For an ECS Cluster layer, AWS OpsWorks Stacks the <code>EcsClusterArn</code>
  /// attribute is set to the cluster's ARN.
  @_s.JsonKey(name: 'Attributes')
  final Map<LayerAttributesKeys, String> attributes;

  /// Whether to automatically assign an <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic
  /// IP address</a> to the layer's instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html">How
  /// to Edit a Layer</a>.
  @_s.JsonKey(name: 'AutoAssignElasticIps')
  final bool autoAssignElasticIps;

  /// For stacks that are running in a VPC, whether to automatically assign a
  /// public IP address to the layer's instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html">How
  /// to Edit a Layer</a>.
  @_s.JsonKey(name: 'AutoAssignPublicIps')
  final bool autoAssignPublicIps;

  /// The Amazon CloudWatch Logs configuration settings for the layer.
  @_s.JsonKey(name: 'CloudWatchLogsConfiguration')
  final CloudWatchLogsConfiguration cloudWatchLogsConfiguration;

  /// Date when the layer was created.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// The ARN of the default IAM profile to be used for the layer's EC2 instances.
  /// For more information about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  @_s.JsonKey(name: 'CustomInstanceProfileArn')
  final String customInstanceProfileArn;

  /// A JSON formatted string containing the layer's custom stack configuration
  /// and deployment attributes.
  @_s.JsonKey(name: 'CustomJson')
  final String customJson;

  /// A <code>LayerCustomRecipes</code> object that specifies the layer's custom
  /// recipes.
  @_s.JsonKey(name: 'CustomRecipes')
  final Recipes customRecipes;

  /// An array containing the layer's custom security group IDs.
  @_s.JsonKey(name: 'CustomSecurityGroupIds')
  final List<String> customSecurityGroupIds;

  /// AWS OpsWorks Stacks supports five lifecycle events: <b>setup</b>,
  /// <b>configuration</b>, <b>deploy</b>, <b>undeploy</b>, and <b>shutdown</b>.
  /// For each layer, AWS OpsWorks Stacks runs a set of standard recipes for each
  /// event. You can also provide custom recipes for any or all layers and events.
  /// AWS OpsWorks Stacks runs custom event recipes after the standard recipes.
  /// <code>LayerCustomRecipes</code> specifies the custom recipes for a
  /// particular layer to be run in response to each of the five events.
  ///
  /// To specify a recipe, use the cookbook's directory name in the repository
  /// followed by two colons and the recipe name, which is the recipe's file name
  /// without the <code>.rb</code> extension. For example:
  /// <code>phpapp2::dbsetup</code> specifies the <code>dbsetup.rb</code> recipe
  /// in the repository's <code>phpapp2</code> folder.
  @_s.JsonKey(name: 'DefaultRecipes')
  final Recipes defaultRecipes;

  /// An array containing the layer's security group names.
  @_s.JsonKey(name: 'DefaultSecurityGroupNames')
  final List<String> defaultSecurityGroupNames;

  /// Whether auto healing is disabled for the layer.
  @_s.JsonKey(name: 'EnableAutoHealing')
  final bool enableAutoHealing;

  /// Whether to install operating system and package updates when the instance
  /// boots. The default value is <code>true</code>. If this value is set to
  /// <code>false</code>, you must then update your instances manually by using
  /// <a>CreateDeployment</a> to run the <code>update_dependencies</code> stack
  /// command or manually running <code>yum</code> (Amazon Linux) or
  /// <code>apt-get</code> (Ubuntu) on the instances.
  /// <note>
  /// We strongly recommend using the default value of <code>true</code>, to
  /// ensure that your instances have the latest security updates.
  /// </note>
  @_s.JsonKey(name: 'InstallUpdatesOnBoot')
  final bool installUpdatesOnBoot;

  /// The layer ID.
  @_s.JsonKey(name: 'LayerId')
  final String layerId;

  /// A <code>LifeCycleEventConfiguration</code> object that specifies the
  /// Shutdown event configuration.
  @_s.JsonKey(name: 'LifecycleEventConfiguration')
  final LifecycleEventConfiguration lifecycleEventConfiguration;

  /// The layer name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An array of <code>Package</code> objects that describe the layer's packages.
  @_s.JsonKey(name: 'Packages')
  final List<String> packages;

  /// The layer short name.
  @_s.JsonKey(name: 'Shortname')
  final String shortname;

  /// The layer stack ID.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  /// The layer type.
  @_s.JsonKey(name: 'Type')
  final LayerType type;

  /// Whether the layer uses Amazon EBS-optimized instances.
  @_s.JsonKey(name: 'UseEbsOptimizedInstances')
  final bool useEbsOptimizedInstances;

  /// A <code>VolumeConfigurations</code> object that describes the layer's Amazon
  /// EBS volumes.
  @_s.JsonKey(name: 'VolumeConfigurations')
  final List<VolumeConfiguration> volumeConfigurations;

  Layer({
    this.arn,
    this.attributes,
    this.autoAssignElasticIps,
    this.autoAssignPublicIps,
    this.cloudWatchLogsConfiguration,
    this.createdAt,
    this.customInstanceProfileArn,
    this.customJson,
    this.customRecipes,
    this.customSecurityGroupIds,
    this.defaultRecipes,
    this.defaultSecurityGroupNames,
    this.enableAutoHealing,
    this.installUpdatesOnBoot,
    this.layerId,
    this.lifecycleEventConfiguration,
    this.name,
    this.packages,
    this.shortname,
    this.stackId,
    this.type,
    this.useEbsOptimizedInstances,
    this.volumeConfigurations,
  });
  factory Layer.fromJson(Map<String, dynamic> json) => _$LayerFromJson(json);
}

enum LayerAttributesKeys {
  @_s.JsonValue('EcsClusterArn')
  ecsClusterArn,
  @_s.JsonValue('EnableHaproxyStats')
  enableHaproxyStats,
  @_s.JsonValue('HaproxyStatsUrl')
  haproxyStatsUrl,
  @_s.JsonValue('HaproxyStatsUser')
  haproxyStatsUser,
  @_s.JsonValue('HaproxyStatsPassword')
  haproxyStatsPassword,
  @_s.JsonValue('HaproxyHealthCheckUrl')
  haproxyHealthCheckUrl,
  @_s.JsonValue('HaproxyHealthCheckMethod')
  haproxyHealthCheckMethod,
  @_s.JsonValue('MysqlRootPassword')
  mysqlRootPassword,
  @_s.JsonValue('MysqlRootPasswordUbiquitous')
  mysqlRootPasswordUbiquitous,
  @_s.JsonValue('GangliaUrl')
  gangliaUrl,
  @_s.JsonValue('GangliaUser')
  gangliaUser,
  @_s.JsonValue('GangliaPassword')
  gangliaPassword,
  @_s.JsonValue('MemcachedMemory')
  memcachedMemory,
  @_s.JsonValue('NodejsVersion')
  nodejsVersion,
  @_s.JsonValue('RubyVersion')
  rubyVersion,
  @_s.JsonValue('RubygemsVersion')
  rubygemsVersion,
  @_s.JsonValue('ManageBundler')
  manageBundler,
  @_s.JsonValue('BundlerVersion')
  bundlerVersion,
  @_s.JsonValue('RailsStack')
  railsStack,
  @_s.JsonValue('PassengerVersion')
  passengerVersion,
  @_s.JsonValue('Jvm')
  jvm,
  @_s.JsonValue('JvmVersion')
  jvmVersion,
  @_s.JsonValue('JvmOptions')
  jvmOptions,
  @_s.JsonValue('JavaAppServer')
  javaAppServer,
  @_s.JsonValue('JavaAppServerVersion')
  javaAppServerVersion,
}

extension on LayerAttributesKeys {
  String toValue() {
    switch (this) {
      case LayerAttributesKeys.ecsClusterArn:
        return 'EcsClusterArn';
      case LayerAttributesKeys.enableHaproxyStats:
        return 'EnableHaproxyStats';
      case LayerAttributesKeys.haproxyStatsUrl:
        return 'HaproxyStatsUrl';
      case LayerAttributesKeys.haproxyStatsUser:
        return 'HaproxyStatsUser';
      case LayerAttributesKeys.haproxyStatsPassword:
        return 'HaproxyStatsPassword';
      case LayerAttributesKeys.haproxyHealthCheckUrl:
        return 'HaproxyHealthCheckUrl';
      case LayerAttributesKeys.haproxyHealthCheckMethod:
        return 'HaproxyHealthCheckMethod';
      case LayerAttributesKeys.mysqlRootPassword:
        return 'MysqlRootPassword';
      case LayerAttributesKeys.mysqlRootPasswordUbiquitous:
        return 'MysqlRootPasswordUbiquitous';
      case LayerAttributesKeys.gangliaUrl:
        return 'GangliaUrl';
      case LayerAttributesKeys.gangliaUser:
        return 'GangliaUser';
      case LayerAttributesKeys.gangliaPassword:
        return 'GangliaPassword';
      case LayerAttributesKeys.memcachedMemory:
        return 'MemcachedMemory';
      case LayerAttributesKeys.nodejsVersion:
        return 'NodejsVersion';
      case LayerAttributesKeys.rubyVersion:
        return 'RubyVersion';
      case LayerAttributesKeys.rubygemsVersion:
        return 'RubygemsVersion';
      case LayerAttributesKeys.manageBundler:
        return 'ManageBundler';
      case LayerAttributesKeys.bundlerVersion:
        return 'BundlerVersion';
      case LayerAttributesKeys.railsStack:
        return 'RailsStack';
      case LayerAttributesKeys.passengerVersion:
        return 'PassengerVersion';
      case LayerAttributesKeys.jvm:
        return 'Jvm';
      case LayerAttributesKeys.jvmVersion:
        return 'JvmVersion';
      case LayerAttributesKeys.jvmOptions:
        return 'JvmOptions';
      case LayerAttributesKeys.javaAppServer:
        return 'JavaAppServer';
      case LayerAttributesKeys.javaAppServerVersion:
        return 'JavaAppServerVersion';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum LayerType {
  @_s.JsonValue('aws-flow-ruby')
  awsFlowRuby,
  @_s.JsonValue('ecs-cluster')
  ecsCluster,
  @_s.JsonValue('java-app')
  javaApp,
  @_s.JsonValue('lb')
  lb,
  @_s.JsonValue('web')
  web,
  @_s.JsonValue('php-app')
  phpApp,
  @_s.JsonValue('rails-app')
  railsApp,
  @_s.JsonValue('nodejs-app')
  nodejsApp,
  @_s.JsonValue('memcached')
  memcached,
  @_s.JsonValue('db-master')
  dbMaster,
  @_s.JsonValue('monitoring-master')
  monitoringMaster,
  @_s.JsonValue('custom')
  custom,
}

extension on LayerType {
  String toValue() {
    switch (this) {
      case LayerType.awsFlowRuby:
        return 'aws-flow-ruby';
      case LayerType.ecsCluster:
        return 'ecs-cluster';
      case LayerType.javaApp:
        return 'java-app';
      case LayerType.lb:
        return 'lb';
      case LayerType.web:
        return 'web';
      case LayerType.phpApp:
        return 'php-app';
      case LayerType.railsApp:
        return 'rails-app';
      case LayerType.nodejsApp:
        return 'nodejs-app';
      case LayerType.memcached:
        return 'memcached';
      case LayerType.dbMaster:
        return 'db-master';
      case LayerType.monitoringMaster:
        return 'monitoring-master';
      case LayerType.custom:
        return 'custom';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Specifies the lifecycle event configuration
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LifecycleEventConfiguration {
  /// A <code>ShutdownEventConfiguration</code> object that specifies the Shutdown
  /// event configuration.
  @_s.JsonKey(name: 'Shutdown')
  final ShutdownEventConfiguration shutdown;

  LifecycleEventConfiguration({
    this.shutdown,
  });
  factory LifecycleEventConfiguration.fromJson(Map<String, dynamic> json) =>
      _$LifecycleEventConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$LifecycleEventConfigurationToJson(this);
}

/// Contains the response to a <code>ListTags</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsResult {
  /// If a paginated request does not return all of the remaining results, this
  /// parameter is set to a token that you can assign to the request object's
  /// <code>NextToken</code> parameter to get the next set of results. If the
  /// previous paginated request returned all of the remaining results, this
  /// parameter is set to <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A set of key-value pairs that contain tag keys and tag values that are
  /// attached to a stack or layer.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsResult({
    this.nextToken,
    this.tags,
  });
  factory ListTagsResult.fromJson(Map<String, dynamic> json) =>
      _$ListTagsResultFromJson(json);
}

/// Describes a layer's load-based auto scaling configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoadBasedAutoScalingConfiguration {
  /// An <code>AutoScalingThresholds</code> object that describes the downscaling
  /// configuration, which defines how and when AWS OpsWorks Stacks reduces the
  /// number of instances.
  @_s.JsonKey(name: 'DownScaling')
  final AutoScalingThresholds downScaling;

  /// Whether load-based auto scaling is enabled for the layer.
  @_s.JsonKey(name: 'Enable')
  final bool enable;

  /// The layer ID.
  @_s.JsonKey(name: 'LayerId')
  final String layerId;

  /// An <code>AutoScalingThresholds</code> object that describes the upscaling
  /// configuration, which defines how and when AWS OpsWorks Stacks increases the
  /// number of instances.
  @_s.JsonKey(name: 'UpScaling')
  final AutoScalingThresholds upScaling;

  LoadBasedAutoScalingConfiguration({
    this.downScaling,
    this.enable,
    this.layerId,
    this.upScaling,
  });
  factory LoadBasedAutoScalingConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$LoadBasedAutoScalingConfigurationFromJson(json);
}

/// Describes supported operating systems in AWS OpsWorks Stacks.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OperatingSystem {
  /// Supported configuration manager name and versions for an AWS OpsWorks Stacks
  /// operating system.
  @_s.JsonKey(name: 'ConfigurationManagers')
  final List<OperatingSystemConfigurationManager> configurationManagers;

  /// The ID of a supported operating system, such as <code>Amazon Linux
  /// 2018.03</code>.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the operating system, such as <code>Amazon Linux 2018.03</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A short name for the operating system manufacturer.
  @_s.JsonKey(name: 'ReportedName')
  final String reportedName;

  /// The version of the operating system, including the release and edition, if
  /// applicable.
  @_s.JsonKey(name: 'ReportedVersion')
  final String reportedVersion;

  /// Indicates that an operating system is not supported for new instances.
  @_s.JsonKey(name: 'Supported')
  final bool supported;

  /// The type of a supported operating system, either <code>Linux</code> or
  /// <code>Windows</code>.
  @_s.JsonKey(name: 'Type')
  final String type;

  OperatingSystem({
    this.configurationManagers,
    this.id,
    this.name,
    this.reportedName,
    this.reportedVersion,
    this.supported,
    this.type,
  });
  factory OperatingSystem.fromJson(Map<String, dynamic> json) =>
      _$OperatingSystemFromJson(json);
}

/// A block that contains information about the configuration manager (Chef) and
/// the versions of the configuration manager that are supported for an
/// operating system.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OperatingSystemConfigurationManager {
  /// The name of the configuration manager, which is Chef.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The versions of the configuration manager that are supported by an operating
  /// system.
  @_s.JsonKey(name: 'Version')
  final String version;

  OperatingSystemConfigurationManager({
    this.name,
    this.version,
  });
  factory OperatingSystemConfigurationManager.fromJson(
          Map<String, dynamic> json) =>
      _$OperatingSystemConfigurationManagerFromJson(json);
}

/// Describes stack or user permissions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Permission {
  /// Whether the user can use SSH.
  @_s.JsonKey(name: 'AllowSsh')
  final bool allowSsh;

  /// Whether the user can use <b>sudo</b>.
  @_s.JsonKey(name: 'AllowSudo')
  final bool allowSudo;

  /// The Amazon Resource Name (ARN) for an AWS Identity and Access Management
  /// (IAM) role. For more information about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  @_s.JsonKey(name: 'IamUserArn')
  final String iamUserArn;

  /// The user's permission level, which must be the following:
  ///
  /// <ul>
  /// <li>
  /// <code>deny</code>
  /// </li>
  /// <li>
  /// <code>show</code>
  /// </li>
  /// <li>
  /// <code>deploy</code>
  /// </li>
  /// <li>
  /// <code>manage</code>
  /// </li>
  /// <li>
  /// <code>iam_only</code>
  /// </li>
  /// </ul>
  /// For more information on the permissions associated with these levels, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html">Managing
  /// User Permissions</a>
  @_s.JsonKey(name: 'Level')
  final String level;

  /// A stack ID.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  Permission({
    this.allowSsh,
    this.allowSudo,
    this.iamUserArn,
    this.level,
    this.stackId,
  });
  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
}

/// Describes an instance's RAID array.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RaidArray {
  /// The array's Availability Zone. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// When the RAID array was created.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// The array's Linux device. For example /dev/mdadm0.
  @_s.JsonKey(name: 'Device')
  final String device;

  /// The instance ID.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// For PIOPS volumes, the IOPS per disk.
  @_s.JsonKey(name: 'Iops')
  final int iops;

  /// The array's mount point.
  @_s.JsonKey(name: 'MountPoint')
  final String mountPoint;

  /// The array name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The number of disks in the array.
  @_s.JsonKey(name: 'NumberOfDisks')
  final int numberOfDisks;

  /// The array ID.
  @_s.JsonKey(name: 'RaidArrayId')
  final String raidArrayId;

  /// The <a href="http://en.wikipedia.org/wiki/Standard_RAID_levels">RAID
  /// level</a>.
  @_s.JsonKey(name: 'RaidLevel')
  final int raidLevel;

  /// The array's size.
  @_s.JsonKey(name: 'Size')
  final int size;

  /// The stack ID.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  /// The volume type, standard or PIOPS.
  @_s.JsonKey(name: 'VolumeType')
  final String volumeType;

  RaidArray({
    this.availabilityZone,
    this.createdAt,
    this.device,
    this.instanceId,
    this.iops,
    this.mountPoint,
    this.name,
    this.numberOfDisks,
    this.raidArrayId,
    this.raidLevel,
    this.size,
    this.stackId,
    this.volumeType,
  });
  factory RaidArray.fromJson(Map<String, dynamic> json) =>
      _$RaidArrayFromJson(json);
}

/// Describes an Amazon RDS instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RdsDbInstance {
  /// The instance's address.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// The DB instance identifier.
  @_s.JsonKey(name: 'DbInstanceIdentifier')
  final String dbInstanceIdentifier;

  /// AWS OpsWorks Stacks returns <code>*****FILTERED*****</code> instead of the
  /// actual value.
  @_s.JsonKey(name: 'DbPassword')
  final String dbPassword;

  /// The master user name.
  @_s.JsonKey(name: 'DbUser')
  final String dbUser;

  /// The instance's database engine.
  @_s.JsonKey(name: 'Engine')
  final String engine;

  /// Set to <code>true</code> if AWS OpsWorks Stacks is unable to discover the
  /// Amazon RDS instance. AWS OpsWorks Stacks attempts to discover the instance
  /// only once. If this value is set to <code>true</code>, you must deregister
  /// the instance, and then register it again.
  @_s.JsonKey(name: 'MissingOnRds')
  final bool missingOnRds;

  /// The instance's ARN.
  @_s.JsonKey(name: 'RdsDbInstanceArn')
  final String rdsDbInstanceArn;

  /// The instance's AWS region.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// The ID of the stack with which the instance is registered.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  RdsDbInstance({
    this.address,
    this.dbInstanceIdentifier,
    this.dbPassword,
    this.dbUser,
    this.engine,
    this.missingOnRds,
    this.rdsDbInstanceArn,
    this.region,
    this.stackId,
  });
  factory RdsDbInstance.fromJson(Map<String, dynamic> json) =>
      _$RdsDbInstanceFromJson(json);
}

/// AWS OpsWorks Stacks supports five lifecycle events: <b>setup</b>,
/// <b>configuration</b>, <b>deploy</b>, <b>undeploy</b>, and <b>shutdown</b>.
/// For each layer, AWS OpsWorks Stacks runs a set of standard recipes for each
/// event. In addition, you can provide custom recipes for any or all layers and
/// events. AWS OpsWorks Stacks runs custom event recipes after the standard
/// recipes. <code>LayerCustomRecipes</code> specifies the custom recipes for a
/// particular layer to be run in response to each of the five events.
///
/// To specify a recipe, use the cookbook's directory name in the repository
/// followed by two colons and the recipe name, which is the recipe's file name
/// without the .rb extension. For example: phpapp2::dbsetup specifies the
/// dbsetup.rb recipe in the repository's phpapp2 folder.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Recipes {
  /// An array of custom recipe names to be run following a <code>configure</code>
  /// event.
  @_s.JsonKey(name: 'Configure')
  final List<String> configure;

  /// An array of custom recipe names to be run following a <code>deploy</code>
  /// event.
  @_s.JsonKey(name: 'Deploy')
  final List<String> deploy;

  /// An array of custom recipe names to be run following a <code>setup</code>
  /// event.
  @_s.JsonKey(name: 'Setup')
  final List<String> setup;

  /// An array of custom recipe names to be run following a <code>shutdown</code>
  /// event.
  @_s.JsonKey(name: 'Shutdown')
  final List<String> shutdown;

  /// An array of custom recipe names to be run following a <code>undeploy</code>
  /// event.
  @_s.JsonKey(name: 'Undeploy')
  final List<String> undeploy;

  Recipes({
    this.configure,
    this.deploy,
    this.setup,
    this.shutdown,
    this.undeploy,
  });
  factory Recipes.fromJson(Map<String, dynamic> json) =>
      _$RecipesFromJson(json);

  Map<String, dynamic> toJson() => _$RecipesToJson(this);
}

/// Contains the response to a <code>RegisterEcsCluster</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterEcsClusterResult {
  /// The cluster's ARN.
  @_s.JsonKey(name: 'EcsClusterArn')
  final String ecsClusterArn;

  RegisterEcsClusterResult({
    this.ecsClusterArn,
  });
  factory RegisterEcsClusterResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterEcsClusterResultFromJson(json);
}

/// Contains the response to a <code>RegisterElasticIp</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterElasticIpResult {
  /// The Elastic IP address.
  @_s.JsonKey(name: 'ElasticIp')
  final String elasticIp;

  RegisterElasticIpResult({
    this.elasticIp,
  });
  factory RegisterElasticIpResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterElasticIpResultFromJson(json);
}

/// Contains the response to a <code>RegisterInstanceResult</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterInstanceResult {
  /// The registered instance's AWS OpsWorks Stacks ID.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  RegisterInstanceResult({
    this.instanceId,
  });
  factory RegisterInstanceResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterInstanceResultFromJson(json);
}

/// Contains the response to a <code>RegisterVolume</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterVolumeResult {
  /// The volume ID.
  @_s.JsonKey(name: 'VolumeId')
  final String volumeId;

  RegisterVolumeResult({
    this.volumeId,
  });
  factory RegisterVolumeResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterVolumeResultFromJson(json);
}

/// A registered instance's reported operating system.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReportedOs {
  /// The operating system family.
  @_s.JsonKey(name: 'Family')
  final String family;

  /// The operating system name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The operating system version.
  @_s.JsonKey(name: 'Version')
  final String version;

  ReportedOs({
    this.family,
    this.name,
    this.version,
  });
  factory ReportedOs.fromJson(Map<String, dynamic> json) =>
      _$ReportedOsFromJson(json);
}

enum RootDeviceType {
  @_s.JsonValue('ebs')
  ebs,
  @_s.JsonValue('instance-store')
  instanceStore,
}

extension on RootDeviceType {
  String toValue() {
    switch (this) {
      case RootDeviceType.ebs:
        return 'ebs';
      case RootDeviceType.instanceStore:
        return 'instance-store';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a user's SSH information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SelfUserProfile {
  /// The user's IAM ARN.
  @_s.JsonKey(name: 'IamUserArn')
  final String iamUserArn;

  /// The user's name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The user's SSH public key.
  @_s.JsonKey(name: 'SshPublicKey')
  final String sshPublicKey;

  /// The user's SSH user name.
  @_s.JsonKey(name: 'SshUsername')
  final String sshUsername;

  SelfUserProfile({
    this.iamUserArn,
    this.name,
    this.sshPublicKey,
    this.sshUsername,
  });
  factory SelfUserProfile.fromJson(Map<String, dynamic> json) =>
      _$SelfUserProfileFromJson(json);
}

/// Describes an AWS OpsWorks Stacks service error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceError {
  /// When the error occurred.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// The instance ID.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// A message that describes the error.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The error ID.
  @_s.JsonKey(name: 'ServiceErrorId')
  final String serviceErrorId;

  /// The stack ID.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  /// The error type.
  @_s.JsonKey(name: 'Type')
  final String type;

  ServiceError({
    this.createdAt,
    this.instanceId,
    this.message,
    this.serviceErrorId,
    this.stackId,
    this.type,
  });
  factory ServiceError.fromJson(Map<String, dynamic> json) =>
      _$ServiceErrorFromJson(json);
}

/// The Shutdown event configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ShutdownEventConfiguration {
  /// Whether to enable Elastic Load Balancing connection draining. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/TerminologyandKeyConcepts.html#conn-drain">Connection
  /// Draining</a>
  @_s.JsonKey(name: 'DelayUntilElbConnectionsDrained')
  final bool delayUntilElbConnectionsDrained;

  /// The time, in seconds, that AWS OpsWorks Stacks will wait after triggering a
  /// Shutdown event before shutting down an instance.
  @_s.JsonKey(name: 'ExecutionTimeout')
  final int executionTimeout;

  ShutdownEventConfiguration({
    this.delayUntilElbConnectionsDrained,
    this.executionTimeout,
  });
  factory ShutdownEventConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ShutdownEventConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ShutdownEventConfigurationToJson(this);
}

/// Contains the information required to retrieve an app or cookbook from a
/// repository. For more information, see <a
/// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html">Creating
/// Apps</a> or <a
/// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html">Custom
/// Recipes and Cookbooks</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Source {
  /// When included in a request, the parameter depends on the repository type.
  ///
  /// <ul>
  /// <li>
  /// For Amazon S3 bundles, set <code>Password</code> to the appropriate IAM
  /// secret access key.
  /// </li>
  /// <li>
  /// For HTTP bundles and Subversion repositories, set <code>Password</code> to
  /// the password.
  /// </li>
  /// </ul>
  /// For more information on how to safely handle IAM credentials, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html">https://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html</a>.
  ///
  /// In responses, AWS OpsWorks Stacks returns <code>*****FILTERED*****</code>
  /// instead of the actual value.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The application's version. AWS OpsWorks Stacks enables you to easily deploy
  /// new versions of an application. One of the simplest approaches is to have
  /// branches or revisions in your repository that represent different versions
  /// that can potentially be deployed.
  @_s.JsonKey(name: 'Revision')
  final String revision;

  /// In requests, the repository's SSH key.
  ///
  /// In responses, AWS OpsWorks Stacks returns <code>*****FILTERED*****</code>
  /// instead of the actual value.
  @_s.JsonKey(name: 'SshKey')
  final String sshKey;

  /// The repository type.
  @_s.JsonKey(name: 'Type')
  final SourceType type;

  /// The source URL. The following is an example of an Amazon S3 source URL:
  /// <code>https://s3.amazonaws.com/opsworks-demo-bucket/opsworks_cookbook_demo.tar.gz</code>.
  @_s.JsonKey(name: 'Url')
  final String url;

  /// This parameter depends on the repository type.
  ///
  /// <ul>
  /// <li>
  /// For Amazon S3 bundles, set <code>Username</code> to the appropriate IAM
  /// access key ID.
  /// </li>
  /// <li>
  /// For HTTP bundles, Git repositories, and Subversion repositories, set
  /// <code>Username</code> to the user name.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Username')
  final String username;

  Source({
    this.password,
    this.revision,
    this.sshKey,
    this.type,
    this.url,
    this.username,
  });
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

enum SourceType {
  @_s.JsonValue('git')
  git,
  @_s.JsonValue('svn')
  svn,
  @_s.JsonValue('archive')
  archive,
  @_s.JsonValue('s3')
  s3,
}

/// Describes an app's SSL configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SslConfiguration {
  /// The contents of the certificate's domain.crt file.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// The private key; the contents of the certificate's domain.kex file.
  @_s.JsonKey(name: 'PrivateKey')
  final String privateKey;

  /// Optional. Can be used to specify an intermediate certificate authority key
  /// or client authentication.
  @_s.JsonKey(name: 'Chain')
  final String chain;

  SslConfiguration({
    @_s.required this.certificate,
    @_s.required this.privateKey,
    this.chain,
  });
  factory SslConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SslConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SslConfigurationToJson(this);
}

/// Describes a stack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Stack {
  /// The agent version. This parameter is set to <code>LATEST</code> for
  /// auto-update. or a version number for a fixed agent version.
  @_s.JsonKey(name: 'AgentVersion')
  final String agentVersion;

  /// The stack's ARN.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The stack's attributes.
  @_s.JsonKey(name: 'Attributes')
  final Map<StackAttributesKeys, String> attributes;

  /// A <code>ChefConfiguration</code> object that specifies whether to enable
  /// Berkshelf and the Berkshelf version. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html">Create
  /// a New Stack</a>.
  @_s.JsonKey(name: 'ChefConfiguration')
  final ChefConfiguration chefConfiguration;

  /// The configuration manager.
  @_s.JsonKey(name: 'ConfigurationManager')
  final StackConfigurationManager configurationManager;

  /// The date when the stack was created.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// Contains the information required to retrieve an app or cookbook from a
  /// repository. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html">Adding
  /// Apps</a> or <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html">Cookbooks
  /// and Recipes</a>.
  @_s.JsonKey(name: 'CustomCookbooksSource')
  final Source customCookbooksSource;

  /// A JSON object that contains user-defined attributes to be added to the stack
  /// configuration and deployment attributes. You can use custom JSON to override
  /// the corresponding default stack configuration attribute values or to pass
  /// data to recipes. The string should be in the following format:
  ///
  /// <code>"{\"key1\": \"value1\", \"key2\": \"value2\",...}"</code>
  ///
  /// For more information on custom JSON, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html">Use
  /// Custom JSON to Modify the Stack Configuration Attributes</a>.
  @_s.JsonKey(name: 'CustomJson')
  final String customJson;

  /// The stack's default Availability Zone. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  @_s.JsonKey(name: 'DefaultAvailabilityZone')
  final String defaultAvailabilityZone;

  /// The ARN of an IAM profile that is the default profile for all of the stack's
  /// EC2 instances. For more information about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  @_s.JsonKey(name: 'DefaultInstanceProfileArn')
  final String defaultInstanceProfileArn;

  /// The stack's default operating system.
  @_s.JsonKey(name: 'DefaultOs')
  final String defaultOs;

  /// The default root device type. This value is used by default for all
  /// instances in the stack, but you can override it when you create an instance.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device">Storage
  /// for the Root Device</a>.
  @_s.JsonKey(name: 'DefaultRootDeviceType')
  final RootDeviceType defaultRootDeviceType;

  /// A default Amazon EC2 key pair for the stack's instances. You can override
  /// this value when you create or update an instance.
  @_s.JsonKey(name: 'DefaultSshKeyName')
  final String defaultSshKeyName;

  /// The default subnet ID; applicable only if the stack is running in a VPC.
  @_s.JsonKey(name: 'DefaultSubnetId')
  final String defaultSubnetId;

  /// The stack host name theme, with spaces replaced by underscores.
  @_s.JsonKey(name: 'HostnameTheme')
  final String hostnameTheme;

  /// The stack name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The stack AWS region, such as "ap-northeast-2". For more information about
  /// AWS regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// The stack AWS Identity and Access Management (IAM) role.
  @_s.JsonKey(name: 'ServiceRoleArn')
  final String serviceRoleArn;

  /// The stack ID.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  /// Whether the stack uses custom cookbooks.
  @_s.JsonKey(name: 'UseCustomCookbooks')
  final bool useCustomCookbooks;

  /// Whether the stack automatically associates the AWS OpsWorks Stacks built-in
  /// security groups with the stack's layers.
  @_s.JsonKey(name: 'UseOpsworksSecurityGroups')
  final bool useOpsworksSecurityGroups;

  /// The VPC ID; applicable only if the stack is running in a VPC.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  Stack({
    this.agentVersion,
    this.arn,
    this.attributes,
    this.chefConfiguration,
    this.configurationManager,
    this.createdAt,
    this.customCookbooksSource,
    this.customJson,
    this.defaultAvailabilityZone,
    this.defaultInstanceProfileArn,
    this.defaultOs,
    this.defaultRootDeviceType,
    this.defaultSshKeyName,
    this.defaultSubnetId,
    this.hostnameTheme,
    this.name,
    this.region,
    this.serviceRoleArn,
    this.stackId,
    this.useCustomCookbooks,
    this.useOpsworksSecurityGroups,
    this.vpcId,
  });
  factory Stack.fromJson(Map<String, dynamic> json) => _$StackFromJson(json);
}

enum StackAttributesKeys {
  @_s.JsonValue('Color')
  color,
}

extension on StackAttributesKeys {
  String toValue() {
    switch (this) {
      case StackAttributesKeys.color:
        return 'Color';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the configuration manager.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StackConfigurationManager {
  /// The name. This parameter must be set to "Chef".
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Chef version. This parameter must be set to 12, 11.10, or 11.4 for Linux
  /// stacks, and to 12.2 for Windows stacks. The default value for Linux stacks
  /// is 11.4.
  @_s.JsonKey(name: 'Version')
  final String version;

  StackConfigurationManager({
    this.name,
    this.version,
  });
  factory StackConfigurationManager.fromJson(Map<String, dynamic> json) =>
      _$StackConfigurationManagerFromJson(json);

  Map<String, dynamic> toJson() => _$StackConfigurationManagerToJson(this);
}

/// Summarizes the number of layers, instances, and apps in a stack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StackSummary {
  /// The number of apps.
  @_s.JsonKey(name: 'AppsCount')
  final int appsCount;

  /// The stack's ARN.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// An <code>InstancesCount</code> object with the number of instances in each
  /// status.
  @_s.JsonKey(name: 'InstancesCount')
  final InstancesCount instancesCount;

  /// The number of layers.
  @_s.JsonKey(name: 'LayersCount')
  final int layersCount;

  /// The stack name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The stack ID.
  @_s.JsonKey(name: 'StackId')
  final String stackId;

  StackSummary({
    this.appsCount,
    this.arn,
    this.instancesCount,
    this.layersCount,
    this.name,
    this.stackId,
  });
  factory StackSummary.fromJson(Map<String, dynamic> json) =>
      _$StackSummaryFromJson(json);
}

/// Contains the data needed by RDP clients such as the Microsoft Remote Desktop
/// Connection to log in to the instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TemporaryCredential {
  /// The instance's AWS OpsWorks Stacks ID.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The password.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The user name.
  @_s.JsonKey(name: 'Username')
  final String username;

  /// The length of time (in minutes) that the grant is valid. When the grant
  /// expires, at the end of this period, the user will no longer be able to use
  /// the credentials to log in. If they are logged in at the time, they will be
  /// automatically logged out.
  @_s.JsonKey(name: 'ValidForInMinutes')
  final int validForInMinutes;

  TemporaryCredential({
    this.instanceId,
    this.password,
    this.username,
    this.validForInMinutes,
  });
  factory TemporaryCredential.fromJson(Map<String, dynamic> json) =>
      _$TemporaryCredentialFromJson(json);
}

/// Describes an instance's time-based auto scaling configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TimeBasedAutoScalingConfiguration {
  /// A <code>WeeklyAutoScalingSchedule</code> object with the instance schedule.
  @_s.JsonKey(name: 'AutoScalingSchedule')
  final WeeklyAutoScalingSchedule autoScalingSchedule;

  /// The instance ID.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  TimeBasedAutoScalingConfiguration({
    this.autoScalingSchedule,
    this.instanceId,
  });
  factory TimeBasedAutoScalingConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$TimeBasedAutoScalingConfigurationFromJson(json);
}

/// Describes a user's SSH information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserProfile {
  /// Whether users can specify their own SSH public key through the My Settings
  /// page. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/security-settingsshkey.html">Managing
  /// User Permissions</a>.
  @_s.JsonKey(name: 'AllowSelfManagement')
  final bool allowSelfManagement;

  /// The user's IAM ARN.
  @_s.JsonKey(name: 'IamUserArn')
  final String iamUserArn;

  /// The user's name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The user's SSH public key.
  @_s.JsonKey(name: 'SshPublicKey')
  final String sshPublicKey;

  /// The user's SSH user name.
  @_s.JsonKey(name: 'SshUsername')
  final String sshUsername;

  UserProfile({
    this.allowSelfManagement,
    this.iamUserArn,
    this.name,
    this.sshPublicKey,
    this.sshUsername,
  });
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

enum VirtualizationType {
  @_s.JsonValue('paravirtual')
  paravirtual,
  @_s.JsonValue('hvm')
  hvm,
}

/// Describes an instance's Amazon EBS volume.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Volume {
  /// The volume Availability Zone. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The device name.
  @_s.JsonKey(name: 'Device')
  final String device;

  /// The Amazon EC2 volume ID.
  @_s.JsonKey(name: 'Ec2VolumeId')
  final String ec2VolumeId;

  /// Specifies whether an Amazon EBS volume is encrypted. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon
  /// EBS Encryption</a>.
  @_s.JsonKey(name: 'Encrypted')
  final bool encrypted;

  /// The instance ID.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// For PIOPS volumes, the IOPS per disk.
  @_s.JsonKey(name: 'Iops')
  final int iops;

  /// The volume mount point. For example, "/mnt/disk1".
  @_s.JsonKey(name: 'MountPoint')
  final String mountPoint;

  /// The volume name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The RAID array ID.
  @_s.JsonKey(name: 'RaidArrayId')
  final String raidArrayId;

  /// The AWS region. For more information about AWS regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// The volume size.
  @_s.JsonKey(name: 'Size')
  final int size;

  /// The value returned by <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeVolumes.html">DescribeVolumes</a>.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The volume ID.
  @_s.JsonKey(name: 'VolumeId')
  final String volumeId;

  /// The volume type. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html">
  /// Amazon EBS Volume Types</a>.
  ///
  /// <ul>
  /// <li>
  /// <code>standard</code> - Magnetic. Magnetic volumes must have a minimum size
  /// of 1 GiB and a maximum size of 1024 GiB.
  /// </li>
  /// <li>
  /// <code>io1</code> - Provisioned IOPS (SSD). PIOPS volumes must have a minimum
  /// size of 4 GiB and a maximum size of 16384 GiB.
  /// </li>
  /// <li>
  /// <code>gp2</code> - General Purpose (SSD). General purpose volumes must have
  /// a minimum size of 1 GiB and a maximum size of 16384 GiB.
  /// </li>
  /// <li>
  /// <code>st1</code> - Throughput Optimized hard disk drive (HDD). Throughput
  /// optimized HDD volumes must have a minimum size of 500 GiB and a maximum size
  /// of 16384 GiB.
  /// </li>
  /// <li>
  /// <code>sc1</code> - Cold HDD. Cold HDD volumes must have a minimum size of
  /// 500 GiB and a maximum size of 16384 GiB.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'VolumeType')
  final String volumeType;

  Volume({
    this.availabilityZone,
    this.device,
    this.ec2VolumeId,
    this.encrypted,
    this.instanceId,
    this.iops,
    this.mountPoint,
    this.name,
    this.raidArrayId,
    this.region,
    this.size,
    this.status,
    this.volumeId,
    this.volumeType,
  });
  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);
}

/// Describes an Amazon EBS volume configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VolumeConfiguration {
  /// The volume mount point. For example "/dev/sdh".
  @_s.JsonKey(name: 'MountPoint')
  final String mountPoint;

  /// The number of disks in the volume.
  @_s.JsonKey(name: 'NumberOfDisks')
  final int numberOfDisks;

  /// The volume size.
  @_s.JsonKey(name: 'Size')
  final int size;

  /// Specifies whether an Amazon EBS volume is encrypted. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon
  /// EBS Encryption</a>.
  @_s.JsonKey(name: 'Encrypted')
  final bool encrypted;

  /// For PIOPS volumes, the IOPS per disk.
  @_s.JsonKey(name: 'Iops')
  final int iops;

  /// The volume <a href="http://en.wikipedia.org/wiki/Standard_RAID_levels">RAID
  /// level</a>.
  @_s.JsonKey(name: 'RaidLevel')
  final int raidLevel;

  /// The volume type. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html">
  /// Amazon EBS Volume Types</a>.
  ///
  /// <ul>
  /// <li>
  /// <code>standard</code> - Magnetic. Magnetic volumes must have a minimum size
  /// of 1 GiB and a maximum size of 1024 GiB.
  /// </li>
  /// <li>
  /// <code>io1</code> - Provisioned IOPS (SSD). PIOPS volumes must have a minimum
  /// size of 4 GiB and a maximum size of 16384 GiB.
  /// </li>
  /// <li>
  /// <code>gp2</code> - General Purpose (SSD). General purpose volumes must have
  /// a minimum size of 1 GiB and a maximum size of 16384 GiB.
  /// </li>
  /// <li>
  /// <code>st1</code> - Throughput Optimized hard disk drive (HDD). Throughput
  /// optimized HDD volumes must have a minimum size of 500 GiB and a maximum size
  /// of 16384 GiB.
  /// </li>
  /// <li>
  /// <code>sc1</code> - Cold HDD. Cold HDD volumes must have a minimum size of
  /// 500 GiB and a maximum size of 16384 GiB.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'VolumeType')
  final String volumeType;

  VolumeConfiguration({
    @_s.required this.mountPoint,
    @_s.required this.numberOfDisks,
    @_s.required this.size,
    this.encrypted,
    this.iops,
    this.raidLevel,
    this.volumeType,
  });
  factory VolumeConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VolumeConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeConfigurationToJson(this);
}

enum VolumeType {
  @_s.JsonValue('gp2')
  gp2,
  @_s.JsonValue('io1')
  io1,
  @_s.JsonValue('standard')
  standard,
}

/// Describes a time-based instance's auto scaling schedule. The schedule
/// consists of a set of key-value pairs.
///
/// <ul>
/// <li>
/// The key is the time period (a UTC hour) and must be an integer from 0 - 23.
/// </li>
/// <li>
/// The value indicates whether the instance should be online or offline for the
/// specified period, and must be set to "on" or "off"
/// </li>
/// </ul>
/// The default setting for all time periods is off, so you use the following
/// parameters primarily to specify the online periods. You don't have to
/// explicitly specify offline periods unless you want to change an online
/// period to an offline period.
///
/// The following example specifies that the instance should be online for four
/// hours, from UTC 1200 - 1600. It will be off for the remainder of the day.
///
/// <code> { "12":"on", "13":"on", "14":"on", "15":"on" } </code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WeeklyAutoScalingSchedule {
  /// The schedule for Friday.
  @_s.JsonKey(name: 'Friday')
  final Map<String, String> friday;

  /// The schedule for Monday.
  @_s.JsonKey(name: 'Monday')
  final Map<String, String> monday;

  /// The schedule for Saturday.
  @_s.JsonKey(name: 'Saturday')
  final Map<String, String> saturday;

  /// The schedule for Sunday.
  @_s.JsonKey(name: 'Sunday')
  final Map<String, String> sunday;

  /// The schedule for Thursday.
  @_s.JsonKey(name: 'Thursday')
  final Map<String, String> thursday;

  /// The schedule for Tuesday.
  @_s.JsonKey(name: 'Tuesday')
  final Map<String, String> tuesday;

  /// The schedule for Wednesday.
  @_s.JsonKey(name: 'Wednesday')
  final Map<String, String> wednesday;

  WeeklyAutoScalingSchedule({
    this.friday,
    this.monday,
    this.saturday,
    this.sunday,
    this.thursday,
    this.tuesday,
    this.wednesday,
  });
  factory WeeklyAutoScalingSchedule.fromJson(Map<String, dynamic> json) =>
      _$WeeklyAutoScalingScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$WeeklyAutoScalingScheduleToJson(this);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
