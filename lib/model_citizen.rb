require "model_citizen/version"

module ModelCitizen
  def self.valid_name?(first_name, last_name)
    !first_name.nil? && !first_name.empty? &&
    !last_name.nil? && !last_name.empty?
  end
end
