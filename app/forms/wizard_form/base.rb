module WizardForm::Base

  attr_reader :step_manager, :current_wizard_step_instance

  def self.included(base)
    class << base
      alias_method :__new, :new
      def new(args={})
        step = args.delete(:step).to_i
        e = __new
        e.prepare_step_manager
        e.step_manager.prepare_completed_step(self::STEPS, args)
        e.step_manager.current_step = (step == 0 ? e.step_manager.last_permitted_step : step)
        e.prepare_current_wizard_step_instance(args)
        e
      end
    end
  end

  def prepare_step_manager
    @step_manager = WizardForm::StepManager.new(total_steps: steps.count, completed_step: 0, current_step: 1)
  end

  def prepare_current_wizard_step_instance(*args)
    @current_wizard_step_instance = current_wizard_step.new(*args)
  end

  def current_wizard_step
    steps[@step_manager.current_step-1]
  end

  def steps
    raise WizardForm::StepsNotSetup
  end

  def save(params)
    status = @current_wizard_step_instance.save(params)
    if status
      @step_manager.next_step!
    end
    status
  end

end
