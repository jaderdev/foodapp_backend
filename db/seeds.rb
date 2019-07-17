# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do  

   ary = Array.new() 
   	6.times do 
   		ary.push(Faker::Food.ingredient) 
   	end
   ended = ary * ", "

	Item.create({
		nome: Faker::Food.ingredient,
		descricao: Faker::Lorem.sentence,
		ingredientes: ended
	})
end

