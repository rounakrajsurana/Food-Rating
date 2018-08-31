Rails.application.routes.draw do
  get 'solution/ps1_dividezero', as: "soln1"
  get 'solution/ps1_googlenews', as: "soln2"
  get 'solution/index'
  get 'dividebyzero/divided', as: "zero_exception"
  get 'google_news/data_scraper', as: "googlenews"

  get "/as/soln", to: "assignments#solution"
  resources :assignments
  root "solution#index"
  

  #get "/app/view/assignments/devided_page", to: "assignments#divided", as: "zero_exception"
  #get "/app/views/assignments/google_page", to: "assignments#gogoogle", as: "googlenews"
  #get "/app/views/assignments/solution_page", to: "assignments#solution", as: "soln"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
