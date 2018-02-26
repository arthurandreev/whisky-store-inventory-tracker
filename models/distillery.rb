require_relative('../db/sql_runner')

class Distillery
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
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

def self.delete_all()
  sql = "DELETE FROM distilleries"
  SqlRunner.run( sql )
end

end
