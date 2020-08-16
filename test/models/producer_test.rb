require 'test_helper'

class ProducerTest < ActiveSupport::TestCase
  test "belongs to a user" do
    producer = producers(:one)
    assert producer.user.present?
  end
end
