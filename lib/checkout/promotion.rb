module Checkout
  class Promotion

    attr_accessor :code, :amount

    def initialize(code, amount)
      @code, @amount = code, BigDecimal.new(amount, 0)
    end
  end
end
