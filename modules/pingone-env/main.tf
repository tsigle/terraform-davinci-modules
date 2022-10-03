


resource "pingone_environment" "env_instance" {
  name        = var.target_environment_name
  description = var.target_environment_description
  type        = "SANDBOX"
  license_id  = var.license_id

  default_population {
    name        = "My Population"
    description = "My new population for users"
  }

  service {
    type = "MFA"
  }

  service {
    type = "SSO"
  }

  service {
    type = "DaVinci"
  }
}

data "pingone_role" "identity_data_admin" {
  name = "Identity Data Admin"
}

resource "pingone_role_assignment_user" "admin_role" {
  # count                = var.admin_user_id != "" && var.admin_environment_id != "" ? 1 : 0
  environment_id       = var.admin_environment_id
  user_id              = var.admin_user_id
  role_id              = data.pingone_role.identity_data_admin.id
  scope_environment_id = pingone_environment.env_instance.id
}


data "http" "flow_json" {
  url = var.flow_url
  request_headers = {
    Accept = "application/json"
  }
}
resource "davinci_flow" "flow1" {
  flow_json = data.http.flow_json.response_body

  deploy    = true

  depends_on = [
    pingone_role_assignment_user.admin_role
  ]
}




