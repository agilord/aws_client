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

/// AWS OpsWorks for configuration management (CM) is a service that runs and
/// manages configuration management servers. You can use AWS OpsWorks CM to
/// create and manage AWS OpsWorks for Chef Automate and AWS OpsWorks for Puppet
/// Enterprise servers, and add or remove nodes for the servers to manage.
class OpsWorksCM {
  final _s.JsonProtocol _protocol;
  OpsWorksCM({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'opsworks-cm',
            signingName: 'opsworks-cm',
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

  /// Associates a new node with the server. For more information about how to
  /// disassociate a node, see <a>DisassociateNode</a>.
  ///
  /// On a Chef server: This command is an alternative to <code>knife
  /// bootstrap</code>.
  ///
  /// Example (Chef): <code>aws opsworks-cm associate-node --server-name
  /// <i>MyServer</i> --node-name <i>MyManagedNode</i> --engine-attributes
  /// "Name=<i>CHEF_ORGANIZATION</i>,Value=default"
  /// "Name=<i>CHEF_NODE_PUBLIC_KEY</i>,Value=<i>public-key-pem</i>"</code>
  ///
  /// On a Puppet server, this command is an alternative to the <code>puppet
  /// cert sign</code> command that signs a Puppet node CSR.
  ///
  /// Example (Puppet): <code>aws opsworks-cm associate-node --server-name
  /// <i>MyServer</i> --node-name <i>MyManagedNode</i> --engine-attributes
  /// "Name=<i>PUPPET_NODE_CSR</i>,Value=<i>csr-pem</i>"</code>
  ///
  /// A node can can only be associated with servers that are in a
  /// <code>HEALTHY</code> state. Otherwise, an
  /// <code>InvalidStateException</code> is thrown. A
  /// <code>ResourceNotFoundException</code> is thrown when the server does not
  /// exist. A <code>ValidationException</code> is raised when parameters of the
  /// request are not valid. The AssociateNode API call can be integrated into
  /// Auto Scaling configurations, AWS Cloudformation templates, or the user
  /// data of a server's instance.
  ///
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [engineAttributes] :
  /// Engine attributes used for associating the node.
  /// <p class="title"> <b>Attributes accepted in a AssociateNode request for
  /// Chef</b>
  ///
  /// <ul>
  /// <li>
  /// <code>CHEF_ORGANIZATION</code>: The Chef organization with which the node
  /// is associated. By default only one organization named <code>default</code>
  /// can exist.
  /// </li>
  /// <li>
  /// <code>CHEF_NODE_PUBLIC_KEY</code>: A PEM-formatted public key. This key is
  /// required for the <code>chef-client</code> agent to access the Chef API.
  /// </li>
  /// </ul> <p class="title"> <b>Attributes accepted in a AssociateNode request
  /// for Puppet</b>
  ///
  /// <ul>
  /// <li>
  /// <code>PUPPET_NODE_CSR</code>: A PEM-formatted certificate-signing request
  /// (CSR) that is created by the node.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nodeName] :
  /// The name of the node.
  ///
  /// Parameter [serverName] :
  /// The name of the server with which to associate the node.
  Future<AssociateNodeResponse> associateNode({
    required List<EngineAttribute> engineAttributes,
    required String nodeName,
    required String serverName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.AssociateNode'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EngineAttributes': engineAttributes,
        'NodeName': nodeName,
        'ServerName': serverName,
      },
    );

    return AssociateNodeResponse.fromJson(jsonResponse.body);
  }

  /// Creates an application-level backup of a server. While the server is in
  /// the <code>BACKING_UP</code> state, the server cannot be changed, and no
  /// additional backup can be created.
  ///
  /// Backups can be created for servers in <code>RUNNING</code>,
  /// <code>HEALTHY</code>, and <code>UNHEALTHY</code> states. By default, you
  /// can create a maximum of 50 manual backups.
  ///
  /// This operation is asynchronous.
  ///
  /// A <code>LimitExceededException</code> is thrown when the maximum number of
  /// manual backups is reached. An <code>InvalidStateException</code> is thrown
  /// when the server is not in any of the following states: RUNNING, HEALTHY,
  /// or UNHEALTHY. A <code>ResourceNotFoundException</code> is thrown when the
  /// server is not found. A <code>ValidationException</code> is thrown when
  /// parameters of the request are not valid.
  ///
  /// May throw [InvalidStateException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serverName] :
  /// The name of the server that you want to back up.
  ///
  /// Parameter [description] :
  /// A user-defined description of the backup.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values to attach to an AWS
  /// OpsWorks-CM server backup.
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
  /// A maximum of 50 user-applied tags is allowed for tag-supported AWS
  /// OpsWorks-CM resources.
  /// </li>
  /// </ul>
  Future<CreateBackupResponse> createBackup({
    required String serverName,
    String? description,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.CreateBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerName': serverName,
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateBackupResponse.fromJson(jsonResponse.body);
  }

  /// Creates and immedately starts a new server. The server is ready to use
  /// when it is in the <code>HEALTHY</code> state. By default, you can create a
  /// maximum of 10 servers.
  ///
  /// This operation is asynchronous.
  ///
  /// A <code>LimitExceededException</code> is thrown when you have created the
  /// maximum number of servers (10). A
  /// <code>ResourceAlreadyExistsException</code> is thrown when a server with
  /// the same name already exists in the account. A
  /// <code>ResourceNotFoundException</code> is thrown when you specify a backup
  /// ID that is not valid or is for a backup that does not exist. A
  /// <code>ValidationException</code> is thrown when parameters of the request
  /// are not valid.
  ///
  /// If you do not specify a security group by adding the
  /// <code>SecurityGroupIds</code> parameter, AWS OpsWorks creates a new
  /// security group.
  ///
  /// <i>Chef Automate:</i> The default security group opens the Chef server to
  /// the world on TCP port 443. If a KeyName is present, AWS OpsWorks enables
  /// SSH access. SSH is also open to the world on TCP port 22.
  ///
  /// <i>Puppet Enterprise:</i> The default security group opens TCP ports 22,
  /// 443, 4433, 8140, 8142, 8143, and 8170. If a KeyName is present, AWS
  /// OpsWorks enables SSH access. SSH is also open to the world on TCP port 22.
  ///
  /// By default, your server is accessible from any IP address. We recommend
  /// that you update your security group rules to allow access from known IP
  /// addresses and address ranges only. To edit security group rules, open
  /// Security Groups in the navigation pane of the EC2 management console.
  ///
  /// To specify your own domain for a server, and provide your own self-signed
  /// or CA-signed certificate and private key, specify values for
  /// <code>CustomDomain</code>, <code>CustomCertificate</code>, and
  /// <code>CustomPrivateKey</code>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [engine] :
  /// The configuration management engine to use. Valid values include
  /// <code>ChefAutomate</code> and <code>Puppet</code>.
  ///
  /// Parameter [instanceProfileArn] :
  /// The ARN of the instance profile that your Amazon EC2 instances use.
  /// Although the AWS OpsWorks console typically creates the instance profile
  /// for you, if you are using API commands instead, run the
  /// service-role-creation.yaml AWS CloudFormation template, located at
  /// https://s3.amazonaws.com/opsworks-cm-us-east-1-prod-default-assets/misc/opsworks-cm-roles.yaml.
  /// This template creates a CloudFormation stack that includes the instance
  /// profile you need.
  ///
  /// Parameter [instanceType] :
  /// The Amazon EC2 instance type to use. For example, <code>m5.large</code>.
  ///
  /// Parameter [serverName] :
  /// The name of the server. The server name must be unique within your AWS
  /// account, within each region. Server names must start with a letter; then
  /// letters, numbers, or hyphens (-) are allowed, up to a maximum of 40
  /// characters.
  ///
  /// Parameter [serviceRoleArn] :
  /// The service role that the AWS OpsWorks CM service backend uses to work
  /// with your account. Although the AWS OpsWorks management console typically
  /// creates the service role for you, if you are using the AWS CLI or API
  /// commands, run the service-role-creation.yaml AWS CloudFormation template,
  /// located at
  /// https://s3.amazonaws.com/opsworks-cm-us-east-1-prod-default-assets/misc/opsworks-cm-roles.yaml.
  /// This template creates a CloudFormation stack that includes the service
  /// role and instance profile that you need.
  ///
  /// Parameter [associatePublicIpAddress] :
  /// Associate a public IP address with a server that you are launching. Valid
  /// values are <code>true</code> or <code>false</code>. The default value is
  /// <code>true</code>.
  ///
  /// Parameter [backupId] :
  /// If you specify this field, AWS OpsWorks CM creates the server by using the
  /// backup represented by BackupId.
  ///
  /// Parameter [backupRetentionCount] :
  /// The number of automated backups that you want to keep. Whenever a new
  /// backup is created, AWS OpsWorks CM deletes the oldest backups if this
  /// number is exceeded. The default value is <code>1</code>.
  ///
  /// Parameter [customCertificate] :
  /// A PEM-formatted HTTPS certificate. The value can be be a single,
  /// self-signed certificate, or a certificate chain. If you specify a custom
  /// certificate, you must also specify values for <code>CustomDomain</code>
  /// and <code>CustomPrivateKey</code>. The following are requirements for the
  /// <code>CustomCertificate</code> value:
  ///
  /// <ul>
  /// <li>
  /// You can provide either a self-signed, custom certificate, or the full
  /// certificate chain.
  /// </li>
  /// <li>
  /// The certificate must be a valid X509 certificate, or a certificate chain
  /// in PEM format.
  /// </li>
  /// <li>
  /// The certificate must be valid at the time of upload. A certificate can't
  /// be used before its validity period begins (the certificate's
  /// <code>NotBefore</code> date), or after it expires (the certificate's
  /// <code>NotAfter</code> date).
  /// </li>
  /// <li>
  /// The certificate’s common name or subject alternative names (SANs), if
  /// present, must match the value of <code>CustomDomain</code>.
  /// </li>
  /// <li>
  /// The certificate must match the value of <code>CustomPrivateKey</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [customDomain] :
  /// An optional public endpoint of a server, such as
  /// <code>https://aws.my-company.com</code>. To access the server, create a
  /// CNAME DNS record in your preferred DNS service that points the custom
  /// domain to the endpoint that is generated when the server is created (the
  /// value of the CreateServer Endpoint attribute). You cannot access the
  /// server by using the generated <code>Endpoint</code> value if the server is
  /// using a custom domain. If you specify a custom domain, you must also
  /// specify values for <code>CustomCertificate</code> and
  /// <code>CustomPrivateKey</code>.
  ///
  /// Parameter [customPrivateKey] :
  /// A private key in PEM format for connecting to the server by using HTTPS.
  /// The private key must not be encrypted; it cannot be protected by a
  /// password or passphrase. If you specify a custom private key, you must also
  /// specify values for <code>CustomDomain</code> and
  /// <code>CustomCertificate</code>.
  ///
  /// Parameter [disableAutomatedBackup] :
  /// Enable or disable scheduled backups. Valid values are <code>true</code> or
  /// <code>false</code>. The default value is <code>true</code>.
  ///
  /// Parameter [engineAttributes] :
  /// Optional engine attributes on a specified server.
  /// <p class="title"> <b>Attributes accepted in a Chef createServer
  /// request:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>CHEF_AUTOMATE_PIVOTAL_KEY</code>: A base64-encoded RSA public key.
  /// The corresponding private key is required to access the Chef API. When no
  /// CHEF_AUTOMATE_PIVOTAL_KEY is set, a private key is generated and returned
  /// in the response.
  /// </li>
  /// <li>
  /// <code>CHEF_AUTOMATE_ADMIN_PASSWORD</code>: The password for the
  /// administrative user in the Chef Automate web-based dashboard. The password
  /// length is a minimum of eight characters, and a maximum of 32. The password
  /// can contain letters, numbers, and special characters (!/@#$%^&amp;+=_).
  /// The password must contain at least one lower case letter, one upper case
  /// letter, one number, and one special character. When no
  /// CHEF_AUTOMATE_ADMIN_PASSWORD is set, one is generated and returned in the
  /// response.
  /// </li>
  /// </ul> <p class="title"> <b>Attributes accepted in a Puppet createServer
  /// request:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>PUPPET_ADMIN_PASSWORD</code>: To work with the Puppet Enterprise
  /// console, a password must use ASCII characters.
  /// </li>
  /// <li>
  /// <code>PUPPET_R10K_REMOTE</code>: The r10k remote is the URL of your
  /// control repository (for example,
  /// ssh://git@your.git-repo.com:user/control-repo.git). Specifying an r10k
  /// remote opens TCP port 8170.
  /// </li>
  /// <li>
  /// <code>PUPPET_R10K_PRIVATE_KEY</code>: If you are using a private Git
  /// repository, add PUPPET_R10K_PRIVATE_KEY to specify a PEM-encoded private
  /// SSH key.
  /// </li>
  /// </ul>
  ///
  /// Parameter [engineModel] :
  /// The engine model of the server. Valid values in this release include
  /// <code>Monolithic</code> for Puppet and <code>Single</code> for Chef.
  ///
  /// Parameter [engineVersion] :
  /// The major release version of the engine that you want to use. For a Chef
  /// server, the valid value for EngineVersion is currently <code>2</code>. For
  /// a Puppet server, valid values are <code>2019</code> or <code>2017</code>.
  ///
  /// Parameter [keyPair] :
  /// The Amazon EC2 key pair to set for the instance. This parameter is
  /// optional; if desired, you may specify this parameter to connect to your
  /// instances by using SSH.
  ///
  /// Parameter [preferredBackupWindow] :
  /// The start time for a one-hour period during which AWS OpsWorks CM backs up
  /// application-level data on your server if automated backups are enabled.
  /// Valid values must be specified in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// <code>HH:MM</code> for daily backups
  /// </li>
  /// <li>
  /// <code>DDD:HH:MM</code> for weekly backups
  /// </li>
  /// </ul>
  /// <code>MM</code> must be specified as <code>00</code>. The specified time
  /// is in coordinated universal time (UTC). The default value is a random,
  /// daily start time.
  ///
  /// <b>Example:</b> <code>08:00</code>, which represents a daily start time of
  /// 08:00 UTC.
  ///
  /// <b>Example:</b> <code>Mon:08:00</code>, which represents a start time of
  /// every Monday at 08:00 UTC. (8:00 a.m.)
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The start time for a one-hour period each week during which AWS OpsWorks
  /// CM performs maintenance on the instance. Valid values must be specified in
  /// the following format: <code>DDD:HH:MM</code>. <code>MM</code> must be
  /// specified as <code>00</code>. The specified time is in coordinated
  /// universal time (UTC). The default value is a random one-hour period on
  /// Tuesday, Wednesday, or Friday. See <code>TimeWindowDefinition</code> for
  /// more information.
  ///
  /// <b>Example:</b> <code>Mon:08:00</code>, which represents a start time of
  /// every Monday at 08:00 UTC. (8:00 a.m.)
  ///
  /// Parameter [securityGroupIds] :
  /// A list of security group IDs to attach to the Amazon EC2 instance. If you
  /// add this parameter, the specified security groups must be within the VPC
  /// that is specified by <code>SubnetIds</code>.
  ///
  /// If you do not specify this parameter, AWS OpsWorks CM creates one new
  /// security group that uses TCP ports 22 and 443, open to 0.0.0.0/0
  /// (everyone).
  ///
  /// Parameter [subnetIds] :
  /// The IDs of subnets in which to launch the server EC2 instance.
  ///
  /// Amazon EC2-Classic customers: This field is required. All servers must run
  /// within a VPC. The VPC must have "Auto Assign Public IP" enabled.
  ///
  /// EC2-VPC customers: This field is optional. If you do not specify subnet
  /// IDs, your EC2 instances are created in a default subnet that is selected
  /// by Amazon EC2. If you specify subnet IDs, the VPC must have "Auto Assign
  /// Public IP" enabled.
  ///
  /// For more information about supported Amazon EC2 platforms, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported
  /// Platforms</a>.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values to attach to an AWS OpsWorks
  /// for Chef Automate or AWS OpsWorks for Puppet Enterprise server.
  ///
  /// <ul>
  /// <li>
  /// The key cannot be empty.
  /// </li>
  /// <li>
  /// The key can be a maximum of 127 characters, and can contain only Unicode
  /// letters, numbers, or separators, or the following special characters:
  /// <code>+ - = . _ : / @</code>
  /// </li>
  /// <li>
  /// The value can be a maximum 255 characters, and contain only Unicode
  /// letters, numbers, or separators, or the following special characters:
  /// <code>+ - = . _ : / @</code>
  /// </li>
  /// <li>
  /// Leading and trailing white spaces are trimmed from both the key and value.
  /// </li>
  /// <li>
  /// A maximum of 50 user-applied tags is allowed for any AWS OpsWorks-CM
  /// server.
  /// </li>
  /// </ul>
  Future<CreateServerResponse> createServer({
    required String engine,
    required String instanceProfileArn,
    required String instanceType,
    required String serverName,
    required String serviceRoleArn,
    bool? associatePublicIpAddress,
    String? backupId,
    int? backupRetentionCount,
    String? customCertificate,
    String? customDomain,
    String? customPrivateKey,
    bool? disableAutomatedBackup,
    List<EngineAttribute>? engineAttributes,
    String? engineModel,
    String? engineVersion,
    String? keyPair,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    List<String>? securityGroupIds,
    List<String>? subnetIds,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'backupRetentionCount',
      backupRetentionCount,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.CreateServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Engine': engine,
        'InstanceProfileArn': instanceProfileArn,
        'InstanceType': instanceType,
        'ServerName': serverName,
        'ServiceRoleArn': serviceRoleArn,
        if (associatePublicIpAddress != null)
          'AssociatePublicIpAddress': associatePublicIpAddress,
        if (backupId != null) 'BackupId': backupId,
        if (backupRetentionCount != null)
          'BackupRetentionCount': backupRetentionCount,
        if (customCertificate != null) 'CustomCertificate': customCertificate,
        if (customDomain != null) 'CustomDomain': customDomain,
        if (customPrivateKey != null) 'CustomPrivateKey': customPrivateKey,
        if (disableAutomatedBackup != null)
          'DisableAutomatedBackup': disableAutomatedBackup,
        if (engineAttributes != null) 'EngineAttributes': engineAttributes,
        if (engineModel != null) 'EngineModel': engineModel,
        if (engineVersion != null) 'EngineVersion': engineVersion,
        if (keyPair != null) 'KeyPair': keyPair,
        if (preferredBackupWindow != null)
          'PreferredBackupWindow': preferredBackupWindow,
        if (preferredMaintenanceWindow != null)
          'PreferredMaintenanceWindow': preferredMaintenanceWindow,
        if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
        if (subnetIds != null) 'SubnetIds': subnetIds,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateServerResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a backup. You can delete both manual and automated backups. This
  /// operation is asynchronous.
  ///
  /// An <code>InvalidStateException</code> is thrown when a backup deletion is
  /// already in progress. A <code>ResourceNotFoundException</code> is thrown
  /// when the backup does not exist. A <code>ValidationException</code> is
  /// thrown when parameters of the request are not valid.
  ///
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [backupId] :
  /// The ID of the backup to delete. Run the DescribeBackups command to get a
  /// list of backup IDs. Backup IDs are in the format
  /// <code>ServerName-yyyyMMddHHmmssSSS</code>.
  Future<void> deleteBackup({
    required String backupId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.DeleteBackup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupId': backupId,
      },
    );
  }

  /// Deletes the server and the underlying AWS CloudFormation stacks (including
  /// the server's EC2 instance). When you run this command, the server state is
  /// updated to <code>DELETING</code>. After the server is deleted, it is no
  /// longer returned by <code>DescribeServer</code> requests. If the AWS
  /// CloudFormation stack cannot be deleted, the server cannot be deleted.
  ///
  /// This operation is asynchronous.
  ///
  /// An <code>InvalidStateException</code> is thrown when a server deletion is
  /// already in progress. A <code>ResourceNotFoundException</code> is thrown
  /// when the server does not exist. A <code>ValidationException</code> is
  /// raised when parameters of the request are not valid.
  ///
  ///
  ///
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serverName] :
  /// The ID of the server to delete.
  Future<void> deleteServer({
    required String serverName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.DeleteServer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerName': serverName,
      },
    );
  }

  /// Describes your OpsWorks-CM account attributes.
  ///
  /// This operation is synchronous.
  Future<DescribeAccountAttributesResponse> describeAccountAttributes() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.DescribeAccountAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeAccountAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Describes backups. The results are ordered by time, with newest backups
  /// first. If you do not specify a BackupId or ServerName, the command returns
  /// all backups.
  ///
  /// This operation is synchronous.
  ///
  /// A <code>ResourceNotFoundException</code> is thrown when the backup does
  /// not exist. A <code>ValidationException</code> is raised when parameters of
  /// the request are not valid.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [backupId] :
  /// Describes a single backup.
  ///
  /// Parameter [maxResults] :
  /// This is not currently implemented for <code>DescribeBackups</code>
  /// requests.
  ///
  /// Parameter [nextToken] :
  /// This is not currently implemented for <code>DescribeBackups</code>
  /// requests.
  ///
  /// Parameter [serverName] :
  /// Returns backups for the server with the specified ServerName.
  Future<DescribeBackupsResponse> describeBackups({
    String? backupId,
    int? maxResults,
    String? nextToken,
    String? serverName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.DescribeBackups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (backupId != null) 'BackupId': backupId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (serverName != null) 'ServerName': serverName,
      },
    );

    return DescribeBackupsResponse.fromJson(jsonResponse.body);
  }

