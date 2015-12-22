class MemberScript < ActiveRecord::Base
  belongs_to :member
  belongs_to :script

  def self.update_or_create_by(args, attributes)
    self.find_or_create_by(args)
    self.update(attributes)
  end

end
