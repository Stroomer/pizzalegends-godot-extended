extends Camera2D

var _following_node;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if _following_node:
		position = _following_node.position;

func set_following(node) -> void:
	_following_node = node;	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if _following_node and is_instance_valid(_following_node):
		var distance = position.distance_to(_following_node.position);
		if distance > 3:
			position = position.lerp(_following_node.position, 0.06);
