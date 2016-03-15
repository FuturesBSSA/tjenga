class JobsController < ActionController::Base
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job.create!(job_param)
    redirect_to client_job_path(@job)
  end

  def edit
  end

  def update
    @job.update!(job_param)
    redirect_to client_job_path(@job)
  end

  def destroy
    @job.destroy!
    redirect_to client_jobs_path
  end

  private

  def find_job
    Job.find(params[:id])
  end

  def job_param
    params.require(:job).permit(:title, :description, :difficulty_level, :budget, :duration, :start_date, :deadline, :request_type]
    end)
  end

end
