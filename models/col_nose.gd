extends RayCast

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
func _process(delta):
	if self.is_colliding():
		var obj = self.get_collider()
		print(self.get_name() + " collided with " + obj.get_name())
		
		