@tool class_name Decorator extends BehaviourTreeInternalNode

func _ready() -> void:
	if (!Engine.is_editor_hint() && self.get_child_count() != 1):
		push_error("BehaviourTree Error: Decorator %s should have only one child." % self.name);
