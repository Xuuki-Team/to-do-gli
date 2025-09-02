module Todo
  puts "Global:"
    puts "-f - #{global_options[:f]}"
    puts "Command:"
    puts "-f - #{options[:f] ? 'true' : 'false'}"
    puts "-p - #{options[:p]}"
    puts "args - #{args.join(' ')}"
    todo_file = File.expand_path(global_options[:f] || TODO_FILE)

    # Your command logic here
    new_task = ARGV.shift

    File.open(todo_file,'a') do |file|
      write_todo(file,new_task)
      puts "Task added."
  end
end
