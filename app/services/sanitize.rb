class Sanitize

  def self.site_name(site)
    begin
      site["sourceInfo"]["siteName"].split.map(&:capitalize).join(' ')
    rescue
      return "ERROR"
    end
  end

  def self.site_code(site)
    begin
      site["sourceInfo"]["siteCode"][0]["value"]
    rescue
      return "ERROR"
    end
  end

  def self.latitude(site)
    begin
      site["sourceInfo"]["geoLocation"]["geogLocation"]["latitude"].to_s
    rescue
      return "ERROR"
    end
  end

  def self.longitude(site)
    begin
      site["sourceInfo"]["geoLocation"]["geogLocation"]["longitude"].to_s
    rescue
      return "ERROR"
    end
  end

  def self.cfs_value(site)
    begin
      site["values"][0]["value"][0]["value"]
    rescue
      return "ERROR"
    end
  end

  def self.county_id(site)
    begin
      Sanitize.get_county_code(site["sourceInfo"]["siteProperty"])
    rescue
      return "ERROR"
    end
  end

  def self.get_county_code(siteProperty)
    siteProperty.each do |hash_item|
      if hash_item["name"] == "countyCd"
        return hash_item["value"]
      end
    end
  end

end
