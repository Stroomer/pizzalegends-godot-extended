extends Area2D

@export var go_to_map = '';
@export var spawn_at_position = Vector2();

var locked_for_seconds = 1.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", func(body):
		if locked_for_seconds > 0:
			return;
		# Listen for hero
		if body.name == "HERO":
			get_tree().call_group("cutscene_receivers", "cutscene_map_change_requested", go_to_map, spawn_at_position);	 
	);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if locked_for_seconds > 0:
		locked_for_seconds -= delta;
