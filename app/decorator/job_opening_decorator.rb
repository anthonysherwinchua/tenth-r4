class JobOpeningDecorator < SimpleDelegator

  def name
    occupation.name + '@' + country.name
  end

  def class
    __getobj__.class
  end

end
