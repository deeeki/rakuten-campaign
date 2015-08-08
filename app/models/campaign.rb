class Campaign < ActiveRecord::Base
  belongs_to :archive

  validate :url, presence: true

  def set_from_json json
    link_params = Hash[URI::decode_www_form(URI::parse(json[:l]).query)]
    self.title = json[:a]
    self.url = URI.unescape(link_params['R2']).sub(/\?.*/, '')
  end
end
