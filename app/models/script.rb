class Script < ActiveRecord::Base
  searchkick
  scope :search_import, -> { includes(:member_scripts) }
  scope :search_import, -> { includes(:members) }
  has_many :member_scripts, :dependent => :destroy
  has_many :requirements, :dependent => :destroy
  has_many :related_scripts, :dependent => :destroy
  has_many :checking_account, :dependent => :destroy
  has_many :members, through: :member_scripts

  belongs_to :solution_type
  belongs_to :status
  accepts_nested_attributes_for :requirements
  accepts_nested_attributes_for :member_scripts
  accepts_nested_attributes_for :related_scripts
  accepts_nested_attributes_for :checking_account

  mount_uploader :pdf_file, PdfUploader
  mount_uploader :script_file, ScriptUploader

end
