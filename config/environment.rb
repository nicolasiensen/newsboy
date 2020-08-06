# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Disable the field_with_errors div when Rails renders a form with errors.
# Bootstrap's form validation CSS classes works better this way.
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end