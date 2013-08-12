class River < ActiveRecord::Base
  include RiversHelper
  self.primary_key = "site_code"
  has_many :users,
           :through => "subscriptions",
           :foreign_key => "site_code"
  has_many :river_times,
           :foreign_key => "site_code"


  def state
    full_name(self[:state])
  end

  def self.recent
    self.order(:created_at => :desc).group(:site_code)
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['Name like ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
