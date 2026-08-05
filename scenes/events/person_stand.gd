extends Node2D

signal done;

var config;
var seconds_left = 3.0;
var person;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	person = get_parent();
	seconds_left = config.duration;

func _process(delta) -> void:
	# Make sure facing direction is correct throughout this move
	person.sprite_direction = config.direction;
	
	seconds_left -= delta;
	if seconds_left <= 0:
		emit_signal("done");
		queue_free();
