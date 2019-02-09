class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    # Comment.newフォームを作るためのオブジェクト
    @comment.topic_id = params["topic_id"]
    # @commentとtopic_idを紐づけるために存在している。
    # @comment = params["topic_id"]で記入していると、コメントを投稿するときtopic_idを記録してくれるhidenのやつにそもそものtopic_idが空の状態になってしまう。
  end

  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:comment][:topic_id]
    comment.content = params[:comment][:content]

# binding.pry
    if comment.save
      redirect_to topics_path, success: "コメントを投稿しました"
    else
      redirect_to topics_path, danger: "コメントの投稿に失敗しました"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
