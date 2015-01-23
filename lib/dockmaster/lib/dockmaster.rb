require "dockmaster/version"
require 'acclimate'
require 'autoloaded'
#require 'command_line_reporter'


module Dockmaster

  Autoloaded.module do |autoloaded|
    autoloaded.except :VERSION
  end

end
