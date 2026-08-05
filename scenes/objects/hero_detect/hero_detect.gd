extends Area2D

var is_used = false;

func _ready() -> void:
	connect("body_entered", func(body):
		if !is_used and body.get("is_interactive"):
			is_used = true;
			get_tree().call_group("cutscene_receivers", "cutscene_lookup_requested", body);	
	);

var expires_in_time = 0.2;
func _process(delta: float) -> void:
	expires_in_time -= delta;
	if expires_in_time <= 0:
		queue_free();
