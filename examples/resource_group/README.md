# Rerource Group

This folder contain examples for create *resource group in azure*

```
module "resource_group" {
  source  = "edalferes/recources/azure//modules/resource_group"
  version = "0.1.0"

  name     = "${var.resource_group_name}"
  location = "${var.location}"
  tags     = "${var.tags}"
}
```
