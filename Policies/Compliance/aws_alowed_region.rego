package Spotter


SpotterPolicy[result] {
	task := input.tasks[i]
	region := task.task_args["amazon.aws.ec2_security_group"].region
        
    startswith(region, "eu") == false
	result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"subcode": "EU_Region",
		"message": "Region should be set to europe (eu-...)."
	}
}