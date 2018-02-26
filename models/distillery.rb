require_relative('../db/sql_runner')

class Distillery
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO distilleries
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
end

def update()
  sql = "UPDATE distilleries
    SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
end

def delete()
  sql = "DELETE FROM distilleries
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end

def bottle()
  sql = "SELECT * FROM bottles
  WHERE distillery_id = $1"
  values = [@id]
  results = SqlRunner.run( sql, values)
  bottle_data = results[0]
  bottle = Bottle.new(bottle_data)
  return bottle
end

def self.find( id )
  sql = "SELECT * FROM distilleries WHERE id = $1"
  values = [@id]
  bottle = SqlRunner.run( sql, values )
  result = Distillery.new( distillery.first )
  return result
end

def self.all()
  sql = "SELECT * FROM distilleries"
  distillery_data = SqlRunner.run(sql)
  distilleries = Distillery.map_items(distillery_data)
  return distilleries
end


def self.map_items(distillery_data)
  return distillery_data.map { |distillery| Distillery.new(distillery) }
end

def self.delete_all()
  sql = "DELETE FROM distilleries"
  SqlRunner.run( sql )
end

end
