@icon("res://addons/StateMachine/Assets/StateMachineIcon.svg")
class_name StateMachine extends Node

# DO NOT EDIT THIS SCRIPT
# VIEW IN INSPECTOR -> BOTTOM -> SCRIPT -> RIGHT CLICK -> EXTEND SCRIPT

@export var current_state : State;
var states : Dictionary = {};

func _ready() -> void:
	if (current_state): current_state.Enter();
	else: push_warning(self.name, " no default state.")
	for state in get_children():
		if (state is State):
			states[state.name] = state;
			state.parent = get_parent();
			state.transitioned.connect(on_child_transitioned);
		else:
			push_warning("State Machine | ", self.name, " | contains child which is not a 'State': ", state.name);

func _process(delta: float) -> void:
	current_state.Process(delta);

func _physics_process(delta: float) -> void:
	current_state.Physics_Process(delta);

func _unhandled_input(event: InputEvent) -> void:
	current_state.Handle_Input(event);

func on_child_transitioned(new_state_name : StringName) -> void:
	var new_state = states.get(new_state_name);
	if (new_state == current_state): return;
	if (new_state != null):
		current_state.Exit();
		new_state.Enter();
		current_state = new_state;
	else:
		push_warning(self.name, ": called transition on state that does not exist");
