class Text2

  def initialize
    @font = Gosu::Font.new($window,"graphics/PalmBeach.ttf",20)
  end

  def draw_text(text,x,y,z,scale_x = 3.0, scale_y = 3.0, color = Color.new(10,77,17), mode = :default)
    @font.draw(text,x,y,z,scale_x, scale_y , color, mode )
  end

end