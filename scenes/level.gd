extends Node2D

var laser_scene: PackedScene = preload("res://scenes/player/laser.tscn")
var granade_scene: PackedScene = preload("res://scenes/player/granade.tscn")

func _on_gate_player_entered_gate(body):
	print('player has entered gate')
	print(body)
	

func _on_player_granade(pos, direction):
	var granade = granade_scene.instantiate() as RigidBody2D
	granade.position = pos
	granade.linear_velocity = direction * granade.speed
	$Projectiles.add_child(granade)
	print('granade')


func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
	print('laser')




func _on_drone_object_detected(body):
	if body.has_method("take_damage"):
		print(body)
		body.take_damage(10)
		
	


func _on_drone_object_exited(body):
	print("exit")
	
	


func _on_drone_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
	print('laser')
