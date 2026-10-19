output "subnet-resource" {

value = {
    for key, value in azurerm_subnet.internal : key => {
      id = value.id
    }
}
  
}