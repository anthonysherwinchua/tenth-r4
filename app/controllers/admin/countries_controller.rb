class Admin::CountriesController < Admin::BaseController

  before_action :prepare_country, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Country.order('name asc')
  end

  def show
  end

  def new
    @current_item = Country.new
  end

  def edit
  end

  def create
    @current_item = Country.new(country_params)
    if @current_item.save
      redirect_to admin_countries_path, notice: 'Successfully created country'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(country_params)
      redirect_to admin_countries_path, notice: 'Successfully updated country'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_countries_path
  end

  private

  def prepare_country
    @current_item = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name)
  end

end
