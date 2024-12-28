class_name Leaf extends BehaviourTreeNode

func _ready() -> void:
	if (self.get_child_count() != 0):
		push_error("BehaviourTree Error: Leaf %s should have no children." % self.name);
