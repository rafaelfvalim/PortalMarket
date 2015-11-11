module CartsHelper
  def get_total(carts)
    total = 0
    carts.each do |cart|
      total+= cart.price.value
    end
    return total
  end

  def choose_label_system_number(plataform)
    case plataform
      when "SAP" then
        "SAP System Number:"
      when "Oracle" then
        "Oracle SID"
      else
        "OUTHER"
    end
  end
end
