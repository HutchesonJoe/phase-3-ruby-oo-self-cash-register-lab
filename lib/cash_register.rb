require 'pry'

class CashRegister
  
  attr_accessor :discount, :total, :items, :item_price

  def initialize(discount = 0, items = [])
    @total = 0
    @discount = discount
    @items = items
    @item_price = []
  end

  def add_item item, price, quantity = 1
    # binding.pry
    self.total += price * quantity
    @item_price << (price * quantity)
    while quantity > 0 do
      @items << item
      quantity -= 1
    end
  end
  
  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
    percent_off = self.discount.to_f/100.0
    self.total = self.total - (self.total * percent_off)
    @total = self.total.to_i
    "After the discount, the total comes to $#{@total}."
    end
  end
  
  def items 
    @items
  end

  def void_last_transaction
    if @items.length == 0
      @total = 0.0
    else
      @total -= @item_price[item_price.length - 1]
    end
  end

end

