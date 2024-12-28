class_name Blackboard extends RefCounted

var blackboard : Dictionary = {};

func set_value(key : String, value : Variant, blackboard_name : String = "default") -> void:
	if (!blackboard.has(blackboard_name)):
		blackboard[blackboard_name] = {};
	blackboard[blackboard_name][key] = value;

# Returns any type depending on value, so no return type.
func get_value(key : String, default_value : Variant = null, blackboard_name : String = "defualt") -> Variant:
	if (blackboard.has(blackboard)):
		return blackboard[blackboard_name].get(key, default_value);
	return default_value;

func erase(key : String, blackboard_name : String = "default") -> void:
	if (blackboard.has(blackboard_name)):
		blackboard[blackboard_name].erase(key);
