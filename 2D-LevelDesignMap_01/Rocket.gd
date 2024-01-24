extends Area2D

var speed = 600
var velocity = Vector2(0.0, 0.0)
const Explosion = preload("res://Explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	position += velocity * delta;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	print_debug("colliding", body)
	if body is TileMap:
		print_debug("colliding w/ wall", body)
		var explosion = Explosion.instantiate();
		explosion.position = position
		get_parent().add_child(explosion)
		queue_free()
	pass # Replace with function body.
