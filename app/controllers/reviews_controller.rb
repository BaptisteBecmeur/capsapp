class ReviewsController < ApplicationController

   def create
       @review = current_user.reviews.create(review_params)
       redirect_to @review.prestation
   end

   def destroy
       @review = Review.find(params[:id])
       prestation = @review.prestation
       @review.destroy
       redirect_to prestation
   end

   private
   def review_params
       params.require(:review).permit(:comment, :star, :prestation_id)
   end

end
