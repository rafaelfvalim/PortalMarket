module ServiceMonitorsHelper
  require "net/https"
  require "uri"

  def check_service_status(url)
    if NetService.new.up?(url)
      '<i class="fa fa-circle fa-2x" style="color: green;"></i>'.html_safe
    else
      '<i class="fa fa-circle fa-2x" style="color: red;"></i>'.html_safe
    end
  end

  def check_url(url)
    if NetService.new.up?(url)
      '<i class="fa fa-circle fa-2x" style="color: green;"></i>'.html_safe
    else
      '<i class="fa fa-circle fa-2x" style="color: red;"></i>'.html_safe
    end
  end
end
