class Script < ActiveRecord::Base

  has_many :member_scripts, :dependent => :destroy
  has_many :requirements, :dependent => :destroy
  has_many :related_scripts, :dependent => :destroy
  belongs_to :solution_types
  belongs_to :status
  accepts_nested_attributes_for :requirements

  mount_uploader :pdf_file, PdfUploader
  mount_uploader :script_file, ScriptUploader
end
