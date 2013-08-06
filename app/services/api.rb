class Api
  require 'httparty'

  def self.fetch
    time = Time.now
    Log.create(message: "Api fetch started at #{time}")
    States.list.each do |state|
      api_output = Api.get_api(state[1])
      api_output["value"]["timeSeries"].each do |site|
        site = Api.sanitize(site)
        unless Api.error?(site)
          Api.create_data(site, time, state[1])
        end
      end
    end
    Log.create(message: "Api fetch completed at #{Time.now}")
  end

  def self.create_data(site, time, state)
    unless Api.river_exist?(site["site_code"])
      Api.build_river(site, state)
    end
    Api.build_river_time(site, time)
  end

  def self.get_api(state)
    begin
      HTTParty.get("http://waterservices.usgs.gov/nwis/iv/?format=json&stateCd=#{state}&parameterCd=00060")
    rescue
      Log.create(message: "Error pulling API at #{Time.now}. Likely network related.")
    end
  end

  def self.error?(sanitized)
    sanitized.has_value?("ERROR")
  end

  def self.river_exist?(site_code)
    River.exists?(site_code: site_code.to_s)
  end

  def self.sanitize(site)
    sanitized = {}
    sanitized["site_name"] = Sanitize.site_name(site)
    sanitized["site_code"] = Sanitize.site_code(site)
    sanitized["latitude"] = Sanitize.latitude(site)
    sanitized["longitude"] = Sanitize.longitude(site)
    sanitized["county_id"] = Sanitize.county_id(site)
    sanitized["cfs_value"] = Sanitize.cfs_value(site)
    return sanitized
  end

  def self.build_river(sanitized, state)
    river_hash = {site_name: sanitized["site_name"], site_code: sanitized["site_code"], latitude: sanitized["latitude"], longitude: sanitized["longitude"], county_id: sanitized["county_id"], state: state}
    Api.write_river(river_hash)
  end

  def self.build_river_time(sanitized, time)
    time_hash = {site_code: sanitized["site_code"], time: time, cfs_value: sanitized["cfs_value"]}
    Api.write_time(time_hash)
  end

  def self.write_river(input)
    river = River.new(input)
    river.save
  end

  def self.write_time(input)
    river_time = RiverTime.new(input)
    river_time.save
  end

end
