class JobsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
    @client = Client.find(@job.client_id)
    @full_name = @job.client.first_name + " " + @job.client.last_name
  end
end

