module Searchjoy
  class Search < ActiveRecord::Base
    def self.default_timezone
      :utc
    end
  end
end