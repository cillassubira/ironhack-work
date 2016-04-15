require_relative 'Task.rb'

class TodoList
    attr_reader :tasks
    
    def initialize(user)
        @user = user
        @tasks = []
    end

    def add_tasks(task)
        @tasks.push(task)
    end

    def delete_task(id)
        @tasks.delete_if {|task| task.id==id}
        
    end

    def find_task_by_id(id)
        @tasks.find {|task| task.id == id}
    end

    def sort_by_created(dir)
        if dir == "ASC"
          sorted_tasks =  @tasks.sort {|task1, task2| task1.created_time <=> task2.created_time}
        elsif dir == "DESC"
            sorted_tasks = @tasks.sort {|task1, task2| task2.created_time <=> task1.created_time}
        end
    end

    def load_tasks
        add_tasks Task.new("Sample task text")
        add_tasks Task.new("Sample task text")
        add_tasks Task.new("Sample task text")
        add_tasks Task.new("Sample task text")
        add_tasks Task.new("Sample task text")
    end
end


