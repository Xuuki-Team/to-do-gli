module Todo
  def self.write_todo(file, name, created = Time.now, completed = '')        
    file.puts("#{name},#{created},#{completed}")                             
  end

  def new_task(global_options,options,args)
    puts "Global:"
    puts "-f - #{global_options[:f]}"
    puts "Command:"
    puts "-f - #{options[:f] ? 'true' : 'false'}"
    puts "-p - #{options[:p]}"
    puts "args - #{args.join(' ')}"

    # Check if args is empty or contains only empty strings                                                                   
    if args.empty? || args.all?(&:empty?)                                                                                     
      raise "You must provide tasks on the command-line or standard input"                                                    
    end

    todo_file = File.expand_path(global_options[:f] || TODO_FILE)

    # Your command logic here
    new_task = ARGV.shift

    File.open(todo_file,'a') do |file|
      Todo.write_todo(file,new_task)
      puts "Task added."
    end
  end
end
