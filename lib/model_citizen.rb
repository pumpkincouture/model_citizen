require "model_citizen/version"

module ModelCitizen
  def self.not_nil_or_empty?(attributes)
    !attributes.include?(nil) && !attributes.include?("")
  end

  def self.value_included?(*value, attribute)
    [*value].include? attribute
  end
end
