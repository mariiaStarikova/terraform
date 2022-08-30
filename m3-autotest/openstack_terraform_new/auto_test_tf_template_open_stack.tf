# Define required providers
terraform {
    required_providers {
        openstack = {
            source  = "terraform-provider-openstack/openstack"
            version = "~> 1.35.0"
        }
    }
}

# Configure the OpenStack Provider
provider "openstack" {
    user_name  = "specialepm-csupl3@epam.com"
    password = "${var.password}"
    auth_url = "https://infra.mail.ru:35357/v3" 
    region   = "RegionOne"
    user_domain_id = "users"
    tenant_id = "eb2abf2da25a41b8b81304ae5430748e"
}

data "openstack_compute_flavor_v2" "small_basic" {
    flavor_id = "25ae869c-be29-4840-8e12-99e046d2dbd4"
}

output "basic_flavor_name" {
    value = data.openstack_compute_flavor_v2.small_basic.name
}

variable "password" {
    default = "password"
}
