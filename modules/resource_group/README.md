
# Resource Group

examples:

```
module "resource_group" {
  source = "<source>"

  name     = "${var.name}"
  location = "${var.location}"
  tags     = "${var.tags}"
}
```