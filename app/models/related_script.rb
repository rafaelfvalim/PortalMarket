class RelatedScript < ActiveRecord::Base
  belongs_to :script, foreign_key: 'script_id'
  belongs_to :script, foreign_key: 'related_script_id'
end
