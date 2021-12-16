resource "virtualbox_vm" "node" {
  count = 1
  name = "${format("node-%02d", count.index+1)}"
  image = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus = 4
  memory = "4000 mb"
  // user_data = "${file("user_data")}"


  network_adapter {
    type = "bridged"
    host_interface="en0"
  }

}