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

/// Welcome to the <i>OpsWorks Stacks API Reference</i>. This guide provides
/// descriptions, syntax, and usage examples for OpsWorks Stacks actions and
/// data types, including common parameters and error codes.
class OpsWorks {
  final _s.JsonProtocol _protocol;
  OpsWorks({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'opsworks',
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
  /// You cannot use this action with instances that were created with OpsWorks
  /// Stacks.
  /// </li>
  /// </ul>
  /// <b>Required Permissions</b>: To use this action, an Identity and Access
  /// Management (IAM) user must have a Manage permissions level for the stack
  /// or an attached policy that explicitly grants permissions. For more
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
    required String instanceId,
    required List<String> layerIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.AssignInstance'
    };
    await _protocol.send(
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
    required String volumeId,
    String? instanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.AssignVolume'
    };
    await _protocol.send(
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
    required String elasticIp,
    String? instanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.AssociateElasticIp'
    };
    await _protocol.send(
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

  /// Attaches an Elastic Load Balancing load balancer to a specified layer.
  /// OpsWorks Stacks does not support Application Load Balancer. You can only
  /// use Classic Load Balancer with OpsWorks Stacks. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/layers-elb.html">Elastic
  /// Load Balancing</a>.
  /// <note>
  /// You must create the Elastic Load Balancing instance separately, by using
  /// the Elastic Load Balancing console, API, or CLI. For more information, see
  /// the <a
  /// href="https://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/Welcome.html">Elastic
  /// Load Balancing Developer Guide</a>.
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
    required String elasticLoadBalancerName,
    required String layerId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.AttachElasticLoadBalancer'
    };
    await _protocol.send(
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
  /// The stack Identity and Access Management (IAM) role, which allows OpsWorks
  /// Stacks to work with Amazon Web Services resources on your behalf. You must
  /// set this parameter to the Amazon Resource Name (ARN) for an existing IAM
  /// role. If you create a stack by using the OpsWorkss Stacks console, it
  /// creates the role for you. You can obtain an existing stack's IAM ARN
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
  /// The default OpsWorks Stacks agent version. You have the following options:
  ///
  /// <ul>
  /// <li>
  /// Auto-update - Set this parameter to <code>LATEST</code>. OpsWorks Stacks
  /// automatically installs new agent versions on the stack's instances as soon
  /// as they are available.
  /// </li>
  /// <li>
  /// Fixed version - Set this parameter to your preferred agent version. To
  /// update the agent version, you must edit the stack configuration and
  /// specify a new version. OpsWorks Stacks automatically installs that version
  /// on the stack's instances.
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
  /// <code>Amazon Linux 2</code>, <code>Amazon Linux 2018.03</code>,
  /// <code>Amazon Linux 2017.09</code>, <code>Amazon Linux 2017.03</code>,
  /// <code>Amazon Linux 2016.09</code>, <code>Amazon Linux 2016.03</code>,
  /// <code>Amazon Linux 2015.09</code>, or <code>Amazon Linux 2015.03</code>.
  /// </li>
  /// <li>
  /// A supported Ubuntu operating system, such as <code>Ubuntu 18.04
  /// LTS</code>, <code>Ubuntu 16.04 LTS</code>, <code>Ubuntu 14.04 LTS</code>,
  /// or <code>Ubuntu 12.04 LTS</code>.
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
  /// The default option is the parent stack's operating system. Not all
  /// operating systems are supported with all versions of Chef. For more
  /// information about supported operating systems, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html">OpsWorks
  /// Stacks Operating Systems</a>.
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
  /// specify a key pair name, OpsWorks installs the public key on the instance
  /// and you can use the private key with an SSH client to log in to the
  /// instance. For more information, see <a
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
  /// The cloned stack name. Stack names can be a maximum of 64 characters.
  ///
  /// Parameter [region] :
  /// The cloned stack Amazon Web Services Region, such as
  /// <code>ap-northeast-2</code>. For more information about Amazon Web
  /// Services Regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions
  /// and Endpoints</a>.
  ///
  /// Parameter [useCustomCookbooks] :
  /// Whether to use custom cookbooks.
  ///
  /// Parameter [useOpsworksSecurityGroups] :
  /// Whether to associate the OpsWorks Stacks built-in security groups with the
  /// stack's layers.
  ///
  /// OpsWorks Stacks provides a standard set of security groups, one for each
  /// layer, which are associated with layers by default. With
  /// <code>UseOpsworksSecurityGroups</code> you can instead provide your own
  /// custom security groups. <code>UseOpsworksSecurityGroups</code> has the
  /// following settings:
  ///
  /// <ul>
  /// <li>
  /// True - OpsWorks Stacks automatically associates the appropriate built-in
  /// security group with each layer (default setting). You can associate
  /// additional security groups with a layer after you create it but you cannot
  /// delete the built-in security group.
  /// </li>
  /// <li>
  /// False - OpsWorks Stacks does not associate built-in security groups with
  /// layers. You must create appropriate Amazon EC2 security groups and
  /// associate a security group with each layer that you create. However, you
  /// can still manually associate a built-in security group with a layer on
  /// creation; custom security groups are required only for those layers that
  /// need custom settings.
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
  /// <code>DefaultSubnetId</code> parameter only, OpsWorks Stacks infers the
  /// value of the other parameter. If you specify neither parameter, OpsWorks
  /// Stacks sets these parameters to the first valid Availability Zone for the
  /// specified region and the corresponding default VPC subnet ID,
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
  /// For more information about how to use OpsWorks Stacks with a VPC, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-vpc.html">Running
  /// a Stack in a VPC</a>. For more information about default VPC and EC2
  /// Classic, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported
  /// Platforms</a>.
  Future<CloneStackResult> cloneStack({
    required String serviceRoleArn,
    required String sourceStackId,
    String? agentVersion,
    Map<StackAttributesKeys, String>? attributes,
    ChefConfiguration? chefConfiguration,
    List<String>? cloneAppIds,
    bool? clonePermissions,
    StackConfigurationManager? configurationManager,
    Source? customCookbooksSource,
    String? customJson,
    String? defaultAvailabilityZone,
    String? defaultInstanceProfileArn,
    String? defaultOs,
    RootDeviceType? defaultRootDeviceType,
    String? defaultSshKeyName,
    String? defaultSubnetId,
    String? hostnameTheme,
    String? name,
    String? region,
    bool? useCustomCookbooks,
    bool? useOpsworksSecurityGroups,
    String? vpcId,
  }) async {
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
  /// For example, PHP applications are associated with a PHP layer. OpsWorks
  /// Stacks deploys an application to those instances that are members of the
  /// corresponding layer. If your app isn't one of the standard types, or you
  /// prefer to implement your own Deploy recipes, specify <code>other</code>.
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
    required String name,
    required String stackId,
    required AppType type,
    Source? appSource,
    Map<AppAttributesKeys, String>? attributes,
    List<DataSource>? dataSources,
    String? description,
    List<String>? domains,
    bool? enableSsl,
    List<EnvironmentVariable>? environment,
    String? shortname,
    SslConfiguration? sslConfiguration,
  }) async {
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
        'Type': type.toValue(),
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
    required DeploymentCommand command,
    required String stackId,
    String? appId,
    String? comment,
    String? customJson,
    List<String>? instanceIds,
    List<String>? layerIds,
  }) async {
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
  /// The default OpsWorks Stacks agent version. You have the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>INHERIT</code> - Use the stack's default agent version setting.
  /// </li>
  /// <li>
  /// <i>version_number</i> - Use the specified agent version. This value
  /// overrides the stack's default setting. To update the agent version, edit
  /// the instance configuration and specify a new version. OpsWorks Stacks
  /// installs that version on the instance.
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
  /// The instance host name. The following are character limits for instance
  /// host names.
  ///
  /// <ul>
  /// <li>
  /// Linux-based instances: 63 characters
  /// </li>
  /// <li>
  /// Windows-based instances: 15 characters
  /// </li>
  /// </ul>
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
  /// <code>Amazon Linux 2</code>, <code>Amazon Linux 2018.03</code>,
  /// <code>Amazon Linux 2017.09</code>, <code>Amazon Linux 2017.03</code>,
  /// <code>Amazon Linux 2016.09</code>, <code>Amazon Linux 2016.03</code>,
  /// <code>Amazon Linux 2015.09</code>, or <code>Amazon Linux 2015.03</code>.
  /// </li>
  /// <li>
  /// A supported Ubuntu operating system, such as <code>Ubuntu 18.04
  /// LTS</code>, <code>Ubuntu 16.04 LTS</code>, <code>Ubuntu 14.04 LTS</code>,
  /// or <code>Ubuntu 12.04 LTS</code>.
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
  /// Not all operating systems are supported with all versions of Chef. For
  /// more information about the supported operating systems, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html">OpsWorks
  /// Stacks Operating Systems</a>.
  ///
  /// The default option is the current Amazon Linux version. If you set this
  /// parameter to <code>Custom</code>, you must use the <a>CreateInstance</a>
  /// action's AmiId parameter to specify the custom AMI that you want to use.
  /// Block device mappings are not supported if the value is
  /// <code>Custom</code>. For more information about how to use custom AMIs
  /// with OpsWorks Stacks, see <a
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
  /// direct OpsWorks Stacks to launch the instance in a different subnet.
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
    required String instanceType,
    required List<String> layerIds,
    required String stackId,
    String? agentVersion,
    String? amiId,
    Architecture? architecture,
    AutoScalingType? autoScalingType,
    String? availabilityZone,
    List<BlockDeviceMapping>? blockDeviceMappings,
    bool? ebsOptimized,
    String? hostname,
    bool? installUpdatesOnBoot,
    String? os,
    RootDeviceType? rootDeviceType,
    String? sshKeyName,
    String? subnetId,
    String? tenancy,
    String? virtualizationType,
  }) async {
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
  /// The layer name, which is used by the console. Layer names can be a maximum
  /// of 32 characters.
  ///
  /// Parameter [shortname] :
  /// For custom layers only, use this parameter to specify the layer's short
  /// name, which is used internally by OpsWorks Stacks and by Chef recipes. The
  /// short name is also used as the name for the directory where your app files
  /// are installed. It can have a maximum of 32 characters, which are limited
  /// to the alphanumeric characters, '-', '_', and '.'.
  ///
  /// Built-in layer short names are defined by OpsWorks Stacks. For more
  /// information, see the <a
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
  /// the CLI.
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
    required String name,
    required String shortname,
    required String stackId,
    required LayerType type,
    Map<LayerAttributesKeys, String>? attributes,
    bool? autoAssignElasticIps,
    bool? autoAssignPublicIps,
    CloudWatchLogsConfiguration? cloudWatchLogsConfiguration,
    String? customInstanceProfileArn,
    String? customJson,
    Recipes? customRecipes,
    List<String>? customSecurityGroupIds,
    bool? enableAutoHealing,
    bool? installUpdatesOnBoot,
    LifecycleEventConfiguration? lifecycleEventConfiguration,
    List<String>? packages,
    bool? useEbsOptimizedInstances,
    List<VolumeConfiguration>? volumeConfigurations,
  }) async {
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
        'Type': type.toValue(),
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
  /// The stack name. Stack names can be a maximum of 64 characters.
  ///
  /// Parameter [region] :
  /// The stack's Amazon Web Services Region, such as <code>ap-south-1</code>.
  /// For more information about Amazon Web Services Regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions
  /// and Endpoints</a>.
  /// <note>
  /// In the CLI, this API maps to the <code>--stack-region</code> parameter. If
  /// the <code>--stack-region</code> parameter and the CLI common parameter
  /// <code>--region</code> are set to the same value, the stack uses a
  /// <i>regional</i> endpoint. If the <code>--stack-region</code> parameter is
  /// not set, but the CLI <code>--region</code> parameter is, this also results
  /// in a stack with a <i>regional</i> endpoint. However, if the
  /// <code>--region</code> parameter is set to <code>us-east-1</code>, and the
  /// <code>--stack-region</code> parameter is set to one of the following, then
  /// the stack uses a legacy or <i>classic</i> region: <code>us-west-1,
  /// us-west-2, sa-east-1, eu-central-1, eu-west-1, ap-northeast-1,
  /// ap-southeast-1, ap-southeast-2</code>. In this case, the actual API
  /// endpoint of the stack is in <code>us-east-1</code>. Only the preceding
  /// regions are supported as classic regions in the <code>us-east-1</code> API
  /// endpoint. Because it is a best practice to choose the regional endpoint
  /// that is closest to where you manage Amazon Web Services, we recommend that
  /// you use regional endpoints for new stacks. The CLI common
  /// <code>--region</code> parameter always specifies a regional API endpoint;
  /// it cannot be used to specify a classic OpsWorks Stacks region.
  /// </note>
  ///
  /// Parameter [serviceRoleArn] :
  /// The stack's IAM role, which allows OpsWorks Stacks to work with Amazon Web
  /// Services resources on your behalf. You must set this parameter to the
  /// Amazon Resource Name (ARN) for an existing IAM role. For more information
  /// about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  ///
  /// Parameter [agentVersion] :
  /// The default OpsWorks Stacks agent version. You have the following options:
  ///
  /// <ul>
  /// <li>
  /// Auto-update - Set this parameter to <code>LATEST</code>. OpsWorks Stacks
  /// automatically installs new agent versions on the stack's instances as soon
  /// as they are available.
  /// </li>
  /// <li>
  /// Fixed version - Set this parameter to your preferred agent version. To
  /// update the agent version, you must edit the stack configuration and
  /// specify a new version. OpsWorks Stacks installs that version on the
  /// stack's instances.
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
  /// <code>Amazon Linux 2</code>, <code>Amazon Linux 2018.03</code>,
  /// <code>Amazon Linux 2017.09</code>, <code>Amazon Linux 2017.03</code>,
  /// <code>Amazon Linux 2016.09</code>, <code>Amazon Linux 2016.03</code>,
  /// <code>Amazon Linux 2015.09</code>, or <code>Amazon Linux 2015.03</code>.
  /// </li>
  /// <li>
  /// A supported Ubuntu operating system, such as <code>Ubuntu 18.04
  /// LTS</code>, <code>Ubuntu 16.04 LTS</code>, <code>Ubuntu 14.04 LTS</code>,
  /// or <code>Ubuntu 12.04 LTS</code>.
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
  /// The default option is the current Amazon Linux version. Not all operating
  /// systems are supported with all versions of Chef. For more information
  /// about supported operating systems, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html">OpsWorks
  /// Stacks Operating Systems</a>.
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
  /// specify a key pair name, OpsWorks installs the public key on the instance
  /// and you can use the private key with an SSH client to log in to the
  /// instance. For more information, see <a
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
  /// Whether to associate the OpsWorks Stacks built-in security groups with the
  /// stack's layers.
  ///
  /// OpsWorks Stacks provides a standard set of built-in security groups, one
  /// for each layer, which are associated with layers by default. With
  /// <code>UseOpsworksSecurityGroups</code> you can instead provide your own
  /// custom security groups. <code>UseOpsworksSecurityGroups</code> has the
  /// following settings:
  ///
  /// <ul>
  /// <li>
  /// True - OpsWorks Stacks automatically associates the appropriate built-in
  /// security group with each layer (default setting). You can associate
  /// additional security groups with a layer after you create it, but you
  /// cannot delete the built-in security group.
  /// </li>
  /// <li>
  /// False - OpsWorks Stacks does not associate built-in security groups with
  /// layers. You must create appropriate EC2 security groups and associate a
  /// security group with each layer that you create. However, you can still
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
  /// <code>DefaultSubnetId</code> parameter only, OpsWorks Stacks infers the
  /// value of the other parameter. If you specify neither parameter, OpsWorks
  /// Stacks sets these parameters to the first valid Availability Zone for the
  /// specified region and the corresponding default VPC subnet ID,
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
  /// For more information about how to use OpsWorks Stacks with a VPC, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-vpc.html">Running
  /// a Stack in a VPC</a>. For more information about default VPC and
  /// EC2-Classic, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported
  /// Platforms</a>.
  Future<CreateStackResult> createStack({
    required String defaultInstanceProfileArn,
    required String name,
    required String region,
    required String serviceRoleArn,
    String? agentVersion,
    Map<StackAttributesKeys, String>? attributes,
    ChefConfiguration? chefConfiguration,
    StackConfigurationManager? configurationManager,
    Source? customCookbooksSource,
    String? customJson,
    String? defaultAvailabilityZone,
    String? defaultOs,
    RootDeviceType? defaultRootDeviceType,
    String? defaultSshKeyName,
    String? defaultSubnetId,
    String? hostnameTheme,
    bool? useCustomCookbooks,
    bool? useOpsworksSecurityGroups,
    String? vpcId,
  }) async {
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
  /// marks, OpsWorks Stacks removes them. For example, <code>my.name</code> is
  /// changed to <code>myname</code>. If you do not specify an SSH user name,
  /// OpsWorks Stacks generates one from the IAM user name.
  Future<CreateUserProfileResult> createUserProfile({
    required String iamUserArn,
    bool? allowSelfManagement,
    String? sshPublicKey,
    String? sshUsername,
  }) async {
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
    required String appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeleteApp'
    };
    await _protocol.send(
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
    required String instanceId,
    bool? deleteElasticIp,
    bool? deleteVolumes,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeleteInstance'
    };
    await _protocol.send(
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
    required String layerId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeleteLayer'
    };
    await _protocol.send(
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
    required String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeleteStack'
    };
    await _protocol.send(
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
    required String iamUserArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeleteUserProfile'
    };
    await _protocol.send(
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
    required String ecsClusterArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeregisterEcsCluster'
    };
    await _protocol.send(
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

  /// Deregisters a specified Elastic IP address. The address can be registered
  /// by another stack after it is deregistered. For more information, see <a
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
    required String elasticIp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeregisterElasticIp'
    };
    await _protocol.send(
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

  /// Deregister an instance from OpsWorks Stacks. The instance can be a
  /// registered instance (Amazon EC2 or on-premises) or an instance created
  /// with OpsWorks. This action removes the instance from the stack and returns
  /// it to your control.
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
    required String instanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeregisterInstance'
    };
    await _protocol.send(
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
    required String rdsDbInstanceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeregisterRdsDbInstance'
    };
    await _protocol.send(
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
  /// The OpsWorks Stacks volume ID, which is the GUID that OpsWorks Stacks
  /// assigned to the instance when you registered the volume with the stack,
  /// not the Amazon EC2 volume ID.
  Future<void> deregisterVolume({
    required String volumeId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DeregisterVolume'
    };
    await _protocol.send(
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

  /// Describes the available OpsWorks Stacks agent versions. You must specify a
  /// stack ID or a configuration manager. <code>DescribeAgentVersions</code>
  /// returns a list of available agent versions for the specified stack or
  /// configuration manager.
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
    StackConfigurationManager? configurationManager,
    String? stackId,
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
    List<String>? appIds,
    String? stackId,
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
    List<String>? commandIds,
    String? deploymentId,
    String? instanceId,
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
    String? appId,
    List<String>? deploymentIds,
    String? stackId,
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
  /// <code>NextToken</code> parameters to paginate the response. However,
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
    List<String>? ecsClusterArns,
    int? maxResults,
    String? nextToken,
    String? stackId,
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
    String? instanceId,
    List<String>? ips,
    String? stackId,
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
    List<String>? layerIds,
    String? stackId,
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
    List<String>? instanceIds,
    String? layerId,
    String? stackId,
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
    List<String>? layerIds,
    String? stackId,
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
    required List<String> layerIds,
  }) async {
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

  /// Describes the operating systems that are supported by OpsWorks Stacks.
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
    String? iamUserArn,
    String? stackId,
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
    String? instanceId,
    List<String>? raidArrayIds,
    String? stackId,
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
    required String stackId,
    List<String>? rdsDbInstanceArns,
  }) async {
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

  /// Describes OpsWorks Stacks service errors.
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
    String? instanceId,
    List<String>? serviceErrorIds,
    String? stackId,
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
    required String stackId,
  }) async {
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
    required String stackId,
  }) async {
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
  /// this parameter, and have permissions to get information about all stacks,
  /// <code>DescribeStacks</code> returns a description of every stack. If the
  /// IAM policy that is attached to an IAM user limits the
  /// <code>DescribeStacks</code> action to specific stack ARNs, this parameter
  /// is required, and the user must specify a stack ARN that is allowed by the
  /// policy. Otherwise, <code>DescribeStacks</code> returns an
  /// <code>AccessDenied</code> error.
  Future<DescribeStacksResult> describeStacks({
    List<String>? stackIds,
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
    required List<String> instanceIds,
  }) async {
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
    List<String>? iamUserArns,
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
    String? instanceId,
    String? raidArrayId,
    String? stackId,
    List<String>? volumeIds,
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
    required String elasticLoadBalancerName,
    required String layerId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DetachElasticLoadBalancer'
    };
    await _protocol.send(
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
    required String elasticIp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.DisassociateElasticIp'
    };
    await _protocol.send(
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
    required String layerId,
  }) async {
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
  /// The instance's OpsWorks Stacks ID.
  ///
  /// Parameter [validForInMinutes] :
  /// The length of time (in minutes) that the grant is valid. When the grant
  /// expires at the end of this period, the user will no longer be able to use
  /// the credentials to log in. If the user is logged in at the time, they are
  /// logged out.
  Future<GrantAccessResult> grantAccess({
    required String instanceId,
    int? validForInMinutes,
  }) async {
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
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
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
    required String instanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.RebootInstance'
    };
    await _protocol.send(
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
    required String ecsClusterArn,
    required String stackId,
  }) async {
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
    required String elasticIp,
    required String stackId,
  }) async {
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

  /// Registers instances that were created outside of OpsWorks Stacks with a
  /// specified stack.
  /// <note>
  /// We do not recommend using this action to register instances. The complete
  /// registration operation includes two tasks: installing the OpsWorks Stacks
  /// agent on the instance, and registering the instance with the stack.
  /// <code>RegisterInstance</code> handles only the second step. You should
  /// instead use the CLI <code>register</code> command, which performs the
  /// entire registration operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/registered-instances-register.html">
  /// Registering an Instance with an OpsWorks Stacks Stack</a>.
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
  /// The instance's host name. The following are character limits for instance
  /// host names.
  ///
  /// <ul>
  /// <li>
  /// Linux-based instances: 63 characters
  /// </li>
  /// <li>
  /// Windows-based instances: 15 characters
  /// </li>
  /// </ul>
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
    required String stackId,
    String? hostname,
    InstanceIdentity? instanceIdentity,
    String? privateIp,
    String? publicIp,
    String? rsaPublicKey,
    String? rsaPublicKeyFingerprint,
  }) async {
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
    required String dbPassword,
    required String dbUser,
    required String rdsDbInstanceArn,
    required String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.RegisterRdsDbInstance'
    };
    await _protocol.send(
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
    required String stackId,
    String? ec2VolumeId,
  }) async {
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
  /// specified amount of time, OpsWorks Stacks stops a specified number of
  /// instances.
  ///
  /// Parameter [enable] :
  /// Enables load-based auto scaling for the layer.
  ///
  /// Parameter [upScaling] :
  /// An <code>AutoScalingThresholds</code> object with the upscaling threshold
  /// configuration. If the load exceeds these thresholds for a specified amount
  /// of time, OpsWorks Stacks starts a specified number of instances.
  Future<void> setLoadBasedAutoScaling({
    required String layerId,
    AutoScalingThresholds? downScaling,
    bool? enable,
    AutoScalingThresholds? upScaling,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.SetLoadBasedAutoScaling'
    };
    await _protocol.send(
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
    required String iamUserArn,
    required String stackId,
    bool? allowSsh,
    bool? allowSudo,
    String? level,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.SetPermission'
    };
    await _protocol.send(
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
    required String instanceId,
    WeeklyAutoScalingSchedule? autoScalingSchedule,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.SetTimeBasedAutoScaling'
    };
    await _protocol.send(
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
    required String instanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.StartInstance'
    };
    await _protocol.send(
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
    required String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.StartStack'
    };
    await _protocol.send(
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
  /// disassociates the OpsWorks Stacks instance from EC2, and forces deletion
  /// of <i>only</i> the OpsWorks Stacks instance. You must also delete the
  /// formerly-associated instance in EC2 after troubleshooting and replacing
  /// the OpsWorks Stacks instance with a new one.
  Future<void> stopInstance({
    required String instanceId,
    bool? force,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.StopInstance'
    };
    await _protocol.send(
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
    required String stackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.StopStack'
    };
    await _protocol.send(
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

  /// Apply cost-allocation tags to a specified stack or layer in OpsWorks
  /// Stacks. For more information about how tagging works, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/tagging.html">Tags</a>
  /// in the OpsWorks User Guide.
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
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.TagResource'
    };
    await _protocol.send(
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
  /// with instances that were created with OpsWorks Stacks.
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
    required String instanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UnassignInstance'
    };
    await _protocol.send(
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
    required String volumeId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UnassignVolume'
    };
    await _protocol.send(
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UntagResource'
    };
    await _protocol.send(
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
    required String appId,
    Source? appSource,
    Map<AppAttributesKeys, String>? attributes,
    List<DataSource>? dataSources,
    String? description,
    List<String>? domains,
    bool? enableSsl,
    List<EnvironmentVariable>? environment,
    String? name,
    SslConfiguration? sslConfiguration,
    AppType? type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateApp'
    };
    await _protocol.send(
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
  /// The new name, which can be a maximum of 32 characters.
  Future<void> updateElasticIp({
    required String elasticIp,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateElasticIp'
    };
    await _protocol.send(
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
  /// The default OpsWorks Stacks agent version. You have the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>INHERIT</code> - Use the stack's default agent version setting.
  /// </li>
  /// <li>
  /// <i>version_number</i> - Use the specified agent version. This value
  /// overrides the stack's default setting. To update the agent version, you
  /// must edit the instance configuration and specify a new version. OpsWorks
  /// Stacks installs that version on the instance.
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
  /// The instance host name. The following are character limits for instance
  /// host names.
  ///
  /// <ul>
  /// <li>
  /// Linux-based instances: 63 characters
  /// </li>
  /// <li>
  /// Windows-based instances: 15 characters
  /// </li>
  /// </ul>
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
  /// <code>Amazon Linux 2</code>, <code>Amazon Linux 2018.03</code>,
  /// <code>Amazon Linux 2017.09</code>, <code>Amazon Linux 2017.03</code>,
  /// <code>Amazon Linux 2016.09</code>, <code>Amazon Linux 2016.03</code>,
  /// <code>Amazon Linux 2015.09</code>, or <code>Amazon Linux 2015.03</code>.
  /// </li>
  /// <li>
  /// A supported Ubuntu operating system, such as <code>Ubuntu 18.04
  /// LTS</code>, <code>Ubuntu 16.04 LTS</code>, <code>Ubuntu 14.04 LTS</code>,
  /// or <code>Ubuntu 12.04 LTS</code>.
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
  /// Not all operating systems are supported with all versions of Chef. For
  /// more information about supported operating systems, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html">OpsWorks
  /// Stacks Operating Systems</a>.
  ///
  /// The default option is the current Amazon Linux version. If you set this
  /// parameter to <code>Custom</code>, you must use the AmiId parameter to
  /// specify the custom AMI that you want to use. For more information about
  /// how to use custom AMIs with OpsWorks, see <a
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
    required String instanceId,
    String? agentVersion,
    String? amiId,
    Architecture? architecture,
    AutoScalingType? autoScalingType,
    bool? ebsOptimized,
    String? hostname,
    bool? installUpdatesOnBoot,
    String? instanceType,
    List<String>? layerIds,
    String? os,
    String? sshKeyName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateInstance'
    };
    await _protocol.send(
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
  /// The layer name, which is used by the console. Layer names can be a maximum
  /// of 32 characters.
  ///
  /// Parameter [packages] :
  /// An array of <code>Package</code> objects that describe the layer's
  /// packages.
  ///
  /// Parameter [shortname] :
  /// For custom layers only, use this parameter to specify the layer's short
  /// name, which is used internally by OpsWorks Stacks and by Chef. The short
  /// name is also used as the name for the directory where your app files are
  /// installed. It can have a maximum of 32 characters and must be in the
  /// following format: /\A[a-z0-9\-\_\.]+\Z/.
  ///
  /// Built-in layer short names are defined by OpsWorks Stacks. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/layers.html">Layer
  /// reference</a> in the OpsWorks User Guide.
  ///
  /// Parameter [useEbsOptimizedInstances] :
  /// Whether to use Amazon EBS-optimized instances.
  ///
  /// Parameter [volumeConfigurations] :
  /// A <code>VolumeConfigurations</code> object that describes the layer's
  /// Amazon EBS volumes.
  Future<void> updateLayer({
    required String layerId,
    Map<LayerAttributesKeys, String>? attributes,
    bool? autoAssignElasticIps,
    bool? autoAssignPublicIps,
    CloudWatchLogsConfiguration? cloudWatchLogsConfiguration,
    String? customInstanceProfileArn,
    String? customJson,
    Recipes? customRecipes,
    List<String>? customSecurityGroupIds,
    bool? enableAutoHealing,
    bool? installUpdatesOnBoot,
    LifecycleEventConfiguration? lifecycleEventConfiguration,
    String? name,
    List<String>? packages,
    String? shortname,
    bool? useEbsOptimizedInstances,
    List<VolumeConfiguration>? volumeConfigurations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateLayer'
    };
    await _protocol.send(
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
    String? sshPublicKey,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateMyUserProfile'
    };
    await _protocol.send(
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
    required String rdsDbInstanceArn,
    String? dbPassword,
    String? dbUser,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateRdsDbInstance'
    };
    await _protocol.send(
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
  /// The default OpsWorks Stacks agent version. You have the following options:
  ///
  /// <ul>
  /// <li>
  /// Auto-update - Set this parameter to <code>LATEST</code>. OpsWorks Stacks
  /// automatically installs new agent versions on the stack's instances as soon
  /// as they are available.
  /// </li>
  /// <li>
  /// Fixed version - Set this parameter to your preferred agent version. To
  /// update the agent version, you must edit the stack configuration and
  /// specify a new version. OpsWorks Stacks installs that version on the
  /// stack's instances.
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
  /// <code>Amazon Linux 2</code>, <code>Amazon Linux 2018.03</code>,
  /// <code>Amazon Linux 2017.09</code>, <code>Amazon Linux 2017.03</code>,
  /// <code>Amazon Linux 2016.09</code>, <code>Amazon Linux 2016.03</code>,
  /// <code>Amazon Linux 2015.09</code>, or <code>Amazon Linux 2015.03</code>.
  /// </li>
  /// <li>
  /// A supported Ubuntu operating system, such as <code>Ubuntu 18.04
  /// LTS</code>, <code>Ubuntu 16.04 LTS</code>, <code>Ubuntu 14.04 LTS</code>,
  /// or <code>Ubuntu 12.04 LTS</code>.
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
  /// The default option is the stack's current operating system. Not all
  /// operating systems are supported with all versions of Chef. For more
  /// information about supported operating systems, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-os.html">OpsWorks
  /// Stacks Operating Systems</a>.
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
  /// <code>none</code>. If you specify a key-pair name, OpsWorks Stacks
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
  /// The stack's new name. Stack names can be a maximum of 64 characters.
  ///
  /// Parameter [serviceRoleArn] :
  /// Do not use this parameter. You cannot update a stack's service role.
  ///
  /// Parameter [useCustomCookbooks] :
  /// Whether the stack uses custom cookbooks.
  ///
  /// Parameter [useOpsworksSecurityGroups] :
  /// Whether to associate the OpsWorks Stacks built-in security groups with the
  /// stack's layers.
  ///
  /// OpsWorks Stacks provides a standard set of built-in security groups, one
  /// for each layer, which are associated with layers by default.
  /// <code>UseOpsworksSecurityGroups</code> allows you to provide your own
  /// custom security groups instead of using the built-in groups.
  /// <code>UseOpsworksSecurityGroups</code> has the following settings:
  ///
  /// <ul>
  /// <li>
  /// True - OpsWorks Stacks automatically associates the appropriate built-in
  /// security group with each layer (default setting). You can associate
  /// additional security groups with a layer after you create it, but you
  /// cannot delete the built-in security group.
  /// </li>
  /// <li>
  /// False - OpsWorks Stacks does not associate built-in security groups with
  /// layers. You must create appropriate EC2 security groups and associate a
  /// security group with each layer that you create. However, you can still
  /// manually associate a built-in security group with a layer on. Custom
  /// security groups are required only for those layers that need custom
  /// settings.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html">Create
  /// a New Stack</a>.
  Future<void> updateStack({
    required String stackId,
    String? agentVersion,
    Map<StackAttributesKeys, String>? attributes,
    ChefConfiguration? chefConfiguration,
    StackConfigurationManager? configurationManager,
    Source? customCookbooksSource,
    String? customJson,
    String? defaultAvailabilityZone,
    String? defaultInstanceProfileArn,
    String? defaultOs,
    RootDeviceType? defaultRootDeviceType,
    String? defaultSshKeyName,
    String? defaultSubnetId,
    String? hostnameTheme,
    String? name,
    String? serviceRoleArn,
    bool? useCustomCookbooks,
    bool? useOpsworksSecurityGroups,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateStack'
    };
    await _protocol.send(
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
  /// marks, OpsWorks Stacks removes them. For example, <code>my.name</code>
  /// will be changed to <code>myname</code>. If you do not specify an SSH user
  /// name, OpsWorks Stacks generates one from the IAM user name.
  Future<void> updateUserProfile({
    required String iamUserArn,
    bool? allowSelfManagement,
    String? sshPublicKey,
    String? sshUsername,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateUserProfile'
    };
    await _protocol.send(
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
  /// The new name. Volume names can be a maximum of 128 characters.
  Future<void> updateVolume({
    required String volumeId,
    String? mountPoint,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorks_20130218.UpdateVolume'
    };
    await _protocol.send(
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
class AgentVersion {
  /// The configuration manager.
  final StackConfigurationManager? configurationManager;

  /// The agent version.
  final String? version;

  AgentVersion({
    this.configurationManager,
    this.version,
  });

  factory AgentVersion.fromJson(Map<String, dynamic> json) {
    return AgentVersion(
      configurationManager: json['ConfigurationManager'] != null
          ? StackConfigurationManager.fromJson(
              json['ConfigurationManager'] as Map<String, dynamic>)
          : null,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationManager = this.configurationManager;
    final version = this.version;
    return {
      if (configurationManager != null)
        'ConfigurationManager': configurationManager,
      if (version != null) 'Version': version,
    };
  }
}

/// A description of the app.
class App {
  /// The app ID.
  final String? appId;

  /// A <code>Source</code> object that describes the app repository.
  final Source? appSource;

  /// The stack attributes.
  final Map<AppAttributesKeys, String>? attributes;

  /// When the app was created.
  final String? createdAt;

  /// The app's data sources.
  final List<DataSource>? dataSources;

  /// A description of the app.
  final String? description;

  /// The app vhost settings with multiple domains separated by commas. For
  /// example: <code>'www.example.com, example.com'</code>
  final List<String>? domains;

  /// Whether to enable SSL for the app.
  final bool? enableSsl;

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
  final List<EnvironmentVariable>? environment;

  /// The app name.
  final String? name;

  /// The app's short name.
  final String? shortname;

  /// An <code>SslConfiguration</code> object with the SSL configuration.
  final SslConfiguration? sslConfiguration;

  /// The app stack ID.
  final String? stackId;

  /// The app type.
  final AppType? type;

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

  factory App.fromJson(Map<String, dynamic> json) {
    return App(
      appId: json['AppId'] as String?,
      appSource: json['AppSource'] != null
          ? Source.fromJson(json['AppSource'] as Map<String, dynamic>)
          : null,
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toAppAttributesKeys(), e as String)),
      createdAt: json['CreatedAt'] as String?,
      dataSources: (json['DataSources'] as List?)
          ?.whereNotNull()
          .map((e) => DataSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      domains: (json['Domains'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      enableSsl: json['EnableSsl'] as bool?,
      environment: (json['Environment'] as List?)
          ?.whereNotNull()
          .map((e) => EnvironmentVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      shortname: json['Shortname'] as String?,
      sslConfiguration: json['SslConfiguration'] != null
          ? SslConfiguration.fromJson(
              json['SslConfiguration'] as Map<String, dynamic>)
          : null,
      stackId: json['StackId'] as String?,
      type: (json['Type'] as String?)?.toAppType(),
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final appSource = this.appSource;
    final attributes = this.attributes;
    final createdAt = this.createdAt;
    final dataSources = this.dataSources;
    final description = this.description;
    final domains = this.domains;
    final enableSsl = this.enableSsl;
    final environment = this.environment;
    final name = this.name;
    final shortname = this.shortname;
    final sslConfiguration = this.sslConfiguration;
    final stackId = this.stackId;
    final type = this.type;
    return {
      if (appId != null) 'AppId': appId,
      if (appSource != null) 'AppSource': appSource,
      if (attributes != null)
        'Attributes': attributes.map((k, e) => MapEntry(k.toValue(), e)),
      if (createdAt != null) 'CreatedAt': createdAt,
      if (dataSources != null) 'DataSources': dataSources,
      if (description != null) 'Description': description,
      if (domains != null) 'Domains': domains,
      if (enableSsl != null) 'EnableSsl': enableSsl,
      if (environment != null) 'Environment': environment,
      if (name != null) 'Name': name,
      if (shortname != null) 'Shortname': shortname,
      if (sslConfiguration != null) 'SslConfiguration': sslConfiguration,
      if (stackId != null) 'StackId': stackId,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum AppAttributesKeys {
  documentRoot,
  railsEnv,
  autoBundleOnDeploy,
  awsFlowRubySettings,
}

extension AppAttributesKeysValueExtension on AppAttributesKeys {
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
  }
}

extension AppAttributesKeysFromString on String {
  AppAttributesKeys toAppAttributesKeys() {
    switch (this) {
      case 'DocumentRoot':
        return AppAttributesKeys.documentRoot;
      case 'RailsEnv':
        return AppAttributesKeys.railsEnv;
      case 'AutoBundleOnDeploy':
        return AppAttributesKeys.autoBundleOnDeploy;
      case 'AwsFlowRubySettings':
        return AppAttributesKeys.awsFlowRubySettings;
    }
    throw Exception('$this is not known in enum AppAttributesKeys');
  }
}

enum AppType {
  awsFlowRuby,
  java,
  rails,
  php,
  nodejs,
  static,
  other,
}

extension AppTypeValueExtension on AppType {
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
  }
}

extension AppTypeFromString on String {
  AppType toAppType() {
    switch (this) {
      case 'aws-flow-ruby':
        return AppType.awsFlowRuby;
      case 'java':
        return AppType.java;
      case 'rails':
        return AppType.rails;
      case 'php':
        return AppType.php;
      case 'nodejs':
        return AppType.nodejs;
      case 'static':
        return AppType.static;
      case 'other':
        return AppType.other;
    }
    throw Exception('$this is not known in enum AppType');
  }
}

enum Architecture {
  x86_64,
  i386,
}

extension ArchitectureValueExtension on Architecture {
  String toValue() {
    switch (this) {
      case Architecture.x86_64:
        return 'x86_64';
      case Architecture.i386:
        return 'i386';
    }
  }
}

extension ArchitectureFromString on String {
  Architecture toArchitecture() {
    switch (this) {
      case 'x86_64':
        return Architecture.x86_64;
      case 'i386':
        return Architecture.i386;
    }
    throw Exception('$this is not known in enum Architecture');
  }
}

/// Describes a load-based auto scaling upscaling or downscaling threshold
/// configuration, which specifies when OpsWorks Stacks starts or stops
/// load-based instances.
class AutoScalingThresholds {
  /// Custom CloudWatch auto scaling alarms, to be used as thresholds. This
  /// parameter takes a list of up to five alarm names, which are case sensitive
  /// and must be in the same region as the stack.
  /// <note>
  /// To use custom alarms, you must update your service role to allow
  /// <code>cloudwatch:DescribeAlarms</code>. You can either have OpsWorks Stacks
  /// update the role for you when you first use this feature or you can edit the
  /// role manually. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-servicerole.html">Allowing
  /// OpsWorks Stacks to Act on Your Behalf</a>.
  /// </note>
  final List<String>? alarms;

  /// The CPU utilization threshold, as a percent of the available CPU. A value of
  /// -1 disables the threshold.
  final double? cpuThreshold;

  /// The amount of time (in minutes) after a scaling event occurs that OpsWorks
  /// Stacks should ignore metrics and suppress additional scaling events. For
  /// example, OpsWorks Stacks adds new instances following an upscaling event but
  /// the instances won't start reducing the load until they have been booted and
  /// configured. There is no point in raising additional scaling events during
  /// that operation, which typically takes several minutes.
  /// <code>IgnoreMetricsTime</code> allows you to direct OpsWorks Stacks to
  /// suppress scaling events long enough to get the new instances online.
  final int? ignoreMetricsTime;

  /// The number of instances to add or remove when the load exceeds a threshold.
  final int? instanceCount;

  /// The load threshold. A value of -1 disables the threshold. For more
  /// information about how load is computed, see <a
  /// href="http://en.wikipedia.org/wiki/Load_%28computing%29">Load
  /// (computing)</a>.
  final double? loadThreshold;

  /// The memory utilization threshold, as a percent of the available memory. A
  /// value of -1 disables the threshold.
  final double? memoryThreshold;

  /// The amount of time, in minutes, that the load must exceed a threshold before
  /// more instances are added or removed.
  final int? thresholdsWaitTime;

  AutoScalingThresholds({
    this.alarms,
    this.cpuThreshold,
    this.ignoreMetricsTime,
    this.instanceCount,
    this.loadThreshold,
    this.memoryThreshold,
    this.thresholdsWaitTime,
  });

  factory AutoScalingThresholds.fromJson(Map<String, dynamic> json) {
    return AutoScalingThresholds(
      alarms: (json['Alarms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cpuThreshold: json['CpuThreshold'] as double?,
      ignoreMetricsTime: json['IgnoreMetricsTime'] as int?,
      instanceCount: json['InstanceCount'] as int?,
      loadThreshold: json['LoadThreshold'] as double?,
      memoryThreshold: json['MemoryThreshold'] as double?,
      thresholdsWaitTime: json['ThresholdsWaitTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarms = this.alarms;
    final cpuThreshold = this.cpuThreshold;
    final ignoreMetricsTime = this.ignoreMetricsTime;
    final instanceCount = this.instanceCount;
    final loadThreshold = this.loadThreshold;
    final memoryThreshold = this.memoryThreshold;
    final thresholdsWaitTime = this.thresholdsWaitTime;
    return {
      if (alarms != null) 'Alarms': alarms,
      if (cpuThreshold != null) 'CpuThreshold': cpuThreshold,
      if (ignoreMetricsTime != null) 'IgnoreMetricsTime': ignoreMetricsTime,
      if (instanceCount != null) 'InstanceCount': instanceCount,
      if (loadThreshold != null) 'LoadThreshold': loadThreshold,
      if (memoryThreshold != null) 'MemoryThreshold': memoryThreshold,
      if (thresholdsWaitTime != null) 'ThresholdsWaitTime': thresholdsWaitTime,
    };
  }
}

enum AutoScalingType {
  load,
  timer,
}

extension AutoScalingTypeValueExtension on AutoScalingType {
  String toValue() {
    switch (this) {
      case AutoScalingType.load:
        return 'load';
      case AutoScalingType.timer:
        return 'timer';
    }
  }
}

extension AutoScalingTypeFromString on String {
  AutoScalingType toAutoScalingType() {
    switch (this) {
      case 'load':
        return AutoScalingType.load;
      case 'timer':
        return AutoScalingType.timer;
    }
    throw Exception('$this is not known in enum AutoScalingType');
  }
}

/// Describes a block device mapping. This data type maps directly to the Amazon
/// EC2 <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_BlockDeviceMapping.html">BlockDeviceMapping</a>
/// data type.
class BlockDeviceMapping {
  /// The device name that is exposed to the instance, such as
  /// <code>/dev/sdh</code>. For the root device, you can use the explicit device
  /// name or you can set this parameter to <code>ROOT_DEVICE</code> and OpsWorks
  /// Stacks will provide the correct device name.
  final String? deviceName;

  /// An <code>EBSBlockDevice</code> that defines how to configure an Amazon EBS
  /// volume when the instance is launched.
  final EbsBlockDevice? ebs;

  /// Suppresses the specified device included in the AMI's block device mapping.
  final String? noDevice;

  /// The virtual device name. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_BlockDeviceMapping.html">BlockDeviceMapping</a>.
  final String? virtualName;

  BlockDeviceMapping({
    this.deviceName,
    this.ebs,
    this.noDevice,
    this.virtualName,
  });

  factory BlockDeviceMapping.fromJson(Map<String, dynamic> json) {
    return BlockDeviceMapping(
      deviceName: json['DeviceName'] as String?,
      ebs: json['Ebs'] != null
          ? EbsBlockDevice.fromJson(json['Ebs'] as Map<String, dynamic>)
          : null,
      noDevice: json['NoDevice'] as String?,
      virtualName: json['VirtualName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceName = this.deviceName;
    final ebs = this.ebs;
    final noDevice = this.noDevice;
    final virtualName = this.virtualName;
    return {
      if (deviceName != null) 'DeviceName': deviceName,
      if (ebs != null) 'Ebs': ebs,
      if (noDevice != null) 'NoDevice': noDevice,
      if (virtualName != null) 'VirtualName': virtualName,
    };
  }
}

/// Describes the Chef configuration.
class ChefConfiguration {
  /// The Berkshelf version.
  final String? berkshelfVersion;

  /// Whether to enable Berkshelf.
  final bool? manageBerkshelf;

  ChefConfiguration({
    this.berkshelfVersion,
    this.manageBerkshelf,
  });

  factory ChefConfiguration.fromJson(Map<String, dynamic> json) {
    return ChefConfiguration(
      berkshelfVersion: json['BerkshelfVersion'] as String?,
      manageBerkshelf: json['ManageBerkshelf'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final berkshelfVersion = this.berkshelfVersion;
    final manageBerkshelf = this.manageBerkshelf;
    return {
      if (berkshelfVersion != null) 'BerkshelfVersion': berkshelfVersion,
      if (manageBerkshelf != null) 'ManageBerkshelf': manageBerkshelf,
    };
  }
}

/// Contains the response to a <code>CloneStack</code> request.
class CloneStackResult {
  /// The cloned stack ID.
  final String? stackId;

  CloneStackResult({
    this.stackId,
  });

  factory CloneStackResult.fromJson(Map<String, dynamic> json) {
    return CloneStackResult(
      stackId: json['StackId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stackId = this.stackId;
    return {
      if (stackId != null) 'StackId': stackId,
    };
  }
}

/// Describes the Amazon CloudWatch Logs configuration for a layer.
class CloudWatchLogsConfiguration {
  /// Whether CloudWatch Logs is enabled for a layer.
  final bool? enabled;

  /// A list of configuration options for CloudWatch Logs.
  final List<CloudWatchLogsLogStream>? logStreams;

  CloudWatchLogsConfiguration({
    this.enabled,
    this.logStreams,
  });

  factory CloudWatchLogsConfiguration.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogsConfiguration(
      enabled: json['Enabled'] as bool?,
      logStreams: (json['LogStreams'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CloudWatchLogsLogStream.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final logStreams = this.logStreams;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (logStreams != null) 'LogStreams': logStreams,
    };
  }
}

/// Specifies the encoding of the log file so that the file can be read
/// correctly. The default is <code>utf_8</code>. Encodings supported by Python
/// <code>codecs.decode()</code> can be used here.
enum CloudWatchLogsEncoding {
  ascii,
  big5,
  big5hkscs,
  cp037,
  cp424,
  cp437,
  cp500,
  cp720,
  cp737,
  cp775,
  cp850,
  cp852,
  cp855,
  cp856,
  cp857,
  cp858,
  cp860,
  cp861,
  cp862,
  cp863,
  cp864,
  cp865,
  cp866,
  cp869,
  cp874,
  cp875,
  cp932,
  cp949,
  cp950,
  cp1006,
  cp1026,
  cp1140,
  cp1250,
  cp1251,
  cp1252,
  cp1253,
  cp1254,
  cp1255,
  cp1256,
  cp1257,
  cp1258,
  eucJp,
  eucJis_2004,
  eucJisx0213,
  eucKr,
  gb2312,
  gbk,
  gb18030,
  hz,
  iso2022Jp,
  iso2022Jp_1,
  iso2022Jp_2,
  iso2022Jp_2004,
  iso2022Jp_3,
  iso2022JpExt,
  iso2022Kr,
  latin_1,
  iso8859_2,
  iso8859_3,
  iso8859_4,
  iso8859_5,
  iso8859_6,
  iso8859_7,
  iso8859_8,
  iso8859_9,
  iso8859_10,
  iso8859_13,
  iso8859_14,
  iso8859_15,
  iso8859_16,
  johab,
  koi8R,
  koi8U,
  macCyrillic,
  macGreek,
  macIceland,
  macLatin2,
  macRoman,
  macTurkish,
  ptcp154,
  shiftJis,
  shiftJis_2004,
  shiftJisx0213,
  utf_32,
  utf_32Be,
  utf_32Le,
  utf_16,
  utf_16Be,
  utf_16Le,
  utf_7,
  utf_8,
  utf_8Sig,
}

extension CloudWatchLogsEncodingValueExtension on CloudWatchLogsEncoding {
  String toValue() {
    switch (this) {
      case CloudWatchLogsEncoding.ascii:
        return 'ascii';
      case CloudWatchLogsEncoding.big5:
        return 'big5';
      case CloudWatchLogsEncoding.big5hkscs:
        return 'big5hkscs';
      case CloudWatchLogsEncoding.cp037:
        return 'cp037';
      case CloudWatchLogsEncoding.cp424:
        return 'cp424';
      case CloudWatchLogsEncoding.cp437:
        return 'cp437';
      case CloudWatchLogsEncoding.cp500:
        return 'cp500';
      case CloudWatchLogsEncoding.cp720:
        return 'cp720';
      case CloudWatchLogsEncoding.cp737:
        return 'cp737';
      case CloudWatchLogsEncoding.cp775:
        return 'cp775';
      case CloudWatchLogsEncoding.cp850:
        return 'cp850';
      case CloudWatchLogsEncoding.cp852:
        return 'cp852';
      case CloudWatchLogsEncoding.cp855:
        return 'cp855';
      case CloudWatchLogsEncoding.cp856:
        return 'cp856';
      case CloudWatchLogsEncoding.cp857:
        return 'cp857';
      case CloudWatchLogsEncoding.cp858:
        return 'cp858';
      case CloudWatchLogsEncoding.cp860:
        return 'cp860';
      case CloudWatchLogsEncoding.cp861:
        return 'cp861';
      case CloudWatchLogsEncoding.cp862:
        return 'cp862';
      case CloudWatchLogsEncoding.cp863:
        return 'cp863';
      case CloudWatchLogsEncoding.cp864:
        return 'cp864';
      case CloudWatchLogsEncoding.cp865:
        return 'cp865';
      case CloudWatchLogsEncoding.cp866:
        return 'cp866';
      case CloudWatchLogsEncoding.cp869:
        return 'cp869';
      case CloudWatchLogsEncoding.cp874:
        return 'cp874';
      case CloudWatchLogsEncoding.cp875:
        return 'cp875';
      case CloudWatchLogsEncoding.cp932:
        return 'cp932';
      case CloudWatchLogsEncoding.cp949:
        return 'cp949';
      case CloudWatchLogsEncoding.cp950:
        return 'cp950';
      case CloudWatchLogsEncoding.cp1006:
        return 'cp1006';
      case CloudWatchLogsEncoding.cp1026:
        return 'cp1026';
      case CloudWatchLogsEncoding.cp1140:
        return 'cp1140';
      case CloudWatchLogsEncoding.cp1250:
        return 'cp1250';
      case CloudWatchLogsEncoding.cp1251:
        return 'cp1251';
      case CloudWatchLogsEncoding.cp1252:
        return 'cp1252';
      case CloudWatchLogsEncoding.cp1253:
        return 'cp1253';
      case CloudWatchLogsEncoding.cp1254:
        return 'cp1254';
      case CloudWatchLogsEncoding.cp1255:
        return 'cp1255';
      case CloudWatchLogsEncoding.cp1256:
        return 'cp1256';
      case CloudWatchLogsEncoding.cp1257:
        return 'cp1257';
      case CloudWatchLogsEncoding.cp1258:
        return 'cp1258';
      case CloudWatchLogsEncoding.eucJp:
        return 'euc_jp';
      case CloudWatchLogsEncoding.eucJis_2004:
        return 'euc_jis_2004';
      case CloudWatchLogsEncoding.eucJisx0213:
        return 'euc_jisx0213';
      case CloudWatchLogsEncoding.eucKr:
        return 'euc_kr';
      case CloudWatchLogsEncoding.gb2312:
        return 'gb2312';
      case CloudWatchLogsEncoding.gbk:
        return 'gbk';
      case CloudWatchLogsEncoding.gb18030:
        return 'gb18030';
      case CloudWatchLogsEncoding.hz:
        return 'hz';
      case CloudWatchLogsEncoding.iso2022Jp:
        return 'iso2022_jp';
      case CloudWatchLogsEncoding.iso2022Jp_1:
        return 'iso2022_jp_1';
      case CloudWatchLogsEncoding.iso2022Jp_2:
        return 'iso2022_jp_2';
      case CloudWatchLogsEncoding.iso2022Jp_2004:
        return 'iso2022_jp_2004';
      case CloudWatchLogsEncoding.iso2022Jp_3:
        return 'iso2022_jp_3';
      case CloudWatchLogsEncoding.iso2022JpExt:
        return 'iso2022_jp_ext';
      case CloudWatchLogsEncoding.iso2022Kr:
        return 'iso2022_kr';
      case CloudWatchLogsEncoding.latin_1:
        return 'latin_1';
      case CloudWatchLogsEncoding.iso8859_2:
        return 'iso8859_2';
      case CloudWatchLogsEncoding.iso8859_3:
        return 'iso8859_3';
      case CloudWatchLogsEncoding.iso8859_4:
        return 'iso8859_4';
      case CloudWatchLogsEncoding.iso8859_5:
        return 'iso8859_5';
      case CloudWatchLogsEncoding.iso8859_6:
        return 'iso8859_6';
      case CloudWatchLogsEncoding.iso8859_7:
        return 'iso8859_7';
      case CloudWatchLogsEncoding.iso8859_8:
        return 'iso8859_8';
      case CloudWatchLogsEncoding.iso8859_9:
        return 'iso8859_9';
      case CloudWatchLogsEncoding.iso8859_10:
        return 'iso8859_10';
      case CloudWatchLogsEncoding.iso8859_13:
        return 'iso8859_13';
      case CloudWatchLogsEncoding.iso8859_14:
        return 'iso8859_14';
      case CloudWatchLogsEncoding.iso8859_15:
        return 'iso8859_15';
      case CloudWatchLogsEncoding.iso8859_16:
        return 'iso8859_16';
      case CloudWatchLogsEncoding.johab:
        return 'johab';
      case CloudWatchLogsEncoding.koi8R:
        return 'koi8_r';
      case CloudWatchLogsEncoding.koi8U:
        return 'koi8_u';
      case CloudWatchLogsEncoding.macCyrillic:
        return 'mac_cyrillic';
      case CloudWatchLogsEncoding.macGreek:
        return 'mac_greek';
      case CloudWatchLogsEncoding.macIceland:
        return 'mac_iceland';
      case CloudWatchLogsEncoding.macLatin2:
        return 'mac_latin2';
      case CloudWatchLogsEncoding.macRoman:
        return 'mac_roman';
      case CloudWatchLogsEncoding.macTurkish:
        return 'mac_turkish';
      case CloudWatchLogsEncoding.ptcp154:
        return 'ptcp154';
      case CloudWatchLogsEncoding.shiftJis:
        return 'shift_jis';
      case CloudWatchLogsEncoding.shiftJis_2004:
        return 'shift_jis_2004';
      case CloudWatchLogsEncoding.shiftJisx0213:
        return 'shift_jisx0213';
      case CloudWatchLogsEncoding.utf_32:
        return 'utf_32';
      case CloudWatchLogsEncoding.utf_32Be:
        return 'utf_32_be';
      case CloudWatchLogsEncoding.utf_32Le:
        return 'utf_32_le';
      case CloudWatchLogsEncoding.utf_16:
        return 'utf_16';
      case CloudWatchLogsEncoding.utf_16Be:
        return 'utf_16_be';
      case CloudWatchLogsEncoding.utf_16Le:
        return 'utf_16_le';
      case CloudWatchLogsEncoding.utf_7:
        return 'utf_7';
      case CloudWatchLogsEncoding.utf_8:
        return 'utf_8';
      case CloudWatchLogsEncoding.utf_8Sig:
        return 'utf_8_sig';
    }
  }
}

extension CloudWatchLogsEncodingFromString on String {
  CloudWatchLogsEncoding toCloudWatchLogsEncoding() {
    switch (this) {
      case 'ascii':
        return CloudWatchLogsEncoding.ascii;
      case 'big5':
        return CloudWatchLogsEncoding.big5;
      case 'big5hkscs':
        return CloudWatchLogsEncoding.big5hkscs;
      case 'cp037':
        return CloudWatchLogsEncoding.cp037;
      case 'cp424':
        return CloudWatchLogsEncoding.cp424;
      case 'cp437':
        return CloudWatchLogsEncoding.cp437;
      case 'cp500':
        return CloudWatchLogsEncoding.cp500;
      case 'cp720':
        return CloudWatchLogsEncoding.cp720;
      case 'cp737':
        return CloudWatchLogsEncoding.cp737;
      case 'cp775':
        return CloudWatchLogsEncoding.cp775;
      case 'cp850':
        return CloudWatchLogsEncoding.cp850;
      case 'cp852':
        return CloudWatchLogsEncoding.cp852;
      case 'cp855':
        return CloudWatchLogsEncoding.cp855;
      case 'cp856':
        return CloudWatchLogsEncoding.cp856;
      case 'cp857':
        return CloudWatchLogsEncoding.cp857;
      case 'cp858':
        return CloudWatchLogsEncoding.cp858;
      case 'cp860':
        return CloudWatchLogsEncoding.cp860;
      case 'cp861':
        return CloudWatchLogsEncoding.cp861;
      case 'cp862':
        return CloudWatchLogsEncoding.cp862;
      case 'cp863':
        return CloudWatchLogsEncoding.cp863;
      case 'cp864':
        return CloudWatchLogsEncoding.cp864;
      case 'cp865':
        return CloudWatchLogsEncoding.cp865;
      case 'cp866':
        return CloudWatchLogsEncoding.cp866;
      case 'cp869':
        return CloudWatchLogsEncoding.cp869;
      case 'cp874':
        return CloudWatchLogsEncoding.cp874;
      case 'cp875':
        return CloudWatchLogsEncoding.cp875;
      case 'cp932':
        return CloudWatchLogsEncoding.cp932;
      case 'cp949':
        return CloudWatchLogsEncoding.cp949;
      case 'cp950':
        return CloudWatchLogsEncoding.cp950;
      case 'cp1006':
        return CloudWatchLogsEncoding.cp1006;
      case 'cp1026':
        return CloudWatchLogsEncoding.cp1026;
      case 'cp1140':
        return CloudWatchLogsEncoding.cp1140;
      case 'cp1250':
        return CloudWatchLogsEncoding.cp1250;
      case 'cp1251':
        return CloudWatchLogsEncoding.cp1251;
      case 'cp1252':
        return CloudWatchLogsEncoding.cp1252;
      case 'cp1253':
        return CloudWatchLogsEncoding.cp1253;
      case 'cp1254':
        return CloudWatchLogsEncoding.cp1254;
      case 'cp1255':
        return CloudWatchLogsEncoding.cp1255;
      case 'cp1256':
        return CloudWatchLogsEncoding.cp1256;
      case 'cp1257':
        return CloudWatchLogsEncoding.cp1257;
      case 'cp1258':
        return CloudWatchLogsEncoding.cp1258;
      case 'euc_jp':
        return CloudWatchLogsEncoding.eucJp;
      case 'euc_jis_2004':
        return CloudWatchLogsEncoding.eucJis_2004;
      case 'euc_jisx0213':
        return CloudWatchLogsEncoding.eucJisx0213;
      case 'euc_kr':
        return CloudWatchLogsEncoding.eucKr;
      case 'gb2312':
        return CloudWatchLogsEncoding.gb2312;
      case 'gbk':
        return CloudWatchLogsEncoding.gbk;
      case 'gb18030':
        return CloudWatchLogsEncoding.gb18030;
      case 'hz':
        return CloudWatchLogsEncoding.hz;
      case 'iso2022_jp':
        return CloudWatchLogsEncoding.iso2022Jp;
      case 'iso2022_jp_1':
        return CloudWatchLogsEncoding.iso2022Jp_1;
      case 'iso2022_jp_2':
        return CloudWatchLogsEncoding.iso2022Jp_2;
      case 'iso2022_jp_2004':
        return CloudWatchLogsEncoding.iso2022Jp_2004;
      case 'iso2022_jp_3':
        return CloudWatchLogsEncoding.iso2022Jp_3;
      case 'iso2022_jp_ext':
        return CloudWatchLogsEncoding.iso2022JpExt;
      case 'iso2022_kr':
        return CloudWatchLogsEncoding.iso2022Kr;
      case 'latin_1':
        return CloudWatchLogsEncoding.latin_1;
      case 'iso8859_2':
        return CloudWatchLogsEncoding.iso8859_2;
      case 'iso8859_3':
        return CloudWatchLogsEncoding.iso8859_3;
      case 'iso8859_4':
        return CloudWatchLogsEncoding.iso8859_4;
      case 'iso8859_5':
        return CloudWatchLogsEncoding.iso8859_5;
      case 'iso8859_6':
        return CloudWatchLogsEncoding.iso8859_6;
      case 'iso8859_7':
        return CloudWatchLogsEncoding.iso8859_7;
      case 'iso8859_8':
        return CloudWatchLogsEncoding.iso8859_8;
      case 'iso8859_9':
        return CloudWatchLogsEncoding.iso8859_9;
      case 'iso8859_10':
        return CloudWatchLogsEncoding.iso8859_10;
      case 'iso8859_13':
        return CloudWatchLogsEncoding.iso8859_13;
      case 'iso8859_14':
        return CloudWatchLogsEncoding.iso8859_14;
      case 'iso8859_15':
        return CloudWatchLogsEncoding.iso8859_15;
      case 'iso8859_16':
        return CloudWatchLogsEncoding.iso8859_16;
      case 'johab':
        return CloudWatchLogsEncoding.johab;
      case 'koi8_r':
        return CloudWatchLogsEncoding.koi8R;
      case 'koi8_u':
        return CloudWatchLogsEncoding.koi8U;
      case 'mac_cyrillic':
        return CloudWatchLogsEncoding.macCyrillic;
      case 'mac_greek':
        return CloudWatchLogsEncoding.macGreek;
      case 'mac_iceland':
        return CloudWatchLogsEncoding.macIceland;
      case 'mac_latin2':
        return CloudWatchLogsEncoding.macLatin2;
      case 'mac_roman':
        return CloudWatchLogsEncoding.macRoman;
      case 'mac_turkish':
        return CloudWatchLogsEncoding.macTurkish;
      case 'ptcp154':
        return CloudWatchLogsEncoding.ptcp154;
      case 'shift_jis':
        return CloudWatchLogsEncoding.shiftJis;
      case 'shift_jis_2004':
        return CloudWatchLogsEncoding.shiftJis_2004;
      case 'shift_jisx0213':
        return CloudWatchLogsEncoding.shiftJisx0213;
      case 'utf_32':
        return CloudWatchLogsEncoding.utf_32;
      case 'utf_32_be':
        return CloudWatchLogsEncoding.utf_32Be;
      case 'utf_32_le':
        return CloudWatchLogsEncoding.utf_32Le;
      case 'utf_16':
        return CloudWatchLogsEncoding.utf_16;
      case 'utf_16_be':
        return CloudWatchLogsEncoding.utf_16Be;
      case 'utf_16_le':
        return CloudWatchLogsEncoding.utf_16Le;
      case 'utf_7':
        return CloudWatchLogsEncoding.utf_7;
      case 'utf_8':
        return CloudWatchLogsEncoding.utf_8;
      case 'utf_8_sig':
        return CloudWatchLogsEncoding.utf_8Sig;
    }
    throw Exception('$this is not known in enum CloudWatchLogsEncoding');
  }
}

/// Specifies where to start to read data (start_of_file or end_of_file). The
/// default is start_of_file. It's only used if there is no state persisted for
/// that log stream.
enum CloudWatchLogsInitialPosition {
  startOfFile,
  endOfFile,
}

extension CloudWatchLogsInitialPositionValueExtension
    on CloudWatchLogsInitialPosition {
  String toValue() {
    switch (this) {
      case CloudWatchLogsInitialPosition.startOfFile:
        return 'start_of_file';
      case CloudWatchLogsInitialPosition.endOfFile:
        return 'end_of_file';
    }
  }
}

extension CloudWatchLogsInitialPositionFromString on String {
  CloudWatchLogsInitialPosition toCloudWatchLogsInitialPosition() {
    switch (this) {
      case 'start_of_file':
        return CloudWatchLogsInitialPosition.startOfFile;
      case 'end_of_file':
        return CloudWatchLogsInitialPosition.endOfFile;
    }
    throw Exception('$this is not known in enum CloudWatchLogsInitialPosition');
  }
}

/// Describes the CloudWatch Logs configuration for a layer. For detailed
/// information about members of this data type, see the <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AgentReference.html">CloudWatch
/// Logs Agent Reference</a>.
class CloudWatchLogsLogStream {
  /// Specifies the max number of log events in a batch, up to 10000. The default
  /// value is 1000.
  final int? batchCount;

  /// Specifies the maximum size of log events in a batch, in bytes, up to 1048576
  /// bytes. The default value is 32768 bytes. This size is calculated as the sum
  /// of all event messages in UTF-8, plus 26 bytes for each log event.
  final int? batchSize;

  /// Specifies the time duration for the batching of log events. The minimum
  /// value is 5000ms and default value is 5000ms.
  final int? bufferDuration;

  /// Specifies how the time stamp is extracted from logs. For more information,
  /// see the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AgentReference.html">CloudWatch
  /// Logs Agent Reference</a>.
  final String? datetimeFormat;

  /// Specifies the encoding of the log file so that the file can be read
  /// correctly. The default is <code>utf_8</code>. Encodings supported by Python
  /// <code>codecs.decode()</code> can be used here.
  final CloudWatchLogsEncoding? encoding;

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
  final String? file;

  /// Specifies the range of lines for identifying a file. The valid values are
  /// one number, or two dash-delimited numbers, such as '1', '2-5'. The default
  /// value is '1', meaning the first line is used to calculate the fingerprint.
  /// Fingerprint lines are not sent to CloudWatch Logs unless all specified lines
  /// are available.
  final String? fileFingerprintLines;

  /// Specifies where to start to read data (start_of_file or end_of_file). The
  /// default is start_of_file. This setting is only used if there is no state
  /// persisted for that log stream.
  final CloudWatchLogsInitialPosition? initialPosition;

  /// Specifies the destination log group. A log group is created automatically if
  /// it doesn't already exist. Log group names can be between 1 and 512
  /// characters long. Allowed characters include a-z, A-Z, 0-9, '_' (underscore),
  /// '-' (hyphen), '/' (forward slash), and '.' (period).
  final String? logGroupName;

  /// Specifies the pattern for identifying the start of a log message.
  final String? multiLineStartPattern;

  /// Specifies the time zone of log event time stamps.
  final CloudWatchLogsTimeZone? timeZone;

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

  factory CloudWatchLogsLogStream.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogsLogStream(
      batchCount: json['BatchCount'] as int?,
      batchSize: json['BatchSize'] as int?,
      bufferDuration: json['BufferDuration'] as int?,
      datetimeFormat: json['DatetimeFormat'] as String?,
      encoding: (json['Encoding'] as String?)?.toCloudWatchLogsEncoding(),
      file: json['File'] as String?,
      fileFingerprintLines: json['FileFingerprintLines'] as String?,
      initialPosition: (json['InitialPosition'] as String?)
          ?.toCloudWatchLogsInitialPosition(),
      logGroupName: json['LogGroupName'] as String?,
      multiLineStartPattern: json['MultiLineStartPattern'] as String?,
      timeZone: (json['TimeZone'] as String?)?.toCloudWatchLogsTimeZone(),
    );
  }

  Map<String, dynamic> toJson() {
    final batchCount = this.batchCount;
    final batchSize = this.batchSize;
    final bufferDuration = this.bufferDuration;
    final datetimeFormat = this.datetimeFormat;
    final encoding = this.encoding;
    final file = this.file;
    final fileFingerprintLines = this.fileFingerprintLines;
    final initialPosition = this.initialPosition;
    final logGroupName = this.logGroupName;
    final multiLineStartPattern = this.multiLineStartPattern;
    final timeZone = this.timeZone;
    return {
      if (batchCount != null) 'BatchCount': batchCount,
      if (batchSize != null) 'BatchSize': batchSize,
      if (bufferDuration != null) 'BufferDuration': bufferDuration,
      if (datetimeFormat != null) 'DatetimeFormat': datetimeFormat,
      if (encoding != null) 'Encoding': encoding.toValue(),
      if (file != null) 'File': file,
      if (fileFingerprintLines != null)
        'FileFingerprintLines': fileFingerprintLines,
      if (initialPosition != null) 'InitialPosition': initialPosition.toValue(),
      if (logGroupName != null) 'LogGroupName': logGroupName,
      if (multiLineStartPattern != null)
        'MultiLineStartPattern': multiLineStartPattern,
      if (timeZone != null) 'TimeZone': timeZone.toValue(),
    };
  }
}

/// The preferred time zone for logs streamed to CloudWatch Logs. Valid values
/// are <code>LOCAL</code> and <code>UTC</code>, for Coordinated Universal Time.
enum CloudWatchLogsTimeZone {
  local,
  utc,
}

extension CloudWatchLogsTimeZoneValueExtension on CloudWatchLogsTimeZone {
  String toValue() {
    switch (this) {
      case CloudWatchLogsTimeZone.local:
        return 'LOCAL';
      case CloudWatchLogsTimeZone.utc:
        return 'UTC';
    }
  }
}

extension CloudWatchLogsTimeZoneFromString on String {
  CloudWatchLogsTimeZone toCloudWatchLogsTimeZone() {
    switch (this) {
      case 'LOCAL':
        return CloudWatchLogsTimeZone.local;
      case 'UTC':
        return CloudWatchLogsTimeZone.utc;
    }
    throw Exception('$this is not known in enum CloudWatchLogsTimeZone');
  }
}

/// Describes a command.
class Command {
  /// Date and time when the command was acknowledged.
  final String? acknowledgedAt;

  /// The command ID.
  final String? commandId;

  /// Date when the command completed.
  final String? completedAt;

  /// Date and time when the command was run.
  final String? createdAt;

  /// The command deployment ID.
  final String? deploymentId;

  /// The command exit code.
  final int? exitCode;

  /// The ID of the instance where the command was executed.
  final String? instanceId;

  /// The URL of the command log.
  final String? logUrl;

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
  final String? status;

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
  final String? type;

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

  factory Command.fromJson(Map<String, dynamic> json) {
    return Command(
      acknowledgedAt: json['AcknowledgedAt'] as String?,
      commandId: json['CommandId'] as String?,
      completedAt: json['CompletedAt'] as String?,
      createdAt: json['CreatedAt'] as String?,
      deploymentId: json['DeploymentId'] as String?,
      exitCode: json['ExitCode'] as int?,
      instanceId: json['InstanceId'] as String?,
      logUrl: json['LogUrl'] as String?,
      status: json['Status'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final acknowledgedAt = this.acknowledgedAt;
    final commandId = this.commandId;
    final completedAt = this.completedAt;
    final createdAt = this.createdAt;
    final deploymentId = this.deploymentId;
    final exitCode = this.exitCode;
    final instanceId = this.instanceId;
    final logUrl = this.logUrl;
    final status = this.status;
    final type = this.type;
    return {
      if (acknowledgedAt != null) 'AcknowledgedAt': acknowledgedAt,
      if (commandId != null) 'CommandId': commandId,
      if (completedAt != null) 'CompletedAt': completedAt,
      if (createdAt != null) 'CreatedAt': createdAt,
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (exitCode != null) 'ExitCode': exitCode,
      if (instanceId != null) 'InstanceId': instanceId,
      if (logUrl != null) 'LogUrl': logUrl,
      if (status != null) 'Status': status,
      if (type != null) 'Type': type,
    };
  }
}

/// Contains the response to a <code>CreateApp</code> request.
class CreateAppResult {
  /// The app ID.
  final String? appId;

  CreateAppResult({
    this.appId,
  });

  factory CreateAppResult.fromJson(Map<String, dynamic> json) {
    return CreateAppResult(
      appId: json['AppId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    return {
      if (appId != null) 'AppId': appId,
    };
  }
}

/// Contains the response to a <code>CreateDeployment</code> request.
class CreateDeploymentResult {
  /// The deployment ID, which can be used with other requests to identify the
  /// deployment.
  final String? deploymentId;

  CreateDeploymentResult({
    this.deploymentId,
  });

  factory CreateDeploymentResult.fromJson(Map<String, dynamic> json) {
    return CreateDeploymentResult(
      deploymentId: json['DeploymentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    return {
      if (deploymentId != null) 'DeploymentId': deploymentId,
    };
  }
}

/// Contains the response to a <code>CreateInstance</code> request.
class CreateInstanceResult {
  /// The instance ID.
  final String? instanceId;

  CreateInstanceResult({
    this.instanceId,
  });

  factory CreateInstanceResult.fromJson(Map<String, dynamic> json) {
    return CreateInstanceResult(
      instanceId: json['InstanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    return {
      if (instanceId != null) 'InstanceId': instanceId,
    };
  }
}

/// Contains the response to a <code>CreateLayer</code> request.
class CreateLayerResult {
  /// The layer ID.
  final String? layerId;

  CreateLayerResult({
    this.layerId,
  });

  factory CreateLayerResult.fromJson(Map<String, dynamic> json) {
    return CreateLayerResult(
      layerId: json['LayerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final layerId = this.layerId;
    return {
      if (layerId != null) 'LayerId': layerId,
    };
  }
}

/// Contains the response to a <code>CreateStack</code> request.
class CreateStackResult {
  /// The stack ID, which is an opaque string that you use to identify the stack
  /// when performing actions such as <code>DescribeStacks</code>.
  final String? stackId;

  CreateStackResult({
    this.stackId,
  });

  factory CreateStackResult.fromJson(Map<String, dynamic> json) {
    return CreateStackResult(
      stackId: json['StackId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stackId = this.stackId;
    return {
      if (stackId != null) 'StackId': stackId,
    };
  }
}

/// Contains the response to a <code>CreateUserProfile</code> request.
class CreateUserProfileResult {
  /// The user's IAM ARN.
  final String? iamUserArn;

  CreateUserProfileResult({
    this.iamUserArn,
  });

  factory CreateUserProfileResult.fromJson(Map<String, dynamic> json) {
    return CreateUserProfileResult(
      iamUserArn: json['IamUserArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final iamUserArn = this.iamUserArn;
    return {
      if (iamUserArn != null) 'IamUserArn': iamUserArn,
    };
  }
}

/// Describes an app's data source.
class DataSource {
  /// The data source's ARN.
  final String? arn;

  /// The database name.
  final String? databaseName;

  /// The data source's type, <code>AutoSelectOpsworksMysqlInstance</code>,
  /// <code>OpsworksMysqlInstance</code>, <code>RdsDbInstance</code>, or
  /// <code>None</code>.
  final String? type;

  DataSource({
    this.arn,
    this.databaseName,
    this.type,
  });

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      arn: json['Arn'] as String?,
      databaseName: json['DatabaseName'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final databaseName = this.databaseName;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (type != null) 'Type': type,
    };
  }
}

/// Describes a deployment of a stack or app.
class Deployment {
  /// The app ID.
  final String? appId;

  /// Used to specify a stack or deployment command.
  final DeploymentCommand? command;

  /// A user-defined comment.
  final String? comment;

  /// Date when the deployment completed.
  final String? completedAt;

  /// Date when the deployment was created.
  final String? createdAt;

  /// A string that contains user-defined custom JSON. It can be used to override
  /// the corresponding default stack configuration attribute values for stack or
  /// to pass data to recipes. The string should be in the following format:
  ///
  /// <code>"{\"key1\": \"value1\", \"key2\": \"value2\",...}"</code>
  ///
  /// For more information on custom JSON, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html">Use
  /// Custom JSON to Modify the Stack Configuration Attributes</a>.
  final String? customJson;

  /// The deployment ID.
  final String? deploymentId;

  /// The deployment duration.
  final int? duration;

  /// The user's IAM ARN.
  final String? iamUserArn;

  /// The IDs of the target instances.
  final List<String>? instanceIds;

  /// The stack ID.
  final String? stackId;

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
  final String? status;

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

  factory Deployment.fromJson(Map<String, dynamic> json) {
    return Deployment(
      appId: json['AppId'] as String?,
      command: json['Command'] != null
          ? DeploymentCommand.fromJson(json['Command'] as Map<String, dynamic>)
          : null,
      comment: json['Comment'] as String?,
      completedAt: json['CompletedAt'] as String?,
      createdAt: json['CreatedAt'] as String?,
      customJson: json['CustomJson'] as String?,
      deploymentId: json['DeploymentId'] as String?,
      duration: json['Duration'] as int?,
      iamUserArn: json['IamUserArn'] as String?,
      instanceIds: (json['InstanceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      stackId: json['StackId'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final command = this.command;
    final comment = this.comment;
    final completedAt = this.completedAt;
    final createdAt = this.createdAt;
    final customJson = this.customJson;
    final deploymentId = this.deploymentId;
    final duration = this.duration;
    final iamUserArn = this.iamUserArn;
    final instanceIds = this.instanceIds;
    final stackId = this.stackId;
    final status = this.status;
    return {
      if (appId != null) 'AppId': appId,
      if (command != null) 'Command': command,
      if (comment != null) 'Comment': comment,
      if (completedAt != null) 'CompletedAt': completedAt,
      if (createdAt != null) 'CreatedAt': createdAt,
      if (customJson != null) 'CustomJson': customJson,
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (duration != null) 'Duration': duration,
      if (iamUserArn != null) 'IamUserArn': iamUserArn,
      if (instanceIds != null) 'InstanceIds': instanceIds,
      if (stackId != null) 'StackId': stackId,
      if (status != null) 'Status': status,
    };
  }
}

/// Used to specify a stack or deployment command.
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
  /// update an app, OpsWorks Stacks stores the previous version, up to a maximum
  /// of five versions. You can use this command to roll an app back as many as
  /// four versions.
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
  /// <code>upgrade_os_to</code> - Specifies the Amazon Linux version that you
  /// want instances to run, such as <code>Amazon Linux 2</code>. You must also
  /// set the <code>allow_reboot</code> argument to true.
  /// </li>
  /// <li>
  /// <code>allow_reboot</code> - Specifies whether to allow OpsWorks Stacks to
  /// reboot the instances if necessary, after installing the updates. This
  /// argument can be set to either <code>true</code> or <code>false</code>. The
  /// default value is <code>false</code>.
  /// </li>
  /// </ul>
  /// For example, to upgrade an instance to Amazon Linux 2018.03, set
  /// <code>Args</code> to the following.
  ///
  /// <code> { "upgrade_os_to":["Amazon Linux 2018.03"], "allow_reboot":["true"] }
  /// </code>
  final Map<String, List<String>>? args;

  DeploymentCommand({
    required this.name,
    this.args,
  });

  factory DeploymentCommand.fromJson(Map<String, dynamic> json) {
    return DeploymentCommand(
      name: (json['Name'] as String).toDeploymentCommandName(),
      args: (json['Args'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k, (e as List).whereNotNull().map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final args = this.args;
    return {
      'Name': name.toValue(),
      if (args != null) 'Args': args,
    };
  }
}

enum DeploymentCommandName {
  installDependencies,
  updateDependencies,
  updateCustomCookbooks,
  executeRecipes,
  configure,
  setup,
  deploy,
  rollback,
  start,
  stop,
  restart,
  undeploy,
}

extension DeploymentCommandNameValueExtension on DeploymentCommandName {
  String toValue() {
    switch (this) {
      case DeploymentCommandName.installDependencies:
        return 'install_dependencies';
      case DeploymentCommandName.updateDependencies:
        return 'update_dependencies';
      case DeploymentCommandName.updateCustomCookbooks:
        return 'update_custom_cookbooks';
      case DeploymentCommandName.executeRecipes:
        return 'execute_recipes';
      case DeploymentCommandName.configure:
        return 'configure';
      case DeploymentCommandName.setup:
        return 'setup';
      case DeploymentCommandName.deploy:
        return 'deploy';
      case DeploymentCommandName.rollback:
        return 'rollback';
      case DeploymentCommandName.start:
        return 'start';
      case DeploymentCommandName.stop:
        return 'stop';
      case DeploymentCommandName.restart:
        return 'restart';
      case DeploymentCommandName.undeploy:
        return 'undeploy';
    }
  }
}

extension DeploymentCommandNameFromString on String {
  DeploymentCommandName toDeploymentCommandName() {
    switch (this) {
      case 'install_dependencies':
        return DeploymentCommandName.installDependencies;
      case 'update_dependencies':
        return DeploymentCommandName.updateDependencies;
      case 'update_custom_cookbooks':
        return DeploymentCommandName.updateCustomCookbooks;
      case 'execute_recipes':
        return DeploymentCommandName.executeRecipes;
      case 'configure':
        return DeploymentCommandName.configure;
      case 'setup':
        return DeploymentCommandName.setup;
      case 'deploy':
        return DeploymentCommandName.deploy;
      case 'rollback':
        return DeploymentCommandName.rollback;
      case 'start':
        return DeploymentCommandName.start;
      case 'stop':
        return DeploymentCommandName.stop;
      case 'restart':
        return DeploymentCommandName.restart;
      case 'undeploy':
        return DeploymentCommandName.undeploy;
    }
    throw Exception('$this is not known in enum DeploymentCommandName');
  }
}

/// Contains the response to a <code>DescribeAgentVersions</code> request.
class DescribeAgentVersionsResult {
  /// The agent versions for the specified stack or configuration manager. Note
  /// that this value is the complete version number, not the abbreviated number
  /// used by the console.
  final List<AgentVersion>? agentVersions;

  DescribeAgentVersionsResult({
    this.agentVersions,
  });

  factory DescribeAgentVersionsResult.fromJson(Map<String, dynamic> json) {
    return DescribeAgentVersionsResult(
      agentVersions: (json['AgentVersions'] as List?)
          ?.whereNotNull()
          .map((e) => AgentVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentVersions = this.agentVersions;
    return {
      if (agentVersions != null) 'AgentVersions': agentVersions,
    };
  }
}

/// Contains the response to a <code>DescribeApps</code> request.
class DescribeAppsResult {
  /// An array of <code>App</code> objects that describe the specified apps.
  final List<App>? apps;

  DescribeAppsResult({
    this.apps,
  });

  factory DescribeAppsResult.fromJson(Map<String, dynamic> json) {
    return DescribeAppsResult(
      apps: (json['Apps'] as List?)
          ?.whereNotNull()
          .map((e) => App.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final apps = this.apps;
    return {
      if (apps != null) 'Apps': apps,
    };
  }
}

/// Contains the response to a <code>DescribeCommands</code> request.
class DescribeCommandsResult {
  /// An array of <code>Command</code> objects that describe each of the specified
  /// commands.
  final List<Command>? commands;

  DescribeCommandsResult({
    this.commands,
  });

  factory DescribeCommandsResult.fromJson(Map<String, dynamic> json) {
    return DescribeCommandsResult(
      commands: (json['Commands'] as List?)
          ?.whereNotNull()
          .map((e) => Command.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final commands = this.commands;
    return {
      if (commands != null) 'Commands': commands,
    };
  }
}

/// Contains the response to a <code>DescribeDeployments</code> request.
class DescribeDeploymentsResult {
  /// An array of <code>Deployment</code> objects that describe the deployments.
  final List<Deployment>? deployments;

  DescribeDeploymentsResult({
    this.deployments,
  });

  factory DescribeDeploymentsResult.fromJson(Map<String, dynamic> json) {
    return DescribeDeploymentsResult(
      deployments: (json['Deployments'] as List?)
          ?.whereNotNull()
          .map((e) => Deployment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deployments = this.deployments;
    return {
      if (deployments != null) 'Deployments': deployments,
    };
  }
}

/// Contains the response to a <code>DescribeEcsClusters</code> request.
class DescribeEcsClustersResult {
  /// A list of <code>EcsCluster</code> objects containing the cluster
  /// descriptions.
  final List<EcsCluster>? ecsClusters;

  /// If a paginated request does not return all of the remaining results, this
  /// parameter is set to a token that you can assign to the request object's
  /// <code>NextToken</code> parameter to retrieve the next set of results. If the
  /// previous paginated request returned all of the remaining results, this
  /// parameter is set to <code>null</code>.
  final String? nextToken;

  DescribeEcsClustersResult({
    this.ecsClusters,
    this.nextToken,
  });

  factory DescribeEcsClustersResult.fromJson(Map<String, dynamic> json) {
    return DescribeEcsClustersResult(
      ecsClusters: (json['EcsClusters'] as List?)
          ?.whereNotNull()
          .map((e) => EcsCluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ecsClusters = this.ecsClusters;
    final nextToken = this.nextToken;
    return {
      if (ecsClusters != null) 'EcsClusters': ecsClusters,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Contains the response to a <code>DescribeElasticIps</code> request.
class DescribeElasticIpsResult {
  /// An <code>ElasticIps</code> object that describes the specified Elastic IP
  /// addresses.
  final List<ElasticIp>? elasticIps;

  DescribeElasticIpsResult({
    this.elasticIps,
  });

  factory DescribeElasticIpsResult.fromJson(Map<String, dynamic> json) {
    return DescribeElasticIpsResult(
      elasticIps: (json['ElasticIps'] as List?)
          ?.whereNotNull()
          .map((e) => ElasticIp.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final elasticIps = this.elasticIps;
    return {
      if (elasticIps != null) 'ElasticIps': elasticIps,
    };
  }
}

/// Contains the response to a <code>DescribeElasticLoadBalancers</code>
/// request.
class DescribeElasticLoadBalancersResult {
  /// A list of <code>ElasticLoadBalancer</code> objects that describe the
  /// specified Elastic Load Balancing instances.
  final List<ElasticLoadBalancer>? elasticLoadBalancers;

  DescribeElasticLoadBalancersResult({
    this.elasticLoadBalancers,
  });

  factory DescribeElasticLoadBalancersResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeElasticLoadBalancersResult(
      elasticLoadBalancers: (json['ElasticLoadBalancers'] as List?)
          ?.whereNotNull()
          .map((e) => ElasticLoadBalancer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final elasticLoadBalancers = this.elasticLoadBalancers;
    return {
      if (elasticLoadBalancers != null)
        'ElasticLoadBalancers': elasticLoadBalancers,
    };
  }
}

/// Contains the response to a <code>DescribeInstances</code> request.
class DescribeInstancesResult {
  /// An array of <code>Instance</code> objects that describe the instances.
  final List<Instance>? instances;

  DescribeInstancesResult({
    this.instances,
  });

  factory DescribeInstancesResult.fromJson(Map<String, dynamic> json) {
    return DescribeInstancesResult(
      instances: (json['Instances'] as List?)
          ?.whereNotNull()
          .map((e) => Instance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    return {
      if (instances != null) 'Instances': instances,
    };
  }
}

/// Contains the response to a <code>DescribeLayers</code> request.
class DescribeLayersResult {
  /// An array of <code>Layer</code> objects that describe the layers.
  final List<Layer>? layers;

  DescribeLayersResult({
    this.layers,
  });

  factory DescribeLayersResult.fromJson(Map<String, dynamic> json) {
    return DescribeLayersResult(
      layers: (json['Layers'] as List?)
          ?.whereNotNull()
          .map((e) => Layer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final layers = this.layers;
    return {
      if (layers != null) 'Layers': layers,
    };
  }
}

/// Contains the response to a <code>DescribeLoadBasedAutoScaling</code>
/// request.
class DescribeLoadBasedAutoScalingResult {
  /// An array of <code>LoadBasedAutoScalingConfiguration</code> objects that
  /// describe each layer's configuration.
  final List<LoadBasedAutoScalingConfiguration>?
      loadBasedAutoScalingConfigurations;

  DescribeLoadBasedAutoScalingResult({
    this.loadBasedAutoScalingConfigurations,
  });

  factory DescribeLoadBasedAutoScalingResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeLoadBasedAutoScalingResult(
      loadBasedAutoScalingConfigurations:
          (json['LoadBasedAutoScalingConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => LoadBasedAutoScalingConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final loadBasedAutoScalingConfigurations =
        this.loadBasedAutoScalingConfigurations;
    return {
      if (loadBasedAutoScalingConfigurations != null)
        'LoadBasedAutoScalingConfigurations':
            loadBasedAutoScalingConfigurations,
    };
  }
}

/// Contains the response to a <code>DescribeMyUserProfile</code> request.
class DescribeMyUserProfileResult {
  /// A <code>UserProfile</code> object that describes the user's SSH information.
  final SelfUserProfile? userProfile;

  DescribeMyUserProfileResult({
    this.userProfile,
  });

  factory DescribeMyUserProfileResult.fromJson(Map<String, dynamic> json) {
    return DescribeMyUserProfileResult(
      userProfile: json['UserProfile'] != null
          ? SelfUserProfile.fromJson(
              json['UserProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final userProfile = this.userProfile;
    return {
      if (userProfile != null) 'UserProfile': userProfile,
    };
  }
}

/// The response to a <code>DescribeOperatingSystems</code> request.
class DescribeOperatingSystemsResponse {
  /// Contains information in response to a <code>DescribeOperatingSystems</code>
  /// request.
  final List<OperatingSystem>? operatingSystems;

  DescribeOperatingSystemsResponse({
    this.operatingSystems,
  });

  factory DescribeOperatingSystemsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeOperatingSystemsResponse(
      operatingSystems: (json['OperatingSystems'] as List?)
          ?.whereNotNull()
          .map((e) => OperatingSystem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operatingSystems = this.operatingSystems;
    return {
      if (operatingSystems != null) 'OperatingSystems': operatingSystems,
    };
  }
}

/// Contains the response to a <code>DescribePermissions</code> request.
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
  final List<Permission>? permissions;

  DescribePermissionsResult({
    this.permissions,
  });

  factory DescribePermissionsResult.fromJson(Map<String, dynamic> json) {
    return DescribePermissionsResult(
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => Permission.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final permissions = this.permissions;
    return {
      if (permissions != null) 'Permissions': permissions,
    };
  }
}

/// Contains the response to a <code>DescribeRaidArrays</code> request.
class DescribeRaidArraysResult {
  /// A <code>RaidArrays</code> object that describes the specified RAID arrays.
  final List<RaidArray>? raidArrays;

  DescribeRaidArraysResult({
    this.raidArrays,
  });

  factory DescribeRaidArraysResult.fromJson(Map<String, dynamic> json) {
    return DescribeRaidArraysResult(
      raidArrays: (json['RaidArrays'] as List?)
          ?.whereNotNull()
          .map((e) => RaidArray.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final raidArrays = this.raidArrays;
    return {
      if (raidArrays != null) 'RaidArrays': raidArrays,
    };
  }
}

/// Contains the response to a <code>DescribeRdsDbInstances</code> request.
class DescribeRdsDbInstancesResult {
  /// An a array of <code>RdsDbInstance</code> objects that describe the
  /// instances.
  final List<RdsDbInstance>? rdsDbInstances;

  DescribeRdsDbInstancesResult({
    this.rdsDbInstances,
  });

  factory DescribeRdsDbInstancesResult.fromJson(Map<String, dynamic> json) {
    return DescribeRdsDbInstancesResult(
      rdsDbInstances: (json['RdsDbInstances'] as List?)
          ?.whereNotNull()
          .map((e) => RdsDbInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rdsDbInstances = this.rdsDbInstances;
    return {
      if (rdsDbInstances != null) 'RdsDbInstances': rdsDbInstances,
    };
  }
}

/// Contains the response to a <code>DescribeServiceErrors</code> request.
class DescribeServiceErrorsResult {
  /// An array of <code>ServiceError</code> objects that describe the specified
  /// service errors.
  final List<ServiceError>? serviceErrors;

  DescribeServiceErrorsResult({
    this.serviceErrors,
  });

  factory DescribeServiceErrorsResult.fromJson(Map<String, dynamic> json) {
    return DescribeServiceErrorsResult(
      serviceErrors: (json['ServiceErrors'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceErrors = this.serviceErrors;
    return {
      if (serviceErrors != null) 'ServiceErrors': serviceErrors,
    };
  }
}

/// Contains the response to a <code>DescribeStackProvisioningParameters</code>
/// request.
class DescribeStackProvisioningParametersResult {
  /// The OpsWorks Stacks agent installer's URL.
  final String? agentInstallerUrl;

  /// An embedded object that contains the provisioning parameters.
  final Map<String, String>? parameters;

  DescribeStackProvisioningParametersResult({
    this.agentInstallerUrl,
    this.parameters,
  });

  factory DescribeStackProvisioningParametersResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeStackProvisioningParametersResult(
      agentInstallerUrl: json['AgentInstallerUrl'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final agentInstallerUrl = this.agentInstallerUrl;
    final parameters = this.parameters;
    return {
      if (agentInstallerUrl != null) 'AgentInstallerUrl': agentInstallerUrl,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// Contains the response to a <code>DescribeStackSummary</code> request.
class DescribeStackSummaryResult {
  /// A <code>StackSummary</code> object that contains the results.
  final StackSummary? stackSummary;

  DescribeStackSummaryResult({
    this.stackSummary,
  });

  factory DescribeStackSummaryResult.fromJson(Map<String, dynamic> json) {
    return DescribeStackSummaryResult(
      stackSummary: json['StackSummary'] != null
          ? StackSummary.fromJson(json['StackSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stackSummary = this.stackSummary;
    return {
      if (stackSummary != null) 'StackSummary': stackSummary,
    };
  }
}

/// Contains the response to a <code>DescribeStacks</code> request.
class DescribeStacksResult {
  /// An array of <code>Stack</code> objects that describe the stacks.
  final List<Stack>? stacks;

  DescribeStacksResult({
    this.stacks,
  });

  factory DescribeStacksResult.fromJson(Map<String, dynamic> json) {
    return DescribeStacksResult(
      stacks: (json['Stacks'] as List?)
          ?.whereNotNull()
          .map((e) => Stack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final stacks = this.stacks;
    return {
      if (stacks != null) 'Stacks': stacks,
    };
  }
}

/// Contains the response to a <code>DescribeTimeBasedAutoScaling</code>
/// request.
class DescribeTimeBasedAutoScalingResult {
  /// An array of <code>TimeBasedAutoScalingConfiguration</code> objects that
  /// describe the configuration for the specified instances.
  final List<TimeBasedAutoScalingConfiguration>?
      timeBasedAutoScalingConfigurations;

  DescribeTimeBasedAutoScalingResult({
    this.timeBasedAutoScalingConfigurations,
  });

  factory DescribeTimeBasedAutoScalingResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeTimeBasedAutoScalingResult(
      timeBasedAutoScalingConfigurations:
          (json['TimeBasedAutoScalingConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => TimeBasedAutoScalingConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final timeBasedAutoScalingConfigurations =
        this.timeBasedAutoScalingConfigurations;
    return {
      if (timeBasedAutoScalingConfigurations != null)
        'TimeBasedAutoScalingConfigurations':
            timeBasedAutoScalingConfigurations,
    };
  }
}

/// Contains the response to a <code>DescribeUserProfiles</code> request.
class DescribeUserProfilesResult {
  /// A <code>Users</code> object that describes the specified users.
  final List<UserProfile>? userProfiles;

  DescribeUserProfilesResult({
    this.userProfiles,
  });

  factory DescribeUserProfilesResult.fromJson(Map<String, dynamic> json) {
    return DescribeUserProfilesResult(
      userProfiles: (json['UserProfiles'] as List?)
          ?.whereNotNull()
          .map((e) => UserProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final userProfiles = this.userProfiles;
    return {
      if (userProfiles != null) 'UserProfiles': userProfiles,
    };
  }
}

/// Contains the response to a <code>DescribeVolumes</code> request.
class DescribeVolumesResult {
  /// An array of volume IDs.
  final List<Volume>? volumes;

  DescribeVolumesResult({
    this.volumes,
  });

  factory DescribeVolumesResult.fromJson(Map<String, dynamic> json) {
    return DescribeVolumesResult(
      volumes: (json['Volumes'] as List?)
          ?.whereNotNull()
          .map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final volumes = this.volumes;
    return {
      if (volumes != null) 'Volumes': volumes,
    };
  }
}

/// Describes an Amazon EBS volume. This data type maps directly to the Amazon
/// EC2 <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_EbsBlockDevice.html">EbsBlockDevice</a>
/// data type.
class EbsBlockDevice {
  /// Whether the volume is deleted on instance termination.
  final bool? deleteOnTermination;

  /// The number of I/O operations per second (IOPS) that the volume supports. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_EbsBlockDevice.html">EbsBlockDevice</a>.
  final int? iops;

  /// The snapshot ID.
  final String? snapshotId;

  /// The volume size, in GiB. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_EbsBlockDevice.html">EbsBlockDevice</a>.
  final int? volumeSize;

  /// The volume type. <code>gp2</code> for General Purpose (SSD) volumes,
  /// <code>io1</code> for Provisioned IOPS (SSD) volumes, <code>st1</code> for
  /// Throughput Optimized hard disk drives (HDD), <code>sc1</code> for Cold
  /// HDD,and <code>standard</code> for Magnetic volumes.
  ///
  /// If you specify the <code>io1</code> volume type, you must also specify a
  /// value for the <code>Iops</code> attribute. The maximum ratio of provisioned
  /// IOPS to requested volume size (in GiB) is 50:1. Amazon Web Services uses the
  /// default volume size (in GiB) specified in the AMI attributes to set IOPS to
  /// 50 x (volume size).
  final VolumeType? volumeType;

  EbsBlockDevice({
    this.deleteOnTermination,
    this.iops,
    this.snapshotId,
    this.volumeSize,
    this.volumeType,
  });

  factory EbsBlockDevice.fromJson(Map<String, dynamic> json) {
    return EbsBlockDevice(
      deleteOnTermination: json['DeleteOnTermination'] as bool?,
      iops: json['Iops'] as int?,
      snapshotId: json['SnapshotId'] as String?,
      volumeSize: json['VolumeSize'] as int?,
      volumeType: (json['VolumeType'] as String?)?.toVolumeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final deleteOnTermination = this.deleteOnTermination;
    final iops = this.iops;
    final snapshotId = this.snapshotId;
    final volumeSize = this.volumeSize;
    final volumeType = this.volumeType;
    return {
      if (deleteOnTermination != null)
        'DeleteOnTermination': deleteOnTermination,
      if (iops != null) 'Iops': iops,
      if (snapshotId != null) 'SnapshotId': snapshotId,
      if (volumeSize != null) 'VolumeSize': volumeSize,
      if (volumeType != null) 'VolumeType': volumeType.toValue(),
    };
  }
}

/// Describes a registered Amazon ECS cluster.
class EcsCluster {
  /// The cluster's ARN.
  final String? ecsClusterArn;

  /// The cluster name.
  final String? ecsClusterName;

  /// The time and date that the cluster was registered with the stack.
  final String? registeredAt;

  /// The stack ID.
  final String? stackId;

  EcsCluster({
    this.ecsClusterArn,
    this.ecsClusterName,
    this.registeredAt,
    this.stackId,
  });

  factory EcsCluster.fromJson(Map<String, dynamic> json) {
    return EcsCluster(
      ecsClusterArn: json['EcsClusterArn'] as String?,
      ecsClusterName: json['EcsClusterName'] as String?,
      registeredAt: json['RegisteredAt'] as String?,
      stackId: json['StackId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ecsClusterArn = this.ecsClusterArn;
    final ecsClusterName = this.ecsClusterName;
    final registeredAt = this.registeredAt;
    final stackId = this.stackId;
    return {
      if (ecsClusterArn != null) 'EcsClusterArn': ecsClusterArn,
      if (ecsClusterName != null) 'EcsClusterName': ecsClusterName,
      if (registeredAt != null) 'RegisteredAt': registeredAt,
      if (stackId != null) 'StackId': stackId,
    };
  }
}

/// Describes an Elastic IP address.
class ElasticIp {
  /// The domain.
  final String? domain;

  /// The ID of the instance that the address is attached to.
  final String? instanceId;

  /// The IP address.
  final String? ip;

  /// The name, which can be a maximum of 32 characters.
  final String? name;

  /// The Amazon Web Services Region. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  final String? region;

  ElasticIp({
    this.domain,
    this.instanceId,
    this.ip,
    this.name,
    this.region,
  });

  factory ElasticIp.fromJson(Map<String, dynamic> json) {
    return ElasticIp(
      domain: json['Domain'] as String?,
      instanceId: json['InstanceId'] as String?,
      ip: json['Ip'] as String?,
      name: json['Name'] as String?,
      region: json['Region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    final instanceId = this.instanceId;
    final ip = this.ip;
    final name = this.name;
    final region = this.region;
    return {
      if (domain != null) 'Domain': domain,
      if (instanceId != null) 'InstanceId': instanceId,
      if (ip != null) 'Ip': ip,
      if (name != null) 'Name': name,
      if (region != null) 'Region': region,
    };
  }
}

/// Describes an Elastic Load Balancing instance.
class ElasticLoadBalancer {
  /// A list of Availability Zones.
  final List<String>? availabilityZones;

  /// The instance's public DNS name.
  final String? dnsName;

  /// A list of the EC2 instances for which the Elastic Load Balancing instance is
  /// managing traffic.
  final List<String>? ec2InstanceIds;

  /// The Elastic Load Balancing instance name.
  final String? elasticLoadBalancerName;

  /// The ID of the layer to which the instance is attached.
  final String? layerId;

  /// The instance's Amazon Web Services Region.
  final String? region;

  /// The ID of the stack with which the instance is associated.
  final String? stackId;

  /// A list of subnet IDs, if the stack is running in a VPC.
  final List<String>? subnetIds;

  /// The VPC ID.
  final String? vpcId;

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

  factory ElasticLoadBalancer.fromJson(Map<String, dynamic> json) {
    return ElasticLoadBalancer(
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      dnsName: json['DnsName'] as String?,
      ec2InstanceIds: (json['Ec2InstanceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      elasticLoadBalancerName: json['ElasticLoadBalancerName'] as String?,
      layerId: json['LayerId'] as String?,
      region: json['Region'] as String?,
      stackId: json['StackId'] as String?,
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final dnsName = this.dnsName;
    final ec2InstanceIds = this.ec2InstanceIds;
    final elasticLoadBalancerName = this.elasticLoadBalancerName;
    final layerId = this.layerId;
    final region = this.region;
    final stackId = this.stackId;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (dnsName != null) 'DnsName': dnsName,
      if (ec2InstanceIds != null) 'Ec2InstanceIds': ec2InstanceIds,
      if (elasticLoadBalancerName != null)
        'ElasticLoadBalancerName': elasticLoadBalancerName,
      if (layerId != null) 'LayerId': layerId,
      if (region != null) 'Region': region,
      if (stackId != null) 'StackId': stackId,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Represents an app's environment variable.
class EnvironmentVariable {
  /// (Required) The environment variable's name, which can consist of up to 64
  /// characters and must be specified. The name can contain upper- and lowercase
  /// letters, numbers, and underscores (_), but it must start with a letter or
  /// underscore.
  final String key;

  /// (Optional) The environment variable's value, which can be left empty. If you
  /// specify a value, it can contain up to 256 characters, which must all be
  /// printable.
  final String value;

  /// (Optional) Whether the variable's value is returned by the
  /// <a>DescribeApps</a> action. To hide an environment variable's value, set
  /// <code>Secure</code> to <code>true</code>. <code>DescribeApps</code> returns
  /// <code>*****FILTERED*****</code> instead of the actual value. The default
  /// value for <code>Secure</code> is <code>false</code>.
  final bool? secure;

  EnvironmentVariable({
    required this.key,
    required this.value,
    this.secure,
  });

  factory EnvironmentVariable.fromJson(Map<String, dynamic> json) {
    return EnvironmentVariable(
      key: json['Key'] as String,
      value: json['Value'] as String,
      secure: json['Secure'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    final secure = this.secure;
    return {
      'Key': key,
      'Value': value,
      if (secure != null) 'Secure': secure,
    };
  }
}

/// Contains the response to a <code>GetHostnameSuggestion</code> request.
class GetHostnameSuggestionResult {
  /// The generated host name.
  final String? hostname;

  /// The layer ID.
  final String? layerId;

  GetHostnameSuggestionResult({
    this.hostname,
    this.layerId,
  });

  factory GetHostnameSuggestionResult.fromJson(Map<String, dynamic> json) {
    return GetHostnameSuggestionResult(
      hostname: json['Hostname'] as String?,
      layerId: json['LayerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostname = this.hostname;
    final layerId = this.layerId;
    return {
      if (hostname != null) 'Hostname': hostname,
      if (layerId != null) 'LayerId': layerId,
    };
  }
}

/// Contains the response to a <code>GrantAccess</code> request.
class GrantAccessResult {
  /// A <code>TemporaryCredential</code> object that contains the data needed to
  /// log in to the instance by RDP clients, such as the Microsoft Remote Desktop
  /// Connection.
  final TemporaryCredential? temporaryCredential;

  GrantAccessResult({
    this.temporaryCredential,
  });

  factory GrantAccessResult.fromJson(Map<String, dynamic> json) {
    return GrantAccessResult(
      temporaryCredential: json['TemporaryCredential'] != null
          ? TemporaryCredential.fromJson(
              json['TemporaryCredential'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final temporaryCredential = this.temporaryCredential;
    return {
      if (temporaryCredential != null)
        'TemporaryCredential': temporaryCredential,
    };
  }
}

/// Describes an instance.
class Instance {
  /// The agent version. This parameter is set to <code>INHERIT</code> if the
  /// instance inherits the default stack setting or to a a version number for a
  /// fixed agent version.
  final String? agentVersion;

  /// A custom AMI ID to be used to create the instance. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-custom-ami.html">Instances</a>
  final String? amiId;

  /// The instance architecture: "i386" or "x86_64".
  final Architecture? architecture;

  /// The instance's Amazon Resource Number (ARN).
  final String? arn;

  /// For load-based or time-based instances, the type.
  final AutoScalingType? autoScalingType;

  /// The instance Availability Zone. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  final String? availabilityZone;

  /// An array of <code>BlockDeviceMapping</code> objects that specify the
  /// instance's block device mappings.
  final List<BlockDeviceMapping>? blockDeviceMappings;

  /// The time that the instance was created.
  final String? createdAt;

  /// Whether this is an Amazon EBS-optimized instance.
  final bool? ebsOptimized;

  /// The ID of the associated Amazon EC2 instance.
  final String? ec2InstanceId;

  /// For container instances, the Amazon ECS cluster's ARN.
  final String? ecsClusterArn;

  /// For container instances, the instance's ARN.
  final String? ecsContainerInstanceArn;

  /// The instance <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic
  /// IP address</a>.
  final String? elasticIp;

  /// The instance host name. The following are character limits for instance host
  /// names.
  ///
  /// <ul>
  /// <li>
  /// Linux-based instances: 63 characters
  /// </li>
  /// <li>
  /// Windows-based instances: 15 characters
  /// </li>
  /// </ul>
  final String? hostname;

  /// For registered instances, the infrastructure class: <code>ec2</code> or
  /// <code>on-premises</code>.
  final String? infrastructureClass;

  /// Whether to install operating system and package updates when the instance
  /// boots. The default value is <code>true</code>. If this value is set to
  /// <code>false</code>, you must update instances manually by using
  /// <a>CreateDeployment</a> to run the <code>update_dependencies</code> stack
  /// command or by manually running <code>yum</code> (Amazon Linux) or
  /// <code>apt-get</code> (Ubuntu) on the instances.
  /// <note>
  /// We strongly recommend using the default value of <code>true</code> to ensure
  /// that your instances have the latest security updates.
  /// </note>
  final bool? installUpdatesOnBoot;

  /// The instance ID.
  final String? instanceId;

  /// The ARN of the instance's IAM profile. For more information about IAM ARNs,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  final String? instanceProfileArn;

  /// The instance type, such as <code>t2.micro</code>.
  final String? instanceType;

  /// The ID of the last service error. For more information, call
  /// <a>DescribeServiceErrors</a>.
  final String? lastServiceErrorId;

  /// An array containing the instance layer IDs.
  final List<String>? layerIds;

  /// The instance's operating system.
  final String? os;

  /// The instance's platform.
  final String? platform;

  /// The instance's private DNS name.
  final String? privateDns;

  /// The instance's private IP address.
  final String? privateIp;

  /// The instance public DNS name.
  final String? publicDns;

  /// The instance public IP address.
  final String? publicIp;

  /// For registered instances, who performed the registration.
  final String? registeredBy;

  /// The instance's reported OpsWorks Stacks agent version.
  final String? reportedAgentVersion;

  /// For registered instances, the reported operating system.
  final ReportedOs? reportedOs;

  /// The instance's root device type. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device">Storage
  /// for the Root Device</a>.
  final RootDeviceType? rootDeviceType;

  /// The root device volume ID.
  final String? rootDeviceVolumeId;

  /// An array containing the instance security group IDs.
  final List<String>? securityGroupIds;

  /// The SSH key's Deep Security Agent (DSA) fingerprint.
  final String? sshHostDsaKeyFingerprint;

  /// The SSH key's RSA fingerprint.
  final String? sshHostRsaKeyFingerprint;

  /// The instance's Amazon EC2 key-pair name.
  final String? sshKeyName;

  /// The stack ID.
  final String? stackId;

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
  final String? status;

  /// The instance's subnet ID; applicable only if the stack is running in a VPC.
  final String? subnetId;

  /// The instance's tenancy option, such as <code>dedicated</code> or
  /// <code>host</code>.
  final String? tenancy;

  /// The instance's virtualization type: <code>paravirtual</code> or
  /// <code>hvm</code>.
  final VirtualizationType? virtualizationType;

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

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      agentVersion: json['AgentVersion'] as String?,
      amiId: json['AmiId'] as String?,
      architecture: (json['Architecture'] as String?)?.toArchitecture(),
      arn: json['Arn'] as String?,
      autoScalingType:
          (json['AutoScalingType'] as String?)?.toAutoScalingType(),
      availabilityZone: json['AvailabilityZone'] as String?,
      blockDeviceMappings: (json['BlockDeviceMappings'] as List?)
          ?.whereNotNull()
          .map((e) => BlockDeviceMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['CreatedAt'] as String?,
      ebsOptimized: json['EbsOptimized'] as bool?,
      ec2InstanceId: json['Ec2InstanceId'] as String?,
      ecsClusterArn: json['EcsClusterArn'] as String?,
      ecsContainerInstanceArn: json['EcsContainerInstanceArn'] as String?,
      elasticIp: json['ElasticIp'] as String?,
      hostname: json['Hostname'] as String?,
      infrastructureClass: json['InfrastructureClass'] as String?,
      installUpdatesOnBoot: json['InstallUpdatesOnBoot'] as bool?,
      instanceId: json['InstanceId'] as String?,
      instanceProfileArn: json['InstanceProfileArn'] as String?,
      instanceType: json['InstanceType'] as String?,
      lastServiceErrorId: json['LastServiceErrorId'] as String?,
      layerIds: (json['LayerIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      os: json['Os'] as String?,
      platform: json['Platform'] as String?,
      privateDns: json['PrivateDns'] as String?,
      privateIp: json['PrivateIp'] as String?,
      publicDns: json['PublicDns'] as String?,
      publicIp: json['PublicIp'] as String?,
      registeredBy: json['RegisteredBy'] as String?,
      reportedAgentVersion: json['ReportedAgentVersion'] as String?,
      reportedOs: json['ReportedOs'] != null
          ? ReportedOs.fromJson(json['ReportedOs'] as Map<String, dynamic>)
          : null,
      rootDeviceType: (json['RootDeviceType'] as String?)?.toRootDeviceType(),
      rootDeviceVolumeId: json['RootDeviceVolumeId'] as String?,
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sshHostDsaKeyFingerprint: json['SshHostDsaKeyFingerprint'] as String?,
      sshHostRsaKeyFingerprint: json['SshHostRsaKeyFingerprint'] as String?,
      sshKeyName: json['SshKeyName'] as String?,
      stackId: json['StackId'] as String?,
      status: json['Status'] as String?,
      subnetId: json['SubnetId'] as String?,
      tenancy: json['Tenancy'] as String?,
      virtualizationType:
          (json['VirtualizationType'] as String?)?.toVirtualizationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentVersion = this.agentVersion;
    final amiId = this.amiId;
    final architecture = this.architecture;
    final arn = this.arn;
    final autoScalingType = this.autoScalingType;
    final availabilityZone = this.availabilityZone;
    final blockDeviceMappings = this.blockDeviceMappings;
    final createdAt = this.createdAt;
    final ebsOptimized = this.ebsOptimized;
    final ec2InstanceId = this.ec2InstanceId;
    final ecsClusterArn = this.ecsClusterArn;
    final ecsContainerInstanceArn = this.ecsContainerInstanceArn;
    final elasticIp = this.elasticIp;
    final hostname = this.hostname;
    final infrastructureClass = this.infrastructureClass;
    final installUpdatesOnBoot = this.installUpdatesOnBoot;
    final instanceId = this.instanceId;
    final instanceProfileArn = this.instanceProfileArn;
    final instanceType = this.instanceType;
    final lastServiceErrorId = this.lastServiceErrorId;
    final layerIds = this.layerIds;
    final os = this.os;
    final platform = this.platform;
    final privateDns = this.privateDns;
    final privateIp = this.privateIp;
    final publicDns = this.publicDns;
    final publicIp = this.publicIp;
    final registeredBy = this.registeredBy;
    final reportedAgentVersion = this.reportedAgentVersion;
    final reportedOs = this.reportedOs;
    final rootDeviceType = this.rootDeviceType;
    final rootDeviceVolumeId = this.rootDeviceVolumeId;
    final securityGroupIds = this.securityGroupIds;
    final sshHostDsaKeyFingerprint = this.sshHostDsaKeyFingerprint;
    final sshHostRsaKeyFingerprint = this.sshHostRsaKeyFingerprint;
    final sshKeyName = this.sshKeyName;
    final stackId = this.stackId;
    final status = this.status;
    final subnetId = this.subnetId;
    final tenancy = this.tenancy;
    final virtualizationType = this.virtualizationType;
    return {
      if (agentVersion != null) 'AgentVersion': agentVersion,
      if (amiId != null) 'AmiId': amiId,
      if (architecture != null) 'Architecture': architecture.toValue(),
      if (arn != null) 'Arn': arn,
      if (autoScalingType != null) 'AutoScalingType': autoScalingType.toValue(),
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (blockDeviceMappings != null)
        'BlockDeviceMappings': blockDeviceMappings,
      if (createdAt != null) 'CreatedAt': createdAt,
      if (ebsOptimized != null) 'EbsOptimized': ebsOptimized,
      if (ec2InstanceId != null) 'Ec2InstanceId': ec2InstanceId,
      if (ecsClusterArn != null) 'EcsClusterArn': ecsClusterArn,
      if (ecsContainerInstanceArn != null)
        'EcsContainerInstanceArn': ecsContainerInstanceArn,
      if (elasticIp != null) 'ElasticIp': elasticIp,
      if (hostname != null) 'Hostname': hostname,
      if (infrastructureClass != null)
        'InfrastructureClass': infrastructureClass,
      if (installUpdatesOnBoot != null)
        'InstallUpdatesOnBoot': installUpdatesOnBoot,
      if (instanceId != null) 'InstanceId': instanceId,
      if (instanceProfileArn != null) 'InstanceProfileArn': instanceProfileArn,
      if (instanceType != null) 'InstanceType': instanceType,
      if (lastServiceErrorId != null) 'LastServiceErrorId': lastServiceErrorId,
      if (layerIds != null) 'LayerIds': layerIds,
      if (os != null) 'Os': os,
      if (platform != null) 'Platform': platform,
      if (privateDns != null) 'PrivateDns': privateDns,
      if (privateIp != null) 'PrivateIp': privateIp,
      if (publicDns != null) 'PublicDns': publicDns,
      if (publicIp != null) 'PublicIp': publicIp,
      if (registeredBy != null) 'RegisteredBy': registeredBy,
      if (reportedAgentVersion != null)
        'ReportedAgentVersion': reportedAgentVersion,
      if (reportedOs != null) 'ReportedOs': reportedOs,
      if (rootDeviceType != null) 'RootDeviceType': rootDeviceType.toValue(),
      if (rootDeviceVolumeId != null) 'RootDeviceVolumeId': rootDeviceVolumeId,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (sshHostDsaKeyFingerprint != null)
        'SshHostDsaKeyFingerprint': sshHostDsaKeyFingerprint,
      if (sshHostRsaKeyFingerprint != null)
        'SshHostRsaKeyFingerprint': sshHostRsaKeyFingerprint,
      if (sshKeyName != null) 'SshKeyName': sshKeyName,
      if (stackId != null) 'StackId': stackId,
      if (status != null) 'Status': status,
      if (subnetId != null) 'SubnetId': subnetId,
      if (tenancy != null) 'Tenancy': tenancy,
      if (virtualizationType != null)
        'VirtualizationType': virtualizationType.toValue(),
    };
  }
}

/// Contains a description of an Amazon EC2 instance from the Amazon EC2
/// metadata service. For more information, see <a
/// href="https://docs.aws.amazon.com/sdkfornet/latest/apidocs/Index.html">Instance
/// Metadata and User Data</a>.
class InstanceIdentity {
  /// A JSON document that contains the metadata.
  final String? document;

  /// A signature that can be used to verify the document's accuracy and
  /// authenticity.
  final String? signature;

  InstanceIdentity({
    this.document,
    this.signature,
  });

  Map<String, dynamic> toJson() {
    final document = this.document;
    final signature = this.signature;
    return {
      if (document != null) 'Document': document,
      if (signature != null) 'Signature': signature,
    };
  }
}

/// Describes how many instances a stack has for each status.
class InstancesCount {
  /// The number of instances in the Assigning state.
  final int? assigning;

  /// The number of instances with <code>booting</code> status.
  final int? booting;

  /// The number of instances with <code>connection_lost</code> status.
  final int? connectionLost;

  /// The number of instances in the Deregistering state.
  final int? deregistering;

  /// The number of instances with <code>online</code> status.
  final int? online;

  /// The number of instances with <code>pending</code> status.
  final int? pending;

  /// The number of instances with <code>rebooting</code> status.
  final int? rebooting;

  /// The number of instances in the Registered state.
  final int? registered;

  /// The number of instances in the Registering state.
  final int? registering;

  /// The number of instances with <code>requested</code> status.
  final int? requested;

  /// The number of instances with <code>running_setup</code> status.
  final int? runningSetup;

  /// The number of instances with <code>setup_failed</code> status.
  final int? setupFailed;

  /// The number of instances with <code>shutting_down</code> status.
  final int? shuttingDown;

  /// The number of instances with <code>start_failed</code> status.
  final int? startFailed;

  /// The number of instances with <code>stop_failed</code> status.
  final int? stopFailed;

  /// The number of instances with <code>stopped</code> status.
  final int? stopped;

  /// The number of instances with <code>stopping</code> status.
  final int? stopping;

  /// The number of instances with <code>terminated</code> status.
  final int? terminated;

  /// The number of instances with <code>terminating</code> status.
  final int? terminating;

  /// The number of instances in the Unassigning state.
  final int? unassigning;

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

  factory InstancesCount.fromJson(Map<String, dynamic> json) {
    return InstancesCount(
      assigning: json['Assigning'] as int?,
      booting: json['Booting'] as int?,
      connectionLost: json['ConnectionLost'] as int?,
      deregistering: json['Deregistering'] as int?,
      online: json['Online'] as int?,
      pending: json['Pending'] as int?,
      rebooting: json['Rebooting'] as int?,
      registered: json['Registered'] as int?,
      registering: json['Registering'] as int?,
      requested: json['Requested'] as int?,
      runningSetup: json['RunningSetup'] as int?,
      setupFailed: json['SetupFailed'] as int?,
      shuttingDown: json['ShuttingDown'] as int?,
      startFailed: json['StartFailed'] as int?,
      stopFailed: json['StopFailed'] as int?,
      stopped: json['Stopped'] as int?,
      stopping: json['Stopping'] as int?,
      terminated: json['Terminated'] as int?,
      terminating: json['Terminating'] as int?,
      unassigning: json['Unassigning'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final assigning = this.assigning;
    final booting = this.booting;
    final connectionLost = this.connectionLost;
    final deregistering = this.deregistering;
    final online = this.online;
    final pending = this.pending;
    final rebooting = this.rebooting;
    final registered = this.registered;
    final registering = this.registering;
    final requested = this.requested;
    final runningSetup = this.runningSetup;
    final setupFailed = this.setupFailed;
    final shuttingDown = this.shuttingDown;
    final startFailed = this.startFailed;
    final stopFailed = this.stopFailed;
    final stopped = this.stopped;
    final stopping = this.stopping;
    final terminated = this.terminated;
    final terminating = this.terminating;
    final unassigning = this.unassigning;
    return {
      if (assigning != null) 'Assigning': assigning,
      if (booting != null) 'Booting': booting,
      if (connectionLost != null) 'ConnectionLost': connectionLost,
      if (deregistering != null) 'Deregistering': deregistering,
      if (online != null) 'Online': online,
      if (pending != null) 'Pending': pending,
      if (rebooting != null) 'Rebooting': rebooting,
      if (registered != null) 'Registered': registered,
      if (registering != null) 'Registering': registering,
      if (requested != null) 'Requested': requested,
      if (runningSetup != null) 'RunningSetup': runningSetup,
      if (setupFailed != null) 'SetupFailed': setupFailed,
      if (shuttingDown != null) 'ShuttingDown': shuttingDown,
      if (startFailed != null) 'StartFailed': startFailed,
      if (stopFailed != null) 'StopFailed': stopFailed,
      if (stopped != null) 'Stopped': stopped,
      if (stopping != null) 'Stopping': stopping,
      if (terminated != null) 'Terminated': terminated,
      if (terminating != null) 'Terminating': terminating,
      if (unassigning != null) 'Unassigning': unassigning,
    };
  }
}

/// Describes a layer.
class Layer {
  /// The Amazon Resource Number (ARN) of a layer.
  final String? arn;

  /// The layer attributes.
  ///
  /// For the <code>HaproxyStatsPassword</code>, <code>MysqlRootPassword</code>,
  /// and <code>GangliaPassword</code> attributes, OpsWorks Stacks returns
  /// <code>*****FILTERED*****</code> instead of the actual value
  ///
  /// For an ECS Cluster layer, OpsWorks Stacks the <code>EcsClusterArn</code>
  /// attribute is set to the cluster's ARN.
  final Map<LayerAttributesKeys, String>? attributes;

  /// Whether to automatically assign an <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic
  /// IP address</a> to the layer's instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html">How
  /// to Edit a Layer</a>.
  final bool? autoAssignElasticIps;

  /// For stacks that are running in a VPC, whether to automatically assign a
  /// public IP address to the layer's instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html">How
  /// to Edit a Layer</a>.
  final bool? autoAssignPublicIps;

  /// The Amazon CloudWatch Logs configuration settings for the layer.
  final CloudWatchLogsConfiguration? cloudWatchLogsConfiguration;

  /// Date when the layer was created.
  final String? createdAt;

  /// The ARN of the default IAM profile to be used for the layer's EC2 instances.
  /// For more information about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  final String? customInstanceProfileArn;

  /// A JSON formatted string containing the layer's custom stack configuration
  /// and deployment attributes.
  final String? customJson;

  /// A <code>LayerCustomRecipes</code> object that specifies the layer's custom
  /// recipes.
  final Recipes? customRecipes;

  /// An array containing the layer's custom security group IDs.
  final List<String>? customSecurityGroupIds;

  /// OpsWorks Stacks supports five lifecycle events: <b>setup</b>,
  /// <b>configuration</b>, <b>deploy</b>, <b>undeploy</b>, and <b>shutdown</b>.
  /// For each layer, OpsWorks Stacks runs a set of standard recipes for each
  /// event. You can also provide custom recipes for any or all layers and events.
  /// OpsWorks Stacks runs custom event recipes after the standard recipes.
  /// <code>LayerCustomRecipes</code> specifies the custom recipes for a
  /// particular layer to be run in response to each of the five events.
  ///
  /// To specify a recipe, use the cookbook's directory name in the repository
  /// followed by two colons and the recipe name, which is the recipe's file name
  /// without the <code>.rb</code> extension. For example:
  /// <code>phpapp2::dbsetup</code> specifies the <code>dbsetup.rb</code> recipe
  /// in the repository's <code>phpapp2</code> folder.
  final Recipes? defaultRecipes;

  /// An array containing the layer's security group names.
  final List<String>? defaultSecurityGroupNames;

  /// Whether auto healing is disabled for the layer.
  final bool? enableAutoHealing;

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
  final bool? installUpdatesOnBoot;

  /// The layer ID.
  final String? layerId;

  /// A <code>LifeCycleEventConfiguration</code> object that specifies the
  /// Shutdown event configuration.
  final LifecycleEventConfiguration? lifecycleEventConfiguration;

  /// The layer name. Layer names can be a maximum of 32 characters.
  final String? name;

  /// An array of <code>Package</code> objects that describe the layer's packages.
  final List<String>? packages;

  /// The layer short name.
  final String? shortname;

  /// The layer stack ID.
  final String? stackId;

  /// The layer type.
  final LayerType? type;

  /// Whether the layer uses Amazon EBS-optimized instances.
  final bool? useEbsOptimizedInstances;

  /// A <code>VolumeConfigurations</code> object that describes the layer's Amazon
  /// EBS volumes.
  final List<VolumeConfiguration>? volumeConfigurations;

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

  factory Layer.fromJson(Map<String, dynamic> json) {
    return Layer(
      arn: json['Arn'] as String?,
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toLayerAttributesKeys(), e as String)),
      autoAssignElasticIps: json['AutoAssignElasticIps'] as bool?,
      autoAssignPublicIps: json['AutoAssignPublicIps'] as bool?,
      cloudWatchLogsConfiguration: json['CloudWatchLogsConfiguration'] != null
          ? CloudWatchLogsConfiguration.fromJson(
              json['CloudWatchLogsConfiguration'] as Map<String, dynamic>)
          : null,
      createdAt: json['CreatedAt'] as String?,
      customInstanceProfileArn: json['CustomInstanceProfileArn'] as String?,
      customJson: json['CustomJson'] as String?,
      customRecipes: json['CustomRecipes'] != null
          ? Recipes.fromJson(json['CustomRecipes'] as Map<String, dynamic>)
          : null,
      customSecurityGroupIds: (json['CustomSecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      defaultRecipes: json['DefaultRecipes'] != null
          ? Recipes.fromJson(json['DefaultRecipes'] as Map<String, dynamic>)
          : null,
      defaultSecurityGroupNames: (json['DefaultSecurityGroupNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      enableAutoHealing: json['EnableAutoHealing'] as bool?,
      installUpdatesOnBoot: json['InstallUpdatesOnBoot'] as bool?,
      layerId: json['LayerId'] as String?,
      lifecycleEventConfiguration: json['LifecycleEventConfiguration'] != null
          ? LifecycleEventConfiguration.fromJson(
              json['LifecycleEventConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      packages: (json['Packages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      shortname: json['Shortname'] as String?,
      stackId: json['StackId'] as String?,
      type: (json['Type'] as String?)?.toLayerType(),
      useEbsOptimizedInstances: json['UseEbsOptimizedInstances'] as bool?,
      volumeConfigurations: (json['VolumeConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => VolumeConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attributes = this.attributes;
    final autoAssignElasticIps = this.autoAssignElasticIps;
    final autoAssignPublicIps = this.autoAssignPublicIps;
    final cloudWatchLogsConfiguration = this.cloudWatchLogsConfiguration;
    final createdAt = this.createdAt;
    final customInstanceProfileArn = this.customInstanceProfileArn;
    final customJson = this.customJson;
    final customRecipes = this.customRecipes;
    final customSecurityGroupIds = this.customSecurityGroupIds;
    final defaultRecipes = this.defaultRecipes;
    final defaultSecurityGroupNames = this.defaultSecurityGroupNames;
    final enableAutoHealing = this.enableAutoHealing;
    final installUpdatesOnBoot = this.installUpdatesOnBoot;
    final layerId = this.layerId;
    final lifecycleEventConfiguration = this.lifecycleEventConfiguration;
    final name = this.name;
    final packages = this.packages;
    final shortname = this.shortname;
    final stackId = this.stackId;
    final type = this.type;
    final useEbsOptimizedInstances = this.useEbsOptimizedInstances;
    final volumeConfigurations = this.volumeConfigurations;
    return {
      if (arn != null) 'Arn': arn,
      if (attributes != null)
        'Attributes': attributes.map((k, e) => MapEntry(k.toValue(), e)),
      if (autoAssignElasticIps != null)
        'AutoAssignElasticIps': autoAssignElasticIps,
      if (autoAssignPublicIps != null)
        'AutoAssignPublicIps': autoAssignPublicIps,
      if (cloudWatchLogsConfiguration != null)
        'CloudWatchLogsConfiguration': cloudWatchLogsConfiguration,
      if (createdAt != null) 'CreatedAt': createdAt,
      if (customInstanceProfileArn != null)
        'CustomInstanceProfileArn': customInstanceProfileArn,
      if (customJson != null) 'CustomJson': customJson,
      if (customRecipes != null) 'CustomRecipes': customRecipes,
      if (customSecurityGroupIds != null)
        'CustomSecurityGroupIds': customSecurityGroupIds,
      if (defaultRecipes != null) 'DefaultRecipes': defaultRecipes,
      if (defaultSecurityGroupNames != null)
        'DefaultSecurityGroupNames': defaultSecurityGroupNames,
      if (enableAutoHealing != null) 'EnableAutoHealing': enableAutoHealing,
      if (installUpdatesOnBoot != null)
        'InstallUpdatesOnBoot': installUpdatesOnBoot,
      if (layerId != null) 'LayerId': layerId,
      if (lifecycleEventConfiguration != null)
        'LifecycleEventConfiguration': lifecycleEventConfiguration,
      if (name != null) 'Name': name,
      if (packages != null) 'Packages': packages,
      if (shortname != null) 'Shortname': shortname,
      if (stackId != null) 'StackId': stackId,
      if (type != null) 'Type': type.toValue(),
      if (useEbsOptimizedInstances != null)
        'UseEbsOptimizedInstances': useEbsOptimizedInstances,
      if (volumeConfigurations != null)
        'VolumeConfigurations': volumeConfigurations,
    };
  }
}

enum LayerAttributesKeys {
  ecsClusterArn,
  enableHaproxyStats,
  haproxyStatsUrl,
  haproxyStatsUser,
  haproxyStatsPassword,
  haproxyHealthCheckUrl,
  haproxyHealthCheckMethod,
  mysqlRootPassword,
  mysqlRootPasswordUbiquitous,
  gangliaUrl,
  gangliaUser,
  gangliaPassword,
  memcachedMemory,
  nodejsVersion,
  rubyVersion,
  rubygemsVersion,
  manageBundler,
  bundlerVersion,
  railsStack,
  passengerVersion,
  jvm,
  jvmVersion,
  jvmOptions,
  javaAppServer,
  javaAppServerVersion,
}

extension LayerAttributesKeysValueExtension on LayerAttributesKeys {
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
  }
}

extension LayerAttributesKeysFromString on String {
  LayerAttributesKeys toLayerAttributesKeys() {
    switch (this) {
      case 'EcsClusterArn':
        return LayerAttributesKeys.ecsClusterArn;
      case 'EnableHaproxyStats':
        return LayerAttributesKeys.enableHaproxyStats;
      case 'HaproxyStatsUrl':
        return LayerAttributesKeys.haproxyStatsUrl;
      case 'HaproxyStatsUser':
        return LayerAttributesKeys.haproxyStatsUser;
      case 'HaproxyStatsPassword':
        return LayerAttributesKeys.haproxyStatsPassword;
      case 'HaproxyHealthCheckUrl':
        return LayerAttributesKeys.haproxyHealthCheckUrl;
      case 'HaproxyHealthCheckMethod':
        return LayerAttributesKeys.haproxyHealthCheckMethod;
      case 'MysqlRootPassword':
        return LayerAttributesKeys.mysqlRootPassword;
      case 'MysqlRootPasswordUbiquitous':
        return LayerAttributesKeys.mysqlRootPasswordUbiquitous;
      case 'GangliaUrl':
        return LayerAttributesKeys.gangliaUrl;
      case 'GangliaUser':
        return LayerAttributesKeys.gangliaUser;
      case 'GangliaPassword':
        return LayerAttributesKeys.gangliaPassword;
      case 'MemcachedMemory':
        return LayerAttributesKeys.memcachedMemory;
      case 'NodejsVersion':
        return LayerAttributesKeys.nodejsVersion;
      case 'RubyVersion':
        return LayerAttributesKeys.rubyVersion;
      case 'RubygemsVersion':
        return LayerAttributesKeys.rubygemsVersion;
      case 'ManageBundler':
        return LayerAttributesKeys.manageBundler;
      case 'BundlerVersion':
        return LayerAttributesKeys.bundlerVersion;
      case 'RailsStack':
        return LayerAttributesKeys.railsStack;
      case 'PassengerVersion':
        return LayerAttributesKeys.passengerVersion;
      case 'Jvm':
        return LayerAttributesKeys.jvm;
      case 'JvmVersion':
        return LayerAttributesKeys.jvmVersion;
      case 'JvmOptions':
        return LayerAttributesKeys.jvmOptions;
      case 'JavaAppServer':
        return LayerAttributesKeys.javaAppServer;
      case 'JavaAppServerVersion':
        return LayerAttributesKeys.javaAppServerVersion;
    }
    throw Exception('$this is not known in enum LayerAttributesKeys');
  }
}

enum LayerType {
  awsFlowRuby,
  ecsCluster,
  javaApp,
  lb,
  web,
  phpApp,
  railsApp,
  nodejsApp,
  memcached,
  dbMaster,
  monitoringMaster,
  custom,
}

extension LayerTypeValueExtension on LayerType {
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
  }
}

extension LayerTypeFromString on String {
  LayerType toLayerType() {
    switch (this) {
      case 'aws-flow-ruby':
        return LayerType.awsFlowRuby;
      case 'ecs-cluster':
        return LayerType.ecsCluster;
      case 'java-app':
        return LayerType.javaApp;
      case 'lb':
        return LayerType.lb;
      case 'web':
        return LayerType.web;
      case 'php-app':
        return LayerType.phpApp;
      case 'rails-app':
        return LayerType.railsApp;
      case 'nodejs-app':
        return LayerType.nodejsApp;
      case 'memcached':
        return LayerType.memcached;
      case 'db-master':
        return LayerType.dbMaster;
      case 'monitoring-master':
        return LayerType.monitoringMaster;
      case 'custom':
        return LayerType.custom;
    }
    throw Exception('$this is not known in enum LayerType');
  }
}

/// Specifies the lifecycle event configuration
class LifecycleEventConfiguration {
  /// A <code>ShutdownEventConfiguration</code> object that specifies the Shutdown
  /// event configuration.
  final ShutdownEventConfiguration? shutdown;

  LifecycleEventConfiguration({
    this.shutdown,
  });

  factory LifecycleEventConfiguration.fromJson(Map<String, dynamic> json) {
    return LifecycleEventConfiguration(
      shutdown: json['Shutdown'] != null
          ? ShutdownEventConfiguration.fromJson(
              json['Shutdown'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final shutdown = this.shutdown;
    return {
      if (shutdown != null) 'Shutdown': shutdown,
    };
  }
}

/// Contains the response to a <code>ListTags</code> request.
class ListTagsResult {
  /// If a paginated request does not return all of the remaining results, this
  /// parameter is set to a token that you can assign to the request object's
  /// <code>NextToken</code> parameter to get the next set of results. If the
  /// previous paginated request returned all of the remaining results, this
  /// parameter is set to <code>null</code>.
  final String? nextToken;

  /// A set of key-value pairs that contain tag keys and tag values that are
  /// attached to a stack or layer.
  final Map<String, String>? tags;

  ListTagsResult({
    this.nextToken,
    this.tags,
  });

  factory ListTagsResult.fromJson(Map<String, dynamic> json) {
    return ListTagsResult(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Describes a layer's load-based auto scaling configuration.
class LoadBasedAutoScalingConfiguration {
  /// An <code>AutoScalingThresholds</code> object that describes the downscaling
  /// configuration, which defines how and when OpsWorks Stacks reduces the number
  /// of instances.
  final AutoScalingThresholds? downScaling;

  /// Whether load-based auto scaling is enabled for the layer.
  final bool? enable;

  /// The layer ID.
  final String? layerId;

  /// An <code>AutoScalingThresholds</code> object that describes the upscaling
  /// configuration, which defines how and when OpsWorks Stacks increases the
  /// number of instances.
  final AutoScalingThresholds? upScaling;

  LoadBasedAutoScalingConfiguration({
    this.downScaling,
    this.enable,
    this.layerId,
    this.upScaling,
  });

  factory LoadBasedAutoScalingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return LoadBasedAutoScalingConfiguration(
      downScaling: json['DownScaling'] != null
          ? AutoScalingThresholds.fromJson(
              json['DownScaling'] as Map<String, dynamic>)
          : null,
      enable: json['Enable'] as bool?,
      layerId: json['LayerId'] as String?,
      upScaling: json['UpScaling'] != null
          ? AutoScalingThresholds.fromJson(
              json['UpScaling'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final downScaling = this.downScaling;
    final enable = this.enable;
    final layerId = this.layerId;
    final upScaling = this.upScaling;
    return {
      if (downScaling != null) 'DownScaling': downScaling,
      if (enable != null) 'Enable': enable,
      if (layerId != null) 'LayerId': layerId,
      if (upScaling != null) 'UpScaling': upScaling,
    };
  }
}

/// Describes supported operating systems in OpsWorks Stacks.
class OperatingSystem {
  /// Supported configuration manager name and versions for an OpsWorks Stacks
  /// operating system.
  final List<OperatingSystemConfigurationManager>? configurationManagers;

  /// The ID of a supported operating system, such as <code>Amazon Linux 2</code>.
  final String? id;

  /// The name of the operating system, such as <code>Amazon Linux 2</code>.
  final String? name;

  /// A short name for the operating system manufacturer.
  final String? reportedName;

  /// The version of the operating system, including the release and edition, if
  /// applicable.
  final String? reportedVersion;

  /// Indicates that an operating system is not supported for new instances.
  final bool? supported;

  /// The type of a supported operating system, either <code>Linux</code> or
  /// <code>Windows</code>.
  final String? type;

  OperatingSystem({
    this.configurationManagers,
    this.id,
    this.name,
    this.reportedName,
    this.reportedVersion,
    this.supported,
    this.type,
  });

  factory OperatingSystem.fromJson(Map<String, dynamic> json) {
    return OperatingSystem(
      configurationManagers: (json['ConfigurationManagers'] as List?)
          ?.whereNotNull()
          .map((e) => OperatingSystemConfigurationManager.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      reportedName: json['ReportedName'] as String?,
      reportedVersion: json['ReportedVersion'] as String?,
      supported: json['Supported'] as bool?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationManagers = this.configurationManagers;
    final id = this.id;
    final name = this.name;
    final reportedName = this.reportedName;
    final reportedVersion = this.reportedVersion;
    final supported = this.supported;
    final type = this.type;
    return {
      if (configurationManagers != null)
        'ConfigurationManagers': configurationManagers,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (reportedName != null) 'ReportedName': reportedName,
      if (reportedVersion != null) 'ReportedVersion': reportedVersion,
      if (supported != null) 'Supported': supported,
      if (type != null) 'Type': type,
    };
  }
}

/// A block that contains information about the configuration manager (Chef) and
/// the versions of the configuration manager that are supported for an
/// operating system.
class OperatingSystemConfigurationManager {
  /// The name of the configuration manager, which is Chef.
  final String? name;

  /// The versions of the configuration manager that are supported by an operating
  /// system.
  final String? version;

  OperatingSystemConfigurationManager({
    this.name,
    this.version,
  });

  factory OperatingSystemConfigurationManager.fromJson(
      Map<String, dynamic> json) {
    return OperatingSystemConfigurationManager(
      name: json['Name'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

/// Describes stack or user permissions.
class Permission {
  /// Whether the user can use SSH.
  final bool? allowSsh;

  /// Whether the user can use <b>sudo</b>.
  final bool? allowSudo;

  /// The Amazon Resource Name (ARN) for an Identity and Access Management (IAM)
  /// role. For more information about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  final String? iamUserArn;

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
  final String? level;

  /// A stack ID.
  final String? stackId;

  Permission({
    this.allowSsh,
    this.allowSudo,
    this.iamUserArn,
    this.level,
    this.stackId,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      allowSsh: json['AllowSsh'] as bool?,
      allowSudo: json['AllowSudo'] as bool?,
      iamUserArn: json['IamUserArn'] as String?,
      level: json['Level'] as String?,
      stackId: json['StackId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowSsh = this.allowSsh;
    final allowSudo = this.allowSudo;
    final iamUserArn = this.iamUserArn;
    final level = this.level;
    final stackId = this.stackId;
    return {
      if (allowSsh != null) 'AllowSsh': allowSsh,
      if (allowSudo != null) 'AllowSudo': allowSudo,
      if (iamUserArn != null) 'IamUserArn': iamUserArn,
      if (level != null) 'Level': level,
      if (stackId != null) 'StackId': stackId,
    };
  }
}

/// Describes an instance's RAID array.
class RaidArray {
  /// The array's Availability Zone. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  final String? availabilityZone;

  /// When the RAID array was created.
  final String? createdAt;

  /// The array's Linux device. For example /dev/mdadm0.
  final String? device;

  /// The instance ID.
  final String? instanceId;

  /// For PIOPS volumes, the IOPS per disk.
  final int? iops;

  /// The array's mount point.
  final String? mountPoint;

  /// The array name.
  final String? name;

  /// The number of disks in the array.
  final int? numberOfDisks;

  /// The array ID.
  final String? raidArrayId;

  /// The <a href="http://en.wikipedia.org/wiki/Standard_RAID_levels">RAID
  /// level</a>.
  final int? raidLevel;

  /// The array's size.
  final int? size;

  /// The stack ID.
  final String? stackId;

  /// The volume type, standard or PIOPS.
  final String? volumeType;

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

  factory RaidArray.fromJson(Map<String, dynamic> json) {
    return RaidArray(
      availabilityZone: json['AvailabilityZone'] as String?,
      createdAt: json['CreatedAt'] as String?,
      device: json['Device'] as String?,
      instanceId: json['InstanceId'] as String?,
      iops: json['Iops'] as int?,
      mountPoint: json['MountPoint'] as String?,
      name: json['Name'] as String?,
      numberOfDisks: json['NumberOfDisks'] as int?,
      raidArrayId: json['RaidArrayId'] as String?,
      raidLevel: json['RaidLevel'] as int?,
      size: json['Size'] as int?,
      stackId: json['StackId'] as String?,
      volumeType: json['VolumeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final createdAt = this.createdAt;
    final device = this.device;
    final instanceId = this.instanceId;
    final iops = this.iops;
    final mountPoint = this.mountPoint;
    final name = this.name;
    final numberOfDisks = this.numberOfDisks;
    final raidArrayId = this.raidArrayId;
    final raidLevel = this.raidLevel;
    final size = this.size;
    final stackId = this.stackId;
    final volumeType = this.volumeType;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (createdAt != null) 'CreatedAt': createdAt,
      if (device != null) 'Device': device,
      if (instanceId != null) 'InstanceId': instanceId,
      if (iops != null) 'Iops': iops,
      if (mountPoint != null) 'MountPoint': mountPoint,
      if (name != null) 'Name': name,
      if (numberOfDisks != null) 'NumberOfDisks': numberOfDisks,
      if (raidArrayId != null) 'RaidArrayId': raidArrayId,
      if (raidLevel != null) 'RaidLevel': raidLevel,
      if (size != null) 'Size': size,
      if (stackId != null) 'StackId': stackId,
      if (volumeType != null) 'VolumeType': volumeType,
    };
  }
}

/// Describes an Amazon RDS instance.
class RdsDbInstance {
  /// The instance's address.
  final String? address;

  /// The database instance identifier.
  final String? dbInstanceIdentifier;

  /// OpsWorks Stacks returns <code>*****FILTERED*****</code> instead of the
  /// actual value.
  final String? dbPassword;

  /// The master user name.
  final String? dbUser;

  /// The instance's database engine.
  final String? engine;

  /// Set to <code>true</code> if OpsWorks Stacks is unable to discover the Amazon
  /// RDS instance. OpsWorks Stacks attempts to discover the instance only once.
  /// If this value is set to <code>true</code>, you must deregister the instance,
  /// and then register it again.
  final bool? missingOnRds;

  /// The instance's ARN.
  final String? rdsDbInstanceArn;

  /// The instance's Amazon Web Services Region.
  final String? region;

  /// The ID of the stack with which the instance is registered.
  final String? stackId;

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

  factory RdsDbInstance.fromJson(Map<String, dynamic> json) {
    return RdsDbInstance(
      address: json['Address'] as String?,
      dbInstanceIdentifier: json['DbInstanceIdentifier'] as String?,
      dbPassword: json['DbPassword'] as String?,
      dbUser: json['DbUser'] as String?,
      engine: json['Engine'] as String?,
      missingOnRds: json['MissingOnRds'] as bool?,
      rdsDbInstanceArn: json['RdsDbInstanceArn'] as String?,
      region: json['Region'] as String?,
      stackId: json['StackId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final dbInstanceIdentifier = this.dbInstanceIdentifier;
    final dbPassword = this.dbPassword;
    final dbUser = this.dbUser;
    final engine = this.engine;
    final missingOnRds = this.missingOnRds;
    final rdsDbInstanceArn = this.rdsDbInstanceArn;
    final region = this.region;
    final stackId = this.stackId;
    return {
      if (address != null) 'Address': address,
      if (dbInstanceIdentifier != null)
        'DbInstanceIdentifier': dbInstanceIdentifier,
      if (dbPassword != null) 'DbPassword': dbPassword,
      if (dbUser != null) 'DbUser': dbUser,
      if (engine != null) 'Engine': engine,
      if (missingOnRds != null) 'MissingOnRds': missingOnRds,
      if (rdsDbInstanceArn != null) 'RdsDbInstanceArn': rdsDbInstanceArn,
      if (region != null) 'Region': region,
      if (stackId != null) 'StackId': stackId,
    };
  }
}

/// OpsWorks Stacks supports five lifecycle events: <b>setup</b>,
/// <b>configuration</b>, <b>deploy</b>, <b>undeploy</b>, and <b>shutdown</b>.
/// For each layer, OpsWorks Stacks runs a set of standard recipes for each
/// event. In addition, you can provide custom recipes for any or all layers and
/// events. OpsWorks Stacks runs custom event recipes after the standard
/// recipes. <code>LayerCustomRecipes</code> specifies the custom recipes for a
/// particular layer to be run in response to each of the five events.
///
/// To specify a recipe, use the cookbook's directory name in the repository
/// followed by two colons and the recipe name, which is the recipe's file name
/// without the .rb extension. For example: phpapp2::dbsetup specifies the
/// dbsetup.rb recipe in the repository's phpapp2 folder.
class Recipes {
  /// An array of custom recipe names to be run following a <code>configure</code>
  /// event.
  final List<String>? configure;

  /// An array of custom recipe names to be run following a <code>deploy</code>
  /// event.
  final List<String>? deploy;

  /// An array of custom recipe names to be run following a <code>setup</code>
  /// event.
  final List<String>? setup;

  /// An array of custom recipe names to be run following a <code>shutdown</code>
  /// event.
  final List<String>? shutdown;

  /// An array of custom recipe names to be run following a <code>undeploy</code>
  /// event.
  final List<String>? undeploy;

  Recipes({
    this.configure,
    this.deploy,
    this.setup,
    this.shutdown,
    this.undeploy,
  });

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      configure: (json['Configure'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      deploy: (json['Deploy'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      setup: (json['Setup'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      shutdown: (json['Shutdown'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      undeploy: (json['Undeploy'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final configure = this.configure;
    final deploy = this.deploy;
    final setup = this.setup;
    final shutdown = this.shutdown;
    final undeploy = this.undeploy;
    return {
      if (configure != null) 'Configure': configure,
      if (deploy != null) 'Deploy': deploy,
      if (setup != null) 'Setup': setup,
      if (shutdown != null) 'Shutdown': shutdown,
      if (undeploy != null) 'Undeploy': undeploy,
    };
  }
}

/// Contains the response to a <code>RegisterEcsCluster</code> request.
class RegisterEcsClusterResult {
  /// The cluster's ARN.
  final String? ecsClusterArn;

  RegisterEcsClusterResult({
    this.ecsClusterArn,
  });

  factory RegisterEcsClusterResult.fromJson(Map<String, dynamic> json) {
    return RegisterEcsClusterResult(
      ecsClusterArn: json['EcsClusterArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ecsClusterArn = this.ecsClusterArn;
    return {
      if (ecsClusterArn != null) 'EcsClusterArn': ecsClusterArn,
    };
  }
}

/// Contains the response to a <code>RegisterElasticIp</code> request.
class RegisterElasticIpResult {
  /// The Elastic IP address.
  final String? elasticIp;

  RegisterElasticIpResult({
    this.elasticIp,
  });

  factory RegisterElasticIpResult.fromJson(Map<String, dynamic> json) {
    return RegisterElasticIpResult(
      elasticIp: json['ElasticIp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final elasticIp = this.elasticIp;
    return {
      if (elasticIp != null) 'ElasticIp': elasticIp,
    };
  }
}

/// Contains the response to a <code>RegisterInstanceResult</code> request.
class RegisterInstanceResult {
  /// The registered instance's OpsWorks Stacks ID.
  final String? instanceId;

  RegisterInstanceResult({
    this.instanceId,
  });

  factory RegisterInstanceResult.fromJson(Map<String, dynamic> json) {
    return RegisterInstanceResult(
      instanceId: json['InstanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    return {
      if (instanceId != null) 'InstanceId': instanceId,
    };
  }
}

/// Contains the response to a <code>RegisterVolume</code> request.
class RegisterVolumeResult {
  /// The volume ID.
  final String? volumeId;

  RegisterVolumeResult({
    this.volumeId,
  });

  factory RegisterVolumeResult.fromJson(Map<String, dynamic> json) {
    return RegisterVolumeResult(
      volumeId: json['VolumeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final volumeId = this.volumeId;
    return {
      if (volumeId != null) 'VolumeId': volumeId,
    };
  }
}

/// A registered instance's reported operating system.
class ReportedOs {
  /// The operating system family.
  final String? family;

  /// The operating system name.
  final String? name;

  /// The operating system version.
  final String? version;

  ReportedOs({
    this.family,
    this.name,
    this.version,
  });

  factory ReportedOs.fromJson(Map<String, dynamic> json) {
    return ReportedOs(
      family: json['Family'] as String?,
      name: json['Name'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final family = this.family;
    final name = this.name;
    final version = this.version;
    return {
      if (family != null) 'Family': family,
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

enum RootDeviceType {
  ebs,
  instanceStore,
}

extension RootDeviceTypeValueExtension on RootDeviceType {
  String toValue() {
    switch (this) {
      case RootDeviceType.ebs:
        return 'ebs';
      case RootDeviceType.instanceStore:
        return 'instance-store';
    }
  }
}

extension RootDeviceTypeFromString on String {
  RootDeviceType toRootDeviceType() {
    switch (this) {
      case 'ebs':
        return RootDeviceType.ebs;
      case 'instance-store':
        return RootDeviceType.instanceStore;
    }
    throw Exception('$this is not known in enum RootDeviceType');
  }
}

/// Describes a user's SSH information.
class SelfUserProfile {
  /// The user's IAM ARN.
  final String? iamUserArn;

  /// The user's name.
  final String? name;

  /// The user's SSH public key.
  final String? sshPublicKey;

  /// The user's SSH user name.
  final String? sshUsername;

  SelfUserProfile({
    this.iamUserArn,
    this.name,
    this.sshPublicKey,
    this.sshUsername,
  });

  factory SelfUserProfile.fromJson(Map<String, dynamic> json) {
    return SelfUserProfile(
      iamUserArn: json['IamUserArn'] as String?,
      name: json['Name'] as String?,
      sshPublicKey: json['SshPublicKey'] as String?,
      sshUsername: json['SshUsername'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final iamUserArn = this.iamUserArn;
    final name = this.name;
    final sshPublicKey = this.sshPublicKey;
    final sshUsername = this.sshUsername;
    return {
      if (iamUserArn != null) 'IamUserArn': iamUserArn,
      if (name != null) 'Name': name,
      if (sshPublicKey != null) 'SshPublicKey': sshPublicKey,
      if (sshUsername != null) 'SshUsername': sshUsername,
    };
  }
}

/// Describes an OpsWorks Stacks service error.
class ServiceError {
  /// When the error occurred.
  final String? createdAt;

  /// The instance ID.
  final String? instanceId;

  /// A message that describes the error.
  final String? message;

  /// The error ID.
  final String? serviceErrorId;

  /// The stack ID.
  final String? stackId;

  /// The error type.
  final String? type;

  ServiceError({
    this.createdAt,
    this.instanceId,
    this.message,
    this.serviceErrorId,
    this.stackId,
    this.type,
  });

  factory ServiceError.fromJson(Map<String, dynamic> json) {
    return ServiceError(
      createdAt: json['CreatedAt'] as String?,
      instanceId: json['InstanceId'] as String?,
      message: json['Message'] as String?,
      serviceErrorId: json['ServiceErrorId'] as String?,
      stackId: json['StackId'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final instanceId = this.instanceId;
    final message = this.message;
    final serviceErrorId = this.serviceErrorId;
    final stackId = this.stackId;
    final type = this.type;
    return {
      if (createdAt != null) 'CreatedAt': createdAt,
      if (instanceId != null) 'InstanceId': instanceId,
      if (message != null) 'Message': message,
      if (serviceErrorId != null) 'ServiceErrorId': serviceErrorId,
      if (stackId != null) 'StackId': stackId,
      if (type != null) 'Type': type,
    };
  }
}

/// The Shutdown event configuration.
class ShutdownEventConfiguration {
  /// Whether to enable Elastic Load Balancing connection draining. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/TerminologyandKeyConcepts.html#conn-drain">Connection
  /// Draining</a>
  final bool? delayUntilElbConnectionsDrained;

  /// The time, in seconds, that OpsWorks Stacks waits after triggering a Shutdown
  /// event before shutting down an instance.
  final int? executionTimeout;

  ShutdownEventConfiguration({
    this.delayUntilElbConnectionsDrained,
    this.executionTimeout,
  });

  factory ShutdownEventConfiguration.fromJson(Map<String, dynamic> json) {
    return ShutdownEventConfiguration(
      delayUntilElbConnectionsDrained:
          json['DelayUntilElbConnectionsDrained'] as bool?,
      executionTimeout: json['ExecutionTimeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final delayUntilElbConnectionsDrained =
        this.delayUntilElbConnectionsDrained;
    final executionTimeout = this.executionTimeout;
    return {
      if (delayUntilElbConnectionsDrained != null)
        'DelayUntilElbConnectionsDrained': delayUntilElbConnectionsDrained,
      if (executionTimeout != null) 'ExecutionTimeout': executionTimeout,
    };
  }
}

/// Contains the information required to retrieve an app or cookbook from a
/// repository. For more information, see <a
/// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html">Creating
/// Apps</a> or <a
/// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html">Custom
/// Recipes and Cookbooks</a>.
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
  /// In responses, OpsWorks Stacks returns <code>*****FILTERED*****</code>
  /// instead of the actual value.
  final String? password;

  /// The application's version. OpsWorks Stacks enables you to easily deploy new
  /// versions of an application. One of the simplest approaches is to have
  /// branches or revisions in your repository that represent different versions
  /// that can potentially be deployed.
  final String? revision;

  /// In requests, the repository's SSH key.
  ///
  /// In responses, OpsWorks Stacks returns <code>*****FILTERED*****</code>
  /// instead of the actual value.
  final String? sshKey;

  /// The repository type.
  final SourceType? type;

  /// The source URL. The following is an example of an Amazon S3 source URL:
  /// <code>https://s3.amazonaws.com/opsworks-demo-bucket/opsworks_cookbook_demo.tar.gz</code>.
  final String? url;

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
  final String? username;

  Source({
    this.password,
    this.revision,
    this.sshKey,
    this.type,
    this.url,
    this.username,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      password: json['Password'] as String?,
      revision: json['Revision'] as String?,
      sshKey: json['SshKey'] as String?,
      type: (json['Type'] as String?)?.toSourceType(),
      url: json['Url'] as String?,
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final password = this.password;
    final revision = this.revision;
    final sshKey = this.sshKey;
    final type = this.type;
    final url = this.url;
    final username = this.username;
    return {
      if (password != null) 'Password': password,
      if (revision != null) 'Revision': revision,
      if (sshKey != null) 'SshKey': sshKey,
      if (type != null) 'Type': type.toValue(),
      if (url != null) 'Url': url,
      if (username != null) 'Username': username,
    };
  }
}

enum SourceType {
  git,
  svn,
  archive,
  s3,
}

extension SourceTypeValueExtension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.git:
        return 'git';
      case SourceType.svn:
        return 'svn';
      case SourceType.archive:
        return 'archive';
      case SourceType.s3:
        return 's3';
    }
  }
}

extension SourceTypeFromString on String {
  SourceType toSourceType() {
    switch (this) {
      case 'git':
        return SourceType.git;
      case 'svn':
        return SourceType.svn;
      case 'archive':
        return SourceType.archive;
      case 's3':
        return SourceType.s3;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

/// Describes an app's SSL configuration.
class SslConfiguration {
  /// The contents of the certificate's domain.crt file.
  final String certificate;

  /// The private key; the contents of the certificate's domain.kex file.
  final String privateKey;

  /// Optional. Can be used to specify an intermediate certificate authority key
  /// or client authentication.
  final String? chain;

  SslConfiguration({
    required this.certificate,
    required this.privateKey,
    this.chain,
  });

  factory SslConfiguration.fromJson(Map<String, dynamic> json) {
    return SslConfiguration(
      certificate: json['Certificate'] as String,
      privateKey: json['PrivateKey'] as String,
      chain: json['Chain'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    final privateKey = this.privateKey;
    final chain = this.chain;
    return {
      'Certificate': certificate,
      'PrivateKey': privateKey,
      if (chain != null) 'Chain': chain,
    };
  }
}

/// Describes a stack.
class Stack {
  /// The agent version. This parameter is set to <code>LATEST</code> for
  /// auto-update. or a version number for a fixed agent version.
  final String? agentVersion;

  /// The stack's ARN.
  final String? arn;

  /// The stack's attributes.
  final Map<StackAttributesKeys, String>? attributes;

  /// A <code>ChefConfiguration</code> object that specifies whether to enable
  /// Berkshelf and the Berkshelf version. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-creating.html">Create
  /// a New Stack</a>.
  final ChefConfiguration? chefConfiguration;

  /// The configuration manager.
  final StackConfigurationManager? configurationManager;

  /// The date when the stack was created.
  final String? createdAt;

  /// Contains the information required to retrieve an app or cookbook from a
  /// repository. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html">Adding
  /// Apps</a> or <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html">Cookbooks
  /// and Recipes</a>.
  final Source? customCookbooksSource;

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
  final String? customJson;

  /// The stack's default Availability Zone. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  final String? defaultAvailabilityZone;

  /// The ARN of an IAM profile that is the default profile for all of the stack's
  /// EC2 instances. For more information about IAM ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">Using
  /// Identifiers</a>.
  final String? defaultInstanceProfileArn;

  /// The stack's default operating system.
  final String? defaultOs;

  /// The default root device type. This value is used by default for all
  /// instances in the stack, but you can override it when you create an instance.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device">Storage
  /// for the Root Device</a>.
  final RootDeviceType? defaultRootDeviceType;

  /// A default Amazon EC2 key pair for the stack's instances. You can override
  /// this value when you create or update an instance.
  final String? defaultSshKeyName;

  /// The default subnet ID; applicable only if the stack is running in a VPC.
  final String? defaultSubnetId;

  /// The stack host name theme, with spaces replaced by underscores.
  final String? hostnameTheme;

  /// The stack name. Stack names can be a maximum of 64 characters.
  final String? name;

  /// The stack Amazon Web Services Region, such as <code>ap-northeast-2</code>.
  /// For more information about Amazon Web Services Regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  final String? region;

  /// The stack Identity and Access Management (IAM) role.
  final String? serviceRoleArn;

  /// The stack ID.
  final String? stackId;

  /// Whether the stack uses custom cookbooks.
  final bool? useCustomCookbooks;

  /// Whether the stack automatically associates the OpsWorks Stacks built-in
  /// security groups with the stack's layers.
  final bool? useOpsworksSecurityGroups;

  /// The VPC ID; applicable only if the stack is running in a VPC.
  final String? vpcId;

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

  factory Stack.fromJson(Map<String, dynamic> json) {
    return Stack(
      agentVersion: json['AgentVersion'] as String?,
      arn: json['Arn'] as String?,
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toStackAttributesKeys(), e as String)),
      chefConfiguration: json['ChefConfiguration'] != null
          ? ChefConfiguration.fromJson(
              json['ChefConfiguration'] as Map<String, dynamic>)
          : null,
      configurationManager: json['ConfigurationManager'] != null
          ? StackConfigurationManager.fromJson(
              json['ConfigurationManager'] as Map<String, dynamic>)
          : null,
      createdAt: json['CreatedAt'] as String?,
      customCookbooksSource: json['CustomCookbooksSource'] != null
          ? Source.fromJson(
              json['CustomCookbooksSource'] as Map<String, dynamic>)
          : null,
      customJson: json['CustomJson'] as String?,
      defaultAvailabilityZone: json['DefaultAvailabilityZone'] as String?,
      defaultInstanceProfileArn: json['DefaultInstanceProfileArn'] as String?,
      defaultOs: json['DefaultOs'] as String?,
      defaultRootDeviceType:
          (json['DefaultRootDeviceType'] as String?)?.toRootDeviceType(),
      defaultSshKeyName: json['DefaultSshKeyName'] as String?,
      defaultSubnetId: json['DefaultSubnetId'] as String?,
      hostnameTheme: json['HostnameTheme'] as String?,
      name: json['Name'] as String?,
      region: json['Region'] as String?,
      serviceRoleArn: json['ServiceRoleArn'] as String?,
      stackId: json['StackId'] as String?,
      useCustomCookbooks: json['UseCustomCookbooks'] as bool?,
      useOpsworksSecurityGroups: json['UseOpsworksSecurityGroups'] as bool?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentVersion = this.agentVersion;
    final arn = this.arn;
    final attributes = this.attributes;
    final chefConfiguration = this.chefConfiguration;
    final configurationManager = this.configurationManager;
    final createdAt = this.createdAt;
    final customCookbooksSource = this.customCookbooksSource;
    final customJson = this.customJson;
    final defaultAvailabilityZone = this.defaultAvailabilityZone;
    final defaultInstanceProfileArn = this.defaultInstanceProfileArn;
    final defaultOs = this.defaultOs;
    final defaultRootDeviceType = this.defaultRootDeviceType;
    final defaultSshKeyName = this.defaultSshKeyName;
    final defaultSubnetId = this.defaultSubnetId;
    final hostnameTheme = this.hostnameTheme;
    final name = this.name;
    final region = this.region;
    final serviceRoleArn = this.serviceRoleArn;
    final stackId = this.stackId;
    final useCustomCookbooks = this.useCustomCookbooks;
    final useOpsworksSecurityGroups = this.useOpsworksSecurityGroups;
    final vpcId = this.vpcId;
    return {
      if (agentVersion != null) 'AgentVersion': agentVersion,
      if (arn != null) 'Arn': arn,
      if (attributes != null)
        'Attributes': attributes.map((k, e) => MapEntry(k.toValue(), e)),
      if (chefConfiguration != null) 'ChefConfiguration': chefConfiguration,
      if (configurationManager != null)
        'ConfigurationManager': configurationManager,
      if (createdAt != null) 'CreatedAt': createdAt,
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
      if (serviceRoleArn != null) 'ServiceRoleArn': serviceRoleArn,
      if (stackId != null) 'StackId': stackId,
      if (useCustomCookbooks != null) 'UseCustomCookbooks': useCustomCookbooks,
      if (useOpsworksSecurityGroups != null)
        'UseOpsworksSecurityGroups': useOpsworksSecurityGroups,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

enum StackAttributesKeys {
  color,
}

extension StackAttributesKeysValueExtension on StackAttributesKeys {
  String toValue() {
    switch (this) {
      case StackAttributesKeys.color:
        return 'Color';
    }
  }
}

extension StackAttributesKeysFromString on String {
  StackAttributesKeys toStackAttributesKeys() {
    switch (this) {
      case 'Color':
        return StackAttributesKeys.color;
    }
    throw Exception('$this is not known in enum StackAttributesKeys');
  }
}

/// Describes the configuration manager.
class StackConfigurationManager {
  /// The name. This parameter must be set to <code>Chef</code>.
  final String? name;

  /// The Chef version. This parameter must be set to 12, 11.10, or 11.4 for Linux
  /// stacks, and to 12.2 for Windows stacks. The default value for Linux stacks
  /// is 12.
  final String? version;

  StackConfigurationManager({
    this.name,
    this.version,
  });

  factory StackConfigurationManager.fromJson(Map<String, dynamic> json) {
    return StackConfigurationManager(
      name: json['Name'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

/// Summarizes the number of layers, instances, and apps in a stack.
class StackSummary {
  /// The number of apps.
  final int? appsCount;

  /// The stack's ARN.
  final String? arn;

  /// An <code>InstancesCount</code> object with the number of instances in each
  /// status.
  final InstancesCount? instancesCount;

  /// The number of layers.
  final int? layersCount;

  /// The stack name.
  final String? name;

  /// The stack ID.
  final String? stackId;

  StackSummary({
    this.appsCount,
    this.arn,
    this.instancesCount,
    this.layersCount,
    this.name,
    this.stackId,
  });

  factory StackSummary.fromJson(Map<String, dynamic> json) {
    return StackSummary(
      appsCount: json['AppsCount'] as int?,
      arn: json['Arn'] as String?,
      instancesCount: json['InstancesCount'] != null
          ? InstancesCount.fromJson(
              json['InstancesCount'] as Map<String, dynamic>)
          : null,
      layersCount: json['LayersCount'] as int?,
      name: json['Name'] as String?,
      stackId: json['StackId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appsCount = this.appsCount;
    final arn = this.arn;
    final instancesCount = this.instancesCount;
    final layersCount = this.layersCount;
    final name = this.name;
    final stackId = this.stackId;
    return {
      if (appsCount != null) 'AppsCount': appsCount,
      if (arn != null) 'Arn': arn,
      if (instancesCount != null) 'InstancesCount': instancesCount,
      if (layersCount != null) 'LayersCount': layersCount,
      if (name != null) 'Name': name,
      if (stackId != null) 'StackId': stackId,
    };
  }
}

/// Contains the data needed by RDP clients such as the Microsoft Remote Desktop
/// Connection to log in to the instance.
class TemporaryCredential {
  /// The instance's OpsWorks Stacks ID.
  final String? instanceId;

  /// The password.
  final String? password;

  /// The user name.
  final String? username;

  /// The length of time (in minutes) that the grant is valid. When the grant
  /// expires, at the end of this period, the user will no longer be able to use
  /// the credentials to log in. If they are logged in at the time, they are
  /// automatically logged out.
  final int? validForInMinutes;

  TemporaryCredential({
    this.instanceId,
    this.password,
    this.username,
    this.validForInMinutes,
  });

  factory TemporaryCredential.fromJson(Map<String, dynamic> json) {
    return TemporaryCredential(
      instanceId: json['InstanceId'] as String?,
      password: json['Password'] as String?,
      username: json['Username'] as String?,
      validForInMinutes: json['ValidForInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    final password = this.password;
    final username = this.username;
    final validForInMinutes = this.validForInMinutes;
    return {
      if (instanceId != null) 'InstanceId': instanceId,
      if (password != null) 'Password': password,
      if (username != null) 'Username': username,
      if (validForInMinutes != null) 'ValidForInMinutes': validForInMinutes,
    };
  }
}

/// Describes an instance's time-based auto scaling configuration.
class TimeBasedAutoScalingConfiguration {
  /// A <code>WeeklyAutoScalingSchedule</code> object with the instance schedule.
  final WeeklyAutoScalingSchedule? autoScalingSchedule;

  /// The instance ID.
  final String? instanceId;

  TimeBasedAutoScalingConfiguration({
    this.autoScalingSchedule,
    this.instanceId,
  });

  factory TimeBasedAutoScalingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return TimeBasedAutoScalingConfiguration(
      autoScalingSchedule: json['AutoScalingSchedule'] != null
          ? WeeklyAutoScalingSchedule.fromJson(
              json['AutoScalingSchedule'] as Map<String, dynamic>)
          : null,
      instanceId: json['InstanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingSchedule = this.autoScalingSchedule;
    final instanceId = this.instanceId;
    return {
      if (autoScalingSchedule != null)
        'AutoScalingSchedule': autoScalingSchedule,
      if (instanceId != null) 'InstanceId': instanceId,
    };
  }
}

/// Describes a user's SSH information.
class UserProfile {
  /// Whether users can specify their own SSH public key through the My Settings
  /// page. For more information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/security-settingsshkey.html">Managing
  /// User Permissions</a>.
  final bool? allowSelfManagement;

  /// The user's IAM ARN.
  final String? iamUserArn;

  /// The user's name.
  final String? name;

  /// The user's SSH public key.
  final String? sshPublicKey;

  /// The user's SSH user name.
  final String? sshUsername;

  UserProfile({
    this.allowSelfManagement,
    this.iamUserArn,
    this.name,
    this.sshPublicKey,
    this.sshUsername,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      allowSelfManagement: json['AllowSelfManagement'] as bool?,
      iamUserArn: json['IamUserArn'] as String?,
      name: json['Name'] as String?,
      sshPublicKey: json['SshPublicKey'] as String?,
      sshUsername: json['SshUsername'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowSelfManagement = this.allowSelfManagement;
    final iamUserArn = this.iamUserArn;
    final name = this.name;
    final sshPublicKey = this.sshPublicKey;
    final sshUsername = this.sshUsername;
    return {
      if (allowSelfManagement != null)
        'AllowSelfManagement': allowSelfManagement,
      if (iamUserArn != null) 'IamUserArn': iamUserArn,
      if (name != null) 'Name': name,
      if (sshPublicKey != null) 'SshPublicKey': sshPublicKey,
      if (sshUsername != null) 'SshUsername': sshUsername,
    };
  }
}

enum VirtualizationType {
  paravirtual,
  hvm,
}

extension VirtualizationTypeValueExtension on VirtualizationType {
  String toValue() {
    switch (this) {
      case VirtualizationType.paravirtual:
        return 'paravirtual';
      case VirtualizationType.hvm:
        return 'hvm';
    }
  }
}

extension VirtualizationTypeFromString on String {
  VirtualizationType toVirtualizationType() {
    switch (this) {
      case 'paravirtual':
        return VirtualizationType.paravirtual;
      case 'hvm':
        return VirtualizationType.hvm;
    }
    throw Exception('$this is not known in enum VirtualizationType');
  }
}

/// Describes an instance's Amazon EBS volume.
class Volume {
  /// The volume Availability Zone. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  final String? availabilityZone;

  /// The device name.
  final String? device;

  /// The Amazon EC2 volume ID.
  final String? ec2VolumeId;

  /// Specifies whether an Amazon EBS volume is encrypted. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon
  /// EBS Encryption</a>.
  final bool? encrypted;

  /// The instance ID.
  final String? instanceId;

  /// For PIOPS volumes, the IOPS per disk.
  final int? iops;

  /// The volume mount point. For example, "/mnt/disk1".
  final String? mountPoint;

  /// The volume name. Volume names are a maximum of 128 characters.
  final String? name;

  /// The RAID array ID.
  final String? raidArrayId;

  /// The Amazon Web Services Region. For more information about Amazon Web
  /// Services Regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a>.
  final String? region;

  /// The volume size.
  final int? size;

  /// The value returned by <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeVolumes.html">DescribeVolumes</a>.
  final String? status;

  /// The volume ID.
  final String? volumeId;

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
  /// optimized HDD volumes must have a minimum size of 125 GiB and a maximum size
  /// of 16384 GiB.
  /// </li>
  /// <li>
  /// <code>sc1</code> - Cold HDD. Cold HDD volumes must have a minimum size of
  /// 125 GiB and a maximum size of 16384 GiB.
  /// </li>
  /// </ul>
  final String? volumeType;

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

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      availabilityZone: json['AvailabilityZone'] as String?,
      device: json['Device'] as String?,
      ec2VolumeId: json['Ec2VolumeId'] as String?,
      encrypted: json['Encrypted'] as bool?,
      instanceId: json['InstanceId'] as String?,
      iops: json['Iops'] as int?,
      mountPoint: json['MountPoint'] as String?,
      name: json['Name'] as String?,
      raidArrayId: json['RaidArrayId'] as String?,
      region: json['Region'] as String?,
      size: json['Size'] as int?,
      status: json['Status'] as String?,
      volumeId: json['VolumeId'] as String?,
      volumeType: json['VolumeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final device = this.device;
    final ec2VolumeId = this.ec2VolumeId;
    final encrypted = this.encrypted;
    final instanceId = this.instanceId;
    final iops = this.iops;
    final mountPoint = this.mountPoint;
    final name = this.name;
    final raidArrayId = this.raidArrayId;
    final region = this.region;
    final size = this.size;
    final status = this.status;
    final volumeId = this.volumeId;
    final volumeType = this.volumeType;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (device != null) 'Device': device,
      if (ec2VolumeId != null) 'Ec2VolumeId': ec2VolumeId,
      if (encrypted != null) 'Encrypted': encrypted,
      if (instanceId != null) 'InstanceId': instanceId,
      if (iops != null) 'Iops': iops,
      if (mountPoint != null) 'MountPoint': mountPoint,
      if (name != null) 'Name': name,
      if (raidArrayId != null) 'RaidArrayId': raidArrayId,
      if (region != null) 'Region': region,
      if (size != null) 'Size': size,
      if (status != null) 'Status': status,
      if (volumeId != null) 'VolumeId': volumeId,
      if (volumeType != null) 'VolumeType': volumeType,
    };
  }
}

/// Describes an Amazon EBS volume configuration.
class VolumeConfiguration {
  /// The volume mount point. For example "/dev/sdh".
  final String mountPoint;

  /// The number of disks in the volume.
  final int numberOfDisks;

  /// The volume size.
  final int size;

  /// Specifies whether an Amazon EBS volume is encrypted. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon
  /// EBS Encryption</a>.
  final bool? encrypted;

  /// For PIOPS volumes, the IOPS per disk.
  final int? iops;

  /// The volume <a href="http://en.wikipedia.org/wiki/Standard_RAID_levels">RAID
  /// level</a>.
  final int? raidLevel;

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
  /// optimized HDD volumes must have a minimum size of 125 GiB and a maximum size
  /// of 16384 GiB.
  /// </li>
  /// <li>
  /// <code>sc1</code> - Cold HDD. Cold HDD volumes must have a minimum size of
  /// 125 GiB and a maximum size of 16384 GiB.
  /// </li>
  /// </ul>
  final String? volumeType;

  VolumeConfiguration({
    required this.mountPoint,
    required this.numberOfDisks,
    required this.size,
    this.encrypted,
    this.iops,
    this.raidLevel,
    this.volumeType,
  });

  factory VolumeConfiguration.fromJson(Map<String, dynamic> json) {
    return VolumeConfiguration(
      mountPoint: json['MountPoint'] as String,
      numberOfDisks: json['NumberOfDisks'] as int,
      size: json['Size'] as int,
      encrypted: json['Encrypted'] as bool?,
      iops: json['Iops'] as int?,
      raidLevel: json['RaidLevel'] as int?,
      volumeType: json['VolumeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mountPoint = this.mountPoint;
    final numberOfDisks = this.numberOfDisks;
    final size = this.size;
    final encrypted = this.encrypted;
    final iops = this.iops;
    final raidLevel = this.raidLevel;
    final volumeType = this.volumeType;
    return {
      'MountPoint': mountPoint,
      'NumberOfDisks': numberOfDisks,
      'Size': size,
      if (encrypted != null) 'Encrypted': encrypted,
      if (iops != null) 'Iops': iops,
      if (raidLevel != null) 'RaidLevel': raidLevel,
      if (volumeType != null) 'VolumeType': volumeType,
    };
  }
}

enum VolumeType {
  gp2,
  io1,
  standard,
}

extension VolumeTypeValueExtension on VolumeType {
  String toValue() {
    switch (this) {
      case VolumeType.gp2:
        return 'gp2';
      case VolumeType.io1:
        return 'io1';
      case VolumeType.standard:
        return 'standard';
    }
  }
}

extension VolumeTypeFromString on String {
  VolumeType toVolumeType() {
    switch (this) {
      case 'gp2':
        return VolumeType.gp2;
      case 'io1':
        return VolumeType.io1;
      case 'standard':
        return VolumeType.standard;
    }
    throw Exception('$this is not known in enum VolumeType');
  }
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
class WeeklyAutoScalingSchedule {
  /// The schedule for Friday.
  final Map<String, String>? friday;

  /// The schedule for Monday.
  final Map<String, String>? monday;

  /// The schedule for Saturday.
  final Map<String, String>? saturday;

  /// The schedule for Sunday.
  final Map<String, String>? sunday;

  /// The schedule for Thursday.
  final Map<String, String>? thursday;

  /// The schedule for Tuesday.
  final Map<String, String>? tuesday;

  /// The schedule for Wednesday.
  final Map<String, String>? wednesday;

  WeeklyAutoScalingSchedule({
    this.friday,
    this.monday,
    this.saturday,
    this.sunday,
    this.thursday,
    this.tuesday,
    this.wednesday,
  });

  factory WeeklyAutoScalingSchedule.fromJson(Map<String, dynamic> json) {
    return WeeklyAutoScalingSchedule(
      friday: (json['Friday'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      monday: (json['Monday'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      saturday: (json['Saturday'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sunday: (json['Sunday'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      thursday: (json['Thursday'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tuesday: (json['Tuesday'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      wednesday: (json['Wednesday'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final friday = this.friday;
    final monday = this.monday;
    final saturday = this.saturday;
    final sunday = this.sunday;
    final thursday = this.thursday;
    final tuesday = this.tuesday;
    final wednesday = this.wednesday;
    return {
      if (friday != null) 'Friday': friday,
      if (monday != null) 'Monday': monday,
      if (saturday != null) 'Saturday': saturday,
      if (sunday != null) 'Sunday': sunday,
      if (thursday != null) 'Thursday': thursday,
      if (tuesday != null) 'Tuesday': tuesday,
      if (wednesday != null) 'Wednesday': wednesday,
    };
  }
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
