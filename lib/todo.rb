module Todo
  def self.write_todo(file, name, created = Time.now, completed = '')        
    file.puts("#{name},#{created},#{completed}")                             
  end

  def new_task(global_options,options,args)
    # Check if args is empty or contains only empty strings                                                                   
    if args.empty? || args.all?(&:empty?)                                                                                     
      raise "You must provide tasks on the command-line or standard input"                                                    
    end

    todo_file = File.expand_path(global_options[:f] || TODO_FILE)

    # Your command logic here
    new_task =  args.first

    begin                                                                               
     File.open(todo_file, 'a') do |file|                                               
       Todo.write_todo(file, new_task)                                                 
       puts "Task added."                                                              
     end                                                                               
    rescue SystemCallError => ex                                                        
     raise RuntimeError, "Couldn't open #{todo_file} for appending: #{ex.message}"     
    end
  end
end
