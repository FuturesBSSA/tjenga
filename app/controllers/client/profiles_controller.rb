class Client::ProfilesController < Client::BaseController
  def show
    @jobs = current_client.jobs
    @applications = current_client.applications
    @fullname = current_client.first_name + " " + current_client.last_name
  end

  def edit
    @client = current_client
  end

  def update
    @client = current_client
    @client.update!(client_params)
    redirect_to client_profile_path
  end

  private

  def client_params
    params.require(:client).permit(:email,:first_name, :last_name, :company, :phone_number, :city, :address, :photo)
  end
end
