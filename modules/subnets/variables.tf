variable "subnet" {
   
    type = map(object({
      name = string
      address_prefixes=string
      resource_group_name=string
      virtual_network_name=string
    #   security_group=optional(string)
    }))

}