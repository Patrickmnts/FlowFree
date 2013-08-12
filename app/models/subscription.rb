class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :river,
             :foreign_key => "site_code"

end
