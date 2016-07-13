class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.bar.user.email,
      subject: "New Review for #{review.bar.name}"
    )
  end
end
