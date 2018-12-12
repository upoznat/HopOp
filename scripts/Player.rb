class Player

def initialize(x,y)
@x=x
@y=y
@width=80
@height=70
#koordinate pravougaonika oko igraca
@xr=@x+8
@yr=@y+8
@xw=@x+@width-8
@yh=@y+@height-8

@sprite = Image.load_tiles( $window, "graphics/sprites/monkey1.png", @width, @height, false)
@direction = :right
@frame=0
@moving=false
#promenljiva koja cuva gornju granicu skoka za @y
@indikator=0
#da li je igrac u skoku ili u padu
@skace=false
@pada=false
end


  
#GETTERS
def get_x
	return @x
end

def get_y
	return @y
end

def get_xr
    return @x+8
  end
  
  def get_yr
    return @y+8
  end
  
  def get_xw
    return @x+@width-8
  end
  
  def get_yh
    return @y+@height-8
  end
  
  def get_skace
  return @skace
  end
#funkcija pada
def fall
@y+=5
@pada=true
@skace=false
end

def get_fall
return @fall
end
  #SETTERS
  def set_y(y1)
    @y=y1
  end

  def set_x(x1)
    @x=x1
  end
  def set_y(y1)
    @y=y1
  end

  def set_x(x1)
    @x=x1
  end

  def set_y(y1)
    @y=y1
  end

  def set_moving(moving1)
    @moving=moving1
  end

  def set_skace(skace1)
    @skace=skace1
  end

  def set_pada(pada1)
    @pada=pada1
  end
#proverava da li je igrac na zemlji
def on_ground
	return @y==410
end
#funkcija skoka
def jump
@y -= 10
@skace=true
@pada=false
end
  #funkcije pomeranja udesno i ulevo
def move_right
	@moving=true
@direction=:right
@x += 5 
end

def move_left
	@moving=true
@direction=:left
@x += -5
end
#pomeranje dok je u skoku
def move_left_jf
@moving=true
@direction=:left
@x += -1
end
def move_right_jf
	@moving=true
@direction=:right
@x += 1 
end

#UPDATE
def update
@frame+=1
@moving=false



if $window.button_down?(KbLeft)
	if !(self.on_ground)
	self.move_left_jf
	else
	self.move_left
	end
end

if $window.button_down?(KbRight)
	if !(self.on_ground)
	self.move_right_jf
	else
	self.move_right
	end
end
if $window.button_down?(KbUp) && !(@pada)
	@skace=true
end
if @skace 
self.jump
end
if @y==@indikator
@skace=false
@pada=true
end

if @pada && !(self.on_ground)
self.fall
end
if self.on_ground
	@pada=false
end

if  $window.button_down?(KbUp)
	if self.on_ground
	self.jump
	end
end

end
=begin
def draw_rectangle

      $window.draw_quad(
        @xr, @yr , Gosu::Color::RED,
        @xw , @yr, Gosu::Color::RED,
        @xr, @yh, Gosu::Color::RED,
        @xw, @yh, Gosu::Color::RED,
        100)
end
=end
def get_fall
return @fall
end

def draw(z=5)
f =  @frame % @sprite.size
image = (@moving && self.on_ground) ? @sprite[f] : @sprite[1]
if @direction==:left
	image.draw(@x, @y,1)
elsif
	image.draw(@x + @width, @y, 1, -1, 1)
else

end
#self.draw_rectangle
end

end