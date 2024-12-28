@tool class_name Composite extends BehaviourTreeInternalNode

func _ready() -> void:
	if (!Engine.is_editor_hint() && self.get_child_count() < 1):
		push_error("BehaviourTree Error: Composite %s should have at least one child." % self.name);
