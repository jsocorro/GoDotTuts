extends CharacterBody2D

signal object_detected(body)
signal object_exited(body)
signal laser(pos, direction)
var can_laser: bool = true;
var can_pursue: bool = true;
var can_miss: bool = false;
var targetPos: Vector2
var targetDir: Vector2
var target: CharacterBody2D
func _process(delta):
	if target:
		look_at(target.position)
		
		var dir = (target.position - position)
		velocity = (dir * 10) * delta
		move_and_slide();
		if can_laser:
			can_laser= false
			$MissTimer.start()
			$LaserTimer.start()
			if can_miss:
				can_miss=false
				dir = (dir * 2).rotated(45)
				
			laser.emit(global_position, dir.normalized())
			
		if can_pursue:
			can_pursue= false
			
		
			


func _on_area_2d_body_entered(body):
	look_at(body.position)
	target = body;
	object_detected.emit(body)
	


func _on_area_2d_body_exited(body):
	object_exited.emit(body)
	target = null


func _on_laser_timer_timeout():
	can_laser=true;


func _on_miss_timer_timeout():
	can_miss=true;
