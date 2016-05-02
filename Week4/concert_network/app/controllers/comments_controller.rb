class CommentsController < ApplicationController

  before_action :set_concert
  def new
  	@comment = @concert.comments.new
  end

  def create
  	@comment = @concert.comments.new(entry_comment_params)
  	@comment.save
  	redirect_to concert_path(@concert)

  end

  private
  def set_concert
  	@concert = Concert.find(params[:concert_id])
  end

  def entry_comment_params
	params.require(:comment).permit(:commentator, :comment)
end

end
