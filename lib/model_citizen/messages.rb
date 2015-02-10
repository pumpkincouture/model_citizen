module ModelCitizen
  class Messages

    attr_reader :messages

    def initialize
      @messages = {"username_prompt" => "Please enter your username.",
                   "choose_action" => "Please select what you'd like to do." ,
                   "invalid_choice" => "That is not a valid choice, please try again.",
                   "enter_employee_first" => "Please enter employee first name.",
                   "enter_employee_last" => "Please enter employee last name.",
                   "enter_employee_username" => "Please enter employee username.",
                   "enter_employee_type" => "Please enter employee type (admin or non-admin).",
                   "enter_client_name" => "Please enter client name.",
                   "enter_client_type" => "Please enter client type (if regular client, please enter 'standard').",
                   "enter_date" => "Please input the project date using this format : YYYY/MM/DD",
                   "future_date_error" => "You cannot log time for the future, please select a different date.",
                   "enter_hours" => "Please input hours worked"}
    end

    def get_message(message_choice)
      @messages.fetch(message_choice)
    end
  end
end