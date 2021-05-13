resource "openstack_compute_instance_v2" "instances" {
  name            = "VM-${count.index}"
  image_name      = "nesc-baseimages-fedora-33-2020-11-11"
  flavor_name     = "dz.004-0008"
  key_pair        = "svc-testing"
  security_groups = ["default","all-allowed",	"all-allowed-marcin"]
  count           = 2
  network {
    name = "mmigdal"
  }
}