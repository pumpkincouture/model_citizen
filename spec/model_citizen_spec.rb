require 'spec_helper'

describe ModelCitizen do
  context "checking attributes for nil or empty values" do
    it "should return true if no attributes are nil or empty" do
      first_name_validator = ModelCitizen.not_nil_or_empty?(["Sylwia", "Olak", "solak", "admin"])
      expect(first_name_validator).to eq(true)
    end

    it "should return false if there are nil attributes" do
      first_name_validator = ModelCitizen.not_nil_or_empty?(["Sylwia", "Olak", nil, "admin"])
      expect(first_name_validator).to eq(false)
    end

    it "should return false if there are empty string attributes" do
      first_name_validator = ModelCitizen.not_nil_or_empty?(["Sylwia", "Olak", "solak", ""])
      expect(first_name_validator).to eq(false)
    end
  end

  context "validating whether or not attribute contains a value" do
    it "should return true if selected attribute matches value argument" do
      employee_type = "admin"
      type_validator = ModelCitizen.value_included?("admin", "non-admin", employee_type)
      expect(type_validator).to eq(true)
    end

    it "should return false if selected attribute does not match value argument" do
      employee_type = "uncool"
      type_validator = ModelCitizen.value_included?("admin", "cool", employee_type)
      expect(type_validator).to eq(false)
    end
  end
end