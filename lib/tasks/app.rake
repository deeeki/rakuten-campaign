namespace :app do
  desc 'Daily scheduled task (fetch and notify)'
  task daily: [:fetch, :notify]

  desc 'Fetch all campaigns from Rakuten'
  task fetch: :environment do
    archive = Archive.find_or_initialize_by(displayed_on: Date.today)
    next if archive.persisted?

    require 'mechanize'
    agent = Mechanize.new
    page = agent.get('http://event.rakuten.co.jp/smart/top/list/event/')
    urls = page.search('.itemArea a').map{|banner| banner['href'].sub(/\?.*/, '') }
    urls.uniq.each do |url|
      campaign_page = agent.get(url)
      archive.campaigns.build({
        title: campaign_page.title,
        url: url,
        html: campaign_page.content.encode('UTF-8', invalid: :replace, undef: :replace),
      })
    end
    archive.save
  end

  desc 'Notify the latest campaigns'
  task notify: :environment do
    ApplicationMailer.campaigns.deliver
  end
end
