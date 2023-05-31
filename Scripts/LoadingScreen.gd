extends Sprite2D

@onready var loading_sprites_data = get_node("/root/LoadEntities")


# Called when the node enters the scene tree for the first time.
func _ready():
	var data = loading_sprites_data.get_data()
	for data1 in data:
		if data1[1] != "static":
			var script := load("res://Scripts/LoadRLE.gd")
			var images = script.LoadRLE("{0}\\loading\\sprites\\{1}.rle".format({1:data1[0], 0:loading_sprites_data.game_data_path.path}))
			
			var sprite = Sprite2D.new()
			sprite.texture = ImageTexture.create_from_image(images[0])
			$".".add_child(sprite)
			
		var file_path = "{0}\\loading\\sprites\\{1}.jpg".format({1:data1[0], 0:loading_sprites_data.game_data_path.path})
		var img = Image.new()
		img.load(file_path)
		var texture = ImageTexture.create_from_image(img)
		if texture != null:
			$".".texture = texture
			$".".centered = false
			var viewportWidth = get_viewport().size.x
			var viewportHeight = get_viewport().size.y

			var scaleX = viewportWidth / $".".texture.get_size().x
			var scaleY = viewportHeight / $".".texture.get_size().y

			$".".set_scale(Vector2(scaleX, scaleY))
			
			
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
