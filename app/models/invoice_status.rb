class InvoiceStatus < ActiveRecord::Base
  belongs_to :invoice
  enum status: {waiting: 'Waiting', sent: 'Sent', complete: 'Complete', canceled: 'Canceled', backoff: 'Backoff'}
  AGUARDANDO = 1
  ENVIADO = 2
  COMPLETO = 3
  CANCELADO = 4
  DEVOLUCAO = 5

  def get_status_pt_br
    case self.id
      when AGUARDANDO then
        'Aguardando'
      when ENVIADO then
        'Enviado'
      when CANCELADO then
        'Cancelado'
      when COMPLETO then
        'Completos'
      when DEVOLUCAO then
        'Desistencia'
    end
  end

end
