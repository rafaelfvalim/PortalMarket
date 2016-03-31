module InvoicesHelper

  def generate_invoice_status_li(invoice_status, invoice)
    if invoice.invoice_status_id.nil?
      content_tag(:li, invoice_status.description)
    else

      case
        when invoice_status.id < invoice.invoice_status_id
          content_tag(:li, invoice_status.description)
        when invoice_status.id == invoice.invoice_status_id
          content_tag(:li, invoice_status.description,
                      class: "active")
        when invoice_status.id > invoice.invoice_status_id
          content_tag(:li, invoice_status.description)
      end
    end
  end

  def get_script_author(script_id)
    member_script = MemberScript.find_by_script_id script_id
    return member_script.member
  end


  def get_action_for_invoice(invoice_status_id, invoice)
    case invoice_status_id
      when 2 then
        link_to "Resend", resend_invoice_invoices_path(script_id: invoice.script_id, id: invoice.id), class: 'btn btn-default'
    end
  end

  def get_status_count_by_profile(invoice_status)
    if current_user.is_master_user_id?
      # Retorna todas as mihas e as dos meus funcionarios
      return Invoice.joins(:member).where('invoice_status_id = ? and invoices.user_id = ? or members.master_user_id = ?', invoice_status.id, current_user.id, current_user.id).count
    else
      # Retorna apenas as minhas
      return Invoice.joins(:member).where('invoice_status_id = ? and invoices.user_id = ?', invoice_status.id, current_user.id).count
    end
  end

  def dash_invoice_icon(id)
    case id
      when 1 then
        #Aguardando
        'typcn typcn-time typcn-4x typcn-dash'
      when 2 then
        # Enviado
        'typcn typcn-upload-outline typcn-4x typcn-dash'
      when 3 then
        # Completo
        'typcn typcn-tick-outline typcn-4x typcn-dash'
      when 4 then
        # Cancelado
        'typcn typcn-times-outline typcn-4x typcn-dash'
      when 5 then
        # BackOff
        'typcn typcn-thumbs-down typcn-4x typcn-dash'
    end
  end

  def dash_invoice_panel_color(id)
    case id
      when 1 then #Aguardando
        'red-bg'
      when 2 then #Enviado
        'yellow-bg'
      when 3 then #Completo
        'orange-bg'
      when 4 then #Cancelado
        'navy-bg'
      when 5 then #BackOff
        'lazur-bg'
    end
  end
end
