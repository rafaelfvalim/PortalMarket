class Invoice < ActiveRecord::Base
  has_many :invoice_statuses
  belongs_to :pay_method
  belongs_to :workplace
  belongs_to :user
  belongs_to :script
  has_one :member, through: :user
  accepts_nested_attributes_for :workplace
  accepts_nested_attributes_for :user

  def invoice_script_url
    "/downloads/script/script_file/#{self.id}/#{self.user_id}/#{self.script_file}"
  end

  def encrypt_url
    url = {}
    url['url'] = {}
    url['url']['date']= Date.today.strftime("%m-%d-%Y")
    url['url']['invoice_id']= self.id
    secure = UtilSecurityService.new
    secure.encripty_url(url, User.find(self.user_id))
  end


end
