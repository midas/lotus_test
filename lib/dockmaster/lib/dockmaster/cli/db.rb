module Dockmaster
  class Cli
    class Db < Thor

      include Acclimate::CliHelper

      def self.banner( command, namespace=nil, subcommand=false )
        return "#{basename} db help [SUBCOMMAND]" if command.name == 'help'
        "#{basename} #{command.usage}"
      end

      desc "db stop", "Stop the application container"
      def stop
        #execute Dockmaster::Command::Db::Stop
      end

    end
  end
end
