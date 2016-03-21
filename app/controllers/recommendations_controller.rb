class RecommendationsController < ApplicationController
  def new
    @recommendation = Recommendation.new
    @developer = Developer.find(params[:developer_id])
  end

  def create
    @recommendation = Recommendation.new

    @client = current_client
    @developer = Developer.find(params[:developer_id])

    if @recommendation.save
      redirect_to developer_path(@developer)
    else
      render :new
    end
  end
end
