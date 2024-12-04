package Spotter

# Check if value of Name attribute starts with uppercase.
SpotterPolicy[result] {
	task := input.tasks[i]
	task_args := task.task_args["amazon.aws.ec2_instance"].security_group

   task_args = "default"
    result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"subcode": "DefaultSecurityGroup",
		"message": "Instances shouldn't be in default security groups."
	}
}
