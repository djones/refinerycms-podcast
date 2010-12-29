Refinery::Application.routes.draw do
  resources :podcasts, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :podcasts, :except => :show do
      collection do
        post :update_positions
        get :settings
      end
    end
  end
  
  #match '/podcast.rss' => "podcasts/#index", :as => :podcast, :format => 'rss'
end
