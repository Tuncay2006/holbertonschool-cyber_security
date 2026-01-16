#!/usr/bin/env ruby
require 'optparse'

TASKS_FILE = 'tasks.txt'

# Ensure tasks file exists
FileUtils.touch(TASKS_FILE) unless File.exist?(TASKS_FILE)

options = {}

parser = OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on("-a", "--add TASK", "Add a new task") do |task|
    options[:add] = task
  end

  opts.on("-l", "--list", "List all tasks") do
    options[:list] = true
  end

  opts.on("-r", "--remove INDEX", "Remove a task by index") do |index|
    options[:remove] = index.to_i
  end

  opts.on("-h", "--help", "Show help") do
    puts opts
    exit
  end
end

parser.parse!

tasks = File.readlines(TASKS_FILE, chomp: true)

if options[:add]
  tasks << options[:add]
  File.write(TASKS_FILE, tasks.join("\n") + "\n")
  puts "Task ‘#{options[:add]}’ added."
elsif options[:list]
  tasks.each { |task| puts task }
elsif options[:remove]
  index = options[:remove] - 1
  if index >= 0 && index < tasks.length
    removed = tasks.delete_at(index)
    File.write(TASKS_FILE, tasks.join("\n") + (tasks.empty? ? "" : "\n"))
    puts "Task ‘#{removed}’ removed."
  end
else
  puts parser
end
