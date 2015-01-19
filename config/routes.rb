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

  get '/course_beg/branch_security',                 to: 'course#beg_branch_security',                as:  :beg_branch_security
  get '/course_beg/branch_abc_sample',               to: 'course#beg_branch_abc_sample',              as:  :beg_branch_abc_sample
  get '/course_beg/branch_bleeding',                 to: 'course#beg_branch_bleeding',                as:  :beg_branch_bleeding
  get '/course_beg/branch_consciousness',            to: 'course#beg_branch_consciousness',           as:  :beg_branch_consciousness
  get '/course_beg/branch_scald_frostbite',          to: 'course#beg_branch_scald_frostbite',         as:  :beg_branch_scald_frostbite
  get '/course_beg/branch_hypothermia_hyperthermia', to: 'course#beg_branch_hypothermia_hyperthermia',as:  :beg_branch_hypothermia_hyperthermia
  get '/course_beg/branch_mech_injury',              to: 'course#beg_branch_mech_injury',             as:  :beg_branch_mech_injury
  get '/course_beg/branch_epilepsy',                 to: 'course#beg_branch_epilepsy',                as:  :beg_branch_epilepsy
  get '/course_beg/branch_chocking',                 to: 'course#beg_branch_chocking',                as:  :beg_branch_chocking
  get '/course_beg/branch_CPR',                      to: 'course#beg_branch_CPR',                     as:  :beg_branch_CPR
  
  get '/course_adv/branch_heart_attack',        to: 'course#adv_branch_heart_attack',         as:  :adv_branch_heart_attack
  get '/course_adv/branch_poisoning',           to: 'course#adv_branch_poisoning',            as:  :adv_branch_poisoning
  get '/course_adv/branch_foreign_body',        to: 'course#adv_branch_foreign_body',         as:  :adv_branch_foreign_body
  get '/course_adv/branch_AED',                 to: 'course#adv_branch_AED',                  as:  :adv_branch_AED
  get '/course_adv/branch_electrocution',       to: 'course#adv_branch_electrocution',        as:  :adv_branch_electrocution
  get '/course_adv/branch_blood_pressure_pulse',to: 'course#adv_branch_blood_pressure_pulse', as:  :adv_branch_blood_pressure_pulse
  get '/course_adv/branch_stroke',              to: 'course#adv_branch_stroke',               as:  :adv_branch_stroke
  get '/course_adv/branch_diabetes',            to: 'course#adv_branch_diabetes',             as:  :adv_branch_diabetes
  get '/course_adv/branch_pneumothorax',        to: 'course#adv_branch_pneumothorax',         as:  :adv_branch_pneumothorax
  get '/course_adv/branch_shock',               to: 'course#adv_branch_shock',                as:  :adv_branch_shock

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
