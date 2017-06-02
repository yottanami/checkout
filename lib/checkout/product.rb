module Checkout
  class Product
    attr_accessor :code, :name, :price

    def initialize(code, name, price)
      @code, @name, @price = code, name, BigDecimal.new(price, 0)
    end
  end
end
