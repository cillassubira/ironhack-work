#Sinatra Blog
require 'sinatra'
require 'pry'
require 'sinatra/reloader' if development? #evitar tener que reiniciar el servidor en cada cambio
require_relative 'lib/blog.rb'
require_relative 'lib/post.rb'


blog = Blog.new
blog.add_post Post.new("hola_a", "2008/05/12", "aaaaaaa")
blog.add_post Post.new("hola_b", "2009/07/12", "bbbbbbb")
blog.add_post Post.new("hola_c", "2008/05/10", "ccccccc")

get '/' do
  @posts = blog.latest_posts
  erb(:index)
end

get '/post_details/:id' do
  index = params[:id].to_i
  @post = blog.posts[index]
  erb(:post_details)
end

get '/new_post' do
  erb(:new_post)
end

post '/new_post' do
  title = params[:title]
  date = params[:date]
  text = params[:text]
  blog.add_post Post.new(title, date, text)
  redirect to('/')
end