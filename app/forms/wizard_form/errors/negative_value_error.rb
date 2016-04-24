module WizardForm::Errors
  class NegativeValueError < StandardError
    attr_accessor :message

    def initialize(message = 'Total steps must be above zero!')
      @message = message
    end
  end
end
