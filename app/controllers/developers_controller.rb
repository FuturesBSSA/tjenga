class DevelopersController < ApplicationController
  def index
    @developers = Developer.all
  end

  def show
    @developer = Developer.find(params[:id])
    @reviews = @developer.job_reviews
    @recommendations =  @developer.recommendations
    @fullname = current_developer.first_name + " " + current_developer.last_name
  end
end
