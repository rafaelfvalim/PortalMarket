class InvoiceStatus < ActiveRecord::Base
  belongs_to :invoice
  enum status: {waiting: 'Waiting', sent: 'Sent', complete: 'Complete', canceled: 'Canceled', backoff: 'Backoff'}
  def get_status_pt_br
      case self.description
        when 'Waiting' then 'Aguardando'
        when 'Sent' then 'Enviado'
        when 'Canceled' then 'Cancelado'
        when 'Complete' then 'Completos'
        when 'Backoff' then 'Desistencia'
      end
  end

end
