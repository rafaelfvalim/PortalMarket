class Workplace < ActiveRecord::Base
  belongs_to :member
  belongs_to :system
end
