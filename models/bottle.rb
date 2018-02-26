require_relative('../db/sql_runner')

class Bottle

  attr_reader :id, :distillery_id
  attr_accessor :name, :type

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @distillery_id = options['distillery_id'].to_i
  end

  def save()
    sql = "INSERT INTO bottles
    (
      name,
      type,
      distillery_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @type, @distillery_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id'].to_i
    @id = id
  end

  def update()
    sql = "UPDATE bottles
    SET
    (
      name,
      type,
      distillery_id
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@name, @tyoe, @distillery_id, @id]
      SqlRunner.run( sql, values )
    end

    def self.all()
      sql = "SELECT * FROM bottles"
      student_data = SqlRunner.run(sql)
      students = map_items(bottle_data)
      return students
    end


    def self.map_items(bottle_data)
      return bottle_data.map { |bottle| Bottle.new(bottle) }
    end

    def self.delete_all()
      sql = "DELETE FROM bottles"
      SqlRunner.run( sql )
  end
end
