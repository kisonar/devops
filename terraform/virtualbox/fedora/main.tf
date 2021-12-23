resource "virtualbox_vm" "node" {
  count     = 1
  name      = format("node-%02d", count.index + 1)
  image     = "./OS/Fedora-Cloud-Base-Vagrant-34-1.2.x86_64.vagrant-virtualbox.box"
  cpus      = 2
  memory    = "4500 mib"

  network_adapter {
    type           = "nat"
  }
}