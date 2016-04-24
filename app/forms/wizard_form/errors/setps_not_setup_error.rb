module WizardForm::Errors
  class StepNotSetupError < StandardError
    attr_accessor :message

    def initialize(message = 'Steps are not setup!')
      @message = message
    end
  end
end
