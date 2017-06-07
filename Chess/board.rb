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

  BACKROW = [:rook, :knight, :bishop, :queen, :king, :bishop, :knight, :rook]

  def populate
    @grid[0].each_index do |idx|
        @grid[0][idx] = BACKROW[idx]
    end

    @grid[-1].each_index do |idx|
      @grid[-1][idx] = BACKROW.reverse[idx]
    end

    @grid[1].each_index do |idx|
      @grid[1][idx] = :pawn
    end

    @grid[-2].each_index do |idx|
      @grid[-2][idx] = :pawn
    end
  end

#Is king defined here?
  def in_check?(color)
    king.color.position
  end

  def checkmate?(color)


    #check if none of the player's pieces has any valid move
  end

end
