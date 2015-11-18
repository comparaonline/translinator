require 'rails/railtie'

module Translinator
  class Railtie < ::Rails::Railtie
    config.before_configuration do
      CoConfig.load(Translinator::Engine.root.join('config'))
    end
  end
end
