#!/usr/bin/env ruby
require 'optparse'
require 'fileutils'

TASKS_FILE = 'tasks.txt'
FileUtils.touch(TASKS_FILE)

options = {}

HELP_TEXT = "Usage: cli.rb [options]\n" \
"-a, --add TASK                   Add a new task\n" \
"-l, --list                       List all tasks\n" \
"-r, --remove INDEX               Remove a task by index\n" \
"-h, --help                       Show help\n"

OptionParser.new do |opts|
  # Dummy banner, we will print exact HELP_TEXT manually
  opts.banner = "Usage: cli.rb [options]"

  opts.on("-a", "--add TASK") { |t| options[:add] = t }
  opts.on("-l", "--list") { options[:list] = true }
  opts.on("-r", "--remove INDEX") { |i| options[:remove] = i.to_i }
  opts.on("-h", "--help") do
    puts HELP_TEXT
    exit 0
  end
end.parse!

tasks = File.readlines(TASKS_FILE, chomp: true)

if options[:add]
  tasks << options[:add]
  File.write(TASKS_FILE, tasks.join("\n") + "\n")
  puts "Task ‘#{options[:add]}’ added."
elsif options[:list]
  tasks.each { |t| puts t }
elsif options[:remove]
  idx = options[:remove] - 1
  removed = tasks.delete_at(idx)
  File.write(TASKS_FILE, tasks.join("\n") + (tasks.empty? ? "" : "\n"))
  puts "Task ‘#{removed}’ removed."
else
  puts HELP_TEXT
end
