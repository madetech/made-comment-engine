require 'kaminari'

module Comment
  class Engine < ::Rails::Engine
    isolate_namespace Comment
  end
end
