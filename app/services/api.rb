class Api
  require 'httparty'

  def self.pull
    States.list.each do |state|
      api_output = Api.get_api(state[1])
      api_output["value"]["timeSeries"].each do |site|
        river = River.new(Api.sanitize(site, state[1]))
        river.save
      end
    end
  end

  def self.get_api(state)
    HTTParty.get("http://waterservices.usgs.gov/nwis/iv/?format=json&stateCd=#{state}&parameterCd=00060")
  end

  def self.sanitize(site, state)
    begin
      site_name = site["sourceInfo"]["siteName"].split.map(&:capitalize).join(' ')
      puts site_name
      site_code = site["sourceInfo"]["siteCode"][0]["value"]
      refresh_time = site["values"][0]["value"][0]["dateTime"]
      latitude = site["sourceInfo"]["geoLocation"]["geogLocation"]["latitude"].to_s
      longitude = site["sourceInfo"]["geoLocation"]["geogLocation"]["longitude"].to_s
      county_id = Api.get_county_code(site["sourceInfo"]["siteProperty"])
      cfs_value = site["values"][0]["value"][0]["value"]
      puts cfs_value
    rescue
      puts "Error" #FIXME: We should do something better here.
    end
    return {site_name: site_name, site_code: site_code, refresh_time: refresh_time, latitude: latitude, longitude: longitude, county_id: county_id, cfs_value: cfs_value, state: state}
  end

  def self.get_county_code(siteProperty)
    siteProperty.each do |hash_item|
      if hash_item["name"] == "countyCd"
        return hash_item["value"]
      end
    end
  end

end