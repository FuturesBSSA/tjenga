class Developer::WorksController < Developer::BaseController
  before_action :find_work, only: [:edit, :update, :destroy]

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_param)
    @developer = current_developer
    @work.developer = @developer
    @work.save!
    redirect_to edit_developer_profile_work_path(@developer)
  end

  def edit
  end

  def update
    @work.update!(work_param)
    redirect_to developer_profile_works_path(@work)
  end

  def destroy
    @work.destroy!
    redirect_to developer_profile__works_path(@work)
  end

  private

  def work_param
    params.require(:work).permit(:title, :description, :client_name, :website_url, :photo, :photo_cache)
  end

  def find_work
    @work = current_user.works.find(params[:id])
  end
end
