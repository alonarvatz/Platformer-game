#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Button

func _ready():
	if Database.SpeedBoostcap == 0 or Database.SpeedBoostnum == false:
		hide()
	else:
		show()

func _on_Button_pressed():
	if Database.SpeedBoostcap > 0 and Database.SpeedBoostcap == 8 or Database.SpeedBoostcap < 8:
		Database.SpeedBoostcap = Database.SpeedBoostcap - 1
		Database.SpeedBoost = 2950
		Database.SpeedBoostnum = false
	if Database2.Lives > 0 and Database2.is_boss_fite:
		Database2.Lives -= 1
	elif Database2.Lives == 0 and Database2.is_boss_fite:
		Database2.Bosshp = 100
		Database2.Lives = 12
	if Database2.playerhp == 0 or Database2.playerhp < 0:
			Database2.playerhp = 1
			if Database.coinsave > 100:
				Database.coinsave -= 100
			else:
				Database.coinsave = 0
	PlayerData.score = 0
	Database.SpeedBoostnum = true
	Database.lol = false
	Database.savegame()
	get_tree().paused = false
	get_tree().reload_current_scene()
