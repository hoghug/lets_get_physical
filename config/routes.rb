Fitness::Application.routes.draw do
   match('exercises', { :via => :get, :to => 'exercises#index'})
   match('exercises/new', { :via => :get, :to => 'exercises#new'})
   match('exercises/:slug', { :via => :get, :to => 'exercises#show'})
   match('exercises', { :via => :post, :to => 'exercises#create'})
   match('exercises/:slug/edit', { :via => :get, :to => 'exercises#edit'})
   match('exercises/:slug', { :via => [:patch, :put], :to => 'exercises#update'})
   match('exercises/:slug', :via => :delete, :to => 'exercises#destroy')
end
