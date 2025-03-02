variable "cloud_provider" {
    type = object({
      cloud_id = string
      zone = string
      folder_id = string
    })
}

variable "subnet_public" {
    type = object({
      v4_cidr_blocks = string
      description = string
    })
    default = {
      v4_cidr_blocks = "192.168.10.0/24"
      description  = "Public Subnet"       
      }
    
}

variable "subnet_private" {
    type = object({
      v4_cidr_blocks = string
      description = string
    })
    default = {
      v4_cidr_blocks = "192.168.20.0/24"
      description  = "Private Subnet"
  }
}

variable "compute_nat" {
    type = object({
        name = string
        platform_id = string
    })
    default = {
        name = "nat"
        platform_id = "standard-v3"
    }
}

variable "resources_nat" {
    type = object({
      cores = number
      memory = number
      core_fraction = number
    })
    default = {
      core_fraction = 20
      memory = 2
      cores = 2
    }
}

variable "image_nat" {
    type = string
    default = "nat-instance-ubuntu-2204"
}

variable "network_nat" {
    type = object({
      nat = bool
      ip_address = string
    })
    default = {
      nat = true
      ip_address = "192.168.10.254"
    }
  
}





variable "family" {
    type = string
    default = "ubuntu-2204-lts-oslogin"
  
}

variable "compute_vm" {
    type = map(object({
       hostname = string
       name =  string
       platform_id = string
       cores = number
       memory = number
       core_fraction = number
       nat = bool

    }))
    default = {
      "public" = {
        hostname = "public-vm"
        name = "public-vm"
        platform_id = "standard-v3"
        cores = 2
        memory = 4 
        core_fraction = 20
        nat = true
      }
      "private" = {
        hostname = "private-vm"
        name = "private-vm"
        platform_id = "standard-v3"
        cores = 2
        memory = 4
        core_fraction = 20
        nat = false
      }
    }
}