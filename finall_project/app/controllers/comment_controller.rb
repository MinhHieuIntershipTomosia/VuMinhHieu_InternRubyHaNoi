class CommentController < ApplicationController
  def create
    @thankscard = ThanksCard.find(params[:comment][:thankscard_id])
    @comment = current_user.comments.build(comment_content: params[:comment][:message])
    @comment.thanks_card = @thankscard
    if @comment.save
      @comments = @thankscard.comments
      render partial: "comment/comment", locals: { comment: @comments }
    else
      @comments = @thankscard.comment
      render partial: "comment/comment", locals: { comment: @comments }
    end
  end
end
