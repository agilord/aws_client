# AWS API client for AWS Migration Hub Config

**Warning: This is a generated library, some operations may not work.**

*About the service:*
The AWS Migration Hub home region APIs are available specifically for
working with your Migration Hub home region. You can use these APIs to
determine a home region, as well as to create and work with controls that
describe the home region.

<ul>
<li>
You must make API calls for write actions (create, notify, associate,
disassociate, import, or put) while in your home region, or a
<code>HomeRegionNotSetException</code> error is returned.
</li>
<li>
API calls for read actions (list, describe, stop, and delete) are permitted
outside of your home region.
</li>
<li>
If you call a write API outside the home region, an
<code>InvalidInputException</code> is returned.
</li>
<li>
You can call <code>GetHomeRegion</code> action to obtain the account's
Migration Hub home region.
</li>
</ul>
For specific API usage, see the sections that follow in this AWS Migration
Hub Home Region API reference.

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).

## Contributors

- [Jonathan Böcker](https://github.com/Schwusch)
- [Istvan Soós](https://github.com/isoos)

