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
        Spaces.new(space['space_id'], space['name'], space['description'], space['price'])
      end
  end

  def self.find(id:)
  end

  def self.create(name:, des:, price:)
    result = DatabaseConnection.query("INSERT INTO spaces (name, description, price) 
    VALUES('#{name}', '#{des}', '#{price}') RETURNING space_id, name, description, price;")
    Spaces.new(result[0]['space_id'], result[0]['name'], result[0]['description'], result[0]['price'])
  end 
end