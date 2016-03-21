class ProgrammingLanguagesController < ApplicationController
  before_action :set_developer, only: [:new, :create]

  def index
    @programminglanguages = Programminglanguage.all
  end

  def new
    @programminglanguage = @developer.programminglanguages.new
  end

  def create
    @programminglanguage = @developer.programminglanguages.new(programminglanguage_params)

    if @programminglanguage.save
      redirect_to edit_developer_profile_path(@developer.id)
    else
      render :new
    end
  end

  def destroy
    @programminglanguage.destroy!
    redirect_to developer_profile_path(@developer)
  end

  def edit
  end

  def update
    @Programminglanguage.update!(programminglanguage_params)
    redirect_to edit_developer_profile_path(@developer)
  end

  private

  def programminglanguage_params
    params.require(:programminglanguage).permit(:name, :level, :description)
  end

  def set_developer
    @developer = Developer.find(params[:developer_id])
  end
end
