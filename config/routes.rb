Rails.application.routes.draw do

  root to: "homes#top"
  devise_for :users
  get 'homes/about' => 'homes#about', as: 'about'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
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
#                            DELETE /post_images/:id(.:format)               post_images#destroy
#                  edit_user GET    /users/:id/edit(.:format)                     users#edit
#                       user GET    /users/:id(.:format)                          users#show
#                            PATCH  /users/:id(.:format)                          users#update
#                            PUT    /users/:id(.:format)                          users#update
#   post_image_post_comments POST   /post_images/:post_image_id/post_comments(.:format)           post_comments#create
#    post_image_post_comment DELETE /post_images/:post_image_id/post_comments/:id(.:format)       post_comments#destroy
#        post_image_favorite DELETE /post_images/:post_image_id/favorite(.:format)                    favorites#destroy
#                            POST   /post_images/:post_image_id/favorite(.:format)                    favorites#create
