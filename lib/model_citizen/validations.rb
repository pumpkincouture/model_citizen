require 'date'
module ModelCitizen
  class Validations

    def not_nil_or_empty?(attributes)
      !attributes.include?(nil) && !attributes.include?("")
    end

    def value_included?(*value, attribute)
      [*value].include? attribute
    end

    def valid_date?(date)
      valid_string?(date) && past_date?(date)
    end

    def get_this_month
      Date.today.month.to_s
    end

    def no_duplicates?(value, data_structure)
      !data_structure.include? value
    end

    private

    def valid_string?(date)
      y, m, d = date.split '/'
      return false if y.to_i == 0
      Date.valid_date? y.to_i, m.to_i, d.to_i
    end

    def past_date?(date)
      Date.parse(date) < Date.today
    end
  end
end