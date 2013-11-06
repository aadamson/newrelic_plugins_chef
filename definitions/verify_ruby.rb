define :verify_ruby do
  # check ruby dependency - exclude chef's embedded ruby
  unless node[:languages][:ruby] && node[:languages][:ruby][:version].start_with?('1.8.7', '1.9', '2.0') &&
    node[:languages][:ruby][:ruby_bin] !~ /chef/
    Chef::Application.fatal!("The New Relic #{params[:name]} requires a Ruby version >= 1.8.7 -" +
      " For more information, see https://docs.newrelic.com/docs/plugins/installing-a-plugin")
  end
end