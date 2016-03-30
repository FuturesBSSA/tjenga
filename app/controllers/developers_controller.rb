class DevelopersController < ApplicationController
  def index
    @developers = Developer.all

    # selected filters
    @selected_expertise = params[:expertise]
    @selected_programming_language = params[:programming_language]
    @selected_tool = params[:tool]

    if @selected_expertise
      @developers = @developers.where(expertise: @selected_expertise)
    end

    if @selected_programming_language
      @developers = @developers.joins(:programming_languages).distinct.where(programming_languages: { name: @selected_programming_language })
    end

    if @selected_tool
      @developers = @developers.joins(:tools).distinct.where(tools: { name: @selected_tool })
    end

    # available filters
    if @selected_expertise
      @available_expertises = Developer.distinct.order(:expertise).pluck(:expertise)
    else
      @available_expertises = @developers.distinct.order(:expertise).pluck(:expertise)
    end

    if @selected_programming_language
      @available_programming_languages = ProgrammingLanguage.joins(:developer).distinct.order(:name).pluck(:name)
    else
      @available_programming_languages = ProgrammingLanguage.joins(:developer).distinct.where(developers: { id: @developers.pluck(:id) }).order(:name).pluck(:name)
    end

    if @selected_tool
      @available_tools = Tool.joins(:developer).distinct.order(:name).pluck(:name)
    else
      @available_tools = Tool.joins(:developer).where(developers: { id: @developers.pluck(:id) }).distinct.order(:name).pluck(:name)
    end
  end

  def show
    @developer = Developer.find(params[:id])
    @reviews = @developer.job_reviews
    @works = @developer.works
    @recommendations =  Recommendation.where(developer_id: @developer.id)
    @fullname = @developer.first_name + " " + @developer.last_name
  end
end
