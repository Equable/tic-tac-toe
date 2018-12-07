require 'spec_helper'
require 'pry'
## Check for output == expect{board.move}.to output("Please select a row\n").to_stdout
# Your code here
describe Game do
  let(:tac_toe) { Game.new }
  describe '.new' do
    context 'when making a new game' do
      it 'should create an empty array of players' do
        expect(tac_toe.players.length).to eq(0)
      end
      it 'should create a board' do
        expect(tac_toe.board).to be_a(Board)
      end
    end
  end
  describe '#get_players' do
    it "should take an input for player 1 and 2s name" do
      allow(tac_toe).to receive(:gets).and_return("Louis", "Sasha")
      tac_toe.get_players
      expect(tac_toe.players[0].name).to eq("Louis")
      expect(tac_toe.players[0].symbol).to eq("X")
      expect(tac_toe.players[1].name).to eq("Sasha")
      expect(tac_toe.players[1].symbol).to eq("O")
    end
  end
  describe '#move' do
    context 'the player will be asked the row and column' do
      it 'Player 1 fill the board in row/col selected' do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","1","1")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.board.spaces[0][0].symbol).to eq('X')
        expect(tac_toe.board.spaces[0][0].player.name).to eq('Louis')
      end
      it 'Player 2 fill the board in row/col selected' do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","2","3")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[1])
        expect(tac_toe.board.spaces[1][2].symbol).to eq('O')
        expect(tac_toe.board.spaces[1][2].player.name).to eq('Sasha')
      end
    end
  end

  describe "#winner_row?" do
    context "checks each row and tells if winner" do
      it "row 1 true" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","1","1","1","2","1","3")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_row?(tac_toe.players[0])).to eq(true)
      end
      it "row 2 true" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","2","1","2","2","2","3")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_row?(tac_toe.players[0])).to eq(true)
      end
      it "row 3 true" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","3","1","3","2","3","3")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_row?(tac_toe.players[0])).to eq(true)
      end
      it "row 1 false" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","1","1","1","2","1","3")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[1])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_row?(tac_toe.players[0])).to eq(false)
      end
      it "row 3 false" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","3","1","3","2")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_row?(tac_toe.players[0])).to eq(false)
      end
    end
  end

  describe "#winner_column?" do
    context "checks each column and tells if winner" do
      it "col 1 true" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","1","1","2","1","3","1")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_column?(tac_toe.players[0])).to eq(true)
      end
      it "col 2 true" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","1","2","2","2","3","2")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_column?(tac_toe.players[0])).to eq(true)
      end
      it "col 3 true" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","1","3","2","3","3","3")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_column?(tac_toe.players[0])).to eq(true)
      end
      it "col 1 false" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","1","1","2","1","3","1")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[1])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_column?(tac_toe.players[0])).to eq(false)
      end
      it "col 3 false" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","3","1","1","1")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_column?(tac_toe.players[0])).to eq(false)
      end
    end
  end

  describe "#winner_diagonal?" do
    context "checks each diagonal and tells if winner" do
      it "diag 1 true" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","1","1","2","2","3","3")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_diagonal?(tac_toe.players[0])).to eq(true)
      end
      it "diag 2 true" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","3","1","2","2","1","3")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_diagonal?(tac_toe.players[0])).to eq(true)
      end
      it "diag false (XOX)" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","3","1","2","2","1","3")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[1])
        tac_toe.move(tac_toe.players[0])
        expect(tac_toe.winner_diagonal?(tac_toe.players[0])).to eq(false)
      end
      it "diag false (-OX)" do
        allow(tac_toe).to receive(:gets).and_return("Louis","Sasha","3","1","2","2")
        tac_toe.get_players
        tac_toe.move(tac_toe.players[0])
        tac_toe.move(tac_toe.players[1])
        expect(tac_toe.winner_diagonal?(tac_toe.players[0])).to eq(false)
      end
    end
  end
end
