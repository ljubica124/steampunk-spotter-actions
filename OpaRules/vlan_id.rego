package Spotter

SpotterPolicy[result] {
    task := input.tasks[i]
    vlan_id := task.task_args["cisco.ios.ios_vlans"].config[j].vlan_id

    forrbidden_vlan_id(vlan_id)

    result := {
        "correlation_id": task.task_id,
        "check_type": "TASK",
        "subcode": "Vlan_id",
        "message": sprintf("The vlan_id '%d' is already in use , use a different one.", [vlan_id])
    }
}

forrbidden_vlan_id(V_id) {
  forrbidden_vlans := [3333, 144, 1, 2024]
  V_id == forrbidden_vlans[_]
}
