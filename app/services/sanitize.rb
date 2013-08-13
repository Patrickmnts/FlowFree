class Sanitize

  def self.site_name(site)
    string = site["sourceInfo"]["siteName"]
      if string =~ /[,]\w{2}/
        string.insert(-3, ' ')
      elsif string !~ /,/
        string.insert(-4, ',')
      end
    nameArray = string.split.map(&:capitalize)
    name = nameArray[0..-2].join(' ') + ' ' + nameArray[-1].upcase
    return name
  rescue
    Log.create(message: "Error with site_name sanitizer.")
    return "ERROR"
  end

  def self.site_code(site)
    site["sourceInfo"]["siteCode"][0]["value"]
  rescue
    Log.create(message: "Error with site_code sanitizer.")
    return "ERROR"
  end

  def self.latitude(site)
    site["sourceInfo"]["geoLocation"]["geogLocation"]["latitude"].to_s
  rescue
    Log.create(message: "Error with latitude sanitizer.")
    return "ERROR"
  end

  def self.longitude(site)
    site["sourceInfo"]["geoLocation"]["geogLocation"]["longitude"].to_s
  rescue
    Log.create(message: "Error with longitude sanitizer.")
    return "ERROR"
  end

  def self.cfs_value(site)
    site["values"][0]["value"][0]["value"]
  rescue
    Log.create(message: "Error with cfs_value sanitizer.")
    return "ERROR"
  end

  def self.county_id(site)
    Sanitize.get_county_code(site["sourceInfo"]["siteProperty"])
  rescue
    Log.create(message: "Error with county_id sanitizer.")
    return "ERROR"
  end

  def self.get_county_code(siteProperty)
    siteProperty.each do |hash_item|
      if hash_item["name"] == "countyCd"
        return hash_item["value"]
      end
    end
  end

end
