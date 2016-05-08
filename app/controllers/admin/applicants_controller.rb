class Admin::ApplicantsController < Admin::BaseController
  before_action :authorize_encoder_access?

  before_action :prepare_applicant, only: [:show, :new, :edit, :create, :update]
  before_action :prepare_wizard, only: [:show, :new, :edit, :create, :update]

  def index
    @current_items = Applicant.all
  end

  def new; end

  def edit; end

  def create
    if @wizard_form.save(applicant_params)
      redirect_to edit_admin_applicant_path(id: @wizard_form.applicant, step: @wizard_form.step_manager.next_step)
    else
      flash[:error] = @wizard_form.errors.full_messages
      render :new
    end
  end

  def update
    if @wizard_form.save(applicant_params)
      redirect_to edit_admin_applicant_path(id: @wizard_form.applicant, step: @wizard_form.step_manager.next_step)
    else
      flash[:error] = @wizard_form.errors.full_messages
      render :edit
    end
  end

  private

  def prepare_applicant
    @applicant = Applicant.where(id: params[:id]).first_or_initialize
  end

  def prepare_wizard
    @wizard_form = ApplicantWizardForm::BaseForm.new(@applicant, params[:step])
  end

  def applicant_params
    params.require(:applicant).permit(@wizard_form.current_wizard_step.strong_params)
  end
end
