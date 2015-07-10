# 1. Background (wallpaper)
# 2. Status
# 3. PageComponent
# 4. Home and Numbers layers
# 5. Addpage numbers, home
# 6. SnapToPage Home
# 7. Page.content on change:x
# 8. Modulate blur, opacity, scale (-750, 0)

# Background image
bg = new Layer
	width: 750, height: 1334, 
	image: "images/bg.png"

# Status bar
status = new Layer
	width: Screen.width
	height: 40
	image: "images/status.png"

# Set-up PageComponent
pager = new PageComponent
	width: Screen.width
	height: Screen.height
	backgroundColor: null
	scrollVertical: false

# Layers for home and the keypad
home = new Layer
	size: Screen.size
	image: "images/home.png"

numbers = new Layer
	size: Screen.size
	image: "images/numbers.png"
	
# Add pages
pager.addPage(numbers)
pager.addPage(home)

# Snap to the homescreen by default
pager.snapToPage(home, false)

# Modulate the blur, opacity and scale
pager.content.on "change:x", ->
	bg.blur = Utils.modulate(this.x, [-750, 0], [0, 20], true)
	bg.opacity = Utils.modulate(this.x, [-750, 0], [1, 0.8], true)
	bg.scale = Utils.modulate(this.x, [-750, 0], [1, 1.1], true)