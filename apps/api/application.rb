require 'grape'
require_relative 'v1'
require_relative 'v2'

module Api
  class Application < Rack::Cascade

    def initialize
      #super [Api::V1]
      super [Api::V2, Api::V1]
    end

  end
end
