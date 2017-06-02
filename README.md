# Checkout

Simple Checkout System

## Installation

Use this command for installation :

```
bin/setup
```

## Usage
Run the console by this command after `bundle install`
```
bin/console
```
Create a basket
```
    basket = Checkout::Basket.new
```
Then create products and add them to basket
```
product   = Checkout::Product.new('001', 'Lavender heart', 9.25)
#product2   = Checkout::Product.new('002', 'Personalised cufflinks', 45.00)
#product3   = Checkout::Product.new('003', 'Kids T-shirt', 19.95)

basket << product
```
Now you can create anew promotion and add it to basket
```
promotion = Checkout::Promotion.new('001', 0.75)
basket.add_promotion promotion
```
You can check total price with or without discount using this methods
```
    basket.total
    basket.total_without_discount
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/checkout.
