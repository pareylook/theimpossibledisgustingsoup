extends Position2D

export (Array, PackedScene) var path_ball_nodes
onready var spawn_timer_node = $SpawnTimer
onready var ui_node = get_node("../LevelUI")
var index_of_array
var ball_instance
var direction = Vector2.ZERO

func _ready():
	direction = $Direction.global_position - global_position
	spawn_timer_node.connect("timeout", self, "on_spawn_timeout")
#	ui_node.connect("stat_game", self, "on_start_game")
	spawn_timer_node.start()

func spawn():
	index_of_array = round(rand_range(0, path_ball_nodes.size() - 1))
	ball_instance = path_ball_nodes[index_of_array].instance()
	ball_instance.position = self.global_position
	ball_instance.linear_velocity = direction.normalized() * rand_range(350, 500)
	get_parent().add_child(ball_instance)

func on_spawn_timeout():
	spawn()

func on_start_game():
	spawn_timer_node.start()
