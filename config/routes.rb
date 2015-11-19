Comment::Engine.routes.draw do
  match '/:object/:object_id', :to => 'comment#thread', :as => 'comments_thread', :via => [:get], :constraints => { :format => :html }
  match '/:object/:object_id', :to => 'comment#new',    :as => 'comment_create',  :via => [:post], :constraints => { :format => :html }
end
