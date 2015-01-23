require 'pathname'

module Dockmaster
  class Configuration < Acclimate::Configuration

    def self.config_filepath
      @@config_filepath ||= Pathname.new( '.dockmaster' )
    end

  end
end
