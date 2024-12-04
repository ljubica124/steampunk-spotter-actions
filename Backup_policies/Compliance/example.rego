package Spotter

SpotterPolicy[result] {
	task := input.tasks[i]
	task_args := task.task_args

	regex.match("^[A-Z].*", task_args.name) == false

    result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"subcode": "CapitalLetter",
		"message": "Task names must start with a capital letter."
	}
}

SpotterPolicy[result] {
	task := input.tasks[i]
	task_args := task.task_args

	regex.match("\\.$", task_args.name) == false
    
    result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"subcode": "EndWithDot",
		"message": "Task names must end with a dot."
	}

}

SpotterPolicy[result] {
	task := input.tasks[i]
	task_args := task.task_args

	not task_args.name

    result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"subcode": "TaskName",
		"message": "Each task must have a corresponding name attribute."
	}
}

SpotterPolicy[result] {
	task := input.tasks[i]
	task_args := task.task_args

	task_args.name == null

    result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"subcode": "TaskNameEmpty",
		"message": "Name should not be empty."
	}
}

