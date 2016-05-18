class BaseForm
  include ActiveModel::Model

  def initialize(params = {})
    super(params)
  end
end
