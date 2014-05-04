class Campaign < ActiveRecord::Base
  belongs_to :archive

  validate :url, presence: true
end
