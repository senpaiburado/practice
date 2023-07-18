require "test_helper"

class OrderTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'John', email: Faker::Internet.unique.email, password: 'password')
    @product = Product.create(name: 'iPhone', price: 699.99, description: 'Latest iPhone model', weight: 0.5)
    @order = Order.new(user: @user, product: @product, quantity: 1)
  end

  test "should be valid" do
    assert @order.valid?
  end

  test "user should be present" do
    @order.user = nil
    assert_not @order.valid?
  end

  # More tests for product, quantity, etc.
end
