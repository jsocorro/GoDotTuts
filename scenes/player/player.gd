extends CharacterBody2D

var can_laser: bool = true;
var can_granade: bool = true;

signal laser(pos, direction)
signal granade(pos, direction)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide();
	
	#rotatee
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	#laser shooting
	if Input.is_action_pressed("primary action") and can_laser:
		$GPUParticles2D.emitting = true;
		var markers = $LaserStartPositions.get_children()
		var selected_laser =  markers[randi() %  markers.size()]
		
		can_laser = false
		
		$LaserTimer.start()
		laser.emit(selected_laser.global_position, player_direction)
	
		
	if Input.is_action_pressed("secondary action") and can_granade:
		var markers = $LaserStartPositions.get_children()
		var pos =  markers[0].global_position
		
		can_granade = false
		$GranadeReloadTimer.start()
		granade.emit(pos, player_direction)
		print('pow pow')
		


func _on_timer_timeout():
	can_laser = true;
	

func _on_granade_reload_timer_timeout():
	can_granade = true;

func take_damage(amount: int):
	print(amount)
