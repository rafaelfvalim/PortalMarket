class Script < ActiveRecord::Base
  has_many :member_scripts
  has_many :solution_types
  mount_uploader :pdf_file, PdfUploader
  mount_uploader :script_file, ScriptUploader
end
