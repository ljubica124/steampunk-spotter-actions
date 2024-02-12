package Spotter

SpotterPolicy[result] {
	task := input.tasks[i]
	volume_size := task.task_args["cisco.ios.ios_config"].lines[j]
    
    regex.match("^reboot", volume_size) == true
	result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"subcode": "Reboot",
		"message": "The command reboot is found in the task, this is not allowed. Please contact the Networking team for assistance.",
	}
}