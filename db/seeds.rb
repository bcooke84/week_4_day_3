require_relative("../models/houses.rb")
require_relative("../models/students.rb")
require_relative("sql_runner.rb")
require('pry-byebug')

Student.delete_all()
House.delete_all()

  gryffindor = House.new({
      'name' => 'Gryffindor',
      'logo' => '../public/gryffindor.png'
    })

  slytherin = House.new({
    'name' => 'Slytherin',
      'logo' => '../public/slytherin.png'
    })

  ravenclaw = House.new({
      'name' => 'Ravenclaw',
      'logo' => '../public/ravenclaw.png'
    })

  hufflepuff = House.new({
      'name' => 'Hufflepuff',
      'logo' => '../public/hufflepuff.png'
    })

    gryffindor.save()
    slytherin.save()
    ravenclaw.save()
    hufflepuff.save()

  student1 = Student.new({
    'first_name' => 'Harry',
    'last_name' => 'Potter',
    'age' => '15',
    'house_id' => gryffindor.id
    })

  student2 = Student.new({
    'first_name' => 'Luna',
    'last_name' => 'Lovegood',
    'age' => '14',
    'house_id' => gryffindor.id
    })

  student3 = Student.new({
    'first_name' => 'Cedric',
    'last_name' => 'Diggory',
    'age' => '17',
    'house_id' => hufflepuff.id
    })

  student4 = Student.new({
    'first_name' => 'Draco',
    'last_name' => 'Malfoy',
    'age' => '15',
    'house_id' => slytherin.id
    })

    student1.save()
    student2.save()
    student3.save()
    student4.save()

    # binding.pry
    # nil
