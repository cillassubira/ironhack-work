#online-calculator.rb
require_relative '/Users/Rusta/documents/drafts/w2/online_calculator/lib/calculator.rb'
require 'sinatra'
require 'sinatra/reloader' if development? #evitar tener que reiniciar el servidor en cada cambio
require 'pry'


get "/front_page" do
  erb(:front_page)
end

post "/calculate_add" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  operation = params[:operation].to_sym
  result = Calculator.new(first, second).select_operator(operation)
end

get "/save_result" do
  erb(:save_result)
end



