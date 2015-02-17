module ModelCitizen
  class Messages

    attr_reader :messages

    def initialize
      @messages = {
        :invalid_username => "That is not a valid username, please try again",
        :invalid_timesheet => "That is not a valid timesheet, please try again",
        :invalid_client => "That is not a valid client, please try again",
        :invalid_employee => "That is not a valid employee, please try again",
        :timesheet_success => "Your timesheet has been successfully saved",
        :client_success => "Client has been successfully saved",
        :employee_success => "Employee has been successfully saved",
        :future_date_error => "You cannot log time for the future, please select a different date",
        :no_time_to_display => "No time to display for this month",
        }
    end

    def get_message(message_choice)
      @messages.fetch(message_choice)
    end
  end
end