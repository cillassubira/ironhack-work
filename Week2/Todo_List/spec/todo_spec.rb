require_relative "../lib/TodoList.rb"
require_relative "../lib/Task.rb"

RSpec.describe "Task" do
	describe "#complete?"
	it "should be false when task is created" do
		expect(Task.new("Task 1").complete?).to eq(false)
	end
	describe "#complete!"
	it "should be true when calling complete! method on a task" do
	expect(Task.new("Refactoring").complete!).to eq(true)
	end
end

RSpec.describe "TodoList" do
	let (:task) {Task.new("Task1")}
	let (:todo) {TodoList.new('user')}
	describe "add_tasks"
	it "should add a task to the task array when calling add_task method" do
		tasks_length = todo.tasks.length
		expect(todo.add_tasks(task).length).to eq (tasks_length+1)	
	end

	describe "delete_task"
	it "should delete a task from task list by its id" do
		tasks_length = todo.tasks.length
		todo.add_tasks(task)
		expect(todo.delete_task(task.id).length).to eq (tasks_length)
	end

	describe "find_task_by_id"
	it "should find task by given id" do
		expect(todo.find_task_by_id("a")).to eq (nil)
	end

	describe "sort_by_created"
	it "should return an array of tasks sorted by time of creation, depending on ASC or DESC criteria" do
		task2 = Task.new("Task2")
		todo.add_tasks(task)
		todo.add_tasks(task2)
		sorted_tasks_ASC = todo.sort_by_created("ASC")
		expect(sorted_tasks_ASC.index(task2)-sorted_tasks_ASC.index(task)).to eq(-1)
	end


end


