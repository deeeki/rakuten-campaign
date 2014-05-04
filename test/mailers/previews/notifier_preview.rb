class ApplicationPreview < ActionMailer::Preview
  def campaigns
    ApplicationMailer.campaigns
  end
end
