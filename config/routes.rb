Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :webhooks do
        resource :slack, only: [ :alert ], controller: :slack do
          post :alert
        end
      end
    end
  end
end
