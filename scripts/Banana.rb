class Banana

  def initialize(x,y,z=5)
    @image=Image.load_tiles($window,"graphics/sprites/banana2.png",120,120,false)
	#indikator da je pokupljena banana, saljemo metodu draw, da je ne bi iscrtao, ako je pokupljena
    @active=true
	@points=10
    @frame=0
	@x=x
	@y=y
	@z=z
	
	w=@image[1].width-80
	h=@image[1].height-80
	#promenljive koje nam ogranicavaju pravougaonik oko svake banane(zbog kolizije)
	@xr=@x+10
	@yr=@y +10
	@xw=@x + w+10
	@yh=@y+h+10
	
  end


def kolizija(p=$window.get_player)
	if p.get_yh>= @y && p.get_y<= @yh
		if (p.get_x<=@xw && p.get_xw>=@x)
		return true;
		end
	end
	return false;
end  
  

  def update
  if (@active)
  
  if (self.kolizija)
	@active=false
	$score+=@points
  end
  
  end
@frame+=1
    $won=true if $score==750
  end
  
  
def set_z(z1)
@z=z1
end

  def set_active(a)
    @active=a
  end
  def draw(z=5)
  if (@active==false)
  return
  end
f= @frame/5 % @image.size
image=@image[f] 
	image.draw(@x, @y,z,0.5,0.5)
=begin	
	$window.draw_quad(
        @xr, @yr , Gosu::Color::RED,
        @xw , @yr, Gosu::Color::RED,
        @xr , @yh, Gosu::Color::RED,
        @xw, @yh, Gosu::Color::RED,
        100)
=end
  end


  def get_xr
    return @xr
  end
  
  def get_yr
    return @xr
  end
  
  def get_xw
    return @xw
  end
  
  def get_yh
    return @yh
  end

  
  
  
end