# AWS API client for Amazon AppConfig

**Generated Dart library from API specification**

*About the service:*
AppConfig feature flags and dynamic configurations help software builders
quickly and securely adjust application behavior in production environments
without full code deployments. AppConfig speeds up software release
frequency, improves application resiliency, and helps you address emergent
issues more quickly. With feature flags, you can gradually release new
capabilities to users and measure the impact of those changes before fully
deploying the new capabilities to all users. With operational flags and
dynamic configurations, you can update block lists, allow lists, throttling
limits, logging verbosity, and perform other operational tuning to quickly
respond to issues in production environments.
<note>
AppConfig is a capability of Amazon Web Services Systems Manager.
</note>
Despite the fact that application configuration content can vary greatly
from application to application, AppConfig supports the following use cases,
which cover a broad spectrum of customer needs:

<ul>
<li>
<b>Feature flags and toggles</b> - Safely release new capabilities to your
customers in a controlled environment. Instantly roll back changes if you
experience a problem.
</li>
<li>
<b>Application tuning</b> - Carefully introduce application changes while
testing the impact of those changes with users in production environments.
</li>
<li>
<b>Allow list or block list</b> - Control access to premium features or
instantly block specific users without deploying new code.
</li>
<li>
<b>Centralized configuration storage</b> - Keep your configuration data
organized and consistent across all of your workloads. You can use AppConfig
to deploy configuration data stored in the AppConfig hosted configuration
store, Secrets Manager, Systems Manager, Parameter Store, or Amazon S3.
</li>
</ul>
<b>How AppConfig works</b>

This section provides a high-level description of how AppConfig works and
how you get started.
<dl> <dt>1. Identify configuration values in code you want to manage in the
cloud</dt> <dd>
Before you start creating AppConfig artifacts, we recommend you identify
configuration data in your code that you want to dynamically manage using
AppConfig. Good examples include feature flags or toggles, allow and block
lists, logging verbosity, service limits, and throttling rules, to name a
few.

If your configuration data already exists in the cloud, you can take
advantage of AppConfig validation, deployment, and extension features to
further streamline configuration data management.
</dd> <dt>2. Create an application namespace</dt> <dd>
To create a namespace, you create an AppConfig artifact called an
application. An application is simply an organizational construct like a
folder.
</dd> <dt>3. Create environments</dt> <dd>
For each AppConfig application, you define one or more environments. An
environment is a logical grouping of targets, such as applications in a
<code>Beta</code> or <code>Production</code> environment, Lambda functions,
or containers. You can also define environments for application
subcomponents, such as the <code>Web</code>, <code>Mobile</code>, and
<code>Back-end</code>.

You can configure Amazon CloudWatch alarms for each environment. The system
monitors alarms during a configuration deployment. If an alarm is triggered,
the system rolls back the configuration.
</dd> <dt>4. Create a configuration profile</dt> <dd>
A configuration profile includes, among other things, a URI that enables
AppConfig to locate your configuration data in its stored location and a
profile type. AppConfig supports two configuration profile types: feature
flags and freeform configurations. Feature flag configuration profiles store
their data in the AppConfig hosted configuration store and the URI is simply
<code>hosted</code>. For freeform configuration profiles, you can store your
data in the AppConfig hosted configuration store or any Amazon Web Services
service that integrates with AppConfig, as described in <a
href="https://docs.aws.amazon.com/appconfig/latest/userguide/appconfig-free-form-configurations-creating.html">Creating
a free form configuration profile</a> in the the <i>AppConfig User
Guide</i>.

A configuration profile can also include optional validators to ensure your
configuration data is syntactically and semantically correct. AppConfig
performs a check using the validators when you start a deployment. If any
errors are detected, the deployment rolls back to the previous configuration
data.
</dd> <dt>5. Deploy configuration data</dt> <dd>
When you create a new deployment, you specify the following:

<ul>
<li>
An application ID
</li>
<li>
A configuration profile ID
</li>
<li>
A configuration version
</li>
<li>
An environment ID where you want to deploy the configuration data
</li>
<li>
A deployment strategy ID that defines how fast you want the changes to take
effect
</li>
</ul>
When you call the <a
href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/API_StartDeployment.html">StartDeployment</a>
API action, AppConfig performs the following tasks:
<ol>
<li>
Retrieves the configuration data from the underlying data store by using the
location URI in the configuration profile.
</li>
<li>
Verifies the configuration data is syntactically and semantically correct by
using the validators you specified when you created your configuration
profile.
</li>
<li>
Caches a copy of the data so it is ready to be retrieved by your
application. This cached copy is called the <i>deployed data</i>.
</li> </ol> </dd> <dt>6. Retrieve the configuration</dt> <dd>
You can configure AppConfig Agent as a local host and have the agent poll
AppConfig for configuration updates. The agent calls the <a
href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/API_appconfigdata_StartConfigurationSession.html">StartConfigurationSession</a>
and <a
href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/API_appconfigdata_GetLatestConfiguration.html">GetLatestConfiguration</a>
API actions and caches your configuration data locally. To retrieve the
data, your application makes an HTTP call to the localhost server. AppConfig
Agent supports several use cases, as described in <a
href="https://docs.aws.amazon.com/appconfig/latest/userguide/appconfig-retrieving-simplified-methods.html">Simplified
retrieval methods</a> in the the <i>AppConfig User Guide</i>.

If AppConfig Agent isn't supported for your use case, you can configure your
application to poll AppConfig for configuration updates by directly calling
the <a
href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/API_appconfigdata_StartConfigurationSession.html">StartConfigurationSession</a>
and <a
href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/API_appconfigdata_GetLatestConfiguration.html">GetLatestConfiguration</a>
API actions.
</dd> </dl>
This reference is intended to be used with the <a
href="https://docs.aws.amazon.com/appconfig/latest/userguide/what-is-appconfig.html">AppConfig
User Guide</a>.

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).
