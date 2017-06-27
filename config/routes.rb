Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      match '/provinces' => 'provinces#create', :via => :post
      match '/properties' => 'properties#index', :via => :get
      match '/properties' => 'properties#create', :via => :post
      match '/properties/:id' => 'properties#show', :via => :get
    end
  end
end
