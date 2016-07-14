class VotesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @bar = @review.bar
    @vote = Vote.new(vote_params)
    @vote.review = @review
    @vote.user = current_user


     if @vote.save
      if @vote.upvote == true
         @review.vote_count += 1
      elsif @vote.upvote == false
        @review.vote_count -= 1
     end
     @review.save
     flash[:notice] = "Voted"
     redirect_to bar_path(@bar)
    end

  end

  private
    def vote_params
      params.require(:vote).permit(:upvote)
    end
end
