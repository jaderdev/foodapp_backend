Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace 'api' do
	  	namespace 'v1' do
	  		resources :items, :restaurantes
	  		resources :pedidos do
	  			resources :historicos
	  		end
	  	end
	end
end
