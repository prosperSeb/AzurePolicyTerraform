# Configure the Azure provider
terraform {
  required_providers {
    azurerm = "2.65"
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_policy_definition" "policy" {
  name = "audit-automation-account-variable-encryption"
  policy_type = "Custom"
  mode = "Indexed"
  display_name = " Audit Automation Account Variable Encrypion"
  policy_rule = file(".\Policies\AzureAutomationAccountVariablesEncryption\policy-rule.json")
  parameters = file(.\"Policies\AzureAutomationAccountVariablesEncryption\policy-parameters.json")
}