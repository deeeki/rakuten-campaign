namespace :app do
  desc 'Daily scheduled task (fetch and notify)'
  task daily: [:fetch, :notify]

  desc 'Fetch all campaigns from Rakuten'
  task fetch: :environment do
    archive = Archive.find_or_initialize_by(displayed_on: Date.today)
    next if archive.persisted?

    archive.fetch.save
  end

  desc 'Notify the latest campaigns'
  task notify: :environment do
    ApplicationMailer.campaigns.deliver
  end
end
