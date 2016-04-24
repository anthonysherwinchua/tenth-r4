module WizardForm::Base

  attr_reader :step_manager

  def self.included(base)
    class << base
      alias_method :__new, :new
      def new(*args)
        e = __new(*args)
        e.prepare_step_manager
        e.step_manager.prepare_completed_step(self::STEPS, args.first)
        e.step_manager.current_step = args.second
        e
      end
    end
  end

  def prepare_step_manager
    @step_manager = WizardForm::StepManager.new(total_steps: steps.count, completed_step: 0, current_step: 1)
  end

  def current_wizard_step
    steps[@current_step-1]
  end

  def steps
    raise WizardForm::StepsNotSetup
  end

  def save(params={})
    steps[@current_step].new(params).save
  end
end
