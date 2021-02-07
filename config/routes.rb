Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", {:controller => "application", :action => "render_dashboards"})
  get("/forex", {:controller => "application", :action => "list_base_currencies"})

  get("/forex/:base", {:controller => "application", :action => "list_price_currencies"})
  get("/forex/:base/:price", {:controller => "application", :action => "render_fx_page"})

end
