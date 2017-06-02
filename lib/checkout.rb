require "checkout/version"
require 'bigdecimal'

module Checkout
  autoload :Product, 'checkout/product'
  autoload :Promotion, 'checkout/promotion'
  autoload :Basket, 'checkout/basket'
end
