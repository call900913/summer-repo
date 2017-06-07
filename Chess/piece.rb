

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

module SteppingPiece
  KNIGHTMOVES = [
    [2, 1],
    [1, 2],
    [-1, 2],
    [-2, 1],
    [-2, -1],
    [-1, -2],
    [1, -2],
    [2, -1]
  ]

  KINGMOVES = [
    [1, 1],
    [-1, 1],
    [-1, -1],
    [1, -1],
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]

  PAWNMOVES = [
    [1, 0]
  ]

  def moves
    pos_moves = []

    constant.each do |move|
      row, col = self.position
      diff_row, diff_col = move
      new_row, new_col = row + diff_row, col + diff_col
      pos_moves << [new_row, new_col] if valid_moves?([new_row, new_col])
    end

    pos_moves
  end

end

# add conditional when nullpiece and the related are made.

module SlidingPiece
  ROOKMOVES = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]

  BISHOPMOVES = [
    [1, 1],
    [1, -1],
    [-1, -1],
    [-1, 1],
  ]

  QUEENMOVES = ROOKMOVES + BISHOPMOVES

=begin
#!in_bounds
while valid_moves?(test_pos) #|| position == NullPiece.instance
=end

  def moves
    pos_moves = []

    constant.each do |move|
      row, col = @position
      shift_row, shift_col = move
      new_row, new_col = @position

      while valid_moves?([new_row + shift_row, new_col + shift_col])
        new_row, new_col = new_row + shift_row, new_col + shift_col
        pos_moves << [new_row, new_col]
      end
    end
    pos_moves
  end

  def add_move
    constant.each do |delta|
      pos
    end
  end
end

#Where does the valid_moves go?
#Where does in_board go?
#get_position and end_position

class King < Piece
  include SteppingPiece

  def constant
    KINGMOVES
  end
end

class Queen < Piece
  include SlidingPiece

  def constant
    QUEENMOVES
  end
end

class Rook < Piece
  include SlidingPiece

  def constant
    ROOKMOVES
  end
end

class Bishop < Piece
  include SlidingPiece

  def constant
    BISHOPMOVES
  end
end

class Knight < Piece
  include SteppingPiece

  def constant
    KNIGHTMOVES
  end
end

class Pawn < Piece
  include SteppingPiece

  def constant
    PAWNMOVES
  end
end

class NullPiece < Piece
  # include Singleton
end

#King and Knight moves in a step fashion but differently
#same case with queen bishop and rook
