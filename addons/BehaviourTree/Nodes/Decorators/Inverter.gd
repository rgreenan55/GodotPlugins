@icon("res://addons/BehaviourTree/Assets/InverterIcon.svg")
@tool class_name Inverter extends Decorator

# Inverters invert the result of their child nodes
# Success --> Failure.
# Failure --> Success.
# Running --> Running.

func tick(actor, blackboard) -> NodeStatus:
	var response : NodeStatus = get_child(0).tick(actor, blackboard);
	if (response == NodeStatus.FAILURE): return NodeStatus.SUCCESS;
	if (response == NodeStatus.SUCCESS): return NodeStatus.FAILURE;
	return NodeStatus.RUNNING;
