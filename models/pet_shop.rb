require('pry-byebug')

class PetShop

  
  attr_reader(:name, :id, :address, :stock_type, :pets_id)

  def initialize( options, runner )
    @name = options['name']
    @id = options['id'].to_i
    @pets_id = options['pets_id'].to_i
    @runner = runner
    @address = options['address']
    @stock_type = options['stock_type']
  end

  def save()
    sql = "INSERT INTO pet_shop (name, address, stock_type) VALUES ('#{@name}', '#{address}', '#{stock_type}') RETURNING *"
    pet_shop_data = @runner.run( sql )
    @id = pet_shop_data.first['id'].to_i
  end

  def pets()
    sql = "SELECT * FROM pets WHERE pet_shop_id = #{@id}"
    pets_data = @runner.run( sql )
    # binding.pry
    pets = pets_data.map { |pet_data| Pet.new(pet_data, @runner) }
    return pets
  end

end






