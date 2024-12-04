package Spotter

SpotterPolicy[result] {
	task := input.tasks[i]
	password_expired := task.task_args["ansible.windows.win_user"].password_expired

    password_expired == false 

	result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"subcode": "WinPasswordExpired",
		"message": "When creating a new user make sure that password is expired.",
        "abc": password_expired
	}
}

SpotterPolicy[result] {
	task := input.tasks[i]
	password_never_expires := task.task_args["ansible.windows.win_user"].password_never_expires

    password_never_expires == true 

	result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"subcode": "WinPasswordExpDate",
		"message": "When creating a new user make sure that has an expiration date.",
        "abc": password_never_expires
	}
}