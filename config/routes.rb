Refinery::Application.routes.draw do
  resources :music, :as => :albums, :controller => :albums, :only => [:index, :show] do
    resources :songs, :only => :show
  end
  
  #resources :songs, :as => :music
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    
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
    resources :songs, :only => :index do
      collection do
        post :update_positions
      end
    end
  end
end




