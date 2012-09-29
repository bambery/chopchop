Chopchop::Application.routes.draw do
  match "auth/:service"          => "auth#service"
  match "auth/:service/callback" => "auth#callback"
  match "logout"                 => "auth#logout"
  
  root :to => 'welcome#index'
end