  /// Describes events for a specified server. Results are ordered by time, with
  /// newest events first.
  ///
  /// This operation is synchronous.
  ///
  /// A <code>ResourceNotFoundException</code> is thrown when the server does
  /// not exist. A <code>ValidationException</code> is raised when parameters of
  /// the request are not valid.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [serverName] :
  /// The name of the server for which you want to view events.
  ///
  /// Parameter [maxResults] :
  /// To receive a paginated response, use this parameter to specify the maximum
  /// number of results to be returned with a single call. If the number of
  /// available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// NextToken is a string that is returned in some command responses. It
  /// indicates that not all entries have been returned, and that you must run
  /// at least one more request to get remaining items. To get remaining
  /// results, call <code>DescribeEvents</code> again, and assign the token from
  /// the previous results as the value of the <code>nextToken</code> parameter.
  /// If there are no more results, the response object's <code>nextToken</code>
  /// parameter value is <code>null</code>. Setting a <code>nextToken</code>
  /// value that was not returned in your previous results causes an
  /// <code>InvalidNextTokenException</code> to occur.
  Future<DescribeEventsResponse> describeEvents({
    required String serverName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.DescribeEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerName': serverName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeEventsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the current status of an existing association or disassociation
  /// request.
  ///
  /// A <code>ResourceNotFoundException</code> is thrown when no recent
  /// association or disassociation request with the specified token is found,
  /// or when the server does not exist. A <code>ValidationException</code> is
  /// raised when parameters of the request are not valid.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [nodeAssociationStatusToken] :
  /// The token returned in either the AssociateNodeResponse or the
  /// DisassociateNodeResponse.
  ///
  /// Parameter [serverName] :
  /// The name of the server from which to disassociate the node.
  Future<DescribeNodeAssociationStatusResponse> describeNodeAssociationStatus({
    required String nodeAssociationStatusToken,
    required String serverName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.DescribeNodeAssociationStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NodeAssociationStatusToken': nodeAssociationStatusToken,
        'ServerName': serverName,
      },
    );

    return DescribeNodeAssociationStatusResponse.fromJson(jsonResponse.body);
  }

  /// Lists all configuration management servers that are identified with your
  /// account. Only the stored results from Amazon DynamoDB are returned. AWS
  /// OpsWorks CM does not query other services.
  ///
  /// This operation is synchronous.
  ///
  /// A <code>ResourceNotFoundException</code> is thrown when the server does
  /// not exist. A <code>ValidationException</code> is raised when parameters of
  /// the request are not valid.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// This is not currently implemented for <code>DescribeServers</code>
  /// requests.
  ///
  /// Parameter [nextToken] :
  /// This is not currently implemented for <code>DescribeServers</code>
  /// requests.
  ///
  /// Parameter [serverName] :
  /// Describes the server with the specified ServerName.
  Future<DescribeServersResponse> describeServers({
    int? maxResults,
    String? nextToken,
    String? serverName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.DescribeServers'
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
        if (serverName != null) 'ServerName': serverName,
      },
    );

    return DescribeServersResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates a node from an AWS OpsWorks CM server, and removes the node
  /// from the server's managed nodes. After a node is disassociated, the node
  /// key pair is no longer valid for accessing the configuration manager's API.
  /// For more information about how to associate a node, see
  /// <a>AssociateNode</a>.
  ///
  /// A node can can only be disassociated from a server that is in a
  /// <code>HEALTHY</code> state. Otherwise, an
  /// <code>InvalidStateException</code> is thrown. A
  /// <code>ResourceNotFoundException</code> is thrown when the server does not
  /// exist. A <code>ValidationException</code> is raised when parameters of the
  /// request are not valid.
  ///
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [nodeName] :
  /// The name of the client node.
  ///
  /// Parameter [serverName] :
  /// The name of the server from which to disassociate the node.
  ///
  /// Parameter [engineAttributes] :
  /// Engine attributes that are used for disassociating the node. No attributes
  /// are required for Puppet.
  /// <p class="title"> <b>Attributes required in a DisassociateNode request for
  /// Chef</b>
  ///
  /// <ul>
  /// <li>
  /// <code>CHEF_ORGANIZATION</code>: The Chef organization with which the node
  /// was associated. By default only one organization named
  /// <code>default</code> can exist.
  /// </li>
  /// </ul>
  Future<DisassociateNodeResponse> disassociateNode({
    required String nodeName,
    required String serverName,
    List<EngineAttribute>? engineAttributes,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.DisassociateNode'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NodeName': nodeName,
        'ServerName': serverName,
        if (engineAttributes != null) 'EngineAttributes': engineAttributes,
      },
    );

    return DisassociateNodeResponse.fromJson(jsonResponse.body);
  }

