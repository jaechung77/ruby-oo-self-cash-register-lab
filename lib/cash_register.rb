class CashRegister
    attr_accessor :discount, :total, :price, :title, :items, :last_price, :last_qty
    def initialize(discount=0)
        @discount=discount
        @total=0
        @items=[]
    end
    def instance_variable_get(total) 
        @total=0
    end 
    def add_item(title, price, qty=1) 
        self.total += price * qty
        self.last_price = price  
        self.last_qty =  qty        
        while (qty>0)
            self.items << title

            qty -= 1
        end
      
    end
    def apply_discount
        #puts self.total.to_s + " " + self.discount.to_s
        self.total -=  self.total * self.discount/100 
        if self.discount > 0
            "After the discount, the total comes to $#{self.total}." 
        else
            "There is no discount to apply."   
        end    
    end  
    def void_last_transaction
        self.total -=  self.last_price * self.last_qty        
        self.items.pop
    end    
end    
