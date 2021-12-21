resource "virtualbox_vm" "node" {
  count     = 1
  name      = format("node-%02d", count.index + 1)
  image     = "https://mirrors.xtom.de/fedora/releases/34/Cloud/x86_64/images/Fedora-Cloud-Base-Vagrant-34-1.2.x86_64.vagrant-virtualbox.box"
  cpus      = 2
  memory    = "4500 mib"

  network_adapter {
    type           = "nat" // allowed values: nat, bridged, hostonly, internal, generic.
    //host_interface = "vboxnet1"
  }
}