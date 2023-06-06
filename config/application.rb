require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CodespacesTryRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #

    # Ustaw domyślny język
    config.i18n.default_locale = :pl

    # Dostępne języki
    config.i18n.available_locales = [:pl, :en]

    # Ścieżki, w których znajdują się pliki tłumaczeń
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]

    # Ustaw strefę czasową
    config.time_zone = "Warsaw"

    # Inne konfiguracje...
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
