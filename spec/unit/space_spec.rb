require 'spaces'
require_relative '../database_helpers'

describe Spaces do
  describe '.all' do
    it 'returns all spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO spaces (name, description, price) VALUES ('Blessing Apartment', 'Beautiful three bedroom house', '500');")
      connection.exec("INSERT INTO spaces (name, description, price) VALUES ('Another Apartment', 'Beautiful four bedroom house', '400');")
      
      spaces = Spaces.all
    
      expect(spaces.length).to eq 2
      expect(spaces.first).to be_a Spaces
      # expect(spaces.first.id).to eq spaces.id
      expect(spaces.first.name).to eq 'Blessing Apartment'
      expect(spaces.last.name).to eq 'Another Apartment'
      expect(spaces.first.des).to eq 'Beautiful three bedroom house'
      # expect(spaces.first.price).to eq '500'
    end
  end
end


describe '.create' do
  it 'creates a new space' do
    spaces = Spaces.create(name: 'Tosin Bed & Breakfast', des: 'Beautiful all in one house', price: '300')
    persisted_data = persisted_data(id: spaces.id)

    # expect(spaces['name']).to eq 'Tosin Bed & Breakfast'
    # expect(spaces['description']).to eq 'Beautiful all in one house'

    expect(spaces).to be_a Spaces
    expect(spaces.id).to eq persisted_data.first['id']
    expect(spaces.name).to eq 'Tosin Bed & Breakfast'
    expect(spaces.des).to eq 'Beautiful all in one house'
    # expect(spaces[price]).to eq '300'
  end
end