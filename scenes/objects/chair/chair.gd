@tool
extends StaticBody2D

var sprite_map = {
	"Green": "res://art/objects/chair-green.png",
	"Blue":  "res://art/objects/chair-blue.png",
};

@export_enum("Green", "Blue")
var use_color := "Blue":
	set(new_use_color):
		use_color = new_use_color;
		if is_node_ready():
			_update_sprite();

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_sprite();

func _update_sprite() -> void:
	$chair_Sprite.texture = load(sprite_map[use_color]);
