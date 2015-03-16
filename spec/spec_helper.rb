$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

Dir[File.expand_path('../../spec/support/**/*.rb')].each { |f| require f }

require 'rchilli_cv_parser'

RSpec.configure do | config|

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true

  config.filter_run :focus

  config.order = 'random'

end