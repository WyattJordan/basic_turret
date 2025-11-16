extends CSGSphere3D

var plBullet := preload("res://base_bullet.tscn")
@onready var turret = %turret
@onready var angle_slider = %"Angle Slider"
@onready var elev_slider = %"Elevation Sliders"
@onready var power_slider = %"Power Slider"
@onready var fire_button = %FIRE

var max_power = 0.1 # m/s

func _ready() -> void:
	_on_angle_changed(angle_slider.value)
	_on_elevation_changed(elev_slider.value)
	angle_slider.value_changed.connect(_on_angle_changed)
	elev_slider.value_changed.connect(_on_elevation_changed)
	fire_button.pressed.connect(_on_fire_button)

func _on_angle_changed(value: float) -> void:
	get_parent().rotation_degrees.y = value

func _on_elevation_changed(value: float) -> void:
	rotation_degrees.x = 90 - value

func _on_fire_button() -> void:
	print("FIRING CANNON!")
	var bullet := plBullet.instantiate()
	var dir_vec = turret.global_transform.basis.y
	var start_position = turret.global_position + dir_vec * turret.height / 2
	print("direction is:")
	print(dir_vec)
	bullet.set_vel(dir_vec * power_slider.value)
	bullet.position = start_position
	
	get_tree().current_scene.add_child(bullet)
