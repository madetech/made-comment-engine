module Comment
  InvalidCommentableTypeError = Class.new(RuntimeError)

  class CommentController < Comment::ApplicationController
    helper Comment::ApplicationHelper::FormHelper
    cache_sweeper Comment.config.cache_sweeper, :only => [:new] if Comment.config.cache_sweeper

    def thread
      setup_page

      render 'thread', :layout => false
    end

    def new
      setup_page

      if !spam_check_passed
        render_form_expanded
        return false
      end

      @new_comment.published = false

      if @new_comment.save
        flash[:notice] = t('comment.thanks')
        redirect_to comments_thread_path(params[:object], params[:object_id])
      else
        render_form_expanded
      end
    end

    private
    def setup_page
      load_object_from_string_and_id(params[:object], params[:object_id])
      build_new_comment(params[Comment.config.comment_class.to_s.demodulize.underscore.to_sym])
      fetch_comments(params[:page])
      build_new_comment_url_path(params[:object], params[:object_id], params[:page])
      set_sanitized_class_name(params[:object])
    end

    def load_object_from_string_and_id(object_str, id)
      object_class = get_object_class_from_string(object_str)
      @object = object_class.find(id.to_i)
    end

    def get_object_class_from_string(object_str)
      object_class = object_str.sub('_', '::').classify.constantize
      raise InvalidCommentableTypeError if !Comment.config.commentable_objects.include?(object_class)

      object_class
    end

    def build_new_comment(post_data)
      @new_comment = @object.comments.build(post_data)
    end

    def fetch_comments(page)
      @comments = @object.comments.where('published = ?', true).page(page).per(Comment.config.per_page)
    end

    def build_new_comment_url_path(object_str, id, page)
      @new_path = comment_create_path(object_str, id.to_i, :page => page)
    end

    def render_form_expanded
      @new_form_expanded = true
      render 'thread', :layout => false
    end

    def set_sanitized_class_name(object_str)
      @sanitized_class = object_str.downcase
    end

    def spam_check_passed
      params[:website] == "" || params[:website].to_i == 5
    end
  end
end
