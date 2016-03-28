class Client::ProfilesController < Client::BaseController
  def index
    @jobs = current_client.jobs
  end

  def new
    @job = Job.new
    @client = current_client
  end

  def create
    @job = Job.new(job_param)
    @client = current_client
    @job.client = @client
    @job.save!
    redirect_to client_job_path(@job)
  end

  def show
    # @job = current_client.jobs.find(params[:id])
    @jobs = current_client.jobs
    @applications = current_client.applications
    @fullname = current_client.first_name + " " + current_client.last_name
    @client = current_client
  end

  def edit
    @client = current_client
  end

  def update
    @client = current_client
    @client.update!(client_params)
    redirect_to client_profile_path
  end

  def destroy
    @job.destroy!
    redirect_to client_jobs_path
  end

  def close
    @job.update!(status: "Closed" )
    redirect_to client_jobs_path
  end

  def finish
    @job.update!(status: "Finished")
    redirect_to client_jobs_path
  end

  private

  def client_params
    params.require(:client).permit(:email,:first_name, :last_name, :company, :phone_number, :city, :address, :photo, :photo_cache)
  end
end
