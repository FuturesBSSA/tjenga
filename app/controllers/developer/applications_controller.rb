class Developer::ApplicationsController < Developer::BaseController
  before_action :set_job, only: [:show]

  def index
    @applications = Job.all
  end

  def show
    @fullname = Client.find(@application.client_id).first_name + ' ' + Client.find(@application.client_id).last_name
  end

  def new
    @applications = Job.new
  end

  def create
    @application = Job.find(params[:id])
    @application.save

    if @application.save
      redirect_to
    else
      render :new
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end
end
