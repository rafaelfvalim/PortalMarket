class MemberScript < ActiveRecord::Base
  belongs_to :member
  belongs_to :script
end
