require 'colorize'
require 'byebug'
require_relative 'cursor'
require_relative 'board'
#to_s piece
#create loop either here or in game.rb
class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    @board.grid.each.with_index do |row, idx|
      idx.even? ? start_red(row, idx) : start_blue(row, idx)
      print "\n"
    end

  end

  def start_red(tile, idx)
    i = 1
    tile.each_index do |idx2|
      if @cursor.cursor_pos == [idx, idx2]
        print "  ".colorize(:background => :green)
      elsif i.odd?
        print "  ".colorize(:background => :red)
      else

        print "  ".colorize(:background => :blue)
      end
      i += 1
    end
  end
#null_piece.to_s
#

  def start_blue(tile, idx)
    i = 1
    tile.each_index do |idx2|
      if @cursor.cursor_pos == [idx, idx2]
        print "  ".colorize(:background => :green)
      elsif i.odd?
        print "  ".colorize(:background => :blue)
      else
        print "  ".colorize(:background => :red)
      end
      i += 1
    end
  end



end
