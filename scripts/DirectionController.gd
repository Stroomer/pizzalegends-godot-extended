extends Node

var held_directions = [];
var is_locked = false;
var directions = [
	["ui_left", Constants.DIRS.LEFT],
	["ui_right", Constants.DIRS.RIGHT],
	["ui_up", Constants.DIRS.UP],
	["ui_down", Constants.DIRS.DOWN]
];

func get_direction() -> Variant:
	if is_locked or held_directions.size() == 0:
		return null;
	return held_directions[0];

func set_locked(new_value:bool) -> void:
	is_locked = new_value;

func reset()->void:
	held_directions = [];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for direction in directions:
		var key = direction[0];		
		var value = direction[1];
		if Input.is_action_just_pressed(key):
			held_directions.push_front(value);
		if Input.is_action_just_released(key):
			held_directions = held_directions.filter(func(dir):
				return dir != value
			);
		
