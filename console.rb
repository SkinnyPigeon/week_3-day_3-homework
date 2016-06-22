require_relative('./models/pet_shop')
require_relative('./models/pets')
require_relative('./db/pet_runner')
require('pry-byebug')

runner=SqlRunner.new( {dbname: 'another_pet_shop', host:'localhost'} )


pet_shop=PetShop.new( { 'name' => "Mikes Cats n Shit", 'address' => '123 Fake Street', 'stock_type' => 'Weird Looking Pets'}, runner )
pet_shop.save()

pet1=Pet.new( { 'name' => 'Spunky', 'type' => 'dog', 'pet_shop_id' => pet_shop.id }, runner )
pet2=Pet.new( { 'name' => 'Safe As Milk', 'type' => 'dog', 'pet_shop_id' => pet_shop.id }, runner )
pet1.save()
pet2.save()
# puts pet_shop.pets
binding.pry
nil