Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

  resources :post_images, only: [:new, :create, :index, :show]

  get 'homes/about' => 'homes#about', as: 'about'
end


# ec2-user:~/environment/meshiterro (main) $ rails routes
#                     Prefix Verb   URI Pattern                       Controller#Action
#           new_user_session GET    /users/sign_in(.:format)             devise/sessions#new
#               user_session POST   /users/sign_in(.:format)             devise/sessions#create
#       destroy_user_session DELETE /users/sign_out(.:format)            devise/sessions#destroy
#          new_user_password GET    /users/password/new(.:format)       devise/passwords#new
#         edit_user_password GET    /users/password/edit(.:format)      devise/passwords#edit
#              user_password PATCH  /users/password(.:format)           devise/passwords#update
#                            PUT    /users/password(.:format)           devise/passwords#update
#                            POST   /users/password(.:format)           devise/passwords#create
#   cancel_user_registration GET    /users/cancel(.:format)         devise/registrations#cancel
#      new_user_registration GET    /users/sign_up(.:format)        devise/registrations#new
#     edit_user_registration GET    /users/edit(.:format)           devise/registrations#edit
#          user_registration PATCH  /users(.:format)                devise/registrations#update
#                            PUT    /users(.:format)                devise/registrations#update
#                            DELETE /users(.:format)                devise/registrations#destroy
#                            POST   /users(.:format)                devise/registrations#create
#                       root GET    /                                              homes#top
#                      about GET    /homes/about(.:format)                         homes#about

#                post_images GET    /post_images(.:format)                   post_images#index
#             new_post_image GET    /post_images/new(.:format)               post_images#new
#                 post_image GET    /post_images/:id(.:format)               post_images#show
#                            POST   /post_images(.:format)                   post_images#create