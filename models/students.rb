require_relative('../db/sql_runner.rb')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :house_id

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house_id = options['house_id'].to_i
  end

  def self.find_all_students()
    sql = "SELECT * FROM students;"
    result = SqlRunner.run(sql)
    return Student.map_students(result)
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, age, house_id) VALUES ($1, $2, $3, $4) returning id;"
    values = [@first_name, @last_name, @age, @house_id]
    result = SqlRunner.run(sql, values)[0]
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE students SET (first_name, last_name, age, house_id) = ($1, $2, $3, $4) where id = $5;"
    values = [@first_name, @last_name, @age, @house_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM students WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def self.find_students_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1;"
    values = [id]
    students = SqlRunner.run(sql, values)
    return Student.map_students(students)
  end

  def self.map_students(students_data)
    return students_data.map { |student| Student.new(student) }
  end


end
