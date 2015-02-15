module ModelCitizen
  class Messages

    attr_reader :messages

    def initialize
      @messages = {"username_prompt" => "Please enter your username to get started",
                   "choose_action" => "Please select what you'd like to do" ,
                   "invalid_username" => "That is not a valid username, please try again",
                   "invalid_timesheet" => "That is not a valid timesheet, please try again",
                   "invalid_client" => "That is not a valid client, please try again",
                   "invalid_employee" => "That is not a valid employee, please try again",
                   "timesheet_success" => "Your timesheet has been successfully saved",
                   "client_success" => "Client has been saved",
                   "employee_success" => "Employee has been saved",
                   "invalid_choice" => "That is not a valid choice, please try again",
                   "enter_employee_first" => "Please enter employee first name",
                   "enter_employee_last" => "Please enter employee last name",
                   "enter_employee_username" => "Please enter employee username",
                   "enter_employee_type" => "Please enter employee type (admin or non-admin)",
                   "enter_client_name" => "Please enter client name",
                   "enter_client_type" => "Please enter client type (if regular client, please enter 'standard')",
                   "enter_date" => "Please input the project date using this format : YYYY/MM/DD",
                   "future_date_error" => "You cannot log time for the future, please select a different date",
                   "enter_hours" => "Please input hours worked",
                   "log_time" => "Log time",
                   "request_report" => "Request time report",
                   "add_employee" => "Add employee",
                   "add_client" => "Add client",
                   "no_time_to_display" => "No time to display for this month",
                   "request_employee_report" => "Request employee report"}
    end

    def get_message(message_choice)
      @messages.fetch(message_choice)
    end
  end
end