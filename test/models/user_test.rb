require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "has many producers" do
    mary = users(:mary)
    producer_one = producers(:one)
    producer_two = producers(:two)
    
    assert mary.producers.includes(producer_one, producer_two)
  end
end
