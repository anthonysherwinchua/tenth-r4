class EncoderPolicy

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def access?
    @user.has_role? :encoder || @user.has_role? :admin
  end

end
