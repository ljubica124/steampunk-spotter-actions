package Spotter

SpotterPolicy[result] {
    task := input.tasks[i]
    rule := task.task_args["community.general.ufw"].rule
    port := task.task_args["community.general.ufw"].port
    from_ip := task.task_args["community.general.ufw"].from_ip

    forbidden_allowed_ports(port)


    result := {
        "correlation_id": task.task_id,
        "check_type": "TASK",
        "subcode": "Oppening_Forbiden_Ports",
        "message": sprintf("Opening port '%d' to '%s' traffic from ip address '%s' is not allowed.", [port, rule, from_ip])
    }
}

forbidden_allowed_ports(prt) {
    forbidden_ports := [ 22, 80]
    prt == forbidden_ports[_]
}

