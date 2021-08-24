require 'pg'
require_relative 'database_connection'

class Spaces
  attr_reader :id, :name, :des, :price

  def initialize(id, name, des, price)
    @id  = id
    @name = name
    @des = des
    @price = price
  end

  def self.all
      result = DatabaseConnection.query("SELECT * FROM spaces")
      result.map do|space| 
        Spaces.new(space['id'], space['name'], space['des'], space['price'])
      end
  end

  def self.find(id:)
  end

  def self.create(name:, des:, price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'spaces_test')
    else
      connection = PG.connect(dbname: 'spaces')
    end
  
    result = connection.exec("INSERT INTO spaces (name, des, price) 
    VALUES('#{name}', '#{des}', '#{price}') RETURNING id, name, des, price;")
    
    Spaces.new(id: result[0]['id'], name: result[0]['name'],
     des: result[0]['des'], price: result[0]['price'])
  end 
end