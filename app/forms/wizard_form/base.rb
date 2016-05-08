module WizardForm::Base

  attr_reader :step_manager, :current_wizard_step_instance
  attr_accessor :model

  def self.included(base)
    class << base
      alias_method :__new, :new
      def new(*args)
        e = __new(*args)
        e.prepare_step_manager
        e.step_manager.prepare_completed_step(self::STEPS, args.first)
        e.model = args.first
        e.step_manager.current_step = args.second.to_i
        e.prepare_current_wizard_step_instance(e.model)
        e
      end
    end
  end

  def prepare_step_manager
    @step_manager = WizardForm::StepManager.new(total_steps: steps.count, completed_step: 0, current_step: 1)
  end

  def prepare_current_wizard_step_instance(model)
    @current_wizard_step_instance = current_wizard_step.new(model)
  end

  def current_wizard_step
    steps[@step_manager.current_step-1]
  end

  def steps
    raise WizardForm::StepsNotSetup
  end

  def save(params={})
    status = @current_wizard_step_instance.save(params)
    if status
      @step_manager.next_step!
    end
    status
  end

  def errors
    @current_wizard_step_instance.errors
  end
end
