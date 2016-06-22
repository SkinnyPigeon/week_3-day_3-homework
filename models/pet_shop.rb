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
    pets = pets_data.map { |pet_data| Pet.new(pet_data, @runner) }
    return pets
  end

  def self.find_by_id(id, runner)
    sql = "SELECT * FROM pet_shop WHERE id = #{id}"
    pets_shop = runner.run( sql )
    pet_shop = pets_shop.map { |pet_shop| PetShop.new(pet_shop, runner) }
    return pet_shop
  end

  def self.delete(id, runner)
    sql = "DELETE FROM pet_shop WHERE id = #{id}"
    runner.run( sql )
  end

  def edit_shop(options)
    if options['name']
      @name = options['name']
    end
    if options['address']
      @address = options['address']
    end
    if options['stock_type']
      @stock_type = options['stock_type']
    end

    shop_id = options['id'].to_i

    sql = "UPDATE pet_shop SET 
      name = '#{ @name }',
      address = '#{ @address }',
      stock_type = '#{ @stock_type }'"
      @runner.run( sql )
  end




end






