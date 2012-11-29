Merrymenu::Application.routes.draw do
  get "home/index"

  devise_for :athletes

  root :to => "home#index"
end
