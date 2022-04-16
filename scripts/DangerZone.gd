extends Area2D

onready var lvl_ui_node = get_node("../LevelUI")

func _ready():
	pass
	self.connect("body_entered", self, "on_body_entered")
	
func on_body_entered(body):
	pass
	if (body.is_in_group("bad")):
		pass
		lvl_ui_node.decrease_game_value()
	elif(body.is_in_group("good")):
		pass
		lvl_ui_node.increase_game_value()
	body.queue_free()
