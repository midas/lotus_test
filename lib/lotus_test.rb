require 'lotus/model'
require 'lotus/form'

%w(
	entities
	forms
	repositories
).each do |dir|
	path = File.expand_path( "../lotus_test/#{dir}", __FILE__ )

	Dir["#{path}/**/*.rb"].each do |file|
		require file
	end
end

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
	adapter type: :sql, uri: ENV['LOTUS_TEST_DATABASE_URL']

  Money = Struct.new(:amount) do
    def to_integer
      amount
    end
  end

  ##
  # Database mapping
  #
  mapping do
    collection :users do
      entity     User
      repository UserRepository

      attribute :id,        Integer
      attribute :name,      String
      attribute :age,       Integer
      attribute :net_worth, Money
    end
  end
end.load!
