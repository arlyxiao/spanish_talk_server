SpanishTalkServer::Application.routes.draw do
  resources :android


  resources :users do
    collection do
      post :do_login
    end
  end

  resources :questions do
    resources :answers

    collection do
      get :my
    end
  end

  resources :answers

end
