package terraform.analysis

__rego_metadoc__ := {
  "title": "Require Environment=test Tag",
  "description": "This policy ensures all resources have an 'Environment' tag set to 'test'."
}

violation[{"msg": msg}] {
  resource := input.planned_values.root_module.resources[_]
  tag := resource.values.tags.Environment
  tag != "test"
  msg := sprintf("Resource %v does not have Environment tag set to 'test'.", [resource.address])
}
