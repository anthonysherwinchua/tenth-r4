class JobOpeningDecorator < SimpleDelegator

  def self.wrap_all(job_openings)
    job_openings.map{|jo| JobOpeningDecorator.new(jo) }
  end

  def name
    occupation.name + '@' + country.name
  end

  def class
    __getobj__.class
  end

end
