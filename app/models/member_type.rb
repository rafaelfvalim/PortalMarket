class MemberType < ActiveRecord::Base
  has_many :members, dependent: :destroy
  CONTRIBUTOR = 1
  CUSTOMER = 2
  GOD = 3
  CUSTOMER_CONTRIBUTOR = 4

  def description_pt_br
    case self.id
      when CONTRIBUTOR then
        return 'Parceiro'
      when CUSTOMER then
        return 'Cliente'
      when CUSTOMER_CONTRIBUTOR then
        return 'Cliente Parceiro'
    end
  end

end
