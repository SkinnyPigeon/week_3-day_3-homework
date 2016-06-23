require('pg')
require('pry-byebug')

class Pet

  attr_reader( :id, :name, :type )

  def initialize ( options, runner )
    @id = options['id'].to_i
    @name = options['name']
    @pet_shop_id = options['pet_shop_id'].to_i
    @type = options['type']
    @runner = runner
  end

  def save()
    sql = "INSERT INTO pets ( name, type, pet_shop_id ) VALUES ('#{ @name }', '#{ @type }', '#{ @pet_shop_id }') RETURNING * "
    @runner.run(sql)
    @id = pet_data.first['id'].to_i
  end

  def pet_shop
    sql = "SELECT * FROM pet_shop WHERE id = #{ @id }"
    pets_shop = @runner.run( sql )
    return pets_shop[0]['name']
  end

  def self.all(runner)
    sql = "SELECT * FROM pets"
    pets_data = runner.run( sql )
    pets = pets_data.map { |pet_data| Pet.new( pet_data, runner ) }
    return pets
  end


end


