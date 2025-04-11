package terraform.analysis

__rego_metadoc__ := {
  "title": "Require environment=test Tag",
  "description": "Ensures all resources in the Terraform plan have a tag 'environment' set to 'test'."
}

violation[{"msg": msg}] {
  resource := input.planned_values.root_module.resources[_]
  not has_required_tag(resource.values.tags)
  msg := sprintf("Resource %v is missing required tag environment=test", [resource.address])
}

has_required_tag(tags) {
  tags.environment == "test"
}
