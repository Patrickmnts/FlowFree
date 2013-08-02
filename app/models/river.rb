class River < ActiveRecord::Base
  def self.recent
    self.order(:created_at => :desc).group(:site_code)
  end

end
