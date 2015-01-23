module Dockmaster
  class Cli
    class App < Thor

      include Acclimate::CliHelper

      def self.banner( command, namespace=nil, subcommand=false )
        return "#{basename} app help [SUBCOMMAND]" if command.name == 'help'
        "#{basename} #{command.usage}"
      end

      desc "app stop", "Stop the application container"
      #long_desc <<-LONGDESC
      #LONGDESC
      def stop
        execute Dockmaster::Command::App::Stop
      end

    end
  end
end
