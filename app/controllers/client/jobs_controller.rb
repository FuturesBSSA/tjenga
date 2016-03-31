class Client::JobsController < Client::BaseController
  before_action :find_job, only: [:show, :edit, :update, :destroy, :close, :finish]

  def index
    @jobs = current_client.jobs
  end

  def show
  end

  def new
    @job = Job.new
    @client = current_client
  end

  def create
    @job = Job.new(job_param)
    @client = current_client
    @job.client = @client
    if @job.save!
      flash[:success] = "You successfully created a job!"
      redirect_to client_job_path(@job)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @job.update!(job_param)
    redirect_to client_job_path(@job)
  end

  def destroy
    binding.pry
    @job.destroy!
    redirect_to client_jobs_path
  end

  def close
    @job.update!(status: "Closed" )
    redirect_to client_jobs_path
  end

  def finish
    @job.update!(status: "Finished")
    redirect_to client_job_path(@job)
  end

  private

  def find_job
    @job = current_client.jobs.find(params[:id])
  end

  def job_param
    params.require(:job).permit(:title, :description, :difficulty_level, :budget, :duration, :start_date, :deadline, :request_type)
  end

end
