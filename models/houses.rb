require_relative('../db/sql_runner.rb')

class House

  attr_reader :id
  attr_accessor :name, :logo

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = "INSERT INTO houses (name, logo) VALUES ($1, $2) returning id;"
    values = [@name, @logo]
    result = SqlRunner.run(sql, values)[0]
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE houses SET (name, logo) = ($1, $2) WHERE id = $1"
    values = [@name, @logo, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM houses WHERE id = $1"
    values = [@id]
    SqlRunner.run(values)
  end

  def self.find_house_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1;"
    values = [id]
    houses = SqlRunner.run(sql, values)
    return House.map_houses(houses)
  end

  def self.show_all()
    sql = "SELECT * FROM houses"
    result = SqlRunner.run(sql)
    return House.map_houses(result)
  end

  def self.delete_all()
    sql = "DELETE FROM houses;"
    SqlRunner.run(sql)
  end

  def self.map_houses(houses_data)
    return houses_data.map { |house| House.new(house) }
  end


end
