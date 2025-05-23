
resource "azurerm_network_security_group" "nsg" {
  name                = "ensgroup"
  location            = local.location
  resource_group_name = local.resource_group
}


// Create a virtual network with a subnet and NIC: 1
resource "azurerm_virtual_network" "vnet1" {
  name                = "enetwork1"
  location            = local.location
  resource_group_name = local.resource_group
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = local.resource_group
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.1.0/24"]
}
resource "azurerm_network_interface" "nic1" {
  name                = "enic1"
  location            = local.location
  resource_group_name = local.resource_group
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}


// Create a virtual network with a subnet and NIC: 2
resource "azurerm_virtual_network" "vnet2" {
  name                = "enetwork2"
  location            = local.location
  resource_group_name = local.resource_group
  address_space       = ["10.1.0.0/16"]
}
resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = local.resource_group
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.1.1.0/24"]
}
resource "azurerm_network_interface" "nic2" {
  name                = "enic2"
  location            = local.location
  resource_group_name = local.resource_group
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_virtual_network_peering" "peer" {
  name                      = "peer1to2"
  resource_group_name       = local.resource_group
  virtual_network_name      = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet2.id
}
