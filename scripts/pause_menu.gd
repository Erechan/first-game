extends CanvasLayer

@export var pause_panel: Panel
@onready var virtual_joystick: VirtualJoystick = $"../UI/Virtual_Joystick"
@onready var android_control_jump: Button = $"../UI/AndroidControl_JUMP"
@export var pause_btn: TextureButton
@export var resume_btn: Button
@export var quit_btn: Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_btn.pressed.connect(_on_pause_click)
	resume_btn.pressed.connect(_on_resume_click)
	quit_btn.pressed.connect(_on_quit_click)
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Esc"):
		if not get_tree().paused:
			_on_pause_click()
		elif get_tree().paused:
			_on_resume_click()
			
#暂停函数
func _on_pause_click():
	get_tree().paused = true
	pause_panel.visible = true
	virtual_joystick.visible = false
	android_control_jump.visible = false

#继续函数
func _on_resume_click():
	get_tree().paused = false
	pause_panel.visible = false
	virtual_joystick.visible = true
	android_control_jump.visible = true
	
#退出游戏函数
func _on_quit_click():
	get_tree().quit()
