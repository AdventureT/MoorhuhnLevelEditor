extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

static func LoadRLE(filePath : String) -> Array:
	print("Hello from the other side", filePath)
	var file : FileAccess = FileAccess.open(filePath, FileAccess.READ)
	file.seek(0xC)
	var palette : PackedColorArray = [];
	palette.resize(256)
	
	for i in 256: # Iterate through palette 256 color
		var r = file.get_8()
		var g = file.get_8()
		var b = file.get_8()
		var a = file.get_8() 
		palette[i] = Color(r,g,b,a)
	
	file.seek(0x80C)
	var width : int = file.get_32()
	var height : int = file.get_32()
	var bpp : int = file.get_32()
	var isCompressed : int = file.get_32()
	var countOfSubImages : int = file.get_32()
	
	var data : PackedByteArray = []
	var colors : PackedColorArray = []
	var images = []
	
	for i in countOfSubImages:
		var subImageWidth : int = file.get_32()
		var subImageHeight: int = file.get_32()
		var unk3 : int = file.get_32()
		var unk4 : int = file.get_32()
		var unk5 : int = file.get_32()
		var unk6 : int = file.get_32()
		var sizeOfSubImage : int = file.get_32()
		var zero : int = file.get_32()
		
		data = file.get_buffer(sizeOfSubImage)
		data = DecompressRLE(data, sizeOfSubImage, subImageWidth * subImageHeight)
		colors = ToRGBA(subImageWidth, subImageHeight, data, palette)
		var img = Image.create_from_data(subImageWidth, subImageHeight, false, Image.FORMAT_RGBA8, colors.to_byte_array())
		images.append(img)
	
	return images

static func ToRGBA(width : int, height : int, imgData : PackedByteArray, palette : PackedColorArray) -> PackedColorArray:
	var rgb : PackedColorArray = []
	rgb.resize(width * height)
	
	for y in height:
		for x in width:
			var val = imgData[x + (y * width)]
			var col = palette[val]
			rgb[x + (y * width)] = col
	
	return rgb

static func DecompressRLE(data : PackedByteArray, compressedSize : int, decompressedSize : int) -> PackedByteArray:
	var inOff = 0
	var outOff = 0
	var decompressedBuffer = []
	decompressedBuffer.resize(decompressedSize)
	
	while (inOff < compressedSize):
		var controlByte : int = data[inOff]
		inOff += 1
		var count : int
		
		if (controlByte >= 128):
			count = 256 - controlByte
			for i in count:
				decompressedBuffer[outOff + i] = data[inOff + i]
			inOff += count
		else:
			count = controlByte
			var repeatByte : int = data[inOff]
			inOff += 1
			for i in count:
				decompressedBuffer[outOff + i] = repeatByte
			
		outOff += count
	
	return decompressedBuffer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
