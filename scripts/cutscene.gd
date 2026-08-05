extends Node

var events;
var event_index = 0;
var main_ref;

signal cutscene_done;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_start_event();

func _start_event()->void:
	var event = events[event_index];
	
	if event.type == Constants.EVENTS.STAND:
		var stand = load("res://scenes/events/person_stand.tscn").instantiate();
		stand.config = event;
		var who = main_ref.get_object_by_name(event.who);
		who.set_cutscene_event(stand, self);
			
	if event.type == Constants.EVENTS.WALK_TO_POSITION:
		var walk_to_position = load("res://scenes/events/person_walk_to_position.tscn").instantiate();
		walk_to_position.config = event;
		var who = main_ref.get_object_by_name(event.who);
		who.set_cutscene_event(walk_to_position, self);
		
	if event.type == Constants.EVENTS.TEXT_MESSAGE:
		
		# Put a text message on the screen
		var text_message = load("res://scenes/hud/text_message.tscn").instantiate();
		text_message.text = event.text;
		get_parent().get_node("CanvasLayer").add_child(text_message);	
		
		# Wait for user to hit enter
		await text_message.on_complete;
		
		#Remove it and move on
		text_message.queue_free();
		_event_complete();
	
func on_event_complete()->void:
	_event_complete();	
	
func _event_complete()->void:
	event_index += 1;
	if event_index < events.size():
		_start_event();
		return;
	emit_signal("cutscene_done");
