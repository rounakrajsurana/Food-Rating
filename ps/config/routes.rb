Rails.application.routes.draw do

  resources :assignments
  resources :categories
  resources :ratings

  resources :stalls
  
  resources :dishes do
    resources :ratings
  end
  devise_for :users

  root to: 'assignments#index'

  mount RailsAdmin::Engine => '//admin', as: 'rails_admin'
  get 'assignments/index', to: 'assignments#index'
  get 'home/index'
  get 'home/member'
  get 'home/map'
  get 'home/about'
  get 'home/review'
  get 'home/stall'
  get 'home/admin'
  get 'home/user'
  # get 'basics/index', to: 'basics#index'
  get 'basics/index'
  # get 'basics/search' => 'basics#search'
  # get 'basics/killed' => 'basics#killed'
  get 'basics/search'
  get 'basics/killed'
  get 'basics/quotations', as: 'quotations'
  get 'basics/export_json', as: "export_json"
  get 'basics/export_xml', as: "export_xml"

  post 'basics/quotations'
  post 'basics/import_quotations'

  get 'solution/index'
  get 'solution/ps6'
  get 'solution/ps2one', as: "solnp21"
  get 'solution/ps2two', as: "solnp22"
  get 'solution/ps1_dividezero', as: "soln1"
  get 'solution/ps1_googlenews', as: "soln2"
  get 'dividebyzero/divided', as: "zero_exception"
  get 'google_news/data_scraper', as: "googlenews"
  get "/as/soln", to: "assignments#solution"

  # get  'basics/erase_personalization', to: 'basics#erase_personalization', as: 'quotations_erase'
   # get  'basics/quotations',      to: 'basics#kill',      as: 'quotations_kill'

  # get 'basics/:id',       as: 'quotations_kill'
  # post 'basics/import_quotations' => 'basics#import_quotations'
  # get 'search', to: 'basics#quotations'

  # get 'basics/index', as: "basics_ps1"
  # get 'categories/index'
  # get 'stalls/index'
  # get 'dishes/index'
  # get 'ratings/index'

  # resources :assignments
  # resources :basics
  # resources :home

    # <%= h quotation.author_name %>: <%= h quotation.quote %> -- <%= h quotation.category %>
    # <%= link_to 'Killed', basics_killed_path%>

  #get "/app/view/assignments/devided_page", to: "assignments#divided", as: "zero_exception"
  #get "/app/views/assignments/google_page", to: "assignments#gogoogle", as: "googlenews"
  #get "/app/views/assignments/solution_page", to: "assignments#solution", as: "soln"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '*path' => redirect('/')
end
