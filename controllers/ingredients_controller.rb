require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/ingredients.rb' )
require_relative( '../models/cocktails.rb' )



get '/ingredients' do
  @alc_ingredients = Ingredient.all_alcoholic()
  @non_alc_ingredients = Ingredient.all_non_alcoholic()
  @total_cost_price = Ingredient.total_stock_cost_price()
  @total_profit = Ingredient.total_potential_profit()
  erb( :"ingredients/index" )
end



get '/ingredients/new' do
  @ingredients = Ingredient.all
  erb(:"ingredients/new")
end

post '/ingredients' do
  ingredient = Ingredient.new(params)
  ingredient.save()
  redirect to ("/ingredients")
end



post '/ingredients/:id/delete' do
  Ingredient.delete(params[:id])
  redirect to("/ingredients")
end



get '/ingredients/:id/edit' do
  @ingredient = Ingredient.find(params[:id])
  erb(:"ingredients/edit")
end

post '/ingredients/:id' do 
  @ingredient = Ingredient.new(params)
  @ingredient.update

  redirect to("/ingredients")
end
