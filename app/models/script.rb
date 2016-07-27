class Script < ActiveRecord::Base
  searchkick

  mount_uploader :pdf_file, PdfUploader
  mount_uploader :script_file, ScriptUploader

  validate :check_presence_of_script, :file_size_script, unless: :is_pre_lancamento?
  validate :check_presence_of_pdf, :file_size_pdf
  validate :end_development_date_cannot_be_in_the_past, :end_development_date_is_selected, if: :is_pre_lancamento?
  validate :script_file, :not_permited_script_in_pre_lancamento , if: :is_pre_lancamento?

  validates :name, presence: true, length: {minimum: 5, maximum: 50}, uniqueness: true
  validates :description, length: {minimum: 10, maximum: 200}, presence: true
  validates :platform, presence: true
  validates :definition, length: {minimum: 10, maximum: 3000}
  validates :long_text, length: {minimum: 10, maximum: 3000}
  validates :industry, presence: true
  validates :solution_type_id, presence: true
  #validates :solution_type_id, presence: true
  validates :complexity, presence: true

  scope :search_import, -> { includes(:member_scripts) }
  scope :search_import, -> { includes(:members) }
  scope :search_import, -> { includes(:price) }
  scope :search_import, -> { includes(:value_chains) }
  scope :search_import, -> { includes(:process_modules) }
  scope :search_import, -> { includes(:script_category) }
  scope :search_import, -> { includes(:script_like) }

  has_many :member_scripts, dependent: :destroy
  has_one :script_like, dependent: :destroy

  has_many :requirements, dependent: :destroy
  has_many :related_scripts, dependent: :destroy

  has_many :members, through: :member_scripts
  has_one :price, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :value_chains, dependent: :destroy
  has_many :process_modules, through: :value_chains

  has_many :function_data_types, dependent: :destroy
  has_many :function_transaction_types, dependent: :destroy

  has_many :attachment_docs, dependent: :destroy

  has_one :script_category, dependent: :destroy
  has_one :category , through: :script_categories
  belongs_to :solution_type
  belongs_to :status
  has_many :invoices, dependent: :destroy
  has_many :checking_accounts, dependent: :destroy
  has_many :reservations
  accepts_nested_attributes_for :requirements
  accepts_nested_attributes_for :member_scripts
  accepts_nested_attributes_for :related_scripts
  accepts_nested_attributes_for :value_chains
  accepts_nested_attributes_for :checking_accounts
  accepts_nested_attributes_for :attachment_docs

  def search_data
    attributes.merge(
        process_module_id: process_modules.map(&:id),
        process_module_description: process_modules.map(&:description)
    )
  end

  def is_pre_lancamento?
    return self.status_id == Status::PRE_LANCAMENTO ? true : false
  end

  def not_permited_script_in_pre_lancamento
    if self.script_file.size > 0
      errors.add(:script_file, "não é permitido em um pré-lançamento")
    end
  end

  def end_development_date_cannot_be_in_the_past
    if self.end_development_date.present? && self.end_development_date < Date.today
      errors.add(:end_development_date, "não pode estar no passado")
    end
  end

  def end_development_date_is_selected
    if end_development_date.nil?
      errors.add(:end_development_date, "não pode ser nula")
    end
  end

  def check_presence_of_script
    errors.add(:script_file, "não selecionado") if self.script_file.size <= 0
    # errors.add(:pdf_file, "selecione novamente") if self.pdf_file.size <= 0
  end

  def check_presence_of_pdf
    errors.add(:pdf_file, "não selecionado") if self.pdf_file.size <= 0
    # errors.add(:script_file, "selecione novamente ") if self.script_file.size <= 0
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
      Script.where(" has_price = 1 AND status_id = #{Status::APROVADO} AND #{field} LIKE ?", "%#{search}%")
    else
      scoped
    end
  end

end
