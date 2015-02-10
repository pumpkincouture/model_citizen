require "model_citizen/version"
require "model_citizen/messages"
require 'date'

module ModelCitizen
  def self.not_nil_or_empty?(attributes)
    !attributes.include?(nil) && !attributes.include?("")
  end

  def self.value_included?(*value, attribute)
    [*value].include? attribute
  end

  def self.valid_date?(date)
    valid_string?(date) && past_date?(date)
  end

  def self.no_duplicates?(value, data_structure)
    !data_structure.include? value
  end

  def self.get_message(message_choice)
    ModelCitizen::Messages.new.get_message(message_choice)
  end

  private

  def self.valid_string?(date)
    y, m, d = date.split '/'
    return false if y.to_i == 0
    Date.valid_date? y.to_i, m.to_i, d.to_i
  end

  def self.past_date?(date)
    Date.parse(date) < Date.today
  end
end
