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

ingredient10 = Ingredient.new({'name' => 'Bombay Saphire', 'price_per_ltr' => 10.0, 'is_alcoholic' => true, 'quantity' => 10, 'cost_price' => 0.0, 'sale_price' => 0.0, 'profit' => 0.0, 'mark_up' => 10})
ingredient10.save()

# ingredient5 = Ingredient.new({})
# ingredient5.save()

# ingredient6 = Ingredient.new({})
# ingredient6.save()

# ingredient7 = Ingredient.new({})
# ingredient7.save()



cocktail1 = Cocktail.new({'name' => 'Smoked Old Fashioned', 'prep_description' => 'Add your ingredients into a mixing glass and stir for several minutes. Fill karaf with smoke and strain in your old fashioned. Swirl and pour into a rocks glass with a large cube of ice. Garnish with an orange peel.'})
cocktail1.save()

cocktail2 = Cocktail.new({'name' => 'Woo Woo', 'prep_description' => 'Shake the three ingredients and serve over ice in a slim jim, garnish with a wedge of lime'})
cocktail2.save()


#Smoked Old Fashioned
ingredients_list1 = IngredientList.new({'cocktail_id' => cocktail1.id, 'ingredient_id' => ingredient5.id, 'measure' => 50})
ingredients_list1.save()

ingredients_list2 = IngredientList.new({'cocktail_id' => cocktail1.id, 'ingredient_id' => ingredient6.id, 'measure' => 5})
ingredients_list2.save()

ingredients_list3 = IngredientList.new({'cocktail_id' => cocktail1.id, 'ingredient_id' => ingredient7.id, 'measure' => 15})
ingredients_list3.save()



#Woo Woo
ingredients_list4 = IngredientList.new({'cocktail_id' => cocktail2.id, 'ingredient_id' => ingredient1.id, 'measure' => 25})
ingredients_list4.save()

ingredients_list5 = IngredientList.new({'cocktail_id' => cocktail2.id, 'ingredient_id' => ingredient2.id, 'measure' => 25})
ingredients_list5.save()

ingredients_list6 = IngredientList.new({'cocktail_id' => cocktail2.id, 'ingredient_id' => ingredient3.id, 'measure' => 100})
ingredients_list6.save()






binding.pry
nil