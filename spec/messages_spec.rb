require "spec_helper"

describe ModelCitizen::Messages do

  context "displaying error messages" do

    it "should return an error if username is invalid" do
      type_validator = ModelCitizen::Messages.new.get_message(:invalid_username)
      expect(type_validator).to eq("That is not a valid username, please try again")
    end

    it "should return an error if timesheet is invalid" do
      type_validator = ModelCitizen::Messages.new.get_message(:invalid_timesheet)
      expect(type_validator).to eq("That is not a valid timesheet, please try again")
    end

    it "should return an error if client is invalid" do
      type_validator = ModelCitizen::Messages.new.get_message(:invalid_client)
      expect(type_validator).to eq("That is not a valid client, please try again")
    end

    it "should return an error if employee is invalid" do
      type_validator = ModelCitizen::Messages.new.get_message(:invalid_employee)
      expect(type_validator).to eq("That is not a valid employee, please try again")
    end

    it "should return an error for logging time in the future" do
      type_validator = ModelCitizen::Messages.new.get_message(:future_date_error)
      expect(type_validator).to eq("You cannot log time for the future, please select a different date")
    end
  end

  context "displaying success messages" do

    it "should return a success message if timesheet is valid" do
      type_validator = ModelCitizen::Messages.new.get_message(:timesheet_success)
      expect(type_validator).to eq("Your timesheet has been successfully saved")
    end

    it "should return a success message if client is valid" do
      type_validator = ModelCitizen::Messages.new.get_message(:client_success)
      expect(type_validator).to eq("Client has been successfully saved")
    end

    it "should return a success message if employee is valid" do
      type_validator = ModelCitizen::Messages.new.get_message(:employee_success)
      expect(type_validator).to eq("Employee has been successfully saved")
    end
  end
end