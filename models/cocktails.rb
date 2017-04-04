require_relative( '../db/sql_runner' )

class Cocktail

  attr_reader :id, :name, :prep_description

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @prep_description = options['prep_description']
  end

  def save()
    sql = "INSERT INTO cocktails (name, prep_description) VALUES ( '#{@name}', '#{@prep_description}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE cocktails SET (name, prep_description) = ( '#{@name}', '#{@prep_description}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM cocktails WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

#I want the ingredients from the ingredients_lists join
  def ingredients()
    sql = "SELECT * FROM ingredients_lists WHERE cocktail_id = #{@id}"
      IngredientList.map_items(sql)
  end








  # def ingredients()
  #   sql = "SELECT name FROM ingredients INNER JOIN ingredients_lists ON ingredients.id = ingredients_lists.ingredient_id WHERE ingredients_lists.cocktail_id = #{@id}"
  #   SqlRunner.run(sql)
  # end

  def names_measures()
    sql = "SELECT ing.name, measure FROM ingredients_lists ing_list INNER JOIN ingredients ing ON ing.id = ing_list.ingredient_id WHERE cocktail_id = #{@id}"
    Cocktail.map_items(sql)

    #SELECT ing.name,measure 
    #FROM ingredients_lists ing_list 
    #inner join ingredients ing on ing.id = ing_list.ingredient_id 
    #WHERE cocktail_id = 69;

    # SELECT {WHAT} 
    # FROM {TABLE} {A1}
    # INNER JOIN {TABLE} {A2} ON A1.{COLUMN} = A2.{COLUMN}
    # WHERE {WHAT}

  end









  def self.delete_all()
    sql = "DELETE FROM cocktails"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM cocktails"
    results = SqlRunner.run( sql )
    return results.map { |hash| Cocktail.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM cocktails WHERE id = #{id}"
    results = SqlRunner.run( sql )
    return Cocktail.new( results.first )
  end

  def self.map_items(sql)
    cocktails = SqlRunner.run(sql)
    return cocktails.map { |cocktail| Cocktail.new(cocktail) }
  end

end