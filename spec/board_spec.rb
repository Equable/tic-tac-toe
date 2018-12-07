require 'spec_helper'

# Your code here
describe Board do
  let (:board) { Board.new }
  describe '.new' do
    context 'its a new board being made' do
      it 'will create a 2D array' do
        expect(board.spaces).to be_a(Array)
        expect(board.spaces.length).to eq(board.size)
        board.spaces.each do |row|
          expect(row).to be_a(Array)
          expect(row.length).to eq(board.size)
          row.each do |space|
            expect(space).to be_a(Space)
          end
        end
      end
      it 'will be filled with Space objects in each row' do
        board.spaces.each do |row|
          row.each do |space|
            expect(space).to be_a(Space)
          end
        end
      end
    end
  end
end
