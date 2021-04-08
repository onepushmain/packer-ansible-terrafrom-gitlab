## Optional Security

* Ensure all data stored in the Launch configuration EBS is securely encrypted

    > Amazon Elastic Block Store (EBS) volumes allow you to create encrypted launch configurations when creating EC2 instances and auto scaling. When the entire EBS volume is encrypted, data stored at rest on the volume, disk I/O, snapshots created from the volume, and data in-transit between EBS and EC2 are all encrypted.

[Reference](https://docs.bridgecrew.io/docs/general_13)


* Ensure Instance Metadata Service Version 1 is not enabled

    > The Instance Metadata Service (IMDS) is an on-instance component used by code on the instance to securely access instance metadata. You can access instance metadata from a running instance using one of the following methods:
    >> Instance Metadata Service Version 1 (IMDSv1) – a request/response method\
    >> Instance Metadata Service Version 2 (IMDSv2) – a session-oriented method
    
    > As a request/response method IMDSv1 is prone to local misconfigurations:
    >> Open proxies, open NATs and routers, server-side reflection vulnerabilities.\
    >> One way or another, local software might access local-only data.

[Reference](https://docs.bridgecrew.io/docs/bc_aws_general_31)
