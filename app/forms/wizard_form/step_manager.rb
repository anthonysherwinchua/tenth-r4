module WizardForm
  class StepManager
    attr_reader :total_steps, :completed_step, :current_step

    def initialize(total_steps: 1, completed_step: 0, current_step: 0)
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

    def next_step!
      if @current_step < @completed_step
        @completed_step += 1
        @current_step += 1
      end
    end

    def last_permitted_step
      wizard_completed? ? @completed_step : next_step
    end

    def prepare_completed_step(steps, *args)
      steps.each_with_index do |step_klass, index|
        step = step_klass.new

        args_dup = args.deep_dup
        unless step.valid?(*args_dup)
          step.errors.clear
          break
        end
        set_completed_step(index + 1)
        set_current_step(next_step) if @current_step > next_step
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
      @current_step = step.zero? ? last_permitted_step : step
    end

    def ensure_valid(step)
      raise WizardForm::Errors::NotIntegerError unless step.is_a? Integer
      raise WizardForm::Errors::NegativeValueError if step < 0
    end
  end

end
