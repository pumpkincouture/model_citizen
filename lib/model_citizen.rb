require 'model_citizen/version'
require 'model_citizen/messages'
require 'model_citizen/validations'
require 'date'

module ModelCitizen

  def self.not_nil_or_empty?(attributes)
    ModelCitizen::Validations.new.not_nil_or_empty?(attributes)
  end

  def self.value_included?(*value, attribute)
    ModelCitizen::Validations.new.value_included?(*value, attribute)
  end

  def self.valid_date?(date)
    ModelCitizen::Validations.new.valid_date?(date)
  end

  def self.no_duplicates?(value, data_structure)
    ModelCitizen::Validations.new.no_duplicates?(value, data_structure)
  end

  def self.get_message(message_choice)
    ModelCitizen::Messages.new.get_message(message_choice)
  end
end

