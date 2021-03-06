###
# Nathan Seffernick
# hexSweeper.rb
# Main class for starting hexagonal Minesweeper
###

class HexSweeper
  EASY = "easy"
  MEDIUM = "medium"
  HARD = "hard"
  IMPOSSIBLE = "impossible"
  SMALL = "small"
  NORMAL = "normal"
  LARGE = "large"
  HUGE = "huge"

# expecting difficulties in first args
# size in second arg
  def args

    if ARGV.length < 2
      puts "Too few arguments"
      exit
    end

    difficulties = [EASY, MEDIUM, HARD, LARGE]
    size = [SMALL, NORMAL, LARGE, HUGE]

    if difficulties.include? ARGV[0]
      if size.include? ARGV[1]
        return Minefield.new(ARGV[0], ARGV[1])
      end
      else
        puts "Expected size: 'small, normal, large, huge'"
        exit
      end
    end
    else
      puts "Expected difficulties: 'easy, medium, hard, impossible'"
      exit
    end

  end

  def special_start(mine, minefield)
    if mine.is_bomb
      mine.bomb = false
      minefield.reveal_spaces(mine)
      minefield.bombs -= 1
    else 
      minefield.reveal_spaces(mine)
    end
  end

  def flag(mine, minefield)
    #...
  end

  def click_mine(mine, minefield)
    #...
  end

  def win()
  end

  def lost()
  end

end
if __FILE__ == $0
  minefield = args
  while minefield.bombs > 0
    #if first click special start
  end

  end
end
