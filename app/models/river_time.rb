class RiverTime < ActiveRecord::Base
  belongs_to :river,
             :foreign_key => "site_code"

end
