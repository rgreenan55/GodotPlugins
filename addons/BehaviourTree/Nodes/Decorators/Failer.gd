@icon("res://addons/BehaviourTree/Assets/FailerIcon.svg")
@tool class_name Failer extends Decorator

# Failers always fail, independent of their child nodes.
# Success --> Failure.
# Failure --> Failure.
# Running --> Running.

func tick(actor, blackboard) -> NodeStatus:
	var response : NodeStatus = get_child(0).tick(actor, blackboard);
	if (response == NodeStatus.RUNNING): return response;
	return NodeStatus.FAILURE;
