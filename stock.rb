class Stock < ActiveRecord::Base
belongs_to :product
validates_numericality_of :quantity, :greater_than_or_equal_to =>:minimum_quantity, :on => :create

def product_code
  product.code if product
 end

 def product_code=(code)
 self.product= Product.find_by_code(code) unless code.blank?
 end
 
  def product_name
    product.name if product
  end

  def product_name=(name)
  self.product= Product.find_by_name(name) unless name.blank?
  end
 
  
 def product_size
   product.size if product
 end
  
  def product_size=(size)
   self.product= Product.find_by_size(size) unless size.blank?
  end

  def minimum_quantity
    return 0
  end
    def as_xls(options = {})
      {
          
          "Product Name" =>product_name,
          "Product Size" =>product_size,
          "Quantity" => quantity.to_s
         
      }
    end


  
 
end
