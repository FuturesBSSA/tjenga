class Developer::ProfilesController < Developer::BaseController
  def show
    @developer = current_developer
    @applications = current_developer.applications
  end

  def edit
    @developer = current_developer.find(params[:id])
  end

  def update
    @developer = params.require(:developer).permit(:email,:first_name, :last_name, :phone_number, :city, :address, :photo)
    @developer.update!
    redirect_to developer_profile_path
  end
end
