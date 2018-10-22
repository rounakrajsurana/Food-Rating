Rails.application.routes.draw do

  resources :categories
  resources :stalls
  resources :dishes
  resources :ratings
  devise_for :users
  get 'basics/index', to: 'basics#index'
  get 'basics/quotations', as: 'quotations'
  post 'basics/quotations'
  get 'basics/export_json', as: "export_json"
  get 'basics/export_xml', as: "export_xml"
  get 'basics/search' => 'basics#search'
  get 'basics/killed' => 'basics#killed'
  post 'basics/import_quotations'
  get 'solution/ps2one', as: "solnp21"
  get 'solution/ps2two', as: "solnp22"

  # get  'basics/erase_personalization', to: 'basics#erase_personalization', as: 'quotations_erase'
   # get  'basics/quotations',      to: 'basics#kill',      as: 'quotations_kill'

  # get 'basics/:id',       as: 'quotations_kill'
  # post 'basics/import_quotations' => 'basics#import_quotations'
  # get 'search', to: 'basics#quotations'

  get 'solution/ps1_dividezero', as: "soln1"
  get 'solution/ps1_googlenews', as: "soln2"
  get 'solution/index'
  get 'dividebyzero/divided', as: "zero_exception"
  get 'google_news/data_scraper', as: "googlenews"

  # get 'basics/index', as: "basics_ps1"
  get 'home/index'
  get 'categories/index'
  get 'stalls/index'
  get 'dishes/index'
  get 'ratings/index'

  get "/as/soln", to: "assignments#solution"
  # resources :assignments
  # resources :basics
  # resources :home
  root "assignments#index"




    # <%= h quotation.author_name %>: <%= h quotation.quote %> -- <%= h quotation.category %>
    # <%= link_to 'Killed', basics_killed_path%>


  #get "/app/view/assignments/devided_page", to: "assignments#divided", as: "zero_exception"
  #get "/app/views/assignments/google_page", to: "assignments#gogoogle", as: "googlenews"
  #get "/app/views/assignments/solution_page", to: "assignments#solution", as: "soln"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
