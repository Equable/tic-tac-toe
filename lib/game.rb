# Your code here
require_relative "player"
require_relative "board"
require_relative "space"
require 'pry'
class Game
  attr_reader :players, :board
  def initialize
    @players = []
    @board = Board.new
  end

  def get_players
    puts "Player 1 (X), what is your name?"
    @players << Player.new(gets.chomp, 'X')
    puts "\nPlayer 2 (O), what is your name?"
    @players << Player.new(gets.chomp, 'O')
    puts ""
  end

  def move(player)
    puts "\n#{player.name} (#{player.symbol}): Select Row"
    row = gets.strip.to_i
    puts "\nSelect Column"
    column = gets.strip.to_i
    @board.spaces[row - 1][column - 1].player = player
    puts ""
  end

  def winner_row?(player)
    @board.spaces.each do |row|
      winner = 0
      row.each do |space|
          winner += 1 if space.symbol == player.symbol
      end
      return true if winner == 3
    end
    false
  end

  def winner_column?(player)
    (0..2).each do |column|
      winner = 0
      @board.spaces.each do |row|
        winner += 1 if row[column].symbol == player.symbol
      end
      return true if winner == 3
    end
    false
  end

  def winner_diagonal?(player)
    winner = 0
    winner += 1 if @board.spaces[0][0].symbol == player.symbol
    winner += 1 if @board.spaces[1][1].symbol == player.symbol
    winner += 1 if @board.spaces[2][2].symbol == player.symbol
    return true if winner == 3
    winner = 0
    winner += 1 if @board.spaces[0][2].symbol == player.symbol
    winner += 1 if @board.spaces[1][1].symbol == player.symbol
    winner += 1 if @board.spaces[2][0].symbol == player.symbol
    return true if winner == 3
    false
  end

  def winner?(player)
    return true if self.winner_row?(player) || self.winner_column?(player) || self.winner_diagonal?(player)
    false
  end

  def play
    self.get_players
    @board.print
    current_player = nil
    loop do
      @players.each do |player|
        current_player = player
        self.move(player)
        @board.print
        puts ""
        if self.winner?(player)
          return puts "#{current_player.name} wins!"
        end
      end
    end
  end
end
