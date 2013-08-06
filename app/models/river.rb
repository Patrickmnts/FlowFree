class River < ActiveRecord::Base
  include RiversHelper

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
