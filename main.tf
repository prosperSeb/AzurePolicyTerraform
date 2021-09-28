# Configure the Azure provider
terraform {
  required_providers {
    azurerm = "=1.29.0"
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
  policy_rule = file(".\\policies\\azureAutomationAccountVariablesEncryption\\policy-rule.json")
  parameters = file(".\\policies\\azureAutomationAccountVariablesEncryption\\policy-parameters.json")
}