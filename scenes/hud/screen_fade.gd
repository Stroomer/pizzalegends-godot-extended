extends ColorRect

signal faded_in;
signal faded_out;

func fade_in()->void:
	visible = true;
	var duration = 1.0;
	var tween = get_tree().create_tween();
	
	# Start invisible, go full
	color = Color(Color.WHITE, 0.0);
	tween.tween_property(self, "color", Color(Color.WHITE, 1.0), duration);
	await tween.finished;
	print("fully faded in");
	emit_signal("faded_in");

func fade_out()->void:
	visible = true;
	var duration = 1.0;
	var tween = get_tree().create_tween();
	
	# Start invisible, go full
	color = Color(Color.WHITE, 1.0);
	tween.tween_property(self, "color", Color(Color.WHITE, 0.0), duration);
	await tween.finished;
	visible = false;
	print("fully faded out");
	emit_signal("faded_out");
