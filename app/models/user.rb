class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]

  after_initialize :set_default_role, :if => :new_record?
  has_many :messages
  has_one :member, dependent: :destroy, autosave: true
  has_many :workplaces, through: :members
  belongs_to :invoice
  accepts_nested_attributes_for :member

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

end
