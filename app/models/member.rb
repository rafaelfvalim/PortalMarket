class Member < ActiveRecord::Base
  belongs_to :user
  has_many :member_scripts
  has_many :checking_accounts
  has_many :carts
  belongs_to :member_type
  has_many :workplaces ,dependent: :destroy, autosave: true

  validates :member_name, presence: true
  validates :member_last_name, presence: true
  validates :member_last_name, presence: true
  validates :member_type_id, presence: true
  validates :cpf, presence: true, allow_blank: true
  validates :cnpj, presence: true, allow_blank: true
  validates :bank_id, presence: true, allow_blank: true
  validates :bank_ag, presence: true, allow_blank: true
  validates :bank_cc_digit, presence: true, allow_blank: true

  CONTRIBUTOR = 'contributor'
  CUSTOMER = 'customer'
  GOD = 'god'

end
