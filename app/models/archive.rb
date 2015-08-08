require 'open-uri'

class Archive < ActiveRecord::Base
  has_many :campaigns, dependent: :delete_all

  validate :displayed_on, presence: true

  def fetch
    json = JSON.parse(open('http://api.ppf.rakuten.co.jp/v1/get/?source_id=1&device_type=pc').read, symbolize_names: true)
    json[:c].first[:c].each do |campaign_json|
      c = campaigns.build
      c.set_from_json(campaign_json)
    end
    self
  end
end
