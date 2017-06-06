class Piece

  def initialize
    @position = nil
  end

  def move
  end

  def moves
  end
end




class King < Piece
end

class Queen < Piece
end

class Rook < Piece
end

class Bishop < Piece
end

class Knight < Piece
end

class Pawn < Piece
end

class NullPiece < Piece

end


module SlidingPiece

end

module SteppingPiece

end
