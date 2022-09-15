require_relative '../models/authors'

describe Author do
  before :each do
    @profsain = Author.new('Profsain', 'Husain')
  end

  context 'Test for Author class' do
    it 'should be instance of author' do
      expect(@profsain).to be_an_instance_of Author
    end

    it 'should return first-name' do
      expect(@profsain.first_name).to eq('Profsain')
    end

    it 'should return last-name' do
      expect(@profsain.last_name).to eq('Husain')
    end

      it 'Should return the number of items in the label' do
        @profsain.add_item(Game.new('2011-12-21', 'yes', '2019-12-25'))
        @profsain.add_item(Game.new('2011-12-21', 'yes', '2019-12-25'))
        @profsain.add_item(Game.new('2011-12-21', 'yes', '2019-12-25'))
        expect(@profsain.items.length).to eq(3)
      end
  end
end
