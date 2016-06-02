class Member < ActiveRecord::Base
  after_initialize :init
  belongs_to :user
  has_many :member_scripts , dependent: :destroy
  has_many :checking_accounts , dependent: :destroy
  has_many :carts , dependent: :destroy
  belongs_to :member_type
  has_many :workplaces , dependent: :destroy
  belongs_to :bank
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :member_type
  validates :member_name, presence: true, allow_blank: true
  validates :member_last_name, presence: true, allow_blank: true
  validates :member_type_id, presence: true, allow_blank: true
  validates :cpf, presence: true, allow_blank: true
  validates :cnpj, presence: true, allow_blank: true
  validates :company_name, presence: true, allow_blank: true
  validates :bank_id, presence: true, allow_blank: true
  validates :bank_ag, presence: true, allow_blank: true
  validates :bank_cc, presence: true, allow_blank: true
  validates :bank_cc_digit, presence: true, allow_blank: true
  validates :phone_number, presence: true, allow_blank: true
  validates :cellphone_number, presence: true, allow_blank: true
  validates_uniqueness_of :cnpj, allow_blank: true, allow_nil: true, on: :create
  validates_uniqueness_of :cpf, allow_blank: true, allow_nil: true, on: :create

  CONTRIBUTOR = 'contributor'
  CUSTOMER = 'customer'
  GOD = 'god'
  CUSTOMER_CONTRIBUTOR = 'customer_contributor'

  def init
    #self.bank_id ||= 0   #will set the default value only if it's nil
  end

  def self.search_company(search, field)
    if search
      Member.where("cnpj != '' AND #{field} LIKE ?", "%#{search}%")
    else
      scoped
    end
  end


end
