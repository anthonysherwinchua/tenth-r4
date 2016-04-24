module WizardForm::Errors
  class NotPermittedError < StandardError
    attr_accessor :message

    def initialize(message = 'Step is not permitted!')
      @message = message
    end
  end
end
