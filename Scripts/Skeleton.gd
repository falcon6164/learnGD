extends CharacterBody2D

#基礎數值
@export var MoveSpeed: int = 80
@export var HP: int = 15
@export var Damage: int = 1
@export var KnockbackRecovery: float = 240.0
@export var Experience: int = 10
@export var Gold: int = 10
var damageable: bool = true
#隨關卡提升的升級幅度 (百分比?)
@export var SpeedScale = 1
@export var HPScale = 1
@export var DamageScale = 1
@export var ExpScale = 1

@onready var animation = $AnimatedSprite2D
@onready var direction = 1
@onready var Player = get_tree().get_first_node_in_group("Player")
#狀態機
enum States {idle, move, dead}
@onready var current_state: States = States.idle

func _physics_process(_delta):
#移動
	if direction:
		current_state = States.move
		animation.play("move")
		if velocity.x < MoveSpeed:
			velocity.x += KnockbackRecovery * _delta
			if velocity.x >= MoveSpeed:
				velocity.x = MoveSpeed
		else:
			velocity.x = direction * MoveSpeed
	#else:
	#	animation.play("idle")
	move_and_slide()

func take_damage(source_dmg: int, source_knockback: float):
	if damageable:
		HP -= source_dmg
		velocity.x -= source_knockback
		print("knockback: ", source_knockback, "\nVelocity.x: ", velocity.x)
		$SoundHurt.play()
		
		if HP <= 0:
			damageable = false
			die()


func die():
	Player.Get_Loot(Experience, Gold)
	direction = 0
	velocity.x = 0
	current_state = States.dead
	$SoundDead.play()
	animation.play("dead")
	$QueueFreeTimer.start()

func _on_hurt_box_body_entered(body):
	if body.is_in_group("Projectiles"):
		if damageable:
			take_damage(body.damage, body.knockback)
			print("Hurtbox Damage: ", body.damage, "\nHurtbox Knockback: ", body.knockback)
			body.HP -= 1
		

func _on_queue_free_timer_timeout():
	self.queue_free()
