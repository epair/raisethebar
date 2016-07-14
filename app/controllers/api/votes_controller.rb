class Api::VotesController < ApplicationController

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
        current_count = {data: @review.vote_counter(@review.votes)}
        render json: current_count
      else
        Vote.destroy(@previous_vote.id)
        @vote.save
        @review.save
        current_count = {data: @review.vote_counter(@review.votes)}
        render json: current_count
      end
    else @vote.save
      @review.save
      current_count = {data: @review.vote_counter(@review.votes)}
      render json: current_count
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:upvote)
  end
end
