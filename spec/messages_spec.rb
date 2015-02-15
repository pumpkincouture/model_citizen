require "spec_helper"

describe ModelCitizen::Messages do

  context "displaying messages" do
    it "should return a prompt to enter username" do
      type_validator = ModelCitizen::Messages.new.get_message("username_prompt")
      expect(type_validator).to eq("Please enter your username to get started")
    end

    it "should return a choose action message" do
      type_validator = ModelCitizen::Messages.new.get_message("choose_action")
      expect(type_validator).to eq("Please select what you'd like to do")
    end

    it "should return an error message" do
      type_validator = ModelCitizen::Messages.new.get_message("invalid_choice")
      expect(type_validator).to eq("That is not a valid choice, please try again")
    end

    it "should return a prompt to enter employee first name" do
      type_validator = ModelCitizen::Messages.new.get_message("enter_employee_first")
      expect(type_validator).to eq("Please enter employee first name")
    end

    it "should return a prompt to enter employee last name" do
      type_validator = ModelCitizen::Messages.new.get_message("enter_employee_last")
      expect(type_validator).to eq("Please enter employee last name")
    end

    it "should return a prompt tp enter employee username" do
      type_validator = ModelCitizen::Messages.new.get_message("enter_employee_username")
      expect(type_validator).to eq("Please enter employee username")
    end

    it "should return a prompt to enter employee type" do
      type_validator = ModelCitizen::Messages.new.get_message("enter_employee_type")
      expect(type_validator).to eq("Please enter employee type (admin or non-admin)")
    end

    it "should return a prompt to enter client name" do
      type_validator = ModelCitizen::Messages.new.get_message("enter_client_name")
      expect(type_validator).to eq("Please enter client name")
    end

    it "should return a prompt for client type" do
      type_validator = ModelCitizen::Messages.new.get_message("enter_client_type")
      expect(type_validator).to eq("Please enter client type (if regular client, please enter 'standard')")
    end

    it "should return a prompt to input the date" do
      type_validator = ModelCitizen::Messages.new.get_message("enter_date")
      expect(type_validator).to eq("Please input the project date using this format : YYYY/MM/DD")
    end

    it "should return an error for logging time in the future" do
      type_validator = ModelCitizen::Messages.new.get_message("future_date_error")
      expect(type_validator).to eq("You cannot log time for the future, please select a different date")
    end

    it "should return a prompt for hours" do
      type_validator = ModelCitizen::Messages.new.get_message("enter_hours")
      expect(type_validator).to eq("Please input hours worked")
    end
  end
end