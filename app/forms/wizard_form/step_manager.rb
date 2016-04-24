module WizardForm
  class StepManager
    attr_reader :total_steps, :completed_step, :current_step

    def initialize(total_steps: 1, completed_step: 0, current_step: 1)
      set_total_steps total_steps
      set_completed_step completed_step
      set_current_step current_step
    end

    def current_step=(step)
      set_current_step step
    end

    def wizard_completed?
      @completed_step == @total_steps
    end

    def step_completed?(step)
      step <= @completed_step
    end

    alias_method :step_unlocked?, :step_completed?

    def next_step
      @completed_step + 1
    end

    def last_permitted_step
      wizard_completed? ? @completed_step : next_step
    end

    def prepare_completed_step(steps, model)
      steps.each_with_index do |step, index|
        strong_params = step.strong_params
        attrs = model.attributes.select{|key, _value| strong_params.include?(key.to_sym) }
        step = step.new(attrs)
        break unless step.valid?
        @completed_step = index+1
      end
    end

    private

    def set_total_steps(steps)
      ensure_valid(steps)
      @total_steps = steps
    end

    def set_completed_step(step)
      ensure_valid(step)
      @completed_step = step
    end

    def set_current_step(step)
      ensure_valid(step)
      raise WizardForm::Errors::NotPermittedError unless step <= last_permitted_step
      raise WizardForm::Errors::ZeroValueError if step < 1
      @current_step = step
    end

    def ensure_valid(step)
      raise WizardForm::Errors::NotIntegerError unless step.is_a? Integer
      raise WizardForm::Errors::NegativeValueError if step < 0
    end
  end

end
