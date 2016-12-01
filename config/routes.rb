Rails.application.routes.draw do
  devise_for :users

  root 'novels#index'

  resources :novels, only: [:index, :show] do
    collection do
      get :search
    end
    resources :chapters, only: [:show, :new, :create, :edit, :update] do
      member do
        get :voting
      end
    end
  end

  namespace 'my' do
    resources :novels, only: [] do
      collection do
        get :followed
        post :follow

        get :liked
        post :like

        get :voted

        get :contributed
      end
      resources :chapters, only: [] do
        member do
          post :vote
        end
      end
    end
  end

  namespace 'admin', path: 'my/sefewkrlwswb' do
    resources :novels
    resources :users
  end
end
