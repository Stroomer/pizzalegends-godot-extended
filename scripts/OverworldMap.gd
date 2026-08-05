extends Node

var interactives = {};

func lookup_cutscene(id):
	var interactive = interactives.get(id);
	if interactive == null:
		return;
		
	# Find the first match	
	var relevant_match;
	for candidate in interactive.cutscenes:
		if true:
			relevant_match = candidate;	
	
	# If we found one, return to caller	
	if relevant_match:
		return relevant_match.events;
