Rails.application.routes.draw do
  resources :music, :as => :albums, :controller => :albums, :only => [:index, :show] do
      resources :songs, :only => :show
  end

  scope(:module => 'refinery') do
    scope(:path => 'refinery', :as => 'refinery_admin', :module => 'admin') do
      resources :songs do
        collection do
          post :update_positions
        end
      end

      resources :music_settings do
        member do
          match :toggle
        end
      end

      resources :music, :as => :albums, :controller => :albums do
        collection do
          post :update_positions
        end

        resources :songs, :except => :show do
          collection do
            post :update_positions
          end
        end
      end
    end
  end

  #resources :songs, :as => :music
end
