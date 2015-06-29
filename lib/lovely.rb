require "lovely/version"
require 'active_record'
require 'active_support/dependencies/autoload'

require_relative 'lovely/railtie'  if defined?(Rails)

module Lovely
  extend ActiveSupport::Autoload

  autoload :Model
  autoload :Love
end

ActiveSupport.on_load :active_record do
  ActiveRecord::Base.send :extend, Lovely::Model
end


