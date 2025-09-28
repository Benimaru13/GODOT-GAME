extends Area2D

@export var next_scene: PackedScene
# Called when the node enters the scene tree for the first time.


func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file(next_scene.resource_path)
	
