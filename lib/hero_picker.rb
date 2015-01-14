require 'lotus/model'
Dir["#{ __dir__ }/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/hero_picker_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/hero_picker_development.db'
  #    adapter type: :sql, uri: 'postgres://localhost/hero_picker_development'
  #    adapter type: :sql, uri: 'mysql://localhost/hero_picker_development'
  #
  # adapter type: :file_system, uri: ENV['HERO_PICKER_DATABASE_URL']
  adapter type: :sql, uri: 'sqlite://db/hero_picker_development.db'

  ##
  # Database mapping
  #
  # mapping "#{__dir__}/hero_picker/config/mapping"
end.load!
