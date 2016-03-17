class Developer::ApplicationsController < Developer::BaseController
  before_action :set_job, only: [:new, :create]

  def index
    @applications = current_developer.applications.all
  end

  def show
    # @fullname = Client.find(@application.client_id).first_name + ' ' + Client.find(@application.client_id).last_name
    @application = Application.find(params[:id])
  end

  def new
    @applications = @job.applications.new
    @developer = current_developer
  end

  def create
    @application = @job.applications.new(application_param)
    @application.developer = current_developer

    if @application.save
      redirect_to developer_application_path(@application)
    else
      render :new
    end
  end

  private

  def application_param
    params.require(:application).permit(:motivation, :price)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
end
