resource "openstack_compute_instance_v2" "vms" {
  name            = "VM-${count.index}"
  image_name      = "image-name"
  flavor_name     = "flavor-name"
  key_pair        = "key-pair-name"
  security_groups = ["default","all-allowed"]
  count           = 2

  network {
    name = "network-name"
  }
}