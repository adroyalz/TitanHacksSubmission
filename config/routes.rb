Rails.application.routes.draw do

  root 'static_pages#home'
  
  get '/info', to: 'state#info'
   get '/infoUSA', to: 'state#infoUSA'
    get '/infoChina', to: 'state#infoChina'
     get '/infoFrance', to: 'state#infoFrance'
      get '/infoGermany', to: 'state#infoGermany'
       get '/infoItaly', to: 'state#infoItaly'
        get '/infoSpain', to: 'state#infoSpain'
        
  post '/downloadInfo', to: 'state#downloadCSV'
  
  get '/import_from_excel', to: 'state#go_here'
  post '/import_from_excel' => "state#import_from_excel"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
