class Member < ActiveRecord::Base
  # enum role: [:user, :vip, :admin]
  # after_initialize :set_default_role, :if => :new_record?
  belongs_to :user
  has_many :member_scripts
  has_many :checking_accounts
  has_many :carts
  belongs_to :member_type

  validates :member_name, presence: true
  validates :member_last_name, presence: true
  validates :member_last_name, presence: true
  validates :member_type_id, presence: true
  validates :cpf, presence: true, allow_blank: true
  validates :cnpj, presence: true, allow_blank: true
  validates :bank_id, presence: true, allow_blank: true
  validates :bank_ag, presence: true, allow_blank: true
  validates :bank_cc_digit, presence: true, allow_blank: true


  # def set_default_role
  #   self.role ||= :user
  # end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :invitable, :database_authenticatable, :registerable, :confirmable,
  #        :recoverable, :rememberable, :trackable, :validatable

  CONTRIBUTOR = 'contributor'
  CUSTOMER = 'customer'


end
