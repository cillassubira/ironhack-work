#Ironweb
require 'sinatra'
require 'haml'
require 'pry'
require 'sinatra/reloader' if development? #evitar tener que reiniciar el servidor en cada cambio

enable(:sessions)

allcourses = [
  {name: "Intro to Rails", advanced: false, id:0},
  {name: "Intro to JavaScript", advanced: true, id:1},
  {name: "Phyton", advanced: false, id:2 },
  {name: "App Evolution with Swift", advanced: true, id:3},
  {name: "Intro to SQL", advanced: false, id:4},
  {name: "HTML/CSS", advanced: false, id:5},
  {name: "Testing with RSpec", advanced: true, id:6}
]
#jadkljf

get '/' do
	if session[:name]
    redirect to('/index_user_known')
  else
    erb(:index)
  end
end

get '/enrollment' do
  erb(:enrollment)
end

post '/enrollment' do
  session[:name] = params[:name]
  session[:date_of_birth] = params[:date_of_birth]
  session[:email] = params[:email]
  session[:country_of_birth] = params[:country_of_birth]
  session[:experience] = params[:experience]
  redirect to(:index_user_known)
end

get ('/index_user_known') do
  erb(:index_user_known)
end

get ('/show_courses') do
  @courses = allcourses.select {|course| course[:advanced]}
  erb(:show_courses)
end

post ('/show_courses') do
  session[:id_course] =  params[:id_course]
  @course_enrolled = allcourses.find {|course| course[:id]==session[:id_course].to_i}
  erb(:show_courses_enrolled)
end



