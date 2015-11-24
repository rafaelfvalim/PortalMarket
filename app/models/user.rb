class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin, :god]
  after_initialize :set_default_role, :if => :new_record?
  has_many :messages
  has_one :member, dependent: :destroy, autosave: true
  has_many :workplaces, through: :member
  has_one :member_type, through: :member, autosave: true
  has_many :invoice
  accepts_nested_attributes_for :member
  accepts_nested_attributes_for :member_type
  accepts_nested_attributes_for :workplaces
  accepts_nested_attributes_for :invoice
  validate :validate_email_unique, on: :create
  validate :validate_member_name_unique, on: :create
  validate :validate_member_cpf_unique, on: :create
  validate :validate_member_cnpj_unique, on: :create
  validate :validate_member_company_name_unique, on: :create
  validate :validate_member_name_format, on: :create

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{self.member.member_name} #{self.member.member_last_name}"
  end

  def is_contributor?
    self.member.member_type.description == Member::CONTRIBUTOR
  end

  def is_customer?
    self.member.member_type.description == Member::CUSTOMER
  end

  def is_god?
    self.member.member_type.description == Member::GOD
  end

  def self.search(search)
    if search
      User.joins(:member).where('member_name LIKE ?', "%#{search}%").all
    else
      scoped
    end
  end

  def validate_email_unique
    if User.where(email: email).exists?
      errors.add(:email, 'already exists 222')
    end
  end

  def validate_member_name_unique
    if member.member_name.present?
      if Member.where(member_name: member.member_name).exists?
        errors.add(:member_name, 'already exists')
      end
    end
  end

  def validate_member_cpf_unique
    if member.cpf.present?
      if Member.where(cpf: member.cpf).exists?
        errors.add(:cpf, 'already exists')
      end
    end
  end

  def validate_member_cnpj_unique
    if member.cnpj.present?
      if Member.where(cnpj: member.cnpj).exists?
        errors.add(:cnpj, 'already exists')
      end
    end
  end

  def validate_member_company_name_unique
    if member.company_name.present?
      if Member.where(company_name: member.company_name).exists?
        errors.add(:company_name, 'already exists')
      end
    end
  end

  def validate_member_name_format
    if member.member_name.present?
      unless member.member_name =~ /^[a-zA-Z0-9_\.]*$/
        errors.add(:member_name, 'format not permited')
      end
    end
  end

  def validate_member_company_name_format
    if member.company_name.present?
      unless member.company_name =~ /^[a-zA-Z0-9_\.]*$/
        errors.add(:company_name, 'format not permited')
      end
    end
  end

end
