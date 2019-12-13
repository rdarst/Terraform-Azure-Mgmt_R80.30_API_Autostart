resource "azurerm_network_interface" "mgmtexternal" {
    name                = "mgmtexternal"
    location            = "eastus"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    enable_ip_forwarding = "false"
	ip_configuration {
        name                          = "mgmtexternalConfiguration"
        subnet_id                     = "${azurerm_subnet.External_subnet.id}"
        private_ip_address_allocation = "Static"
		private_ip_address = "10.95.0.5"
        primary = true
		public_ip_address_id = "${azurerm_public_ip.mgmtpublicip.id}"
    }

}
