require "test_helper"

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(name: 'iPhone', price: 699.99, description: 'Latest iPhone model', weight: 0.5)
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.name = nil
    assert_not @product.valid?
  end

  # More tests for price, description, weight, etc.
end
