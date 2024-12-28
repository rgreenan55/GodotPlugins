@tool class_name BehaviourTreeInternalNode extends BehaviourTreeNode

#Once 4.4 Releases I can use this format instead
#@export_tool_button("Add_Action", "Callable");
#var add_action_callable = add_action.bind();

const COMPOSITE_PATH : String = "res://addons/BehaviourTree/Nodes/Composites/"
@export_enum("Selector", "Sequencer") var Add_Composite : String :
	set(value): _add_composite(value);

const DECORATOR_PATH : String = "res://addons/BehaviourTree/Nodes/Decorators/"
@export_enum("Inverter", "Limiter", "Succeeder", "Failer") var Add_Decorator : String :
	set(value): _add_decorator(value);

@export var Add_Action : bool :
	set(value): _add_new_child(Action.new(), "Action");

@export var Add_Condition : bool :
	set(value): _add_new_child(Action.new(), "Condition");

func _add_composite(name : String) -> void:
	var composite_scene : GDScript = load(COMPOSITE_PATH + name + ".gd");
	var composite = composite_scene.new();
	_add_new_child(composite, name)

func _add_decorator(name : String) -> void:
	var decorator_scene : GDScript = load(DECORATOR_PATH + name + ".gd");
	var decorator = decorator_scene.new()
	_add_new_child(decorator, name)

func _add_new_child(child : Node, name : String) -> void:
	if (!Engine.is_editor_hint()): return;
	child.name = name + "_1";
	add_child(child, true);
	child.owner = get_owner();
