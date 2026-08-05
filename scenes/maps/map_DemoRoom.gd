extends "res://scripts/OverworldMap.gd"

func _init()-> void:
	interactives = {
		"person1": {
			"cutscenes": [
				{
				"requires": [],
				"events": [
					{
						"type": "STAND",
						"direction": "LEFT",
						"who": "person1",
						"duration": 1.2,
					},
					{
						"type": "STAND",
						"direction": "UP",
						"who": "person1",
						"duration": 2.2,
					},
					{
						"type": "TEXT_MESSAGE",
						"text": "Hallo Lotte!",
					},
					{
						"type": "TEXT_MESSAGE",
						"text": "Ik vind jou lief!!",
					},
					{
						"type": "WALK_TO_POSITION",
						"who": "person1",
						"position": [682,512],
					}
				]
			}
		]
	}
}
