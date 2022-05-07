provider"m3"{}
resource"m3_instance""my-server"{
image="centos7_64-bit"
instance_name=var.vm_name
region_name=var.regionName
tenant_name=var.tenantName
shape="SMALL"
owner=var.owner
}
variable"vm_name"{
default="auto-test-tf-template-openstack"
description="NameforVMtobecreated"
}
variable"regionName"{
description="regionName"
}
variable"tenantName"{
default="EPM-CIT2"
description="Namefor tenant"
}


