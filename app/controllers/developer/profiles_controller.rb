class Developer::ProfilesController < Developer::BaseController
  def show
    @developer = current_developer
    @applications = current_developer.applications
    @reviews = @developer.job_reviews
    @fullname = current_developer.first_name + " " + current_developer.last_name
  end

  def edit
    @developer = current_developer
  end

  def update
    @developer = current_developer
    @developer.update!(find_params)
    redirect_to developer_profile_path
  end

  private

  def find_params
    @developer = params.require(:developer).permit(
      :email,
      :first_name,
      :last_name,
      :phone_number,
      :city,
      :address,
      :photo, :photo_cache,
      programming_languages_attributes: [:id, :name, :level, :_destroy],
      tools_attributes: [:id, :name, :_destroy]
    )
  end
end
