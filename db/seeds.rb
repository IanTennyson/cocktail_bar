require_relative( '../models/ingredients.rb' )
require_relative( '../models/ingredients_list.rb' )
require_relative( '../models/cocktails.rb' )
require('pry-byebug')

IngredientList.delete_all()
Cocktail.delete_all()
Ingredient.delete_all()



ingredient1 = Ingredient.new({'name' => 'Vodka', 'price_per_ltr' => 15.0, 'is_alcoholic' => true, 'quantity' => 5, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 0})
ingredient1.save()

ingredient2 = Ingredient.new({'name' => 'Peach Schnapps', 'price_per_ltr' => 7.50, 'is_alcoholic' => true, 'quantity' => 10, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 5})
ingredient2.save()

ingredient3 = Ingredient.new({'name' => 'Cranberry', 'price_per_ltr' => 1.98, 'is_alcoholic' => false, 'quantity' => 15, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 7})
ingredient3.save()

ingredient4 = Ingredient.new({'name' => 'Orange', 'price_per_ltr' => 1.23, 'is_alcoholic' => false, 'quantity' => 15, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 6})
ingredient4.save()

ingredient5 = Ingredient.new({'name' => 'Whiskey', 'price_per_ltr' => 15.0, 'is_alcoholic' => true, 'quantity' => 5, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 0})
ingredient5.save()

ingredient6 = Ingredient.new({'name' => 'Angostura Bitters', 'price_per_ltr' => 49.80, 'is_alcoholic' => true, 'quantity' => 3, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 1})
ingredient6.save()

ingredient7 = Ingredient.new({'name' => 'Simple Syrup', 'price_per_ltr' => 6.70, 'is_alcoholic' => false, 'quantity' => 6, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 2})
ingredient7.save()

ingredient8 = Ingredient.new({'name' => 'Bombay Saphire', 'price_per_ltr' => 10.0, 'is_alcoholic' => true, 'quantity' => 10, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 10})
ingredient8.save()








#ZOMBIE
ingredient9 = Ingredient.new({'name' => 'White Rum', 'price_per_ltr' => 15.0, 'is_alcoholic' => true, 'quantity' => 10, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 2})
ingredient9.save()

ingredient10 = Ingredient.new({'name' => 'Apricot Brandy', 'price_per_ltr' => 20, 'is_alcoholic' => true, 'quantity' => 5, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 6})
ingredient10.save()

ingredient15 = Ingredient.new({'name' => 'Grenadine', 'price_per_ltr' => 5.71, 'is_alcoholic' => false, 'quantity' => 7, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 1})
ingredient15.save()

ingredient12 = Ingredient.new({'name' => 'Pineapple', 'price_per_ltr' => 1.23, 'is_alcoholic' => false, 'quantity' => 13, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 2})
ingredient12.save()

ingredient13 = Ingredient.new({'name' => 'Sweet & Sour', 'price_per_ltr' => 5.0, 'is_alcoholic' => false, 'quantity' => 6, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 2})
ingredient13.save()

ingredient14 = Ingredient.new({'name' => 'Overproof Rum', 'price_per_ltr' => 37.39, 'is_alcoholic' => true, 'quantity' => 10, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 7})
ingredient14.save()

ingredient11 = Ingredient.new({'name' => 'Dark Rum', 'price_per_ltr' => 28.6, 'is_alcoholic' => true, 'quantity' => 10, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 5})
ingredient11.save()





cocktail1 = Cocktail.new({'name' => 'Smoked Old Fashioned', 'prep_description' => 'Add your ingredients into a mixing glass and stir for several minutes. Fill karaf with smoke and strain in your old fashioned. Swirl and pour into a rocks glass with a large cube of ice. Garnish with an orange peel.'})
cocktail1.save()

cocktail2 = Cocktail.new({'name' => 'Flaming Zombie', 'prep_description' => 'Fill your glass with ice and sink your grenadine. Add all your ingredients except the over proof rum into your shaker. Float the overproof rum on top and burn cinammon for garninsh.'})
cocktail2.save()


#Smoked Old Fashioned
ingredients_list1 = IngredientList.new({'cocktail_id' => cocktail1.id, 'ingredient_id' => ingredient5.id, 'measure' => 50})
ingredients_list1.save()

ingredients_list2 = IngredientList.new({'cocktail_id' => cocktail1.id, 'ingredient_id' => ingredient6.id, 'measure' => 5})
ingredients_list2.save()

ingredients_list3 = IngredientList.new({'cocktail_id' => cocktail1.id, 'ingredient_id' => ingredient7.id, 'measure' => 15})
ingredients_list3.save()



#Flaming Zombie
ingredients_list9 = IngredientList.new({'cocktail_id' => cocktail2.id, 'ingredient_id' => ingredient9.id, 'measure' => 15})
ingredients_list9.save()

ingredients_list10 = IngredientList.new({'cocktail_id' => cocktail2.id, 'ingredient_id' => ingredient10.id, 'measure' => 15})
ingredients_list10.save()

ingredients_list11 = IngredientList.new({'cocktail_id' => cocktail2.id, 'ingredient_id' => ingredient11.id, 'measure' => 15})
ingredients_list11.save()

ingredients_list12 = IngredientList.new({'cocktail_id' => cocktail2.id, 'ingredient_id' => ingredient12.id, 'measure' => 50})
ingredients_list12.save()

ingredients_list13 = IngredientList.new({'cocktail_id' => cocktail2.id, 'ingredient_id' => ingredient13.id, 'measure' => 50})
ingredients_list13.save()

ingredients_list14 = IngredientList.new({'cocktail_id' => cocktail2.id, 'ingredient_id' => ingredient14.id, 'measure' => 10})
ingredients_list14.save()

ingredients_list15 = IngredientList.new({'cocktail_id' => cocktail2.id, 'ingredient_id' => ingredient15.id, 'measure' => 10})
ingredients_list15.save()






binding.pry
nil