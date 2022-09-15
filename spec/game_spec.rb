require_relative '../models/game'

describe Game do
  before :each do
    @football = Game.new('2011-12-21', 'yes', '2019-12-25')
    @lodo = Game.new('2020-04-21', 'yes', '2022-04-25')
  end

  context 'Test for class Game' do
    it 'should be an instance of class game' do
      expect(@football).to be_an_instance_of Game
    end

    it 'can_be_archived? return true' do
      expect(@football.can_be_archived?).to eq(true)
    end

    it 'can_be_archived? return false' do
      expect(@lodo.can_be_archived?).to eq(false)
    end
  end
end
