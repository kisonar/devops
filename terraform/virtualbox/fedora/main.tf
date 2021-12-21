resource "virtualbox_vm" "node" {
  count     = 1
  name      = format("node-%02d", count.index + 1)
  image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus      = 2
  memory    = "4500 mib"

  network_adapter {
    type           = "nat" // allowed values: nat, bridged, hostonly, internal, generic.
    //host_interface = "vboxnet1"
  }
}