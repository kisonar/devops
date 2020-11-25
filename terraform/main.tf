resource "openstack_compute_keypair_v2" "my-cloud-key" {
  name       = "my-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLRwr14aTJt1OIMMkU7cj9ut2ZsOjc11JDEwhlrgPQMgku1nesY3Y/TmKfIohAHwD7P/fyhCMmp45+IjUt58fvFIkuJPZlG5LAXklRJYL4nHC+QWMu9VDdV/9FFCS3k8NCGATBbpc/0vC2N9d+IlW3fxEMPweKIL72wStuOPRqjXHFSN+WVTS2vcV4XLAE6Jt0sxReL+PO5zFlAGkZUCOP5+MjRvlscA9sdIAlJzo6pXIqd+o/3OHFHbajMcbPXt8J+LNEKGmMbT/6Oir+YbaQK98jYXbRMyvTjY2futWssUPQurpRA2M8bpvPG5vZcg422SUuPuJkKiPwZtgqEADx"
}

resource "openstack_compute_instance_v2" "test" {
  name            = "VM-${count.index}"
  image_name      = "nesc-baseimages-fedora-32-2020-07-28"
  #flavor_name     = "dz.004-0008"
  #flavor_name     = "dz.004-0008"
  key_pair        = "${openstack_compute_keypair_v2.my-cloud-key.name}"
  security_groups = ["default"]
  count           = 2

  network {
    name = "mmigdal"
  }
}