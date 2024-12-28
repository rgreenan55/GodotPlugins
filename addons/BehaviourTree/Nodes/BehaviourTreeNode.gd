class_name BehaviourTreeNode extends Node

# Return Types
enum NodeStatus { SUCCESS, FAILURE, RUNNING };

# Actor is the node in which actions are applied to. [ Player, Goblin, etc ].
# Blackboard is used for sharing data between Nodes.
func tick(actor, blackboard) -> NodeStatus:
	return NodeStatus.SUCCESS;
