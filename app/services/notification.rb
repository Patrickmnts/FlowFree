class Notification

  def initialize
    users = get_users
    users.each do |user|
      rivers = Set.new
      subscriptions = get_subscriptions(user.id)
      subscriptions.each do |subscription|
        if notify?(subscription)
          rivers << subscription.river
        end
      end
      SubscriptionMailer.notification(user, rivers).deliver
    end
  end

  def get_users
    User.all
  end

  def get_subscriptions(user_id)
    Subscription.joins(:river).where("user_id = ?", user_id)
  end

  def notify?(subscription)
    floor(subscription) || ceiling(subscription)
  end

  def floor(subscription)
    valid?(subscription.floor) && less_than?(subscription)
  end

  def ceiling(subscription)
    valid?(subscription.ceiling) && greater_than?(subscription)
  end

  def less_than?(subscription)
    subscription.floor > subscription.river.cfs_value
  rescue
    return false
  end

  def greater_than?(subscription)
    subscription.ceiling < subscription.river.cfs_value
  rescue
    return false
  end

  def valid?(cfs)
    number?(cfs) && cfs.to_i != 0
  end

  def number?(cfs)
    cfs.to_i.is_a? Fixnum
  end


end
