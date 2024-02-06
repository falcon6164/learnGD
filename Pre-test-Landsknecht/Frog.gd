extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health = 10
var chase = false
var SPEED = 50

@onready
var player = get_node("../../Player/Player")

func _ready():
	get_node("AnimatedSprite2D").play("idle")
	
func _physics_process(delta):
	velocity.y+= gravity * delta
	if chase == true and get_node("AnimatedSprite2D").animation != "death":
		var direction = (player.position - self.position).normalized()
		get_node("AnimatedSprite2D").play("jump")
		if direction.x > 0:
				velocity.x = direction.x * SPEED
				get_node("AnimatedSprite2D").flip_h = true
		else:
				velocity.x = direction.x * SPEED
				get_node("AnimatedSprite2D").flip_h = false
	else:
		if get_node("AnimatedSprite2D").animation != "death":
			get_node("AnimatedSprite2D").play("idle")
		velocity.x = 0
	move_and_slide()
	
func _on_vision_body_entered(body):
	if body.name == "Player":
		chase = true
		print("Entering Frog vision")
		print(player.global_position)

func _on_vision_body_exited(body):
	if body.name == "Player":
		chase = false
		print("Leaving Frog vision")
		print(player.global_position)

func _on_hit_head_area_body_entered(body):
	if body.name == "Player":
		Settings.score += 5
		Utils.saveGame()
		chase = false
		get_node("AnimatedSprite2D").play("death")
		await get_node("AnimatedSprite2D").animation_finished
		self.queue_free()


func _on_player_collision_body_entered(body):
	if body.name == "Player":
		body.health -= 3
