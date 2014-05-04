class Archive < ActiveRecord::Base
  has_many :campaigns, dependent: :delete_all

  validate :displayed_on, presence: true
end
