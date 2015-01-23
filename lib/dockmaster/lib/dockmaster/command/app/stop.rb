module Dockmaster
  class Command
    module App
      class Stop < Dockmaster::Command

        def execute
          confirm "Test" do
            debugger
            a=1
            #dropletsGetting droplets list from Digital Ocean
          end

          #say nil
          #say formatted_droplets
        end

      protected

      end
    end
  end
end
