class Admin::UsersController < Admin::BaseController

  before_action :prepare_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order('email asc')
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: 'Successfully created user'
    else
      flash.now[:error] = @user.errors
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: 'Successfully updated user'
    else
      flash.now[:error] = @user.errors
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def prepare_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email)
  end

end
