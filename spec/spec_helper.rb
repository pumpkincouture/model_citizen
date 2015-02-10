require 'model_citizen'
require 'model_citizen/messages'
require 'model_citizen/validations'

RSpec.configure do |config|
  config.failure_color = :red
  config.success_color = :green
  config.detail_color = :yellow
  config.tty = true
  config.color = true
  config.formatter = :documentation
  config.order = :rand
end

