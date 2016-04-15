require "date"

class Task
    attr_reader :content, :id, :created_time, :complete
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @complete = false
        @created_time = Time.now
    end
    def complete?
    	@complete
    end

    def complete!
        @complete = true
    end
end