class Script < ActiveRecord::Base
  has_many :member_scripts
  has_many :solution_types
  has_many :requirements
  has_many :related_scripts
  accepts_nested_attributes_for :requirements

  mount_uploader :pdf_file, PdfUploader
  mount_uploader :script_file, ScriptUploader
end
