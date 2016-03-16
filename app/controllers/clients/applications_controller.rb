class Clients::ApplicationsController < ApplicationController
  before_action :find_job_application, except: (:index)
  def index
    @job_applications = Job_applications.all
  end

  def show
  end

  def accept
    @job_application.update!(status: "Accepted" )
    redirect_to client_applications_path
  end

  def decline
    @job_application.update!(status: "Declined" )
    redirect_to client_applications_path
  end

  private

  def find_job_application
    @job_application = Job_applications.find(params[:id])
  end

end
