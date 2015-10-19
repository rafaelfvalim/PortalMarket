class Message < ActiveRecord::Base
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :user, foreign_key: 'message_to'
end