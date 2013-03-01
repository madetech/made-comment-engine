class DummyModel < ActiveRecord::Base
  attr_accessible                 :name

  has_many                        :comments, :class_name => Comment::Opinion, :as => :thread
  accepts_nested_attributes_for   :comments
end
