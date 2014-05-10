class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@rakuten-campaign.herokuapp.com', to: ENV['EMAIL_TO']
  helper :application

  def campaigns
    @archive = Archive.last

    mail subject: "[RC] Campaigns on #{@archive.displayed_on}"
  end
end
