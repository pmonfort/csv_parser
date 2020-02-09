# frozen_string_literal: true

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/test_*.rb']
end

task :process, [:csv_path] do |_task, args|
  require './lib/processor.rb'
  if args[:csv_path].nil? || !File.exist?(args[:csv_path])
    puts 'You need to specify a CSV file'
  end

  processor = Processor.new
  result = processor.process(args[:csv_path])
  if result[:success]
    puts 'Max Sign Up Date user'
    puts result[:max_date_record]

    puts 'Min Sign Up Date user'
    puts result[:min_date_record]
  else
    puts 'Something went wrong, please check CSV format'
  end
end

task default: :test
