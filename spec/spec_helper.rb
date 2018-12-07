require 'rspec'
require 'pry'

require_relative '../lib/board'
require_relative '../lib/space'
require_relative '../lib/player'
require_relative '../lib/game'

RSpec.configure do |c|
  c.before { allow($stdout).to receive(:write)}
end
