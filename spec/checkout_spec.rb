require "spec_helper"

RSpec.describe "Checkout" do
  describe "#scan" do
    it "adds items to the basket" do
      checkout = Checkout.new
      cherry_sku = "A"
      potato_sku = "B"

      checkout.scan(cherry_sku)
      checkout.scan(potato_sku)
      basket = checkout.basket

      expect(basket).to eq [cherry_sku, potato_sku]
    end
  end
  
  describe "#total" do
    context "when an item is scanned" do
      it "returns the price of the item" do
        cherry_sku = "A"
        pricing_rules = {cherry_sku => 100}
        checkout = Checkout.new(pricing_rules)

        checkout.scan(cherry_sku)
        total = checkout.total

        expect(total).to eq 100
      end
    end

    context "when multiple items are scanned" do
      it "returns the total price of the items" do
        cherry_sku = "A"
        potato_sku = "B"
        pricing_rules = {cherry_sku => 50, potato_sku => 30}
        checkout = Checkout.new(pricing_rules)

        checkout.scan(cherry_sku)
        checkout.scan(cherry_sku)
        checkout.scan(potato_sku)
        total = checkout.total

        expect(total).to eq 130
      end
    end

    context "when an item has a special price" do

    end
  end
end