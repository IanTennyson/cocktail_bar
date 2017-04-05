require_relative( '../db/sql_runner' )

class IngredientList

  attr_reader :id, :cocktail_id, :ingredient_id, :measure

  def initialize(options)
    @id = options['id'].to_i
    @cocktail_id = options['cocktail_id'].to_i
    @ingredient_id = options['ingredient_id'].to_i
    @measure = options['measure'].to_i
  end

  def save()
    sql = "INSERT INTO ingredients_lists (cocktail_id, ingredient_id, measure) VALUES ( #{@cocktail_id}, #{@ingredient_id}, #{@measure} ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end


  def update()
    sql = "UPDATE ingredients_lists SET (cocktail_id, ingredients_id, measure) = ( #{@cocktail_id}, #{@ingredient_id}, #{@measure} ) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def cocktail_name()
    sql = "SELECT cocktails.name FROM cocktails WHERE id = #{@cocktail_id}"
    SqlRunner.run(sql).first()
  end

  def ingredient_name()
    sql = "SELECT ingredients.name FROM ingredients WHERE id = #{@ingredient_id}"
    SqlRunner.run(sql).first()
  end

  def ingredients()
    sql = "SELECT * FROM ingredients WHERE id = #{@ingredient_id}"
    Ingredient.map_items(sql).first
  end

  def cost_per_measure()
    cost_per_ml = ingredients().price_per_ltr / 1000
    return cost_per_ml * @measure
  end

  def quantity
    quantity = ingredients().quantity
    if quantity >= 10
      return "High Stock Levels"
    elsif quantity >= 3
      return "Moderate Stock Levels"
    else
      return "Low Stock Levels"
    end
  end








#broken
  # def self.measures()
  #   sql = "SELECT * FROM ingredients_lists WHERE id = #{@cocktail_id}"
  #   SqlRunner.run(sql).first
  # end


  def self.delete_all()
    sql = "DELETE FROM ingredients_lists"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM ingredients_lists"
    IngredientList.map_items(sql)
  end


  def self.map_items(sql)
    ingredients_list = SqlRunner.run(sql)
    return ingredients_list.map { |ingredient| IngredientList.new(ingredient) }
  end


end