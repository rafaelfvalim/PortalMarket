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

  def format_date(date)
    # formatting date: Aug, 31 2007 - 9:55PM
    unless date.nil?
      date.strftime("%b, %m %Y - %H:%M")
    end
  end

  def get_action_for_invoice(invoice_status_id, invoice)
    case invoice_status_id
      when 2 then
        link_to "Resend", resend_invoice_invoices_path(script_id: invoice.script_id , id: invoice.id), class: 'btn btn-default'
    end
  end
end
