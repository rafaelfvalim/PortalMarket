class Invoice < ActiveRecord::Base
  has_many :invoice_statuses
  belongs_to :pay_method
  belongs_to :workplace
  belongs_to :user
  belongs_to :script
  accepts_nested_attributes_for :workplace
  accepts_nested_attributes_for :user

  def invoice_script_url
    "/downloads/script/script_file/#{self.id}/#{self.user_id}/#{self.script_file}"
  end

end
