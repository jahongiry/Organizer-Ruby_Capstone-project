require_relative '../models/author'

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
  end
end
