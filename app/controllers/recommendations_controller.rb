class RecommendationsController < ApplicationController
  def new
    @recommendation = Recommendation.new
    @developer = Developer.find(params[:developer_id])

    @author = current_developer || current_client
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    developer =  Developer.find(params[:developer_id])
    @recommendation.developer = developer
    @recommendation.author = current_client || current_developer

    if @recommendation.save
      redirect_to developer_path(developer)
    else
      render :new
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:first_name, :last_name, :author_id, :title, :content, :author_type, :status)
  end
end
