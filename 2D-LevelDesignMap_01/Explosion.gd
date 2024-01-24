extends Area2D

var exploded = false;
const Player = preload("res://Player/Player.tscn")
const bomb_push_speed = 150;
const explosion_time_to_death = 1;
const explosion_active_time = 0.2;
var time_count = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_count += delta
	modulate.a = clampf(1 - time_count / explosion_time_to_death, 0, 1)
	if time_count >= explosion_time_to_death:
		queue_free()
	pass


func _on_body_entered(body):
	print_debug('test', body.position, position);
	if not exploded:
		if body is CharacterBody2D:
			body.explosion_vector = (body.position - position).normalized() * bomb_push_speed
			exploded = true;
	pass # Replace with function body.
