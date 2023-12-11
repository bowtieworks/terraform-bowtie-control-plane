variable key_name {
    description = "EC2 Key Name"
    type = string
    nullable = true
    default = null
}

variable name {
    description = "Control Plane Name. Controllers are named {host_prefix}-NN.{name}.{dns_zone_name}"
    type = string
    default = "bowtie"
}

variable use_nlb_and_asg {
    type = bool
    default = false
}

variable vpc_id {
    type = string
    default = false
}

variable subnets {
    description = "One object per subnet to deploy one or more controllers into"
    type = list(object({
        host_prefix = string,
        number_of_controllers = number,
        vpc_controller_subnet_id = string,
        vpc_nlb_subnet_id = optional(string),
        site_id = string,
    }))
}

variable dns_zone_name {
    description = "Top Level DNS Zone name e.g example.com"
    type = string
}

variable control_plane_name {
    description = "the name of this control plane"
    default = "bowtie"
}

variable sync_psk {
    description = "Pre Shared Key for synchronizing data between controllers"
}

variable "iam_instance_profile_name" {
    default = null
    nullable = true
    type = string
}

variable "bowtie_sso_config_path" {
  description = "Path to Bowtie/Dex SSO configuration file"
  nullable    = true
  default = null
}

variable "bootstrap_hosts" {
  description = "A List of hosts which all others will try to bootstrap to. This list has special behavior during first-initialization"
  type = list(string)
}

variable "init-users" {
    type = list(object({
        email=string,
        hashed_password=string
    }))
    nullable = true
    default = null
}

variable instance_type {
    type = string
    default = "m5.large"
}