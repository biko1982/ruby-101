class Die

  def initialize
    roll
  end

  def roll
    @numberShowing = 1 + rand(6)
  end

  def cheat(side)
    if side < 7 and side > 0
      @numberShowing = side
    else
      puts "You can't even cheat properly, there is no #{side} side on a dice!"
    end
  end

  def showing
    @numberShowing
  end

end
