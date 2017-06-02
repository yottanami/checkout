module Checkout
  class Basket

    def initialize
      @products = []
      @promotions = []
    end

    def products
      @products
    end

    def promotions
      @promotions
    end

    # Adds a new product to list of products
    def << product
      @products << product
    end

    # Removes a specific product from list of products
    def >> product
      @products.delete_at(@products.index(product))
    end

    def add_promotion(promotion)
      @promotions << promotion
    end

    def remove_promotion(promotion)
      @promotions.delete_at(@promotions.index(promotion))
    end

    def calculate_discount(price)
      if price > BigDecimal.new(60)
        price - (price * BigDecimal.new(10) / BigDecimal.new(100, 0))
      else
        price
      end
    end

    def total_without_discount
      return @products.map(&:price).inject(&:+)
    end

    def total
      calculate_discount(total_without_discount + set_promotions).to_f.round(2)
    end

    def set_promotions
      product_counts = @products.group_by(&:code)
      .transform_values(&:length).keep_if { |_k, v| v >= 2 }
      total_amount = 0

      @promotions.each do |promotion|
        if product_counts.key?(promotion.code)
          total_amount -= promotion.amount * product_counts[promotion.code]
        end
      end
      total_amount
    end

  end
end
