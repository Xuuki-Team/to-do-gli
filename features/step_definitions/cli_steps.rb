Given /^the file "([^"]*)" doesn't exist$/ do |file|                                                                                     
  FileUtils.rm(file) if File.exist?(file)                                                                                                
end                                                                                                                                      

# To define the step for the Cucumber scenario where you run the command 
# todo -f /tmp/todo.txt new 'Some new task', you can create a step definition in 
# Ruby. Here's how you can define it:                                                                                                                                                               

When(/^I successfully run `todo -f \/tmp\/todo\.txt new 'Some new task'`$/) do                                                                                              
  command = "bundle exec bin/xuuki-do-list -f /tmp/todo.txt new 'Some new task'"
  @output = `#{command}`                                                                                                                                                    
  expect($?.exitstatus).to eq(0)                                                                                                                                            
  expect(@output).to include("args - Some new task")
  expect(@output).to include("Task added.")                                                                                                                                 
end                                                                                                                                                                         

#  • Command Execution: The command is executed using backticks, which captures the output.                                                                                    
#  • Exit Status Check: It checks if the command was successful by verifying the exit status is 0.                                                                             
#  • Output Verification: It ensures the output contains "Task added." to confirm the task was added 
#    successfully.                                                             
# 
# This step definition assumes you have the necessary setup to run the command in your environment. 
# Adjust the command path if needed.

Then(/^I successfully run `todo -f \/tmp\/todo\.txt list`$/) do
  command = "bundle exec bin/xuuki-do-list -f /tmp/todo.txt list"
  @output = `#{command}`
  expect($?.exitstatus).to eq(0)
  expect(@output).to include("Status  : INCOMPLETE")
end

And('the stdout should contain {string}') do |string|
  command = "bundle exec bin/xuuki-do-list -f /tmp/todo.txt list"
  @output = `#{command}`
  expect($?.exitstatus).to eq(0)
  expect(@output).to include("1 - Some new task")
end

# Next scenario

Given('there is no task list in my home directory') do                                         
  step %(the file "#{ENV['HOME']}/.todo.txt" doesn't exist)                                    
end

When('I successfully run `todo new {string}`') do |string|                                     
  command = "bundle exec bin/xuuki-do-list new '#{string}'"                                    
  @output = `#{command}`                                                                       
  expect($?.exitstatus).to eq(0)                                                               
end

Then('the task list should exist in my home directory') do                                     
  file_path = "#{ENV['HOME']}/.todo.txt"                                                       
  expect(File).to exist(file_path)                                                             
end

When('I successfully run `todo list`') do
  command = "bundle exec bin/xuuki-do-list list"
  @output = `#{command}`
  expect($?.exitstatus).to eq(0)
  expect(@output).to include("Status  : INCOMPLETE")
end
