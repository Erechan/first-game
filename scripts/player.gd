extends CharacterBody2D

@export var SPEED: float = 130.0
@export var JUMP_VELOCITY: float = -300.0
@export var joystick: VirtualJoystick  # 摇杆节点引用
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# 1. 重力处理
	if not is_on_floor():
		velocity += get_gravity() * delta

	# 2. 合并摇杆+键盘的移动方向
	var move_dir: Vector2 = Vector2.ZERO
	# 摇杆方向
	if joystick:
		move_dir = joystick.output
	# 键盘方向（补充兼容）
	move_dir.x = move_dir.x if move_dir.x != 0 else Input.get_axis("move_left", "move_right")

	# 3. 移动赋值
	velocity.x = move_dir.x * SPEED
	move_and_slide()

	# 4. 跳跃处理
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# 5. 精灵翻转（基于移动方向）
	if move_dir.x > 0:
		animated_sprite_2d.flip_h = false
	elif move_dir.x < 0:
		animated_sprite_2d.flip_h = true
		
#补充移动端用跳跃键来跳！！！
func _on_android_control_jump_pressed() -> void:
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
