Rails.application.routes.draw do



  resources :exams
  resources :exam_answers, :except => [ 'index','edit', 'update', 'destroy', 'new']
  get 'exam_answers/new/:exam_id' => 'exam_answers#new', :as => 'new_exam_answer'
  resources :questions do
    collection { post :import }
  end
  get '/exams_test/:exam_id', to: 'exams#take_exam', as: :take_exam
  get '/exams_list', to: 'exams#exam_list', as: :exam_list
  get '/users_ranking', to: 'exams#users_ranking', as:  :users_ranking

  root to: "course#index"
  get '/course_beg', to: 'course#beg_index', as:  :beg_course_index
  get '/course_adv', to: 'course#adv_index', as:  :adv_course_index

  get '/course_beg/branch_security', to: 'course#branch_security', as:  :branch_security
  get '/course/check_answers' => 'course#check_answers', :as => :check_answers
   devise_for :users, :controllers => { :registrations => "registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
