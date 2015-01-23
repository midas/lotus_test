require 'autoloaded'

module Dockmaster
  class Command < Acclimate::Command

    Autoloaded.module { }

    protected

      def config_klass
        Dockmaster::Configuration
      end

      def ensure_config_file!
        return if config_filepath.file?

        raise_error "Configuration file does not exist: #{config_filepath.expand_path}."
      end

  end
end
