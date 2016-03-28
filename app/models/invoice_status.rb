class InvoiceStatus < ActiveRecord::Base
  belongs_to :invoice
  enum status: {waiting: 'Waiting', sent: 'Ativo', complete: 'Complete', canceled: 'Canceled', backoff: 'Backoff'}
end
