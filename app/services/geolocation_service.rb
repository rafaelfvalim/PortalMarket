class GeolocationService
  #http://ip-api.com/
  # Example
  # "as"=>"AS14907 Wikimedia Foundation Inc.",
  # "city"=>"San Francisco",
  # "country"=>"United States",
  # "countryCode"=>"US",
  # "isp"=>"Wikimedia Foundation",
  # "lat"=>37.7898,
  # "lon"=>-122.3942,
  # "org"=>"Wikimedia Foundation",
  # "query"=>"208.80.152.201",
  # "region"=>"CA",
  # "regionName"=>"California",
  # "status"=>"success",
  # "timezone"=>"America/Los_Angeles"

  def get_by_ip(ip)
    require 'net/http'
    require 'hashie'
    if ip != '127.0.0.1'
      source = 'http://ip-api.com/json/'+ ip
      resp = Net::HTTP.get_response(URI.parse(source))
      data = resp.body
      result = JSON.parse(data)
      obj = Hashie::Mash.new result
      return obj
    end
    return nil
  end
end