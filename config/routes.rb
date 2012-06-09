TodoList::Application.routes.draw do
  resources :lists 

  devise_for :users

	match "share_list" => "lists#share_list"

	root :to => "welcome#index"
end
