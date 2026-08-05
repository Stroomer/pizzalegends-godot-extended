extends Control

func _ready()->void:
	visible = false;

func pause_game()->void:
	get_tree().paused = true;
	visible = true;
	DirectionController.reset();
	
func unpause_game()->void:
	get_tree().paused = false;
	visible = false;

func _process(_delta)->void:
	if Input.is_action_just_pressed("ui_cancel") and !DirectionController.is_locked:
		if get_tree().paused:
			unpause_game();
		else:
			pause_game();	
