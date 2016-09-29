require 'pry'

class CashRegister

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  attr_accessor :total, :last_transaction
  attr_reader :discount, :items

  def add_item(item, price, quantity = 1)
    quantity.times {self.items << item}
    # self.last_transaction[:price] = price
    # self.last_transaction[:quantity] = quantity
    self.last_transaction = {price: price, quantity: quantity}
    self.total += (price * quantity)
  end

  def apply_discount
    self.total = self.total * (100 - @discount) / 100
    return "After the discount, the total comes to $#{self.total}." if self.discount != 0
    return "There is no discount to apply."
  end

  def void_last_transaction
    self.last_transaction[:quantity].times {self.items.pop}
    self.total -= self.last_transaction[:price] * self.last_transaction[:quantity]
  end

end
