SampleBastionPlugin::Engine.routes.draw do
  scope :sample_bastion_plugin, :path => '/sample_bastion_plugin' do
    namespace :api do
      scope "(:api_version)", :module => :v2, :defaults => {:api_version => 'v2'}, :api_version => /v2/, :constraints => ApiConstraints.new(:version => 2, :default => true) do
        resources :samples, :only => [:index, :create, :show, :update, :destroy] do
          get :auto_complete_search, :on => :collection
        end
      end
    end
  end
end
