module Comment
  class CommentController < Comment::ApplicationController
    def thread
      @object_str = params[:object]
      @object_id = params[:object_id].to_i

      object = @object_str.classify.constantize.find(@object_id)
      page = params[:page].present? ? params[:page].to_i : 1

      @comments = object.comments.paginated(page)
      @new_comment = Comment::Opinion.new()

      render 'comment_thread', :layout => 'base'
    end

    def new
      @object_str = params[:object]
      @object_id = params[:object_id]
      object = @object_str.classify.constantize.find(@object_id)

      @new_comment = object.comments.build(params[:opinion])
      @new_comment.published = true

      if @new_comment.save
        redirect_to :back
      else
        render 'comment_thread', :layout => 'base'
      end
    end
  end
end
