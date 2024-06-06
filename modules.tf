module "network" {
    source = "./modules/network"

    gs-name = var.gs-name
    vpc-iac-cidr-block = var.vpc-iac-cidr-block
    sn-pub-az1a-cidr-block = var.sn-pub-az1a-cidr-block
    sn-pub-az1c-cidr-block = var.sn-pub-az1c-cidr-block
    sn-priv-az1a-cidr-block = var.sn-priv-az1a-cidr-block 
    sn-priv-az1c-cidr-block = var.sn-priv-az1c-cidr-block
    az1a = var.az1a
    az1c = var.az1c
}

module "compute" {
    source = "./modules/compute"

    gs-name = var.gs-name
    vpc-iac-id = module.network.vpc-iac.id
    sn-pub-az1a = module.network.sn-pub-az1a
    sn-pub-az1c = module.network.sn-pub-az1c
    sn-priv-az1a = module.network.sn-priv-az1a
    sn-priv-az1c = module.network.sn-priv-az1c

    vpc-iac-cidr-block = var.vpc-iac-cidr-block

    ec2-lt-name = var.ec2_lt_name
    ec2-lt-ami = var.ec2_lt_ami
    ec2-lt-instance-type = var.ec2_lt_instance_type
    ec2-lt-ssh-key-name = var.ec2_lt_ssh_key_name

    ec2-asg-name = var.ec2_asg_name
    ec2-asg-desired-capacity = var.ec2_asg_desired_capacity
    ec2-asg-min-size = var.ec2_asg_min_size
    ec2-asg-max-size = var.ec2_asg_max_size
}