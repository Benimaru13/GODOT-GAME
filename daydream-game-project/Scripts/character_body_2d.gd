extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
const falling = true
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite.play("fall")


	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY / 4
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
		animated_sprite.play("run")
		animated_sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("idle")

	move_and_slide()
	
@export var base_scale: Vector2 = Vector2.ONE
var size_multiplier: float = 1.0  # how “big” the player is

func _ready():
	_update_scale()

func _update_scale():
	self.scale = base_scale * size_multiplier

# call this from potions or other items
func apply_size_change(multiplier: float):
	size_multiplier *= multiplier  # e.g. x2 or x0.5
	_update_scale()
