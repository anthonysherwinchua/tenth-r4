module WizardForm::Errors
  class NotIntegerError < StandardError
    attr_accessor :message

    def initialize(message = 'Total steps must be an integer (whole numbers)!')
      @message = message
    end
  end
end
