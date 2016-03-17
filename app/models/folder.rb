class Folder < ActiveRecord::Base
  has_many :publications

  validates :name, presence: true
end
