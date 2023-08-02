resource "google_compute_region_network_endpoint_group" "neg" {
  name                  = var.name
  network_endpoint_type = "SERVERLESS"
  for_each = toset(var.region)
  region = each.key
  cloud_function {
    function = "${var.function_name}__${each.key}"
  }
  project = var.project_id
}
/*
resource "google_compute_region_network_endpoint_group" "function_neg" {
  name                  = "${var.prefix}-${var.region}-fct-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region
  cloud_function {
    function = var.function_name
  }
}*/