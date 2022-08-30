provider"m3"{}
resource"m3_instance""my-server"{
image="centos7_64-bit"
name=var.vm_name
region=var.regionName
tenant=var.tenantName
shape="SMALL"
owner=var.owner
}
variable"vm_name"{
default="auto-test-tf-template-openstack"
description="NameforVMtobecreated"
}
variable"regionName"{
default="EPAM-BY2"
description="regionName"
}
variable"tenantName"{
default="EPM-CIT2"
description="Namefor tenant"
}


