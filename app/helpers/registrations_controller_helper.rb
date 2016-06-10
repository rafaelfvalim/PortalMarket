module RegistrationsControllerHelper

  def member_type_friendly_description(member_type_id)
    case member_type_id
      when MemberType::CUSTOMER then
        'Cliente'
      when MemberType::CONTRIBUTOR then
        'Parceiro'
      when MemberType::CUSTOMER_CONTRIBUTOR then
        'Cliente Parceiro'
    end

  end
end
