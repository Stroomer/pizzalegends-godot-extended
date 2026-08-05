extends Node

func vec_to_dir(input_vector2:Vector2)->Vector2:
	if input_vector2 == Vector2.ZERO:
		return Vector2.ZERO;
	var aspect = abs(input_vector2.aspect());
	var result = input_vector2.sign();
	if aspect < 0.557852 or aspect > 1.79259:
		result[int(aspect > 1.0)] = 0;
	return result;
