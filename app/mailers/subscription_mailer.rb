class SubscriptionMailer < ActionMailer::Base
  default from: "no-reply@example.com"

  def notification(user, subscription)
    @user = user
    @subscription = subscription
    mail(to: @user.email, subject: 'Notification from FlowFree.')
  end
end

# @subscriptions = Subscription.joins(:river).where("user_id = ?", params[:id])
