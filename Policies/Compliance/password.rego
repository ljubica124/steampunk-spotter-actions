package Play

SpotterPolicy[result] {
	task := input.tasks[i]
	task_args := task.task_args
    no_log := task_args.no_log

	task_args[key]
	task_args[key][sub_key]
    regex.match("^fullname$" , sub_key)
#    x := key != "no_log"
#	regex.match("^no_log$", key)
    x := no_log != true
    x
    
	result := {
		"correlation_id": task.task_id,
		"check_type": "TASK",
		"message": "When using a parameter fullname, ensure that the Ansible task is run with parameter no-log.",
		"abc": no_log,
		"asc": x,
	}
}
