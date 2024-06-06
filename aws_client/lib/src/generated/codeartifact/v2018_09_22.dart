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

/// CodeArtifact is a fully managed artifact repository compatible with
/// language-native package managers and build tools such as npm, Apache Maven,
/// pip, and dotnet. You can use CodeArtifact to share packages with development
/// teams and pull packages. Packages can be pulled from both public and
/// CodeArtifact repositories. You can also create an upstream relationship
/// between a CodeArtifact repository and another repository, which effectively
/// merges their contents from the point of view of a package manager client.
///
/// <b>CodeArtifact concepts</b>
///
/// <ul>
/// <li>
/// <b>Repository</b>: A CodeArtifact repository contains a set of <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/ug/welcome.html#welcome-concepts-package-version">package
/// versions</a>, each of which maps to a set of assets, or files. Repositories
/// are polyglot, so a single repository can contain packages of any supported
/// type. Each repository exposes endpoints for fetching and publishing packages
/// using tools such as the <b> <code>npm</code> </b> CLI or the Maven CLI (<b>
/// <code>mvn</code> </b>). For a list of supported package managers, see the <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/ug/welcome.html">CodeArtifact
/// User Guide</a>.
/// </li>
/// <li>
/// <b>Domain</b>: Repositories are aggregated into a higher-level entity known
/// as a <i>domain</i>. All package assets and metadata are stored in the
/// domain, but are consumed through repositories. A given package asset, such
/// as a Maven JAR file, is stored once per domain, no matter how many
/// repositories it's present in. All of the assets and metadata in a domain are
/// encrypted with the same customer master key (CMK) stored in Key Management
/// Service (KMS).
///
/// Each repository is a member of a single domain and can't be moved to a
/// different domain.
///
/// The domain allows organizational policy to be applied across multiple
/// repositories, such as which accounts can access repositories in the domain,
/// and which public repositories can be used as sources of packages.
///
/// Although an organization can have multiple domains, we recommend a single
/// production domain that contains all published artifacts so that teams can
/// find and share packages across their organization.
/// </li>
/// <li>
/// <b>Package</b>: A <i>package</i> is a bundle of software and the metadata
/// required to resolve dependencies and install the software. CodeArtifact
/// supports npm, PyPI, Maven, NuGet, Swift, Ruby, and generic package formats.
/// For more information about the supported package formats and how to use
/// CodeArtifact with them, see the <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/ug/welcome.html">CodeArtifact
/// User Guide</a>.
///
/// In CodeArtifact, a package consists of:
///
/// <ul>
/// <li>
/// A <i>name</i> (for example, <code>webpack</code> is the name of a popular
/// npm package)
/// </li>
/// <li>
/// An optional namespace (for example, <code>@types</code> in
/// <code>@types/node</code>)
/// </li>
/// <li>
/// A set of versions (for example, <code>1.0.0</code>, <code>1.0.1</code>,
/// <code>1.0.2</code>, etc.)
/// </li>
/// <li>
/// Package-level metadata (for example, npm tags)
/// </li>
/// </ul> </li>
/// <li>
/// <b>Package group</b>: A group of packages that match a specified definition.
/// Package groups can be used to apply configuration to multiple packages that
/// match a defined pattern using package format, package namespace, and package
/// name. You can use package groups to more conveniently configure package
/// origin controls for multiple packages. Package origin controls are used to
/// block or allow ingestion or publishing of new package versions, which
/// protects users from malicious actions known as dependency substitution
/// attacks.
/// </li>
/// <li>
/// <b>Package version</b>: A version of a package, such as <code>@types/node
/// 12.6.9</code>. The version number format and semantics vary for different
/// package formats. For example, npm package versions must conform to the <a
/// href="https://semver.org/">Semantic Versioning specification</a>. In
/// CodeArtifact, a package version consists of the version identifier, metadata
/// at the package version level, and a set of assets.
/// </li>
/// <li>
/// <b>Upstream repository</b>: One repository is <i>upstream</i> of another
/// when the package versions in it can be accessed from the repository endpoint
/// of the downstream repository, effectively merging the contents of the two
/// repositories from the point of view of a client. CodeArtifact allows
/// creating an upstream relationship between two repositories.
/// </li>
/// <li>
/// <b>Asset</b>: An individual file stored in CodeArtifact associated with a
/// package version, such as an npm <code>.tgz</code> file or Maven POM and JAR
/// files.
/// </li>
/// </ul>
/// <b>CodeArtifact supported API operations</b>
///
/// <ul>
/// <li>
/// <code>AssociateExternalConnection</code>: Adds an existing external
/// connection to a repository.
/// </li>
/// <li>
/// <code>CopyPackageVersions</code>: Copies package versions from one
/// repository to another repository in the same domain.
/// </li>
/// <li>
/// <code>CreateDomain</code>: Creates a domain.
/// </li>
/// <li>
/// <code>CreatePackageGroup</code>: Creates a package group.
/// </li>
/// <li>
/// <code>CreateRepository</code>: Creates a CodeArtifact repository in a
/// domain.
/// </li>
/// <li>
/// <code>DeleteDomain</code>: Deletes a domain. You cannot delete a domain that
/// contains repositories.
/// </li>
/// <li>
/// <code>DeleteDomainPermissionsPolicy</code>: Deletes the resource policy that
/// is set on a domain.
/// </li>
/// <li>
/// <code>DeletePackage</code>: Deletes a package and all associated package
/// versions.
/// </li>
/// <li>
/// <code>DeletePackageGroup</code>: Deletes a package group. Does not delete
/// packages or package versions that are associated with a package group.
/// </li>
/// <li>
/// <code>DeletePackageVersions</code>: Deletes versions of a package. After a
/// package has been deleted, it can be republished, but its assets and metadata
/// cannot be restored because they have been permanently removed from storage.
/// </li>
/// <li>
/// <code>DeleteRepository</code>: Deletes a repository.
/// </li>
/// <li>
/// <code>DeleteRepositoryPermissionsPolicy</code>: Deletes the resource policy
/// that is set on a repository.
/// </li>
/// <li>
/// <code>DescribeDomain</code>: Returns a <code>DomainDescription</code> object
/// that contains information about the requested domain.
/// </li>
/// <li>
/// <code>DescribePackage</code>: Returns a <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageDescription.html">PackageDescription</a>
/// object that contains details about a package.
/// </li>
/// <li>
/// <code>DescribePackageGroup</code>: Returns a <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageGroup.html">PackageGroup</a>
/// object that contains details about a package group.
/// </li>
/// <li>
/// <code>DescribePackageVersion</code>: Returns a <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionDescription.html">PackageVersionDescription</a>
/// object that contains details about a package version.
/// </li>
/// <li>
/// <code>DescribeRepository</code>: Returns a
/// <code>RepositoryDescription</code> object that contains detailed information
/// about the requested repository.
/// </li>
/// <li>
/// <code>DisposePackageVersions</code>: Disposes versions of a package. A
/// package version with the status <code>Disposed</code> cannot be restored
/// because they have been permanently removed from storage.
/// </li>
/// <li>
/// <code>DisassociateExternalConnection</code>: Removes an existing external
/// connection from a repository.
/// </li>
/// <li>
/// <code>GetAssociatedPackageGroup</code>: Returns the most closely associated
/// package group to the specified package.
/// </li>
/// <li>
/// <code>GetAuthorizationToken</code>: Generates a temporary authorization
/// token for accessing repositories in the domain. The token expires the
/// authorization period has passed. The default authorization period is 12
/// hours and can be customized to any length with a maximum of 12 hours.
/// </li>
/// <li>
/// <code>GetDomainPermissionsPolicy</code>: Returns the policy of a resource
/// that is attached to the specified domain.
/// </li>
/// <li>
/// <code>GetPackageVersionAsset</code>: Returns the contents of an asset that
/// is in a package version.
/// </li>
/// <li>
/// <code>GetPackageVersionReadme</code>: Gets the readme file or descriptive
/// text for a package version.
/// </li>
/// <li>
/// <code>GetRepositoryEndpoint</code>: Returns the endpoint of a repository for
/// a specific package format. A repository has one endpoint for each package
/// format:
///
/// <ul>
/// <li>
/// <code>generic</code>
/// </li>
/// <li>
/// <code>maven</code>
/// </li>
/// <li>
/// <code>npm</code>
/// </li>
/// <li>
/// <code>nuget</code>
/// </li>
/// <li>
/// <code>pypi</code>
/// </li>
/// <li>
/// <code>ruby</code>
/// </li>
/// <li>
/// <code>swift</code>
/// </li>
/// </ul> </li>
/// <li>
/// <code>GetRepositoryPermissionsPolicy</code>: Returns the resource policy
/// that is set on a repository.
/// </li>
/// <li>
/// <code>ListAllowedRepositoriesForGroup</code>: Lists the allowed repositories
/// for a package group that has origin configuration set to
/// <code>ALLOW_SPECIFIC_REPOSITORIES</code>.
/// </li>
/// <li>
/// <code>ListAssociatedPackages</code>: Returns a list of packages associated
/// with the requested package group.
/// </li>
/// <li>
/// <code>ListDomains</code>: Returns a list of <code>DomainSummary</code>
/// objects. Each returned <code>DomainSummary</code> object contains
/// information about a domain.
/// </li>
/// <li>
/// <code>ListPackages</code>: Lists the packages in a repository.
/// </li>
/// <li>
/// <code>ListPackageGroups</code>: Returns a list of package groups in the
/// requested domain.
/// </li>
/// <li>
/// <code>ListPackageVersionAssets</code>: Lists the assets for a given package
/// version.
/// </li>
/// <li>
/// <code>ListPackageVersionDependencies</code>: Returns a list of the direct
/// dependencies for a package version.
/// </li>
/// <li>
/// <code>ListPackageVersions</code>: Returns a list of package versions for a
/// specified package in a repository.
/// </li>
/// <li>
/// <code>ListRepositories</code>: Returns a list of repositories owned by the
/// Amazon Web Services account that called this method.
/// </li>
/// <li>
/// <code>ListRepositoriesInDomain</code>: Returns a list of the repositories in
/// a domain.
/// </li>
/// <li>
/// <code>ListSubPackageGroups</code>: Returns a list of direct children of the
/// specified package group.
/// </li>
/// <li>
/// <code>PublishPackageVersion</code>: Creates a new package version containing
/// one or more assets.
/// </li>
/// <li>
/// <code>PutDomainPermissionsPolicy</code>: Attaches a resource policy to a
/// domain.
/// </li>
/// <li>
/// <code>PutPackageOriginConfiguration</code>: Sets the package origin
/// configuration for a package, which determine how new versions of the package
/// can be added to a specific repository.
/// </li>
/// <li>
/// <code>PutRepositoryPermissionsPolicy</code>: Sets the resource policy on a
/// repository that specifies permissions to access it.
/// </li>
/// <li>
/// <code>UpdatePackageGroup</code>: Updates a package group. This API cannot be
/// used to update a package group's origin configuration or pattern.
/// </li>
/// <li>
/// <code>UpdatePackageGroupOriginConfiguration</code>: Updates the package
/// origin configuration for a package group.
/// </li>
/// <li>
/// <code>UpdatePackageVersionsStatus</code>: Updates the status of one or more
/// versions of a package.
/// </li>
/// <li>
/// <code>UpdateRepository</code>: Updates the properties of a repository.
/// </li>
/// </ul>
class CodeArtifact {
  final _s.RestJsonProtocol _protocol;
  CodeArtifact({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codeartifact',
            signingName: 'codeartifact',
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

  /// Adds an existing external connection to a repository. One external
  /// connection is allowed per repository.
  /// <note>
  /// A repository can have one or more upstream repositories, or an external
  /// connection.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository.
  ///
  /// Parameter [externalConnection] :
  /// The name of the external connection to add to the repository. The
  /// following values are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>public:npmjs</code> - for the npm public repository.
  /// </li>
  /// <li>
  /// <code>public:nuget-org</code> - for the NuGet Gallery.
  /// </li>
  /// <li>
  /// <code>public:pypi</code> - for the Python Package Index.
  /// </li>
  /// <li>
  /// <code>public:maven-central</code> - for Maven Central.
  /// </li>
  /// <li>
  /// <code>public:maven-googleandroid</code> - for the Google Android
  /// repository.
  /// </li>
  /// <li>
  /// <code>public:maven-gradleplugins</code> - for the Gradle plugins
  /// repository.
  /// </li>
  /// <li>
  /// <code>public:maven-commonsware</code> - for the CommonsWare Android
  /// repository.
  /// </li>
  /// <li>
  /// <code>public:maven-clojars</code> - for the Clojars repository.
  /// </li>
  /// </ul>
  ///
  /// Parameter [repository] :
  /// The name of the repository to which the external connection is added.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  Future<AssociateExternalConnectionResult> associateExternalConnection({
    required String domain,
    required String externalConnection,
    required String repository,
    String? domainOwner,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'external-connection': [externalConnection],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/repository/external-connection',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateExternalConnectionResult.fromJson(response);
  }

  /// Copies package versions from one repository to another repository in the
  /// same domain.
  /// <note>
  /// You must specify <code>versions</code> or <code>versionRevisions</code>.
  /// You cannot specify both.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationRepository] :
  /// The name of the repository into which package versions are copied.
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the source and destination
  /// repositories.
  ///
  /// Parameter [format] :
  /// The format of the package versions to be copied.
  ///
  /// Parameter [package] :
  /// The name of the package that contains the versions to be copied.
  ///
  /// Parameter [sourceRepository] :
  /// The name of the repository that contains the package versions to be
  /// copied.
  ///
  /// Parameter [allowOverwrite] :
  /// Set to true to overwrite a package version that already exists in the
  /// destination repository. If set to false and the package version already
  /// exists in the destination repository, the package version is returned in
  /// the <code>failedVersions</code> field of the response with an
  /// <code>ALREADY_EXISTS</code> error code.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [includeFromUpstream] :
  /// Set to true to copy packages from repositories that are upstream from the
  /// source repository to the destination repository. The default setting is
  /// false. For more information, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/repos-upstream.html">Working
  /// with upstream repositories</a>.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package versions to be copied. The package component
  /// that specifies its namespace depends on its type. For example:
  /// <note>
  /// The namespace is required when copying package versions of the following
  /// formats:
  ///
  /// <ul>
  /// <li>
  /// Maven
  /// </li>
  /// <li>
  /// Swift
  /// </li>
  /// <li>
  /// generic
  /// </li>
  /// </ul> </note>
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [versionRevisions] :
  /// A list of key-value pairs. The keys are package versions and the values
  /// are package version revisions. A <code>CopyPackageVersion</code> operation
  /// succeeds if the specified versions in the source repository match the
  /// specified package version revision.
  /// <note>
  /// You must specify <code>versions</code> or <code>versionRevisions</code>.
  /// You cannot specify both.
  /// </note>
  ///
  /// Parameter [versions] :
  /// The versions of the package to be copied.
  /// <note>
  /// You must specify <code>versions</code> or <code>versionRevisions</code>.
  /// You cannot specify both.
  /// </note>
  Future<CopyPackageVersionsResult> copyPackageVersions({
    required String destinationRepository,
    required String domain,
    required PackageFormat format,
    required String package,
    required String sourceRepository,
    bool? allowOverwrite,
    String? domainOwner,
    bool? includeFromUpstream,
    String? namespace,
    Map<String, String>? versionRevisions,
    List<String>? versions,
  }) async {
    final $query = <String, List<String>>{
      'destination-repository': [destinationRepository],
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'source-repository': [sourceRepository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final $payload = <String, dynamic>{
      if (allowOverwrite != null) 'allowOverwrite': allowOverwrite,
      if (includeFromUpstream != null)
        'includeFromUpstream': includeFromUpstream,
      if (versionRevisions != null) 'versionRevisions': versionRevisions,
      if (versions != null) 'versions': versions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/package/versions/copy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CopyPackageVersionsResult.fromJson(response);
  }

  /// Creates a domain. CodeArtifact <i>domains</i> make it easier to manage
  /// multiple repositories across an organization. You can use a domain to
  /// apply permissions across many repositories owned by different Amazon Web
  /// Services accounts. An asset is stored only once in a domain, even if it's
  /// in multiple repositories.
  ///
  /// Although you can have multiple domains, we recommend a single production
  /// domain that contains all published artifacts so that your development
  /// teams can find and share packages. You can use a second pre-production
  /// domain to test changes to the production domain configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain to create. All domain names in an Amazon Web
  /// Services Region that are in the same Amazon Web Services account must be
  /// unique. The domain name is used as the prefix in DNS hostnames. Do not use
  /// sensitive information in a domain name because it is publicly
  /// discoverable.
  ///
  /// Parameter [encryptionKey] :
  /// The encryption key for the domain. This is used to encrypt content stored
  /// in a domain. An encryption key can be a key ID, a key Amazon Resource Name
  /// (ARN), a key alias, or a key alias ARN. To specify an
  /// <code>encryptionKey</code>, your IAM role must have
  /// <code>kms:DescribeKey</code> and <code>kms:CreateGrant</code> permissions
  /// on the encryption key that is used. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestSyntax">DescribeKey</a>
  /// in the <i>Key Management Service API Reference</i> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">Key
  /// Management Service API Permissions Reference</a> in the <i>Key Management
  /// Service Developer Guide</i>.
  /// <important>
  /// CodeArtifact supports only symmetric CMKs. Do not associate an asymmetric
  /// CMK with your domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// symmetric and asymmetric keys</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  /// </important>
  ///
  /// Parameter [tags] :
  /// One or more tag key-value pairs for the domain.
  Future<CreateDomainResult> createDomain({
    required String domain,
    String? encryptionKey,
    List<Tag>? tags,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
    };
    final $payload = <String, dynamic>{
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/domain',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateDomainResult.fromJson(response);
  }

  /// Creates a package group. For more information about creating package
  /// groups, including example CLI commands, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/create-package-group.html">Create
  /// a package group</a> in the <i>CodeArtifact User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which you want to create a package group.
  ///
  /// Parameter [packageGroup] :
  /// The pattern of the package group to create. The pattern is also the
  /// identifier of the package group.
  ///
  /// Parameter [contactInfo] :
  /// The contact information for the created package group.
  ///
  /// Parameter [description] :
  /// A description of the package group.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [tags] :
  /// One or more tag key-value pairs for the package group.
  Future<CreatePackageGroupResult> createPackageGroup({
    required String domain,
    required String packageGroup,
    String? contactInfo,
    String? description,
    String? domainOwner,
    List<Tag>? tags,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final $payload = <String, dynamic>{
      'packageGroup': packageGroup,
      if (contactInfo != null) 'contactInfo': contactInfo,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/package-group',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreatePackageGroupResult.fromJson(response);
  }

  /// Creates a repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the created repository.
  ///
  /// Parameter [repository] :
  /// The name of the repository to create.
  ///
  /// Parameter [description] :
  /// A description of the created repository.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [tags] :
  /// One or more tag key-value pairs for the repository.
  ///
  /// Parameter [upstreams] :
  /// A list of upstream repositories to associate with the repository. The
  /// order of the upstream repositories in the list determines their priority
  /// order when CodeArtifact looks for a requested package version. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/repos-upstream.html">Working
  /// with upstream repositories</a>.
  Future<CreateRepositoryResult> createRepository({
    required String domain,
    required String repository,
    String? description,
    String? domainOwner,
    List<Tag>? tags,
    List<UpstreamRepository>? upstreams,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
      if (upstreams != null) 'upstreams': upstreams,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/repository',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateRepositoryResult.fromJson(response);
  }

  /// Deletes a domain. You cannot delete a domain that contains repositories.
  /// If you want to delete a domain with repositories, first delete its
  /// repositories.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain to delete.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  Future<DeleteDomainResult> deleteDomain({
    required String domain,
    String? domainOwner,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/domain',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainResult.fromJson(response);
  }

  /// Deletes the resource policy set on a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain associated with the resource policy to be deleted.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [policyRevision] :
  /// The current revision of the resource policy to be deleted. This revision
  /// is used for optimistic locking, which prevents others from overwriting
  /// your changes to the domain's resource policy.
  Future<DeleteDomainPermissionsPolicyResult> deleteDomainPermissionsPolicy({
    required String domain,
    String? domainOwner,
    String? policyRevision,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (policyRevision != null) 'policy-revision': [policyRevision],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/domain/permissions/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainPermissionsPolicyResult.fromJson(response);
  }

  /// Deletes a package and all associated package versions. A deleted package
  /// cannot be restored. To delete one or more package versions, use the <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_DeletePackageVersions.html">DeletePackageVersions</a>
  /// API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the package to delete.
  ///
  /// Parameter [format] :
  /// The format of the requested package to delete.
  ///
  /// Parameter [package] :
  /// The name of the package to delete.
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the package to delete.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package to delete. The package component that
  /// specifies its namespace depends on its type. For example:
  /// <note>
  /// The namespace is required when deleting packages of the following formats:
  ///
  /// <ul>
  /// <li>
  /// Maven
  /// </li>
  /// <li>
  /// Swift
  /// </li>
  /// <li>
  /// generic
  /// </li>
  /// </ul> </note>
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  Future<DeletePackageResult> deletePackage({
    required String domain,
    required PackageFormat format,
    required String package,
    required String repository,
    String? domainOwner,
    String? namespace,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/package',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeletePackageResult.fromJson(response);
  }

  /// Deletes a package group. Deleting a package group does not delete packages
  /// or package versions associated with the package group. When a package
  /// group is deleted, the direct child package groups will become children of
  /// the package group's direct parent package group. Therefore, if any of the
  /// child groups are inheriting any settings from the parent, those settings
  /// could change.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The domain that contains the package group to be deleted.
  ///
  /// Parameter [packageGroup] :
  /// The pattern of the package group to be deleted.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  Future<DeletePackageGroupResult> deletePackageGroup({
    required String domain,
    required String packageGroup,
    String? domainOwner,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'package-group': [packageGroup],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/package-group',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeletePackageGroupResult.fromJson(response);
  }

  /// Deletes one or more versions of a package. A deleted package version
  /// cannot be restored in your repository. If you want to remove a package
  /// version from your repository and be able to restore it later, set its
  /// status to <code>Archived</code>. Archived packages cannot be downloaded
  /// from a repository and don't show up with list package APIs (for example,
  /// <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html">ListPackageVersions</a>),
  /// but you can restore them using <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_UpdatePackageVersionsStatus.html">UpdatePackageVersionsStatus</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the package to delete.
  ///
  /// Parameter [format] :
  /// The format of the package versions to delete.
  ///
  /// Parameter [package] :
  /// The name of the package with the versions to delete.
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the package versions to delete.
  ///
  /// Parameter [versions] :
  /// An array of strings that specify the versions of the package to delete.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [expectedStatus] :
  /// The expected status of the package version to delete.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package versions to be deleted. The package component
  /// that specifies its namespace depends on its type. For example:
  /// <note>
  /// The namespace is required when deleting package versions of the following
  /// formats:
  ///
  /// <ul>
  /// <li>
  /// Maven
  /// </li>
  /// <li>
  /// Swift
  /// </li>
  /// <li>
  /// generic
  /// </li>
  /// </ul> </note>
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  Future<DeletePackageVersionsResult> deletePackageVersions({
    required String domain,
    required PackageFormat format,
    required String package,
    required String repository,
    required List<String> versions,
    String? domainOwner,
    PackageVersionStatus? expectedStatus,
    String? namespace,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final $payload = <String, dynamic>{
      'versions': versions,
      if (expectedStatus != null) 'expectedStatus': expectedStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/package/versions/delete',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeletePackageVersionsResult.fromJson(response);
  }

  /// Deletes a repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository to delete.
  ///
  /// Parameter [repository] :
  /// The name of the repository to delete.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  Future<DeleteRepositoryResult> deleteRepository({
    required String domain,
    required String repository,
    String? domainOwner,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/repository',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRepositoryResult.fromJson(response);
  }

  /// Deletes the resource policy that is set on a repository. After a resource
  /// policy is deleted, the permissions allowed and denied by the deleted
  /// policy are removed. The effect of deleting a resource policy might not be
  /// immediate.
  /// <important>
  /// Use <code>DeleteRepositoryPermissionsPolicy</code> with caution. After a
  /// policy is deleted, Amazon Web Services users, roles, and accounts lose
  /// permissions to perform the repository actions granted by the deleted
  /// policy.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository associated with the
  /// resource policy to be deleted.
  ///
  /// Parameter [repository] :
  /// The name of the repository that is associated with the resource policy to
  /// be deleted
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [policyRevision] :
  /// The revision of the repository's resource policy to be deleted. This
  /// revision is used for optimistic locking, which prevents others from
  /// accidentally overwriting your changes to the repository's resource policy.
  Future<DeleteRepositoryPermissionsPolicyResult>
      deleteRepositoryPermissionsPolicy({
    required String domain,
    required String repository,
    String? domainOwner,
    String? policyRevision,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (policyRevision != null) 'policy-revision': [policyRevision],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/repository/permissions/policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRepositoryPermissionsPolicyResult.fromJson(response);
  }

  /// Returns a <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_DomainDescription.html">DomainDescription</a>
  /// object that contains information about the requested domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// A string that specifies the name of the requested domain.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  Future<DescribeDomainResult> describeDomain({
    required String domain,
    String? domainOwner,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/domain',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainResult.fromJson(response);
  }

  /// Returns a <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageDescription.html">PackageDescription</a>
  /// object that contains information about the requested package.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// package.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of the requested package.
  ///
  /// Parameter [package] :
  /// The name of the requested package.
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the requested package.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the requested package. The package component that
  /// specifies its namespace depends on its type. For example:
  /// <note>
  /// The namespace is required when requesting packages of the following
  /// formats:
  ///
  /// <ul>
  /// <li>
  /// Maven
  /// </li>
  /// <li>
  /// Swift
  /// </li>
  /// <li>
  /// generic
  /// </li>
  /// </ul> </note>
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  Future<DescribePackageResult> describePackage({
    required String domain,
    required PackageFormat format,
    required String package,
    required String repository,
    String? domainOwner,
    String? namespace,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/package',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribePackageResult.fromJson(response);
  }

  /// Returns a <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageGroupDescription.html">PackageGroupDescription</a>
  /// object that contains information about the requested package group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the package group.
  ///
  /// Parameter [packageGroup] :
  /// The pattern of the requested package group.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  Future<DescribePackageGroupResult> describePackageGroup({
    required String domain,
    required String packageGroup,
    String? domainOwner,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'package-group': [packageGroup],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/package-group',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribePackageGroupResult.fromJson(response);
  }

  /// Returns a <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionDescription.html">PackageVersionDescription</a>
  /// object that contains information about the requested package version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// package version.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of the requested package version.
  ///
  /// Parameter [package] :
  /// The name of the requested package version.
  ///
  /// Parameter [packageVersion] :
  /// A string that contains the package version (for example,
  /// <code>3.5.2</code>).
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the package version.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the requested package version. The package component that
  /// specifies its namespace depends on its type. For example:
  /// <note>
  /// The namespace is required when requesting package versions of the
  /// following formats:
  ///
  /// <ul>
  /// <li>
  /// Maven
  /// </li>
  /// <li>
  /// Swift
  /// </li>
  /// <li>
  /// generic
  /// </li>
  /// </ul> </note>
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  Future<DescribePackageVersionResult> describePackageVersion({
    required String domain,
    required PackageFormat format,
    required String package,
    required String packageVersion,
    required String repository,
    String? domainOwner,
    String? namespace,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'version': [packageVersion],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/package/version',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribePackageVersionResult.fromJson(response);
  }

  /// Returns a <code>RepositoryDescription</code> object that contains detailed
  /// information about the requested repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository to describe.
  ///
  /// Parameter [repository] :
  /// A string that specifies the name of the requested repository.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  Future<DescribeRepositoryResult> describeRepository({
    required String domain,
    required String repository,
    String? domainOwner,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/repository',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRepositoryResult.fromJson(response);
  }

  /// Removes an existing external connection from a repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository from which to remove
  /// the external repository.
  ///
  /// Parameter [externalConnection] :
  /// The name of the external connection to be removed from the repository.
  ///
  /// Parameter [repository] :
  /// The name of the repository from which the external connection will be
  /// removed.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  Future<DisassociateExternalConnectionResult> disassociateExternalConnection({
    required String domain,
    required String externalConnection,
    required String repository,
    String? domainOwner,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'external-connection': [externalConnection],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/repository/external-connection',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateExternalConnectionResult.fromJson(response);
  }

  /// Deletes the assets in package versions and sets the package versions'
  /// status to <code>Disposed</code>. A disposed package version cannot be
  /// restored in your repository because its assets are deleted.
  ///
  /// To view all disposed package versions in a repository, use <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html">ListPackageVersions</a>
  /// and set the <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html#API_ListPackageVersions_RequestSyntax">status</a>
  /// parameter to <code>Disposed</code>.
  ///
  /// To view information about a disposed package version, use <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_DescribePackageVersion.html">DescribePackageVersion</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository you want to dispose.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of package versions you want to dispose.
  ///
  /// Parameter [package] :
  /// The name of the package with the versions you want to dispose.
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the package versions you want to
  /// dispose.
  ///
  /// Parameter [versions] :
  /// The versions of the package you want to dispose.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [expectedStatus] :
  /// The expected status of the package version to dispose.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package versions to be disposed. The package
  /// component that specifies its namespace depends on its type. For example:
  /// <note>
  /// The namespace is required when disposing package versions of the following
  /// formats:
  ///
  /// <ul>
  /// <li>
  /// Maven
  /// </li>
  /// <li>
  /// Swift
  /// </li>
  /// <li>
  /// generic
  /// </li>
  /// </ul> </note>
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [versionRevisions] :
  /// The revisions of the package versions you want to dispose.
  Future<DisposePackageVersionsResult> disposePackageVersions({
    required String domain,
    required PackageFormat format,
    required String package,
    required String repository,
    required List<String> versions,
    String? domainOwner,
    PackageVersionStatus? expectedStatus,
    String? namespace,
    Map<String, String>? versionRevisions,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final $payload = <String, dynamic>{
      'versions': versions,
      if (expectedStatus != null) 'expectedStatus': expectedStatus.toValue(),
      if (versionRevisions != null) 'versionRevisions': versionRevisions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/package/versions/dispose',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DisposePackageVersionsResult.fromJson(response);
  }

  /// Returns the most closely associated package group to the specified
  /// package. This API does not require that the package exist in any
  /// repository in the domain. As such, <code>GetAssociatedPackageGroup</code>
  /// can be used to see which package group's origin configuration applies to a
  /// package before that package is in a repository. This can be helpful to
  /// check if public packages are blocked without ingesting them.
  ///
  /// For information package group association and matching, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/package-group-definition-syntax-matching-behavior.html">Package
  /// group definition syntax and matching behavior</a> in the <i>CodeArtifact
  /// User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the package from which to get the
  /// associated package group.
  ///
  /// Parameter [format] :
  /// The format of the package from which to get the associated package group.
  ///
  /// Parameter [package] :
  /// The package from which to get the associated package group.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package from which to get the associated package
  /// group. The package component that specifies its namespace depends on its
  /// type. For example:
  /// <note>
  /// The namespace is required when getting associated package groups from
  /// packages of the following formats:
  ///
  /// <ul>
  /// <li>
  /// Maven
  /// </li>
  /// <li>
  /// Swift
  /// </li>
  /// <li>
  /// generic
  /// </li>
  /// </ul> </note>
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  Future<GetAssociatedPackageGroupResult> getAssociatedPackageGroup({
    required String domain,
    required PackageFormat format,
    required String package,
    String? domainOwner,
    String? namespace,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/get-associated-package-group',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAssociatedPackageGroupResult.fromJson(response);
  }

  /// Generates a temporary authorization token for accessing repositories in
  /// the domain. This API requires the
  /// <code>codeartifact:GetAuthorizationToken</code> and
  /// <code>sts:GetServiceBearerToken</code> permissions. For more information
  /// about authorization tokens, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/tokens-authentication.html">CodeArtifact
  /// authentication and tokens</a>.
  /// <note>
  /// CodeArtifact authorization tokens are valid for a period of 12 hours when
  /// created with the <code>login</code> command. You can call
  /// <code>login</code> periodically to refresh the token. When you create an
  /// authorization token with the <code>GetAuthorizationToken</code> API, you
  /// can set a custom authorization period, up to a maximum of 12 hours, with
  /// the <code>durationSeconds</code> parameter.
  ///
  /// The authorization period begins after <code>login</code> or
  /// <code>GetAuthorizationToken</code> is called. If <code>login</code> or
  /// <code>GetAuthorizationToken</code> is called while assuming a role, the
  /// token lifetime is independent of the maximum session duration of the role.
  /// For example, if you call <code>sts assume-role</code> and specify a
  /// session duration of 15 minutes, then generate a CodeArtifact authorization
  /// token, the token will be valid for the full authorization period even
  /// though this is longer than the 15-minute session duration.
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html">Using
  /// IAM Roles</a> for more information on controlling session duration.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that is in scope for the generated authorization
  /// token.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [durationSeconds] :
  /// The time, in seconds, that the generated authorization token is valid.
  /// Valid values are <code>0</code> and any number between <code>900</code>
  /// (15 minutes) and <code>43200</code> (12 hours). A value of <code>0</code>
  /// will set the expiration of the authorization token to the same expiration
  /// of the user's role's temporary credentials.
  Future<GetAuthorizationTokenResult> getAuthorizationToken({
    required String domain,
    String? domainOwner,
    int? durationSeconds,
  }) async {
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      0,
      43200,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (durationSeconds != null) 'duration': [durationSeconds.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/authorization-token',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAuthorizationTokenResult.fromJson(response);
  }

  /// Returns the resource policy attached to the specified domain.
  /// <note>
  /// The policy is a resource-based policy, not an identity-based policy. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_identity-vs-resource.html">Identity-based
  /// policies and resource-based policies </a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain to which the resource policy is attached.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  Future<GetDomainPermissionsPolicyResult> getDomainPermissionsPolicy({
    required String domain,
    String? domainOwner,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/domain/permissions/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainPermissionsPolicyResult.fromJson(response);
  }

  /// Returns an asset (or file) that is in a package. For example, for a Maven
  /// package version, use <code>GetPackageVersionAsset</code> to download a
  /// <code>JAR</code> file, a <code>POM</code> file, or any other assets in the
  /// package version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [asset] :
  /// The name of the requested asset.
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// package version with the requested asset.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of the package version with the requested
  /// asset file.
  ///
  /// Parameter [package] :
  /// The name of the package that contains the requested asset.
  ///
  /// Parameter [packageVersion] :
  /// A string that contains the package version (for example,
  /// <code>3.5.2</code>).
  ///
  /// Parameter [repository] :
  /// The repository that contains the package version with the requested asset.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package version with the requested asset file. The
  /// package component that specifies its namespace depends on its type. For
  /// example:
  /// <note>
  /// The namespace is required when requesting assets from package versions of
  /// the following formats:
  ///
  /// <ul>
  /// <li>
  /// Maven
  /// </li>
  /// <li>
  /// Swift
  /// </li>
  /// <li>
  /// generic
  /// </li>
  /// </ul> </note>
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [packageVersionRevision] :
  /// The name of the package version revision that contains the requested
  /// asset.
  Future<GetPackageVersionAssetResult> getPackageVersionAsset({
    required String asset,
    required String domain,
    required PackageFormat format,
    required String package,
    required String packageVersion,
    required String repository,
    String? domainOwner,
    String? namespace,
    String? packageVersionRevision,
  }) async {
    final $query = <String, List<String>>{
      'asset': [asset],
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'version': [packageVersion],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
      if (packageVersionRevision != null) 'revision': [packageVersionRevision],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/package/version/asset',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPackageVersionAssetResult(
      asset: await response.stream.toBytes(),
      assetName: _s.extractHeaderStringValue(response.headers, 'X-AssetName'),
      packageVersion:
          _s.extractHeaderStringValue(response.headers, 'X-PackageVersion'),
      packageVersionRevision: _s.extractHeaderStringValue(
          response.headers, 'X-PackageVersionRevision'),
    );
  }

  /// Gets the readme file or descriptive text for a package version.
  ///
  /// The returned text might contain formatting. For example, it might contain
  /// formatting for Markdown or reStructuredText.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// package version with the requested readme file.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of the package version with the requested
  /// readme file.
  ///
  /// Parameter [package] :
  /// The name of the package version that contains the requested readme file.
  ///
  /// Parameter [packageVersion] :
  /// A string that contains the package version (for example,
  /// <code>3.5.2</code>).
  ///
  /// Parameter [repository] :
  /// The repository that contains the package with the requested readme file.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package version with the requested readme file. The
  /// package component that specifies its namespace depends on its type. For
  /// example:
  /// <note>
  /// The namespace is required when requesting the readme from package versions
  /// of the following formats:
  ///
  /// <ul>
  /// <li>
  /// Maven
  /// </li>
  /// <li>
  /// Swift
  /// </li>
  /// <li>
  /// generic
  /// </li>
  /// </ul> </note>
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  Future<GetPackageVersionReadmeResult> getPackageVersionReadme({
    required String domain,
    required PackageFormat format,
    required String package,
    required String packageVersion,
    required String repository,
    String? domainOwner,
    String? namespace,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'version': [packageVersion],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/package/version/readme',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPackageVersionReadmeResult.fromJson(response);
  }

  /// Returns the endpoint of a repository for a specific package format. A
  /// repository has one endpoint for each package format:
  ///
  /// <ul>
  /// <li>
  /// <code>generic</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>ruby</code>
  /// </li>
  /// <li>
  /// <code>swift</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository.
  ///
  /// Parameter [format] :
  /// Returns which endpoint of a repository to return. A repository has one
  /// endpoint for each package format.
  ///
  /// Parameter [repository] :
  /// The name of the repository.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain that contains the repository. It does not include dashes or
  /// spaces.
  Future<GetRepositoryEndpointResult> getRepositoryEndpoint({
    required String domain,
    required PackageFormat format,
    required String repository,
    String? domainOwner,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/repository/endpoint',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRepositoryEndpointResult.fromJson(response);
  }

  /// Returns the resource policy that is set on a repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the repository whose associated resource
  /// policy is to be retrieved.
  ///
  /// Parameter [repository] :
  /// The name of the repository whose associated resource policy is to be
  /// retrieved.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  Future<GetRepositoryPermissionsPolicyResult> getRepositoryPermissionsPolicy({
    required String domain,
    required String repository,
    String? domainOwner,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/repository/permissions/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRepositoryPermissionsPolicyResult.fromJson(response);
  }

  /// Lists the repositories in the added repositories list of the specified
  /// restriction type for a package group. For more information about
  /// restriction types and added repository lists, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/package-group-origin-controls.html">Package
  /// group origin controls</a> in the <i>CodeArtifact User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the package group from which to list
  /// allowed repositories.
  ///
  /// Parameter [originRestrictionType] :
  /// The origin configuration restriction type of which to list allowed
  /// repositories.
  ///
  /// Parameter [packageGroup] :
  /// The pattern of the package group from which to list allowed repositories.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListAllowedRepositoriesForGroupResult>
      listAllowedRepositoriesForGroup({
    required String domain,
    required PackageGroupOriginRestrictionType originRestrictionType,
    required String packageGroup,
    String? domainOwner,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'originRestrictionType': [originRestrictionType.toValue()],
      'package-group': [packageGroup],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/package-group-allowed-repositories',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAllowedRepositoriesForGroupResult.fromJson(response);
  }

  /// Returns a list of packages associated with the requested package group.
  /// For information package group association and matching, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/package-group-definition-syntax-matching-behavior.html">Package
  /// group definition syntax and matching behavior</a> in the <i>CodeArtifact
  /// User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the package group from which to list
  /// associated packages.
  ///
  /// Parameter [packageGroup] :
  /// The pattern of the package group from which to list associated packages.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [preview] :
  /// When this flag is included, <code>ListAssociatedPackages</code> will
  /// return a list of packages that would be associated with a package group,
  /// even if it does not exist.
  Future<ListAssociatedPackagesResult> listAssociatedPackages({
    required String domain,
    required String packageGroup,
    String? domainOwner,
    int? maxResults,
    String? nextToken,
    bool? preview,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'package-group': [packageGroup],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (preview != null) 'preview': [preview.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/list-associated-packages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssociatedPackagesResult.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionDescription.html">DomainSummary</a>
  /// objects for all domains owned by the Amazon Web Services account that
  /// makes this call. Each returned <code>DomainSummary</code> object contains
  /// information about a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListDomainsResult> listDomains({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/domains',
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainsResult.fromJson(response);
  }

  /// Returns a list of package groups in the requested domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domain] :
  /// The domain for which you want to list package groups.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [prefix] :
  /// A prefix for which to search package groups. When included,
  /// <code>ListPackageGroups</code> will return only package groups with
  /// patterns that match the prefix.
  Future<ListPackageGroupsResult> listPackageGroups({
    required String domain,
    String? domainOwner,
    int? maxResults,
    String? nextToken,
    String? prefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (prefix != null) 'prefix': [prefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/package-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackageGroupsResult.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_AssetSummary.html">AssetSummary</a>
  /// objects for assets in a package version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository associated with the
  /// package version assets.
  ///
  /// Parameter [format] :
  /// The format of the package that contains the requested package version
  /// assets.
  ///
  /// Parameter [package] :
  /// The name of the package that contains the requested package version
  /// assets.
  ///
  /// Parameter [packageVersion] :
  /// A string that contains the package version (for example,
  /// <code>3.5.2</code>).
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the package that contains the
  /// requested package version assets.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package version that contains the requested package
  /// version assets. The package component that specifies its namespace depends
  /// on its type. For example:
  /// <note>
  /// The namespace is required requesting assets from package versions of the
  /// following formats:
  ///
  /// <ul>
  /// <li>
  /// Maven
  /// </li>
  /// <li>
  /// Swift
  /// </li>
  /// <li>
  /// generic
  /// </li>
  /// </ul> </note>
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListPackageVersionAssetsResult> listPackageVersionAssets({
    required String domain,
    required PackageFormat format,
    required String package,
    required String packageVersion,
    required String repository,
    String? domainOwner,
    int? maxResults,
    String? namespace,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'version': [packageVersion],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (namespace != null) 'namespace': [namespace],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/package/version/assets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackageVersionAssetsResult.fromJson(response);
  }

  /// Returns the direct dependencies for a package version. The dependencies
  /// are returned as <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageDependency.html">PackageDependency</a>
  /// objects. CodeArtifact extracts the dependencies for a package version from
  /// the metadata file for the package format (for example, the
  /// <code>package.json</code> file for npm packages and the
  /// <code>pom.xml</code> file for Maven). Any package version dependencies
  /// that are not listed in the configuration file are not returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// requested package version dependencies.
  ///
  /// Parameter [format] :
  /// The format of the package with the requested dependencies.
  ///
  /// Parameter [package] :
  /// The name of the package versions' package.
  ///
  /// Parameter [packageVersion] :
  /// A string that contains the package version (for example,
  /// <code>3.5.2</code>).
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the requested package version.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package version with the requested dependencies. The
  /// package component that specifies its namespace depends on its type. For
  /// example:
  /// <note>
  /// The namespace is required when listing dependencies from package versions
  /// of the following formats:
  ///
  /// <ul>
  /// <li>
  /// Maven
  /// </li>
  /// <li>
  /// Swift
  /// </li>
  /// <li>
  /// generic
  /// </li>
  /// </ul> </note>
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListPackageVersionDependenciesResult> listPackageVersionDependencies({
    required String domain,
    required PackageFormat format,
    required String package,
    required String packageVersion,
    required String repository,
    String? domainOwner,
    String? namespace,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'version': [packageVersion],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/package/version/dependencies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackageVersionDependenciesResult.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionSummary.html">PackageVersionSummary</a>
  /// objects for package versions in a repository that match the request
  /// parameters. Package versions of all statuses will be returned by default
  /// when calling <code>list-package-versions</code> with no
  /// <code>--status</code> parameter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// requested package versions.
  ///
  /// Parameter [format] :
  /// The format of the package versions you want to list.
  ///
  /// Parameter [package] :
  /// The name of the package for which you want to request package versions.
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the requested package versions.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package that contains the requested package versions.
  /// The package component that specifies its namespace depends on its type.
  /// For example:
  /// <note>
  /// The namespace is required when deleting package versions of the following
  /// formats:
  ///
  /// <ul>
  /// <li>
  /// Maven
  /// </li>
  /// <li>
  /// Swift
  /// </li>
  /// <li>
  /// generic
  /// </li>
  /// </ul> </note>
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [originType] :
  /// The <code>originType</code> used to filter package versions. Only package
  /// versions with the provided <code>originType</code> will be returned.
  ///
  /// Parameter [sortBy] :
  /// How to sort the requested list of package versions.
  ///
  /// Parameter [status] :
  /// A string that filters the requested package versions by status.
  Future<ListPackageVersionsResult> listPackageVersions({
    required String domain,
    required PackageFormat format,
    required String package,
    required String repository,
    String? domainOwner,
    int? maxResults,
    String? namespace,
    String? nextToken,
    PackageVersionOriginType? originType,
    PackageVersionSortType? sortBy,
    PackageVersionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (namespace != null) 'namespace': [namespace],
      if (nextToken != null) 'next-token': [nextToken],
      if (originType != null) 'originType': [originType.toValue()],
      if (sortBy != null) 'sortBy': [sortBy.toValue()],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/package/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackageVersionsResult.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageSummary.html">PackageSummary</a>
  /// objects for packages in a repository that match the request parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// requested packages.
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the requested packages.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [format] :
  /// The format used to filter requested packages. Only packages from the
  /// provided format will be returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [namespace] :
  /// The namespace prefix used to filter requested packages. Only packages with
  /// a namespace that starts with the provided string value are returned. Note
  /// that although this option is called <code>--namespace</code> and not
  /// <code>--namespace-prefix</code>, it has prefix-matching behavior.
  ///
  /// Each package format uses namespace as follows:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [packagePrefix] :
  /// A prefix used to filter requested packages. Only packages with names that
  /// start with <code>packagePrefix</code> are returned.
  ///
  /// Parameter [publish] :
  /// The value of the <code>Publish</code> package origin control restriction
  /// used to filter requested packages. Only packages with the provided
  /// restriction are returned. For more information, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageOriginRestrictions.html">PackageOriginRestrictions</a>.
  ///
  /// Parameter [upstream] :
  /// The value of the <code>Upstream</code> package origin control restriction
  /// used to filter requested packages. Only packages with the provided
  /// restriction are returned. For more information, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageOriginRestrictions.html">PackageOriginRestrictions</a>.
  Future<ListPackagesResult> listPackages({
    required String domain,
    required String repository,
    String? domainOwner,
    PackageFormat? format,
    int? maxResults,
    String? namespace,
    String? nextToken,
    String? packagePrefix,
    AllowPublish? publish,
    AllowUpstream? upstream,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (format != null) 'format': [format.toValue()],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (namespace != null) 'namespace': [namespace],
      if (nextToken != null) 'next-token': [nextToken],
      if (packagePrefix != null) 'package-prefix': [packagePrefix],
      if (publish != null) 'publish': [publish.toValue()],
      if (upstream != null) 'upstream': [upstream.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/packages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackagesResult.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_RepositorySummary.html">RepositorySummary</a>
  /// objects. Each <code>RepositorySummary</code> contains information about a
  /// repository in the specified Amazon Web Services account and that matches
  /// the input parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [repositoryPrefix] :
  /// A prefix used to filter returned repositories. Only repositories with
  /// names that start with <code>repositoryPrefix</code> are returned.
  Future<ListRepositoriesResult> listRepositories({
    int? maxResults,
    String? nextToken,
    String? repositoryPrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (repositoryPrefix != null) 'repository-prefix': [repositoryPrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/repositories',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRepositoriesResult.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_RepositorySummary.html">RepositorySummary</a>
  /// objects. Each <code>RepositorySummary</code> contains information about a
  /// repository in the specified domain and that matches the input parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the returned list of repositories.
  ///
  /// Parameter [administratorAccount] :
  /// Filter the list of repositories to only include those that are managed by
  /// the Amazon Web Services account ID.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [repositoryPrefix] :
  /// A prefix used to filter returned repositories. Only repositories with
  /// names that start with <code>repositoryPrefix</code> are returned.
  Future<ListRepositoriesInDomainResult> listRepositoriesInDomain({
    required String domain,
    String? administratorAccount,
    String? domainOwner,
    int? maxResults,
    String? nextToken,
    String? repositoryPrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      if (administratorAccount != null)
        'administrator-account': [administratorAccount],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (repositoryPrefix != null) 'repository-prefix': [repositoryPrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/domain/repositories',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRepositoriesInDomainResult.fromJson(response);
  }

  /// Returns a list of direct children of the specified package group.
  ///
  /// For information package group hierarchy, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/package-group-definition-syntax-matching-behavior.html">Package
  /// group definition syntax and matching behavior</a> in the <i>CodeArtifact
  /// User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domain] :
  /// The name of the domain which contains the package group from which to list
  /// sub package groups.
  ///
  /// Parameter [packageGroup] :
  /// The pattern of the package group from which to list sub package groups.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListSubPackageGroupsResult> listSubPackageGroups({
    required String domain,
    required String packageGroup,
    String? domainOwner,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'package-group': [packageGroup],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/package-groups/sub-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubPackageGroupsResult.fromJson(response);
  }

  /// Gets information about Amazon Web Services tags for a specified Amazon
  /// Resource Name (ARN) in CodeArtifact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to get tags for.
  Future<ListTagsForResourceResult> listTagsForResource({
    required String resourceArn,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResult.fromJson(response);
  }

  /// Creates a new package version containing one or more assets (or files).
  ///
  /// The <code>unfinished</code> flag can be used to keep the package version
  /// in the <code>Unfinished</code> state until all of its assets have been
  /// uploaded (see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/packages-overview.html#package-version-status.html#package-version-status">Package
  /// version status</a> in the <i>CodeArtifact user guide</i>). To set the
  /// package version’s status to <code>Published</code>, omit the
  /// <code>unfinished</code> flag when uploading the final asset, or set the
  /// status using <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_UpdatePackageVersionsStatus.html">UpdatePackageVersionStatus</a>.
  /// Once a package version’s status is set to <code>Published</code>, it
  /// cannot change back to <code>Unfinished</code>.
  /// <note>
  /// Only generic packages can be published using this API. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/using-generic.html">Using
  /// generic packages</a> in the <i>CodeArtifact User Guide</i>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assetContent] :
  /// The content of the asset to publish.
  ///
  /// Parameter [assetName] :
  /// The name of the asset to publish. Asset names can include Unicode letters
  /// and numbers, and the following special characters: <code>~ ! @ ^ &amp; ( )
  /// - ` _ + [ ] { } ; , . `</code>
  ///
  /// Parameter [assetSHA256] :
  /// The SHA256 hash of the <code>assetContent</code> to publish. This value
  /// must be calculated by the caller and provided with the request (see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/using-generic.html#publishing-generic-packages">Publishing
  /// a generic package</a> in the <i>CodeArtifact User Guide</i>).
  ///
  /// This value is used as an integrity check to verify that the
  /// <code>assetContent</code> has not changed after it was originally sent.
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// package version to publish.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of the package version with the requested
  /// asset file.
  ///
  /// The only supported value is <code>generic</code>.
  ///
  /// Parameter [package] :
  /// The name of the package version to publish.
  ///
  /// Parameter [packageVersion] :
  /// The package version to publish (for example, <code>3.5.2</code>).
  ///
  /// Parameter [repository] :
  /// The name of the repository that the package version will be published to.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package version to publish.
  ///
  /// Parameter [unfinished] :
  /// Specifies whether the package version should remain in the
  /// <code>unfinished</code> state. If omitted, the package version status will
  /// be set to <code>Published</code> (see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/packages-overview.html#package-version-status">Package
  /// version status</a> in the <i>CodeArtifact User Guide</i>).
  ///
  /// Valid values: <code>unfinished</code>
  Future<PublishPackageVersionResult> publishPackageVersion({
    required Uint8List assetContent,
    required String assetName,
    required String assetSHA256,
    required String domain,
    required PackageFormat format,
    required String package,
    required String packageVersion,
    required String repository,
    String? domainOwner,
    String? namespace,
    bool? unfinished,
  }) async {
    final headers = <String, String>{
      'x-amz-content-sha256': assetSHA256.toString(),
    };
    final $query = <String, List<String>>{
      'asset': [assetName],
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'version': [packageVersion],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
      if (unfinished != null) 'unfinished': [unfinished.toString()],
    };
    final response = await _protocol.send(
      payload: assetContent,
      method: 'POST',
      requestUri: '/v1/package/version/publish',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return PublishPackageVersionResult.fromJson(response);
  }

  /// Sets a resource policy on a domain that specifies permissions to access
  /// it.
  ///
  /// When you call <code>PutDomainPermissionsPolicy</code>, the resource policy
  /// on the domain is ignored when evaluting permissions. This ensures that the
  /// owner of a domain cannot lock themselves out of the domain, which would
  /// prevent them from being able to update the resource policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain on which to set the resource policy.
  ///
  /// Parameter [policyDocument] :
  /// A valid displayable JSON Aspen policy string to be set as the access
  /// control resource policy on the provided domain.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [policyRevision] :
  /// The current revision of the resource policy to be set. This revision is
  /// used for optimistic locking, which prevents others from overwriting your
  /// changes to the domain's resource policy.
  Future<PutDomainPermissionsPolicyResult> putDomainPermissionsPolicy({
    required String domain,
    required String policyDocument,
    String? domainOwner,
    String? policyRevision,
  }) async {
    final $payload = <String, dynamic>{
      'domain': domain,
      'policyDocument': policyDocument,
      if (domainOwner != null) 'domainOwner': domainOwner,
      if (policyRevision != null) 'policyRevision': policyRevision,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/domain/permissions/policy',
      exceptionFnMap: _exceptionFns,
    );
    return PutDomainPermissionsPolicyResult.fromJson(response);
  }

  /// Sets the package origin configuration for a package.
  ///
  /// The package origin configuration determines how new versions of a package
  /// can be added to a repository. You can allow or block direct publishing of
  /// new package versions, or ingestion and retaining of new package versions
  /// from an external connection or upstream source. For more information about
  /// package origin controls and configuration, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/package-origin-controls.html">Editing
  /// package origin controls</a> in the <i>CodeArtifact User Guide</i>.
  ///
  /// <code>PutPackageOriginConfiguration</code> can be called on a package that
  /// doesn't yet exist in the repository. When called on a package that does
  /// not exist, a package is created in the repository with no versions and the
  /// requested restrictions are set on the package. This can be used to
  /// preemptively block ingesting or retaining any versions from external
  /// connections or upstream repositories, or to block publishing any versions
  /// of the package into the repository before connecting any package managers
  /// or publishers to the repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// package.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of the package to be updated.
  ///
  /// Parameter [package] :
  /// The name of the package to be updated.
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the package.
  ///
  /// Parameter [restrictions] :
  /// A <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageOriginRestrictions.html">PackageOriginRestrictions</a>
  /// object that contains information about the <code>upstream</code> and
  /// <code>publish</code> package origin restrictions. The
  /// <code>upstream</code> restriction determines if new package versions can
  /// be ingested or retained from external connections or upstream
  /// repositories. The <code>publish</code> restriction determines if new
  /// package versions can be published directly to the repository.
  ///
  /// You must include both the desired <code>upstream</code> and
  /// <code>publish</code> restrictions.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package to be updated. The package component that
  /// specifies its namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  Future<PutPackageOriginConfigurationResult> putPackageOriginConfiguration({
    required String domain,
    required PackageFormat format,
    required String package,
    required String repository,
    required PackageOriginRestrictions restrictions,
    String? domainOwner,
    String? namespace,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final $payload = <String, dynamic>{
      'restrictions': restrictions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/package',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutPackageOriginConfigurationResult.fromJson(response);
  }

  /// Sets the resource policy on a repository that specifies permissions to
  /// access it.
  ///
  /// When you call <code>PutRepositoryPermissionsPolicy</code>, the resource
  /// policy on the repository is ignored when evaluting permissions. This
  /// ensures that the owner of a repository cannot lock themselves out of the
  /// repository, which would prevent them from being able to update the
  /// resource policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the repository to set the resource
  /// policy on.
  ///
  /// Parameter [policyDocument] :
  /// A valid displayable JSON Aspen policy string to be set as the access
  /// control resource policy on the provided repository.
  ///
  /// Parameter [repository] :
  /// The name of the repository to set the resource policy on.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [policyRevision] :
  /// Sets the revision of the resource policy that specifies permissions to
  /// access the repository. This revision is used for optimistic locking, which
  /// prevents others from overwriting your changes to the repository's resource
  /// policy.
  Future<PutRepositoryPermissionsPolicyResult> putRepositoryPermissionsPolicy({
    required String domain,
    required String policyDocument,
    required String repository,
    String? domainOwner,
    String? policyRevision,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final $payload = <String, dynamic>{
      'policyDocument': policyDocument,
      if (policyRevision != null) 'policyRevision': policyRevision,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/repository/permissions/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutRepositoryPermissionsPolicyResult.fromJson(response);
  }

  /// Adds or updates tags for a resource in CodeArtifact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to add or
  /// update tags for.
  ///
  /// Parameter [tags] :
  /// The tags you want to modify or add to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/tag',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a resource in CodeArtifact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to remove
  /// tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tag key for each tag that you want to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final $payload = <String, dynamic>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/untag',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a package group. This API cannot be used to update a package
  /// group's origin configuration or pattern. To update a package group's
  /// origin configuration, use <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_UpdatePackageGroupOriginConfiguration.html">UpdatePackageGroupOriginConfiguration</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domain] :
  /// The name of the domain which contains the package group to be updated.
  ///
  /// Parameter [packageGroup] :
  /// The pattern of the package group to be updated.
  ///
  /// Parameter [contactInfo] :
  /// Contact information which you want to update the requested package group
  /// with.
  ///
  /// Parameter [description] :
  /// The description you want to update the requested package group with.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  Future<UpdatePackageGroupResult> updatePackageGroup({
    required String domain,
    required String packageGroup,
    String? contactInfo,
    String? description,
    String? domainOwner,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final $payload = <String, dynamic>{
      'packageGroup': packageGroup,
      if (contactInfo != null) 'contactInfo': contactInfo,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/package-group',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePackageGroupResult.fromJson(response);
  }

  /// Updates the package origin configuration for a package group.
  ///
  /// The package origin configuration determines how new versions of a package
  /// can be added to a repository. You can allow or block direct publishing of
  /// new package versions, or ingestion and retaining of new package versions
  /// from an external connection or upstream source. For more information about
  /// package group origin controls and configuration, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/package-group-origin-controls.html">Package
  /// group origin controls</a> in the <i>CodeArtifact User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domain] :
  /// The name of the domain which contains the package group for which to
  /// update the origin configuration.
  ///
  /// Parameter [packageGroup] :
  /// The pattern of the package group for which to update the origin
  /// configuration.
  ///
  /// Parameter [addAllowedRepositories] :
  /// The repository name and restrictions to add to the allowed repository list
  /// of the specified package group.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [removeAllowedRepositories] :
  /// The repository name and restrictions to remove from the allowed repository
  /// list of the specified package group.
  ///
  /// Parameter [restrictions] :
  /// The origin configuration settings that determine how package versions can
  /// enter repositories.
  Future<UpdatePackageGroupOriginConfigurationResult>
      updatePackageGroupOriginConfiguration({
    required String domain,
    required String packageGroup,
    List<PackageGroupAllowedRepository>? addAllowedRepositories,
    String? domainOwner,
    List<PackageGroupAllowedRepository>? removeAllowedRepositories,
    Map<PackageGroupOriginRestrictionType, PackageGroupOriginRestrictionMode>?
        restrictions,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'package-group': [packageGroup],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final $payload = <String, dynamic>{
      if (addAllowedRepositories != null)
        'addAllowedRepositories': addAllowedRepositories,
      if (removeAllowedRepositories != null)
        'removeAllowedRepositories': removeAllowedRepositories,
      if (restrictions != null)
        'restrictions':
            restrictions.map((k, e) => MapEntry(k.toValue(), e.toValue())),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/package-group-origin-configuration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePackageGroupOriginConfigurationResult.fromJson(response);
  }

  /// Updates the status of one or more versions of a package. Using
  /// <code>UpdatePackageVersionsStatus</code>, you can update the status of
  /// package versions to <code>Archived</code>, <code>Published</code>, or
  /// <code>Unlisted</code>. To set the status of a package version to
  /// <code>Disposed</code>, use <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_DisposePackageVersions.html">DisposePackageVersions</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// package versions with a status to be updated.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of the package with the statuses to
  /// update.
  ///
  /// Parameter [package] :
  /// The name of the package with the version statuses to update.
  ///
  /// Parameter [repository] :
  /// The repository that contains the package versions with the status you want
  /// to update.
  ///
  /// Parameter [targetStatus] :
  /// The status you want to change the package version status to.
  ///
  /// Parameter [versions] :
  /// An array of strings that specify the versions of the package with the
  /// statuses to update.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [expectedStatus] :
  /// The package version’s expected status before it is updated. If
  /// <code>expectedStatus</code> is provided, the package version's status is
  /// updated only if its status at the time
  /// <code>UpdatePackageVersionsStatus</code> is called matches
  /// <code>expectedStatus</code>.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package version to be updated. The package component
  /// that specifies its namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its
  /// <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [versionRevisions] :
  /// A map of package versions and package version revisions. The map
  /// <code>key</code> is the package version (for example, <code>3.5.2</code>),
  /// and the map <code>value</code> is the package version revision.
  Future<UpdatePackageVersionsStatusResult> updatePackageVersionsStatus({
    required String domain,
    required PackageFormat format,
    required String package,
    required String repository,
    required PackageVersionStatus targetStatus,
    required List<String> versions,
    String? domainOwner,
    PackageVersionStatus? expectedStatus,
    String? namespace,
    Map<String, String>? versionRevisions,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final $payload = <String, dynamic>{
      'targetStatus': targetStatus.toValue(),
      'versions': versions,
      if (expectedStatus != null) 'expectedStatus': expectedStatus.toValue(),
      if (versionRevisions != null) 'versionRevisions': versionRevisions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/package/versions/update_status',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePackageVersionsStatusResult.fromJson(response);
  }

  /// Update the properties of a repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain associated with the repository to update.
  ///
  /// Parameter [repository] :
  /// The name of the repository to update.
  ///
  /// Parameter [description] :
  /// An updated repository description.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the Amazon Web Services account that owns
  /// the domain. It does not include dashes or spaces.
  ///
  /// Parameter [upstreams] :
  /// A list of upstream repositories to associate with the repository. The
  /// order of the upstream repositories in the list determines their priority
  /// order when CodeArtifact looks for a requested package version. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/repos-upstream.html">Working
  /// with upstream repositories</a>.
  Future<UpdateRepositoryResult> updateRepository({
    required String domain,
    required String repository,
    String? description,
    String? domainOwner,
    List<UpstreamRepository>? upstreams,
  }) async {
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (upstreams != null) 'upstreams': upstreams,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/repository',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRepositoryResult.fromJson(response);
  }
}

enum AllowPublish {
  allow,
  block,
}

extension AllowPublishValueExtension on AllowPublish {
  String toValue() {
    switch (this) {
      case AllowPublish.allow:
        return 'ALLOW';
      case AllowPublish.block:
        return 'BLOCK';
    }
  }
}

extension AllowPublishFromString on String {
  AllowPublish toAllowPublish() {
    switch (this) {
      case 'ALLOW':
        return AllowPublish.allow;
      case 'BLOCK':
        return AllowPublish.block;
    }
    throw Exception('$this is not known in enum AllowPublish');
  }
}

enum AllowUpstream {
  allow,
  block,
}

extension AllowUpstreamValueExtension on AllowUpstream {
  String toValue() {
    switch (this) {
      case AllowUpstream.allow:
        return 'ALLOW';
      case AllowUpstream.block:
        return 'BLOCK';
    }
  }
}

extension AllowUpstreamFromString on String {
  AllowUpstream toAllowUpstream() {
    switch (this) {
      case 'ALLOW':
        return AllowUpstream.allow;
      case 'BLOCK':
        return AllowUpstream.block;
    }
    throw Exception('$this is not known in enum AllowUpstream');
  }
}

/// Contains details about a package version asset.
class AssetSummary {
  /// The name of the asset.
  final String name;

  /// The hashes of the asset.
  final Map<HashAlgorithm, String>? hashes;

  /// The size of the asset.
  final int? size;

  AssetSummary({
    required this.name,
    this.hashes,
    this.size,
  });

  factory AssetSummary.fromJson(Map<String, dynamic> json) {
    return AssetSummary(
      name: json['name'] as String,
      hashes: (json['hashes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toHashAlgorithm(), e as String)),
      size: json['size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final hashes = this.hashes;
    final size = this.size;
    return {
      'name': name,
      if (hashes != null)
        'hashes': hashes.map((k, e) => MapEntry(k.toValue(), e)),
      if (size != null) 'size': size,
    };
  }
}

class AssociateExternalConnectionResult {
  /// Information about the connected repository after processing the request.
  final RepositoryDescription? repository;

  AssociateExternalConnectionResult({
    this.repository,
  });

  factory AssociateExternalConnectionResult.fromJson(
      Map<String, dynamic> json) {
    return AssociateExternalConnectionResult(
      repository: json['repository'] != null
          ? RepositoryDescription.fromJson(
              json['repository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final repository = this.repository;
    return {
      if (repository != null) 'repository': repository,
    };
  }
}

/// A package associated with a package group.
class AssociatedPackage {
  /// Describes the strength of the association between the package and package
  /// group. A strong match can be thought of as an exact match, and a weak match
  /// can be thought of as a variation match, for example, the package name
  /// matches a variation of the package group pattern. For more information about
  /// package group pattern matching, including strong and weak matches, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/package-group-definition-syntax-matching-behavior.html">Package
  /// group definition syntax and matching behavior</a> in the <i>CodeArtifact
  /// User Guide</i>.
  final PackageGroupAssociationType? associationType;

  /// A format that specifies the type of the associated package.
  final PackageFormat? format;

  /// The namespace of the associated package. The package component that
  /// specifies its namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// The name of the associated package.
  final String? package;

  AssociatedPackage({
    this.associationType,
    this.format,
    this.namespace,
    this.package,
  });

  factory AssociatedPackage.fromJson(Map<String, dynamic> json) {
    return AssociatedPackage(
      associationType:
          (json['associationType'] as String?)?.toPackageGroupAssociationType(),
      format: (json['format'] as String?)?.toPackageFormat(),
      namespace: json['namespace'] as String?,
      package: json['package'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationType = this.associationType;
    final format = this.format;
    final namespace = this.namespace;
    final package = this.package;
    return {
      if (associationType != null) 'associationType': associationType.toValue(),
      if (format != null) 'format': format.toValue(),
      if (namespace != null) 'namespace': namespace,
      if (package != null) 'package': package,
    };
  }
}

class CopyPackageVersionsResult {
  /// A map of package versions that failed to copy and their error codes. The
  /// possible error codes are in the <code>PackageVersionError</code> data type.
  /// They are:
  ///
  /// <ul>
  /// <li>
  /// <code>ALREADY_EXISTS</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_REVISION</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_STATUS</code>
  /// </li>
  /// <li>
  /// <code>NOT_ALLOWED</code>
  /// </li>
  /// <li>
  /// <code>NOT_FOUND</code>
  /// </li>
  /// <li>
  /// <code>SKIPPED</code>
  /// </li>
  /// </ul>
  final Map<String, PackageVersionError>? failedVersions;

  /// A list of the package versions that were successfully copied to your
  /// repository.
  final Map<String, SuccessfulPackageVersionInfo>? successfulVersions;

  CopyPackageVersionsResult({
    this.failedVersions,
    this.successfulVersions,
  });

  factory CopyPackageVersionsResult.fromJson(Map<String, dynamic> json) {
    return CopyPackageVersionsResult(
      failedVersions: (json['failedVersions'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, PackageVersionError.fromJson(e as Map<String, dynamic>))),
      successfulVersions: (json['successfulVersions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              SuccessfulPackageVersionInfo.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final failedVersions = this.failedVersions;
    final successfulVersions = this.successfulVersions;
    return {
      if (failedVersions != null) 'failedVersions': failedVersions,
      if (successfulVersions != null) 'successfulVersions': successfulVersions,
    };
  }
}

class CreateDomainResult {
  /// Contains information about the created domain after processing the request.
  final DomainDescription? domain;

  CreateDomainResult({
    this.domain,
  });

  factory CreateDomainResult.fromJson(Map<String, dynamic> json) {
    return CreateDomainResult(
      domain: json['domain'] != null
          ? DomainDescription.fromJson(json['domain'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    return {
      if (domain != null) 'domain': domain,
    };
  }
}

class CreatePackageGroupResult {
  /// Information about the created package group after processing the request.
  final PackageGroupDescription? packageGroup;

  CreatePackageGroupResult({
    this.packageGroup,
  });

  factory CreatePackageGroupResult.fromJson(Map<String, dynamic> json) {
    return CreatePackageGroupResult(
      packageGroup: json['packageGroup'] != null
          ? PackageGroupDescription.fromJson(
              json['packageGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final packageGroup = this.packageGroup;
    return {
      if (packageGroup != null) 'packageGroup': packageGroup,
    };
  }
}

class CreateRepositoryResult {
  /// Information about the created repository after processing the request.
  final RepositoryDescription? repository;

  CreateRepositoryResult({
    this.repository,
  });

  factory CreateRepositoryResult.fromJson(Map<String, dynamic> json) {
    return CreateRepositoryResult(
      repository: json['repository'] != null
          ? RepositoryDescription.fromJson(
              json['repository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final repository = this.repository;
    return {
      if (repository != null) 'repository': repository,
    };
  }
}

class DeleteDomainPermissionsPolicyResult {
  /// Information about the deleted resource policy after processing the request.
  final ResourcePolicy? policy;

  DeleteDomainPermissionsPolicyResult({
    this.policy,
  });

  factory DeleteDomainPermissionsPolicyResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteDomainPermissionsPolicyResult(
      policy: json['policy'] != null
          ? ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'policy': policy,
    };
  }
}

class DeleteDomainResult {
  /// Contains information about the deleted domain after processing the request.
  final DomainDescription? domain;

  DeleteDomainResult({
    this.domain,
  });

  factory DeleteDomainResult.fromJson(Map<String, dynamic> json) {
    return DeleteDomainResult(
      domain: json['domain'] != null
          ? DomainDescription.fromJson(json['domain'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    return {
      if (domain != null) 'domain': domain,
    };
  }
}

class DeletePackageGroupResult {
  /// Information about the deleted package group after processing the request.
  final PackageGroupDescription? packageGroup;

  DeletePackageGroupResult({
    this.packageGroup,
  });

  factory DeletePackageGroupResult.fromJson(Map<String, dynamic> json) {
    return DeletePackageGroupResult(
      packageGroup: json['packageGroup'] != null
          ? PackageGroupDescription.fromJson(
              json['packageGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final packageGroup = this.packageGroup;
    return {
      if (packageGroup != null) 'packageGroup': packageGroup,
    };
  }
}

class DeletePackageResult {
  final PackageSummary? deletedPackage;

  DeletePackageResult({
    this.deletedPackage,
  });

  factory DeletePackageResult.fromJson(Map<String, dynamic> json) {
    return DeletePackageResult(
      deletedPackage: json['deletedPackage'] != null
          ? PackageSummary.fromJson(
              json['deletedPackage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deletedPackage = this.deletedPackage;
    return {
      if (deletedPackage != null) 'deletedPackage': deletedPackage,
    };
  }
}

class DeletePackageVersionsResult {
  /// A <code>PackageVersionError</code> object that contains a map of errors
  /// codes for the deleted package that failed. The possible error codes are:
  ///
  /// <ul>
  /// <li>
  /// <code>ALREADY_EXISTS</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_REVISION</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_STATUS</code>
  /// </li>
  /// <li>
  /// <code>NOT_ALLOWED</code>
  /// </li>
  /// <li>
  /// <code>NOT_FOUND</code>
  /// </li>
  /// <li>
  /// <code>SKIPPED</code>
  /// </li>
  /// </ul>
  final Map<String, PackageVersionError>? failedVersions;

  /// A list of the package versions that were successfully deleted. The status of
  /// every successful version will be <code>Deleted</code>.
  final Map<String, SuccessfulPackageVersionInfo>? successfulVersions;

  DeletePackageVersionsResult({
    this.failedVersions,
    this.successfulVersions,
  });

  factory DeletePackageVersionsResult.fromJson(Map<String, dynamic> json) {
    return DeletePackageVersionsResult(
      failedVersions: (json['failedVersions'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, PackageVersionError.fromJson(e as Map<String, dynamic>))),
      successfulVersions: (json['successfulVersions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              SuccessfulPackageVersionInfo.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final failedVersions = this.failedVersions;
    final successfulVersions = this.successfulVersions;
    return {
      if (failedVersions != null) 'failedVersions': failedVersions,
      if (successfulVersions != null) 'successfulVersions': successfulVersions,
    };
  }
}

class DeleteRepositoryPermissionsPolicyResult {
  /// Information about the deleted policy after processing the request.
  final ResourcePolicy? policy;

  DeleteRepositoryPermissionsPolicyResult({
    this.policy,
  });

  factory DeleteRepositoryPermissionsPolicyResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteRepositoryPermissionsPolicyResult(
      policy: json['policy'] != null
          ? ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'policy': policy,
    };
  }
}

class DeleteRepositoryResult {
  /// Information about the deleted repository after processing the request.
  final RepositoryDescription? repository;

  DeleteRepositoryResult({
    this.repository,
  });

  factory DeleteRepositoryResult.fromJson(Map<String, dynamic> json) {
    return DeleteRepositoryResult(
      repository: json['repository'] != null
          ? RepositoryDescription.fromJson(
              json['repository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final repository = this.repository;
    return {
      if (repository != null) 'repository': repository,
    };
  }
}

class DescribeDomainResult {
  final DomainDescription? domain;

  DescribeDomainResult({
    this.domain,
  });

  factory DescribeDomainResult.fromJson(Map<String, dynamic> json) {
    return DescribeDomainResult(
      domain: json['domain'] != null
          ? DomainDescription.fromJson(json['domain'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    return {
      if (domain != null) 'domain': domain,
    };
  }
}

class DescribePackageGroupResult {
  /// A <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageGroupDescription.html">PackageGroupDescription</a>
  /// object that contains information about the requested package group.
  final PackageGroupDescription? packageGroup;

  DescribePackageGroupResult({
    this.packageGroup,
  });

  factory DescribePackageGroupResult.fromJson(Map<String, dynamic> json) {
    return DescribePackageGroupResult(
      packageGroup: json['packageGroup'] != null
          ? PackageGroupDescription.fromJson(
              json['packageGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final packageGroup = this.packageGroup;
    return {
      if (packageGroup != null) 'packageGroup': packageGroup,
    };
  }
}

class DescribePackageResult {
  /// A <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageDescription.html">PackageDescription</a>
  /// object that contains information about the requested package.
  final PackageDescription package;

  DescribePackageResult({
    required this.package,
  });

  factory DescribePackageResult.fromJson(Map<String, dynamic> json) {
    return DescribePackageResult(
      package:
          PackageDescription.fromJson(json['package'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final package = this.package;
    return {
      'package': package,
    };
  }
}

class DescribePackageVersionResult {
  /// A <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionDescription.html">PackageVersionDescription</a>
  /// object that contains information about the requested package version.
  final PackageVersionDescription packageVersion;

  DescribePackageVersionResult({
    required this.packageVersion,
  });

  factory DescribePackageVersionResult.fromJson(Map<String, dynamic> json) {
    return DescribePackageVersionResult(
      packageVersion: PackageVersionDescription.fromJson(
          json['packageVersion'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final packageVersion = this.packageVersion;
    return {
      'packageVersion': packageVersion,
    };
  }
}

class DescribeRepositoryResult {
  /// A <code>RepositoryDescription</code> object that contains the requested
  /// repository information.
  final RepositoryDescription? repository;

  DescribeRepositoryResult({
    this.repository,
  });

  factory DescribeRepositoryResult.fromJson(Map<String, dynamic> json) {
    return DescribeRepositoryResult(
      repository: json['repository'] != null
          ? RepositoryDescription.fromJson(
              json['repository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final repository = this.repository;
    return {
      if (repository != null) 'repository': repository,
    };
  }
}

class DisassociateExternalConnectionResult {
  /// The repository associated with the removed external connection.
  final RepositoryDescription? repository;

  DisassociateExternalConnectionResult({
    this.repository,
  });

  factory DisassociateExternalConnectionResult.fromJson(
      Map<String, dynamic> json) {
    return DisassociateExternalConnectionResult(
      repository: json['repository'] != null
          ? RepositoryDescription.fromJson(
              json['repository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final repository = this.repository;
    return {
      if (repository != null) 'repository': repository,
    };
  }
}

class DisposePackageVersionsResult {
  /// A <code>PackageVersionError</code> object that contains a map of errors
  /// codes for the disposed package versions that failed. The possible error
  /// codes are:
  ///
  /// <ul>
  /// <li>
  /// <code>ALREADY_EXISTS</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_REVISION</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_STATUS</code>
  /// </li>
  /// <li>
  /// <code>NOT_ALLOWED</code>
  /// </li>
  /// <li>
  /// <code>NOT_FOUND</code>
  /// </li>
  /// <li>
  /// <code>SKIPPED</code>
  /// </li>
  /// </ul>
  final Map<String, PackageVersionError>? failedVersions;

  /// A list of the package versions that were successfully disposed.
  final Map<String, SuccessfulPackageVersionInfo>? successfulVersions;

  DisposePackageVersionsResult({
    this.failedVersions,
    this.successfulVersions,
  });

  factory DisposePackageVersionsResult.fromJson(Map<String, dynamic> json) {
    return DisposePackageVersionsResult(
      failedVersions: (json['failedVersions'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, PackageVersionError.fromJson(e as Map<String, dynamic>))),
      successfulVersions: (json['successfulVersions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              SuccessfulPackageVersionInfo.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final failedVersions = this.failedVersions;
    final successfulVersions = this.successfulVersions;
    return {
      if (failedVersions != null) 'failedVersions': failedVersions,
      if (successfulVersions != null) 'successfulVersions': successfulVersions,
    };
  }
}

/// Information about a domain. A domain is a container for repositories. When
/// you create a domain, it is empty until you add one or more repositories.
class DomainDescription {
  /// The Amazon Resource Name (ARN) of the domain.
  final String? arn;

  /// The total size of all assets in the domain.
  final int? assetSizeBytes;

  /// A timestamp that represents the date and time the domain was created.
  final DateTime? createdTime;

  /// The ARN of an Key Management Service (KMS) key associated with a domain.
  final String? encryptionKey;

  /// The name of the domain.
  final String? name;

  /// The Amazon Web Services account ID that owns the domain.
  final String? owner;

  /// The number of repositories in the domain.
  final int? repositoryCount;

  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket that is used to store
  /// package assets in the domain.
  final String? s3BucketArn;

  /// The current status of a domain.
  final DomainStatus? status;

  DomainDescription({
    this.arn,
    this.assetSizeBytes,
    this.createdTime,
    this.encryptionKey,
    this.name,
    this.owner,
    this.repositoryCount,
    this.s3BucketArn,
    this.status,
  });

  factory DomainDescription.fromJson(Map<String, dynamic> json) {
    return DomainDescription(
      arn: json['arn'] as String?,
      assetSizeBytes: json['assetSizeBytes'] as int?,
      createdTime: timeStampFromJson(json['createdTime']),
      encryptionKey: json['encryptionKey'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      repositoryCount: json['repositoryCount'] as int?,
      s3BucketArn: json['s3BucketArn'] as String?,
      status: (json['status'] as String?)?.toDomainStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assetSizeBytes = this.assetSizeBytes;
    final createdTime = this.createdTime;
    final encryptionKey = this.encryptionKey;
    final name = this.name;
    final owner = this.owner;
    final repositoryCount = this.repositoryCount;
    final s3BucketArn = this.s3BucketArn;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (assetSizeBytes != null) 'assetSizeBytes': assetSizeBytes,
      if (createdTime != null) 'createdTime': unixTimestampToJson(createdTime),
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (repositoryCount != null) 'repositoryCount': repositoryCount,
      if (s3BucketArn != null) 's3BucketArn': s3BucketArn,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Information about how a package originally entered the CodeArtifact domain.
/// For packages published directly to CodeArtifact, the entry point is the
/// repository it was published to. For packages ingested from an external
/// repository, the entry point is the external connection that it was ingested
/// from. An external connection is a CodeArtifact repository that is connected
/// to an external repository such as the npm registry or NuGet gallery.
/// <note>
/// If a package version exists in a repository and is updated, for example if a
/// package of the same version is added with additional assets, the package
/// version's <code>DomainEntryPoint</code> will not change from the original
/// package version's value.
/// </note>
class DomainEntryPoint {
  /// The name of the external connection that a package was ingested from.
  final String? externalConnectionName;

  /// The name of the repository that a package was originally published to.
  final String? repositoryName;

  DomainEntryPoint({
    this.externalConnectionName,
    this.repositoryName,
  });

  factory DomainEntryPoint.fromJson(Map<String, dynamic> json) {
    return DomainEntryPoint(
      externalConnectionName: json['externalConnectionName'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final externalConnectionName = this.externalConnectionName;
    final repositoryName = this.repositoryName;
    return {
      if (externalConnectionName != null)
        'externalConnectionName': externalConnectionName,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

enum DomainStatus {
  active,
  deleted,
}

extension DomainStatusValueExtension on DomainStatus {
  String toValue() {
    switch (this) {
      case DomainStatus.active:
        return 'Active';
      case DomainStatus.deleted:
        return 'Deleted';
    }
  }
}

extension DomainStatusFromString on String {
  DomainStatus toDomainStatus() {
    switch (this) {
      case 'Active':
        return DomainStatus.active;
      case 'Deleted':
        return DomainStatus.deleted;
    }
    throw Exception('$this is not known in enum DomainStatus');
  }
}

/// Information about a domain, including its name, Amazon Resource Name (ARN),
/// and status. The <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListDomains.html">ListDomains</a>
/// operation returns a list of <code>DomainSummary</code> objects.
class DomainSummary {
  /// The ARN of the domain.
  final String? arn;

  /// A timestamp that contains the date and time the domain was created.
  final DateTime? createdTime;

  /// The key used to encrypt the domain.
  final String? encryptionKey;

  /// The name of the domain.
  final String? name;

  /// The 12-digit account number of the Amazon Web Services account that owns the
  /// domain. It does not include dashes or spaces.
  final String? owner;

  /// A string that contains the status of the domain.
  final DomainStatus? status;

  DomainSummary({
    this.arn,
    this.createdTime,
    this.encryptionKey,
    this.name,
    this.owner,
    this.status,
  });

  factory DomainSummary.fromJson(Map<String, dynamic> json) {
    return DomainSummary(
      arn: json['arn'] as String?,
      createdTime: timeStampFromJson(json['createdTime']),
      encryptionKey: json['encryptionKey'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      status: (json['status'] as String?)?.toDomainStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final encryptionKey = this.encryptionKey;
    final name = this.name;
    final owner = this.owner;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': unixTimestampToJson(createdTime),
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum ExternalConnectionStatus {
  available,
}

extension ExternalConnectionStatusValueExtension on ExternalConnectionStatus {
  String toValue() {
    switch (this) {
      case ExternalConnectionStatus.available:
        return 'Available';
    }
  }
}

extension ExternalConnectionStatusFromString on String {
  ExternalConnectionStatus toExternalConnectionStatus() {
    switch (this) {
      case 'Available':
        return ExternalConnectionStatus.available;
    }
    throw Exception('$this is not known in enum ExternalConnectionStatus');
  }
}

class GetAssociatedPackageGroupResult {
  /// Describes the strength of the association between the package and package
  /// group. A strong match is also known as an exact match, and a weak match is
  /// known as a relative match.
  final PackageGroupAssociationType? associationType;

  /// The package group that is associated with the requested package.
  final PackageGroupDescription? packageGroup;

  GetAssociatedPackageGroupResult({
    this.associationType,
    this.packageGroup,
  });

  factory GetAssociatedPackageGroupResult.fromJson(Map<String, dynamic> json) {
    return GetAssociatedPackageGroupResult(
      associationType:
          (json['associationType'] as String?)?.toPackageGroupAssociationType(),
      packageGroup: json['packageGroup'] != null
          ? PackageGroupDescription.fromJson(
              json['packageGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final associationType = this.associationType;
    final packageGroup = this.packageGroup;
    return {
      if (associationType != null) 'associationType': associationType.toValue(),
      if (packageGroup != null) 'packageGroup': packageGroup,
    };
  }
}

class GetAuthorizationTokenResult {
  /// The returned authentication token.
  final String? authorizationToken;

  /// A timestamp that specifies the date and time the authorization token
  /// expires.
  final DateTime? expiration;

  GetAuthorizationTokenResult({
    this.authorizationToken,
    this.expiration,
  });

  factory GetAuthorizationTokenResult.fromJson(Map<String, dynamic> json) {
    return GetAuthorizationTokenResult(
      authorizationToken: json['authorizationToken'] as String?,
      expiration: timeStampFromJson(json['expiration']),
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationToken = this.authorizationToken;
    final expiration = this.expiration;
    return {
      if (authorizationToken != null) 'authorizationToken': authorizationToken,
      if (expiration != null) 'expiration': unixTimestampToJson(expiration),
    };
  }
}

class GetDomainPermissionsPolicyResult {
  /// The returned resource policy.
  final ResourcePolicy? policy;

  GetDomainPermissionsPolicyResult({
    this.policy,
  });

  factory GetDomainPermissionsPolicyResult.fromJson(Map<String, dynamic> json) {
    return GetDomainPermissionsPolicyResult(
      policy: json['policy'] != null
          ? ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'policy': policy,
    };
  }
}

class GetPackageVersionAssetResult {
  /// The binary file, or asset, that is downloaded.
  final Uint8List? asset;

  /// The name of the asset that is downloaded.
  final String? assetName;

  /// A string that contains the package version (for example,
  /// <code>3.5.2</code>).
  final String? packageVersion;

  /// The name of the package version revision that contains the downloaded asset.
  final String? packageVersionRevision;

  GetPackageVersionAssetResult({
    this.asset,
    this.assetName,
    this.packageVersion,
    this.packageVersionRevision,
  });

  Map<String, dynamic> toJson() {
    final asset = this.asset;
    final assetName = this.assetName;
    final packageVersion = this.packageVersion;
    final packageVersionRevision = this.packageVersionRevision;
    return {
      if (asset != null) 'asset': base64Encode(asset),
    };
  }
}

class GetPackageVersionReadmeResult {
  /// The format of the package with the requested readme file.
  final PackageFormat? format;

  /// The namespace of the package version with the requested readme file. The
  /// package component that specifies its namespace depends on its type. For
  /// example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// The name of the package that contains the returned readme file.
  final String? package;

  /// The text of the returned readme file.
  final String? readme;

  /// The version of the package with the requested readme file.
  final String? version;

  /// The current revision associated with the package version.
  final String? versionRevision;

  GetPackageVersionReadmeResult({
    this.format,
    this.namespace,
    this.package,
    this.readme,
    this.version,
    this.versionRevision,
  });

  factory GetPackageVersionReadmeResult.fromJson(Map<String, dynamic> json) {
    return GetPackageVersionReadmeResult(
      format: (json['format'] as String?)?.toPackageFormat(),
      namespace: json['namespace'] as String?,
      package: json['package'] as String?,
      readme: json['readme'] as String?,
      version: json['version'] as String?,
      versionRevision: json['versionRevision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final namespace = this.namespace;
    final package = this.package;
    final readme = this.readme;
    final version = this.version;
    final versionRevision = this.versionRevision;
    return {
      if (format != null) 'format': format.toValue(),
      if (namespace != null) 'namespace': namespace,
      if (package != null) 'package': package,
      if (readme != null) 'readme': readme,
      if (version != null) 'version': version,
      if (versionRevision != null) 'versionRevision': versionRevision,
    };
  }
}

class GetRepositoryEndpointResult {
  /// A string that specifies the URL of the returned endpoint.
  final String? repositoryEndpoint;

  GetRepositoryEndpointResult({
    this.repositoryEndpoint,
  });

  factory GetRepositoryEndpointResult.fromJson(Map<String, dynamic> json) {
    return GetRepositoryEndpointResult(
      repositoryEndpoint: json['repositoryEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryEndpoint = this.repositoryEndpoint;
    return {
      if (repositoryEndpoint != null) 'repositoryEndpoint': repositoryEndpoint,
    };
  }
}

class GetRepositoryPermissionsPolicyResult {
  /// The returned resource policy.
  final ResourcePolicy? policy;

  GetRepositoryPermissionsPolicyResult({
    this.policy,
  });

  factory GetRepositoryPermissionsPolicyResult.fromJson(
      Map<String, dynamic> json) {
    return GetRepositoryPermissionsPolicyResult(
      policy: json['policy'] != null
          ? ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'policy': policy,
    };
  }
}

enum HashAlgorithm {
  md5,
  sha_1,
  sha_256,
  sha_512,
}

extension HashAlgorithmValueExtension on HashAlgorithm {
  String toValue() {
    switch (this) {
      case HashAlgorithm.md5:
        return 'MD5';
      case HashAlgorithm.sha_1:
        return 'SHA-1';
      case HashAlgorithm.sha_256:
        return 'SHA-256';
      case HashAlgorithm.sha_512:
        return 'SHA-512';
    }
  }
}

extension HashAlgorithmFromString on String {
  HashAlgorithm toHashAlgorithm() {
    switch (this) {
      case 'MD5':
        return HashAlgorithm.md5;
      case 'SHA-1':
        return HashAlgorithm.sha_1;
      case 'SHA-256':
        return HashAlgorithm.sha_256;
      case 'SHA-512':
        return HashAlgorithm.sha_512;
    }
    throw Exception('$this is not known in enum HashAlgorithm');
  }
}

/// Details of the license data.
class LicenseInfo {
  /// Name of the license.
  final String? name;

  /// The URL for license data.
  final String? url;

  LicenseInfo({
    this.name,
    this.url,
  });

  factory LicenseInfo.fromJson(Map<String, dynamic> json) {
    return LicenseInfo(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final url = this.url;
    return {
      if (name != null) 'name': name,
      if (url != null) 'url': url,
    };
  }
}

class ListAllowedRepositoriesForGroupResult {
  /// The list of allowed repositories for the package group and origin
  /// configuration restriction type.
  final List<String>? allowedRepositories;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListAllowedRepositoriesForGroupResult({
    this.allowedRepositories,
    this.nextToken,
  });

  factory ListAllowedRepositoriesForGroupResult.fromJson(
      Map<String, dynamic> json) {
    return ListAllowedRepositoriesForGroupResult(
      allowedRepositories: (json['allowedRepositories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedRepositories = this.allowedRepositories;
    final nextToken = this.nextToken;
    return {
      if (allowedRepositories != null)
        'allowedRepositories': allowedRepositories,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAssociatedPackagesResult {
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  /// The list of packages associated with the requested package group.
  final List<AssociatedPackage>? packages;

  ListAssociatedPackagesResult({
    this.nextToken,
    this.packages,
  });

  factory ListAssociatedPackagesResult.fromJson(Map<String, dynamic> json) {
    return ListAssociatedPackagesResult(
      nextToken: json['nextToken'] as String?,
      packages: (json['packages'] as List?)
          ?.whereNotNull()
          .map((e) => AssociatedPackage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final packages = this.packages;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (packages != null) 'packages': packages,
    };
  }
}

class ListDomainsResult {
  /// The returned list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_DomainSummary.html">DomainSummary</a>
  /// objects.
  final List<DomainSummary>? domains;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListDomainsResult({
    this.domains,
    this.nextToken,
  });

  factory ListDomainsResult.fromJson(Map<String, dynamic> json) {
    return ListDomainsResult(
      domains: (json['domains'] as List?)
          ?.whereNotNull()
          .map((e) => DomainSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domains = this.domains;
    final nextToken = this.nextToken;
    return {
      if (domains != null) 'domains': domains,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPackageGroupsResult {
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  /// The list of package groups in the requested domain.
  final List<PackageGroupSummary>? packageGroups;

  ListPackageGroupsResult({
    this.nextToken,
    this.packageGroups,
  });

  factory ListPackageGroupsResult.fromJson(Map<String, dynamic> json) {
    return ListPackageGroupsResult(
      nextToken: json['nextToken'] as String?,
      packageGroups: (json['packageGroups'] as List?)
          ?.whereNotNull()
          .map((e) => PackageGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final packageGroups = this.packageGroups;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (packageGroups != null) 'packageGroups': packageGroups,
    };
  }
}

class ListPackageVersionAssetsResult {
  /// The returned list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_AssetSummary.html">AssetSummary</a>
  /// objects.
  final List<AssetSummary>? assets;

  /// The format of the package that contains the requested package version
  /// assets.
  final PackageFormat? format;

  /// The namespace of the package version that contains the requested package
  /// version assets. The package component that specifies its namespace depends
  /// on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The name of the package that contains the requested package version assets.
  final String? package;

  /// The version of the package associated with the requested assets.
  final String? version;

  /// The current revision associated with the package version.
  final String? versionRevision;

  ListPackageVersionAssetsResult({
    this.assets,
    this.format,
    this.namespace,
    this.nextToken,
    this.package,
    this.version,
    this.versionRevision,
  });

  factory ListPackageVersionAssetsResult.fromJson(Map<String, dynamic> json) {
    return ListPackageVersionAssetsResult(
      assets: (json['assets'] as List?)
          ?.whereNotNull()
          .map((e) => AssetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      format: (json['format'] as String?)?.toPackageFormat(),
      namespace: json['namespace'] as String?,
      nextToken: json['nextToken'] as String?,
      package: json['package'] as String?,
      version: json['version'] as String?,
      versionRevision: json['versionRevision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assets = this.assets;
    final format = this.format;
    final namespace = this.namespace;
    final nextToken = this.nextToken;
    final package = this.package;
    final version = this.version;
    final versionRevision = this.versionRevision;
    return {
      if (assets != null) 'assets': assets,
      if (format != null) 'format': format.toValue(),
      if (namespace != null) 'namespace': namespace,
      if (nextToken != null) 'nextToken': nextToken,
      if (package != null) 'package': package,
      if (version != null) 'version': version,
      if (versionRevision != null) 'versionRevision': versionRevision,
    };
  }
}

class ListPackageVersionDependenciesResult {
  /// The returned list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageDependency.html">PackageDependency</a>
  /// objects.
  final List<PackageDependency>? dependencies;

  /// A format that specifies the type of the package that contains the returned
  /// dependencies.
  final PackageFormat? format;

  /// The namespace of the package version that contains the returned
  /// dependencies. The package component that specifies its namespace depends on
  /// its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  /// The name of the package that contains the returned package versions
  /// dependencies.
  final String? package;

  /// The version of the package that is specified in the request.
  final String? version;

  /// The current revision associated with the package version.
  final String? versionRevision;

  ListPackageVersionDependenciesResult({
    this.dependencies,
    this.format,
    this.namespace,
    this.nextToken,
    this.package,
    this.version,
    this.versionRevision,
  });

  factory ListPackageVersionDependenciesResult.fromJson(
      Map<String, dynamic> json) {
    return ListPackageVersionDependenciesResult(
      dependencies: (json['dependencies'] as List?)
          ?.whereNotNull()
          .map((e) => PackageDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      format: (json['format'] as String?)?.toPackageFormat(),
      namespace: json['namespace'] as String?,
      nextToken: json['nextToken'] as String?,
      package: json['package'] as String?,
      version: json['version'] as String?,
      versionRevision: json['versionRevision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dependencies = this.dependencies;
    final format = this.format;
    final namespace = this.namespace;
    final nextToken = this.nextToken;
    final package = this.package;
    final version = this.version;
    final versionRevision = this.versionRevision;
    return {
      if (dependencies != null) 'dependencies': dependencies,
      if (format != null) 'format': format.toValue(),
      if (namespace != null) 'namespace': namespace,
      if (nextToken != null) 'nextToken': nextToken,
      if (package != null) 'package': package,
      if (version != null) 'version': version,
      if (versionRevision != null) 'versionRevision': versionRevision,
    };
  }
}

class ListPackageVersionsResult {
  /// The default package version to display. This depends on the package format:
  ///
  /// <ul>
  /// <li>
  /// For Maven and PyPI packages, it's the most recently published package
  /// version.
  /// </li>
  /// <li>
  /// For npm packages, it's the version referenced by the <code>latest</code>
  /// tag. If the <code>latest</code> tag is not set, it's the most recently
  /// published package version.
  /// </li>
  /// </ul>
  final String? defaultDisplayVersion;

  /// A format of the package.
  final PackageFormat? format;

  /// The namespace of the package that contains the requested package versions.
  /// The package component that specifies its namespace depends on its type. For
  /// example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The name of the package.
  final String? package;

  /// The returned list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionSummary.html">PackageVersionSummary</a>
  /// objects.
  final List<PackageVersionSummary>? versions;

  ListPackageVersionsResult({
    this.defaultDisplayVersion,
    this.format,
    this.namespace,
    this.nextToken,
    this.package,
    this.versions,
  });

  factory ListPackageVersionsResult.fromJson(Map<String, dynamic> json) {
    return ListPackageVersionsResult(
      defaultDisplayVersion: json['defaultDisplayVersion'] as String?,
      format: (json['format'] as String?)?.toPackageFormat(),
      namespace: json['namespace'] as String?,
      nextToken: json['nextToken'] as String?,
      package: json['package'] as String?,
      versions: (json['versions'] as List?)
          ?.whereNotNull()
          .map((e) => PackageVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultDisplayVersion = this.defaultDisplayVersion;
    final format = this.format;
    final namespace = this.namespace;
    final nextToken = this.nextToken;
    final package = this.package;
    final versions = this.versions;
    return {
      if (defaultDisplayVersion != null)
        'defaultDisplayVersion': defaultDisplayVersion,
      if (format != null) 'format': format.toValue(),
      if (namespace != null) 'namespace': namespace,
      if (nextToken != null) 'nextToken': nextToken,
      if (package != null) 'package': package,
      if (versions != null) 'versions': versions,
    };
  }
}

class ListPackagesResult {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The list of returned <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageSummary.html">PackageSummary</a>
  /// objects.
  final List<PackageSummary>? packages;

  ListPackagesResult({
    this.nextToken,
    this.packages,
  });

  factory ListPackagesResult.fromJson(Map<String, dynamic> json) {
    return ListPackagesResult(
      nextToken: json['nextToken'] as String?,
      packages: (json['packages'] as List?)
          ?.whereNotNull()
          .map((e) => PackageSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final packages = this.packages;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (packages != null) 'packages': packages,
    };
  }
}

class ListRepositoriesInDomainResult {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The returned list of repositories.
  final List<RepositorySummary>? repositories;

  ListRepositoriesInDomainResult({
    this.nextToken,
    this.repositories,
  });

  factory ListRepositoriesInDomainResult.fromJson(Map<String, dynamic> json) {
    return ListRepositoriesInDomainResult(
      nextToken: json['nextToken'] as String?,
      repositories: (json['repositories'] as List?)
          ?.whereNotNull()
          .map((e) => RepositorySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final repositories = this.repositories;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (repositories != null) 'repositories': repositories,
    };
  }
}

class ListRepositoriesResult {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The returned list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_RepositorySummary.html">RepositorySummary</a>
  /// objects.
  final List<RepositorySummary>? repositories;

  ListRepositoriesResult({
    this.nextToken,
    this.repositories,
  });

  factory ListRepositoriesResult.fromJson(Map<String, dynamic> json) {
    return ListRepositoriesResult(
      nextToken: json['nextToken'] as String?,
      repositories: (json['repositories'] as List?)
          ?.whereNotNull()
          .map((e) => RepositorySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final repositories = this.repositories;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (repositories != null) 'repositories': repositories,
    };
  }
}

class ListSubPackageGroupsResult {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// A list of sub package groups for the requested package group.
  final List<PackageGroupSummary>? packageGroups;

  ListSubPackageGroupsResult({
    this.nextToken,
    this.packageGroups,
  });

  factory ListSubPackageGroupsResult.fromJson(Map<String, dynamic> json) {
    return ListSubPackageGroupsResult(
      nextToken: json['nextToken'] as String?,
      packageGroups: (json['packageGroups'] as List?)
          ?.whereNotNull()
          .map((e) => PackageGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final packageGroups = this.packageGroups;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (packageGroups != null) 'packageGroups': packageGroups,
    };
  }
}

class ListTagsForResourceResult {
  /// A list of tag key and value pairs associated with the specified resource.
  final List<Tag>? tags;

  ListTagsForResourceResult({
    this.tags,
  });

  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResult(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// Details about a package dependency.
class PackageDependency {
  /// The type of a package dependency. The possible values depend on the package
  /// type.
  ///
  /// <ul>
  /// <li>
  /// npm: <code>regular</code>, <code>dev</code>, <code>peer</code>,
  /// <code>optional</code>
  /// </li>
  /// <li>
  /// maven: <code>optional</code>, <code>parent</code>, <code>compile</code>,
  /// <code>runtime</code>, <code>test</code>, <code>system</code>,
  /// <code>provided</code>.
  /// <note>
  /// Note that <code>parent</code> is not a regular Maven dependency type;
  /// instead this is extracted from the <code>&lt;parent&gt;</code> element if
  /// one is defined in the package version's POM file.
  /// </note> </li>
  /// <li>
  /// nuget: The <code>dependencyType</code> field is never set for NuGet
  /// packages.
  /// </li>
  /// <li>
  /// pypi: <code>Requires-Dist</code>
  /// </li>
  /// </ul>
  final String? dependencyType;

  /// The namespace of the package that this package depends on. The package
  /// component that specifies its namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// The name of the package that this package depends on.
  final String? package;

  /// The required version, or version range, of the package that this package
  /// depends on. The version format is specific to the package type. For example,
  /// the following are possible valid required versions: <code>1.2.3</code>,
  /// <code>^2.3.4</code>, or <code>4.x</code>.
  final String? versionRequirement;

  PackageDependency({
    this.dependencyType,
    this.namespace,
    this.package,
    this.versionRequirement,
  });

  factory PackageDependency.fromJson(Map<String, dynamic> json) {
    return PackageDependency(
      dependencyType: json['dependencyType'] as String?,
      namespace: json['namespace'] as String?,
      package: json['package'] as String?,
      versionRequirement: json['versionRequirement'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dependencyType = this.dependencyType;
    final namespace = this.namespace;
    final package = this.package;
    final versionRequirement = this.versionRequirement;
    return {
      if (dependencyType != null) 'dependencyType': dependencyType,
      if (namespace != null) 'namespace': namespace,
      if (package != null) 'package': package,
      if (versionRequirement != null) 'versionRequirement': versionRequirement,
    };
  }
}

/// Details about a package.
class PackageDescription {
  /// A format that specifies the type of the package.
  final PackageFormat? format;

  /// The name of the package.
  final String? name;

  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// The package origin configuration for the package.
  final PackageOriginConfiguration? originConfiguration;

  PackageDescription({
    this.format,
    this.name,
    this.namespace,
    this.originConfiguration,
  });

  factory PackageDescription.fromJson(Map<String, dynamic> json) {
    return PackageDescription(
      format: (json['format'] as String?)?.toPackageFormat(),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      originConfiguration: json['originConfiguration'] != null
          ? PackageOriginConfiguration.fromJson(
              json['originConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final name = this.name;
    final namespace = this.namespace;
    final originConfiguration = this.originConfiguration;
    return {
      if (format != null) 'format': format.toValue(),
      if (name != null) 'name': name,
      if (namespace != null) 'namespace': namespace,
      if (originConfiguration != null)
        'originConfiguration': originConfiguration,
    };
  }
}

enum PackageFormat {
  npm,
  pypi,
  maven,
  nuget,
  generic,
  ruby,
  swift,
}

extension PackageFormatValueExtension on PackageFormat {
  String toValue() {
    switch (this) {
      case PackageFormat.npm:
        return 'npm';
      case PackageFormat.pypi:
        return 'pypi';
      case PackageFormat.maven:
        return 'maven';
      case PackageFormat.nuget:
        return 'nuget';
      case PackageFormat.generic:
        return 'generic';
      case PackageFormat.ruby:
        return 'ruby';
      case PackageFormat.swift:
        return 'swift';
    }
  }
}

extension PackageFormatFromString on String {
  PackageFormat toPackageFormat() {
    switch (this) {
      case 'npm':
        return PackageFormat.npm;
      case 'pypi':
        return PackageFormat.pypi;
      case 'maven':
        return PackageFormat.maven;
      case 'nuget':
        return PackageFormat.nuget;
      case 'generic':
        return PackageFormat.generic;
      case 'ruby':
        return PackageFormat.ruby;
      case 'swift':
        return PackageFormat.swift;
    }
    throw Exception('$this is not known in enum PackageFormat');
  }
}

/// Details about an allowed repository for a package group, including its name
/// and origin configuration.
class PackageGroupAllowedRepository {
  /// The origin configuration restriction type of the allowed repository.
  final PackageGroupOriginRestrictionType? originRestrictionType;

  /// The name of the allowed repository.
  final String? repositoryName;

  PackageGroupAllowedRepository({
    this.originRestrictionType,
    this.repositoryName,
  });

  Map<String, dynamic> toJson() {
    final originRestrictionType = this.originRestrictionType;
    final repositoryName = this.repositoryName;
    return {
      if (originRestrictionType != null)
        'originRestrictionType': originRestrictionType.toValue(),
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

enum PackageGroupAllowedRepositoryUpdateType {
  added,
  removed,
}

extension PackageGroupAllowedRepositoryUpdateTypeValueExtension
    on PackageGroupAllowedRepositoryUpdateType {
  String toValue() {
    switch (this) {
      case PackageGroupAllowedRepositoryUpdateType.added:
        return 'ADDED';
      case PackageGroupAllowedRepositoryUpdateType.removed:
        return 'REMOVED';
    }
  }
}

extension PackageGroupAllowedRepositoryUpdateTypeFromString on String {
  PackageGroupAllowedRepositoryUpdateType
      toPackageGroupAllowedRepositoryUpdateType() {
    switch (this) {
      case 'ADDED':
        return PackageGroupAllowedRepositoryUpdateType.added;
      case 'REMOVED':
        return PackageGroupAllowedRepositoryUpdateType.removed;
    }
    throw Exception(
        '$this is not known in enum PackageGroupAllowedRepositoryUpdateType');
  }
}

enum PackageGroupAssociationType {
  strong,
  weak,
}

extension PackageGroupAssociationTypeValueExtension
    on PackageGroupAssociationType {
  String toValue() {
    switch (this) {
      case PackageGroupAssociationType.strong:
        return 'STRONG';
      case PackageGroupAssociationType.weak:
        return 'WEAK';
    }
  }
}

extension PackageGroupAssociationTypeFromString on String {
  PackageGroupAssociationType toPackageGroupAssociationType() {
    switch (this) {
      case 'STRONG':
        return PackageGroupAssociationType.strong;
      case 'WEAK':
        return PackageGroupAssociationType.weak;
    }
    throw Exception('$this is not known in enum PackageGroupAssociationType');
  }
}

/// The description of the package group.
class PackageGroupDescription {
  /// The ARN of the package group.
  final String? arn;

  /// The contact information of the package group.
  final String? contactInfo;

  /// A timestamp that represents the date and time the package group was created.
  final DateTime? createdTime;

  /// The description of the package group.
  final String? description;

  /// The name of the domain that contains the package group.
  final String? domainName;

  /// The 12-digit account number of the Amazon Web Services account that owns the
  /// domain. It does not include dashes or spaces.
  final String? domainOwner;

  /// The package group origin configuration that determines how package versions
  /// can enter repositories.
  final PackageGroupOriginConfiguration? originConfiguration;

  /// The direct parent package group of the package group.
  final PackageGroupReference? parent;

  /// The pattern of the package group. The pattern determines which packages are
  /// associated with the package group.
  final String? pattern;

  PackageGroupDescription({
    this.arn,
    this.contactInfo,
    this.createdTime,
    this.description,
    this.domainName,
    this.domainOwner,
    this.originConfiguration,
    this.parent,
    this.pattern,
  });

  factory PackageGroupDescription.fromJson(Map<String, dynamic> json) {
    return PackageGroupDescription(
      arn: json['arn'] as String?,
      contactInfo: json['contactInfo'] as String?,
      createdTime: timeStampFromJson(json['createdTime']),
      description: json['description'] as String?,
      domainName: json['domainName'] as String?,
      domainOwner: json['domainOwner'] as String?,
      originConfiguration: json['originConfiguration'] != null
          ? PackageGroupOriginConfiguration.fromJson(
              json['originConfiguration'] as Map<String, dynamic>)
          : null,
      parent: json['parent'] != null
          ? PackageGroupReference.fromJson(
              json['parent'] as Map<String, dynamic>)
          : null,
      pattern: json['pattern'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final contactInfo = this.contactInfo;
    final createdTime = this.createdTime;
    final description = this.description;
    final domainName = this.domainName;
    final domainOwner = this.domainOwner;
    final originConfiguration = this.originConfiguration;
    final parent = this.parent;
    final pattern = this.pattern;
    return {
      if (arn != null) 'arn': arn,
      if (contactInfo != null) 'contactInfo': contactInfo,
      if (createdTime != null) 'createdTime': unixTimestampToJson(createdTime),
      if (description != null) 'description': description,
      if (domainName != null) 'domainName': domainName,
      if (domainOwner != null) 'domainOwner': domainOwner,
      if (originConfiguration != null)
        'originConfiguration': originConfiguration,
      if (parent != null) 'parent': parent,
      if (pattern != null) 'pattern': pattern,
    };
  }
}

/// The package group origin configuration that determines how package versions
/// can enter repositories.
class PackageGroupOriginConfiguration {
  /// The origin configuration settings that determine how package versions can
  /// enter repositories.
  final Map<PackageGroupOriginRestrictionType, PackageGroupOriginRestriction>?
      restrictions;

  PackageGroupOriginConfiguration({
    this.restrictions,
  });

  factory PackageGroupOriginConfiguration.fromJson(Map<String, dynamic> json) {
    return PackageGroupOriginConfiguration(
      restrictions: (json['restrictions'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k.toPackageGroupOriginRestrictionType(),
              PackageGroupOriginRestriction.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final restrictions = this.restrictions;
    return {
      if (restrictions != null)
        'restrictions': restrictions.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// Contains information about the configured restrictions of the origin
/// controls of a package group.
class PackageGroupOriginRestriction {
  /// The effective package group origin restriction setting. If the value of
  /// <code>mode</code> is <code>ALLOW</code>,
  /// <code>ALLOW_SPECIFIC_REPOSITORIES</code>, or <code>BLOCK</code>, then the
  /// value of <code>effectiveMode</code> is the same. Otherwise, when the value
  /// of <code>mode</code> is <code>INHERIT</code>, then the value of
  /// <code>effectiveMode</code> is the value of <code>mode</code> of the first
  /// parent group which does not have a value of <code>INHERIT</code>.
  final PackageGroupOriginRestrictionMode? effectiveMode;

  /// The parent package group that the package group origin restrictions are
  /// inherited from.
  final PackageGroupReference? inheritedFrom;

  /// The package group origin restriction setting. If the value of
  /// <code>mode</code> is <code>ALLOW</code>,
  /// <code>ALLOW_SPECIFIC_REPOSITORIES</code>, or <code>BLOCK</code>, then the
  /// value of <code>effectiveMode</code> is the same. Otherwise, when the value
  /// is <code>INHERIT</code>, then the value of <code>effectiveMode</code> is the
  /// value of <code>mode</code> of the first parent group which does not have a
  /// value of <code>INHERIT</code>.
  final PackageGroupOriginRestrictionMode? mode;

  /// The number of repositories in the allowed repository list.
  final int? repositoriesCount;

  PackageGroupOriginRestriction({
    this.effectiveMode,
    this.inheritedFrom,
    this.mode,
    this.repositoriesCount,
  });

  factory PackageGroupOriginRestriction.fromJson(Map<String, dynamic> json) {
    return PackageGroupOriginRestriction(
      effectiveMode: (json['effectiveMode'] as String?)
          ?.toPackageGroupOriginRestrictionMode(),
      inheritedFrom: json['inheritedFrom'] != null
          ? PackageGroupReference.fromJson(
              json['inheritedFrom'] as Map<String, dynamic>)
          : null,
      mode: (json['mode'] as String?)?.toPackageGroupOriginRestrictionMode(),
      repositoriesCount: json['repositoriesCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final effectiveMode = this.effectiveMode;
    final inheritedFrom = this.inheritedFrom;
    final mode = this.mode;
    final repositoriesCount = this.repositoriesCount;
    return {
      if (effectiveMode != null) 'effectiveMode': effectiveMode.toValue(),
      if (inheritedFrom != null) 'inheritedFrom': inheritedFrom,
      if (mode != null) 'mode': mode.toValue(),
      if (repositoriesCount != null) 'repositoriesCount': repositoriesCount,
    };
  }
}

enum PackageGroupOriginRestrictionMode {
  allow,
  allowSpecificRepositories,
  block,
  inherit,
}

extension PackageGroupOriginRestrictionModeValueExtension
    on PackageGroupOriginRestrictionMode {
  String toValue() {
    switch (this) {
      case PackageGroupOriginRestrictionMode.allow:
        return 'ALLOW';
      case PackageGroupOriginRestrictionMode.allowSpecificRepositories:
        return 'ALLOW_SPECIFIC_REPOSITORIES';
      case PackageGroupOriginRestrictionMode.block:
        return 'BLOCK';
      case PackageGroupOriginRestrictionMode.inherit:
        return 'INHERIT';
    }
  }
}

extension PackageGroupOriginRestrictionModeFromString on String {
  PackageGroupOriginRestrictionMode toPackageGroupOriginRestrictionMode() {
    switch (this) {
      case 'ALLOW':
        return PackageGroupOriginRestrictionMode.allow;
      case 'ALLOW_SPECIFIC_REPOSITORIES':
        return PackageGroupOriginRestrictionMode.allowSpecificRepositories;
      case 'BLOCK':
        return PackageGroupOriginRestrictionMode.block;
      case 'INHERIT':
        return PackageGroupOriginRestrictionMode.inherit;
    }
    throw Exception(
        '$this is not known in enum PackageGroupOriginRestrictionMode');
  }
}

enum PackageGroupOriginRestrictionType {
  externalUpstream,
  internalUpstream,
  publish,
}

extension PackageGroupOriginRestrictionTypeValueExtension
    on PackageGroupOriginRestrictionType {
  String toValue() {
    switch (this) {
      case PackageGroupOriginRestrictionType.externalUpstream:
        return 'EXTERNAL_UPSTREAM';
      case PackageGroupOriginRestrictionType.internalUpstream:
        return 'INTERNAL_UPSTREAM';
      case PackageGroupOriginRestrictionType.publish:
        return 'PUBLISH';
    }
  }
}

extension PackageGroupOriginRestrictionTypeFromString on String {
  PackageGroupOriginRestrictionType toPackageGroupOriginRestrictionType() {
    switch (this) {
      case 'EXTERNAL_UPSTREAM':
        return PackageGroupOriginRestrictionType.externalUpstream;
      case 'INTERNAL_UPSTREAM':
        return PackageGroupOriginRestrictionType.internalUpstream;
      case 'PUBLISH':
        return PackageGroupOriginRestrictionType.publish;
    }
    throw Exception(
        '$this is not known in enum PackageGroupOriginRestrictionType');
  }
}

/// Information about the identifiers of a package group.
class PackageGroupReference {
  /// The ARN of the package group.
  final String? arn;

  /// The pattern of the package group. The pattern determines which packages are
  /// associated with the package group, and is also the identifier of the package
  /// group.
  final String? pattern;

  PackageGroupReference({
    this.arn,
    this.pattern,
  });

  factory PackageGroupReference.fromJson(Map<String, dynamic> json) {
    return PackageGroupReference(
      arn: json['arn'] as String?,
      pattern: json['pattern'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final pattern = this.pattern;
    return {
      if (arn != null) 'arn': arn,
      if (pattern != null) 'pattern': pattern,
    };
  }
}

/// Details about a package group.
class PackageGroupSummary {
  /// The ARN of the package group.
  final String? arn;

  /// The contact information of the package group.
  final String? contactInfo;

  /// A timestamp that represents the date and time the repository was created.
  final DateTime? createdTime;

  /// The description of the package group.
  final String? description;

  /// The domain that contains the package group.
  final String? domainName;

  /// The 12-digit account number of the Amazon Web Services account that owns the
  /// domain. It does not include dashes or spaces.
  final String? domainOwner;

  /// Details about the package origin configuration of a package group.
  final PackageGroupOriginConfiguration? originConfiguration;

  /// The direct parent package group of the package group.
  final PackageGroupReference? parent;

  /// The pattern of the package group. The pattern determines which packages are
  /// associated with the package group.
  final String? pattern;

  PackageGroupSummary({
    this.arn,
    this.contactInfo,
    this.createdTime,
    this.description,
    this.domainName,
    this.domainOwner,
    this.originConfiguration,
    this.parent,
    this.pattern,
  });

  factory PackageGroupSummary.fromJson(Map<String, dynamic> json) {
    return PackageGroupSummary(
      arn: json['arn'] as String?,
      contactInfo: json['contactInfo'] as String?,
      createdTime: timeStampFromJson(json['createdTime']),
      description: json['description'] as String?,
      domainName: json['domainName'] as String?,
      domainOwner: json['domainOwner'] as String?,
      originConfiguration: json['originConfiguration'] != null
          ? PackageGroupOriginConfiguration.fromJson(
              json['originConfiguration'] as Map<String, dynamic>)
          : null,
      parent: json['parent'] != null
          ? PackageGroupReference.fromJson(
              json['parent'] as Map<String, dynamic>)
          : null,
      pattern: json['pattern'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final contactInfo = this.contactInfo;
    final createdTime = this.createdTime;
    final description = this.description;
    final domainName = this.domainName;
    final domainOwner = this.domainOwner;
    final originConfiguration = this.originConfiguration;
    final parent = this.parent;
    final pattern = this.pattern;
    return {
      if (arn != null) 'arn': arn,
      if (contactInfo != null) 'contactInfo': contactInfo,
      if (createdTime != null) 'createdTime': unixTimestampToJson(createdTime),
      if (description != null) 'description': description,
      if (domainName != null) 'domainName': domainName,
      if (domainOwner != null) 'domainOwner': domainOwner,
      if (originConfiguration != null)
        'originConfiguration': originConfiguration,
      if (parent != null) 'parent': parent,
      if (pattern != null) 'pattern': pattern,
    };
  }
}

/// Details about the package origin configuration of a package.
class PackageOriginConfiguration {
  /// A <code>PackageOriginRestrictions</code> object that contains information
  /// about the upstream and publish package origin configuration for the package.
  final PackageOriginRestrictions? restrictions;

  PackageOriginConfiguration({
    this.restrictions,
  });

  factory PackageOriginConfiguration.fromJson(Map<String, dynamic> json) {
    return PackageOriginConfiguration(
      restrictions: json['restrictions'] != null
          ? PackageOriginRestrictions.fromJson(
              json['restrictions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final restrictions = this.restrictions;
    return {
      if (restrictions != null) 'restrictions': restrictions,
    };
  }
}

/// Details about the origin restrictions set on the package. The package origin
/// restrictions determine how new versions of a package can be added to a
/// specific repository.
class PackageOriginRestrictions {
  /// The package origin configuration that determines if new versions of the
  /// package can be published directly to the repository.
  final AllowPublish publish;

  /// The package origin configuration that determines if new versions of the
  /// package can be added to the repository from an external connection or
  /// upstream source.
  final AllowUpstream upstream;

  PackageOriginRestrictions({
    required this.publish,
    required this.upstream,
  });

  factory PackageOriginRestrictions.fromJson(Map<String, dynamic> json) {
    return PackageOriginRestrictions(
      publish: (json['publish'] as String).toAllowPublish(),
      upstream: (json['upstream'] as String).toAllowUpstream(),
    );
  }

  Map<String, dynamic> toJson() {
    final publish = this.publish;
    final upstream = this.upstream;
    return {
      'publish': publish.toValue(),
      'upstream': upstream.toValue(),
    };
  }
}

/// Details about a package, including its format, namespace, and name.
class PackageSummary {
  /// The format of the package.
  final PackageFormat? format;

  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// A <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageOriginConfiguration.html">PackageOriginConfiguration</a>
  /// object that contains a <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageOriginRestrictions.html">PackageOriginRestrictions</a>
  /// object that contains information about the upstream and publish package
  /// origin restrictions.
  final PackageOriginConfiguration? originConfiguration;

  /// The name of the package.
  final String? package;

  PackageSummary({
    this.format,
    this.namespace,
    this.originConfiguration,
    this.package,
  });

  factory PackageSummary.fromJson(Map<String, dynamic> json) {
    return PackageSummary(
      format: (json['format'] as String?)?.toPackageFormat(),
      namespace: json['namespace'] as String?,
      originConfiguration: json['originConfiguration'] != null
          ? PackageOriginConfiguration.fromJson(
              json['originConfiguration'] as Map<String, dynamic>)
          : null,
      package: json['package'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final namespace = this.namespace;
    final originConfiguration = this.originConfiguration;
    final package = this.package;
    return {
      if (format != null) 'format': format.toValue(),
      if (namespace != null) 'namespace': namespace,
      if (originConfiguration != null)
        'originConfiguration': originConfiguration,
      if (package != null) 'package': package,
    };
  }
}

/// Details about a package version.
class PackageVersionDescription {
  /// The name of the package that is displayed. The <code>displayName</code>
  /// varies depending on the package version's format. For example, if an npm
  /// package is named <code>ui</code>, is in the namespace <code>vue</code>, and
  /// has the format <code>npm</code>, then the <code>displayName</code> is
  /// <code>@vue/ui</code>.
  final String? displayName;

  /// The format of the package version.
  final PackageFormat? format;

  /// The homepage associated with the package.
  final String? homePage;

  /// Information about licenses associated with the package version.
  final List<LicenseInfo>? licenses;

  /// The namespace of the package version. The package component that specifies
  /// its namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package version is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm or Swift package version is its <code>scope</code>.
  /// </li>
  /// <li>
  /// The namespace of a generic package is its <code>namespace</code>.
  /// </li>
  /// <li>
  /// Python, NuGet, and Ruby package versions do not contain a corresponding
  /// component, package versions of those formats do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// A <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionOrigin.html">PackageVersionOrigin</a>
  /// object that contains information about how the package version was added to
  /// the repository.
  final PackageVersionOrigin? origin;

  /// The name of the requested package.
  final String? packageName;

  /// A timestamp that contains the date and time the package version was
  /// published.
  final DateTime? publishedTime;

  /// The revision of the package version.
  final String? revision;

  /// The repository for the source code in the package version, or the source
  /// code used to build it.
  final String? sourceCodeRepository;

  /// A string that contains the status of the package version.
  final PackageVersionStatus? status;

  /// A summary of the package version. The summary is extracted from the package.
  /// The information in and detail level of the summary depends on the package
  /// version's format.
  final String? summary;

  /// The version of the package.
  final String? version;

  PackageVersionDescription({
    this.displayName,
    this.format,
    this.homePage,
    this.licenses,
    this.namespace,
    this.origin,
    this.packageName,
    this.publishedTime,
    this.revision,
    this.sourceCodeRepository,
    this.status,
    this.summary,
    this.version,
  });

  factory PackageVersionDescription.fromJson(Map<String, dynamic> json) {
    return PackageVersionDescription(
      displayName: json['displayName'] as String?,
      format: (json['format'] as String?)?.toPackageFormat(),
      homePage: json['homePage'] as String?,
      licenses: (json['licenses'] as List?)
          ?.whereNotNull()
          .map((e) => LicenseInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      namespace: json['namespace'] as String?,
      origin: json['origin'] != null
          ? PackageVersionOrigin.fromJson(
              json['origin'] as Map<String, dynamic>)
          : null,
      packageName: json['packageName'] as String?,
      publishedTime: timeStampFromJson(json['publishedTime']),
      revision: json['revision'] as String?,
      sourceCodeRepository: json['sourceCodeRepository'] as String?,
      status: (json['status'] as String?)?.toPackageVersionStatus(),
      summary: json['summary'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final format = this.format;
    final homePage = this.homePage;
    final licenses = this.licenses;
    final namespace = this.namespace;
    final origin = this.origin;
    final packageName = this.packageName;
    final publishedTime = this.publishedTime;
    final revision = this.revision;
    final sourceCodeRepository = this.sourceCodeRepository;
    final status = this.status;
    final summary = this.summary;
    final version = this.version;
    return {
      if (displayName != null) 'displayName': displayName,
      if (format != null) 'format': format.toValue(),
      if (homePage != null) 'homePage': homePage,
      if (licenses != null) 'licenses': licenses,
      if (namespace != null) 'namespace': namespace,
      if (origin != null) 'origin': origin,
      if (packageName != null) 'packageName': packageName,
      if (publishedTime != null)
        'publishedTime': unixTimestampToJson(publishedTime),
      if (revision != null) 'revision': revision,
      if (sourceCodeRepository != null)
        'sourceCodeRepository': sourceCodeRepository,
      if (status != null) 'status': status.toValue(),
      if (summary != null) 'summary': summary,
      if (version != null) 'version': version,
    };
  }
}

/// l An error associated with package.
class PackageVersionError {
  /// The error code associated with the error. Valid error codes are:
  ///
  /// <ul>
  /// <li>
  /// <code>ALREADY_EXISTS</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_REVISION</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_STATUS</code>
  /// </li>
  /// <li>
  /// <code>NOT_ALLOWED</code>
  /// </li>
  /// <li>
  /// <code>NOT_FOUND</code>
  /// </li>
  /// <li>
  /// <code>SKIPPED</code>
  /// </li>
  /// </ul>
  final PackageVersionErrorCode? errorCode;

  /// The error message associated with the error.
  final String? errorMessage;

  PackageVersionError({
    this.errorCode,
    this.errorMessage,
  });

  factory PackageVersionError.fromJson(Map<String, dynamic> json) {
    return PackageVersionError(
      errorCode: (json['errorCode'] as String?)?.toPackageVersionErrorCode(),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

enum PackageVersionErrorCode {
  alreadyExists,
  mismatchedRevision,
  mismatchedStatus,
  notAllowed,
  notFound,
  skipped,
}

extension PackageVersionErrorCodeValueExtension on PackageVersionErrorCode {
  String toValue() {
    switch (this) {
      case PackageVersionErrorCode.alreadyExists:
        return 'ALREADY_EXISTS';
      case PackageVersionErrorCode.mismatchedRevision:
        return 'MISMATCHED_REVISION';
      case PackageVersionErrorCode.mismatchedStatus:
        return 'MISMATCHED_STATUS';
      case PackageVersionErrorCode.notAllowed:
        return 'NOT_ALLOWED';
      case PackageVersionErrorCode.notFound:
        return 'NOT_FOUND';
      case PackageVersionErrorCode.skipped:
        return 'SKIPPED';
    }
  }
}

extension PackageVersionErrorCodeFromString on String {
  PackageVersionErrorCode toPackageVersionErrorCode() {
    switch (this) {
      case 'ALREADY_EXISTS':
        return PackageVersionErrorCode.alreadyExists;
      case 'MISMATCHED_REVISION':
        return PackageVersionErrorCode.mismatchedRevision;
      case 'MISMATCHED_STATUS':
        return PackageVersionErrorCode.mismatchedStatus;
      case 'NOT_ALLOWED':
        return PackageVersionErrorCode.notAllowed;
      case 'NOT_FOUND':
        return PackageVersionErrorCode.notFound;
      case 'SKIPPED':
        return PackageVersionErrorCode.skipped;
    }
    throw Exception('$this is not known in enum PackageVersionErrorCode');
  }
}

/// Information about how a package version was added to a repository.
class PackageVersionOrigin {
  /// A <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_DomainEntryPoint.html">DomainEntryPoint</a>
  /// object that contains information about from which repository or external
  /// connection the package version was added to the domain.
  final DomainEntryPoint? domainEntryPoint;

  /// Describes how the package version was originally added to the domain. An
  /// <code>INTERNAL</code> origin type means the package version was published
  /// directly to a repository in the domain. An <code>EXTERNAL</code> origin type
  /// means the package version was ingested from an external connection.
  final PackageVersionOriginType? originType;

  PackageVersionOrigin({
    this.domainEntryPoint,
    this.originType,
  });

  factory PackageVersionOrigin.fromJson(Map<String, dynamic> json) {
    return PackageVersionOrigin(
      domainEntryPoint: json['domainEntryPoint'] != null
          ? DomainEntryPoint.fromJson(
              json['domainEntryPoint'] as Map<String, dynamic>)
          : null,
      originType: (json['originType'] as String?)?.toPackageVersionOriginType(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainEntryPoint = this.domainEntryPoint;
    final originType = this.originType;
    return {
      if (domainEntryPoint != null) 'domainEntryPoint': domainEntryPoint,
      if (originType != null) 'originType': originType.toValue(),
    };
  }
}

enum PackageVersionOriginType {
  internal,
  external,
  unknown,
}

extension PackageVersionOriginTypeValueExtension on PackageVersionOriginType {
  String toValue() {
    switch (this) {
      case PackageVersionOriginType.internal:
        return 'INTERNAL';
      case PackageVersionOriginType.external:
        return 'EXTERNAL';
      case PackageVersionOriginType.unknown:
        return 'UNKNOWN';
    }
  }
}

extension PackageVersionOriginTypeFromString on String {
  PackageVersionOriginType toPackageVersionOriginType() {
    switch (this) {
      case 'INTERNAL':
        return PackageVersionOriginType.internal;
      case 'EXTERNAL':
        return PackageVersionOriginType.external;
      case 'UNKNOWN':
        return PackageVersionOriginType.unknown;
    }
    throw Exception('$this is not known in enum PackageVersionOriginType');
  }
}

enum PackageVersionSortType {
  publishedTime,
}

extension PackageVersionSortTypeValueExtension on PackageVersionSortType {
  String toValue() {
    switch (this) {
      case PackageVersionSortType.publishedTime:
        return 'PUBLISHED_TIME';
    }
  }
}

extension PackageVersionSortTypeFromString on String {
  PackageVersionSortType toPackageVersionSortType() {
    switch (this) {
      case 'PUBLISHED_TIME':
        return PackageVersionSortType.publishedTime;
    }
    throw Exception('$this is not known in enum PackageVersionSortType');
  }
}

enum PackageVersionStatus {
  published,
  unfinished,
  unlisted,
  archived,
  disposed,
  deleted,
}

extension PackageVersionStatusValueExtension on PackageVersionStatus {
  String toValue() {
    switch (this) {
      case PackageVersionStatus.published:
        return 'Published';
      case PackageVersionStatus.unfinished:
        return 'Unfinished';
      case PackageVersionStatus.unlisted:
        return 'Unlisted';
      case PackageVersionStatus.archived:
        return 'Archived';
      case PackageVersionStatus.disposed:
        return 'Disposed';
      case PackageVersionStatus.deleted:
        return 'Deleted';
    }
  }
}

extension PackageVersionStatusFromString on String {
  PackageVersionStatus toPackageVersionStatus() {
    switch (this) {
      case 'Published':
        return PackageVersionStatus.published;
      case 'Unfinished':
        return PackageVersionStatus.unfinished;
      case 'Unlisted':
        return PackageVersionStatus.unlisted;
      case 'Archived':
        return PackageVersionStatus.archived;
      case 'Disposed':
        return PackageVersionStatus.disposed;
      case 'Deleted':
        return PackageVersionStatus.deleted;
    }
    throw Exception('$this is not known in enum PackageVersionStatus');
  }
}

/// Details about a package version, including its status, version, and
/// revision. The <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html">ListPackageVersions</a>
/// operation returns a list of <code>PackageVersionSummary</code> objects.
class PackageVersionSummary {
  /// A string that contains the status of the package version. It can be one of
  /// the following:
  final PackageVersionStatus status;

  /// Information about a package version.
  final String version;

  /// A <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionOrigin.html">PackageVersionOrigin</a>
  /// object that contains information about how the package version was added to
  /// the repository.
  final PackageVersionOrigin? origin;

  /// The revision associated with a package version.
  final String? revision;

  PackageVersionSummary({
    required this.status,
    required this.version,
    this.origin,
    this.revision,
  });

  factory PackageVersionSummary.fromJson(Map<String, dynamic> json) {
    return PackageVersionSummary(
      status: (json['status'] as String).toPackageVersionStatus(),
      version: json['version'] as String,
      origin: json['origin'] != null
          ? PackageVersionOrigin.fromJson(
              json['origin'] as Map<String, dynamic>)
          : null,
      revision: json['revision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final version = this.version;
    final origin = this.origin;
    final revision = this.revision;
    return {
      'status': status.toValue(),
      'version': version,
      if (origin != null) 'origin': origin,
      if (revision != null) 'revision': revision,
    };
  }
}

class PublishPackageVersionResult {
  /// An <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_AssetSummary.html">AssetSummary</a>
  /// for the published asset.
  final AssetSummary? asset;

  /// The format of the package version.
  final PackageFormat? format;

  /// The namespace of the package version.
  final String? namespace;

  /// The name of the package.
  final String? package;

  /// A string that contains the status of the package version. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/packages-overview.html#package-version-status.html#package-version-status">Package
  /// version status</a> in the <i>CodeArtifact User Guide</i>.
  final PackageVersionStatus? status;

  /// The version of the package.
  final String? version;

  /// The revision of the package version.
  final String? versionRevision;

  PublishPackageVersionResult({
    this.asset,
    this.format,
    this.namespace,
    this.package,
    this.status,
    this.version,
    this.versionRevision,
  });

  factory PublishPackageVersionResult.fromJson(Map<String, dynamic> json) {
    return PublishPackageVersionResult(
      asset: json['asset'] != null
          ? AssetSummary.fromJson(json['asset'] as Map<String, dynamic>)
          : null,
      format: (json['format'] as String?)?.toPackageFormat(),
      namespace: json['namespace'] as String?,
      package: json['package'] as String?,
      status: (json['status'] as String?)?.toPackageVersionStatus(),
      version: json['version'] as String?,
      versionRevision: json['versionRevision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final asset = this.asset;
    final format = this.format;
    final namespace = this.namespace;
    final package = this.package;
    final status = this.status;
    final version = this.version;
    final versionRevision = this.versionRevision;
    return {
      if (asset != null) 'asset': asset,
      if (format != null) 'format': format.toValue(),
      if (namespace != null) 'namespace': namespace,
      if (package != null) 'package': package,
      if (status != null) 'status': status.toValue(),
      if (version != null) 'version': version,
      if (versionRevision != null) 'versionRevision': versionRevision,
    };
  }
}

class PutDomainPermissionsPolicyResult {
  /// The resource policy that was set after processing the request.
  final ResourcePolicy? policy;

  PutDomainPermissionsPolicyResult({
    this.policy,
  });

  factory PutDomainPermissionsPolicyResult.fromJson(Map<String, dynamic> json) {
    return PutDomainPermissionsPolicyResult(
      policy: json['policy'] != null
          ? ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'policy': policy,
    };
  }
}

class PutPackageOriginConfigurationResult {
  /// A <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageOriginConfiguration.html">PackageOriginConfiguration</a>
  /// object that describes the origin configuration set for the package. It
  /// contains a <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageOriginRestrictions.html">PackageOriginRestrictions</a>
  /// object that describes how new versions of the package can be introduced to
  /// the repository.
  final PackageOriginConfiguration? originConfiguration;

  PutPackageOriginConfigurationResult({
    this.originConfiguration,
  });

  factory PutPackageOriginConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return PutPackageOriginConfigurationResult(
      originConfiguration: json['originConfiguration'] != null
          ? PackageOriginConfiguration.fromJson(
              json['originConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final originConfiguration = this.originConfiguration;
    return {
      if (originConfiguration != null)
        'originConfiguration': originConfiguration,
    };
  }
}

class PutRepositoryPermissionsPolicyResult {
  /// The resource policy that was set after processing the request.
  final ResourcePolicy? policy;

  PutRepositoryPermissionsPolicyResult({
    this.policy,
  });

  factory PutRepositoryPermissionsPolicyResult.fromJson(
      Map<String, dynamic> json) {
    return PutRepositoryPermissionsPolicyResult(
      policy: json['policy'] != null
          ? ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'policy': policy,
    };
  }
}

/// The details of a repository stored in CodeArtifact. A CodeArtifact
/// repository contains a set of package versions, each of which maps to a set
/// of assets. Repositories are polyglot—a single repository can contain
/// packages of any supported type. Each repository exposes endpoints for
/// fetching and publishing packages using tools like the <code>npm</code> CLI,
/// the Maven CLI (<code>mvn</code>), and <code>pip</code>. You can create up to
/// 100 repositories per Amazon Web Services account.
class RepositoryDescription {
  /// The 12-digit account number of the Amazon Web Services account that manages
  /// the repository.
  final String? administratorAccount;

  /// The Amazon Resource Name (ARN) of the repository.
  final String? arn;

  /// A timestamp that represents the date and time the repository was created.
  final DateTime? createdTime;

  /// A text description of the repository.
  final String? description;

  /// The name of the domain that contains the repository.
  final String? domainName;

  /// The 12-digit account number of the Amazon Web Services account that owns the
  /// domain that contains the repository. It does not include dashes or spaces.
  final String? domainOwner;

  /// An array of external connections associated with the repository.
  final List<RepositoryExternalConnectionInfo>? externalConnections;

  /// The name of the repository.
  final String? name;

  /// A list of upstream repositories to associate with the repository. The order
  /// of the upstream repositories in the list determines their priority order
  /// when CodeArtifact looks for a requested package version. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/repos-upstream.html">Working
  /// with upstream repositories</a>.
  final List<UpstreamRepositoryInfo>? upstreams;

  RepositoryDescription({
    this.administratorAccount,
    this.arn,
    this.createdTime,
    this.description,
    this.domainName,
    this.domainOwner,
    this.externalConnections,
    this.name,
    this.upstreams,
  });

  factory RepositoryDescription.fromJson(Map<String, dynamic> json) {
    return RepositoryDescription(
      administratorAccount: json['administratorAccount'] as String?,
      arn: json['arn'] as String?,
      createdTime: timeStampFromJson(json['createdTime']),
      description: json['description'] as String?,
      domainName: json['domainName'] as String?,
      domainOwner: json['domainOwner'] as String?,
      externalConnections: (json['externalConnections'] as List?)
          ?.whereNotNull()
          .map((e) => RepositoryExternalConnectionInfo.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      upstreams: (json['upstreams'] as List?)
          ?.whereNotNull()
          .map(
              (e) => UpstreamRepositoryInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final administratorAccount = this.administratorAccount;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final domainName = this.domainName;
    final domainOwner = this.domainOwner;
    final externalConnections = this.externalConnections;
    final name = this.name;
    final upstreams = this.upstreams;
    return {
      if (administratorAccount != null)
        'administratorAccount': administratorAccount,
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': unixTimestampToJson(createdTime),
      if (description != null) 'description': description,
      if (domainName != null) 'domainName': domainName,
      if (domainOwner != null) 'domainOwner': domainOwner,
      if (externalConnections != null)
        'externalConnections': externalConnections,
      if (name != null) 'name': name,
      if (upstreams != null) 'upstreams': upstreams,
    };
  }
}

/// Contains information about the external connection of a repository.
class RepositoryExternalConnectionInfo {
  /// The name of the external connection associated with a repository.
  final String? externalConnectionName;

  /// The package format associated with a repository's external connection. The
  /// valid package formats are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>: A Node Package Manager (npm) package.
  /// </li>
  /// <li>
  /// <code>pypi</code>: A Python Package Index (PyPI) package.
  /// </li>
  /// <li>
  /// <code>maven</code>: A Maven package that contains compiled code in a
  /// distributable format, such as a JAR file.
  /// </li>
  /// <li>
  /// <code>nuget</code>: A NuGet package.
  /// </li>
  /// </ul>
  final PackageFormat? packageFormat;

  /// The status of the external connection of a repository. There is one valid
  /// value, <code>Available</code>.
  final ExternalConnectionStatus? status;

  RepositoryExternalConnectionInfo({
    this.externalConnectionName,
    this.packageFormat,
    this.status,
  });

  factory RepositoryExternalConnectionInfo.fromJson(Map<String, dynamic> json) {
    return RepositoryExternalConnectionInfo(
      externalConnectionName: json['externalConnectionName'] as String?,
      packageFormat: (json['packageFormat'] as String?)?.toPackageFormat(),
      status: (json['status'] as String?)?.toExternalConnectionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final externalConnectionName = this.externalConnectionName;
    final packageFormat = this.packageFormat;
    final status = this.status;
    return {
      if (externalConnectionName != null)
        'externalConnectionName': externalConnectionName,
      if (packageFormat != null) 'packageFormat': packageFormat.toValue(),
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Details about a repository, including its Amazon Resource Name (ARN),
/// description, and domain information. The <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListRepositories.html">ListRepositories</a>
/// operation returns a list of <code>RepositorySummary</code> objects.
class RepositorySummary {
  /// The Amazon Web Services account ID that manages the repository.
  final String? administratorAccount;

  /// The ARN of the repository.
  final String? arn;

  /// A timestamp that represents the date and time the repository was created.
  final DateTime? createdTime;

  /// The description of the repository.
  final String? description;

  /// The name of the domain that contains the repository.
  final String? domainName;

  /// The 12-digit account number of the Amazon Web Services account that owns the
  /// domain. It does not include dashes or spaces.
  final String? domainOwner;

  /// The name of the repository.
  final String? name;

  RepositorySummary({
    this.administratorAccount,
    this.arn,
    this.createdTime,
    this.description,
    this.domainName,
    this.domainOwner,
    this.name,
  });

  factory RepositorySummary.fromJson(Map<String, dynamic> json) {
    return RepositorySummary(
      administratorAccount: json['administratorAccount'] as String?,
      arn: json['arn'] as String?,
      createdTime: timeStampFromJson(json['createdTime']),
      description: json['description'] as String?,
      domainName: json['domainName'] as String?,
      domainOwner: json['domainOwner'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final administratorAccount = this.administratorAccount;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final domainName = this.domainName;
    final domainOwner = this.domainOwner;
    final name = this.name;
    return {
      if (administratorAccount != null)
        'administratorAccount': administratorAccount,
      if (arn != null) 'arn': arn,
      if (createdTime != null) 'createdTime': unixTimestampToJson(createdTime),
      if (description != null) 'description': description,
      if (domainName != null) 'domainName': domainName,
      if (domainOwner != null) 'domainOwner': domainOwner,
      if (name != null) 'name': name,
    };
  }
}

/// An CodeArtifact resource policy that contains a resource ARN, document
/// details, and a revision.
class ResourcePolicy {
  /// The resource policy formatted in JSON.
  final String? document;

  /// The ARN of the resource associated with the resource policy
  final String? resourceArn;

  /// The current revision of the resource policy.
  final String? revision;

  ResourcePolicy({
    this.document,
    this.resourceArn,
    this.revision,
  });

  factory ResourcePolicy.fromJson(Map<String, dynamic> json) {
    return ResourcePolicy(
      document: json['document'] as String?,
      resourceArn: json['resourceArn'] as String?,
      revision: json['revision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    final resourceArn = this.resourceArn;
    final revision = this.revision;
    return {
      if (document != null) 'document': document,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (revision != null) 'revision': revision,
    };
  }
}

/// Contains the revision and status of a package version.
class SuccessfulPackageVersionInfo {
  /// The revision of a package version.
  final String? revision;

  /// The status of a package version.
  final PackageVersionStatus? status;

  SuccessfulPackageVersionInfo({
    this.revision,
    this.status,
  });

  factory SuccessfulPackageVersionInfo.fromJson(Map<String, dynamic> json) {
    return SuccessfulPackageVersionInfo(
      revision: json['revision'] as String?,
      status: (json['status'] as String?)?.toPackageVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final revision = this.revision;
    final status = this.status;
    return {
      if (revision != null) 'revision': revision,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// A tag is a key-value pair that can be used to manage, search for, or filter
/// resources in CodeArtifact.
class Tag {
  /// The tag key.
  final String key;

  /// The tag value.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

class TagResourceResult {
  TagResourceResult();

  factory TagResourceResult.fromJson(Map<String, dynamic> _) {
    return TagResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResult {
  UntagResourceResult();

  factory UntagResourceResult.fromJson(Map<String, dynamic> _) {
    return UntagResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdatePackageGroupOriginConfigurationResult {
  /// Information about the updated allowed repositories after processing the
  /// request.
  final Map<PackageGroupOriginRestrictionType,
          Map<PackageGroupAllowedRepositoryUpdateType, List<String>>>?
      allowedRepositoryUpdates;

  /// The package group and information about it after processing the request.
  final PackageGroupDescription? packageGroup;

  UpdatePackageGroupOriginConfigurationResult({
    this.allowedRepositoryUpdates,
    this.packageGroup,
  });

  factory UpdatePackageGroupOriginConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return UpdatePackageGroupOriginConfigurationResult(
      allowedRepositoryUpdates:
          (json['allowedRepositoryUpdates'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                  k.toPackageGroupOriginRestrictionType(),
                  (e as Map<String, dynamic>).map((k, e) => MapEntry(
                      k.toPackageGroupAllowedRepositoryUpdateType(),
                      (e as List)
                          .whereNotNull()
                          .map((e) => e as String)
                          .toList())))),
      packageGroup: json['packageGroup'] != null
          ? PackageGroupDescription.fromJson(
              json['packageGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedRepositoryUpdates = this.allowedRepositoryUpdates;
    final packageGroup = this.packageGroup;
    return {
      if (allowedRepositoryUpdates != null)
        'allowedRepositoryUpdates': allowedRepositoryUpdates.map((k, e) =>
            MapEntry(k.toValue(), e.map((k, e) => MapEntry(k.toValue(), e)))),
      if (packageGroup != null) 'packageGroup': packageGroup,
    };
  }
}

class UpdatePackageGroupResult {
  /// The package group and information about it after the request has been
  /// processed.
  final PackageGroupDescription? packageGroup;

  UpdatePackageGroupResult({
    this.packageGroup,
  });

  factory UpdatePackageGroupResult.fromJson(Map<String, dynamic> json) {
    return UpdatePackageGroupResult(
      packageGroup: json['packageGroup'] != null
          ? PackageGroupDescription.fromJson(
              json['packageGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final packageGroup = this.packageGroup;
    return {
      if (packageGroup != null) 'packageGroup': packageGroup,
    };
  }
}

class UpdatePackageVersionsStatusResult {
  /// A list of <code>SuccessfulPackageVersionInfo</code> objects, one for each
  /// package version with a status that successfully updated.
  final Map<String, PackageVersionError>? failedVersions;

  /// A list of <code>PackageVersionError</code> objects, one for each package
  /// version with a status that failed to update.
  final Map<String, SuccessfulPackageVersionInfo>? successfulVersions;

  UpdatePackageVersionsStatusResult({
    this.failedVersions,
    this.successfulVersions,
  });

  factory UpdatePackageVersionsStatusResult.fromJson(
      Map<String, dynamic> json) {
    return UpdatePackageVersionsStatusResult(
      failedVersions: (json['failedVersions'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, PackageVersionError.fromJson(e as Map<String, dynamic>))),
      successfulVersions: (json['successfulVersions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              SuccessfulPackageVersionInfo.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final failedVersions = this.failedVersions;
    final successfulVersions = this.successfulVersions;
    return {
      if (failedVersions != null) 'failedVersions': failedVersions,
      if (successfulVersions != null) 'successfulVersions': successfulVersions,
    };
  }
}

class UpdateRepositoryResult {
  /// The updated repository.
  final RepositoryDescription? repository;

  UpdateRepositoryResult({
    this.repository,
  });

  factory UpdateRepositoryResult.fromJson(Map<String, dynamic> json) {
    return UpdateRepositoryResult(
      repository: json['repository'] != null
          ? RepositoryDescription.fromJson(
              json['repository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final repository = this.repository;
    return {
      if (repository != null) 'repository': repository,
    };
  }
}

/// Information about an upstream repository. A list of
/// <code>UpstreamRepository</code> objects is an input parameter to <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_CreateRepository.html">CreateRepository</a>
/// and <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_UpdateRepository.html">UpdateRepository</a>.
class UpstreamRepository {
  /// The name of an upstream repository.
  final String repositoryName;

  UpstreamRepository({
    required this.repositoryName,
  });

  Map<String, dynamic> toJson() {
    final repositoryName = this.repositoryName;
    return {
      'repositoryName': repositoryName,
    };
  }
}

/// Information about an upstream repository.
class UpstreamRepositoryInfo {
  /// The name of an upstream repository.
  final String? repositoryName;

  UpstreamRepositoryInfo({
    this.repositoryName,
  });

  factory UpstreamRepositoryInfo.fromJson(Map<String, dynamic> json) {
    return UpstreamRepositoryInfo(
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryName = this.repositoryName;
    return {
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
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
