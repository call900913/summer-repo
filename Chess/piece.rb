


class Piece
  attr_reader :position, :possible_moves

  def initialize
    @position = [0,0]
    @possible_moves
  end

  def move
  end

  def moves
  end

  def move_into_check?(end_pos)
  end

  def to_s
    " X "
  end

  #invalid for piece later
  def valid_moves?(pos)
    row, col = pos
    return false if row > 7 || col > 7
    return false if row < 0 || col < 0

    true
  end

end


#Where does the valid_moves go?
#Where does in_board go?
#get_position and end_position

class King < Piece
  include SteppingPiece

  KING_MOVES = [
    [1, 1],
    [-1, 1],
    [-1, -1],
    [1, -1],
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]

end

class Queen < Piece
end

class Rook < Piece
  MOVES = [
    []

  ]

end

class Bishop < Piece
end

class Knight < Piece
  include SteppingPiece

  KNIGHT_MOVES = [
    [2, 1],
    [1, 2],
    [-1, 2],
    [-2, 1],
    [-2, -1],
    [-1, -2],
    [1, -2],
    [2, -1]
  ]

end

class Pawn < Piece
end

class NullPiece < Piece
end

#King and Knight moves in a step fashion but differently
#same case with queen bishop and rook

module SlidingPiece

  def moves

  end

end

module SteppingPiece

  def moves(constant)
    pos_moves = []

    constant.each do |move|
      row, col = @position
      diff_row, diff_col = move
      new_row, new_col = row + diff_row, col + diff_col
      pos_moves << [new_row, new_col] if valid_moves?([new_row, new_col])
    end

    pos_moves
  end

end
