require File.dirname(__FILE__) + '/../test_helper'

class TaskTest < Test::Unit::TestCase
  fixtures :tasks

  # Replace this with your real tests.
  def test_should_be_invalid
    task = Task.create
    assert !task.valid?, "Task shouldn't be created"
  end
end
