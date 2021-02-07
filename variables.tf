//
//
//
variable "iaas_classic_username" {
  description = "Classic IaaS username."
  type        = string
  default     = ""
}

variable "iaas_classic_api_key" {
  description = "Classic IaaS API Key."
  type        = string
  default     = ""
}

variable "ssh_key" {
  description = "SSH key to add to instance."
  type        = string
  default     = ""
}

variable datacenter {
  description = "Default datacenter for LBaaS and web instances."
  type        = string
  default     = ""
}

variable "instance_count" {
  description = "Number of instances"
  type = number
}
// =====================================================

variable "minimum_vm_count" {
    default = 3
    description = "Minumum VMs to be maintained with Load balancer" 
}

variable "namespace" {
    default = "acmnamespace"
    description = "Name space where cloud function is defined"
}

variable "action_name" {
    default = "autoscaleaction"
    description = "Name of the action"
}

variable "api_key" {
    default = ""
    description = "API Key to perform the schematics operations"
}

variable "vm_count"{
    default = 0
    description = "default value for the vm count parameter"
}

//|======================================================| 
//|      sysdig-monitor-config vrariables                |
//|======================================================|
variable "sysdig_monitor_url" {
    description = "Sysdig Monitoring URL"
    default = "https://us-south.monitoring.cloud.ibm.com"
}

variable "sysdig_api_token"{
    description = "API Token from Sysdig monitoring UI"
    default = ""
}

variable "scale_up_alert_name"{
    description = "sysdig alert name"
    default = "lb-load-scale-up-alert"
}

variable "scale_down_alert_name"{
    type = string
    default = "lb-load-scale-down-alert"
}

variable "range1_upper_threshold" {
    description = "upper threshold for the alert1"
    type = string
    default = "10"
}

variable "range1_lower_threshold" {
    description = "lower threshold for the alert1"
    type = string
    default = "20"
}

variable "range2_upper_threshold" {
    description = "upper threshold for the alert2"
    type = string
    default = "30"
}

variable "range2_lower_threshold" {
    description = "lower threshold for the alert2"
    type = string
    default = "40"
}

variable "range3_upper_threshold" {
    description = "upper threshold for the alert3"
    type = string
    default = "50"
}

variable "range3_lower_threshold" {
    description = "lower threshold for the alert3"
    type = string
    default = "60"
}

variable "scaledown_lower_threshold"{
    type = string
    default = 0
}

variable "scaledown_upper_threshold"{
    type = string
    default =  5
}


variable "number_of_scale_up_alerts" {
    default = 3
}
