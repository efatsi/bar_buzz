Rails.application.routes.draw do
  root "cores#index"
  get ":id", to: "cores#show", as: :core
end
