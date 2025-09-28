extends Area2D

<<<<<<< Updated upstream
<<<<<<< Updated upstream
@export var next_scene: PackedScene
# Called when the node enters the scene tree for the first time.


func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file(next_scene.resource_path)
	
=======
@onready var timer: Timer = $"../Timer"
@onready var lava: Area2D = $"Lava"
@onready var player: Node2D = $"../Player"

# Called when the node enters the scene tree for the first time.
=======
@onready var timer: Timer = $"../Timer"
@onready var lava: Area2D = $"Lava"
@onready var player: Node2D = $"../Player"

# Called when the node enters the scene tree for the first time.
>>>>>>> Stashed changes
func _on_body_entered(body) -> void:
	if body.name.match("Player"):
		print("Lava Entered")
		timer.start()
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
