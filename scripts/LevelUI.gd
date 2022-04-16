extends CanvasLayer

onready var progress_bar_node = $MarginContainer/ProgressBar
var game_value = 50


func increase_game_value():
	game_value += 10
	write_result()
	
	
func decrease_game_value():
	game_value -= 10
	write_result()
	

func write_result():
	progress_bar_node.value = game_value


