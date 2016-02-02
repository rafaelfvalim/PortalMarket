class Status < ActiveRecord::Base

  enum status_enum: {GRAVADO: 1,
                     VERIFICACAO_DUPLICIDADE: 2,
                     VERIFICACAO_CONSISTENCIA: 3,
                     VERIFICACAO_COMPLEXIDADE: 4,
                     APROVADO: 5,
                     INICIAL: 6
                }

end
