class DollDraw
  def initialize
    @parts = {
      1 => draw_doll_head,
      2 => draw_doll_head + draw_doll_left_arm,
      3 => draw_doll_head + draw_doll_arms,
      4 => draw_doll_head + draw_doll_arms + draw_doll_left_leg,
      5 => draw_doll_head + draw_doll_arms + draw_doll_legs
    }
  end

  def draw(draw_progress)
    is_valid_draw_progress?(draw_progress) ? draw_parts(draw_progress) : ""
  end

  private

  def draw_parts(draw_progress)
    @parts[draw_progress]
  end

  def is_valid_draw_progress?(draw_progress)
    draw_progress != nil and draw_progress != 0
  end

  def draw_doll_head
    "----+\n" +
    "    |\n" +
    "    O\n"
  end

  def draw_doll_left_arm
    "   /|"
  end

  def draw_doll_arms
    "   /|\\\n"
  end

  def draw_doll_left_leg
    "   /"
  end

  def draw_doll_legs
    "   / \\"
  end
end
