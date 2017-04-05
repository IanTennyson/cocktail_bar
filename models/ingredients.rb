require_relative( '../db/sql_runner' )
require('pry')

class Ingredient

  attr_reader :id, :name, :is_alcoholic, :price_per_ltr, :quantity, :cost_price, :sale_price, :profit

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @price_per_ltr = options['price_per_ltr'].to_f
    @is_alcoholic = options['is_alcoholic'] 
    @quantity = options['quantity'].to_i
    @cost_price = options['cost_price'].to_f
    @sale_price = options['sale_price'].to_f
    @profit = options['profit'].to_f
    if (options['mark_up'].to_i != 0)
      @mark_up = options['mark_up'].to_i 
    else
      @mark_up = 3
    end
  end

  def save()
    sql = "INSERT INTO ingredients (name, price_per_ltr, is_alcoholic, quantity, cost_price, sale_price, profit, mark_up) VALUES ( '#{@name}', '#{@price_per_ltr}', '#{@is_alcoholic}', #{@quantity}, #{cost_price}, #{sale_price}, #{profit}, #{@mark_up} ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
    ingredient_cost_price()
    ingredient_sale_price()
    ingredient_profit()
  end

  def update()
    sql = "UPDATE ingredients SET (name, price_per_ltr, is_alcoholic, quantity, cost_price, sale_price, profit, mark_up) = ( '#{@name}', '#{@price_per_ltr}', '#{@is_alcoholic}', #{@quantity}, #{cost_price}, #{sale_price}, #{profit}, #{@mark_up}) WHERE id = #{@id}"
    SqlRunner.run(sql)
    ingredient_cost_price()
    ingredient_sale_price()
    ingredient_profit()
  end

  def delete
    sql = "DELETE FROM ingredients WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def price_per_ltr()
    sql = "SELECT price_per_ltr FROM ingredients WHERE id = #{@id}"
    return SqlRunner.run(sql).first().values().pop.to_f
  end

  def quantity()
    sql = "SELECT quantity FROM ingredients WHERE id = #{@id}"
    return SqlRunner.run(sql).first().values().pop.to_i
  end

  def ingredient_cost_price()
    cost_price = price_per_ltr() * quantity()
    update_cost_price(cost_price)
    return cost_price
  end

  def update_cost_price(new_cost_price)
    sql = "UPDATE ingredients SET (cost_price) = (#{new_cost_price}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def ingredient_mark_up()
    sql = "SELECT mark_up FROM ingredients WHERE id = #{@id}"
    SqlRunner.run(sql).first.values().pop.to_i
  end

  def ingredient_sale_price()
    sale_price = ingredient_cost_price() * ingredient_mark_up()
    one_percent = sale_price / 100
    twenty_percent = one_percent * 20
    sale_price_inc_vat = sale_price + twenty_percent
    update_sale_price(sale_price_inc_vat)
    return sale_price_inc_vat
  end

  def update_sale_price(new_sale_price)
    sql = "UPDATE ingredients SET (sale_price) = (#{new_sale_price}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def ingredient_profit()
    profit = ingredient_sale_price - ingredient_cost_price()
    profit_minus_vat =  
    update_profit(profit)
    return profit
  end

  def update_profit(new_profit)
    sql = "UPDATE ingredients SET (profit) = (#{new_profit}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def price_per_ml()
    cost_of_ltr = price_per_ltr()
    cost_of_ml = cost_of_ltr / 1000 
    return cost_of_ml
  end

  def cocktail()
    sql = "SELECT cocktails.name FROM cocktails INNER JOIN ingredients_lists ON cocktails.id = ingredients_lists.cocktail_id WHERE ingredients_lists.ingredient_id = #{@id}"
    Ingredient.map_items(sql)
  end

  def quantity_level()
    quantity_no = quantity()
    if quantity_no >= 10
      return "High Stock Levels"
    elsif quantity_no >= 3
      return "Moderate Stock Levels"
    else
      return "Low Stock Levels"
    end
  end



  def self.delete_all()
    sql = "DELETE FROM ingredients"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM ingredients"
    return Ingredient.map_items(sql)
  end

  def self.all_alcoholic()
    sql = "SELECT * FROM ingredients WHERE is_alcoholic = 't'"
    return Ingredient.map_items(sql)
  end

  def self.all_non_alcoholic()
    sql = "SELECT * FROM ingredients WHERE is_alcoholic = 'f'"
    return Ingredient.map_items(sql)
  end

  def self.find( id )
    sql = "SELECT * FROM ingredients WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Ingredient.new( results.first )
  end

  def self.all_price_per_ltrs()
    sql = "SELECT price_per_ltr FROM ingredients"
    result = SqlRunner.run( sql ).values().flatten()
    ltr_price_array = result.map {|string| string.to_f}
    return ltr_price_array
  end

  def self.all_quantities()
    sql = "SELECT quantity FROM ingredients"
    quantity_string_array = SqlRunner.run( sql ).values().flatten()
    quantity_array = quantity_string_array.map{|string| string.to_f}
    return quantity_array
  end

  def self.stock_cost_price_array()
    [all_price_per_ltrs(), all_quantities()].transpose.map {|a| a.inject(:*)}
  end

  def self.total_stock_cost_price()
    sum = 0.0
    stock_cost_price_array.each{ |num|  sum+=num}
    return sum.round(2)
  end

  def self.all_profits()
    sql = "SELECT profit FROM ingredients"
    profit_string_array = SqlRunner.run( sql ).values().flatten()
    profit_array = profit_string_array.map{|string| string.to_f}
    return profit_array
  end

  def self.total_potential_profit()
    sum = 0.0
    all_profits.each{ |num|  sum+=num}
    return sum.round(2)
  end

  def self.delete(id)
    sql = "DELETE FROM ingredients where id = #{id}"
    SqlRunner.run( sql )
  end

  def self.map_items(sql)
    ingredients = SqlRunner.run(sql)
    return ingredients.map { |ingredient| Ingredient.new(ingredient) }
  end
  
end