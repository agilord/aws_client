# AWS API client for AWS Resource Groups

**Generated Dart library from API specification**

*About the service:*
Resource Groups lets you organize Amazon Web Services resources such as
Amazon Elastic Compute Cloud instances, Amazon Relational Database Service
databases, and Amazon Simple Storage Service buckets into groups using
criteria that you define as tags. A resource group is a collection of
resources that match the resource types specified in a query, and share one
or more tags or portions of tags. You can create a group of resources based
on their roles in your cloud infrastructure, lifecycle stages, regions,
application layers, or virtually any criteria. Resource Groups enable you to
automate management tasks, such as those in Amazon Web Services Systems
Manager Automation documents, on tag-related resources in Amazon Web
Services Systems Manager. Groups of tagged resources also let you quickly
view a custom console in Amazon Web Services Systems Manager that shows
Config compliance and other monitoring data about member resources.

To create a resource group, build a resource query, and specify tags that
identify the criteria that members of the group have in common. Tags are
key-value pairs.

For more information about Resource Groups, see the <a
href="https://docs.aws.amazon.com/ARG/latest/userguide/welcome.html">Resource
Groups User Guide</a>.

Resource Groups uses a REST-compliant API that you can use to perform the
following types of operations.

<ul>
<li>
Create, Read, Update, and Delete (CRUD) operations on resource groups and
resource query entities
</li>
<li>
Applying, editing, and removing tags from resource groups
</li>
<li>
Resolving resource group member ARNs so they can be returned as search
results
</li>
<li>
Getting data about resources that are members of a group
</li>
<li>
Searching Amazon Web Services resources based on a resource query
</li>
</ul>

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).
