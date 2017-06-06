require 'colorize'
require_relative 'cursor'
require_relative 'board'
#to_s ouece

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def move(new_pos)
  end


  # def test_loop
  #   3.times do
  #     render
  #     @cursor.get_input
  #   end
  # end

  def render
    @board.grid.each.with_index do |row, idx1|
      row.each.with_index do |piece, idx2|


        if idx1.even?
          if idx2.even?
            if @cursor.cursor_pos == [idx1, idx2]
              print "X".colorize( :background => :green)
            else
              print "X".colorize( :background => :red)
            end
          else
            print "X".colorize( :background => :blue)
          end
        else
          if idx2.even?
            if @cursor.cursor_pos == [idx1, idx2]
              print "X".colorize( :background => :green)
            else
              print "X".colorize( :background => :blue)
            end
          else
            print "X".colorize( :background => :red)
          end
        end
      end
      print "\n"
    end


=begin

=end

  end

end
