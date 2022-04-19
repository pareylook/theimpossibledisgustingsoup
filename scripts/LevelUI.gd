extends CanvasLayer

onready var progress_bar_node = $MarginContainer/ProgressBar
onready var good_lael_node = $MarginContainer/GoodLabel
onready var bad_label_node = $MarginContainer/BadLabel
onready var tutur_label_node = $MarginContainer/Tutur

var game_value = 50
var is_game_ended
var is_tutur_ended
signal stat_game

func _ready():
	is_game_ended = false
	get_tree().paused = true
	
func _process(delta):
	if (Input.is_action_just_pressed("reload")):
		reload_game()
	if (Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")):
		emit_signal("stat_game")
		start_game()
		

func increase_game_value():
	game_value += 10
	write_result()
	if (game_value >= 100):
		good_end()
	
	
func decrease_game_value():
	game_value -= 10
	write_result()
	if (game_value <= 0):
		bad_end()
	

func write_result():
	progress_bar_node.value = game_value
	if (game_value > 50):
		progress_bar_node.tint_progress = Color.greenyellow
	elif (game_value < 50):
		progress_bar_node.tint_progress = Color.red
	else:
		progress_bar_node.tint_progress = Color.white
		


func good_end():
	is_game_ended = true
	good_lael_node.visible = true
	get_tree().paused = true
	
func bad_end():
	is_game_ended = true
	get_tree().paused = true
	bad_label_node.visible = true
	
func reload_game():
	if (is_game_ended):
		get_tree().reload_current_scene()

func start_game():
	tutur_label_node.visible = false
	get_tree().paused = false
