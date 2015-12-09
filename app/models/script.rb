class Script < ActiveRecord::Base
  searchkick

  mount_uploader :pdf_file, PdfUploader
  mount_uploader :script_file, ScriptUploader

  validate :check_presence_of_script , :file_size_script
  validate :check_presence_of_pdf, :file_size_pdf

  validates_integrity_of :script_file
  validates_integrity_of :pdf_file
  validates_processing_of :pdf_file
  validates_processing_of :script_file

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
  has_many :invoice,  :dependent => :destroy

  accepts_nested_attributes_for :requirements
  accepts_nested_attributes_for :member_scripts
  accepts_nested_attributes_for :related_scripts
  accepts_nested_attributes_for :checking_account
  accepts_nested_attributes_for :value_chains

  def self.default_timezone
    :utc
  end

  def search_data
    attributes.merge(
        process_module_id: process_modules.map(&:id),
        process_module_description: process_modules.map(&:description)
    )
  end

  def check_presence_of_script
    errors.add(:script_file, "select at least one") if self.script_file.size <= 0
    errors.add(:pdf_file, "select file again ") if self.pdf_file.size <= 0
  end

  def check_presence_of_pdf
    errors.add(:pdf_file, "select at least one") if self.pdf_file.size <= 0
    errors.add(:script_file, "select file: ") if self.pdf_file.size <= 0
  end

  def file_size_pdf
    if self.pdf_file.size > 1.megabytes
      errors.add(:pdf_file, "PDF  should be less than 1MB")
      errors.add(:script_file, "select file: ") if self.pdf_file.size <= 0
    end
  end

  def file_size_script
    if self.script_file.size > 1.megabytes
      errors.add(:script_file, "Scrip should be less than 1MB")
      errors.add(:pdf_file, "select file again ") if self.pdf_file.size <= 0
    end
  end

end
