#!/usr/bin/env ruby
require 'optparse'
require 'fileutils'

TASKS_FILE = 'tasks.txt'
FileUtils.touch(TASKS_FILE)

options = {}

HELP_TEXT = <<~HELP
Usage: cli.rb [options]

-a, --add TASK Add a new task

-l, --list List all tasks

-r, --remove INDEX Remove a task by index

-h, --help Show help
HELP

OptionParser.new do |opts|
  opts.on("-a", "--add TASK") { |task| options[:add] = task }
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
  removed = tasks.delete_at(options[:remove] - 1)
  File.write(TASKS_FILE, tasks.join("\n") + (tasks.empty? ? "" : "\n"))
  puts "Task ‘#{removed}’ removed."

else
  puts HELP_TEXT
end
