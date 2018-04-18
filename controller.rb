require('sinatra')
require('sinatra/contrib/all')

require_relative("./models/students.rb")
require_relative("./models/houses.rb")

get '/home' do
  erb(:home)
end

# INDEX
get '/home/students' do
  @students = Student.find_all_students()
  erb(:index)
end

# NEW
get'/home/students/new' do
  @houses = House.show_all()
  erb(:new)
end

# SHOW
get '/home/students/:id' do
@students = Student.find_students_by_id(params[:id])
erb(:show)
end

# CREATE
post '/home/students' do
  new_student = Student.new(params)
  new_student.save()
  redirect to '/home/students'
end

# EDIT
get "/home/students/:id/edit" do
  @student = Student.find_students_by_id(params[:id])
  erb(:edit)
end

# UPDATE
post "/home/students/:id" do
  @student = Student.new(params)
  @student.update()
  redirect to '/home/students'
end

# DESTROY
post "/home/students/:id/delete" do
  @student = Student.find_students_by_id(params[:id])
  @student.delete()
  redirect to '/home/students'
end
