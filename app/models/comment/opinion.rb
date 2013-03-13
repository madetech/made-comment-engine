module Comment
  class Opinion < ActiveRecord::Base
    belongs_to                :thread, :polymorphic => true

    attr_accessible           :name,
                              :text,
                              :published

    validates_presence_of     :name,
                              :text

    default_scope             :order => 'created_at DESC'

    def self.paginated(view_page)
      where('published = ?', true).page view_page
    end

    def to_s
      name
    end
  end
end
