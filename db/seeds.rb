require 'open-uri'
require 'json'

ingredients_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

response = open(ingredients_url).read
ingredients = JSON.parse(response)

puts 'starting seed'

ingredients['drinks'].each do |drink|
  Ingredient.create!(name: drink.values[0])
end

martini_photo = URI.open('https://res.cloudinary.com/dfwlxwow2/image/upload/v1605849410/stanislav-ivanitskiy-VIYPN3KykEU-unsplash_t8kgc4.jpg')
martini = Cocktail.create!(name: "Classic Martini")
martini.photo.attach(io: martini_photo, filename: 'martini.png', content_type: 'image/png')

old_photo = URI.open('https://res.cloudinary.com/dfwlxwow2/image/upload/v1605860584/sean-bernstein-VLc3BggMacw-unsplash_vmkvqa.jpg')
old = Cocktail.create!(name: "Old Fashioned")
old.photo.attach(io: old_photo, filename: 'old.png', content_type: 'image/png')

gt_photo = URI.open('https://res.cloudinary.com/dfwlxwow2/image/upload/v1605849408/nikolay-dimitrov-hiGlNxHIt9U-unsplash_t90zpn.jpg')
gt = Cocktail.create!(name: "Gin & Tonic")
gt.photo.attach(io: gt_photo, filename: 'old.png', content_type: 'image/png')

bel_photo = URI.open('https://res.cloudinary.com/dfwlxwow2/image/upload/v1605849408/daniel-horvath-joaNTMyVSTc-unsplash_wcisg3.jpg')
bel = Cocktail.create!(name: "Bellini")
bel.photo.attach(io: bel_photo, filename: 'old.png', content_type: 'image/png')

ess_photo = URI.open('https://res.cloudinary.com/dfwlxwow2/image/upload/v1605849408/david-greenwood-haigh-iAXrwurNea4-unsplash_pzxasn.jpg')
ess = Cocktail.create!(name: "Esspresso Martini")
ess.photo.attach(io: ess_photo, filename: 'old.png', content_type: 'image/png')

puts 'seed complete'
