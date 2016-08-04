class LandingPageContact < ActiveRecord::Base
  enum area: {sap: 'SAP', oracle: 'Oracle', totvs: 'Totvs', senior: 'Senior', outros: 'Outros'}
  belongs_to :industry
end
