class VotesController < ApplicationController
  def create
  @review = Review.find(params[:review_id])
  @bar = @review.bar
  @vote = Vote.new(vote_params)
  @vote.review = @review
  @vote.user_id = current_user.id
  @previous_vote = @review.votes.find_by(user_id: current_user.id)
    if !@previous_vote.nil?
      if @previous_vote.upvote == @vote.upvote
        Vote.destroy(@previous_vote.id)
        flash[:errors] = "Vote destroyed"
      else
        Vote.destroy(@previous_vote.id)
        @vote.save
        @review.save
        flash[:notice] = "You switched your vote!"
      end
      redirect_to bar_path(@bar)
    else
      @vote.save
      @review.save
      flash[:notice] = "Voted!"
      redirect_to bar_path(@bar)
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:upvote)
  end
end
