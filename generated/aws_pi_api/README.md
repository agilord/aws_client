# AWS API client for AWS Performance Insights

**Warning: This is a generated library, some operations may not work.**

*About the service:*
AWS Performance Insights enables you to monitor and explore different
dimensions of database load based on data captured from a running RDS
instance. The guide provides detailed information about Performance Insights
data types, parameters and errors. For more information about Performance
Insights capabilities see <a
href="http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">Using
Amazon RDS Performance Insights </a> in the <i>Amazon RDS User Guide</i>.

The AWS Performance Insights API provides visibility into the performance of
your RDS instance, when Performance Insights is enabled for supported engine
types. While Amazon CloudWatch provides the authoritative source for AWS
service vended monitoring metrics, AWS Performance Insights offers a
domain-specific view of database load measured as Average Active Sessions
and provided to API consumers as a 2-dimensional time-series dataset. The
time dimension of the data provides DB load data for each time point in the
queried time range, and each time point decomposes overall load in relation
to the requested dimensions, such as SQL, Wait-event, User or Host, measured
at that time point.

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).

## Contributors

- [Jonathan Böcker](https://github.com/Schwusch)
- [Istvan Soós](https://github.com/isoos)

