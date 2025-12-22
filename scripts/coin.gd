extends Area2D

@onready var game_manager: Node = %GameManager
@onready var pickup_sound: AudioStreamPlayer2D = $PickupSound
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var coin: Area2D = $"."
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	pickup_sound.play()
	coin.visible = false
	set_deferred("monitoring",false)
	timer.start()

func _on_timer_timeout():
	print("time is out")
	queue_free()
