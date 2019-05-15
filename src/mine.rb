###
# Nathan Seffernick
# mine.rb
# support class mine for hexSweeper
###

class Mine
  IS_HIDDEN = true
  IS_A_BOMB = true
  attr_accessor  :hidden, :bomb, :adjBombs, :flagged

  def initialize(bomb)
    self.hidden = IS_HIDDEN
    self.bomb = bomb
    self.flagged = false
    self.adjBombs = 0
  end

  def is_bomb
    return self.bomb
  end

  def set_bomb
    self.bomb = IS_A_BOMB
  end

  def reveal
    self.hidden = false
    if self.bomb != IS_A_BOMB
      #
    end
    else
      #
    end
  end

  def set_adj(adjBombs)
    if self.bomb != IS_A_BOMB
      self.adjBombs = adjBombs
  end

  def is_empty
    if self.adjBombs == 0
      return true
    else
      return false

      end
  def flag
    self.flagged = true
  end

  

end
