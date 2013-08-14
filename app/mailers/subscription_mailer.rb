class SubscriptionMailer < ActionMailer::Base
  default from: "address@example.com"

  def notification(user, rivers)
    @user = user
    @rivers = rivers
    mail(to: @user.email, subject: 'Notification from FlowFree.')
  end
end
