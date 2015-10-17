module CartsHelper
  def get_total(carts)
    total = 0
    carts.each do |cart|
      total+= cart.price.value
    end
      return total
    end
  end
