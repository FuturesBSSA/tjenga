class Client::ApplicationsController < Client::BaseController
  before_action :find_job_application, except: (:index)
  def index
    @applications = current_client.applications
  end

  def show
  end

  def accept
    @application.update!(status: "Accepted" )
    redirect_to client_applications_path
  end

  def decline
    @application.update!(status: "Declined" )
    redirect_to client_applications_path
  end

  private

  def find_application
    @application = Applications.find(params[:id])
  end

end