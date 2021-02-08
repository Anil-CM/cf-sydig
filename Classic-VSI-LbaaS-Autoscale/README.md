# Classic VSI with Loadbalancer Autoscale behaviour

This module desploys a set of VSIs on classic infrastructure with a load balancer attached and a cloud function action to handle the autoscaling of VSIs. The module configures the sysdig service with alerts and notifications for the autoscale feature. This module scale the VSIs based on the Loadbalancer's `Numer of active connections` metric.

![alt text](https://github.com/Anil-CM/schematics-solutions/blob/main/Classic-VSI-LbaaS-Autoscale/VSI-Sysdig-Automation.png?raw=true)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |


## Providers

| Name | Version |
|------|---------|
| ibm | >= 1.18.0 |
| sysdig | >= 0.5.7 |

## Modules
| Name | Description | GIT Repo |
|------|-------------|----------|
| `vms_and_lb` | Module responisble for creation of VSIs and Loadbalancer | `https://github.com/Anil-CM/IBMCloud-Terraform-Examples/tree/master/ClassicVSI-LBaaS`|
| `cloud_function` | Module responisble for cloud function action creation and configuration | `https://github.com/Anil-CM/CF-Autoscale` |
| `sysdig_monitoring_config` | Module responsbile for sysdig monitoring configurations | `https://github.com/Anil-CM/sysdig-conf` |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| iaas\_classic\_username|IAAS Classic user name | `string` | n/a | yes |
| iaas\_classic\_api\_key | IAAS Classic user API Key | `string` | n/a | yes |
| ssh\_key | name of the ssh key in classic infrastructure | `string` | n/a | yes |
| datacenter | name of the Datacenter | `string` | n/a | yes |
| instance\_count | Number of VSIs to be provisoned | `number` | n/a | yes |
| minimum\_vm\_count | The minimum number of VSIs to be maintained all the time | `number` | `3` | no |
| namespace | Name space where cloud function is defined | `string` | n/a | yes |
| action\_name | Cloud function action name | `string` | `"autoscaleaction"` | no |
| api\_key | IAM API Key of the ibmcloud user to perform schematics actions | `string` | n/a | yes |
| vm\_count | Default value of VSI count for the autoscaling | `number` | `0` | no |
| sysdig\_monitor\_url | Sysdig Monitor URL. | `string` | `"https://us-south.monitoring.cloud.ibm.com"`| no |
| sysdig\_api\_token | API token for the sysdig monitoring | `string` | n/a | yes |
| scale\_up\_alert\_name | Alert name for sclaing up the VSIs | `string` | `"lb-load-scale-up-alert"` | no |
| scale\_down\_alert\_name | Alert name for scaling down the VSIs | `string` | `"lb-load-scale-down-alert"` | no |
|range1\_upper\_threshold | Number of active connections upper threshold for the alert1 for scale up | `string` | `"10"` | no |
|range2\_upper\_threshold | Number of active connections upper threshold for the alert2 for scale up | `string` | `"30"` | no |
|range3\_upper\_threshold | Number of active connections upper threshold for the alert3 for scale up | `string` | `"50"` | no |
|range1\_lower\_threshold | Number of active connections lower threshold for the alert1 for scale up | `string` | `"20"` | no |
|range2\_lower\_threshold | Number of active connections lower threshold for the alert2 for scale up | `string` | `"40"` | no |
|range3\_lower\_threshold | Number of active connections lower threshold for the alert3 for scale up | `string` | `"60"` | no |
|scaledown\_upper\_threshold | Number of active connections upper threshold for the scale down alert | `string` | `"5"`  | no |
|scaledown\_lower\_threshold | Number of active connections lower threshold for the scale down alert | `string` | `"0"`  | no |
| number\_of\_scale\_up\_alerts | Number of scale up alerts to be configured | `number` | `"3"` | no |



## Outputs

| Name | Description |
|------|-------------|
| web\_server\_private\_ips | List of the private IP Addresses of the web servers |
| lbaas\_subnet | Load balancer subnet |
| lbaas\_hostname | Load balancer host name |
| health\_monitors| Health Monitors of the loadbalcer |

## License

Apache 2 Licensed. See [LICENSE](LICENSE) for full details.


