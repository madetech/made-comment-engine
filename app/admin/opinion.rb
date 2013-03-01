if defined?(ActiveAdmin)
  ActiveAdmin.register Comment::Opinion do
    controller do
      cache_sweeper Comment.config.cache_sweeper if Comment.config.cache_sweeper
    end

    filter :pubished
    filter :start_at
    filter :end_at

    menu :label => 'Comments'

    index do
      column :name
      column :text
      column :updated_at

      default_actions
    end
  end
end
