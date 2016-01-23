class Publication < ActiveRecord::Base
  mount_uploader :file_name, PublicationUploader
  belongs_to :user
  belongs_to :folder
  belongs_to :file_tag
  accepts_nested_attributes_for :folder
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :file_tag

  def self.search(search)
    if search
      Publication.joins(:folder).where('folders.name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
