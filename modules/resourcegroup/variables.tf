variable "rg-name" {

  # type = map(object({
  #   name     = string
  #   location = string
  #   tags     = optional(map(string))
  # }))
type =map(object({
  name = string
  location=string
  tags=optional(map(string))
}))


}