class Admin::LanguagesController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_language, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Language.order('name asc')
  end

  def show
  end

  def new
    @current_item = Language.new
  end

  def edit
  end

  def create
    @current_item = Language.new(language_params)
    if @current_item.save
      redirect_to admin_languages_path, notice: 'Successfully created language'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(language_params)
      redirect_to admin_languages_path, notice: 'Successfully updated language'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_languages_path
  end

  private

  def prepare_language
    @current_item = Language.find(params[:id])
  end

  def language_params
    params.require(:language).permit(:name, :enabled)
  end

end
