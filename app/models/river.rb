class River < ActiveRecord::Base
  require 'httparty'

  def self.db_upload
    base = 'http://waterservices.usgs.gov/nwis/iv/?format=json&stateCd='
    parameter = '&parameterCd=00060'
    states = [
              [ "Alabama", "al" ],
              [ "Alaska", "ak" ],
              [ "Arizona", "az" ],
              [ "Arkansas", "ar" ],
              [ "California", "ca" ],
              [ "Colorado", "co" ],
              [ "Connecticut", "ct" ],
              [ "Delaware", "de" ],
              [ "Florida", "fl" ],
              [ "Georgia", "ga" ],
              [ "Hawaii", "hi" ],
              [ "Idaho", "id" ],
              [ "Illinois", "il" ],
              [ "Indiana", "in" ],
              [ "Iowa", "ia" ],
              [ "Kansas", "ks" ],
              [ "Kentucky", "ky" ],
              [ "Louisiana", "la" ],
              [ "Maine", "me" ],
              [ "Maryland", "md" ],
              [ "Massachusetts", "ma" ],
              [ "Michigan", "mi" ],
              [ "Minnesota", "mn" ],
              [ "Mississippi", "ms" ],
              [ "Missouri", "mo" ],
              [ "Montana", "mt" ],
              [ "Nebraska", "ne" ],
              [ "Nevada", "nv" ],
              [ "New Hampshire", "nh" ],
              [ "New Jersey", "nj" ],
              [ "New Mexico", "nm" ],
              [ "New York", "ny" ],
              [ "North Carolina", "nc" ],
              [ "North Dakota", "nd" ],
              [ "Ohio", "oh" ],
              [ "Oklahoma", "ok" ],
              [ "Oregon", "or" ],
              [ "Pennsylvania", "pa" ],
              [ "Rhode Island", "ri" ],
              [ "South Carolina", "sc" ],
              [ "South Dakota", "sd" ],
              [ "Tennessee", "tn" ],
              [ "Texas", "tx" ],
              [ "Utah", "ut" ],
              [ "Vermont", "vt" ],
              [ "Virginia", "va" ],
              [ "Washington", "wa" ],
              [ "West Virginia", "wv" ],
              [ "Wisconsin", "wi" ],
              [ "Wyoming", "wy" ]
            ]
    states.each do |state|
      puts state
      hash = HTTParty.get( base + state[1] + parameter )
      hash["value"]["timeSeries"].each do |x|
        begin
      # variables
          site_name = x["sourceInfo"]["siteName"].split.map(&:capitalize).join(' ')
          # puts "site name " + site_name
          site_code = x["sourceInfo"]["siteCode"][0]["value"]
          # puts "site code " + site_code
          refresh_time = x["values"][0]["value"][0]["dateTime"]
          # puts "refresh_time " + refresh_time
          latitude = x["sourceInfo"]["geoLocation"]["geogLocation"]["latitude"].to_s
          # puts "latitude " + latitude
          longitude = x["sourceInfo"]["geoLocation"]["geogLocation"]["longitude"].to_s
          # puts "longitude " + longitude
          cfs_value = x["values"][0]["value"][0]["value"]
          # puts "cfs value " + cfs_value

          river = River.new
          river.update_attributes(site_name: site_name,
                                  site_code: site_code,
                                  refresh_time: refresh_time,
                                  latitude: latitude,
                                  longitude: longitude,
                                  cfs_value: cfs_value,
                                  state: state[1])
        rescue
          puts "ERROR ERROR"
        end
      end
        # sleep 10
    end
  end
end
