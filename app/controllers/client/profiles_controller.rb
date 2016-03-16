class Client::ProfilesController < Client::BaseController
  def show
    @jobs = current_client.jobs
    @applications = current_client.applications
    @fullname = current_client.first_name + " " + current_client.last_name
  end

  def edit
    @client = current_client.find(params[:id])
  end

  def update
    @client = params.require(:client).permit(:email,:first_name, :last_name, :company, :phone_number, :city, :address, :photo)
    @client.update!
    redirect_to client_profile_path
  end

end


