class Script < ActiveRecord::Base
  searchkick

  mount_uploader :pdf_file, PdfUploader
  mount_uploader :script_file, ScriptUploader
  validates_presence_of :pdf_file
  validates_presence_of :script_file

  validates :name, presence: true, length: {minimum: 5, maximum: 50}, uniqueness: true
  validates :description, length: {minimum: 10, maximum: 50}, presence: true
  validates :platform, presence: true
  validates :definition, presence: true, length: {minimum: 10, maximum: 200}
  validates :long_text, presence: true, length: {minimum: 10, maximum: 200}
  validates :industry, presence: true
  validates :solution_type_id, presence: true
  validates :complexity, presence: true

  scope :search_import, -> { includes(:member_scripts) }
  scope :search_import, -> { includes(:members) }
  scope :search_import, -> { includes(:price) }
  scope :search_import, -> { includes(:value_chains) }
  scope :search_import, -> { includes(:process_modules) }

  has_many :member_scripts, :dependent => :destroy
  has_many :requirements, :dependent => :destroy
  has_many :related_scripts, :dependent => :destroy
  has_many :checking_account, :dependent => :destroy
  has_many :members, through: :member_scripts
  has_one :price, :dependent => :destroy
  has_many :carts, :dependent => :destroy
  has_many :value_chains, :dependent => :destroy
  has_many :process_modules, through: :value_chains

  belongs_to :solution_type
  belongs_to :status
  accepts_nested_attributes_for :requirements
  accepts_nested_attributes_for :member_scripts
  accepts_nested_attributes_for :related_scripts
  accepts_nested_attributes_for :checking_account
  accepts_nested_attributes_for :value_chains


  def search_data
    attributes.merge(
        process_module_id: process_modules.map(&:id),
        process_module_description: process_modules.map(&:description)
    )
  end

end
