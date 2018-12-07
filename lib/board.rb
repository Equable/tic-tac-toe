# Your code here
require_relative "space"
class Board
  attr_reader :spaces, :size
  def initialize(size = 3)
    @size = size
    @spaces = Array.new(size){Array.new([Space.new, Space.new, Space.new])}
  end

  def print
    divider = "\n-----------\n"
    pretty = ""
    @spaces.each do |row|
      str = ""
      row.each do |space|
        str += " #{space.symbol} |"
      end
      pretty += str[0...-1] + divider
    end
    puts pretty[0...-12]
  end
end
