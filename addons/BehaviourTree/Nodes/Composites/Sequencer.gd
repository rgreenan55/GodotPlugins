@icon("res://addons/BehaviourTree/Assets/SequenceIcon.svg")
@tool class_name Sequencer extends Composite

# Squencers assume that all of the leaf nodes within it will succeed.
# Run each leaf node in order until complete or one fails.
# In he event that one of these leaf nodes fail to run, the sequencers ends procedures.

func tick(actor, blackboard) -> NodeStatus:
	for child : BehaviourTreeNode in get_children():
		var response : NodeStatus = child.tick(actor, blackboard);
		if (response == NodeStatus.FAILURE): return response;
	return NodeStatus.SUCCESS;
