extends Control

var text = "Default Text";
var is_done = false;
var time_till_next_character = 0;

const ROLLOUT_SECONDS = 0.08;

signal on_complete;

func _ready() -> void:
	$Label.text = text; 
	$Label.visible_characters = 0;
	
func _process(delta: float) -> void:
	if is_done and Input.is_action_just_pressed("ui_accept"):
		emit_signal("on_complete");
		return;
	if !is_done:
		if Input.is_action_just_pressed("ui_accept"):
			is_done = true;
			$Label.visible_characters = -1;
			return;
		time_till_next_character -= delta;
		if time_till_next_character <= 0:
			time_till_next_character = ROLLOUT_SECONDS;
			$Label.visible_characters += 1;
			if text.length() > $Label.visible_characters:
				var next_char = text[$Label.visible_characters];
				if next_char == " ":
					time_till_next_character = 0;
			else:
				is_done = true;
										
					
