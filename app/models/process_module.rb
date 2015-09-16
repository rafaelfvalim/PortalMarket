class ProcessModule < ActiveRecord::Base
  has_many :referrals, class_name: "ProcessModule" , foreign_key:  "referrer_process_module_id"
  belongs_to :referring_process_module, class_name:  "ProcessModule"
end