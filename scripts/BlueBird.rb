class BlueBird

  def initialize(x,y)
    @x=x
    @y=y
    @image=Image.load_tiles($window,"graphics/sprites/bird1.png",110,100,false)
	
	w=@image[1].width
	h=@image[1].height
	@w = w
	@h = h
	@pravac=:levo
	@frame=0
    @indikator=640
	
	#koordinate pravougaonika oko ptice
	@xr=@x+8
	@yr=@y+8
	@xw=@x+@w-8
	@yh=@y+@h-8
  end

  def move_right
    @pravac=:desno
    @x += 5
  end

  def move_left
    @pravac=:levo
    @x += -5

  end

def get_x
	return @x
end

def get_y
	return @y
end

 
=begin
def draw_rectangle

      $window.draw_quad(
        @x+8, @y+8 , Gosu::Color::RED,
        @x +@w-8 , @y+8, Gosu::Color::RED,
        @x+8, @y+@h-8, Gosu::Color::RED,
        @x+@w-8, @y+@h-8, Gosu::Color::RED,
        100)
end
=end



def kolizija(p=$window.get_player)
	if p.get_yh>= @y && p.get_y<= @y+@h+10
		if (p.get_x<=@x + @w+10 && p.get_xw>=@x)
		return true;
		end
	end
	return false;
end   

  def update
@frame+=1
if @x>-170 && @pravac==:levo
self.move_left
end
@pravac=:desno if @x==-170



if @x<@indikator+170 && @pravac==:desno
	move_right 
end
@pravac=:levo if @x==@indikator+170
#gameover ako dodje do kolizije a nismo prethodno pobedili
    $gameover =true if self.kolizija && !$won
end

def draw(z=5)
f= @frame/4 % @image.size
image=@image[f]
if @pravac==:levo 
	image.draw(@x, @y,z)
elsif @pravac==:desno 
	image.draw(@x + 89, @y, z, -1, 1);
end

#self.draw_rectangle


end
  end

