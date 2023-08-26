Rails.application.routes.draw do
  resources :tic_tac_toes do
    # member :start
    collection do
      post :start
    end
    put :place_mark
    # get :show
  end

  root 'games#index'
end
