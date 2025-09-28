# GameManager.gd
extends Node

var total_potions: int = 0
var collected_potions: int = 0

func _ready():
	# Count all potions at start
	total_potions = get_tree().get_nodes_in_group("Potion").size()
	collected_potions = 0

func potion_collected():
	collected_potions += 1
	if collected_potions >= total_potions:
		# All potions collected
		emit_signal("all_potions_collected") # optional, if you want to signal the player
	print(collected_potions)
