require_relative('../models/houses.rb')
require_relative('../models/students.rb')
require_relative('../db/sql_runner.rb')

require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

class HouseTest < MiniTest::Test

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

    def test_get_house_name()
      assert_equal("Gryffindor", @gryffindor.name)
    end

    def test_get_house_logo()
      assert_equal('../public/gryffindor.png', @gryffindor.logo)
    end

end
