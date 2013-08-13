class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :timeoutable

  has_many :rivers,
           :through => "subscriptions",
           :foreign_key => "site_code"

  def subscribed?(site_code)
    Subscription.find_by(user_id: current_user.id, site_code: site_code)
  end

end
