extends Node2D

var loaded_map;
var camera;

func _ready() -> void:
	# Subscribe to cutscene manager group
	add_to_group("cutscene_receivers");
	
	_start_map("map_DemoRoom", null, Constants.DIRS.DOWN);  # map_DemoRoom map_City


func _start_map(map_name, hero_start_position=null, hero_direction=Constants.DIRS.DOWN) -> void:
	
	var map_scene_path = "res://scenes/maps/{map_name}.tscn".format({"map_name": map_name});
	loaded_map = load(map_scene_path).instantiate();
	#var loaded_map = load("res://scenes/maps/map_City.tscn").instantiate();
	add_child.call_deferred(loaded_map);
	
	var hero = load("res://scenes/objects/person/person.tscn").instantiate();
	hero.name = "HERO";
	hero.is_controllable = true;
	hero.sprite_direction = hero_direction;
	
	var hero_spawn = loaded_map.get_node("hero_spawn");
	hero_spawn.visible = false;
	
	if hero_start_position:
		hero.position = hero_start_position;
	else:
		hero.position = hero_spawn.position;
	
	loaded_map.get_node("objects").add_child(hero);
	
	camera = load("res://scenes/camera_2d.tscn").instantiate();
	camera.set_following(hero);
	add_child(camera);
	camera.make_current();
	
	#await get_tree().create_timer(3.2).timeout;
	#start_cutscene([
		#{
			#"type": Constants.EVENTS.TEXT_MESSAGE,
			#"text": "HELLO THERE!"	
		#},
		#{
			#"type": Constants.EVENTS.TEXT_MESSAGE,
			#"text": "This is what i say next..."	
		#}
	#]);

func get_object_by_name(node_name:String)->Node2D:
	return loaded_map.get_node("objects").get_node(node_name);

func start_cutscene(events)-> void:
	var cutscene = load("res://scripts/cutscene.gd").new();	
	cutscene.events = events;
	cutscene.main_ref = self;
	add_child(cutscene);
	
	$CanvasLayer/cutscene_Sprite.visible = true;
	DirectionController.set_locked(true);
	
	await cutscene.cutscene_done;
	
	cutscene.queue_free();
	$CanvasLayer/cutscene_Sprite.visible = false;
	
	await get_tree().create_timer(0.2).timeout;
	DirectionController.set_locked(false);

func cutscene_lookup_requested(body)->void:
	var events = loaded_map.lookup_cutscene(body.name);
	if events:
		start_cutscene(events);

func cutscene_map_change_requested(go_to_map, go_to_position)->void:
	# Fade in the fader
	var fader = $CanvasLayer/screen_fade;
	fader.fade_in();
	await fader.faded_in;
	
	# Register current sprite_direction of hero
	var hero_direction = get_object_by_name("HERO").sprite_direction;
	
	# Change the map
	camera.queue_free();
	loaded_map.queue_free();
	_start_map(go_to_map, go_to_position, hero_direction);
	
	await get_tree().create_timer(0.2).timeout;
	fader.fade_out();
	await fader.faded_out;
