class Checkout
  attr_reader :basket, :pricing_rules

  def initialize(pricing_rules = {})
    @pricing_rules = pricing_rules
    @basket = []
  end

  def scan(item)
    basket.push(item)
  end

  def total
    basket.sum { |item| pricing_rules.fetch(item) }
  end
end