require "test_helper"

class CheckoutTest < Minitest::Test
  def setup
    @basket = Checkout::Basket.new
  end

  def setup_promotion_and_products
    product1 = Checkout::Product.new('001', 'Lavender heart', 9.25)
    product2 = Checkout::Product.new('002', 'Personalised cufflinks', 45.00)
    product3 = Checkout::Product.new('003', 'Kids T-shirt', 19.95)

    @basket << product1
    @basket << product2
    @basket << product3

    promotion = Checkout::Promotion.new('001', 0.75)

    @basket.add_promotion promotion
  end

  def test_that_it_has_a_version_number
    refute_nil ::Checkout::VERSION
  end

  def test_that_it_initialize_promotion
    promotion = Checkout::Promotion.new('001', 0.75)
    assert_equal '001', promotion.code
    assert_equal 0.75, promotion.amount
  end

  def test_that_it_creates_new_product
    product = Checkout::Product.new('001', 'Lavender heart', 9.25)
    assert_equal '001', product.code
    assert_equal 'Lavender heart', product.name
    assert_equal 9.25, product.price
  end

  def test_that_it_adds_product_to_basket
    product = Checkout::Product.new('004', 'Glasses', 11.11)
    @basket << product
    assert_includes @basket.products, product
  end

  def test_that_it_removes_product_from_basket
    product = Checkout::Product.new('004', 'Glasses', 11.11)
    @basket << product
    @basket >> product
    refute_includes @basket.products, product
  end

  def test_that_it_adds_promotion_to_basket
    promotion = Checkout::Promotion.new('001', 0.75)
    @basket.add_promotion promotion
    assert_includes @basket.promotions, promotion
  end

  def test_that_it_removes_promotion_from_basket
    promotion = Checkout::Promotion.new('005', 9.99)
    @basket.add_promotion promotion
    @basket.remove_promotion promotion
    refute_includes @basket.promotions, promotion
  end

  def test_that_it_calculates_total_without_discount
    setup_promotion_and_products
    assert_equal  74.2, @basket.total_without_discount.to_f
  end

  def test_that_it_calculates_total_correctly
    setup_promotion_and_products
    assert_equal 66.78, @basket.total
  end

  def test_that_it_calculates_total_correctly_second_scenario
    product1 = Checkout::Product.new('001', 'Lavender heart', 9.25)
    product3 = Checkout::Product.new('003', 'Kids T-shirt', 19.95)

    @basket << product1
    @basket << product3
    @basket << product1

    promotion = Checkout::Promotion.new('001', 0.75)

    @basket.add_promotion promotion
    assert_equal 36.95, @basket.total
  end

  def test_that_it_calculates_total_correctly_third_scenario
    product1 = Checkout::Product.new('001', 'Lavender heart', 9.25)
    product2 = Checkout::Product.new('002', 'Personalised cufflinks', 45.00)
    product3 = Checkout::Product.new('003', 'Kids T-shirt', 19.95)

    @basket << product1
    @basket << product2
    @basket << product1
    @basket << product3

    promotion = Checkout::Promotion.new('001', 0.75)

    @basket.add_promotion promotion
    assert_equal 73.76, @basket.total
  end

end
