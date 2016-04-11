class Price < ActiveRecord::Base
  belongs_to :script
  belongs_to :currency
  has_many :carts
  # after_update :set_script_price
  # after_create :set_script_price
  has_one :status , through: :script
  # Validations
  validates :script_id, presence: true
  validates :currency_data, presence: true
  validates :currency_id, presence: true
  validates :aggregate_percentage, presence: true
  validates :value, presence: true

  # trigger da price
  def set_script_price
    @script = Script.find(script_id)
    if value > 0
      @script.update_attribute(:has_price, true)
    else
      @script.update_attribute(:has_price, false)
    end
  end


end
