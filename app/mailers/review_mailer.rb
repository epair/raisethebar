class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    if @review.bar.user
      mail(
      to: @review.bar.user.email,
      subject: "New Review for #{@review.bar.name}"
      )
    end
  end
end
