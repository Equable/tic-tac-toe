# Your code here
require_relative "player"
class Space
  attr_accessor :player, :symbol

  def symbol
    if !@player.nil?
      @player.symbol
    else
      '-'
    end
  end
end
