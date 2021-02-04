module "cloud_function" {
  source = "github.com/Anil-CM/CF-Autoscale"
  minimum_vm_count = var.minimum_vm_count
  namespace = var.namespace
  package_name = var.package_name
  action_name = var.action_name
  api_key = var.api_key
  workspace_id = var.workspace_id
  vm_count = var.vm_count
}

module "sysdig_monitoring_config" {
  source = "github.com/Anil-CM/sysdig-conf"
  sysdig_monitor_url = var.sysdig_monitor_url
  sysdig_api_token = var.sysdig_api_token
  scale_up_alert_name = var.scale_up_alert_name
  scale_down_alert_name = var.scale_down_alert_name
  range1_upper_threshold = var.range1_upper_threshold
  range1_lower_threshold = var.range1_lower_threshold
  range2_upper_threshold = var.range2_upper_threshold
  range2_lower_threshold = var.range2_lower_threshold
  range3_upper_threshold = var.range3_upper_threshold
  range3_lower_threshold = var.range3_lower_threshold
  scaledown_lower_threshold = var.scaledown_lower_threshold 
  scaledown_upper_threshold = var.scaledown_upper_threshold

  number_of_scale_up_alerts = var.number_of_scale_up_alerts
  notification_channel_webhook_url = module.cloud_function.cloud_function_target_endpoint_url
}