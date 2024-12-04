package Spotter

SpotterPolicy[result] {
    task := input.tasks[i]
    task_args := task.task_args["amazon.aws.ec2_security_group"].access_key
    regex.match("{{.*}}", task_args) == false

    result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
        "subcode": "PlainText_Variable",
		"message": "Access key should be written as a variable, not plain text!"
	}
}
