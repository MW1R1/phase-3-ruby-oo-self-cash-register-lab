class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = nil
    end
  
    def add_item(title, price, quantity = 1)
      self.total += price * quantity
      self.last_transaction = price * quantity
      quantity.times { self.items << title }
    end
  
    def apply_discount
      if discount > 0
        self.total -= (total * discount / 100.0).to_i
        "After the discount, the total comes to $#{total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= last_transaction
    end
  end
  
