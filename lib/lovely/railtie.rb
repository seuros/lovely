module Lovely
  # = Lovely Railtie
  class Railtie < Rails::Railtie # :nodoc:
    config.lovely = ActiveSupport::OrderedOptions.new
  end
end