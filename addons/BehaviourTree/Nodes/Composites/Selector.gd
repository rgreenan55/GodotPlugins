@icon("res://addons/BehaviourTree/Assets/SelectorIcon.svg")
@tool class_name Selector extends Composite

# Selectors assume that at least one child will succeed.
# Execute in order, until one succeeds, then end procedure.

func tick(actor, blackboard) -> NodeStatus:
	for child : BehaviourTreeNode in get_children():
		var response : NodeStatus = child.tick(actor, blackboard);
		if (response == NodeStatus.SUCCESS): return response;
	return NodeStatus.FAILURE;
