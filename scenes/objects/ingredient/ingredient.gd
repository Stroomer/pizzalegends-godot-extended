@tool
extends StaticBody2D

var sprite_map = {
	"Anchovy": "res://art/objects/ingredients/cheese.png",
	"Brocolli": "res://art/objects/ingredients/brocolli.png",
	"Cheese": "res://art/objects/ingredients/cheese.png",
	"Egg": "res://art/objects/ingredients/garliegg.png",
	"Garlic": "res://art/objects/ingredients/garlic.png",
	"Mushroom": "res://art/objects/ingredients/mushroom.png",
	"Olives": "res://art/objects/ingredients/olives.png",
	"Onion": "res://art/objects/ingredients/onion.png",
	"Pepper": "res://art/objects/ingredients/pepper.png",
	"Pepperoni": "res://art/objects/ingredients/pepperoni.png",
	"Salmon": "res://art/objects/ingredients/salmon.png",
	"Tomato": "res://art/objects/ingredients/tomato.png",
};

@export_enum("Anchovy", "Brocolli", "Cheese", "Egg", "Garlic", "Mushroom", "Olives", "Onion", "Pepper", "Pepperoni", "Salmon", "Tomato")
var use_type := "Cheese":
	set(new_use_type):
		use_type = new_use_type;
		if is_node_ready():
			_update_sprite();

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_sprite();

func _update_sprite() -> void:
	$ingredient_Sprite.texture = load(sprite_map[use_type]);
