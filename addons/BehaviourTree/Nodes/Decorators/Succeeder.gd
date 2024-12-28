@icon("res://addons/BehaviourTree/Assets/SucceederIcon.svg")
@tool class_name Succeeder extends Decorator

# Succeeders always succeed, independent of their child nodes.
# Success --> Success.
# Failure --> Success.
# Running --> Running.

func tick(actor, blackboard) -> NodeStatus:
	var response : NodeStatus = get_child(0).tick(actor, blackboard);
	if (response == NodeStatus.RUNNING): return response;
	return NodeStatus.SUCCESS;
