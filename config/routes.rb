SpanishTalkServer::Application.routes.draw do
  resources :users do
    collection do
      post :do_login
    end
  end

  resources :questions do
    collection do
      get :my
    end
  end

end