  /// Exports a specified server engine attribute as a base64-encoded string.
  /// For example, you can export user data that you can use in EC2 to associate
  /// nodes with a server.
  ///
  /// This operation is synchronous.
  ///
  /// A <code>ValidationException</code> is raised when parameters of the
  /// request are not valid. A <code>ResourceNotFoundException</code> is thrown
  /// when the server does not exist. An <code>InvalidStateException</code> is
  /// thrown when the server is in any of the following states: CREATING,
  /// TERMINATED, FAILED or DELETING.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [exportAttributeName] :
  /// The name of the export attribute. Currently, the supported export
  /// attribute is <code>Userdata</code>. This exports a user data script that
  /// includes parameters and values provided in the
  /// <code>InputAttributes</code> list.
  ///
  /// Parameter [serverName] :
  /// The name of the server from which you are exporting the attribute.
  ///
  /// Parameter [inputAttributes] :
  /// The list of engine attributes. The list type is
  /// <code>EngineAttribute</code>. An <code>EngineAttribute</code> list item is
  /// a pair that includes an attribute name and its value. For the
  /// <code>Userdata</code> ExportAttributeName, the following are supported
  /// engine attribute names.
  ///
  /// <ul>
  /// <li>
  /// <b>RunList</b> In Chef, a list of roles or recipes that are run in the
  /// specified order. In Puppet, this parameter is ignored.
  /// </li>
  /// <li>
  /// <b>OrganizationName</b> In Chef, an organization name. AWS OpsWorks for
  /// Chef Automate always creates the organization <code>default</code>. In
  /// Puppet, this parameter is ignored.
  /// </li>
  /// <li>
  /// <b>NodeEnvironment</b> In Chef, a node environment (for example,
  /// development, staging, or one-box). In Puppet, this parameter is ignored.
  /// </li>
  /// <li>
  /// <b>NodeClientVersion</b> In Chef, the version of the Chef engine (three
  /// numbers separated by dots, such as 13.8.5). If this attribute is empty,
  /// OpsWorks for Chef Automate uses the most current version. In Puppet, this
  /// parameter is ignored.
  /// </li>
  /// </ul>
  Future<ExportServerEngineAttributeResponse> exportServerEngineAttribute({
    required String exportAttributeName,
    required String serverName,
    List<EngineAttribute>? inputAttributes,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.ExportServerEngineAttribute'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExportAttributeName': exportAttributeName,
        'ServerName': serverName,
        if (inputAttributes != null) 'InputAttributes': inputAttributes,
      },
    );

    return ExportServerEngineAttributeResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of tags that are applied to the specified AWS OpsWorks for
  /// Chef Automate or AWS OpsWorks for Puppet Enterprise servers or backups.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Number (ARN) of an AWS OpsWorks for Chef Automate or
  /// AWS OpsWorks for Puppet Enterprise server for which you want to show
  /// applied tags. For example,
  /// <code>arn:aws:opsworks-cm:us-west-2:123456789012:server/test-owcm-server/EXAMPLE-66b0-4196-8274-d1a2bEXAMPLE</code>.
  ///
  /// Parameter [maxResults] :
  /// To receive a paginated response, use this parameter to specify the maximum
  /// number of results to be returned with a single call. If the number of
  /// available results exceeds this maximum, the response includes a
  /// <code>NextToken</code> value that you can assign to the
  /// <code>NextToken</code> request parameter to get the next set of results.
  ///
  /// Parameter [nextToken] :
  /// NextToken is a string that is returned in some command responses. It
  /// indicates that not all entries have been returned, and that you must run
  /// at least one more request to get remaining items. To get remaining
  /// results, call <code>ListTagsForResource</code> again, and assign the token
  /// from the previous results as the value of the <code>nextToken</code>
  /// parameter. If there are no more results, the response object's
  /// <code>nextToken</code> parameter value is <code>null</code>. Setting a
  /// <code>nextToken</code> value that was not returned in your previous
  /// results causes an <code>InvalidNextTokenException</code> to occur.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.ListTagsForResource'
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

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Restores a backup to a server that is in a <code>CONNECTION_LOST</code>,
  /// <code>HEALTHY</code>, <code>RUNNING</code>, <code>UNHEALTHY</code>, or
  /// <code>TERMINATED</code> state. When you run RestoreServer, the server's
  /// EC2 instance is deleted, and a new EC2 instance is configured.
  /// RestoreServer maintains the existing server endpoint, so configuration
  /// management of the server's client devices (nodes) should continue to work.
  ///
  /// Restoring from a backup is performed by creating a new EC2 instance. If
  /// restoration is successful, and the server is in a <code>HEALTHY</code>
  /// state, AWS OpsWorks CM switches traffic over to the new instance. After
  /// restoration is finished, the old EC2 instance is maintained in a
  /// <code>Running</code> or <code>Stopped</code> state, but is eventually
  /// terminated.
  ///
  /// This operation is asynchronous.
  ///
  /// An <code>InvalidStateException</code> is thrown when the server is not in
  /// a valid state. A <code>ResourceNotFoundException</code> is thrown when the
  /// server does not exist. A <code>ValidationException</code> is raised when
  /// parameters of the request are not valid.
  ///
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [backupId] :
  /// The ID of the backup that you want to use to restore a server.
  ///
  /// Parameter [serverName] :
  /// The name of the server that you want to restore.
  ///
  /// Parameter [instanceType] :
  /// The type of instance to restore. Valid values must be specified in the
  /// following format: <code>^([cm][34]|t2).*</code> For example,
  /// <code>m5.large</code>. Valid values are <code>m5.large</code>,
  /// <code>r5.xlarge</code>, and <code>r5.2xlarge</code>. If you do not specify
  /// this parameter, RestoreServer uses the instance type from the specified
  /// backup.
  ///
  /// Parameter [keyPair] :
  /// The name of the key pair to set on the new EC2 instance. This can be
  /// helpful if the administrator no longer has the SSH key.
  Future<RestoreServerResponse> restoreServer({
    required String backupId,
    required String serverName,
    String? instanceType,
    String? keyPair,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.RestoreServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupId': backupId,
        'ServerName': serverName,
        if (instanceType != null) 'InstanceType': instanceType,
        if (keyPair != null) 'KeyPair': keyPair,
      },
    );

    return RestoreServerResponse.fromJson(jsonResponse.body);
  }

  /// Manually starts server maintenance. This command can be useful if an
  /// earlier maintenance attempt failed, and the underlying cause of
  /// maintenance failure has been resolved. The server is in an
  /// <code>UNDER_MAINTENANCE</code> state while maintenance is in progress.
  ///
  /// Maintenance can only be started on servers in <code>HEALTHY</code> and
  /// <code>UNHEALTHY</code> states. Otherwise, an
  /// <code>InvalidStateException</code> is thrown. A
  /// <code>ResourceNotFoundException</code> is thrown when the server does not
  /// exist. A <code>ValidationException</code> is raised when parameters of the
  /// request are not valid.
  ///
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serverName] :
  /// The name of the server on which to run maintenance.
  ///
  /// Parameter [engineAttributes] :
  /// Engine attributes that are specific to the server on which you want to run
  /// maintenance.
  /// <p class="title"> <b>Attributes accepted in a StartMaintenance request for
  /// Chef</b>
  ///
  /// <ul>
  /// <li>
  /// <code>CHEF_MAJOR_UPGRADE</code>: If a Chef Automate server is eligible for
  /// upgrade to Chef Automate 2, add this engine attribute to a
  /// <code>StartMaintenance</code> request and set the value to
  /// <code>true</code> to upgrade the server to Chef Automate 2. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opsworks/latest/userguide/opscm-a2upgrade.html">Upgrade
  /// an AWS OpsWorks for Chef Automate Server to Chef Automate 2</a>.
  /// </li>
  /// </ul>
  Future<StartMaintenanceResponse> startMaintenance({
    required String serverName,
    List<EngineAttribute>? engineAttributes,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.StartMaintenance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerName': serverName,
        if (engineAttributes != null) 'EngineAttributes': engineAttributes,
      },
    );

    return StartMaintenanceResponse.fromJson(jsonResponse.body);
  }

  /// Applies tags to an AWS OpsWorks for Chef Automate or AWS OpsWorks for
  /// Puppet Enterprise server, or to server backups.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Number (ARN) of a resource to which you want to apply
  /// tags. For example,
  /// <code>arn:aws:opsworks-cm:us-west-2:123456789012:server/test-owcm-server/EXAMPLE-66b0-4196-8274-d1a2bEXAMPLE</code>.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values to attach to AWS OpsWorks-CM
  /// servers or backups.
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
  /// A maximum of 50 user-applied tags is allowed for any AWS OpsWorks-CM
  /// server or backup.
  /// </li>
  /// </ul>
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.TagResource'
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

  /// Removes specified tags from an AWS OpsWorks-CM server or backup.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Number (ARN) of a resource from which you want to
  /// remove tags. For example,
  /// <code>arn:aws:opsworks-cm:us-west-2:123456789012:server/test-owcm-server/EXAMPLE-66b0-4196-8274-d1a2bEXAMPLE</code>.
  ///
  /// Parameter [tagKeys] :
  /// The keys of tags that you want to remove.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.UntagResource'
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

  /// Updates settings for a server.
  ///
  /// This operation is synchronous.
  ///
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serverName] :
  /// The name of the server to update.
  ///
  /// Parameter [backupRetentionCount] :
  /// Sets the number of automated backups that you want to keep.
  ///
  /// Parameter [disableAutomatedBackup] :
  /// Setting DisableAutomatedBackup to <code>true</code> disables automated or
  /// scheduled backups. Automated backups are enabled by default.
  Future<UpdateServerResponse> updateServer({
    required String serverName,
    int? backupRetentionCount,
    bool? disableAutomatedBackup,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.UpdateServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServerName': serverName,
        if (backupRetentionCount != null)
          'BackupRetentionCount': backupRetentionCount,
        if (disableAutomatedBackup != null)
          'DisableAutomatedBackup': disableAutomatedBackup,
        if (preferredBackupWindow != null)
          'PreferredBackupWindow': preferredBackupWindow,
        if (preferredMaintenanceWindow != null)
          'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      },
    );

    return UpdateServerResponse.fromJson(jsonResponse.body);
  }

  /// Updates engine-specific attributes on a specified server. The server
  /// enters the <code>MODIFYING</code> state when this operation is in
  /// progress. Only one update can occur at a time. You can use this command to
  /// reset a Chef server's public key (<code>CHEF_PIVOTAL_KEY</code>) or a
  /// Puppet server's admin password (<code>PUPPET_ADMIN_PASSWORD</code>).
  ///
  /// This operation is asynchronous.
  ///
  /// This operation can only be called for servers in <code>HEALTHY</code> or
  /// <code>UNHEALTHY</code> states. Otherwise, an
  /// <code>InvalidStateException</code> is raised. A
  /// <code>ResourceNotFoundException</code> is thrown when the server does not
  /// exist. A <code>ValidationException</code> is raised when parameters of the
  /// request are not valid.
  ///
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [attributeName] :
  /// The name of the engine attribute to update.
  ///
  /// Parameter [serverName] :
  /// The name of the server to update.
  ///
  /// Parameter [attributeValue] :
  /// The value to set for the attribute.
  Future<UpdateServerEngineAttributesResponse> updateServerEngineAttributes({
    required String attributeName,
    required String serverName,
    String? attributeValue,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OpsWorksCM_V2016_11_01.UpdateServerEngineAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AttributeName': attributeName,
        'ServerName': serverName,
        if (attributeValue != null) 'AttributeValue': attributeValue,
      },
    );

    return UpdateServerEngineAttributesResponse.fromJson(jsonResponse.body);
  }
}

