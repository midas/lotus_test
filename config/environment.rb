require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'

require_relative '../lib/lotus_test'

require_relative '../apps/api/application'
require_relative '../apps/web/application'

Lotus::Container.configure do
  mount Api::Application.new, at: '/api'
  mount Web::Application, at: '/'
end
