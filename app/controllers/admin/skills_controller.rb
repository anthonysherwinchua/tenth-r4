class Admin::SkillsController < Admin::BaseController

  before_action :prepare_skill, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Skill.order('name asc')
  end

  def show
  end

  def new
    @current_item = Skill.new
  end

  def edit
  end

  def create
    @current_item = Skill.new(skill_params)
    if @current_item.save
      redirect_to admin_skills_path, notice: 'Successfully created skill'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(skill_params)
      redirect_to admin_skills_path, notice: 'Successfully updated skill'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_skills_path
  end

  private

  def prepare_skill
    @current_item = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name)
  end

end