/// Stores account attributes.
class AccountAttribute {
  /// The maximum allowed value.
  final int? maximum;

  /// The attribute name. The following are supported attribute names.
  ///
  /// <ul>
  /// <li>
  /// <i>ServerLimit:</i> The number of current servers/maximum number of servers
  /// allowed. By default, you can have a maximum of 10 servers.
  /// </li>
  /// <li>
  /// <i>ManualBackupLimit:</i> The number of current manual backups/maximum
  /// number of backups allowed. By default, you can have a maximum of 50 manual
  /// backups saved.
  /// </li>
  /// </ul>
  final String? name;

  /// The current usage, such as the current number of servers that are associated
  /// with the account.
  final int? used;

  AccountAttribute({
    this.maximum,
    this.name,
    this.used,
  });

  factory AccountAttribute.fromJson(Map<String, dynamic> json) {
    return AccountAttribute(
      maximum: json['Maximum'] as int?,
      name: json['Name'] as String?,
      used: json['Used'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maximum = this.maximum;
    final name = this.name;
    final used = this.used;
    return {
      if (maximum != null) 'Maximum': maximum,
      if (name != null) 'Name': name,
      if (used != null) 'Used': used,
    };
  }
}

class AssociateNodeResponse {
  /// Contains a token which can be passed to the
  /// <code>DescribeNodeAssociationStatus</code> API call to get the status of the
  /// association request.
  final String? nodeAssociationStatusToken;

  AssociateNodeResponse({
    this.nodeAssociationStatusToken,
  });

  factory AssociateNodeResponse.fromJson(Map<String, dynamic> json) {
    return AssociateNodeResponse(
      nodeAssociationStatusToken: json['NodeAssociationStatusToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeAssociationStatusToken = this.nodeAssociationStatusToken;
    return {
      if (nodeAssociationStatusToken != null)
        'NodeAssociationStatusToken': nodeAssociationStatusToken,
    };
  }
}

/// Describes a single backup.
class Backup {
  /// The ARN of the backup.
  final String? backupArn;

  /// The generated ID of the backup. Example:
  /// <code>myServerName-yyyyMMddHHmmssSSS</code>
  final String? backupId;

  /// The backup type. Valid values are <code>automated</code> or
  /// <code>manual</code>.
  final BackupType? backupType;

  /// The time stamp when the backup was created in the database. Example:
  /// <code>2016-07-29T13:38:47.520Z</code>
  final DateTime? createdAt;

  /// A user-provided description for a manual backup. This field is empty for
  /// automated backups.
  final String? description;

  /// The engine type that is obtained from the server when the backup is created.
  final String? engine;

  /// The engine model that is obtained from the server when the backup is
  /// created.
  final String? engineModel;

  /// The engine version that is obtained from the server when the backup is
  /// created.
  final String? engineVersion;

  /// The EC2 instance profile ARN that is obtained from the server when the
  /// backup is created. Because this value is stored, you are not required to
  /// provide the InstanceProfileArn again if you restore a backup.
  final String? instanceProfileArn;

  /// The instance type that is obtained from the server when the backup is
  /// created.
  final String? instanceType;

  /// The key pair that is obtained from the server when the backup is created.
  final String? keyPair;

  /// The preferred backup period that is obtained from the server when the backup
  /// is created.
  final String? preferredBackupWindow;

  /// The preferred maintenance period that is obtained from the server when the
  /// backup is created.
  final String? preferredMaintenanceWindow;

  /// This field is deprecated and is no longer used.
  final int? s3DataSize;

  /// This field is deprecated and is no longer used.
  final String? s3DataUrl;

  /// The Amazon S3 URL of the backup's log file.
  final String? s3LogUrl;

  /// The security group IDs that are obtained from the server when the backup is
  /// created.
  final List<String>? securityGroupIds;

  /// The name of the server from which the backup was made.
  final String? serverName;

  /// The service role ARN that is obtained from the server when the backup is
  /// created.
  final String? serviceRoleArn;

  /// The status of a backup while in progress.
  final BackupStatus? status;

  /// An informational message about backup status.
  final String? statusDescription;

  /// The subnet IDs that are obtained from the server when the backup is created.
  final List<String>? subnetIds;

  /// The version of AWS OpsWorks CM-specific tools that is obtained from the
  /// server when the backup is created.
  final String? toolsVersion;

  /// The IAM user ARN of the requester for manual backups. This field is empty
  /// for automated backups.
  final String? userArn;

  Backup({
    this.backupArn,
    this.backupId,
    this.backupType,
    this.createdAt,
    this.description,
    this.engine,
    this.engineModel,
    this.engineVersion,
    this.instanceProfileArn,
    this.instanceType,
    this.keyPair,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.s3DataSize,
    this.s3DataUrl,
    this.s3LogUrl,
    this.securityGroupIds,
    this.serverName,
    this.serviceRoleArn,
    this.status,
    this.statusDescription,
    this.subnetIds,
    this.toolsVersion,
    this.userArn,
  });

  factory Backup.fromJson(Map<String, dynamic> json) {
    return Backup(
      backupArn: json['BackupArn'] as String?,
      backupId: json['BackupId'] as String?,
      backupType: (json['BackupType'] as String?)?.toBackupType(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      engine: json['Engine'] as String?,
      engineModel: json['EngineModel'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      instanceProfileArn: json['InstanceProfileArn'] as String?,
      instanceType: json['InstanceType'] as String?,
      keyPair: json['KeyPair'] as String?,
      preferredBackupWindow: json['PreferredBackupWindow'] as String?,
      preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String?,
      s3DataSize: json['S3DataSize'] as int?,
      s3DataUrl: json['S3DataUrl'] as String?,
      s3LogUrl: json['S3LogUrl'] as String?,
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      serverName: json['ServerName'] as String?,
      serviceRoleArn: json['ServiceRoleArn'] as String?,
      status: (json['Status'] as String?)?.toBackupStatus(),
      statusDescription: json['StatusDescription'] as String?,
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      toolsVersion: json['ToolsVersion'] as String?,
      userArn: json['UserArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupArn = this.backupArn;
    final backupId = this.backupId;
    final backupType = this.backupType;
    final createdAt = this.createdAt;
    final description = this.description;
    final engine = this.engine;
    final engineModel = this.engineModel;
    final engineVersion = this.engineVersion;
    final instanceProfileArn = this.instanceProfileArn;
    final instanceType = this.instanceType;
    final keyPair = this.keyPair;
    final preferredBackupWindow = this.preferredBackupWindow;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final s3DataSize = this.s3DataSize;
    final s3DataUrl = this.s3DataUrl;
    final s3LogUrl = this.s3LogUrl;
    final securityGroupIds = this.securityGroupIds;
    final serverName = this.serverName;
    final serviceRoleArn = this.serviceRoleArn;
    final status = this.status;
    final statusDescription = this.statusDescription;
    final subnetIds = this.subnetIds;
    final toolsVersion = this.toolsVersion;
    final userArn = this.userArn;
    return {
      if (backupArn != null) 'BackupArn': backupArn,
      if (backupId != null) 'BackupId': backupId,
      if (backupType != null) 'BackupType': backupType.toValue(),
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (engine != null) 'Engine': engine,
      if (engineModel != null) 'EngineModel': engineModel,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (instanceProfileArn != null) 'InstanceProfileArn': instanceProfileArn,
      if (instanceType != null) 'InstanceType': instanceType,
      if (keyPair != null) 'KeyPair': keyPair,
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (s3DataSize != null) 'S3DataSize': s3DataSize,
      if (s3DataUrl != null) 'S3DataUrl': s3DataUrl,
      if (s3LogUrl != null) 'S3LogUrl': s3LogUrl,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (serverName != null) 'ServerName': serverName,
      if (serviceRoleArn != null) 'ServiceRoleArn': serviceRoleArn,
      if (status != null) 'Status': status.toValue(),
      if (statusDescription != null) 'StatusDescription': statusDescription,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (toolsVersion != null) 'ToolsVersion': toolsVersion,
      if (userArn != null) 'UserArn': userArn,
    };
  }
}

enum BackupStatus {
  inProgress,
  ok,
  failed,
  deleting,
}

extension BackupStatusValueExtension on BackupStatus {
  String toValue() {
    switch (this) {
      case BackupStatus.inProgress:
        return 'IN_PROGRESS';
      case BackupStatus.ok:
        return 'OK';
      case BackupStatus.failed:
        return 'FAILED';
      case BackupStatus.deleting:
        return 'DELETING';
    }
  }
}

extension BackupStatusFromString on String {
  BackupStatus toBackupStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return BackupStatus.inProgress;
      case 'OK':
        return BackupStatus.ok;
      case 'FAILED':
        return BackupStatus.failed;
      case 'DELETING':
        return BackupStatus.deleting;
    }
    throw Exception('$this is not known in enum BackupStatus');
  }
}

enum BackupType {
  automated,
  manual,
}

extension BackupTypeValueExtension on BackupType {
  String toValue() {
    switch (this) {
      case BackupType.automated:
        return 'AUTOMATED';
      case BackupType.manual:
        return 'MANUAL';
    }
  }
}

extension BackupTypeFromString on String {
  BackupType toBackupType() {
    switch (this) {
      case 'AUTOMATED':
        return BackupType.automated;
      case 'MANUAL':
        return BackupType.manual;
    }
    throw Exception('$this is not known in enum BackupType');
  }
}

class CreateBackupResponse {
  /// Backup created by request.
  final Backup? backup;

  CreateBackupResponse({
    this.backup,
  });

  factory CreateBackupResponse.fromJson(Map<String, dynamic> json) {
    return CreateBackupResponse(
      backup: json['Backup'] != null
          ? Backup.fromJson(json['Backup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backup = this.backup;
    return {
      if (backup != null) 'Backup': backup,
    };
  }
}

class CreateServerResponse {
  /// The server that is created by the request.
  final Server? server;

  CreateServerResponse({
    this.server,
  });

  factory CreateServerResponse.fromJson(Map<String, dynamic> json) {
    return CreateServerResponse(
      server: json['Server'] != null
          ? Server.fromJson(json['Server'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final server = this.server;
    return {
      if (server != null) 'Server': server,
    };
  }
}

class DeleteBackupResponse {
  DeleteBackupResponse();

  factory DeleteBackupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteBackupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteServerResponse {
  DeleteServerResponse();

  factory DeleteServerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteServerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAccountAttributesResponse {
  /// The attributes that are currently set for the account.
  final List<AccountAttribute>? attributes;

  DescribeAccountAttributesResponse({
    this.attributes,
  });

  factory DescribeAccountAttributesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAccountAttributesResponse(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => AccountAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

class DescribeBackupsResponse {
  /// Contains the response to a <code>DescribeBackups</code> request.
  final List<Backup>? backups;

  /// This is not currently implemented for <code>DescribeBackups</code> requests.
  final String? nextToken;

  DescribeBackupsResponse({
    this.backups,
    this.nextToken,
  });

  factory DescribeBackupsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBackupsResponse(
      backups: (json['Backups'] as List?)
          ?.whereNotNull()
          .map((e) => Backup.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backups = this.backups;
    final nextToken = this.nextToken;
    return {
      if (backups != null) 'Backups': backups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeEventsResponse {
  /// NextToken is a string that is returned in some command responses. It
  /// indicates that not all entries have been returned, and that you must run at
  /// least one more request to get remaining items. To get remaining results,
  /// call <code>DescribeEvents</code> again, and assign the token from the
  /// previous results as the value of the <code>nextToken</code> parameter. If
  /// there are no more results, the response object's <code>nextToken</code>
  /// parameter value is <code>null</code>. Setting a <code>nextToken</code> value
  /// that was not returned in your previous results causes an
  /// <code>InvalidNextTokenException</code> to occur.
  final String? nextToken;

  /// Contains the response to a <code>DescribeEvents</code> request.
  final List<ServerEvent>? serverEvents;

  DescribeEventsResponse({
    this.nextToken,
    this.serverEvents,
  });

  factory DescribeEventsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventsResponse(
      nextToken: json['NextToken'] as String?,
      serverEvents: (json['ServerEvents'] as List?)
          ?.whereNotNull()
          .map((e) => ServerEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final serverEvents = this.serverEvents;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (serverEvents != null) 'ServerEvents': serverEvents,
    };
  }
}

class DescribeNodeAssociationStatusResponse {
  /// Attributes specific to the node association. In Puppet, the attibute
  /// PUPPET_NODE_CERT contains the signed certificate (the result of the CSR).
  final List<EngineAttribute>? engineAttributes;

  /// The status of the association or disassociation request.
  /// <p class="title"> <b>Possible values:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCESS</code>: The association or disassociation succeeded.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The association or disassociation failed.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code>: The association or disassociation is still in
  /// progress.
  /// </li>
  /// </ul>
  final NodeAssociationStatus? nodeAssociationStatus;

  DescribeNodeAssociationStatusResponse({
    this.engineAttributes,
    this.nodeAssociationStatus,
  });

  factory DescribeNodeAssociationStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeNodeAssociationStatusResponse(
      engineAttributes: (json['EngineAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => EngineAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeAssociationStatus:
          (json['NodeAssociationStatus'] as String?)?.toNodeAssociationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final engineAttributes = this.engineAttributes;
    final nodeAssociationStatus = this.nodeAssociationStatus;
    return {
      if (engineAttributes != null) 'EngineAttributes': engineAttributes,
      if (nodeAssociationStatus != null)
        'NodeAssociationStatus': nodeAssociationStatus.toValue(),
    };
  }
}

class DescribeServersResponse {
  /// This is not currently implemented for <code>DescribeServers</code> requests.
  final String? nextToken;

  /// Contains the response to a <code>DescribeServers</code> request.
  ///
  /// <i>For Chef Automate servers:</i> If
  /// <code>DescribeServersResponse$Servers$EngineAttributes</code> includes
  /// CHEF_MAJOR_UPGRADE_AVAILABLE, you can upgrade the Chef Automate server to
  /// Chef Automate 2. To be eligible for upgrade, a server running Chef Automate
  /// 1 must have had at least one successful maintenance run after November 1,
  /// 2019.
  ///
  /// <i>For Puppet servers:</i>
  /// <code>DescribeServersResponse$Servers$EngineAttributes</code> contains the
  /// following two responses:
  ///
  /// <ul>
  /// <li>
  /// <code>PUPPET_API_CA_CERT</code>, the PEM-encoded CA certificate that is used
  /// by the Puppet API over TCP port number 8140. The CA certificate is also used
  /// to sign node certificates.
  /// </li>
  /// <li>
  /// <code>PUPPET_API_CRL</code>, a certificate revocation list. The certificate
  /// revocation list is for internal maintenance purposes only. For more
  /// information about the Puppet certificate revocation list, see <a
  /// href="https://puppet.com/docs/puppet/5.5/man/certificate_revocation_list.html">Man
  /// Page: puppet certificate_revocation_list</a> in the Puppet documentation.
  /// </li>
  /// </ul>
  final List<Server>? servers;

  DescribeServersResponse({
    this.nextToken,
    this.servers,
  });

  factory DescribeServersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeServersResponse(
      nextToken: json['NextToken'] as String?,
      servers: (json['Servers'] as List?)
          ?.whereNotNull()
          .map((e) => Server.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final servers = this.servers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (servers != null) 'Servers': servers,
    };
  }
}

class DisassociateNodeResponse {
  /// Contains a token which can be passed to the
  /// <code>DescribeNodeAssociationStatus</code> API call to get the status of the
  /// disassociation request.
  final String? nodeAssociationStatusToken;

  DisassociateNodeResponse({
    this.nodeAssociationStatusToken,
  });

  factory DisassociateNodeResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateNodeResponse(
      nodeAssociationStatusToken: json['NodeAssociationStatusToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeAssociationStatusToken = this.nodeAssociationStatusToken;
    return {
      if (nodeAssociationStatusToken != null)
        'NodeAssociationStatusToken': nodeAssociationStatusToken,
    };
  }
}

/// A name and value pair that is specific to the engine of the server.
class EngineAttribute {
  /// The name of the engine attribute.
  final String? name;

  /// The value of the engine attribute.
  final String? value;

  EngineAttribute({
    this.name,
    this.value,
  });

  factory EngineAttribute.fromJson(Map<String, dynamic> json) {
    return EngineAttribute(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

class ExportServerEngineAttributeResponse {
  /// The requested engine attribute pair with attribute name and value.
  final EngineAttribute? engineAttribute;

  /// The server name used in the request.
  final String? serverName;

  ExportServerEngineAttributeResponse({
    this.engineAttribute,
    this.serverName,
  });

  factory ExportServerEngineAttributeResponse.fromJson(
      Map<String, dynamic> json) {
    return ExportServerEngineAttributeResponse(
      engineAttribute: json['EngineAttribute'] != null
          ? EngineAttribute.fromJson(
              json['EngineAttribute'] as Map<String, dynamic>)
          : null,
      serverName: json['ServerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final engineAttribute = this.engineAttribute;
    final serverName = this.serverName;
    return {
      if (engineAttribute != null) 'EngineAttribute': engineAttribute,
      if (serverName != null) 'ServerName': serverName,
    };
  }
}

class ListTagsForResourceResponse {
  /// A token that you can use as the value of <code>NextToken</code> in
  /// subsequent calls to the API to show more results.
  final String? nextToken;

  /// Tags that have been applied to the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
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

enum MaintenanceStatus {
  success,
  failed,
}

extension MaintenanceStatusValueExtension on MaintenanceStatus {
  String toValue() {
    switch (this) {
      case MaintenanceStatus.success:
        return 'SUCCESS';
      case MaintenanceStatus.failed:
        return 'FAILED';
    }
  }
}

extension MaintenanceStatusFromString on String {
  MaintenanceStatus toMaintenanceStatus() {
    switch (this) {
      case 'SUCCESS':
        return MaintenanceStatus.success;
      case 'FAILED':
        return MaintenanceStatus.failed;
    }
    throw Exception('$this is not known in enum MaintenanceStatus');
  }
}

/// The status of the association or disassociation request.
/// <p class="title"> <b>Possible values:</b>
///
/// <ul>
/// <li>
/// <code>SUCCESS</code>: The association or disassociation succeeded.
/// </li>
/// <li>
/// <code>FAILED</code>: The association or disassociation failed.
/// </li>
/// <li>
/// <code>IN_PROGRESS</code>: The association or disassociation is still in
/// progress.
/// </li>
/// </ul>
enum NodeAssociationStatus {
  success,
  failed,
  inProgress,
}

extension NodeAssociationStatusValueExtension on NodeAssociationStatus {
  String toValue() {
    switch (this) {
      case NodeAssociationStatus.success:
        return 'SUCCESS';
      case NodeAssociationStatus.failed:
        return 'FAILED';
      case NodeAssociationStatus.inProgress:
        return 'IN_PROGRESS';
    }
  }
}

extension NodeAssociationStatusFromString on String {
  NodeAssociationStatus toNodeAssociationStatus() {
    switch (this) {
      case 'SUCCESS':
        return NodeAssociationStatus.success;
      case 'FAILED':
        return NodeAssociationStatus.failed;
      case 'IN_PROGRESS':
        return NodeAssociationStatus.inProgress;
    }
    throw Exception('$this is not known in enum NodeAssociationStatus');
  }
}

class RestoreServerResponse {
  final Server? server;

  RestoreServerResponse({
    this.server,
  });

  factory RestoreServerResponse.fromJson(Map<String, dynamic> json) {
    return RestoreServerResponse(
      server: json['Server'] != null
          ? Server.fromJson(json['Server'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final server = this.server;
    return {
      if (server != null) 'Server': server,
    };
  }
}

/// Describes a configuration management server.
class Server {
  /// Associate a public IP address with a server that you are launching.
  final bool? associatePublicIpAddress;

  /// The number of automated backups to keep.
  final int? backupRetentionCount;

  /// The ARN of the CloudFormation stack that was used to create the server.
  final String? cloudFormationStackArn;

  /// Time stamp of server creation. Example <code>2016-07-29T13:38:47.520Z</code>
  final DateTime? createdAt;

  /// An optional public endpoint of a server, such as
  /// <code>https://aws.my-company.com</code>. You cannot access the server by
  /// using the <code>Endpoint</code> value if the server has a
  /// <code>CustomDomain</code> specified.
  final String? customDomain;

  /// Disables automated backups. The number of stored backups is dependent on the
  /// value of PreferredBackupCount.
  final bool? disableAutomatedBackup;

  /// A DNS name that can be used to access the engine. Example:
  /// <code>myserver-asdfghjkl.us-east-1.opsworks.io</code>. You cannot access the
  /// server by using the <code>Endpoint</code> value if the server has a
  /// <code>CustomDomain</code> specified.
  final String? endpoint;

  /// The engine type of the server. Valid values in this release include
  /// <code>ChefAutomate</code> and <code>Puppet</code>.
  final String? engine;

  /// The response of a createServer() request returns the master credential to
  /// access the server in EngineAttributes. These credentials are not stored by
  /// AWS OpsWorks CM; they are returned only as part of the result of
  /// createServer().
  /// <p class="title"> <b>Attributes returned in a createServer response for
  /// Chef</b>
  ///
  /// <ul>
  /// <li>
  /// <code>CHEF_AUTOMATE_PIVOTAL_KEY</code>: A base64-encoded RSA private key
  /// that is generated by AWS OpsWorks for Chef Automate. This private key is
  /// required to access the Chef API.
  /// </li>
  /// <li>
  /// <code>CHEF_STARTER_KIT</code>: A base64-encoded ZIP file. The ZIP file
  /// contains a Chef starter kit, which includes a README, a configuration file,
  /// and the required RSA private key. Save this file, unzip it, and then change
  /// to the directory where you've unzipped the file contents. From this
  /// directory, you can run Knife commands.
  /// </li>
  /// </ul> <p class="title"> <b>Attributes returned in a createServer response
  /// for Puppet</b>
  ///
  /// <ul>
  /// <li>
  /// <code>PUPPET_STARTER_KIT</code>: A base64-encoded ZIP file. The ZIP file
  /// contains a Puppet starter kit, including a README and a required private
  /// key. Save this file, unzip it, and then change to the directory where you've
  /// unzipped the file contents.
  /// </li>
  /// <li>
  /// <code>PUPPET_ADMIN_PASSWORD</code>: An administrator password that you can
  /// use to sign in to the Puppet Enterprise console after the server is online.
  /// </li>
  /// </ul>
  final List<EngineAttribute>? engineAttributes;

  /// The engine model of the server. Valid values in this release include
  /// <code>Monolithic</code> for Puppet and <code>Single</code> for Chef.
  final String? engineModel;

  /// The engine version of the server. For a Chef server, the valid value for
  /// EngineVersion is currently <code>2</code>. For a Puppet server, specify
  /// either <code>2019</code> or <code>2017</code>.
  final String? engineVersion;

  /// The instance profile ARN of the server.
  final String? instanceProfileArn;

  /// The instance type for the server, as specified in the CloudFormation stack.
  /// This might not be the same instance type that is shown in the EC2 console.
  final String? instanceType;

  /// The key pair associated with the server.
  final String? keyPair;

  /// The status of the most recent server maintenance run. Shows
  /// <code>SUCCESS</code> or <code>FAILED</code>.
  final MaintenanceStatus? maintenanceStatus;

  /// The preferred backup period specified for the server.
  final String? preferredBackupWindow;

  /// The preferred maintenance period specified for the server.
  final String? preferredMaintenanceWindow;

  /// The security group IDs for the server, as specified in the CloudFormation
  /// stack. These might not be the same security groups that are shown in the EC2
  /// console.
  final List<String>? securityGroupIds;

  /// The ARN of the server.
  final String? serverArn;

  /// The name of the server.
  final String? serverName;

  /// The service role ARN used to create the server.
  final String? serviceRoleArn;

  /// The server's status. This field displays the states of actions in progress,
  /// such as creating, running, or backing up the server, as well as the server's
  /// health state.
  final ServerStatus? status;

  /// Depending on the server status, this field has either a human-readable
  /// message (such as a create or backup error), or an escaped block of JSON
  /// (used for health check results).
  final String? statusReason;

  /// The subnet IDs specified in a CreateServer request.
  final List<String>? subnetIds;

  Server({
    this.associatePublicIpAddress,
    this.backupRetentionCount,
    this.cloudFormationStackArn,
    this.createdAt,
    this.customDomain,
    this.disableAutomatedBackup,
    this.endpoint,
    this.engine,
    this.engineAttributes,
    this.engineModel,
    this.engineVersion,
    this.instanceProfileArn,
    this.instanceType,
    this.keyPair,
    this.maintenanceStatus,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.securityGroupIds,
    this.serverArn,
    this.serverName,
    this.serviceRoleArn,
    this.status,
    this.statusReason,
    this.subnetIds,
  });

  factory Server.fromJson(Map<String, dynamic> json) {
    return Server(
      associatePublicIpAddress: json['AssociatePublicIpAddress'] as bool?,
      backupRetentionCount: json['BackupRetentionCount'] as int?,
      cloudFormationStackArn: json['CloudFormationStackArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      customDomain: json['CustomDomain'] as String?,
      disableAutomatedBackup: json['DisableAutomatedBackup'] as bool?,
      endpoint: json['Endpoint'] as String?,
      engine: json['Engine'] as String?,
      engineAttributes: (json['EngineAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => EngineAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      engineModel: json['EngineModel'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      instanceProfileArn: json['InstanceProfileArn'] as String?,
      instanceType: json['InstanceType'] as String?,
      keyPair: json['KeyPair'] as String?,
      maintenanceStatus:
          (json['MaintenanceStatus'] as String?)?.toMaintenanceStatus(),
      preferredBackupWindow: json['PreferredBackupWindow'] as String?,
      preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String?,
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      serverArn: json['ServerArn'] as String?,
      serverName: json['ServerName'] as String?,
      serviceRoleArn: json['ServiceRoleArn'] as String?,
      status: (json['Status'] as String?)?.toServerStatus(),
      statusReason: json['StatusReason'] as String?,
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final associatePublicIpAddress = this.associatePublicIpAddress;
    final backupRetentionCount = this.backupRetentionCount;
    final cloudFormationStackArn = this.cloudFormationStackArn;
    final createdAt = this.createdAt;
    final customDomain = this.customDomain;
    final disableAutomatedBackup = this.disableAutomatedBackup;
    final endpoint = this.endpoint;
    final engine = this.engine;
    final engineAttributes = this.engineAttributes;
    final engineModel = this.engineModel;
    final engineVersion = this.engineVersion;
    final instanceProfileArn = this.instanceProfileArn;
    final instanceType = this.instanceType;
    final keyPair = this.keyPair;
    final maintenanceStatus = this.maintenanceStatus;
    final preferredBackupWindow = this.preferredBackupWindow;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final securityGroupIds = this.securityGroupIds;
    final serverArn = this.serverArn;
    final serverName = this.serverName;
    final serviceRoleArn = this.serviceRoleArn;
    final status = this.status;
    final statusReason = this.statusReason;
    final subnetIds = this.subnetIds;
    return {
      if (associatePublicIpAddress != null)
        'AssociatePublicIpAddress': associatePublicIpAddress,
      if (backupRetentionCount != null)
        'BackupRetentionCount': backupRetentionCount,
      if (cloudFormationStackArn != null)
        'CloudFormationStackArn': cloudFormationStackArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (customDomain != null) 'CustomDomain': customDomain,
      if (disableAutomatedBackup != null)
        'DisableAutomatedBackup': disableAutomatedBackup,
      if (endpoint != null) 'Endpoint': endpoint,
      if (engine != null) 'Engine': engine,
      if (engineAttributes != null) 'EngineAttributes': engineAttributes,
      if (engineModel != null) 'EngineModel': engineModel,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (instanceProfileArn != null) 'InstanceProfileArn': instanceProfileArn,
      if (instanceType != null) 'InstanceType': instanceType,
      if (keyPair != null) 'KeyPair': keyPair,
      if (maintenanceStatus != null)
        'MaintenanceStatus': maintenanceStatus.toValue(),
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (serverArn != null) 'ServerArn': serverArn,
      if (serverName != null) 'ServerName': serverName,
      if (serviceRoleArn != null) 'ServiceRoleArn': serviceRoleArn,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
  }
}

/// An event that is related to the server, such as the start of maintenance or
/// backup.
class ServerEvent {
  /// The time when the event occurred.
  final DateTime? createdAt;

  /// The Amazon S3 URL of the event's log file.
  final String? logUrl;

  /// A human-readable informational or status message.
  final String? message;

  /// The name of the server on or for which the event occurred.
  final String? serverName;

  ServerEvent({
    this.createdAt,
    this.logUrl,
    this.message,
    this.serverName,
  });

  factory ServerEvent.fromJson(Map<String, dynamic> json) {
    return ServerEvent(
      createdAt: timeStampFromJson(json['CreatedAt']),
      logUrl: json['LogUrl'] as String?,
      message: json['Message'] as String?,
      serverName: json['ServerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final logUrl = this.logUrl;
    final message = this.message;
    final serverName = this.serverName;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (logUrl != null) 'LogUrl': logUrl,
      if (message != null) 'Message': message,
      if (serverName != null) 'ServerName': serverName,
    };
  }
}

enum ServerStatus {
  backingUp,
  connectionLost,
  creating,
  deleting,
  modifying,
  failed,
  healthy,
  running,
  restoring,
  setup,
  underMaintenance,
  unhealthy,
  terminated,
}

extension ServerStatusValueExtension on ServerStatus {
  String toValue() {
    switch (this) {
      case ServerStatus.backingUp:
        return 'BACKING_UP';
      case ServerStatus.connectionLost:
        return 'CONNECTION_LOST';
      case ServerStatus.creating:
        return 'CREATING';
      case ServerStatus.deleting:
        return 'DELETING';
      case ServerStatus.modifying:
        return 'MODIFYING';
      case ServerStatus.failed:
        return 'FAILED';
      case ServerStatus.healthy:
        return 'HEALTHY';
      case ServerStatus.running:
        return 'RUNNING';
      case ServerStatus.restoring:
        return 'RESTORING';
      case ServerStatus.setup:
        return 'SETUP';
      case ServerStatus.underMaintenance:
        return 'UNDER_MAINTENANCE';
      case ServerStatus.unhealthy:
        return 'UNHEALTHY';
      case ServerStatus.terminated:
        return 'TERMINATED';
    }
  }
}

extension ServerStatusFromString on String {
  ServerStatus toServerStatus() {
    switch (this) {
      case 'BACKING_UP':
        return ServerStatus.backingUp;
      case 'CONNECTION_LOST':
        return ServerStatus.connectionLost;
      case 'CREATING':
        return ServerStatus.creating;
      case 'DELETING':
        return ServerStatus.deleting;
      case 'MODIFYING':
        return ServerStatus.modifying;
      case 'FAILED':
        return ServerStatus.failed;
      case 'HEALTHY':
        return ServerStatus.healthy;
      case 'RUNNING':
        return ServerStatus.running;
      case 'RESTORING':
        return ServerStatus.restoring;
      case 'SETUP':
        return ServerStatus.setup;
      case 'UNDER_MAINTENANCE':
        return ServerStatus.underMaintenance;
      case 'UNHEALTHY':
        return ServerStatus.unhealthy;
      case 'TERMINATED':
        return ServerStatus.terminated;
    }
    throw Exception('$this is not known in enum ServerStatus');
  }
}

class StartMaintenanceResponse {
  /// Contains the response to a <code>StartMaintenance</code> request.
  final Server? server;

  StartMaintenanceResponse({
    this.server,
  });

  factory StartMaintenanceResponse.fromJson(Map<String, dynamic> json) {
    return StartMaintenanceResponse(
      server: json['Server'] != null
          ? Server.fromJson(json['Server'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final server = this.server;
    return {
      if (server != null) 'Server': server,
    };
  }
}

/// A map that contains tag keys and tag values to attach to an AWS OpsWorks for
/// Chef Automate or AWS OpsWorks for Puppet Enterprise server. Leading and
/// trailing white spaces are trimmed from both the key and value. A maximum of
/// 50 user-applied tags is allowed for tag-supported AWS OpsWorks-CM resources.
class Tag {
  /// A tag key, such as <code>Stage</code> or <code>Name</code>. A tag key cannot
  /// be empty. The key can be a maximum of 127 characters, and can contain only
  /// Unicode letters, numbers, or separators, or the following special
  /// characters: <code>+ - = . _ : /</code>
  final String key;

  /// An optional tag value, such as <code>Production</code> or
  /// <code>test-owcm-server</code>. The value can be a maximum of 255 characters,
  /// and contain only Unicode letters, numbers, or separators, or the following
  /// special characters: <code>+ - = . _ : /</code>
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
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

class UpdateServerEngineAttributesResponse {
  /// Contains the response to an <code>UpdateServerEngineAttributes</code>
  /// request.
  final Server? server;

  UpdateServerEngineAttributesResponse({
    this.server,
  });

  factory UpdateServerEngineAttributesResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateServerEngineAttributesResponse(
      server: json['Server'] != null
          ? Server.fromJson(json['Server'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final server = this.server;
    return {
      if (server != null) 'Server': server,
    };
  }
}

class UpdateServerResponse {
  /// Contains the response to a <code>UpdateServer</code> request.
  final Server? server;

  UpdateServerResponse({
    this.server,
  });

  factory UpdateServerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateServerResponse(
      server: json['Server'] != null
          ? Server.fromJson(json['Server'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final server = this.server;
    return {
      if (server != null) 'Server': server,
    };
  }
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String? type, String? message})
      : super(type: type, code: 'InvalidStateException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
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
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidStateException': (type, message) =>
      InvalidStateException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
