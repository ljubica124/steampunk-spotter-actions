package Spotter

SpotterPolicy[result] {
    task := input.tasks[i]
    password := task.task_args["ansible.builtin.set_fact"].u_password

    forbidden_password(password)


    result := {
        "correlation_id": task.task_id,
        "check_type": "TASK",
        "subcode": "User_password",
        "message": sprintf("The user password is set to '%s', which is one of the forbiden passwords.", [password]),
        "level": "error"
    }
}

forbidden_password(pwd) {
    forbidden_passwords := ["admin", "password", "test"]
    pwd == forbidden_passwords[_]
}

