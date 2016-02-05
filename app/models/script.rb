class Script < ActiveRecord::Base
  searchkick

  mount_uploader :pdf_file, PdfUploader
  mount_uploader :script_file, ScriptUploader

  validate :check_presence_of_script , :file_size_script
  validate :check_presence_of_pdf, :file_size_pdf

  validates :name, presence: true, length: {minimum: 5, maximum: 50}, uniqueness: true
  validates :description, length: {minimum: 10, maximum: 50}, presence: true
  validates :platform, presence: true
  validates :definition , length: {minimum: 10, maximum: 200}, allow_blank: true
  validates :long_text, length: {minimum: 10, maximum: 200} , allow_blank: true
  validates :industry, presence: true , allow_blank: true
  #validates :solution_type_id, presence: true
  validates :complexity, presence: true

  scope :search_import, -> { includes(:member_scripts) }
  scope :search_import, -> { includes(:members) }
  scope :search_import, -> { includes(:price) }
  scope :search_import, -> { includes(:value_chains) }
  scope :search_import, -> { includes(:process_modules) }

  has_many :member_scripts, dependent: :destroy
  has_many :requirements, dependent: :destroy
  has_many :related_scripts, dependent: :destroy
  has_many :checking_account, dependent: :destroy
  has_many :members, through: :member_scripts
  has_one :price, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :value_chains, dependent:  :destroy
  has_many :process_modules, through: :value_chains

  has_many :function_data_types, dependent: :destroy
  has_many :function_transaction_types, dependent: :destroy

  belongs_to :solution_type
  belongs_to :status
  has_many :invoice,  :dependent => :destroy

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

  def check_presence_of_script
    errors.add(:script_file, "selecione pelo menos um arquivo") if self.script_file.size <= 0
    errors.add(:pdf_file, "selecione novamente") if self.pdf_file.size <= 0
  end

  def check_presence_of_pdf
    errors.add(:pdf_file, "selecione pelo menos um arquivo") if self.pdf_file.size <= 0
    errors.add(:script_file, "selecione novamente ") if self.script_file.size <= 0
  end

  def file_size_pdf
    if self.pdf_file.size > 10.megabytes
      errors.add(:pdf_file, "PDF presecisa ser abaixo de  10MB")
      errors.add(:script_file, "selecione novamente ") if self.script_file.size <= 0
    end
  end

  def file_size_script
    if self.script_file.size > 10.megabytes
      errors.add(:script_file, "Scrip presecisa ser abaixo de  10MB")
      errors.add(:pdf_file, "selecione novamente ") if self.pdf_file.size <= 0
    end
  end


  def self.search_related(search, field)
    if search
      Script.where(" has_price = 1 AND status_id != 6 AND #{field} LIKE ?", "%#{search}%")
    else
      scoped
    end
  end

end
