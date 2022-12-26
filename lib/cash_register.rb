class CashRegister
    attr_reader :items, :discount
    attr_accessor :total, :last_price
    def initialize(discount=0)
        @discount=discount
        @total=0
        @items=[]
        @last_price=0
    end

    def add_item(title, price, quantity=1)
        self.total+=price*quantity
        quantity.times do
            self.items << title
        end
        self.last_price = price*quantity
    end

    def apply_discount
        if discount!=0
            self.total*=(100-discount)*0.01
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total= self.total - self.last_price
    end
end
