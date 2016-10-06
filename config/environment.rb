# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Myapp::Application.initialize!

require 'casclient'
require 'casclient/frameworks/rails/filter'

# cas_logger = CASClient::Logger.new(::Rails.root+'/log/cas.log')
# cas_logger.level = Logger::DEBUG

CASClient::Frameworks::Rails::Filter.configure(
  cas_base_url: ENV["CAS_URL"],
  validate_url: ENV["CAS_URL"]+"/p3/serviceValidate"
)
