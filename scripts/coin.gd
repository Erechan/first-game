extends Area2D



func _on_body_entered(body: Node2D) -> void:
	print("加一个金币")
	queue_free()
