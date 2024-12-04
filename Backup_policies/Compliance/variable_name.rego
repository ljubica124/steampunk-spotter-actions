package spotter

import future.keywords.if

SpotterPolicy[result] {
	task := input.tasks[i]
	task_args := task.task_args
	name := task_args.name
	v := task_args[_][k]

	is_jinja(v)
	has_property_value(v, name)

	result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"message": sprintf("Variable name inside key '%s' should start with '%s_'", [k, name]),
	}
}

has_property_value(value, name) if {
	pattern := sprintf("{{\\s*%s_.*?\\s*}}", [name])
	not regex.match(pattern, value)
}

is_jinja(value) if {
	pattern := `{{.*?}}`
	regex.match(pattern, value)
}
