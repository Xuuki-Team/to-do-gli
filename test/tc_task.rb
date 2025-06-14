$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'todo.rb'
require 'test/unit'
require 'mocha/test_unit'
require 'stringio'
include Todo


class TaskTest < Test::Unit::TestCase
  
  def teardown
    File.unstub(:open)
  end

  def test_raises_error_when_no_tasks
    file_mock = StringIO.new
    File.stubs(:open).yields(file_mock)
    
    ex = assert_raises RuntimeError do
      global_options = { f: 'todo.txt' }                                                                        
      options = { f: true, p: nil }                                                                             
      args = [""]

      new_task(global_options, options, args)
    end

    expected = "You must provide tasks on the command-line or standard input"
    assert_equal expected, ex.message
  end

  def test_proper_working
    string_io = StringIO.new
    File.stubs(:open).yields(string_io)
    global_options = { f: 'todo.txt' }                                                                        
    options = { f: true, p: nil }                                                                             
    args = ["This is a task"]
    new_task(global_options, options, args)

    # Split the output by commas and check the first field                                                                    
    output_fields = string_io.string.split(',')                                                                               
    assert_equal "This is a task", output_fields[0]
  end

  def test_cannot_open_file
    ex_msg = "Operation not permitted"
    File.stubs(:open).raises(Errno::EPERM.new(ex_msg))
    global_options = { f: 'foo.txt' }                                                                        
    options = { f: true, p: nil }                                                                             
    args = ["This is a task"]

    ex = assert_raises RuntimeError do
      new_task(global_options, options, args)
    end

    todofile = File.expand_path(global_options[:f])
    assert_match /^Couldn't open #{todofile} for appending: #{ex_msg}/,ex.message
  end

end
