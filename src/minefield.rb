###
# Nathan Seffernick
# minefield.rb
# support class minefield for hexSweeper
###


class Minefield
  EASY = "easy"
  MEDIUM = "medium"
  HARD = "hard"
  IMPOSSIBLE = "impossible"
  SMALL = "small"
  NORMAL = "normal"
  LARGE = "large"
  HUGE = "huge"
  IS_A_BOMB = true

  def initialize(difficulty, size)

    case size
    when SMALL
      @rows = 5
    when NORMAL
      @rows = 7
    when LARGE
      @rows = 9
    when HUGE
      @rows = 12
    else
      @rows = 1
    end

    case difficulty
    when EASY
      @amt_bombs = 0.3
    when MEDIUM
      @amt_bombs = 0.45
    when HARD
      @amt_bombs = 0.6
    when IMPOSSIBLE
      @amt_bombs = 0.75
    else
      @amt_bombs = 0.1
    end

    @field = construct_field

  end

  def construct_field
    field = Array.new(@rows * 2 - 1)
    x = 0

    for i in field do
      field[i] = Array.new(@rows + x, Mine.new(false))

      if i+1 < @rows/2
        x += 1
      else
        x -= 1

    end

    for i in field do
      for p in field[i] do
        bomb_decision = rand(100)
        if bomb_decision >= (@amt_bombs * 10)
          field[i][p].set_bomb
      end
    end

    for i in field do
      for p in field[i] do
        total_bombs = 0
        if !field[i][p].is_bomb
          # top left
          if i == 0 && p == 0
            if field[i+1][p].is_bomb
              total_bombs += 1
            if field[i+1][p+1].is_bomb
              total_bombs += 1
            if field[i][p+1].is_bomb
              total_bombs += 1
          # bottom left
          elsif i == (@rows * 2 - 1) && p == 0
            if field[i-1][p].is_bomb
              total_bombs += 1
            if field[i-1][p+1].is_bomb
              total_bombs += 1
            if field[i][p+1].is_bomb
              total_bombs += 1
          # top right
          elsif i == 0 && p == (@rows - 1)
            if field[i+1][p].is_bomb
              total_bombs += 1
            if field[i+1][p+1].is_bomb
              total_bombs += 1
            if field[i][p-1].is_bomb
              total_bombs += 1
          # bottom right
          elsif i == (@rows * 2 - 1) && p == (@rows - 1)
            if field[i-1][p].is_bomb
              total_bombs += 1
            if field[i-1][p+1].is_bomb
              total_bombs += 1
            if field[i][p-1].is_bomb
              total_bombs += 1
          # middle left
          elsif i == (@rows - 1) && p == 0
            if field[i-1][p].is_bomb
              total_bombs += 1
            if field[i][p+1].is_bomb
              total_bombs += 1
            if field[i+1][p].is_bomb
              total_bombs += 1
          # middle right
          elsif i == (@rows - 1) && p == (@rows * 2 - 1)
            if field[i-1][p-1].is_bomb
              total_bombs += 1
            if field[i][p-1].is_bomb
              total_bombs += 1
            if field[i+1][p-1].is_bomb
              total_bombs += 1
          # top
          elsif i == 0
            if field[i][p-1].is_bomb
              total_bombs += 1
            if field[i][p+1].is_bomb
              total_bombs += 1
            if field[i+1][p].is_bomb
              total_bombs += 1
            if field[i+1][p+1].is_bomb
              total_bombs += 1
          # bottom
          elsif i == (@rows * 2 - 1)
            if field[i][p-1].is_bomb
              total_bombs += 1
            if field[i][p+1].is_bomb
              total_bombs += 1
            if field[i-1][p].is_bomb
              total_bombs += 1
            if field[i-1][p+1].is_bomb
              total_bombs += 1
          # upper left
          elsif i < (@rows - 1) && p == 0
            if field[i-1][p].is_bomb
              total_bombs += 1
            if field[i][p+1].is_bomb
              total_bombs += 1
            if field[i+1][p].is_bomb
              total_bombs += 1
            if field[i+1][p+1].is_bomb
              total_bombs += 1
          # lower left
          elsif i > (@rows - 1) && p == 0
            if field[i-1][p].is_bomb
              total_bombs += 1
            if field[i-1][p+1].is_bomb
              total_bombs += 1
            if field[i][p+1].is_bomb
              total_bombs += 1
            if field[i+1][p].is_bomb
              total_bombs += 1
          # upper right
          elsif i < (@rows - 1) && p == (field[i].size - 1)
            if field[i-1][p].is_bomb
              total_bombs += 1
            if field[i][p-1].is_bomb
              total_bombs += 1
            if field[i+1][p].is_bomb
              total_bombs += 1
            if field[i+1][p+1].is_bomb
              total_bombs += 1
          # lower right
          elsif i > (@rows - 1) && p == (field[i].size - 1)
            if field[i-1][p].is_bomb
              total_bombs += 1
            if field[i-1][p-1].is_bomb
              total_bombs += 1
            if field[i][p-1].is_bomb
              total_bombs += 1
            if field[i+1][p-1].is_bomb
              total_bombs += 1
          # middle top
          elsif i < (@rows - 1)
            if field[i-1][p-1].is_bomb
              total_bombs += 1
            if field[i-1][p].is_bomb
              total_bombs += 1
            if field[i][p-1].is_bomb
              total_bombs += 1
            if field[i][p+1].is_bomb
              total_bombs += 1
            if field[i+1][p].is_bomb
              total_bombs += 1
            if field[i+1][p+1].is_bomb
              total_bombs += 1
          # middle middle
          elsif i == (@rows - 1)
            if field[i-1][p-1].is_bomb
              total_bombs += 1
            if field[i-1][p].is_bomb
              total_bombs += 1
            if field[i][p-1].is_bomb
              total_bombs += 1
            if field[i][p+1].is_bomb
              total_bombs += 1
            if field[i+1][p-1].is_bomb
              total_bombs += 1
            if field[i+1][p].is_bomb
              total_bombs += 1
          # middle bottom
          elsif i > (@rows - 1)
            if field[i-1][p].is_bomb
              total_bombs += 1
            if field[i-1][p+1].is_bomb
               total_bombs += 1
            if field[i][p-1].is_bomb
              total_bombs += 1
            if field[i][p+1].is_bomb
              total_bombs += 1
            if field[i+1][p-1].is_bomb
              total_bombs += 1
            if field[i+1][p].is_bomb
              total_bombs += 1
        field[i][p].set_bomb(total_bombs)
      end
    end

    return field
  end

  reveal_spaces(mine)
    if mine.instance_of? Mine
      mine.reveal
    end
    if mine.is_empty
      for i in field do
        for p in field[i] do
          if !field[i][p].is_bomb
            # top left
            if i == 0 && p == 0
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              if field[i+1][p+1].is_empty
                reveal_spaces(field[i+1][p+1])
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
            # bottom left
            elsif i == (@rows * 2 - 1) && p == 0
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              if field[i-1][p+1].is_empty
                reveal_spaces(field[i-1][p+1])
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
            # top right
            elsif i == 0 && p == (@rows - 1)
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              if field[i+1][p+1].is_empty
                reveal_spaces(field[i+1][p+1])
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
            # bottom right
            elsif i == (@rows * 2 - 1) && p == (@rows - 1)
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              if field[i-1][p+1].is_empty
                reveal_spaces(field[i-1][p+1])
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
            # middle left
            elsif i == (@rows - 1) && p == 0
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
            # middle right
            elsif i == (@rows - 1) && p == (@rows * 2 - 1)
              if field[i-1][p-1].is_empty
                reveal_spaces(field[i-1][p-1])
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              if field[i+1][p-1].is_empty
                reveal_spaces(field[i+1][p-1])
            # top
            elsif i == 0
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              if field[i+1][p+1].is_empty
                reveal_spaces(field[i+1][p+1])
            # bottom
            elsif i == (@rows * 2 - 1)
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              if field[i-1][p+1].is_empty
                reveal_spaces(field[i-1][p+1])
            # upper left
            elsif i < (@rows - 1) && p == 0
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              if field[i+1][p+1].is_empty
                reveal_spaces(field[i+1][p+1])
            # lower left
            elsif i > (@rows - 1) && p == 0
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              if field[i-1][p+1].is_empty
                reveal_spaces(field[i-1][p+1])
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
            # upper right
            elsif i < (@rows - 1) && p == (field[i].size - 1)
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              if field[i+1][p+1].is_empty
                reveal_spaces(field[i+1][p+1])
            # lower right
            elsif i > (@rows - 1) && p == (field[i].size - 1)
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              if field[i-1][p-1].is_empty
                reveal_spaces(field[i-1][p-1])
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              if field[i+1][p-1].is_empty
                reveal_spaces(field[i+1][p-1])
            # middle top
            elsif i < (@rows - 1)
              if field[i-1][p-1].is_empty
                reveal_spaces(field[i-1][p-1])
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              if field[i+1][p+1].is_empty
                reveal_spaces(field[i+1][p+1])
            # middle middle
            elsif i == (@rows - 1)
              if field[i-1][p-1].is_empty
                reveal_spaces(field[i-1][p-1])
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              if field[i+1][p-1].is_empty
                reveal_spaces(field[i+1][p-1])
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
            # middle bottom
            elsif i > (@rows - 1)
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              if field[i-1][p+1].is_empty
                 reveal_spaces(field[i-1][p+1])
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              if field[i+1][p-1].is_empty
                reveal_spaces(field[i+1][p-1])
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])




  private


end
