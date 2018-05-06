require_relative('../db/sql_runner')

class Distillery

  attr_reader :id
  attr_accessor :name, :region

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @region = options['region']
  end

  def save()
    sql = "INSERT INTO distilleries
    (
      name,
      region
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @region]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
end

def update()
  sql = "UPDATE distilleries
    SET
    (
    name,
    region
  ) =
  (
    $1, $2
  )
    WHERE id = $3"
    values = [@name, @region, @id]
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

#finds a bottle by id entered in the browser or console
def self.find( id )
  sql = "SELECT * FROM distilleries WHERE id = $1"
  values = [id]
  distillery = SqlRunner.run( sql, values )
  result = Distillery.new( distillery.first )
  return result
end

#finds and returns all bottles
def self.all()
  sql = "SELECT * FROM distilleries"
  distillery_data = SqlRunner.run(sql)
  distilleries = Distillery.map_items(distillery_data)
  return distilleries
end

#self.map_items creates and returns an array of all distillery items
def self.map_items(distillery_data)
  return distillery_data.map { |distillery| Distillery.new(distillery) }
end

def self.delete_all()
  sql = "DELETE FROM distilleries"
  SqlRunner.run( sql )
end

end
