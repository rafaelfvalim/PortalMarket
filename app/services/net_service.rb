class NetService
  require 'net/ping'

  def up?(host)
    uri = URI.parse(host)
    check = Net::Ping::External.new(uri.host.to_s)
    check.ping?
  end

end