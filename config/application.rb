require_relative 'boot'

require 'rails/all'
require 'faker'
# include 'IBMWatson'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Elevatorsrails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.assets.enabled = true
    config.assets.paths << Rails.root.join('.app/assets/javascripts/plugins')

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.assets.paths << Rails.root.join("app", "assets", "javascripts", "plugins", "bootstrap","css")
    config.assets.paths << Rails.root.join("app", "assets", "javascripts", "plugins", "jquery")

    config.assets.paths << Rails.root.join("app", "assets", "javascripts", "plugins", "owl-carousel")
    config.assets.paths << Rails.root.join("app", "assets", "javascripts", "plugins", "magnific-popup")
    config.assets.paths << Rails.root.join("app", "assets", "javascripts", "plugins", "mixitup")
    config.assets.paths << Rails.root.join("app", "assets", "javascripts", "plugins" )

    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    config.assets.precompile << "audios/*"
    config.assets.paths << Rails.root.join("app", "assets", "audios")

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
