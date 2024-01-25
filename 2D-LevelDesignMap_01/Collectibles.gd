extends Area2D


# GRAVITY ----- #
@export var gravity_acceleration : float = 3840
@export var gravity_max : float = 1020
# ------------- #

var velocity = Vector2(0,0);
var is_falling = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	apply_gravity(delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func apply_gravity(delta: float) -> void:
	#var applied_gravity : float = 0
	
	#if is_falling:
	#	# Normal gravity limit
	#	if velocity.y <= gravity_max:
	#		applied_gravity = gravity_acceleration * delta
		
	#	velocity.y += applied_gravity
	#	position.y += velocity.y
	pass

func _on_body_entered(body):
	#print_debug("body... ", body);
	#if body is TileMap and is_falling:
	#	is_falling = false
	if body is CharacterBody2D:
		queue_free()
	pass

func _on_body_exited(body):
	#if body is TileMap and not is_falling:
	#	is_falling = true
	pass # Replace with function body.
