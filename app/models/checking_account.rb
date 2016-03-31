class CheckingAccount < ActiveRecord::Base
  has_one :currency
  belongs_to :invoice
  belongs_to :script
  has_one :user , :through =>  :invoice
  has_one :member, :through => :user
  enum status: {aguardando_pagamento: 'Aguardando Pagamento', pago_e_consumido: 'Pago e Consumido', pago_aguardando_cosumo: 'Pago Aguardando Consumo',aguardando_consumo: 'Aguardando Consumo', bloqueado: 'Bloqueado', analise_de_consmo:'Analise de Consumo', em_processamento: 'Em Processamento', pago: 'Pago', desistencia: 'Desistência'}
end
