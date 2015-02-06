require 'spec_helper'

describe ModelCitizen do
  context "validating first and last name attributes" do
    it "should return true if employee first and last name is valid" do
      first_name_validator = ModelCitizen.valid_name?("Sylwia", "Olak")
      expect(first_name_validator).to eq(true)
    end

    it "should return false if employee first name is empty string" do
      first_name_validator = ModelCitizen.valid_name?("", "Olak")
      expect(first_name_validator).to eq(false)
    end

    it "should return false if employee last name is nil" do
      first_name_validator = ModelCitizen.valid_name?("Sylwia", nil)
      expect(first_name_validator).to eq(false)
    end

    it "should return false if employee last name and first name are nil" do
      first_name_validator = ModelCitizen.valid_name?(nil, nil)
      expect(first_name_validator).to eq(false)
    end

    it "should return false if employee last name and first name are empty" do
      first_name_validator = ModelCitizen.valid_name?("", "")
      expect(first_name_validator).to eq(false)
    end
  end
end