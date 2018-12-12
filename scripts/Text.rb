class Text1

  def initialize
    @font = Gosu::Font.new($window,"graphics/Zsylett.ttf",20)
  end

  def draw_text(text,x,y,z,scale_x = 1.0, scale_y = 1.0, color = Color.new(255,255,255), mode = :default)
    @font.draw(text,x,y,z,scale_x = 1.0, scale_y = 1.0, color, mode = :default)
  end

end