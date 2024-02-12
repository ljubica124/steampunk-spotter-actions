package Spotter

SpotterPolicy[result] {
	task := input.tasks[i]
	volume_size := task.task_args["amazon.aws.ec2_instance"].volumes[j].ebs.volume_size
    
    volume_size >= 128
	result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"subcode": "AWS_VMSize",
		"message": "Volume size should be set to less then 128GB.",
	}
}
