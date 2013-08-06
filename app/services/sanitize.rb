class Sanitize

  def self.site_name(site)
    begin
      site["sourceInfo"]["siteName"].split.map(&:capitalize).join(' ')
    rescue
      Log.create(message: "Error with site_name sanitizer.")
      return "ERROR"
    end
  end

  def self.site_code(site)
    begin
      site["sourceInfo"]["siteCode"][0]["value"]
    rescue
      Log.create(message: "Error with site_code sanitizer.")
      return "ERROR"
    end
  end

  def self.latitude(site)
    begin
      site["sourceInfo"]["geoLocation"]["geogLocation"]["latitude"].to_s
    rescue
      Log.create(message: "Error with latitude sanitizer.")
      return "ERROR"
    end
  end

  def self.longitude(site)
    begin
      site["sourceInfo"]["geoLocation"]["geogLocation"]["longitude"].to_s
    rescue
      Log.create(message: "Error with longitude sanitizer.")
      return "ERROR"
    end
  end

  def self.cfs_value(site)
    begin
      site["values"][0]["value"][0]["value"]
    rescue
      Log.create(message: "Error with cfs_value sanitizer.")
      return "ERROR"
    end
  end

  def self.county_id(site)
    begin
      Sanitize.get_county_code(site["sourceInfo"]["siteProperty"])
    rescue
      Log.create(message: "Error with county_id sanitizer.")
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
