class DevelopersController < ApplicationController
  def index
    @developers = Developer.all
  end

  def show
    @developer = Developer.find(params[:id])
    @client = Client.find(params[:id])
    @reviews = @developer.job_reviews
    @recommendations =  @developer.recommendations
    @fullname = @developer.first_name + " " + @developer.last_name
  end
end
