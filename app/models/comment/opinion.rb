module Comment
  class Opinion < ActiveRecord::Base
    belongs_to                :thread, :polymorphic => true

    attr_accessible           :first_name,
                              :email,
                              :last_name,
                              :text,
                              :published,
                              :thread_type

    validates_presence_of     :first_name,
                              :last_name,
                              :email,
                              :text

    validates_format_of       :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

    default_scope             :order => 'created_at DESC'

    scope                     :is_published, where(:published => true)
    scope                     :isnt_published, where(:published => false)

    def name
      "#{self.first_name} #{ self.last_name }"
    end

    def self.paginated(view_page)
      is_published.page view_page
    end

    def to_s
      name
    end
  end
end
