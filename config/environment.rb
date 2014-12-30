require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'

require_relative '../lib/.database'

require_relative '../apps/lotus_test/application'

Lotus::Container.configure do
  mount LotusTest::Application, at: '/'
end
