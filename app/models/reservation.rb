class Reservation < ActiveRecord::Base
  belongs_to :user, class_name: User, foreign_key: :owner_user_id
  belongs_to :user, class_name: User, foreign_key: :reserve_for
  belongs_to :script
end
