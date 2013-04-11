Comment.config do |config|
  config.comment_class = Comment::Opinion
  config.commentable_objects = [DummyModel]
  config.displayed = 5
end
