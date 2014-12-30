require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
end

task default: :test
task spec: :test

namespace :db do

  task :migrate do
    require 'lotus'
    Lotus::Environment.new

    exec "sequel -m db/migrations #{ENV.fetch('._DATABASE_URL')}"
  end

end
