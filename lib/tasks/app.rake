namespace :app do
  desc 'Fetch all campaigns from Rakuten'
  task fetch: :environment do
    archive = Archive.find_or_initialize_by(displayed_on: Date.today)
    next if archive.persisted?

    require 'mechanize'
    agent = Mechanize.new
    page = agent.get('http://event.rakuten.co.jp/smart/top/list/event/')
    page.search('.itemArea a').each do |banner|
      url = banner['href'].sub(/\?.*/, '')
      campaign_page = agent.get(url)
      archive.campaigns.build({
        title: campaign_page.title,
        url: url,
        html: campaign_page.content.encode('UTF-8', invalid: :replace, undef: :replace),
      })
    end
    archive.save
  end
end
