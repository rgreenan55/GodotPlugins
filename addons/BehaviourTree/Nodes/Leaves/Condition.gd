@icon("res://addons/BehaviourTree/Assets/ConditionIcon.svg")
class_name Condition extends Leaf

func tick(actor, blackboard) -> NodeStatus:
	return NodeStatus.SUCCESS;

# DO NOT EDIT THIS SCRIPT - GOTO INSPECTOR -> AT BOTTOM -> SCRIPT -> RIGHT CLICK -> EXTEND SCRIPT
