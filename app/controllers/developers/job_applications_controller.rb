class Developers::JobApplicationsController < ApplicationController
  before_action :set_job, only: [:show]

  def index
    @job_applications = Job.all
  end

  def show
    @fullname = Client.find(@job_application.client_id).first_name + ' ' + Client.find(@job_application.client_id).last_name
  end

  def new
    @job_applications = Job.new
  end

  def create
    @job_application = Job.find(params[:id])
    @job_application.save

    if @job_application.save
      redirect_to
    else
      render :new
    end
  end

  private

  def set_job_application
    @job_application = Job.find(params[:id])
  end
end
