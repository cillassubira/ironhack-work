require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative('lib/Task.rb')
require_relative('lib/TodoList.rb')

todo_list = TodoList.new("Josh")
todo_list.load_tasks

get '/tasks' do
  @tasks = todo_list.tasks
	erb(:task_index)
end

get '/new_task' do
	erb(:new_task)
end

post '/create_task' do
	@content = params[:content]
	new_task = Task.new(@content)
	todo_list.add_tasks(new_task)
	redirect to('/tasks')
end

get '/complete_task/:id' do
	@id = params[:id].to_i
	@selected_task = todo_list.find_task_by_id(@id)
	@selected_task.complete!
	erb(:complete_task)
end