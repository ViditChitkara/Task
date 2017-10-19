Rails.application.routes.draw do
  get 'all_mails/index'
  get 'all_mails/show/:id'=>'all_mails#show', as: 'mails_show'

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "home#index"
  get '/view/:id' => 'tracking#image', as: 'tracking_image'
  post '/file_upload' => 'home#file_upload'
end
