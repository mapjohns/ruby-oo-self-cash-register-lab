require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :price

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @price = []
    end

    def add_item(title, price, quantity = 1)
        self.total += (price*quantity)
        counter = 0
        @price << price * quantity
        while counter < quantity 
            @items << title
            counter += 1
        end
    end

    def apply_discount
        if @discount > 0
            self.total = @total *((100 -@discount.to_f)/100)
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= @price[-1].to_f
        @items.pop
        @price.pop
    end
end