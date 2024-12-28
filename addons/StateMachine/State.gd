@icon("res://addons/StateMachine/Assets/StateIcon.svg")
class_name State extends Node

# DO NOT EDIT THIS SCRIPT
# VIEW IN INSPECTOR -> BOTTOM -> SCRIPT -> RIGHT CLICK -> EXTEND SCRIPT

signal transitioned(new_state_name : StringName);

func Enter() -> void:
	process_mode = PROCESS_MODE_INHERIT;

func Exit() -> void:
	process_mode = PROCESS_MODE_DISABLED;

func Process(_delta : float) -> void:
	pass;

func Physics_Process(_delta : float) -> void:
	pass;

func Handle_Input(event : InputEvent) -> void:
	pass;
