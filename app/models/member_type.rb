class MemberType < ActiveRecord::Base
  has_many :members, dependent: :destroy
end
