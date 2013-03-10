Refinery::Core::Engine.routes.append do

  namespace :music do
    resources :albums, :path =>'', :only => [:index, :show] do
        resources :songs, :only => :show
    end
  end

    namespace :music, :path => '' do
      namespace :admin, :path => 'refinery' do
        resources :songs, :except => :show do
          collection do
            post :update_positions
          end
        end

        resources :music_settings do
          member do
            match :toggle
          end
        end

        resources :albums do
          collection do
            post :update_positions
          end
        end
      end
    end

  #resources :songs, :as => :music
end
