require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
#require 'lotus/model'

require_relative '../lib/.database'
#Dir.glob( 'lib/entities/**/*.rb' ).each do |file|
  #require_relative "../#{file}"
#end

#Dir.glob( 'lib/repositories/**/*.rb' ).each do |file|
  #require_relative "../#{file}"
#end

require_relative '../apps/lotus_test/application'

Lotus::Container.configure do
  mount LotusTest::Application, at: '/'
end
