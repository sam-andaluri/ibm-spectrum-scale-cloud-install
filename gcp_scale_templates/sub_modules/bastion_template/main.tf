/*
  Create a new Bastion instance
*/

module "bastion_firewall" {
  source               = "../../../resources/gcp/network/firewall/allow_bastion/"
  source_range         = var.bastion_source_range
  firewall_name_prefix = var.resource_prefix
  vpc_name             = var.vpc_name
}

module "bastion_instance" {
  source           = "../../../resources/gcp/compute/bastion_instance/"
  zone             = var.bastion_zone
  machine_type     = var.bastion_machine_type
  instance_name    = "${var.resource_prefix}-${var.bastion_instance_name_prefix}"
  boot_disk_size   = var.bastion_boot_disk_size
  boot_disk_type   = var.bastion_boot_disk_type
  boot_image       = var.bastion_boot_image
  network_tier     = var.bastion_network_tier
  vm_instance_tags = var.bastion_instance_tags
  subnet_name      = var.public_subnet_name
  ssh_user_name    = var.bastion_ssh_user_name
  ssh_key_path     = var.bastion_ssh_key_path
}
