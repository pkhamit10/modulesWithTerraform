terraform {
  backend "remote" {
    organization = "pkham" # Must match exactly
  workspaces {
      prefix = "jktf-" # Dynamic workspace selection
    }
  }
}