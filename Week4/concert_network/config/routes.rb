Rails.application.routes.draw do
   
   post '/concerts/search_by_price/', to: 'concerts#search_by_price'

   resources :concerts do
    resources :comments
   end

    
end
