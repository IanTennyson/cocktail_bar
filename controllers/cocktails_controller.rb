require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cocktails.rb' )
require_relative( '../models/ingredients.rb' )
require_relative( '../models/ingredients_list.rb' )



get '/cocktails' do
  @cocktails = Cocktail.all
  @ingredient_list = IngredientList.all

  erb( :"cocktails/index" )
end