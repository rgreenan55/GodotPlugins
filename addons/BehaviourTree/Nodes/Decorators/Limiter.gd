@icon("res://addons/BehaviourTree/Assets/LimiterIcon.svg")
@tool class_name Limiter extends Decorator

# Limiters does not change the output but limits the amount of times the children can be called.
# Success --> Success.
# Failure --> Failure.
# Running --> Running.

@onready var cache_key = 'limiter_%s' % self.get_instance_id();
@export var max_count : float = 0;

func tick(actor, blackboard) -> NodeStatus:
	var current_count : float = blackboard.get(cache_key);
	if (current_count == null): current_count = 0;

	if (current_count <= max_count):
		blackboard.set(cache_key, current_count + 1);
		return self.get_child(0).tick(actor, blackboard);
	else:
		return NodeStatus.FAILURE;
