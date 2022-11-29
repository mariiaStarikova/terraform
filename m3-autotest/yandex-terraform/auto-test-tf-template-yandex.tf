provider"m3"{}
resource"m3_instance""my-server"{
image="Ubuntu 20.04 LTS"
name=var.vm_name
region=var.region
tenant=var.tenantName
shape="SMALL"
owner=var.owner
key=var.keyName
}
variable"vm_name"{
default="auto-test-tf-template-vsphere"
description="NameforVMtobecreated"
}
variable"owner"{
default="m3.autotest.user5@cloudmaster.ru"
description="NameforVMtobecreated"
}

variable"region"{
default="YC-RU-CENTRAL"
description="region"
}

variable"tenantName"{
default="CLOUDMASTER"
description="tenantName"
}
variable"keyName"{
default="key_for_autotest"
description="keyName"
}
