require_relative('../db/sql_runner')

class Bottle

  attr_reader :id, :distillery_id
  attr_accessor :name, :type, :quantity, :buy_price, :sell_price

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @quantity = options['quantity'].to_i
    @distillery_id = options['distillery_id'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
  end

  def save()
    sql = "INSERT INTO bottles
    (
      name,
      type,
      quantity,
      distillery_id,
      buy_price,
      sell_price
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @type, @quantity, @distillery_id, @buy_price, @sell_price]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE bottles
    SET
    (
      name,
      type,
      quantity,
      distillery_id
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@name, @type, @quantity, @distillery_id, @id]
      SqlRunner.run( sql, values )
    end

    def self.find( id )
      sql = "SELECT * FROM bottles WHERE id = $1"
      values = [id]
      bottle = SqlRunner.run( sql, values )
      result = Bottle.new( bottle.first )
      return result
    end

    def delete()
      sql = "DELETE FROM bottles
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def distillery()
      sql = "SELECT * FROM distilleries
      WHERE id = $1"
      values = [@distillery_id]
      results = SqlRunner.run( sql, values)
      distillery_data = results[0]
      distillery = Distillery.new(distillery_data)
      return distillery
    end

    def stock_level()
      if @quantity >= 50
        return "High"
      elsif @quantity >= 20
        return "Medium"
      else
        return "Low"
      end
    end

    def mark_up()
      profit = @sell_price - @buy_price
      return profit
    end

    def self.all()
      sql = "SELECT * FROM bottles"
      bottle_data = SqlRunner.run(sql)
      bottles = Bottle.map_items(bottle_data)
      return bottles
    end


    def self.map_items(bottle_data)
      return bottle_data.map { |bottle| Bottle.new(bottle) }
    end

    def self.delete_all()
      sql = "DELETE FROM bottles"
      SqlRunner.run( sql )
    end

  end
