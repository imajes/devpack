# frozen_string_literal: true

module Devpack
  # Loads Devpack initializers after standard Rails initializers have been loaded.
  class Railtie < Rails::Railtie
    config.before_configuration { Devpack::Gems.new(Devpack.config).load }
    config.after_initialize     { Devpack::Initializers.new(Devpack.config).load }
  end
end
