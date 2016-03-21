class DevelopersController < ApplicationController
  def index
    @developers = Developer.all
  end

  def show
    @developer = Developer.find(params[:id])
    @reviews = @developer.job_reviews
    @recommendations = Recommendation.all
  end
end
