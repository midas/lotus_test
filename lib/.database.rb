require 'lotus/model'
Dir["#{ __dir__ }/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/._development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/._development.db'
  #    adapter type: :sql, uri: 'postgres://localhost/._development'
  #    adapter type: :sql, uri: 'mysql://localhost/._development'
  #
  #adapter type: :file_system, uri: ENV['._DATABASE_URL']

  #ENV['DB_URI'] = "postgres://#{ENV['DB_ENV_POSTGRESQL_USER']}:#{ENV['DB_ENV_POSTGRESQL_PASS']}@#{ENV['DB_PORT_5432_TCP_ADDR']}:#{ENV['DB_PORT_5432_TCP_PORT']}/#{ENV['DB_ENV_POSTGRESQL_DB']}"
	#ENV['DB_URI'] = "postgres://lotus_test:lotus_test@192.168.2.3:5432/lotus_test"
	adapter type: :sql, uri: ENV['._DATABASE_URL']

  ##
  # Database mapping
  #
  mapping do
    collection :users do
      entity     User
      repository UserRepository

      attribute :id,   Integer
      attribute :name, String
    end
  end
end.load!
