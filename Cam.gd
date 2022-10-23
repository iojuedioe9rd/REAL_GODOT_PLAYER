extends Camera2D




func _process(delta):
	var children = get_parent().get_children()
	
	for i in children:
		if i as Player != null:
			transform = i.global_transform
