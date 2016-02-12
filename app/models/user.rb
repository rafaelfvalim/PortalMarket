class User < ActiveRecord::Base
  #enum standart do devise de role - não utilizado no sistema
  enum role: [:user, :vip, :admin, :god]
  # enum de status self.ativo? , self.inativo?
  enum status: {inativo: 'inativo', ativo: 'ativo', cancelado: 'cancelado'}
  after_initialize :set_default_role, :if => :new_record?

  has_many :messages
  has_one :member, dependent: :destroy, autosave: true
  has_many :workplaces, through: :member
  has_one :member_type, through: :member, autosave: true
  has_many :invoice
  belongs_to :address, dependent: :destroy
  has_many :publications
  has_many :view_publications, dependent: :destroy
  has_many :function_data_types, dependent: :destroy
  has_many :function_transaction_types, dependent: :destroy
  accepts_nested_attributes_for :member
  accepts_nested_attributes_for :member_type
  accepts_nested_attributes_for :workplaces
  accepts_nested_attributes_for :invoice
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :publications
  validates :email, confirmation: true
  #validate :validate_email_unique, on: :create
  #validate :validate_member_name_unique, on: :create
  #validate :validate_member_cpf_unique, on: :create
  #validate :validate_member_cnpj_unique, on: :create
  #alidate :validate_member_company_name_unique, on: :create
  #validate :validate_member_name_format, on: :create
  validates :email, presence: true, allow_blank: true
  validates_format_of :email, :with => Devise::email_regexp
  validates_uniqueness_of :email
  mount_uploader :avatar, AvatarUploader
  validate :file_size_avatar

  validates_integrity_of :avatar
  validates_processing_of :avatar

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def file_size_avatar
    if self.avatar.size > 2.megabytes
      errors.add(:avatar, "File  should be less than 1MB")
    end
  end

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

  def is_master_user_id?
    self.member.master_user_id.nil?
  end

  def self.search(search, attributes = 'member_name')
    if search
      User.joins(:member, :member_type).where("#{attributes} LIKE ?", "%#{search}%").all
    else
      scoped
    end
  end

  def self.search_members(search, search_by = 'member_name', current_user)
    if search
      User.joins(:member).where(" #{search_by} LIKE ? AND users.id != ? AND master_user_id = ?", "%#{search}%", current_user.id, current_user.id).all
    else
      scoped
    end
  end

  def is_my_master(user)
    self.member.master_user_id == user.id
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
