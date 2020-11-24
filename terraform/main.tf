resource "openstack_compute_keypair_v2" "my-cloud-key" {
  name       = "my-key"
  public_key = ""
  }

resource "openstack_compute_instance_v2" "test" {
  name            = "VM-name"
  image_name      = "image-name"
  flavor_name     = "flavor"
  key_pair        = "${openstack_compute_keypair_v2.my-cloud-key.name}"
  security_groups = ["default"]

  network {
    name = "network-name"
  }
}
