require 'spec_helper'

describe ModelCitizen::Validations do

  context "checking attributes for nil or empty values" do
    it "should return true if no attributes are nil or empty" do
      first_name_validator = ModelCitizen::Validations.new.not_nil_or_empty?(["Sylwia", "Olak", "solak", "admin"])
      expect(first_name_validator).to eq(true)
    end

    it "should return false if there are nil attributes" do
      first_name_validator = ModelCitizen::Validations.new.not_nil_or_empty?(["Sylwia", "Olak", nil, "admin"])
      expect(first_name_validator).to eq(false)
    end

    it "should return false if there are empty string attributes" do
      first_name_validator = ModelCitizen::Validations.new.not_nil_or_empty?(["Sylwia", "Olak", "solak", ""])
      expect(first_name_validator).to eq(false)
    end

    it "should return false if there are any nil or empty attributes" do
      first_name_validator = ModelCitizen::Validations.new.not_nil_or_empty?([nil, "", "6", ""])
      expect(first_name_validator).to eq(false)
    end
  end

  context "validating whether or not attribute contains a value" do
    it "should return true if selected attribute matches value argument" do
      employee_type = "admin"
      type_validator = ModelCitizen::Validations.new.value_included?("admin", "non-admin", employee_type)
      expect(type_validator).to eq(true)
    end

    it "should return false if selected attribute does not match value argument" do
      employee_type = "uncool"
      type_validator = ModelCitizen::Validations.new.value_included?("admin", "cool", employee_type)
      expect(type_validator).to eq(false)
    end

    it "should return false if attribute does not include value" do
      employee_type = "non-admin"
      type_validator = ModelCitizen::Validations.new.value_included?("admin", employee_type)
      expect(type_validator).to eq(false)
    end
  end

  context "validating date strings" do
    it "should return true if date is valid" do
      date = "2015/2/3"
      type_validator = ModelCitizen::Validations.new.valid_date?(date)
      expect(type_validator).to eq(true)
    end

    it "should return false if date is missing year" do
      date = "/2/3"
      type_validator = ModelCitizen::Validations.new.valid_date?(date)
      expect(type_validator).to eq(false)
    end

    it "should return false if date is missing month" do
      date = "2015//3"
      type_validator = ModelCitizen::Validations.new.valid_date?(date)
      expect(type_validator).to eq(false)
    end

    it "should return false if date is missing day" do
      date = "2015/2/"
      type_validator = ModelCitizen::Validations.new.valid_date?(date)
      expect(type_validator).to eq(false)
    end

    it "should return true if date is not in the future" do
      date = "2015/1/15"
      type_validator = ModelCitizen::Validations.new.valid_date?(date)
      expect(type_validator).to eq(true)
    end

    it "should return false if date is in the future" do
      date = "2016/2/3"
      type_validator = ModelCitizen::Validations.new.valid_date?(date)
      expect(type_validator).to eq(false)
    end
  end

  context "checking for duplicates" do
    it "should return true if there are no duplicates" do
      animals = ["cat", "dog", "parrot", "monkey", "ferret"]
      type_validator = ModelCitizen::Validations.new.no_duplicates?("capybara", animals)
      expect(type_validator).to eq(true)
    end

    it "should return false if there are duplicates" do
      animals = ["cat", "dog", "parrot", "monkey", "ferret"]
      type_validator = ModelCitizen::Validations.new.no_duplicates?("ferret", animals)
      expect(type_validator).to eq(false)
    end
  end
end