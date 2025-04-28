Given /^the file "([^"]*)" doesn't exist$/ do |file|                                                                                     
  FileUtils.rm(file) if File.exist?(file)                                                                                                
end                                                                                                                                      

When('I successfully run `todo -f \/tmp\/todo.txt new {string}`') do |task|
 command = "bundle exec bin/xuuki-do-list -f /tmp/todo.txt new '#{task}'"
 output = `#{command}`
 raise "Command failed: #{command}" unless $?.success?
end

Then('I successfully run `todo -f \/tmp\/todo.txt list --format=csv`') do
  command = "bundle exec bin/xuuki-do-list -f /tmp/todo.txt list --format=csv"
  @output = `#{command}`
  raise "Command failed: #{command}" unless $?.success?
end

And('the stdout should contain {string}') do |expected_output|
  unless @output.include?(expected_output)
    raise "Expected output to include '#{expected_output}', but it was '#{@output}'"
  end
end

Given /^there is no task list in my home directory$/ do
  step %(the file "#{ENV['HOME']}/.todo.txt" doesn't exist)
end

Then /^the task list should exist in my home directory$/ do
  step %(a file named "#{ENV['HOME']}/.todo.txt" should exist)
end
