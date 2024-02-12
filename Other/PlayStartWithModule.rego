package Spotter

SpotterPolicy[result] {
	task := input.tasks[0]
	not task.task_args["ansible.builtin.debug"]

	result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"subcode": "PlayStartWithModule",
		"message": "Playbook or Role must start with debug task, which prints the change-request message.",
		"submessage": "Playbook start task",
	}
}

SpotterPolicy[result] {
	task := input.tasks[0]
	task_name := task.task_args["ansible.builtin.debug"].msg
	not startswith(task_name, "Change-request:")

	result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"subcode": "PlayStartWithModule",
		"message": "Playbook or Role must start with debug task, which prints the change-request message.",
		"submessage": "Playbook start task",
        "abc": task_name
	}
}
