class ApplicationController < ActionController::Base

  def render_dashboards
    render({:template => "landing_templates/dashboards.html.erb"})    
  end

  def list_base_currencies
    url_ccy_symbol_data = "https://api.exchangerate.host/symbols"
    raw_symbol_data = open(url_ccy_symbol_data).read
    parsed_symbol_data = JSON.parse(raw_symbol_data)
    @currency_symbols = parsed_symbol_data.fetch("symbols").keys  

    render({:template => "landing_templates/list_base_currencies.html.erb"})
    
  end

  def list_price_currencies
    url_ccy_symbol_data = "https://api.exchangerate.host/symbols"
    raw_symbol_data = open(url_ccy_symbol_data).read
    parsed_symbol_data = JSON.parse(raw_symbol_data)   
    @price_currencies = parsed_symbol_data.fetch("symbols").keys

    render({:template => "landing_templates/list_price_currencies.html.erb"})
    
  end


  def render_fx_page
    @base_ccy = params.fetch("base").upcase
    @price_ccy = params.fetch("price").upcase  
    api_link_text = "https://api.exchangerate.host/convert?from=" + @base_ccy + "&to=" + @price_ccy
    raw_fx_rate_data = open(api_link_text).read
    parsed_fx_rate_data = JSON.parse(raw_fx_rate_data)
    @fx_price_per_base = parsed_fx_rate_data.fetch("info").fetch("rate")

    render({:template => "page_templates/fx_page.html.erb"})
    
  end

end
