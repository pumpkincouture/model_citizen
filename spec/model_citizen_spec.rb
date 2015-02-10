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

    it "should return false if there are any nil or empty attributes" do
      first_name_validator = ModelCitizen.not_nil_or_empty?([nil, "", "6", ""])
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

    it "should return false if attribute does not include value" do
      employee_type = "non-admin"
      type_validator = ModelCitizen.value_included?("admin", employee_type)
      expect(type_validator).to eq(false)
    end
  end

  context "validating date strings" do
    it "should return true if date is valid" do
      date = "2015/2/3"
      type_validator = ModelCitizen.valid_date?(date)
      expect(type_validator).to eq(true)
    end

    it "should return false if date is missing year" do
      date = "/2/3"
      type_validator = ModelCitizen.valid_date?(date)
      expect(type_validator).to eq(false)
    end

    it "should return false if date is missing month" do
      date = "2015//3"
      type_validator = ModelCitizen.valid_date?(date)
      expect(type_validator).to eq(false)
    end

    it "should return false if date is missing day" do
      date = "2015/2/"
      type_validator = ModelCitizen.valid_date?(date)
      expect(type_validator).to eq(false)
    end

    it "should return true if date is not in the future" do
      date = "2015/1/15"
      type_validator = ModelCitizen.valid_date?(date)
      expect(type_validator).to eq(true)
    end

    it "should return false if date is in the future" do
      date = "2016/2/3"
      type_validator = ModelCitizen.valid_date?(date)
      expect(type_validator).to eq(false)
    end
  end

  context "checking for duplicates" do
    it "should return true if there are no duplicates" do
      animals = ["cat", "dog", "parrot", "monkey", "ferret"]
      type_validator = ModelCitizen.no_duplicates?("capybara", animals)
      expect(type_validator).to eq(true)
    end

    it "should return false if there are duplicates" do
      animals = ["cat", "dog", "parrot", "monkey", "ferret"]
      type_validator = ModelCitizen.no_duplicates?("ferret", animals)
      expect(type_validator).to eq(false)
    end
  end

  context "displaying messages" do
    it "should return a prompt to enter username" do
      type_validator = ModelCitizen.get_message("username_prompt")
      expect(type_validator).to eq("Please enter your username.")
    end

    it "should return a choose action message" do
      type_validator = ModelCitizen.get_message("choose_action")
      expect(type_validator).to eq("Please select what you'd like to do.")
    end

    it "should return an error message" do
      type_validator = ModelCitizen.get_message("invalid_choice")
      expect(type_validator).to eq("That is not a valid choice, please try again.")
    end

    it "should return a prompt to enter employee first name" do
      type_validator = ModelCitizen.get_message("enter_employee_first")
      expect(type_validator).to eq("Please enter employee first name.")
    end

    it "should return a prompt to enter employee last name" do
      type_validator = ModelCitizen.get_message("enter_employee_last")
      expect(type_validator).to eq("Please enter employee last name.")
    end

    it "should return a prompt tp enter employee username" do
      type_validator = ModelCitizen.get_message("enter_employee_username")
      expect(type_validator).to eq("Please enter employee username.")
    end

    it "should return a prompt to enter employee type" do
      type_validator = ModelCitizen.get_message("enter_employee_type")
      expect(type_validator).to eq("Please enter employee type (admin or non-admin).")
    end

    it "should return a prompt to enter client name" do
      type_validator = ModelCitizen.get_message("enter_client_name")
      expect(type_validator).to eq("Please enter client name.")
    end

    it "should return a prompt for client type" do
      type_validator = ModelCitizen.get_message("enter_client_type")
      expect(type_validator).to eq("Please enter client type (if regular client, please enter 'standard').")
    end

    it "should return a prompt to input the date" do
      type_validator = ModelCitizen.get_message("enter_date")
      expect(type_validator).to eq("Please input the project date using this format : YYYY/MM/DD")
    end

    it "should return an error for logging time in the future" do
      type_validator = ModelCitizen.get_message("future_date_error")
      expect(type_validator).to eq("You cannot log time for the future, please select a different date.")
    end

    it "should return a prompt for hours" do
      type_validator = ModelCitizen.get_message("enter_hours")
      expect(type_validator).to eq("Please input hours worked")
    end
  end
end