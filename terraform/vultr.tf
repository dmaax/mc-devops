resource "vultr_ssh_key" "mcdevops" {
  name = "mcdevops"
  ssh_key = var.VULTR_PUBLIC_SSH_KEY
}

resource "vultr_instance" "mc_instance" {
    plan = "vc2-1c-1gb"
    region = "mia"
    os_id = "1743"
    hostname = "mcdevops"
    enable_ipv6 = true
    ssh_key_ids = ["${vultr_ssh_key.mcdevops.id}"] 
}