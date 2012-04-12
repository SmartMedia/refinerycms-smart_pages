Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :smart_pages do
    resources :smart_pages, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :smart_pages, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :smart_pages, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
