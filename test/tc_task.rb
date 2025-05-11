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
end
