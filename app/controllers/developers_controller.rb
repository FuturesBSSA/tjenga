class DevelopersController < ApplicationController
  def index
    @developers = Developer.all
  end

  def show
    @developer = Developer.find(params[:id])
    @reviews = @developer.job_reviews
    @works = @developer.works
    @recommendations =  Recommendation.where(developer_id: @developer.id)
    @fullname = @developer.first_name + " " + @developer.last_name
  end
end
