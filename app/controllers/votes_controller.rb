class VotesController < ApplicationController
  def create
      @upvote = Upvote.new(secure_params)
      @upvote.review = Review.find(params[:review_id])
      if @upvote.save
        respond_to do |format|
          format.html { redirect_to @upvote.post }
          format.js # we'll use this later for AJAX!
        end
      end
    end

    private
      def secure_params
        params.require(:upvote).permit(:user)
      end
  end
