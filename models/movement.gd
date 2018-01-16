extends Spatial

# class member variables go here, for example:
var throttle = 0.2
var speed = throttle
var lower_speed_limit = 0.1
var upper_speed_limit = 0.7

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
func _process(delta):
	if Input.is_action_pressed("dive"):
		self.rotate_x((speed * -1) / 2)
	if Input.is_action_pressed("rise"):
		self.rotate_x(speed / 2)
	if Input.is_action_pressed("yaw_l"):
		self.rotate_y((speed * -1) / 2)	
	if Input.is_action_pressed("yaw_r"):
		self.rotate_y(speed / 2)	
	if Input.is_action_pressed("roll_l"):
		self.rotate_z(speed / 2)	
	if Input.is_action_pressed("roll_r"):
		self.rotate_z((speed * -1) / 2)
	if Input.is_action_pressed("throttleUp"):
		if speed < upper_speed_limit:
			speed = speed + 0.01
		else:
			pass
	if Input.is_action_pressed("throttleDown"):
		if speed > lower_speed_limit: 
			speed = speed - 0.01
		else:
			pass
	if get_node("Nose").is_colliding() or get_node("LWing").is_colliding() or get_node("RWing").is_colliding():
		self.speed = 0
		self.translate(Vector3(0, 0, -5))
		self.speed = self.throttle / 2
	self.translate(Vector3(0, 0, speed))