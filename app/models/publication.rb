class Publication < ActiveRecord::Base
  mount_uploader :file_name, PublicationUploader
  belongs_to :user
  belongs_to :folder
  belongs_to :file_tag
  has_many :view_publications, :dependent => :destroy
  accepts_nested_attributes_for :folder
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :file_tag
  enum view_group: {cliente: 'Cliente', parceiro: 'Parceiro', todos: 'Todos'}

  def self.search(search, view_group)
    if search
      Publication.joins(:folder).where('folders.name LIKE ? and view_group = ?', "%#{search}%", view_group)
    else
      scoped
    end
  end
end
