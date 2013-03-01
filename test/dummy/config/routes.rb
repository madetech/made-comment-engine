Rails.application.routes.draw do

  mount Comment::Engine => "/comment"
end
