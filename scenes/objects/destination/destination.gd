extends Area2D

var alert_on_body;

signal intended_body_entered;

func _ready() -> void:
	connect("body_entered", _on_body_entered);

func _on_body_entered(body) -> void:
	if body == alert_on_body:
		emit_signal("intended_body_entered");
