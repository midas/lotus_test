require 'autoloaded'

module Dockmaster
  class Cli < Thor

    Autoloaded.module { }

    include Acclimate::CliHelper

    desc 'app SUBCOMMAND', "Operations performed on the application"
    subcommand "app", Dockmaster::Cli::App

    desc 'db SUBCOMMAND', "Operations performed on the database"
    subcommand "db", Dockmaster::Cli::Db

  end
end
