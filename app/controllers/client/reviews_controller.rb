class Client::ReviewsController < ApplicationController

  def new
    @job = current_client.jobs.find(params[:job_id])
    @review = Review.new
  end

  def create
    @job = current_client.jobs.find(params[:job_id])
    @review = Review.new(review_params)
    @review.job = @job
    @review.author = current_client

    if @review.valid?
      @review.save!
      redirect_to developer_path(@job.accepted_developer)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
