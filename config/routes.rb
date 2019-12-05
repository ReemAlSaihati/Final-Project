Rails.application.routes.draw do



  # Routes for the Bidding resource:

  # CREATE
  match("/insert_bidding", { :controller => "biddings", :action => "create", :via => "post"})
          
  # READ
  match("/biddings", { :controller => "biddings", :action => "index", :via => "get"})
  
  match("/biddings/:id_from_path", { :controller => "biddings", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_bidding/:id_from_path", { :controller => "biddings", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_bidding/:id_from_path", { :controller => "biddings", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Book resource:

  # CREATE
  match("/insert_book", { :controller => "books", :action => "create", :via => "post"})
          
  # READ
  match("/books", { :controller => "books", :action => "index", :via => "get"})
  
  match("/books/:id_from_path", { :controller => "books", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_book/:id_from_path", { :controller => "books", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_book/:id_from_path", { :controller => "books", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for signing up

  match("/user_sign_up", { :controller => "users", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form", :via => "get"})
  
  match("/user_verify_credentials", { :controller => "user_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/user_sign_out", { :controller => "user_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/post_user", { :controller => "users", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_user", { :controller => "users", :action => "edit_registration_form", :via => "get"})
  
  match("/patch_user", { :controller => "users", :action => "update", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_user_account", { :controller => "users", :action => "destroy", :via => "get"})


  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
