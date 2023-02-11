class CashRegister

    attr_accessor :discount, :total, :titles, :last_amount
  
    def initialize(discount=0)
      @total = 0
      @titles = []
      @last_amount = 0
      @discount = discount
    end
  
    def add_item(title, price, quantity=1)
      self.total += price * quantity
      self.last_amount = quantity * price
      1..quantity.times { @titles << title }
    end
  
    def apply_discount
      if self.discount != 0
        self.total -= ((self.discount.to_f / 100) * self.total).to_i
        "After the discount, the total comes to $#{self.total}."
      else
        "There is no discount to apply."
      end
    end
  
    def items
      self.titles
    end
  
    def void_last_transaction
      self.total -= last_amount
    end
  
  end
