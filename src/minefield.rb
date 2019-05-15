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

    @field = construct_field(@rows, @amt_bombs)
    @bombs = 0
    @flagged = 0

  end

  def construct_field(rows, amt_bombs)
    field = Array.new(rows * 2 - 1)
    x = 0

    for i in field do
      field[i] = Array.new(rows + x, Mine.new(false))

      if i+1 < rows/2
        x += 1
      else
        x -= 1
      end
    end

    for i in field do
      for p in field[i] do
        bomb_decision = rand(100)
        if bomb_decision >= (amt_bombs * 10)
          field[i][p].set_bomb
          @bombs += 1
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
            end
            if field[i+1][p+1].is_bomb
              total_bombs += 1
            end
            if field[i][p+1].is_bomb
              total_bombs += 1
            end
          # bottom left
          elsif i == (@rows * 2 - 1) && p == 0
            if field[i-1][p].is_bomb
              total_bombs += 1
            end
            if field[i-1][p+1].is_bomb
              total_bombs += 1
            end
            if field[i][p+1].is_bomb
              total_bombs += 1
            end
          # top right
          elsif i == 0 && p == (@rows - 1)
            if field[i+1][p].is_bomb
              total_bombs += 1
            end
            if field[i+1][p+1].is_bomb
              total_bombs += 1
            end
            if field[i][p-1].is_bomb
              total_bombs += 1
            end
          # bottom right
          elsif i == (@rows * 2 - 1) && p == (@rows - 1)
            if field[i-1][p].is_bomb
              total_bombs += 1
            end
            if field[i-1][p+1].is_bomb
              total_bombs += 1
            end
            if field[i][p-1].is_bomb
              total_bombs += 1
            end
          # middle left
          elsif i == (@rows - 1) && p == 0
            if field[i-1][p].is_bomb
              total_bombs += 1
            end
            if field[i][p+1].is_bomb
              total_bombs += 1
            end
            if field[i+1][p].is_bomb
              total_bombs += 1
            end
          # middle right
          elsif i == (@rows - 1) && p == (@rows * 2 - 1)
            if field[i-1][p-1].is_bomb
              total_bombs += 1
            end
            if field[i][p-1].is_bomb
              total_bombs += 1
            end
            if field[i+1][p-1].is_bomb
              total_bombs += 1
            end
          # top
          elsif i == 0
            if field[i][p-1].is_bomb
              total_bombs += 1
            end
            if field[i][p+1].is_bomb
              total_bombs += 1
            end
            if field[i+1][p].is_bomb
              total_bombs += 1
            end
            if field[i+1][p+1].is_bomb
              total_bombs += 1
            end
          # bottom
          elsif i == (@rows * 2 - 1)
            if field[i][p-1].is_bomb
              total_bombs += 1
            end
            if field[i][p+1].is_bomb
              total_bombs += 1
            end
            if field[i-1][p].is_bomb
              total_bombs += 1
            end
            if field[i-1][p+1].is_bomb
              total_bombs += 1
            end
          # upper left
          elsif i < (@rows - 1) && p == 0
            if field[i-1][p].is_bomb
              total_bombs += 1
            end
            if field[i][p+1].is_bomb
              total_bombs += 1
            end
            if field[i+1][p].is_bomb
              total_bombs += 1
            end
            if field[i+1][p+1].is_bomb
              total_bombs += 1
            end
          # lower left
          elsif i > (@rows - 1) && p == 0
            if field[i-1][p].is_bomb
              total_bombs += 1
            end
            if field[i-1][p+1].is_bomb
              total_bombs += 1
            end
            if field[i][p+1].is_bomb
              total_bombs += 1
            end
            if field[i+1][p].is_bomb
              total_bombs += 1
            end
          # upper right
          elsif i < (@rows - 1) && p == (field[i].size - 1)
            if field[i-1][p].is_bomb
              total_bombs += 1
            end
            if field[i][p-1].is_bomb
              total_bombs += 1
            end
            if field[i+1][p].is_bomb
              total_bombs += 1
            end
            if field[i+1][p+1].is_bomb
              total_bombs += 1
            end
          # lower right
          elsif i > (@rows - 1) && p == (field[i].size - 1)
            if field[i-1][p].is_bomb
              total_bombs += 1
            end
            if field[i-1][p-1].is_bomb
              total_bombs += 1
            end
            if field[i][p-1].is_bomb
              total_bombs += 1
            end
            if field[i+1][p-1].is_bomb
              total_bombs += 1
            end
          # middle top
          elsif i < (@rows - 1)
            if field[i-1][p-1].is_bomb
              total_bombs += 1
            end
            if field[i-1][p].is_bomb
              total_bombs += 1
            end
            if field[i][p-1].is_bomb
              total_bombs += 1
            end
            if field[i][p+1].is_bomb
              total_bombs += 1
            end
            if field[i+1][p].is_bomb
              total_bombs += 1
            end
            if field[i+1][p+1].is_bomb
              total_bombs += 1
            end
          # middle middle
          elsif i == (@rows - 1)
            if field[i-1][p-1].is_bomb
              total_bombs += 1
            end
            if field[i-1][p].is_bomb
              total_bombs += 1
            end
            if field[i][p-1].is_bomb
              total_bombs += 1
            end
            if field[i][p+1].is_bomb
              total_bombs += 1
            end
            if field[i+1][p-1].is_bomb
              total_bombs += 1
            end
            if field[i+1][p].is_bomb
              total_bombs += 1
            end
          # middle bottom
          elsif i > (@rows - 1)
            if field[i-1][p].is_bomb
              total_bombs += 1
            end
            if field[i-1][p+1].is_bomb
               total_bombs += 1
             end
            if field[i][p-1].is_bomb
              total_bombs += 1
            end
            if field[i][p+1].is_bomb
              total_bombs += 1
            end
            if field[i+1][p-1].is_bomb
              total_bombs += 1
            end
            if field[i+1][p].is_bomb
              total_bombs += 1
            end
          end
        field[i][p].set_bomb(total_bombs)
        end
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
              end
              if field[i+1][p+1].is_empty
                reveal_spaces(field[i+1][p+1])
              end
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              end
            # bottom left
            elsif i == (@rows * 2 - 1) && p == 0
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              end
              if field[i-1][p+1].is_empty
                reveal_spaces(field[i-1][p+1])
              end
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              end
            # top right
            elsif i == 0 && p == (@rows - 1)
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              end
              if field[i+1][p+1].is_empty
                reveal_spaces(field[i+1][p+1])
              end
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              end
            # bottom right
            elsif i == (@rows * 2 - 1) && p == (@rows - 1)
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              end
              if field[i-1][p+1].is_empty
                reveal_spaces(field[i-1][p+1])
              end
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              end
            # middle left
            elsif i == (@rows - 1) && p == 0
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              end
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              end
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              end
            # middle right
            elsif i == (@rows - 1) && p == (@rows * 2 - 1)
              if field[i-1][p-1].is_empty
                reveal_spaces(field[i-1][p-1])
              end
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              end
              if field[i+1][p-1].is_empty
                reveal_spaces(field[i+1][p-1])
              end
            # top
            elsif i == 0
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              end
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              end
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              end
              if field[i+1][p+1].is_empty
                reveal_spaces(field[i+1][p+1])
              end
            # bottom
            elsif i == (@rows * 2 - 1)
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              end
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              end
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              end
              if field[i-1][p+1].is_empty
                reveal_spaces(field[i-1][p+1])
              end
            # upper left
            elsif i < (@rows - 1) && p == 0
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              end
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              end
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              end
              if field[i+1][p+1].is_empty
                reveal_spaces(field[i+1][p+1])
              end
            # lower left
            elsif i > (@rows - 1) && p == 0
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              end
              if field[i-1][p+1].is_empty
                reveal_spaces(field[i-1][p+1])
              end
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              end
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              end
            # upper right
            elsif i < (@rows - 1) && p == (field[i].size - 1)
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              end
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              end
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              end
              if field[i+1][p+1].is_empty
                reveal_spaces(field[i+1][p+1])
              end
            # lower right
            elsif i > (@rows - 1) && p == (field[i].size - 1)
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              end
              if field[i-1][p-1].is_empty
                reveal_spaces(field[i-1][p-1])
              end
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              end
              if field[i+1][p-1].is_empty
                reveal_spaces(field[i+1][p-1])
              end
            # middle top
            elsif i < (@rows - 1)
              if field[i-1][p-1].is_empty
                reveal_spaces(field[i-1][p-1])
              end
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              end
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              end
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              end
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              end
              if field[i+1][p+1].is_empty
                reveal_spaces(field[i+1][p+1])
              end
            # middle middle
            elsif i == (@rows - 1)
              if field[i-1][p-1].is_empty
                reveal_spaces(field[i-1][p-1])
              end
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              end
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              end
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              end
              if field[i+1][p-1].is_empty
                reveal_spaces(field[i+1][p-1])
              end
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              end
            # middle bottom
            elsif i > (@rows - 1)
              if field[i-1][p].is_empty
                reveal_spaces(field[i-1][p])
              end
              if field[i-1][p+1].is_empty
                 reveal_spaces(field[i-1][p+1])
               end
              if field[i][p-1].is_empty
                reveal_spaces(field[i][p-1])
              end
              if field[i][p+1].is_empty
                reveal_spaces(field[i][p+1])
              end
              if field[i+1][p-1].is_empty
                reveal_spaces(field[i+1][p-1])
              end
              if field[i+1][p].is_empty
                reveal_spaces(field[i+1][p])
              end
            end
          end
        end
      end
    end
  end


end
