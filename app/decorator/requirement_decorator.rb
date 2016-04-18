class RequirementDecorator < SimpleDelegator

  def self.wrap(collection)
    collection.map do |obj|
      new obj
    end
  end

  def job_opening
    JobOpeningDecorator.new(__getobj__.job_opening)
  end

  def name
    document.name + ' for ' + job_opening.name
  end

  def country_name
    job_opening.country.name
  end

  def occupation_name
    job_opening.occupation.name
  end
end
