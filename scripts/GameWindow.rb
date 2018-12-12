require 'gosu'
include Gosu
class GameWindow < Window

def initialize
super(750,480,false)
self.caption = 'HopOp'
@song = Gosu::Song.new(self,"audio/Song.wav")
@song.play(true)
#@sample1 = Gosu::Sample.new(self,"audio/sample1.wmv")
$window = self
$gameover=false
  @replay=false
  $text1=Text1.new
  $text2=Text2.new
  $won=false
  @background_image= Image.new(self,"graphics/sprites/bg.png",:tileable => true)
  @background_image1= Image.new(self,"graphics/sprites/bg1.png",:tileable => true)
  @background_image2= Image.new(self,"graphics/sprites/bg.png",:tileable => true)

@z=Float::INFINITY
  $score=0
  @player=Player.new(300,410)
@bb=BlueBird.new(150,250)
@bird=Bird.new(850,100,:levo)
@bird2=Bird.new(0,150,:desno)

#pravimo niz banana
@banane=[]
@pomocni=[]
for i in 0...5
	for j in 0..14
		@pomocni.push(Banana.new(j*49,i*49))
	end
@banane.push(@pomocni)
end
	
	@banane.flatten!
end

def update

  
  @bb.update
  @bird.update
  @bird2.update
  @j1=@player.get_xr/40
  @j2=@player.get_xw/40
  @i1=@player.get_yr/40
  @i1=@player.get_yh/40
  @banane.each {|x| x.update}
  if !$gameover && !$won
  @player.update
  end


end

def draw
  @background_image.draw(0,0,0)
  @background_image1.draw(-80,-40,@z,2,2)
  if !$gameover && !$won
  @player.draw
  end
  @bb.draw
  @bird.draw
  @bird2.draw
i=0
j=0


for i in 0...@banane.size
	bandza=@banane.at(i)
  if @replay
    bandza.set_active(true)
  end
	bandza.draw
end
  @replay=false




  $text1.draw_text( "Score: #{$score}",20,440,580)
  $text2.draw_text("HOPOP",270,50,@z)
  $text2.draw_text("PRESS SPACE BUTTON TO START",60,360,@z,2.0,2.0)
  
if ($gameover || $score==750)
  #ako te ubije ptica xD
 if ($gameover)
   $text1.draw_text("GAME OVER", 320,200,580,3.0,3.0)
 else
   $text1.draw_text("You won!", 320,200,580,3.0,3.0)
end
 $text1.draw_text("bananas: #{$score/10}",320,230,580)
 $text1.draw_text("Press space to restart", 220,280,580,3.0,3.0)

 $window.draw_quad(
        200, 150 , Gosu::Color::BLACK,
        600 , 150, Gosu::Color::BLACK,
        200 , 330, Gosu::Color::BLACK,
        600, 330, Gosu::Color::BLACK,
        100)
  end
end

def button_down(id)
close if id == Gosu::KbEscape
#@sample.play if id == KbLeft
#@sample.play if id == KbRight
#@sample.play if id == KbUp

  if id == Gosu::KbSpace
    @z=-1
	@z1=Float::INFINITY
  end
if id==Gosu::KbSpace && ($won || $gameover)
  @replay=true
  @player.set_x(300)
  @player.set_y(410)
  @player.set_moving(false)
  @player.set_skace(false)
  @player.set_pada(false)
  $score=0
  $gameover=false
  $won=false
end
end





def get_player
return @player
end

end