class CommentController < ApplicationController
  def create
    @thankscard = ThanksCard.find(params[:comment][:thankscard_id])
    @comment = current_user.comments.build(comment_content: params[:comment][:message])
    @comment.thanks_card = @thankscard
    if @comment.save
      render partial: "comment/comment", locals: { comment: @comment }
    else
      @comments = @thankscard.comments
      render partial: "comment/comment", collection: @comments 
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_content: params[:comment][:message])
    render partial: "comment/comment", locals: { comment: @comment }
  end
end
