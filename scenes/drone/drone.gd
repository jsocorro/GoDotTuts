extends CharacterBody2D

func _draw():
	pass

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#direction
	var direction = Vector2.DOWN;
	
	#velocity
	velocity = direction * 400
	#move and slide
	move_and_slide();
	


