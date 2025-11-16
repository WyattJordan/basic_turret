extends Node3D

var vel = Vector3(2,2,2)
var gravity: float = -9.81

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

func set_vel(velocity: Vector3) -> void:
	vel = velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	vel.y = vel.y + gravity * delta
	position.z = position.z + vel.z * delta
	position.y = position.y + vel.y * delta
	position.x = position.x + vel.x * delta
