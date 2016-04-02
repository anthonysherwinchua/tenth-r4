class Admin::OccupationsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_occupation, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Occupation.order('name asc')
  end

  def show
  end

  def new
    @current_item = Occupation.new
  end

  def edit
  end

  def create
    @current_item = Occupation.new(occupation_params)
    if @current_item.save
      redirect_to admin_occupations_path, notice: 'Successfully created occupation'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(occupation_params)
      redirect_to admin_occupations_path, notice: 'Successfully updated occupation'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_occupations_path
  end

  private

  def prepare_occupation
    @current_item = Occupation.find(params[:id])
  end

  def occupation_params
    params.require(:occupation).permit(:name, :enabled)
  end

end
