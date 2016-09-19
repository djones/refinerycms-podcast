Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :podcasts do
    resources :podcasts, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :podcasts, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :podcasts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
