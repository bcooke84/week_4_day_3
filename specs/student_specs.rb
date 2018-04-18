require_relative('../models/houses.rb')
require_relative('../models/students.rb')
require_relative('../db/sql_runner.rb')

require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

class StudentTest < MiniTest::Test

def setup()
  @gryffindor = House.new({
      'name' => 'Gryffindor',
      'logo' => '../public/gryffindor.png'
    })
  @slytherin = House.new({
    'name' => 'Slytherin',
      'logo' => '../public/slytherin.png'
    })
  @student1 = Student.new({
    'first_name' => 'Harry',
    'last_name' => 'Potter',
    'age' => '15',
    'house_id' => @gryffindor.id
    })
  @student2 = Student.new({
    'first_name' => 'Draco',
    'last_name' => 'Malfoy',
    'age' => '15',
    'house_id' => @slytherin.id
    })
  end

  def test_get_first_name()
    assert_equal("Harry", @student1.first_name)
  end

  def test_get_last_name()
    assert_equal("Potter", @student1.last_name)
  end

  def test_get_age()
    assert_equal(15, @student2.age)
  end

  def test_find_all_students()
    assert_equal(4, Student.find_all_students.count)
  end


end
