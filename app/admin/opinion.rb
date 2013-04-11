if defined?(ActiveAdmin) and Comment.config.engine_active_admin
  ActiveAdmin.register Comment::Opinion, {:sort_order => :created_at} do
    controller do
      cache_sweeper Comment.config.cache_sweeper if Comment.config.cache_sweeper
    end

    filter :name
    filter :text
    filter :published

    menu :label => 'Comments'

    index do
      column :name
      column :text
      column :created_at
      column :published
      column :thread

      default_actions
    end
  end
end
