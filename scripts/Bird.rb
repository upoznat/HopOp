class Bird


  def initialize(x,y,pravac=:desno)
    @x=x
    @y=y
    @image=Image.load_tiles($window,"graphics/sprites/bird2.png",76,85,false)
	
	w=@image[1].width
	h=@image[1].height
	@w = w
	@h = h

	
	@pravac=pravac
	@frame=0
    @indikator=800
	@nestani=3
  end
  
  
def kolizija(p=$window.get_player)
	if p.get_yh>= @y && p.get_y<= @y+@h+10
		if (p.get_x<=@x + @w+10 && p.get_xw>=@x)
		return true;
		end
	end
	return false;
end  

  def move_right
    @pravac=:desno
    @x += 2
  end

  def move_left
    @pravac=:levo
    @x += -2

  end
def get_x
	return @x
end

def get_y
	return @y
end

  def update
@frame+=1
if @x>-@indikator/2 && @pravac==:levo
self.move_left
end
@pravac=:desno if @x==-@indikator/2

if @x<@indikator && @pravac==:desno
	move_right 
end
@pravac=:levo if @x==@indikator

if self.kolizija && !$won
	$gameover=true

end
end

def draw(z=10)

f= @frame/5 % @image.size
if f==8
	f=0
	end
if z==8
	f=8
	@nestani-=1
end
if @nestani==0 
z=-(Float::INFINITY)
end
image=@image[f]
if @pravac==:desno 
	image.draw(@x, @y,z)
elsif @pravac==:levo 
	image.draw(@x + 89, @y, z, -1, 1);
end
	end
  end

