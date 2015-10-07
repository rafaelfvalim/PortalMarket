class Script < ActiveRecord::Base
  searchkick
  has_many :member_scripts, :dependent => :destroy
  has_many :requirements, :dependent => :destroy
  has_many :related_scripts, :dependent => :destroy
  has_many :checking_account, :dependent => :destroy

  belongs_to :solution_type
  belongs_to :status
  accepts_nested_attributes_for :requirements

  mount_uploader :pdf_file, PdfUploader
  mount_uploader :script_file, ScriptUploader

end
