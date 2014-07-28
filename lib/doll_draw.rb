class DollDraw
  def draw(draw_progress)
    if draw_progress == 1
      draw_doll_head
    elsif draw_progress == 2
      draw_doll_head + draw_doll_left_arm
    elsif draw_progress == 3
      draw_doll_head + draw_doll_arms
    elsif draw_progress == 4
      draw_doll_head + draw_doll_arms + draw_doll_left_leg
    elsif draw_progress == 5
      draw_doll_head + draw_doll_arms + draw_doll_legs
    end
  end

  private

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
