class CheckingAccount < ActiveRecord::Base
  has_one :currency
  belongs_to :invoice
  enum status: {aguardando_pagamento: 'Aguardando Pagamento', aguardando_consumo: 'Aguardando Consumo', bloqueado: 'Bloqueado', analise_de_consmo:'Analise de Consumo', em_processamento: 'Em Processamento', pago: 'Pago'}
end
