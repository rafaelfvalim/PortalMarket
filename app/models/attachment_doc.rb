class AttachmentDoc < ActiveRecord::Base

  mount_uploader :file_name, AttachmentDocUploader
  belongs_to :script

end
