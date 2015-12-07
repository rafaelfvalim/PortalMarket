class Address < ActiveRecord::Base
  has_many :users
  accepts_nested_attributes_for :users
  validates :city, presence: true, allow_blank: true
  validates :neighborhood, presence: true, allow_blank: true
  validates :number, presence: true, allow_blank: true
  validates :patio, presence: true, allow_blank: true
  validates :patio_type, presence: true, allow_blank: true
  validates :state, presence: true, allow_blank: true
  validates :street, presence: true, allow_blank: true
  validates :zip_code, presence: true, allow_blank: true
end
