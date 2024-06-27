extends CharacterBody3D

@onready var camera = $Camera3D
@onready var dialog = $"../DIALOG"


var SPLERP = 9
var FOVIEW = {"NORMAL" : 80 , "SPEED" : 90}
var speed = 20.0
var jump_velocity
var direction = Vector3()
var accel = accel_normal
var object

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const accel_normal = 10.0
const accel_in_air = 1.0
const SPRINT_VELOCITY = 2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	print("player entered world")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		if Input.is_action_pressed("sprint"):
			velocity.x *= SPRINT_VELOCITY
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	move_and_slide()
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * .005)
		camera.rotate_x(-event.relative.y * .005)
		camera.rotation.x = clamp(camera.rotation.x, -PI/4, PI/4)
 
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()





