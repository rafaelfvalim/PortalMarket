module DashboardHelper

  def widget_dash_board(bg_color, icon, header_description, header_count, link_path)
    html = <<-HTML
    <div class="col-md-3point5 col-xs-12 col-lg-4">
      <div class="widget style1 #{bg_color}">
        <div class="row">
          <div class="col-xs-4 col-lg-4 col-md-4">
            <i class="#{icon}"></i>
          </div>
          <div class="col-xs-8 col-lg-8 col-md-8">
            <div class="widget-text-header">
              <h4>#{header_description}</h4>
            </div>
            <h2 class="font-bold">#{header_count}</h2>
          </div>
        </div>
        <hr>
        <div class="row">
          <div class="col-xs-12 col-lg-12 col-md-12 dash_links">
            <a href="#{link_path}" >
                <span class="pull-left">#{t 'labels.buttons.details'}</span>
                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                <div class="clearfix"></div>
            </a>
          </div>
        </div>
      </div>
    </div>
    HTML
    html.html_safe
  end

end
