#!/usr/bin/env ruby
require 'optparse'

TASK_FILE = "tasks.txt"

# Ensure the file exists
File.open(TASK_FILE, 'a') {}

options = {}

opt_parser = OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on("-a", "--add TASK", "Add a new task") do |task|
    options[:add] = task
  end

  opts.on("-l", "--list", "List all tasks") do
    options[:list] = true
  end

  opts.on("-r", "--remove INDEX", Integer, "Remove a task by index") do |index|
    options[:remove] = index
  end

  opts.on("-h", "--help", "Show help") do
    puts opts
    exit
  end
end

# Parse arguments
begin
  opt_parser.parse!
rescue OptionParser::InvalidOption, OptionParser::MissingArgument => e
  puts e.message
  puts opt_parser
  exit 1
end

# Add task
if options[:add]
  File.open(TASK_FILE, "a") do |f|
    f.puts options[:add]
  end
  puts "Task '#{options[:add]}' added."
end

# List tasks (EXACT OUTPUT)
if options[:list]
  tasks = File.readlines(TASK_FILE).map(&:strip)

  if tasks.empty?
    puts "No tasks found."
  else
    puts "Tasks:"
    puts
    tasks.each { |task| puts task }
    puts
  end
end

# Remove task
if options[:remove]
  tasks = File.readlines(TASK_FILE)
  index = options[:remove] - 1

  if index >= 0 && index < tasks.length
    removed_task = tasks.delete_at(index).strip
    File.open(TASK_FILE, "w") do |f|
      f.puts tasks
    end
    puts "Task '#{removed_task}' removed."
  else
    puts "Error: Task at index #{options[:remove]} not found."
  end
end
