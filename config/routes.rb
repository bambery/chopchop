Chopchop::Application.routes.draw do
  match "auth/:service"          => "auth#service"
  match "auth/:service/callback" => "auth#callback"
  match "logout"                 => "auth#logout"
  
  root :to => 'welcome#index'
  match "faq" => "pages#faq"

  resources :users do
    resources :blackmails
  end

end
