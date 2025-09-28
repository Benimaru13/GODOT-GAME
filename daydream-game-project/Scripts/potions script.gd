extends Area2D

@export var size_change: float = 1.5  # e.g. 1.5 means grow by 50%
@onready var game_manager = %"Game Manager"
var score = 0

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		game_manager.potion_collected() # adjust path
	queue_free()
