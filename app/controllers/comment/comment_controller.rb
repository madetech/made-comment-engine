module Comment
  class CommentController < Comment::ApplicationController
    helper Comment::ApplicationHelper::FormHelper

    def thread
      setup_page

      render 'thread', :layout => false
    end

    def new
      setup_page

      @new_comment.published = true

      if @new_comment.save
        @comments = @object.comments.paginated(1)
        redirect_to comments_thread_path(params[:object], params[:object_id])
      else
        @new_form_expanded = true
        render 'thread', :layout => false
      end
    end

    private
    def setup_page
      @object = params[:object].classify.constantize.find(params[:object_id].to_i)
      @new_comment = @object.comments.build(params[:opinion])
      @comments = @object.comments.paginated(params[:page])
      @new_path = comment_create_path(params[:object], params[:object_id].to_i, :page => params[:page])
    end
  end
end
