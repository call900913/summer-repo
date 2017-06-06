require_relative 'piece'
#When updating a piece's position, you should also update the board's grid
#So the piece has a position on the board, and the board keeps track of the piece's position




# null_piece = NullPiece.instance

class Board
  attr_reader :grid

  def initialize
    # populate it!
    @piece = nil
    @grid = Array.new(8) { Array.new(8) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    raise "There is no piece there. Update starting position." if @grid[start_pos] == null_piece
    @grid[start_pos] = null_piece
    @grid[end_pos] = @piece

    rescue
      retry
  end

  def in_bounds?(pos)
    row, col = pos
    return false if row > 7 || col > 7
    return false if row < 0 || col < 0

    true
  end

end
