extends Node2D

signal done;

var config;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var person = get_parent();
	
	# Create destination
	var destination = load("res://scenes/objects/destination/destination.tscn").instantiate();
	destination.alert_on_body = person;
	
	# Set the position from config
	var x = config.position[0];
	var y = config.position[1];
	destination.position = Vector2(x, y);
	
	# Set person's override destination
	person.override_destination_scene = destination;
	person.get_parent().add_child.call_deferred(destination);
	
	# Notify us when you get there 
	await destination.intended_body_entered;
	
	person.override_destination_scene = null;
	destination.queue_free();
	emit_signal("done");
